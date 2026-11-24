# 03 · TRANSFORMACIÓN — Limpieza de resultados y meteorología
# Entrada : data/raw/
# Salida  : data/processed/resultados_limpios.rds, meteo_limpia.rds

library(tidyverse)
library(lubridate)
library(logger)

log_appender(appender_file("logs/etl.log"))
source("scripts/funciones/tiempo_a_segundos.R")

# TODO:
# - Leer todos los CSV/Excel de resultados (tryCatch por fichero) y apilar con bind_rows()
# - Unificar nombres de columnas (rename) y convertir tiempos a segundos
# - Normalizar categorías con data/aux/categorias_validadas.csv (left_join)
# - Eliminar duplicados (distinct), marcar DNF en `finalizado`, filtrar atípicos
# - Leer JSON de meteorología (jsonlite::fromJSON) e interpolar huecos (fill)
