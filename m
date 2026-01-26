Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012037.outbound.protection.outlook.com [40.107.209.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4882534DB74;
	Mon, 26 Jan 2026 18:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769451206; cv=fail; b=VinCMwM9OFh6YL26ep5xKh4ttR9jiz+1QZm8UHaN+KhF8AI/uEPCHN8gVrMTwiTUfx4z1CVd7MjVZSnt7NFvP9huE6BC3KxHf4vs+Kw2wqvhUjw3q4RDXgvhUUzq63B7c1k7GC5ep3YjvoKlt+E9R1yUD4fEzuNJ6SP02tFnypc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769451206; c=relaxed/simple;
	bh=CsyNFfBgAruGVBgeQ5/cEwl/8zIWA5HevEcBEG7PSUM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r2ZVHVFBuADDtlp8VIf2HAIyfVK644xsBJBKD19e5fOLbR8h/waBW8W18NyrP7e/btUOPizVClPJV1NMuxcbvJohdp5CVQw31kCu+EIG83cOk3z9bQU4DKGN+T340Cboxz2cseMCRnaqdgzmrSfbSRHy2HTyaekPK3qfSdSu8HM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PhPeILkK; arc=fail smtp.client-ip=40.107.209.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PhPeILkK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n9wNwYPoa49uypVceXs6IZyTMfZ2S+j4qFbFfSQIljbRbnBK5pJD3BXuldbIrc/cm8AiT+sEYkoLbhUMjbGKB6jK0Cib6r8/lLzfP3awxCnE1Xwoj9ltNVXbyB5jzI2Y/ZQ6KjDr+hqjr3uxLqV3uO8AdCiyaLVbFb/CFfEP6hkmhLru0Y7+75drzVtWIFeGJptvhyAS7vvcg+zXJuWU4p8Mdheanz84RW1+Kka7/oV87XIgzbwdnzL5edFpxzMx35XFVAIOnpkCINTe1jmSEVpWGITJeolUZb7jjkdM7/B3EfN5gywfiXjRR/FhgXx1/36F9iQI/q8wJ7r0+Rlq1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=phDM8XbltrFpX9w+YFZxzBPVhd+4kZzD1GJvzOiNiio=;
 b=hnEGLwLqPQg83J4lTDQp7jWq3wy1HNeiVVd3Ul57L5MsU9Rrd2Csc9DGGb6lzQzaAMMgUuwnrk9ZMwAzzlH185fCWs3Pjwj2w5rE7Fo+GH8e/aFaM0qzzHY4Fc1h+SRLiNgdNXwASbHRot27CSEIwvAuqy1ZQCMZ4zo3IkeSO0BMStKjttzXdEfS9TvjTMubisyNQKIXxqKgxd1feBhtu/hI9MtXmRPzZdrZDmhJD+zHexAf3PNIg4g+Jxg957cPC4hTMhNT4EAN0Mfml6wLzVtEuRh+5tx9U0tVMzytwGvSA3cAWnL2bVrGMIzHbnR0rl58bbMp/LPtrlWV7tmp2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=phDM8XbltrFpX9w+YFZxzBPVhd+4kZzD1GJvzOiNiio=;
 b=PhPeILkKFOon2fXL1dz9fsUUuh+pSPjnqBMdTTH2rANc62LqbMZP5Eyw3lgEtUrwQpT8WiZhWwlkVy6ReL79hiaYAKoIgAxn30qvC5F20Xmg0pBu/0B4l+1H1Fab6gGD55Z77NM706jmXfIsyG9dLlsfmT6MLn1bk1MX+IqjCb1vtHFtFxX4raU87IBGrzZY9qvRHhNwPQtGx5ITAO2aSKYLzFXYXMPNdrlDkhZpsPek857O/3XZJhXEQ513iX8DaxAFOuq5KhQJ7lZy8hsI4rMUdxpwn3X7nYAf8xnGwgTT8avS9Dfwo/jLB1b6ZtRgXaG9nqo/SndmQt9N1Yi4rA==
Received: from BN0PR04CA0044.namprd04.prod.outlook.com (2603:10b6:408:e8::19)
 by CH2PR12MB4245.namprd12.prod.outlook.com (2603:10b6:610:af::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 18:13:13 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:408:e8:cafe::50) by BN0PR04CA0044.outlook.office365.com
 (2603:10b6:408:e8::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Mon,
 26 Jan 2026 18:13:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 18:13:13 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 26 Jan
 2026 10:12:57 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 26 Jan 2026 10:12:57 -0800
Received: from build-bwicaksono-noble-20251018.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Mon, 26 Jan 2026 10:12:57 -0800
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <will@kernel.org>, <suzuki.poulose@arm.com>, <robin.murphy@arm.com>,
	<ilkka@os.amperecomputing.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <mark.rutland@arm.com>, <treding@nvidia.com>,
	<jonathanh@nvidia.com>, <vsethi@nvidia.com>, <rwiley@nvidia.com>,
	<sdonthineni@nvidia.com>, <skelley@nvidia.com>, <ywan@nvidia.com>,
	<mochs@nvidia.com>, <nirmoyd@nvidia.com>, Besar Wicaksono
	<bwicaksono@nvidia.com>
Subject: [PATCH 6/8] perf: add NVIDIA Tegra410 CPU Memory Latency PMU
Date: Mon, 26 Jan 2026 18:11:53 +0000
Message-ID: <20260126181155.2776097-7-bwicaksono@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|CH2PR12MB4245:EE_
X-MS-Office365-Filtering-Correlation-Id: bc781cff-f7ae-4422-d914-08de5d069230
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jBjJqDGyapP3+If1fUdupev98q+RIoXbtTdqJwgzfrAolyrssjPEilQ9DFSc?=
 =?us-ascii?Q?XgwTkjlu2t9Gg7TlN22yhsGEUzfXAYSpOOAo/v8WmJcB3t29EgziirOtJPlO?=
 =?us-ascii?Q?B/FUmwp6+tiPLIDqZGRvkYVkGQCRyP4fcET0TuN91QkDV4NGR9n9aP0yckHv?=
 =?us-ascii?Q?xLeof+BDYs1LSCayg9egVlKJ5W7LNixR+BuqsxBvYjbwOw3JTCGqvhe+SE0w?=
 =?us-ascii?Q?UwnmHbPvWu4qDVCxahpQHDTkevxO0IXujHVZ1lKKHmqX8KZNOyD4RsmOqJ2H?=
 =?us-ascii?Q?WwGB3RltDlG69I1oUQLHrOWJ8+7gzIYl1UWp/5bBTkrNqLAm2Cbxe+eE+j4V?=
 =?us-ascii?Q?UURgGrXeC/jeLOPXtNQo+Oq4xroOd+QTwthbPYEYl1j+PdF66s8PPUeKyL0A?=
 =?us-ascii?Q?YqNSzgyRHz8oS6GF863LsNKJiiHeq6YnjZPnBgLZgk5DvSweJ0Lkn9ShF5Ex?=
 =?us-ascii?Q?7E7xvYTpnCpVGZ9cj46C1GIBQ7Cm+VcMMw6Ttfqg4FpoqerhPUSIquzEB/8G?=
 =?us-ascii?Q?ZHEFN5Z8cpnZfSfNdZUADfFIZY6ITOYv8fhI4es1/DSgCcxGFh/BrdKQS7yX?=
 =?us-ascii?Q?hH8nOK+aCowWQvx++mb0qpQyQlUN5TVLqKhk06Bt3Oz9o5pMWPnkw2Op+gSV?=
 =?us-ascii?Q?XLfDRGRd7dG6YJzrkqPCQFjCESFc9O9nJJ/SWxbtmr9ON+DUaVmfXT4UB92L?=
 =?us-ascii?Q?LDzNDNmMVoJY+n6W87CpAYwIeVpxx+VGO6ZDOjlBH6IuLYt/Rodp8plx8lS0?=
 =?us-ascii?Q?BxsxaABceGTRZUhUaZwdUrkkkSl9SrU9InkP6e6BqaYx3K6Zb4OAuubjdqh8?=
 =?us-ascii?Q?bIgKtRhnr/RTaikanK3yV+jtXeh21c4pLmmb8J4PhhoQn2CXavtYbKXrfl9c?=
 =?us-ascii?Q?wXLGewxqm7RNvZjNbI6jamLj4DP99JAtV3CPjW9ro9Y5PJ74ivzPYvaEg9bm?=
 =?us-ascii?Q?J28C9FE2WFqRgTMskP02lFd7LP0hGIhHudZpvqCjZYhMoJaU30ZS3sVspWOg?=
 =?us-ascii?Q?6NhfDZfLsnAf4Kelt4zdGDAsOX+8aKbSsivN7Pd+AcsmMzsT5bDrvjvmmK/v?=
 =?us-ascii?Q?w31NSSr2rEe9iRXHDHZh+LrHxxiLpcuCccih6iWqkXhLzI+K2oziMudd5oVD?=
 =?us-ascii?Q?t/yUdBBV78xzo8+3FuIdiJ38WD9lWAxAOK0bsmR7WjI5n/39h4lhHT56DBJu?=
 =?us-ascii?Q?98YGKuZ5EU3oyicHZzwl/pQX4tyY4FOfLc7uY95PXSvw2nJOfzJQXQip5930?=
 =?us-ascii?Q?6oESyGyLTfQOvQ6hSFyg36AQJVgQiihjoHCV4iiVaKJ4gmJEm66AdX4RXvyy?=
 =?us-ascii?Q?9BlpBMe6ecF/9n0rkwGeBk/tDgw/TqxRGriFzziBweGIKaKYE7iJgEpFpKvc?=
 =?us-ascii?Q?zInSDBYPLUm9rhjbMg0FZFUi/oK1O3cp7TNx4zWX8g32bCJfk9mf1nNWFHPk?=
 =?us-ascii?Q?O+sW8oC1nXW1de7k52I8/Ol2HvMTbDlns7gN2MnzR2oFo/ycyQjBJJkrnFDq?=
 =?us-ascii?Q?ilA/0VsHprmzGzI140iRBm61OmcJsn8Xlod92iaATJNxxE5OeECumif4vr0D?=
 =?us-ascii?Q?MR/hHGNwnThTTVX6cgOroA9IgOqJjvF1f4ltLgQxex0+7VvCiCZHri3DkAWq?=
 =?us-ascii?Q?zxVeL9EChjg+yTLt+NVV3pOB0FVzmKwuCEN2+vjtg3FN0LObDpwI4DJi598M?=
 =?us-ascii?Q?vVJ1AQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 18:13:13.4377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc781cff-f7ae-4422-d914-08de5d069230
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4245

Adds CPU Memory (CMEM) Latency  PMU support in Tegra410 SOC.

Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 .../admin-guide/perf/nvidia-tegra410-pmu.rst  |  25 +
 drivers/perf/Kconfig                          |   7 +
 drivers/perf/Makefile                         |   1 +
 drivers/perf/nvidia_t410_cmem_latency_pmu.c   | 727 ++++++++++++++++++
 4 files changed, 760 insertions(+)
 create mode 100644 drivers/perf/nvidia_t410_cmem_latency_pmu.c

diff --git a/Documentation/admin-guide/perf/nvidia-tegra410-pmu.rst b/Documentation/admin-guide/perf/nvidia-tegra410-pmu.rst
index 07dc447eead7..11fc1c88346a 100644
--- a/Documentation/admin-guide/perf/nvidia-tegra410-pmu.rst
+++ b/Documentation/admin-guide/perf/nvidia-tegra410-pmu.rst
@@ -8,6 +8,7 @@ metrics like memory bandwidth, latency, and utilization:
 * Unified Coherence Fabric (UCF)
 * PCIE
 * PCIE-TGT
+* CPU Memory (CMEM) Latency
 
 PMU Driver
 ----------
@@ -342,3 +343,27 @@ Example usage:
   0x10000 to 0x100FF on socket 0's PCIE RC-1::
 
     perf stat -a -e nvidia_pcie_tgt_pmu_0_rc_1/event=0x1,dst_addr_base=0x10000,dst_addr_mask=0xFFF00,dst_addr_en=0x1/
+
+CPU Memory (CMEM) Latency PMU
+-----------------------------
+
+This PMU monitors latency events of memory read requests to local
+CPU DRAM:
+
+  * RD_REQ counters: count read requests (32B per request).
+  * RD_CUM_OUTS counters: accumulated outstanding request counter, which track
+    how many cycles the read requests are in flight.
+  * CYCLES counter: counts the number of elapsed cycles.
+
+The average latency is calculated as::
+
+   FREQ_IN_GHZ = CYCLES / ELAPSED_TIME_IN_NS
+   AVG_LATENCY_IN_CYCLES = RD_CUM_OUTS / RD_REQ
+   AVERAGE_LATENCY_IN_NS = AVG_LATENCY_IN_CYCLES / FREQ_IN_GHZ
+
+The events and configuration options of this PMU device are described in sysfs,
+see /sys/bus/event_source/devices/nvidia_cmem_latency_pmu_<socket-id>.
+
+Example usage::
+
+  perf stat -a -e '{nvidia_cmem_latency_pmu_0/rd_req/,nvidia_cmem_latency_pmu_0/rd_cum_outs/,nvidia_cmem_latency_pmu_0/cycles/}'
diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
index 638321fc9800..9fed3c41d5ea 100644
--- a/drivers/perf/Kconfig
+++ b/drivers/perf/Kconfig
@@ -311,4 +311,11 @@ config MARVELL_PEM_PMU
 	  Enable support for PCIe Interface performance monitoring
 	  on Marvell platform.
 
+config NVIDIA_TEGRA410_CMEM_LATENCY_PMU
+	tristate "NVIDIA Tegra410 CPU Memory Latency PMU"
+	depends on ARM64
+	help
+	  Enable perf support for CPU memory latency counters monitoring on
+	  NVIDIA Tegra410 SoC.
+
 endmenu
diff --git a/drivers/perf/Makefile b/drivers/perf/Makefile
index ea52711a87e3..4aa6aad393c2 100644
--- a/drivers/perf/Makefile
+++ b/drivers/perf/Makefile
@@ -35,3 +35,4 @@ obj-$(CONFIG_DWC_PCIE_PMU) += dwc_pcie_pmu.o
 obj-$(CONFIG_ARM_CORESIGHT_PMU_ARCH_SYSTEM_PMU) += arm_cspmu/
 obj-$(CONFIG_MESON_DDR_PMU) += amlogic/
 obj-$(CONFIG_CXL_PMU) += cxl_pmu.o
+obj-$(CONFIG_NVIDIA_TEGRA410_CMEM_LATENCY_PMU) += nvidia_t410_cmem_latency_pmu.o
diff --git a/drivers/perf/nvidia_t410_cmem_latency_pmu.c b/drivers/perf/nvidia_t410_cmem_latency_pmu.c
new file mode 100644
index 000000000000..9b466581c8fc
--- /dev/null
+++ b/drivers/perf/nvidia_t410_cmem_latency_pmu.c
@@ -0,0 +1,727 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * NVIDIA Tegra410 CPU Memory (CMEM) Latency PMU driver.
+ *
+ * Copyright (c) 2026, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ */
+
+#include <linux/acpi.h>
+#include <linux/bitops.h>
+#include <linux/cpumask.h>
+#include <linux/device.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/perf_event.h>
+#include <linux/platform_device.h>
+
+#define NUM_INSTANCES    14
+#define BCAST(pmu) pmu->base[NUM_INSTANCES]
+
+/* Register offsets. */
+#define CG_CTRL         0x800
+#define CTRL            0x808
+#define STATUS          0x810
+#define CYCLE_CNTR      0x818
+#define MC0_REQ_CNTR    0x820
+#define MC0_AOR_CNTR    0x830
+#define MC1_REQ_CNTR    0x838
+#define MC1_AOR_CNTR    0x848
+#define MC2_REQ_CNTR    0x850
+#define MC2_AOR_CNTR    0x860
+
+/* CTRL values. */
+#define CTRL_DISABLE    0x0ULL
+#define CTRL_ENABLE     0x1ULL
+#define CTRL_CLR        0x2ULL
+
+/* CG_CTRL values. */
+#define CG_CTRL_DISABLE    0x0ULL
+#define CG_CTRL_ENABLE     0x1ULL
+
+/* STATUS register field. */
+#define STATUS_CYCLE_OVF      BIT(0)
+#define STATUS_MC0_AOR_OVF    BIT(1)
+#define STATUS_MC0_REQ_OVF    BIT(3)
+#define STATUS_MC1_AOR_OVF    BIT(4)
+#define STATUS_MC1_REQ_OVF    BIT(6)
+#define STATUS_MC2_AOR_OVF    BIT(7)
+#define STATUS_MC2_REQ_OVF    BIT(9)
+
+/* Events. */
+#define EVENT_CYCLES    0x0
+#define EVENT_REQ       0x1
+#define EVENT_AOR       0x2
+
+#define NUM_EVENTS           0x3
+#define MASK_EVENT           0x3
+#define MAX_ACTIVE_EVENTS    32
+
+#define ACTIVE_CPU_MASK        0x0
+#define ASSOCIATED_CPU_MASK    0x1
+
+static unsigned long cmem_lat_pmu_cpuhp_state;
+
+struct cmem_lat_pmu_hw_events {
+	struct perf_event *events[MAX_ACTIVE_EVENTS];
+	DECLARE_BITMAP(used_ctrs, MAX_ACTIVE_EVENTS);
+};
+
+struct cmem_lat_pmu {
+	struct pmu pmu;
+	struct device *dev;
+	const char *name;
+	const char *identifier;
+	void __iomem *base[NUM_INSTANCES + 1];
+	cpumask_t associated_cpus;
+	cpumask_t active_cpu;
+	struct hlist_node node;
+	struct cmem_lat_pmu_hw_events hw_events;
+};
+
+#define to_cmem_lat_pmu(p) \
+	container_of(p, struct cmem_lat_pmu, pmu)
+
+
+/* Get event type from perf_event. */
+static inline u32 get_event_type(struct perf_event *event)
+{
+	return (event->attr.config) & MASK_EVENT;
+}
+
+/* PMU operations. */
+static int cmem_lat_pmu_get_event_idx(struct cmem_lat_pmu_hw_events *hw_events,
+				struct perf_event *event)
+{
+	unsigned int idx;
+
+	idx = find_first_zero_bit(hw_events->used_ctrs, MAX_ACTIVE_EVENTS);
+	if (idx >= MAX_ACTIVE_EVENTS)
+		return -EAGAIN;
+
+	set_bit(idx, hw_events->used_ctrs);
+
+	return idx;
+}
+
+static bool cmem_lat_pmu_validate_event(struct pmu *pmu,
+				 struct cmem_lat_pmu_hw_events *hw_events,
+				 struct perf_event *event)
+{
+	if (is_software_event(event))
+		return true;
+
+	/* Reject groups spanning multiple HW PMUs. */
+	if (event->pmu != pmu)
+		return false;
+
+	return (cmem_lat_pmu_get_event_idx(hw_events, event) >= 0);
+}
+
+/*
+ * Make sure the group of events can be scheduled at once
+ * on the PMU.
+ */
+static bool cmem_lat_pmu_validate_group(struct perf_event *event)
+{
+	struct perf_event *sibling, *leader = event->group_leader;
+	struct cmem_lat_pmu_hw_events fake_hw_events;
+
+	if (event->group_leader == event)
+		return true;
+
+	memset(&fake_hw_events, 0, sizeof(fake_hw_events));
+
+	if (!cmem_lat_pmu_validate_event(event->pmu, &fake_hw_events, leader))
+		return false;
+
+	for_each_sibling_event(sibling, leader) {
+		if (!cmem_lat_pmu_validate_event(event->pmu, &fake_hw_events,
+						sibling))
+			return false;
+	}
+
+	return cmem_lat_pmu_validate_event(event->pmu, &fake_hw_events, event);
+}
+
+static int cmem_lat_pmu_event_init(struct perf_event *event)
+{
+	struct cmem_lat_pmu *cmem_lat_pmu = to_cmem_lat_pmu(event->pmu);
+	struct hw_perf_event *hwc = &event->hw;
+	u32 event_type = get_event_type(event);
+
+	if (event->attr.type != event->pmu->type ||
+	    event_type >= NUM_EVENTS)
+		return -ENOENT;
+
+	/*
+	 * Following other "uncore" PMUs, we do not support sampling mode or
+	 * attach to a task (per-process mode).
+	 */
+	if (is_sampling_event(event)) {
+		dev_dbg(cmem_lat_pmu->pmu.dev,
+			"Can't support sampling events\n");
+		return -EOPNOTSUPP;
+	}
+
+	if (event->cpu < 0 || event->attach_state & PERF_ATTACH_TASK) {
+		dev_dbg(cmem_lat_pmu->pmu.dev,
+			"Can't support per-task counters\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * Make sure the CPU assignment is on one of the CPUs associated with
+	 * this PMU.
+	 */
+	if (!cpumask_test_cpu(event->cpu, &cmem_lat_pmu->associated_cpus)) {
+		dev_dbg(cmem_lat_pmu->pmu.dev,
+			"Requested cpu is not associated with the PMU\n");
+		return -EINVAL;
+	}
+
+	/* Enforce the current active CPU to handle the events in this PMU. */
+	event->cpu = cpumask_first(&cmem_lat_pmu->active_cpu);
+	if (event->cpu >= nr_cpu_ids)
+		return -EINVAL;
+
+	if (!cmem_lat_pmu_validate_group(event))
+		return -EINVAL;
+
+	hwc->idx = -1;
+	hwc->config = event_type;
+
+	return 0;
+}
+
+static u64 cmem_lat_pmu_read_status(struct cmem_lat_pmu *cmem_lat_pmu,
+				   unsigned int inst)
+{
+	return readq(cmem_lat_pmu->base[inst] + STATUS);
+}
+
+static u64 cmem_lat_pmu_read_cycle_counter(struct perf_event *event)
+{
+	const unsigned int instance = 0;
+	u64 status;
+	struct cmem_lat_pmu *cmem_lat_pmu = to_cmem_lat_pmu(event->pmu);
+	struct device *dev = cmem_lat_pmu->dev;
+
+	/*
+	 * Use the reading from first instance since all instances are
+	 * identical.
+	 */
+	status = cmem_lat_pmu_read_status(cmem_lat_pmu, instance);
+	if (status & STATUS_CYCLE_OVF)
+		dev_warn(dev, "Cycle counter overflow\n");
+
+	return readq(cmem_lat_pmu->base[instance] + CYCLE_CNTR);
+}
+
+static u64 cmem_lat_pmu_read_req_counter(struct perf_event *event)
+{
+	unsigned int i;
+	u64 status, val = 0;
+	struct cmem_lat_pmu *cmem_lat_pmu = to_cmem_lat_pmu(event->pmu);
+	struct device *dev = cmem_lat_pmu->dev;
+
+	/* Sum up the counts from all instances. */
+	for (i = 0; i < NUM_INSTANCES; i++) {
+		status = cmem_lat_pmu_read_status(cmem_lat_pmu, i);
+		if (status & STATUS_MC0_REQ_OVF)
+			dev_warn(dev, "MC0 request counter overflow\n");
+		if (status & STATUS_MC1_REQ_OVF)
+			dev_warn(dev, "MC1 request counter overflow\n");
+		if (status & STATUS_MC2_REQ_OVF)
+			dev_warn(dev, "MC2 request counter overflow\n");
+
+		val += readq(cmem_lat_pmu->base[i] + MC0_REQ_CNTR);
+		val += readq(cmem_lat_pmu->base[i] + MC1_REQ_CNTR);
+		val += readq(cmem_lat_pmu->base[i] + MC2_REQ_CNTR);
+	}
+
+	return val;
+}
+
+static u64 cmem_lat_pmu_read_aor_counter(struct perf_event *event)
+{
+	unsigned int i;
+	u64 status, val = 0;
+	struct cmem_lat_pmu *cmem_lat_pmu = to_cmem_lat_pmu(event->pmu);
+	struct device *dev = cmem_lat_pmu->dev;
+
+	/* Sum up the counts from all instances. */
+	for (i = 0; i < NUM_INSTANCES; i++) {
+		status = cmem_lat_pmu_read_status(cmem_lat_pmu, i);
+		if (status & STATUS_MC0_AOR_OVF)
+			dev_warn(dev, "MC0 AOR counter overflow\n");
+		if (status & STATUS_MC1_AOR_OVF)
+			dev_warn(dev, "MC1 AOR counter overflow\n");
+		if (status & STATUS_MC2_AOR_OVF)
+			dev_warn(dev, "MC2 AOR counter overflow\n");
+
+		val += readq(cmem_lat_pmu->base[i] + MC0_AOR_CNTR);
+		val += readq(cmem_lat_pmu->base[i] + MC1_AOR_CNTR);
+		val += readq(cmem_lat_pmu->base[i] + MC2_AOR_CNTR);
+	}
+
+	return val;
+}
+
+static u64 (*read_counter_fn[NUM_EVENTS])(struct perf_event *) = {
+	[EVENT_CYCLES] = cmem_lat_pmu_read_cycle_counter,
+	[EVENT_REQ] = cmem_lat_pmu_read_req_counter,
+	[EVENT_AOR] = cmem_lat_pmu_read_aor_counter,
+};
+
+static void cmem_lat_pmu_event_update(struct perf_event *event)
+{
+	u32 event_type;
+	u64 prev, now;
+	struct hw_perf_event *hwc = &event->hw;
+
+	if (hwc->state & PERF_HES_STOPPED)
+		return;
+
+	event_type = hwc->config;
+
+	do {
+		prev = local64_read(&hwc->prev_count);
+		now = read_counter_fn[event_type](event);
+	} while (local64_cmpxchg(&hwc->prev_count, prev, now) != prev);
+
+	local64_add(now - prev, &event->count);
+
+	hwc->state |= PERF_HES_UPTODATE;
+}
+
+static void cmem_lat_pmu_start(struct perf_event *event, int pmu_flags)
+{
+	event->hw.state = 0;
+}
+
+static void cmem_lat_pmu_stop(struct perf_event *event, int pmu_flags)
+{
+	event->hw.state |= PERF_HES_STOPPED;
+}
+
+static int cmem_lat_pmu_add(struct perf_event *event, int flags)
+{
+	struct cmem_lat_pmu *cmem_lat_pmu = to_cmem_lat_pmu(event->pmu);
+	struct cmem_lat_pmu_hw_events *hw_events = &cmem_lat_pmu->hw_events;
+	struct hw_perf_event *hwc = &event->hw;
+	int idx;
+
+	if (WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(),
+					   &cmem_lat_pmu->associated_cpus)))
+		return -ENOENT;
+
+	idx = cmem_lat_pmu_get_event_idx(hw_events, event);
+	if (idx < 0)
+		return idx;
+
+	hw_events->events[idx] = event;
+	hwc->idx = idx;
+	hwc->state = PERF_HES_STOPPED | PERF_HES_UPTODATE;
+
+	if (flags & PERF_EF_START)
+		cmem_lat_pmu_start(event, PERF_EF_RELOAD);
+
+	/* Propagate changes to the userspace mapping. */
+	perf_event_update_userpage(event);
+
+	return 0;
+}
+
+static void cmem_lat_pmu_del(struct perf_event *event, int flags)
+{
+	struct cmem_lat_pmu *cmem_lat_pmu = to_cmem_lat_pmu(event->pmu);
+	struct cmem_lat_pmu_hw_events *hw_events = &cmem_lat_pmu->hw_events;
+	struct hw_perf_event *hwc = &event->hw;
+	int idx = hwc->idx;
+
+	cmem_lat_pmu_stop(event, PERF_EF_UPDATE);
+
+	hw_events->events[idx] = NULL;
+
+	clear_bit(idx, hw_events->used_ctrs);
+
+	perf_event_update_userpage(event);
+}
+
+static void cmem_lat_pmu_read(struct perf_event *event)
+{
+	cmem_lat_pmu_event_update(event);
+}
+
+static inline void cmem_lat_pmu_cg_ctrl(struct cmem_lat_pmu *cmem_lat_pmu, u64 val)
+{
+	writeq(val, BCAST(cmem_lat_pmu) + CG_CTRL);
+}
+
+static inline void cmem_lat_pmu_ctrl(struct cmem_lat_pmu *cmem_lat_pmu, u64 val)
+{
+	writeq(val, BCAST(cmem_lat_pmu) + CTRL);
+}
+
+static void cmem_lat_pmu_enable(struct pmu *pmu)
+{
+	bool disabled;
+	struct cmem_lat_pmu *cmem_lat_pmu = to_cmem_lat_pmu(pmu);
+
+	disabled = bitmap_empty(
+		cmem_lat_pmu->hw_events.used_ctrs, MAX_ACTIVE_EVENTS);
+
+	if (disabled)
+		return;
+
+	/* Enable all the counters. */
+	cmem_lat_pmu_cg_ctrl(cmem_lat_pmu, CG_CTRL_ENABLE);
+	cmem_lat_pmu_ctrl(cmem_lat_pmu, CTRL_ENABLE);
+}
+
+static void cmem_lat_pmu_disable(struct pmu *pmu)
+{
+	int idx;
+	struct perf_event *event;
+	struct cmem_lat_pmu *cmem_lat_pmu = to_cmem_lat_pmu(pmu);
+
+	/* Disable all the counters. */
+	cmem_lat_pmu_ctrl(cmem_lat_pmu, CTRL_DISABLE);
+
+	/*
+	 * The counters will start from 0 again on restart.
+	 * Update the events immediately to avoid losing the counts.
+	 */
+	for_each_set_bit(
+		idx, cmem_lat_pmu->hw_events.used_ctrs, MAX_ACTIVE_EVENTS) {
+		event = cmem_lat_pmu->hw_events.events[idx];
+
+		if (!event)
+			continue;
+
+		cmem_lat_pmu_event_update(event);
+
+		local64_set(&event->hw.prev_count, 0ULL);
+	}
+
+	cmem_lat_pmu_ctrl(cmem_lat_pmu, CTRL_CLR);
+	cmem_lat_pmu_cg_ctrl(cmem_lat_pmu, CG_CTRL_DISABLE);
+}
+
+/* PMU identifier attribute. */
+
+static ssize_t cmem_lat_pmu_identifier_show(struct device *dev,
+					 struct device_attribute *attr,
+					 char *page)
+{
+	struct cmem_lat_pmu *cmem_lat_pmu = to_cmem_lat_pmu(dev_get_drvdata(dev));
+
+	return sysfs_emit(page, "%s\n", cmem_lat_pmu->identifier);
+}
+
+static struct device_attribute cmem_lat_pmu_identifier_attr =
+	__ATTR(identifier, 0444, cmem_lat_pmu_identifier_show, NULL);
+
+static struct attribute *cmem_lat_pmu_identifier_attrs[] = {
+	&cmem_lat_pmu_identifier_attr.attr,
+	NULL,
+};
+
+static struct attribute_group cmem_lat_pmu_identifier_attr_group = {
+	.attrs = cmem_lat_pmu_identifier_attrs,
+};
+
+/* Format attributes. */
+
+#define NV_PMU_EXT_ATTR(_name, _func, _config)			\
+	(&((struct dev_ext_attribute[]){				\
+		{							\
+			.attr = __ATTR(_name, 0444, _func, NULL),	\
+			.var = (void *)_config				\
+		}							\
+	})[0].attr.attr)
+
+static struct attribute *cmem_lat_pmu_formats[] = {
+	NV_PMU_EXT_ATTR(event, device_show_string, "config:0-1"),
+	NULL,
+};
+
+static const struct attribute_group cmem_lat_pmu_format_group = {
+	.name = "format",
+	.attrs = cmem_lat_pmu_formats,
+};
+
+/* Event attributes. */
+
+static ssize_t cmem_lat_pmu_sysfs_event_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct perf_pmu_events_attr *pmu_attr;
+
+	pmu_attr = container_of(attr, typeof(*pmu_attr), attr);
+	return sysfs_emit(buf, "event=0x%llx\n", pmu_attr->id);
+}
+
+#define NV_PMU_EVENT_ATTR(_name, _config)	\
+	PMU_EVENT_ATTR_ID(_name, cmem_lat_pmu_sysfs_event_show, _config)
+
+static struct attribute *cmem_lat_pmu_events[] = {
+	NV_PMU_EVENT_ATTR(cycles, EVENT_CYCLES),
+	NV_PMU_EVENT_ATTR(rd_req, EVENT_REQ),
+	NV_PMU_EVENT_ATTR(rd_cum_outs, EVENT_AOR),
+	NULL
+};
+
+static const struct attribute_group cmem_lat_pmu_events_group = {
+	.name = "events",
+	.attrs = cmem_lat_pmu_events,
+};
+
+/* Cpumask attributes. */
+
+static ssize_t cmem_lat_pmu_cpumask_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	struct pmu *pmu = dev_get_drvdata(dev);
+	struct cmem_lat_pmu *cmem_lat_pmu = to_cmem_lat_pmu(pmu);
+	struct dev_ext_attribute *eattr =
+		container_of(attr, struct dev_ext_attribute, attr);
+	unsigned long mask_id = (unsigned long)eattr->var;
+	const cpumask_t *cpumask;
+
+	switch (mask_id) {
+	case ACTIVE_CPU_MASK:
+		cpumask = &cmem_lat_pmu->active_cpu;
+		break;
+	case ASSOCIATED_CPU_MASK:
+		cpumask = &cmem_lat_pmu->associated_cpus;
+		break;
+	default:
+		return 0;
+	}
+	return cpumap_print_to_pagebuf(true, buf, cpumask);
+}
+
+#define NV_PMU_CPUMASK_ATTR(_name, _config)			\
+	NV_PMU_EXT_ATTR(_name, cmem_lat_pmu_cpumask_show,	\
+				(unsigned long)_config)
+
+static struct attribute *cmem_lat_pmu_cpumask_attrs[] = {
+	NV_PMU_CPUMASK_ATTR(cpumask, ACTIVE_CPU_MASK),
+	NV_PMU_CPUMASK_ATTR(associated_cpus, ASSOCIATED_CPU_MASK),
+	NULL,
+};
+
+static const struct attribute_group cmem_lat_pmu_cpumask_attr_group = {
+	.attrs = cmem_lat_pmu_cpumask_attrs,
+};
+
+/* Per PMU device attribute groups. */
+
+static const struct attribute_group *cmem_lat_pmu_attr_groups[] = {
+	&cmem_lat_pmu_identifier_attr_group,
+	&cmem_lat_pmu_format_group,
+	&cmem_lat_pmu_events_group,
+	&cmem_lat_pmu_cpumask_attr_group,
+	NULL,
+};
+
+static int cmem_lat_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
+{
+	struct cmem_lat_pmu *cmem_lat_pmu =
+		hlist_entry_safe(node, struct cmem_lat_pmu, node);
+
+	if (!cpumask_test_cpu(cpu, &cmem_lat_pmu->associated_cpus))
+		return 0;
+
+	/* If the PMU is already managed, there is nothing to do */
+	if (!cpumask_empty(&cmem_lat_pmu->active_cpu))
+		return 0;
+
+	/* Use this CPU for event counting */
+	cpumask_set_cpu(cpu, &cmem_lat_pmu->active_cpu);
+
+	return 0;
+}
+
+static int cmem_lat_pmu_cpu_teardown(unsigned int cpu, struct hlist_node *node)
+{
+	unsigned int dst;
+
+	struct cmem_lat_pmu *cmem_lat_pmu =
+		hlist_entry_safe(node, struct cmem_lat_pmu, node);
+
+	/* Nothing to do if this CPU doesn't own the PMU */
+	if (!cpumask_test_and_clear_cpu(cpu, &cmem_lat_pmu->active_cpu))
+		return 0;
+
+	/* Choose a new CPU to migrate ownership of the PMU to */
+	dst = cpumask_any_and_but(&cmem_lat_pmu->associated_cpus,
+				  cpu_online_mask, cpu);
+	if (dst >= nr_cpu_ids)
+		return 0;
+
+	/* Use this CPU for event counting */
+	perf_pmu_migrate_context(&cmem_lat_pmu->pmu, cpu, dst);
+	cpumask_set_cpu(dst, &cmem_lat_pmu->active_cpu);
+
+	return 0;
+}
+
+static int cmem_lat_pmu_get_cpus(struct cmem_lat_pmu *cmem_lat_pmu,
+				unsigned int socket)
+{
+	int ret = 0, cpu;
+
+	for_each_possible_cpu(cpu) {
+		if (cpu_to_node(cpu) == socket)
+			cpumask_set_cpu(cpu, &cmem_lat_pmu->associated_cpus);
+	}
+
+	if (cpumask_empty(&cmem_lat_pmu->associated_cpus)) {
+		dev_dbg(cmem_lat_pmu->dev,
+			"No cpu associated with PMU socket-%u\n", socket);
+		ret = -ENODEV;
+	}
+
+	return ret;
+}
+
+static int cmem_lat_pmu_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct acpi_device *acpi_dev;
+	struct cmem_lat_pmu *cmem_lat_pmu;
+	char *name, *uid_str;
+	int ret, i;
+	u32 socket;
+
+	acpi_dev = ACPI_COMPANION(dev);
+	if (!acpi_dev)
+		return -ENODEV;
+
+	uid_str = acpi_device_uid(acpi_dev);
+	if (!uid_str)
+		return -ENODEV;
+
+	ret = kstrtou32(uid_str, 0, &socket);
+	if (ret)
+		return ret;
+
+	cmem_lat_pmu = devm_kzalloc(dev, sizeof(*cmem_lat_pmu), GFP_KERNEL);
+	name = devm_kasprintf(dev, GFP_KERNEL, "nvidia_cmem_latency_pmu_%u", socket);
+	if (!cmem_lat_pmu || !name)
+		return -ENOMEM;
+
+	cmem_lat_pmu->dev = dev;
+	cmem_lat_pmu->name = name;
+	cmem_lat_pmu->identifier = acpi_device_hid(acpi_dev);
+	platform_set_drvdata(pdev, cmem_lat_pmu);
+
+	cmem_lat_pmu->pmu = (struct pmu) {
+		.parent		= &pdev->dev,
+		.task_ctx_nr	= perf_invalid_context,
+		.pmu_enable	= cmem_lat_pmu_enable,
+		.pmu_disable	= cmem_lat_pmu_disable,
+		.event_init	= cmem_lat_pmu_event_init,
+		.add		= cmem_lat_pmu_add,
+		.del		= cmem_lat_pmu_del,
+		.start		= cmem_lat_pmu_start,
+		.stop		= cmem_lat_pmu_stop,
+		.read		= cmem_lat_pmu_read,
+		.attr_groups	= cmem_lat_pmu_attr_groups,
+		.capabilities	= PERF_PMU_CAP_NO_EXCLUDE |
+					PERF_PMU_CAP_NO_INTERRUPT,
+	};
+
+	/* Map the address of all the instances plus one for the broadcast. */
+	for (i = 0; i < NUM_INSTANCES + 1; i++) {
+		cmem_lat_pmu->base[i] = devm_platform_ioremap_resource(pdev, i);
+		if (IS_ERR(cmem_lat_pmu->base[i])) {
+			dev_err(dev, "Failed map address for instance %d\n", i);
+			return PTR_ERR(cmem_lat_pmu->base[i]);
+		}
+	}
+
+	ret = cmem_lat_pmu_get_cpus(cmem_lat_pmu, socket);
+	if (ret)
+		return ret;
+
+	ret = cpuhp_state_add_instance(cmem_lat_pmu_cpuhp_state,
+				       &cmem_lat_pmu->node);
+	if (ret) {
+		dev_err(&pdev->dev, "Error %d registering hotplug\n", ret);
+		return ret;
+	}
+
+	cmem_lat_pmu_cg_ctrl(cmem_lat_pmu, CG_CTRL_ENABLE);
+	cmem_lat_pmu_ctrl(cmem_lat_pmu, CTRL_CLR);
+	cmem_lat_pmu_cg_ctrl(cmem_lat_pmu, CG_CTRL_DISABLE);
+
+	ret = perf_pmu_register(&cmem_lat_pmu->pmu, name, -1);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register PMU: %d\n", ret);
+		cpuhp_state_remove_instance(cmem_lat_pmu_cpuhp_state,
+					    &cmem_lat_pmu->node);
+		return ret;
+	}
+
+	dev_dbg(&pdev->dev, "Registered %s PMU\n", name);
+
+	return 0;
+}
+
+static void cmem_lat_pmu_device_remove(struct platform_device *pdev)
+{
+	struct cmem_lat_pmu *cmem_lat_pmu = platform_get_drvdata(pdev);
+
+	perf_pmu_unregister(&cmem_lat_pmu->pmu);
+	cpuhp_state_remove_instance(cmem_lat_pmu_cpuhp_state,
+				    &cmem_lat_pmu->node);
+}
+
+static const struct acpi_device_id cmem_lat_pmu_acpi_match[] = {
+	{ "NVDA2021", },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, cmem_lat_pmu_acpi_match);
+
+static struct platform_driver cmem_lat_pmu_driver = {
+	.driver = {
+		.name = "nvidia-t410-cmem-latency-pmu",
+		.acpi_match_table = ACPI_PTR(cmem_lat_pmu_acpi_match),
+		.suppress_bind_attrs = true,
+	},
+	.probe = cmem_lat_pmu_probe,
+	.remove = cmem_lat_pmu_device_remove,
+};
+
+static int __init cmem_lat_pmu_init(void)
+{
+	int ret;
+
+	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
+				      "perf/nvidia/cmem_latency:online",
+				      cmem_lat_pmu_cpu_online,
+				      cmem_lat_pmu_cpu_teardown);
+	if (ret < 0)
+		return ret;
+
+	cmem_lat_pmu_cpuhp_state = ret;
+
+	return platform_driver_register(&cmem_lat_pmu_driver);
+}
+
+static void __exit cmem_lat_pmu_exit(void)
+{
+	platform_driver_unregister(&cmem_lat_pmu_driver);
+	cpuhp_remove_multi_state(cmem_lat_pmu_cpuhp_state);
+}
+
+module_init(cmem_lat_pmu_init);
+module_exit(cmem_lat_pmu_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("NVIDIA Tegra410 CPU Memory Latency PMU driver");
+MODULE_AUTHOR("Besar Wicaksono <bwicaksono@nvidia.com>");
-- 
2.43.0

