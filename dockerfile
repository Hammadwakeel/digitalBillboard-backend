# Use a lightweight Python base image
FROM python:3.9-slim

# Set up a new user 'user' with UID 1000 (Required for Hugging Face)
RUN useradd -m -u 1000 user
USER user
ENV PATH="/home/user/.local/bin:${PATH}"

# Set the working directory
WORKDIR /app

# Copy and install dependencies first (for better caching)
COPY --chown=user requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the backend source code
COPY --chown=user . .

# Hugging Face Spaces require the app to listen on port 7860
EXPOSE 7860

# Execute the FastAPI app
# Replace 'main:app' with your actual entry point if it's named differently
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "7860"]