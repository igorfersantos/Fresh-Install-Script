import shutil
import subprocess
from pip._vendor import requests
from tqdm import tqdm

def download_file(url, filename):
    """
    Helper method handling downloading large files from `url` to `filename`. Returns a pointer to `filename`.
    """
    chunkSize = 1024
    MB = 1024 ** 2

    r = requests.get(url, stream=True)
    with open(filename, 'wb') as f:
        pbar = tqdm(unit="B", total=int(r.headers['Content-Length'])/MB)
        for chunk in r.iter_content(chunk_size=chunkSize):
            if chunk: # filter out keep-alive new chunks
                pbar.update(len(chunk)/MB)
                f.write(chunk)
    return filename

output_file = download_file("https://cloud.bluestacks.com/get_offline_download?os_arch=x64", "bluestacks_installer.exe")

# call file
subprocess.call(output_file + " -s")
