// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

Shader "zyc/baseshader04"
{
    Properties
    {
          _Value("daxiao",Range(0,200))      =0
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

               float _Value;
            struct v2f
            {

                float4 vertex : POSITION;
                float4 color:COLOR;
            };

            v2f vert (appdata_full v)
            {
                v2f o;

                o.vertex = UnityObjectToClipPos(v.vertex);
                o.color=v.color;
                return o;
            }

            fixed4 frag (v2f i) : COLOR
            {
                float4 c=i.color;
                float p=i.vertex.x/i.vertex.w;
                if(p>_Value&&p<_Value+5)
                {
                    c=float4(1,0,0,1);
                }
                else
                {
                      c=  i.color;
                }
                return c;
            }
            ENDCG
        }
    }
}
