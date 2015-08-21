# Check if MySql connector is already loaded, load if necessary.
# Depends on MySQL ADO.NET connector which can be downloaded from: http://dev.mysql.com/downloads/connector/net/

$ConnectorPath = if ([System.Runtime.InteropServices.Marshal]::SizeOf([Type][IntPtr]) -eq 8)
                    { 'C:\Program Files (x86)\MySQL' }
                 else
                    { 'C:\Program Files\MySQL' }

$NETVersion = "v$($PSVersionTable.CLRVersion.Major).$($PSVersionTable.CLRVersion.Minor)"
$DLL = (Get-ChildItem $ConnectorPath -Recurse -Filter '*.dll' | 
        Where { $_.Name -eq 'MySql.Data.dll' -and $_.DirectoryName -match $NETVersion }).FullName
If (-not $DLL)
    { throw System.IO.FileNotFoundException 'Could not located required assembly' }
Add-Type -Path $DLL

Function New-MySQLConnection
{
    [CmdletBinding()]
    Param (
        [Parameter( Mandatory=$True, Position=0)]
        [String] $Server,

        [Parameter( Mandatory=$True, Position=1)]
        [String] $UserName,

        [Parameter( Mandatory=$True, Position=2)]
        [String] $Password,

        [Parameter( Mandatory=$True, Position=3)]
        [String] $DataBase,

        [Parameter( Mandatory=$false)]
        [Int]$Port=3306
    )


    $ConnectionString = "Server=$Server;Database=$DataBase;Uid=$UserName;Pwd=$Password;"
    $Connection = New-Object MySql.Data.MySqlClient.MySqlConnection
    $Connection.ConnectionString = $ConnectionString
    $Connection.Open()

    $Connection

}

Function Invoke-MySQLQuery
{
    [CmdletBinding()]
    Param (
        [Parameter( Mandatory=$True, Position=0,
                    ValueFromPipeline=$true,
                    ValueFromPipelineByPropertyName=$true)]
        [String] $Query,

        [Parameter(Mandatory=$False, Position=1)]
        [MySql.Data.MySqlClient.MySqlConnection] $Connection
    )

	$Command = New-Object MySql.Data.MySqlClient.MySqlCommand -ArgumentList $Query, $Connection
	$Adapter = New-Object MySql.Data.MySqlClient.MySqlDataAdapter
	$Adapter.SelectCommand = $Command
	$DataSet = New-Object System.Data.DataSet
	[void]$Adapter.Fill($DataSet)
	$Connection.Close()

	$DataSet.Tables
}