Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010050.outbound.protection.outlook.com [52.101.193.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6168633EB0D;
	Wed, 18 Feb 2026 14:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771426738; cv=fail; b=M0aBCNM7YuxKg4EQDRNCIpfffly9wBsUVdApeB6RnIQ9v6CRD56ZZ0mpWjCpa+yibmzd/sBiBYwh7cV/YF74UyKGsNozd7+M4K766ssF9NsGxfFrNgqSIc/LNzrCI2+ueXKQRm/ZLjinG6uCJ9JkY2Vbm+c7Jr6lwBblJd5Wx3k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771426738; c=relaxed/simple;
	bh=FJ36Xu1sTtSbU05xxF6jH2A5/XYeydCmoGHqkdtyN1E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uMl+aFLgt7Kl16/emsxw9hEfv7YzKFlwIgTffIJxCoIJKsE1nEAf75mrA0FJJ7fyN/d3U3YO1OncfJDVUE++iLId+CX3DEqXtjmt1HKic9Ro3jHFl/6qkmJwmeGLBz81ERkRYgvPWTg7BNHRrucHOjNBCC+xJaoXZImq2z0WjXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tW6GbPV4; arc=fail smtp.client-ip=52.101.193.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tW6GbPV4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JjfIq+zol+m5A0QyqB/q22vAVsl3C1cYx7lHdO5wIai9OoqWm6RR8CIi3vbVeTqxKfyWtkj9klbTVVSyUzgZr+Rn2ikVZNdMJhiDKkXcs2/NMsGnxxIgi7pZ4yDlPL2tLL4zVf2A0Eb95uHMKX1aK1Qt70AOEpnlcAXaSwQuaNmBN8HbYK6NLLca3neaKWbF/56JX2cdlJgd2j5BkfW0+7VrDD41OvRmmtP79g4i8M56LKZJezFnt+MdOpypi4yN0QZRI7khKqSPcFtm9otsoSwi+MUGSjJe1+WIGZ2VamUeUA7mcW5Z1Mas+oUxYofbWg4LeUVfLdxmmjfvmU6Z8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nN+8Gawo9+gis169ANTFM37ZRz/LSsce878VlTurD3I=;
 b=X7pc5CnRUNE7GY4pA8RFD4VZblVum1r0ECvPrHf9SH56d09uqYbzLJAoGSvAnOthtUnDKVW/wbe1JTD9YrkArxTSheH/F+RFk258qYsftkR2Muq2qyvsPeL7PZv8A7O+dFO+IBh//g6QhnrakLV3/Lg12Ov9ST5Opmyms6MQPzNqSFIVV6QzIHaYyCimVGr7WRkD8ekA0RS6oxHy9ZNf3ymno63njtTvnyG/lQ+kOMW81ZgMGffEJaQXDTrq7KpaRml4tXnaiCWRB2io+o1YUV45HaX7SHTMc9lhweSYIGGqQjq2G2bNZii0zYqWWB82+nGV8z7VPV3WScQHfrRUlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nN+8Gawo9+gis169ANTFM37ZRz/LSsce878VlTurD3I=;
 b=tW6GbPV4NvryXiY6EoPGmNohNwOMKg0O/qnLJhLtkolyTy5QFycyx24pUG5zuEKeoIuW5cqslJMq8+5yqCKx6FSr2PenPDc6J8SwcpESTqQCRuVSnXv82UfT4oFRbI+Hx7kxI4rKWCm34eLMmOD4wP9nJXGp0chjbPv4pnrve4419V0MQuFU0hLHtPSaX3pEP8L7FDSsuTmGYEdlmFDJsrOxms0JHGF5R+jA6hNMZuYnbBqUBpI8Mdnsy30Gt0ttcjBvQm5z66wS/qHR8wIxI3Nq2w6ZvzT9MugU8AyEE1twt36c4WeUT4pClRTAVJITZ7adISxhFNmIOzfvgsMVoA==
Received: from BL1P221CA0025.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::13)
 by DS2PR12MB9797.namprd12.prod.outlook.com (2603:10b6:8:2ba::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Wed, 18 Feb
 2026 14:58:49 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:2c5:cafe::af) by BL1P221CA0025.outlook.office365.com
 (2603:10b6:208:2c5::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Wed,
 18 Feb 2026 14:58:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 14:58:48 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 06:58:30 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 06:58:30 -0800
Received: from build-bwicaksono-noble-20251018.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Wed, 18 Feb 2026 06:58:28 -0800
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <will@kernel.org>, <suzuki.poulose@arm.com>, <robin.murphy@arm.com>,
	<ilkka@os.amperecomputing.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <mark.rutland@arm.com>, <treding@nvidia.com>,
	<jonathanh@nvidia.com>, <vsethi@nvidia.com>, <rwiley@nvidia.com>,
	<sdonthineni@nvidia.com>, <skelley@nvidia.com>, <ywan@nvidia.com>,
	<mochs@nvidia.com>, <nirmoyd@nvidia.com>, Besar Wicaksono
	<bwicaksono@nvidia.com>
Subject: [PATCH v2 2/8] perf/arm_cspmu: nvidia: Add Tegra410 UCF PMU
Date: Wed, 18 Feb 2026 14:58:03 +0000
Message-ID: <20260218145809.1622856-3-bwicaksono@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|DS2PR12MB9797:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f45d962-a7a1-4a5a-38cc-08de6efe390c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tT9OzFeaqqzq7L4nJUSFkiGjtAGmzy89H1S4OXSWgMRBIURFSpoVg1uGYURf?=
 =?us-ascii?Q?P2aV5g9yPeqPVG5lZZ0354UUD+rMHoav29MNqzEvnnTWZ+gF0n9Z8mMyUg1Q?=
 =?us-ascii?Q?dHvHrUFtXSXgkrPJPoqh9JIuMg2F+tpmT9rupw8IF6/MYW2L+0KduaznIJIF?=
 =?us-ascii?Q?p2hJ5yMgTw6ZIyVcWG0tUcFC8dYx6JImlX7iogdlP68ZqiqLk4LKbV/eat+K?=
 =?us-ascii?Q?KTrLTpjnlnctXFfkWCcPMUWv2r/jYRXPbByGVq/x5rN2ZjPlSfq3GPX/CyeQ?=
 =?us-ascii?Q?k+VhuBmfuhIap4yZTzq4y22niKfWgXO7dCI+NQM/ankRgh1Xkri/UPbloNsx?=
 =?us-ascii?Q?wfWrBEZyZ5OayURUjAhTvcaNREfugetw5e8UPS0l0cR/K6L4iHB8aLQveaXE?=
 =?us-ascii?Q?ulSMGVvEXW8sRWeu7MF5PAehCnq5uPAK63AW6gk/77oyyEIwA0UCPMF+i0zt?=
 =?us-ascii?Q?j7UlxFlEAlQawTT1ifFr+sew3b1l3aI6oQMKeHqsWdLsFn+R/I9BuPaPBLVO?=
 =?us-ascii?Q?CBnaKwJP2InbY0shxFVXkIy/OZ45dhjfPXrbPk4VAGHQ6QN6Y6u8o+AeDooF?=
 =?us-ascii?Q?AiuC9bn4Dt/MrvmJN5mO7D/c3ewDFgWwwT90huoqAv/Nq6woK2jpBr9ar8rP?=
 =?us-ascii?Q?p8RPn+pwJkAmIHmphYpduh9jZZ2pmdvyQCjOhuu+tqGThIJTnF7OiICW8IFS?=
 =?us-ascii?Q?cwrSDUmqfe/zTFcktxTWAVGvW6qNY5HrMPhfLx75Te7zAmEKlFw1XyKLHpRf?=
 =?us-ascii?Q?Hj3GqufUChwNcmQAmEE3nhFY++Hq38oNuylB5VO/TgOyeK2xtoZSpb7aNazB?=
 =?us-ascii?Q?u9euFwRUCcNJ6YNeecQ2KWHTUboHnFWd7S7jz7oZwv/+vFCjYPKaWrHWOpX2?=
 =?us-ascii?Q?mK9jCHO1KX4lBKThHzBwxu0EqfJbP5qjqjQAwIgvEaCX6ulSIu4Wm/YSJJQv?=
 =?us-ascii?Q?6ECXWFsj4UdlNiKaeeKWg3FboF8lbtR9/fJPqWLtOOnmLdZcUCEaQd1ggip3?=
 =?us-ascii?Q?JL8rr9Xat+eYEX3apDLNgivWPrSLGOJ87M+RHRRPuppNFi60aPHSJDj94gIm?=
 =?us-ascii?Q?6ymR2eZ/KLeyxU0VA/7W41P3JR+AP5lU3rIZkaDvAsMaZUXBEMQdoJcwZuqc?=
 =?us-ascii?Q?iWZ9BTFqsgESjGQvD6Mlp1GDeBvUR5mc/lImq6UlaRBMRbs+PYUujVUKwx1h?=
 =?us-ascii?Q?oG8QcwgotG59JeghfWA4iNsPkwDvuz1pIpG9vUhB9/u7TcPNSGl7OUYJO0/y?=
 =?us-ascii?Q?6CsZyZKDgRkhNBKWs1DOOZ3w+XJ255vBNVcc5ZDK+rpEJ2v95pybV34giGzY?=
 =?us-ascii?Q?lKWuG2cepvhg9B0UdN3Yip2cT1/7zbjuECK3XwuieOArJm38KGbtEVExcVxv?=
 =?us-ascii?Q?zQDENDcTmKICDt78ls20z3AKmQKgTvunsFo2TiBABnAoDrmKUO2QiBc2+P1V?=
 =?us-ascii?Q?wynOryvpBcuGAhvv2n+5Kq619KDVAf/EC8Ecg9CmRgVVI2FMQaq4k9VM0hoX?=
 =?us-ascii?Q?hUN3xn3EXYXoGBPlNudEXBDvHDUurgbs6edEwj1g1YC5GwzLlFIM9dmT//Ta?=
 =?us-ascii?Q?SGWMbQ9gGCkJIPgRv5B2qI6w7BK5W4tcW/8PVlSRNEl9TIEEZKqALgxCJ/c8?=
 =?us-ascii?Q?Ca2YIYsBbeIXEYORdASd8ywgWJEG3KM6FeN5CXDxiAQhuDYEkqVg1mNcofnr?=
 =?us-ascii?Q?cJc/xg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GFeO9+XE+Gi1szSpUDt5WUG3FeLmZd3nRFBWtF5n2sjl3Eq7zg5QCbOfGy3j4oZX+WorGlvWWFKKgvJaQCZXo52E4T+StPJRT0m5nRKU1pmyoKbr9esU4hdzfvECEmltl6HDrwq1GE12kjfbw87naODsAuDjiUUWiLxQ+W499rlnHt1UtqFMH3B3/cq5giOwYgzlroLhAac10WCXKhKbLKL0ygRJCd5EEqFWOtDEzpqWUPGXB3ORau8UAKo5t9UfHu6lyjtX/KC5bfS41+GbHzTjDxiv3/dE6f0Cvk6UiKZGvvMukJst37TyhlVeIJkXRHl/QcB7X48MeDv/M4g3XxyQXquU166TAgx9GDTsRUAq8yhNrbM/pDta+t9aGIwCCxrI1PXd6Qm0wHm5MQasC3qtsFlazOMOI8HG/nYYFu1KU2AI+tHWxsdKgO+YdZWe
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 14:58:48.9217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f45d962-a7a1-4a5a-38cc-08de6efe390c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9797

The Unified Coherence Fabric (UCF) contains last level cache
and cache coherent interconnect in Tegra410 SOC. The PMU in
this device can be used to capture events related to access
to the last level cache and memory from different sources.

Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
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

