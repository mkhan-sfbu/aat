from flask import Flask, request, jsonify

app = Flask(__name__)

# Database configuration
app.config['MYSQL_USER'] = 'cs595'
app.config['MYSQL_PASSWORD'] = 'hAlp3yGyMmZLog8S'
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_DB'] = 'cs595'

# Initialize the MySQL extension
mysql = MySQL(app)

# Registration API endpoint
@app.route('/register', methods=['POST'])
def register():
    # get the user data from the request body
    data = request.get_json()

    # check if username already exists in the database
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM users WHERE username = %s", (data['username'],))
    result = cur.fetchone()
    cur.close()
    
    if result is not None:
        return jsonify({'success': False, 'message': 'Username already exists.'}), 409

    # add the user to the database
    cur = mysql.connection.cursor()
    cur.execute("INSERT INTO users (username, password) VALUES (%s, %s)", (data['username'], data['password']))
    mysql.connection.commit()
    cur.close()

    # return a success response
    return jsonify({'success': True, 'message': 'User registered successfully.'}), 201

# Test endpoint
@app.route('/')
def rgTest():
    return "Registration Page"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001, debug=True)
