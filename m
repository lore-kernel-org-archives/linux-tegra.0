Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010021.outbound.protection.outlook.com [40.93.198.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37FB33F372;
	Wed, 18 Feb 2026 14:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771426757; cv=fail; b=Vj8SYsv2LLv9TBq1Ha1yXFn4Esnhze4QRnT4fj7WawN/K+eSdvrgu0QfBU4+5W9eMAO0a6XL/rkO4q7o+RULj7jUbfo5f3Wd8Ab8ekY1zFkpf+krAoFcVtXmlkU0HwEhuICgOgwHYqrXBpElKrkEF2pE02ZmohP0bfZx9uXiF+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771426757; c=relaxed/simple;
	bh=4OM/GDDrwlSBHr29CGRF4nNSA+AjR6fIc7lw2k/bKXo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iqf45rsQcb4eoUQuvcmaevLk7yD8IE/z/+hqF7M4zJV7Mm2pBJ6c0npTGpbsD9guUSbKwrWs0CuKI8bj3s0nuS9ylIIcmOGYKgtFxpkWaFnBxBLU2sAsR871fAs4h4ge73Ypnyh64qS9gxKrvojnSpkKh+yswDd8p4fgftMzdSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dLR+BYu2; arc=fail smtp.client-ip=40.93.198.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dLR+BYu2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GEDAPB4B4rT6eQ2WmLAKDrBtFDQGPCAyP/LBdNNk574qT9gS3eZYPvDxQYwzudvcAjzI0boRiDP7pnIYgwM444dG7oUOMfE+nI0AtCfrBvh7s2sLfoMt+WAdoYODkgYDHaQTrhWEXHV4HJzgVzNVrsZo/scXrmwXFRDrEaZRCUVra4wMXez3YlobfzZVH0fM8l242QzIoVCw9KCejnalSWZqKwy2WAxXctD0KT832GLwxBY985wTxKvJE+TGT3BjEFj4TiAg90dohv/49BVA0FVT3slQz2vtglEWOnGfmy2llkH6egOZ7p4avJcojpYdSSpAk4QqJ+Wb2Pmn1mR7yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZrzjE29Y3OVM6B50UBDIC3VgWmngYGWGGM74lxtbmf4=;
 b=WTaNgWevEmdDZhkwVN9DYZc55zkV6t8q0Ed6zkL7VqB1FIBPUNvtINBN9PGMt3vxWN2kAGjPEzXTW0aEQ1pGTp5trP65GYxcQtzud3eakCP5XrjEKodRN7zBD4q/8pHvQD0NckgNJpygFmpdc6WPvU+RBCAWh5I7+Rwj+qG6ohSe/pGicMvhKYGtYYXvq3rRaLninVGv7t6mFlRs8ZrvFBbiJZJDkItYOQV2btrh2gIHsCck4XvTTzYYMd4Tf7Lj0uzssQEyBFJg3hJrGS9wAvvn7JtugpJxsCnArz1xn79hKflbvza/LBIswYE77uP7Ph1SlmVouPLbCKL+ppCB3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZrzjE29Y3OVM6B50UBDIC3VgWmngYGWGGM74lxtbmf4=;
 b=dLR+BYu2XKAhZhAekXep7xhYLwoO8y09nxF1oqc3QteQluEJM6WcGuYfsZEjKKrGzgW2GchMQaHqGHsGUQ32wu/K29llU6dZ5ownwySf01QHva+dDgZC4VbELR10r7/cS3c7Lxi0d0F8aIwfY8dx4smtL73EI9sqan97CFA136MzMJ7ReuBSEZ7YF3UOJAVRy7v1cEwuXBNeZ6pYeEyQSETRJAU8nAZDEQwhdx0DXH83yMoHjSVEFXKCNcmoSdoVuojlAv7ucCCX8iueAfDT7rywcVDCUD4Dgj7vmJ1eiE3nCebZqu7ONbXv9JNEXh/tXueehU+mDr3EDkVwYTyZ1g==
Received: from BL1PR13CA0249.namprd13.prod.outlook.com (2603:10b6:208:2ba::14)
 by DM6PR12MB4467.namprd12.prod.outlook.com (2603:10b6:5:2a8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Wed, 18 Feb
 2026 14:59:06 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:2ba:cafe::76) by BL1PR13CA0249.outlook.office365.com
 (2603:10b6:208:2ba::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.14 via Frontend Transport; Wed,
 18 Feb 2026 14:58:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 14:59:06 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 06:58:45 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 06:58:45 -0800
Received: from build-bwicaksono-noble-20251018.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Wed, 18 Feb 2026 06:58:43 -0800
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <will@kernel.org>, <suzuki.poulose@arm.com>, <robin.murphy@arm.com>,
	<ilkka@os.amperecomputing.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <mark.rutland@arm.com>, <treding@nvidia.com>,
	<jonathanh@nvidia.com>, <vsethi@nvidia.com>, <rwiley@nvidia.com>,
	<sdonthineni@nvidia.com>, <skelley@nvidia.com>, <ywan@nvidia.com>,
	<mochs@nvidia.com>, <nirmoyd@nvidia.com>, Besar Wicaksono
	<bwicaksono@nvidia.com>
Subject: [PATCH v2 5/8] perf/arm_cspmu: nvidia: Add Tegra410 PCIE-TGT PMU
Date: Wed, 18 Feb 2026 14:58:06 +0000
Message-ID: <20260218145809.1622856-6-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218145809.1622856-1-bwicaksono@nvidia.com>
References: <20260218145809.1622856-1-bwicaksono@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|DM6PR12MB4467:EE_
X-MS-Office365-Filtering-Correlation-Id: 111ca0b9-aec8-43ec-67bf-08de6efe4373
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7Ky6xuvuv61p4MBXUy3g3WmBvA2ch3KsS4nn+yR3r0uOnMjf5PczTxeDV3t9?=
 =?us-ascii?Q?O+xwhMC0KqFnvvhCZsg0BmjzBlFZ98SVoOlFfOQi6Eh5wLLlMZyDL3MXKy7W?=
 =?us-ascii?Q?twsXhYmj03oyZMVVVb68zHNH5DoEqMKismLZoLYWcZXhRCQqJjwPuxMoZ42n?=
 =?us-ascii?Q?LndLjiIV4DZ0cols5/tNxCGAE4JmPBx2/U/mYfzMQP5KBzMQK6P2il4o0rvk?=
 =?us-ascii?Q?kM4s1SU2OsLpeQEkaZsarurvaOWnMV5Eqm5ysPhPy64Ikqa906t6NXipi6jL?=
 =?us-ascii?Q?HyC9T9Mitl12R++S/Bc88BOgh51VmRCfP9MCXjaBzQgp+sgE7mEed4u0xTy1?=
 =?us-ascii?Q?cx8QNcFIIRy9JUW9l7h+hm8COEXc+rogSMuBfdIpZ3d5Pcntv3PNE+QSD2VJ?=
 =?us-ascii?Q?yZHXO+Q5QsjtsKFV/RhyA0Dgw8WqxXwHegXaaj/ohtCHSpLL65WISyErLK/G?=
 =?us-ascii?Q?fmdJ8/FfJV55btPHZG40MpZjb/rja5zCP3rxlYwwVFjTQC12gYjLbWH5Lhsp?=
 =?us-ascii?Q?a69/bci485HvhQF8ZBymFa/GFPOFBFSt5+KdQJ42MqqLvi+QOdBwgT0qgSW/?=
 =?us-ascii?Q?1MHfyE+slz9W9axAjZ2fNyu0MWybZRiuVTQyONIlxJzOEI9GP/7/yzMl5MIV?=
 =?us-ascii?Q?pZ2CtRDR0bU3Y9gYdwmA0CtSOn2XZB/goezVAretVc0bA8dCPcfJhXolG0Qk?=
 =?us-ascii?Q?4m2+c8p1bUusk8t2SYvPGUlItoVYJR8zvs5j97d0Ds36ZsCYMdkdY9KORWPn?=
 =?us-ascii?Q?t8BlbXSDbdKE1WdLTwalGlpbT7W+Mh6pNw+C1cFCavJADpgxsjh58StEsWZa?=
 =?us-ascii?Q?/uH+ErGEGGRizqIOt+3sDHq77bVh/CZOvwq0i3du4pPgYiU4alj6XVNOHZfG?=
 =?us-ascii?Q?FF08mjyjR84XLaq1Qlr5h0klLMwk721I2hxWSiRkYheTPuSViWSWSXD/VXfT?=
 =?us-ascii?Q?kkYkfRNrFuSSFiNV/pFPq+Psa3/kghKmbY0dh1O9VOdM7SXrnxcZdbguWvtj?=
 =?us-ascii?Q?PWCQ91x1SPHN+Ty3d26/hRB9BiIVnMpS4DPa/vYqiWAnntHAWf1RPkki2R82?=
 =?us-ascii?Q?XV0599d8G7KfIaii/4UmPHa/stcJoVvsXhOuvS+SrHqAbw1J8QeZNm1ihx2F?=
 =?us-ascii?Q?g2qsOO08ZyUJPn6/ICwsYMTSvJN3dAR5N+8oKblTvSKKc9ksO+eJX6YLHCl1?=
 =?us-ascii?Q?4P1J93f+d+DlPTOH4JJLKkzgCg3otqBbypJTbGgavYmuJroaFZd81ZII29+U?=
 =?us-ascii?Q?sl9e/Djazop1mBcaoCzV+rQpJZNlyatddSnVUNa22rkNYJBFzBBNOgH6RZJZ?=
 =?us-ascii?Q?xce1w0/lMKhZyB1Nr7tfZ8ElL/9Uafzt5DE/CXNrs4ApJzpgQgEi4ifosz/j?=
 =?us-ascii?Q?NdlUbeO57itb9mdNcSHKSJfOV8JXFFFFNrzVODx/eC3YrUoE9wQBdO9cTfq+?=
 =?us-ascii?Q?XehjbF5Ph91zsqBPk24irq8R0pXrpdlwfU9ef0MGStlKbqcOLZZBMcSgWGnk?=
 =?us-ascii?Q?tdnPDyo6P7TMMZMpqHs1wEnrS1/DcSfhodRL9ubBPIliqzOUsx5TdRUJNdPl?=
 =?us-ascii?Q?B6T2s0ZCIFN/8jGWJ9vxMi0byda+u9fv6SFqWq/+oTkAJyWvbEU9XstmKvvi?=
 =?us-ascii?Q?vxTDrZ1vbvSJ0aUf/lqpGcosIvhZFVVOk01n7mx412Ul2Ma3dSAK2ahoguq+?=
 =?us-ascii?Q?Kj5tRQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yJh/DRKdIEGRp+k1ItcgzO59NB6AUN604xV9B5dOVkd8xSOZK/VlTEOuItF2+G3+wyKH0X/ki0qHcezDKLR8JvUwIC0ED1vbedFp+r2cemM0Sha6tkt9S0JkbsFE+Mgyf49qhK0srEgCaIItx0+81n1awmtyWY5E+yj70/DLIVAblZ61/9FqGfAXshezhIblNIFRPmDg9UJWVmbPZt3IXbu2f/BhvUoUdQmEutW2+Q8DJN0+8D6OUkw+ttwQ8PLBNzHvGtbxunTvKP5MQ8uYYFDzC4HUcJ1zCpdkjI/bUpkPcZQmU2pHoE9ehqe3nZoIPWGAkEcYsQRK/dktFRjzTvywbmPsMnv4tUQJ5FzbIHNfkbX7bJ5/S3yJhZs0UPS3Ock0phAq1w8Tot5DMwKhb/CVemC8PhwxzyFMN+Vz1vin4M0UQP32q6UcqWKa4sMG
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 14:59:06.3704
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 111ca0b9-aec8-43ec-67bf-08de6efe4373
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4467

Adds PCIE-TGT PMU support in Tegra410 SOC. This PMU is
instanced in each root complex in the SOC and it captures
traffic originating from any source towards PCIE BAR and CXL
HDM range. The traffic can be filtered based on the
destination root port or target address range.

Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 .../admin-guide/perf/nvidia-tegra410-pmu.rst  |  76 +++++
 drivers/perf/arm_cspmu/nvidia_cspmu.c         | 323 ++++++++++++++++++
 2 files changed, 399 insertions(+)

diff --git a/Documentation/admin-guide/perf/nvidia-tegra410-pmu.rst b/Documentation/admin-guide/perf/nvidia-tegra410-pmu.rst
index 8528685ddb61..07dc447eead7 100644
--- a/Documentation/admin-guide/perf/nvidia-tegra410-pmu.rst
+++ b/Documentation/admin-guide/perf/nvidia-tegra410-pmu.rst
@@ -7,6 +7,7 @@ metrics like memory bandwidth, latency, and utilization:
 
 * Unified Coherence Fabric (UCF)
 * PCIE
+* PCIE-TGT
 
 PMU Driver
 ----------
@@ -211,6 +212,11 @@ Example usage:
 
     perf stat -a -e nvidia_pcie_pmu_0_rc_4/event=0x4,src_bdf=0x0180,src_bdf_en=0x1/
 
+.. _NVIDIA_T410_PCIE_PMU_RC_Mapping_Section:
+
+Mapping the RC# to lspci segment number
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
 Mapping the RC# to lspci segment number can be non-trivial; hence a new NVIDIA
 Designated Vendor Specific Capability (DVSEC) register is added into the PCIE config space
 for each RP. This DVSEC has vendor id "10de" and DVSEC id of "0x4". The DVSEC register
@@ -266,3 +272,73 @@ Example output::
   000d:40:00.0: Bus=40, Segment=0d, RP=01, RC=04, Socket=01
   000d:c0:00.0: Bus=c0, Segment=0d, RP=02, RC=04, Socket=01
   000e:00:00.0: Bus=00, Segment=0e, RP=00, RC=05, Socket=01
+
+PCIE-TGT PMU
+------------
+
+The PCIE-TGT PMU monitors traffic targeting PCIE BAR and CXL HDM ranges.
+There is one PCIE-TGT PMU per PCIE root complex (RC) in the SoC. Each RC in
+Tegra410 SoC can have up to 16 lanes that can be bifurcated into up to 8 root
+ports (RP). The PMU provides RP filter to count PCIE BAR traffic to each RP and
+address filter to count access to PCIE BAR or CXL HDM ranges. The details
+of the filters are described in the following sections.
+
+Mapping the RC# to lspci segment number is similar to the PCIE PMU.
+Please see :ref:`NVIDIA_T410_PCIE_PMU_RC_Mapping_Section` for more info.
+
+The events and configuration options of this PMU device are available in sysfs,
+see /sys/bus/event_source/devices/nvidia_pcie_tgt_pmu_<socket-id>_rc_<pcie-rc-id>.
+
+The events in this PMU can be used to measure bandwidth and utilization:
+
+  * rd_req: count the number of read requests to PCIE.
+  * wr_req: count the number of write requests to PCIE.
+  * rd_bytes: count the number of bytes transferred by rd_req.
+  * wr_bytes: count the number of bytes transferred by wr_req.
+  * cycles: counts the PCIE cycles.
+
+The average bandwidth is calculated as::
+
+   AVG_RD_BANDWIDTH_IN_GBPS = RD_BYTES / ELAPSED_TIME_IN_NS
+   AVG_WR_BANDWIDTH_IN_GBPS = WR_BYTES / ELAPSED_TIME_IN_NS
+
+The average request rate is calculated as::
+
+   AVG_RD_REQUEST_RATE = RD_REQ / CYCLES
+   AVG_WR_REQUEST_RATE = WR_REQ / CYCLES
+
+The PMU events can be filtered based on the destination root port or target
+address range. Filtering based on RP is only available for PCIE BAR traffic.
+Address filter works for both PCIE BAR and CXL HDM ranges. These filters can be
+found in sysfs, see
+/sys/bus/event_source/devices/nvidia_pcie_tgt_pmu_<socket-id>_rc_<pcie-rc-id>/format/.
+
+Destination filter settings:
+
+* dst_rp_mask: bitmask to select the root port(s) to monitor. E.g. "dst_rp_mask=0xFF"
+  corresponds to all root ports (from 0 to 7) in the PCIE RC. Note that this filter is
+  only available for PCIE BAR traffic.
+* dst_addr_base: BAR or CXL HDM filter base address.
+* dst_addr_mask: BAR or CXL HDM filter address mask.
+* dst_addr_en: enable BAR or CXL HDM address range filter. If this is set, the
+  address range specified by "dst_addr_base" and "dst_addr_mask" will be used to filter
+  the PCIE BAR and CXL HDM traffic address. The PMU uses the following comparison
+  to determine if the traffic destination address falls within the filter range::
+
+    (txn's addr & dst_addr_mask) == (dst_addr_base & dst_addr_mask)
+
+  If the comparison succeeds, then the event will be counted.
+
+If the destination filter is not specified, the RP filter will be configured by default
+to count PCIE BAR traffic to all root ports.
+
+Example usage:
+
+* Count event id 0x0 to root port 0 and 1 of PCIE RC-0 on socket 0::
+
+    perf stat -a -e nvidia_pcie_tgt_pmu_0_rc_0/event=0x0,dst_rp_mask=0x3/
+
+* Count event id 0x1 for accesses to PCIE BAR or CXL HDM address range
+  0x10000 to 0x100FF on socket 0's PCIE RC-1::
+
+    perf stat -a -e nvidia_pcie_tgt_pmu_0_rc_1/event=0x1,dst_addr_base=0x10000,dst_addr_mask=0xFFF00,dst_addr_en=0x1/
diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c b/drivers/perf/arm_cspmu/nvidia_cspmu.c
index 42f11f37bddf..25c408b56dc8 100644
--- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
+++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c
@@ -42,6 +42,24 @@
 #define NV_PCIE_V2_FILTER2_DST       GENMASK_ULL(NV_PCIE_V2_DST_COUNT - 1, 0)
 #define NV_PCIE_V2_FILTER2_DEFAULT   NV_PCIE_V2_FILTER2_DST
 
+#define NV_PCIE_TGT_PORT_COUNT       8ULL
+#define NV_PCIE_TGT_EV_TYPE_CC       0x4
+#define NV_PCIE_TGT_EV_TYPE_COUNT    3ULL
+#define NV_PCIE_TGT_EV_TYPE_MASK     GENMASK_ULL(NV_PCIE_TGT_EV_TYPE_COUNT - 1, 0)
+#define NV_PCIE_TGT_FILTER2_MASK     GENMASK_ULL(NV_PCIE_TGT_PORT_COUNT, 0)
+#define NV_PCIE_TGT_FILTER2_PORT     GENMASK_ULL(NV_PCIE_TGT_PORT_COUNT - 1, 0)
+#define NV_PCIE_TGT_FILTER2_ADDR_EN  BIT(NV_PCIE_TGT_PORT_COUNT)
+#define NV_PCIE_TGT_FILTER2_ADDR     GENMASK_ULL(15, NV_PCIE_TGT_PORT_COUNT)
+#define NV_PCIE_TGT_FILTER2_DEFAULT  NV_PCIE_TGT_FILTER2_PORT
+
+#define NV_PCIE_TGT_ADDR_COUNT       8ULL
+#define NV_PCIE_TGT_ADDR_STRIDE      20
+#define NV_PCIE_TGT_ADDR_CTRL        0xD38
+#define NV_PCIE_TGT_ADDR_BASE_LO     0xD3C
+#define NV_PCIE_TGT_ADDR_BASE_HI     0xD40
+#define NV_PCIE_TGT_ADDR_MASK_LO     0xD44
+#define NV_PCIE_TGT_ADDR_MASK_HI     0xD48
+
 #define NV_GENERIC_FILTER_ID_MASK    GENMASK_ULL(31, 0)
 
 #define NV_PRODID_MASK	(PMIIDR_PRODUCTID | PMIIDR_VARIANT | PMIIDR_REVISION)
@@ -186,6 +204,15 @@ static struct attribute *pcie_v2_pmu_event_attrs[] = {
 	NULL,
 };
 
+static struct attribute *pcie_tgt_pmu_event_attrs[] = {
+	ARM_CSPMU_EVENT_ATTR(rd_bytes,		0x0),
+	ARM_CSPMU_EVENT_ATTR(wr_bytes,		0x1),
+	ARM_CSPMU_EVENT_ATTR(rd_req,		0x2),
+	ARM_CSPMU_EVENT_ATTR(wr_req,		0x3),
+	ARM_CSPMU_EVENT_ATTR(cycles, NV_PCIE_TGT_EV_TYPE_CC),
+	NULL,
+};
+
 static struct attribute *generic_pmu_event_attrs[] = {
 	ARM_CSPMU_EVENT_ATTR(cycles, ARM_CSPMU_EVT_CYCLES_DEFAULT),
 	NULL,
@@ -239,6 +266,15 @@ static struct attribute *pcie_v2_pmu_format_attrs[] = {
 	NULL,
 };
 
+static struct attribute *pcie_tgt_pmu_format_attrs[] = {
+	ARM_CSPMU_FORMAT_ATTR(event, "config:0-2"),
+	ARM_CSPMU_FORMAT_ATTR(dst_rp_mask, "config:3-10"),
+	ARM_CSPMU_FORMAT_ATTR(dst_addr_en, "config:11"),
+	ARM_CSPMU_FORMAT_ATTR(dst_addr_base, "config1:0-63"),
+	ARM_CSPMU_FORMAT_ATTR(dst_addr_mask, "config2:0-63"),
+	NULL,
+};
+
 static struct attribute *generic_pmu_format_attrs[] = {
 	ARM_CSPMU_FORMAT_EVENT_ATTR,
 	ARM_CSPMU_FORMAT_FILTER_ATTR,
@@ -478,6 +514,267 @@ static int pcie_v2_pmu_validate_event(struct arm_cspmu *cspmu,
 	return 0;
 }
 
+struct pcie_tgt_addr_filter {
+	u32 refcount;
+	u64 base;
+	u64 mask;
+};
+
+struct pcie_tgt_data {
+	struct pcie_tgt_addr_filter addr_filter[NV_PCIE_TGT_ADDR_COUNT];
+	void __iomem *addr_filter_reg;
+};
+
+#if defined(CONFIG_ACPI)
+static int pcie_tgt_init_data(struct arm_cspmu *cspmu)
+{
+	int ret;
+	struct acpi_device *adev;
+	struct pcie_tgt_data *data;
+	struct list_head resource_list;
+	struct resource_entry *rentry;
+	struct nv_cspmu_ctx *ctx = to_nv_cspmu_ctx(cspmu);
+	struct device *dev = cspmu->dev;
+
+	data = devm_kzalloc(dev, sizeof(struct pcie_tgt_data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	adev = arm_cspmu_acpi_dev_get(cspmu);
+	if (!adev) {
+		dev_err(dev, "failed to get associated PCIE-TGT device\n");
+		return -ENODEV;
+	}
+
+	INIT_LIST_HEAD(&resource_list);
+	ret = acpi_dev_get_memory_resources(adev, &resource_list);
+	if (ret < 0) {
+		dev_err(dev, "failed to get PCIE-TGT device memory resources\n");
+		acpi_dev_put(adev);
+		return ret;
+	}
+
+	rentry = list_first_entry_or_null(
+		&resource_list, struct resource_entry, node);
+	if (rentry) {
+		data->addr_filter_reg = devm_ioremap_resource(dev, rentry->res);
+		ret = 0;
+	}
+
+	if (IS_ERR(data->addr_filter_reg)) {
+		dev_err(dev, "failed to get address filter resource\n");
+		ret = PTR_ERR(data->addr_filter_reg);
+	}
+
+	acpi_dev_free_resource_list(&resource_list);
+	acpi_dev_put(adev);
+
+	ctx->data = data;
+
+	return ret;
+}
+#else
+static int pcie_tgt_init_data(struct arm_cspmu *cspmu)
+{
+	return -ENODEV;
+}
+#endif
+
+static struct pcie_tgt_data *pcie_tgt_get_data(struct arm_cspmu *cspmu)
+{
+	struct nv_cspmu_ctx *ctx = to_nv_cspmu_ctx(cspmu);
+
+	return ctx->data;
+}
+
+/* Find the first available address filter slot. */
+static int pcie_tgt_find_addr_idx(struct arm_cspmu *cspmu, u64 base, u64 mask,
+	bool is_reset)
+{
+	int i;
+	struct pcie_tgt_data *data = pcie_tgt_get_data(cspmu);
+
+	for (i = 0; i < NV_PCIE_TGT_ADDR_COUNT; i++) {
+		if (!is_reset && data->addr_filter[i].refcount == 0)
+			return i;
+
+		if (data->addr_filter[i].base == base &&
+			data->addr_filter[i].mask == mask)
+			return i;
+	}
+
+	return -ENODEV;
+}
+
+static u32 pcie_tgt_pmu_event_filter(const struct perf_event *event)
+{
+	u32 filter;
+
+	filter = (event->attr.config >> NV_PCIE_TGT_EV_TYPE_COUNT) &
+		NV_PCIE_TGT_FILTER2_MASK;
+
+	return filter;
+}
+
+static bool pcie_tgt_pmu_addr_en(const struct perf_event *event)
+{
+	u32 filter = pcie_tgt_pmu_event_filter(event);
+
+	return FIELD_GET(NV_PCIE_TGT_FILTER2_ADDR_EN, filter) != 0;
+}
+
+static u32 pcie_tgt_pmu_port_filter(const struct perf_event *event)
+{
+	u32 filter = pcie_tgt_pmu_event_filter(event);
+
+	return FIELD_GET(NV_PCIE_TGT_FILTER2_PORT, filter);
+}
+
+static u64 pcie_tgt_pmu_dst_addr_base(const struct perf_event *event)
+{
+	return event->attr.config1;
+}
+
+static u64 pcie_tgt_pmu_dst_addr_mask(const struct perf_event *event)
+{
+	return event->attr.config2;
+}
+
+static int pcie_tgt_pmu_validate_event(struct arm_cspmu *cspmu,
+				   struct perf_event *new_ev)
+{
+	u64 base, mask;
+	int idx;
+
+	if (!pcie_tgt_pmu_addr_en(new_ev))
+		return 0;
+
+	/* Make sure there is a slot available for the address filter. */
+	base = pcie_tgt_pmu_dst_addr_base(new_ev);
+	mask = pcie_tgt_pmu_dst_addr_mask(new_ev);
+	idx = pcie_tgt_find_addr_idx(cspmu, base, mask, false);
+	if (idx < 0)
+		return -EINVAL;
+
+	return 0;
+}
+
+static void pcie_tgt_pmu_config_addr_filter(struct arm_cspmu *cspmu,
+	bool en, u64 base, u64 mask, int idx)
+{
+	struct pcie_tgt_data *data;
+	struct pcie_tgt_addr_filter *filter;
+	void __iomem *filter_reg;
+
+	data = pcie_tgt_get_data(cspmu);
+	filter = &data->addr_filter[idx];
+	filter_reg = data->addr_filter_reg + (idx * NV_PCIE_TGT_ADDR_STRIDE);
+
+	if (en) {
+		filter->refcount++;
+		if (filter->refcount == 1) {
+			filter->base = base;
+			filter->mask = mask;
+
+			writel(lower_32_bits(base), filter_reg + NV_PCIE_TGT_ADDR_BASE_LO);
+			writel(upper_32_bits(base), filter_reg + NV_PCIE_TGT_ADDR_BASE_HI);
+			writel(lower_32_bits(mask), filter_reg + NV_PCIE_TGT_ADDR_MASK_LO);
+			writel(upper_32_bits(mask), filter_reg + NV_PCIE_TGT_ADDR_MASK_HI);
+			writel(1, filter_reg + NV_PCIE_TGT_ADDR_CTRL);
+		}
+	} else {
+		filter->refcount--;
+		if (filter->refcount == 0) {
+			writel(0, filter_reg + NV_PCIE_TGT_ADDR_CTRL);
+			writel(0, filter_reg + NV_PCIE_TGT_ADDR_BASE_LO);
+			writel(0, filter_reg + NV_PCIE_TGT_ADDR_BASE_HI);
+			writel(0, filter_reg + NV_PCIE_TGT_ADDR_MASK_LO);
+			writel(0, filter_reg + NV_PCIE_TGT_ADDR_MASK_HI);
+
+			filter->base = 0;
+			filter->mask = 0;
+		}
+	}
+}
+
+static void pcie_tgt_pmu_set_ev_filter(struct arm_cspmu *cspmu,
+				const struct perf_event *event)
+{
+	bool addr_filter_en;
+	int idx;
+	u32 filter2_val, filter2_offset, port_filter;
+	u64 base, mask;
+
+	filter2_val = 0;
+	filter2_offset = PMEVFILT2R + (4 * event->hw.idx);
+
+	addr_filter_en = pcie_tgt_pmu_addr_en(event);
+	if (addr_filter_en) {
+		base = pcie_tgt_pmu_dst_addr_base(event);
+		mask = pcie_tgt_pmu_dst_addr_mask(event);
+		idx = pcie_tgt_find_addr_idx(cspmu, base, mask, false);
+
+		if (idx < 0) {
+			dev_err(cspmu->dev,
+				"Unable to find a slot for address filtering\n");
+			writel(0, cspmu->base0 + filter2_offset);
+			return;
+		}
+
+		/* Configure address range filter registers.*/
+		pcie_tgt_pmu_config_addr_filter(cspmu, true, base, mask, idx);
+
+		/* Config the counter to use the selected address filter slot. */
+		filter2_val |= FIELD_PREP(NV_PCIE_TGT_FILTER2_ADDR, 1U << idx);
+	}
+
+	port_filter = pcie_tgt_pmu_port_filter(event);
+
+	/* Monitor all ports if no filter is selected. */
+	if (!addr_filter_en && port_filter == 0)
+		port_filter = NV_PCIE_TGT_FILTER2_PORT;
+
+	filter2_val |= FIELD_PREP(NV_PCIE_TGT_FILTER2_PORT, port_filter);
+
+	writel(filter2_val, cspmu->base0 + filter2_offset);
+}
+
+static void pcie_tgt_pmu_reset_ev_filter(struct arm_cspmu *cspmu,
+				     const struct perf_event *event)
+{
+	bool addr_filter_en;
+	u64 base, mask;
+	int idx;
+
+	addr_filter_en = pcie_tgt_pmu_addr_en(event);
+	if (!addr_filter_en)
+		return;
+
+	base = pcie_tgt_pmu_dst_addr_base(event);
+	mask = pcie_tgt_pmu_dst_addr_mask(event);
+	idx = pcie_tgt_find_addr_idx(cspmu, base, mask, true);
+
+	if (idx < 0) {
+		dev_err(cspmu->dev,
+			"Unable to find the address filter slot to reset\n");
+		return;
+	}
+
+	pcie_tgt_pmu_config_addr_filter(cspmu, false, base, mask, idx);
+}
+
+static u32 pcie_tgt_pmu_event_type(const struct perf_event *event)
+{
+	return event->attr.config & NV_PCIE_TGT_EV_TYPE_MASK;
+}
+
+static bool pcie_tgt_pmu_is_cycle_counter_event(const struct perf_event *event)
+{
+	u32 event_type = pcie_tgt_pmu_event_type(event);
+
+	return event_type == NV_PCIE_TGT_EV_TYPE_CC;
+}
+
 enum nv_cspmu_name_fmt {
 	NAME_FMT_GENERIC,
 	NAME_FMT_SOCKET,
@@ -622,6 +919,30 @@ static const struct nv_cspmu_match nv_cspmu_match[] = {
 		.reset_ev_filter = nv_cspmu_reset_ev_filter,
 	  }
 	},
+	{
+	  .prodid = 0x10700000,
+	  .prodid_mask = NV_PRODID_MASK,
+	  .name_pattern = "nvidia_pcie_tgt_pmu_%u_rc_%u",
+	  .name_fmt = NAME_FMT_SOCKET_INST,
+	  .template_ctx = {
+		.event_attr = pcie_tgt_pmu_event_attrs,
+		.format_attr = pcie_tgt_pmu_format_attrs,
+		.filter_mask = 0x0,
+		.filter_default_val = 0x0,
+		.filter2_mask = NV_PCIE_TGT_FILTER2_MASK,
+		.filter2_default_val = NV_PCIE_TGT_FILTER2_DEFAULT,
+		.get_filter = NULL,
+		.get_filter2 = NULL,
+		.init_data = pcie_tgt_init_data
+	  },
+	  .ops = {
+		.is_cycle_counter_event = pcie_tgt_pmu_is_cycle_counter_event,
+		.event_type = pcie_tgt_pmu_event_type,
+		.validate_event = pcie_tgt_pmu_validate_event,
+		.set_ev_filter = pcie_tgt_pmu_set_ev_filter,
+		.reset_ev_filter = pcie_tgt_pmu_reset_ev_filter,
+	  }
+	},
 	{
 	  .prodid = 0,
 	  .prodid_mask = 0,
@@ -714,6 +1035,8 @@ static int nv_cspmu_init_ops(struct arm_cspmu *cspmu)
 
 	/* NVIDIA specific callbacks. */
 	SET_OP(validate_event, impl_ops, match, NULL);
+	SET_OP(event_type, impl_ops, match, NULL);
+	SET_OP(is_cycle_counter_event, impl_ops, match, NULL);
 	SET_OP(set_cc_filter, impl_ops, match, nv_cspmu_set_cc_filter);
 	SET_OP(set_ev_filter, impl_ops, match, nv_cspmu_set_ev_filter);
 	SET_OP(reset_ev_filter, impl_ops, match, NULL);
-- 
2.43.0

