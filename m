Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2046.outbound.protection.outlook.com [40.107.101.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B3D1CB31C;
	Wed, 18 Sep 2024 22:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726696813; cv=fail; b=kyf/4OQUj1YNkgnbkwfyzgJCbjjHwavUX4nsNsW6wysBD+r8z7HEHEktjsn0EjcH42Gp71gW9EnQ8u0iszwPx3rAz16n1OkjlL58jzGsB7e6jQ+q9o5mT4UnfcdodXW3Etb1oFak58MlMMtR2u+O3A3mMP3q1wx72gGvAQLRUUI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726696813; c=relaxed/simple;
	bh=Py6pcVJhAWkxWSmec0WpF7L/lfP/d2xbImYOiJOC2d4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kpq5NVMdXfAXm1QIY2ZwSyjo/Gk4cvj5Oi39EaQYxSNTmpLiAnrnm6BQuX9Ng/MXjUOwHu4Iq6tBa87nj2dJnXDhIoywmwd22+WSBFp1CW8R7wgj5U+jgbphppFqPnt+wNWoIjGMpDIgUKXlr1qgLIRgxH/T72qFzBsqKQVQMRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RhvfAZjD; arc=fail smtp.client-ip=40.107.101.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RhvfAZjD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tFn1JRl6b/xsMGQWXL4hr5K1OX7HjEuxspPp0ibaSpvE5fjhAkYPkUMT2dixl57OugQ8oc7vOBLMXoldg2gM+TnagO+k0Wc7QmoO5cEbdQ5hXbv8yWzmpA9JUXAa8kwv/g21a3L1Y7BmB2U0pUhM0OAtTu1W/r/zgh6kbY/fwUT5O3xMbMm4dzoOH1yA5AtBwc9SPOGWSoQZljiTKAmKZAJvTC4UdTQK0QyyeVQ7PiLz1rbPA9Hk2WwrN40agUh7fkeWG/1L2PJuWGO+6sHn7T17t7kHTgn+eIgHx3QMrsDGFcY1GQ/9CH72la+bM0wBIz8+iG2TsQteTOyjFy1JLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ng+uljFMhiGVWsZsaFsSzr10iI6+EPhC4xcLIRcvj70=;
 b=D+jbACz9FNLBgArrxTKHJXLVxFKzsu5VpxJUZ0zScslh5R1zRfNMNucdCeRAID6edPalycq3Bsrgr+OBr3c1LgJYcdea99twZOx45UQRnIufOp6Wt2UFJzEsfl1kC7uq+Vglm8YrkR+9HGQsiScxY96V59hk1NCRa2Yu7ipdCV9q6VN76f0vNG5OALBqao5S35vHcBG9kjtMf8kfEo1wA/6W84eFAb5Vd5Mi0ebDn59/tn1beVt1GxGIDsVxStXVq53dfQjaLONFI6FU//gD9ZZZgoJrMECUlj7qadX1KKqcY2lGys6jKez/Ojg7LuYubRSREV6sI1bNaOh9G/BlYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ng+uljFMhiGVWsZsaFsSzr10iI6+EPhC4xcLIRcvj70=;
 b=RhvfAZjD29SrB35U1gdN+aFT//0S1zUENAet05G/OrVWxeBauXuZ2Vsb9MeKgQrtifhIQocIMgLwcb/lHAIoHwnk/+E9fQUj7dmYx+cimvtVG0CuLLw8g7zGRayv+MOVwbqJqjlThfEKRubjYckVGfxvhf55ZHJKF1ClsPnnQzgnSQwk0EBrbgAH//mNQ6Yy4v3GYXuteS0jcuLpKfUccnMC7BU6ZC8Dwc+sNM/8eO3tKbwceo1FoenXV63Fc4KacsfTo/R+z4AVtBMLeTlDNaiwPJm+wLSaMhMVapU1hMz8sKbbVzwrFYziw5Tc+ZrFsU/ym4nZ4LbxEA1fFlpdrQ==
Received: from BN1PR10CA0009.namprd10.prod.outlook.com (2603:10b6:408:e0::14)
 by CY8PR12MB7491.namprd12.prod.outlook.com (2603:10b6:930:92::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.26; Wed, 18 Sep
 2024 22:00:06 +0000
Received: from BN2PEPF000044A2.namprd02.prod.outlook.com
 (2603:10b6:408:e0:cafe::8) by BN1PR10CA0009.outlook.office365.com
 (2603:10b6:408:e0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.25 via Frontend
 Transport; Wed, 18 Sep 2024 22:00:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN2PEPF000044A2.mail.protection.outlook.com (10.167.243.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Wed, 18 Sep 2024 22:00:06 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 18 Sep
 2024 14:59:54 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 18 Sep 2024 14:59:54 -0700
Received: from build-bwicaksono-20240327T112120892.internal (10.127.8.12) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.4
 via Frontend Transport; Wed, 18 Sep 2024 14:59:54 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <suzuki.poulose@arm.com>, <robin.murphy@arm.com>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <rknight@nvidia.com>, "Besar
 Wicaksono" <bwicaksono@nvidia.com>
Subject: [PATCH 1/3] perf: arm_cspmu: nvidia: remove unsupported SCF events
Date: Wed, 18 Sep 2024 21:58:44 +0000
Message-ID: <20240918215846.1424282-2-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240918215846.1424282-1-bwicaksono@nvidia.com>
References: <20240918215846.1424282-1-bwicaksono@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A2:EE_|CY8PR12MB7491:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b24cc76-4e7d-4b35-a1be-08dcd82d4178
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9D4y8FoQMzU1zcDWJxFm513J5e4P2txySD9R6QFSCoHi9G1XFS+g49tKgLBd?=
 =?us-ascii?Q?/IJ0gqS/TMMcWVx6bx4fpSuRg+6CDapmmSVpKqug6vXfX2PGdv/TovcXciHN?=
 =?us-ascii?Q?VguVhq7ZbBu/3g5EA4hAqAvrs0m6P+IMJCTeqcxSM3zWrGw3E6oqWxEJWYgu?=
 =?us-ascii?Q?jAVXLJ3LK+m9rIdlQtXlRGGavaR5Jq1f6G508rowwxq9OCBI7UP1CrjlO7WW?=
 =?us-ascii?Q?VFI17lYjrzFNLbyhMBEMpJx2nKG9cUGt8S82ia7h6F5l+LxWzy5Wl361ueR6?=
 =?us-ascii?Q?3ta90D4Km7zBWDuepA8SrBz+QblqRa5EhI/VVH07VHrhredtfHm+2mp4PSVB?=
 =?us-ascii?Q?JWrP3SbHEEABaJ9xvuoZHtTx8zdOpoDSinOqwppSxmYiNcDV4LruXgW+I9db?=
 =?us-ascii?Q?CvyzESlKRktiWo0EPnQMNf5lUiFehVYPAJzChnCMWV2qCMCV0BXHn6IXoyjL?=
 =?us-ascii?Q?PMYuxtfsUNENftJ9G91ihUrWaOw7wiWAgQCTIqGfJ6CqJ4fgb5k4g8gQHETo?=
 =?us-ascii?Q?+KUF9lgjS8IoE89KCjiGpNCr3g4r1QTAFSmHd5vjcnOMkExfWxXHgcPcuCL9?=
 =?us-ascii?Q?CdJYDRK7GDfL5ryQ7L11xGwIk+8KjQrZdvKQoRGIUogDGH/tqNCB+2wdutlb?=
 =?us-ascii?Q?GjxfmZkvFyCMdnmrR+yN09dlaedAD0x99r2hNM4ZpOy2QnmMRvH3NEHRESrd?=
 =?us-ascii?Q?+el1uyrRHI6OHXrq0B36LfuctF8EgqQmTo59w73X+q+zHjBRMtJJ/BVbcJaL?=
 =?us-ascii?Q?vhPCZLDbLicPRVfWm2UEhEdNxxwPBZtdbgMmpLZUXdZ5PNIg1rshW0pHwELH?=
 =?us-ascii?Q?jT2BTodobvXFWVFZ7oqRrDVmWqvRN2ylTpZ9HWtuwFOQCBi2fk6XM5WKtcPw?=
 =?us-ascii?Q?WSdiS9QMV9YDKrLjeNGC8+P3lBC0/lBFqagcqhREGqcgZITGafIQXCxRJnzk?=
 =?us-ascii?Q?Bf88VHF3u+mBgdqMTHQr6U3vNC7ncYgePC1Ey+JdDqkUei1PXM7aFwUHtl2u?=
 =?us-ascii?Q?enrEX93yauJfzyETewgmenVtOEFR7E/I4VfN2jFHgvgU0KAbTd/TLUWjgltw?=
 =?us-ascii?Q?wLzX7MPcUDpyxFTDi+M4xoUe60HkwJyXY1f4Jgkdb25kdjGmUmLska/YD+UO?=
 =?us-ascii?Q?INGL9mOv5UCyMhhzCWI/1tCaA+K3ET8V8wou6G7gpDAsHLGNgBmjgVWEhp0c?=
 =?us-ascii?Q?o6Tc/fUExF7ijMq51uxvPX1zwia0/XBXh0ci0SVvi7MhJ182Y7Q1g7VfJ/2m?=
 =?us-ascii?Q?twZ2w4cyBK4m1SmS0lPImD3B8H5gvu8RIxjTv8lmasqIV+ADwicaRg33ha5O?=
 =?us-ascii?Q?DroNaLXO8mwOicgFYOSz4Ho+RCxtxk5G91RdpgWlKLe59fExBFvZvp6RBtlF?=
 =?us-ascii?Q?XWiIxT3QN3cyNFGbLiSOy8aWCkWB?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 22:00:06.1445
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b24cc76-4e7d-4b35-a1be-08dcd82d4178
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7491

Remove unsupported events under SCF PMU.

Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 drivers/perf/arm_cspmu/nvidia_cspmu.c | 64 ---------------------------
 1 file changed, 64 deletions(-)

diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c b/drivers/perf/arm_cspmu/nvidia_cspmu.c
index d0ef611240aa..ea2d44adfa7c 100644
--- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
+++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c
@@ -54,65 +54,24 @@ static struct attribute *scf_pmu_event_attrs[] = {
 	ARM_CSPMU_EVENT_ATTR(scf_cache_wb,			0xF3),
 
 	NV_CSPMU_EVENT_ATTR_4(socket, rd_data,			0x101),
-	NV_CSPMU_EVENT_ATTR_4(socket, dl_rsp,			0x105),
 	NV_CSPMU_EVENT_ATTR_4(socket, wb_data,			0x109),
-	NV_CSPMU_EVENT_ATTR_4(socket, ev_rsp,			0x10d),
-	NV_CSPMU_EVENT_ATTR_4(socket, prb_data,			0x111),
 
 	NV_CSPMU_EVENT_ATTR_4(socket, rd_outstanding,		0x115),
-	NV_CSPMU_EVENT_ATTR_4(socket, dl_outstanding,		0x119),
-	NV_CSPMU_EVENT_ATTR_4(socket, wb_outstanding,		0x11d),
-	NV_CSPMU_EVENT_ATTR_4(socket, wr_outstanding,		0x121),
-	NV_CSPMU_EVENT_ATTR_4(socket, ev_outstanding,		0x125),
-	NV_CSPMU_EVENT_ATTR_4(socket, prb_outstanding,		0x129),
 
 	NV_CSPMU_EVENT_ATTR_4(socket, rd_access,		0x12d),
-	NV_CSPMU_EVENT_ATTR_4(socket, dl_access,		0x131),
 	NV_CSPMU_EVENT_ATTR_4(socket, wb_access,		0x135),
 	NV_CSPMU_EVENT_ATTR_4(socket, wr_access,		0x139),
-	NV_CSPMU_EVENT_ATTR_4(socket, ev_access,		0x13d),
-	NV_CSPMU_EVENT_ATTR_4(socket, prb_access,		0x141),
-
-	NV_CSPMU_EVENT_ATTR_4(ocu, gmem_rd_data,		0x145),
-	NV_CSPMU_EVENT_ATTR_4(ocu, gmem_rd_access,		0x149),
-	NV_CSPMU_EVENT_ATTR_4(ocu, gmem_wb_access,		0x14d),
-	NV_CSPMU_EVENT_ATTR_4(ocu, gmem_rd_outstanding,		0x151),
-	NV_CSPMU_EVENT_ATTR_4(ocu, gmem_wr_outstanding,		0x155),
-
-	NV_CSPMU_EVENT_ATTR_4(ocu, rem_rd_data,			0x159),
-	NV_CSPMU_EVENT_ATTR_4(ocu, rem_rd_access,		0x15d),
-	NV_CSPMU_EVENT_ATTR_4(ocu, rem_wb_access,		0x161),
-	NV_CSPMU_EVENT_ATTR_4(ocu, rem_rd_outstanding,		0x165),
-	NV_CSPMU_EVENT_ATTR_4(ocu, rem_wr_outstanding,		0x169),
 
 	ARM_CSPMU_EVENT_ATTR(gmem_rd_data,			0x16d),
 	ARM_CSPMU_EVENT_ATTR(gmem_rd_access,			0x16e),
 	ARM_CSPMU_EVENT_ATTR(gmem_rd_outstanding,		0x16f),
-	ARM_CSPMU_EVENT_ATTR(gmem_dl_rsp,			0x170),
-	ARM_CSPMU_EVENT_ATTR(gmem_dl_access,			0x171),
-	ARM_CSPMU_EVENT_ATTR(gmem_dl_outstanding,		0x172),
 	ARM_CSPMU_EVENT_ATTR(gmem_wb_data,			0x173),
 	ARM_CSPMU_EVENT_ATTR(gmem_wb_access,			0x174),
-	ARM_CSPMU_EVENT_ATTR(gmem_wb_outstanding,		0x175),
-	ARM_CSPMU_EVENT_ATTR(gmem_ev_rsp,			0x176),
-	ARM_CSPMU_EVENT_ATTR(gmem_ev_access,			0x177),
-	ARM_CSPMU_EVENT_ATTR(gmem_ev_outstanding,		0x178),
 	ARM_CSPMU_EVENT_ATTR(gmem_wr_data,			0x179),
-	ARM_CSPMU_EVENT_ATTR(gmem_wr_outstanding,		0x17a),
 	ARM_CSPMU_EVENT_ATTR(gmem_wr_access,			0x17b),
 
 	NV_CSPMU_EVENT_ATTR_4(socket, wr_data,			0x17c),
 
-	NV_CSPMU_EVENT_ATTR_4(ocu, gmem_wr_data,		0x180),
-	NV_CSPMU_EVENT_ATTR_4(ocu, gmem_wb_data,		0x184),
-	NV_CSPMU_EVENT_ATTR_4(ocu, gmem_wr_access,		0x188),
-	NV_CSPMU_EVENT_ATTR_4(ocu, gmem_wb_outstanding,		0x18c),
-
-	NV_CSPMU_EVENT_ATTR_4(ocu, rem_wr_data,			0x190),
-	NV_CSPMU_EVENT_ATTR_4(ocu, rem_wb_data,			0x194),
-	NV_CSPMU_EVENT_ATTR_4(ocu, rem_wr_access,		0x198),
-	NV_CSPMU_EVENT_ATTR_4(ocu, rem_wb_outstanding,		0x19c),
-
 	ARM_CSPMU_EVENT_ATTR(gmem_wr_total_bytes,		0x1a0),
 	ARM_CSPMU_EVENT_ATTR(remote_socket_wr_total_bytes,	0x1a1),
 	ARM_CSPMU_EVENT_ATTR(remote_socket_rd_data,		0x1a2),
@@ -122,35 +81,12 @@ static struct attribute *scf_pmu_event_attrs[] = {
 	ARM_CSPMU_EVENT_ATTR(cmem_rd_data,			0x1a5),
 	ARM_CSPMU_EVENT_ATTR(cmem_rd_access,			0x1a6),
 	ARM_CSPMU_EVENT_ATTR(cmem_rd_outstanding,		0x1a7),
-	ARM_CSPMU_EVENT_ATTR(cmem_dl_rsp,			0x1a8),
-	ARM_CSPMU_EVENT_ATTR(cmem_dl_access,			0x1a9),
-	ARM_CSPMU_EVENT_ATTR(cmem_dl_outstanding,		0x1aa),
 	ARM_CSPMU_EVENT_ATTR(cmem_wb_data,			0x1ab),
 	ARM_CSPMU_EVENT_ATTR(cmem_wb_access,			0x1ac),
-	ARM_CSPMU_EVENT_ATTR(cmem_wb_outstanding,		0x1ad),
-	ARM_CSPMU_EVENT_ATTR(cmem_ev_rsp,			0x1ae),
-	ARM_CSPMU_EVENT_ATTR(cmem_ev_access,			0x1af),
-	ARM_CSPMU_EVENT_ATTR(cmem_ev_outstanding,		0x1b0),
 	ARM_CSPMU_EVENT_ATTR(cmem_wr_data,			0x1b1),
-	ARM_CSPMU_EVENT_ATTR(cmem_wr_outstanding,		0x1b2),
-
-	NV_CSPMU_EVENT_ATTR_4(ocu, cmem_rd_data,		0x1b3),
-	NV_CSPMU_EVENT_ATTR_4(ocu, cmem_rd_access,		0x1b7),
-	NV_CSPMU_EVENT_ATTR_4(ocu, cmem_wb_access,		0x1bb),
-	NV_CSPMU_EVENT_ATTR_4(ocu, cmem_rd_outstanding,		0x1bf),
-	NV_CSPMU_EVENT_ATTR_4(ocu, cmem_wr_outstanding,		0x1c3),
-
-	ARM_CSPMU_EVENT_ATTR(ocu_prb_access,			0x1c7),
-	ARM_CSPMU_EVENT_ATTR(ocu_prb_data,			0x1c8),
-	ARM_CSPMU_EVENT_ATTR(ocu_prb_outstanding,		0x1c9),
 
 	ARM_CSPMU_EVENT_ATTR(cmem_wr_access,			0x1ca),
 
-	NV_CSPMU_EVENT_ATTR_4(ocu, cmem_wr_access,		0x1cb),
-	NV_CSPMU_EVENT_ATTR_4(ocu, cmem_wb_data,		0x1cf),
-	NV_CSPMU_EVENT_ATTR_4(ocu, cmem_wr_data,		0x1d3),
-	NV_CSPMU_EVENT_ATTR_4(ocu, cmem_wb_outstanding,		0x1d7),
-
 	ARM_CSPMU_EVENT_ATTR(cmem_wr_total_bytes,		0x1db),
 
 	ARM_CSPMU_EVENT_ATTR(cycles, ARM_CSPMU_EVT_CYCLES_DEFAULT),
-- 
2.34.1

