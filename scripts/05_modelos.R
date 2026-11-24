# 05 · ANÁLISIS — Descriptiva, correlación y modelos
# Entrada : data/processed/datos_analisis.rds
# Salida  : reports/figuras/, tablas de coeficientes (.rds)

library(tidyverse)
library(broom)

# TODO:
# - Estadística descriptiva por carrera, edición, sexo y categoría
# - Correlaciones Pearson / Spearman (WBGT vs ritmo_relativo)
# - lm(ritmo_relativo ~ wbgt + humedad + viento + sexo + categoria +
#        nivel_corredor + wbgt:nivel_corredor + carrera)
# - glm(finalizado ~ wbgt + sexo + categoria + distancia, family = binomial)
# - Validación por ediciones (RMSE con vs. sin variables meteorológicas)
