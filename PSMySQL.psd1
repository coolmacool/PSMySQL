@{

# Script module or binary module file associated with this manifest
ModuleToProcess = 'PSMySQL'

# Version number of this module.
ModuleVersion = '1.0'

# ID used to uniquely identify this module
GUID = 'c3daaae5-0b43-4990-b650-098caceef24d'

# Author of this module
Author = 'Vince Rimkus'

# Company or vendor of this module
CompanyName = 'N3T Technologies'

# Copyright statement for this module
Copyright = 'N3T Technologies 2015'

# Description of the functionality provided by this module
Description = 'Functions designed to enable MySQL interaction from PowerShell'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '2.0'

# Name of the Windows PowerShell host required by this module
#PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
#PowerShellHostVersion = ''

# Minimum version of the .NET Framework required by this module
#DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module
#CLRVersion = ''

# Processor architecture (None, X86, Amd64, IA64) required by this module
#ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
#RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
#RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module
#ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
#TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
#FormatsToProcess = @()

# Modules to import as nested modules of the module specified in ModuleToProcess
#NestedModules = ''

# Functions to export from this module
FunctionsToExport = 'New-MySqlConnection', 'Invoke-MySqlQuery'

# Cmdlets to export from this module
CmdletsToExport = '*'

# Variables to export from this module
VariablesToExport = '*'

# Aliases to export from this module
AliasesToExport = '*'

# List of all modules packaged with this module
ModuleList = @(@{ModuleName = 'PSMySQL'; ModuleVersion = '1.0'; GUID = 'c3daaae5-0b43-4990-b650-098caceef24d'})

# List of all files packaged with this module
FileList = 'PSMySQL.psm1', 'PSMySQL.psd1'

# Private data to pass to the module specified in ModuleToProcess
PrivateData = ''

}

