@echo off
REM ==========================
REM Export PPT - Lanceur local
REM ==========================

REM Aller dans le dossier du script
cd /d "%~dp0"

REM Petit log
echo [%date% %time%] Lancement ExportPPT... > run.log

REM Vérifier le Python portable
if not exist "python_embed\python.exe" (
  echo ERREUR: python_embed introuvable ou incomplet. >> run.log
  echo ERREUR: Dossier python_embed introuvable. Contactez l'equipe.
  pause
  exit /b 1
)

REM Variables d'environnement Streamlit
set STREAMLIT_SERVER_ADDRESS=127.0.0.1
set STREAMLIT_SERVER_FILE_WATCHER_TYPE=none
set STREAMLIT_BROWSER_GATHER_USAGE_STATS=false

REM Lancer l'app avec le Python portable
echo [%date% %time%] Demarrage streamlit... >> run.log
"python_embed\python.exe" -m streamlit run "app\streamlit_app.py"

REM Quand on ferme l'app, on revient proprement
echo [%date% %time%] Arret. >> run.log