Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010001.outbound.protection.outlook.com [52.101.193.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E093D5D9D;
	Thu,  8 Jan 2026 10:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767867789; cv=fail; b=HhgALsYUPiLN6fjeDgPm1NrI17DL/RdFca5MLASxbVqrr9x1JsIOAjfkHqKNXv+GjDLinA1Obbfkx584ZuGwH0fFXG9U1HMyL/l39TmLjfhWJeP4S8jpYhO7fxaHTw+59aTwnsdHTF7tsTYS2KobFwZjHIhz0dS6GHgCqhU7lHs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767867789; c=relaxed/simple;
	bh=3QKs2R4z9y2Rz2zeTrViJDs23t+WGIz0pIFKEiC3rLc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=I8e9TdQu+Nnlp0e7wEDq6V2yla9015ccnKLgCeNIUztqc/QVjGA0K5HPcP551gveVQ8muO4/VylK6SWNBhUp73lTp/HOaxqH/0ed6exoLEWhhtgAgH0sy8dTy1HE3kUzbnVZkdGCgGlzmbHDTJLkh5yn8kE1MHYCkRsd0R+Km70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=reGfJVRP; arc=fail smtp.client-ip=52.101.193.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="reGfJVRP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vy0+vGfLPgyUNigwVo8vwpomrzLt00ujVVCt0gTgzg0NEVhxnOJQi2dsaDgFIJ2sS/PXuDr7XIxz+7GuDV8ozGlm5zF4MGuE54n/EY8639HpjbMQWYAQGuOGBAK2O6LyCJv0QpBAIDHY/h8ly1g9iZrni5MirBvbXCIEsFykljsOznNk3Sq7OuhUQFNlnEecPEGD+BWL91g0+ju0TPjzK+rXDaIHxhu0au9jUPz4QmYEcvXfNf7NFfwyOvKTosMsi0LTTw6Sn7rWz1Ldskltjql3bFIjr9E3kppNW7G4gS6ahbiIBs/grb0IjB41qDLdKqN/NyM6FGPQOMWn9B14XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z90kaKAxIj1FLexVE/eaw4mc9D9oUbNRINikg7RTsdk=;
 b=LppKf5K5mr9urk4By8K1fzymX7J9QPWb5T1nPxHTwMRJzaWQ9tGrkh5ZHBIOoP2myAGzQOIoiVkc6BwUlksyftmkA4s7LN4Ewzno9PdaOcO3gysnsOT0mcDD4g+QfuG5f7QAZov96PYYyerakkem8LWJWPNT0gpL92NEK9YEknjquE/YiqnIlDDWsHkea4HJq+F3YFGkrdURFUFg2X9r6ScOaRmqXY/ZjrJ4Qx0UnvcypCA9bHPhf9QukexlSXbe9HGCKlVoYHSFDe4yLSp9B+Kp8qlo74p3VuHo8HiWHGl32RJ93mm4Ub17O9e2O+9e7WPuU/I3AXY1fHIIZzdaDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z90kaKAxIj1FLexVE/eaw4mc9D9oUbNRINikg7RTsdk=;
 b=reGfJVRPD/Dd7pmu4HNPlOm0LR4ThwM0DjvdMfhNiWZVlgmSE5qzxw961AZlIDV0m2Mf/Hx1mpYCy0FRsP0UknW2Wzq7GNOhmGP955I2TzSCVPI0Dk4A28IDzfCm3ZiASn6pqJXHQNAKNcOUBjF2jYqXP9HUqMeH6oKukL+Yqw9RMxgzaKiLpv6mTlbbdd1PEenAc/JIEvxseRUr5R1Dv6tLsVxcNgtQNY9UkBMiEWdHbMLoCya5rXzrr4u67hWhQ8GkbrK+taNYrZNAdrix/hJRM7qwWxDDNKYLfXGYLem6r/gwEjqQqgXpbKt2ODuR0PPIuUZotzCRs41NvCJUHg==
Received: from SN7PR04CA0182.namprd04.prod.outlook.com (2603:10b6:806:126::7)
 by LV2PR12MB5871.namprd12.prod.outlook.com (2603:10b6:408:174::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Thu, 8 Jan
 2026 10:22:54 +0000
Received: from SA2PEPF00001504.namprd04.prod.outlook.com
 (2603:10b6:806:126:cafe::be) by SN7PR04CA0182.outlook.office365.com
 (2603:10b6:806:126::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.3 via Frontend Transport; Thu, 8
 Jan 2026 10:22:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00001504.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 10:22:53 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 8 Jan
 2026 02:22:44 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 8 Jan
 2026 02:22:43 -0800
Received: from 5b171f0-lcelt.nvidia.com (10.127.8.11) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 8 Jan 2026 02:22:41 -0800
From: Wei-Cheng Chen <weichengc@nvidia.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, Haotien Hsu <haotienh@nvidia.com>
CC: <linux-usb@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>, "Wei-Cheng
 Chen" <weichengc@nvidia.com>
Subject: [PATCH] usb: host: xhci-tegra: Use platform_get_irq_optional() for wake IRQs
Date: Thu, 8 Jan 2026 18:21:52 +0800
Message-ID: <20260108102152.241073-1-weichengc@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001504:EE_|LV2PR12MB5871:EE_
X-MS-Office365-Filtering-Correlation-Id: 55e0faf4-233f-441a-2e5a-08de4e9fe265
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qDz6/8juarMqSpxV8FZASrDXEqV4lb1qqpZFuCt+Lv3QJE7hG0otgwKVdVOI?=
 =?us-ascii?Q?h7CA4qEeMgPMvMbaawGKVKz1UKxF6k/SPTNUxyy5cu28jM0cla3qFUliLQ5s?=
 =?us-ascii?Q?CjyIM74K2pJtLS+JgaiuCooWoSw5TTnvEox2oYxec6MfiDDAOCDEIkJH07/2?=
 =?us-ascii?Q?vCkbBdwrB8zU3TgXnIAuG4E6jxzQWhg2UrIvTbRuehmDFgQwgYFzdgMHBmiy?=
 =?us-ascii?Q?Tqlvu5+LrfoK1kQniGI6nQ5lDCE7Hxbr4x7mgjm8qHElMRuQZGgSCOpPtQp5?=
 =?us-ascii?Q?k/VFZ2cB43Qexi1QPzaDJ34B731zVMOahCzimmBvaazMRNgTRHw++Ogr9A2w?=
 =?us-ascii?Q?5zgUnY7efYgH19xRTWzugSbnrzApG6bYkfmJJlMEZjE+G5ZHXP9CB2GcBY/v?=
 =?us-ascii?Q?XZ3IUBHE1zsiwuQY7JkI7IOGj2m+efwlKQxwLyIMqk98DfMMOXk1aEueqiVL?=
 =?us-ascii?Q?pZVGGiVUgdUwAbG+JDQudifvsWAh1UI5QJkNncy2wkya6SKPyd+MHKo+apPK?=
 =?us-ascii?Q?zazgYKIpvkJDHlEW75iPRnDazLHBGyMtkR9+CXAwngq9cFwJXbnAdApIOkt1?=
 =?us-ascii?Q?aOAuaDZ3ZGIS1q9JMQl9bC0JlSF2Fl8ISB/tG10bduq3jUIhmAAHcUwlEcVd?=
 =?us-ascii?Q?a78GLF9DWEaBjfdDMnX68eb7Qh2fg88Ihi2f4XcXUlpo4A404x74BR1LTgzc?=
 =?us-ascii?Q?E+AqaURhd6Ow+l1hpQCjtChsCRpV6ZSKdc0y+zfvqef1JQ5Y5O9X75bU8BGR?=
 =?us-ascii?Q?7iB9D2TzOvmcw3XKbRBdx1ZKDSLLokENbqCTPO/HCDblcBp2kaHGrrnhMksV?=
 =?us-ascii?Q?tlE7VQxy8GUtEStHBZFmBZqOmdYWn18H7d5fXhaZhCQRhPxk6fFBpncKPIir?=
 =?us-ascii?Q?DEBsLqYxroiSQeNr7TxNGnpKChiojghcmEvyaF5s1xHEZx6pHoSQcrA5CEKs?=
 =?us-ascii?Q?g+ilHzKUZstXBoZOR6NtIIy2JxynkC1vsjJUpysVXS2f8eZG9YllQnqIaIgV?=
 =?us-ascii?Q?qhSDlUfltT1zZwP9oP2zH6csCiC2xlw/JF+S4ajV4TqKxQ7yxTLlWIttmnUG?=
 =?us-ascii?Q?W+67I6OeOk9PxB04nrdiwheL/eOaQiTQPat6guk3XMLWjHuGDsGOPxMbZ1rl?=
 =?us-ascii?Q?TeniGrSe6bYWovipo60S79QIkkoJr4FACMDDDfOhz40elEHP+8JG9/FD/eBq?=
 =?us-ascii?Q?tzPYwLJtOThkZl56xdRH/vGjP31gJ61V/xUsKKjB7ZqfafMQqEXM7qtSS3wW?=
 =?us-ascii?Q?NrY5247FlDPSj6Ym6yIJVgJ0ggP2eR8+6wPNoZ5AumhMLrUubri11EhZ7zao?=
 =?us-ascii?Q?cPSUGcMEuxzyZPEGw/HbI/qTBfrpLjUU9xfamdyvtVve2IUgwclo9VzhIFcO?=
 =?us-ascii?Q?gO+H5hFQ2Mmui0kCdWtvcgFWSgJkUxi6iljGjPfoZqsWGVVeUymsREsB4Guy?=
 =?us-ascii?Q?YnuMgznfLYZSsZDR5fwuMnIb8diovpqMbvUQDins70I8GVmlzEprzgBkF+rS?=
 =?us-ascii?Q?JuidmE740wthCpIYX5GF3SKJYMqIKvPFMImItIcshjvniXDTxsD/Ls8OzyH+?=
 =?us-ascii?Q?IEjK7sjPtgL90XQWStw=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 10:22:53.6839
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55e0faf4-233f-441a-2e5a-08de4e9fe265
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001504.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5871

From: Wayne Chang <waynec@nvidia.com>

When some wake IRQs are disabled in the device tree, the corresponding
interrupt entries are removed from DT. In such cases, the driver
currently calls platform_get_irq(), which returns -ENXIO and logs
an error like:

  tegra-xusb 3610000.usb: error -ENXIO: IRQ index 2 not found

However, not all wake IRQs are mandatory. The hardware can operate
normally even if some wake sources are not defined in DT. To avoid this
false alarm and allow missing wake IRQs gracefully, use
platform_get_irq_optional() instead of platform_get_irq().

Fixes: 5df186e2ef11 ("usb: xhci: tegra: Support USB wakeup function for Tegra234")
Signed-off-by: Wayne Chang <waynec@nvidia.com>
Signed-off-by: Wei-Cheng Chen <weichengc@nvidia.com>
---
 drivers/usb/host/xhci-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 31ccced5125..8b492871d21 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1563,7 +1563,7 @@ static int tegra_xusb_setup_wakeup(struct platform_device *pdev, struct tegra_xu
 	for (i = 0; i < tegra->soc->max_num_wakes; i++) {
 		struct irq_data *data;
 
-		tegra->wake_irqs[i] = platform_get_irq(pdev, i + WAKE_IRQ_START_INDEX);
+		tegra->wake_irqs[i] = platform_get_irq_optional(pdev, i + WAKE_IRQ_START_INDEX);
 		if (tegra->wake_irqs[i] < 0)
 			break;
 
-- 
2.43.0

