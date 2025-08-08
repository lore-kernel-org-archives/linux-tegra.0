Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2085.outbound.protection.outlook.com [40.107.94.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E75923770D;
	Fri,  8 Aug 2025 06:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754636361; cv=fail; b=fZKHVelPXOc+Fb0ppmIqMR0O+F5TN2Xz0lZMtTuejO3isYZ1a21btjBV3LP18ls6k67/U7FDVOkdpQ8lXmigpXqwAj/1Gd9A2b0vFsL0VcB0cRWIXXU4Fm7WDmPl7EQQb68kR4S7o2fJi+8/XZnBUpbBfuaKSZ3ITg0ifB7fCac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754636361; c=relaxed/simple;
	bh=yUjHRaLzb4v9YQiOq4kTCaHKrn2rOTnNcFvV7j7St2c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QDBcDS68JqsIZeAxEyZdf7GzNLdxWNvvPm1P+bQzuh+Ubj60JQ6gdOxfqE0ifZt8UMUC/E+QoDerk67Rny7ot/FSCmn/lMApuIICwEQ1u8Vc4fjWYt4rCgF5Stkdu1bVTg6pS6EnJ/wZPR/K/0LZxaAo3gcMCmNPmWImRF9YYtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Zrngm2CV; arc=fail smtp.client-ip=40.107.94.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Zrngm2CV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fnQuSBpFZbuXIZH4blx/Hl7j/l37w0sTAeaHuYmYu+Y4oFqgJtQWM9SKUx5G66YyaT/d+DnGJon3O5Nnt2sjN9WDyXgMrO1EJ4TRRfXC7rU+itlOuSKEZklUVcKdEol4j9IdyPqITF6YQdkoRcju9ZWTZBWryo/FJSVBk+N22bLIfPkQMDRumG10Iqf3mfYO5vORHrW9ZfICsG4+Ym8rqDHNd3G3/Xow9wQAQxYsLJtNtdIq4L/vOso0KZavupGYRtqcyyxf6YCqccIPjqgObasuGL7xO+Sb7qqBv7zXjwBPwvTjoYnVHc0/nyrxULIJQ7jnURe8hX1gHfvdvVJWqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OpQ5PvmqGfgKtLR2AhW2foSb0ls0tnmvd1umz4XArUc=;
 b=gXMXCSVtene60SyiPrIXSbRVL6w3PjefUyZEX+mfScZXUNubtOUl2U0+sKZ81/jS34F1Y7Zy3nPnUOIWI6BxgxXoMQATXDCEk9dVbryIRil74Z7nTcZe0EVeIo7EG9/X8/0LksAnyyEMGPcj+70LXKpxRyxhKv9uVN685dWEm/+6Mezi1iPFTUj4Hfwat3dGmLWnSOprYHFEBrh3TwaxxqEIPUej30labYtztDax5orOo/bYtKToUeGnHvolFP6zeHErnLLQdVN5fbvp0IKRXAIHSSlgHZ83CM6St/CGCgVg6TzhBUUptm6VPsh+PVkhJLNq1TZPsKwC40wCUWiV4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OpQ5PvmqGfgKtLR2AhW2foSb0ls0tnmvd1umz4XArUc=;
 b=Zrngm2CVnv7MQcNWrCUvBa6NchnB1tQ6+QebYh6bE9UWj9sTTD4TMGGB/bduf4DcKRTMZn0UEtt6rsL28AfYHIiWI+h/BYuDObx6PQn37cUoeEmHjXgtj+E0Wqy8oyR5Xw8BPcKJU2bXV1AhleRzlKhUHhNoYnV9+5G3TTwkkEHttDJMpXwwrsCDYTVwYg850UskOzf2Skxfzo5oUnubGVOGJig0882hY5i9LWjMwc0HRB8chNLzII6Jkve9nErFzye4sZxs2Hb0onStxOuBcFZbEH9siTu2VkwqFbYrlLE1OIMqO7EpX8kwgcpJTe253EZQJ0GYqCc52ixgI4XfXw==
Received: from MW4PR04CA0300.namprd04.prod.outlook.com (2603:10b6:303:89::35)
 by CYXPR12MB9427.namprd12.prod.outlook.com (2603:10b6:930:d6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 06:59:16 +0000
Received: from CO1PEPF000066EC.namprd05.prod.outlook.com
 (2603:10b6:303:89:cafe::d3) by MW4PR04CA0300.outlook.office365.com
 (2603:10b6:303:89::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.15 via Frontend Transport; Fri,
 8 Aug 2025 06:59:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000066EC.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.8 via Frontend Transport; Fri, 8 Aug 2025 06:59:15 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 7 Aug
 2025 23:59:03 -0700
Received: from 553356c-lcelt.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 7 Aug 2025 23:58:58 -0700
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
Subject: [PATCH v2 4/4] usb: xhci: tegra: Support USB wakeup function for Tegra234
Date: Fri, 8 Aug 2025 14:57:33 +0800
Message-ID: <20250808065733.347264-5-haotienh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250808065733.347264-1-haotienh@nvidia.com>
References: <20250808065733.347264-1-haotienh@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EC:EE_|CYXPR12MB9427:EE_
X-MS-Office365-Filtering-Correlation-Id: 0290d2a4-136c-4c30-0c4d-08ddd64916b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?87viEY9OpdIVEb+jql5Qg2bxLkMgq1cSSvB5UI/gQeARt6o8FpRh81G5uDmP?=
 =?us-ascii?Q?OOK2dRwQsyOn9eby/QB8ipUQIoGscnj3k4HtytwN5shUsCaYtWc5T4Zic2/x?=
 =?us-ascii?Q?LcLwIkYPs6AA2Cwlm6swYz3stq6NnH0kh+IMl30FKRq8qC+dq+qO67Dh9nwk?=
 =?us-ascii?Q?JLz21+PtN+2BIfPEw8W7ra1H9y/0XFcgQfMVOy1R4fQUg8vpnuyuP4J/9Yzp?=
 =?us-ascii?Q?a4Ve8v18nqs/sQfzbggMdxzb7iqWyvqwXQo5TPGHHSecsUIz62RippR0LBQ8?=
 =?us-ascii?Q?kbLQAQEU+qLtD8QE37JDLLge+MoT5cQI8zzk+DcVuLX0l1pQiPYSY1iW48pa?=
 =?us-ascii?Q?/UXeWNX63IjzV03OH9jgyadDIdfgE6ikDLrLhdy3ITXgKmCN4HTAv4W6FqDI?=
 =?us-ascii?Q?9/nLqECA8+BKV2qNyFH1diM4DHiCKQWxd34S8JYvuzLvkAnJywI6K1pw+BlX?=
 =?us-ascii?Q?MnSm/8So5gv3u3/pTbDfkZLGsCc68Tyz/1ZqJn0iKqDowXbnBn4FUj2+f7k1?=
 =?us-ascii?Q?NsK4RtfWgJrq8fHdj92KaILOV6frU/zOg9lIGvUJ++pHqSXx6Yw8PrESQ9Nr?=
 =?us-ascii?Q?Od1PZ7mB7kP8UE96vVbEilgirTiUmML/bNJO3mVJIZ6Yemkpdmcqq4ndWSt5?=
 =?us-ascii?Q?LydKrOt8VG0G2B2/1EXmZyvxuEV0Vx+mmWGQLK+FHyswyFD6ePlp4cmtv6ak?=
 =?us-ascii?Q?88sfCBvn6GkWVVUigUpIPCgzywl+SoMYxODuqk1edfOri9IpPz7w7HswiIEv?=
 =?us-ascii?Q?NNuNQM9Kqgy/CYNGldJ+q1c9T4YjOSS6cRXkoLNJpSEDLXvErFIRQEL/lJvd?=
 =?us-ascii?Q?z+ziueqbbMtauL2tQzWbabnBaCO3HSN4XnH59PZM+JapELNtpmh3ED2/cFLc?=
 =?us-ascii?Q?hZHYg8zj37BiyEre5er7jn56aAo/fWUTVs2tBCZ0IPk/eVqhXubA8D6tSD3T?=
 =?us-ascii?Q?FN//gQxju41EzMo56+idYRLtO34SZu+WuBW4ugn/lOV27N/ZqW88qu4fwDac?=
 =?us-ascii?Q?G0PdwFW7HAC+Hm4kLQwA15Q9BIVvGdi9EkPDloXvMI9xs9YP9mx1P9IauENm?=
 =?us-ascii?Q?tYx3nzWTtbGmB6gLCC0TLshC9zJ7Ue9g2aGWyQP2OLhPjax9gfDrfpBYgU/v?=
 =?us-ascii?Q?V9ISw7pdTjpanPorOkLQrTtyHqjp9Ahoggs1jwuMw53nOV5Ccqc/1IMXCvv3?=
 =?us-ascii?Q?5lunbxPsbRZ/jQt1cSdFMBXQyybt6K+Ddl+o/1Ou+TeUX45ohhVDoK7DZOaZ?=
 =?us-ascii?Q?rFJA/axS3MUAtO2ryG0aNZBl89xOi2o+9Z0WdzXfcRiP4vEnvjuDFz9XE6S4?=
 =?us-ascii?Q?d7eNawhHC475OzpA/FV1KFn7L8wbIEB/+CzGX2oN8DjyG91JAQTzOr5jtzTR?=
 =?us-ascii?Q?/EangS8ofqhgCQ1xN6EN9oQTUYiG5UldPgQ62mebkrkAMJsFnFvr7vYyiUgI?=
 =?us-ascii?Q?Q04RYmNOD6X1muYuS2pwbKoeqNArC5m3impoADvi1FB97sGUd19vkdlso1ng?=
 =?us-ascii?Q?XFcXAvNwCm+NJKYbS+kyqvATqZmA7jKO06qtkYsY+YQLDhvSfMOoHy6GNw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 06:59:15.7618
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0290d2a4-136c-4c30-0c4d-08ddd64916b8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9427

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

