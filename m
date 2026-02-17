Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB002FF147
	for <linux-tegra@vger.kernel.org>; Tue, 17 Feb 2026 09:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771319811; cv=none; b=crDB/IsgbhaoZTrvtJaKKMtacBr4l1tTXTbIYczl3t7/4FVkvEW88iSIpDYQEUaZw5PmAkfml1Bd7UCUlUpG9WSGwAU3QNBFQIe45Xd3JGYoB2elGQoGejb/HCWJ8Ppxs1VgnoI8V8rzDIbB8O3w3YVvYJjVM9ci6/hs7hLlBu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771319811; c=relaxed/simple;
	bh=bqDjRxVs8N/Q5ZrspI/TWkpKsVqj7iN896A7uBcshw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jhqW3v4rFmCZGCP5cgHD2xkW7E5sfZWOA1ppymJTGojhQ24+sFjCGjX6CMUgpyOceAsrybgjfK9p3Uv0jGZQMx2ygLvR9EgEgEcfC98prdsPkNP1jLGF68T+d4QUxBylUjXumN6eeKY5aU+6ovTQ6gPSAPnzcMlQ7Vxdar7DLiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jJ8Yn9Un; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yd+dGkqq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jJ8Yn9Un";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yd+dGkqq"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GL7iZp125852
	for <linux-tegra@vger.kernel.org>; Tue, 17 Feb 2026 09:16:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j2IsP8/jgA76HelB7TVtZGVRqfenaH3elI0PUUDx2/w=; b=jJ8Yn9UnzA/JSFxz
	IPgm5K1oqfcfs98QxCDraC6Jw201HURmzHiPn5FrwmIvd3S221v7HLpOBaDI2rsT
	Zn2pIng6sKsBr/Rl5CT9wxqXTP3a1szuLoKFzQh9o8iyARXQAzGctR8Kh+SBfGtM
	fUSyMk+71EryqB/q/wiOU6U0c4rdAEb2DdNK40xmB+niQDvOBgAZPL7g3re6GxWQ
	3hSHp+brqy4WeNV9K49ycy1xnYLg6RkCLUU+g0MW7RFZiFW6MaFHc8VSD9hztUZi
	z9o/lz6UvB7hfp5/7zvhiqIAZ+rzpg9mr+Ei9DlkpCWjxNMZ3ZQo1DpI7NLQ3v9k
	KrYPeg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbyxujus3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Tue, 17 Feb 2026 09:16:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb4a241582so2180010985a.0
        for <linux-tegra@vger.kernel.org>; Tue, 17 Feb 2026 01:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771319809; x=1771924609; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j2IsP8/jgA76HelB7TVtZGVRqfenaH3elI0PUUDx2/w=;
        b=Yd+dGkqqwsA+B5iA0BZPWRHeFjl4J/9lCJNNWKSIck+ZUIK/xCca4/nhnWaqy1SY4p
         PzcoAd83NkDbFY+88ukKHzpBNTjcd5XwVO8jhiqJF2Qb1hCMgP4W/IVkxOovNxezi3ts
         3rYpLVTJdBRXNVm1NDZYvPmN0FPsX4xxa8gQzie29K/wHTgfvoEHybmBXrIt2SM5kFHD
         K+8HaQem7zEgDZ4EWOjmqQrhZTmXpkhe4dorLXnkewgqp+c/Kx60fZVnZnvkRc3xzatS
         pf/FG5NvFjDmMyYuITGyl5pL5htdMcaf5ZFAzdQxXQyzPiDRIBh0MRHT3NZ36mGzdJrT
         4g9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771319809; x=1771924609;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j2IsP8/jgA76HelB7TVtZGVRqfenaH3elI0PUUDx2/w=;
        b=wirm6fM50cMiESmHhuHtg2f6iDNmNqJYBKHymxZZCWmGqJvXXeMxkIH4Yu9DhM2RUK
         vAn7Z6Rze3XU6EXAdnyHjbtpPez2wK7sjuys1CVaO0KBU2xgGv7TYkZyL1aEZsEtmQ1L
         FxwtvlngyulQ5tzwQpJ2LdVEVt9dL5CMpFc4Ia1uh1Ybzd/tDYPZy1P34K2t2RQ49ZlN
         H3svmzRkg3mXmi/gPA1kMJrUtHJNaMh0c7w2kgJ/uw2sKNXJ9xlXQNkN0FmOGvX4Qrqz
         RWyVW9w0b0iNWHnDeILJHz9LiXd75LNbmumeQxnAlH0nbRCx8IwUNy0/01sj0B7P59V7
         DYAA==
X-Gm-Message-State: AOJu0Yzwj7tNYB5Ft6WlWO8dApaw3r8o2JY7eNFcG7GfVnPXnd836HL7
	tIb8y3jSyKgIOgE+t7Cfpxgc7oMlFHV3MiY16MHhOLGyehb0VvZXkAymUWEIxxmIQymR74ULYZE
	9HnQVfwe+/vgo3EjalQ1hWse4G80NL2jjsUTVesGhTzCBRUlrLKwIeeKtZbuj5Zn6ug==
X-Gm-Gg: AZuq6aKt1uMgPOtTvGl0NB+OBw3tyG9DFbowYregcDgzDzslSHEXYiTIX4ulJo2lOxZ
	vm1ZaMgSGT8NfGNsKpEEyVE5DusM7ekRF+hcOAcDFvfUf3vAg1DyZsdRjRaLKjW0PkaBfB9jXlz
	AZYfPy6MjqMXMXQs6cTCQezirovSWXut4Bjd24SMUecDhVqV/qLHpzVKaT6Mc/10rx3qmV6aPl7
	1wFZ4gaWwGGYiSljaDvtDC7F8Prv/97lzEn1YztLUk5SNPVrjqIStwtKNeENYc0BE6griIFWMNa
	CirLdxQgqOHdNlX519A3wUdfRyXYzENONH9fESvCJSN18JohZ1TXDjOLGxtSl7iYoPHsf/vfkyd
	GBuXng+DGJrpSjHWZaXg9/BZs1n3PXyeG0cyQb36fzl4F2A==
X-Received: by 2002:a05:620a:4495:b0:8cb:66dc:9fd8 with SMTP id af79cd13be357-8cb66dca40emr322126785a.65.1771319808794;
        Tue, 17 Feb 2026 01:16:48 -0800 (PST)
X-Received: by 2002:a05:620a:4495:b0:8cb:66dc:9fd8 with SMTP id af79cd13be357-8cb66dca40emr322124485a.65.1771319808333;
        Tue, 17 Feb 2026 01:16:48 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a23c6csm149659595e9.7.2026.02.17.01.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 01:16:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 10:16:36 +0100
Subject: [PATCH 1/3] soc: tegra: Make ARCH_TEGRA_SOC_FOO defaults for
 Nvidia Tegra
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-soc-tegra-arch-kconfig-v1-1-81bf5674d032@oss.qualcomm.com>
References: <20260217-soc-tegra-arch-kconfig-v1-0-81bf5674d032@oss.qualcomm.com>
In-Reply-To: <20260217-soc-tegra-arch-kconfig-v1-0-81bf5674d032@oss.qualcomm.com>
To: Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Russell King <linux@armlinux.org.uk>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3335;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=bqDjRxVs8N/Q5ZrspI/TWkpKsVqj7iN896A7uBcshw0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBplDH6QW+MOGCK5XyT7x1kVp4DNOhOLdnK6TVMv
 BpFEjy80U2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZQx+gAKCRDBN2bmhouD
 13xYD/wKO+BcroimNHNVHXfTzxMAdsHpdxdSyXcF9pUbPY2oQzXZhCeNZQ95N3PGXXGtGEdA2sU
 VYNwe8bfPQq2H6BWRF3kdjktdRb0+3F2lOXks0lp+OIa110eR1fLVlWbboeEA1g5lGT5ZH/eXw/
 HtxIii4cJOLOlxcbExjmELSHPi/TqG+l0fRTAzhkijw81BiEFaIymfzwkeyoIN9OAgt7tR6abIU
 +2HeIZ/J6jC6ag5oHdbPGNfpd7g3dibnsny+R6+vFzSbtIePyC4MYY3jXlTwfLsHfHS9oQLrmYV
 uGjKmcjCfHXp/zAswYvGiw/zItZcX+e8DJ2v+RO74admlyQFrU6Ep0bx/oKUoJ0ap05uqrzISH/
 5cL5GngRhrxlL0mmcI16cYOqQfiF7bw0E7WSRecxGpgDFLhi7Q3Nmk4N6fbqExU4+hteG8pty/+
 W9tlaKq40/dF2pw1hvjpKcurIu7Ft2fzRytGuTl3F3nyJbZxuvpMk09SeiqdgGeXXt4axqCjGvV
 saO0/OILpRir1Vi5ja69lepqKYmORg4xsizXP/hTBjOSgEDPnOLnICLGFevcoFruMOiIzJfP1Nc
 qsraCPxElbRgzPyyLNRPrqUreVV9k5VAoveMFXcfA2Y2e16mj7qSwqcNlLnoWp3DqtI9eyuibn1
 I4srIXHmRPhuPuA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: VrYnTRAMMks-KRI7B9rBuS6hrjCqnrPK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA3NiBTYWx0ZWRfX3o3VAJJvWHou
 CAvI+hlt02kU1CUMGQ8skDYpVETuXtNSIl2QmDczilg/Wn8iXx2Xo5y3v8zJElD/oEL107e6GWh
 i8F/ts9BQGh7BXBTzyb2u8SdXi9AYq2nTjd4BYd6ufDR+5ghf+6QjfOepmWAvqBDimqmcpbB9d0
 q7pxfrKmsV+AqzNNNk6XACxRJglyY8TomFQAryNWWayC/xjJ+7CZDINDs/gXq7yt6tRR2IoxCR8
 tey/ke5IkTbrB2qhZWUk76t4exKJmDYJa+mPlWrcI8yasuL3NLE6tRbl7ja+mfR2oq1q3zH2dLP
 67eGI0wsdyIbSQGK7/t9pa6sk4QwdfUi5fAp9t65stOjx9jBm/4isjtQ8IYd+SURhhzjUqr6kOC
 6w7rVrissEfTuI3vWj7AS4fvD6/1Ov3Ch8ph2NEUx3CU2SnwG48Vxx/Ecc4YRLCc49HzfQao7OI
 rXSgerV2WIN6th4d4CQ==
X-Authority-Analysis: v=2.4 cv=BpuQAIX5 c=1 sm=1 tr=0 ts=69943201 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=H7KHO4RPsEdM4UCB5m0A:9 a=isR4AqL0EaFW8Alr:21
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: VrYnTRAMMks-KRI7B9rBuS6hrjCqnrPK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170076

By convention, only one globally selectable ARCH_PLATFORM is expected
for given SoC platform, defined in arch/arm64/Kconfig.platforms or
arch/arm/mach-*/Kconfig, because we target a single multi-platform
kernel image.

Platforms wanting different granularity, e.g. due to size constraints on
their devices, should be sure that globally only one ARCH_PLTAFORM is
selected in defconfig.  Change Tegra per-soc Kconfig entries to default
to ARCH_TEGRA allowing removal of these per-soc parts from defconfigs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

1. All further patches depend on this one.
2. Year ago after my complains Prabhakar fixed another case - Renesas -
   so with this patch we get rid of all single-ARCH offenders.
---
 drivers/soc/tegra/Kconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
index c0fc54c3cd35..a1cadfdb356c 100644
--- a/drivers/soc/tegra/Kconfig
+++ b/drivers/soc/tegra/Kconfig
@@ -6,6 +6,7 @@ if ARM
 
 config ARCH_TEGRA_2x_SOC
 	bool "Enable support for Tegra20 family"
+	default ARCH_TEGRA
 	select ARCH_NEEDS_CPU_IDLE_COUPLED if SMP
 	select ARM_ERRATA_720789
 	select ARM_ERRATA_754327 if SMP
@@ -23,6 +24,7 @@ config ARCH_TEGRA_2x_SOC
 
 config ARCH_TEGRA_3x_SOC
 	bool "Enable support for Tegra30 family"
+	default ARCH_TEGRA
 	select ARM_ERRATA_754322
 	select ARM_ERRATA_764369 if SMP
 	select PINCTRL_TEGRA30
@@ -37,6 +39,7 @@ config ARCH_TEGRA_3x_SOC
 
 config ARCH_TEGRA_114_SOC
 	bool "Enable support for Tegra114 family"
+	default ARCH_TEGRA
 	select ARM_ERRATA_798181 if SMP
 	select HAVE_ARM_ARCH_TIMER
 	select PINCTRL_TEGRA114
@@ -49,6 +52,7 @@ config ARCH_TEGRA_114_SOC
 
 config ARCH_TEGRA_124_SOC
 	bool "Enable support for Tegra124 family"
+	default ARCH_TEGRA
 	select HAVE_ARM_ARCH_TIMER
 	select PINCTRL_TEGRA124
 	select SOC_TEGRA_FLOWCTRL
@@ -65,6 +69,7 @@ if ARM64
 
 config ARCH_TEGRA_132_SOC
 	bool "NVIDIA Tegra132 SoC"
+	default ARCH_TEGRA
 	select PINCTRL_TEGRA124
 	select SOC_TEGRA_FLOWCTRL
 	select SOC_TEGRA_PMC
@@ -76,6 +81,7 @@ config ARCH_TEGRA_132_SOC
 
 config ARCH_TEGRA_210_SOC
 	bool "NVIDIA Tegra210 SoC"
+	default ARCH_TEGRA
 	select PINCTRL_TEGRA210
 	select SOC_TEGRA_FLOWCTRL
 	select SOC_TEGRA_PMC
@@ -95,6 +101,7 @@ config ARCH_TEGRA_210_SOC
 
 config ARCH_TEGRA_186_SOC
 	bool "NVIDIA Tegra186 SoC"
+	default ARCH_TEGRA
 	depends on !CPU_BIG_ENDIAN
 	select PINCTRL_TEGRA186
 	select MAILBOX
@@ -109,6 +116,7 @@ config ARCH_TEGRA_186_SOC
 
 config ARCH_TEGRA_194_SOC
 	bool "NVIDIA Tegra194 SoC"
+	default ARCH_TEGRA
 	depends on !CPU_BIG_ENDIAN
 	select MAILBOX
 	select PINCTRL_TEGRA194
@@ -118,6 +126,7 @@ config ARCH_TEGRA_194_SOC
 
 config ARCH_TEGRA_234_SOC
 	bool "NVIDIA Tegra234 SoC"
+	default ARCH_TEGRA
 	depends on !CPU_BIG_ENDIAN
 	select MAILBOX
 	select PINCTRL_TEGRA234
@@ -127,11 +136,13 @@ config ARCH_TEGRA_234_SOC
 
 config ARCH_TEGRA_241_SOC
 	bool "NVIDIA Tegra241 SoC"
+	default ARCH_TEGRA
 	help
 	  Enable support for the NVIDIA Tegra241 SoC.
 
 config ARCH_TEGRA_264_SOC
 	bool "NVIDIA Tegra264 SoC"
+	default ARCH_TEGRA
 	depends on !CPU_BIG_ENDIAN
 	select MAILBOX
 	select SOC_TEGRA_PMC

-- 
2.51.0

