@echo off
setlocal enabledelayedexpansion

if "%1" == "" goto svi
if not exist ucenici\%1 goto nemaucenika

:jedan
rem --- testira jednog učenika
echo !U!
set /A "UkupniZbroj=0"
set /A "UkupniBroj=0"
for %%X in (ucenici\!U!\*.py) do (
	set UCENIK=%%X
	set UCENIK=!UCENIK:*\=!
	set IME_ZAD=!UCENIK:*\=!
	set Z=!IME_ZAD:~0,-3!
	call p.bat !U! !Z!
	for /f "delims== tokens=1,2" %%G in (temp.txt) do set %%G=%%H
	echo Zadatak !Z!: !ZBROJ!/!BROJ! >> ucenici\!U!\eval.txt
	set /A "UkupniZbroj+=ZBROJ"
	set /A "UkupniBroj+=BROJ"
)
echo Ukupno: !UkupniZbroj!/!UkupniBroj! >> ucenici\!U!\eval.txt
type ucenici\!U!\eval.txt >> ucenici\eval.txt
goto end

:svi
rem --- testira sve učenike iz ucenici

echo EVALUACIJA ZAPOCETA U !TIME! > ucenici\eval.txt

for /D %%d in (ucenici\*) do (
	set UCENIK=%%d
	set U=!UCENIK:~8!
	echo ===================================== >> ucenici\eval.txt
	echo Evaluacija ucenika !U! > ucenici\!U!\eval.txt
	echo UCENIK=!U!> temp.txt
	call T.bat !U!
	del temp.txt > nul 2> nul
	echo ===================================== >> ucenici\eval.txt
)

echo EVALUACIJA ZAVRSENA U !TIME! >> ucenici\eval.txt

goto end

:nemaucenika
echo NE POSTOJI UCENIK %1!

:end
