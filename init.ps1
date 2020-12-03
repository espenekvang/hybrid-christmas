param(
    [parameter(Mandatory=$false, Position=1)]
    [string] $Version   
)

function Initialize() {
    $script:ApiResourceGroup = "rg-hybrid-christmas"
    $script:ApiAppName = "app-hybrid-christmas-api"      
    $script:ApiProjectName = "Hybrid.Christmas.Api"     
    $script:Version = $Version
    $script:RootFolder = "$PSScriptRoot"    
    $script:ArtifactsFolder = "$RootFolder\artifacts"
    $script:BuildFolder = "$RootFolder\build"   
    
    Import-InvokeBuild

    EXIT 0
}

function Import-InvokeBuild() {
    $InvokeBuildVersion = "5.6.3"
    $InvokeBuildFolder = "$RootFolder\Invoke-Build.$InvokeBuildVersion"
    
    if (!(Test-Path $InvokeBuildFolder)) {
        & "$RootFolder\.nuget\nuget.exe" `
            "install" "Invoke-Build" `
            "-Version" $InvokeBuildVersion `
            "-Source" "https://api.nuget.org/v3/index.json" `
            "-OutputDirectory" "$RootFolder"
    }
    
    Import-Module $InvokeBuildFolder\tools\InvokeBuild.psd1
}

Initialize