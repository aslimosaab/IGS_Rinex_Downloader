cls

$currentPath=pwd

Write-Host "
 _      _____ _____  _____   _____  _____ _   _ ________   __ 
| |    |_   _/ ____|/ ____| |  __ \|_   _| \ | |  ____\ \ / / 
| |______| || |  __| (___   | |__) | | | |  \| | |__   \ V /  
| |______| || | |_ |\___ \  |  _  /  | | | . ` |  __|   > <   
| |     _| || |__| |____) | | | \ \ _| |_| |\  | |____ / . \  
|_|    |_____\_____|_____/  |_|  \_\_____|_| \_|______/_/ \_\ 
Downloader						

collection.txt: add stations to download from.
process.txt: errors log.

Rinex Format:
| | | | O: Observation file
| | | | N: GPS navigation message file
| | | | M: Meteorological data file
| | | | G: GLONASS navigation message file
| | | | L: Galileo navigation message file
| | | | P: Mixed GNSS navigation message file
| | | | H: SBAS Payload navigation message file
| | | | B: SBAS broadcast data file
"
[string[]]$ArrayOfStations1 = Get-Content -Path 'collection.txt'

Write-Host -ForegroundColor blue "IGS-Stations found [collection.txt]: $ArrayOfStations1"

Write-Host $arrayFromFile

$ArrayOfErrorURLs = @("Error Downloading...");

function leftPad ($number) {
	
		$len = $number.ToString().length
		$returnValue = ""
		if($len -eq 1){
			$returnValue = "00$number"
		}
		elseif($len -eq 2){
			$returnValue = "0$number"
		}
		elseif($len -eq 3){
			$returnValue = "$number"
		}
		return $returnValue
	
	}
	
	
	
$from = Read-Host -Prompt 'start date dd/MM/yy'
$end = Read-Host -Prompt 'end date dd/MM/yy'
$Date = Get-Date
Try{
	$fromDate=[datetime]::ParseExact("$from", "dd/MM/yy", $null)
	$endDate=[datetime]::ParseExact("$end", "dd/MM/yy", $null)
}Catch{
	Write-Host -ForegroundColor red "Error parsing. Start again ex. 01/02/19?" 
	break;
}

Write-Host -ForegroundColor blue "Your input '$fromDate' and '$endDate' on '$Date'" 

$requiredDate = $endDate
$startDate = $fromDate
$days=($endDate-$fromDate).days 
if($endDate -gt $fromDate){
	$lenOfArray = $ArrayOfStations1.length
	$loop =  $days*$lenOfArray
	write-host "Downloading $loop files. $days days - $lenOfArray stations"
	for($i = $startDate; $i -lt $requiredDate; $i = $i.AddDays(1))
		{
		$year = $i.year
		$yl=$year.ToString().replace("20","")
		$dayofyear = $i.dayofyear
		$day = $i.day
		$dayofyear = leftPad($dayofyear)
		$lstring = ("{0}{1}{2}" -f $year,$dayofyear,"0000")
		$leftOf = $loop-$i.day
		
		$o = "$yl"+"o"
	
		
		for($j = 0;$j -lt $ArrayOfStations1.length;$j++){
			$leftOf = $loop-$i.day-$j
			$nr = $loop-$leftOf
			write-host -NoNewline "$nr/$loop"
			$name = $ArrayOfStations1[$j]+$dayofyear+"0."+$o+".Z";
			$outString = "ftp://cddis.gsfc.nasa.gov/gnss/data/daily/$year/$dayofyear/$o/"+$name
			write-host -NoNewline -ForegroundColor green ": Downloading $outString"
				Try
				{
				(New-Object System.Net.WebClient).DownloadFile($outString,$name)
				}
				Catch
				{
				write-host -NoNewline -ForegroundColor red " File not found."
				$ArrayOfErrorURLs = $ArrayOfErrorURLs + $outString
				}
			$outString=""
			write-host ""
		
		}
		
		
	}
}else{
write-host -ForegroundColor red "Start-Date is greater than End-Date"
}
$ArrayOfErrorURLs | Out-File -FilePath .\Process.txt
