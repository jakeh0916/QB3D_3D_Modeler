$If MATHBI = UNDEFINED Then
    '$include:'math.bi'
$End If

$If ENGINEBI = UNDEFINED Then
    Const DWIDTH = 1280
    Const DHEIGHT = 720
    Const MAXFPS = 200
    Dim Shared deltaTime As Double
    Dim Shared lastTime As Double
    Dim Shared bgColor As vec3
    deltaTime = 0.0
    lastTime = -1.0
    $Let ENGINEBI = DEFINED
$End If
