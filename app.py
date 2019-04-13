import os
import sys

projectParts = [
    "core",
    "server",
    "client",
    "web",
    "mobile"
]

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

#if sys.argv[1] == "gen":
#        files = ""
#    for file in os.listdir(f"protobuf"):
#        if file.endswith(".proto"):
#            files = files + " " + file
#    os.system(f"cd protobuf && protoc -I=. --dart_out=gen {files}")
#    os.system(f"cp -r protobuf/gen server/lib/")
#    os.system(f"cp -r protobuf/gen client/lib/")
#    os.system(f"cd server && pub run build_runner build")
