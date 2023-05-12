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

# Extensión de archivos de imagen válidos
extensiones_validas = (".jpeg", ".png", ".jpg", ".pdn")

# Lista para almacenar las rutas completas de los archivos encontrados
rutas_archivos = []

# Recorrer todos los archivos de la carpeta y sus subcarpetas
for root, dirs, files in os.walk("img/", topdown=True):
    for archivo in files:
        # Obtener la extensión del archivo
        extension = os.path.splitext(archivo)[1]
        # Si la extensión es una de las válidas, agregar la ruta completa a la lista
        if extension.lower() in extensiones_validas:
            ruta_completa = os.path.join(root, archivo)
            rutas_archivos.append(ruta_completa)

# Generar el archivo con las URLs de las imágenes

# ----------------------------------------------------
# ------------------- File Indexer -------------------
# ----------------------------------------------------

with open("README.md", "w") as archivo_urls:
    archivo_urls.write(header)
    for ruta in rutas_archivos:
        ruta = ruta.replace("\\", "/")
        url = prefix + ruta
        # Escribir la URL en el archivo
        archivo_urls.write("* [{}]({})\n".format(ruta, url))