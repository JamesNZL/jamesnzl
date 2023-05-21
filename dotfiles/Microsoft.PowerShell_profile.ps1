using namespace System.Management.Automation

### SSH autocompletion
Function Get-Hosts($configFile) {
    Get-Content $configFile `
    | Select-String -Pattern "^Host " `
    | ForEach-Object { $_ -replace "host ", "" } `
    | Sort-Object -Unique `
}

Register-ArgumentCompleter -CommandName ssh, scp, sftp -Native -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)

    $sshDir = "${Env:HOMEPATH}\.ssh"

    $hosts = Get-Content "$sshDir\config" `
    | Select-String -Pattern "^Include " `
    | ForEach-Object { $_ -replace "include ", "" } `
    | ForEach-Object { Get-Hosts "$sshDir/$_" } `

    $hosts += Get-Hosts "$sshDir\config"
    $hosts = $hosts | Sort-Object -Unique

    # For now just assume it's a hostname.
    $textToComplete = $wordToComplete
    $generateCompletionText = {
        param($x)
        $x
    }
    if ($wordToComplete -match "^(?<user>[-\w/\\]+)@(?<host>[-.\w]+)$") {
        $textToComplete = $Matches["host"]
        $generateCompletionText = {
            param($hostname)
            $Matches["user"] + "@" + $hostname
        }
    }

    $hosts `
    | Where-Object { $_ -like "${textToComplete}*" } `
    | ForEach-Object { [CompletionResult]::new((&$generateCompletionText($_)), $_, [CompletionResultType]::ParameterValue, $_) }
}

oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\jamesnzl.omp.json" | Invoke-Expression
# Import-Module -Name Terminal-Icons
