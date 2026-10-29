import os
import socket

from fastapi import FastAPI

APP_VERSION = os.getenv("APP_VERSION", "dev")
GREETING = os.getenv("GREETING", "Hello from the DevOps lab!")

app = FastAPI(title="hello-api", version=APP_VERSION)

ITEMS = [
    {"id": 1, "name": "Docker"},
    {"id": 2, "name": "Kubernetes"},
    {"id": 3, "name": "Argo CD"},
]


@app.get("/")
def root():
    # hostname = pod name, so you can see which replica answered
    return {"message": GREETING, "version": APP_VERSION, "pod": socket.gethostname()}


@app.get("/healthz")
def healthz():
    return {"status": "ok"}


@app.get("/items")
def items():
    return ITEMS
