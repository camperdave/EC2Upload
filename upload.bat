@ECHO OFF			
REM DO NOT MODIFY ABOVE THIS LINE!!!!

SET UNAME="dave"
SET EC2URL="ec2-50-16-26-96.compute-1.amazonaws.com"
SET KEYPATH="H:\keys\Jet.ppk"
SET BASEFOLDER="/var/www/html"
SET PUTTYFOLDER="H:\putty"

REM DO NOT MODIFY BELOW THIS LINE!!!!!!

REM 	%#		SublimeText2 Variable
REM		1 		$file_name
REM 	2		$file
REM		3 		$project_base_name

echo NOW UPLOADING: %1

IF %3%=="" (
		%PUTTYFOLDER%\plink.exe -ssh -i "%KEYPATH%" "%UNAME%@%EC2URL%" "mkdir -p /var/www/html/"

		%PUTTYFOLDER%\pscp.exe -i "%KEYPATH%" "%2" "%UNAME%@%EC2URL%:/var/www/html/%1"
	) ELSE (
		%PUTTYFOLDER%\plink.exe -ssh -i "%KEYPATH%" "%UNAME%@%EC2URL%" "mkdir -p /var/www/html/%3/"

		%PUTTYFOLDER%\pscp.exe -i "%KEYPATH%" "%2" "%UNAME%@%EC2URL%:%BASEFOLDER%/%3/%1"
	)