Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C003302742
	for <linux-tegra@vger.kernel.org>; Tue, 17 Feb 2026 09:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771319813; cv=none; b=nb8bj95Dg5m4Ugrhuq9cC0WMW6gS5HEG5DcxWrhe39UOw47zf+NegASz3rpM6PhpMgRjfwMgVVKRDpAmSUyrg8xJBveH87KvWZuOhC2/W5NQJcFIGu1RW1CCIwhODm+qfukqRmVKajnE9llLnPEwubxbhtWEFbl8ArclqCfXyVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771319813; c=relaxed/simple;
	bh=9w4zoJ1NaEJJx7ERKQvdQ6eFS6T244uoqWIM4joR9Qc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FVpQH9mc/h+3KtuM20r00zYzD/uhZN3sdHvTSaFWZe3AWCJ3AZQesd4BaTFYokTAGhIPE0cVRApseLWoL3Tte+lH9rYKbttWX9bzng7CFN0q8BakUyn5pwJhjxioljxa0MHAnOy5GATejsp3X0+1vlcajhJA0ecf98WvRVGUads=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UU29VoMa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eqEHfKzo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UU29VoMa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eqEHfKzo"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GIGxZh2804570
	for <linux-tegra@vger.kernel.org>; Tue, 17 Feb 2026 09:16:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q8OKb1SZv04ljEymqRWJAeV6X3LU2VaiujY5Lry1CIE=; b=UU29VoMaomYwyLCY
	jCFZyhZCp0jhFA8GW9nYs/8iUmIOzNKJP886PDZd6pYG9XeMCmBa/rU3mP6qXOC9
	5RxK7MM2Z48zkvYF6CINt1H1Shn3gUGeaGxNFpw8sqD2Mv+z7aFqI1XX2UOl95j1
	TEtXHxiMaXOEUFf4VY8DwhjJhVzjlF97Ijr+5eJF5fUMGbArBJRrRfwDkJe+k2RD
	RQtdM1jd9Eg0uPkzJhDoXxIus0lJ6bZRQwLD36l5QnXL01QpJgEp5kDminDyruJe
	830nueL4IKupC2bXvzfhUIa97ur2XhjRbjxzUKkyEYFusAUN+N64P6xdADYeCSZ2
	f7Pohg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cbyxujus9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Tue, 17 Feb 2026 09:16:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb4d191ef1so340105485a.0
        for <linux-tegra@vger.kernel.org>; Tue, 17 Feb 2026 01:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771319811; x=1771924611; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q8OKb1SZv04ljEymqRWJAeV6X3LU2VaiujY5Lry1CIE=;
        b=eqEHfKzoCmioq1T2HOJL4N+/Wg6VRuL1FM0Ur/sGpuymBKY+toJaGO4tXSWmo62tg1
         IO6URh4puv3U8q/DioUsQdJkgXDW6vAYdK1X7W1m86RmDdCto/XFcZ3o2KiBcMh/zDbE
         5pRbhiq3g0P+TTMxELSa96Hrz+8kx8SRtUok86azDUeIVIzHZr89DSKU9djF0/efj9dl
         b/NjFm5BaOCSAelN4V6UH4H4LORA6JsYerFBs2Nl2rhN/IY4oGaVRNUFj/tT9GrpNhvb
         fVk9Iw4bxXKHfo5XbQjXXV38MawOn7KXSpXDNFLtNKElufyojrc+FkNGUCKkWZ4QhSUT
         C+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771319811; x=1771924611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q8OKb1SZv04ljEymqRWJAeV6X3LU2VaiujY5Lry1CIE=;
        b=p4DLRWAGJ6HQRWkzVPrFlLcwu6oMyMeCvnNMyIpzT1X9wmi/V/yttVYHUWMfEfP8hP
         sQRpt7g+3VA0IQJnbkxPKRNaXxQYkXP+xHpPHAJ2/WKaYfnreZ3oUj82+zlKazQv4+LK
         5c8kXqboUIGoq8T/QuULRVIpAGUtdIBiLwCIKzPby6dnx2Bx+mTjBWZLMxof6yjdzgZC
         YJmwo379D2wh908MC/eVqTzEyDQph2mneSpnkYfTv3Q5AJVgnP0g7tnajRkMio00WSNV
         O3CEO1OPh2Rh+SmpJp5TiCowJg7QsJtbbTo2jnkB6j70oWEMFMRRT/rd6/8IQnummjtr
         lqvg==
X-Gm-Message-State: AOJu0Yyc9pCypsBZzzm0op1rWXpYW/H+p/nPHnw/5lRiVVPyoOjx1Hn6
	JE+l8FDTt0lUMtCjBolaQ3iuNmk78bfcwPFbu7zydEsHX/JrFVbtZmT6WBSBFRMg8EKc64RbRfQ
	P+HdMT1bRa+/jpx6lbWASZEi8KUuHbZbgoEBfh5g6R2ulCLk4L9NW+mGtqSQhXdwARg==
X-Gm-Gg: AZuq6aK42a1wvNrtF+PcUJDPsltYXhR2XagUFIcpTc0OkZ15rgaHerHjMdCXXuwdchV
	2QLyc1eo7d33CruHI3pLJtnwH8yMAXV0IEizdh47/tQi/Lv8VhyOajPUB7Xtqt98X8hAT/5Zyik
	xfXqo3bxOYiieT7HQOLzJDgx/AFIlgmLZ8ZIGNNVTUxQ242H3ByszG5ZSUS33+SUzlAW0VyP7Qc
	gG3EnI9+pS5nF8tKUOErefHJCB22HYW7G306KzUBeTudjFvKeSvL4X6f8e4cVjvqnp92ywfjSCD
	5JHm6xvLgM55yciwmGDbeZr6OpdCHgeHmOjBjLgf+UKu5d1XS0xoppTmDGzcWcsGoWvsR2cU0hz
	EqiJX+x+D/0eQk+/DbmFzvVrNUFP1ZyCTYkFOKVTWTQdw6g==
X-Received: by 2002:a05:620a:46a6:b0:8c6:a28d:b1e9 with SMTP id af79cd13be357-8cb424e450fmr1482610385a.84.1771319810646;
        Tue, 17 Feb 2026 01:16:50 -0800 (PST)
X-Received: by 2002:a05:620a:46a6:b0:8c6:a28d:b1e9 with SMTP id af79cd13be357-8cb424e450fmr1482608785a.84.1771319810122;
        Tue, 17 Feb 2026 01:16:50 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a23c6csm149659595e9.7.2026.02.17.01.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 01:16:49 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 10:16:37 +0100
Subject: [PATCH 2/3] ARM: tegra: defconfig: Drop redundant
 ARCH_TEGRA_foo_SOC
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-soc-tegra-arch-kconfig-v1-2-81bf5674d032@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1478;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9w4zoJ1NaEJJx7ERKQvdQ6eFS6T244uoqWIM4joR9Qc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBplDH7tYIA03JtMS7xsrsGdVsNLg1nYo2XCpkLc
 d0JJYCUgTeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZQx+wAKCRDBN2bmhouD
 11OmD/9uSk5txbCQIdu2j9VFRQ9YglRVFRHqfHcqweyKTNgKz5N7APH85V4aOrhQphKjM8OGuck
 VJPXWnXDMcDTwOuixnS9UKWtbbwFl1pjUZvCbzBxu/qm8h+smcmYCuy0es0deajyH7lDG0b0vDU
 cGV4RXrbYP0x60PhW+07z7WXdsJUdlGLTn5ivLiUaLIL2vSZZUBvmomEL52J+FdM+DszQ6ne7tF
 GMHzdQc7xtDqLcn+XFRGwxWZ+vCxx3Ay/YwUQezRszjBy5WrhwoFMUO0dG94WIM7gGeWFv+S/dS
 /Sr32WSUYzuFyJTwhICmmFGUQLyNMJwebEaV8nCBUAYz12TwGwxtbJoIJduTvu0Id0f64o3A8rP
 3E/T2y5clLKEPhc+3O/zAOaOGrw7hXMIGzOQf0FwgW/EznEJ1LQW+3RykG9UgLVekuvptUNxDvw
 deki9ZGoj45SBFDxkSeTz3HMpWXkX1b8UEix3DCw/2RIYO5O36OIjik9qCnFeDw2mf0aQQsbttL
 D+oFBa80dx7lUiDd6kvbe/xDVMTTQg2YhmmPDKEZP/fcVVpnC8pfVkhgXJwfvU5Tb4BV9j+Eody
 O2yfKRRvFW4E9WCoD2kcflRTE7c+6H0XNBM7ygsV9Ba32Ditk/Z6AGmtMSIxLzeyee4dF418b2H
 GJq7GGHoDhgVaxw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: bSJ6byIvkD38fHf_rVQH9U2yEenHA6N3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA3NiBTYWx0ZWRfX/LQkVIkOkFEs
 z+0ivnaYk+itcFVk/eGA5rITnj5BcD4xlwKCCcSz+Fm7Z+mjiCiZliKfbmoUggHWq7331r1LF4g
 9iZ18TQyCqZb0DjTzKREnzixNIPn4Kc/1BlEUbfAMet47FXTZnOojuYW/c6BIcN6X54DJWOtkA3
 MomN4/SHthjRd5VEcbgLa0SZfRNifM3ankIHgGgJkMCZCepayGeF3cbkJE9LXxhePC+Gk1b8ql0
 zkvAupfT+Kml7cXj9kdUCyFX56XEWLneSfCrcRVcDfIYXwf8faaaCZCnszUrjnsP7g3Q/8jLoZY
 sTnDiQvGSOpvlhvVZ9WDj0C1cA2mu3F09Dhz/RG1nY2L9ePp86vLexVDk0X1yWdgzs1iWOVdNot
 80iIbNiaL8JrWIIqkSsHB7rlA1enuKiOzLbsdiV49vTwTGSbQDOLuJ0tTqBuuFRsVm0y6q7P6PF
 cnITTSuXXAAYAjuKKaw==
X-Authority-Analysis: v=2.4 cv=BpuQAIX5 c=1 sm=1 tr=0 ts=69943203 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=4ZDzmxAp3Uojh03Q1XUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: bSJ6byIvkD38fHf_rVQH9U2yEenHA6N3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170076

All CONFIG_ARCH_TEGRA_2x_SOC-like symbols are now default for
ARCH_TEGRA, so drop redundant lines from defconfigs.  Tested with
comparing include/generated/autoconf.h.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on the previous pach.
---
 arch/arm/configs/multi_v7_defconfig | 4 ----
 arch/arm/configs/tegra_defconfig    | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index f75d75cf91c8..0985b8b00689 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1142,10 +1142,6 @@ CONFIG_QCOM_SOCINFO=m
 CONFIG_QCOM_STATS=m
 CONFIG_QCOM_WCNSS_CTRL=m
 CONFIG_ROCKCHIP_IODOMAIN=y
-CONFIG_ARCH_TEGRA_2x_SOC=y
-CONFIG_ARCH_TEGRA_3x_SOC=y
-CONFIG_ARCH_TEGRA_114_SOC=y
-CONFIG_ARCH_TEGRA_124_SOC=y
 CONFIG_SOC_TI=y
 CONFIG_KEYSTONE_NAVIGATOR_QMSS=y
 CONFIG_KEYSTONE_NAVIGATOR_DMA=y
diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index 68aedaf92667..66157e9721ef 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -296,10 +296,6 @@ CONFIG_CROS_EC=y
 CONFIG_CROS_EC_I2C=m
 CONFIG_CROS_EC_SPI=m
 CONFIG_TEGRA_IOMMU_SMMU=y
-CONFIG_ARCH_TEGRA_2x_SOC=y
-CONFIG_ARCH_TEGRA_3x_SOC=y
-CONFIG_ARCH_TEGRA_114_SOC=y
-CONFIG_ARCH_TEGRA_124_SOC=y
 CONFIG_ARM_TEGRA_DEVFREQ=y
 CONFIG_MEMORY=y
 CONFIG_IIO=y

-- 
2.51.0

