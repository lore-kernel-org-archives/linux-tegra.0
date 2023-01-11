Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53C2AC5479D
	for <linux-tegra@archiver.kernel.org>; Wed, 11 Jan 2023 11:05:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235641AbjAKLFo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 11 Jan 2023 06:05:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233905AbjAKLFh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 11 Jan 2023 06:05:37 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB1E31573D;
        Wed, 11 Jan 2023 03:05:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O7Ox0uenhTEEu73N3jN1k7fwDuU/mVhYltslnMUBsHQQ51jzTnMhP4N4ro6/lKiw2wdaalyGncnv+v9uu8T79kU4G7XjPvL9uFR6/+2QG5CseQKrimxLIv8zOxeP+XeSdpTLQxQieAfHZkdF8+9K7g/JCT+drqLijp5GffbBT0JJGJR03dzy2ews8g4oW5mRo/nCjXYBXkxRMHG0I2gh3A9MqGx2Wt6sECcj+nrBFKH8IFHAuMmOpqu2ETDdqB/W5l6DvejhqLV7sVLk9IViIh+ogmZh5FPzC8nlE37+T0KkaK1Hy+M1PZan0I8ldI7egM39yw/8w2EjEuE4xjhbSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZkmGILynr9m0dQTZT1B2k761chbijN0HrPGjrrvaIC8=;
 b=h9jaR4Tw6PoRg89tJXJG2SGywU9GfzZFvpM5GRYYwv0HX7Iav8RKa80Lm2S1iTjlV6bRlTNhKn46RZfJk00VAC/QNJYrkXoBzp9HOeNebp0mmoWzN+fVrjlrLSf5tn6B00+v62wUz2TUiSKnmSZDB/Om1DqMHXL1YSb5P6LM+AS34uf7Zn45u37iPi2ftQAXK7DilaSnBXdIIiOpPOnwMa7Fa99hUt2h/oio5yI3H2iaCcIACjXFMQq7unDiLkAJ8pAwcCz/sCRpZp9TviDcWWRd8Wf5+S0TaOS5Kr98Spp7I/pAGJO7Gr60DLhD39e9qkjkhauf3mr8ieKfyt1rAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkmGILynr9m0dQTZT1B2k761chbijN0HrPGjrrvaIC8=;
 b=I7Cek5C2WZOlQWKUNmmUnoig+f320Ig+O2vJh4yl0Ur90RQeVQGJp3QprQ4kwqOOcXFAEZksQri5UaA/HZSidYNQCO/5u0ri+I20G8A/Pdd/SoPy+Ol4MzNZpwXeH8cnanmJYXKt83M0vDrJhW/yS2nfTQgRjesGzzYj0qkozWDrGgFGq2+fHzreSiZa5xwanm7QRj7SN7aRPuThQVYlap4C+TlEvmlIBvWrDUSZCLOupOh+THzSzFYH2admlzPukvuBL2S9Y0Rhd+muJt97gH4gmeTGtQXMexy4MuUSp3RnXMFYRDfgnGrkN184ECNebpw8TcgOJDVImBPvmaBh+A==
Received: from MW4PR02CA0005.namprd02.prod.outlook.com (2603:10b6:303:16d::14)
 by DM4PR12MB6304.namprd12.prod.outlook.com (2603:10b6:8:a2::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18; Wed, 11 Jan 2023 11:05:32 +0000
Received: from CO1NAM11FT082.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:16d:cafe::d7) by MW4PR02CA0005.outlook.office365.com
 (2603:10b6:303:16d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Wed, 11 Jan 2023 11:05:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1NAM11FT082.mail.protection.outlook.com (10.13.175.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18 via Frontend Transport; Wed, 11 Jan 2023 11:05:31 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 11 Jan
 2023 03:05:20 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 11 Jan
 2023 03:05:19 -0800
Received: from moonraker.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Wed, 11 Jan 2023 03:05:16 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Vinod Koul <vkoul@kernel.org>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <waynec@nvidia.com>, Sing-Han Chen <singhanc@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V6 5/6] phy: tegra: xusb: Add Tegra234 support
Date:   Wed, 11 Jan 2023 11:04:49 +0000
Message-ID: <20230111110450.24617-6-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230111110450.24617-1-jonathanh@nvidia.com>
References: <20230111110450.24617-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT082:EE_|DM4PR12MB6304:EE_
X-MS-Office365-Filtering-Correlation-Id: a72fbdc2-5548-472a-7f06-08daf3c3c178
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UzOyVJ3um9GbBvYYSj+WvGjw6c91nizHD0FQuTyHthQMAtW22rjaj02g3p3GoD7PCi5uK1f1n26FBKJ2kMJprgvkH6pde5IjWJ+kcyJ4bBUt02BzG0NSa9na5q1fIsYpoO1F4MnTo8jBSf/8Cy5WwyE7n/XgP3tHvBj4EXd3GS5HakVfzsNOgFA/7Kdg9cSNw548YliOpGMw66SvTi9t4dHSKS6qSnwmtCa0adTR0nQT1s/mf8Glt1GSljOXuu6qrGcx0N/seoHmjIXkWmMlxKAmiAXSVZSPccEhy1whtB/e8RT8b0a4ZlIMk5NOuB+wdc6DrgGHSYRMkra4RtjxrRUE4fXZ+dfIMNazf7O7zlMFhWJ0atT1oYNL2XP9zmvC/K4rRt5tmkxKg997Mg9sRnAjtb/X6kn06SP2GvG3sSDjUjb97J4H8TlnGGd2GJL4reisrI1gPQ5x3zUv+gSdJHYIIUwhsdBwk+w0/5vm60MemNec+q2gq3cHD4owyg4VTwIucJwKjJ15KPUlX10y+Iug4EFD0m2fDoi+22L6G3Vjf29lDOq9bOaD6jfhamQRcDYaRXvVCP6zsIGgSnMQ64ZvfJtcFt6ne/6f4DLK1FAezs4Q9hBAht31rCKkKv0FwdmNwJzdVW4Ok5vBg0a8QCIZLew8/8WulfSC/YsTxWIRUpfRpa/oLBwwQpBZ6q5WI5COr+DFU9tiCMsr8PyZtQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(396003)(136003)(451199015)(46966006)(40470700004)(36840700001)(36860700001)(82740400003)(6666004)(107886003)(7636003)(2906002)(356005)(478600001)(2616005)(1076003)(26005)(7696005)(186003)(5660300002)(40480700001)(316002)(8936002)(83380400001)(40460700003)(82310400005)(36756003)(86362001)(426003)(47076005)(41300700001)(110136005)(8676002)(336012)(70586007)(54906003)(70206006)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 11:05:31.5012
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a72fbdc2-5548-472a-7f06-08daf3c3c178
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT082.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6304
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
V4 -> V6: no changes
V3 -> V4: fixed checkpatch warnings
V2 -> V3: nothing has changed
V1 -> V2: remove atomic and the helper in padctl_readl_poll

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

