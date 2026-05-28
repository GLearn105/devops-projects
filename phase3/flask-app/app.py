from flask import Flask, jsonify
import os
import datetime

app = Flask(__name__)

@app.route('/')
def home():
    return jsonify({
        "message": "Halo dari Docker Container!",
        "author": "Glearn",
        "phase": "Phase 3 - Docker",
        "timestamp": str(datetime.datetime.now()),
        "hostname": os.environ.get("HOSTNAME", "unknown")
    })

@app.route('/health')
def health():
    return jsonify({"status": "healthy"}), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=False)
