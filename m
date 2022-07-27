Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F667C04A68
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Jul 2022 10:53:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230350AbiG0Kxi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 27 Jul 2022 06:53:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbiG0Kxh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 27 Jul 2022 06:53:37 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF5F23F329;
        Wed, 27 Jul 2022 03:53:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+/L/Q5rqsrGrXenMFp3Az+Evut0SZdOGt3OZN1/ablEAcW9d5khsWRvmqpZXGB2X4APIWmQ/KDyuHU2LHoU1BU/Rc2oOxSvUJ0pKHBnTh7+AKJlyRwUpDasbjkx/bGQCe+uSkrdjouXsA001u31WIyCChtcdpIms9I4iwjft7DVUxMXZJ4hBjnAgn4QNaUPjFBb9NDkvwufzoYIduZ1b8vhFynznRM/ACQYWzEAEUuXRIu8sRCl/fvzhCgoKdM2Mdpg0qCtfE1k2YiZqhCvTRlCEACxqB283dPD1JHl9AmyL/OLzYVcE1+Gshe9w9xgVL2mz/N54zc4kcCr01PDYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y153DK/GI5QuMyg4zUmXG44fmLb4Qj0QpjgjeUh2A8g=;
 b=LSxwGCkWe4KheaX1e+B10h3wxOrCspNTpUqbaDOeusOHkScVzkj4LV9Uj/SqWuUffog1rMeWzu0nYJ2CBIZBYc5Mc1eyG81gvUTu1OxoWHWZXjCFa5WWCKX8o8jZucA++YtSKs4EeHjnASAdcMoVk9p718iiPEyfUYiVOqIQoEFjhoMROs1LhOhNY0gKqsEdE6wTbPFm3ETxFeDdM3tXh1FnuFQhh7fcrHzOf+NAkszvjVTQ8Mqgr1Qz6Ey1QeHveSKe1MqgHNkap7EVGKnXziwa5agXBMZqoz8oo6IvpNLHdfeS3jMKJysZY+aJeeoPRqg5w+W4+GLPB+Hj7OmFew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y153DK/GI5QuMyg4zUmXG44fmLb4Qj0QpjgjeUh2A8g=;
 b=p8WKsRs7yMoo6cvBYmy1r4847vAIcl2X1TYVYGjO8li3TRiHKZ9axYPW3J4Jd07K1aAniD2bHvWMrO0tCHEPJZJaFxdtSWGLllGl+gYYLQkSfTsni+3xytEfQ8zfwGIk4ZTDnhSG6tZtiQTwJqq2iXbPXlQfrhA5AqnNjLcF8PCKYkVZpfpvWewcD/Ck941m++s/KyJyERTUI9V+2GD5LPYNusDdrHPnfMUWpRJyDFifO3qr1/ppAYCZtbi5pcDJSzifvtmPpP16Hc/ZJk+FOKXgpI2gw1gknUKXI0nxEQKJBjT4erD6FzxlTDzbeGS3SScdKmJJ1Yx7vha54oQHdg==
Received: from BN6PR17CA0016.namprd17.prod.outlook.com (2603:10b6:404:65::26)
 by DM6PR12MB2697.namprd12.prod.outlook.com (2603:10b6:5:49::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Wed, 27 Jul
 2022 10:53:33 +0000
Received: from BN8NAM11FT006.eop-nam11.prod.protection.outlook.com
 (2603:10b6:404:65:cafe::ce) by BN6PR17CA0016.outlook.office365.com
 (2603:10b6:404:65::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.7 via Frontend
 Transport; Wed, 27 Jul 2022 10:53:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.236) by
 BN8NAM11FT006.mail.protection.outlook.com (10.13.177.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5482.10 via Frontend Transport; Wed, 27 Jul 2022 10:53:33 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.32; Wed, 27 Jul
 2022 10:53:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Wed, 27 Jul
 2022 03:53:20 -0700
Received: from jilin-desktop.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.986.26 via Frontend
 Transport; Wed, 27 Jul 2022 03:53:18 -0700
From:   Jim Lin <jilin@nvidia.com>
To:     <jckuo@nvidia.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <balbi@kernel.org>,
        <vkoul@kernel.org>, <gregkh@linuxfoundation.org>,
        <mathias.nyman@intel.com>, Jim Lin <jilin@nvidia.com>,
        Allie Liu <alliel@nvidia.com>
Subject: [PATCH] xhci: tegra: USB2 pad power controls
Date:   Wed, 27 Jul 2022 18:53:14 +0800
Message-ID: <20220727105314.14681-1-jilin@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43f9b9bf-5e3f-4690-5e29-08da6fbe3ff8
X-MS-TrafficTypeDiagnostic: DM6PR12MB2697:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6NH3a6c1K+/i6n6pCe3o1KqIAgwW1v4e0Zog1zrig9HeDpva1BrFHFEVN23UKdOL4RJIFvQPqUkak32EvrJrapFbX8ctNFlKGoyS9o67qsUnxHC08kGWC9jj9Mx54zNiaFBdJlJpuogopfxx5IkVuHBWJE0len9JaykePOXFPmxK/HcF8D4a5LYKrs7dfvRcap+DnK4fcK1vpBCMeuAjG/Zmi+XV9oIDD5F88K0fc9UPEJlatptwOwQ8t3vbLHc0ERTvqW/ZtwDDxFnO0OPptqaIxbSLchuzoHZbdxwcJcexpvC/Pmw/08kYLCyZQ0FExqnpS6y5zpme4oGP4Sxgq5IPQR4xhprZ/ypTqQwKvIGf/63WZEnMhyYYHIqiqqJZXTJaTD/6VLIgWPwOV7MQTrCP38ig9UiWzJs95fKItxgBBzQt4rcLTP4/1S0UpM9+9jxlupij92d8bFvJ/cz7bTyF+/mKWui6eccHEVJhzHrk/6A10cH/XtfHc6LTSJzKcKtJg90Xr2bw6VVFFqz+aoe0jrVHEAM3YyKiyliLdXZUS34fpyTSn4gffj7cyQ2MfT5FPylBR2vBxvZdu1c5AnwcjCqE7hO4Ph/KZPPRlQ9FCC9Bbhh64NyTYV643VxudtICXMkkpq9KqKHrIUB5cFDj3VHpAFS7l7ufEHX8Xxy6BKTPA0lqjZNN0y4H0p0UzYbFm18xseuQJpfUppdU7YZKfe7mrsWjAoLlMfGs3bblHrd7CCZYHcFpcZxXxu7dpCl/A9Ck9kwyFD77UznuyQh3q48kCfR6xdL8Vs40no6c3cSoihXPgPkeJbe4OvJKN0Ez6j/750V960ZeZM0WJg==
X-Forefront-Antispam-Report: CIP:12.22.5.236;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:InfoNoRecords;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(396003)(39860400002)(36840700001)(40470700004)(46966006)(6666004)(86362001)(5660300002)(41300700001)(40460700003)(83380400001)(2906002)(478600001)(426003)(82310400005)(6862004)(30864003)(8936002)(7696005)(107886003)(2616005)(336012)(47076005)(36860700001)(6636002)(1076003)(186003)(40480700001)(81166007)(26005)(356005)(82740400003)(70586007)(70206006)(36756003)(54906003)(8676002)(316002)(4326008)(37006003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 10:53:33.1401
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43f9b9bf-5e3f-4690-5e29-08da6fbe3ff8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[12.22.5.236];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2697
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Program USB2 pad PD controls during port
connect/disconnect, port suspend/resume etc
as suggested by HW to reduce power consumption.

Squash following fixes from local kernel 4.9 to this commit:
ce4e7e5 usb: host: tegra: Power on utmi pads
3a10c61 usb: tegra: Program USB2 pad PD controls
4e62fbb xhci: tegra: move pad power on to non-atomic place
ed0fb0a usb: xhci: tegra: don't use hs_pls in xhci-iov
401801a usb: xhci: add USB2 pad PD control for Test Mode

Signed-off-by: Allie Liu <alliel@nvidia.com>
Signed-off-by: Jim Lin <jilin@nvidia.com>
---
 drivers/phy/tegra/xusb-tegra186.c   |  27 +++--
 drivers/phy/tegra/xusb.c            |  32 +++++-
 drivers/phy/tegra/xusb.h            |   4 +-
 drivers/usb/gadget/udc/tegra-xudc.c |   8 +-
 drivers/usb/host/xhci-hub.c         |   2 +
 drivers/usb/host/xhci-tegra.c       | 146 +++++++++++++++++++++++++++-
 include/linux/phy/tegra/xusb.h      |   4 +-
 7 files changed, 209 insertions(+), 14 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
index ae3915ed9fef..4eb29189ebfc 100644
--- a/drivers/phy/tegra/xusb-tegra186.c
+++ b/drivers/phy/tegra/xusb-tegra186.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2016-2020, NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (c) 2016-2022, NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <linux/delay.h>
@@ -642,20 +642,25 @@ static void tegra_phy_xusb_utmi_pad_power_on(struct phy *phy)
 {
 	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
 	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	struct tegra_xusb_usb2_lane *usb2 = to_usb2_lane(lane);
 	struct tegra_xusb_usb2_port *port;
-	struct device *dev = padctl->dev;
 	unsigned int index = lane->index;
 	u32 value;
 
+	dev_dbg(padctl->dev, "power on UTMI pads %u\n", index);
+
 	if (!phy)
 		return;
 
 	port = tegra_xusb_find_usb2_port(padctl, index);
 	if (!port) {
-		dev_err(dev, "no port found for USB2 lane %u\n", index);
+		dev_err(padctl->dev, "no port found for USB2 lane %u\n", index);
 		return;
 	}
 
+	if (usb2->powered_on)
+		return;
+
 	tegra186_utmi_bias_pad_power_on(padctl);
 
 	udelay(2);
@@ -667,18 +672,26 @@ static void tegra_phy_xusb_utmi_pad_power_on(struct phy *phy)
 	value = padctl_readl(padctl, XUSB_PADCTL_USB2_OTG_PADX_CTL1(index));
 	value &= ~USB2_OTG_PD_DR;
 	padctl_writel(padctl, value, XUSB_PADCTL_USB2_OTG_PADX_CTL1(index));
+
+	usb2->powered_on = true;
 }
 
 static void tegra_phy_xusb_utmi_pad_power_down(struct phy *phy)
 {
 	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
 	struct tegra_xusb_padctl *padctl = lane->pad->padctl;
+	struct tegra_xusb_usb2_lane *usb2 = to_usb2_lane(lane);
 	unsigned int index = lane->index;
 	u32 value;
 
+	dev_dbg(padctl->dev, "power down UTMI pad %u\n", index);
+
 	if (!phy)
 		return;
 
+	if (!usb2->powered_on)
+		return;
+
 	value = padctl_readl(padctl, XUSB_PADCTL_USB2_OTG_PADX_CTL0(index));
 	value |= USB2_OTG_PD;
 	padctl_writel(padctl, value, XUSB_PADCTL_USB2_OTG_PADX_CTL0(index));
@@ -688,8 +701,9 @@ static void tegra_phy_xusb_utmi_pad_power_down(struct phy *phy)
 	padctl_writel(padctl, value, XUSB_PADCTL_USB2_OTG_PADX_CTL1(index));
 
 	udelay(2);
-
 	tegra186_utmi_bias_pad_power_off(padctl);
+
+	usb2->powered_on = false;
 }
 
 static int tegra186_xusb_padctl_vbus_override(struct tegra_xusb_padctl *padctl,
@@ -849,14 +863,11 @@ static int tegra186_utmi_phy_power_on(struct phy *phy)
 	value |= RPD_CTRL(priv->calib.rpd_ctrl);
 	padctl_writel(padctl, value, XUSB_PADCTL_USB2_OTG_PADX_CTL1(index));
 
-	/* TODO: pad power saving */
-	tegra_phy_xusb_utmi_pad_power_on(phy);
 	return 0;
 }
 
 static int tegra186_utmi_phy_power_off(struct phy *phy)
 {
-	/* TODO: pad power saving */
 	tegra_phy_xusb_utmi_pad_power_down(phy);
 
 	return 0;
@@ -1486,6 +1497,8 @@ static const struct tegra_xusb_padctl_ops tegra186_xusb_padctl_ops = {
 	.suspend_noirq = tegra186_xusb_padctl_suspend_noirq,
 	.resume_noirq = tegra186_xusb_padctl_resume_noirq,
 	.vbus_override = tegra186_xusb_padctl_vbus_override,
+	.utmi_pad_power_on = tegra_phy_xusb_utmi_pad_power_on,
+	.utmi_pad_power_down = tegra_phy_xusb_utmi_pad_power_down,
 };
 
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC)
diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index 963de5913e50..a6c7550e3a3a 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2014-2020, NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (c) 2014-2022, NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <linux/delay.h>
@@ -1446,6 +1446,36 @@ int tegra_xusb_padctl_set_vbus_override(struct tegra_xusb_padctl *padctl,
 }
 EXPORT_SYMBOL_GPL(tegra_xusb_padctl_set_vbus_override);
 
+void tegra_phy_xusb_utmi_pad_power_on(struct phy *phy)
+{
+	struct tegra_xusb_lane *lane;
+	struct tegra_xusb_padctl *padctl;
+
+	if (!phy)
+		return;
+
+	lane = phy_get_drvdata(phy);
+	padctl = lane->pad->padctl;
+	if (padctl->soc->ops->utmi_pad_power_on)
+		padctl->soc->ops->utmi_pad_power_on(phy);
+}
+EXPORT_SYMBOL_GPL(tegra_phy_xusb_utmi_pad_power_on);
+
+void tegra_phy_xusb_utmi_pad_power_down(struct phy *phy)
+{
+	struct tegra_xusb_lane *lane;
+	struct tegra_xusb_padctl *padctl;
+
+	if (!phy)
+		return;
+
+	lane = phy_get_drvdata(phy);
+	padctl = lane->pad->padctl;
+	if (padctl->soc->ops->utmi_pad_power_down)
+		padctl->soc->ops->utmi_pad_power_down(phy);
+}
+EXPORT_SYMBOL_GPL(tegra_phy_xusb_utmi_pad_power_down);
+
 int tegra_phy_xusb_utmi_port_reset(struct phy *phy)
 {
 	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
index 034f7a2c28d6..02cc5c6a588e 100644
--- a/drivers/phy/tegra/xusb.h
+++ b/drivers/phy/tegra/xusb.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (c) 2014-2020, NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (c) 2014-2022, NVIDIA CORPORATION.  All rights reserved.
  * Copyright (c) 2015, Google Inc.
  */
 
@@ -411,6 +411,8 @@ struct tegra_xusb_padctl_ops {
 	int (*usb3_set_lfps_detect)(struct tegra_xusb_padctl *padctl,
 				    unsigned int index, bool enable);
 	int (*vbus_override)(struct tegra_xusb_padctl *padctl, bool set);
+	void (*utmi_pad_power_on)(struct phy *phy);
+	void (*utmi_pad_power_down)(struct phy *phy);
 	int (*utmi_port_reset)(struct phy *phy);
 };
 
diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 43f1b0d461c1..bca059b58bc9 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -2,7 +2,7 @@
 /*
  * NVIDIA Tegra XUSB device mode controller
  *
- * Copyright (c) 2013-2019, NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (c) 2013-2022, NVIDIA CORPORATION.  All rights reserved.
  * Copyright (c) 2015, Google Inc.
  */
 
@@ -703,6 +703,9 @@ static void tegra_xudc_device_mode_on(struct tegra_xudc *xudc)
 
 	pm_runtime_get_sync(xudc->dev);
 
+	if (xudc->curr_utmi_phy)
+		tegra_phy_xusb_utmi_pad_power_on(xudc->curr_utmi_phy);
+
 	err = phy_power_on(xudc->curr_utmi_phy);
 	if (err < 0)
 		dev_err(xudc->dev, "UTMI power on failed: %d\n", err);
@@ -757,6 +760,9 @@ static void tegra_xudc_device_mode_off(struct tegra_xudc *xudc)
 	/* Make sure interrupt handler has completed before powergating. */
 	synchronize_irq(xudc->irq);
 
+	if (xudc->curr_utmi_phy)
+		tegra_phy_xusb_utmi_pad_power_down(xudc->curr_utmi_phy);
+
 	err = phy_power_off(xudc->curr_utmi_phy);
 	if (err < 0)
 		dev_err(xudc->dev, "UTMI PHY power off failed: %d\n", err);
diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index af946c42b6f0..9e458a748a4f 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -646,6 +646,7 @@ struct xhci_hub *xhci_get_rhub(struct usb_hcd *hcd)
 		return &xhci->usb3_rhub;
 	return &xhci->usb2_rhub;
 }
+EXPORT_SYMBOL_GPL(xhci_get_rhub);
 
 /*
  * xhci_set_port_power() must be called with xhci->lock held.
@@ -1604,6 +1605,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 	spin_unlock_irqrestore(&xhci->lock, flags);
 	return retval;
 }
+EXPORT_SYMBOL_GPL(xhci_hub_control);
 
 /*
  * Returns 0 if the status hasn't changed, or the number of bytes in buf.
diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index c8af2cd2216d..ea7863cae180 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -2,7 +2,7 @@
 /*
  * NVIDIA Tegra xHCI host controller driver
  *
- * Copyright (c) 2014-2020, NVIDIA CORPORATION. All rights reserved.
+ * Copyright (c) 2014-2022, NVIDIA CORPORATION. All rights reserved.
  * Copyright (C) 2014 Google, Inc.
  */
 
@@ -189,6 +189,13 @@ struct tegra_xusb_context_soc {
 	} fpci;
 };
 
+enum tegra_xhci_phy_type {
+	USB3_PHY,
+	USB2_PHY,
+	HSIC_PHY,
+	MAX_PHY_TYPES,
+};
+
 struct tegra_xusb_soc {
 	const char *firmware;
 	const char * const *supply_names;
@@ -274,10 +281,16 @@ struct tegra_xusb {
 
 	bool suspended;
 	struct tegra_xusb_context context;
+	u32 enable_utmi_pad_after_lp0_exit;
 };
 
 static struct hc_driver __read_mostly tegra_xhci_hc_driver;
 
+static inline struct tegra_xusb *hcd_to_tegra_xusb(struct usb_hcd *hcd)
+{
+	return (struct tegra_xusb *) dev_get_drvdata(hcd->self.controller);
+}
+
 static inline u32 fpci_readl(struct tegra_xusb *tegra, unsigned int offset)
 {
 	return readl(tegra->fpci_base + offset);
@@ -1949,12 +1962,32 @@ static void tegra_xhci_enable_phy_sleepwalk_wake(struct tegra_xusb *tegra)
 static void tegra_xhci_disable_phy_wake(struct tegra_xusb *tegra)
 {
 	struct tegra_xusb_padctl *padctl = tegra->padctl;
-	unsigned int i;
+	unsigned int i, j;
+	char phy_name[5];
 
 	for (i = 0; i < tegra->num_phys; i++) {
 		if (!tegra->phys[i])
 			continue;
+		if (tegra_xusb_padctl_remote_wake_detected(padctl, tegra->phys[i])) {
+			if (i < (tegra->soc->ports.usb3.offset +
+					tegra->soc->ports.usb3.count)) {
+				j = i;
+				strcpy(phy_name, "usb3");
+			} else if (i < (tegra->soc->ports.usb2.offset +
+					tegra->soc->ports.usb2.count)) {
+				j = i - tegra->soc->ports.usb2.offset;
+				strcpy(phy_name, "usb2");
+
+				tegra_phy_xusb_utmi_pad_power_on(tegra->phys[i]);
+			} else {
+				j = i - (tegra->soc->ports.usb2.offset +
+					tegra->soc->ports.usb2.count);
+				strcpy(phy_name, "hsic");
+			}
+			dev_dbg(tegra->dev,
+				"%s port %u (0 based) remote wake detected\n", phy_name, j);
 
+		}
 		tegra_xusb_padctl_disable_phy_wake(padctl, tegra->phys[i]);
 	}
 }
@@ -1967,11 +2000,27 @@ static void tegra_xhci_disable_phy_sleepwalk(struct tegra_xusb *tegra)
 	for (i = 0; i < tegra->num_phys; i++) {
 		if (!tegra->phys[i])
 			continue;
-
 		tegra_xusb_padctl_disable_phy_sleepwalk(padctl, tegra->phys[i]);
 	}
 }
 
+static void tegra_xhci_program_utmi_power_lp0_exit(
+	struct tegra_xusb *tegra)
+{
+	unsigned int i;
+
+	for (i = 0; i < tegra->soc->ports.usb2.count; i++) {
+		if (!is_host_mode_phy(tegra, USB2_PHY, i))
+			continue;
+		if (tegra->enable_utmi_pad_after_lp0_exit & BIT(i))
+			tegra_phy_xusb_utmi_pad_power_on(
+					tegra->phys[tegra->soc->ports.usb2.offset + i]);
+		else
+			tegra_phy_xusb_utmi_pad_power_down(
+					tegra->phys[tegra->soc->ports.usb2.offset + i]);
+	}
+}
+
 static int tegra_xusb_enter_elpg(struct tegra_xusb *tegra, bool runtime)
 {
 	struct xhci_hcd *xhci = hcd_to_xhci(tegra->hcd);
@@ -1980,6 +2029,7 @@ static int tegra_xusb_enter_elpg(struct tegra_xusb *tegra, bool runtime)
 	unsigned int i;
 	int err;
 	u32 usbcmd;
+	u32 portsc;
 
 	dev_dbg(dev, "entering ELPG\n");
 
@@ -1993,6 +2043,16 @@ static int tegra_xusb_enter_elpg(struct tegra_xusb *tegra, bool runtime)
 		goto out;
 	}
 
+	for (i = 0; i < tegra->soc->ports.usb2.count; i++) {
+		if (!xhci->usb2_rhub.ports[i])
+			continue;
+		portsc = readl(xhci->usb2_rhub.ports[i]->addr);
+		tegra->enable_utmi_pad_after_lp0_exit &= ~BIT(i);
+		if (((portsc & PORT_PLS_MASK) == XDEV_U3) ||
+			((portsc & DEV_SPEED_MASK) == XDEV_FS))
+			tegra->enable_utmi_pad_after_lp0_exit |= BIT(i);
+	}
+
 	err = xhci_suspend(xhci, wakeup);
 	if (err < 0) {
 		dev_err(tegra->dev, "failed to suspend XHCI: %d\n", err);
@@ -2067,6 +2127,9 @@ static int tegra_xusb_exit_elpg(struct tegra_xusb *tegra, bool runtime)
 		phy_power_on(tegra->phys[i]);
 	}
 
+	if (tegra->suspended)
+		tegra_xhci_program_utmi_power_lp0_exit(tegra);
+
 	tegra_xusb_config(tegra);
 	tegra_xusb_restore_context(tegra);
 
@@ -2437,6 +2500,82 @@ static int tegra_xhci_setup(struct usb_hcd *hcd)
 	return xhci_gen_setup(hcd, tegra_xhci_quirks);
 }
 
+static int tegra_xhci_hub_control(struct usb_hcd *hcd, u16 type_req,
+		u16 value, u16 index, char *buf, u16 length)
+
+{
+	struct tegra_xusb *tegra = hcd_to_tegra_xusb(hcd);
+	struct xhci_hub *rhub;
+	struct xhci_bus_state *bus_state;
+	int port = (index & 0xff) - 1;
+	int port_index;
+	struct xhci_port **ports;
+	u32 portsc;
+	int ret;
+
+	rhub = xhci_get_rhub(hcd);
+	bus_state = &rhub->bus_state;
+	if (bus_state->resuming_ports && hcd->speed == HCD_USB2) {
+		ports = rhub->ports;
+		port_index = rhub->num_ports;
+		while (port_index--) {
+			if (!test_bit(port_index, &bus_state->resuming_ports))
+				continue;
+			portsc = readl(ports[port_index]->addr);
+			if ((port_index < tegra->soc->ports.usb2.count)
+					&& ((portsc & PORT_PLS_MASK) == XDEV_RESUME))
+				tegra_phy_xusb_utmi_pad_power_on(
+					tegra->phys[tegra->soc->ports.usb2.offset + port_index]);
+		}
+	}
+
+	if (hcd->speed == HCD_USB2) {
+		if ((type_req == ClearPortFeature) &&
+				(value == USB_PORT_FEAT_SUSPEND))
+			tegra_phy_xusb_utmi_pad_power_on(
+				tegra->phys[tegra->soc->ports.usb2.offset + port]);
+	}
+
+	ret = xhci_hub_control(hcd, type_req, value, index, buf, length);
+
+	if ((hcd->speed == HCD_USB2) && (ret == 0)) {
+		if ((type_req == SetPortFeature) &&
+			(value == USB_PORT_FEAT_SUSPEND))
+			/* We dont suspend the PAD while HNP role swap happens
+			 * on the OTG port
+			 */
+			if (!((hcd->self.otg_port == (port + 1)) &&
+					hcd->self.b_hnp_enable))
+				tegra_phy_xusb_utmi_pad_power_down(
+					tegra->phys[tegra->soc->ports.usb2.offset + port]);
+
+		if ((type_req == ClearPortFeature) &&
+				(value == USB_PORT_FEAT_C_CONNECTION)) {
+			rhub = xhci_get_rhub(hcd);
+			ports = rhub->ports;
+			portsc = readl(ports[port]->addr);
+			if (portsc & PORT_CONNECT)
+				tegra_phy_xusb_utmi_pad_power_on(
+					  tegra->phys[tegra->soc->ports.usb2.offset + port]);
+			else {
+				/* We dont suspend the PAD while HNP
+				 * role swap happens on the OTG port
+				 */
+				if (!((hcd->self.otg_port == (port + 1))
+						&& hcd->self.b_hnp_enable))
+					tegra_phy_xusb_utmi_pad_power_down(
+						tegra->phys[tegra->soc->ports.usb2.offset + port]);
+			}
+		}
+		if ((type_req == SetPortFeature) &&
+		    (value == USB_PORT_FEAT_TEST))
+			tegra_phy_xusb_utmi_pad_power_on(
+				tegra->phys[tegra->soc->ports.usb2.offset + port]);
+	}
+
+	return ret;
+}
+
 static const struct xhci_driver_overrides tegra_xhci_overrides __initconst = {
 	.reset = tegra_xhci_setup,
 };
@@ -2444,6 +2583,7 @@ static const struct xhci_driver_overrides tegra_xhci_overrides __initconst = {
 static int __init tegra_xusb_init(void)
 {
 	xhci_init_driver(&tegra_xhci_hc_driver, &tegra_xhci_overrides);
+	tegra_xhci_hc_driver.hub_control = tegra_xhci_hub_control;
 
 	return platform_driver_register(&tegra_xusb_driver);
 }
diff --git a/include/linux/phy/tegra/xusb.h b/include/linux/phy/tegra/xusb.h
index 3a35e74cdc61..70998e6dd6fd 100644
--- a/include/linux/phy/tegra/xusb.h
+++ b/include/linux/phy/tegra/xusb.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (c) 2016-2020, NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (c) 2016-2022, NVIDIA CORPORATION.  All rights reserved.
  */
 
 #ifndef PHY_TEGRA_XUSB_H
@@ -21,6 +21,8 @@ int tegra_xusb_padctl_usb3_set_lfps_detect(struct tegra_xusb_padctl *padctl,
 					   unsigned int port, bool enable);
 int tegra_xusb_padctl_set_vbus_override(struct tegra_xusb_padctl *padctl,
 					bool val);
+void tegra_phy_xusb_utmi_pad_power_on(struct phy *phy);
+void tegra_phy_xusb_utmi_pad_power_down(struct phy *phy);
 int tegra_phy_xusb_utmi_port_reset(struct phy *phy);
 int tegra_xusb_padctl_get_usb3_companion(struct tegra_xusb_padctl *padctl,
 					 unsigned int port);
-- 
2.17.1

