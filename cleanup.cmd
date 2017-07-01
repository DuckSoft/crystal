echo off
color a
:listing
cls
echo Listing file to clean...
for /R %%s in (*.log *.un~ *.aux *.out *.pdf *.toc *.gz) do ( 
echo  - %%s
)
echo Any key to continue.
pause
:cleaning
echo Now cleaning...
for /R %%s in (*.log *.un~ *.aux *.out *.pdf *.toc *.gz) do ( 
del %%s
)
echo done.
pause