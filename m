Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D65637C0FE
	for <linux-tegra@vger.kernel.org>; Fri, 10 Apr 2026 10:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775817518; cv=none; b=DF0VIrXUz3G5d5PUKtGbWrgYNS6hMwof4i0WnAjcjrDjZvylD9+1htaqgDFIJYDjeAR01IgXK5vaj+2M/S1pePzb/DajBQEsFG3dPIom6xrmQTmZjnKEO572zYmA30YK07cvOGv4MSjrf5UqvgsMnqVbLdCMHbaRt/JL2kYcK5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775817518; c=relaxed/simple;
	bh=w6re5Io0CJ7B07Xe/0cTaVsJ5qgW8GorXQNdVxXngbI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F2JrNWWMlLCWJt/bydm8f7oiUbAdI0nYnpfwu0hlIiKCNBVWeJy6UUXe14MwJFsLUzN+VI12ffHzMNCxQTF0fZ1bEoUQYvHZQw4XifERz3L1rUgr6TxBHO4E96qd7JvNF/cReC9XiPAyLG49NNyrfHhY/pMwpOkrPmK1D7lIVG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nag8hC+i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GJRjb9GW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nag8hC+i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GJRjb9GW"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AADVGZ1925453
	for <linux-tegra@vger.kernel.org>; Fri, 10 Apr 2026 10:38:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=y/zn9OP0pM7QKnHUQl0owACDKie0UcQRIpy
	LdhullFI=; b=nag8hC+iDBqFC0JkASg8cCXDk7NhuvVfCbMuZIoWbpGc7hyfDa/
	+I++JmL2tFNFZXQTcyycKGvE1L9JvdzX5lax1ZwNjRKECa/+6p+gwlVohCyiT8iP
	wjywleZt+VQxCXFaw9/VMPF5w1ptjaARhs8aG9yALdU9hiO2tf08WALfOBar6tf6
	fyBbmFXO63G4PN9/artm6LdlLXCF4m1C1ta0RL//ULEKBrHaMZ6NTdwe+MA3kzTN
	I6dr7jub5fNq9nqQlvs3A/ap9ivv1ivRLMLZH0/pTyncnvS8wY/JZMMVvVvKzdaY
	qHMC4fXD0Z3IQk2PE0YQRZvs8yAC0MnyQug==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudjs1sv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Fri, 10 Apr 2026 10:38:36 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-41c02dec5c1so3005236fac.2
        for <linux-tegra@vger.kernel.org>; Fri, 10 Apr 2026 03:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775817515; x=1776422315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y/zn9OP0pM7QKnHUQl0owACDKie0UcQRIpyLdhullFI=;
        b=GJRjb9GWVSHoAN3yKmAtq9+IYOkkKXotK6Tk8cn+Hi7Nb5p7ZNSBnNGmMGsqnuNcNN
         O76Tqy7BP9jAD6Qiv1jYRgAv4szShr5LIqW77oVuPQ9sQ4BzIIO6Bsd2bPjlBuJA/nNR
         hEy/YV0xJ5WFOVPM1gMHB96tdW4fRylbt0aH4RPy6Uph3Xl6SEt0L32ks/vVPwubHU5x
         kn4gMyrkjpzpADRNKdqhwd0Ho+5V9jA1uO7rn/zMvPYfoJgxZbj4OhtykhToD3xiDuxT
         Tg7Rg1FBMYRwQGillr64oLZ+AxalAkp032aGGcqHNM29ILy5CcsWcrearXDJANnn2DiR
         hnig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775817515; x=1776422315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/zn9OP0pM7QKnHUQl0owACDKie0UcQRIpyLdhullFI=;
        b=K2iYeXeO4mbGhaMBWc7BPfk5sLEr3OfVQkLhzTru8wmbIR4ks9B8VwLSxncMBz9Ui5
         J6CoRtUScT7enAWxKyU/B090Ef4UGV3/8YiFG/TK5uT7z0qift23b7OxEDM+1dzVyyJQ
         HAVH7jYDP802lruxzjrWBaa3tAip1Ye8tT5Epbo3MpJapHhcQOtceHD83ZfyVNf3/Cv7
         ygjK0xsH/Y4UDvZMatnlY5LLtcCurRiMeQpC5jXYTE1uzA25kqT1gnEE1CRVJmlupiMU
         wY0kOsiWXWV8Nhw26fx3ycXs7+4j0LJ4OfuldLtKaVyNu8GYVszLJV6Cg5BNgZrnhmad
         luAw==
X-Forwarded-Encrypted: i=1; AJvYcCUD5b2fsr8FS2K/opchse3bDIi/iB98rMo9MT2bHYfmwUnfz32jC/3GkSDyEXnyvyT9Kg2mw1iI7sY10g==@vger.kernel.org
X-Gm-Message-State: AOJu0YypJjU95duwVnCtsX/T3zKHI2w2BtzonZA/tJ61scXvnPHKx6iz
	kcvzewN4mZJo4odUgHcE5FyLM1oKlUcjFK/RkG3tDDDdPYSylDYPssQrhf5WofbwwXQM6D22wuB
	HgRWo/y0AwV84Mzl76Kb/c5K5mAJJ+lcWLswg/smpuHj5oQdZBTBH6r1ZEdXR2zTC0Q==
X-Gm-Gg: AeBDieuCmQhTZPV0OmLDXw/g+YOPSchPfnNsIjFt5Ck1hcK9xmWr/rBiiV6KoyQlU1u
	JWo6YnsqhDPpzkTqxDKAz5PGvs1uA7tdmVVZvW/3DNZGCHBQy0Etg9w7c2ZrqRBBtiKxqBYix2P
	k8aYC0cKukqcNIXxKtkhw9d4Fud0Gx0pbttvGCvYjoDxwWrPHRD0O7Al7OzP8J3vjD9ClPOrfrg
	nM0zIqJKdGm6tDJVvbEwxqVVZqgUZvnBGRY42R/tWl8zpTZS55mbTr/gcARJQXoE5b4H9n80Inx
	LYh84v+italMCANKSes+blfxGzqITsncQkjmDM3sNZmd2iGGadiFvXHBPludS+mctkd67+x1Tn2
	hpIz8vOC0q7spvk9zHzEaDzVQzCDMyfYNkF/7
X-Received: by 2002:a05:622a:998:b0:50d:830a:4213 with SMTP id d75a77b69052e-50dd5b2ef3dmr40857431cf.6.1775817017771;
        Fri, 10 Apr 2026 03:30:17 -0700 (PDT)
X-Received: by 2002:a05:622a:998:b0:50d:830a:4213 with SMTP id d75a77b69052e-50dd5b2ef3dmr40856531cf.6.1775817017244;
        Fri, 10 Apr 2026 03:30:17 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm6485997f8f.33.2026.04.10.03.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 03:30:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] pinctrl: tegra: Enable easier compile testing
Date: Fri, 10 Apr 2026 12:30:06 +0200
Message-ID: <20260410103005.163128-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3077; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=w6re5Io0CJ7B07Xe/0cTaVsJ5qgW8GorXQNdVxXngbI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp2NEtH9Vy05UJltYixEn2oehTQXIphYaeGfA+r
 +5Ipt0Nzw6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadjRLQAKCRDBN2bmhouD
 1yiZD/43no+PrepP6PmvDUOietGLjwkW8PONa9GLnMLyQChbfFhWAhHtpSDg2nKddb6cM2b3qgg
 Qy+6pf+T8rjNSNASw2vGq4wORGeInI6GI4Kwc7TPq8ZRAFuqg+XDIT1xPrh8hWIQPUTCV4Y/Ib6
 RcUOnW9X7lY1HpC8eMNODyMHvdFE46jHmkYaOlg8NcOQinJos386mSAg2f5btCm+t1s9mzwaD7S
 oyZi4RV7BgGkhLypO1gv4Q5Erbn06aPlD5k3+5gxPmSRRlw9sSvkzWqb4WBelKqpefNRkjagz27
 MP47mFG/mhaYkoS+1bWJ1wU61AR/Pbfst0dWSXFncSQVcpEarYPRWl623m0JVQrnBQUx4SCZRis
 3g0DolT9ahcUikElLFFhssLETfW3410A80IyVtnHnQDZkaFxVuOHVN8vPHaDvf6goeJfYy6hoxJ
 9o6SMUuyrp1RhH2GDF/Fq48T+Aaka38cNnaw9dybUFaqnJNpDR/7QG4VVYotuhexqK9JRtdkdea
 mErzgzypJnCMUI4UH9i4Vpdi1LtqlvypsCZizd71H1OL1iVl4KMB8eONj8SNqw8/Di1s9zs8L2G
 ar1xWgU0n/IW0Quido9mHmVK7Xz1JiW0dcWcKJejZpa1VksujjAsZkco0GVhHcdJXTpYUNGCSr1 ZKnfKn/KOf4/opw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X+hi7mTe c=1 sm=1 tr=0 ts=69d8d32c cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=0Y4yGymzkYLnMTyDTW8A:9 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-GUID: WP46EbQcCq_JeMA5VHkIYOn4jldgfqAf
X-Proofpoint-ORIG-GUID: WP46EbQcCq_JeMA5VHkIYOn4jldgfqAf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA5OCBTYWx0ZWRfX6HNNsEG+gGAk
 y2xYKFZe/1QdJq96GbVrzDdRa/WnTQNeHHR4oeytr3ne13aMpLWiIKT03Mpum9E05gsfnLnMRlG
 HcvK8ykpdbPUChN7KoXizs+Q+huwMPtI88WeQbtQp1mrK978pync67RtddgZgzAc+vtFheHSlRi
 xyvi1Imk5nRhexkGrvSsSe1OcSFbtXcsV0LmykJaEUf+HCZs9Gcwwn0XUaqpg0qj3LrSWDYkAJF
 78n3+EPBKA8mfUxd+qDC31KhAg0O3uuudilLJSS3l5FU7ONrV8XQKmPPdaLJC7050ufYrLjCMFI
 KgLnSFULsgrvw3pD7KnvnI5XstmTsTTdWP+yZ7/l+9ctbJ6LOHFsCeTeaCO+wdGyUotJFkHmkGk
 4uOy4XQTRUA8gaJ/EehzUQN65oegLy5AKhwpM2FqQlFw3w347yjui5ct+b6Xxev6XFpVnN0s+b6
 dEe40TqK4a+QhuEYlhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100098

Currently NVIDIA Tegra pin controller drivers cannot be compile tested,
unless ARCH_TEGRA is selected.  That partially defeats the purpose of
compile testing, since ARCH_TEGRA is pulled when building platform
kernels.  Solve it and allow compile testing independently of ARCH_TEGRA
choice which requires few less usual changes:

1. Descent in Makefile in to drivers/pinctrl/tegra/ unconditionally,
   because there is no menu option.

2. Depend on COMMON_CLK for PINCTRL_TEGRA20, because it uses
   clk_register_mux().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Not extensively compile tested yet. Pushing so LKP will pick it up. My
build tests are still in progress.
---
 drivers/pinctrl/Makefile      |  2 +-
 drivers/pinctrl/tegra/Kconfig | 22 ++++++++++++----------
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index f7d5d5f76d0c..9d33fa28a096 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -93,7 +93,7 @@ obj-y				+= starfive/
 obj-$(CONFIG_PINCTRL_STM32)	+= stm32/
 obj-y				+= sunplus/
 obj-$(CONFIG_PINCTRL_SUNXI)	+= sunxi/
-obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
+obj-y				+= tegra/
 obj-y				+= ti/
 obj-$(CONFIG_PINCTRL_UNIPHIER)	+= uniphier/
 obj-$(CONFIG_PINCTRL_VISCONTI)	+= visconti/
diff --git a/drivers/pinctrl/tegra/Kconfig b/drivers/pinctrl/tegra/Kconfig
index 660d101ea367..3e8789871f0f 100644
--- a/drivers/pinctrl/tegra/Kconfig
+++ b/drivers/pinctrl/tegra/Kconfig
@@ -1,43 +1,45 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config PINCTRL_TEGRA
-	bool
+	bool "NVIDIA Tegra pin controllers common" if COMPILE_TEST && !ARCH_TEGRA
 	select PINMUX
 	select PINCONF
 
 config PINCTRL_TEGRA20
-	bool
+	bool "NVIDIA Tegra20 pin controller" if COMPILE_TEST && !ARCH_TEGRA
 	select PINCTRL_TEGRA
+	depends on COMMON_CLK
 
 config PINCTRL_TEGRA30
-	bool
+	bool "NVIDIA Tegra30 pin controller" if COMPILE_TEST && !ARCH_TEGRA
 	select PINCTRL_TEGRA
 
 config PINCTRL_TEGRA114
-	bool
+	bool "NVIDIA Tegra114 pin controller" if COMPILE_TEST && !ARCH_TEGRA
 	select PINCTRL_TEGRA
 
 config PINCTRL_TEGRA124
-	bool
+	bool "NVIDIA Tegra124 pin controller" if COMPILE_TEST && !ARCH_TEGRA
 	select PINCTRL_TEGRA
 
 config PINCTRL_TEGRA210
-	bool
+	bool "NVIDIA Tegra210 pin controller" if COMPILE_TEST && !ARCH_TEGRA
 	select PINCTRL_TEGRA
 
 config PINCTRL_TEGRA186
-	bool
+	bool "NVIDIA Tegra186 pin controller" if COMPILE_TEST && !ARCH_TEGRA
 	select PINCTRL_TEGRA
 
 config PINCTRL_TEGRA194
-	bool
+	bool "NVIDIA Tegra194 pin controller" if COMPILE_TEST && !ARCH_TEGRA
 	select PINCTRL_TEGRA
 
 config PINCTRL_TEGRA234
-	bool
+	bool "NVIDIA Tegra234 pin controller" if COMPILE_TEST && !ARCH_TEGRA
 	select PINCTRL_TEGRA
 
 config PINCTRL_TEGRA_XUSB
-	def_bool y if ARCH_TEGRA
+	bool "NVIDIA Tegra XUSB pin controller" if COMPILE_TEST && !ARCH_TEGRA
+	default y if ARCH_TEGRA
 	select GENERIC_PHY
 	select PINCONF
 	select PINMUX
-- 
2.51.0

