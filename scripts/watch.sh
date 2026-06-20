#!/bin/bash
# ============================================================================
# watch.sh - Recompilación automática al detectar cambios
# ============================================================================
# Uso: ./scripts/watch.sh
# Requiere: latexmk instalado
# ============================================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

echo "=========================================="
echo "  Modo watch: recompilación automática"
echo "  Presione Ctrl+C para detener"
echo "=========================================="
echo ""

cd "$PROJECT_DIR"

if command -v latexmk &> /dev/null; then
    latexmk -pdf -pvc -interaction=nonstopmode main.tex
else
    echo "[ERROR] latexmk es requerido para el modo watch."
    echo "        Instale con: sudo apt-get install latexmk"
    exit 1
fi
