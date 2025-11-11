# Get the target folder
param(
    [Parameter(Position=0)]
    [string]$Folder = "."
)

# Convert to absolute path
try {
    $FullPath = (Resolve-Path $Folder -ErrorAction Stop).Path
} catch {
    Write-Error "Error: Directory not found: $Folder"
    exit 1
}

# Check if VS Code is available
$codeCommand = Get-Command code -ErrorAction SilentlyContinue
if (-not $codeCommand) {
    Write-Error "Error: VS Code 'code' command not found."
    Write-Host "Please ensure VS Code is installed and the 'code' command is in your PATH." -ForegroundColor Red
    Write-Host "Install VS Code from: https://code.visualstudio.com/" -ForegroundColor Red
    exit 1
}

# Check for devcontainer
$HasDevContainer = (Test-Path "$FullPath\.devcontainer\devcontainer.json") -or
                   (Test-Path "$FullPath\.devcontainer.json")

if ($HasDevContainer) {
    Write-Host "📦 Dev container detected. Opening in container..." -ForegroundColor Green

    # Encode the path in hex
    $EncodedPath = [System.BitConverter]::ToString(
        [System.Text.Encoding]::UTF8.GetBytes($FullPath)
    ).Replace("-", "").ToLower()

    # Construct the VS Code remote URI
    $Uri = "vscode-remote://dev-container+$EncodedPath$FullPath"

    # Launch VS Code with the container URI
    & code --folder-uri $Uri
} else {
    Write-Host "📁 No dev container found. Opening normally..." -ForegroundColor Cyan
    & code $FullPath
}
