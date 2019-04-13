import os
import sys
from urllib import request

projectParts = [
    "core",
    "server",
    "client",
    "web",
    "mobile",
    "rest-api"
]

if sys.argv[1] == "setup":
    os.makedirs('.build', exist_ok=True)
    request.urlretrieve("http://central.maven.org/maven2/org/openapitools/openapi-generator-cli/3.3.4/openapi-generator-cli-3.3.4.jar", ".build/openapi-generator.jar")

if sys.argv[1] == "update":
    for part in projectParts:
        if part == "mobile":
            os.system(f"cd {part} && flutter packages get")
        else:
            os.system(f"cd {part} && pub get")

if sys.argv[1] == "web":
    os.system(f"cd web && webdev serve --hot-reload")

if sys.argv[1] == "server":
    os.system(f"cd server && aqueduct serve")

if sys.argv[1] == "gen":
    os.system(f"cd server && aqueduct document --machine > ../.build/document.json")
    os.system(f"cd .build && java -jar openapi-generator.jar generate -i document.json -g dart -o ../rest-api -c ../rest-api/config.json")
    os.remove("rest-api/.gitignore")
    os.remove("rest-api/git_push.sh")
    os.remove("rest-api/README.md")
