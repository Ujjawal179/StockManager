# Base image with Python and PyQt5 installed
FROM python:3.9-slim

# Install PyQt5 and required libraries
RUN apt-get update && apt-get install -y \
    python3-pyqt5 \
    libqt5widgets5 \
    libqt5gui5 \
    libqt5core5a \
    && apt-get clean

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install Python dependencies
RUN pip install -r requirements.txt

# Command to run the stock manager script
CMD ["python", "stockmanager.py"]
