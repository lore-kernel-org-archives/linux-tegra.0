Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2077.outbound.protection.outlook.com [40.107.223.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBC81A257A;
	Thu, 31 Oct 2024 14:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730384528; cv=fail; b=pf9et0J5F6zlGV6r/oB9+84aN4bSbE9j7DN7PBVzf2PZ/OfSRJmgrwDTkQ/aZEGjnEuYiD6r0Ose56ubTHGUoH/Go6lHt4U93soBbZPdtHif0EILfWRAO/xL7jUihd7X3+tluPacPgxo/8Jd2hI86ZrBGZY+5KKt+AhAOJTIfoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730384528; c=relaxed/simple;
	bh=56gy57UVmWdlaxr4zy417pRgkedP91z8PB0Ob2Zjgsg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gpOdEFz+WH/HDxgdu94Uh1L9E0G05oMnZmc47FWc5E00VfNyyMBTUW4Xps64eigU9L94RFL+04beZ980TtGPBrbF2x7oNTffzVJW9E6DPphgurCPVUkl/Ok6uBJCu8w8HjCj6IANFnxZaci3XJkRKjuiIt1TIZaHHNO1LbtoLKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aEXOj236; arc=fail smtp.client-ip=40.107.223.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aEXOj236"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tpqSrOZlDn9zdKmWGCYFMob71AFzBIvO1qTiwfn6mc88CjacJE0HULbOm46BHqY7Ella07sEXpHXymxmRObWGrNOzFeuSELJ+9OClmtmvdzRWY/XXdz1+WKMamnmq35eeft7ZJnFl3di4f5hcI6TeU3iAI2P0AhIbP5MBb1S5/slpcfLb+pRxK5ZFg0fa0Mzei4D+7fibq3W7gey/3/iHxd4NLDnVFT/j5nyjoAurqy3x8vtvWUHdCsKZzE0ZdQvu6uQy6JGObttJEOAuqDQkZwFNEkwcHKIa8mkgzzL7IScvyDPhs2ZkjCwoTjolnsEmEGH33uV1LJCVQQ926O4eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mmRKjQOgFGj1LRb5alkgkuGmMIwz3rqvdpk8Ppd1Uos=;
 b=QxPS7BSfAVuvQma+vbvy2eG9UM1M4DyJlDwSyVBcksyELTe4BWrcXx7ha/yW0xDbWJkQwZcc/e0CBtfID7LIzMauUatKeOoFpc23HyKCUX9deTYygVWffulG2/qleOQ9Cz9VDiqP5wN/UaRoY/Ta3F+LmIUy45XE0CcKLpep3sH5N30wuPzX0j7Q4IjJW6Z5XgpjOgQRYsgoo0Yh3mbODCpSEcVKi6mFtUTYTxhLOmhhzcYSQ8vzACfFBB30JB6xV/m1LMWT0wwoh+M8WLt+BK6tZrHbQgbCEBVIYSBLm3wuQ66xuHkTumqX1y8pO6eZUF5JROvRSN+AO4NIs6nvWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mmRKjQOgFGj1LRb5alkgkuGmMIwz3rqvdpk8Ppd1Uos=;
 b=aEXOj236r9SZS+mX8l8na8wfvSP6KJDlw+z7bkvpP3RnfW+oUkPpgC5Uu7KyaBFohM8tLsaevTDMMDXEfuPJd6GhaEo51jJrDui/p4vZ+4R0OQtJ0EHE6SxaI0qY8pJpwARgV9BACKsvoMMD7FCNSwIvKZpNNpb5/jWguizsN1lqt6FVNGIkruQuOWDsPA3/p+FeYq1IXHjR+Tv3137qzuHCYNkZhN7rk3mulnBoHYgidLUvK8wVin6+knd410ie51Hbe8kEQd7iUCpNT8LJX0qg/3KYQfMWZyXYoXwfNjTa0DspwLStGz4HOM0vKfjP+3sSrzJUkjUNMxtGxpj3+A==
Received: from CH5P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::21)
 by MN0PR12MB5978.namprd12.prod.outlook.com (2603:10b6:208:37d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Thu, 31 Oct
 2024 14:22:03 +0000
Received: from CH2PEPF0000013D.namprd02.prod.outlook.com
 (2603:10b6:610:1ef:cafe::4) by CH5P220CA0003.outlook.office365.com
 (2603:10b6:610:1ef::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.22 via Frontend
 Transport; Thu, 31 Oct 2024 14:22:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000013D.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.16 via Frontend Transport; Thu, 31 Oct 2024 14:22:03 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 31 Oct
 2024 07:21:42 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 31 Oct
 2024 07:21:41 -0700
Received: from build-bwicaksono-20240327T112120892.internal (10.127.8.12) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.4 via
 Frontend Transport; Thu, 31 Oct 2024 07:21:41 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <suzuki.poulose@arm.com>, <robin.murphy@arm.com>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <rknight@nvidia.com>,
	<ywan@nvidia.com>, Besar Wicaksono <bwicaksono@nvidia.com>
Subject: [PATCH v2 4/4] perf: arm_cspmu: nvidia: monitor all ports by default
Date: Thu, 31 Oct 2024 14:21:18 +0000
Message-ID: <20241031142118.1865965-5-bwicaksono@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013D:EE_|MN0PR12MB5978:EE_
X-MS-Office365-Filtering-Correlation-Id: e3b2bda1-b999-4e37-cbbe-08dcf9b76409
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aS0aE3r5bHI/RZbIK6PXQ0dHH2jtoWP+3+bi855K2/kMCcCgWW4uszMceUK/?=
 =?us-ascii?Q?wFg1DDTjffUwuFKq4pxK8DrXsFmfXzA5OS4jj9ssYwT5DIQiIWvhbt0h8CBm?=
 =?us-ascii?Q?2QFvqos0aNUkI5ApHVarUQ/9Nv/V51e2oJm8u/oY/fG9Ee6KuUOSjNB0Llp7?=
 =?us-ascii?Q?Ob951K6MzxsQXCul/ECM5ZOAEYRIAHJwZoC1+yVbB8MXU1xMaM72jfcKW5RN?=
 =?us-ascii?Q?RXsXiTFPVGXp/kGkT3EiCh+ThExMxSza9Njna5xQuwobIX+4AMIQCsC4ILDT?=
 =?us-ascii?Q?BIHMrdH+ARRwOU9w4+2JskgNM6tzvg+8vwWgg8Y/dSiN6p7rWZAbZ1ZhYfbp?=
 =?us-ascii?Q?f4ZUY/Tlg6SxuRdh7r5AwAx3uX+YWKhGs6b2xksZ9MliauWN/9GSJ2y2d96o?=
 =?us-ascii?Q?6YzFgI3IK6NCZcEbnqst6N1OpyLnNOYsd7AdwvyisfQSU9NOtmUsuxtPl+qw?=
 =?us-ascii?Q?6IvYJ/i16rotxjOXgD+SwhmX7DGOvYtWuXB67xiXJniVbAfLmW0CW0/vj+is?=
 =?us-ascii?Q?Jf4MoBYOKkwzrM5ca88l81bmgKe0u3hmGwFOy+Rqq50+JzPdRwaRKUtN8v4T?=
 =?us-ascii?Q?YnrsCTZDz7ZP2UU9i780AB3o1p5jl8t5deFoflF8AhE31dEhOKXB8B09mzKi?=
 =?us-ascii?Q?E+tsESt+bQTTFDvKwWECSHa2rmOZC+vvuhY6LfU9mm0g6//nKFXQY8wx1L02?=
 =?us-ascii?Q?KkURJoxB49YCaRSfE/g9bPp7tkUaWELsuPp2HkvW2kapYAzN7mvkM8YTnlny?=
 =?us-ascii?Q?x3O3I+dpe7UDWB1gL+SUBU1ygAbF0Qu4Wg2IyhooEjIWO14BKa9ci85CoD8b?=
 =?us-ascii?Q?cXM1Ykp8OCRUHh4WdUgaegseeO5OmymxY8khJ9gh665SEdrAqnQ/jp1U81D9?=
 =?us-ascii?Q?ytOqdMgZV8049Tt0VHoTaYmq8xhRVRfHJqrz6vW5Tvu1aWyrr9LwO8rwicmd?=
 =?us-ascii?Q?X8OhUoyyocBFnR7ZteOwGElq/QKChM3LwHMorn4tolZowz2a8WrskSlzfjAj?=
 =?us-ascii?Q?AmWBUs0QZ3iOZ22c50Y+eZjyMg4KpRiVEgpAAJjz9fRZ33NSsEVP3O/H9TLo?=
 =?us-ascii?Q?PMjGEORuRJrVoKnt/bg4FOe9Zi5cjWln8uKaRRA4C+48n64nyyhGNyDQfWmE?=
 =?us-ascii?Q?lwVFZE+QynkmpOHRuj5fsoe/0OUDvYZjyb4KygLucSt5T+IGR/kN8g0HGmVN?=
 =?us-ascii?Q?i7ULUcxMgP8Z3d3JpdL4VxbnKTU6R4tErpS3nnSEA1fBOI9TeoSqgq2YT/gJ?=
 =?us-ascii?Q?oo0BGX8WIQDxEjkZLR3GAZZqfUqMnDdkeWXz13J1CeVHhgsHkw8kGSTPzd7Z?=
 =?us-ascii?Q?J3vQph5hj13nA4UMKGQ4r0xfwS/wY6RXNDbvYrmMzMYa4ToygqFg+P2VFHBG?=
 =?us-ascii?Q?PUVlEbITW095PN9JQMEFx2kO6saQ+P5D3Qa06W22dEEGg52Zvg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 14:22:03.0744
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3b2bda1-b999-4e37-cbbe-08dcf9b76409
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5978

Some NVIDIA PMUs like the NVLINK-C2C, CNVLINK, and PCIE PMU provide
port filtering. If the port filter is set to zero, the counter of
these PMUs will not capture any event. To avoid meaningless
experiment, the driver sets the port filter value to a default
non-zero value.

Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 Documentation/admin-guide/perf/nvidia-pmu.rst | 12 ++++++++----
 drivers/perf/arm_cspmu/nvidia_cspmu.c         |  6 ++++--
 2 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/perf/nvidia-pmu.rst b/Documentation/admin-guide/perf/nvidia-pmu.rst
index 4cfc806070d7..f538ef67e0e8 100644
--- a/Documentation/admin-guide/perf/nvidia-pmu.rst
+++ b/Documentation/admin-guide/perf/nvidia-pmu.rst
@@ -89,7 +89,8 @@ Example usage:
 The NVLink-C2C has two ports that can be connected to one GPU (occupying both
 ports) or to two GPUs (one GPU per port). The user can use "port" bitmap
 parameter to select the port(s) to monitor. Each bit represents the port number,
-e.g. "port=0x1" corresponds to port 0 and "port=0x3" is for port 0 and 1.
+e.g. "port=0x1" corresponds to port 0 and "port=0x3" is for port 0 and 1. The
+PMU will monitor both ports by default if not specified.
 
 Example for port filtering:
 
@@ -134,7 +135,8 @@ Example usage:
 The NVLink-C2C has two ports that can be connected to one GPU (occupying both
 ports) or to two GPUs (one GPU per port). The user can use "port" bitmap
 parameter to select the port(s) to monitor. Each bit represents the port number,
-e.g. "port=0x1" corresponds to port 0 and "port=0x3" is for port 0 and 1.
+e.g. "port=0x1" corresponds to port 0 and "port=0x3" is for port 0 and 1. The
+PMU will monitor both ports by default if not specified.
 
 Example for port filtering:
 
@@ -160,7 +162,8 @@ see /sys/bus/event_source/devices/nvidia_cnvlink_pmu_<socket-id>.
 Each SoC socket can be connected to one or more sockets via CNVLink. The user can
 use "rem_socket" bitmap parameter to select the remote socket(s) to monitor.
 Each bit represents the socket number, e.g. "rem_socket=0xE" corresponds to
-socket 1 to 3.
+socket 1 to 3. The PMU will monitor all remote sockets by default if not
+specified.
 /sys/bus/event_source/devices/nvidia_cnvlink_pmu_<socket-id>/format/rem_socket
 shows the valid bits that can be set in the "rem_socket" parameter.
 
@@ -199,7 +202,8 @@ see /sys/bus/event_source/devices/nvidia_pcie_pmu_<socket-id>.
 
 Each SoC socket can support multiple root ports. The user can use
 "root_port" bitmap parameter to select the port(s) to monitor, i.e.
-"root_port=0xF" corresponds to root port 0 to 3.
+"root_port=0xF" corresponds to root port 0 to 3. The PMU will monitor all root
+ports by default if not specified.
 /sys/bus/event_source/devices/nvidia_pcie_pmu_<socket-id>/format/root_port
 shows the valid bits that can be set in the "root_port" parameter.
 
diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c b/drivers/perf/arm_cspmu/nvidia_cspmu.c
index 7ab7d76e4ca1..b926861b133a 100644
--- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
+++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c
@@ -175,10 +175,12 @@ static u32 nv_cspmu_event_filter(const struct perf_event *event)
 	const struct nv_cspmu_ctx *ctx =
 		to_nv_cspmu_ctx(to_arm_cspmu(event->pmu));
 
-	if (ctx->filter_mask == 0)
+	const u32 filter_val = event->attr.config1 & ctx->filter_mask;
+
+	if (filter_val == 0)
 		return ctx->filter_default_val;
 
-	return event->attr.config1 & ctx->filter_mask;
+	return filter_val;
 }
 
 enum nv_cspmu_name_fmt {
-- 
2.34.1

