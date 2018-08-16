@echo off
cd util
REM call ini.bat /s Global /i modul settings.ini

for /f "delims=" %%a in ('call ini.bat /s Global /i modul settings.ini') do @set modul=%%a
for /f "delims=" %%a in ('call ini.bat /s Global /i gruppe settings.ini') do @set gruppe=%%a
for /f "delims=" %%a in ('call ini.bat /s Global /i autor settings.ini') do @set autor=%%a
for /f "delims=" %%a in ('call ini.bat /s Global /i num settings.ini') do @set num=%%a

set num=%num: =%
set modul=%modul:~0,-1%
set gruppe=%gruppe:~0,-1%
set autor=%autor:~0,-1%

echo Modul: %modul%
echo Gruppe: %gruppe%
echo Autoren: %autor%
echo Nummer: %num%

cd ..
mkdir "Blatt %num%"
cd "Blatt %num%"

echo \documentclass[12pt]{scrartcl} >"%modul% - %num%.tex"
echo. >>"%modul% - %num%.tex"
echo %%Packages importieren, Header-Datei laden >>"%modul% - %num%.tex"
echo \input{../resource/pckgs.tex} >>"%modul% - %num%.tex"
echo \input{../resource/header.tex} >>"%modul% - %num%.tex"
echo. >>"%modul% - %num%.tex"
echo %%Header. Argumente: Modul/Gruppe/Autoren/Blattnummer >>"%modul% - %num%.tex"
echo \makeheader{%modul%}{%gruppe%}{%autor%}{%num%} >>"%modul% - %num%.tex"
echo. >>"%modul% - %num%.tex"
echo \begin{document} >>"%modul% - %num%.tex"
echo. >>"%modul% - %num%.tex"
echo \begin{exs} >>"%modul% - %num%.tex"
echo \item a >>"%modul% - %num%.tex"
echo \item b >>"%modul% - %num%.tex"
echo \end{exs} >>"%modul% - %num%.tex"
echo. >>"%modul% - %num%.tex"
echo \ex abc >>"%modul% - %num%.tex"
echo. >>"%modul% - %num%.tex"
echo \end{document} >>"%modul% - %num%.tex"

cd ../util
echo [Global] >settings.ini
echo modul=%modul% >>settings.ini
echo gruppe=%gruppe% >>settings.ini
echo autor=%autor% >>settings.ini
set /A num=num+1
echo num=%num% >>settings.ini