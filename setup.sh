#!/bin/bash

# Project Setup Script
echo "Setting up project structure in current directory..."

# Function to create a directory if it doesn't exist
create_dir() {
    if [ ! -d "$1" ]; then
        mkdir -p "$1"
        echo "Created directory: $1"
    fi
}

# Function to create a file only if it doesn't exist
create_file() {
    if [ ! -f "$1" ]; then
        touch "$1"
        if [ ! -z "$2" ]; then
            echo "$2" > "$1"
        fi
        echo "Created file: $1"
    else
        echo "File already exists, skipping: $1"
    fi
}

# Create frontend structure
create_dir "frontend/src/components/common"
create_dir "frontend/src/components/features"
create_dir "frontend/src/pages"
create_dir "frontend/src/hooks"
create_dir "frontend/src/services"
create_dir "frontend/src/utils"
create_dir "frontend/src/assets"
create_dir "frontend/src/styles"
create_dir "frontend/src/context"
create_dir "frontend/src/types"
create_dir "frontend/public"
create_dir "frontend/tests"

# Create backend structure
create_dir "api/routes"
create_dir "api/controllers"
create_dir "api/middleware"
create_dir "database/models"
create_dir "database/migrations"
create_dir "database/seeds"
create_dir "services/external"
create_dir "tests/unit"
create_dir "tests/integration"
create_dir "tests/fixtures"
create_dir "utils/validators"
create_dir "utils/helpers"

# Create frontend configuration files
create_file "frontend/package.json" '{
  "name": "frontend",
  "private": true,
  "version": "0.0.1",
  "type": "module",
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "preview": "vite preview"
  },
  "dependencies": {
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "react-router-dom": "^6.21.0",
    "axios": "^1.6.2"
  },
  "devDependencies": {
    "@types/react": "^18.2.45",
    "@types/react-dom": "^18.2.17",
    "@vitejs/plugin-react": "^4.2.1",
    "autoprefixer": "^10.4.16",
    "postcss": "^8.4.32",
    "tailwindcss": "^3.3.6",
    "vite": "^5.0.8"
  }
}'

create_file "frontend/vite.config.js" "import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
  server: {
    port: 3000
  }
})"

create_file "frontend/.env.example" "VITE_API_URL=http://localhost:5000"

create_file "frontend/src/main.jsx" "import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App'
import './index.css'

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
)"

create_file "frontend/src/App.jsx" "import React from 'react'

function App() {
  return (
    <div className='container mx-auto px-4'>
      <h1 className='text-3xl font-bold my-4'>Welcome to Your App</h1>
    </div>
  )
}

export default App"

create_file "frontend/src/index.css" "@tailwind base;
@tailwind components;
@tailwind utilities;"

create_file "frontend/tailwind.config.js" "/** @type {import('tailwindcss').Config} */
export default {
  content: [
    './index.html',
    './src/**/*.{js,ts,jsx,tsx}',
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}"

create_file "frontend/postcss.config.js" "export default {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  },
}"

# Create backend files (only if they don't exist)
if [ ! -f "requirements.txt" ]; then
    create_file "requirements.txt" "flask==2.0.1
flask-sqlalchemy==2.5.1
flask-migrate==3.1.0
flask-cors==3.0.10
python-dotenv==0.19.0
psycopg2-binary==2.9.1
pytest==6.2.5
black==21.6b0
pylint==2.9.6
gunicorn==21.2.0"
fi

create_file "api/__init__.py" ""
create_file "database/__init__.py" ""
create_file "services/__init__.py" ""
create_file "utils/__init__.py" ""

create_file ".env.example" "DATABASE_URL=postgresql://postgres:postgres@localhost:5432/app_db
FLASK_APP=app.py
FLASK_ENV=development
SECRET_KEY=your-secret-key"

echo "Project structure created successfully!"
echo "Next steps:"
echo "1. cd frontend && npm install"
echo "2. Set up your environment variables"
echo "3. Initialize your database"