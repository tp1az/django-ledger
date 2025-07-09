FROM python:3.13.3-slim-bookworm

ENV PYTHONDONTWRITEBYTECODE 1 \
PYTHONUNBUFFERED 1

WORKDIR /app

RUN apt-get update && \
    apt-get install -y curl gcc libpq-dev && \
    pip install --upgrade pip && \
    pip install pipenv

# Copy project files
COPY . /app/

# Install Python dependencies
RUN pipenv install --deploy --ignore-pipfile

# Expose port (adjust as needed)
EXPOSE 8000


ENTRYPOINT ["./entrypoint.sh"]