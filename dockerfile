# Start from an official Python image
FROM python:3.12

# Set the working directory in the container
WORKDIR /app

# Copy the requirements.txt into the container
COPY requirements.txt /app/

# Install system dependencies for pytesseract (tesseract-ocr)
RUN apt-get update && apt-get install -y tesseract-ocr

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . /app/

# Run the app
CMD ["python", "main.py", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

