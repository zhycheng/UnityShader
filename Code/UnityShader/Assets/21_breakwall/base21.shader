// Upgrade NOTE: replaced tex2D unity_Lightmap with UNITY_SAMPLE_TEX2D

// Upgrade NOTE: replaced tex2D unity_Lightmap with UNITY_SAMPLE_TEX2D

// Upgrade NOTE: commented out 'float4 unity_LightmapST', a built-in variable
// Upgrade NOTE: commented out 'sampler2D unity_Lightmap', a built-in variable

// Upgrade NOTE: commented out 'float4 unity_LightmapST', a built-in variable
// Upgrade NOTE: commented out 'sampler2D unity_Lightmap', a built-in variable

Shader "zyc/base21"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _R("R",Range(1,10))=0.01
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {

            ZTest Greater
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            float _R;

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
              
                return o;
            }

            float4 frag (v2f i) : COLOR
            {
                float4 col=float4(0.5,0,0.5,0.5);
                return col;
            }
            ENDCG
        }
         Pass
        {
             ZTest less

            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            float _R;

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
              
                return o;
            }

            float4 frag (v2f i) : COLOR
            {
                float4 col=float4(0.5,0,0,1);
                return col;
            }
            ENDCG
        }
    }
}
