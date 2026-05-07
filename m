Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FEA33B949
	for <linux-tegra@vger.kernel.org>; Thu,  7 May 2026 06:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778135027; cv=none; b=fFszO95uD1Y6y3VNiwoNJaFZ04Rkr+ft4cMFH7/sXs0kOl9W9NQ9vvax5rgLqVQCw7K5xiWNKBnoMs2x1Qz9oNlm4m2BPZprXSJI1YjN2NLL/rfQBZQ8vjKFHvbd4VKWTtFvx5UjMvWeO9Le0OvQySh5eB+Z0MEmqWkUG9hiEkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778135027; c=relaxed/simple;
	bh=UgfBCZ1rMfVTJev0k1z1NyPZBVmzJ4hpyWJ3luahNzI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Oea45vynBlhoXnW20z45S8JSwO7oTUQYF+8IAaKLuoKN2f0nR/TfZod2hQ15LjUeK+/5naVE81k1xX86KVD2vi+6v3aQmp64xbixrgCCQ45GaFdq4eiU6ne6aHMtmmOKP66pcih+9AzS16vdjo0i0Qo1JwYiNUcHEpV7k/aYgdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S+GcArRV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L17CyGdX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S+GcArRV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L17CyGdX"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6473eVFv026485
	for <linux-tegra@vger.kernel.org>; Thu, 7 May 2026 06:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9rNAGIYUfdj
	1piWxOjlP8LFzd1d7wyZuV9JLCGPlDQ4=; b=S+GcArRVddDimIfm0VImbZsU8Jh
	BojGaEBTeO+nt1ue0Qo77p3y/UgonoABpbOevp9/nGuz9PW3MF8YD5gHhF3zl6D3
	hTbt6hN3PiAxkOddtM0HDKwxg/OVlFgQ3y+zFUoo+Ir757YYz0cSM3HdaX+Dc4g8
	JPOhe9WYHuv+8ys5rhJJS4AvMG1Nt/DiWN7ecMTuA8YRyDgBD+vIs10wF+mKJfPE
	sLqluSCWDcs9MXVlPhRwAWBCNFi0RtdqP0G5c3astwdk6iv7GGOBmCSmzCNXz636
	djZKA2peeZvhaK0RSj0lQgIs5gf5KcijeJQx9NmYIQFMRCOiydiW/FDeRsQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0k1t0fqp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Thu, 07 May 2026 06:23:44 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-835417ba8c8so275912b3a.0
        for <linux-tegra@vger.kernel.org>; Wed, 06 May 2026 23:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778135023; x=1778739823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rNAGIYUfdj1piWxOjlP8LFzd1d7wyZuV9JLCGPlDQ4=;
        b=L17CyGdXl5oALRBZio+6gdnW45ltkjie6m1tAsCSlJeGR7AmzU4zLK7jwr0VxzldWB
         Vbh6CDDLRTb35mirlagpmKganSckExNvg+Ytj4DkRwMxPiHJpPk7js+zMNOAN5ISGs0J
         fIP7UM8UmfFKHj1X41PRSmp/2gPrmreGWBh8bx3K7+bhJAZiS8cWXpEdkKD8Hw+bL+7U
         tP57DKydrQdrw9smTID9dHkxhWu835mCYmm5b8ZrZnrCa8wIkt2G2od3MhrDtEtmsXj1
         Sl5vcFC6ztND+zLlzArqTB3UQ3WmY38USmfYoBXrpPZ172FE8pS53Hd4ntZ0o6EXfPP1
         /2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778135023; x=1778739823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9rNAGIYUfdj1piWxOjlP8LFzd1d7wyZuV9JLCGPlDQ4=;
        b=TNfXs7B7CuVFxlE1f4EQwHva6I7J0hskdmv/zIsJYn4j5nbbQRY6HE7vhcEKjWGv+A
         U/i16RN0wgKDvAivpHD7aBUWr91utb3PLevq14LmVD0oheFyRYejhiGcg7fhmDyLW5Lr
         TdZwz0DpqfmfnGIf09XmKiWbX1kD8B+s20z9vLArcatCEJTVAr3BejpSYHAhudn+xe6s
         Pg08S4dNK5ulp+/1SsoQJ8hKxGOs/TGWFYg9qY7VkR7tYPb3TaMT29fsgmZJZMlBkA1B
         iqRZw/O1+rWoTYLstkaFNc85Z036xiIQZhDXykDdFuymZOvFYQUmDyKD3BiWFH83PgZV
         xT6g==
X-Forwarded-Encrypted: i=1; AFNElJ+et3+wNyWBspIc6EeDv+J9ms4+0rVB3b8+9P0/91k9infJMf3Iz2mYfWkodOE0vuf+30/nzXif8xMJ9w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1XLRLQyulazpfo7Jr06G+ypmQ6QH0RzZu6k7UoKq42degby8L
	M89q8uRO3qMCvIzz0HQUL35EKh8n57qWdwhXaAHqIDODdVmvYBStWc1+sjS3njHNKypUY7T1je/
	5go9jcyuC8ADK60wyQBiq21M5kwNybtHbTbHguCkOpAIp5I4v41zEtgwo5ccgYe5obQ==
X-Gm-Gg: AeBDievTKpIfGInZLhyy2J6gyMcGXuKIqM+dMamNtlTvFZsCw/Ava5dR4fXb6xliF5Q
	y3tHAHTqzwcc3eg3jLCKzffGWGCRLFiqYnir9Bv6+WwS+tO10P9+10hzEhqHz0X2qmkdouSHtRZ
	GrlKIUQBFt7a+Zw4+lk43o8KDT7jUpDfyRkZRlfgUzmDoW2Ni8hd7l8Yk3i4H3hcdcAPSOCEqhi
	6BdNPiy2Fn9OLLSdLgXEXiNixWh/kaqA/AwkGfzx3CagFLjaFMU0RC6YNrGDm3ZNe8dGOxCdQJq
	bYi2PGzqVRPdTwB0nRT0YOgUdkX+z9G9psa7w6/927kL52q/UslMFyKqlqhretuxVZRZwEbyCTi
	+4HAaYw8ihngmX5FL6+1b4rGI7VEmuquzBF5VH00rAY78BgPGFZLGNZlH2i9sy/t2IrEuWrtygE
	+5935XBiIHQXG0ZehFN11+ygOBQCZoCsMznXFB0Xq5O6eZVynH6u7zJtLHwQ==
X-Received: by 2002:a05:6a00:460e:b0:82a:7dfd:9757 with SMTP id d2e1a72fcca58-83a5b2d3078mr6499157b3a.4.1778135023524;
        Wed, 06 May 2026 23:23:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:460e:b0:82a:7dfd:9757 with SMTP id d2e1a72fcca58-83a5b2d3078mr6499131b3a.4.1778135023021;
        Wed, 06 May 2026 23:23:43 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965945101sm7346557b3a.13.2026.05.06.23.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 23:23:42 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: cristian.marussi@arm.com, sudeep.holla@kernel.org, cw00.choi@samsung.com,
        kyungmin.park@samsung.com, myungjoo.ham@samsung.com,
        konradybcio@kernel.org, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-pm@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        jonathanh@nvidia.com, thierry.reding@kernel.org, digetx@gmail.com,
        conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Subject: [RFC V6 8/8] arm64: dts: qcom: hamoa: Enable LLCC/DDR/DDR_QOS dvfs
Date: Thu,  7 May 2026 11:52:37 +0530
Message-Id: <20260507062237.78051-9-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260507062237.78051-1-sibi.sankar@oss.qualcomm.com>
References: <20260507062237.78051-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EoPiaycA c=1 sm=1 tr=0 ts=69fc2ff0 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=gKi3Cb3mJvt5RuhTHbAA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: tk_ZzFTfobZuIqkJlVvq9S0oC4vpY0Ej
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDA2MCBTYWx0ZWRfXw2MmXT1cscwF
 ywDbwsnLZQCi+EL4jx+7fUYQkXzsRmIaNesQRG+KHUhn8FMZMbXJXqJn3tsoOVoo4r8P6HMl+bG
 xRMg7J1LU1CQuTsZvU87toiVfRP0YKwgN7i/b6yc6pRiHhLlEp2xdNLk8CXA8aTmbo1MMIPYqdH
 x1SS9S3K+VR3IsNe5Q8iPAAKzmUeddt84hrjJUDe5eSeiULMFhDqTSDzyw820HFaFH9/SIi7Vxg
 8PmSTUazEO9xi9iXw5ix4OxFh+vO4cqlfWl1zR+/IR3G9nKmA+7aUp2120euZ8TKSztVsIAHoEZ
 EGEBL9PtrUH6049YWbcZP1ZPcpy6bqF3ghMEiz/rqNa+dwmStRMiZxqINaHoZk6w/8VbeDTBYX7
 K2WcFCUTPPwiIQSjIOfu7d9nKRPebLp7zD5d70H3nJXzxvf2qqIqAWJRYK0Uxiyz+ko/rFnkhcg
 doGioZpDLAHV/A2rCCQ==
X-Proofpoint-GUID: tk_ZzFTfobZuIqkJlVvq9S0oC4vpY0Ej
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070060

On Qualcomm Hamoa SoCs, the memlat governor and the mechanism
to control the LLCC and DDR/DDR_QOS is hosted on the CPU Control
Processor (CPUCP). Enable the nodes required to get QCOM SCMI
Generic Extension protocol to probe on Hamoa and Purwa SoCs.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 051dee076416..a2d5c9db984d 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -338,6 +338,10 @@ scmi_dvfs: protocol@13 {
 				reg = <0x13>;
 				#power-domain-cells = <1>;
 			};
+
+			scmi_vendor: protocol@80 {
+				reg = <0x80>;
+			};
 		};
 	};
 
-- 
2.34.1

