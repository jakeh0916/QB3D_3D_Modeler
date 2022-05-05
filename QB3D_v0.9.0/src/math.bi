$If MATHBI = UNDEFINED Then
    Const TRUE = -1
    Const FALSE = 0
    Const PI = 3.141592653589793

    Type vec2
        u As Single
        v As Single
    End Type

    Dim Shared VEC2_DEFAULT As vec2
    VEC2_DEFAULT.u = 0.0
    VEC2_DEFAULT.v = 0.0

    Type vec2_ui
        u As _Unsigned Integer
        v As _Unsigned Integer
    End Type

    Dim Shared VEC2_UI_DEFAULT As vec2_ui
    VEC2_UI_DEFAULT.u = 0
    VEC2_UI_DEFAULT.v = 0

    Type vec3
        x As Single
        y As Single
        z As Single
    End Type

    Dim Shared VEC3_DEFAULT As vec3
    VEC3_DEFAULT.x = 0.0
    VEC3_DEFAULT.y = 0.0
    VEC3_DEFAULT.z = 0.0
    Dim Shared VEC3_ONE As vec3
    VEC3_ONE.x = 1.0
    VEC3_ONE.y = 1.0
    VEC3_ONE.z = 1.0
    Dim Shared VEC3_FORWARD As vec3
    VEC3_FORWARD.x = 0.0
    VEC3_FORWARD.y = 0.0
    VEC3_FORWARD.z = 1.0
    Dim Shared VEC3_UP As vec3
    VEC3_UP.x = 0.0
    VEC3_UP.y = 1.0
    VEC3_UP.z = 0.0
    Dim Shared VEC3_RIGHT As vec3
    VEC3_RIGHT.x = 1.0
    VEC3_RIGHT.y = 0.0
    VEC3_RIGHT.z = 0.0

    Type tri
        v0 As vec3
        v1 As vec3
        v2 As vec3
        vn As vec3

        texPointer As Integer
        t0 As vec2
        t1 As vec2
        t2 As vec2
    End Type

    Dim Shared TRI_DEFAULT As tri
    TRI_DEFAULT.v0 = VEC3_DEFAULT
    TRI_DEFAULT.v1 = VEC3_DEFAULT
    TRI_DEFAULT.v2 = VEC3_DEFAULT
    TRI_DEFAULT.vn = VEC3_DEFAULT
    TRI_DEFAULT.texPointer = -1
    TRI_DEFAULT.t0 = VEC2_DEFAULT
    TRI_DEFAULT.t1 = VEC2_DEFAULT
    TRI_DEFAULT.t2 = VEC2_DEFAULT

    Type mat4
        m00 As Single: m01 As Single: m02 As Single: m03 As Single
        m10 As Single: m11 As Single: m12 As Single: m13 As Single
        m20 As Single: m21 As Single: m22 As Single: m23 As Single
        m30 As Single: m31 As Single: m32 As Single: m33 As Single
    End Type

    Dim Shared MAT4_DEFAULT As mat4
    MAT4_DEFAULT.m00 = 0.0: MAT4_DEFAULT.m01 = 0.0: MAT4_DEFAULT.m02 = 0.0: MAT4_DEFAULT.m03 = 0.0
    MAT4_DEFAULT.m10 = 0.0: MAT4_DEFAULT.m11 = 0.0: MAT4_DEFAULT.m12 = 0.0: MAT4_DEFAULT.m13 = 0.0
    MAT4_DEFAULT.m20 = 0.0: MAT4_DEFAULT.m21 = 0.0: MAT4_DEFAULT.m22 = 0.0: MAT4_DEFAULT.m23 = 0.0
    MAT4_DEFAULT.m30 = 0.0: MAT4_DEFAULT.m31 = 0.0: MAT4_DEFAULT.m32 = 0.0: MAT4_DEFAULT.m33 = 0.0
    Dim Shared MAT4_IDENTITY As mat4
    MAT4_IDENTITY.m00 = 1.0: MAT4_IDENTITY.m01 = 0.0: MAT4_IDENTITY.m02 = 0.0: MAT4_IDENTITY.m03 = 0.0
    MAT4_IDENTITY.m10 = 0.0: MAT4_IDENTITY.m11 = 1.0: MAT4_IDENTITY.m12 = 0.0: MAT4_IDENTITY.m13 = 0.0
    MAT4_IDENTITY.m20 = 0.0: MAT4_IDENTITY.m21 = 0.0: MAT4_IDENTITY.m22 = 1.0: MAT4_IDENTITY.m23 = 0.0
    MAT4_IDENTITY.m30 = 0.0: MAT4_IDENTITY.m31 = 0.0: MAT4_IDENTITY.m32 = 0.0: MAT4_IDENTITY.m33 = 1.0

    $Let MATHBI = DEFINED
$End If
