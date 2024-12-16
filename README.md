# Upload-Pixeldrain
Upload files with PowerShell to Pixeldrain

# Installation
1. **PowerShell 7+ is required:**  
```powershell
winget install Microsoft.PowerShell
```

2. Get your API Key from [this page](https://pixeldrain.com/user/api_keys) and create environment variable (Optional)
```powershell
setx PIXELDRAIN_API_KEY <YOUR KEY>
```
 
# Usage
```powershell
Upload-Pd -FilePath filename.txt -ApiKey <API_KEY>
```