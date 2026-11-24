# ¿Cuánto nos frena el calor?

Impacto de la temperatura y la humedad en el rendimiento de corredores populares en maratones y medias maratones españolas (2015–2025).

**Autora:** Celia Sánchez Pérez
**Asignatura:** Programación orientada al análisis de datos — Máster en Análisis de Datos Deportivos (URJC)

## Objetivo

Estimar cuántos segundos por kilómetro pierde un corredor popular por cada grado de estrés térmico (WBGT), y si el efecto es distinto según sexo, categoría de edad y nivel del corredor.

## Fuentes de datos

| Fuente | Contenido | Formato |
|---|---|---|
| Webs de clasificaciones / cronometraje | Resultados por corredor (tiempos, parciales, categoría) | HTML → CSV, Excel |
| API AEMET OpenData | Observaciones meteorológicas horarias | JSON |
| API Open-Meteo (histórico) | Meteorología horaria por coordenadas (alternativa) | JSON |
| Ficha técnica de cada carrera | Hora de salida, desnivel, cambios de recorrido | Excel (manual) |

Los datos originales (`data/raw/`) no se incluyen en el repositorio: se generan ejecutando los scripts de descarga.

## Estructura

```
calor-running/
├── data/
│   ├── raw/          # Datos originales (no versionados)
│   ├── aux/          # Ficha de carreras y tabla de categorías validada
│   └── processed/    # Datos limpios e integrados
├── scripts/          # Flujo ETL y análisis, numerado por orden de ejecución
│   └── funciones/    # Funciones propias reutilizables
├── logs/             # Registros de ejecución
├── reports/          # Informe Quarto y figuras
└── tests/            # Comprobaciones de las funciones propias
```

## Cómo reproducir el análisis

1. Clonar el repositorio y abrir la carpeta en Positron o RStudio.
2. Instalar dependencias:
   - R: `renv::restore()`
   - Python: `pip install -r requirements.txt`
3. Copiar `.Renviron.example` como `.Renviron` y `.env.example` como `.env`, y escribir la clave de la API de AEMET (https://opendata.aemet.es).
4. Ejecutar los scripts en orden:
   ```
   python scripts/01_scraping_resultados.py
   python scripts/02_descarga_meteo.py
   Rscript scripts/03_limpieza.R
   Rscript scripts/04_integracion_features.R
   Rscript scripts/05_modelos.R
   ```
5. Renderizar el informe: `quarto render reports/informe.qmd`

## Estado

Fase de diseño: el repositorio contiene la estructura del proyecto y la propuesta metodológica (`reports/informe.qmd`). Los scripts son plantillas que se completarán en la fase de desarrollo.
