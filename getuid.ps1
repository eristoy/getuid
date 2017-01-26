$targets = "C:\Users\eas702\Downloads\tgt.txt"
$tgt = Get-Content $targets
foreach ($line in $tgt)	{
	Write-Host "First target is $line"
	$i = "\\$line"
	Write-Host "Running psloggedon $i"
	$res = .\PSLoggedon.exe $i | where {$_ -match "time"} | %{$_.Split('\t')[2];}
	if ($res) { 
	Write-Host "Username is $res"
	$out = $line +"," +$res
	Write-Host $out
	$out | Add-Content "wintgt.txt"
	} else {
	Write-Host "Null results"
	}
	}
