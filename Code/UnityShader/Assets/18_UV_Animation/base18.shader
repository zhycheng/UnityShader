// Upgrade NOTE: replaced tex2D unity_Lightmap with UNITY_SAMPLE_TEX2D

// Upgrade NOTE: replaced tex2D unity_Lightmap with UNITY_SAMPLE_TEX2D

// Upgrade NOTE: commented out 'float4 unity_LightmapST', a built-in variable
// Upgrade NOTE: commented out 'sampler2D unity_Lightmap', a built-in variable

// Upgrade NOTE: commented out 'float4 unity_LightmapST', a built-in variable
// Upgrade NOTE: commented out 'sampler2D unity_Lightmap', a built-in variable

Shader "zyc/base18"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _Factor("Factor",Range(1,30))=5
        _R("R",Range(0,1))=0.5
        _A("A",Range(0,0.1))=0.01
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
            float _Factor;
            float _R;
            float _A;
             // sampler2D unity_Lightmap;
             // float4  unity_LightmapST;
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

            fixed4 frag (v2f i) : COLOR
            {

                //i.uv.x+=    0.01*sin(i.uv.x*3.14*_Factor+_Time.z)  ;
                //i.uv.y+=    0.01*sin(i.uv.y*3.14*_Factor+_Time.z)  ;

                  i.uv+=    0.01*sin(i.uv*3.14*_Factor+_Time.z)  ;


                float2 uv=i.uv;
                float dis=distance(uv,float2(0.5,0.5));
                float scale=0;
                //if(dis<_R)
                //{
                    _A*=saturate(1-dis/_R);
                     scale =  _A* sin(-dis*3.14*_Factor+_Time.y);
                     uv=uv+  scale*uv;
               // }


                fixed4 col = tex2D(_MainTex, uv)+float4(1,1,1,1)*saturate(scale)*100;
                return col;
            }
            ENDCG
        }
    }
}
