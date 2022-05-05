$If MATHBI = UNDEFINED Then
    '$INCLUDE:'math.bi'
$End If

$If OBJECTBI = UNDEFINED Then
    Type texture
        source As String * 32
        texHandle As Long
    End Type

    Dim Shared TEXTURE_DEFAULT As texture
    TEXTURE_DEFAULT.source = ""
    TEXTURE_DEFAULT.texHandle = -1

    Type game_object
        exists As Integer
        visible As Integer

        ' transform
        position As vec3
        velocity As vec3
        scale As vec3
        rotation As vec3

        ' script
        scriptID As Integer

        ' visual
        meshPointer As vec2_ui ' -> mesh handler
    End Type

    Dim Shared GAME_OBJECT_DEFAULT As game_object
    GAME_OBJECT_DEFAULT.exists = FALSE
    GAME_OBJECT_DEFAULT.visible = FALSE
    GAME_OBJECT_DEFAULT.position = VEC3_DEFAULT
    GAME_OBJECT_DEFAULT.velocity = VEC3_DEFAULT
    GAME_OBJECT_DEFAULT.scale = VEC3_ONE
    GAME_OBJECT_DEFAULT.rotation = VEC3_DEFAULT
    GAME_OBJECT_DEFAULT.scriptID = 0
    GAME_OBJECT_DEFAULT.meshPointer = VEC2_UI_DEFAULT

    Type controller
        position As vec3
        velocity As vec3

        ' camera
        cameraOffset As vec3
        look As vec3
        lookUp As vec3
        viewMat As mat4
    End Type

    Dim Shared CONTROLLER_DEFAULT As controller
    CONTROLLER_DEFAULT.position = VEC3_FORWARD
    CONTROLLER_DEFAULT.velocity = VEC3_DEFAULT
    CONTROLLER_DEFAULT.cameraOffset = VEC3_DEFAULT
    CONTROLLER_DEFAULT.look = VEC3_DEFAULT
    CONTROLLER_DEFAULT.lookUp = VEC3_DEFAULT
    CONTROLLER_DEFAULT.viewMat = MAT4_DEFAULT

    Const TRI_MAX_COUNT = 100000
    Dim Shared meshHandler(1 To TRI_MAX_COUNT - 1) As tri
    Dim Shared meshPosition As _Unsigned Integer

    Const TEX_MAX_COUNT = 64
    Dim Shared textureHandler(1 To TEX_MAX_COUNT - 1) As texture

    Const OBJ_MAX_COUNT = 10000
    Dim Shared gameObjectHandler(1 To OBJ_MAX_COUNT - 1) As game_object

    Dim Shared player As controller
    player = CONTROLLER_DEFAULT

    $Let OBJECTBI = DEFINED
$End If
