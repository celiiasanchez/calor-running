#' Convierte un tiempo de carrera en texto a segundos
#'
#' Admite "h:mm:ss", "mm:ss" y "03h45'12''". Devuelve NA (con aviso)
#' si el formato no se reconoce, en lugar de detener el proceso.
tiempo_a_segundos <- function(x) {
  x <- gsub("[h']+", ":", trimws(x))
  x <- sub(":$", "", x)
  partes <- strsplit(x, ":", fixed = TRUE)
  res <- vapply(partes, function(p) {
    n <- suppressWarnings(as.numeric(p))
    if (any(is.na(n))) return(NA_real_)
    if (length(n) == 3) return(n[1] * 3600 + n[2] * 60 + n[3])
    if (length(n) == 2) return(n[1] * 60 + n[2])
    NA_real_
  }, numeric(1))
  if (anyNA(res)) warning(sum(is.na(res)), " tiempo(s) con formato no reconocido")
  res
}
