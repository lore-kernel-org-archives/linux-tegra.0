Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54D77C4332F
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Nov 2022 15:40:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242297AbiKRPkz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Nov 2022 10:40:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242249AbiKRPky (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Nov 2022 10:40:54 -0500
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2080.outbound.protection.outlook.com [40.107.95.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAA4F73B90;
        Fri, 18 Nov 2022 07:40:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eYllciH8Ty8saUI+vF4ywndnd/AeDBVMy2RvE2X0V9gyWiNohKRC/dmlOXA22TOXWVl/2vmOnTeBG+ZQXcX99/HIHOJRPxFfOYpEiZPblZV8mzcWBzfLfqnHdL6PPJFpfvbyRh3Esg/o3H0L79Uz9vBaIO6czyYP0TSpiS3QjEtYN+rqBxyqr+xzAwGgUliQZcCINPPmwY7DQtmOxJzYHVT/zDm1cSYq1SbeIlevlzZi3LF5hb7SzQwJ0lioXTwi0cNYlSCufzXbUJWRyUzGdXu6F0kf5a4nOKOADZ3TS6Pmt1BOvamRIbBX7zPBfnCvuZNprW2bq/rA7LH+ieTgZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gz9zuEEXkxkJe/j2ScrZy1MC0ue9tu6YlRhznfDXD9A=;
 b=W/YdQQBOWzgHfDO/nE2TS1NZ3uD8qLW/rRRDEelIVUC89xHlqajh0V0VX30uQRG1TU1YJpGIJ82zIuhVhOjpZIXi23FZWp42HBOucOyBuZ0OolkmNKwc5hN02nousyPa4qOjZcIz96WaltyRgMwU0i/Qiyd+pYS+3GyPFdTctQ055kryIrnit9XzA1BK90iPoEfAYoE0jC8gkuxFUilbBRrSmhrxqqpP1Me35pE82Cw8GuN1ZHNirqqrpL4Kf6V9l9BAXLc7FPS0XoEaw9H6fz9bV+bvFiTAIdBl+YIjAgRUW7t8PwYg1Ynz5poEOR5G13lzL+AbRmgemEAtBMSA/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gz9zuEEXkxkJe/j2ScrZy1MC0ue9tu6YlRhznfDXD9A=;
 b=O8M/iG/kDsFemngIGEORYQNZFEoqU/lisGPCwJQU/lMWLr9k6GGIjdJmnaS8dddns/SmDRe+pDEYpJTaCE8GcIWFq0FDpeTul8nDntyGF7+5matOCPfwdPYiHtdgrZvMgND1LCMoZ7yzDyZ5ZFnRF2U7u1vIQ+i+r7K542waqZ+UyRLw9ADZzKzO+voMBveoMvNma/Ba/Klx0OafgJhB979nJS9IIbaDBg2ipUL2EGnXIyTg7kIE3i1+7OErdS5qiCObL0H3EOTe5yg5K8pW2Zz++Z21oCsSKoo9FzlR80/QJNvRN5yh7sTwlHLkdM0EzcQqY8k20ilhYNObbkCSzA==
Received: from BN9PR03CA0910.namprd03.prod.outlook.com (2603:10b6:408:107::15)
 by DS0PR12MB7605.namprd12.prod.outlook.com (2603:10b6:8:13d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 15:40:51 +0000
Received: from BN8NAM11FT071.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:107:cafe::f5) by BN9PR03CA0910.outlook.office365.com
 (2603:10b6:408:107::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9 via Frontend
 Transport; Fri, 18 Nov 2022 15:40:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN8NAM11FT071.mail.protection.outlook.com (10.13.177.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 15:40:50 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 18 Nov
 2022 07:40:35 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 18 Nov
 2022 07:40:35 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Fri, 18 Nov 2022 07:40:32 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        <gregkh@linuxfoundation.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <robh+dt@kernel.org>, <vkoul@kernel.org>, <treding@nvidia.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
        <waynec@nvidia.com>, Sing-Han Chen <singhanc@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V4 4/6] phy: tegra: xusb: Add Tegra234 support
Date:   Fri, 18 Nov 2022 15:40:04 +0000
Message-ID: <20221118154006.173082-5-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221118154006.173082-1-jonathanh@nvidia.com>
References: <20221118154006.173082-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT071:EE_|DS0PR12MB7605:EE_
X-MS-Office365-Filtering-Correlation-Id: be8e55dd-fcd5-4e9a-48fc-08dac97b456f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ymIpuEqduR1fL5MBHP27txdPqrT1TPIcB7LwGhN39RGx8WP7Ss1vHOlbj2eRRWjA3FmbPYAwzvZBZOwoDpf7uQCH5n0c6IGkIrpQre2bDPvNwjdkzwHvERiSSpaxZCUXocBzWiTi58GWmqIWFKB/AfC3c9gfjqATqT3w9TzRqlBriWC8XkRZAB6/fpWHndBd/kxwsUJJP/t2/cha69nlK+y4JgyNjBICx4BCkX545xkhXKOP7GO1sAMAr4CYzihMvGlhi0k0FIVcQ2Z/LEsxq4F/uzRhfnQPcnj3C+w+iFqlwTUTdx1pBQYFEk4lNP8KKnDBLvCLxgPIRQZYJM6EajE4l7HC1Gu870fjKR/CmmqzLlgxjJ8N0ih8FjCexwa5JauKsQjUJy0JMGikRloXj3YHniW42itzSm3AFjkRbYWmM1CXkRyhfKaOvNyi5vFdz07sU5UsENF+vIrN6thikeOtWu8oDGWnxWg1YlagTxd2kqwAik5rjRw07ONWfycu+yAz/+ha/ScfgvngFv5k4E54mn1IAZ42VgfFmxTH/MB1yxwiZU7Ugftr0YYwpbeDjLfIENA5R44wBQXDt4ZEJIh3Du0uLXc87VVxBx2gC7WHPruLgnD3702Bh9drGZiojcikANa8jxM4aRkIeq6EKV4JtJmxeIgncAAomBLrYQulh37469l9G3wvUSBY2byk6EaSxyXW78YO9PeLsnS3ew==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(136003)(376002)(451199015)(46966006)(40470700004)(36840700001)(26005)(8936002)(4326008)(5660300002)(8676002)(70586007)(41300700001)(54906003)(6636002)(70206006)(316002)(478600001)(2906002)(110136005)(36756003)(336012)(47076005)(2616005)(6666004)(7696005)(426003)(1076003)(186003)(107886003)(82310400005)(36860700001)(40480700001)(40460700003)(83380400001)(356005)(82740400003)(7636003)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 15:40:50.7396
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be8e55dd-fcd5-4e9a-48fc-08dac97b456f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT071.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7605
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Sing-Han Chen <singhanc@nvidia.com>

Add support for the XUSB pad controller found on Tegra234 SoCs. It is
mostly similar to the same IP found on Tegra194, because most of
the Tegra234 XUSB PADCTL registers definition and programming sequence
are the same as Tegra194, Tegra234 XUSB PADCTL can share the same
driver with Tegra186 and Tegra194 XUSB PADCTL.

Introduce a new feature, USB2 HW tracking, for Tegra234.
The feature is to enable HW periodical PAD tracking which measure
and capture the electric parameters of USB2.0 PAD.

Signed-off-by: Sing-Han Chen <singhanc@nvidia.com>
Co-developed-by: Wayne Chang <waynec@nvidia.com>
Signed-off-by: Wayne Chang <waynec@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
V3 -> V4: fixed checkpatch warnings
V2 -> V3: nothing has changed
V1 -> V2: remove atomic and the helper in padctl_readl_poll func.

 drivers/phy/tegra/Makefile        |  1 +
 drivers/phy/tegra/xusb-tegra186.c | 64 +++++++++++++++++++++++++++++--
 drivers/phy/tegra/xusb.c          |  6 +++
 drivers/phy/tegra/xusb.h          | 23 +++++++++++
 4 files changed, 91 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/tegra/Makefile b/drivers/phy/tegra/Makefile
index 89b84067cb4c..eeeea72de117 100644
--- a/drivers/phy/tegra/Makefile
+++ b/drivers/phy/tegra/Makefile
@@ -7,4 +7,5 @@ phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_132_SOC) += xusb-tegra124.o
 phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_210_SOC) += xusb-tegra210.o
 phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_186_SOC) += xusb-tegra186.o
 phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_194_SOC) += xusb-tegra186.o
+phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_234_SOC) += xusb-tegra186.o
 obj-$(CONFIG_PHY_TEGRA194_P2U) += phy-tegra194-p2u.o
diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
index c00d14f27ab4..1aae8535f452 100644
--- a/drivers/phy/tegra/xusb-tegra186.c
+++ b/drivers/phy/tegra/xusb-tegra186.c
@@ -89,6 +89,11 @@
 #define  USB2_TRK_START_TIMER(x)		(((x) & 0x7f) << 12)
 #define  USB2_TRK_DONE_RESET_TIMER(x)		(((x) & 0x7f) << 19)
 #define  USB2_PD_TRK				BIT(26)
+#define  USB2_TRK_COMPLETED			BIT(31)
+
+#define XUSB_PADCTL_USB2_BIAS_PAD_CTL2		0x28c
+#define  USB2_TRK_HW_MODE			BIT(0)
+#define  CYA_TRK_CODE_UPDATE_ON_IDLE		BIT(31)
 
 #define XUSB_PADCTL_HSIC_PADX_CTL0(x)		(0x300 + (x) * 0x20)
 #define  HSIC_PD_TX_DATA0			BIT(1)
@@ -609,9 +614,31 @@ static void tegra186_utmi_bias_pad_power_on(struct tegra_xusb_padctl *padctl)
 	value &= ~USB2_PD_TRK;
 	padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
 
-	udelay(100);
+	if (padctl->soc->poll_trk_completed) {
+		err = padctl_readl_poll(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL1,
+					USB2_TRK_COMPLETED, USB2_TRK_COMPLETED, 100);
+		if (err) {
+			/* The failure with polling on trk complete will not
+			 * cause the failure of powering on the bias pad.
+			 */
+			dev_warn(dev, "failed to poll USB2 trk completed: %d\n", err);
+		}
 
-	clk_disable_unprepare(priv->usb2_trk_clk);
+		value = padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
+		value |= USB2_TRK_COMPLETED;
+		padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
+	} else {
+		udelay(100);
+	}
+
+	if (padctl->soc->trk_hw_mode) {
+		value = padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL2);
+		value |= USB2_TRK_HW_MODE;
+		value &= ~CYA_TRK_CODE_UPDATE_ON_IDLE;
+		padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL2);
+	} else {
+		clk_disable_unprepare(priv->usb2_trk_clk);
+	}
 
 	mutex_unlock(&padctl->lock);
 }
@@ -637,6 +664,13 @@ static void tegra186_utmi_bias_pad_power_off(struct tegra_xusb_padctl *padctl)
 	value |= USB2_PD_TRK;
 	padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
 
+	if (padctl->soc->trk_hw_mode) {
+		value = padctl_readl(padctl, XUSB_PADCTL_USB2_BIAS_PAD_CTL2);
+		value &= ~USB2_TRK_HW_MODE;
+		padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL2);
+		clk_disable_unprepare(priv->usb2_trk_clk);
+	}
+
 	mutex_unlock(&padctl->lock);
 }
 
@@ -1559,7 +1593,8 @@ const struct tegra_xusb_padctl_soc tegra186_xusb_padctl_soc = {
 EXPORT_SYMBOL_GPL(tegra186_xusb_padctl_soc);
 #endif
 
-#if IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC)
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
+	IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC)
 static const char * const tegra194_xusb_padctl_supply_names[] = {
 	"avdd-usb",
 	"vclamp-usb",
@@ -1615,8 +1650,31 @@ const struct tegra_xusb_padctl_soc tegra194_xusb_padctl_soc = {
 	.supply_names = tegra194_xusb_padctl_supply_names,
 	.num_supplies = ARRAY_SIZE(tegra194_xusb_padctl_supply_names),
 	.supports_gen2 = true,
+	.poll_trk_completed = true,
 };
 EXPORT_SYMBOL_GPL(tegra194_xusb_padctl_soc);
+
+const struct tegra_xusb_padctl_soc tegra234_xusb_padctl_soc = {
+	.num_pads = ARRAY_SIZE(tegra194_pads),
+	.pads = tegra194_pads,
+	.ports = {
+		.usb2 = {
+			.ops = &tegra186_usb2_port_ops,
+			.count = 4,
+		},
+		.usb3 = {
+			.ops = &tegra186_usb3_port_ops,
+			.count = 4,
+		},
+	},
+	.ops = &tegra186_xusb_padctl_ops,
+	.supply_names = tegra194_xusb_padctl_supply_names,
+	.num_supplies = ARRAY_SIZE(tegra194_xusb_padctl_supply_names),
+	.supports_gen2 = true,
+	.poll_trk_completed = true,
+	.trk_hw_mode = true,
+};
+EXPORT_SYMBOL_GPL(tegra234_xusb_padctl_soc);
 #endif
 
 MODULE_AUTHOR("JC Kuo <jckuo@nvidia.com>");
diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index ff4b930879f3..3707a0b5c1ae 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -71,6 +71,12 @@ static const struct of_device_id tegra_xusb_padctl_of_match[] = {
 		.compatible = "nvidia,tegra194-xusb-padctl",
 		.data = &tegra194_xusb_padctl_soc,
 	},
+#endif
+#if defined(CONFIG_ARCH_TEGRA_234_SOC)
+	{
+		.compatible = "nvidia,tegra234-xusb-padctl",
+		.data = &tegra234_xusb_padctl_soc,
+	},
 #endif
 	{ }
 };
diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
index c384734a61c2..8bd6cd281119 100644
--- a/drivers/phy/tegra/xusb.h
+++ b/drivers/phy/tegra/xusb.h
@@ -8,6 +8,7 @@
 #define __PHY_TEGRA_XUSB_H
 
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/mutex.h>
 #include <linux/workqueue.h>
 
@@ -431,6 +432,8 @@ struct tegra_xusb_padctl_soc {
 	unsigned int num_supplies;
 	bool supports_gen2;
 	bool need_fake_usb3_port;
+	bool poll_trk_completed;
+	bool trk_hw_mode;
 };
 
 struct tegra_xusb_padctl {
@@ -473,6 +476,23 @@ static inline u32 padctl_readl(struct tegra_xusb_padctl *padctl,
 	return value;
 }
 
+static inline u32 padctl_readl_poll(struct tegra_xusb_padctl *padctl,
+				    unsigned long offset, u32 val, u32 mask,
+				    int us)
+{
+	u32 regval;
+	int err;
+
+	err = readl_poll_timeout(padctl->regs + offset, regval,
+				 (regval & mask) == val, 1, us);
+	if (err) {
+		dev_err(padctl->dev, "%08lx poll timeout > %08x\n", offset,
+			regval);
+	}
+
+	return err;
+}
+
 struct tegra_xusb_lane *tegra_xusb_find_lane(struct tegra_xusb_padctl *padctl,
 					     const char *name,
 					     unsigned int index);
@@ -489,5 +509,8 @@ extern const struct tegra_xusb_padctl_soc tegra186_xusb_padctl_soc;
 #if defined(CONFIG_ARCH_TEGRA_194_SOC)
 extern const struct tegra_xusb_padctl_soc tegra194_xusb_padctl_soc;
 #endif
+#if defined(CONFIG_ARCH_TEGRA_234_SOC)
+extern const struct tegra_xusb_padctl_soc tegra234_xusb_padctl_soc;
+#endif
 
 #endif /* __PHY_TEGRA_XUSB_H */
-- 
2.25.1

