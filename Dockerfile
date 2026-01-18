FROM python:3.8-slim-buster
WORKDIR /app
COPY . /app

RUN sed -i 's|deb.debian.org|archive.debian.org|g' /etc/apt/sources.list && \
    sed -i 's|security.debian.org|archive.debian.org/debian-security|g' /etc/apt/sources.list && \
    sed -i '/buster-updates/d' /etc/apt/sources.list && \
    apt update -y && apt install awscli -y

RUN pip install -r requirements.txt

CMD ["python", "app.py"]
