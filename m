Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1321A08AB;
	Thu, 31 Oct 2024 14:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730384512; cv=fail; b=qyTUK48n4Ym5KgAHdv4gOZFWIQeAjhy+Z+qk1udsVVQeN4x5HmXL89VOqvbJst2tLqYQRsosn6lynx+jo2Tbp8eS0IlWnSYtBm1D9Qd7kUOrd/jkp9Es1Ai8fH+pSLCLyBRJLqqlG7+tBIi9Yn74i2rYyW2vYu1kVbswhI4cc3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730384512; c=relaxed/simple;
	bh=Py6pcVJhAWkxWSmec0WpF7L/lfP/d2xbImYOiJOC2d4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b5zVWEccj2KKkPgHD6YHm0+qGFgIsg07DTjObquhe891Swuc4NaKhf2AOzVf4EKuQ079X06bpIm46dkwddAUe+EDaWD+e+6snBoIhvv375kuz8tIIMr5Jid/fIYyj743d0ZsMMtSTSXyGrJXCvfzlQHCrNW0DnQYDRovgiZ9gUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Z89XF8yL; arc=fail smtp.client-ip=40.107.223.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Z89XF8yL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jj60317OX4337Prp8aN7Zrh9chJNO/VTH0jXyBISaETXhEY+/iPtxXGO56MXItMuD+82c/Hk6DhjeNbXRtv4Y6U9oiR5kwm73Tdxt1Vt4ZimCDifGPezoLaQm3BYlgAEYvtjhnRU5R4m2oKkV3zQj91qUWY6sFL531lCKl0Fg4PdERqGlIpxReH0UNz3NMLxulxDILcKm2L28FXTcVCloMdVWGvciQjKBnkDhOBRgP9PzPvouwMJa5tfpVPwyfdQQSDF3MUq527UiTs7CBSPKQvpsgswjFYKwDYC8FT+vaQUO1PccUP3Hxo8vK3rDJ4vnjbsEvjVsZVQyvufWZQZWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ng+uljFMhiGVWsZsaFsSzr10iI6+EPhC4xcLIRcvj70=;
 b=fPF3aE6ls48YQd4z+7lOegBXe1JUQiX6jdOfR9EQP0g4wkE1BKiKbJ+39d9I1vz+miYytCA/cYVZshTEVyV5GvudPfnz5T2BA8wr4aL0xjn4CUQ3GOF8HHTRsPJb8+f1xkSCxrf2qwiVqAxUpnMuDUGjI1fV5w59VSZTHvWWMTbVEVgp3fElnNpFFuCpN6snfKZdirs+SPf22QHUtxxjChzySNO5SaZLrrTb4fEv/iJWlBtH1nvxh/6PQ4CLObVlNLkOcickqqRbD2CJT2F6IuqOQBz+sitIKECKQVFWZqytBs3TofquXzc/gM7sigm8NDk5kMr2fpbmLql/NJc3tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ng+uljFMhiGVWsZsaFsSzr10iI6+EPhC4xcLIRcvj70=;
 b=Z89XF8yL2AHgGKHZY2ZLdNxjVWGu5JAhGU4qPdo8cw1GSXgGpabFSFFOd8HndS9g7aKon/F8yjcXCiSN3wR0jZNggLSDBAtzlpm/m40rCsTufpcUqe4k3LtE/TEAjdhl9g4JgmG9YL0KUqBwYO3RwqIvCsoiJqKedPkABqFOZu83IAgwozzc5NOCFvApqzTFM+4ftwgKZdMTcjJTbc8WBlXJ9d20X6V+sbARil3vbyvIRHUtEmpir+knSDhEfTbayf6OfDWFkrW4wE+lgFtrUaxRSIeFJoALd1GzKJ24nRx+bM5lPDgthOqHLoHvRf7qFu674SdQ/DOzS0lllMP0Pg==
Received: from CH2PR07CA0058.namprd07.prod.outlook.com (2603:10b6:610:5b::32)
 by CH2PR12MB9460.namprd12.prod.outlook.com (2603:10b6:610:27f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 14:21:45 +0000
Received: from CH2PEPF00000141.namprd02.prod.outlook.com
 (2603:10b6:610:5b:cafe::b0) by CH2PR07CA0058.outlook.office365.com
 (2603:10b6:610:5b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20 via Frontend
 Transport; Thu, 31 Oct 2024 14:21:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000141.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.16 via Frontend Transport; Thu, 31 Oct 2024 14:21:44 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 31 Oct
 2024 07:21:30 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 31 Oct
 2024 07:21:30 -0700
Received: from build-bwicaksono-20240327T112120892.internal (10.127.8.12) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.4 via
 Frontend Transport; Thu, 31 Oct 2024 07:21:29 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <suzuki.poulose@arm.com>, <robin.murphy@arm.com>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <rknight@nvidia.com>,
	<ywan@nvidia.com>, Besar Wicaksono <bwicaksono@nvidia.com>
Subject: [PATCH v2 1/4] perf: arm_cspmu: nvidia: remove unsupported SCF events
Date: Thu, 31 Oct 2024 14:21:15 +0000
Message-ID: <20241031142118.1865965-2-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241031142118.1865965-1-bwicaksono@nvidia.com>
References: <20241031142118.1865965-1-bwicaksono@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000141:EE_|CH2PR12MB9460:EE_
X-MS-Office365-Filtering-Correlation-Id: d90ab3f3-90fd-4f5e-0bea-08dcf9b75940
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MiIA2o0f2AGz9E6WSFOfR3iq0Xatsuz5Bxe6TgEMB2iuVJbdxCUqn2u6zu02?=
 =?us-ascii?Q?EvOC3RdvoRpVNYoOjMxEfqJe7gtaCSN12MSdu7DD2SxacsnnvXBz//sQ7n21?=
 =?us-ascii?Q?+1xceM7JGLpr+QAmwwlMbmj3CLbD+tKiC5jLpNDH/dX00pKcWZEERHZWtwU+?=
 =?us-ascii?Q?JEY44NwRzHBYdR84tMRtf9RgYK3LYPE4v8e2vUzgdDHuiFJTa+07hnmYZ3ue?=
 =?us-ascii?Q?tZxAY49Q2OHW88y9aXXvlmW5XEUEG5CScGjA1xkMWNeHoZBTGxpkRbLsY/5p?=
 =?us-ascii?Q?tytuw4cdGNl5iOfsl7SJGcIxkbtQTFGtxEqroCBc5GArS1fKeSFqcbwM18vC?=
 =?us-ascii?Q?pju7FZ+B8WX8jEJtwYjPBWMIIXHabg1UzUQoHb06Q848VnHJ/0dUGHWKfETY?=
 =?us-ascii?Q?wfQtA9ac2yQDYaUAGpC+++KU1v/XYZmUHpAeYn5MMikjuEgF39igNOjivdtu?=
 =?us-ascii?Q?OKbAyfpYH/V9OpvttCBQ+kAB2R/1jcGKC/zv8AyjWaGUjU7j7nliEVk2QcJU?=
 =?us-ascii?Q?ugGn6yQx/B1S0IC9gBOksWwKnsi50tZlfXZa08uOUIw1nfkOKhpWF316e23B?=
 =?us-ascii?Q?/+84A43lWsAIGTdpra0TqkITJk+zfuZU1mK7z95XXdzJ352KX0Ptji4kGGqX?=
 =?us-ascii?Q?icZF9iTcs4/DpNd2eXAWCd4WAPt8CfFauzOU4HQkqrH9O7TR5qynaMvNyrUH?=
 =?us-ascii?Q?Ia1EwV4a7pxdPQyRIS6JKtRtm1RhXCa90KLWbfID6cw1ynF75fM2DeWh8+K4?=
 =?us-ascii?Q?127wwbXYNWWusMTWWXfyYuD+20Z+UVtTEElAqSdaFC7yuUVGRdE1ATh2D4V8?=
 =?us-ascii?Q?27ACtX9jACYjv6cF2Yw/A00mGavn4d12SxkwYgPxM3gpR59+PZHNtQfyEm6Q?=
 =?us-ascii?Q?kyNMwFrp4E+9QUOgkNd11+f9NIZfmRxFbu1hrDyr00cFBncf+7DNEdffpMwB?=
 =?us-ascii?Q?vS6ptSDyrXnvBPScYuPhnPjZlGuDPVuM2YcsXJbyBxg2IPUomjKcfzIGZs6J?=
 =?us-ascii?Q?sZ5nNqDnAvwUreQf42kapg3iCtQo9A8MuODge7PuAsA/AO6Y2G4OtfOFPrtB?=
 =?us-ascii?Q?wNPLJB4WEnlgSxpFD7Q1LOQs6dIsTPXrH+rKT46uXP2OnBfJ9L16XxPepSux?=
 =?us-ascii?Q?ZVbRukpyACcev/XWQAyxatu99jL6SCvnoS/V+vcwKI5k7KVWt2TIQ92CsoIq?=
 =?us-ascii?Q?BD/1P4K37Cs5GvQjlhDD57OELrM2kwDpmm8SH4pA6NGf3E0hpHupqvI9idIM?=
 =?us-ascii?Q?Cnx1R0LwHK8ITFsYIMBVJnzUwD9Ob31JO3hw2smw9nqzFHpVjcneXA/qAB19?=
 =?us-ascii?Q?7J4SDyOUFV+FhsJKoVezSv7aoeWKaECRSUfAz3fg8F3jjI/yvo1egqE6o/HE?=
 =?us-ascii?Q?BLJWBxeh7mrPduAYqfhgGL4/P6k0JgEq6WZkgL36+IySBx1XEg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 14:21:44.9750
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d90ab3f3-90fd-4f5e-0bea-08dcf9b75940
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000141.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9460

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

