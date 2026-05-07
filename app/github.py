import requests

GITHUB_API = "https://api.github.com"

def get_user_gists(username: str):
    url = f"{GITHUB_API}/users/{username}/gists"
    response = requests.get(url)

    if response.status_code != 200:
        return None

    gists = response.json()

    result = []
    for gist in gists:
        description = gist.get("description")

        # Normalize description
        if not description:
            description = "No description"

        result.append({
            "id": gist.get("id"),
            "description": description,
            "url": gist.get("html_url")
        })

    return result