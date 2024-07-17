FROM cgr.dev/chainguard/python:latest-dev as builder

WORKDIR /myapp

COPY requirements.txt .

RUN pip install -r requirements.txt --user

FROM cgr.dev/chainguard/python

WORKDIR /myapp

COPY main.py /myapp/main.py
COPY models.py /myapp/models.py
COPY templates /myapp/templates
COPY static /myapp/static

# Make sure you update Python version in path
# COPY --from=builder /home/nonroot/.local/lib/python3.12/site-packages /home/nonroot/.local/lib/python3.12/site-packages

CMD ["python", "/myapp/main.py"]