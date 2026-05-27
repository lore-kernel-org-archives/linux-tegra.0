Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012029.outbound.protection.outlook.com [40.107.200.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEE13002B3;
	Wed, 27 May 2026 14:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779890537; cv=fail; b=MkBzBW/6ve3mcK38oO16QsYu0PElmIa9Hb6nXEXoA7L9l+GePI+DaOq3fqXZxuCKxCad0mldNg9KbA2MkgBKufdc+oHqrNl/W4wxPB2GKBiRwLiMJ6qisbiBelPt+LCmyeMnzCuq5GYRC0InKHnLxL5ZM+M5p+WkjUlBY3ug4kI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779890537; c=relaxed/simple;
	bh=mhGBXbXPu4j+81EteSn7mEEV5P4CgPP/x4Aq4Gb2rsA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bO2kVfi8T325hiV2I0TuxILxyUD53Xse/maDIDLkHwtDT3nGjjTuoJ2wGXOVq8ARx5vnz0khuTJFjJxNyqsMRh+wDt9DXv+6GrmMKWKBRpP7xJRCXJZ4Rnh0iFOoZc5pK5o/3a+IS7lilXWrhQVYg/Axp6K4hRvfXCImv3ld0dY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pCCGpAih; arc=fail smtp.client-ip=40.107.200.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pCCGpAih"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q8B7C5ogbhF9vr/r2Sryy63V07P9sP6gn1l3rTmBnIwEveLtuLxtrJ6xuPAHejGce/q4IXZmvPdSCCZL/gsy4xfLckUyxFn/QEe+iya0sTKocA+7qg8aZo/5LLcYZlnhyKOaFQ5sSykbX2RpZ8cgZqjCs4USIV0vxHjkD+NHkQO3t1F7YNx/zVVlL21ot9dmZA4nKauQgX0BMpRTWHjNPBSd4zgR6IrZTdlcUzZ88Ab46U+EfOLh+FdVRQ7B6cZmw+th9hXPIhUcZpQBFQM6OOJfJKEWR8q3WE2+88i+E4gidA2GRid1ZZsSfiGpU4V4VYbY7pxgWpHAYaYFsOP5Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJlZA7Wlzz+BbrHXmlpnjjtsOH/OcSLon+qgBZt3MjE=;
 b=rEEEZy1FK7JHLlsIctX6kGcYRmwjDXZRIVxczVwTWGcyHE4aJ/9zurJD0df6Su45VVJ0XvhXqFbqvrTuIqsjn6Z0GsrM0m1Ip/DbCD2/LggWgZ5jq3nppxcY4BFV6YnyBxArLajTrrg+6bJalp3lE2KxFlSXYLsCDtKFcLPFt4YvVG4tLttsTp936npfSOTa8mJhMnz8kksEUn8QvmkvxXNtYx3Db9vAs5RT1I1X0vfytw0Odq7nuPUvCgbbyzaXCvSSExI+3KPLpDGnEyWzbuqMaNlmWHZ3qcYKJ4Y7oExp4ZVZKmM5jp/wp35Fv2EuPDURTQkPjgc2SMTacYck3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kJlZA7Wlzz+BbrHXmlpnjjtsOH/OcSLon+qgBZt3MjE=;
 b=pCCGpAihN3GD/6WGkTzlI5Dw/e3ZEsOu7NnjgIuw+R7NFxjN/4nYz7Is7elfBGRhmktQhnZu8itkOBFeuHjfFYm2j4qxu3QtI6UCzhtoSkt27CE76k7SjBQ517XDlwiK0RczsDT9HCJw+OTuJ+hYc5Gd0TlF/OVGVyT2FsWe0bhv0m4nJfCdoUzq2a1Q0+I8ZlD/o/D7VqsZWDXZGtgsbKWV9n95Hf5ypBUEFhh3cSqii56fgsjQikVT3kviAOoAhKYxfInfVgq1/cvcflFLLgF0v97beOFeAlPjV6olh/vjtQ5O9r5tA4Qy2s6w4gvRbD5ZY8oDmb3PG3SRhhRNVA==
Received: from SJ0PR03CA0116.namprd03.prod.outlook.com (2603:10b6:a03:333::31)
 by DS4PR12MB9564.namprd12.prod.outlook.com (2603:10b6:8:27e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 14:02:09 +0000
Received: from CO1PEPF000075EF.namprd03.prod.outlook.com
 (2603:10b6:a03:333:cafe::a7) by SJ0PR03CA0116.outlook.office365.com
 (2603:10b6:a03:333::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Wed, 27
 May 2026 14:02:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1PEPF000075EF.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Wed, 27 May 2026 14:02:07 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 27 May
 2026 07:01:46 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 27 May 2026 07:01:45 -0700
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 27 May 2026 07:01:43 -0700
From: Sumit Gupta <sumitg@nvidia.com>
To: <krzk@kernel.org>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC: <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [PATCH 3/3] memory: tegra234: drop dead NULL check in tegra234_mc_icc_aggregate()
Date: Wed, 27 May 2026 19:31:27 +0530
Message-ID: <20260527140127.49172-4-sumitg@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260527140127.49172-1-sumitg@nvidia.com>
References: <20260527140127.49172-1-sumitg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EF:EE_|DS4PR12MB9564:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bbd3d3a-fb24-46a4-4234-08debbf88a59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	TLl5gX5mHjDbtuKm+pUgnhNM6DD9ttPGFTbV4iquu0JZ+SBTeNPnqurt83MK3akO9dSLQohpn9L+Nmo1jrDHzuMy2NSgi9QgACMVAOcSTlTvbl95+GDoOcDhlHbfLsvat8hZt+2Ouw6E6LQstNK2XQHEPfVOOOS6qjIZ9nBNw9QbULojYIBikbj/vD450EyWgQ1bvGJdYvaQgi/NywR7SuxndZcC8ll2blbxgTHQPZ5ZgLWqce44SPfffsqtZM+sn2l+oDnS91UpO1EkkHLwcnV6wfg5WrnjwueaFYVdYUybwf87XIqu/lSGvBP2wYYX4M4F7WC8hlsHpWZkZRJGFm/ROmliu1JUVji0E7arW65HHpKYip+QhQaNYOtci+TJF373Jux5H5xUFx0A8kfZ5TSEJ6Tg9R6CCBAd8KacpyxAnnD9Pmrn7bkWBY3AsiONV9QQzAN2Q3QLpVExSfz8qjuoNRntPaRvIa288FWRJRlFSoUBdpol2IDofg89bfQLngtsK5/DZ7b78dhuhy1irSoc2fBtpdsfj+0912gfHrlLKiM+agxBoQd43Hu7ukiBHMcSuxqLGVgMbsRY8efXdeDT1kR7QZiJeQBEEvCJBBtmXBR4DO1ylZ5IF6kkcMNmYXJbvYL7qpGEDiUJ4w6e2gVY3WdBEs6HkdU3MpUGAl97Po2192+MYL3Mto/ecDd7SOtWqzoi53o3zOr6S7wuQ9ylsq/M3XL8CzmYUcFWKM0=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oc9pD6dZWsvp88hN70Yr8CFAfTRP5ZsuT/pg9MLMrEcNWxU60IeAzRfZ+l2KWMpvSc/pI+ujt+e7QYm0A80XNb7lwSO5VHrGhRzBBsyZBoT+UPwRPLvCK/vPBCfs/oDQESKR+oRSrisdU+lOq+1Rs4vzWlaWd5vdU55JkLDyiDuxtEV160x8akeup74S553ZezeIqoEsxrFr4gMvYTkVTHoW8slgE2HdDdySGq+ZDXgYU29wc/lx15rYN3qFU8CB+FIH2REc6F0W04pa4+c8fe6VHyqsYHRQzcKroKAE/b8N6jTg337iRlJk3rg47SAWH7/UV54HjilQ+kOxt2A5eNMeGQTXFvxbOldiAOEp54E1m4ILiEEFN46do/Hwr6UZA5GdqkyFEpPvdrSs54CBiMjzC20+rGuGXzJYkMt3IlVawHHiaZWB6BJTwt1jyfKd
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 14:02:07.9817
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bbd3d3a-fb24-46a4-4234-08debbf88a59
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075EF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9564

In tegra234_mc_icc_aggregate(), the 'if (mc)' check inside the
CPU-cluster branch is always true.  'mc' was already dereferenced
via 'mc->bwmgr_mrq_supported' a few lines above, so if it were NULL
the function would have faulted there.  Drop the redundant check.

Reported-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
---
 drivers/memory/tegra/tegra234.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/memory/tegra/tegra234.c b/drivers/memory/tegra/tegra234.c
index 9fbd34d4abe0..982476b67d5a 100644
--- a/drivers/memory/tegra/tegra234.c
+++ b/drivers/memory/tegra/tegra234.c
@@ -1106,10 +1106,8 @@ static int tegra234_mc_icc_aggregate(struct icc_node *node, u32 tag, u32 avg_bw,
 
 	if (node->id == TEGRA_ICC_MC_CPU_CLUSTER0 ||
 	    node->id == TEGRA_ICC_MC_CPU_CLUSTER1 ||
-	    node->id == TEGRA_ICC_MC_CPU_CLUSTER2) {
-		if (mc)
-			peak_bw = peak_bw * mc->num_channels;
-	}
+	    node->id == TEGRA_ICC_MC_CPU_CLUSTER2)
+		peak_bw = peak_bw * mc->num_channels;
 
 	*agg_avg += avg_bw;
 	*agg_peak = max(*agg_peak, peak_bw);
-- 
2.34.1

