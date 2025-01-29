# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --no-cache-dir flask google-cloud-bigquery

# Expose the port that the app runs on
EXPOSE 5052

# Define environment variable
ENV PORT=5052

# Run the application
CMD ["python", "main.py"]
