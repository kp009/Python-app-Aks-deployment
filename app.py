from flask import Flask
app = Flask(__name__)
@app.route('/')
def hello_world():
    return 'Hello, World! This is a Python app deployed on AKS!'

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')


