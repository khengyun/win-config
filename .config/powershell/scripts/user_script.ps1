

# Shows navigable menu of all options when hitting Tab

Import-Module Terminal-Icons
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView

# Shows navigable menu of all options when hitting Tab

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

Set-PSReadLineOption -EditMode Emacs 
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'ctrl+d' -Function DeleteChar



# replace 'Ctrl+t' and 'Ctrl+r' with your preferred bindings:
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
Import-Module PSFzf






