FOR /f "tokens=1,2 delims=: " %%A in (line.txt) do (
echo %%A >tmp1
echo %%B >tmp2
)
set /p value=<tmp1
set /p string=<tmp2
del tmp1>nul
del tmp2>nul
if %value% == partition_name goto name
if %value% == file_name goto filename
if %value% == physical_start_addr goto startaddress
if %value% == partition_size goto size
if %value% == type goto type
if %value% == - goto write
goto end

:name
set name=%string%
goto end

:filename
if %string% == NONE set filename=no file
if not %string% == NONE set filename=%string%
goto end

:startaddress
set startaddress=%string%
goto end

:size
set /a dec=%string%
set size=%dec%
goto end

:type
set type=%string%
goto end

:write
echo . %name%            %filename%            %startaddress%            %size%            %type%
echo . %name%            %filename%            %startaddress%            %size%            %type%>>scatter-file/readable-scatter.txt
goto end

:end