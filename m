Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6CE6C63709
	for <linux-tegra@archiver.kernel.org>; Fri,  6 Jan 2023 15:30:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235411AbjAFPaR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 6 Jan 2023 10:30:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235265AbjAFP3h (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 6 Jan 2023 10:29:37 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2071.outbound.protection.outlook.com [40.107.237.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CB27831BC;
        Fri,  6 Jan 2023 07:29:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FEHuvb0mHxRTOc82sVmRQd8UhmadGKurw8eq7yfvqoSTpLlFaVaAYRB/pwUsk6//hwE9Ihpdtx/y5tuIQ5mPeuPwu0DKmvavJFIwqQEud/0PD6oNBkVTlPuu6iwTs2FTksHlGW2GBh/C80xDNyNFVvUYoq20Uh5jMbtxfSVVQJQFL+kjrxVnP8fvpL1mUEttO16IX5cKE1gcV1Laq0srizo9UBPqAZeauRo8udW8KYDjGWTL5LwUAuFGKtugq4eqnLx7EkK3b4cFA8a7b8Jy78gGTuh97hRRV8zlf5QeoFzVf0/UG7o2jueGIt8Mf6hgMRBXrQHJoZFfV6pAp3lerQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YE0fXBMFd+7kCX5TOCR6h9f2BUWB5Ppry3tMQJVUJyo=;
 b=BCj5SOAm8MEr8AISjXTAhCBzfLIk3bbitp9+rengGoWY2Zc5hpozoCpeT/vHpK1MBhruTJ3826NegfDMnO4h3S3H5LsY4TZql8jNVmmdFA4Y6ZbugVeiJJiZbzDQS/ScCmj9mBlqFhToZzIg7h1r5n/t/irBVVe8jOHU19arRNd1HC/Pe9brMoiWY75rH4KLF5moiBj7uuCeqxMjcPXBZWXDdB19NjewzjgoJyyFm3IG6Tsh/rPebBXKX+Z7nAhQ2jlmT19pTZz3Tul7KqE8XLGPpJG6/39ijfRr3ViuzjewPUEMVDmyKi7zZBYbudVTROIq2VXRfHj0uA68o/fF0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YE0fXBMFd+7kCX5TOCR6h9f2BUWB5Ppry3tMQJVUJyo=;
 b=HiWyMXZUukQRHyKrja24TTBhGMWL21hjAtHkaZIgpFGLCoVEHpnBlTEgSU0HCMgkRY5Z8L3Cy0C6SkToDq6NqLYd/7Ga5G7zZw0cZnXt2wKW6QeHYoOG6ivDCc7w0Qcxvr3c3/LPAN2c/k6WFEB3FzbutGkq/xLzJJHbydIk2ZzQJYtoFvwWphe+Bd2TXvELzflFCfhu7OfTDnxgpgV5RNAhpgt8ebobCgUehN2PDAZ3lD6R46OsrLINXcxYS/eEqaoavaEIadK86qFhwlzijBJogFgLcvDXpXgBqzzRUcKcFuUe+tj09scM3bXZEdnPZmeFVznNonaK992sBN3zhQ==
Received: from MW2PR16CA0035.namprd16.prod.outlook.com (2603:10b6:907::48) by
 DM6PR12MB4171.namprd12.prod.outlook.com (2603:10b6:5:21f::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Fri, 6 Jan 2023 15:29:34 +0000
Received: from CO1NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:0:cafe::d0) by MW2PR16CA0035.outlook.office365.com
 (2603:10b6:907::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Fri, 6 Jan 2023 15:29:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT036.mail.protection.outlook.com (10.13.174.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5966.17 via Frontend Transport; Fri, 6 Jan 2023 15:29:33 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 6 Jan 2023
 07:29:26 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 6 Jan 2023
 07:29:25 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Fri, 6 Jan 2023 07:29:23 -0800
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
Subject: [PATCH V5 5/6] phy: tegra: xusb: Add Tegra234 support
Date:   Fri, 6 Jan 2023 15:28:57 +0000
Message-ID: <20230106152858.49574-6-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230106152858.49574-1-jonathanh@nvidia.com>
References: <20230106152858.49574-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT036:EE_|DM6PR12MB4171:EE_
X-MS-Office365-Filtering-Correlation-Id: 89a4516a-0baf-483c-1879-08daeffad000
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5mEaR2MjkD3zMnA7IWsOUcbi80j+Q9ojq7X7t0mMP9VXFK2bIEi45+lNVYtDUwSq3Wy22/Txy4Qr+JfCee6T2VkzunX87ghDRDoiUV3lSzY8hB0vcqNtnH9xUkRPYJPJg7Xumu8yuDG+ofR3+E0iEfELh5XrpYdDUawFLuV0tS0poi7pi4y07Ml73IQfwlZVQHs2gUzajtVctnuDNEsy5wujgbFzDtBeCP0QdVFwxbau+8W/zkukovTmDQyeDunfTb6mKDbnVKqiEWeJ/asMa3fGCCpIlqjhyQ0X8FAWbnE3mK2PzLWsUy1XrvGS32moroO28eQGi+VE6mjhau84IvOQhYgLac/RX1PKuVEAH7hRcVkFY3SXkQbgieabdmeWzGpv99yo2KwU3FKJ7zM/cAGfxy/jxdlc+5b8N4X52yWGmuYmC8V+4PL30T/J8WwoN6pfHD5o861XUiWG5/6X5RgBlbEiwomiLp5QHvDAW5NmCvp3ZQVSFYI6UoywrK0KbAjKKjoLHeeyzEn4vCiHcXfeDW0Vk6QHrn9q1+mFAREQbwttmW2dX+8OPePxULDXSljudFFicCAUMexw3fRN+0+JrjkrBXF7OOFbeQQbgOhy/rY/mpHnMUuF/jMQMrwC8GfeuWQ+Bdd4lVqJQkbv7H+/3BAK5Z/8UNL6R4mZ7Wx4qc4AyKPIMpKiTXQ9NTUH7Y+/B/zDs6GElQvniDLXuQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199015)(46966006)(40470700004)(36840700001)(7696005)(26005)(186003)(54906003)(316002)(7636003)(478600001)(110136005)(70206006)(8676002)(107886003)(4326008)(336012)(6666004)(2616005)(1076003)(70586007)(8936002)(47076005)(426003)(5660300002)(2906002)(83380400001)(41300700001)(356005)(36756003)(40460700003)(82740400003)(36860700001)(86362001)(82310400005)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 15:29:33.5938
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89a4516a-0baf-483c-1879-08daeffad000
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4171
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
V4 -> V5: no changes
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

