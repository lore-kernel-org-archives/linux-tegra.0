Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012044.outbound.protection.outlook.com [40.107.209.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9751480DD7;
	Wed, 21 Jan 2026 10:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768990356; cv=fail; b=ar+c23wZNbwVDQbQaX+V1LSrsgwwqFhZsdbH0+dYehOLsxxHI/WY4aVuMf/Swubpc5V1ffsjb0zzmmX1m8b3pIVHs4S4iy4OX0pQEL6gPXI79TOw7HjuIc6pQWqXD1QTeS6YrRIRpot/JufhbFkLotwr9oMRr8og9setmyh5BIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768990356; c=relaxed/simple;
	bh=e6q5RUF6HvPHgt/FbgFjaGQkv4tMzF7caTLlud12q3Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nVjD9hsA3zdaZsO40w5sQ0USzNxONP5IYBAcgY7cVHjNodIZYQtQmrXhFZFUaxuSBlJJ6nnh1m08h7z736pk/75p8XFOzZT9VNIfk+xYXA+Our1B3nlCStNR5Zg6W9+OS2z6x5YfLdB1+Qa3V4gUF2JmLQcBufX/Z55LYZJ9eBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XRsHdl68; arc=fail smtp.client-ip=40.107.209.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XRsHdl68"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k5jo7NF6/NBW8Uut6JideFHDK8WhuuvT38fJGqCuByps1XnePQI+BqMJxQuhTivPczGFhpDmkkwcfHV5dp0Zixr5FPybmSsLeHxjfMLgDZUlsQeUXr0xUrFF7h3iPz6nDiiFJP0NoBdawLmhnbHtIZvJCntYbF4Bm7ai2gW8zNlK9UBwsCZG17Z0XYfGAwH0dSwdfvdX2ARo/FMAs6BfHppe0Fh+mJfGKItjYBoxVSw8of07LPMQSQRMHdDRIQpegfUb4X9fW6jm0OoKIf0tTxfILVlc4m2T0N3mXyiJy1A9TbVvifFrnMMgi24DMKIOxyecrmsAIo5TbD4s54wxPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSWSKF5kBjiBxazkf1E+jLBU0HAnVuC7eF1KI9qVQhY=;
 b=kEw1zhTSgbrzGschqjykrXQr9oTXg4BoBSnZ58On6H6UnCoue6dplxreMgLzv5OuQ3+vB7s9E1+ZE6ipzJCwDVsPqxKC3K+4dOAyg1X8mV3ydYmD2BRlsdGTygyjLYZ0ZDtBV8nZOU0AmcfgAgVx/7bE3poywmqqBUqaf/NiSB3bE4ZM4+CjfYgy9Ta1Wi/td1c0D9t4QDanzhmRXNWyJIT+jB4Ow/UOqpVtMNP5DjWwqV8Y73Zpn1LpH6kSapCe8knV7BBgKcGddaknZwvBOdDhJYY3MnOuus6IOgvHsjqNBXniEQYDBkd+qpBbHwMDY2RZtbvRX0hgJ5E9v5yepQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSWSKF5kBjiBxazkf1E+jLBU0HAnVuC7eF1KI9qVQhY=;
 b=XRsHdl68R75NEsXcd52TQn5Frz5x65f5cY4LZyz4A0tzxO4x4LHy/qCs08o+TolLROWgulxgzGcosABye/TkVKrpUlatzvz0xlvWw4FN+mTNZsCmAJRex0FtfDwcJbPZJvEz4fJoyDoBt5AH+ercJqOZkBCdqJXPewnlwW0g8srEnkXPa7WvsvyidtFu3rajbR4gxXqASgTOEZDEDgSIXO2wpF4gnGxQ/zN0obTyQYu40M/hh9GD5MG8Ea6nHDvWbvjTZh3Wc/LGbgOMck5B8R+E0/saj5xwSgDQJWcliY2ZKMSNjyc2Gc9szxNQONtaPKuNABDkktKTbUWMjQDnlQ==
Received: from BY5PR16CA0022.namprd16.prod.outlook.com (2603:10b6:a03:1a0::35)
 by PH0PR12MB7814.namprd12.prod.outlook.com (2603:10b6:510:288::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 10:12:28 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:a03:1a0:cafe::2c) by BY5PR16CA0022.outlook.office365.com
 (2603:10b6:a03:1a0::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Wed,
 21 Jan 2026 10:12:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 10:12:28 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 02:12:19 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 21 Jan 2026 02:12:19 -0800
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 02:12:17 -0800
From: Sumit Gupta <sumitg@nvidia.com>
To: <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [PATCH 2/3] soc/tegra: cbb: fix incorrect ARRAY_SIZE in fabric lookup tables
Date: Wed, 21 Jan 2026 15:42:04 +0530
Message-ID: <20260121101205.3186310-3-sumitg@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260121101205.3186310-1-sumitg@nvidia.com>
References: <20260121101205.3186310-1-sumitg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|PH0PR12MB7814:EE_
X-MS-Office365-Filtering-Correlation-Id: dada0ebf-345d-4c55-dd21-08de58d59507
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A1V1WEXf6/pdOltksr50I/zuIZ7oiShF2BzrLiQ+/Wwhlo9DpG2Fe3NqLHY1?=
 =?us-ascii?Q?rvaCmv1S81d2bjT8BuNsskv5wz11Ugdhzif8Be03uE7TCgHy3lDSLAQVhKtn?=
 =?us-ascii?Q?ZslLykHaK/HLUyv3AbLozwiNn8BOfKGXG2ZeSXXciwini1+TAVP3+2ewRZC1?=
 =?us-ascii?Q?0spqNt2xjcAHJGMg6RktFxUFK2/e8ODFWbsH2u8htjHLL8PFQEZCSPtj3ZrG?=
 =?us-ascii?Q?0pflmF8AggcOwbMT3AF2XEGMtSK9dp6J/FOGGhWxxPeBeYJA3KHzEvk8F9AD?=
 =?us-ascii?Q?UfkzKzRUbv3ghcR0XIzKtNcZOSDTq5PW7f6XcZvC6HbCa0MX/SbT8+s/DIiy?=
 =?us-ascii?Q?rrrgGQ/heY7I8xxpvS3uFJHk/BV9MC/Q/tBHkKkSHWbFKX8A+Oo+2Eg7ckhs?=
 =?us-ascii?Q?KWBhEgBWhGWrUUho3KGYxZd0A2k5LHB4s4rH2GRmWHzl9yMDYuSg/g3ZwtD5?=
 =?us-ascii?Q?z+bmQIbURSZStmmchyY98UJW3nL8vg7yd3C0OCOo6AmXc4sXMV5yXrh6Gxz9?=
 =?us-ascii?Q?SUOTyeM6wc/hYW4CQFQUJL6uOtUEQVLq5G6bfBFRpZEUyUsnoolw3NzwbqV3?=
 =?us-ascii?Q?PypcwPxTHhBDCBGyhrjiUPi9yy8jvyQj5UR7vfh5FG6tEI/dd5yLV45zdEN4?=
 =?us-ascii?Q?Lc8cussu2YPdX9HpoNt8kPuWtF4VfbO+w1OhipfquN1Hp1YZOEzW6ex9/GZj?=
 =?us-ascii?Q?YsgKNlMT3adIi9CvRzr7iTCJGMyKNKDhiTDP1CiDWeSt+nQvEawEUCsNsjHB?=
 =?us-ascii?Q?UWxK+LDX8BIOoVxIiMYfJNnsL8AFzWcLEt1HjsjBqVTLpHO9gVlzSc2EMhSG?=
 =?us-ascii?Q?yZWjMzj1VDGxdEsMyh6x7IrGl5I1cGOIcCMuiCnc0f+rNjK03IkmECsT15ze?=
 =?us-ascii?Q?Wj3VbzuexB5x9xhr29E6xRyNBdBaHgyVGJQobQRGWNLar8TxCf6IFwbM+jp1?=
 =?us-ascii?Q?f0rcU5gIsh6B/r51M6Hzd2vsar3eJkYwcFTpmBNQfbJxeIvFiqOhXM+yHqSC?=
 =?us-ascii?Q?kL+U1GIQk/pMG8OaewIUEfEIuIqFjS6icZiWbJEqph6MpAT2Xa99E4/BOMTd?=
 =?us-ascii?Q?WwRc/OfY6lZ8p699yJJgQ+luAH32RQVKp60CBfgmq0BFubrOqzRIg7UkjAKG?=
 =?us-ascii?Q?qfTRoPA5UhNEODJSXlfMnveI30a/FaMq0nuV9a2Klm10sQHswy6XpQPiORUR?=
 =?us-ascii?Q?MKphQ1kvceqiOozpQhAJjwc9M/5yYVCnCKKpVN0Fl/6D9940cZk5CZhudmIw?=
 =?us-ascii?Q?gvJLT+M1ul7Ay73XAcz+Bgt7CfkGBQMrSgkICAqYSLevNXVdte6+ZfqR4sdG?=
 =?us-ascii?Q?/h89jq9Ak019ZAM1MP4A1Umyre6psD5Rj7ngKczAgF3yYiu3wd8vLc1K0JcA?=
 =?us-ascii?Q?QlvFtlrUSYiuUsRpsI1jUADfL5wTqRiEmghUjAXeF9KbkBNccnAmSYFVMHCp?=
 =?us-ascii?Q?boaUGaNbKS3Jgwnjp92vlMqdIhYZOHszlHbQh6e9nKi2VrD6pjEYoc4mE3Mg?=
 =?us-ascii?Q?81U20g/qG4P2i6LLKEth2PjnCqWuwo7THsnW5L0vCoOW43ZWIpkpAJK8OMAF?=
 =?us-ascii?Q?wR5EWfj1w9KQYCElzhLPHAGhlj/Up+KzBVywI25rvhgsf8HutP2rhiUXa28o?=
 =?us-ascii?Q?rEEp+A1rW12YMASojEKgqxf9d75wqk6Dc5yl+am5nCIXouYpTelH8tO9M2F+?=
 =?us-ascii?Q?jZAcLw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 10:12:28.4586
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dada0ebf-345d-4c55-dd21-08de58d59507
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7814

Fix incorrect ARRAY_SIZE usage in fabric lookup tables which could
cause out-of-bounds access during target timeout lookup.

Fixes: 25de5c8fe0801 ("soc/tegra: cbb: Improve handling for per SoC fabric data")
Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
---
 drivers/soc/tegra/cbb/tegra234-cbb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/cbb/tegra234-cbb.c b/drivers/soc/tegra/cbb/tegra234-cbb.c
index 518733a06658..626e0e820329 100644
--- a/drivers/soc/tegra/cbb/tegra234-cbb.c
+++ b/drivers/soc/tegra/cbb/tegra234-cbb.c
@@ -881,7 +881,7 @@ static const struct tegra234_fabric_lookup tegra234_cbb_fab_list[] = {
 				 ARRAY_SIZE(tegra234_common_target_map) },
 	[T234_AON_FABRIC_ID] = { "aon-fabric", true,
 				 tegra234_aon_target_map,
-				 ARRAY_SIZE(tegra234_bpmp_target_map) },
+				 ARRAY_SIZE(tegra234_aon_target_map) },
 	[T234_PSC_FABRIC_ID] = { "psc-fabric" },
 	[T234_BPMP_FABRIC_ID] = { "bpmp-fabric", true,
 				 tegra234_bpmp_target_map,
@@ -1160,7 +1160,7 @@ static const struct tegra234_fabric_lookup tegra241_cbb_fab_list[] = {
 	[T234_CBB_FABRIC_ID]  = { "cbb-fabric", true,
 				  tegra241_cbb_target_map, ARRAY_SIZE(tegra241_cbb_target_map) },
 	[T234_BPMP_FABRIC_ID] = { "bpmp-fabric", true,
-				  tegra241_bpmp_target_map, ARRAY_SIZE(tegra241_cbb_target_map) },
+				  tegra241_bpmp_target_map, ARRAY_SIZE(tegra241_bpmp_target_map) },
 };
 static const struct tegra234_cbb_fabric tegra241_cbb_fabric = {
 	.fab_id = T234_CBB_FABRIC_ID,
-- 
2.34.1

