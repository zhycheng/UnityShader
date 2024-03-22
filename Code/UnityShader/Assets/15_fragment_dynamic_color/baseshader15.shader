Shader "zyc/baseshader15"
    {
    Properties
    {
        _MainColor("MainColor",Color)=(1,1,1,1)
        _SecondColor("SecondColor",Color)=(1,0,0,1)
        _Center("Center",Range(-0.5,0.5))=0
        _R("R",Range(0,1))=0.5
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
            float4       _MainColor;
            float4       _SecondColor;
            float _Center;
            float _R;
            struct v2f
            {
                float4 pos : POSITION;
                float y:TEXTCOORD0;
            };


            v2f vert (appdata_base v)
            {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.y=v.vertex.y;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {


                float K=i.y-_Center;
                float V=2*K/_R;
                float FF=saturate(V/2+0.5);
                float4 col=lerp(_MainColor,_SecondColor,FF);
                return col;
            }
            ENDCG
        }
    }
}
