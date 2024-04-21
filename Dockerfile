# Use a base image with Python pre-installed
FROM python:latest

# Set the working directory inside the container
WORKDIR /app


RUN pip install pandas

RUN pip install pyqt6

# Copy the rest of the application code into the container
COPY . .

# Run the Python script or start the application
CMD ["python", "Main.py"]
