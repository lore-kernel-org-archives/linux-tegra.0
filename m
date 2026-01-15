Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80045214A9B
	for <linux-tegra@vger.kernel.org>; Thu, 15 Jan 2026 18:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768502957; cv=none; b=iM+b+StRYMs7PdspnaZ+9PWUQs/9JIhkovQupD4WAQkS3SKtpZaM9TrBWNZwOu6p4DVnslK0Wm4iKd+EUVX2C0imGa5ECBop4KdcV9qjZo5Bi/kqJeY2MUog9VpocjMNSqWVSNnDPCtkkKdxFXHu7LmtawmQRe3JbN8o2zJvERE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768502957; c=relaxed/simple;
	bh=6YeryhmREc4dO0HCdpYe1JglCQ+CebAVk+iMczQuXkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jll8f6mD/UaHPTiYQuimsenFpvgepF3vyHIsREkVX1cFvH3CkOb6yq0RmGft2rAI5qzdViQAUPphaolAKjsJPgFALS12Uy8TzGHfPRX8Laj7OmVsjsQgqrA6nJg/m1u2LdDkil5sHmuRNHjL0Ht7iqu4j49JoZuYnv75quCEn54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XrDnAhi4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZB0Pu2G7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XrDnAhi4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZB0Pu2G7"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFfx1C2312041
	for <linux-tegra@vger.kernel.org>; Thu, 15 Jan 2026 18:49:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KbfQ2UAAVMB
	fP+nuZvR07sE4ywE55LLtOLcTY1Ujq2Y=; b=XrDnAhi4BQWtwDEvQSmUcqYquEJ
	jrXhXJYjPtfYWGXbwj/CsRzfYz0XTlw0x807ztQFi837FTFUsNXMiuNagn4IWwUy
	navWiXWEemF5BSj2uLblpOl1ie50OIS7HLYGYlpIvbyfKiyDhKWuF2PRYARXm8BH
	dz/V1Uy8jEhL5P2/hDES7NH+qxGmDNzpuU4M/n91VCCBxaOFK934kchS3r9Kh/4Z
	wa1zWYdOks9kiXMW8TzWzdXZpUGxGP8V+HWDD2ZD8LkVzGl7oEPeaj+5atMpYRAq
	fsfAL+N85qU5oopNc1ijGb+r7KzljMMotr9Mvo8p4K5IrCDSUCyWu+ULH+A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq340gnq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Thu, 15 Jan 2026 18:49:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52c67f65cso462194285a.1
        for <linux-tegra@vger.kernel.org>; Thu, 15 Jan 2026 10:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768502949; x=1769107749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KbfQ2UAAVMBfP+nuZvR07sE4ywE55LLtOLcTY1Ujq2Y=;
        b=ZB0Pu2G7Ml3G5YKhLJsWGn5DlqiItazYMSeQ327d30qG2HrzaaxSLF/W9HegcOThtM
         qxqrQuolk3mhHT6hl8fNiZ4z/mzvRDTF5/rWNfAiVB1K52N9V8al7M8KC+6aMkM8WUoq
         OK8jmu5mfMikYZXGPVoQ8iiNmNIM5P91iCy5ZuePQwW+vahH3g+b8RvKqPfZkuIp5Rdw
         EpkUAOC/Uwf+oaeQncXWG8zKfSahxB69ItPM5GW/d/u7o/UPlvFDet5midsW6MVdaLTD
         n0UE82HEfNUiJRFe19ztoOX9lGI/oEhwaEUzQetD6JLi8rCUNipaH0tULPTQnvT2BFat
         ZP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768502949; x=1769107749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KbfQ2UAAVMBfP+nuZvR07sE4ywE55LLtOLcTY1Ujq2Y=;
        b=HIoXxaU5QrFIB+7hrxC7lbtiORxsX8+3M9OJDdSI8ynMgL+Q3qiYYDT6mRdFZ7LYZF
         1qucWmRS5Yu/jv5Zsp+8hk9NaqVWiy6b3vmqafIxw0B7w2qcHA7ml7pVNniR8Ns7uX5z
         FYW3uuRD9jB2efhnyZBF700GZo0oRMrWiq+WhJrtejQi58rpA253Rn/jWdslPrTyds/H
         Geq2nKPPiBAckwc2z7e5HGeNV8D4d8TqcfeMHBwHorlx9Pqik6jvlwrnIGnNLizBB5qe
         1VGg8WM9zsQwCy8ANJOP/YK++0unXrXaA3BgCjFqx7uHH/iviBHYk9ms3GcG6f6fFVo0
         PGqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpYFSX+uN3U2EPJepLs14VL3MSLozOPE30KgOtR7BIMaqk6/G8HoW2CVcHIfIwnSvqjryLTfBB+/igIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYo6yKV/pFEJfiFeLzB+gGCL3bu/kCrs/t9LOnAlTY61+DzsCj
	KkKF02o7TZQ6vu6vd56yo2nQfr9M12ay/O+7RePIk9d09/KeQ/2dV+YcAj3wyWsT/UbX5Ru5QJ2
	O4EuNNwubl22sod0VVXzOjqZ22i9vca/rBA6sHVuzfHMb4wqAAOO0sJHOZUQr4gQwuA==
X-Gm-Gg: AY/fxX4feELoobjBtHdHxzg88T34HrxDdF25JwTB+pi4z+OqIoLvMHkU67JeFo86ERg
	qXa5ik59/74Pcx7Dd3S65IOc/OKpTrkyTpMboInvoiBEbLZhMf/0zAKNQiobMunaw/Ydsg/b320
	SwzMv5diBhbcaM1w9fe2Qd3E5anOhVJCy2skxChEYZXUF9ChPk/g8O3qXGtve1fxCX0bqBA4Flw
	OXUuIbdwzHenSwoN+LV/jrqMngGYcNc+6VlwC6hMKgGKtmTZJJKUVOhDS9DBeqY55WlEtPZl6P7
	Zu5GZXp9w02HILotPD8B8+ZUy2XrWKFvqznkU4ow+royQdZ0YXWxhAFiD144HLyeep9x63saSN0
	VLyfZcNkqovHMUyls3w0TJyLnmw==
X-Received: by 2002:a05:620a:d88:b0:8c6:a0a4:b796 with SMTP id af79cd13be357-8c6a68d2fbemr52981685a.2.1768502949140;
        Thu, 15 Jan 2026 10:49:09 -0800 (PST)
X-Received: by 2002:a05:620a:d88:b0:8c6:a0a4:b796 with SMTP id af79cd13be357-8c6a68d2fbemr52977285a.2.1768502948619;
        Thu, 15 Jan 2026 10:49:08 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795168c6dsm14408166b.19.2026.01.15.10.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 10:49:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 3/5] arm64: tegra: Drop unneeded status=okay on Tegra234
Date: Thu, 15 Jan 2026 19:48:43 +0100
Message-ID: <20260115184840.310191-8-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260115184840.310191-6-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260115184840.310191-6-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3727; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=6YeryhmREc4dO0HCdpYe1JglCQ+CebAVk+iMczQuXkA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpaTaMfNUYzFoyGDnGE0z47b1BrDOgFTAeCHEt8
 +Vhz+RDAgmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWk2jAAKCRDBN2bmhouD
 16rBD/90ZhEDFklmnT+xz5DV+tG8aAMPSyBpJIV5kgS8Ukns4ew/1hr3wvC4YVfBbp826uMgeob
 bXJ5EgpGpjhbLIL7tHMYb/lRf64vmAsVTM4qIg4+S+ASahKMqto/foggAigIvzp8cygXMkZQ9M8
 wRTM6Z8Izz7iwtYxUsMsQx7+5aKEyJ5dFzuiI5hoVaDbZjEjejSRD+loN2K0wcbgbft4xA10ZNf
 1dVmp+LqwSph0sAD4M6du601abh6Wn/Oe1kcu1d1HOgFvYmLve23iAnT0ROFjJdS0UXbognRWaB
 3WtUPRXGNCfpm2qgnF38/Nu0C09o96XH9jMjlgshGLo3eTWe+sIQr2r6svSxA5gtwa9UDkg/TJD
 lsaFtX4aojxbcgqsKF8mAy035Ti5REAye/jHN6msVvORdUTHt/l9gSD6G1OQstK4AsxfmkfCdd7
 2SDAGDr074UZD0ztPne55+W8YFyyiVaXJK5JZ+t+0ZYs1Lmn2G7phbMRNQl8pgfbBgSiNcLuT/9
 J4GVG1zkWV5X2Ruh37MOxRK9XkdSnflsYWlxSFyJ4HREo8S52Pxu6BhS7hq8K6ZJ1k1MQFULnBS
 Hh2dh0SNV7XiubClSjoLl+AOIdeGW+KGysVqa52Kp4uMf5uObaZYxWReQjYFGAj0VrebUXJM9ws dV9eWpkDodAl1IQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5nB5i8v7H-6YvgN6aBq3ZWspLb6OtzGK
X-Authority-Analysis: v=2.4 cv=bp9BxUai c=1 sm=1 tr=0 ts=696936a6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=cTQqHujFmXnwVRAJhDYA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 5nB5i8v7H-6YvgN6aBq3ZWspLb6OtzGK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE0NCBTYWx0ZWRfX3/MIKrEpALMI
 keN+AeRI+1wLVJi1L3CE5hZjpOi72Gwmxc22WnFt06m6KKedqcXo/BmbSFcwWTH47c6J2sTy0uc
 21ZmPGQKAvjN9omnHZqJTkLMzEgq0+Af52Cj8kE0gEKc7VdM6IKEEuwuoHRjnvJ0afPtWENVed9
 gBhL/KxwUPceMoRaqx+hy1YlfHUeyxOTo0y23opTTF4fXzlYnocV2ptGOLgnirgVq8J66nHb+d6
 VgfSFdvKXI3MWjJ+onzXTYbiiTCNaj1FIFUqT3vcA1P46iITQbAUaPPEOtaM9yPO9SRS1L3eruR
 x3uf4FIpE8FoDvbZQPWreRE865JJoKm8cw+rHEcNRj+Ah4kIjG8YRzyHNT6Ptn3iK2mruN378L2
 iLLN8PT5lb3qmKDsMxd8Rn2NU83XtdyGqimdKlqOEzvaWyv29ISAsdtxIt0T/yf0Lru3E/FQART
 2wmbfrMYl0tijxMI4BA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_05,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150144

Device nodes are enabled by default and this DTSI file does not include
anything else, thus it is impossible that nodes were disabled before and
need to be re-enabled.  Adding redundant status=okay is just confusing
and suggests some other code flow.  Verified with dtx_diff.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 827dbb420826..850c473235e3 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -40,7 +40,6 @@ misc@100000 {
 			compatible = "nvidia,tegra234-misc";
 			reg = <0x0 0x00100000 0x0 0xf000>,
 			      <0x0 0x0010f000 0x0 0x1000>;
-			status = "okay";
 		};
 
 		timer@2080000 {
@@ -62,7 +61,6 @@ timer@2080000 {
 				     <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>;
-			status = "okay";
 		};
 
 		gpio: gpio@2200000 {
@@ -2780,7 +2778,6 @@ mc: memory-controller@2c00000 {
 				    "ch11", "ch12", "ch13", "ch14", "ch15";
 			interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
 			#interconnect-cells = <1>;
-			status = "okay";
 
 			#address-cells = <2>;
 			#size-cells = <2>;
@@ -2812,7 +2809,6 @@ emc: external-memory-controller@2c60000 {
 				interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&bpmp TEGRA234_CLK_EMC>;
 				clock-names = "emc";
-				status = "okay";
 
 				#interconnect-cells = <0>;
 
@@ -3888,7 +3884,6 @@ smmu_niso1: iommu@8000000 {
 			#iommu-cells = <1>;
 
 			nvidia,memory-controller = <&mc>;
-			status = "okay";
 		};
 
 		sce-fabric@b600000 {
@@ -3902,7 +3897,6 @@ rce-fabric@be00000 {
 			compatible = "nvidia,tegra234-rce-fabric";
 			reg = <0x0 0xbe00000 0x0 0x40000>;
 			interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
-			status = "okay";
 		};
 
 		hsp_aon: hsp@c150000 {
@@ -4064,28 +4058,24 @@ aon-fabric@c600000 {
 			compatible = "nvidia,tegra234-aon-fabric";
 			reg = <0x0 0xc600000 0x0 0x40000>;
 			interrupts = <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>;
-			status = "okay";
 		};
 
 		bpmp-fabric@d600000 {
 			compatible = "nvidia,tegra234-bpmp-fabric";
 			reg = <0x0 0xd600000 0x0 0x40000>;
 			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
-			status = "okay";
 		};
 
 		dce-fabric@de00000 {
 			compatible = "nvidia,tegra234-dce-fabric";
 			reg = <0x0 0xde00000 0x0 0x40000>;
 			interrupts = <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH>;
-			status = "okay";
 		};
 
 		ccplex@e000000 {
 			compatible = "nvidia,tegra234-ccplex-cluster";
 			reg = <0x0 0x0e000000 0x0 0x5ffff>;
 			nvidia,bpmp = <&bpmp>;
-			status = "okay";
 		};
 
 		gic: interrupt-controller@f400000 {
@@ -4239,7 +4229,6 @@ smmu_iso: iommu@10000000 {
 			#iommu-cells = <1>;
 
 			nvidia,memory-controller = <&mc>;
-			status = "okay";
 		};
 
 		smmu_niso0: iommu@12000000 {
@@ -4381,14 +4370,12 @@ smmu_niso0: iommu@12000000 {
 			#iommu-cells = <1>;
 
 			nvidia,memory-controller = <&mc>;
-			status = "okay";
 		};
 
 		cbb-fabric@13a00000 {
 			compatible = "nvidia,tegra234-cbb-fabric";
 			reg = <0x0 0x13a00000 0x0 0x400000>;
 			interrupts = <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>;
-			status = "okay";
 		};
 
 		host1x@13e00000 {
@@ -5804,12 +5791,10 @@ dsu-pmu2 {
 	pmu {
 		compatible = "arm,cortex-a78-pmu";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
-		status = "okay";
 	};
 
 	psci {
 		compatible = "arm,psci-1.0";
-		status = "okay";
 		method = "smc";
 	};
 
-- 
2.51.0

