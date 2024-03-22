// Upgrade NOTE: replaced tex2D unity_Lightmap with UNITY_SAMPLE_TEX2D

// Upgrade NOTE: replaced tex2D unity_Lightmap with UNITY_SAMPLE_TEX2D

// Upgrade NOTE: commented out 'float4 unity_LightmapST', a built-in variable
// Upgrade NOTE: commented out 'sampler2D unity_Lightmap', a built-in variable

// Upgrade NOTE: commented out 'float4 unity_LightmapST', a built-in variable
// Upgrade NOTE: commented out 'sampler2D unity_Lightmap', a built-in variable

Shader "zyc/base17"
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
             // sampler2D unity_Lightmap;
             // float4  unity_LightmapST;
            float4 _MainTex_ST;
            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
                float2 uv2: TEXCOORD1;
            };

            struct v2f
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
                float2 uv2 : TEXCOORD1;
            };


            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv=v.uv;
                o.uv=TRANSFORM_TEX(o.uv,_MainTex);
                o.uv2= v.uv2.xy*unity_LightmapST.xy+unity_LightmapST.zw;
                return o;
            }

            fixed4 frag (v2f i) : COLOR
            {

                float3 lm=DecodeLightmap(UNITY_SAMPLE_TEX2D(unity_Lightmap,i.uv2));
                fixed4 col = tex2D(_MainTex, i.uv);
                col.rgb*=   lm;
                return col;
            }
            ENDCG
        }
    }
}
