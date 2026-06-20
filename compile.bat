@echo off
REM =============================================================================
REM Compile LaTeX document with bibliography
REM Requires: MiKTeX with pdflatex
REM =============================================================================
echo Compiling A* Search Algorithm article...
echo.
pdflatex -interaction=nonstopmode main.tex
bibtex main
pdflatex -interaction=nonstopmode main.tex
pdflatex -interaction=nonstopmode main.tex
echo.
echo Compilation complete: main.pdf
pause
