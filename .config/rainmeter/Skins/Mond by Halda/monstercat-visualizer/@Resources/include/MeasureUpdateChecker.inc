; https://api.github.com/repos/marcopixel/Monstercat-Visualizer/releases/latest

; Measure SetMediaPlayer - sets the media player and changes the MPMode variable to load the proper measures
[MeasureSetMediaPlayer]
Measure=String
String=#PlayerName#
IfMatch=GPMDP
IfMatchAction=[!WriteKeyValue Variables MPMode GPMDP "#ROOTCONFIGPATH#\monstercat-visualizer\@Resources\variables.ini"][!DisableMeasure MeasureGenre]
IfMatch2=Web
IfMatchAction2=[!WriteKeyValue Variables MPMode Web "#ROOTCONFIGPATH#\monstercat-visualizer\@Resources\variables.ini"][!DisableMeasure MeasureGenre]
IfNotMatchAction=[!WriteKeyValue Variables MPMode NowPlaying "#ROOTCONFIGPATH#\monstercat-visualizer\@Resources\variables.ini"][!EnableMeasure MeasureGenre]
UpdateDivider=-1

[MeasureWebParser]
Measure=WebParser
URL=https://github.com/MarcoPixel/Monstercat-Visualizer/releases/latest
RegExp=(?siU)"/MarcoPixel/Monstercat-Visualizer/releases/tag/(.*)"
FinishAction=[!EnableMeasure MeasureLatestVersion][!PauseMeasure MeasureWebParser][!PauseMeasure MeasureCurrentVersion]
Disabled=#DisableUpdateNag#

[MeasureCurrentVersion]
Measure=String
String=#Version#
UpdateDivider=-1
Disabled=#DisableUpdateNag#

[MeasureLatestVersion]
Measure=Plugin
Plugin=WebParser
URL=[MeasureWebParser]
StringIndex=1
IfMatch=[MeasureCurrentVersion:EscapeRegExp]
IfMatchAction=[!PauseMeasure MeasureLatestVersion][!WriteKeyValue Variables LatestVersion [MeasureLatestVersion] "#ROOTCONFIGPATH#\monstercat-visualizer\@Resources\Variables.ini"][!DeactivateConfig "#ROOTCONFIG#\monstercat-visualizer\settings\misc\update" "UpdateInfo.ini"]
IfNotMatchAction=[!Log "Update avaliable, please download the newest version!"][!PauseMeasure MeasureLatestVersion][!WriteKeyValue Variables LatestVersion [MeasureLatestVersion] "#ROOTCONFIGPATH#\monstercat-visualizer\@Resources\Variables.ini"][!ActivateConfig "#ROOTCONFIG#\monstercat-visualizer\settings\misc\update" "UpdateInfo.ini"]
DynamicVariables=1
Disabled=1