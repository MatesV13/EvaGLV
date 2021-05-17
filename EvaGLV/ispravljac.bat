@echo off
setlocal enabledelayedexpansion

rem --- Ispravlja ime.in.n u n.in (i isto za output)

for %%X in (*.in.*) do (
	set IME=%%X
	echo Pronadjen je !IME!
	set IME=!IME:*.=!
	set IME=!IME:*.=!
	type %%X > !IME!.in
	echo %%X je preseljen u !IME!.in
	del %%X > nul 2> nul
)

for %%X in (*.out.*) do (
	set IME=%%X
	echo Pronadjen je !IME!
	set IME=!IME:*.=!
	set IME=!IME:*.=!
	type %%X > !IME!.out
	echo %%X je preseljen u !IME!.out
	del %%X > nul 2> nul
)
