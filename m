Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2064.outbound.protection.outlook.com [40.107.244.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58AD2DAFB8;
	Mon, 11 Aug 2025 07:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754898470; cv=fail; b=iIBzIHfgQQc7vWvutC52X9l8InhxMZrzsDK2TXLXKt3eNICrWeGn7IadiPgpatA7Qfxcg2AyHR6E69vo9jiQXzXIaf79T6IFUXg/Xke1Uft4sc1RpoM8KFXLu7BczmlTddPUE3E1fUmT06ekKfFgVryGRVX1Z9mkoVd8wiGMw48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754898470; c=relaxed/simple;
	bh=yUjHRaLzb4v9YQiOq4kTCaHKrn2rOTnNcFvV7j7St2c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aR/uJPY7RdjGszDI4YqqVznkeR1+g1JRoiSB3t1EuCWExsAcPgfGZQJkQZ6X8cxp9Xrbe5vksRBmAiPFHW2MRsHiITYehQ0r2uShHovdL+QPv/bPlr3sNaRtYrkwSiu8SboQ6H8xO22vO+nGREhwtqhU6SJvBkYx6jKzytBF7EE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dZTu0nUJ; arc=fail smtp.client-ip=40.107.244.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dZTu0nUJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ANeevhVdMNrDTGzvmU/HTjo8lj48ej1uJfdeyP6ZtBekICSsEgf1PMcATPvKStipZUmx9gLttewczG9L0gbK7yBNY+o0OX67yrBdLwIOXLvt0mRiJzriE4jnfKtLELHHltQVokfO8i5zby62vR2cT3PYHX2kAKsXpmGBn3jYaWtF0W5vOh9EH7Z0ZSaCQCuTbFRFoHJsU35QhfKTRUaeANGwXL8XDEEzv17nbbJNFcujBryaB9yxcpEk6ALP4HfVyePEhpMu2hXzbNeinY1eQOgMW02gn8Ox6NMMPkEax6CrQzIkXqj+M0qRmBVLhzx4pnBwMNzwflHTec1c1eheZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OpQ5PvmqGfgKtLR2AhW2foSb0ls0tnmvd1umz4XArUc=;
 b=XPuiOoUgqBQJuZ3cKXy0XfTJINYmgiqRxLwM4W8nibI2dEJYQ4AuBz575Termpw4bYAqxIYnegUZeq979l7/WK/qzNgCX9A6Tyg6bOMYi0/GGV7pDhAO2PNyBX5xUjUZ2QVCAbeBDvdcEETfvb2/4hWtoj0q/03ppfklAFvpBHpLHLZqTsH+qMOq5UL9QzKtDeWf+NalP2k2kU3ZL8JDkt0hwX+DLHii1lsixW31zGOKQZXSHXVTty+a/1rrXYrf/r5xLPYz83/li68cgeHnph0PBnM4Huexd6LnXAevfLbiE6DO8EwSaqtJI5y0JUMsLhrW+dD+p/siUCnE+9ugpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OpQ5PvmqGfgKtLR2AhW2foSb0ls0tnmvd1umz4XArUc=;
 b=dZTu0nUJUwGawtaYSFOLpgye3fhaDKUdte83tArjv0k5OHwUwlQmw7YBilGZgVjqcnE2R0eup4yc6ym87jcijdPfTuxx7ScGxXT+oPgUolNYBhmxO7lo1Kj1Wds5dqy2SLl49CICmhjoJLe6MfYHyvbq/GCb70j7gtL0BqPXypmFxpjTNcoeg8Nknb5l8WZU36CyAi6Wei7V9sZYWGCLlVoaHKCXNtnPLg+mei/BB6pLFiaU5tyazlibcCqc1koreXk9gqGissjjisfQDtN5+ukVSjI7OO+vRq1bt7xs4dYvMDs1g8bkznx7L45wwIIGEbyWAh1+vb8DensQgFlCxQ==
Received: from CH0PR03CA0108.namprd03.prod.outlook.com (2603:10b6:610:cd::23)
 by CYYPR12MB8729.namprd12.prod.outlook.com (2603:10b6:930:c2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Mon, 11 Aug
 2025 07:47:44 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:cd:cafe::2) by CH0PR03CA0108.outlook.office365.com
 (2603:10b6:610:cd::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.22 via Frontend Transport; Mon,
 11 Aug 2025 07:47:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.11 via Frontend Transport; Mon, 11 Aug 2025 07:47:44 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 11 Aug
 2025 00:47:25 -0700
Received: from 553356c-lcelt.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 11 Aug 2025 00:47:21 -0700
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
Subject: [PATCH v3 4/4] usb: xhci: tegra: Support USB wakeup function for Tegra234
Date: Mon, 11 Aug 2025 15:45:58 +0800
Message-ID: <20250811074558.1062048-5-haotienh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250811074558.1062048-1-haotienh@nvidia.com>
References: <20250811074558.1062048-1-haotienh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|CYYPR12MB8729:EE_
X-MS-Office365-Filtering-Correlation-Id: 224def25-6071-4ae3-938c-08ddd8ab5bb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0AAxWSPVti/SZ3YBFsjpHOiMk7QPJ0pO6SZKmXIIJ9y/j1SYQS7rf209BtD8?=
 =?us-ascii?Q?31yoiUHRhomsJ2BvIbQKefMn730XmAF/P547vljoYTZK/eMt6JkIFDvAI8rf?=
 =?us-ascii?Q?LlmaUhrgvdtkDLLg2NrRr0sJA9M+xYBSbOqu1KNQ+Yecl9MbXWIb5csXzOsw?=
 =?us-ascii?Q?54pOCwdhplJitbw8uKD7mxWAljxNePodaCSdGVC3T7nWOZvbNtZ0cNz4y89H?=
 =?us-ascii?Q?AX1wErDB51UyG7Mvrs549dsTtxNYh/GTEXe6QAj7XqlUwtGT6w2HWwoxoL5l?=
 =?us-ascii?Q?DxFOLICw9nCrGXjaaA89Ow8o/27/EOtEHGGGgMJY5zOBEMt7zJ40fpzAiUJf?=
 =?us-ascii?Q?NJFJUf5uvr4jKkH1ApFbNeYnaPveHhf9j5lJhtSFTu4Fp5JrKtVn0GXmmxTO?=
 =?us-ascii?Q?O3KdNatKfD58E+Ir/A/d+SfJhpHSAyCrOkAxRrwMyhkzIPPie6Y4EwRO4WdG?=
 =?us-ascii?Q?ouOwRvxPbnST0x9eQDgTRpj+/UItqGp/dW09V3hR4UbrJA5uUwVz1CTu1FJS?=
 =?us-ascii?Q?njVu+qIr1PCK0MEydkR1DsZaHxoUGJBBD7VYFTnHZfhwaEplyNztKt1a7FAh?=
 =?us-ascii?Q?PYMOeBKJqgjhL8MsjzylkYmImWajORKrK7wMe173RdPeEg+bolAsC4ljqbRy?=
 =?us-ascii?Q?RX9iARgCUxTaxpMik32J3ol5ZM9nrbg+RD6JuK3U9ce4mmpxWwTdzFt4tj1Z?=
 =?us-ascii?Q?+nf+TnXXeV2bYDBpmZV/FFekg6EMHHl964hlClaVfSrO7uEFPSCml+iISYzz?=
 =?us-ascii?Q?4STUJrxnRPjiBcANvqYjPTQojpSYsTaKoQoiSGJ0fRwh1VnAu9cDuGoqcqCR?=
 =?us-ascii?Q?ybn46XI5vkRVhkqVhY+29BU22UTTzNakwXVkie9jpPt300jo/7F0qdx0HuC7?=
 =?us-ascii?Q?GWdNdWfZi7XJqFisrplZIYaM4av6qViI+zSu5cWYOgXRiLW0aUj9LrZq2NyZ?=
 =?us-ascii?Q?FdfvyyoIaU1vYbzjr3Z6aSKBM/uNlTf68fUx/xsxUEcgOlMqfZS4mYpuGykl?=
 =?us-ascii?Q?q98TGTJu0ARo4Gtwy+Hb4EULs+A2irVIJeNeFr/pFyCEaTvqF08YFUICBfie?=
 =?us-ascii?Q?NE/Ck9GZzwyiM3uOihHHFLmc06JAWb/F3WXpWFvHFDtFPybrU8CtfSQ7QTZA?=
 =?us-ascii?Q?PINiCHr9ZI0yJ0Y6arm79V73IIO9lSQ3wZXZJ5pmFBMxr2qcpWhTcII3QGcQ?=
 =?us-ascii?Q?TN1jP6JWQ8L0zq2daBkCRimDW5Af/4Akq5vgo3kIU9ZfY980Xf2iRJEPAfe/?=
 =?us-ascii?Q?MfThjyNLR1YVMmBPwFe4l698rrSCiGnzw1foK6YitZAN2xK5LhYW3uBarJB8?=
 =?us-ascii?Q?v87xRnKgziFI2C+7QHZPVLQxQJVWeyt7T6Ofto5DJ+y3EXn7Xmm0ikq5xOta?=
 =?us-ascii?Q?GwXHc4T2fy0OqzkCSqc1Q3h8ZQMIlPgqNqOB01dvlXp3mr0zi9P5cc8Vdkj5?=
 =?us-ascii?Q?iMwP3kkTSlj3K25kw4rQ/W8axXVvHkUjN2Icx9YxX5IBu4ao8RKImlmazUdO?=
 =?us-ascii?Q?HUtTpW40WPea44TCI0Zdqib7saeBu85ChGZzf1iq5Kwfyaa9S6sLqFUGxQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 07:47:44.4123
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 224def25-6071-4ae3-938c-08ddd8ab5bb0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8729

When the system is suspended, USB hot-plugging/unplugging can trigger
wake events of the Tegra USB host controller.
Enable support for USB wake-up events by parsing device-tree to see if
the interrupts for the wake-up events are present and if so configure
those interrupts. Note that if wake-up events are not present, still
allow the USB host controller to probe as normal.

Signed-off-by: Haotien Hsu <haotienh@nvidia.com>
---
V1->V2
- Fix the -Wunused-variable warning in xhci-tegra.c.
---
 drivers/usb/host/xhci-tegra.c | 82 ++++++++++++++++++++++++++++++++++-
 1 file changed, 80 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index b5c362c2051d..b419f0917feb 100644
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
 
@@ -1942,6 +2007,8 @@ static void tegra_xusb_remove(struct platform_device *pdev)
 	if (tegra->padctl_irq)
 		pm_runtime_disable(&pdev->dev);
 
+	tegra_xusb_dispose_wake(tegra);
+
 	pm_runtime_put(&pdev->dev);
 
 	tegra_xusb_disable(tegra);
@@ -2352,8 +2419,13 @@ static __maybe_unused int tegra_xusb_suspend(struct device *dev)
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
 
@@ -2381,8 +2453,13 @@ static __maybe_unused int tegra_xusb_resume(struct device *dev)
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
@@ -2633,6 +2710,7 @@ static const struct tegra_xusb_soc tegra234_soc = {
 	.num_supplies = ARRAY_SIZE(tegra194_supply_names),
 	.phy_types = tegra194_phy_types,
 	.num_types = ARRAY_SIZE(tegra194_phy_types),
+	.max_num_wakes = 7,
 	.context = &tegra186_xusb_context,
 	.ports = {
 		.usb3 = { .offset = 0, .count = 4, },
-- 
2.34.1

