Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2253AFCE2
	for <linux-tegra@vger.kernel.org>; Sun,  2 Aug 2026 14:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785679870; cv=none; b=UHBAvfqQs2ayeiNOCuEVTweNA1MIr1bXh3xNysY7UVqvhurwN0t6vWQEyoE7iyXJO7I1OTHl0CKUlFz/9PWkLLoVR0bqpP6BFP918agvBPBwytHvMUaK7nlj12H2dab/icY2pwlwyVh7i2rQfvMKiA7V0mBhNsKWFiPGL1uY868=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785679870; c=relaxed/simple;
	bh=kmNNPLpqsde0L4mq3OnecKZCCNZLcryG1pWcz1C+eAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=V0QF32CWz/UsEcamiBapdJaGtZFwz7hsa+WOc0ZxKOIw1wRtVeo9boaS4ow4LROGUlc86elqLH6SL0j/tpN2O780HmhRIbrdRKmPXszj/n68cIFJ+ocVjqJox6SG+wJ+/OxEt15ei8MQKvGUJ24oZOWTBkNA00acbJqZZoQrnCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pA9c8GFq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kTsKTmB4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pA9c8GFq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kTsKTmB4"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672B6gC62009841
	for <linux-tegra@vger.kernel.org>; Sun, 2 Aug 2026 14:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CcA21w3/sZIwoJ8o6e+c2v
	yopqAU1eR1GmGZyGN0FB8=; b=pA9c8GFqUZd3LtzbaTmeHPbX9uiJiQD8gh8Op+
	UEgsMmrOyr9n5RC5OQFnjfx9yQ1CGviK13rU5cLiZMgMLuGaOPG4EyI9UagwSL0q
	f4xamCYxJaUVOPmCEGRU38vIXT4Zopv1/iWPpeP8M6Kx86PakXAyxl4eJlC67c7C
	H3isRpuaKtwyw+yyDTdewcIjiVDW/wuJANCjKnUZL/H3Elcq1XyZ9wgXF7hxPcae
	yZyp5tM2QhLBWEoSRfvijurXwvh6Yq99rfsjEa0acLjiU0e/op7vgDY0kIHa68nR
	6/kYp+KvF9PyYcS9X41lRcoTC09UdzVMjXEu2AbDGxgU/VlA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8qptxfw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Sun, 02 Aug 2026 14:11:07 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38fcaa5f82cso702446a91.3
        for <linux-tegra@vger.kernel.org>; Sun, 02 Aug 2026 07:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785679866; x=1786284666; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CcA21w3/sZIwoJ8o6e+c2vyopqAU1eR1GmGZyGN0FB8=;
        b=kTsKTmB47me3unvLAlj6L7lLSX1pqBsJtGFjSsb431mlvXfCiHU3Gw48cLiw2lL0H3
         lhNS6VBlDhr3QctTRgxlk9SXHJwyLG9yiDoQKIV57otfUEX22S6Fw2urMMbI37/D7zbl
         wdiXbqeHZSiBF3dk19yQmvr6/zswxvsk4mW8AX61Oi7nLvMYZqCkGDu/1F65pp0BQ6+N
         iYTyw/ijDXWUOtkIGWxnifJXFKoDnzXO4VfdIwIm5/I4SmlOHqUbWWzdtxbypHvShIq4
         vpsxLtZWhDU5fMpOD0g6pirXba6IftBGRo2p3UMASLYZl1qlmR7poRdfG+Caipg2h9XZ
         YNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785679866; x=1786284666;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CcA21w3/sZIwoJ8o6e+c2vyopqAU1eR1GmGZyGN0FB8=;
        b=o+xO0BsnjRXwmBGIPTidB9w9xOLxIbH3DaQ5fjI+5LFhFS9LehsOuqizvxCtpi1wQN
         TWJWFNrH6kyBodHGvijsIaYv31k81HB+rYK8O3W0ymtyU3NglSyf+fCKHMNf4TaYuhkc
         52s8mY9GKDmXqSPqhG7IZwi/dH1VqO1FPseLSh6BRfHemjFQiAU/uAf573Hwlb6TB3NJ
         UbwSRzmPaqmpLS4eVMXqnBX3ln0S/ERJsRYkLdsLpY+5mpUQeAVJ9JHEq9lKjUE1Qaob
         DxqU8QDlY8llAdJim08gLPQjoXoshKyf5Nfu6dR1BVWW32LKr3CrUS4jS2Mf9h2frkyQ
         TDfg==
X-Forwarded-Encrypted: i=1; AHgh+Ro6UrLcNFAyjKI/S50jiZ08BADDJEiQNVZdpxjsFXSY9fAj079lDVjQEh2UKLwsW8MXimFDntAZFhbyUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxavW9cuD+1z+kCGHM1o8Op9LJvw0K0Nvw0aKfVCosVMdNtl3el
	IHc63J3J8HETq3dMnHVJTcP2cCeOaZGF85ThDMdCSEBZ1Nz/UEJUvbEutTXGYJLnYwF87PS6wk2
	K9wmCEHdOOSz1l4upyqCgtQaWDIhcd4DtNJ4IP2iTmEPpY/jw8t8EGsO3BKJ+tvWtNw==
X-Gm-Gg: AR+sD11KL/DzG8OlrmxQMk0BYjJHnAsSPShTLIJUp4ndmySULkcpQugS4kHG04NfkVS
	H0xrpaCYGv3wP6iOdiTQNj0kFLQiDDbG+l0pMJG51emG4FC5fwpuO0frmBENsGSNi9aT+HgEPgC
	rPEQVmPsdtSg9l5ya7cNW19KoAoZ0PVVoLMdiOdDzaWSSEwDrYhXE5lvp62jCzX/GK8XY7vn38Y
	0XziDnKnLpATR5MGeRS5VdiS3n5wEvnoZytM8LhsIwTmHA2wf0mDneW8+olt+rMBY6aaNEVchjM
	xisDzPQG9Z/unkdB9fq4TmRPSqJomp0juSx4H+ncTg6leiUFLi3ahsgXArHT1MIIBOFm1lhc1Js
	CMtCkPp7MOwVLkTg4OgL1dQiufHLO
X-Received: by 2002:a17:90b:5627:b0:387:e0bb:57ff with SMTP id 98e67ed59e1d1-38fbc58d37fmr5602081a91.38.1785679866359;
        Sun, 02 Aug 2026 07:11:06 -0700 (PDT)
X-Received: by 2002:a17:90b:5627:b0:387:e0bb:57ff with SMTP id 98e67ed59e1d1-38fbc58d37fmr5602036a91.38.1785679865853;
        Sun, 02 Aug 2026 07:11:05 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18d9c6sm28626151eec.30.2026.08.02.07.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 07:11:05 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Sun, 02 Aug 2026 19:40:35 +0530
Subject: [PATCH] gpio: Use IRQ trigger mask helpers
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-b4b4-irq-trigger-mask-gpio-v1-1-948973636c84@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANpPb2oC/yXMwQqDMAwA0F+RnBeonRTZr4wdTI01ytQlbgzEf
 7dux3d5GxirsMGt2ED5IybzlFFeCoh9MyVGabPBOx9c7TxSRRWKvnBVSYkVn42NmBaZsYzXLgS
 KrQ8EOViUO/n+8vvjb3vTwHE9R9j3AxlJmw9+AAAA
X-Change-ID: 20260802-b4b4-irq-trigger-mask-gpio-1c3f66bcd26b
To: Keerthy <j-keerthy@ti.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
        linux-omap@vger.kernel.org, linux-unisoc@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785679857; l=10843;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=kmNNPLpqsde0L4mq3OnecKZCCNZLcryG1pWcz1C+eAk=;
 b=nQReNWb+UmnkXw/zketYQXUdCtGRweCEgZnr9tCDL9XvXxXXhw2bFFqE+AU8ZSuBCe1mtSqzE
 g9APKKoxQXzA17eSkRGAjhB9BUwLChbdS/SkdcENB32PTxTIQtPKrIf
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDEyNSBTYWx0ZWRfX573LMAiUjvYE
 yC6d7Mh9kOG34uf+r7r6UFe5hcma0K1Kpgisab3SC7odsRzqRhCQJ0jEHkyprXo7wXlTr8Eu3L3
 jTY1Rq/rRI+Tj6y13VCMSVaCfVR/0le/uhDQsW58TCSPwsX3VfgeQ/VcZWsbQk/l9wBXQHACv+j
 WNYs+5vdb/cyGxMrRVJ+PMGlFbyXsiNGmd+pt3VSP25VG66qN2Csyn1Whg/uPXA6fpN+eEJgrTS
 YiqjZtuqNyKiKB/ReBWx8OFciTTYTyzBmFdAxSP239kRB6Jcqefd9fFScEGLuTaVa5VdAMX1B+C
 Flg1JFnha/fhsbs/v+3J9dXsW3n7JYnnCx2e+JTuBj/f6ze+ipNDGDq/33MEDV7+bYH0UxK84vt
 XeGmp25Da7tGAzYWnSYpCt7O7s4KGybpXgByoQy23FzY+/YmOAfKV+76CwQorVaiUvFRWHSU0qd
 8+iancoM9re4cQ7pJSg==
X-Proofpoint-GUID: DA-phTentWQOArgfHkWmqTmTliRqaLdQ
X-Authority-Analysis: v=2.4 cv=MpViLWae c=1 sm=1 tr=0 ts=6a6f4ffb cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=UPyg-B154qBqbsG8PrAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: DA-phTentWQOArgfHkWmqTmTliRqaLdQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDEyNSBTYWx0ZWRfX3EUtPPsvgNdf
 ww1wFchlnHTDd1yo8721GjtwQpKTCLlrPupk6RnSWENsK1rOkC4NEY0GC0KoMlqRQ7mW5EusUdj
 DFZEuVhah173gjhDbMbcfgoL6NkFaIg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 phishscore=0 malwarescore=0 spamscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608020125

Use IRQ_TYPE_LEVEL_MASK and IRQ_TYPE_EDGE_BOTH instead of open-coded
trigger type combinations in irqchip callbacks.

No functional change intended.

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/gpio/gpio-davinci.c    | 8 ++++----
 drivers/gpio/gpio-mt7621.c     | 2 +-
 drivers/gpio/gpio-mvebu.c      | 4 ++--
 drivers/gpio/gpio-mxs.c        | 4 ++--
 drivers/gpio/gpio-omap.c       | 9 ++++-----
 drivers/gpio/gpio-pl061.c      | 5 ++---
 drivers/gpio/gpio-pxa.c        | 2 +-
 drivers/gpio/gpio-rda.c        | 4 ++--
 drivers/gpio/gpio-sa1100.c     | 2 +-
 drivers/gpio/gpio-sodaville.c  | 2 +-
 drivers/gpio/gpio-stmpe.c      | 2 +-
 drivers/gpio/gpio-tegra.c      | 4 ++--
 drivers/gpio/gpio-timberdale.c | 2 +-
 13 files changed, 24 insertions(+), 26 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index 270cd7c88812..cccbaea1dec2 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -285,9 +285,9 @@ static void gpio_irq_unmask(struct irq_data *d)
 
 	gpiochip_enable_irq(&chips->chip, hwirq);
 
-	status &= IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING;
+	status &= IRQ_TYPE_EDGE_BOTH;
 	if (!status)
-		status = IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING;
+		status = IRQ_TYPE_EDGE_BOTH;
 
 	if (status & IRQ_TYPE_EDGE_FALLING)
 		writel_relaxed(mask, &g->set_falling);
@@ -297,7 +297,7 @@ static void gpio_irq_unmask(struct irq_data *d)
 
 static int gpio_irq_type(struct irq_data *d, unsigned trigger)
 {
-	if (trigger & ~(IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))
+	if (trigger & ~IRQ_TYPE_EDGE_BOTH)
 		return -EINVAL;
 
 	return 0;
@@ -400,7 +400,7 @@ static int gpio_irq_type_unbanked(struct irq_data *data, unsigned trigger)
 
 	mask = __gpio_mask(i);
 
-	if (trigger & ~(IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))
+	if (trigger & ~IRQ_TYPE_EDGE_BOTH)
 		return -EINVAL;
 
 	writel_relaxed(mask, (trigger & IRQ_TYPE_EDGE_FALLING)
diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index 87086c322f08..a86f6b1060fc 100644
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -194,7 +194,7 @@ mt7621_gpio_irq_type(struct irq_data *d, unsigned int type)
 		     rg->hlevel | rg->llevel) & mask)
 			return 0;
 
-		type = IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING;
+		type = IRQ_TYPE_EDGE_BOTH;
 	}
 
 	rg->rising &= ~mask;
diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 8d3acadb0d68..93b8a08b04b9 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -1296,7 +1296,7 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 	gc = irq_get_domain_generic_chip(mvchip->domain, 0);
 	gc->private = mvchip;
 	ct = &gc->chip_types[0];
-	ct->type = IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW;
+	ct->type = IRQ_TYPE_LEVEL_MASK;
 	ct->chip.irq_mask = mvebu_gpio_level_irq_mask;
 	ct->chip.irq_unmask = mvebu_gpio_level_irq_unmask;
 	ct->chip.irq_set_type = mvebu_gpio_irq_set_type;
@@ -1305,7 +1305,7 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 	ct->chip.name = mvchip->chip.label;
 
 	ct = &gc->chip_types[1];
-	ct->type = IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING;
+	ct->type = IRQ_TYPE_EDGE_BOTH;
 	ct->chip.irq_ack = mvebu_gpio_irq_ack;
 	ct->chip.irq_mask = mvebu_gpio_edge_irq_mask;
 	ct->chip.irq_unmask = mvebu_gpio_edge_irq_unmask;
diff --git a/drivers/gpio/gpio-mxs.c b/drivers/gpio/gpio-mxs.c
index 5635694bf9f4..900315aba85a 100644
--- a/drivers/gpio/gpio-mxs.c
+++ b/drivers/gpio/gpio-mxs.c
@@ -198,7 +198,7 @@ static int mxs_gpio_init_gc(struct mxs_gpio_port *port, int irq_base)
 	gc->private = port;
 
 	ct = &gc->chip_types[0];
-	ct->type = IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW;
+	ct->type = IRQ_TYPE_LEVEL_MASK;
 	ct->chip.irq_ack = irq_gc_ack_set_bit;
 	ct->chip.irq_mask = irq_gc_mask_disable_reg;
 	ct->chip.irq_unmask = irq_gc_unmask_enable_reg;
@@ -210,7 +210,7 @@ static int mxs_gpio_init_gc(struct mxs_gpio_port *port, int irq_base)
 	ct->regs.disable = PINCTRL_PIN2IRQ(port) + MXS_CLR;
 
 	ct = &gc->chip_types[1];
-	ct->type = IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING;
+	ct->type = IRQ_TYPE_EDGE_BOTH;
 	ct->chip.irq_ack = irq_gc_ack_set_bit;
 	ct->chip.irq_mask = irq_gc_mask_disable_reg;
 	ct->chip.irq_unmask = irq_gc_unmask_enable_reg;
diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index e39723b5901b..005420baecf4 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -432,8 +432,7 @@ static int omap_gpio_irq_type(struct irq_data *d, unsigned type)
 	if (type & ~IRQ_TYPE_SENSE_MASK)
 		return -EINVAL;
 
-	if (!bank->regs->leveldetect0 &&
-		(type & (IRQ_TYPE_LEVEL_LOW|IRQ_TYPE_LEVEL_HIGH)))
+	if (!bank->regs->leveldetect0 && (type & IRQ_TYPE_LEVEL_MASK))
 		return -EINVAL;
 
 	raw_spin_lock_irqsave(&bank->lock, flags);
@@ -450,9 +449,9 @@ static int omap_gpio_irq_type(struct irq_data *d, unsigned type)
 	}
 	raw_spin_unlock_irqrestore(&bank->lock, flags);
 
-	if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_LEVEL_HIGH))
+	if (type & IRQ_TYPE_LEVEL_MASK)
 		irq_set_handler_locked(d, handle_level_irq);
-	else if (type & (IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))
+	else if (type & IRQ_TYPE_EDGE_BOTH)
 		/*
 		 * Edge IRQs are already cleared/acked in irq_handler and
 		 * not need to be masked, as result handle_edge_irq()
@@ -702,7 +701,7 @@ static void omap_gpio_unmask_irq(struct irq_data *d)
 	 * after enabing the interrupt to clear the wakeup status.
 	 */
 	if (bank->regs->leveldetect0 && bank->regs->wkup_en &&
-	    trigger & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW))
+	    trigger & IRQ_TYPE_LEVEL_MASK)
 		omap_clear_gpio_irqstatus(bank, offset);
 
 	if (trigger)
diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 919cf86fd590..fcd44e34f65e 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -132,8 +132,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 	if (offset < 0 || offset >= PL061_GPIO_NR)
 		return -EINVAL;
 
-	if ((trigger & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW)) &&
-	    (trigger & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING)))
+	if ((trigger & IRQ_TYPE_LEVEL_MASK) && (trigger & IRQ_TYPE_EDGE_BOTH))
 	{
 		dev_err(gc->parent,
 			"trying to configure line %d for both level and edge "
@@ -149,7 +148,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 	gpiois = readb(pl061->base + GPIOIS);
 	gpioibe = readb(pl061->base + GPIOIBE);
 
-	if (trigger & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW)) {
+	if (trigger & IRQ_TYPE_LEVEL_MASK) {
 		bool polarity = trigger & IRQ_TYPE_LEVEL_HIGH;
 
 		/* Disable edge detection */
diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index 5d61053e0596..2b5da973f51f 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -406,7 +406,7 @@ static int pxa_gpio_irq_type(struct irq_data *d, unsigned int type)
 		if (__gpio_is_occupied(pchip, gpio))
 			return 0;
 
-		type = IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING;
+		type = IRQ_TYPE_EDGE_BOTH;
 	}
 
 	gpdr = readl_relaxed(c->regbase + GPDR_OFFSET);
diff --git a/drivers/gpio/gpio-rda.c b/drivers/gpio/gpio-rda.c
index 7bbc6f0ce4c8..f6c05fdbe63f 100644
--- a/drivers/gpio/gpio-rda.c
+++ b/drivers/gpio/gpio-rda.c
@@ -169,9 +169,9 @@ static int rda_gpio_irq_set_type(struct irq_data *data, unsigned int flow_type)
 	if (ret)
 		return ret;
 
-	if (flow_type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_LEVEL_HIGH))
+	if (flow_type & IRQ_TYPE_LEVEL_MASK)
 		irq_set_handler_locked(data, handle_level_irq);
-	else if (flow_type & (IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))
+	else if (flow_type & IRQ_TYPE_EDGE_BOTH)
 		irq_set_handler_locked(data, handle_edge_irq);
 
 	return 0;
diff --git a/drivers/gpio/gpio-sa1100.c b/drivers/gpio/gpio-sa1100.c
index ffa73dd3b982..e4f3bf949b87 100644
--- a/drivers/gpio/gpio-sa1100.c
+++ b/drivers/gpio/gpio-sa1100.c
@@ -139,7 +139,7 @@ static int sa1100_gpio_type(struct irq_data *d, unsigned int type)
 	if (type == IRQ_TYPE_PROBE) {
 		if ((sgc->irqrising | sgc->irqfalling) & mask)
 			return 0;
-		type = IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING;
+		type = IRQ_TYPE_EDGE_BOTH;
 	}
 
 	if (type & IRQ_TYPE_EDGE_RISING)
diff --git a/drivers/gpio/gpio-sodaville.c b/drivers/gpio/gpio-sodaville.c
index 37c133837729..e2a784df275c 100644
--- a/drivers/gpio/gpio-sodaville.c
+++ b/drivers/gpio/gpio-sodaville.c
@@ -158,7 +158,7 @@ static int sdv_register_irqsupport(struct sdv_gpio_chip_data *sd,
 
 	sd->gc->private = sd;
 	ct = sd->gc->chip_types;
-	ct->type = IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW;
+	ct->type = IRQ_TYPE_LEVEL_MASK;
 	ct->regs.eoi = GPSTR;
 	ct->regs.mask = GPIO_INT;
 	ct->chip.irq_mask = irq_gc_mask_clr_bit;
diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
index 6faf30347a36..ccdf13a741b7 100644
--- a/drivers/gpio/gpio-stmpe.c
+++ b/drivers/gpio/gpio-stmpe.c
@@ -149,7 +149,7 @@ static int stmpe_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	int regoffset = offset / 8;
 	int mask = BIT(offset % 8);
 
-	if (type & IRQ_TYPE_LEVEL_LOW || type & IRQ_TYPE_LEVEL_HIGH)
+	if (type & IRQ_TYPE_LEVEL_MASK)
 		return -EINVAL;
 
 	/* STMPE801 and STMPE 1600 don't have RE and FE registers */
diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index fa6c8ee92093..ccda3a56d599 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -342,9 +342,9 @@ static int tegra_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 		return ret;
 	}
 
-	if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_LEVEL_HIGH))
+	if (type & IRQ_TYPE_LEVEL_MASK)
 		irq_set_handler_locked(d, handle_level_irq);
-	else if (type & (IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))
+	else if (type & IRQ_TYPE_EDGE_BOTH)
 		irq_set_handler_locked(d, handle_edge_irq);
 
 	if (d->parent_data)
diff --git a/drivers/gpio/gpio-timberdale.c b/drivers/gpio/gpio-timberdale.c
index ec378a4220a7..727fa1b5ad3b 100644
--- a/drivers/gpio/gpio-timberdale.c
+++ b/drivers/gpio/gpio-timberdale.c
@@ -148,7 +148,7 @@ static int timbgpio_irq_type(struct irq_data *d, unsigned trigger)
 	if (ver > 2)
 		bflr = ioread32(tgpio->membase + TGPIO_BFLR);
 
-	if (trigger & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW)) {
+	if (trigger & IRQ_TYPE_LEVEL_MASK) {
 		bflr &= ~(1 << offset);
 		flr &= ~(1 << offset);
 		if (trigger & IRQ_TYPE_LEVEL_HIGH)

---
base-commit: 415606a7be939835db9b0d6b711887586646346d
change-id: 20260802-b4b4-irq-trigger-mask-gpio-1c3f66bcd26b

Best regards,
--  
Maulik Shah <maulik.shah@oss.qualcomm.com>

