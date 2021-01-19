Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F8ABC07EBC
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 12:07:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18F0622D2A
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 12:07:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387890AbhASMBH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 07:01:07 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:18763 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731578AbhASI5f (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 03:57:35 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B60069eb30000>; Tue, 19 Jan 2021 00:56:19 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 Jan
 2021 08:56:17 +0000
Received: from jckuo-lt.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Tue, 19 Jan 2021 08:56:14 +0000
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <robh@kernel.org>, <jonathanh@nvidia.com>, <kishon@ti.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH v6 08/15] soc/tegra: pmc: Provide USB sleepwalk register map
Date:   Tue, 19 Jan 2021 16:55:39 +0800
Message-ID: <20210119085546.725005-9-jckuo@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210119085546.725005-1-jckuo@nvidia.com>
References: <20210119085546.725005-1-jckuo@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1611046579; bh=jx6+1lnUOYfifs7SkNEPUzHz6I1FpCp2KtMt0pQ8hAY=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=rFKy5BzMCUE+xUEMT8tcg+j0h3MRw3uGvhDtyu3f8EfN39+vl8exDY0SJLb2ox0Bo
         jQI9PG2cpnG6PSQS7B+tBBv0I9uDsLiyVHAmVX0Yaq2aXmtEtvevfWS4IuWjL5r8fB
         D2ELiodh4/femhIhXy5robiDf/yGe8KFiAuJ1VrTWfdIZMG5BNoDQlJ7IxUHYO2k4a
         oHsFXpkX/0RS2itF+WvHHizLgl8poUaG8F97Db9VVkDTkFMT81/orrTPVqAVROp288
         SqAn+5MaDfZR4eZAtb6i8Kyrq+O2I31fASyU1+dEU/zyD9kqziRK1q4gmny0BFPBdU
         jlKkzK9sotbGQ==
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
v6:
   no change
v5:
   no change
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

