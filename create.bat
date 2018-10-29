@echo off

echo Erstellt neue Template-Datei.

set /p modul="Modulname (z.B. Theoretische Informatik III): "
set /p gruppe="Gruppenname (z.B. Gruppe 01 - Tutor): "
set /p autor="Autoren (Getrennt durch '\\'): "

cd util
echo [Global] >settings.ini
echo modul=%modul% >>settings.ini
echo gruppe=%gruppe% >>settings.ini
echo autor=%autor% >>settings.ini
echo num=1 >>settings.ini

cd ..
del README.md
del create.bat