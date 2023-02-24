$CMK_VERSION = "2.0.0p9"
####
## Windows Cloverleaf interface monitoring
## Replace path in first variable with your cloverleaf location
## Replace 'production' in second variable with your site name
$path = "c:\healthcomm\cloverleaf\cis20.1\integrator"
$status = cmd /c "call $($path)\sbin/setroot $($path) production && hciconnstatus"
$regex = "\b(?:error|down)\b"

#skip first two lines of output, because there is no interface information
foreach($item in ($status | Select -Skip 2)){
    $str = $item -split '\s+'
        if(($str[2] -match $regex) -or ($str[3] -match $regex)){
            Write-Host "2 ""Interface $($str[1])"" - Status:$($str[2]) Proto status:$($str[3])"
        }
        else {
            Write-Host "0 ""Interface $($str[1])"" - Status:$($str[2]) Proto status:$($str[3])"
        }
}
