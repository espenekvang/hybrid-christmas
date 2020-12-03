task Clean {
    if (Test-Path $BuildFolder) {
        Get-ChildItem `
            -Path "$BuildFolder\*" `
            -Recurse | Remove-Item `
            -Force -Recurse
    Remove-Item "$BuildFolder\*" -Force
    }  

    if (Test-Path $ArtifactsFolder) {
        Get-ChildItem `
            -Path "$ArtifactsFolder\*" `
            -Recurse | Remove-Item `
            -Force -Recurse
        Remove-Item "$ArtifactsFolder\*" -Force
    }
    
    New-Item -ItemType Directory -Force -Path $ArtifactsFolder
}

task CopyFiles {
    Copy-Item -Path "$RootFolder\*.ps1" -Destination "$ArtifactsFolder\"    
    Copy-Item -Path "$RootFolder\.nuget\" -Recurse -Destination "$ArtifactsFolder\.nuget\"
}

task Build Clean, {    
    $projectFile = "src\$($ApiProjectName)\$($ApiProjectName).csproj"
    exec {dotnet publish $projectFile --output "$BuildFolder\$($ApiProjectName)"  --configuration="Release" /p:Version=$Version}        
}

task Artifacts Build, CopyFiles, { 
    Compress-Archive -Path "$BuildFolder\$($ApiProjectName)\*" -DestinationPath "$ArtifactsFolder\$($ApiProjectName).zip"
}

task Deploy Artifacts, {
    exec {az webapp deployment source config-zip --resource-group $ApiResourceGroup --name $ApiAppName --src "$ArtifactsFolder\$($ApiProjectName).zip" }
}