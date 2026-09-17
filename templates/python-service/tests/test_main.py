from fastapi.testclient import TestClient

from app.main import app


client = TestClient(app)


def test_root():
    response = client.get("/")

    assert response.status_code == 200
    assert response.json()["message"] == "Golden Path service is running"


def test_health():
    response = client.get("/health")

    assert response.status_code == 200
    assert response.json() == {"status": "healthy"}


def test_readiness():
    response = client.get("/ready")

    assert response.status_code == 200
    assert response.json() == {"status": "ready"}


def test_service_info():
    response = client.get("/info")

    assert response.status_code == 200

    body = response.json()

    assert body["service"] == "golden-path-service"
    assert body["status"] == "running"
    assert body["version"] == "1.0.0"