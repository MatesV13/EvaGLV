@echo off
setlocal enabledelayedexpansion

if not exist ucenici\%1 goto nemaucenika

SET PYC=C:\Windows\py.exe
SET STUDENT=ucenici\%1

if not exist test goto nematestdirektorija
if not exist radni goto nemaradnidirektorija
if not exist check\stimer.exe goto nematimer
if not exist check\etimer.exe goto nematimer
if not exist check\diff.exe goto nemadiff
if "%2" == "" goto falizadatak

if not exist %STUDENT%\%2.py goto faliexe
if "%3" == "" goto svi

:jedan
rem --- Testiranje jednog primjera

if not exist test\%2 goto krivizadatak
if not exist test\%2\%3.in goto kriviin
if not exist test\%2\%3.out goto kriviout

echo.
echo Zadatak %2, test podatak %3:
echo ===== Sluzbeno rjesenje =====
type test\%2\%3.out
echo == Natjecateljevo rjesenje ==
check\stimer.exe
%PYC% %STUDENT%\%2.py < test\%2\%3.in > radni\%3.out 2> radni\%3.stderr
type radni\%3.out
type radni\%3.stderr
echo =============================
check\etimer.exe
check\diff.exe -q -B -w test\%2\%3.out radni\%3.out

if errorlevel 1 goto krivo
goto ispravno

:krivo
echo Rjesenje nije ispravno
echo 0 >> radni\testni.txt
goto kraj

:ispravno
echo Rjesenje je ispravno
echo 1 >> radni\testni.txt
goto kraj


:svi
rem --- Testira sve primjere u nekom zadatku

if not exist test\%2 goto krivizadatak

echo 0 > radni\testni.txt 

for %%i in (0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99) do (
   if exist test\%2\%%i.in call p.bat %1 %2 %%i
)

set /a BROJ=-1
set /a ZBROJ=0
for /f %%r in (radni\testni.txt) do (
   call :dodajBroj
   if %%r == 1 call :dodajZbroj
)

if !BROJ! == 0 goto end

echo REZULTAT: !ZBROJ!/!BROJ!
echo ZBROJ=!ZBROJ!>> temp.txt
echo BROJ=!BROJ!>> temp.txt

goto kraj


:nemaucenika
echo Folder ucenika %1 ne postoji unutar foldera ucenici!
goto kraj

:nematestdirektorija
rem --- Ne postoji direktorij test
echo Ne postoji direktorij test (sa test podacima)!
goto kraj

:nemaradnidirektorija
rem --- Ne postoji direktorij radni
echo Ne postoji direktorij radni (gdje se spremaju izlazi natjecatelja)!
goto kraj

:nematimer
rem --- Nema stimer.exe ili etimer.exe
echo U direktoriju check ne postoji stoperica!
goto kraj

:nemadiff
rem --- Nema diff.exe
echo U direktoriju check ne postoji diff program za usporedjivanje datoteka!
goto kraj

:krivizadatak
rem --- Zadatak ne postoji
echo U direktoriju test ne postoji zadatak %2!
goto kraj


:falizadatak
rem --- Nije zadan zadatak
echo Nije zadan zadatak (vidi upute).
echo Pravilno koristenje: t zadatak [broj_tp]
goto kraj


:kriviin
rem --- Zadan nepostojeci test podatak
echo Ne postoji test podatak %3 (datoteka test\%2\%3.in)!
goto kraj


:kriviout
rem --- Zadan nepostojeci test podatak
echo Ne postoji test podatak %3 (datoteka test\%2\%3.out)!
goto kraj

:faliexe
rem --- Zadan nepostojeci test podatak
echo Ne postoji natjecateljsko rjesenje (%STUDENT%\%2.py)!
goto kraj

:dodajBroj
set /A BROJ += 1
goto :end

:dodajZbroj
set /A ZBROJ += 1
goto :end

rem ---
:kraj
echo.

:end
endlocal