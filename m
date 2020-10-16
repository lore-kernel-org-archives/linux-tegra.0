Return-Path: <SRS0=VMTZ=DX=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AB58C433E7
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Oct 2020 13:08:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7B74207F7
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Oct 2020 13:08:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="RfNW3TAM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408119AbgJPNIT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 16 Oct 2020 09:08:19 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:2738 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408088AbgJPNIE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 16 Oct 2020 09:08:04 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f899b070000>; Fri, 16 Oct 2020 06:07:19 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 16 Oct
 2020 13:08:01 +0000
Received: from jckuo-lt.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 16 Oct 2020 13:07:59 +0000
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <robh@kernel.org>, <jonathanh@nvidia.com>, <kishon@ti.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH v4 03/16] phy: tegra: xusb: Move usb3 port init for Tegra210
Date:   Fri, 16 Oct 2020 21:07:13 +0800
Message-ID: <20201016130726.1378666-4-jckuo@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201016130726.1378666-1-jckuo@nvidia.com>
References: <20201016130726.1378666-1-jckuo@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1602853639; bh=QS2dTNRIu8A2GDiIMG1t9+5Q2u8fNLm91cSynv8uxsc=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=RfNW3TAMI2VxfUPRg6yCnnwmEQMAMzmwJl55pgW1UULWOq3TtKjDO7/Ok8ZP1Diwl
         m9Qn3JOX1XgMlrCQvgZm1tu40pRVKR8jyaqR1NRoetQoM3AoFSgfEFMIoyc7gGhXgA
         /Tuk3vwLZb1DTEBvXV9vWfuv3ojom4jiEA35x4OWdSgMoZNozgCKy15jUOndU6LG+p
         K8xJ5fUUWy9l7F5GM3AHiQ81pBJ1N/M6T8P8JowQFmKKt1tcC6nm7BEEPEWq/dCjQn
         S5rAZjD68RLB+C6XcSMQ7nCxnKDNT2pULHcv19tySs6Apo1AshVqNxFsM+4RSIVcLL
         vY0ClLacZ1nLA==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The programming sequence in tegra210_usb3_port_enable() is required
for both cold boot and SC7 exit, and must be performed only after
PEX/SATA UPHY is initialized. Therefore, this commit moves the
programming sequence to tegra210_usb3_phy_power_on(). PCIE/SATA phy
.power_on() stub will invoke tegra210_usb3_phy_power_on() if the lane
is assigned for XUSB super-speed.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---
v4:
   mutex_lock()/mutex_unlock() fix
   update copyright string
v3:
   new, was a part of "phy: tegra: xusb: Rearrange UPHY init on Tegra210"

 drivers/phy/tegra/xusb-tegra210.c | 316 +++++++++++++++++-------------
 drivers/phy/tegra/xusb.c          |   4 +-
 drivers/phy/tegra/xusb.h          |   4 +-
 3 files changed, 180 insertions(+), 144 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-teg=
ra210.c
index 66bd4613835b..4dc9286ec1b8 100644
--- a/drivers/phy/tegra/xusb-tegra210.c
+++ b/drivers/phy/tegra/xusb-tegra210.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2014, NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (c) 2014-2020, NVIDIA CORPORATION.  All rights reserved.
  * Copyright (C) 2015 Google, Inc.
  */
=20
@@ -256,6 +256,32 @@ to_tegra210_xusb_padctl(struct tegra_xusb_padctl *padc=
tl)
 	return container_of(padctl, struct tegra210_xusb_padctl, base);
 }
=20
+static const struct tegra_xusb_lane_map tegra210_usb3_map[] =3D {
+	{ 0, "pcie", 6 },
+	{ 1, "pcie", 5 },
+	{ 2, "pcie", 0 },
+	{ 2, "pcie", 3 },
+	{ 3, "pcie", 4 },
+	{ 3, "sata", 0 },
+	{ 0, NULL,   0 }
+};
+
+static int tegra210_usb3_lane_map(struct tegra_xusb_lane *lane)
+{
+	const struct tegra_xusb_lane_map *map;
+
+	for (map =3D tegra210_usb3_map; map->type; map++) {
+		if (map->index =3D=3D lane->index &&
+		    strcmp(map->type, lane->pad->soc->name) =3D=3D 0) {
+			dev_dbg(lane->pad->padctl->dev, "lane =3D %s map to port =3D usb3-%d\n"=
,
+				lane->pad->soc->lanes[lane->index].name, map->port);
+			return map->port;
+		}
+	}
+
+	return -EINVAL;
+}
+
 /* must be called under padctl->lock */
 static int tegra210_pex_uphy_enable(struct tegra_xusb_padctl *padctl)
 {
@@ -470,19 +496,14 @@ static void tegra210_pex_uphy_disable(struct tegra_xu=
sb_padctl *padctl)
 {
 	struct tegra_xusb_pcie_pad *pcie =3D to_pcie_pad(padctl->pcie);
=20
-	mutex_lock(&padctl->lock);
-
 	if (WARN_ON(pcie->enable =3D=3D 0))
-		goto unlock;
+		return;
=20
 	if (--pcie->enable > 0)
-		goto unlock;
+		return;
=20
 	reset_control_assert(pcie->rst);
 	clk_disable_unprepare(pcie->pll);
-
-unlock:
-	mutex_unlock(&padctl->lock);
 }
=20
 /* must be called under padctl->lock */
@@ -712,19 +733,14 @@ static void tegra210_sata_uphy_disable(struct tegra_x=
usb_padctl *padctl)
 {
 	struct tegra_xusb_sata_pad *sata =3D to_sata_pad(padctl->sata);
=20
-	mutex_lock(&padctl->lock);
-
 	if (WARN_ON(sata->enable =3D=3D 0))
-		goto unlock;
+		return;
=20
 	if (--sata->enable > 0)
-		goto unlock;
+		return;
=20
 	reset_control_assert(sata->rst);
 	clk_disable_unprepare(sata->pll);
-
-unlock:
-	mutex_unlock(&padctl->lock);
 }
=20
 static int tegra210_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
@@ -1599,6 +1615,128 @@ static const struct tegra_xusb_lane_soc tegra210_pc=
ie_lanes[] =3D {
 	TEGRA210_LANE("pcie-6", 0x028, 24, 0x3, pcie),
 };
=20
+static struct tegra_xusb_usb3_port *
+tegra210_lane_to_usb3_port(struct tegra_xusb_lane *lane)
+{
+	int port;
+
+	if (!lane || !lane->pad || !lane->pad->padctl)
+		return NULL;
+
+	port =3D tegra210_usb3_lane_map(lane);
+	if (port < 0)
+		return NULL;
+
+	return tegra_xusb_find_usb3_port(lane->pad->padctl, port);
+}
+
+static int tegra210_usb3_phy_power_on(struct phy *phy)
+{
+	struct device *dev =3D &phy->dev;
+	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
+	struct tegra_xusb_padctl *padctl =3D lane->pad->padctl;
+	struct tegra_xusb_usb3_port *usb3 =3D tegra210_lane_to_usb3_port(lane);
+	unsigned int index;
+	u32 value;
+
+	if (!usb3) {
+		dev_err(dev, "no USB3 port found for lane %u\n", lane->index);
+		return -ENODEV;
+	}
+
+	index =3D usb3->base.index;
+
+	value =3D padctl_readl(padctl, XUSB_PADCTL_SS_PORT_MAP);
+
+	if (!usb3->internal)
+		value &=3D ~XUSB_PADCTL_SS_PORT_MAP_PORTX_INTERNAL(index);
+	else
+		value |=3D XUSB_PADCTL_SS_PORT_MAP_PORTX_INTERNAL(index);
+
+	value &=3D ~XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_MASK(index);
+	value |=3D XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP(index, usb3->port);
+	padctl_writel(padctl, value, XUSB_PADCTL_SS_PORT_MAP);
+
+	value =3D padctl_readl(padctl, XUSB_PADCTL_UPHY_USB3_PADX_ECTL1(index));
+	value &=3D ~(XUSB_PADCTL_UPHY_USB3_PAD_ECTL1_TX_TERM_CTRL_MASK <<
+		   XUSB_PADCTL_UPHY_USB3_PAD_ECTL1_TX_TERM_CTRL_SHIFT);
+	value |=3D XUSB_PADCTL_UPHY_USB3_PAD_ECTL1_TX_TERM_CTRL_VAL <<
+		 XUSB_PADCTL_UPHY_USB3_PAD_ECTL1_TX_TERM_CTRL_SHIFT;
+	padctl_writel(padctl, value, XUSB_PADCTL_UPHY_USB3_PADX_ECTL1(index));
+
+	value =3D padctl_readl(padctl, XUSB_PADCTL_UPHY_USB3_PADX_ECTL2(index));
+	value &=3D ~(XUSB_PADCTL_UPHY_USB3_PAD_ECTL2_RX_CTLE_MASK <<
+		   XUSB_PADCTL_UPHY_USB3_PAD_ECTL2_RX_CTLE_SHIFT);
+	value |=3D XUSB_PADCTL_UPHY_USB3_PAD_ECTL2_RX_CTLE_VAL <<
+		 XUSB_PADCTL_UPHY_USB3_PAD_ECTL2_RX_CTLE_SHIFT;
+	padctl_writel(padctl, value, XUSB_PADCTL_UPHY_USB3_PADX_ECTL2(index));
+
+	padctl_writel(padctl, XUSB_PADCTL_UPHY_USB3_PAD_ECTL3_RX_DFE_VAL,
+		      XUSB_PADCTL_UPHY_USB3_PADX_ECTL3(index));
+
+	value =3D padctl_readl(padctl, XUSB_PADCTL_UPHY_USB3_PADX_ECTL4(index));
+	value &=3D ~(XUSB_PADCTL_UPHY_USB3_PAD_ECTL4_RX_CDR_CTRL_MASK <<
+		   XUSB_PADCTL_UPHY_USB3_PAD_ECTL4_RX_CDR_CTRL_SHIFT);
+	value |=3D XUSB_PADCTL_UPHY_USB3_PAD_ECTL4_RX_CDR_CTRL_VAL <<
+		 XUSB_PADCTL_UPHY_USB3_PAD_ECTL4_RX_CDR_CTRL_SHIFT;
+	padctl_writel(padctl, value, XUSB_PADCTL_UPHY_USB3_PADX_ECTL4(index));
+
+	padctl_writel(padctl, XUSB_PADCTL_UPHY_USB3_PAD_ECTL6_RX_EQ_CTRL_H_VAL,
+		      XUSB_PADCTL_UPHY_USB3_PADX_ECTL6(index));
+
+	value =3D padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
+	value &=3D ~XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_VCORE_DOWN(index);
+	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
+
+	usleep_range(100, 200);
+
+	value =3D padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
+	value &=3D ~XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN_EARLY(index);
+	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
+
+	usleep_range(100, 200);
+
+	value =3D padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
+	value &=3D ~XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN(index);
+	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
+
+	return 0;
+}
+
+static int tegra210_usb3_phy_power_off(struct phy *phy)
+{
+	struct device *dev =3D &phy->dev;
+	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
+	struct tegra_xusb_padctl *padctl =3D lane->pad->padctl;
+	struct tegra_xusb_usb3_port *usb3 =3D tegra210_lane_to_usb3_port(lane);
+	unsigned int index;
+	u32 value;
+
+	if (!usb3) {
+		dev_err(dev, "no USB3 port found for lane %u\n", lane->index);
+		return -ENODEV;
+	}
+
+	index =3D usb3->base.index;
+
+	value =3D padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
+	value |=3D XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN_EARLY(index);
+	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
+
+	usleep_range(100, 200);
+
+	value =3D padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
+	value |=3D XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN(index);
+	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
+
+	usleep_range(250, 350);
+
+	value =3D padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
+	value |=3D XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_VCORE_DOWN(index);
+	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
+
+	return 0;
+}
 static struct tegra_xusb_lane *
 tegra210_pcie_lane_probe(struct tegra_xusb_pad *pad, struct device_node *n=
p,
 			 unsigned int index)
@@ -1668,6 +1806,9 @@ static int tegra210_pcie_phy_power_on(struct phy *phy=
)
 	value |=3D XUSB_PADCTL_USB3_PAD_MUX_PCIE_IDDQ_DISABLE(lane->index);
 	padctl_writel(padctl, value, XUSB_PADCTL_USB3_PAD_MUX);
=20
+	if (tegra_xusb_lane_check(lane, "usb3-ss"))
+		err =3D tegra210_usb3_phy_power_on(phy);
+
 unlock:
 	mutex_unlock(&padctl->lock);
 	return err;
@@ -1677,15 +1818,22 @@ static int tegra210_pcie_phy_power_off(struct phy *=
phy)
 {
 	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
 	struct tegra_xusb_padctl *padctl =3D lane->pad->padctl;
+	int err =3D 0;
 	u32 value;
=20
+	mutex_lock(&padctl->lock);
+
 	value =3D padctl_readl(padctl, XUSB_PADCTL_USB3_PAD_MUX);
 	value &=3D ~XUSB_PADCTL_USB3_PAD_MUX_PCIE_IDDQ_DISABLE(lane->index);
 	padctl_writel(padctl, value, XUSB_PADCTL_USB3_PAD_MUX);
=20
 	tegra210_pex_uphy_disable(padctl);
=20
-	return 0;
+	if (tegra_xusb_lane_check(lane, "usb3-ss"))
+		err =3D tegra210_usb3_phy_power_off(phy);
+
+	mutex_unlock(&padctl->lock);
+	return err;
 }
=20
 static const struct phy_ops tegra210_pcie_phy_ops =3D {
@@ -1839,6 +1987,9 @@ static int tegra210_sata_phy_power_on(struct phy *phy=
)
 	value |=3D XUSB_PADCTL_USB3_PAD_MUX_SATA_IDDQ_DISABLE(lane->index);
 	padctl_writel(padctl, value, XUSB_PADCTL_USB3_PAD_MUX);
=20
+	if (tegra_xusb_lane_check(lane, "usb3-ss"))
+		err =3D tegra210_usb3_phy_power_on(phy);
+
 unlock:
 	mutex_unlock(&padctl->lock);
 	return err;
@@ -1848,15 +1999,22 @@ static int tegra210_sata_phy_power_off(struct phy *=
phy)
 {
 	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
 	struct tegra_xusb_padctl *padctl =3D lane->pad->padctl;
+	int err =3D 0;
 	u32 value;
=20
+	mutex_lock(&padctl->lock);
+
 	value =3D padctl_readl(padctl, XUSB_PADCTL_USB3_PAD_MUX);
 	value &=3D ~XUSB_PADCTL_USB3_PAD_MUX_SATA_IDDQ_DISABLE(lane->index);
 	padctl_writel(padctl, value, XUSB_PADCTL_USB3_PAD_MUX);
=20
 	tegra210_sata_uphy_disable(lane->pad->padctl);
=20
-	return 0;
+	if (tegra_xusb_lane_check(lane, "usb3-ss"))
+		err =3D tegra210_usb3_phy_power_off(phy);
+
+	mutex_unlock(&padctl->lock);
+	return err;
 }
=20
 static const struct phy_ops tegra210_sata_phy_ops =3D {
@@ -1984,137 +2142,13 @@ static const struct tegra_xusb_port_ops tegra210_h=
sic_port_ops =3D {
=20
 static int tegra210_usb3_port_enable(struct tegra_xusb_port *port)
 {
-	struct tegra_xusb_usb3_port *usb3 =3D to_usb3_port(port);
-	struct tegra_xusb_padctl *padctl =3D port->padctl;
-	struct tegra_xusb_lane *lane =3D usb3->base.lane;
-	unsigned int index =3D port->index;
-	u32 value;
-	int err;
-
-	value =3D padctl_readl(padctl, XUSB_PADCTL_SS_PORT_MAP);
-
-	if (!usb3->internal)
-		value &=3D ~XUSB_PADCTL_SS_PORT_MAP_PORTX_INTERNAL(index);
-	else
-		value |=3D XUSB_PADCTL_SS_PORT_MAP_PORTX_INTERNAL(index);
-
-	value &=3D ~XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_MASK(index);
-	value |=3D XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP(index, usb3->port);
-	padctl_writel(padctl, value, XUSB_PADCTL_SS_PORT_MAP);
-
-	/*
-	 * TODO: move this code into the PCIe/SATA PHY ->power_on() callbacks
-	 * and conditionalize based on mux function? This seems to work, but
-	 * might not be the exact proper sequence.
-	 */
-	err =3D regulator_enable(usb3->supply);
-	if (err < 0)
-		return err;
-
-	value =3D padctl_readl(padctl, XUSB_PADCTL_UPHY_USB3_PADX_ECTL1(index));
-	value &=3D ~(XUSB_PADCTL_UPHY_USB3_PAD_ECTL1_TX_TERM_CTRL_MASK <<
-		   XUSB_PADCTL_UPHY_USB3_PAD_ECTL1_TX_TERM_CTRL_SHIFT);
-	value |=3D XUSB_PADCTL_UPHY_USB3_PAD_ECTL1_TX_TERM_CTRL_VAL <<
-		 XUSB_PADCTL_UPHY_USB3_PAD_ECTL1_TX_TERM_CTRL_SHIFT;
-	padctl_writel(padctl, value, XUSB_PADCTL_UPHY_USB3_PADX_ECTL1(index));
-
-	value =3D padctl_readl(padctl, XUSB_PADCTL_UPHY_USB3_PADX_ECTL2(index));
-	value &=3D ~(XUSB_PADCTL_UPHY_USB3_PAD_ECTL2_RX_CTLE_MASK <<
-		   XUSB_PADCTL_UPHY_USB3_PAD_ECTL2_RX_CTLE_SHIFT);
-	value |=3D XUSB_PADCTL_UPHY_USB3_PAD_ECTL2_RX_CTLE_VAL <<
-		 XUSB_PADCTL_UPHY_USB3_PAD_ECTL2_RX_CTLE_SHIFT;
-	padctl_writel(padctl, value, XUSB_PADCTL_UPHY_USB3_PADX_ECTL2(index));
-
-	padctl_writel(padctl, XUSB_PADCTL_UPHY_USB3_PAD_ECTL3_RX_DFE_VAL,
-		      XUSB_PADCTL_UPHY_USB3_PADX_ECTL3(index));
-
-	value =3D padctl_readl(padctl, XUSB_PADCTL_UPHY_USB3_PADX_ECTL4(index));
-	value &=3D ~(XUSB_PADCTL_UPHY_USB3_PAD_ECTL4_RX_CDR_CTRL_MASK <<
-		   XUSB_PADCTL_UPHY_USB3_PAD_ECTL4_RX_CDR_CTRL_SHIFT);
-	value |=3D XUSB_PADCTL_UPHY_USB3_PAD_ECTL4_RX_CDR_CTRL_VAL <<
-		 XUSB_PADCTL_UPHY_USB3_PAD_ECTL4_RX_CDR_CTRL_SHIFT;
-	padctl_writel(padctl, value, XUSB_PADCTL_UPHY_USB3_PADX_ECTL4(index));
-
-	padctl_writel(padctl, XUSB_PADCTL_UPHY_USB3_PAD_ECTL6_RX_EQ_CTRL_H_VAL,
-		      XUSB_PADCTL_UPHY_USB3_PADX_ECTL6(index));
-
-	if (lane->pad =3D=3D padctl->sata)
-		err =3D tegra210_sata_uphy_enable(padctl, true);
-	else
-		err =3D tegra210_pex_uphy_enable(padctl);
-
-	if (err) {
-		dev_err(&port->dev, "%s: failed to enable UPHY: %d\n",
-			__func__, err);
-		return err;
-	}
-
-	value =3D padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
-	value &=3D ~XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_VCORE_DOWN(index);
-	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
-
-	usleep_range(100, 200);
-
-	value =3D padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
-	value &=3D ~XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN_EARLY(index);
-	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
-
-	usleep_range(100, 200);
-
-	value =3D padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
-	value &=3D ~XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN(index);
-	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
-
 	return 0;
 }
=20
 static void tegra210_usb3_port_disable(struct tegra_xusb_port *port)
 {
-	struct tegra_xusb_usb3_port *usb3 =3D to_usb3_port(port);
-	struct tegra_xusb_padctl *padctl =3D port->padctl;
-	struct tegra_xusb_lane *lane =3D port->lane;
-	unsigned int index =3D port->index;
-	u32 value;
-
-	value =3D padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
-	value |=3D XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN_EARLY(index);
-	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
-
-	usleep_range(100, 200);
-
-	value =3D padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
-	value |=3D XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN(index);
-	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
-
-	usleep_range(250, 350);
-
-	value =3D padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
-	value |=3D XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_VCORE_DOWN(index);
-	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
-
-	if (lane->pad =3D=3D padctl->sata)
-		tegra210_sata_uphy_disable(padctl);
-	else
-		tegra210_pex_uphy_disable(padctl);
-
-	regulator_disable(usb3->supply);
-
-	value =3D padctl_readl(padctl, XUSB_PADCTL_SS_PORT_MAP);
-	value &=3D ~XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_MASK(index);
-	value |=3D XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP(index, 0x7);
-	padctl_writel(padctl, value, XUSB_PADCTL_SS_PORT_MAP);
 }
=20
-static const struct tegra_xusb_lane_map tegra210_usb3_map[] =3D {
-	{ 0, "pcie", 6 },
-	{ 1, "pcie", 5 },
-	{ 2, "pcie", 0 },
-	{ 2, "pcie", 3 },
-	{ 3, "pcie", 4 },
-	{ 3, "pcie", 4 },
-	{ 0, NULL,   0 }
-};
-
 static struct tegra_xusb_lane *
 tegra210_usb3_port_map(struct tegra_xusb_port *port)
 {
diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index de4a46fe1763..f799dfae770d 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2014-2016, NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (c) 2014-2020, NVIDIA CORPORATION.  All rights reserved.
  */
=20
 #include <linux/delay.h>
@@ -376,7 +376,7 @@ static int tegra_xusb_setup_pads(struct tegra_xusb_padc=
tl *padctl)
 	return 0;
 }
=20
-static bool tegra_xusb_lane_check(struct tegra_xusb_lane *lane,
+bool tegra_xusb_lane_check(struct tegra_xusb_lane *lane,
 				  const char *function)
 {
 	const char *func =3D lane->soc->funcs[lane->function];
diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
index ea35af747066..37a5550a84ac 100644
--- a/drivers/phy/tegra/xusb.h
+++ b/drivers/phy/tegra/xusb.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (c) 2014-2015, NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (c) 2014-2020, NVIDIA CORPORATION.  All rights reserved.
  * Copyright (c) 2015, Google Inc.
  */
=20
@@ -128,6 +128,8 @@ struct tegra_xusb_lane_ops {
 	void (*remove)(struct tegra_xusb_lane *lane);
 };
=20
+bool tegra_xusb_lane_check(struct tegra_xusb_lane *lane, const char *funct=
ion);
+
 /*
  * pads
  */
--=20
2.25.1

