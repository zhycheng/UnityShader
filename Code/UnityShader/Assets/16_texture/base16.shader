Shader "zyc/base16"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _tilingX("TilingX",float) =1
        _tilingY("TilingY",float) =1
        _offsetX("OffsetX",float) =1
        _offsetY("OffsetY",float) =1
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
            sampler2D _MainTex;
            float _tilingX;
            float _tilingY ;
            float _offsetX;
            float _offsetY;



            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };


            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv=v.uv;
                o.uv.x*= _tilingX;
                o.uv.y*= _tilingY;
                o.uv.x+=    _offsetX;
                o.uv.y+=    _offsetY;
                return o;
            }

            fixed4 frag (v2f i) : COLOR
            {
                fixed4 col = tex2D(_MainTex, i.uv);
                return col;
            }
            ENDCG
        }
    }
}
