FROM python:3.7

COPY . /hello
WORKDIR /hello

RUN apt-get update && apt-get install -y curl
RUN apt-get update && apt-get install -y gcc python3-dev musl-dev libpq-dev

RUN pip install --trusted-host pypi.python.org -r requirements.pip

WORKDIR /

CMD ["gunicorn", "-b", "0.0.0.0:4000", "hello.app:app"]