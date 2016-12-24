if exist %appdata%\.MCBackup\ (
del /Q /S /F %appdata%\.MCBackup\
)
xcopy /c /e /h /k %appdata%\.minecraft\*.* %appdata%\.MCBackup\