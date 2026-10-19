from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return "Hello from a Multi-Stage Dockerized Flask App!"

if __name__ == '__main__':
    # Run on all interfaces so it can be exposed outside the container
    app.run(host='0.0.0.0', port=5005)