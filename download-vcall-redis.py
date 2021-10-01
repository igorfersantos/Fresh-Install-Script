import os
from pip._vendor import requests
from tqdm import tqdm

chunkSize = 4096
MB = 1024 ** 2

directory = './downloads/'
filename = "vc-all.zip"
file_path = os.path.join(directory, filename)

if not os.path.isdir(directory):
    os.mkdir(directory)

url = "https://www.techpowerup.com/download/visual-c-redistributable-runtime-package-all-in-one/"

payload={'id': '1938',
'server_id': '12'}
files=[

]
headers = {}

r = requests.request("POST", url, headers=headers, data=payload, files=files, stream=True)

with open(file_path, 'wb') as f:
        pbar = tqdm(unit="MB", total=int(r.headers['Content-Length'])/MB)
        for chunk in r.iter_content(chunk_size=chunkSize):
            if chunk: # filter out keep-alive new chunks
                pbar.update(len(chunk)/MB)
                f.write(chunk)
