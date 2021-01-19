Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C399C10DC1
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 12:07:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36C4123104
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 12:07:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732604AbhASMAb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 07:00:31 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:18679 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731299AbhASI4z (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 03:56:55 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B60069eaf0001>; Tue, 19 Jan 2021 00:56:15 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 Jan
 2021 08:56:11 +0000
Received: from jckuo-lt.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Tue, 19 Jan 2021 08:56:08 +0000
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <robh@kernel.org>, <jonathanh@nvidia.com>, <kishon@ti.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH v6 06/15] phy: tegra: xusb: Add Tegra210 lane_iddq operation
Date:   Tue, 19 Jan 2021 16:55:37 +0800
Message-ID: <20210119085546.725005-7-jckuo@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210119085546.725005-1-jckuo@nvidia.com>
References: <20210119085546.725005-1-jckuo@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1611046575; bh=pC50/cSUFPxjElXevuNjUDwkacd+q7f8dpOAFKQTfVU=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=gNd6lSVOG7LMBqSTVPCwWxUSpc9l+Nd7ZDPOm/l87DloINMncFJIVcABlpIRR/GEH
         tb6CxzoNh0Pczy0lDsdch9cpxMaJHvq5Ghz0O63cuC32Q9umfeEJ1SabURneLTgq4N
         AUXGwW2PFzg6bjo1jmh8y04dK/LudVPTnPxrOXJbFIswuw4oXTWPqiLE07/NdPICPY
         SMf3jIW8KWvojQJuo/+Yt1AQx+LSQ5KlTGnIRxz1DBdYG6Lq3A33rCVODYppvbfQBL
         VWrtzd0J+O3IEqlRtAJTRg1qItcaN/yuuVoUL2r6WZiOoktXx8rY4kPSCt0X1YEB6L
         2zXaaLjeMkHAA==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

As per Tegra210 TRM, before changing lane assignments, driver should
keep lanes in IDDQ and sleep state; after changing lane assignments,
driver should bring lanes out of IDDQ.
This commit implements the required operations.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---
v6:
   no change
v5:
   no change
v4:
   no change
v3:
   add 'misc_ctl2' data member to UPHY lane for carrying MISC_PAD_PX_CTL2 o=
ffset
   tegra210_uphy_lane_iddq_[enable/disable]() to access 'misc_ctl2' data me=
mber

 drivers/phy/tegra/xusb-tegra210.c | 82 ++++++++++++++++++++++++++++---
 drivers/phy/tegra/xusb.c          |  6 +++
 drivers/phy/tegra/xusb.h          |  6 +++
 3 files changed, 86 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-teg=
ra210.c
index faacb866cd1f..b038d032fea1 100644
--- a/drivers/phy/tegra/xusb-tegra210.c
+++ b/drivers/phy/tegra/xusb-tegra210.c
@@ -198,6 +198,18 @@
 #define XUSB_PADCTL_UPHY_MISC_PAD_CTL1_AUX_RX_TERM_EN BIT(18)
 #define XUSB_PADCTL_UPHY_MISC_PAD_CTL1_AUX_RX_MODE_OVRD BIT(13)
=20
+#define XUSB_PADCTL_UPHY_MISC_PAD_PX_CTL2(x) (0x464 + (x) * 0x40)
+#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_IDDQ BIT(0)
+#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_IDDQ_OVRD BIT(1)
+#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_SLEEP_MASK (0x3 << 4)
+#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_SLEEP_VAL (0x3 << 4)
+#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_PWR_OVRD BIT(24)
+#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_IDDQ BIT(8)
+#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_IDDQ_OVRD BIT(9)
+#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_SLEEP_MASK (0x3 << 12)
+#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_SLEEP_VAL (0x3 << 12)
+#define XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_PWR_OVRD BIT(25)
+
 #define XUSB_PADCTL_UPHY_PLL_S0_CTL1 0x860
=20
 #define XUSB_PADCTL_UPHY_PLL_S0_CTL2 0x864
@@ -209,6 +221,7 @@
 #define XUSB_PADCTL_UPHY_PLL_S0_CTL8 0x87c
=20
 #define XUSB_PADCTL_UPHY_MISC_PAD_S0_CTL1 0x960
+#define XUSB_PADCTL_UPHY_MISC_PAD_S0_CTL2 0x964
=20
 #define XUSB_PADCTL_UPHY_USB3_PADX_ECTL1(x) (0xa60 + (x) * 0x40)
 #define XUSB_PADCTL_UPHY_USB3_PAD_ECTL1_TX_TERM_CTRL_SHIFT 16
@@ -1640,6 +1653,55 @@ static const struct tegra_xusb_pad_soc tegra210_hsic=
_pad =3D {
 	.ops =3D &tegra210_hsic_ops,
 };
=20
+static void tegra210_uphy_lane_iddq_enable(struct tegra_xusb_lane *lane)
+{
+	struct tegra_xusb_padctl *padctl =3D lane->pad->padctl;
+	u32 value;
+
+	value =3D padctl_readl(padctl, lane->soc->regs.misc_ctl2);
+	value |=3D XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_IDDQ_OVRD;
+	value |=3D XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_IDDQ_OVRD;
+	value |=3D XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_PWR_OVRD;
+	value |=3D XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_PWR_OVRD;
+	value |=3D XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_IDDQ;
+	value &=3D ~XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_SLEEP_MASK;
+	value |=3D XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_SLEEP_VAL;
+	value |=3D XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_IDDQ;
+	value &=3D ~XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_SLEEP_MASK;
+	value |=3D XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_SLEEP_VAL;
+	padctl_writel(padctl, value, lane->soc->regs.misc_ctl2);
+}
+
+static void tegra210_uphy_lane_iddq_disable(struct tegra_xusb_lane *lane)
+{
+	struct tegra_xusb_padctl *padctl =3D lane->pad->padctl;
+	u32 value;
+
+	value =3D padctl_readl(padctl, lane->soc->regs.misc_ctl2);
+	value &=3D ~XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_IDDQ_OVRD;
+	value &=3D ~XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_IDDQ_OVRD;
+	value &=3D ~XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_PWR_OVRD;
+	value &=3D ~XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_PWR_OVRD;
+	value |=3D XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_IDDQ;
+	value &=3D ~XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_SLEEP_MASK;
+	value |=3D XUSB_PADCTL_UPHY_MISC_PAD_CTL2_TX_SLEEP_VAL;
+	value |=3D XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_IDDQ;
+	value &=3D ~XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_SLEEP_MASK;
+	value |=3D XUSB_PADCTL_UPHY_MISC_PAD_CTL2_RX_SLEEP_VAL;
+	padctl_writel(padctl, value, lane->soc->regs.misc_ctl2);
+}
+
+#define TEGRA210_UPHY_LANE(_name, _offset, _shift, _mask, _type, _misc)	\
+	{								\
+		.name =3D _name,						\
+		.offset =3D _offset,					\
+		.shift =3D _shift,					\
+		.mask =3D _mask,						\
+		.num_funcs =3D ARRAY_SIZE(tegra210_##_type##_functions),	\
+		.funcs =3D tegra210_##_type##_functions,			\
+		.regs.misc_ctl2 =3D _misc,				\
+	}
+
 static const char *tegra210_pcie_functions[] =3D {
 	"pcie-x1",
 	"usb3-ss",
@@ -1648,13 +1710,13 @@ static const char *tegra210_pcie_functions[] =3D {
 };
=20
 static const struct tegra_xusb_lane_soc tegra210_pcie_lanes[] =3D {
-	TEGRA210_LANE("pcie-0", 0x028, 12, 0x3, pcie),
-	TEGRA210_LANE("pcie-1", 0x028, 14, 0x3, pcie),
-	TEGRA210_LANE("pcie-2", 0x028, 16, 0x3, pcie),
-	TEGRA210_LANE("pcie-3", 0x028, 18, 0x3, pcie),
-	TEGRA210_LANE("pcie-4", 0x028, 20, 0x3, pcie),
-	TEGRA210_LANE("pcie-5", 0x028, 22, 0x3, pcie),
-	TEGRA210_LANE("pcie-6", 0x028, 24, 0x3, pcie),
+	TEGRA210_UPHY_LANE("pcie-0", 0x028, 12, 0x3, pcie, XUSB_PADCTL_UPHY_MISC_=
PAD_PX_CTL2(0)),
+	TEGRA210_UPHY_LANE("pcie-1", 0x028, 14, 0x3, pcie, XUSB_PADCTL_UPHY_MISC_=
PAD_PX_CTL2(1)),
+	TEGRA210_UPHY_LANE("pcie-2", 0x028, 16, 0x3, pcie, XUSB_PADCTL_UPHY_MISC_=
PAD_PX_CTL2(2)),
+	TEGRA210_UPHY_LANE("pcie-3", 0x028, 18, 0x3, pcie, XUSB_PADCTL_UPHY_MISC_=
PAD_PX_CTL2(3)),
+	TEGRA210_UPHY_LANE("pcie-4", 0x028, 20, 0x3, pcie, XUSB_PADCTL_UPHY_MISC_=
PAD_PX_CTL2(4)),
+	TEGRA210_UPHY_LANE("pcie-5", 0x028, 22, 0x3, pcie, XUSB_PADCTL_UPHY_MISC_=
PAD_PX_CTL2(5)),
+	TEGRA210_UPHY_LANE("pcie-6", 0x028, 24, 0x3, pcie, XUSB_PADCTL_UPHY_MISC_=
PAD_PX_CTL2(6)),
 };
=20
 static struct tegra_xusb_usb3_port *
@@ -1815,6 +1877,8 @@ static void tegra210_pcie_lane_remove(struct tegra_xu=
sb_lane *lane)
 static const struct tegra_xusb_lane_ops tegra210_pcie_lane_ops =3D {
 	.probe =3D tegra210_pcie_lane_probe,
 	.remove =3D tegra210_pcie_lane_remove,
+	.iddq_enable =3D tegra210_uphy_lane_iddq_enable,
+	.iddq_disable =3D tegra210_uphy_lane_iddq_disable,
 };
=20
 static int tegra210_pcie_phy_init(struct phy *phy)
@@ -1939,7 +2003,7 @@ static const struct tegra_xusb_pad_soc tegra210_pcie_=
pad =3D {
 };
=20
 static const struct tegra_xusb_lane_soc tegra210_sata_lanes[] =3D {
-	TEGRA210_LANE("sata-0", 0x028, 30, 0x3, pcie),
+	TEGRA210_UPHY_LANE("sata-0", 0x028, 30, 0x3, pcie, XUSB_PADCTL_UPHY_MISC_=
PAD_S0_CTL2),
 };
=20
 static struct tegra_xusb_lane *
@@ -1978,6 +2042,8 @@ static void tegra210_sata_lane_remove(struct tegra_xu=
sb_lane *lane)
 static const struct tegra_xusb_lane_ops tegra210_sata_lane_ops =3D {
 	.probe =3D tegra210_sata_lane_probe,
 	.remove =3D tegra210_sata_lane_remove,
+	.iddq_enable =3D tegra210_uphy_lane_iddq_enable,
+	.iddq_disable =3D tegra210_uphy_lane_iddq_disable,
 };
=20
 static int tegra210_sata_phy_init(struct phy *phy)
diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index 3110aafa8cf6..a34d304677bb 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -321,11 +321,17 @@ static void tegra_xusb_lane_program(struct tegra_xusb=
_lane *lane)
 	if (soc->num_funcs < 2)
 		return;
=20
+	if (lane->pad->ops->iddq_enable)
+		lane->pad->ops->iddq_enable(lane);
+
 	/* choose function */
 	value =3D padctl_readl(padctl, soc->offset);
 	value &=3D ~(soc->mask << soc->shift);
 	value |=3D lane->function << soc->shift;
 	padctl_writel(padctl, value, soc->offset);
+
+	if (lane->pad->ops->iddq_disable)
+		lane->pad->ops->iddq_disable(lane);
 }
=20
 static void tegra_xusb_pad_program(struct tegra_xusb_pad *pad)
diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
index ccb5dc9b1220..e789d5ff4eb8 100644
--- a/drivers/phy/tegra/xusb.h
+++ b/drivers/phy/tegra/xusb.h
@@ -35,6 +35,10 @@ struct tegra_xusb_lane_soc {
=20
 	const char * const *funcs;
 	unsigned int num_funcs;
+
+	struct {
+		unsigned int misc_ctl2;
+	} regs;
 };
=20
 struct tegra_xusb_lane {
@@ -126,6 +130,8 @@ struct tegra_xusb_lane_ops {
 					 struct device_node *np,
 					 unsigned int index);
 	void (*remove)(struct tegra_xusb_lane *lane);
+	void (*iddq_enable)(struct tegra_xusb_lane *lane);
+	void (*iddq_disable)(struct tegra_xusb_lane *lane);
 };
=20
 bool tegra_xusb_lane_check(struct tegra_xusb_lane *lane, const char *funct=
ion);
--=20
2.25.1

