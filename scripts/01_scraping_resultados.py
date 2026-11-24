"""
01 · EXTRACCIÓN — Clasificaciones de carreras (web scraping)

Entrada : URLs de clasificaciones (data/aux/carreras.xlsx)
Salida  : data/raw/resultados/<carrera>_<año>.csv
Log     : logs/etl.log
"""
import logging
import time

import pandas as pd
import requests
from bs4 import BeautifulSoup

logging.basicConfig(filename="logs/etl.log", level=logging.INFO,
                    format="%(asctime)s %(levelname)s %(message)s")

MAX_REINTENTOS = 3


def descargar_pagina(url):
    """Descarga una página con reintentos; devuelve None si falla."""
    for intento in range(1, MAX_REINTENTOS + 1):
        try:
            r = requests.get(url, timeout=30)
            r.raise_for_status()
            return r.text
        except requests.RequestException as e:
            logging.warning(f"{url} intento {intento}: {e}")
            time.sleep(5 * intento)
    logging.error(f"No se pudo descargar {url}")
    return None


# TODO: recorrer las carreras y ediciones, extraer la tabla de
#       clasificación con BeautifulSoup y guardar un CSV por edición.
