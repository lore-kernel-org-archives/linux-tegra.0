Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012049.outbound.protection.outlook.com [52.101.43.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED71233EAEB;
	Wed, 18 Feb 2026 14:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771426753; cv=fail; b=WooN/PPfxAUlO4lY+tS2Az13PSrOW2gIJIls5WMoH5E2x39LuSesnxDmsynpc6utExXahu9JURxMoBAPGp4HhF7dJCcw1ZiNLuYQPZYpNYydMSBT14z48lF05mPlKBD+rz3S16e4RtPm/pyvk7FQatGoM0SSFtBL3b/ym4aEhOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771426753; c=relaxed/simple;
	bh=L9/TFM/NNGr+gNU5FJY/DLaHWpkU5DmACp7ggtCmXps=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fm60K+ejKjJOgwtk42hQmIeM7F7gaIGXw8X/xJjbIpZhSOHx1DljEiWJeFsuPhV1iX4RMmISSbBNiKoCOSkmmTyNRCVocbW8MBkwsGuMl2aefy9YOgyjy7ozS5lHL4mUd9Cse1MWYrr+3dn0zwnjQWvFIHwehcjgQO0b0POipvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jFte4kt8; arc=fail smtp.client-ip=52.101.43.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jFte4kt8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XvhACcxM47pDJ7N84Sd9fa8DqeGC3GGQoWvafyUh6JLBLX1nNG+kxobCOEBTa+OlgA2d5ztuFCXDb9L2UeXGD5q4rUvw4bzESz3DsEfQoz8OxRFLZ8RBPHucPHSSOHmXL0+wviYngTRfKXxVW03keZcZNSo1NfUN/ogQFH6wPdsI+yS34T7W9eLF+nYGGVDo17dM9MD1XZDqPIve1O6IJqDNJ2erAmTwOXaXusEKCWumfyxyeLzpUwoaEufkvn+hBDH0nqDOcJqLxxC/9NaM/HEM9ECLrsDFC4xdiUW0U4DZyZo629zMlS6XvRliXC+tBB81OsAOK9J72GdyusLYSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yyc+Ze8Em9/EV+uTCWp5JpUFh1eO9N+cJx+Q1ISRmbI=;
 b=idwxf9TVx8/GpYcYt7KAEOgBHdnbLvqB2QnOyUD+JemQyccqpL/geiS4235XbUuuC2eefp3FQI2Yjuhyrq/Fu562BbNvFzrJbxthdep1+F8ANDWQjevZOc91gly+mWfsmCsErzwedyT50t/ID+5ceQXFVdOX0us73h2QRUwsclJg+KpMGT1mi1QFBxtZ0pcHZpIimnhk9hC40DKv6+ku99/Ip+kadZuwNVC4O4S/uNlZQf0KwLi+ikeJCjnfzEj5vmtbG0G/T1OCpQk1MxYUhBywF5cvnM6y6oGyQk7hmscSbhDuGbCaGz/gAf1MtwmwCrjJLCMFGvKX3V+hAF2F+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yyc+Ze8Em9/EV+uTCWp5JpUFh1eO9N+cJx+Q1ISRmbI=;
 b=jFte4kt8ra3umOE+XwknyDEZ+GJCGETm40jpcIFYGXUoWQNmM4yjudcY3+P9+dRnGtdD3AN6B3Dnv7O3BCu8N82hjMJcwAuGvfFEGzGHdrurU7hZpTZ36If2dR4s/gAMne1NyC8qvNeXZj94di3CkAthxbhVpoOEn235wELycFKI/uVboo6nmO3oADAR6fmIr6fckFPrbdXI75VvTBjZ8F54EImQl0DUqgxZb/XL9yaPaViGWnwQhVV7H0yF9/070pEUp2ZKkIV/RohAGG4US/tztOlS/VUsKkTgvOknzLeeHmj6z0G8c70lzkNlOJSORlNAxfkR77yslf4vLnIHtA==
Received: from BL1PR13CA0243.namprd13.prod.outlook.com (2603:10b6:208:2ba::8)
 by LV8PR12MB9450.namprd12.prod.outlook.com (2603:10b6:408:202::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 14:59:01 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:2ba:cafe::81) by BL1PR13CA0243.outlook.office365.com
 (2603:10b6:208:2ba::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Wed,
 18 Feb 2026 14:58:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 14:59:01 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 06:58:41 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 06:58:40 -0800
Received: from build-bwicaksono-noble-20251018.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Wed, 18 Feb 2026 06:58:39 -0800
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <will@kernel.org>, <suzuki.poulose@arm.com>, <robin.murphy@arm.com>,
	<ilkka@os.amperecomputing.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <mark.rutland@arm.com>, <treding@nvidia.com>,
	<jonathanh@nvidia.com>, <vsethi@nvidia.com>, <rwiley@nvidia.com>,
	<sdonthineni@nvidia.com>, <skelley@nvidia.com>, <ywan@nvidia.com>,
	<mochs@nvidia.com>, <nirmoyd@nvidia.com>, Besar Wicaksono
	<bwicaksono@nvidia.com>
Subject: [PATCH v2 4/8] perf/arm_cspmu: nvidia: Add Tegra410 PCIE PMU
Date: Wed, 18 Feb 2026 14:58:05 +0000
Message-ID: <20260218145809.1622856-5-bwicaksono@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|LV8PR12MB9450:EE_
X-MS-Office365-Filtering-Correlation-Id: db43016e-c223-44d3-685d-08de6efe4054
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?61SkEApm76ixx/hax9JlPVs/MXVU0cx62in00lhlRA5VjRm9HR6lEh4uQgHV?=
 =?us-ascii?Q?8UJcD1gIyxt8sBXQifgc3amr6Pp2y1JwZUxD59/sw06AIKJRBwI1NBOLg9eD?=
 =?us-ascii?Q?qO92Jbs6hU+zz4mbPRAVhbYPuOqTd06J/y2nfLBawSiCVRe11F0sHdiJYNDr?=
 =?us-ascii?Q?FOAYucOtOkyPh+5W0zkimbTqX4DNb3hAEZ7u8PUDfhMn0MYqysfKk279I/5r?=
 =?us-ascii?Q?QTecwi8cjGQs+9OdzESnazOIEjU6KLSty1kZRWvDaAjVh3cGpVIcrEDmzHJ4?=
 =?us-ascii?Q?Nx8czEmMGnYafGroW7zD+w3iqksAZ8AhmT7wFAa+kneb62Vd51gJJa5sYSAI?=
 =?us-ascii?Q?T5pPMAg/sj7DVZG0/rLvFFw+a+rJ3NKuAucRzUoBo3rgpJCSQxCZBUBP+KC/?=
 =?us-ascii?Q?O5+sM4p+lcb6HeefTucbiG5wdMhnewPGQIITjYLaKvggeS7m1fit3jGKW6Oe?=
 =?us-ascii?Q?MTm2Q1sGQ1rKk/HdokrE1Nz1Ippm2D+vcVSke+OwRrGLdZISu5BjTBk31y3A?=
 =?us-ascii?Q?4TqepYyr5lj0eKnRn5llDd5xO+9B2pZq4oY7ylpXT7RfRfuoKQ4M9xgZweO2?=
 =?us-ascii?Q?YNo7UAjOOWTKYTesbw7HdhhetosYEtHSzaFaJencfobgsfmUpVwN9v7fCEkv?=
 =?us-ascii?Q?l4nIFfwCDpSJePnTe8qHa9E+c0M4VmjS4ZIgy6I++1QXfTapMht1b5tbc63M?=
 =?us-ascii?Q?5bO86+mlzFoTZ9wIKvcZH5XCyqcitJFK6YUJNYaqViXPA9st3LthSPMDYZT9?=
 =?us-ascii?Q?GfCjFhkBe9rDRmty/yL0Xld/ZZSz5ytEXibbAdhgdBPLMWyvdWF/PYNdpDkL?=
 =?us-ascii?Q?BdCBY8ABbr/uBE5jT6GsQO7rYtPZ0WeZ5dedbPfprRXnBRloJZhYM2hJeJd8?=
 =?us-ascii?Q?3n0KJh4KFlrUxz9T/0b8wcIuuub97zlsJbBnoTLsAOzFdsV7Xb+rphWAHhri?=
 =?us-ascii?Q?MXZ3zEXQUzqeEfDt1ANQlT7krbD4Y9HKqFt0qm3lZyDQEviukI27APCOGnPR?=
 =?us-ascii?Q?kzzDU8Q/p+vcT06KMeSA//MwbYI4It4mjpwskfOb/kyk77UfU6cFL4jaVYKq?=
 =?us-ascii?Q?wOvNn84QQSKL4szu33QwULAs09IIUChhjhW1U7DKiN1BZaWUY08BausgMMJ8?=
 =?us-ascii?Q?I365e2+WOu6PVeDWu957rCkc2eJr/wj9JENIprj9eBOt96bKveRMj22o9U9k?=
 =?us-ascii?Q?UOmkPVkGdUILP49WcKDJUL3KGh5sIOoCLSRWLlqU1f7pLHb2TGFwxbA49mma?=
 =?us-ascii?Q?QzU7ZEVQiRzI2We74ERd72osis75IanrD2AmCXNrSzGxRu57gAdVreps1Vvp?=
 =?us-ascii?Q?hjlV3teIPI3e+0HLvEBlyK9R1q7l2YeNaN8cL1vkaBd4/Nj/A+NwS1blqLKp?=
 =?us-ascii?Q?16HEUFMAIS44pirf37XFv1nESO3JM3LCHivgi7xptennhJlgN1ki5DXnfjR5?=
 =?us-ascii?Q?KfSKJqMAKIo8wqoQpxqh99L7LQvD9w2tL6kDpIbyvMibBSu948w4yDqM0kcg?=
 =?us-ascii?Q?F9vccV19ecEQc6aVMhlIjX5/3ZgYscdlcFpzEeGEo2r0LSJiXayiPE71M9BB?=
 =?us-ascii?Q?aMMkp/LQq1wGCQD8w1X2WBWCqXxA8mnTtAbrFBgD5cP692Sn1EROx4ZY7nxU?=
 =?us-ascii?Q?aAaT4VHtZQV5soMAbqKFKOKztwO8NDhXPG2NtbR3fUb555p/S9RH7H4Ayj5f?=
 =?us-ascii?Q?FuewBQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZKiixPkX92y5Lx5jrOMtWLpRgoU4w+cA8eIjxVtFSm8szOVFuShBajMQ+ldtK0YGS5aM00yLHZcgy4UNKHeE5nVA7D14xrpZkQ2v4WCNrZ1yZau0dQ2fIi3i3EUtMU2puiMudttHmt+VJ3BpuVXc+LVL7FcS/4lRp75ob5qLMd4Zzlg1swTyxVD+5U4BuMwxSdeyigN/pdN6U50VWyrW+75i7CHCr311Gw2pG/Vxe1fX5qxfFvMp6icBF0UlDor0GnPW/qIAcdMnIBzW+4Yj6SVjq+HZG+f5XFmlDV6WKxd9eolW1TR3KAExEcZQJBvMhi6Koqdu47t9w8nQmIchi5Xk/7GRmRbxkSJgpZrEfKcc6TZnysMlX/kCZma+vDtvdtcFTGac4uPemXXIkccBlpLreGJWh2n/zClC3sdckvZuCYoIJ6f/K0e0QqTxM4Mw
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 14:59:01.1397
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db43016e-c223-44d3-685d-08de6efe4054
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9450

Adds PCIE PMU support in Tegra410 SOC. This PMU is instanced
in each root complex in the SOC and can capture traffic from
PCIE device to various memory types. This PMU can filter traffic
based on the originating root port or BDF and the target memory
types (CPU DRAM, GPU Memory, CXL Memory, or remote Memory).

Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 .../admin-guide/perf/nvidia-tegra410-pmu.rst  | 162 ++++++++++++++
 drivers/perf/arm_cspmu/nvidia_cspmu.c         | 211 +++++++++++++++++-
 2 files changed, 368 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/perf/nvidia-tegra410-pmu.rst b/Documentation/admin-guide/perf/nvidia-tegra410-pmu.rst
index 7b7ba5700ca1..8528685ddb61 100644
--- a/Documentation/admin-guide/perf/nvidia-tegra410-pmu.rst
+++ b/Documentation/admin-guide/perf/nvidia-tegra410-pmu.rst
@@ -6,6 +6,7 @@ The NVIDIA Tegra410 SoC includes various system PMUs to measure key performance
 metrics like memory bandwidth, latency, and utilization:
 
 * Unified Coherence Fabric (UCF)
+* PCIE
 
 PMU Driver
 ----------
@@ -104,3 +105,164 @@ Example usage:
   destination filter = remote memory::
 
     perf stat -a -e nvidia_ucf_pmu_1/event=0x0,src_loc_noncpu=0x1,dst_rem=0x1/
+
+PCIE PMU
+--------
+
+This PMU monitors all read/write traffic from the root port(s) or a particular
+BDF in a PCIE root complex (RC) to local or remote memory. There is one PMU per
+PCIE RC in the SoC. Each RC can have up to 16 lanes that can be bifurcated into
+up to 8 root ports. The traffic from each root port can be filtered using RP or
+BDF filter. For example, specifying "src_rp_mask=0xFF" means the PMU counter will
+capture traffic from all RPs. Please see below for more details.
+
+The events and configuration options of this PMU device are described in sysfs,
+see /sys/bus/event_source/devices/nvidia_pcie_pmu_<socket-id>_rc_<pcie-rc-id>.
+
+The events in this PMU can be used to measure bandwidth, utilization, and
+latency:
+
+  * rd_req: count the number of read requests by PCIE device.
+  * wr_req: count the number of write requests by PCIE device.
+  * rd_bytes: count the number of bytes transferred by rd_req.
+  * wr_bytes: count the number of bytes transferred by wr_req.
+  * rd_cum_outs: count outstanding rd_req each cycle.
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
+
+The average latency is calculated as::
+
+   FREQ_IN_GHZ = CYCLES / ELAPSED_TIME_IN_NS
+   AVG_LATENCY_IN_CYCLES = RD_CUM_OUTS / RD_REQ
+   AVERAGE_LATENCY_IN_NS = AVG_LATENCY_IN_CYCLES / FREQ_IN_GHZ
+
+The PMU events can be filtered based on the traffic source and destination.
+The source filter indicates the PCIE devices that will be monitored. The
+destination filter specifies the destination memory type, e.g. local system
+memory (CMEM), local GPU memory (GMEM), or remote memory. The local/remote
+classification of the destination filter is based on the home socket of the
+address, not where the data actually resides. These filters can be found in
+/sys/bus/event_source/devices/nvidia_pcie_pmu_<socket-id>_rc_<pcie-rc-id>/format/.
+
+The list of event filters:
+
+* Source filter:
+
+  * src_rp_mask: bitmask of root ports that will be monitored. Each bit in this
+    bitmask represents the RP index in the RC. If the bit is set, all devices under
+    the associated RP will be monitored. E.g "src_rp_mask=0xF" will monitor
+    devices in root port 0 to 3.
+  * src_bdf: the BDF that will be monitored. This is a 16-bit value that
+    follows formula: (bus << 8) + (device << 3) + (function). For example, the
+    value of BDF 27:01.1 is 0x2781.
+  * src_bdf_en: enable the BDF filter. If this is set, the BDF filter value in
+    "src_bdf" is used to filter the traffic.
+
+  Note that Root-Port and BDF filters are mutually exclusive and the PMU in
+  each RC can only have one BDF filter for the whole counters. If BDF filter
+  is enabled, the BDF filter value will be applied to all events.
+
+* Destination filter:
+
+  * dst_loc_cmem: if set, count events to local system memory (CMEM) address
+  * dst_loc_gmem: if set, count events to local GPU memory (GMEM) address
+  * dst_loc_pcie_p2p: if set, count events to local PCIE peer address
+  * dst_loc_pcie_cxl: if set, count events to local CXL memory address
+  * dst_rem: if set, count events to remote memory address
+
+If the source filter is not specified, the PMU will count events from all root
+ports. If the destination filter is not specified, the PMU will count events
+to all destinations.
+
+Example usage:
+
+* Count event id 0x0 from root port 0 of PCIE RC-0 on socket 0 targeting all
+  destinations::
+
+    perf stat -a -e nvidia_pcie_pmu_0_rc_0/event=0x0,src_rp_mask=0x1/
+
+* Count event id 0x1 from root port 0 and 1 of PCIE RC-1 on socket 0 and
+  targeting just local CMEM of socket 0::
+
+    perf stat -a -e nvidia_pcie_pmu_0_rc_1/event=0x1,src_rp_mask=0x3,dst_loc_cmem=0x1/
+
+* Count event id 0x2 from root port 0 of PCIE RC-2 on socket 1 targeting all
+  destinations::
+
+    perf stat -a -e nvidia_pcie_pmu_1_rc_2/event=0x2,src_rp_mask=0x1/
+
+* Count event id 0x3 from root port 0 and 1 of PCIE RC-3 on socket 1 and
+  targeting just local CMEM of socket 1::
+
+    perf stat -a -e nvidia_pcie_pmu_1_rc_3/event=0x3,src_rp_mask=0x3,dst_loc_cmem=0x1/
+
+* Count event id 0x4 from BDF 01:01.0 of PCIE RC-4 on socket 0 targeting all
+  destinations::
+
+    perf stat -a -e nvidia_pcie_pmu_0_rc_4/event=0x4,src_bdf=0x0180,src_bdf_en=0x1/
+
+Mapping the RC# to lspci segment number can be non-trivial; hence a new NVIDIA
+Designated Vendor Specific Capability (DVSEC) register is added into the PCIE config space
+for each RP. This DVSEC has vendor id "10de" and DVSEC id of "0x4". The DVSEC register
+contains the following information to map PCIE devices under the RP back to its RC# :
+
+  - Bus# (byte 0xc) : bus number as reported by the lspci output
+  - Segment# (byte 0xd) : segment number as reported by the lspci output
+  - RP# (byte 0xe) : port number as reported by LnkCap attribute from lspci for a device with Root Port capability
+  - RC# (byte 0xf): root complex number associated with the RP
+  - Socket# (byte 0x10): socket number associated with the RP
+
+Example script for mapping lspci BDF to RC# and socket#::
+
+  #!/bin/bash
+  while read bdf rest; do
+    dvsec4_reg=$(lspci -vv -s $bdf | awk '
+      /Designated Vendor-Specific: Vendor=10de ID=0004/ {
+        match($0, /\[([0-9a-fA-F]+)/, arr);
+        print "0x" arr[1];
+        exit
+      }
+    ')
+    if [ -n "$dvsec4_reg" ]; then
+      bus=$(setpci -s $bdf $(printf '0x%x' $((${dvsec4_reg} + 0xc))).b)
+      segment=$(setpci -s $bdf $(printf '0x%x' $((${dvsec4_reg} + 0xd))).b)
+      rp=$(setpci -s $bdf $(printf '0x%x' $((${dvsec4_reg} + 0xe))).b)
+      rc=$(setpci -s $bdf $(printf '0x%x' $((${dvsec4_reg} + 0xf))).b)
+      socket=$(setpci -s $bdf $(printf '0x%x' $((${dvsec4_reg} + 0x10))).b)
+      echo "$bdf: Bus=$bus, Segment=$segment, RP=$rp, RC=$rc, Socket=$socket"
+    fi
+  done < <(lspci -d 10de:)
+
+Example output::
+
+  0001:00:00.0: Bus=00, Segment=01, RP=00, RC=00, Socket=00
+  0002:80:00.0: Bus=80, Segment=02, RP=01, RC=01, Socket=00
+  0002:a0:00.0: Bus=a0, Segment=02, RP=02, RC=01, Socket=00
+  0002:c0:00.0: Bus=c0, Segment=02, RP=03, RC=01, Socket=00
+  0002:e0:00.0: Bus=e0, Segment=02, RP=04, RC=01, Socket=00
+  0003:00:00.0: Bus=00, Segment=03, RP=00, RC=02, Socket=00
+  0004:00:00.0: Bus=00, Segment=04, RP=00, RC=03, Socket=00
+  0005:00:00.0: Bus=00, Segment=05, RP=00, RC=04, Socket=00
+  0005:40:00.0: Bus=40, Segment=05, RP=01, RC=04, Socket=00
+  0005:c0:00.0: Bus=c0, Segment=05, RP=02, RC=04, Socket=00
+  0006:00:00.0: Bus=00, Segment=06, RP=00, RC=05, Socket=00
+  0009:00:00.0: Bus=00, Segment=09, RP=00, RC=00, Socket=01
+  000a:80:00.0: Bus=80, Segment=0a, RP=01, RC=01, Socket=01
+  000a:a0:00.0: Bus=a0, Segment=0a, RP=02, RC=01, Socket=01
+  000a:e0:00.0: Bus=e0, Segment=0a, RP=03, RC=01, Socket=01
+  000b:00:00.0: Bus=00, Segment=0b, RP=00, RC=02, Socket=01
+  000c:00:00.0: Bus=00, Segment=0c, RP=00, RC=03, Socket=01
+  000d:00:00.0: Bus=00, Segment=0d, RP=00, RC=04, Socket=01
+  000d:40:00.0: Bus=40, Segment=0d, RP=01, RC=04, Socket=01
+  000d:c0:00.0: Bus=c0, Segment=0d, RP=02, RC=04, Socket=01
+  000e:00:00.0: Bus=00, Segment=0e, RP=00, RC=05, Socket=01
diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c b/drivers/perf/arm_cspmu/nvidia_cspmu.c
index c67667097a3c..42f11f37bddf 100644
--- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
+++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c
@@ -8,6 +8,7 @@
 
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/property.h>
 #include <linux/topology.h>
 
 #include "arm_cspmu.h"
@@ -28,6 +29,19 @@
 #define NV_UCF_FILTER_DST            GENMASK_ULL(11, 8)
 #define NV_UCF_FILTER_DEFAULT        (NV_UCF_FILTER_SRC | NV_UCF_FILTER_DST)
 
+#define NV_PCIE_V2_PORT_COUNT        8ULL
+#define NV_PCIE_V2_FILTER_ID_MASK    GENMASK_ULL(24, 0)
+#define NV_PCIE_V2_FILTER_PORT       GENMASK_ULL(NV_PCIE_V2_PORT_COUNT - 1, 0)
+#define NV_PCIE_V2_FILTER_BDF_VAL    GENMASK_ULL(23, NV_PCIE_V2_PORT_COUNT)
+#define NV_PCIE_V2_FILTER_BDF_EN     BIT(24)
+#define NV_PCIE_V2_FILTER_BDF_VAL_EN GENMASK_ULL(24, NV_PCIE_V2_PORT_COUNT)
+#define NV_PCIE_V2_FILTER_DEFAULT    NV_PCIE_V2_FILTER_PORT
+
+#define NV_PCIE_V2_DST_COUNT         5ULL
+#define NV_PCIE_V2_FILTER2_ID_MASK   GENMASK_ULL(4, 0)
+#define NV_PCIE_V2_FILTER2_DST       GENMASK_ULL(NV_PCIE_V2_DST_COUNT - 1, 0)
+#define NV_PCIE_V2_FILTER2_DEFAULT   NV_PCIE_V2_FILTER2_DST
+
 #define NV_GENERIC_FILTER_ID_MASK    GENMASK_ULL(31, 0)
 
 #define NV_PRODID_MASK	(PMIIDR_PRODUCTID | PMIIDR_VARIANT | PMIIDR_REVISION)
@@ -162,6 +176,16 @@ static struct attribute *ucf_pmu_event_attrs[] = {
 	NULL,
 };
 
+static struct attribute *pcie_v2_pmu_event_attrs[] = {
+	ARM_CSPMU_EVENT_ATTR(rd_bytes,		0x0),
+	ARM_CSPMU_EVENT_ATTR(wr_bytes,		0x1),
+	ARM_CSPMU_EVENT_ATTR(rd_req,		0x2),
+	ARM_CSPMU_EVENT_ATTR(wr_req,		0x3),
+	ARM_CSPMU_EVENT_ATTR(rd_cum_outs,	0x4),
+	ARM_CSPMU_EVENT_ATTR(cycles, ARM_CSPMU_EVT_CYCLES_DEFAULT),
+	NULL,
+};
+
 static struct attribute *generic_pmu_event_attrs[] = {
 	ARM_CSPMU_EVENT_ATTR(cycles, ARM_CSPMU_EVT_CYCLES_DEFAULT),
 	NULL,
@@ -202,6 +226,19 @@ static struct attribute *ucf_pmu_format_attrs[] = {
 	NULL,
 };
 
+static struct attribute *pcie_v2_pmu_format_attrs[] = {
+	ARM_CSPMU_FORMAT_EVENT_ATTR,
+	ARM_CSPMU_FORMAT_ATTR(src_rp_mask, "config1:0-7"),
+	ARM_CSPMU_FORMAT_ATTR(src_bdf, "config1:8-23"),
+	ARM_CSPMU_FORMAT_ATTR(src_bdf_en, "config1:24"),
+	ARM_CSPMU_FORMAT_ATTR(dst_loc_cmem, "config2:0"),
+	ARM_CSPMU_FORMAT_ATTR(dst_loc_gmem, "config2:1"),
+	ARM_CSPMU_FORMAT_ATTR(dst_loc_pcie_p2p, "config2:2"),
+	ARM_CSPMU_FORMAT_ATTR(dst_loc_pcie_cxl, "config2:3"),
+	ARM_CSPMU_FORMAT_ATTR(dst_rem, "config2:4"),
+	NULL,
+};
+
 static struct attribute *generic_pmu_format_attrs[] = {
 	ARM_CSPMU_FORMAT_EVENT_ATTR,
 	ARM_CSPMU_FORMAT_FILTER_ATTR,
@@ -233,6 +270,32 @@ nv_cspmu_get_name(const struct arm_cspmu *cspmu)
 	return ctx->name;
 }
 
+#if defined(CONFIG_ACPI)
+static int nv_cspmu_get_inst_id(const struct arm_cspmu *cspmu, u32 *id)
+{
+	struct fwnode_handle *fwnode;
+	struct acpi_device *adev;
+	int ret;
+
+	adev = arm_cspmu_acpi_dev_get(cspmu);
+	if (!adev)
+		return -ENODEV;
+
+	fwnode = acpi_fwnode_handle(adev);
+	ret = fwnode_property_read_u32(fwnode, "instance_id", id);
+	if (ret)
+		dev_err(cspmu->dev, "Failed to get instance ID\n");
+
+	acpi_dev_put(adev);
+	return ret;
+}
+#else
+static int nv_cspmu_get_inst_id(const struct arm_cspmu *cspmu, u32 *id)
+{
+	return -EINVAL;
+}
+#endif
+
 static u32 nv_cspmu_event_filter(const struct perf_event *event)
 {
 	const struct nv_cspmu_ctx *ctx =
@@ -278,6 +341,20 @@ static void nv_cspmu_set_ev_filter(struct arm_cspmu *cspmu,
 	}
 }
 
+static void nv_cspmu_reset_ev_filter(struct arm_cspmu *cspmu,
+				     const struct perf_event *event)
+{
+	const struct nv_cspmu_ctx *ctx =
+		to_nv_cspmu_ctx(to_arm_cspmu(event->pmu));
+	const u32 offset = 4 * event->hw.idx;
+
+	if (ctx->get_filter)
+		writel(0, cspmu->base0 + PMEVFILTR + offset);
+
+	if (ctx->get_filter2)
+		writel(0, cspmu->base0 + PMEVFILT2R + offset);
+}
+
 static void nv_cspmu_set_cc_filter(struct arm_cspmu *cspmu,
 				   const struct perf_event *event)
 {
@@ -308,9 +385,103 @@ static u32 ucf_pmu_event_filter(const struct perf_event *event)
 	return ret;
 }
 
+static u32 pcie_v2_pmu_bdf_val_en(u32 filter)
+{
+	const u32 bdf_en = FIELD_GET(NV_PCIE_V2_FILTER_BDF_EN, filter);
+
+	/* Returns both BDF value and enable bit if BDF filtering is enabled. */
+	if (bdf_en)
+		return FIELD_GET(NV_PCIE_V2_FILTER_BDF_VAL_EN, filter);
+
+	/* Ignore the BDF value if BDF filter is not enabled. */
+	return 0;
+}
+
+static u32 pcie_v2_pmu_event_filter(const struct perf_event *event)
+{
+	u32 filter, lead_filter, lead_bdf;
+	struct perf_event *leader;
+	const struct nv_cspmu_ctx *ctx =
+		to_nv_cspmu_ctx(to_arm_cspmu(event->pmu));
+
+	filter = event->attr.config1 & ctx->filter_mask;
+	if (filter != 0)
+		return filter;
+
+	leader = event->group_leader;
+
+	/* Use leader's filter value if its BDF filtering is enabled. */
+	if (event != leader) {
+		lead_filter = pcie_v2_pmu_event_filter(leader);
+		lead_bdf = pcie_v2_pmu_bdf_val_en(lead_filter);
+		if (lead_bdf != 0)
+			return lead_filter;
+	}
+
+	/* Otherwise, return default filter value. */
+	return ctx->filter_default_val;
+}
+
+static int pcie_v2_pmu_validate_event(struct arm_cspmu *cspmu,
+				   struct perf_event *new_ev)
+{
+	/*
+	 * Make sure the events are using same BDF filter since the PCIE-SRC PMU
+	 * only supports one common BDF filter setting for all of the counters.
+	 */
+
+	int idx;
+	u32 new_filter, new_rp, new_bdf, new_lead_filter, new_lead_bdf;
+	struct perf_event *leader, *new_leader;
+
+	if (cspmu->impl.ops.is_cycle_counter_event(new_ev))
+		return 0;
+
+	new_leader = new_ev->group_leader;
+
+	new_filter = pcie_v2_pmu_event_filter(new_ev);
+	new_lead_filter = pcie_v2_pmu_event_filter(new_leader);
+
+	new_bdf = pcie_v2_pmu_bdf_val_en(new_filter);
+	new_lead_bdf = pcie_v2_pmu_bdf_val_en(new_lead_filter);
+
+	new_rp = FIELD_GET(NV_PCIE_V2_FILTER_PORT, new_filter);
+
+	if (new_rp != 0 && new_bdf != 0) {
+		dev_err(cspmu->dev,
+			"RP and BDF filtering are mutually exclusive\n");
+		return -EINVAL;
+	}
+
+	if (new_bdf != new_lead_bdf) {
+		dev_err(cspmu->dev,
+			"sibling and leader BDF value should be equal\n");
+		return -EINVAL;
+	}
+
+	/* Compare BDF filter on existing events. */
+	idx = find_first_bit(cspmu->hw_events.used_ctrs,
+			     cspmu->cycle_counter_logical_idx);
+
+	if (idx != cspmu->cycle_counter_logical_idx) {
+		leader = cspmu->hw_events.events[idx]->group_leader;
+
+		const u32 lead_filter = pcie_v2_pmu_event_filter(leader);
+		const u32 lead_bdf = pcie_v2_pmu_bdf_val_en(lead_filter);
+
+		if (new_lead_bdf != lead_bdf) {
+			dev_err(cspmu->dev, "only one BDF value is supported\n");
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 enum nv_cspmu_name_fmt {
 	NAME_FMT_GENERIC,
-	NAME_FMT_SOCKET
+	NAME_FMT_SOCKET,
+	NAME_FMT_SOCKET_INST
 };
 
 struct nv_cspmu_match {
@@ -430,6 +601,27 @@ static const struct nv_cspmu_match nv_cspmu_match[] = {
 		.init_data = NULL
 	  },
 	},
+	{
+	  .prodid = 0x10301000,
+	  .prodid_mask = NV_PRODID_MASK,
+	  .name_pattern = "nvidia_pcie_pmu_%u_rc_%u",
+	  .name_fmt = NAME_FMT_SOCKET_INST,
+	  .template_ctx = {
+		.event_attr = pcie_v2_pmu_event_attrs,
+		.format_attr = pcie_v2_pmu_format_attrs,
+		.filter_mask = NV_PCIE_V2_FILTER_ID_MASK,
+		.filter_default_val = NV_PCIE_V2_FILTER_DEFAULT,
+		.filter2_mask = NV_PCIE_V2_FILTER2_ID_MASK,
+		.filter2_default_val = NV_PCIE_V2_FILTER2_DEFAULT,
+		.get_filter = pcie_v2_pmu_event_filter,
+		.get_filter2 = nv_cspmu_event_filter2,
+		.init_data = NULL
+	  },
+	  .ops = {
+		.validate_event = pcie_v2_pmu_validate_event,
+		.reset_ev_filter = nv_cspmu_reset_ev_filter,
+	  }
+	},
 	{
 	  .prodid = 0,
 	  .prodid_mask = 0,
@@ -453,7 +645,7 @@ static const struct nv_cspmu_match nv_cspmu_match[] = {
 static char *nv_cspmu_format_name(const struct arm_cspmu *cspmu,
 				  const struct nv_cspmu_match *match)
 {
-	char *name;
+	char *name = NULL;
 	struct device *dev = cspmu->dev;
 
 	static atomic_t pmu_generic_idx = {0};
@@ -467,13 +659,20 @@ static char *nv_cspmu_format_name(const struct arm_cspmu *cspmu,
 				       socket);
 		break;
 	}
+	case NAME_FMT_SOCKET_INST: {
+		const int cpu = cpumask_first(&cspmu->associated_cpus);
+		const int socket = cpu_to_node(cpu);
+		u32 inst_id;
+
+		if (!nv_cspmu_get_inst_id(cspmu, &inst_id))
+			name = devm_kasprintf(dev, GFP_KERNEL,
+					match->name_pattern, socket, inst_id);
+		break;
+	}
 	case NAME_FMT_GENERIC:
 		name = devm_kasprintf(dev, GFP_KERNEL, match->name_pattern,
 				       atomic_fetch_inc(&pmu_generic_idx));
 		break;
-	default:
-		name = NULL;
-		break;
 	}
 
 	return name;
@@ -514,8 +713,10 @@ static int nv_cspmu_init_ops(struct arm_cspmu *cspmu)
 	cspmu->impl.ctx = ctx;
 
 	/* NVIDIA specific callbacks. */
+	SET_OP(validate_event, impl_ops, match, NULL);
 	SET_OP(set_cc_filter, impl_ops, match, nv_cspmu_set_cc_filter);
 	SET_OP(set_ev_filter, impl_ops, match, nv_cspmu_set_ev_filter);
+	SET_OP(reset_ev_filter, impl_ops, match, NULL);
 	SET_OP(get_event_attrs, impl_ops, match, nv_cspmu_get_event_attrs);
 	SET_OP(get_format_attrs, impl_ops, match, nv_cspmu_get_format_attrs);
 	SET_OP(get_name, impl_ops, match, nv_cspmu_get_name);
-- 
2.43.0

