from flask import Flask, request, jsonify
import mysql.connector
from mail import send
from settings import config

app = Flask(__name__)
app.config["DEBUG"] = True

# Initialize the MySQL extension
db = config()['db']
mydb = mysql.connector.connect(
  host=db['host'],
  user=db['username'],
  password=db['password'],
  database=db['dbname']
)

# Registration API endpoint
@app.route('/register', methods=['POST'])
def register():
    # get the user data from the request body
    data = request.get_json()

    # check if username already exists in the CompanyUser table
    mycursor = mydb.cursor()
    mycursor.execute("SELECT * FROM CompanyUser WHERE email = %s", (data['username'],))
    result = mycursor.fetchone()
    
    if result is not None:
        mycursor.close()
        return jsonify({'success': False, 'message': 'Username already exists.'}), 409

    # insert the user data into the CompanyUser table
    sql = "INSERT INTO CompanyUser (companyTextId, email, password) VALUES (%s, %s, password(%s))"
    val = (data['companyTextId'], data['username'], data['password'])
    mycursor.execute(sql, val)
    mydb.commit()
    mycursor.close()

    # insert the company data into the Company table
    mycursor = mydb.cursor()
    sql = "INSERT INTO Company (businessGroupTextId, textId, title) VALUES (%s, %s, %s)"
    val = (data['businessGroupTextId'], data['textId'], data['title'])
    mycursor.execute(sql, val)
    mydb.commit()
    mycursor.close()

    # send a welcome email to the user
    send(data['username'], "Welcome to @aat", "Happy to see you there...")

    # return a success response
    return jsonify({'success': True, 'message': 'User registered successfully.'}), 201

# test endpoint
@app.route('/')
def rgTest():
    return "Registration Page"

# Start the Flask application
if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5001)

