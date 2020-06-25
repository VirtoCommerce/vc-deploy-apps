#!/usr/bin/python
import zipfile 
import io 
import urllib.request
import json
import zipfile
import shutil

def getZipData(url):
    result = urllib.request.urlopen(url)
    return result.read()

with open('platform.json') as f:
    config = json.load(f)
    for module in config["Modules"]:
        moduleId = module["Id"]
        packageUrl = module["PackageUrl"]
        destinationPath = moduleId
        zipData = getZipData(packageUrl)
        zipRef = zipfile.ZipFile(io.BytesIO(zipData))
        zipRef.extractall(destinationPath)
        print(moduleId, 'installed')