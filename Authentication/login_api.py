import flask
from flask import request, jsonify

app = flask.Flask(__name__)
app.config["DEBUG"] = True

# Database configuration
app.config['MYSQL_USER'] = 'cs595'
app.config['MYSQL_PASSWORD'] = 'hAlp3yGyMmZLog8S'
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_DB'] = 'cs595'

# Initialize the MySQL extension
mysql = MySQL(app)

# Login API endpoint
@app.route('/login', methods=['POST'])
def login():
    # Parse username and password from request body
    username = request.json.get('username', None)
    password = request.json.get('password', None)

    # Check if both fields are provided
    if not username or not password:
        return jsonify({'success': False, 'message': 'Username and password are required.'}), 400
    
    # Query the database for the user
    cur = mysql.connection.cursor()
    cur.execute("SELECT password FROM users WHERE username = %s", (username,))
    result = cur.fetchone()
    cur.close()
    
    # Check if the user exists in the database
    if result is None:
        return jsonify({'success': False, 'message': 'Invalid username.'}), 401

    # Check if the provided password matches the user's password
    if password != result[0]:
        return jsonify({'success': False, 'message': 'Invalid password.'}), 401


# test endpoint
@app.route('/')
def loginTest():
    return "Login Page"

# Start the Flask application
if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5001)
