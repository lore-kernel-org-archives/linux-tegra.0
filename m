Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010049.outbound.protection.outlook.com [52.101.56.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E4B34D922;
	Mon, 26 Jan 2026 18:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769451195; cv=fail; b=Cmmef4uGY6DMZb7/Uc6ogHZql9HSXnN5vAQd6ar+x1OF7fcLw2si1FfKfqLNSfET3BRr5C3HyZeDwkQfK8vneMSFRI4hZNX1FsCPOWcOdt50l3/GN3O9LhRD6tuNOc3yeBBN2jyvkZlGF+IPv4sFyLliGhF2Hvai6x0KVB+AADM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769451195; c=relaxed/simple;
	bh=uWPvjCq8zyUNvGfFkXKJO4bbk2VwrxgRQaGOf8Sd5iE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zk0tnDHvaZFPxc4jEtZcxkLGCuYOJDcSyAoigPX9eGrxvvqCvn/GJjEmtOALSV11+dkwi3ttOtRjHLjulVO4omJOzxFfv2HQzYTNqSgLJPOMqYy8Y69k0XXFO6mtBjvjsdmYqINK3arb0/FPJGCWE0UJj2s8Qpd0tv7m1RSrPDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=k74wNlCT; arc=fail smtp.client-ip=52.101.56.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="k74wNlCT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vVILkVlCdPkrjiOiKCeCXbY2Wcfl7aGvgPMLA/tC+e7cUnu81u96ZQfH82d0scaDDl0cYhnwkop3r3CQ1pynYIfllQPQ4pDXJNtUZufsbhv2dXu2eD1CdgDXUpHk3TvBTwMUcyZy9WZDokmtVRCXnBJTN8s1Bo7WzOti6nzLSBy6MiW46As06OC+x5nJB89CfaY9+ixb1EctLcGIqg+kQzSTNk5svGUWV5e6Nqz2BNFUQjhmi4rftecWEuPXJCWkn6O4yVa/Cms87STe3Nf0sU0B5OVI7QFf1xyHXIu2dnOPl6LrnAThe5aM6Y2VKOPTtdaoDbga6BAedjAE/TuzPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yOT0MJd7dyxZAVWYCpq4V02gKsRRUtZ7I3hDTZ0f89g=;
 b=NLoScUqlc3b8GSa1AVQ1Ia0TQzeF6Tq+wEL7jl2nswuFlbuzzIsW/nKbv3ti7eMCOrWH4oEOrP1wrcJf3EGcIIL74MVeWRbIrzgryQxmL7txRA1ku6PjahAEmv6VUPdbjZGKgSKBaj4/VraarrBXlvI0R1JUTNn9Uq9OMbYGCYD9KuYS+GxxONBnWqybB+ZZWjZqeeiraJih8SlA35qepGLw6QP1B/Gkv1PgAhUmPP6VY+EBP6tdZcn8vbQGTswxCGcWf0rSUTRKbrMnqQHioVMG02CMo//ff7Y1QVTobqPutD/VDxhbcYXEa8fx4mCmDpipaDB2ejc/S1owdR8Zhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOT0MJd7dyxZAVWYCpq4V02gKsRRUtZ7I3hDTZ0f89g=;
 b=k74wNlCT/fbuStpM22OuqN17/rLrXZ71GITy4iSWZhuVwDUIF+XisBshnVFKNWsQlX9hZmobKBudQyRDiZwDJTNf0CcqdAfe77N3jQs0AwoOzngRVKG4YUdPN32BCZuMdLQVauvRnGuYR34YEV5OlxwVImDwfK4fqfJuJDwm/TPme6UU0ihTsAgwuL8u/SzfZOlK6+we/j0u34WFymqYnii8RIAJBGJv7wDfpcO4x2wR7kNDYHJUx39jzSNHRfv7zsb9rPOz4Rjb68PN3x2zCYfQhfG1nquBMJxCDiqa+D2+0f+v/ljePpQDLhTcH3MBQbg3TRTvufC8CPrPwbBHJQ==
Received: from BN9PR03CA0600.namprd03.prod.outlook.com (2603:10b6:408:10d::35)
 by IA1PR12MB9532.namprd12.prod.outlook.com (2603:10b6:208:595::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 18:13:02 +0000
Received: from BN2PEPF000044A4.namprd02.prod.outlook.com
 (2603:10b6:408:10d:cafe::63) by BN9PR03CA0600.outlook.office365.com
 (2603:10b6:408:10d::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Mon,
 26 Jan 2026 18:12:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN2PEPF000044A4.mail.protection.outlook.com (10.167.243.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 18:13:02 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 26 Jan
 2026 10:12:45 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 26 Jan 2026 10:12:45 -0800
Received: from build-bwicaksono-noble-20251018.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Mon, 26 Jan 2026 10:12:45 -0800
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <will@kernel.org>, <suzuki.poulose@arm.com>, <robin.murphy@arm.com>,
	<ilkka@os.amperecomputing.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <mark.rutland@arm.com>, <treding@nvidia.com>,
	<jonathanh@nvidia.com>, <vsethi@nvidia.com>, <rwiley@nvidia.com>,
	<sdonthineni@nvidia.com>, <skelley@nvidia.com>, <ywan@nvidia.com>,
	<mochs@nvidia.com>, <nirmoyd@nvidia.com>, Besar Wicaksono
	<bwicaksono@nvidia.com>
Subject: [PATCH 2/8] perf/arm_cspmu: nvidia: Add Tegra410 UCF PMU
Date: Mon, 26 Jan 2026 18:11:49 +0000
Message-ID: <20260126181155.2776097-3-bwicaksono@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A4:EE_|IA1PR12MB9532:EE_
X-MS-Office365-Filtering-Correlation-Id: c7905b98-cb49-4cfe-b17f-08de5d068b61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?P0ZSlSo/lXlgh4MPzBvDUpK6iYji7uGj3KIKBqXdYCKF9tBQa7JpkfnpsczC?=
 =?us-ascii?Q?eTvgkPxYQzrmwGy2Q7BklXf8dwi2VcddxHRkQjVEKAG1nSmhMFI29yYrSc9Z?=
 =?us-ascii?Q?F1X76VfkEdoZj+nlhyi7aeGGBMpNyGf8arLNtspra9/n8Rqxld2VOZVCrxrm?=
 =?us-ascii?Q?mJV+P1wRLE0GWTptTCdg9bND2SPDbyi8YYo3RslY6/qIW+Ro97gE39In+A2L?=
 =?us-ascii?Q?wwLnJw6ZjGit0kQTEWjxttfEeS4DcyBo8QTY8LYj7I+Af7ggxqyl4MsHmCyH?=
 =?us-ascii?Q?9NPdaAsNYvV0CdtWs0a8Fm2q9f6lW+377C2kqu/dPWcNNya79DPiG+yuyFg+?=
 =?us-ascii?Q?scb2Uq/82HCkyCDEblfC5FzcX1V9RqYj5nLaZiBPan/qWDTsP87Yem2HP88z?=
 =?us-ascii?Q?aTLDyiXLWpKyCZE4Mkx98e87ICHlG9HSlfDfiZYITOUT79iGSK9ztKJZv2Fu?=
 =?us-ascii?Q?6M7W3gWkNnTSmU+hCUOZEIXeaFAecLz1n3wiRA/agA/tpKzh2kq+WG6GFhN3?=
 =?us-ascii?Q?iSKFNuyKSWnoukX9WXhYP1J7/0mXT12G0TuXBLePNFGvCQ/x9IvNRNnYFCn5?=
 =?us-ascii?Q?nJPgLtO1KEaHz1PVOz3C+cM8MbNKddCl/1E/7oZiuwub2JEMCW5vzYkrbocI?=
 =?us-ascii?Q?XLQmjbyc/YLKsC8MUsGfv9FChLbjGDYw0LjoM/zFcT2SoJEKlCeSf7OlAEbe?=
 =?us-ascii?Q?Eg2U1FTHV/YkreDi2rrxU04bzaFXS1yyCLJqohEHsuuBvTopZV2bDI7LCgUt?=
 =?us-ascii?Q?wnTU1w41R0S/TgPAtP8fbANgI8wNtfDwm9a8htQgtqXa+AyJ5NgjxzZFrOfX?=
 =?us-ascii?Q?Q6MEvOzZruOQwf/Sn1n3TGO/W1Xx+52RAVLKcXDUQfBf6SQKdW0GvqpTP2Af?=
 =?us-ascii?Q?VW5ybxgJyWY2nkS/eJ3PvQHb815POLayF5unFaNRr0oT3hhDjwZoKyCUgf1W?=
 =?us-ascii?Q?HMtEm+szoXEfjOUkJN4vKgL/b4HOotfZBE1QQw3Xk0Bu/IkofprFu27HKJpu?=
 =?us-ascii?Q?Jh0/U4CLnPmIf2W3ctsUEVza2fIdmciOPSWfHTROW0sjR0X9D3vumC8/Ieii?=
 =?us-ascii?Q?Adptx/zKx7uyGZG8Zx1tq1esx/fO0S1jCT8C6VLJCS6ADfXNul1EioRKmOAK?=
 =?us-ascii?Q?rSlTrUrG/XobXF+/MyyCvMayo7IudZ25XWasMh9DA5wxCt743mkLJ2NHE8N5?=
 =?us-ascii?Q?TWmlh8rjTSa0yB1ZwUc1uqWpBPXmoJ+OGur8a/50o70jt0noQ6GDxOYAMuUh?=
 =?us-ascii?Q?1WE+M0UaoWBeZo8JX+aoL02mW4zze85Za7RllcMH3wGuyaCRYQICOFbAIoz9?=
 =?us-ascii?Q?6a+h4ygFScZQ4M3arHO+3gpEmiA+qw9kZq+scFhdyY38EC9D6Ol0M6KjF04D?=
 =?us-ascii?Q?MitLB4zeXZDslc3pgg/viUyiOhBc/+EV7emZdtnhs6zDJ7llSg+wsrLjr59L?=
 =?us-ascii?Q?DyV7MCs1vyPKTtwZdBd8nm9EPfeaE3Jup9c0R3Q0uVh8p2RRfmpF/tM5t4l9?=
 =?us-ascii?Q?htDd/qs12zzYPQzTnqSwbYgS0iYU6YpIqvSXAMccy1ZBkEdrdehdcldF2myK?=
 =?us-ascii?Q?O4p90g7tzbvCtm0j8haf/DzSab7bYr9r4aKm+j3MnCiGWuJ5fnmmfZvH6FDw?=
 =?us-ascii?Q?yOk0pZCXqeP4L8QPK0NTidpOVFlwOvT37yYaZcSeZayy1+4fJpwkHUR4g4Cn?=
 =?us-ascii?Q?rMGmVA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 18:13:02.1002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7905b98-cb49-4cfe-b17f-08de5d068b61
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9532

Adds Unified Coherent Fabric PMU support in Tegra410 SOC.

Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 Documentation/admin-guide/perf/index.rst      |   1 +
 .../admin-guide/perf/nvidia-tegra410-pmu.rst  | 106 ++++++++++++++++++
 drivers/perf/arm_cspmu/nvidia_cspmu.c         |  90 ++++++++++++++-
 3 files changed, 196 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/admin-guide/perf/nvidia-tegra410-pmu.rst

diff --git a/Documentation/admin-guide/perf/index.rst b/Documentation/admin-guide/perf/index.rst
index c407bb44b08e..aa12708ddb96 100644
--- a/Documentation/admin-guide/perf/index.rst
+++ b/Documentation/admin-guide/perf/index.rst
@@ -25,6 +25,7 @@ Performance monitor support
    alibaba_pmu
    dwc_pcie_pmu
    nvidia-tegra241-pmu
+   nvidia-tegra410-pmu
    meson-ddr-pmu
    cxl
    ampere_cspmu
diff --git a/Documentation/admin-guide/perf/nvidia-tegra410-pmu.rst b/Documentation/admin-guide/perf/nvidia-tegra410-pmu.rst
new file mode 100644
index 000000000000..7b7ba5700ca1
--- /dev/null
+++ b/Documentation/admin-guide/perf/nvidia-tegra410-pmu.rst
@@ -0,0 +1,106 @@
+=====================================================================
+NVIDIA Tegra410 SoC Uncore Performance Monitoring Unit (PMU)
+=====================================================================
+
+The NVIDIA Tegra410 SoC includes various system PMUs to measure key performance
+metrics like memory bandwidth, latency, and utilization:
+
+* Unified Coherence Fabric (UCF)
+
+PMU Driver
+----------
+
+The PMU driver describes the available events and configuration of each PMU in
+sysfs. Please see the sections below to get the sysfs path of each PMU. Like
+other uncore PMU drivers, the driver provides "cpumask" sysfs attribute to show
+the CPU id used to handle the PMU event. There is also "associated_cpus"
+sysfs attribute, which contains a list of CPUs associated with the PMU instance.
+
+UCF PMU
+-------
+
+The Unified Coherence Fabric (UCF) in the NVIDIA Tegra410 SoC serves as a
+distributed cache, last level for CPU Memory and CXL Memory, and cache coherent
+interconnect that supports hardware coherence across multiple coherently caching
+agents, including:
+
+  * CPU clusters
+  * GPU
+  * PCIe Ordering Controller Unit (OCU)
+  * Other IO-coherent requesters
+
+The events and configuration options of this PMU device are described in sysfs,
+see /sys/bus/event_source/devices/nvidia_ucf_pmu_<socket-id>.
+
+Some of the events available in this PMU can be used to measure bandwidth and
+utilization:
+
+  * slc_access_rd: count the number of read requests to SLC.
+  * slc_access_wr: count the number of write requests to SLC.
+  * slc_bytes_rd: count the number of bytes transferred by slc_access_rd.
+  * slc_bytes_wr: count the number of bytes transferred by slc_access_wr.
+  * mem_access_rd: count the number of read requests to local or remote memory.
+  * mem_access_wr: count the number of write requests to local or remote memory.
+  * mem_bytes_rd: count the number of bytes transferred by mem_access_rd.
+  * mem_bytes_wr: count the number of bytes transferred by mem_access_wr.
+  * cycles: counts the UCF cycles.
+
+The average bandwidth is calculated as::
+
+   AVG_SLC_READ_BANDWIDTH_IN_GBPS = SLC_BYTES_RD / ELAPSED_TIME_IN_NS
+   AVG_SLC_WRITE_BANDWIDTH_IN_GBPS = SLC_BYTES_WR / ELAPSED_TIME_IN_NS
+   AVG_MEM_READ_BANDWIDTH_IN_GBPS = MEM_BYTES_RD / ELAPSED_TIME_IN_NS
+   AVG_MEM_WRITE_BANDWIDTH_IN_GBPS = MEM_BYTES_WR / ELAPSED_TIME_IN_NS
+
+The average request rate is calculated as::
+
+   AVG_SLC_READ_REQUEST_RATE = SLC_ACCESS_RD / CYCLES
+   AVG_SLC_WRITE_REQUEST_RATE = SLC_ACCESS_WR / CYCLES
+   AVG_MEM_READ_REQUEST_RATE = MEM_ACCESS_RD / CYCLES
+   AVG_MEM_WRITE_REQUEST_RATE = MEM_ACCESS_WR / CYCLES
+
+More details about what other events are available can be found in Tegra410 SoC
+technical reference manual.
+
+The events can be filtered based on source or destination. The source filter
+indicates the traffic initiator to the SLC, e.g local CPU, non-CPU device, or
+remote socket. The destination filter specifies the destination memory type,
+e.g. local system memory (CMEM), local GPU memory (GMEM), or remote memory. The
+local/remote classification of the destination filter is based on the home
+socket of the address, not where the data actually resides. The available
+filters are described in
+/sys/bus/event_source/devices/nvidia_ucf_pmu_<socket-id>/format/.
+
+The list of UCF PMU event filters:
+
+* Source filter:
+
+  * src_loc_cpu: if set, count events from local CPU
+  * src_loc_noncpu: if set, count events from local non-CPU device
+  * src_rem: if set, count events from CPU, GPU, PCIE devices of remote socket
+
+* Destination filter:
+
+  * dst_loc_cmem: if set, count events to local system memory (CMEM) address
+  * dst_loc_gmem: if set, count events to local GPU memory (GMEM) address
+  * dst_loc_other: if set, count events to local CXL memory address
+  * dst_rem: if set, count events to CPU, GPU, and CXL memory address of remote socket
+
+If the source is not specified, the PMU will count events from all sources. If
+the destination is not specified, the PMU will count events to all destinations.
+
+Example usage:
+
+* Count event id 0x0 in socket 0 from all sources and to all destinations::
+
+    perf stat -a -e nvidia_ucf_pmu_0/event=0x0/
+
+* Count event id 0x0 in socket 0 with source filter = local CPU and destination
+  filter = local system memory (CMEM)::
+
+    perf stat -a -e nvidia_ucf_pmu_0/event=0x0,src_loc_cpu=0x1,dst_loc_cmem=0x1/
+
+* Count event id 0x0 in socket 1 with source filter = local non-CPU device and
+  destination filter = remote memory::
+
+    perf stat -a -e nvidia_ucf_pmu_1/event=0x0,src_loc_noncpu=0x1,dst_rem=0x1/
diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c b/drivers/perf/arm_cspmu/nvidia_cspmu.c
index e06a06d3407b..c67667097a3c 100644
--- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
+++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2022-2023, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ * Copyright (c) 2022-2026, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
  *
  */
 
@@ -21,6 +21,13 @@
 #define NV_CNVL_PORT_COUNT           4ULL
 #define NV_CNVL_FILTER_ID_MASK       GENMASK_ULL(NV_CNVL_PORT_COUNT - 1, 0)
 
+#define NV_UCF_SRC_COUNT             3ULL
+#define NV_UCF_DST_COUNT             4ULL
+#define NV_UCF_FILTER_ID_MASK        GENMASK_ULL(11, 0)
+#define NV_UCF_FILTER_SRC            GENMASK_ULL(2, 0)
+#define NV_UCF_FILTER_DST            GENMASK_ULL(11, 8)
+#define NV_UCF_FILTER_DEFAULT        (NV_UCF_FILTER_SRC | NV_UCF_FILTER_DST)
+
 #define NV_GENERIC_FILTER_ID_MASK    GENMASK_ULL(31, 0)
 
 #define NV_PRODID_MASK	(PMIIDR_PRODUCTID | PMIIDR_VARIANT | PMIIDR_REVISION)
@@ -124,6 +131,37 @@ static struct attribute *mcf_pmu_event_attrs[] = {
 	NULL,
 };
 
+static struct attribute *ucf_pmu_event_attrs[] = {
+	ARM_CSPMU_EVENT_ATTR(bus_cycles,            0x1D),
+
+	ARM_CSPMU_EVENT_ATTR(slc_allocate,          0xF0),
+	ARM_CSPMU_EVENT_ATTR(slc_wb,                0xF3),
+	ARM_CSPMU_EVENT_ATTR(slc_refill_rd,         0x109),
+	ARM_CSPMU_EVENT_ATTR(slc_refill_wr,         0x10A),
+	ARM_CSPMU_EVENT_ATTR(slc_hit_rd,            0x119),
+
+	ARM_CSPMU_EVENT_ATTR(slc_access_dataless,   0x183),
+	ARM_CSPMU_EVENT_ATTR(slc_access_atomic,     0x184),
+
+	ARM_CSPMU_EVENT_ATTR(slc_access,            0xF2),
+	ARM_CSPMU_EVENT_ATTR(slc_access_rd,         0x111),
+	ARM_CSPMU_EVENT_ATTR(slc_access_wr,         0x112),
+	ARM_CSPMU_EVENT_ATTR(slc_bytes_rd,          0x113),
+	ARM_CSPMU_EVENT_ATTR(slc_bytes_wr,          0x114),
+
+	ARM_CSPMU_EVENT_ATTR(mem_access_rd,         0x121),
+	ARM_CSPMU_EVENT_ATTR(mem_access_wr,         0x122),
+	ARM_CSPMU_EVENT_ATTR(mem_bytes_rd,          0x123),
+	ARM_CSPMU_EVENT_ATTR(mem_bytes_wr,          0x124),
+
+	ARM_CSPMU_EVENT_ATTR(local_snoop,           0x180),
+	ARM_CSPMU_EVENT_ATTR(ext_snp_access,        0x181),
+	ARM_CSPMU_EVENT_ATTR(ext_snp_evict,         0x182),
+
+	ARM_CSPMU_EVENT_ATTR(cycles, ARM_CSPMU_EVT_CYCLES_DEFAULT),
+	NULL,
+};
+
 static struct attribute *generic_pmu_event_attrs[] = {
 	ARM_CSPMU_EVENT_ATTR(cycles, ARM_CSPMU_EVT_CYCLES_DEFAULT),
 	NULL,
@@ -152,6 +190,18 @@ static struct attribute *cnvlink_pmu_format_attrs[] = {
 	NULL,
 };
 
+static struct attribute *ucf_pmu_format_attrs[] = {
+	ARM_CSPMU_FORMAT_EVENT_ATTR,
+	ARM_CSPMU_FORMAT_ATTR(src_loc_noncpu, "config1:0"),
+	ARM_CSPMU_FORMAT_ATTR(src_loc_cpu, "config1:1"),
+	ARM_CSPMU_FORMAT_ATTR(src_rem, "config1:2"),
+	ARM_CSPMU_FORMAT_ATTR(dst_loc_cmem, "config1:8"),
+	ARM_CSPMU_FORMAT_ATTR(dst_loc_gmem, "config1:9"),
+	ARM_CSPMU_FORMAT_ATTR(dst_loc_other, "config1:10"),
+	ARM_CSPMU_FORMAT_ATTR(dst_rem, "config1:11"),
+	NULL,
+};
+
 static struct attribute *generic_pmu_format_attrs[] = {
 	ARM_CSPMU_FORMAT_EVENT_ATTR,
 	ARM_CSPMU_FORMAT_FILTER_ATTR,
@@ -236,6 +286,27 @@ static void nv_cspmu_set_cc_filter(struct arm_cspmu *cspmu,
 	writel(filter, cspmu->base0 + PMCCFILTR);
 }
 
+static u32 ucf_pmu_event_filter(const struct perf_event *event)
+{
+	u32 ret, filter, src, dst;
+
+	filter = nv_cspmu_event_filter(event);
+
+	/* Monitor all sources if none is selected. */
+	src = FIELD_GET(NV_UCF_FILTER_SRC, filter);
+	if (src == 0)
+		src = GENMASK_ULL(NV_UCF_SRC_COUNT - 1, 0);
+
+	/* Monitor all destinations if none is selected. */
+	dst = FIELD_GET(NV_UCF_FILTER_DST, filter);
+	if (dst == 0)
+		dst = GENMASK_ULL(NV_UCF_DST_COUNT - 1, 0);
+
+	ret = FIELD_PREP(NV_UCF_FILTER_SRC, src);
+	ret |= FIELD_PREP(NV_UCF_FILTER_DST, dst);
+
+	return ret;
+}
 
 enum nv_cspmu_name_fmt {
 	NAME_FMT_GENERIC,
@@ -342,6 +413,23 @@ static const struct nv_cspmu_match nv_cspmu_match[] = {
 		.init_data = NULL
 	  },
 	},
+	{
+	  .prodid = 0x2CF20000,
+	  .prodid_mask = NV_PRODID_MASK,
+	  .name_pattern = "nvidia_ucf_pmu_%u",
+	  .name_fmt = NAME_FMT_SOCKET,
+	  .template_ctx = {
+		.event_attr = ucf_pmu_event_attrs,
+		.format_attr = ucf_pmu_format_attrs,
+		.filter_mask = NV_UCF_FILTER_ID_MASK,
+		.filter_default_val = NV_UCF_FILTER_DEFAULT,
+		.filter2_mask = 0x0,
+		.filter2_default_val = 0x0,
+		.get_filter = ucf_pmu_event_filter,
+		.get_filter2 = NULL,
+		.init_data = NULL
+	  },
+	},
 	{
 	  .prodid = 0,
 	  .prodid_mask = 0,
-- 
2.43.0

