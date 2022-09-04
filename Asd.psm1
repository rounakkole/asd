
<#
 .Synopsis
  Compile and execute various programs from powershell.

 .Description
  If installed compile and execute java/c/cpp/python etc. programs from powershell.
  github.com/rounakkole/asd/blob/main/README.md

 .Parameter Name
  Unique filename within the present working directory.
  Filename should be without extension and can be case insensitive.

 .Example
   #compile and execute given program file
   Asd -Name filename
   Asd filename

 .Example
   #show all files in present working directory
   Asd .
   Asd
#>


function Asd
{
    param( $Name )
    Clear-Host

    $isSingle = @(0)
    $isOpen = @(0)
    $folderPath = pwd
    $extIgnore = '*.class','*.exe','*.out','*.app','*.x86_64','*.o','*.obj','*.elf','*.slo','*.lo','*.log','*.jar','*.zip','*.rar','*.sh'
  
    ##$Input = Read-Host -Prompt 'filename'
    $fileName = "$Name.*"

    $found = Get-ChildItem -Exclude $extIgnore | Where {$_.Name -like $fileName} 
    $count = ($found).Count
    

    if ( $Open -eq $null ) 
    {
    $isOpen = @(1)
    }
    
    if ( $count -eq 1 ) 
    {
	$name = ((Split-Path $found -Leaf).Split('.'))[0]
	$ext = ((Split-Path $found -Leaf).Split('.'))[1]
	$isSingle = @(1)
    }
    elseif (( $Name -eq '.') -or ($Name -eq $null)) 
    {
	$output = get-childitem -Force $folderPath | where {!$_.PSIsContainer} | 
	select-object FullName, LastWriteTime, Length | Sort-Object FullName
	$output | Out-GridView -Title "File Name Search Results - $Input" 
    }
    elseif ( $count -eq 0 ) 
    {
	Write-Host "$Input file not found." 
    }
    elseif ( $count -lt 4 ) 
    {
	Write-Host "$count files found." 
    }
    


    if ($isSingle)
    {
        if ($isOpen)
        {
	        Start $found
	        $console = Read-Host -Prompt 'press enter '
        }

        if ($ext -eq 'java')
        {
            javac $found
            Write-Host "--------------------\" 
            java $name
            Write-Host "--------------------/" 
        }

        elseif ($ext -eq 'c')
        {
		gcc $found -o $name
		Write-Host "--------------------\" 
		./$RunName
		Write-Host "--------------------/" 
        }

        elseif ($ext -eq 'cpp')
        {
		g++ $found -o $name
		Write-Host "--------------------\" 
		./$RunName
		Write-Host "--------------------/" 
        }

        elseif ($ext -eq 'py')
        {
		Write-Host "--------------------\" 
		python $found
		Write-Host "--------------------/" 
        }

        elseif ($ext -eq 'txt')
        {
		Write-Host "--------------------\" 
		Cat $found
		Write-Host "--------------------/" 
        }

        else
        {
		Write-Host "$found can not be executed." 
        }
    }
}


##Export-ModuleMember -Function "Asd"
##github/rounakkole/asd/README.md
