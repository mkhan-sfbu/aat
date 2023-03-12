from flask import Flask, request, jsonify
from flask_mysqldb import MySQL

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

    # check if email already exists in the CompanyUser table
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM CompanyUser WHERE email = %s", (data['email'],))
    result = cur.fetchone()
    if result is not None:
        cur.close()
        return jsonify({'success': False, 'message': 'Email already exists.'}), 409

    # insert data into the Company table
    cur.execute("INSERT INTO Company (businessGroupTextId, textId, title) VALUES (%s, %s, %s)",
                (data['businessGroupTextId'], data['textId'], data['title']))
    company_id = cur.lastrowid

    # insert data into the CompanyUser table
    cur.execute("INSERT INTO CompanyUser (companyTextId, email, firstName, lastName, password, companyId) "
                "VALUES (%s, %s, %s, %s, %s, %s)",
                (data['companyTextId'], data['email'], data['firstName'], data['lastName'], data['password'], company_id))
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
