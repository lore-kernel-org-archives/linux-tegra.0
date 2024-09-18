Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2079.outbound.protection.outlook.com [40.107.212.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A3C1CB323;
	Wed, 18 Sep 2024 22:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726696816; cv=fail; b=kT/r0J0yPVhmYc7xzYRB1pR6yOdmeV8I345KVOiIsXtxydes3HCxoagb5ySeYsUAZRlhYFi541oGijo4cExg91u8pwgQU1DttxCYxZGICamMPAU5XhFns/fTbv68WRRx761h0ik8Xv/wMw2yuVDZ6DwG022nhvSWN93cpnkHo8c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726696816; c=relaxed/simple;
	bh=UOVmMtV36+YOMuc8DxUy++3kGJ6A317ygQ5YBsz/VKU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aHWEvrzPg4i04JqTSmbdxnOvyuQe1iO8KgSGuLUhzYsxR45xbVlYUxUmckIGUBpLxA9vc0AOlzVAN/R6fCalltyZl5Xipyna7gZmH/WBc0I8PR8WCsp5FUqn+zqA0FIGjS6jNdhrrZSNWRKOPaGx/xffuIkvY+iWLhCjfdNSDU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iJy/Iut+; arc=fail smtp.client-ip=40.107.212.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iJy/Iut+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nXCdIa1BXr/2CvUQrh0XdgF6fc0FTkafJzwyYVbC0lXB5QusRbifZSBB5ZHqIfCvh/IAhgAIpbY4EVyqS0393Mfr9K34SmwqK/gMzZI9o02zs8W4dufCE7NH/Zq5jXOnLz6tQ+Bb1OFLrhvBJvJqclbeyE0Xh5wXjRLRZf+ur2Xwft2THfT3DBjLI6tgtxGUnosRqVLk3Bi7N9dlanBL7X9V23bERymeYjMzKIpLPWCvyQJ8G/uL31sVOb0iymikvd2Ord7HGpjNWP0y3KSrZqtf/TLTCLjTriJNK+p4AiFRzf+qlVUGaOa/fJHr/Oy4oWrJM17lyWDbL6mo9WCkyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+hmWxIw18PO6EwUT+jSNVXeARBSgUr8w1IjUIZbq3Q=;
 b=cmwSq/FwVsIZIiy7OJgMhqtvviERx8WG7z9kM7kkNa1m0VEHtco9cFI3GPbkDDlVL4vT90MIm3GzJC09RLfenxdwKE+YpiLoka6Rz8OGZkywSRv4FCfGh9gqyO9fLi8+UvITmbWNEyshUYNi/pp4xSnI+y5WAxbxvc0Sbrhl8wHLBEVBdLhsILzNn/JayhW2Rz3lFkAESvPlTOvSfmdi1fVCg2O+aZqidhQBu97T5lA0MBuH7r62eiGwKIu2tzvitEEmk9iqVQ5uU/JVimK4b2Q3OavIa08JqkDHqIecB0+TnyxjETooRQ6uPSaQpxWeGsbvtubEH36dJ71UuvCQlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+hmWxIw18PO6EwUT+jSNVXeARBSgUr8w1IjUIZbq3Q=;
 b=iJy/Iut+hHFfE5j456O9xiEbGDs55nI1lZX0/hYxAeB12rPdPkQvX0ua1iKCEtIbC6aYpoBiXmQhrxvQgME2HWXi6lAaay1exxOQp6A/TVxXGMl8RHwYSL1rmw05/q9NqbI/xVGyGTD1twv2RI1vBZv95lmt45Zr9qc4hAP4nWOx5451aqsfV0Kwys9vl2RPospiHOsquTG6BkRLIbQ/ZzxCHAtEGEyhGmiL3EUkWhrmK4VU2jurWFujNzbzOzD45AUmFEaATiVQhcLIcZB3o0OdTiPzKqAqqYxJIKJapAPR0Ezb87FF0OE61vEhXBNjGcP0J2x5QLKaIS0pCXK4Xg==
Received: from CH2PR11CA0022.namprd11.prod.outlook.com (2603:10b6:610:54::32)
 by CH3PR12MB7762.namprd12.prod.outlook.com (2603:10b6:610:151::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 22:00:10 +0000
Received: from CH3PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::48) by CH2PR11CA0022.outlook.office365.com
 (2603:10b6:610:54::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Wed, 18 Sep 2024 22:00:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CH3PEPF00000009.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Wed, 18 Sep 2024 22:00:09 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 18 Sep
 2024 15:00:01 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 18 Sep 2024 15:00:00 -0700
Received: from build-bwicaksono-20240327T112120892.internal (10.127.8.12) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.4
 via Frontend Transport; Wed, 18 Sep 2024 15:00:00 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <suzuki.poulose@arm.com>, <robin.murphy@arm.com>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <rknight@nvidia.com>, "Besar
 Wicaksono" <bwicaksono@nvidia.com>
Subject: [PATCH 3/3] perf: arm_cspmu: nvidia: enable NVLINK-C2C port filtering
Date: Wed, 18 Sep 2024 21:58:46 +0000
Message-ID: <20240918215846.1424282-4-bwicaksono@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000009:EE_|CH3PR12MB7762:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d112fcf-c67c-4593-f781-08dcd82d43ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zgQ+WSy9lBRNDZ7vTWBr8oPlLNSF/1Kti24rCGumtwRbCMy3bRtWIOG66SJw?=
 =?us-ascii?Q?yTQ2mihavv9Zso7pyEZkykEKB2YYdDy8DYIJo4kqpkSQ7o6/rWcyRJy+EtPr?=
 =?us-ascii?Q?skRI7fp6uI4enizJYCrru3EP/nCVO2214yQ7y2gkw0/jBWMdeW2BH+lqcJRh?=
 =?us-ascii?Q?zz1UOsQ8HRu/RYITquVTLe9rzYPb7+FxbqKjEX7yS2+n6zWSk7F/wDMtIlMz?=
 =?us-ascii?Q?Oiag3TK8M3uEcqNomzQQeBMktcRI9asoDDqdNPa3K2KwXzdma3q7r71/pzFG?=
 =?us-ascii?Q?ioraBodWurngxrUcXznR+chap0LRK7E1V2BO/QqDNxyc/P8FmCuNF9ldfGEv?=
 =?us-ascii?Q?8o7Y3Gdjc5hZyp4dvPijTBrjVDg3O567I4d8JexeyAqF/MImyEiusfJlwn2G?=
 =?us-ascii?Q?lHvC1kRG0/ofJYpm/o6gEXCzbfBD+zEyqhTDUKcvugBxcu31czVhdlwWO8M2?=
 =?us-ascii?Q?C9b9HVkfhv1CQc4YnoHpClp6VaGIucJMq/IqS5nGh2rmui/eVVWZ/Egqv8MT?=
 =?us-ascii?Q?bgiDXy3i9UkVEkL34VTsblozFoAcATipoYBI4C87vvHqWXDQKKRw1IEZrPqp?=
 =?us-ascii?Q?ZIawMlGnFx3Li7rVJgw6RORZoYQYYxsHyWKT5qInNcEwU67T/gZwLkTAxmb+?=
 =?us-ascii?Q?61K5XkPa2eUyB7V5wGiE+iRt7J8nZNXyo2M2p3Psh2ZxEdJJMEabCZBTqP4Y?=
 =?us-ascii?Q?2cj0MXbHcPuS1lwHM3FKpLcav9N2e/EPFrnbella2W0nCAy7GOg19UjoDW05?=
 =?us-ascii?Q?iArLGa+9ffp/tMWAyF1TyUdVNTf0xE1jMtvKbsZWg2NYlMNA0Qe6Nekiy3In?=
 =?us-ascii?Q?AJcc5kkYQ0pcSvbXKgZ9U7uOBlZTPZ9hqFOv6TruTIQHe8xWaen1Ll5UC/qB?=
 =?us-ascii?Q?ecN83ntetIlSkv9S2pHYLrTDFnNhT5ygHWdtskq6WixLL4JTOR2lgRICv+kW?=
 =?us-ascii?Q?dv9jDtqeyC70uJUG71uWKjPNl/Hz9AsWhckBjl8fnWGGSMRPUE5HPAzLvlV8?=
 =?us-ascii?Q?P5ygggURyNR2BiDdSzVNEdh7uNp4fTikkxlCdcSbJ54M+JwU8GCnBpskngVr?=
 =?us-ascii?Q?0MfcFNNHaFspqi+g+CucrRxVYoGj/uhS/CFIH0PyEdFccXy5m5ApxdgrFrXT?=
 =?us-ascii?Q?e2HVhm42V3h7xLwEKL+uwLTnzcgxAdkxctpxS3tyXJOadNgGO5L/0/5kfAtU?=
 =?us-ascii?Q?bkCO/oP1eQiWiSTIkF68wdp0RzE4tlWDkeNmPnD1d+N3GQFLpe4qi8KoZc6K?=
 =?us-ascii?Q?dI4P2Ixh9Ktjv1MwQxOKflDZkFrEVJ2sF5UQUvFV8A1wB0SC3oXaIg2qwkgF?=
 =?us-ascii?Q?Pev30MbTN1Em3oBbWTXHsPEYCOHLt6W1mJ0iNysApMO0tUpbxH2r+SeT3dIq?=
 =?us-ascii?Q?p/Fk3+QN7/BO9cVzSSgsu4iyEDsnqYNC7u6EKHLml98Qggj9JCCs9g3cB4wQ?=
 =?us-ascii?Q?sCAx8dtla9XwfwhDrN3c+RW3vTHn7Ig8?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 22:00:09.8873
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d112fcf-c67c-4593-f781-08dcd82d43ae
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7762

Enable NVLINK-C2C port filtering to distinguish traffic from
different GPUs connected to NVLINK-C2C.

Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 Documentation/admin-guide/perf/nvidia-pmu.rst | 32 +++++++++++++++++++
 drivers/perf/arm_cspmu/nvidia_cspmu.c         |  7 ++--
 2 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/perf/nvidia-pmu.rst b/Documentation/admin-guide/perf/nvidia-pmu.rst
index 2e0d47cfe7ea..6d1d3206b4ad 100644
--- a/Documentation/admin-guide/perf/nvidia-pmu.rst
+++ b/Documentation/admin-guide/perf/nvidia-pmu.rst
@@ -86,6 +86,22 @@ Example usage:
 
    perf stat -a -e nvidia_nvlink_c2c0_pmu_3/event=0x0/
 
+The NVLink-C2C has two ports that can be connected to one GPU (occupying both
+ports) or to two GPUs (one GPU per port). The user can use "port" bitmap
+parameter to select the port(s) to monitor. Each bit represents the port number,
+e.g. "port=0x1" corresponds to port 0 and "port=0x3" is for port 0 and 1. The
+PMU will monitor both ports by default if not specified.
+
+Example for port filtering:
+
+* Count event id 0x0 from the GPU connected with socket 0 on port 0::
+
+   perf stat -a -e nvidia_nvlink_c2c0_pmu_0/event=0x0,port=0x1/
+
+* Count event id 0x0 from the GPUs connected with socket 0 on port 0 and port 1::
+
+   perf stat -a -e nvidia_nvlink_c2c0_pmu_0/event=0x0,port=0x3/
+
 NVLink-C2C1 PMU
 -------------------
 
@@ -116,6 +132,22 @@ Example usage:
 
    perf stat -a -e nvidia_nvlink_c2c1_pmu_3/event=0x0/
 
+The NVLink-C2C has two ports that can be connected to one GPU (occupying both
+ports) or to two GPUs (one GPU per port). The user can use "port" bitmap
+parameter to select the port(s) to monitor. Each bit represents the port number,
+e.g. "port=0x1" corresponds to port 0 and "port=0x3" is for port 0 and 1. The
+PMU will monitor both ports by default if not specified.
+
+Example for port filtering:
+
+* Count event id 0x0 from the GPU connected with socket 0 on port 0::
+
+   perf stat -a -e nvidia_nvlink_c2c1_pmu_0/event=0x0,port=0x1/
+
+* Count event id 0x0 from the GPUs connected with socket 0 on port 0 and port 1::
+
+   perf stat -a -e nvidia_nvlink_c2c1_pmu_0/event=0x0,port=0x3/
+
 CNVLink PMU
 ---------------
 
diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c b/drivers/perf/arm_cspmu/nvidia_cspmu.c
index d1cd9975e71a..cd51177347e5 100644
--- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
+++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c
@@ -149,6 +149,7 @@ static struct attribute *pcie_pmu_format_attrs[] = {
 
 static struct attribute *nvlink_c2c_pmu_format_attrs[] = {
 	ARM_CSPMU_FORMAT_EVENT_ATTR,
+	ARM_CSPMU_FORMAT_ATTR(port, "config1:0-1"),
 	NULL,
 };
 
@@ -193,7 +194,7 @@ static u32 nv_cspmu_event_filter(const struct perf_event *event)
 	const struct nv_cspmu_ctx *ctx =
 		to_nv_cspmu_ctx(to_arm_cspmu(event->pmu));
 
-	if (ctx->filter_mask == 0)
+	if (ctx->filter_mask == 0 || event->attr.config1 == 0)
 		return ctx->filter_default_val;
 
 	return event->attr.config1 & ctx->filter_mask;
@@ -229,7 +230,7 @@ static const struct nv_cspmu_match nv_cspmu_match[] = {
 	{
 	  .prodid = 0x104,
 	  .prodid_mask = NV_PRODID_MASK,
-	  .filter_mask = 0x0,
+	  .filter_mask = NV_NVL_C2C_FILTER_ID_MASK,
 	  .filter_default_val = NV_NVL_C2C_FILTER_ID_MASK,
 	  .name_pattern = "nvidia_nvlink_c2c1_pmu_%u",
 	  .name_fmt = NAME_FMT_SOCKET,
@@ -239,7 +240,7 @@ static const struct nv_cspmu_match nv_cspmu_match[] = {
 	{
 	  .prodid = 0x105,
 	  .prodid_mask = NV_PRODID_MASK,
-	  .filter_mask = 0x0,
+	  .filter_mask = NV_NVL_C2C_FILTER_ID_MASK,
 	  .filter_default_val = NV_NVL_C2C_FILTER_ID_MASK,
 	  .name_pattern = "nvidia_nvlink_c2c0_pmu_%u",
 	  .name_fmt = NAME_FMT_SOCKET,
-- 
2.34.1

