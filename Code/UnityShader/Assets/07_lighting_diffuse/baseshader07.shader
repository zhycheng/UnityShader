// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

Shader "zyc/baseshader07"
{
    Properties
    {
        
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
            struct v2f
            {

                float4 vertex : POSITION;
                float4 color:COLOR;
            };

            v2f vert (appdata_full v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                float3 N=v.normal;
                N=mul(float4(N,0),unity_WorldToObject).xyz;
                //N=mul(unity_ObjectToWorld,float4(N,0)).xyz;
                N=normalize(N);
                float3 L=normalize(_WorldSpaceLightPos0);
                float ndotl=saturate(dot(N,L));

                o.color=v.color*(UNITY_LIGHTMODEL_AMBIENT+ndotl*_LightColor0);
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
