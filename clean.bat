@echo off
setlocal

echo Cleaning up project artifacts...

echo.
echo Removing build directories...
if exist build (
    echo   - Removing build\
    rmdir /s /q build
)
if exist dist (
    echo   - Removing dist\
    rmdir /s /q dist
)

echo.
echo Removing Python cache and egg-info directories...
for /d /r . %%d in (__pycache__, *.egg-info, .pytest_cache) do (
    if exist "%%d" (
        echo   - Removing %%d\
        rmdir /s /q "%%d"
    )
)

echo.
echo Clean up complete.
endlocal
