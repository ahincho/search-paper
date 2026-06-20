#!/bin/bash
# ============================================================================
# clean.sh - Limpia archivos auxiliares de compilación LaTeX
# ============================================================================
# Uso: ./scripts/clean.sh
# ============================================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

echo "=========================================="
echo "  Limpiando archivos auxiliares"
echo "=========================================="
echo ""

cd "$PROJECT_DIR"

# Extensiones de archivos auxiliares a eliminar
EXTENSIONS=(
    "aux" "log" "out" "toc" "lof" "lot"
    "bbl" "blg" "bcf" "run.xml"
    "fdb_latexmk" "fls" "synctex.gz"
    "nav" "snm" "vrb"
    "idx" "ilg" "ind"
    "dvi" "ps"
)

count=0
for ext in "${EXTENSIONS[@]}"; do
    for file in *.${ext} sections/*.${ext} 2>/dev/null; do
        if [ -f "$file" ]; then
            rm -f "$file"
            echo "  Eliminado: $file"
            ((count++))
        fi
    done
done

# Limpiar directorio de latexmk si existe
if [ -d "_minted-main" ]; then
    rm -rf "_minted-main"
    echo "  Eliminado: _minted-main/"
    ((count++))
fi

echo ""
echo "[INFO] $count archivo(s) auxiliar(es) eliminado(s)."
echo "=========================================="
