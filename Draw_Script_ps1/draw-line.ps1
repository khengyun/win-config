function global:draw-line([int]$x, [int]$y, [int]$length,[int]$vertical){ 
# Move to assigned X/Y position in Console 
set-ConsolePosition $x $y
# Draw the Beginning of the line
write-host “*” -nonewline 
# Is this vertically drawn?  Set direction variables and appropriate character to draw 
If ([boolean]$vertical) 
    { $linechar=“!”; $vert=1;$horz=0}
else
    { $linechar=“-“; $vert=0;$horz=1} 
# Draw the length of the line, moving in the appropriate direction 
    foreach ($count in 1..($length-1)) { 
        set-ConsolePosition (($horz*$count)+$x) (($vert*$count)+$y)
        write-host $linechar -nonewline
    }
# Bump up the counter and draw the end
$count++
    set-ConsolePosition (($horz*$count)+$x) (($vert*$count)+$y) 
write-host “*” -nonewline 
}
