Add-Type -AssemblyName System.Drawing

$filename = "$pwd\image.png" 
$bmp = new-object System.Drawing.Bitmap 250,61 
$font = new-object System.Drawing.Font Consolas,24 
$brushBg = [System.Drawing.Brushes]::Yellow 
$brushFg = [System.Drawing.Brushes]::Black 
$graphics = [System.Drawing.Graphics]::FromImage($bmp) 
$graphics.FillRectangle($brushBg,0,0,$bmp.Width,$bmp.Height) 
$graphics.DrawString('Hello World',$font,$brushFg,10,10) 
$graphics.Dispose() 
$bmp.Save($filename) 

Invoke-Item $filename
