# 04 · TRANSFORMACIÓN / CARGA — Integración de fuentes y variables derivadas
# Entrada : data/processed/resultados_limpios.rds, meteo_limpia.rds
# Salida  : data/processed/datos_analisis.rds

library(tidyverse)

# TODO:
# - Unir resultados y meteorología por carrera + fecha + hora (left_join)
# - Calcular WBGT medio durante la franja de cada corredor
# - Variables: ritmo_s_km, wbgt_aprox, nivel_corredor, ritmo_relativo, caida_segunda_mitad
# - Parciales a formato largo (pivot_longer)
# - Validaciones finales con stopifnot()
