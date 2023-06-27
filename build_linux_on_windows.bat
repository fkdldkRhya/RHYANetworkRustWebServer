@echo off

SET CARGODIRECTORY=%USERPROFILE%\.cargo
SET CARGOCONFIGFILE=%CARGODIRECTORY%\config.toml

IF EXIST "%CARGODIRECTORY%" (

IF EXIST "%CARGOCONFIGFILE%" (
del /q /f %CARGOCONFIGFILE%
)

echo [target.x86_64-unknown-linux-musl]>"%CARGOCONFIGFILE%"
echo linker = "rust-lld">>"%CARGOCONFIGFILE%"
)

cargo build --target x86_64-unknown-linux-musl

IF EXIST "%CARGOCONFIGFILE%" (
del /q /f %CARGOCONFIGFILE%
)