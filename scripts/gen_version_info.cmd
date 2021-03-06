@echo off
rem https://stackoverflow.com/questions/3472631/how-do-i-get-the-day-month-and-year-from-a-windows-cmd-exe-script
FOR /F "skip=1 tokens=1-6" %%A IN ('WMIC Path Win32_LocalTime Get Day^,Hour^,Minute^,Month^,Second^,Year /Format:table') DO (
    if "%%B" NEQ "" (
        SET /A FDATE=%%F*10000+%%D*100+%%A
    )
)
set year=%FDATE:~0,4%
set /p version=<VERSION

echo // version.h generated by GEMMA
rem https://stackoverflow.com/questions/7105433/windows-batch-echo-without-new-line
echo|set /p="#define GEMMA_VERSION ""
echo %version%"
echo #define GEMMA_DATE "%FDATE:~0,8%"
echo #define GEMMA_YEAR "%year%"
