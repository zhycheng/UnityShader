// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

Shader "zyc/baseshader09"
{
    Properties
    {
       _shininess("Shininess",Range(1,30))=4
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100
        Pass
        {
            Tags{"LightMode"="ForwardBase"}
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            int _shininess;
            struct v2f
            {

                float4 vertex : POSITION;
                float4 color:COLOR;
            };

            v2f vert (appdata_full v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                float4 wpos=mul(unity_ObjectToWorld,v.vertex);

                float3 N=v.normal;
                //N=mul(float4(N,0),unity_WorldToObject).xyz;
                //N=mul(unity_ObjectToWorld,float4(N,0)).xyz;
                N=UnityObjectToWorldNormal(N);
                N=normalize(N);
                float3 L=normalize(_WorldSpaceLightPos0);
                float ndotl=saturate(dot(N,L));
                //o.color=(UNITY_LIGHTMODEL_AMBIENT+ndotl*_LightColor0);
                //specular
                float3 I=normalize(wpos.xyz-_WorldSpaceLightPos0.xyz);
                float3 V=normalize(_WorldSpaceCameraPos.xyz-wpos.xyz);
                float3 R=normalize(reflect(I,N));

                 float3 II=normalize(-WorldSpaceLightDir(v.vertex));
                 float VV=normalize (WorldSpaceViewDir(v.vertex));
                 float RR   =normalize(reflect(II,N));

                float specularLight=pow(saturate(dot(RR,VV)),_shininess);
                o.color.rgb=    _LightColor0* specularLight;

                //µ„π‚‘¥
                
                //o.color.rgb+=Shade4PointLights(unity_4LightPosX0,unity_4LightPosY0,unity_4LightPosZ0,
                //unity_LightColor[0].rgb,    unity_LightColor[1].rgb,     unity_LightColor[2].rgb,unity_LightColor[3].rgb,
                //unity_4LightAtten0  ,  wpos.xyz,N );
                

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
