signtool sign /v /ac MS_XS.crt /f xxx.pfx /p ÃÜÂë /tr http://tsa.wosign.com/rfc3161 *.sys
signtool sign /v /ac MS_XS.crt /f xxx.pfx /p ÃÜÂë /tr http://tsa.wosign.com/rfc3161 *.cat

signtool verify /v /kp *.sys

pause



