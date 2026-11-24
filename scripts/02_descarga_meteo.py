"""
02 · EXTRACCIÓN — Meteorología horaria del día de cada carrera

Fuente principal : API AEMET OpenData (clave en .env)
Alternativa      : API Open-Meteo (histórico)
Salida           : data/raw/meteo/<carrera>_<año>.json
Log              : logs/etl.log
"""
import logging
import os

from dotenv import load_dotenv

load_dotenv()
AEMET_API_KEY = os.getenv("AEMET_API_KEY")

logging.basicConfig(filename="logs/etl.log", level=logging.INFO,
                    format="%(asctime)s %(levelname)s %(message)s")

# TODO: para cada carrera y fecha, pedir datos a AEMET; si falla,
#       usar Open-Meteo y anotar en el log qué fuente se ha usado.
