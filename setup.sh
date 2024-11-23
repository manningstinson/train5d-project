#!/bin/bash

# Create files in current directory
touch app.py
touch config.py
touch requirements.txt
touch gunicorn_config.py
touch Procfile

# Create templates directory
mkdir -p templates

# Add basic template example
touch templates/index.html

# Add basic Gunicorn configuration to Procfile
echo "web: gunicorn app:app" > Procfile

# Show the created structure
echo "Created project structure:
.
├── app.py
├── config.py
├── requirements.txt
├── gunicorn_config.py
├── Procfile
└── templates/
    └── index.html"