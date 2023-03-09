import flask
from flask import request, jsonify

app = flask.Flask(__name__)
app.config["DEBUG"] = True

# Sample data for user authentication
users = {'Xinye': {'password': 'CS595', 'email': 'xli@student.sfbu.edu'},
         'Kris': {'password': 'CS596', 'email': 'kvesselee@student.sfbu.edu'},
         'Shahadat': {'password': 'CS597', 'email': 'mkhan@student.sfbu.edu'}}

# Forgot password API endpoint
@app.route('/forgot_password', methods=['GET', 'POST'])
def forgot_password():
    if request.method == 'GET':
        return "Forgot Password"
    elif request.method == 'POST':
        # Parse username and email from request body
        username = request.json.get('username', None)
        email = request.json.get('email', None)

        # Check if both fields are provided
        if not username or not email:
            return jsonify({'success': False, 'message': 'Username and email are required.'}), 400

        # Check if the user exists in our user data
        if username not in users:
            return jsonify({'success': False, 'message': 'Invalid username.'}), 401

        # Check if the provided email matches the user's email
        if email != users[username]['email']:
            return jsonify({'success': False, 'message': 'Invalid email.'}), 401

        # Generate a new temporary password and store it for the user
        new_password = generate_temp_password()
        users[username]['password'] = new_password

        # Send an email to the user with the new temporary password
        send_temp_password_email(username, email, new_password)

        # Forgot password successful
        return jsonify({'success': True, 'message': 'Forgot password successful. Check your email for the new temporary password.'}), 200

# Generate a new temporary password
def generate_temp_password():
    # Use your own method for generating a temporary password
    return 'temp_password'

# Send an email to the user with the new temporary password
def send_temp_password_email(username, email, new_password):
    # Use your own method for sending an email
    print(f"New temporary password for {username} ({email}): {new_password}")

# Start the Flask application
if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5002)
