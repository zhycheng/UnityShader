Shader "zyc/baseshader02"
{

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
            uniform float4x4 mvp;
            struct v2f
            {

                float4 vertex : POSITION;
            };


            v2f vert (appdata_base v)
            {
                v2f o;
                o.vertex = mul(mvp,v.vertex);
                return o;
            }

            fixed4 frag (v2f i) : COLOR
            {
                return fixed4(1,1,0,1);
            }
            ENDCG
        }
    }
}
