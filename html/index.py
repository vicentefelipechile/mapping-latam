# ----------------------------------------------------
# -------------------- Import ------------------------
# ----------------------------------------------------
import os


# ----------------------------------------------------
# ------------------ Definitions ---------------------
# ----------------------------------------------------

prefix = "https://github.mapping-latam.cl/html/"
header = """# Reglas de diferentes categorias

* [DarkRP](https://github.mapping-latam.cl/html/darkrp.html)
* [DarkRP (Archivo portable)](https://github.mapping-latam.cl/html/darkrp_simple.html)
* [DarkRP (Archivo portable y liviano)](https://github.mapping-latam.cl/html/darkrp_light.html)
* [Sandbox](https://github.mapping-latam.cl/html/sandbox.html)
* [Sandbox (Archivo portable)](https://github.mapping-latam.cl/html/sandbox_simple.html)
* [Sandbox (Archivo portable y liviano)](https://github.mapping-latam.cl/html/sandbox_light.html)
* [Trouble in Terrorist Town](https://github.mapping-latam.cl/html/ttt.html)
* [Trouble in Terrorist Town (Archivo portable)](https://github.mapping-latam.cl/html/ttt_simple.html)
* [Trouble in Terrorist Town (Archivo portable y liviano)](https://github.mapping-latam.cl/html/ttt_light.html)

# Archivos miscelaneos

"""

# ----------------------------------------------------
# -------------------- IMG URL -----------------------
# ----------------------------------------------------

files = []
for file in os.listdir("img"):
    if file.endswith(".png") or file.endswith(".jpg") or file.endswith(".jpeg") or file.endswith(".rar") or file.endswith(".pdn"):
        files.append("img/"+file)
for it in os.scandir("img"):
    if it.is_dir():
        for file in os.listdir(it.path):
            if file.endswith(".png") or file.endswith(".jpg") or file.endswith(".jpeg") or file.endswith(".rar") or file.endswith(".pdn"):
                file_path = it.path+"/"+file
                files.append(file_path.replace("\\","/"))

# ----------------------------------------------------
# ------------------- File Indexer -------------------
# ----------------------------------------------------

with open("README.md", "w") as f:
    f.write(header)
    for i in files:
        f.write("* ["+i+"]("+prefix+i+")\n")
