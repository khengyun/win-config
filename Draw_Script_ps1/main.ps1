function global:draw-box ([int]$width, [int]$length, [int]$x, [int] $y) { 
# Do the four sides 
foreach ($box in 0..3) { 
     # Variable to flip whether we’re on the left / top of the box or not
     $side=$box%2 
     # Variable to switch whether it’s a vertical or horizontal line
     $vert=[int](($box-.5)/2) 
     # compute the Width and Length so we can “switch them”
     $totalside=$width+$length 
     # Length of line will be dependant on the Direction
     # (vertical or Horizontal)
     $linelength=($vert*$length)+([int](!$vert)*$width) 
     $result=$totalside-$linelength 
     # flip in the correct X Y coordinates for the maximum 
     $ypass=([int](!$vert)*$side*$result)+$y 
     $xpass=($vert*$side*$result)+$x 
     # Draw the line 
     draw-line $xpass $ypass $linelength $vert 
}
}
