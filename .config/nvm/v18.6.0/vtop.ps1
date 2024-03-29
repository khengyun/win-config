#!/usr/bin/env pwsh
$basedir=Split-Path $MyInvocation.MyCommand.Definition -Parent

$exe=""
if ($PSVersionTable.PSVersion -lt "6.0" -or $IsWindows) {
  # Fix case when both the Windows and Linux builds of Node
  # are installed in the same directory
  $exe=".exe"
}
$ret=0
if (Test-Path "$basedir//bin/sh$exe") {
  # Support pipeline input
  if ($MyInvocation.ExpectingInput) {
    $input | & "$basedir//bin/sh$exe"  "$basedir/node_modules/vtop/bin/vtop.js" $args
  } else {
    & "$basedir//bin/sh$exe"  "$basedir/node_modules/vtop/bin/vtop.js" $args
  }
  $ret=$LASTEXITCODE
} else {
  # Support pipeline input
  if ($MyInvocation.ExpectingInput) {
    $input | & "/bin/sh$exe"  "$basedir/node_modules/vtop/bin/vtop.js" $args
  } else {
    & "/bin/sh$exe"  "$basedir/node_modules/vtop/bin/vtop.js" $args
  }
  $ret=$LASTEXITCODE
}
exit $ret
