# Alias
Set-Alias vim nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Icons
Import-Module -Name Terminal-Icons

# oh-my-posh
oh-my-posh --init --shell pwsh --config ~\AppData\Local\Programs\oh-my-posh\themes\tonybaloney.omp.json | Invoke-Expression

# Utilities
function which ($command) {
	Get-Command -Name $command -ErrorAction SilentlyContinue |
	   Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}


# Split Terminal
function ide {
  # Get the PID (process ID) of what is presumed to be the most
  # recently active window, if any.
  $existingPid = (Get-Process -ErrorAction Ignore WindowsTerminal | Select-Object -Last 1).Id

  # -w 0 targets the most recently active window, if any.
  wt.exe -w 0 pwsh `; split-pane -H -s 0.2 pwsh `; split-pane -V -s 0.66 pwsh `; split-pane -V -s 0.5 pwsh `; ft 0

   # If a preexisting window was targeted, it must now be activated explicitly.
  if ($existingPid) { 
      (New-Object -ComObject WScript.Shell).AppActivate($existingPid)
  }
}

# Unzip
function unzip ($file) {
    Write-Output("Extracting", $file, "to", $pwd)
    $fullFile = Get-ChildItem -Path $pwd -Filter $file | ForEach-Object { $_.FullName }
    Expand-Archive -Path $fullFile -DestinationPath $pwd
}

# Git Shortcuts
function gs { git status }

function ga { git add . }

function gc { param($m) git commit -m "$m" }

function gp { git push }

function gcom {
    git add .
    git commit -m "$args"
}
function lazyg {
    git add .
    git commit -m "$args"
    git push
}

# Starship prompt
Invoke-Expression (&starship init powershell)

# Zoxide
Invoke-Expression (& { (zoxide init powershell | Out-String) })

