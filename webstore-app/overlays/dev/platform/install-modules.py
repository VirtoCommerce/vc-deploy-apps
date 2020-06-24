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

modules = json.load('./modules.json')

for module in modules:
    moduleId = module["Id"]
    packageUrl = version["PackageUrl"]
    destinationPath = moduleId
    zipData = getZipData(packageUrl)
    zipRef = zipfile.ZipFile(io.BytesIO(zipData))
    zipRef.extractall(destinationPath)
    print(moduleId, 'installed')