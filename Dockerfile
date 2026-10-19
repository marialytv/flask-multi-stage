FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt .
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

# Expose the port Flask runs on
EXPOSE 5005

# Set a non-root user for better security
RUN useradd -m appuser
USER appuser

# Run the application using the built-in development server
CMD ["python", "app.py"]