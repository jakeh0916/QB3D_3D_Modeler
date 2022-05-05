' QB3D - 3D Modeler
'   (Created in QB64 v1.5 x64)
'
' By JAKE HUSEMAN

' custom bi library files (constants, globals, & type definitions)
' $include:'math.bi'
' $include:'object.bi'
' $include:'engine.bi'
' $include:'interface.bi'

Call initialize
Call setup_scripts

' Loading
Locate 1, 1
Print "LOADING FILE...                                         "
Locate 2, 1
Print "(Please wait)                                           "
x = load_stage("csgo")

' UI vars
menu = 0
loginfo$ = spacetxt$("No Log Info.", 64)
filename$ = "csgo.stg         "
skipinp = 0.0
uihide = 0

Do
    _Display
    _Limit 144

    If lastTime > 0 Then
        deltaTime = Timer(0.001) - lastTime
        If deltaTime <= 0 Then deltaTime = 1 / MAXFPS
    Else deltaTime = 1 / MAXFPS
    End If
    lastTime = Timer(0.001)

    Call update_physics
    Call update_scripts
    Call update_render

    If skipinp > 0 Then
        clear_kb_flags
        skipinp = skipinp - deltaTime
        Locate 1, 1
        Print skipinp
    Else
        If get_key_press("h") Then
            hideui = Not hideui
            If hideui Then
                _DisplayOrder _Hardware
            Else
                _DisplayOrder _Hardware , _Software
            End If
        End If
        If get_key_press("esc") Then System
        If get_key_press("o") And Not uihide Then
            menu = 1
        End If
        If get_key_press("c") And Not uihide Then
            f = load_stage("null")
            loginfo$ = spacetxt$("Closed file.", 64)
            filename$ = "No FIle Loaded            "
        End If
    End If

    If Not uihide Then
        ' Title bar
        Locate 1, 1
        Print "QB3D - A 3D MODEL VIEWER FOR QBASIC 64                  "
        Locate 2, 1
        Print "[O] Open a stage file  [C] Close stage  [H] Toggle UI   "
        Locate 3, 1
        Print "                                                        "
        Locate 4, 1
        Print "                                                        "

        ' Controls
        Locate 1, 64
        Print " CONTROLS                     "
        Locate 2, 64
        Print " W, A, S, D   - Move around   "
        Locate 3, 64
        Print " Mouse        - Look around   "
        Locate 4, 64
        Print " Space/Shift  - Fly up/down   "
        Locate 5, 64
        Print " Escape       - Close program "

        ' Log
        Locate 43, 1
        Print "LOG: " + loginfo$

        ' Stage view
        Locate 1, 124
        Print spacetxt$("STAGE VIEW: " + filename$, 32)
        Locate 2, 124
        Print "Object ID : Mesh Info"
        For i = 1 To 10
            If gameObjectHandler(i).exists = TRUE Then
                Locate 3 + i, 124
                Print spacetxt$(Str$(i) + " -> " + Str$(gameObjectHandler(i).meshPointer.u) + ", " + Str$(gameObjectHandler(i).meshPointer.v), 32)
            Else
                Locate 3 + i, 124
                Print spacetxt$("...", 32)
            End If
        Next

        ' Open menu
        If menu = 1 Then
            ' Clear input buffer
            x$ = "key"
            Do Until Len(x$) = 0
                x$ = InKey$
            Loop

            Locate 1, 1
            Print "OPEN FILE                                               "
            Locate 2, 1
            Print "Please enter a file name:                               "
            Locate 3, 1
            Print "(Demo stages: Try 'csgo' or 'planets')                  "
            Locate 4, 1
            Input ">> ", addr$

            ' Loading
            Locate 1, 1
            Print "LOADING FILE...                                         "
            Locate 2, 1
            Print "(Please wait)                                           "
            Locate 3, 1
            Print "                                                        "
            Locate 4, 1
            Print "                                                        "

            load_stage_flag = load_stage(addr$)
            If load_stage_flag = 1 Then
                loginfo$ = spacetxt$("Invalid stage file! Please try another file.", 64)
            Else
                loginfo$ = spacetxt$("Loaded file: " + addr$, 64)
                filename$ = addr$
            End If
            menu = 0
            skipinp = 5.0
        End If
    End If
Loop

Function spacetxt$ (in$, num)
    needSpace = num - Len(in$)
    For i = 0 To needSpace
        in$ = in$ + " "
    Next
    spacetxt$ = in$
End Function

' custom bm library files (subs & functions)
'$include:'math.bm'
'$include:'object.bm'
'$include:'engine.bm'
'$include:'interface.bm'
'$include:'debug.bm'
