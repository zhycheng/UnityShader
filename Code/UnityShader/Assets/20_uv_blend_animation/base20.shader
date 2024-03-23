// Upgrade NOTE: replaced tex2D unity_Lightmap with UNITY_SAMPLE_TEX2D

// Upgrade NOTE: replaced tex2D unity_Lightmap with UNITY_SAMPLE_TEX2D

// Upgrade NOTE: commented out 'float4 unity_LightmapST', a built-in variable
// Upgrade NOTE: commented out 'sampler2D unity_Lightmap', a built-in variable

// Upgrade NOTE: commented out 'float4 unity_LightmapST', a built-in variable
// Upgrade NOTE: commented out 'sampler2D unity_Lightmap', a built-in variable

Shader "zyc/base20"
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
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"
            sampler2D _MainTex;
            float _R;
            float4 _MainTex_ST;
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
                o.uv=TRANSFORM_TEX(o.uv,_MainTex);
                return o;
            }

            float4 frag (v2f i) : COLOR
            {
                float2 uv=i.uv;
                float offset_uv=0.05*sin(i.uv.x*_R+_Time.x*2);
                 uv+= offset_uv;
                float4 col1=tex2D(_MainTex,uv);
                uv=i.uv;
                uv-=offset_uv;
                float4 col2=tex2D(_MainTex,uv);
                return (col1+col2)/2;
            }
            ENDCG
        }
    }
}
