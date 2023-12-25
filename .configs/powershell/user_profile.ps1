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

# # Starship prompt

Invoke-Expression (&starship init powershell)
Invoke-Expression (& { (zoxide init powershell | Out-String) })
