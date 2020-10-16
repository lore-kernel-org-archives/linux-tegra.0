Return-Path: <SRS0=VMTZ=DX=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B073C4363A
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Oct 2020 13:08:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B82602071A
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Oct 2020 13:08:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="I6jr9JfV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408153AbgJPNIi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 16 Oct 2020 09:08:38 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:12378 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408111AbgJPNIR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 16 Oct 2020 09:08:17 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f899ae50001>; Fri, 16 Oct 2020 06:06:45 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 16 Oct
 2020 13:08:13 +0000
Received: from jckuo-lt.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 16 Oct 2020 13:08:11 +0000
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <robh@kernel.org>, <jonathanh@nvidia.com>, <kishon@ti.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH v4 08/16] soc/tegra: pmc: Provide USB sleepwalk register map
Date:   Fri, 16 Oct 2020 21:07:18 +0800
Message-ID: <20201016130726.1378666-9-jckuo@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201016130726.1378666-1-jckuo@nvidia.com>
References: <20201016130726.1378666-1-jckuo@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1602853605; bh=U77+ls+Oksc7I+NVmjvBy90z2x10jTzt64TD15V+/2A=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=I6jr9JfVTf3bO/uJusdAnc68NkCMGUElV7GGJ+fVz3UbDWAomf5JOIJbmbrpWDMYe
         q5lc8yZwKXymH282PuHnkXIMlNqFEGjaUuK6LKrE1qFvECWmz3DSuHcnzrifl8OjxG
         zFErTcuT2uPcSbzVNQEFrusyTEUu3N7lfll3usH24hg6Kfvecw8avDFcCqnPwOVSCf
         bCapybYfWZ8mFjbpfkyS0A3c3xbaeXrTkXEhwW7+FupyDj+jh7qv2NxWQCjSZsaUwt
         RA16GvO/9lEdQSQBM9uHiUQvnaiM0skQUhXMiYIMEfPn10YOGwQyLDivRcMHX1Nws9
         PZB7x9VMxpYjQ==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This commit implements a register map which grants USB (UTMI and HSIC)
sleepwalk registers access to USB PHY drivers. The USB sleepwalk logic
is in PMC hardware block but USB PHY drivers have the best knowledge
of proper programming sequence.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---
v4:
   commit message improvement
   remove an unnecessary type cast when invokes devm_regmap_init()
v3:
   commit message improvement
   drop regmap_reg() usage
   rename 'reg' with 'offset'
   rename 'val' with 'value'
   drop '__force' when invokes devm_regmap_init()
   print error code of devm_regmap_init()
   move devm_regmap_init() a litter bit earlier
   explicitly set '.has_usb_sleepwalk=3Dfalse'

 drivers/soc/tegra/pmc.c | 94 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index df9a5ca8c99c..a619a23f9592 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -43,6 +43,7 @@
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/regmap.h>
=20
 #include <soc/tegra/common.h>
 #include <soc/tegra/fuse.h>
@@ -102,6 +103,9 @@
=20
 #define PMC_PWR_DET_VALUE		0xe4
=20
+#define PMC_USB_DEBOUNCE_DEL		0xec
+#define PMC_USB_AO			0xf0
+
 #define PMC_SCRATCH41			0x140
=20
 #define PMC_WAKE2_MASK			0x160
@@ -133,6 +137,13 @@
 #define IO_DPD2_STATUS			0x1c4
 #define SEL_DPD_TIM			0x1c8
=20
+#define PMC_UTMIP_UHSIC_TRIGGERS	0x1ec
+#define PMC_UTMIP_UHSIC_SAVED_STATE	0x1f0
+
+#define PMC_UTMIP_TERM_PAD_CFG		0x1f8
+#define PMC_UTMIP_UHSIC_SLEEP_CFG	0x1fc
+#define PMC_UTMIP_UHSIC_FAKE		0x218
+
 #define PMC_SCRATCH54			0x258
 #define  PMC_SCRATCH54_DATA_SHIFT	8
 #define  PMC_SCRATCH54_ADDR_SHIFT	0
@@ -145,8 +156,18 @@
 #define  PMC_SCRATCH55_CHECKSUM_SHIFT	16
 #define  PMC_SCRATCH55_I2CSLV1_SHIFT	0
=20
+#define  PMC_UTMIP_UHSIC_LINE_WAKEUP	0x26c
+
+#define PMC_UTMIP_BIAS_MASTER_CNTRL	0x270
+#define PMC_UTMIP_MASTER_CONFIG		0x274
+#define PMC_UTMIP_UHSIC2_TRIGGERS	0x27c
+#define PMC_UTMIP_MASTER2_CONFIG	0x29c
+
 #define GPU_RG_CNTRL			0x2d4
=20
+#define PMC_UTMIP_PAD_CFG0		0x4c0
+#define PMC_UTMIP_UHSIC_SLEEP_CFG1	0x4d0
+#define PMC_UTMIP_SLEEPWALK_P3		0x4e0
 /* Tegra186 and later */
 #define WAKE_AOWAKE_CNTRL(x) (0x000 + ((x) << 2))
 #define WAKE_AOWAKE_CNTRL_LEVEL (1 << 3)
@@ -334,6 +355,7 @@ struct tegra_pmc_soc {
 	const struct pmc_clk_init_data *pmc_clks_data;
 	unsigned int num_pmc_clks;
 	bool has_blink_output;
+	bool has_usb_sleepwalk;
 };
=20
 /**
@@ -2443,6 +2465,67 @@ static void tegra_pmc_clock_register(struct tegra_pm=
c *pmc,
 			 err);
 }
=20
+static const struct regmap_range pmc_usb_sleepwalk_ranges[] =3D {
+	regmap_reg_range(PMC_USB_DEBOUNCE_DEL, PMC_USB_AO),
+	regmap_reg_range(PMC_UTMIP_UHSIC_TRIGGERS, PMC_UTMIP_UHSIC_SAVED_STATE),
+	regmap_reg_range(PMC_UTMIP_TERM_PAD_CFG, PMC_UTMIP_UHSIC_FAKE),
+	regmap_reg_range(PMC_UTMIP_UHSIC_LINE_WAKEUP, PMC_UTMIP_UHSIC_LINE_WAKEUP=
),
+	regmap_reg_range(PMC_UTMIP_BIAS_MASTER_CNTRL, PMC_UTMIP_MASTER_CONFIG),
+	regmap_reg_range(PMC_UTMIP_UHSIC2_TRIGGERS, PMC_UTMIP_MASTER2_CONFIG),
+	regmap_reg_range(PMC_UTMIP_PAD_CFG0, PMC_UTMIP_UHSIC_SLEEP_CFG1),
+	regmap_reg_range(PMC_UTMIP_SLEEPWALK_P3, PMC_UTMIP_SLEEPWALK_P3),
+};
+
+static const struct regmap_access_table pmc_usb_sleepwalk_table =3D {
+	.yes_ranges =3D pmc_usb_sleepwalk_ranges,
+	.n_yes_ranges =3D ARRAY_SIZE(pmc_usb_sleepwalk_ranges),
+};
+
+static int tegra_pmc_regmap_readl(void *context, unsigned int offset, unsi=
gned int *value)
+{
+	struct tegra_pmc *pmc =3D context;
+
+	*value =3D tegra_pmc_readl(pmc, offset);
+	return 0;
+}
+
+static int tegra_pmc_regmap_writel(void *context, unsigned int offset, uns=
igned int value)
+{
+	struct tegra_pmc *pmc =3D context;
+
+	tegra_pmc_writel(pmc, value, offset);
+	return 0;
+}
+
+static const struct regmap_config usb_sleepwalk_regmap_config =3D {
+	.name =3D "usb_sleepwalk",
+	.reg_bits =3D 32,
+	.val_bits =3D 32,
+	.reg_stride =3D 4,
+	.fast_io =3D true,
+	.rd_table =3D &pmc_usb_sleepwalk_table,
+	.wr_table =3D &pmc_usb_sleepwalk_table,
+	.reg_read =3D tegra_pmc_regmap_readl,
+	.reg_write =3D tegra_pmc_regmap_writel,
+};
+
+static int tegra_pmc_regmap_init(struct tegra_pmc *pmc)
+{
+	struct regmap *regmap;
+	int err;
+
+	if (pmc->soc->has_usb_sleepwalk) {
+		regmap =3D devm_regmap_init(pmc->dev, NULL, pmc, &usb_sleepwalk_regmap_c=
onfig);
+		if (IS_ERR(regmap)) {
+			err =3D PTR_ERR(regmap);
+			dev_err(pmc->dev, "failed to allocate register map (%d)\n", err);
+			return err;
+		}
+	}
+
+	return 0;
+}
+
 static int tegra_pmc_probe(struct platform_device *pdev)
 {
 	void __iomem *base;
@@ -2548,6 +2631,10 @@ static int tegra_pmc_probe(struct platform_device *p=
dev)
 	if (err)
 		goto cleanup_restart_handler;
=20
+	err =3D tegra_pmc_regmap_init(pmc);
+	if (err < 0)
+		goto cleanup_restart_handler;
+
 	err =3D tegra_powergate_init(pmc, pdev->dev.of_node);
 	if (err < 0)
 		goto cleanup_powergates;
@@ -2706,6 +2793,7 @@ static const struct tegra_pmc_soc tegra20_pmc_soc =3D=
 {
 	.pmc_clks_data =3D NULL,
 	.num_pmc_clks =3D 0,
 	.has_blink_output =3D true,
+	.has_usb_sleepwalk =3D false,
 };
=20
 static const char * const tegra30_powergates[] =3D {
@@ -2764,6 +2852,7 @@ static const struct tegra_pmc_soc tegra30_pmc_soc =3D=
 {
 	.pmc_clks_data =3D tegra_pmc_clks_data,
 	.num_pmc_clks =3D ARRAY_SIZE(tegra_pmc_clks_data),
 	.has_blink_output =3D true,
+	.has_usb_sleepwalk =3D false,
 };
=20
 static const char * const tegra114_powergates[] =3D {
@@ -2818,6 +2907,7 @@ static const struct tegra_pmc_soc tegra114_pmc_soc =
=3D {
 	.pmc_clks_data =3D tegra_pmc_clks_data,
 	.num_pmc_clks =3D ARRAY_SIZE(tegra_pmc_clks_data),
 	.has_blink_output =3D true,
+	.has_usb_sleepwalk =3D false,
 };
=20
 static const char * const tegra124_powergates[] =3D {
@@ -2932,6 +3022,7 @@ static const struct tegra_pmc_soc tegra124_pmc_soc =
=3D {
 	.pmc_clks_data =3D tegra_pmc_clks_data,
 	.num_pmc_clks =3D ARRAY_SIZE(tegra_pmc_clks_data),
 	.has_blink_output =3D true,
+	.has_usb_sleepwalk =3D true,
 };
=20
 static const char * const tegra210_powergates[] =3D {
@@ -3059,6 +3150,7 @@ static const struct tegra_pmc_soc tegra210_pmc_soc =
=3D {
 	.pmc_clks_data =3D tegra_pmc_clks_data,
 	.num_pmc_clks =3D ARRAY_SIZE(tegra_pmc_clks_data),
 	.has_blink_output =3D true,
+	.has_usb_sleepwalk =3D true,
 };
=20
 #define TEGRA186_IO_PAD_TABLE(_pad)                                       =
   \
@@ -3214,6 +3306,7 @@ static const struct tegra_pmc_soc tegra186_pmc_soc =
=3D {
 	.pmc_clks_data =3D NULL,
 	.num_pmc_clks =3D 0,
 	.has_blink_output =3D false,
+	.has_usb_sleepwalk =3D false,
 };
=20
 #define TEGRA194_IO_PAD_TABLE(_pad)                                       =
       \
@@ -3347,6 +3440,7 @@ static const struct tegra_pmc_soc tegra194_pmc_soc =
=3D {
 	.pmc_clks_data =3D NULL,
 	.num_pmc_clks =3D 0,
 	.has_blink_output =3D false,
+	.has_usb_sleepwalk =3D false,
 };
=20
 static const struct tegra_pmc_regs tegra234_pmc_regs =3D {
--=20
2.25.1

