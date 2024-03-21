Shader "zyc/bloom14"
    {
    Properties
    {
        _Change("Change",int)=0
        _sh("shininess",Range(1,20))=4
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

              int _Change;
                int _sh;
            struct v2f
            {
                float4 pos : POSITION;
                float3 normal:TEXTCOORD0;
                float4 vertex:TEXTCOORD1;
            };


            v2f vert (appdata_base v)
            {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.vertex=v.vertex;
                o.normal=v.normal;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {

                float3 N=UnityObjectToWorldNormal(i.normal);
                float3 V=normalize(WorldSpaceViewDir(i.vertex));
                if(_Change==0)
                {
                    N=normalize(mul(i.normal,(float3x3)unity_WorldToObject));
                    float wpos=mul(unity_ObjectToWorld,i.vertex);
                    V=normalize(_WorldSpaceCameraPos.xyz-wpos);
                   
                }
               float bright=pow(1.0-saturate(dot(N,V)),_sh);

                fixed4 col = fixed4(1,1,1,1)*bright;
                return col;
            }
            ENDCG
        }
    }
}
