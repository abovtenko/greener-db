param(
    [Parameter(Mandatory=$true)]
    [string]$scriptFolderPath
)

$scripts = Get-ChildItem -Path $scriptFolderPath -Filter "*.sql"
$hostname = "localhost"
$username = "postgres"
$database = "expenses"

$env:PGPASSWORD = ""

foreach ($script in $scripts)
{
    psql -h $hostname -U $username -d $database -f $script.FullName
}