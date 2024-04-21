# Build Stage
FROM ubuntu:latest

# Set the working directory
WORKDIR /app

# Update package index and install Python 3, pip, Pandas, and PyQt6
RUN apt-get update && apt-get install -y python3 python3-pip

RUN pip3 install pandas PyQt6

# Display Python version
RUN python3 --version

# Copy the current directory contents into the container at /app
COPY . /app

# Run main.py when the container launches
CMD ["python3", "Main.py"]

# Define the entry point
ENTRYPOINT ["python3", "Main.py"]
