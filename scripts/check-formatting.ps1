$excludeDirs = 'build', 'CMakeFiles' # Add more directories to exclude as needed
Get-ChildItem -Recurse -Include *.h, *.cpp | Where-Object {
    foreach ($dir in $excludeDirs) {
        if ($_.FullName -notlike "*\$dir*") {
            return $true
        }
    }
    return $false
} | ForEach-Object {
    $output = clang-format -style=file -output-replacements-xml $_.FullName
    if ($output -match "<replacement ") {
        Write-Output "Code formatting issues found in $($_.FullName)."
        $global:foundIssues = $true
    }
}

if ($global:foundIssues) {
    Write-Output "Please format your code using clang-format before submitting."
    exit 1
} else {
    Write-Output "No code formatting issues found."
}
