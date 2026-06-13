@echo off
chcp 65001 >nul
title SEO-Website Deploy -> GitHub Pages
cd /d "%~dp0"
echo ============================================================
echo  DEPLOY hauskaufberatung-stuttgart  (530 Seiten)
echo ============================================================
echo.

echo --- Alten/kaputten Git-Ordner entfernen (falls vorhanden) ---
if exist ".git" (
  attrib -h -s -r ".git" >nul 2>&1
  rmdir /s /q ".git"
)
if exist ".git" (
  echo HINWEIS: .git konnte nicht geloescht werden. Bitte Datei-Explorer:
  echo versteckte Ordner einblenden, .git im Ordner site loeschen, dann .bat erneut starten.
  pause
  exit /b 1
)

echo --- Git neu vorbereiten ---
git init
git add -A
git commit -m "Deploy SEO-Website hauskaufberatung-stuttgart (530 Seiten, Vorlesen, Sitemap)"
git branch -M main
git remote remove origin 2>nul
git remote add origin https://github.com/stefan-klaus-ritter/hauskaufberatung-stuttgart.git
echo.
echo --- Hochladen (falls ein GitHub-Anmeldefenster aufgeht: Sign in / Authorize klicken) ---
git push -u origin main --force
echo.
echo ============================================================
echo  FERTIG (wenn oben kein "error" / "fatal" steht).
echo  Naechster Schritt: ich schalte GitHub Pages ein.
echo ============================================================
echo.
pause
