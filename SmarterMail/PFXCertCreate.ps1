$maildomain = 'mailhost.co.uk';
$mail_admin_password = 'password123';

(Get-ChildItem -Path 'Cert:\localmachine\My' |
Where-Object {$_.Subject -like "*${maildomain}*"} | 
Sort-Object -Property NotAfter -Descending | 
Select-Object -first 1) | 
Foreach-Object {&certutil.exe @('-exportpfx', '-f', '-p', $mail_admin_password, $_.Thumbprint, "C:\SmarterMail\Certificates\mail.${maildomain}.pfx")}
