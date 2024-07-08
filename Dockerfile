FROM ubuntu:24.04

# Update package list and install Python and pip
RUN apt-get update && apt-get install -y \
    python3 \
    python3-venv \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Create an application directory
RUN mkdir /app

# Set the working directory
WORKDIR /app

# Copy the application code to the container
COPY . /app

# Create and activate a virtual environment
RUN python3 -m venv venv

# Install the required Python packages in the virtual environment
RUN ./venv/bin/pip install -r requirements.txt

# Expose port 5001
EXPOSE 5001

# Run the application using the virtual environment's python
CMD ["./venv/bin/python", "app.py"]