Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308C53C1997
	for <linux-tegra@vger.kernel.org>; Thu, 15 Jan 2026 18:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768502953; cv=none; b=U2T/JgHF6hjqdu2FnUtuLjaThm7Z1zduaeDCMOnupuPunT44N304ftKuOGz37AXYRoGG+jiWpDWL9ht6lmXA8jZiNkLGYnULmP554ARojXPL58iBQEVpzsxxfY6t/aCOesjzAhsuzF3WtPMGk/jpGjEUPYmYCtnuVt20X/dO42k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768502953; c=relaxed/simple;
	bh=XKFoXPdixBTV3dzgqHP7NW2/mzQEqc5k7uIZdpXCHqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U69pNgFmn1QpIR57TeYcwuk0E6TbwlnwLwpfL5u/baovoe3tCrVD8I0GSkWGyV8y46/iQty8ePDXzmeCBOE8bdms61lGN6wv0cirVk73Bir8qexnxJdowAmY8ZlzFM3PwRHCHBz/aQp10cFjRIogT0ug5Mz88jiOtLZKcHq9zIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fHxNnQjz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CoXd9xDa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fHxNnQjz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CoXd9xDa"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFY89S3202092
	for <linux-tegra@vger.kernel.org>; Thu, 15 Jan 2026 18:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ax1DNyjYEvF
	qUiFYZeWFqhe/AVDMnk1gl70ukeZMJIQ=; b=fHxNnQjzoT810GAy6kvXHes9j/q
	gbumlIotb6/FryYDucW3w03dsVzBg+lJ2onz9gFFB0OWWoBzefY+p7wW+dbvLPhZ
	Skus17dt0nGKIlD8ohPq4Dls5jbRWzuHpXYUl/RWyX/1lLqBZKKg8F/+g9Tt2pEd
	o9APjfpfCCMjRit7YS06pKiLSUaT8nZCvPPbyoDnoPueeM4jZqkHNPCiXWvwI8i0
	+HGolUQJoe4o/QS/oZiEV+XKBPqzMEXDN+j/NnoSMrvs1DTxb8+RvT1GSUpoUztg
	3XunVWZyY5fBj7DyoOtSOLOFGF1AUNtuoJf+bHW1tdjiDbvlTU23UsmopNg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpxhs9f4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Thu, 15 Jan 2026 18:49:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52fd4cca2so336712885a.3
        for <linux-tegra@vger.kernel.org>; Thu, 15 Jan 2026 10:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768502946; x=1769107746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ax1DNyjYEvFqUiFYZeWFqhe/AVDMnk1gl70ukeZMJIQ=;
        b=CoXd9xDaGmvAIHGexTv4ejGKWv/YXmQcTfp+Lrxz8SSJcdJeBwayZLbv4SVuk2eSVi
         nWHK/VekVBLXqOYVzlZz31CJYOUcW1OEM6ZIMlkH9zYhQq4bBnwobDXEhitn7qbmbped
         o9IJLcAv4LnhhLy5MKHsNpZ8rGFQ/ig8Zx3MMHcfVDz0GDerDOFTj4rd6kcPMp39ovkk
         kQmwK0aTO+Me6HHg9U560Qw6tG6DL0TxL8eY4Q06q2U/OyeOhYC2sgmM82gXNrR18Ppg
         zkWEzzN5xKPY8cHvfy3mIaiWYb8zDcD8VVTqO2/julT9K0S338YJfdu8gYfiMYxlXZOq
         1i/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768502946; x=1769107746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ax1DNyjYEvFqUiFYZeWFqhe/AVDMnk1gl70ukeZMJIQ=;
        b=Hc5N9o8FCltT8jv8eySpr+H0agzgbk0OkXZCJl1OkU70Dx+iSDDh2c1JtWyvmf1ZCb
         nFZR+2Z3fW2fii5fx8MY+hK6UenbA+TZYbGpVLpZi6oymyjW58apvHUFIO5YGcbGjD7K
         ZezFwcbPsx4CrurnE4MQ09KM7+K8q8wKYBFozn3wT14kPBszLWtaR32rt4IdjTBUoNoo
         6DR6FlRBxNjzwVQ+O/22df+bruh82sR2yYaaB/2lRU7pVqJbCl8zZPlBoxDCSL9S2Z34
         Ru7yuexC9Duo/NjmEwT47cs0fdZwSQrifW7MjPak6sL/29MeuTO8Vkg2TejOCLggisI4
         J8NA==
X-Forwarded-Encrypted: i=1; AJvYcCXavQGmlTiKyNVTKXLY06qrEwPpXh89pU1iYqTiv4g0CZGuxuCWVZ1QwC5V9akf/t/bP6875uox2uYSHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuXR3j8X6kWkfnvtcZFpViSL5TOBKz02/h4HSsIG+/aMSYhXgI
	9MZH+KfRKFnNmGt4OnQxzZFSLGv4h9p4z6Qy0H2DtcyE1vOb0W5vrGUDMKWiDaB5qVVGmkQgDMl
	kfNAVBdhh/fFPWGJjKc2KnzvQjWen+gn2ZQffA5Fdcm6VweGxsI4APqWWhNWKkdW9EQ==
X-Gm-Gg: AY/fxX6U3287nZGyp8+si9p03EI45DRBLy+a/73g7Ipg8ROsvB6D9vZsJCZU0H9ojSX
	xR5yUuzhVWiYQK/Kc7TZ3LswFTrWiPiVmGGEwtdlN09QIYJTcoxGv4d/au57jgHP9/nW5NV8BUJ
	3ja7ruQc51bAMl6n5Ofsr6EX2ERcu7Eo0D+9OSiNdZ8WAqFb7bIL7myEegeMHMcs9fxx/M/Gbrk
	y1hxtKYjtovR8GL5VD/mc3fhSbTRDBfZBCC2qtcTZCJilY62Q9i6g8a2D9xK7uu/mUL6QpABptS
	vtzJtdPO7oCWm01FlkhxEv66wa/naFk8um3vUD8Vjv2Rd4GCB9Q/CA3ncavQXnkgXrhMLz5L7Ft
	tZE7c9kr1zIt97BD03DF4lfhZkg==
X-Received: by 2002:a05:620a:319f:b0:8c6:a539:55c8 with SMTP id af79cd13be357-8c6a66e92c3mr74557485a.11.1768502946620;
        Thu, 15 Jan 2026 10:49:06 -0800 (PST)
X-Received: by 2002:a05:620a:319f:b0:8c6:a539:55c8 with SMTP id af79cd13be357-8c6a66e92c3mr74552585a.11.1768502946111;
        Thu, 15 Jan 2026 10:49:06 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795168c6dsm14408166b.19.2026.01.15.10.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 10:49:04 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/5] arm64: tegra: Drop unneeded status=okay on Tegra194
Date: Thu, 15 Jan 2026 19:48:42 +0100
Message-ID: <20260115184840.310191-7-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260115184840.310191-6-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260115184840.310191-6-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3578; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=XKFoXPdixBTV3dzgqHP7NW2/mzQEqc5k7uIZdpXCHqw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpaTaLLDofW4LYcpQCbgx0WrY8bhi83i7g7w89X
 76UZEX4rxGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWk2iwAKCRDBN2bmhouD
 14ZBD/9+bhkdh61WA66TkrWtg9mx90/1zlrHjkcv3PRvR04n+Gq4ALWV+TUCbXJIqGNL9GaI6pf
 8T6bj168hMHrbEvhiQidn6Q8sGjNmkz5MD0IX9beV45rrOBp6uTt4ntIyfd2bncZ7KkNpwrg6nZ
 h7Wmmp/wORyGq4A6k0dwtzvnK02QaIfq/ZBvNiUmjDDsh4e9FnweAOnwvQHaf7gvm6D4TESI7Nf
 qlXKKqD2wrCQ3bqKbAuXlaKm6DfIxfOH/mZYYDR/8KLgMfLebyObf7nI+cOaOp4/dTklggF+zwd
 FE8QUqqbCbsQyy4to8WEnS1Fhfe/TSundhGY2rAdmMf5VZX1nKt95dM1KZbCul3BPtu+5QAyjwO
 b4/q2rLx3U1DMHT/kandqAnW0P1zjb9e4u0gQEMx18j0gMkOrLfiMh6gcrGxyiAer9r08TLUGvw
 V8HtV3aEONvmgIgpwLSIcrvGz163duVc9X9FUfhWGYQnH9C3lSXu6LCCbx0GWO+vKG1JuNaVziS
 p2DFQLi7S3rExEmoLG9Bz+5/1piFKyHRjaitpuP+uncM/Vuqj/Jg0LKZBP2vw/UXwm7ZPTIoKrN
 x0kgKhL40edsj7eEgP/ohHiWt3XqjwPoC6THIwiNFjQ4IoOJLx/crZCkU+9m4hQ/uhv/V+n2dtG znkuK/I+4ld33Jw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FI4WBuos c=1 sm=1 tr=0 ts=696936a4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=I45XjhtnlnKqqfCYoOgA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Ra6ABC6plJkcApjvX2vXOhVPwfnK5FSx
X-Proofpoint-ORIG-GUID: Ra6ABC6plJkcApjvX2vXOhVPwfnK5FSx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE0NCBTYWx0ZWRfX2PIwRxHKJRtH
 co0+IrN96o3ai1UGwqY83M2/YpWq5R9rzjKDHVPrrl5ZlQ/Z7R0UqjtFgijybQPyheRv+r04ute
 /5Plzwg3OeSfC+umWBU3SiPO1+pI3BO5R8l/HxRO4ne801LUYKUE/P/F6QXPVpunKLu9cZcOGP+
 +w3CZPLrLRd0ezatsHZ81OxdNvKX0nfXaNt2oaAzYNtkcrmrnbMujibXyLWBdZZRCyraGCqTqIw
 95y1Uk7dJIa2rBIgauc3RfQ+/XNkPSpf3uBxi4GgPSLgCRIvc7ui2WcfXbH+BN1vG/KE4TdWSR8
 x3orQKsOvh3RcY86vQIddC0Lxs5FWvrjnteZnVQiaq2rQYVKyfRjwJ4w2ETGXlALuysRsx6vyKq
 U0+usGFujMkbc/4M5xu6mhWxyC07kAcCkXGA3yd1a1/sFaJFlVefmKuOYTF0QhFNKL4cdHy5jXj
 UBXnC6EtS/HuFcoKkOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_05,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150144

Device nodes are enabled by default and this DTSI file does not include
anything else, thus it is impossible that nodes were disabled before and
need to be re-enabled.  Adding redundant status=okay is just confusing
and suggests some other code flow.  Verified with dtx_diff.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index b782f8db1288..849694f751d9 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -97,7 +97,6 @@ cbb-noc@2300000 {
 				     <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>;
 			nvidia,axi2apb = <&axi2apb>;
 			nvidia,apbmisc = <&apbmisc>;
-			status = "okay";
 		};
 
 		axi2apb: axi2apb@2390000 {
@@ -108,13 +107,11 @@ axi2apb: axi2apb@2390000 {
 			      <0x0 0x23c0000 0x0 0x1000>,
 			      <0x0 0x23d0000 0x0 0x1000>,
 			      <0x0 0x23e0000 0x0 0x1000>;
-			status = "okay";
 		};
 
 		pinmux: pinmux@2430000 {
 			compatible = "nvidia,tegra194-pinmux";
 			reg = <0x0 0x2430000 0x0 0x17000>;
-			status = "okay";
 
 			pex_clkreq_c5_bi_dir_state: pinmux-pex-clkreq-c5-bi-dir {
 				clkreq {
@@ -208,7 +205,6 @@ gpcdma: dma-controller@2600000 {
 			iommus = <&smmu TEGRA194_SID_GPCDMA_0>;
 			dma-coherent;
 			dma-channel-mask = <0xfffffffe>;
-			status = "okay";
 		};
 
 		aconnect@2900000 {
@@ -737,7 +733,6 @@ timer@3010000 {
 				     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
-			status = "okay";
 		};
 
 		uarta: serial@3100000 {
@@ -1359,7 +1354,6 @@ hte_lic: hardware-timestamp@3aa0000 {
 			nvidia,int-threshold = <1>;
 			nvidia,slices = <11>;
 			#timestamp-cells = <1>;
-			status = "okay";
 		};
 
 		hsp_top0: hsp@3c00000 {
@@ -1547,7 +1541,6 @@ sce-noc@b600000 {
 				     <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
 			nvidia,axi2apb = <&axi2apb>;
 			nvidia,apbmisc = <&apbmisc>;
-			status = "okay";
 		};
 
 		rce-noc@be00000 {
@@ -1557,7 +1550,6 @@ rce-noc@be00000 {
 				     <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
 			nvidia,axi2apb = <&axi2apb>;
 			nvidia,apbmisc = <&apbmisc>;
-			status = "okay";
 		};
 
 		hsp_aon: hsp@c150000 {
@@ -1582,7 +1574,6 @@ hte_aon: hardware-timestamp@c1e0000 {
 			nvidia,int-threshold = <1>;
 			nvidia,slices = <3>;
 			#timestamp-cells = <1>;
-			status = "okay";
 		};
 
 		gen2_i2c: i2c@c240000 {
@@ -1668,8 +1659,6 @@ gpio_aon: gpio@c2f0000 {
 		pinmux_aon: pinmux@c300000 {
 			compatible = "nvidia,tegra194-pinmux-aon";
 			reg = <0x0 0xc300000 0x0 0x4000>;
-
-			status = "okay";
 		};
 
 		pwm4: pwm@c340000 {
@@ -1722,7 +1711,6 @@ aon-noc@c600000 {
 			interrupts = <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>;
 			nvidia,apbmisc = <&apbmisc>;
-			status = "okay";
 		};
 
 		bpmp-noc@d600000 {
@@ -1732,7 +1720,6 @@ bpmp-noc@d600000 {
 				     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
 			nvidia,axi2apb = <&axi2apb>;
 			nvidia,apbmisc = <&apbmisc>;
-			status = "okay";
 		};
 
 		iommu@10000000 {
@@ -1886,7 +1873,6 @@ smmu: iommu@12000000 {
 			#iommu-cells = <1>;
 
 			nvidia,memory-controller = <&mc>;
-			status = "okay";
 		};
 
 		host1x@13e00000 {
@@ -3106,7 +3092,6 @@ pmu {
 
 	psci {
 		compatible = "arm,psci-1.0";
-		status = "okay";
 		method = "smc";
 	};
 
-- 
2.51.0

