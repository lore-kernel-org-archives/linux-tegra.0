Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40E24C433E0
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 16:41:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F381D61A2B
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 16:41:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbhCYQlV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Mar 2021 12:41:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbhCYQky (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 12:40:54 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD016C06174A;
        Thu, 25 Mar 2021 09:40:53 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id j9so1224270wrx.12;
        Thu, 25 Mar 2021 09:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ebtKj0t5fFS91geJ2HeaRMHYkRbLC4QYHc0p43CsX9w=;
        b=q+Pn0eHDRGblDBTQKQ99yrmEfSD5rB4AvnIHNMR7vdUbf70JRiV6v0hriZElf0TDog
         NEcgjjr21y9t+5xx3CxasbvpNco2I8cyyzGTUBpxNJ6WjS74PwFqndfw4C7tIvrTc4Un
         CGTr0Gf8HODF+etbfKSvMwmINhKLNTZaQuzgqwfJUT7gmnAREBchUyz4MtiVEefLgAgN
         hXHIL41IVSjhXuwr3B9WhZtTg/T104OBtH8dUm9dqfE99G9cztd/c8py6sjrM8InDNcv
         cKNa9w8/n4i0MeClY0E6+A0mLSRlCU0CFki1SHcwycwJFjVJv7C/9VvRGpZ/gIce5aW0
         0DsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ebtKj0t5fFS91geJ2HeaRMHYkRbLC4QYHc0p43CsX9w=;
        b=Yn8Rn3mRtN/g5V4NYid9I4zKzw/aJExcBibytScBrqAR9RvEse+aiywM9tIgzPSPmM
         xG1bnjrTqLp7eUAP4doBzB0boIJxQG0fiXu7ygbtTflRu+pXXDWqcWPAKYhwtNsgbWUE
         qqDOhP8EAlS4Lu62mVHirVs9Q/xrLZWyMW7CHpKgI2guws/F45QTNuzbLrAp1nIu7ylL
         HywMtfSJPy2xHT6fFxXG9lCjCjF8gCEO4tmsauowSby1aJCz4tiAkY+E4QO4m4WtZ63C
         Hp0Kbb5Wh0Yo7kkoUST29EfAz35pKsiMtaaOXl8S0GRRFvHOf2/IZb0vS0C1OloXtw+h
         F3Fw==
X-Gm-Message-State: AOAM531htxMett2tDbxG4RStgZpDQclxpb/yig4LyxoXJs8EzkDw1/Rc
        Lm57niisRDsT4vPpGbAdiPU=
X-Google-Smtp-Source: ABdhPJwXZVteXJzRKOqCn0xLNhJis1zZd2vpns53KRLu5+NKaqUR9+JdNb2fkmzo8LrehgxliH3uFA==
X-Received: by 2002:adf:e7c2:: with SMTP id e2mr10446296wrn.338.1616690452300;
        Thu, 25 Mar 2021 09:40:52 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id l9sm6546359wmq.2.2021.03.25.09.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 09:40:51 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        JC Kuo <jckuo@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org
Subject: [PATCH v8 03/13] phy: tegra: xusb: Move usb3 port init for Tegra210
Date:   Thu, 25 Mar 2021 17:40:47 +0100
Message-Id: <20210325164057.793954-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325164057.793954-1-thierry.reding@gmail.com>
References: <20210325164057.793954-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: JC Kuo <jckuo@nvidia.com>

The programming sequence in tegra210_usb3_port_enable() is required
for both cold boot and SC7 exit, and must be performed only after
PEX/SATA UPHY is initialized. Therefore, this commit moves the
programming sequence to tegra210_usb3_phy_power_on(). PCIE/SATA phy
.power_on() stub will invoke tegra210_usb3_phy_power_on() if the lane
is assigned for XUSB super-speed.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/phy/tegra/xusb-tegra210.c | 316 +++++++++++++++++-------------
 drivers/phy/tegra/xusb.c          |   4 +-
 drivers/phy/tegra/xusb.h          |   4 +-
 3 files changed, 180 insertions(+), 144 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-tegra210.c
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
 
@@ -256,6 +256,32 @@ to_tegra210_xusb_padctl(struct tegra_xusb_padctl *padctl)
 	return container_of(padctl, struct tegra210_xusb_padctl, base);
 }
 
+static const struct tegra_xusb_lane_map tegra210_usb3_map[] = {
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
+	for (map = tegra210_usb3_map; map->type; map++) {
+		if (map->index == lane->index &&
+		    strcmp(map->type, lane->pad->soc->name) == 0) {
+			dev_dbg(lane->pad->padctl->dev, "lane = %s map to port = usb3-%d\n",
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
@@ -470,19 +496,14 @@ static void tegra210_pex_uphy_disable(struct tegra_xusb_padctl *padctl)
 {
 	struct tegra_xusb_pcie_pad *pcie = to_pcie_pad(padctl->pcie);
 
-	mutex_lock(&padctl->lock);
-
 	if (WARN_ON(pcie->enable == 0))
-		goto unlock;
+		return;
 
 	if (--pcie->enable > 0)
-		goto unlock;
+		return;
 
 	reset_control_assert(pcie->rst);
 	clk_disable_unprepare(pcie->pll);
-
-unlock:
-	mutex_unlock(&padctl->lock);
 }
 
 /* must be called under padctl->lock */
@@ -712,19 +733,14 @@ static void tegra210_sata_uphy_disable(struct tegra_xusb_padctl *padctl)
 {
 	struct tegra_xusb_sata_pad *sata = to_sata_pad(padctl->sata);
 
-	mutex_lock(&padctl->lock);
-
 	if (WARN_ON(sata->enable == 0))
-		goto unlock;
+		return;
 
 	if (--sata->enable > 0)
-		goto unlock;
+		return;
 
 	reset_control_assert(sata->rst);
 	clk_disable_unprepare(sata->pll);
-
-unlock:
-	mutex_unlock(&padctl->lock);
 }
 
 static int tegra210_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
@@ -1599,6 +1615,128 @@ static const struct tegra_xusb_lane_soc tegra210_pcie_lanes[] = {
 	TEGRA210_LANE("pcie-6", 0x028, 24, 0x3, pcie),
 };
 
+static struct tegra_xusb_usb3_port *
+tegra210_lane_to_usb3_port(struct tegra_xusb_lane *lane)
+{
+	int port;
+
+	if (!lane || !lane->pad || !lane->pad->padctl)
+		return NULL;
+
+	port = tegra210_usb3_lane_map(lane);
+	if (port < 0)
+		return NULL;
+
+	return tegra_xusb_find_usb3_port(lane->pad->padctl, port);
+}
+
+static int tegra210_usb3_phy_power_on(struct phy *phy)
+{
+	struct device *dev = &phy->dev;
+	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	struct tegra_xusb_usb3_port *usb3 = tegra210_lane_to_usb3_port(lane);
+	unsigned int index;
+	u32 value;
+
+	if (!usb3) {
+		dev_err(dev, "no USB3 port found for lane %u\n", lane->index);
+		return -ENODEV;
+	}
+
+	index = usb3->base.index;
+
+	value = padctl_readl(padctl, XUSB_PADCTL_SS_PORT_MAP);
+
+	if (!usb3->internal)
+		value &= ~XUSB_PADCTL_SS_PORT_MAP_PORTX_INTERNAL(index);
+	else
+		value |= XUSB_PADCTL_SS_PORT_MAP_PORTX_INTERNAL(index);
+
+	value &= ~XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_MASK(index);
+	value |= XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP(index, usb3->port);
+	padctl_writel(padctl, value, XUSB_PADCTL_SS_PORT_MAP);
+
+	value = padctl_readl(padctl, XUSB_PADCTL_UPHY_USB3_PADX_ECTL1(index));
+	value &= ~(XUSB_PADCTL_UPHY_USB3_PAD_ECTL1_TX_TERM_CTRL_MASK <<
+		   XUSB_PADCTL_UPHY_USB3_PAD_ECTL1_TX_TERM_CTRL_SHIFT);
+	value |= XUSB_PADCTL_UPHY_USB3_PAD_ECTL1_TX_TERM_CTRL_VAL <<
+		 XUSB_PADCTL_UPHY_USB3_PAD_ECTL1_TX_TERM_CTRL_SHIFT;
+	padctl_writel(padctl, value, XUSB_PADCTL_UPHY_USB3_PADX_ECTL1(index));
+
+	value = padctl_readl(padctl, XUSB_PADCTL_UPHY_USB3_PADX_ECTL2(index));
+	value &= ~(XUSB_PADCTL_UPHY_USB3_PAD_ECTL2_RX_CTLE_MASK <<
+		   XUSB_PADCTL_UPHY_USB3_PAD_ECTL2_RX_CTLE_SHIFT);
+	value |= XUSB_PADCTL_UPHY_USB3_PAD_ECTL2_RX_CTLE_VAL <<
+		 XUSB_PADCTL_UPHY_USB3_PAD_ECTL2_RX_CTLE_SHIFT;
+	padctl_writel(padctl, value, XUSB_PADCTL_UPHY_USB3_PADX_ECTL2(index));
+
+	padctl_writel(padctl, XUSB_PADCTL_UPHY_USB3_PAD_ECTL3_RX_DFE_VAL,
+		      XUSB_PADCTL_UPHY_USB3_PADX_ECTL3(index));
+
+	value = padctl_readl(padctl, XUSB_PADCTL_UPHY_USB3_PADX_ECTL4(index));
+	value &= ~(XUSB_PADCTL_UPHY_USB3_PAD_ECTL4_RX_CDR_CTRL_MASK <<
+		   XUSB_PADCTL_UPHY_USB3_PAD_ECTL4_RX_CDR_CTRL_SHIFT);
+	value |= XUSB_PADCTL_UPHY_USB3_PAD_ECTL4_RX_CDR_CTRL_VAL <<
+		 XUSB_PADCTL_UPHY_USB3_PAD_ECTL4_RX_CDR_CTRL_SHIFT;
+	padctl_writel(padctl, value, XUSB_PADCTL_UPHY_USB3_PADX_ECTL4(index));
+
+	padctl_writel(padctl, XUSB_PADCTL_UPHY_USB3_PAD_ECTL6_RX_EQ_CTRL_H_VAL,
+		      XUSB_PADCTL_UPHY_USB3_PADX_ECTL6(index));
+
+	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
+	value &= ~XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_VCORE_DOWN(index);
+	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
+
+	usleep_range(100, 200);
+
+	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
+	value &= ~XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN_EARLY(index);
+	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
+
+	usleep_range(100, 200);
+
+	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
+	value &= ~XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN(index);
+	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
+
+	return 0;
+}
+
+static int tegra210_usb3_phy_power_off(struct phy *phy)
+{
+	struct device *dev = &phy->dev;
+	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
+	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	struct tegra_xusb_usb3_port *usb3 = tegra210_lane_to_usb3_port(lane);
+	unsigned int index;
+	u32 value;
+
+	if (!usb3) {
+		dev_err(dev, "no USB3 port found for lane %u\n", lane->index);
+		return -ENODEV;
+	}
+
+	index = usb3->base.index;
+
+	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
+	value |= XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN_EARLY(index);
+	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
+
+	usleep_range(100, 200);
+
+	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
+	value |= XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN(index);
+	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
+
+	usleep_range(250, 350);
+
+	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
+	value |= XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_VCORE_DOWN(index);
+	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
+
+	return 0;
+}
 static struct tegra_xusb_lane *
 tegra210_pcie_lane_probe(struct tegra_xusb_pad *pad, struct device_node *np,
 			 unsigned int index)
@@ -1668,6 +1806,9 @@ static int tegra210_pcie_phy_power_on(struct phy *phy)
 	value |= XUSB_PADCTL_USB3_PAD_MUX_PCIE_IDDQ_DISABLE(lane->index);
 	padctl_writel(padctl, value, XUSB_PADCTL_USB3_PAD_MUX);
 
+	if (tegra_xusb_lane_check(lane, "usb3-ss"))
+		err = tegra210_usb3_phy_power_on(phy);
+
 unlock:
 	mutex_unlock(&padctl->lock);
 	return err;
@@ -1677,15 +1818,22 @@ static int tegra210_pcie_phy_power_off(struct phy *phy)
 {
 	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
 	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	int err = 0;
 	u32 value;
 
+	mutex_lock(&padctl->lock);
+
 	value = padctl_readl(padctl, XUSB_PADCTL_USB3_PAD_MUX);
 	value &= ~XUSB_PADCTL_USB3_PAD_MUX_PCIE_IDDQ_DISABLE(lane->index);
 	padctl_writel(padctl, value, XUSB_PADCTL_USB3_PAD_MUX);
 
 	tegra210_pex_uphy_disable(padctl);
 
-	return 0;
+	if (tegra_xusb_lane_check(lane, "usb3-ss"))
+		err = tegra210_usb3_phy_power_off(phy);
+
+	mutex_unlock(&padctl->lock);
+	return err;
 }
 
 static const struct phy_ops tegra210_pcie_phy_ops = {
@@ -1839,6 +1987,9 @@ static int tegra210_sata_phy_power_on(struct phy *phy)
 	value |= XUSB_PADCTL_USB3_PAD_MUX_SATA_IDDQ_DISABLE(lane->index);
 	padctl_writel(padctl, value, XUSB_PADCTL_USB3_PAD_MUX);
 
+	if (tegra_xusb_lane_check(lane, "usb3-ss"))
+		err = tegra210_usb3_phy_power_on(phy);
+
 unlock:
 	mutex_unlock(&padctl->lock);
 	return err;
@@ -1848,15 +1999,22 @@ static int tegra210_sata_phy_power_off(struct phy *phy)
 {
 	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
 	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	int err = 0;
 	u32 value;
 
+	mutex_lock(&padctl->lock);
+
 	value = padctl_readl(padctl, XUSB_PADCTL_USB3_PAD_MUX);
 	value &= ~XUSB_PADCTL_USB3_PAD_MUX_SATA_IDDQ_DISABLE(lane->index);
 	padctl_writel(padctl, value, XUSB_PADCTL_USB3_PAD_MUX);
 
 	tegra210_sata_uphy_disable(lane->pad->padctl);
 
-	return 0;
+	if (tegra_xusb_lane_check(lane, "usb3-ss"))
+		err = tegra210_usb3_phy_power_off(phy);
+
+	mutex_unlock(&padctl->lock);
+	return err;
 }
 
 static const struct phy_ops tegra210_sata_phy_ops = {
@@ -1984,137 +2142,13 @@ static const struct tegra_xusb_port_ops tegra210_hsic_port_ops = {
 
 static int tegra210_usb3_port_enable(struct tegra_xusb_port *port)
 {
-	struct tegra_xusb_usb3_port *usb3 = to_usb3_port(port);
-	struct tegra_xusb_padctl *padctl = port->padctl;
-	struct tegra_xusb_lane *lane = usb3->base.lane;
-	unsigned int index = port->index;
-	u32 value;
-	int err;
-
-	value = padctl_readl(padctl, XUSB_PADCTL_SS_PORT_MAP);
-
-	if (!usb3->internal)
-		value &= ~XUSB_PADCTL_SS_PORT_MAP_PORTX_INTERNAL(index);
-	else
-		value |= XUSB_PADCTL_SS_PORT_MAP_PORTX_INTERNAL(index);
-
-	value &= ~XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_MASK(index);
-	value |= XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP(index, usb3->port);
-	padctl_writel(padctl, value, XUSB_PADCTL_SS_PORT_MAP);
-
-	/*
-	 * TODO: move this code into the PCIe/SATA PHY ->power_on() callbacks
-	 * and conditionalize based on mux function? This seems to work, but
-	 * might not be the exact proper sequence.
-	 */
-	err = regulator_enable(usb3->supply);
-	if (err < 0)
-		return err;
-
-	value = padctl_readl(padctl, XUSB_PADCTL_UPHY_USB3_PADX_ECTL1(index));
-	value &= ~(XUSB_PADCTL_UPHY_USB3_PAD_ECTL1_TX_TERM_CTRL_MASK <<
-		   XUSB_PADCTL_UPHY_USB3_PAD_ECTL1_TX_TERM_CTRL_SHIFT);
-	value |= XUSB_PADCTL_UPHY_USB3_PAD_ECTL1_TX_TERM_CTRL_VAL <<
-		 XUSB_PADCTL_UPHY_USB3_PAD_ECTL1_TX_TERM_CTRL_SHIFT;
-	padctl_writel(padctl, value, XUSB_PADCTL_UPHY_USB3_PADX_ECTL1(index));
-
-	value = padctl_readl(padctl, XUSB_PADCTL_UPHY_USB3_PADX_ECTL2(index));
-	value &= ~(XUSB_PADCTL_UPHY_USB3_PAD_ECTL2_RX_CTLE_MASK <<
-		   XUSB_PADCTL_UPHY_USB3_PAD_ECTL2_RX_CTLE_SHIFT);
-	value |= XUSB_PADCTL_UPHY_USB3_PAD_ECTL2_RX_CTLE_VAL <<
-		 XUSB_PADCTL_UPHY_USB3_PAD_ECTL2_RX_CTLE_SHIFT;
-	padctl_writel(padctl, value, XUSB_PADCTL_UPHY_USB3_PADX_ECTL2(index));
-
-	padctl_writel(padctl, XUSB_PADCTL_UPHY_USB3_PAD_ECTL3_RX_DFE_VAL,
-		      XUSB_PADCTL_UPHY_USB3_PADX_ECTL3(index));
-
-	value = padctl_readl(padctl, XUSB_PADCTL_UPHY_USB3_PADX_ECTL4(index));
-	value &= ~(XUSB_PADCTL_UPHY_USB3_PAD_ECTL4_RX_CDR_CTRL_MASK <<
-		   XUSB_PADCTL_UPHY_USB3_PAD_ECTL4_RX_CDR_CTRL_SHIFT);
-	value |= XUSB_PADCTL_UPHY_USB3_PAD_ECTL4_RX_CDR_CTRL_VAL <<
-		 XUSB_PADCTL_UPHY_USB3_PAD_ECTL4_RX_CDR_CTRL_SHIFT;
-	padctl_writel(padctl, value, XUSB_PADCTL_UPHY_USB3_PADX_ECTL4(index));
-
-	padctl_writel(padctl, XUSB_PADCTL_UPHY_USB3_PAD_ECTL6_RX_EQ_CTRL_H_VAL,
-		      XUSB_PADCTL_UPHY_USB3_PADX_ECTL6(index));
-
-	if (lane->pad == padctl->sata)
-		err = tegra210_sata_uphy_enable(padctl, true);
-	else
-		err = tegra210_pex_uphy_enable(padctl);
-
-	if (err) {
-		dev_err(&port->dev, "%s: failed to enable UPHY: %d\n",
-			__func__, err);
-		return err;
-	}
-
-	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
-	value &= ~XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_VCORE_DOWN(index);
-	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
-
-	usleep_range(100, 200);
-
-	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
-	value &= ~XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN_EARLY(index);
-	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
-
-	usleep_range(100, 200);
-
-	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
-	value &= ~XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN(index);
-	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
-
 	return 0;
 }
 
 static void tegra210_usb3_port_disable(struct tegra_xusb_port *port)
 {
-	struct tegra_xusb_usb3_port *usb3 = to_usb3_port(port);
-	struct tegra_xusb_padctl *padctl = port->padctl;
-	struct tegra_xusb_lane *lane = port->lane;
-	unsigned int index = port->index;
-	u32 value;
-
-	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
-	value |= XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN_EARLY(index);
-	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
-
-	usleep_range(100, 200);
-
-	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
-	value |= XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_CLAMP_EN(index);
-	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
-
-	usleep_range(250, 350);
-
-	value = padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
-	value |= XUSB_PADCTL_ELPG_PROGRAM1_SSPX_ELPG_VCORE_DOWN(index);
-	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
-
-	if (lane->pad == padctl->sata)
-		tegra210_sata_uphy_disable(padctl);
-	else
-		tegra210_pex_uphy_disable(padctl);
-
-	regulator_disable(usb3->supply);
-
-	value = padctl_readl(padctl, XUSB_PADCTL_SS_PORT_MAP);
-	value &= ~XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP_MASK(index);
-	value |= XUSB_PADCTL_SS_PORT_MAP_PORTX_MAP(index, 0x7);
-	padctl_writel(padctl, value, XUSB_PADCTL_SS_PORT_MAP);
 }
 
-static const struct tegra_xusb_lane_map tegra210_usb3_map[] = {
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
index 941006f503e4..3110aafa8cf6 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2014-2016, NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (c) 2014-2020, NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <linux/delay.h>
@@ -376,7 +376,7 @@ static int tegra_xusb_setup_pads(struct tegra_xusb_padctl *padctl)
 	return 0;
 }
 
-static bool tegra_xusb_lane_check(struct tegra_xusb_lane *lane,
+bool tegra_xusb_lane_check(struct tegra_xusb_lane *lane,
 				  const char *function)
 {
 	const char *func = lane->soc->funcs[lane->function];
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
 
@@ -128,6 +128,8 @@ struct tegra_xusb_lane_ops {
 	void (*remove)(struct tegra_xusb_lane *lane);
 };
 
+bool tegra_xusb_lane_check(struct tegra_xusb_lane *lane, const char *function);
+
 /*
  * pads
  */
-- 
2.30.2

