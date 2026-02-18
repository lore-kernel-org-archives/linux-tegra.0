Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010030.outbound.protection.outlook.com [52.101.56.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A7033EB10;
	Wed, 18 Feb 2026 14:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771426762; cv=fail; b=QoscvO/u1XRzpCnuzFFTFijFP3gGNTjZUPFOy/MDw8Qbv8Ezc2Lf9OMSHsWRW+ArCFEPqHtxhk1RXvFuyE+1F8BeVaZmoS93bpijviKtbpvlO7VKTJ5q+Ms8vReBUjXtSZWNvTH6sgDqNaQgVYAZ85r9f8Ssq7z72EuBLtBM8FY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771426762; c=relaxed/simple;
	bh=4Zo8G2GQc+ynfprhsRlvKdXblVQagSZkucYk3iOGjYg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fnsD5oFenoZuNljUy/pLI5yxFP1j7xP1EENVZO4YqSlClpo5z/UyXLznJZphLQxM9M2YCenQJLDWwtGiMEj8tcOWypN9icLc+sqSI9CA2P2rG2TjOtEPfSNBucgKHaoFXnIQtALIgoSUDUqapYphtOSaIudTyCzB4zlSJhl7N4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MglpCu4Y; arc=fail smtp.client-ip=52.101.56.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MglpCu4Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o6kNS6OrcMsQEeJxbe+AQ+dbiyxCD5TbabKBz6rY4EyixfkuYiXgsZ7IJhV8vlLelO7MzPCfqzcPUGW95mawGBkdObOVwXB3b7loWuEBfSgErNRUgDWcqSOD4EB4PmDfFwlQv9lX8I/9JowHBdIagwj7sy4AJHxJye2x83ibRJlQS2QI+/DfqLC56aGvWKR1rH0/F2KTfRz6VWmJEt/09gLFoHryEmjzhFfRAm1oeWYFa7KdarHLMnKip82jtEtRCBtgpAzY2RSq59W4Vr648SUO+OBsZrNQYnWg63rUKczizBoRCDmQC6LAfX4QBQETfXEmrHvUpWmrLcqem0ij/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qV2kCcc12PtTJ9uINu++HCQcd9CrIBuD0QBzJqAYm1g=;
 b=yTys9FBjezbO7LtWcz87eUA0519Jp3sV1h+sm/zpRjzP8cmmDZcyLBXpV+G99VYorLjign28qa0KB6wLYLE1lTW+7hYbNPIpKjJUGaLGoGV2U44hSuJWjvMcfcxc0pLwqTJNYYnn32zp9IwFRUYveo4eFfxROAm27bo/ZddrvVlTXnv5d7E6Rup3ogeiSGeaUjlUjek1J5gu3j2Mu5riHTHR9nKeVZqxgTxj2k1mS7lEDsHgvJAlqpqN/atiVTnmW/QewYGGDt52NUYwT4VC5BMxktPgdLdDEdNLFOHz0F92rfKAu9tgUHDgh20UqW0WdDSBFherDrRxeJ/XjqjqAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qV2kCcc12PtTJ9uINu++HCQcd9CrIBuD0QBzJqAYm1g=;
 b=MglpCu4YLESs6LM4WURgjiIvXxfaoryf8icT8xM9DLaGpBPhBDvqs7JJmR/iURJf2t6Fbb6PxTgBhMTYvdOshcTL7qDhbf6WpBfiDcRl2nRvN/J0/DkoD6a+E3KExcb0v/RbHnx7stAbYxxxsJoEva9ZoE//GeKfN26wpZqkWO79Y7BNjb51FY5v2Y8qeyvCPj11vUuO5iAdbKVezboC2yj+ITJmKPG++9Iqg/oTTfFXt6A2y0xdhKYtL+UMAFYGTUMoZjkCVQNUlv1FMP8Cwt2jnUHtYiT9X6g/cQrD65Ih5kfLEthTTd+HWocJqCi4XwG5HOXFSoY+aFjQtMBcOg==
Received: from BL1PR13CA0324.namprd13.prod.outlook.com (2603:10b6:208:2c1::29)
 by IA0PPFB67404FBA.namprd12.prod.outlook.com (2603:10b6:20f:fc04::be2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Wed, 18 Feb
 2026 14:59:10 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2603:10b6:208:2c1:cafe::4) by BL1PR13CA0324.outlook.office365.com
 (2603:10b6:208:2c1::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Wed,
 18 Feb 2026 14:59:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 14:59:10 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 06:58:52 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 06:58:52 -0800
Received: from build-bwicaksono-noble-20251018.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Wed, 18 Feb 2026 06:58:50 -0800
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <will@kernel.org>, <suzuki.poulose@arm.com>, <robin.murphy@arm.com>,
	<ilkka@os.amperecomputing.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <mark.rutland@arm.com>, <treding@nvidia.com>,
	<jonathanh@nvidia.com>, <vsethi@nvidia.com>, <rwiley@nvidia.com>,
	<sdonthineni@nvidia.com>, <skelley@nvidia.com>, <ywan@nvidia.com>,
	<mochs@nvidia.com>, <nirmoyd@nvidia.com>, Besar Wicaksono
	<bwicaksono@nvidia.com>
Subject: [PATCH v2 6/8] perf: add NVIDIA Tegra410 CPU Memory Latency PMU
Date: Wed, 18 Feb 2026 14:58:07 +0000
Message-ID: <20260218145809.1622856-7-bwicaksono@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|IA0PPFB67404FBA:EE_
X-MS-Office365-Filtering-Correlation-Id: a0d2dc2d-9b2c-450c-c178-08de6efe45b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?s/lmtIs1hodYpbw6rh944egNnr1+ObnA6VMQf1Zg9yRI2uiQzYfoC1rGxXgz?=
 =?us-ascii?Q?2U7cDo26y7oyIt+B92XA77RcX1LVDb3GLMXYjqJMVniKxgJOXl8b6awMLeyv?=
 =?us-ascii?Q?RUP5mcQI8dejmz06FQQPbokAUeCLmhDSP/b8be3hW05JXQsTLxNDmllx3uny?=
 =?us-ascii?Q?G2AUaUYjXRS1UfElaDRfQxJdsLxtXsxwyVJWCCa74+41XT9X2b5w+tZFwRwX?=
 =?us-ascii?Q?BpO4cj8ojrgvoAxnhEwmFv0HyE8A70toyB7fE6jT3WySx4NIIGC/9TX9+XfU?=
 =?us-ascii?Q?7PHkmfakamApVzAEzaZPqZhBsmww5TW9qD/fzj4cZ64gjth6LMAm2RHwsWj4?=
 =?us-ascii?Q?WOb31eR8zK9BP5YtOVG8b2HB5D9cYn8gzy/Ms0z247k6aAookZ2MZuqDuK2C?=
 =?us-ascii?Q?rMjNlu51CCqDW/SApjYwsBl7ksofwiCtTpCWPJolquyxwq+SlaaJ+a6ZlPJt?=
 =?us-ascii?Q?icDn8TmlFyOCXdBvUI8SynJLhVibzSGyoMaZJBlm6741hIBcQxjxFP4Z6q6B?=
 =?us-ascii?Q?uZRm1gjErNfwHcqd2mil4e5kjlbZjInar6bjq9PySWiOibrAq/tjt18exvMB?=
 =?us-ascii?Q?m4js/jpqbFG8JN3KXJ1YgT0dhMmRwqYbi7X9DIP6RZFvB6dYgXML/D4lrMBW?=
 =?us-ascii?Q?hWRWKrIRHrZeaO+p8WRcfid0ceO0i/9C67e4fydSGGjoYE966TRRnYkiCir6?=
 =?us-ascii?Q?T+9mgSwG+4b6gH7wbCHP7yLVJsFsftze5E7MNm7CaXmay/gMQJ9cgop5Tt29?=
 =?us-ascii?Q?9L+ckmWARMK4o2KqsjF/iWXpydP75jD9SacSY+duE2SZoSxzx1QXL3FECQwG?=
 =?us-ascii?Q?MqPnYOhqRIHu6RhMaZz1D6+J8tSsvMdgoZw2ITiAOFgpiZWG8aZx9pv4+t+I?=
 =?us-ascii?Q?MLHOrJ1whUvUr/huoHTJEEaFrdzMF2CQyJP+6OQfzsHONg0ERQ2OsP3FcBTr?=
 =?us-ascii?Q?xasBTTFauOvtDM8LIGHuxFYwR5UnQB8h03Bz/OH2uneTEOXMPgJVNZF0rr2E?=
 =?us-ascii?Q?+rF8ETfFa7RgiYAb3zkkht3M096lWn1B4vn/m5hwAiep09Xl2WUcETQLUbKi?=
 =?us-ascii?Q?aAfSA1zMzgXFSbvjwTzv1Fghgfq/O39FOA9gIPTFp4xKf/0uchLGcUnmpw3h?=
 =?us-ascii?Q?f5hD9CHAbRg4ya03Ta1ouym+UzjAOPzVydOF87o6vIbKRYccqmgy/KA/vYX3?=
 =?us-ascii?Q?LYCzJPJWIhB5aADKVIR0fwXDnuPXykPKsU060kbuA3Kq1VjGfRoTQX60W5sI?=
 =?us-ascii?Q?YqNWz1MHFeneJaM+cXyfvZBPpE+PzPVGe8nRE4uHiGi2mTMv3JcUrUPGOtwB?=
 =?us-ascii?Q?EUVREQaPv4qPoBelcemgkDtACCcNEp9bKEamjprpbxjiRFBdmq4Iz1RDHEBa?=
 =?us-ascii?Q?jvCY9Yl09ox1qExwwJVuzGzaXnHFZZkNhOMkLN1Eu7tYZUzgXu4XdhmFoIuv?=
 =?us-ascii?Q?Rm7N2jaoLBrHvRHCUi1md7TuE5plWRfPS4f2ekfU/7ttLALh/jXswqrilVP2?=
 =?us-ascii?Q?cOG4dk+VRAuEkVEllTrmDrFMW/nRXwrj4GcHQMYyAs0udTYW47iJsX5oMGp2?=
 =?us-ascii?Q?ZtWnGcTj7hRsEatR5CgbNaM6t5sjYjvi2Olf9NN1bd6o3UrBucINDu+uIRvD?=
 =?us-ascii?Q?TQnyEM0kpg/RHaVc6hkFzhJJSypi+Th1bXG7iv840D5BE+fxoCJiq8/Md/Qb?=
 =?us-ascii?Q?37BzAw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yD82pJYllt+GGYR38f5skl6+CR9cGzVVZQRmiXexWCLRxElmqYmd+QAzH0tdAqBq+U/BTMCKGl750nRuZnxfp/HRm9YmZ6NAy8UFaVftPoagc51aN5yNmcKm+s7Ww0exF+1g++5BBM7sA8F7I/ZsscP92ESTkCKm8IuP7k/IZ/bxIo/5cRsNN/yZvp8TE0R4ML9WTdghEeFkOmKvGTwyyfxz4S9My5q/Z7PooRljeNKQPU0O011koobeRUsVkzSUGKmEsTUSozFb0foVN1S3KibvlhvXFBe7q/TN+E2a1+GLfiEEmGF+fZi6fzhwYZ2DotWQlN5o8yMzPysCQAJdCSIHYSEaUZ7sFuH+SAzNrckbB6b97j5b2q4I0p7Ylz0LAy3pOXa1uxVx3xcIIt/+KtzrIrhoEvlSUe4scF/+LfSsS9lM+Fcdu5KZDDaeMma7
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 14:59:10.1586
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0d2dc2d-9b2c-450c-c178-08de6efe45b4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFB67404FBA

Adds CPU Memory (CMEM) Latency PMU support in Tegra410 SOC.
The PMU is used to measure latency between the edge of the
Unified Coherence Fabric to the local system DRAM.

Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 .../admin-guide/perf/nvidia-tegra410-pmu.rst  |  25 +
 drivers/perf/Kconfig                          |   7 +
 drivers/perf/Makefile                         |   1 +
 drivers/perf/nvidia_t410_cmem_latency_pmu.c   | 727 ++++++++++++++++++
 4 files changed, 760 insertions(+)
 create mode 100644 drivers/perf/nvidia_t410_cmem_latency_pmu.c

diff --git a/Documentation/admin-guide/perf/nvidia-tegra410-pmu.rst b/Documentation/admin-guide/perf/nvidia-tegra410-pmu.rst
index 07dc447eead7..c8fbc289d12c 100644
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
+This PMU monitors latency events of memory read requests from the edge of the
+Unified Coherence Fabric (UCF) to local CPU DRAM:
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
index 638321fc9800..26e86067d8f9 100644
--- a/drivers/perf/Kconfig
+++ b/drivers/perf/Kconfig
@@ -311,4 +311,11 @@ config MARVELL_PEM_PMU
 	  Enable support for PCIe Interface performance monitoring
 	  on Marvell platform.
 
+config NVIDIA_TEGRA410_CMEM_LATENCY_PMU
+	tristate "NVIDIA Tegra410 CPU Memory Latency PMU"
+	depends on ARM64 && ACPI
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

