@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

REM Change directory to project root if necessary
cd %~dp0\..

REM Formatting .cpp and .h files in the components directory
FOR /R components %%F IN (*.cpp, *.h) DO (
    clang-format -i "%%F"
    echo Formatted: "%%F"
)

echo Code formatting applied.