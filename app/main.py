from fastapi import FastAPI, HTTPException
from app.github import get_user_gists

app = FastAPI()

@app.get("/{username}")
def fetch_gists(username: str):
    data = get_user_gists(username)

    if data is None:
        raise HTTPException(status_code=404, detail="User not found")

    return {
        "user": username,
        "gists": data
    }