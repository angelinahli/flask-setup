# flask-setup

A repository with a very simple directory structure I can clone for future flask projects.

## Setup

```bash
cp -R flask-setup destination
cd destination
python3 -m venv venv
echo 'export FLASK_APP=run.py' >> venv/bin/activate
source venv/bin/activate
pip install flask
```