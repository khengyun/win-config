[Width]
Measure=Calc
Formula=(#SkinWidth#)
Group=GroupMeasureRotate

[Height]
Measure=Calc
Formula=(#BarHeight#)
Group=GroupMeasureRotate

[AbsSinWidth]
Measure=Calc
Formula=(Abs(Sin(#Angle#*PI/180)*Width))
Group=GroupMeasureRotate

[AbsCosWidth]
Measure=Calc
Formula=(Abs(Cos(#Angle#*PI/180)*Width))
Group=GroupMeasureRotate

[AbsSinHeight]
Measure=Calc
Formula=(Abs(Sin(#Angle#*PI/180)*Height))
Group=GroupMeasureRotate

[AbsCosHeight]
Measure=Calc
Formula=(Abs(Cos(#Angle#*PI/180)*Height))
Group=GroupMeasureRotate

; The pivot point is always the top-left corner of the first meter
; The point of rotation (relative to the top-left corner of the skin window) is along the skin boundaries based on the angle
[MoveX]
Measure=Calc
IfCondition=(((#Angle# > 0) && (#Angle# <= 45)) || ((#Angle# > 270) && (#Angle# <= 315)))
IfTrueAction=[!SetOption MoveX Formula 0][!UpdateMeasure MoveX]
IfCondition2=(((#Angle# > 45) && (#Angle# <= 90)) || ((#Angle# > 315) && (#Angle# < 360)))
IfTrueAction2=[!SetOption MoveX Formula (AbsSinHeight)][!UpdateMeasure MoveX]
IfCondition3=(((#Angle# > 90) && (#Angle# <= 135)) || ((#Angle# > 180) && (#Angle# <= 225)))
IfTrueAction3=[!SetOption MoveX Formula (AbsSinHeight+AbsCosWidth)][!UpdateMeasure MoveX]
IfCondition4=(((#Angle# > 135) && (#Angle# <= 180)) || ((#Angle# > 225) && (#Angle# <= 270)))
IfTrueAction4=[!SetOption MoveX Formula (AbsCosWidth)][!UpdateMeasure MoveX]
DynamicVariables=1
Group=GroupMeasureRotate

[MoveY]
Measure=Calc
IfCondition=(((#Angle# > 0) && (#Angle# <= 45)) || ((#Angle# > 90) && (#Angle# <= 135)))
IfTrueAction=[!SetOption MoveY Formula (AbsSinWidth)][!UpdateMeasure MoveY]
IfCondition2=(((#Angle# > 45) && (#Angle# <= 90)) || ((#Angle# > 135) && (#Angle# <= 180)))
IfTrueAction2=[!SetOption MoveY Formula (AbsSinWidth+AbsCosHeight)][!UpdateMeasure MoveY]
IfCondition3=(((#Angle# > 180) && (#Angle# <= 225)) || ((#Angle# > 270) && (#Angle# <= 315)))
IfTrueAction3=[!SetOption MoveY Formula (AbsCosHeight)][!UpdateMeasure MoveY]
IfCondition4=(((#Angle# > 225) && (#Angle# <= 270)) || ((#Angle# > 315) && (#Angle# < 360)))
IfTrueAction4=[!SetOption MoveY Formula 0][!UpdateMeasure MoveY]
DynamicVariables=1
Group=GroupMeasureRotate

; 0 = X-axis, 1 = Y-axis
[NearestAxis]
Measure=Calc
Formula=((((#Angle# > 45) && (#Angle# <= 135)) || ((#Angle# > 225) && (#Angle# <= 315))) ? 1 : 0)
IfCondition=NearestAxis = 1
IfTrueAction=[!WriteKeyValue Variables NearestAxis "1" "#ROOTCONFIGPATH#\monstercat-visualizer\@Resources\Variables.ini"]
IfFalseAction=[!WriteKeyValue Variables NearestAxis "0" "#ROOTCONFIGPATH#\monstercat-visualizer\@Resources\Variables.ini"]
DynamicVariables=1
Group=GroupMeasureRotate

; Only antialias and set the matrix when the angle has changed
[CheckRotation]
Measure=Calc
Formula=(((#Angle# = 0) || (#Angle# = 360)) ? 0 : 1)
Group=GroupMeasureRotate

; Adjust rotation angle based on orientation
[Angle]
Measure=Calc
Formula=(NearestAxis = 0 ? #Angle# : (#Angle# + 90))
Group=GroupMeasureRotate

[Matrix]
Measure=String
String="(Cos([Angle]*PI/180));(-Sin([Angle]*PI/180));(Sin([Angle]*PI/180));(Cos([Angle]*PI/180));[MoveX];[MoveY]"
DynamicVariables=1
OnUpdateAction=
Group=GroupMeasureRotate

; Reveal the transformation by expanding the skin window through an invisible meter
[BoundingBox]
Meter=Image
W=([AbsCosWidth]+[AbsSinHeight])
H=([AbsSinWidth]+[AbsCosHeight])
DynamicVariables=1
