from flask import Flask, request, jsonify

app = Flask(__name__)

# create an empty dictionary to store user data
users = {}

@app.route('/register', methods=['POST'])
def register():
    # get the user data from the request body
    data = request.get_json()

    # check if username already exists in the users dictionary
    if data['username'] in users:
        return jsonify({'success': False, 'message': 'Username already exists.'}), 409

    # if username doesn't exist, add the user to the users dictionary
    users[data['username']] = data['password']

    # return a success response
    return jsonify({'success': True, 'message': 'User registered successfully.'}), 201

# test endpoint
@app.route('/')
def rgTest():
    return "Registration Page"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5001, debug=True)
