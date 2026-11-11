Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794391866;
	b=r6/zIRCRH5ckR5QUXec9NP6U4VENpwYg+JQFKewOiT1axTh61p/OrG2JutviGhtdQhqC
	 w5uJtSuAuI+xCxE66t20CwF/fMwscB5JkUIJ4bR9WjaQnTqCXfjLKph3/WKAuFe3qh+jW
	 qdcjVtBritffXTNdbHeVRixwZCXWRQ6V1QGPbjXxBMru28CsGZqX3E7dFMGsy6qqvPhKE
	 w7LN2ttaJ/dql+od5hG+dee4O2N3rNxOFChlhVm3OV3GPWIZiEDRAxmqf22EtdYXhSTCe
	 xA/5Qwm96kIBP1+rE/Iujo/zy7OVl11Q5VSdqirH//QSFrBZ3jKplcFKjOeosGAyl/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391866;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ERqVg4GZOQQriW6i/ANt3fOPEW6L4lP4DmjNV7VZQGc=;
	b=cVABTGqGYDo5JCWKBXJgKCCmI1msd2XyG+9NusJI9oFnv+YhycSLwcCD6ZRPGAKmRCaN
	 EpKyN1mGe/YAcQUMVa8CafwGuJeKnrHr7OVm2u79xFE+y4McQFlvSyjAiR3Ed2sulAD+p
	 +Ypql0tdSkSAVKyeFxuAGVXxVtk+/JABU8q614JPN7+NYtNlNGZsH8Mt5fVdR0NPSqYFR
	 r3zAz5TX5bRHKjA0/mORQVGyamOIY1CEdkZOtkAKs7r1F3GwVCSAw/uX7Sqz0xE81Zj3T
	 yqUNPmtjH2BaZpheUEPgqGOoVEXdj6wsYMal6uH8nVFbfHv2L88ZugYWQco0NVfrvYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cR4TsrU+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50643606A8A8;
	Wed, 11 Nov 2026 10:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cR4TsrU+
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794391866;
	b=BRDciIe6jBd2f3/ER6Syw3XDtEAqiHGz6zEh8p61ISmIpz8RCRb3nIQc0Jz5d64jID8r
	 ca3YW0bHk8m1wy/ND/EbC9f2vif3/tFzTocREREHfVF1lvWBcsaabVKnpjsUi6uWj5hdv
	 e+JReHlwLGNSX4U56ld9cnk6JHT023u+b1XnbMZfCBg1rS5HT0Z0e74UcQwA4CjgbWSmo
	 jKG9nA56+Z+Pp8Oo6Mo+FjElhO36lEtgyWih4d/hDIKpJkgMIxlP7u5JTNiaMoFG10qmW
	 mUOIWKfJRW/3k36+A2cYnkSoglNTPi5EMaW0EyjdBXiLF9CRGyOQg9FBSUqz66F+bfw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794391866;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ERqVg4GZOQQriW6i/ANt3fOPEW6L4lP4DmjNV7VZQGc=;
	b=LUFmjj0F5/+nb6H2lrk9nTN/LG1BVyShiG/6PPjUjJGY1gdtJ5ZrIXxH5lUquCcXWynj
	 CENJ3liLbjscA/YI1/51E+x6B4+EqvKhivqi7lwQt0Z87qmNZlAi8zadQejGc+7lahoEu
	 D/lvaJQgIc/DBaAHXahWLAdY21CE0kQB1Oc4fv/y6ZUfjIH4wpW7eaEWSMQYZB/fFH9Q2
	 4RO2PYBIPP8wbL2P3mdqWjXDgeKN+vhcFxgwleQHZAYjo4bQ1WfZ3BqAZCCrsyDC4yNvW
	 wr8/rstcsFAJmoGtJ46YSzAsIEFAchIIHxJHxqO8AOAtTzeu1fVwJJPynqa0spvbKNw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 604481F00A05;
	Wed, 11 Nov 2026 10:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794391866;
	bh=ERqVg4GZOQQriW6i/ANt3fOPEW6L4lP4DmjNV7VZQGc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=cR4TsrU+JTzuZElrOKSUnSk7rPr7MiF3JqEQDjSguDDskBdB+jZI5ngy121f9ovyL
	 nJVgen3fn7JLgxMtZ17wuwBI/gdES/LzpVcdBwtLIDAtRfc9xFsWxHmNe0CXNo9nP7
	 TyzD+8Gkjib9XYXTP4tOf6wZnPfAGn9rS/CnMKS/HYstEPQ2ZNJZc1rET3VPisrZY6
	 XPCF4TNohll0nYhwj5oyvrtPXvMENEgA6qDkwcLbxLK5VFzeF+wKyUwS09BD7WZ6xL
	 UWNHgKhwIv2P3Uwz3TyigI71i2pKPHmetpSpsvzeXQTeOKGOttzoWfnAfbGEuzEzD6
	 MGzZvaC3l3qnQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4E94E48F3F;
	Wed, 11 Nov 2026 10:11:04 +0000 (UTC)
From: Patrick Fischer via B4 Relay <devnull+admin.tsv-stahl-riesa.de@kernel.org>
Date: Wed, 11 Nov 2026 11:11:00 +0100
Subject: [PATCH 5/6] memory: tegra114-emc: Program pad auto-calibration per
 channel
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261111-upstream-emc-t114-v1-5-54d9e1bceb6a@tsv-stahl-riesa.de>
References: <20261111-upstream-emc-t114-v1-0-54d9e1bceb6a@tsv-stahl-riesa.de>
In-Reply-To: <20261111-upstream-emc-t114-v1-0-54d9e1bceb6a@tsv-stahl-riesa.de>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org, 
 Patrick Fischer <admin@tsv-stahl-riesa.de>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794391862; l=3713;
 i=admin@tsv-stahl-riesa.de; s=20261020; h=from:subject:message-id;
 bh=K2SPmhgJ6C3ZE/fZgTA83RQZgcOScMG8/6jryEAwAiU=;
 b=cKfBOE8LlyrABtcd1DYsV04cH0l8FZKu6uC6HlyXjBQ3Cyyclj2nZwnk1qrbIIadsie7Or/W8
 k87Gil9yIzzARwh48prVIkb0Y0CoZLIfN6MMpps/E5gnMr0i9hCuMZT
X-Developer-Key: i=admin@tsv-stahl-riesa.de; a=ed25519;
 pk=D+v6EloYcEY9PIUHFyTM5sqcGIU/fIXzLUdkR8vjAtk=
X-Endpoint-Received: by B4 Relay for admin@tsv-stahl-riesa.de/20261020 with
 auth_id=1251
X-Original-From: Patrick Fischer <admin@tsv-stahl-riesa.de>
Reply-To: admin@tsv-stahl-riesa.de
Content-Transfer-Encoding: 7bit

From: Patrick Fischer <admin@tsv-stahl-riesa.de>

The timing tables carry a value for EMC_AUTO_CAL_CONFIG, but the driver
cannot apply it through the broadcast registers: channel 0 runs the
calibration and channel 1 takes over its results as a slave
(AUTO_CAL_SLAVE_MODE, bit 27), as the values the bootloader leaves show
(0x20f10f0f and 0x28f10f0f on a Tegra Note 7, P1640). The downstream
driver (tegra11_emc.c, rel-tegranote-r8) programs this register per
channel for the same reason.

Map the channel registers when the device tree describes them and write
the table value to channel 0 and the same value with the slave bit to
channel 1. As in the downstream driver, this happens directly on every
rate change, with the AUTO_CAL_START bit from the table. It does not
need the CCFIFO: the Tegra 4 TRM lists EMC_AUTO_CAL_CONFIG among the
shadow registers that are programmed for the new frequency before the
clock change. With an older device tree the register stays as the
bootloader set it.

Tested on a Tegra Note 7 (P1640) together with the previous patches:
the channels read 0x20f10000 and 0x28f10000 after rate changes and
EMC_AUTO_CAL_STATUS keeps changing. Before, two out of two rate changes
from pll_p at 408 MHz to pll_c at 624 MHz ended in a kernel panic; with
this series, about an hour of memory testing that switched between 408
and 624 MHz ran without errors. That points at the calibration but does
not prove it, as the old runs also had the wrong bus width.

Signed-off-by: Patrick Fischer <admin@tsv-stahl-riesa.de>
---
 drivers/memory/tegra/tegra114-emc.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/memory/tegra/tegra114-emc.c b/drivers/memory/tegra/tegra114-emc.c
index 9de3f2e728ea..d5c3142a0671 100644
--- a/drivers/memory/tegra/tegra114-emc.c
+++ b/drivers/memory/tegra/tegra114-emc.c
@@ -142,6 +142,7 @@
 
 #define EMC_AUTO_CAL_CONFIG			0x2a4
 #define EMC_AUTO_CAL_CONFIG_AUTO_CAL_START	BIT(31)
+#define EMC_AUTO_CAL_CONFIG_SLAVE_MODE		BIT(27)
 #define EMC_AUTO_CAL_INTERVAL			0x2a8
 #define EMC_AUTO_CAL_STATUS			0x2ac
 #define EMC_AUTO_CAL_STATUS_ACTIVE		BIT(31)
@@ -393,6 +394,7 @@ struct tegra_emc {
 	struct device *dev;
 	struct tegra_mc *mc;
 	void __iomem *regs;
+	void __iomem *ch_regs[2];
 	unsigned int irq;
 	struct clk *clk;
 
@@ -609,6 +611,19 @@ static int tegra114_emc_prepare_timing_change(struct tegra_emc *emc,
 		emc_ccfifo_writel(emc, timing->emc_auto_cal_config3,
 				  EMC_AUTO_CAL_CONFIG3);
 
+	/*
+	 * Channel 0 runs the pad calibration and channel 1 takes over its
+	 * results, so the two channels need different values. Without the
+	 * channel registers in the DT, keep what the bootloader set up.
+	 */
+	if (emc->ch_regs[0]) {
+		writel(timing->emc_auto_cal_config,
+		       emc->ch_regs[0] + EMC_AUTO_CAL_CONFIG);
+		writel(timing->emc_auto_cal_config |
+		       EMC_AUTO_CAL_CONFIG_SLAVE_MODE,
+		       emc->ch_regs[1] + EMC_AUTO_CAL_CONFIG);
+	}
+
 	/* DDR3: predict MRS long wait count */
 	if (emc->dram_type == DRAM_TYPE_DDR3 &&
 	    dll_change == DLL_CHANGE_ON) {
@@ -1253,6 +1268,16 @@ static int tegra114_emc_probe(struct platform_device *pdev)
 	if (IS_ERR(emc->regs))
 		return PTR_ERR(emc->regs);
 
+	/* Older device trees only describe the broadcast registers */
+	if (platform_get_resource(pdev, IORESOURCE_MEM, 2)) {
+		for (unsigned int i = 0; i < ARRAY_SIZE(emc->ch_regs); i++) {
+			emc->ch_regs[i] =
+				devm_platform_ioremap_resource(pdev, i + 1);
+			if (IS_ERR(emc->ch_regs[i]))
+				return PTR_ERR(emc->ch_regs[i]);
+		}
+	}
+
 	emc->mc = devm_tegra_memory_controller_get(dev);
 	if (IS_ERR(emc->mc))
 		return PTR_ERR(emc->mc);

-- 
2.56.0


