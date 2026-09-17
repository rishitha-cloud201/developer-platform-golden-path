from fastapi import FastAPI
from pydantic import BaseModel


app = FastAPI(
    title="Golden Path Service",
    description="Reference service generated from the internal developer platform golden path.",
    version="1.0.0",
)


class ServiceInfo(BaseModel):
    service: str
    status: str
    version: str


@app.get("/")
def root():
    return {
        "message": "Golden Path service is running",
        "platform": "developer-platform-golden-path",
    }


@app.get("/health")
def health():
    return {"status": "healthy"}


@app.get("/ready")
def readiness():
    return {"status": "ready"}


@app.get("/info", response_model=ServiceInfo)
def service_info():
    return ServiceInfo(
        service="golden-path-service",
        status="running",
        version="1.0.0",
    )