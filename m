Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D08302742
	for <linux-tegra@vger.kernel.org>; Tue, 17 Feb 2026 09:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771319814; cv=none; b=FaoW+41gcWgG2dYSAdB01dpYhxp9nrT/j8iek9ZvCnZJWpJv8Jga39143oVQ+TIhdG8XxdJkmhN1A2L78QCUc7sWo2CiSdUCwW6Z0vc/P/isgixhDYXxuH/XOwmQXGwZjNszJl2D6IgmXsdSCOE3szSIuIFjErUiXOfTcFyX/Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771319814; c=relaxed/simple;
	bh=k6c+fAFCq4pbzIoeXXWdyPNMK0NSCD4bVWRNlKzSlyg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DWlybMcspokeu0eHdHbZ96UCj3HGy2+XsMUBqqp4dED/Ux9hO1i6qqSGy2p7jsdrhYQ+cYJeJX5CiXYDDTqkux14brnhVeY8Lm3ZBUDgdIpAB9mokONl2S6W7YV4ItGon0UibH/yQ+JVbVLbeUcQmoK6IMq34ZlNmW78z6SWHV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DieQGfno; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EebNYUdh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DieQGfno";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EebNYUdh"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GNunF71935465
	for <linux-tegra@vger.kernel.org>; Tue, 17 Feb 2026 09:16:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QqwKX0Aj2qB6OoFKo+B0WIg5ODpH3WcnUHpTRarQoSk=; b=DieQGfnoRH9FQRQM
	Qb4AXq1+w52vkXqkrA//GAhQyHvG0Y7MOqnaD4v7rsLh9It/CMr2iGHHU0xtO6fg
	0SMBmD5UOq8FA2W47WN06Fkb8yQd1/uVJNw/oJN3moaNshcDSZ45XmuT4rBMX9K5
	ae/drvvoQIG+umZUM78KiglZTMu+3RVvBa/3/N8iVwzSPoOmQqT8mL5d9gzAfBOQ
	fyIozj08d8F1KZbikRTuW6RsIS7dn8uxUdyV+jMTu6PYv6s6uezeYtUvGFPfmKyU
	+6WI8tT6ZK2R8dnzxFsAUAml+mDuaOfD/6s7MT62AFm8TjTsMJrTv/y2BoHcnbNb
	cTN0JQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc662st4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Tue, 17 Feb 2026 09:16:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb403842b6so2716258485a.1
        for <linux-tegra@vger.kernel.org>; Tue, 17 Feb 2026 01:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771319812; x=1771924612; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QqwKX0Aj2qB6OoFKo+B0WIg5ODpH3WcnUHpTRarQoSk=;
        b=EebNYUdh6IDWj81tDWwvgBFa8VHXFYjV3OBKKFD9Z39YtJsAwcOyju2nwWxToIFdJO
         2I2JRQdQpikqJzc2Mqol1s+LeEXzbxnMDVJoy6aW/thm/egnupYYpPsHfOu/gpfJi7o4
         re+MeE48UvY2wLtpm12TF/5ySqX0lvTEBR8WiExl5NlsiLLtd+UJom5wcZE9PP502w2a
         v0VL7JyTriKss27ER9Kuw58vKdjoqSqHzDMuQTUH+o+KQw9+MWcCI7ynbKLFC2s4VdPi
         loKKvmx84otDYkLxeu8XN5owhafAczIR7nNDfTsPbb7hXkLfMqobj4Yy9nsUsIU371gU
         6ahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771319812; x=1771924612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QqwKX0Aj2qB6OoFKo+B0WIg5ODpH3WcnUHpTRarQoSk=;
        b=Etdit4DIcLASqOdU0RoGluO7hXt/vLjojZz4S9FFsbtqzJeEpAH38qe6DgghWMFEAH
         6a+6NH0Isiw2zxJCWqWJmLv3xuSP8STTTQIEmfmK+cXmdfNdxB6AKHT4OrsmYcGFjrl+
         idUZeiuQSVX+OK3vNACm/fF988P9CHV9GKYriSzCUc/mke0kGEmfV/NqgssZLjf6SGt6
         Qd8F/SzhbHbJw/Vmf7ytNQOGy5T2WpJCDHdiEXY8sjTusUq20EKQBIG6L7lqrePywbkm
         sBDkGcJ5M5uHFT0jk69K6mqURzpDPPhNvTUWeGbwFJyHuVnpuriGGafAkInAw9gfnVEi
         QyqA==
X-Gm-Message-State: AOJu0Yw+Z9mW7HN8p6retHcq3MhQd7jSqmBLvFPTk9GhlR/rkVlAlhuF
	xVGZhriB9MRkrLPZVb217Mvs/Mw3nFxRqwCiNwjWS3nWtln2B/udaufspgs1wsWntOlRMime3K1
	tJIbS3KHO8/gqxAdWPjZQtuo+qwGEtuMOZfj9q3aq8KJVasqOwlXH8auNqCCOmCuYmg==
X-Gm-Gg: AZuq6aLllYHt+C2gjSAT8JkoKWocmXmN8oYa/cy1p52vCAd3ZFW+D9BOPim5OxW3CQz
	puG092ybfCbtmK2H9M0sDgfsMymKdxN4r1U+C84+6QW7/kAXBI5vRBaw4oW+rFsPZ1RSeSNkTJB
	yhEVKzyvKQhOAdS0mrXj1G8ReIPjJEPPfvuFDSyc4LlQZhIgFzITRSr4mqw8lcQQMF7GNoJ/ZFA
	lrHQNgM2P89aTheCd/lspSt8DGxT2SiTijUtCebcppH7JykGbohTL0KOq/0h4J6Ymn9DslmpCBD
	cGEfM2uSXHZK1st6f1Ttw3rHfwgUjkYIBtiYy5fAoj0TOjTpa1fHHXX9YH+8U6o+9tLNl8izoCF
	VI+e4zsWPw+scv4pl0bPhWBF0pN6YRR97Vytbmpno3IofXw==
X-Received: by 2002:a05:620a:7f6:b0:8cb:50e4:feef with SMTP id af79cd13be357-8cb50e504cdmr769423085a.84.1771319812079;
        Tue, 17 Feb 2026 01:16:52 -0800 (PST)
X-Received: by 2002:a05:620a:7f6:b0:8cb:50e4:feef with SMTP id af79cd13be357-8cb50e504cdmr769421385a.84.1771319811697;
        Tue, 17 Feb 2026 01:16:51 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a23c6csm149659595e9.7.2026.02.17.01.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 01:16:51 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 10:16:38 +0100
Subject: [PATCH 3/3] arm64: tegra: defconfig: Drop redundant
 ARCH_TEGRA_foo_SOC
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-soc-tegra-arch-kconfig-v1-3-81bf5674d032@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=975;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=k6c+fAFCq4pbzIoeXXWdyPNMK0NSCD4bVWRNlKzSlyg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBplDH83G9cfAJ6hCZ73fC6UdA+oV2rRkP/Ue4vw
 dziSKdWGumJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZQx/AAKCRDBN2bmhouD
 11bAD/sG+mX70qf+GTxnc+gi+h6tT32b41ytT/LdH3r/Os6HFuRk552uDGIjmjcVQHC/wFapmqR
 Rz1xZNJIkJmi6Rzh9hOoInLr/C5x4AIXs62acPSZAYtqcjjTvRc2GFE+iEznB79660aLl6qUN9q
 0jmhFJ02qYYHevv2bpZugLS4lsBOGR536M5jUgVPpRCuEi8vqR1qfzIlpku5MborOnoAS8LzFXe
 ogUc4imT+YJ0btrPNdbJTNklf5cYAFgTWhesjXaMjDo0twYEmaPyVlZ/p67vAHIbs5I0G3tHePC
 6+YfvltfFMY7L7bfxjUJKKHGiUOaPqYfMTQI4i3ydYCU9HUp7OjAbq9LZM10cr1syDjm8fC6vjk
 mdp09XOM0lm4ECj40JGsUBsawz3zRaJQcJrJPUoiDe0LcHRNkhXAUAbKshmh0/gWhvd3JslBgaf
 vf6/RXxcUyZBcMTPotOTFWzMqlGubBpUG9N+TH0TwROwmuqPIgkjo12BNOE/QvvkuKxzLBa9XSC
 ka3N/yX+Cz3CSX0pVzDjes22tesvT6ItkEDfbUIO4rIy7tJanQKCb4hU60T4TiUkfr6y1VNQqsy
 BDuBHiY91+itZYJlidHx18jz9wu2lm17VWRXb04cVy3Je5Alb13P4l04RE+TZ3xepJyR2NM8xQY
 Ov6jeCWiTA7asrA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA3NiBTYWx0ZWRfXyGi2vnEs1pCl
 jZtohUCTlO+2zzDlO2IZXaT+c8YLPvA38O6/8O7pjqQw/W9f1z3UnlKL7V2sNSDbaCI3ocnlXrU
 D6IPowC/4yis58NZLUR6Q/qUy1tEuLIw8P/s4Hi25kj0x2NZpAAz/jXM4Ii5653L9iVKe+XneT3
 A5Wlgqyzy/bkV+MS55KVziZHsZUFSm4L/WnU7i2FPPwt1VmxpHweILbtvoSFKuH6Sf4BVtaqTZB
 kN9H/0cSyfdC7K8d5tlhQIJcSEvI+K9QSDf8Ms0zFCdmCW6obYzDcmoNOGm8N3grR1Iv4AFK9Hi
 gjHWL185EaHcbcjbKFXni0K5cwcjon6Jqb5peU8qRR8x7WQMKPHQemNXS+77YhK1VQmPJG4ZXIT
 HWSHoaW4vl05EgWC1pNjbqSURa2yGWPkF7J5E7DhXlOLXnF54OmKXZRQ8lnH35RjThJuNytJH2M
 R4z3VY3VijM4zU5pZeQ==
X-Authority-Analysis: v=2.4 cv=Y6b1cxeN c=1 sm=1 tr=0 ts=69943204 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=llQUqvZ7wNClwjE0nKAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: _Prmt-KVoENBTNcEr0HC8gM9ThPn369A
X-Proofpoint-ORIG-GUID: _Prmt-KVoENBTNcEr0HC8gM9ThPn369A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170076

All CONFIG_ARCH_TEGRA_132_SOC-like symbols are now default for
ARCH_TEGRA, so drop redundant lines from defconfig.  Tested with
comparing include/generated/autoconf.h.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on the previous pach.
---
 arch/arm64/configs/defconfig | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b67d5b1fc45b..08971b92303c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1641,13 +1641,6 @@ CONFIG_QCOM_APR=m
 CONFIG_QCOM_ICC_BWMON=m
 CONFIG_QCOM_PBS=m
 CONFIG_ROCKCHIP_IODOMAIN=y
-CONFIG_ARCH_TEGRA_132_SOC=y
-CONFIG_ARCH_TEGRA_210_SOC=y
-CONFIG_ARCH_TEGRA_186_SOC=y
-CONFIG_ARCH_TEGRA_194_SOC=y
-CONFIG_ARCH_TEGRA_234_SOC=y
-CONFIG_ARCH_TEGRA_241_SOC=y
-CONFIG_ARCH_TEGRA_264_SOC=y
 CONFIG_TI_PRUSS=m
 CONFIG_OWL_PM_DOMAINS=y
 CONFIG_RASPBERRYPI_POWER=y

-- 
2.51.0

