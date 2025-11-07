// ---- Created with 3Dmigoto v1.3.16 on Fri Nov 07 01:57:11 2025
Texture2D<float4> t0 : register(t0);

SamplerState s0_s : register(s0);

cbuffer cb1 : register(b1)
{
  float4 cb1[7];
}

cbuffer cb0 : register(b0)
{
  float4 cb0[162];
}




// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  float2 w2 : TEXCOORD2,
  out float4 o0 : SV_Target0)
{
  if (v0.x > 3535 && v0.y > 2125)
  {
      clip(-1);
  }
  else
  {
	  float4 r0,r1,r2,r3,r4;
	  uint4 bitmask, uiDest;
	  float4 fDest;

	  r0.xyzw = t0.Sample(s0_s, v2.xy).wxyz;
	  r0.y = cmp(w2.x < 1);
	  if (r0.y != 0) {
		r1.z = 1;
		r1.xy = float2(1,1) + -w2.xy;
		r2.xyzw = cb1[6].xyxy * r1.zyyz;
		r3.y = 1 + -w2.x;
		r3.x = 0;
		r2.xyzw = r2.xyzw * r3.yxxy + v2.xyxy;
		r3.xyzw = t0.Sample(s0_s, r2.xy).xyzw;
		r0.y = min(r3.w, r0.x);
		r1.xyzw = cb1[6].xyxy * r1.xxxx;
		r3.xyzw = r1.zwzw * float4(0.707199991,0.707199991,-0.707199991,0.707199991) + v2.xyxy;
		r4.xyzw = t0.Sample(s0_s, r3.xy).xyzw;
		r0.y = min(r4.w, r0.y);
		r2.xyzw = t0.Sample(s0_s, r2.zw).xyzw;
		r0.y = min(r2.w, r0.y);
		r2.xyzw = t0.Sample(s0_s, r3.zw).xyzw;
		r0.y = min(r2.w, r0.y);
		r2.xyzw = r1.zwzw * float4(-1,0,-0.707199991,-0.707199991) + v2.xyxy;
		r3.xyzw = t0.Sample(s0_s, r2.xy).xyzw;
		r0.y = min(r3.w, r0.y);
		r2.xyzw = t0.Sample(s0_s, r2.zw).xyzw;
		r0.y = min(r2.w, r0.y);
		r1.xyzw = r1.xyzw * float4(0,-1,0.707199991,-0.707199991) + v2.xyxy;
		r2.xyzw = t0.Sample(s0_s, r1.xy).xyzw;
		r0.y = min(r2.w, r0.y);
		r1.xyzw = t0.Sample(s0_s, r1.zw).xyzw;
		r0.x = min(r1.w, r0.y);
	  }
	  r0.y = 1 + -w2.y;
	  r0.y = 1 / r0.y;
	  r0.x = log2(r0.x);
	  r0.x = r0.y * r0.x;
	  r0.x = exp2(r0.x);
	  r0.x = v1.w * r0.x;
	  r0.y = cmp(0 < r0.x);
	  r0.z = dot(v1.xyz, float3(0.212672904,0.715152204,0.0721750036));
	  r0.w = 1 + -cb0[161].x;
	  r0.z = r0.z * r0.w + cb0[161].x;
	  r0.x = log2(r0.x);
	  r0.x = r0.z * r0.x;
	  r0.x = exp2(r0.x);
	  o0.w = r0.y ? r0.x : 0;
	  o0.xyz = v1.xyz;
	  return;
  }
}