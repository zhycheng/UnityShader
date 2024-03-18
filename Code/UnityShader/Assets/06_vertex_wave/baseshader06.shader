// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

Shader "zyc/baseshader06"
{
    Properties
    {
          _R("daxiao",Range(0,10))      =1
          _PosX("daxiao",Range(-500,500))      =0
          _PosZ("daxiao",Range(-500,500))      =0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            uniform float startPos;
            uniform float width;
            float _R;
            float _PosX;
            float _PosZ;
            struct v2f
            {

                float4 vertex : POSITION;
                float4 color:COLOR;
            };

            v2f vert (appdata_full v)
            {
                


               float y=0.3*sin(-length(v.vertex.xz)*2+_Time.w)  ;
               float4 up=float4(v.vertex.x,y,v.vertex.z,v.vertex.w);

                v2f o;
                o.vertex = UnityObjectToClipPos(up);
                o.color=float4(up.y,up.y,1,1);
                return o;
            }

            fixed4 frag (v2f i) : COLOR
            {
                float4 c=i.color;
                return c;
            }
            ENDCG
        }
    }
}
