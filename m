Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010019.outbound.protection.outlook.com [40.93.198.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C56D2BEFED;
	Mon, 26 Jan 2026 18:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769451198; cv=fail; b=WUOZwEBXEKgMhLzFRHRcGjWm9ElsdRo39ElSdd59ieSQHm3PI2G0Ymv4nr4tKQDkq7SbjX1SXdu/ghaz9tmYjo3Ic4dmo3yjrDLO30OF88xkOYZv4UX+ao0t4Sfn7N3+A27nr1lJ1DkSa6J757HHyiIerILV+xavzNmAnpbYXUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769451198; c=relaxed/simple;
	bh=p5eICjG3BDOwe1EaqH1tyJW75kd3ingryO2k6wmVRVI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HUbnkhjN8y1Fp4Qx4/F8vMtZ49u9zHRaof0JpV7OJMxRs+Ef1fnaVDU1CGdtIhDTa0MaZoducFg/1q2YVGQ554Cb1SQ8iB4bNYC7GSrk01asQ9gyI0ff18h2e+5FJYQXLTHBdoVnUnxjgkm8Ps2iXnfaPbTX6hBWY8J7mojF6+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=INleF9VK; arc=fail smtp.client-ip=40.93.198.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="INleF9VK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p6b9iP+V6qxjVUGt3DeioOOteE+fD1mjn0hF2TeairfvOxFl77xRNfsquJKCgr+Don2RacnqysQSX/VQLuCxtfMIVld9lU73WDq8MQ+plwTzEnT0KDHquh/bzTpjr2/0ieAgLdnJp23Pqbzm+MEOsvXX6OJB/nYoZAU/yJcUkwcYLiMXNqGlLC2Dg3IHy0WXvrEpJNDfq62TC3AT5t5umri6yeQ+6EM+3aIdLF668clMjZ+9CS9fZhTM+pUBxKRIZee9q9C8Hv6rGxJ0bBZss8vchjBxWHv7hiDXOOWCkzOEn5GF8MiKT1ePeQGOB8h5rADZvA0TPW0TXIJfTDlXTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CspIbtJhSFO+i+0GQTNKAezlJDlUx53uKm6idfPopRo=;
 b=alYb/nEz0Im1XTbDuBm7NTaq1ndKIRiYncAj1eDBGEglgiubkAA92thVEN5e40iKk3NaONQwxthm6IQZHavtoQpiS9iwSVYY44yNRPgsSjY4f58zzpS4zjYD2Y6gLutIaLksLu9Tb4dDx61dTmgVW40GQkmKQbaqg6qWGLg/8ZzK+++MBKaQSRLHbtrkvPxCwatriitKUZJ0YXqsg6XLYwiphWLGWhlORIO8dwOMEApcr1JivRRsmO8wU7nq0TaC6kVfPrLGf6MTGleBJzVCCm/nxS6yJpLH6Hd/EUXACoF2Xa+nrErm+/8eiLvbEneaQNz1NXhHEQqTBhiY3WZzGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CspIbtJhSFO+i+0GQTNKAezlJDlUx53uKm6idfPopRo=;
 b=INleF9VKXrt1LFHwGcMna13RUflownw5oaZraNX9gNBRZXIWjlZnSMOcU802h659iLi91OLSy/OEFlanX4HJHRqwBH72a5OoFgp+zt2k+vq8QWaQ5tn1ogA4zFwIx/Pano3f7/DgBIVnFrlrOTHZwxl/WrSr77DTjOiFPO4QclxEO+CxFmzACTqjjFZk74Sp9z/2z8lW6XZ54I/YstG91l/l2pVUsBXOrPUNhpja0SoEBTyViaWNhXSDU+qJRM6bo+GYy7zBWUB9j0NpE2Stl/n2hPy/xgybseUb1UUQemEV7WNuECniAVMJz5nLrg59LiGxXvwTPd9d+KqTF/XBcg==
Received: from SJ0PR05CA0084.namprd05.prod.outlook.com (2603:10b6:a03:332::29)
 by DS0PR12MB8787.namprd12.prod.outlook.com (2603:10b6:8:14e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Mon, 26 Jan
 2026 18:13:06 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:a03:332:cafe::cc) by SJ0PR05CA0084.outlook.office365.com
 (2603:10b6:a03:332::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Mon,
 26 Jan 2026 18:13:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 18:13:06 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 26 Jan
 2026 10:12:55 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 26 Jan 2026 10:12:55 -0800
Received: from build-bwicaksono-noble-20251018.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Mon, 26 Jan 2026 10:12:55 -0800
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <will@kernel.org>, <suzuki.poulose@arm.com>, <robin.murphy@arm.com>,
	<ilkka@os.amperecomputing.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <mark.rutland@arm.com>, <treding@nvidia.com>,
	<jonathanh@nvidia.com>, <vsethi@nvidia.com>, <rwiley@nvidia.com>,
	<sdonthineni@nvidia.com>, <skelley@nvidia.com>, <ywan@nvidia.com>,
	<mochs@nvidia.com>, <nirmoyd@nvidia.com>, Besar Wicaksono
	<bwicaksono@nvidia.com>
Subject: [PATCH 5/8] perf/arm_cspmu: nvidia: Add Tegra410 PCIE-TGT PMU
Date: Mon, 26 Jan 2026 18:11:52 +0000
Message-ID: <20260126181155.2776097-6-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126181155.2776097-1-bwicaksono@nvidia.com>
References: <20260126181155.2776097-1-bwicaksono@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|DS0PR12MB8787:EE_
X-MS-Office365-Filtering-Correlation-Id: de0ad8f2-f522-425e-e6db-08de5d068df4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Sj4RKj6NcOjhxD128DRx6mwFrM8ocj09nsM1dfm36nnaXzjmAEK4et2deZU8?=
 =?us-ascii?Q?j8uDgUzb/88zf6h7YcU90u4fAO7KQ9J5LwN1S48+PAsLA/dMuTqp7gqXt2Jf?=
 =?us-ascii?Q?NDIHS3ipghNZ2IOmMJhj5D+otNeIcd2MhR06zt46T+KS4YdiydJmtp8WgcLK?=
 =?us-ascii?Q?WVUWkLNXfx4zuhiV2fsn9mXWBq746ZlLyWGUT1JQkER8LcH9dPembn8T/Eos?=
 =?us-ascii?Q?jZbR3hDHc1ptDf5ThtlTaPhUt359+VPehAcHOB9ZWDNIu31zLUANn9aU0cAI?=
 =?us-ascii?Q?WLGEHvFl1bjAAlBLTYfgEcI8x81yeM3o2rpcvnBX4232dJuW9WYln2kCi0tX?=
 =?us-ascii?Q?2ML9dquZkwYIpg3ieKuruytFZdIrQxVhBXo42upIubAKEOQv8F97xfo9plyL?=
 =?us-ascii?Q?we2KiAibVot5Svg18tAYaHVzOOQ4WJELKYw6YeCKlVQ4gjesVKEH8CSzFaCC?=
 =?us-ascii?Q?LY63NV3MtGDFExznONy2Xj82Qwo1nuXcVYM+0bhPNf2wpz9Tsjj38jP4gVrf?=
 =?us-ascii?Q?oZgKGrnS5xmCwKwI/I7Sbcg9kCI9lQ0rc0ouHYtNsGmlAM5O8EuDJKdpe4mj?=
 =?us-ascii?Q?oLgLxhfHwMwhJoRO4YkL4t1wrz6P152opGEJHYD78g2X95mKMOskESc8+m3B?=
 =?us-ascii?Q?213WnWEDSJP59d0yhPnlEPdtYWQTzrwoG9CtFao2znoOUYOW6AehCNIEGh+7?=
 =?us-ascii?Q?TQpjgFiY+KwdblQ6jsLtIBjN9LUjIYdG72LeoRYz4qS+KVlJsy/B5/l1NXvh?=
 =?us-ascii?Q?/jxtTuDfmVCxXI9Ufr6D0t0cc2XAOVDm2MMmHybTP88HioX8VuFo4JR9pFNc?=
 =?us-ascii?Q?pdNp8N87k3Z+3OXhQBfDVpmcmKvAx2d5FtkLX9wxZDzrV5MneYy5y3sBSC9C?=
 =?us-ascii?Q?QXAkyOSq8Fn2ONcQ5LC4PMit4GkrmGnkoVQYoZLbbECrI3Iq6zgrC2qA1KTo?=
 =?us-ascii?Q?KCYbweUBs1hPxs18kkWkHssSrkCYe0bQJqZpZseOAI0V5VBPSn8JiGgi2yFM?=
 =?us-ascii?Q?k8k5DsoB26L2ziey8oeQ9rr24UJ7KqtJEAEfllvZ1cIgzGzv+4fJHeEQCwvm?=
 =?us-ascii?Q?qweJ6tzgyKdDxVMZfIc7HGMrAtNO4pJNNcdIAhHsVFysz3A4qAT7ipnu5fB9?=
 =?us-ascii?Q?XxOhLfh/FA0EK9BeRL949TSa6MpPesjKLJ7ZvmONs88xyEremNSJ2g2c1vx/?=
 =?us-ascii?Q?LMYKkHEuUkBpGoDVcnLRifCd9d2E0xtHL3OCvATf1D32bhQM3FIvHGNpniDh?=
 =?us-ascii?Q?1dG61kwMoy9UZJW00fZy0m9b0cidNFYlNO8/0R233XffOrVzyYO1c1BqVYuF?=
 =?us-ascii?Q?nZrG7INkBcsZ4H9w0Ej9Bw9+z65fCQ7anHLTB3KvZ+FYyUFYwRcrqskCst0D?=
 =?us-ascii?Q?u69wyJyIdByu5dAK2LFSCt4rI8I8nlI1JovIxkBS5M/C661QKW2M84kF3vOY?=
 =?us-ascii?Q?BodKBDMogOMa0N01xStLol3UIlOZyUI3cer2nfanlVwsA4VHoIk6x3zE9M27?=
 =?us-ascii?Q?zdeyFj09eSi2IgC9C0M60acocDyLB/SpTy+cmbsmhks9ySoRLJVKKtgpVK90?=
 =?us-ascii?Q?qyy/Bzw838W/JM8OcXncmiwpB+Zjr+4yTG7coQczf5NROj7PCs6kSqX6EGgt?=
 =?us-ascii?Q?fJVyWJgvsDtdmER3Y6wOLKGeDqHJjy+lzRW/99fvj1NhfuNbqlDu3AW8Lq48?=
 =?us-ascii?Q?hgmOHQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 18:13:06.5807
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de0ad8f2-f522-425e-e6db-08de5d068df4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8787

Adds PCIE-TGT PMU support in Tegra410 SOC.

Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 .../admin-guide/perf/nvidia-tegra410-pmu.rst  |  76 ++++
 drivers/perf/arm_cspmu/nvidia_cspmu.c         | 324 ++++++++++++++++++
 2 files changed, 400 insertions(+)

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
index 3a5531d1f94c..095d2f322c6f 100644
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
@@ -478,6 +514,268 @@ static int pcie_v2_pmu_validate_event(struct arm_cspmu *cspmu,
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
+	pcie_tgt_pmu_config_addr_filter(
+			cspmu, false, base, mask, idx);
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
@@ -622,6 +920,30 @@ static const struct nv_cspmu_match nv_cspmu_match[] = {
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
@@ -717,6 +1039,8 @@ static int nv_cspmu_init_ops(struct arm_cspmu *cspmu)
 
 	/* NVIDIA specific callbacks. */
 	SET_OP(validate_event, impl_ops, match, NULL);
+	SET_OP(event_type, impl_ops, match, NULL);
+	SET_OP(is_cycle_counter_event, impl_ops, match, NULL);
 	SET_OP(set_cc_filter, impl_ops, match, nv_cspmu_set_cc_filter);
 	SET_OP(set_ev_filter, impl_ops, match, nv_cspmu_set_ev_filter);
 	SET_OP(reset_ev_filter, impl_ops, match, NULL);
-- 
2.43.0

