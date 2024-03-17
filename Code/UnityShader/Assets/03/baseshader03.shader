// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

Shader "zyc/baseshader03"
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
            struct v2f
            {

                float4 vertex : POSITION;
                float4 color:COLOR;
            };

            v2f vert (appdata_full v)
            {
                v2f o;

                //if(v.vertex.x>0)
                //    o.color=   float4(1,0,0,1);
                //else
                //    o.color=   float4(0,0,1,1);
                o.vertex = UnityObjectToClipPos(v.vertex);
               

               //if(v.vertex.x==0.5&&v.vertex.y==0.5&&v.vertex.z==-0.5)
               //{
               //      o.color=   float4(1,0,0,1);
               //}
               //else
               //{
               // o.color=   float4(0,0,1,1);
               //}


                //float4 worldPos=mul(unity_ObjectToWorld,v.vertex)   ;
                //if(worldPos.x>0)
                //  o.color=   float4(1,0,0,1);
                //else
                //     o.color=   float4(0,0,1,1);

               if(v.vertex.x==0.5&&v.vertex.y==0.5&&v.vertex.z==-0.5)
               {
                     o.color=   float4(_SinTime.w/2+0.5,_CosTime.z/2+0.5,cos(_Time.y)/2+0.5,1);
               }
               else
               {
                o.color=   float4(0,0,1,1);
               }

                return o;
            }

            fixed4 frag (v2f i) : COLOR
            {
                return i.color;
            }
            ENDCG
        }
    }
}
