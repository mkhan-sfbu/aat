import flask
from flask import request, jsonify

app = flask.Flask(__name__)
app.config["DEBUG"] = True

# Sample data for user authentication
users = {'Xinye': 'CS595', 'Kris': 'CS596', 'Shahadat': 'CS597'}

# Login API endpoint
@app.route('/login', methods=['POST'])
def login():
    # Parse username and password from request body
    username = request.json.get('username', None)
    password = request.json.get('password', None)

    # Check if both fields are provided
    if not username or not password:
        return jsonify({'success': False, 'message': 'Username and password are required.'}), 400

    # Check if the user exists in our user data
    if username not in users:
        return jsonify({'success': False, 'message': 'Invalid username.'}), 401

    # Check if the provided password matches the user's password
    if password != users[username]:
        return jsonify({'success': False, 'message': 'Invalid password.'}), 401

    # Login successful
    return jsonify({'success': True, 'message': 'Login successful.'}), 200

# test endpoint
@app.route('/')
def loginTest():
    return "Login Page"

# Start the Flask application
if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5001)
