#!/bin/bash
# ================================================
# Duarte Legal — Deploy to GitHub Pages
# Ejecutar en la carpeta donde está este script
# ================================================
set -e

REPO_NAME="duarte-legal"
GITHUB_USER="${1:-tu-usuario}"   # pasa tu usuario: ./deploy.sh tu-usuario

if [ "$GITHUB_USER" = "tu-usuario" ]; then
  echo "Uso: ./deploy.sh TU_USUARIO_DE_GITHUB"
  exit 1
fi

echo "→ Inicializando repositorio..."
git init
git checkout -b main

echo "→ Agregando archivos..."
git add .
git commit -m "feat: Duarte Legal landing page — dos versiones"

echo "→ Conectando con GitHub..."
git remote add origin "https://github.com/$GITHUB_USER/$REPO_NAME.git"

echo "→ Creando repo en GitHub (requiere gh CLI autenticado)..."
gh repo create "$REPO_NAME" --public --source=. --remote=origin --push

echo ""
echo "✓ Listo. GitHub Pages:"
echo "  https://$GITHUB_USER.github.io/$REPO_NAME/"
echo ""
echo "Activa Pages en: https://github.com/$GITHUB_USER/$REPO_NAME/settings/pages"
echo "  Source → Deploy from branch → main → / (root)"
