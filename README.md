# Digital Billboard API - Backend Environment Setup

This guide provides step-by-step instructions to clone, configure, and run the FastAPI backend for the Digital Billboard ecosystem.

### **Prerequisites**
Ensure your system has the following installed:
* **Python 3.11+**
* **Git**
* **pip** (Python package manager)

---

### **Step 1: Clone the Repository**
Pull the latest code from the main branch to your local machine.

```bash
git clone https://github.com/Hammadwakeel/digitalBillboard-backend.git
cd digitalBillboard-backend
```

### **Step 2: Initialize a Virtual Environment**
It is highly recommended to use a virtual environment to isolate project dependencies and avoid version conflicts.

**For Linux/macOS:**
```bash
python3 -m venv venv
source venv/bin/activate
```

**For Windows (Command Prompt / PowerShell):**
```bash
python -m venv venv
venv\Scripts\activate
```
*(You should now see `(venv)` at the start of your terminal prompt).*

### **Step 3: Install Dependencies**
Install all required packages (including FastAPI, Uvicorn, Supabase, and OpenCV Headless) defined in the manifest.

```bash
pip install --upgrade pip
pip install -r requirements.txt
```

### **Step 4: Configure Environment Variables & Secrets**
For security, sensitive keys are not tracked in version control. You must recreate the local environment configuration.

1. Create a `.env` file in the root directory:
```bash
touch .env
```

2. Open the `.env` file and add your system configuration. At minimum, you will need:
```ini
# Core Settings
PROJECT_NAME="Digital Billboard API"
API_URL="http://localhost:8000"
FRONTEND_URL="http://localhost:3000"

# Supabase Authentication (If utilizing Python client wrapper)
SUPABASE_URL="your_supabase_project_url"
SUPABASE_KEY="your_supabase_anon_or_service_key"
```

3. **Google OAuth Credentials:**
If your authentication logic requires the Google OAuth JSON file (the one removed for security), place it back in the root directory. **Ensure your `.gitignore` is intact so it doesn't accidentally get committed again.**
* File format example: `.client_secret_XXXXXXXXX.apps.googleusercontent.com.json`

### **Step 5: Launch the Server**
Boot up the Uvicorn ASGI server with live-reload enabled for local development.

```bash
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

### **Step 6: Verify the System**
Once the server is running, you can verify the deployment and access the API documentation.

* **Health Check:** `http://localhost:8000/health`
* **Swagger UI (Interactive API Docs):** `http://localhost:8000/docs`
* **ReDoc:** `http://localhost:8000/redoc`

---
