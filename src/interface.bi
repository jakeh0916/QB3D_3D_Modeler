$If INTERFACEBI = UNDEFINED Then
    Dim Shared keyDownRaw(1 To 128) As Integer
    Dim Shared keyPressRaw(1 To 128) As Integer
    Dim Shared inputTimer As Integer
    Dim Shared debugImage&
    $Let INTERFACEBI = DEFINED
$End If
