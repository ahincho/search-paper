# Algoritmo de Búsqueda A*: Implementación y Análisis Comparativo en Grafos y Matrices

Artículo académico que presenta el diseño, implementación y validación experimental de un framework extensible de algoritmos de búsqueda (A*, BFS, DFS, Dijkstra, Bidirectional Search) aplicado a grafos ponderados y grids bidimensionales con obstáculos y terrenos variables.

> Hincho, A. (2026). *Algoritmo de Búsqueda A*: Implementación y Análisis Comparativo en Grafos y Matrices*. Universidad Nacional de San Agustín de Arequipa.

---

## Ecosistema

Este artículo forma parte de un ecosistema de repositorios interconectados:

| Componente | Repositorio | Descripción |
|:---|:---|:---|
| Core Library | [`search-library`](https://github.com/ahincho/search-library) | Framework de algoritmos de búsqueda — publicado en [PyPI](https://pypi.org/project/search-library/) |
| Benchmark Grafos | [`graph-search`](https://github.com/ahincho/graph-search) | Evaluación experimental sobre red vial (10 ciudades, 13 aristas) |
| Benchmark Grids | [`path-search`](https://github.com/ahincho/path-search) | Evaluación experimental sobre grids 2D (8 escenarios configurables) |
| Artículo | [`search-article`](https://github.com/ahincho/search-article) | Este repositorio — documento LaTeX con CI/CD |

---

## Estructura del Repositorio

```
search-article/
├── main.tex                        # Documento principal (IEEEtran, una columna)
├── references.bib                  # 18 referencias académicas verificables (BibTeX)
├── sections/
│   ├── 01-introduction.tex         # Motivación y objetivos
│   ├── 02-theory.tex               # Marco teórico: A*, BFS, DFS, Dijkstra
│   ├── 03-methodology.tex          # Diseño experimental y patrones de diseño
│   ├── 04-implementation.tex       # Arquitectura del sistema (3 capas)
│   ├── 05-results.tex              # Resultados con datos reales de benchmarks
│   ├── 06-discussion.tex           # Análisis, aplicaciones y limitaciones
│   ├── 07-conclusions.tex          # Conclusiones y trabajo futuro
│   └── 08-reproducibility.tex      # Instrucciones de reproducción
├── figures/                        # Figuras (TikZ inline en el documento)
├── compile.ps1                     # Script de compilación (PowerShell)
├── compile.bat                     # Script de compilación (CMD)
├── scripts/
│   ├── build.sh                    # Script de compilación (Linux/macOS)
│   ├── clean.sh                    # Limpieza de archivos auxiliares
│   └── watch.sh                    # Recompilación automática (latexmk -pvc)
├── .latexmkrc                      # Configuración de latexmk
└── .github/workflows/ci.yml        # Pipeline CI/CD (Build + Release)
```

---

## Compilación del Artículo

### Requisitos

- **Windows:** [MiKTeX](https://miktex.org/) con `pdflatex` y `bibtex`
- **Linux/macOS:** [TeX Live](https://tug.org/texlive/) (`texlive-full` o equivalente)
- **Paquetes LaTeX:** `IEEEtran`, `babel-spanish`, `amsmath`, `tikz`, `listings`, `algorithms`, `booktabs`, `hyperref`

### Windows — PowerShell

```powershell
.\compile.ps1
```

### Windows — CMD

```cmd
compile.bat
```

### Linux / macOS

```bash
chmod +x scripts/build.sh
./scripts/build.sh
```

### Resultado

El PDF generado se ubica en `main.pdf` (excluido del repositorio vía `.gitignore`).

---

## CI/CD (GitHub Actions)

El pipeline automatiza la compilación y el versionado del artículo:

| Evento | Acción |
|:---|:---|
| Push a `main` (archivos `.tex` o `.bib`) | Compila PDF y lo sube como artifact |
| Tag `v*.*.*` | Compila, renombra con versión y crea GitHub Release |

### Crear un release

```bash
git tag v1.1.0
git push origin v1.1.0
```

El PDF `search-library-paper-v1.1.0.pdf` se adjunta automáticamente al release.

---

## Reproducción de Experimentos

Los benchmarks son deterministas (semillas explícitas) y producen los mismos resultados en cualquier ambiente.

### Requisitos

- **Python:** >= 3.14 (para los benchmarks) o >= 3.11 (solo librería core)
- **Gestor:** [`uv`](https://docs.astral.sh/uv/) (recomendado) o `pip`

---

### Con `uv` (recomendado)

#### Benchmark en grafos

```bash
git clone https://github.com/ahincho/graph-search
cd graph-search
uv sync
uv run python src/main.py
```

#### Benchmark en grids

```bash
git clone https://github.com/ahincho/path-search
cd path-search
uv sync
uv run grid-benchmark
```

#### Tests de la librería core

```bash
git clone https://github.com/ahincho/search-library
cd search-library
uv sync
uv run pytest
```

---

### Con `pip` (tradicional)

#### Benchmark en grafos

```bash
git clone https://github.com/ahincho/graph-search
cd graph-search
pip install search-library>=1.0.0
python src/main.py
```

#### Benchmark en grids

```bash
git clone https://github.com/ahincho/path-search
cd path-search
pip install search-library>=1.0.0
python src/main.py
```

#### Tests de la librería core

```bash
git clone https://github.com/ahincho/search-library
cd search-library
pip install -e ".[dev]"
pytest --cov=search_library --cov-fail-under=90
```

---

## Contenido del Artículo

El documento cubre la rúbrica académica completa (20 puntos):

1. **Implementación funcional** — Explicación de A* con f(n) = g(n) + h(n), heurísticas admisibles, validaciones y resultados coherentes
2. **Estructura del trabajo** — Abstract, Introducción, Marco Teórico, Metodología, Implementación, Resultados, Discusión, Conclusiones, Referencias, Reproducibilidad
3. **Fundamentación y análisis** — 18 fuentes académicas (IEEE, ACM, Springer), comparación formal de 5 algoritmos
4. **Conclusiones** — Basadas en datos experimentales reales, relación con IA aplicada, limitaciones y trabajo futuro
5. **Estilo de citado** — BibTeX con formato IEEE, referencias verificables

---

## Autor

**Angel Hincho**  
Escuela Profesional de Ingeniería de Sistemas  
Universidad Nacional de San Agustín de Arequipa  
ahincho@unsa.edu.pe | [@ahincho](https://github.com/ahincho)

## Licencia

Este proyecto está licenciado bajo los términos de la [Licencia MIT](https://opensource.org/licenses/MIT).

Copyright (c) 2026 Angel Hincho.

Se concede permiso para usar, copiar, modificar y distribuir este software sin restricciones, siempre que se incluya el aviso de copyright original. Ver el archivo [LICENSE](LICENSE) para más detalles.
