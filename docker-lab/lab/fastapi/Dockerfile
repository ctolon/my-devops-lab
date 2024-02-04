# Example Dockerfile for FastAPI Newmind MVC MLAPI

FROM python:3.8-bullseye
LABEL maintainer="Cevat Batuhan Tolon <cbtolon@newmind.ai>"

# Set API Volume For Monitoring Docker Process Later
ENV API_VOL=fastapi_app

# Install some useful system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
      build-essential \
      curl \
      bash \
      vim \
      nano \
      unzip \
      rsync \
      coreutils \
      procps \
      unzip \
      software-properties-common \
      netcat \
      gcc \
      wget

# Clean up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy requirements.txt to the docker image
COPY ./requirements.txt /tmp/requirements.txt

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install -r /tmp/requirements.txt \
    && rm -rf /root/.cache/pip

# Copy some Gunicorn WSGI Server conf scripts to the docker image for production
COPY ./conf/gunicorn_conf.py /

# Copy codes to the docker image for CI/CD
COPY ./app/ /${API_VOL}/

# Set Workdir and PYTHONPATH as /app
ENV PYTHONPATH=/${API_VOL}
WORKDIR /${API_VOL}