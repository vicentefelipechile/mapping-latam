# ----------------------------------------------------
# -------------------- Import ------------------------
# ----------------------------------------------------
import os


# ----------------------------------------------------
# ------------------ Definitions ---------------------
# ----------------------------------------------------

prefix = "https://vicentefelipechile.github.io/mapping-latam/html/"
header = """# Reglas de diferentes categorias

* [DarkRP](https://github.mapping-latam.cl/html/darkrp.html)
* [DarkRP (Liviano)](https://github.mapping-latam.cl/html/darkrp_light.html)
* [Sandbox](https://github.mapping-latam.cl/html/sandbox.html)
* [Sandbox (Liviano)](https://github.mapping-latam.cl/html/sandbox_light.html)
* [Trouble in Terrorist Town](https://github.mapping-latam.cl/html/ttt.html)
* [Trouble in Terrorist Town (Archivo portable)](https://github.mapping-latam.cl/html/ttt_light.html)

---

# Reglas de juegos alternativos

* [FalloutRP](https://github.mapping-latam.cl/html/falloutrp.html)
* [FalloutRP (Liviano)](https://github.mapping-latam.cl/html/falloutrp_light.html)
* [Sandbox Brasil](https://github.mapping-latam.cl/html/sandboxbr.html)
* [Sandbox Brasil (Liviano)](https://github.mapping-latam.cl/html/sandboxbr_light.html)

---

# Imagenes

"""

# ----------------------------------------------------
# -------------------- IMG URL -----------------------
# ----------------------------------------------------

# Extensión de archivos de imagen válidos
extensiones_validas: tuple[str] = (".jpeg", ".png", ".jpg", ".pdn")

# Lista para almacenar las rutas completas de los archivos encontrados
rutas_archivos: list[str] = []

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

    # Archivos PNG o JPG
    for ruta in rutas_archivos:
        ruta = ruta.replace("\\", "/")

        if ".png" not in ruta and ".jpg" not in ruta and ".jpeg" not in ruta:
            continue

        if "minigame-tool-assistant/" in ruta:
            continue

        if "steamcmd/" in ruta:
            continue

        if "wiki/" in ruta:
            continue

        url = prefix + ruta
        
        archivo_urls.write("* ![{}]({})\n".format(ruta, url.replace(" ", "%20")))
    
    archivo_urls.write("\n---\n\n# Archivos miscelaneos\n\n")

    # Archivos no PNG o JPG
    for ruta in rutas_archivos:
        ruta = ruta.replace("\\", "/")

        if ".png" in ruta or ".jpg" in ruta or ".jpeg" in ruta:
            continue

        url = prefix + ruta
        
        archivo_urls.write("* [{}]({})\n".format(ruta, url.replace(" ", "%20")))