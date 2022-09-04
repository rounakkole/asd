**Synopsis**  
  Compile and execute various programs from powershell.  
  
**Description**  
  If installed, compile and execute java/c/cpp/python etc. programs from powershell.  
  
**Parameter Name**  
  Name of file within present working directory which is to be compiled and executed.   
  Name should be without extension and can be case insensitive.  
  
**Example**  
   _compile and execute given file_  
   ```Asd -Name filename```  
   ```Asd filename```  
  
**Example**  
   _show all files in present working directory_  
   ```Asd .```  
   ```Asd```  
  
  
**powershell commands for importing Asd module**  
_copy Asd.psm1 file into C:\Users\<username>\Documents\WindowsPowerShell\Modules\Asd_  
	```Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser```  
	```cd C:\Users\<username>\Documents\WindowsPowerShell\Modules\Asd```  
	```Import-Module -Name .\Asd.psm1```  
  
**undo execution policy**  
	```set-ExecutionPolicy Restricted -Scope CurrentUser```  
	```Get-ExecutionPolicy```  
  
**reference**  
	[Repository](https://www.github.com/rounakkole/asd)   
	[License](https://choosealicense.com/licenses/mit)  
