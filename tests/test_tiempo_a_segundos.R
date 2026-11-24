# Comprobaciones de tiempo_a_segundos()
source("scripts/funciones/tiempo_a_segundos.R")

stopifnot(
  tiempo_a_segundos("3:45:12") == 13512,
  tiempo_a_segundos("52:30") == 3150,
  tiempo_a_segundos("03h45'12''") == 13512,
  is.na(suppressWarnings(tiempo_a_segundos("DNF")))
)
message("Todas las comprobaciones de tiempo_a_segundos() son correctas")
