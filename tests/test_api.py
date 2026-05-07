from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

def test_octocat_gists():
    response = client.get("/octocat")

    assert response.status_code == 200

    data = response.json()
    assert data["user"] == "octocat"
    assert isinstance(data["gists"], list)