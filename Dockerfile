# Use a base image with Python pre-installed
FROM python:latest

# Set the working directory inside the container
WORKDIR /app

# Install python3-venv package
RUN apt-get update && apt-get install -y python3-venv

# Create a virtual environment
RUN python -m venv venv

# Activate the virtual environment and set the environment variables
ENV VIRTUAL_ENV=/app/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Copy the rest of the application code into the container
COPY . .

# Install project dependencies (if any)
#RUN pip install -r requirements.txt

#RUN pip install --no-cache-dir --no-use-pep517 -r requirements.txt
# This flag disables the use of PEP 517/518 build system requirements, which includes checking metadata in the pyproject.toml file.


# Install setuptools and wheel
RUN pip install --no-cache-dir setuptools wheel

# Install project dependencies
RUN pip install --no-cache-dir --no-use-pep517 -r requirements.txt


# Run the Python script or start the application
CMD ["python", "Main.py"]
