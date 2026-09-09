Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010061.outbound.protection.outlook.com [52.101.56.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27BB13B27C7;
	Wed,  9 Sep 2026 09:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788947091; cv=fail; b=o1HJcC2lziWUzuXfYybQd16FnxO9IDND80L7WsE5l4qEfqQu9ZZiED8CojPaGxX8vRdL5IGIZnHWqochCuQiTjP703egk3s2MXWdNVnmdexbSpydZ+4B73JdB78llphkq6pFEAEJXcmFGssjJ4cQJCGo2lfp09UM4zYii61WAw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788947091; c=relaxed/simple;
	bh=UTiYx+rHoiOnruwWE3W3tdbH0xoUwsvMmZx/U01AWT0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=BJIyZ2YjHO3l/Rmw/+w2tyd4PO9FMIc0JRLWpCiLB3IH2RPSoJofVY7j42oQ8Kiz6w5W/VJM7lvFYCA1KZmCpRqzLPK2st6EIKeM1hP92OPtOJGBdmsylaDp3fqwKlQ0fudFUDNcRbrugbvp9ZgCRymDIWnfUYAGYakJKR1gQG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=o0T7YFZH; arc=fail smtp.client-ip=52.101.56.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="o0T7YFZH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DeTcRd5sj+3g+Bbd8Es14MaMeTr8S9QS4ACOxFxkqIxBSIK5TrHC7Wq7qxoeUICbhOW/2jhPApG3taU7IiK8E5E2nYE7iQaV5e1kNxEUAIpuDi78iXKbCx53G7q5vQ8cKMG+MsIyaq0nYEVSYWzGZf7c6zMzNx+epRp9Dps04Fh3Qm0z2l/zMl9zCfiArk5Mle4ALPtujYGQEu/6NyyQXUOQeZSPombnJEncpSo2JlVLbvLnnYA3LJYbQhp/Q+lfetvtVvrUr2k0pQuPEyLYcjT7oPBbVqo6cqwPVDXkVGWrrl0XkyKUoxCEejzfQSlUeEEwfv18QFebVmCoFBO7PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CkL5PXyizTlHop1RSyQ27l4Iz5x34CCj4aWsUWR0+BE=;
 b=TfOLG2xcYjfSG/MzyoH/zCaXMmY3q9kBPTC634cv+fjPkW3uSuJl7h0k+oJhdE/zimADcDbdmrnLaNiIrcI8+bF3sS3GBXAUMwiG4vq2KAO+SmdiuEf3eTP3UL4gKImCSs5QODBuuv1Bm8JGK7uTmKPsT6zFSO1lJgdQRETq9Q9e0QNxgRm1WNq/lwSIn1d8FLryRQyypU4Xcjf9abW3FYIowSKyZM1Cfbr552Uu25AFwh2y2qoy6Y/jWJtEhA3spoatA7qKVcL9pKE1qhDNNr5VUyM/O8dPZcax2E5eKotPwtqFIWQLAvFGzVlFeiNX5DE31rwxvYSqdKCvcI+oeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CkL5PXyizTlHop1RSyQ27l4Iz5x34CCj4aWsUWR0+BE=;
 b=o0T7YFZHk56nci/EBoJirVqO5zV4VEIygXp3zLWxFDttFBxLxoGE7lV26mI+XnZDineebt3d48F9I8iS/FOp/FysKiik9p+U5x8bZ0l9nVWRGX7jbgMIGIkX9q5Oldmdorflp5Q570h6jJNhZSyU3lID3wxcom1QZ1PcQVLnoiQ2FMoO0AaQyoWt6ZjwgJoTmcUoE4zCCIY/X3jL6+c+vJvhiJfgIgJFgWa51BoMNg0dbw2yTIM5dHtSpSJqcTmPV37HmR2NOSAMX4Uexrzv76S9NSGOA2BVSdPcbqH/dKFuAOi3DrvXnaRq6o29iysubDUigWjo3Sr6ErewoPFw4w==
Received: from SJ2P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5da::6)
 by LV0PR12MB507217.namprd12.prod.outlook.com (2603:10b6:408:3b7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 09:44:43 +0000
Received: from CO1PEPF00012E61.namprd05.prod.outlook.com
 (2603:10b6:a03:5da:cafe::8d) by SJ2P220CA0003.outlook.office365.com
 (2603:10b6:a03:5da::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Wed, 9
 Sep 2026 09:44:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF00012E61.mail.protection.outlook.com (10.167.249.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 09:44:42 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 9 Sep
 2026 02:44:22 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 9 Sep
 2026 02:44:21 -0700
Received: from [127.0.1.1] (10.127.8.13) by mail.nvidia.com (10.129.68.7) with
 Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026
 02:44:17 -0700
From: Kartik Rajput <kkartik@nvidia.com>
Date: Wed, 9 Sep 2026 15:13:59 +0530
Subject: [PATCH 2/2] phy: tegra: Add Tegra264 MPHY driver
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260909-tegra264-mphy-v1-2-ce61a80dc065@nvidia.com>
References: <20260909-tegra264-mphy-v1-0-ce61a80dc065@nvidia.com>
In-Reply-To: <20260909-tegra264-mphy-v1-0-ce61a80dc065@nvidia.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
	<jonathanh@nvidia.com>, Philipp Zabel <p.zabel@pengutronix.de>
CC: Thierry Reding <treding@nvidia.com>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Kartik Rajput <kkartik@nvidia.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788947048; l=15692;
 i=kkartik@nvidia.com; s=20260909; h=from:subject:message-id;
 bh=UTiYx+rHoiOnruwWE3W3tdbH0xoUwsvMmZx/U01AWT0=;
 b=HJg9+CjBWB+52S7pjWuTHMLrkTHRhsbvW4K+2mUoNB2Ge867kqxWpiVzAOvW9Vjq3alwtJvQO
 tLnWIzok5F4BU+4M0YcVAS463Gz3C3FpeGpX5IP4hwIPsMCcYsi31Ha
X-Developer-Key: i=kkartik@nvidia.com; a=ed25519;
 pk=V+1YkJqxCruxUVxLXtAG3f5k8O5skT0X4/QIB75KZ64=
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E61:EE_|LV0PR12MB507217:EE_
X-MS-Office365-Filtering-Correlation-Id: 167114cf-19fe-4e69-e5c0-08df0e56f95f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|7416014|36860700016|23010399003|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	oj/0mIKTsLWkGJpzwlSQjXR00HsgAyH81JztiPJgsvosXnZ1QiMrkbQS2dzee4V4pnsWAn+jYUupbobf8/289hvbutBfTBzFa0oozOQsa03LYGK/bwKPhck9HLYI0hgoFWG46QIJuhTPEsat8SSljp6IW9iLTNhE5NRivkDIJ7FbBXuUqCwkrDENgJty1187yzWuEG1CJ5C9CNaO3DyxC9/0yFVmJsSGex695w9mnxRgatPn3gFcduaGH3qSQp9Xu4Wh7drttc950nZoWUWgC+l3zSmyfsgUDx706MswWT1ihdEVHbN9mAxGgv/B7FgJDAWZXKWOKmyZlPPrBNV7dvOntnx8C+KkWQIKDILMUwFFcFlHr4l5KhUPdd47Qz3eqbz2J26R72bv82bOqor/NcADyCBiTpdXFD59IYDcyikWg3tFovzTzvP1Y5vjHayy3/jmlsjrWwhA8s3CA71tE/Sjq/Eclu6pO5W/Rc88b5eIh1sHOafHzCrv9oukDUILLhj3hoHmHVuBr0ZP7hPk8Gw+KZD4g3WlpT8ja9q8dJJcNdq7URiQXeuNnlDVKeoMyfhllcojIOg4cgXsq0Guvjy8uhbpQ2z3fAxs3cYj8V5pj77oZCFRBR3D+qqEeQ1VTqqmung7ryA9u0vD0yeTNBv68qIXoPsYPhU5KJA57GzR6DDoqwB/4Pwy4VTB9te2na0dXuVDoFt9ExDfZG+8zQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700016)(23010399003)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	63r0mZx0rq9bKfr4kh59zZCBW0czydaqJAPLAfCIxjScs2+WPMVuKd293W2eU/Ay933DBbj/3Z5v7K3knurfbr23XG5zP8Dp3taOydRPiiEerXoDG7s21YrQfRLh87Ih0KwzU3Khl5d7LEEJ540t2BNE9l1ohbsf++cqOElCSt/nmLvf5nTTXKshyWZGclSooPkGopBoUvW1K0EZyq6lwhvSSo9N8zLT7aLD/1JW0lGIsCEtEZitUoJow8hl6FqcaUVP80OwOHKIjLOuK5RAg5qj+6tqsYnoxxBAR+8goZUmAMRqRiVerzZaDz/hHQm9IlYpvfirgbDLg+Sr/vRMwyCWBNSBgP2Quu50kZdMaOzMExHAjhPVGXPWMUhqqlq9EWP+mpcIZot3PgHP4uZwoOkm7oNieouUR8FOCF/rwH0date1Mdk2jGUEsD8M53m5
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 09:44:42.2133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 167114cf-19fe-4e69-e5c0-08df0e56f95f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E61.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB507217

Add a driver for the MIPI M-PHY found on NVIDIA Tegra264 SoCs. The
M-PHY has two lanes, each with a transmit and a receive direction,
exposed as four PHYs to the UFS host controller.

Co-developed-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
 drivers/phy/tegra/Kconfig          |  11 +
 drivers/phy/tegra/Makefile         |   1 +
 drivers/phy/tegra/phy-tegra-mphy.c | 459 +++++++++++++++++++++++++++++++++++++
 3 files changed, 471 insertions(+)

diff --git a/drivers/phy/tegra/Kconfig b/drivers/phy/tegra/Kconfig
index f0734415fc94..b5ed5bc0c8ef 100644
--- a/drivers/phy/tegra/Kconfig
+++ b/drivers/phy/tegra/Kconfig
@@ -18,3 +18,14 @@ config PHY_TEGRA194_P2U
 	help
 	  Enable this to support the P2U (PIPE to UPHY) that is part of Tegra 19x
 	  and 234 SOCs.
+
+config PHY_TEGRA_MPHY
+	tristate "NVIDIA Tegra264 MPHY driver"
+	depends on ARCH_TEGRA_264_SOC || COMPILE_TEST
+	select GENERIC_PHY
+	help
+	  Enable this to support the MIPI M-PHY on NVIDIA Tegra264 SoCs.
+	  The M-PHY provides the physical layer for the on-die UFS host
+	  controller. The driver manages the shared clock-control block
+	  and per-lane resets, exposing four sub-phys (L0-TX, L0-RX,
+	  L1-TX, L1-RX) consumed by the UFS host driver.
diff --git a/drivers/phy/tegra/Makefile b/drivers/phy/tegra/Makefile
index eeeea72de117..3ab153264a07 100644
--- a/drivers/phy/tegra/Makefile
+++ b/drivers/phy/tegra/Makefile
@@ -9,3 +9,4 @@ phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_186_SOC) += xusb-tegra186.o
 phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_194_SOC) += xusb-tegra186.o
 phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_234_SOC) += xusb-tegra186.o
 obj-$(CONFIG_PHY_TEGRA194_P2U) += phy-tegra194-p2u.o
+obj-$(CONFIG_PHY_TEGRA_MPHY) += phy-tegra-mphy.o
diff --git a/drivers/phy/tegra/phy-tegra-mphy.c b/drivers/phy/tegra/phy-tegra-mphy.c
new file mode 100644
index 000000000000..01cafe1c7477
--- /dev/null
+++ b/drivers/phy/tegra/phy-tegra-mphy.c
@@ -0,0 +1,459 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+// NVIDIA Tegra264 MPHY driver.
+
+#include <dt-bindings/phy/nvidia,tegra264-mphy.h>
+#include <linux/clk.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+
+#define MPHY_GO_BIT				BIT(0)
+
+#define MPHY_RX_APB_CAPABILITY_88_8B		0x88
+#define RX_HS_G1_SYNC_LENGTH_CAPABILITY(x)	(((x) & 0x3f) << 24)
+
+#define MPHY_RX_APB_CAPABILITY_94_97		0x94
+#define RX_HS_G3_SYNC_LENGTH_CAPABILITY(x)	(((x) & 0x3f) << 8)
+#define RX_HS_G2_SYNC_LENGTH_CAPABILITY(x)	(((x) & 0x3f) << 0)
+
+#define MPHY_TX_APB_VENDOR0			0x100
+#define MPHY_TX_APB_VENDOR2			0x108
+#define TX_CAL_DONE				BIT(19)
+#define TX_CAL_EN				BIT(15)
+
+#define MPHY_RX_APB_VENDOR2			0x184
+#define RX_CAL_DONE				BIT(19)
+#define RX_CAL_EN				BIT(15)
+
+#define MPHY_RX_APB_VENDOR3			0x188
+#define RX_MPHY2UPHY_IF_OVR_CTRL		BIT(26)
+
+#define MPHY_RX_APB_VENDOR3B			0x220
+#define MPHY_RX_APB_VENDOR49			0x254
+
+#define MPHY_EQ_TIMEOUT				0xffffffff
+#define MPHY_PWR_CHANGE_CLK_BOOST		0x0017
+
+#define MPHY_TX_OFFSET				0x1000
+#define MPHY_RX_OFFSET				0x2000
+
+struct tegra_mphy_lane {
+	void __iomem *regs;
+	void __iomem *tx_regs;
+	void __iomem *rx_regs;
+
+	struct reset_control *rst_rx;
+	struct reset_control *rst_tx;
+
+	struct phy *tx;
+	struct phy *rx;
+};
+
+struct tegra_mphy {
+	struct device *dev;
+
+	struct tegra_mphy_lane l0;
+	struct tegra_mphy_lane l1;
+
+	unsigned int num_clks;
+	struct clk_bulk_data *clks;
+
+	struct reset_control *rst_clk_ctl;
+
+	unsigned int power_count;
+};
+
+static int tegra_mphy_get_clocks(struct tegra_mphy *mphy)
+{
+	struct device *dev = mphy->dev;
+	int num_clks;
+
+	num_clks = devm_clk_bulk_get_all(dev, &mphy->clks);
+	if (num_clks < 0)
+		return dev_err_probe(dev, num_clks, "failed to get clocks\n");
+
+	mphy->num_clks = num_clks;
+
+	return 0;
+}
+
+static int tegra_mphy_get_resets(struct tegra_mphy *mphy)
+{
+	struct device *dev = mphy->dev;
+
+	mphy->rst_clk_ctl = devm_reset_control_get_exclusive(dev, "clk-ctl");
+	if (IS_ERR(mphy->rst_clk_ctl))
+		return dev_err_probe(dev, PTR_ERR(mphy->rst_clk_ctl),
+				     "failed to get clk-ctl reset\n");
+
+	mphy->l0.rst_rx = devm_reset_control_get_exclusive(dev, "l0-rx");
+	if (IS_ERR(mphy->l0.rst_rx))
+		return dev_err_probe(dev, PTR_ERR(mphy->l0.rst_rx), "failed to get l0-rx reset\n");
+
+	mphy->l0.rst_tx = devm_reset_control_get_exclusive(dev, "l0-tx");
+	if (IS_ERR(mphy->l0.rst_tx))
+		return dev_err_probe(dev, PTR_ERR(mphy->l0.rst_tx), "failed to get l0-tx reset\n");
+
+	mphy->l1.rst_rx = devm_reset_control_get_exclusive(dev, "l1-rx");
+	if (IS_ERR(mphy->l1.rst_rx))
+		return dev_err_probe(dev, PTR_ERR(mphy->l1.rst_rx), "failed to get l1-rx reset\n");
+
+	mphy->l1.rst_tx = devm_reset_control_get_exclusive(dev, "l1-tx");
+	if (IS_ERR(mphy->l1.rst_tx))
+		return dev_err_probe(dev, PTR_ERR(mphy->l1.rst_tx), "failed to get l1-tx reset\n");
+
+	return 0;
+}
+
+static int tegra_mphy_rx_write_kick_go(struct tegra_mphy_lane *lane, u32 offset, u32 value)
+{
+	u32 v;
+
+	writel(value, lane->rx_regs + offset);
+
+	v = readl(lane->rx_regs + MPHY_RX_APB_VENDOR2);
+	v |= MPHY_GO_BIT;
+	writel(v, lane->rx_regs + MPHY_RX_APB_VENDOR2);
+
+	return readl_poll_timeout(lane->rx_regs + MPHY_RX_APB_VENDOR2, v,
+				  (v & MPHY_GO_BIT) == 0, 25, 5000);
+}
+
+static int tegra_mphy_rx_power_on(struct phy *phy)
+{
+	struct tegra_mphy *mphy = dev_get_drvdata(phy->dev.parent);
+	struct tegra_mphy_lane *lane = phy_get_drvdata(phy);
+	u32 value;
+	int err;
+
+	if (mphy->power_count++ == 0) {
+		err = clk_bulk_prepare_enable(mphy->num_clks, mphy->clks);
+		if (err) {
+			mphy->power_count--;
+			dev_err(&phy->dev, "failed to enable clocks: %d\n", err);
+			return err;
+		}
+		reset_control_deassert(mphy->rst_clk_ctl);
+	}
+
+	reset_control_deassert(lane->rst_rx);
+	reset_control_deassert(lane->rst_tx);
+
+	err = tegra_mphy_rx_write_kick_go(lane, MPHY_RX_APB_VENDOR3B, MPHY_EQ_TIMEOUT);
+	if (err) {
+		dev_err(&phy->dev, "eq_timeout programming failed: %d\n", err);
+		goto err_reset;
+	}
+
+	err = tegra_mphy_rx_write_kick_go(lane, MPHY_RX_APB_VENDOR49, MPHY_PWR_CHANGE_CLK_BOOST);
+	if (err) {
+		dev_err(&phy->dev, "pwr_change_clk_boost programming failed: %d\n", err);
+		goto err_reset;
+	}
+
+	value = readl(lane->regs + MPHY_RX_APB_CAPABILITY_88_8B);
+	value &= ~RX_HS_G1_SYNC_LENGTH_CAPABILITY(~0);
+	value |= RX_HS_G1_SYNC_LENGTH_CAPABILITY(0xf);
+	writel(value, lane->regs + MPHY_RX_APB_CAPABILITY_88_8B);
+
+	value = readl(lane->regs + MPHY_RX_APB_CAPABILITY_94_97);
+	value &= ~RX_HS_G3_SYNC_LENGTH_CAPABILITY(~0);
+	value |= RX_HS_G3_SYNC_LENGTH_CAPABILITY(0xf);
+	value &= ~RX_HS_G2_SYNC_LENGTH_CAPABILITY(~0);
+	value |= RX_HS_G2_SYNC_LENGTH_CAPABILITY(0xf);
+	writel(value, lane->regs + MPHY_RX_APB_CAPABILITY_94_97);
+
+	value = readl(lane->rx_regs + MPHY_RX_APB_VENDOR3);
+	value |= RX_MPHY2UPHY_IF_OVR_CTRL;
+	writel(value, lane->rx_regs + MPHY_RX_APB_VENDOR3);
+
+	value = readl(lane->rx_regs + MPHY_RX_APB_VENDOR2);
+	value |= MPHY_GO_BIT;
+	writel(value, lane->rx_regs + MPHY_RX_APB_VENDOR2);
+
+	err = readl_poll_timeout(lane->rx_regs + MPHY_RX_APB_VENDOR2, value,
+				 (value & MPHY_GO_BIT) == 0, 25, 5000);
+	if (err) {
+		dev_err(&phy->dev, "RX cap update failed: %d\n", err);
+		goto err_reset;
+	}
+
+	return 0;
+
+err_reset:
+	reset_control_assert(lane->rst_rx);
+	reset_control_assert(lane->rst_tx);
+
+	if (--mphy->power_count == 0) {
+		reset_control_assert(mphy->rst_clk_ctl);
+		clk_bulk_disable_unprepare(mphy->num_clks, mphy->clks);
+	}
+
+	return err;
+}
+
+static int tegra_mphy_rx_power_off(struct phy *phy)
+{
+	struct tegra_mphy *mphy = dev_get_drvdata(phy->dev.parent);
+	struct tegra_mphy_lane *lane = phy_get_drvdata(phy);
+
+	if (WARN_ON(mphy->power_count == 0))
+		return -EINVAL;
+
+	reset_control_assert(lane->rst_rx);
+	reset_control_assert(lane->rst_tx);
+
+	if (--mphy->power_count == 0)
+		clk_bulk_disable_unprepare(mphy->num_clks, mphy->clks);
+
+	return 0;
+}
+
+static int tegra_mphy_rx_configure(struct phy *phy, union phy_configure_opts *opts)
+{
+	struct tegra_mphy_lane *lane = phy_get_drvdata(phy);
+	u32 value;
+	int err;
+
+	value = readl(lane->rx_regs + MPHY_RX_APB_VENDOR2);
+	value |= RX_CAL_EN;
+	writel(value, lane->rx_regs + MPHY_RX_APB_VENDOR2);
+
+	value = readl(lane->rx_regs + MPHY_RX_APB_VENDOR2);
+	value |= MPHY_GO_BIT;
+	writel(value, lane->rx_regs + MPHY_RX_APB_VENDOR2);
+
+	err = readl_poll_timeout(lane->rx_regs + MPHY_RX_APB_VENDOR2, value,
+				 (value & MPHY_GO_BIT) == 0, 25, 5000);
+	if (err)
+		dev_err(&phy->dev, "failed to arm RX calibration: %d\n", err);
+
+	return err;
+}
+
+static int tegra_mphy_rx_calibrate(struct phy *phy)
+{
+	struct tegra_mphy_lane *lane = phy_get_drvdata(phy);
+	u32 value;
+	int err;
+
+	err = readl_poll_timeout(lane->rx_regs + MPHY_RX_APB_VENDOR2, value,
+				 (value & RX_CAL_DONE) != 0, 25, 100000);
+	if (err) {
+		dev_err(&phy->dev, "RX calibration timed out: %d\n", err);
+		return err;
+	}
+
+	value = readl(lane->rx_regs + MPHY_RX_APB_VENDOR2);
+	value &= ~RX_CAL_EN;
+	writel(value, lane->rx_regs + MPHY_RX_APB_VENDOR2);
+
+	value = readl(lane->rx_regs + MPHY_RX_APB_VENDOR2);
+	value |= MPHY_GO_BIT;
+	writel(value, lane->rx_regs + MPHY_RX_APB_VENDOR2);
+
+	err = readl_poll_timeout(lane->rx_regs + MPHY_RX_APB_VENDOR2, value,
+				 (value & MPHY_GO_BIT) == 0, 25, 5000);
+	if (err) {
+		dev_err(&phy->dev, "failed to clear RX calibration: %d\n", err);
+		return err;
+	}
+
+	err = readl_poll_timeout(lane->rx_regs + MPHY_RX_APB_VENDOR2, value,
+				 (value & RX_CAL_DONE) == 0, 25, 100000);
+	if (err)
+		dev_err(&phy->dev, "RX calibration failed to clear: %d\n", err);
+
+	return err;
+}
+
+static const struct phy_ops tegra_mphy_rx_ops = {
+	.power_on = tegra_mphy_rx_power_on,
+	.power_off = tegra_mphy_rx_power_off,
+	.configure = tegra_mphy_rx_configure,
+	.calibrate = tegra_mphy_rx_calibrate,
+};
+
+static int tegra_mphy_tx_configure(struct phy *phy, union phy_configure_opts *opts)
+{
+	struct tegra_mphy_lane *lane = phy_get_drvdata(phy);
+	u32 value;
+	int err;
+
+	value = readl(lane->tx_regs + MPHY_TX_APB_VENDOR2);
+	value |= TX_CAL_EN;
+	writel(value, lane->tx_regs + MPHY_TX_APB_VENDOR2);
+
+	value = readl(lane->tx_regs + MPHY_TX_APB_VENDOR0);
+	value |= MPHY_GO_BIT;
+	writel(value, lane->tx_regs + MPHY_TX_APB_VENDOR0);
+
+	err = readl_poll_timeout(lane->tx_regs + MPHY_TX_APB_VENDOR0, value,
+				 (value & MPHY_GO_BIT) == 0, 25, 5000);
+	if (err)
+		dev_err(&phy->dev, "failed to arm TX calibration: %d\n", err);
+
+	return err;
+}
+
+static int tegra_mphy_tx_calibrate(struct phy *phy)
+{
+	struct tegra_mphy_lane *lane = phy_get_drvdata(phy);
+	u32 value;
+	int err;
+
+	err = readl_poll_timeout(lane->tx_regs + MPHY_TX_APB_VENDOR2, value,
+				 (value & TX_CAL_DONE) != 0, 25, 50000);
+	if (err) {
+		dev_err(&phy->dev, "TX calibration timed out: %d\n", err);
+		return err;
+	}
+
+	value = readl(lane->tx_regs + MPHY_TX_APB_VENDOR2);
+	value &= ~TX_CAL_EN;
+	writel(value, lane->tx_regs + MPHY_TX_APB_VENDOR2);
+
+	value = readl(lane->tx_regs + MPHY_TX_APB_VENDOR0);
+	value |= MPHY_GO_BIT;
+	writel(value, lane->tx_regs + MPHY_TX_APB_VENDOR0);
+
+	err = readl_poll_timeout(lane->tx_regs + MPHY_TX_APB_VENDOR0, value,
+				 (value & MPHY_GO_BIT) == 0, 25, 5000);
+	if (err) {
+		dev_err(&phy->dev, "GO bit failed to clear: %d\n", err);
+		return err;
+	}
+
+	err = readl_poll_timeout(lane->tx_regs + MPHY_TX_APB_VENDOR2, value,
+				 (value & TX_CAL_DONE) == 0, 25, 50000);
+	if (err)
+		dev_err(&phy->dev, "TX calibration failed: %d\n", err);
+
+	return err;
+}
+
+static const struct phy_ops tegra_mphy_tx_ops = {
+	.configure = tegra_mphy_tx_configure,
+	.calibrate = tegra_mphy_tx_calibrate,
+};
+
+static struct phy *tegra_mphy_xlate(struct device *dev, const struct of_phandle_args *args)
+{
+	struct tegra_mphy *mphy = dev_get_drvdata(dev);
+
+	if (args->args_count != 1)
+		return ERR_PTR(-EINVAL);
+
+	switch (args->args[0]) {
+	case TEGRA_MPHY_L0_TX:
+		return mphy->l0.tx;
+	case TEGRA_MPHY_L0_RX:
+		return mphy->l0.rx;
+	case TEGRA_MPHY_L1_TX:
+		return mphy->l1.tx;
+	case TEGRA_MPHY_L1_RX:
+		return mphy->l1.rx;
+	default:
+		return ERR_PTR(-EINVAL);
+	}
+}
+
+static int tegra_mphy_create_phys(struct tegra_mphy *mphy)
+{
+	struct device *dev = mphy->dev;
+
+	mphy->l0.tx = devm_phy_create(dev, dev->of_node, &tegra_mphy_tx_ops);
+	if (IS_ERR(mphy->l0.tx))
+		return dev_err_probe(dev, PTR_ERR(mphy->l0.tx), "failed to create l0-tx PHY\n");
+	phy_set_drvdata(mphy->l0.tx, &mphy->l0);
+
+	mphy->l0.rx = devm_phy_create(dev, dev->of_node, &tegra_mphy_rx_ops);
+	if (IS_ERR(mphy->l0.rx))
+		return dev_err_probe(dev, PTR_ERR(mphy->l0.rx), "failed to create l0-rx PHY\n");
+	phy_set_drvdata(mphy->l0.rx, &mphy->l0);
+
+	mphy->l1.tx = devm_phy_create(dev, dev->of_node, &tegra_mphy_tx_ops);
+	if (IS_ERR(mphy->l1.tx))
+		return dev_err_probe(dev, PTR_ERR(mphy->l1.tx), "failed to create l1-tx PHY\n");
+	phy_set_drvdata(mphy->l1.tx, &mphy->l1);
+
+	mphy->l1.rx = devm_phy_create(dev, dev->of_node, &tegra_mphy_rx_ops);
+	if (IS_ERR(mphy->l1.rx))
+		return dev_err_probe(dev, PTR_ERR(mphy->l1.rx), "failed to create l1-rx PHY\n");
+	phy_set_drvdata(mphy->l1.rx, &mphy->l1);
+
+	return 0;
+}
+
+static int tegra_mphy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct phy_provider *provider;
+	struct tegra_mphy *mphy;
+	int err;
+
+	mphy = devm_kzalloc(dev, sizeof(*mphy), GFP_KERNEL);
+	if (!mphy)
+		return -ENOMEM;
+
+	mphy->dev = dev;
+
+	mphy->l0.regs = devm_platform_ioremap_resource_byname(pdev, "l0");
+	if (IS_ERR(mphy->l0.regs))
+		return PTR_ERR(mphy->l0.regs);
+
+	mphy->l1.regs = devm_platform_ioremap_resource_byname(pdev, "l1");
+	if (IS_ERR(mphy->l1.regs))
+		return PTR_ERR(mphy->l1.regs);
+
+	mphy->l0.tx_regs = mphy->l0.regs + MPHY_TX_OFFSET;
+	mphy->l0.rx_regs = mphy->l0.regs + MPHY_RX_OFFSET;
+
+	mphy->l1.tx_regs = mphy->l1.regs + MPHY_TX_OFFSET;
+	mphy->l1.rx_regs = mphy->l1.regs + MPHY_RX_OFFSET;
+
+	err = tegra_mphy_get_clocks(mphy);
+	if (err)
+		return err;
+
+	err = tegra_mphy_get_resets(mphy);
+	if (err)
+		return err;
+
+	err = tegra_mphy_create_phys(mphy);
+	if (err)
+		return err;
+
+	platform_set_drvdata(pdev, mphy);
+
+	provider = devm_of_phy_provider_register(dev, tegra_mphy_xlate);
+	if (IS_ERR(provider))
+		return dev_err_probe(dev, PTR_ERR(provider),
+				     "failed to register PHY\n");
+
+	return 0;
+}
+
+static const struct of_device_id tegra_mphy_of_table[] = {
+	{ .compatible = "nvidia,tegra264-mphy" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, tegra_mphy_of_table);
+
+static struct platform_driver tegra_mphy_driver = {
+	.driver = {
+		.name = "tegra-mphy",
+		.of_match_table = tegra_mphy_of_table,
+	},
+	.probe = tegra_mphy_probe,
+};
+module_platform_driver(tegra_mphy_driver);
+
+MODULE_AUTHOR("Thierry Reding <treding@nvidia.com>");
+MODULE_AUTHOR("Kartik Rajput <kkartik@nvidia.com>");
+MODULE_DESCRIPTION("NVIDIA Tegra MPHY driver");
+MODULE_LICENSE("GPL");

-- 
2.43.0

