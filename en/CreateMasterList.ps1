$path = "E:\Projects\BannedWords\en"
$files = get-childitem "$path\bin\" -Filter *.csv
$excludeCsv = Import-Csv "$path\cfg\WordsToExclude.csv"

Remove-Item "$path\Output\Master.csv"
New-Item "$path\Output\Master.csv" -type file 

foreach($file in $files){
	$import = Import-Csv "bin\$($file.name)"
	
	if(!($excludeCsv.WordsToExclude.Contains($file.name))){
		$import | Export-Csv -append "Output\Master.csv" -noType
	}
	
}