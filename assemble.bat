@ECHO OFF
SET asm_file=%~1
for %%f in ("%asm_file%") do set asm_file=%%~nf

set path=c:\masm;c:\winnt\system32;c:\Program Files\Microsoft Visual Studio .NET 2003\Vc7\bin;%path%
set link=/debug /entry:start /incremental:no /subsystem:console kernel32.lib
set ml=/c /coff /Zi
set lib=c:\masm

ml %asm_file%.asm
link %asm_file%.obj
windbg %asm_file%.exe
