Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2068.outbound.protection.outlook.com [40.107.243.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187DC1F4FDF;
	Fri, 11 Oct 2024 07:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728631496; cv=fail; b=NYt8I8L6F61t1I3Z9RRc+hHt0IHkC4BN3Pkh+Rv4f9cpl/nLe9ZlVy6MNGBQk2kO2k0F3AO0oE57srrUma3QRkSrZWNztDxB5eAbr5FOI6vrrVb93mhppJILoERUGxBXCBAUD0EKffFshcJQpRKiXr2EsuvbulkNCyRYNtrv6OM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728631496; c=relaxed/simple;
	bh=ohv2HKuYid+pcP519M267xIHMZeECH1/0gOTih3f9jQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=b2vApMebl/s6rQPyFY7IQ/6VNNlqNUnbzYps34RgJNHD653qCDNVfLd/BmHMnk+7nHT4dehr9uUxPKOv1Yo4g20apK9QNHKWjZlf9Bvf10BmieDNXl7pobBVyhfZYen7Fky6umZPZVD01uC0r3Pv1KEa9Viv3nAXveqCahzj3vI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uR1snVFG; arc=fail smtp.client-ip=40.107.243.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uR1snVFG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bSRthbRnt2z13cV7rCINm0zloJUHNvcEI/Vzx+x1BbARhnjvsCGbUsE9PEOtZepHuep5xIa6HSnhDvMFRjvQ+oTa4o29Klosa0T25aalc2srTNwlaSCHPJDgxxhrn118KclHTA/NQFjB+ePYKuMdCigYeuZoie7MtvctEhRNmHAtS7w6xuhyy8I+2x2fvNpNPs7TE21QlEEMi403O8UYt1okRw3igeMKvJkqOPa6maX3idNfKCu6u8slwTvWCIqPvb2ho/44SmJNTEHPD2xXfx1Z2imoXhDKnKKB9rX+YNtNa/Z1MyrauMLpxSWFV5FpSTwUkKT8YS+8VVoyTHtESw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/M7+dA5ZW90CVtPff5i1S91oh6cCtqcNTSCVzUbrs4U=;
 b=sRFoV1l43SEWK6/gGZdxTmDSzbe91QEjdW3GaqD1Cu7MbhLodPjCqnaddIS0S7KD75UFf2bqmDwZS9mWrt5MijCooL/FtwvQicaRb6L3ljwyU3j6XEGJd+cbZmKWWJpGE0iZre3m9A4IRDO2U5AGBtxqkLhlOrzCRGHx8GbKmxjR2BE4ZFSi4Tk7Nzm/GV4Fax0JsNP4xKPXUTSUyAK2BFxz346ZT/EaByJNdldr7CVUyj3maa461d+phinHbdia06D7nEs1fgAhq+IiNfe/JEmZ7roL2NwNVxfXiMMgcJONW3xxCaiWpfELpfYhYNMGZMN/TQjtrqfJzRbph6Vmmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/M7+dA5ZW90CVtPff5i1S91oh6cCtqcNTSCVzUbrs4U=;
 b=uR1snVFGvXfvx1grukmnkErxspbBaVnTDnJ3qFbga+ermfZokWSDzmdWCCMCYCukvYRnpxIBlr/R5/OxuuUrsISQPSj+Boz4zBwR8lV+g74v4lPDO1Ah/Hxu/KsIXo8w0KFI3ETf8Y5U3fLTsOk3ey2JnIaVqFegFx17Q7zCwgKaEWWGKP8+9FtmQNgoEUCq4XLXnSYUdQVxRIw70n2mZoawXGuAO3ItkIZ8k7rQUKkDVe/y5K0ASebMaqbnEhUo7GoTfh/fkoYzVPYDx1ZOKBp06TJUEIz8aPETKXpdN0rvFFCqnS6teQQpIRipcpF1I0UsbqXEbzklyMHBv3BsXQ==
Received: from DS7PR03CA0241.namprd03.prod.outlook.com (2603:10b6:5:3b3::6) by
 CH0PR12MB8552.namprd12.prod.outlook.com (2603:10b6:610:18e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.16; Fri, 11 Oct 2024 07:24:51 +0000
Received: from DS3PEPF0000C37D.namprd04.prod.outlook.com
 (2603:10b6:5:3b3:cafe::e5) by DS7PR03CA0241.outlook.office365.com
 (2603:10b6:5:3b3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.19 via Frontend
 Transport; Fri, 11 Oct 2024 07:24:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS3PEPF0000C37D.mail.protection.outlook.com (10.167.23.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.13 via Frontend Transport; Fri, 11 Oct 2024 07:24:51 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 11 Oct
 2024 00:24:49 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 11 Oct 2024 00:24:49 -0700
Received: from henryl-vm.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 11 Oct 2024 00:24:47 -0700
From: henryl <henryl@nvidia.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, <linux-usb@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <henryl@nvidia.com>
Subject: [PATCH] xhci: tegra: fix checked USB2 port number
Date: Fri, 11 Oct 2024 15:22:40 +0800
Message-ID: <20241011072240.42978-1-henryl@nvidia.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37D:EE_|CH0PR12MB8552:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fa5221f-7e2e-4f4e-440d-08dce9c5cbb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iwimozzNZIY4pJQKufMM6H4PQJdFXRHJBLeQXtKOwmLKTHFVnpRRs0yoJcAE?=
 =?us-ascii?Q?sQipZ89UNvKWNpRMOlHSAtqnnzn30NT0DEO2do5QtpcadAH7xVIaPKZCHrvZ?=
 =?us-ascii?Q?CDuXXZ51e2LO7ZuuRZwFMa0Ymz/R169/q327qkZc6iMTyoWs0lbCIC+HZDe7?=
 =?us-ascii?Q?Sx4G/P/yGf8HZ6a5OOrhX1EQFUb+BU6DsOXlowovUyxCcgQShZzzebkcAuFD?=
 =?us-ascii?Q?RQr64lVR5nMyXbt143i/sJ57rI41ONRCYUYBUHwx5LpgKbi7SyBir1l1saih?=
 =?us-ascii?Q?OA/BIZ+Ns7HVhPrTMPXzgdpWwTEHrUmXL/PxagK7gFUQMmD0qAB0dc8g0us/?=
 =?us-ascii?Q?j7TbyI5bQus9/fKlPhkduGIt16ZvXSnJJwYkVwdT+nNByRKfEk2BgFL0OHPZ?=
 =?us-ascii?Q?KV0wcHO6gUPSyjuzgDo312LkyehRsO9whLGol2R8JshmIO2DwR3qsm9W/nFJ?=
 =?us-ascii?Q?QEsLEpzB6IHUydWAaRQpeGFjUaZE206CRzJf/aTI0W2XnzfDXls88wrWSlgQ?=
 =?us-ascii?Q?lJu37ixQWAyHLifzik2f+L495gXQj1rDL1Dt170EvofQ4whU6JIIJvBssbfY?=
 =?us-ascii?Q?0p9tdAuC5aPG7gxLOWut71iQoV4BfEEczr3/vZPlhkifE3S6aI7uSSUQjzxy?=
 =?us-ascii?Q?Wy89tvWGZ+yGm6ZmNAiQRLAvYJNgdKO1HJwapxzqE5KlP+Ir2jXh/CbDf8wo?=
 =?us-ascii?Q?5wJiTEKYQFXuTBjByKiuniSMrFNQSCGLN3x5KstUIdSp1LbVDgTgAOynVy75?=
 =?us-ascii?Q?eJa4tCGb30pDvjIen2DkVYqdbDNM9lTsLQZYwP2cNBA5vEfv07dZBRBoSQsu?=
 =?us-ascii?Q?uuc2T6YzE55booL2/41BymuTpoVNbNqqqyY+C1cvRdZXCn4Hs27D7ILQbr7u?=
 =?us-ascii?Q?q8IKPbi4JdlpS0yisGR5b+LLk9HAHKEclF3kPpVS0a6JaLwlYa6FsKkgeTVE?=
 =?us-ascii?Q?TbbrvxEZFoS6fLZgQkGYUrThbcPumV/o0WUHMhN0MSRo8v8f+14QOdibb/Ii?=
 =?us-ascii?Q?9Z+dmxwQFFff6ukINXO7md7beAQzJH7Shb3+eJ3X7R+wemrAqjmLr6ZlFnCn?=
 =?us-ascii?Q?dEsHttZ2zuTcNKHpLZG9nxDf9XFDbJ+xE6O8E0+hwWrmrPGw6xXH2/BiRe1W?=
 =?us-ascii?Q?gzCgrsC0Bw5xgKKsAZtoyEch21aFZJh/VoJnDQMIP0JYNzWy0RQgcJRYV8dk?=
 =?us-ascii?Q?wRikTuR2dUh+Efs2iBvYeD0sGXZUlSQW3Q6IDpqk0jclHYPNL/CocxIkJ2a/?=
 =?us-ascii?Q?rE/qnIwLbTMU2WwTT060lJ66Ixqfvcz6RlvKvKRDO27zN9A1FDTJw+g0PGH7?=
 =?us-ascii?Q?CogShq0nAIzIREITTzyaJNvoe7xgroV7wsvcHpD+9nYUE1RMC3N4U6H7B6Wm?=
 =?us-ascii?Q?/vnCu1g=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 07:24:51.3638
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fa5221f-7e2e-4f4e-440d-08dce9c5cbb9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8552

From: Henry Lin <henryl@nvidia.com>

USB2 root hub in VF may contain less port number than supported USB2
phy number. Checking all USB2 phy number here would cause invalid
memory access.

[  116.923438] Unable to handle kernel paging request at virtual address 006c622f7665642f
...
[  117.213640] Call trace:
[  117.216783]  tegra_xusb_enter_elpg+0x23c/0x658
[  117.222021]  tegra_xusb_runtime_suspend+0x40/0x68
[  117.227260]  pm_generic_runtime_suspend+0x30/0x50
[  117.232847]  __rpm_callback+0x84/0x3c0
[  117.237038]  rpm_suspend+0x2dc/0x740
[  117.241229] pm_runtime_work+0xa0/0xb8
[  117.245769]  process_scheduled_works+0x24c/0x478
[  117.251007]  worker_thread+0x23c/0x328
[  117.255547]  kthread+0x104/0x1b0
[  117.259389]  ret_from_fork+0x10/0x20
[  117.263582] Code: 54000222 f9461ae8 f8747908 b4ffff48 (f9400100)

Signed-off-by: Henry Lin <henryl@nvidia.com>
---
 drivers/usb/host/xhci-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 6246d5ad1468..76f228e7443c 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -2183,7 +2183,7 @@ static int tegra_xusb_enter_elpg(struct tegra_xusb *tegra, bool runtime)
 		goto out;
 	}
 
-	for (i = 0; i < tegra->num_usb_phys; i++) {
+	for (i = 0; i < xhci->usb2_rhub.num_ports; i++) {
 		if (!xhci->usb2_rhub.ports[i])
 			continue;
 		portsc = readl(xhci->usb2_rhub.ports[i]->addr);
-- 
2.25.1

