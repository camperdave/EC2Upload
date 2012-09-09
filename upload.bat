@ECHO OFF			
REM DO NOT MODIFY ABOVE THIS LINE!!!!

SET UNAME="dave"
SET EC2URL="ec2-184-72-138-38.compute-1.amazonaws.com"
SET KEYPATH="C:\Users\Dave\Keys\EC2\Jet.ppk"

REM DO NOT MODIFY BELOW THIS LINE!!!!!!

REM 	%#		SublimeText2 Variable
REM		1 		$file_name
REM 	2		$file
REM		3 		$project_base_name

echo NOW UPLOADING: %1

IF %3%=="" (
		plink.exe -ssh -i "%KEYPATH%" "%UNAME%@%EC2URL%" "mkdir -p /var/www/html/"

		pscp.exe -i "%KEYPATH%" "%2" "%UNAME%@%EC2URL%:/var/www/html/%1"
	) ELSE (
		plink.exe -ssh -i "%KEYPATH%" "%UNAME%@%EC2URL%" "mkdir -p /var/www/html/%3/"

		pscp.exe -i "%KEYPATH%" "%2" "%UNAME%@%EC2URL%:/var/www/html/%3/%1"
	)