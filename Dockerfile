# syntax=docker/dockerfile:1
ARG RECIPIENT
FROM python:3.7-alpine
WORKDIR /code
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
RUN apk update \
    && apk add --no-cache gcc musl-dev linux-headers ssmtp
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
EXPOSE 5000
COPY . .
HEALTHCHECK --interval=1m CMD ./ping.sh || echo "Unhealthy" | ssmtp $RECIPIENT || exit 1
CMD ["flask", "run"]