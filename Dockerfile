FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN groupadd -r webservice && useradd --no-log-init -r -g webservice webservice

COPY requirements.txt .
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir -r requirements.txt

COPY app.py .

EXPOSE 5005

USER webservice:webservice

CMD ["python", "app.py"]