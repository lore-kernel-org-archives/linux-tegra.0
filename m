Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2077.outbound.protection.outlook.com [40.107.95.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9032022F74E;
	Fri,  1 Aug 2025 09:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754042331; cv=fail; b=Sb1SSidlWwlpK0tq6TK1b5gNedUG5LUBY5E2cEo66EzCmmiIaT1irOVHY+uZocHwLZ2BHIo5ijypZkzOQioYNEdCiYrglx5/wOhKaCUtNijJIyn75C63O/YA/hNA7DMI5q09ns9IFbjAUNvn3cj6IeBhF9FsEALh1FCZyqrcsdg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754042331; c=relaxed/simple;
	bh=yWLzvCNIUDoKkk5PeBN8GJ9PGMjG6AlzrQdOf/BDsFo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FrhH5X3ouhOfnRSY+bo1VMfQH/Bi4x7JpgEqLVQb3FcrUhCuzwVwIvZ5n36l42cNAMQzpCpcKyo/VMjhIbolHIju6I0MNV0tSkvzBvYRLne13f15yzKdkZ59objSzj9BY/Vf8OPk5sxBEkjFdPkKStujLjoeflF57hS2bgDwIkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Kw7CHSJG; arc=fail smtp.client-ip=40.107.95.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Kw7CHSJG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sHb2X/Jms4dGwzdGFvQ3RhbQOOnNesGu884NxQG1AJLCi4gf3ERCi6bjQa6OEngr8kZWEPWd17HelMVEAsV1SmAyDeSbqEVHsrBXJrjJSIosT/Y8o5rfwoVPbpLTss0hds8Io5bcnw0eiPCNszLuVzcPNd85g5L1+cUH1/jn7F5Ul24kfV3kwFjnJAHIo5UsYgtPRHx7WCUpzuXEKDy0jke234t3kQla21A0LoAKq3bFtgAFqUIA8REANmvcQrA2qxNpUXHFsY8/wrRMo8IHKYj3xVllG/TkhY6moIunVYZ0zL6ryTrmHevbD3GIFNpOj+j46zuEbTwVtslNEf9qCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jn5KG1Yh8U4PQ934q87me6doKtdPLkPe9m5dcis719Q=;
 b=buGAQNTiIHcSazD+O2lO/wQBdwS/U+33t8RdN6Pd5vR0DQdAQGBTYq3sQJwaIQZmqGNqiuDlxUZZKvYY12sIn7G4xhtP4525p9/NluCHDTTjrCkJ8eo3aJOYIZU94d6SPv6nkAvvi9ecsVE304yPw+IdWXJ51Q4FiBTVZqs4NMIRAHmyv3gir1S2A2Cd+2s42d7tGZ1VjKJXhecmRUKHGW24ZXCzXSa6dWH2DJROxZQvdWfmQfFEd2xoX1/YEZvblmKJ3G0CVhxSBMHt9JaIoWSAFTDfFsKhElPOV1xN3PrAdan8Ai8QlXweLNkeOp5HI05xsCTING93jLOEyl7S5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jn5KG1Yh8U4PQ934q87me6doKtdPLkPe9m5dcis719Q=;
 b=Kw7CHSJGGXkv06RMTKPZP/IzGAXMC20JPRmtXpYqHu2PDH2AeGWU/1vPBZK0uW5Oa89q2D+xWpLxwpJfsVwvp0/J+8zEqclt040DwpZ9+aqLXJXICJIyqXUBBkTU0CuvXw4VoSNCIicfhhiSXTHubEumSJv4MeL/ewcCBoStJasL39IG1hxxlYtdI/8wp1MhNaJLApT0h/2EnpZ0oEv1eyeUeAcQbKQCio5Ga7OGCl2WduMq6IrUcsj84kjVXuxV1CShws0GMDr4VB/qMfcBfhRhsdNposqXbwuWGSJQo8su8OwEXGugYsd8Gz3uXeCF/sx58Y21pttLXm9r0Ottzw==
Received: from BYAPR04CA0028.namprd04.prod.outlook.com (2603:10b6:a03:40::41)
 by IA0PR12MB8932.namprd12.prod.outlook.com (2603:10b6:208:492::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Fri, 1 Aug
 2025 09:58:47 +0000
Received: from SJ1PEPF000023DA.namprd21.prod.outlook.com
 (2603:10b6:a03:40:cafe::f) by BYAPR04CA0028.outlook.office365.com
 (2603:10b6:a03:40::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.16 via Frontend Transport; Fri,
 1 Aug 2025 09:58:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF000023DA.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.0 via Frontend Transport; Fri, 1 Aug 2025 09:58:46 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 1 Aug
 2025 02:58:20 -0700
Received: from 553356c-lcelt.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 1 Aug 2025 02:58:15 -0700
From: Haotien Hsu <haotienh@nvidia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, "Jonathan
 Hunter" <jonathanh@nvidia.com>, Mathias Nyman <mathias.nyman@intel.com>,
	"Brad Griffis" <bgriffis@nvidia.com>, Sumit Gupta <sumitg@nvidia.com>,
	"Vedant Deshpande" <vedantd@nvidia.com>, Akhil R <akhilrajeev@nvidia.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>, <linux-usb@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Haotien Hsu <haotienh@nvidia.com>, Henry Lin <henryl@nvidia.com>, "Jui
 Chang Kuo" <jckuo@nvidia.com>, Wayne Chang <waynec@nvidia.com>, WK Tsai
	<wtsai@nvidia.com>
Subject: [PATCH 4/4] usb: xhci: tegra: Support USB wakeup function for Tegra234
Date: Fri, 1 Aug 2025 17:57:48 +0800
Message-ID: <20250801095748.385437-5-haotienh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250801095748.385437-1-haotienh@nvidia.com>
References: <20250801095748.385437-1-haotienh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023DA:EE_|IA0PR12MB8932:EE_
X-MS-Office365-Filtering-Correlation-Id: eee6cb86-6b6a-45fa-853b-08ddd0e2017d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|82310400026|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xQlhvMNb5FzV7QvvXjg1HPj7eHfbWytA7H3sgsje7otjy7RkZAXMnkioMXx+?=
 =?us-ascii?Q?2lErCu8xbEQ5W9VePUyWtOcEKM8mVyh3Dda5xR/qcFZScFruND5E2dALYxPV?=
 =?us-ascii?Q?gNhdMHx2KqQ2kexQVsLx3eFHEQCZeCS0HuHE4L0ELRbvz7CAof1c+/8rhwER?=
 =?us-ascii?Q?0kwMcSs1WU6gwcfSYSx4Nfbc1IORjJWd0d+86xY6recD3bq/5ZMogi+yUT6I?=
 =?us-ascii?Q?VI3U8cKqTAUyf7uR226jDPuiu2xnVhs5IT4K337YNwLfwfrMyj8F61psjx9v?=
 =?us-ascii?Q?GPfr4klt5CJ9Lm4bA1S4ub35rSnyAsXlHUFO+bfNxftWASXf98uVFff2U5b+?=
 =?us-ascii?Q?z4bTlWy8Nb50zCzvzOGwv5j+ntSJGhBoz0pDB71i0Un3m5B7Jrbx6cW3DK/G?=
 =?us-ascii?Q?sDrRmhh6s5yHH4Ok09hJGuzJ19swtyyAlsqVDsIfrrVIfeiA4SK3FP3id+01?=
 =?us-ascii?Q?GGcPSbPdzILEEpR5MDrRde4iNiMJ8V/s5HQOek9GMVUQnr32ngP1GRTN+iPW?=
 =?us-ascii?Q?ELy/D/nIf8WXc51SECJmqpSo/wPE8AOOFTq0SKqHVyKUlxf0AruubBTbfsl0?=
 =?us-ascii?Q?WmokHU5MVvTtovUeivBH0xfDM/bNBLilDwgQjN0k7k64+G22cI0PshW6sw1k?=
 =?us-ascii?Q?J25/0RTkQZ3hBxTATEFkujQvYFWuVZ2RSAANinMbFGQIPqbAdJm+ifuVrX+O?=
 =?us-ascii?Q?GkWGfsOYr8hLCE+jU8BI+G3jet1Z9IiEWerNB7+ZpP7sEVzlGpA6qNMuY5Yh?=
 =?us-ascii?Q?tGug3HzaVShVnGTP1So3dY7Ju2e8zTzjvr0XxICU74oSj0B0JZ8/7S4ApI82?=
 =?us-ascii?Q?wXJer6NyNxdASXnpyG2nafxI+A3PKDT3I2TT9kn4BoD1cegdkK3S5T8qwWOL?=
 =?us-ascii?Q?79Jkpw+sTU65J+vymISgWsQ6Qi4OggPP+YnxYBCrG+K5+CeZuBFqzbPtFCdn?=
 =?us-ascii?Q?+tz92aEpWzx3ZJsQN8O6S7HwNXVQh8qHJVB88jRtt0KEK3C8ENtWR/4Ag+/+?=
 =?us-ascii?Q?NixnNWdmww57/0mPT76iwBpTILRQVaaciKw2wvGdbpuKFAq05ZSIvpovJze7?=
 =?us-ascii?Q?78/hL6hufKfDMEEkr+RFotMrSEqzyf766bd+eZLo7plytstI5N7TpMVwiARx?=
 =?us-ascii?Q?COPLWAVzTHF/K3aZQxvBb5C0ddb27VCsXk1BeJfU9cZOJOfl8noXRcEsicN3?=
 =?us-ascii?Q?570AIbYxBmbOKScvhFzG51/6QjQTiJuTaq7By6SI/oZgd/sfflNbY7IwGH7c?=
 =?us-ascii?Q?/1y4hQvEeVqSjozo0Q7flhR7rgPlCWBPFXtVeuUop9hsjusR+w+yTEQT7lED?=
 =?us-ascii?Q?7xZarP/zSCqeEldpruGvrnOur56w1Z5XlVKMEgbH1U+O1RLCiUlvtMyo3VKH?=
 =?us-ascii?Q?lBpx4hVWbCgTb5JD1R5f83z/R7pfbwgBPwh2LOdLeEDRmJ/e9Yve9V/uOxH1?=
 =?us-ascii?Q?BwIAo8ZCBvwYfkEcjDsYHZi4QYHSk9NKegZO5PZPgQKdjeOoXeqlMx/1JUL0?=
 =?us-ascii?Q?gj1XE1zb4JrtzBDvZeOTUBuM4S/wKuGKvL5x8NYzsutzhcBdulVPDvLBzA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 09:58:46.0856
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eee6cb86-6b6a-45fa-853b-08ddd0e2017d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8932

When the system is suspended, USB hot-plugging/unplugging can trigger
wake events of the Tegra USB host controller.
Enable support for USB wake-up events by parsing device-tree to see if
the interrupts for the wake-up events are present and if so configure
those interrupts. Note that if wake-up events are not present, still
allow the USB host controller to probe as normal.

Signed-off-by: Haotien Hsu <haotienh@nvidia.com>
---
 drivers/usb/host/xhci-tegra.c | 83 ++++++++++++++++++++++++++++++++++-
 1 file changed, 81 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index b5c362c2051d..0a3ac770ab4f 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -155,6 +155,8 @@
 #define FW_IOCTL_TYPE_SHIFT			24
 #define FW_IOCTL_CFGTBL_READ		17
 
+#define WAKE_IRQ_START_INDEX			2
+
 struct tegra_xusb_fw_header {
 	__le32 boot_loadaddr_in_imem;
 	__le32 boot_codedfi_offset;
@@ -228,6 +230,7 @@ struct tegra_xusb_soc {
 	unsigned int num_supplies;
 	const struct tegra_xusb_phy_type *phy_types;
 	unsigned int num_types;
+	unsigned int max_num_wakes;
 	const struct tegra_xusb_context_soc *context;
 
 	struct {
@@ -263,6 +266,7 @@ struct tegra_xusb {
 	int xhci_irq;
 	int mbox_irq;
 	int padctl_irq;
+	int *wake_irqs;
 
 	void __iomem *ipfs_base;
 	void __iomem *fpci_base;
@@ -313,6 +317,7 @@ struct tegra_xusb {
 	bool suspended;
 	struct tegra_xusb_context context;
 	u8 lp0_utmi_pad_mask;
+	int num_wakes;
 };
 
 static struct hc_driver __read_mostly tegra_xhci_hc_driver;
@@ -1534,6 +1539,58 @@ static void tegra_xusb_deinit_usb_phy(struct tegra_xusb *tegra)
 			otg_set_host(tegra->usbphy[i]->otg, NULL);
 }
 
+static int tegra_xusb_setup_wakeup(struct platform_device *pdev, struct tegra_xusb *tegra)
+{
+	unsigned int i;
+
+	if (tegra->soc->max_num_wakes == 0)
+		return 0;
+
+	tegra->wake_irqs = devm_kcalloc(tegra->dev,
+					tegra->soc->max_num_wakes,
+					sizeof(*tegra->wake_irqs), GFP_KERNEL);
+	if (!tegra->wake_irqs)
+		return -ENOMEM;
+
+	/*
+	 * USB wake events are independent of each other, so it is not necessary for a platform
+	 * to utilize all wake-up events supported for a given device. The USB host can operate
+	 * even if wake-up events are not defined or fail to be configured. Therefore, we only
+	 * return critical errors, such as -ENOMEM.
+	 */
+	for (i = 0; i < tegra->soc->max_num_wakes; i++) {
+		struct irq_data *data;
+
+		tegra->wake_irqs[i] = platform_get_irq(pdev, i + WAKE_IRQ_START_INDEX);
+		if (tegra->wake_irqs[i] < 0)
+			break;
+
+		data = irq_get_irq_data(tegra->wake_irqs[i]);
+		if (!data) {
+			dev_warn(tegra->dev, "get wake event %d irq data fail\n", i);
+			irq_dispose_mapping(tegra->wake_irqs[i]);
+			break;
+		}
+
+		irq_set_irq_type(tegra->wake_irqs[i], irqd_get_trigger_type(data));
+	}
+
+	tegra->num_wakes = i;
+	dev_dbg(tegra->dev, "setup %d wake events\n", tegra->num_wakes);
+
+	return 0;
+}
+
+static void tegra_xusb_dispose_wake(struct tegra_xusb *tegra)
+{
+	unsigned int i;
+
+	for (i = 0; i < tegra->num_wakes; i++)
+		irq_dispose_mapping(tegra->wake_irqs[i]);
+
+	tegra->num_wakes = 0;
+}
+
 static int tegra_xusb_probe(struct platform_device *pdev)
 {
 	struct tegra_xusb *tegra;
@@ -1584,9 +1641,15 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 	if (tegra->mbox_irq < 0)
 		return tegra->mbox_irq;
 
+	err = tegra_xusb_setup_wakeup(pdev, tegra);
+	if (err)
+		return err;
+
 	tegra->padctl = tegra_xusb_padctl_get(&pdev->dev);
-	if (IS_ERR(tegra->padctl))
-		return PTR_ERR(tegra->padctl);
+	if (IS_ERR(tegra->padctl)) {
+		err = PTR_ERR(tegra->padctl);
+		goto dispose_wake;
+	}
 
 	np = of_parse_phandle(pdev->dev.of_node, "nvidia,xusb-padctl", 0);
 	if (!np) {
@@ -1910,6 +1973,8 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 put_padctl:
 	of_node_put(np);
 	tegra_xusb_padctl_put(tegra->padctl);
+dispose_wake:
+	tegra_xusb_dispose_wake(tegra);
 	return err;
 }
 
@@ -1926,6 +1991,7 @@ static void tegra_xusb_remove(struct platform_device *pdev)
 {
 	struct tegra_xusb *tegra = platform_get_drvdata(pdev);
 	struct xhci_hcd *xhci = hcd_to_xhci(tegra->hcd);
+	unsigned int i;
 
 	tegra_xusb_deinit_usb_phy(tegra);
 
@@ -1942,6 +2008,8 @@ static void tegra_xusb_remove(struct platform_device *pdev)
 	if (tegra->padctl_irq)
 		pm_runtime_disable(&pdev->dev);
 
+	tegra_xusb_dispose_wake(tegra);
+
 	pm_runtime_put(&pdev->dev);
 
 	tegra_xusb_disable(tegra);
@@ -2352,8 +2420,13 @@ static __maybe_unused int tegra_xusb_suspend(struct device *dev)
 		pm_runtime_disable(dev);
 
 		if (device_may_wakeup(dev)) {
+			unsigned int i;
+
 			if (enable_irq_wake(tegra->padctl_irq))
 				dev_err(dev, "failed to enable padctl wakes\n");
+
+			for (i = 0; i < tegra->num_wakes; i++)
+				enable_irq_wake(tegra->wake_irqs[i]);
 		}
 	}
 
@@ -2381,8 +2454,13 @@ static __maybe_unused int tegra_xusb_resume(struct device *dev)
 	}
 
 	if (device_may_wakeup(dev)) {
+		unsigned int i;
+
 		if (disable_irq_wake(tegra->padctl_irq))
 			dev_err(dev, "failed to disable padctl wakes\n");
+
+		for (i = 0; i < tegra->num_wakes; i++)
+			disable_irq_wake(tegra->wake_irqs[i]);
 	}
 	tegra->suspended = false;
 	mutex_unlock(&tegra->lock);
@@ -2633,6 +2711,7 @@ static const struct tegra_xusb_soc tegra234_soc = {
 	.num_supplies = ARRAY_SIZE(tegra194_supply_names),
 	.phy_types = tegra194_phy_types,
 	.num_types = ARRAY_SIZE(tegra194_phy_types),
+	.max_num_wakes = 7,
 	.context = &tegra186_xusb_context,
 	.ports = {
 		.usb3 = { .offset = 0, .count = 4, },
-- 
2.34.1

