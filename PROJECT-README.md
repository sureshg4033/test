# GitHub Gists API Service

## 📌 Overview

This service is a simple HTTP API built using Python (FastAPI) that integrates with the GitHub public API to fetch a user’s publicly available Gists.

Given a GitHub username, the API returns a list of gists including:

- Gist ID
- Description
- URL

This project demonstrates:

- External API integration
- REST API design
- Automated testing
- Containerization using Docker

## 🚀 API Endpoint

### Get user gists
`GET /{username}`

#### Example
`GET /octocat`

#### Sample Response
```json
{
  "user": "octocat",
  "gists": [
    {
      "id": "6cad326836d38bd3a7ae",
      "description": "Hello world!",
      "url": "https://gist.github.com/octocat/6cad326836d38bd3a7ae"
    }
  ]
}
```

## 🧰 Tech Stack

- Python 3.11
- FastAPI
- Requests
- Pytest
- Docker

## 🧪 Running Locally (Without Docker)

1. Clone repository

    ```bash
    git clone <repo-url>
    cd github-gists-api
    ```
2. Install dependencies

    ```bash
    pip install -r requirements.txt
    ```
3. Start the application

    ```bash
    uvicorn app.main:app --host 0.0.0.0 --port 8080 --reload
    ```
4. Test the API

Option A: Browser

`http://localhost:8080/octocat`

Option B: curl

`curl http://localhost:8080/octocat`

Option C: Swagger UI (Recommended)

`http://localhost:8080/docs`

This provides an interactive UI to test the API.

## 🧪 Run Automated Tests

```bash
pytest
```

## 🐳 Running with Docker

1. Build Docker image

    ```bash
    docker build -t gists-api .
    ```
2. Run container

    ```bash
    docker run -p 8080:8080 gists-api
    ```
3. Test API

    ```bash
    curl http://localhost:8080/octocat
    ```

or open in browser:

`http://localhost:8080/docs`

## 🔒 Notes

- The service uses the public GitHub API and does not require authentication.
- Only publicly available gists are returned.
- Basic error handling is implemented for invalid users.
