$path = "E:\Projects\BannedWords\en"
$files = get-childitem "$path\bin\" -Filter *.csv

foreach($file in $files){
	$import = Import-Csv $file.name | Sort-Object -Descending
	$import | Export-Csv $file.name
}