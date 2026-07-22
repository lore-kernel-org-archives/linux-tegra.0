Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010035.outbound.protection.outlook.com [52.101.201.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295B04C955D;
	Wed, 22 Jul 2026 11:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784718414; cv=fail; b=n1Qdfi+StrdClaaFBw30zic+8+v/V8+nrL8vR7xgURUp12MyDJe0tFfVBpLagcrwVTE8aaN1SFlKTWIw4bWUQasV5SSrbrolrml8KxAgXFb9dAnqxoHEAEfGT8yIJUP8XEfrx8c4Kgyq2pP66R/svbek3H329Kc6UqU6OX97Vs8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784718414; c=relaxed/simple;
	bh=7Al2LlMEsZkNQvsfOKAectWlQVzKU07w1A3KjX2pxKA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RrpABHCSFLdKT7i/+d2hVTorTbL6XkHulpSYhKO+K5xRS8lxFosYjjFO+tu6OeudviaqGPMwzXx0mbotBMdSUkKP11J9UAo7WJqf5lRF/uoXZTua+RPmyLSRa4DBBWXEOlv2ahRvkerGDVOV6lMEx9ouKYTiIS431Qf/J4JuIoM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VMEEACOy; arc=fail smtp.client-ip=52.101.201.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VMEEACOy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=amN9eaMYquSPt8z8QFe13kQZrBc63h/lqfy+jwdOx1of5wLfSaREV565zzEzt8kB656obRw6goD2cNGo0YEi57XStMwlxugltCb1IY+cGIAlKkFvV+6AQgCgVisXWd2E6eiERsoSg3syNC3eu30QpJYm6OnYKBtvd11lb49FKlY7pBw4UMBiNPzsp++fV6/z9nNHviBGwqmecUsbx2j2joyGwQKkmZ+QobY7o9FypopBTTq/ZUQ8gK7nNSPOeYxuwE1LagMdApeK7HONcPjt8zyCWyLxv6hfxPkKM4kZvgncZq2c2ioVhLqFzvRNhxhUHq4zhwbhHB8AbIHUzzjiiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxpZYMBaY1NVEA2NqTYNtS6fJwcTum4BlpH9PYj4OBs=;
 b=YLJnWNyaNBs5/FpQ0oTw860FHQRdyNecMCP5KXmzVQ5yBJwf993o5Yy0K2lj+4bKn/mDja8f9PYCEPhPcc3uN48khOgCFfk/yRCRiSnOpARv4lbfeMPy7NrIhvOHZvDeXD/Ly0E8EfKiVa6cuDAvNE3somQK++x2FYwtvnURAG6KwWBzZymjt0R/HW0CCvBU2Z/HAaKQ0nucjDCiNIIw3WTdvJzwiZmmqDpVG40utufUIeXuPLh1wf7gV3qDiAFHqrg8s/R8af3/meLJo/yBZdz8J9Apisc9x6WgG4Bt6XCQ/wItutZzG/vneTXLVEs3JgX7mBHZi/I8hHPp0wZ4Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxpZYMBaY1NVEA2NqTYNtS6fJwcTum4BlpH9PYj4OBs=;
 b=VMEEACOy6I9dWgL+x/9RodM/EFrDo4jz7Dvh2bZE++0t5L13FBaTVdmxuplejkdSk4bvxURZ8ijxeTRw+cxC2Pk0zCFYDJggEi/kqg2KD9UkrBdMcADQ5DyFWCxN+rdEQmOxOXm3NNE0F9TMHjXHC1d730bedt5/TfXrCVerzDEGLW9Za/OdQvH50WUWQSxOqCnx5JPl1FZMJwJapEVt00CB1qcj0Aa9hjX4AMaABuGKJfJYrfNFu+AQ10+dp7LNmyUpekQeiwA669Srf45tnICuW7RjfEMvc/JeZ5UAUcFuUFupfYNU9EM7T6ks1CW2Zxki/GJntQ71YS4Zux+KYg==
Received: from SJ0PR03CA0131.namprd03.prod.outlook.com (2603:10b6:a03:33c::16)
 by PH7PR12MB5710.namprd12.prod.outlook.com (2603:10b6:510:1e1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 11:06:41 +0000
Received: from CO1PEPF000066E9.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::91) by SJ0PR03CA0131.outlook.office365.com
 (2603:10b6:a03:33c::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 11:06:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000066E9.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 11:06:41 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 22 Jul
 2026 04:06:22 -0700
Received: from build-anrao-noble-20260527.internal (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 22 Jul 2026 04:06:21 -0700
From: Aniruddha Rao <anrao@nvidia.com>
To: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Aniruddha
 Rao" <anrao@nvidia.com>
Subject: [PATCH v2 5/5] firmware: tegra: bpmp: Add MBWT sysfs interface
Date: Wed, 22 Jul 2026 11:05:44 +0000
Message-ID: <20260722110544.193551-6-anrao@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722110544.193551-1-anrao@nvidia.com>
References: <20260722110544.193551-1-anrao@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E9:EE_|PH7PR12MB5710:EE_
X-MS-Office365-Filtering-Correlation-Id: 4795207d-365b-4634-dfab-08dee7e14f43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|6133799003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Pju6uf07ZevQGus3iFWABb9teuPh7Bh24Aw+93+Ucjr4+UFrC+IWjXRRZOjjtwt56g90YAbTcAyVilLvt6+QXHVZGWhYwL1ew7F6wnfFvHSSBDxWcaiii/nCPX96YbIiuPj3a8D6dvpjqaS+HNVuMPL9Y9kp32WiypLJ5wI+7Wn7B5iky+EK66da915xNnLd16koKcs8a6n/bXRaTr90JpIt/IaSPzQbPNRc0IGFAAkBexOvF41WKVCYg3AhnIdUPatKrmrj0YdcPUwu0hgb7SSlwvDfE20yPBrFX9dMdr/yiUt00L22hhn0kvPsmb96lGvXl/cArq/vfVnNWRb9RKRvKcycoNIUguh8/L55+I8V9mmdTsYAK20IblOZbaT9Tni6rvWbyh1FM/gUr7APrrxYo3HZKqhkt5KwsXMkS8hPoDn1+UkuRaHRfd170aUZPv5Zjp3c6K2ZlpFCt+kSGYWrU2gLOdVk/JBSaA/aHhSLIVwvmkX1xJH4PtY1G07S9aYiiaHewx3iMGSO+U52iF6UhzZ+CDFfSOhDON1HIdlWT7PIaEuvrqvrsyhm6neEltkCfQHwcB+8QODOVy53le9460rrzSPqRvbZQ/JKHRfY1ocWwzWZpfl1d/l8N6zwLyw81YEw6Zysvql/+CMis9BP/Bg2U2LKiBRi9Buj/LR9gA1iYQIzTSBHMKkQZHDtX6oEAGQhQooxPZh2q2nZWg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(6133799003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	tySV3liUlLzEuLa5nBSI+xSjdjL3XvnZU+hM2k4BDWeDJN19NakPoQXl5Nou7XaIJA02wCW8CFkGPsXOhOzYsGEzEIPZRQPTWt32vGDjjohy6RWiob+5FOehZgSSnTb52eOlaE20TcmJVj2Rnaun+BpAlkV/UVxgtpcm3UOKcZ6MEu+hNS4igmVnNvX+0wbIQxvpVYLmeut8AlSLkhqWHLRwvmHJNIcddi669I6qSr37oSveaCsi3ULBJakKRG1eMN3xlcW8jAou1+hYYPWMbHgk9pHV/v/wZl9iGAvhsiH7f01ubb/Qw7kNGc9sqlPMn6GZuzNj3Q6proWVDL0QrxmE11UoJnixwwZa+htiLguRWpbKsopu2GlregRbminHdEYNQaM5ODuWQ+pDVjFtw36rXarXBmDS0WxYH2PDzwpQ2y7BGNb+KrmT/mnoha/d
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 11:06:41.5287
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4795207d-365b-4634-dfab-08dee7e14f43
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5710

Different workloads can place different memory-bandwidth demands on the
system. Selecting an appropriate bandwidth limit depends on the runtime
workload mix and on the devices carrying that traffic, such as PCIe
traffic or GPU traffic connected over the chip-to-chip link (NVCLINK).
That information is not available to the kernel.

BPMP firmware of some Tegra platforms provides Memory Bandwidth
Throttler (MBWT) controls for PCIe and GPU traffic connected over
NVCLINK on the path to DRAM. Each PCIe bandwidth group has a single
shared cap for all traffic in that group. Bandwidth for a group can be
set per traffic type.

Add sysfs attributes on the tegra-bpmp platform device to expose a
narrow userspace interface for MBWT control. The attributes are arranged
as mbwt/pcie0..pcie5/pcie_read/bandwidth,
pcie_write/bandwidth and nvclink/bandwidth files. Each pcieN directory
identifies a PCIe bandwidth group and each traffic directory identifies
the traffic type.

Reading a bandwidth attribute queries firmware for the selected bandwidth
group and traffic type. Writing an integer programs the target bandwidth
cap in GB/s for that bandwidth group and traffic type.

Register the attributes only when BPMP firmware reports support for the
MBWT GET_BW and SET_BW requests through its query ABI.

Signed-off-by: Aniruddha Rao <anrao@nvidia.com>
---
Changes since v1:
- Register the interface based on MBWT firmware support, not ACPI.
- Replace the stateful tuple attribute with per-traffic bandwidth files.
- Remove software bandwidth range checks.
- Build the sysfs interface under CONFIG_SYSFS.
- Rename the registration helper to tegra_bpmp_init_sysfs().
- Avoid platform-specific or transport-specific MBWT wording.

 .../ABI/testing/sysfs-platform-tegra-bpmp     |  48 ++++
 drivers/firmware/tegra/Makefile               |   1 +
 drivers/firmware/tegra/bpmp-private.h         |   9 +
 drivers/firmware/tegra/bpmp-tegra-sysfs.c     | 205 ++++++++++++++++++
 drivers/firmware/tegra/bpmp.c                 |   4 +
 5 files changed, 267 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-tegra-bpmp
 create mode 100644 drivers/firmware/tegra/bpmp-tegra-sysfs.c

diff --git a/Documentation/ABI/testing/sysfs-platform-tegra-bpmp b/Documentation/ABI/testing/sysfs-platform-tegra-bpmp
new file mode 100644
index 000000000000..36440e696e7d
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-platform-tegra-bpmp
@@ -0,0 +1,48 @@
+What:		/sys/bus/platform/devices/<bpmp-device>/mbwt/pcie[0-5]/pcie_read/bandwidth
+What:		/sys/bus/platform/devices/<bpmp-device>/mbwt/pcie[0-5]/pcie_write/bandwidth
+What:		/sys/bus/platform/devices/<bpmp-device>/mbwt/pcie[0-5]/nvclink/bandwidth
+Date:		July 2026
+KernelVersion:	7.2
+Contact:	Aniruddha TVS Rao <anrao@nvidia.com>
+Description:
+		Provides access to Memory Bandwidth Throttler (MBWT)
+		controls exposed by BPMP firmware for PCIe traffic and GPU
+		traffic connected over the chip-to-chip link (NVCLINK) on
+		the path to DRAM.
+
+		The attributes are present only when BPMP firmware reports
+		support for the MBWT GET_BW and SET_BW requests through the
+		MBWT query ABI.
+
+		Each pcieN directory identifies one PCIe bandwidth group.
+		Each bandwidth group has a single shared cap for all traffic
+		in that group. A group may contain only PCIe devices, only a
+		GPU connected over NVCLINK, or both PCIe and GPU traffic in a
+		bifurcated topology.
+
+		The pcie_read, pcie_write and nvclink directories select the
+		traffic type for the selected group:
+
+		pcie_read
+			PCIe read traffic
+
+		pcie_write
+			PCIe write traffic
+
+		nvclink
+			GPU traffic connected over NVCLINK
+
+		Reading a bandwidth attribute returns the bandwidth cap in GB/s
+		reported by firmware for that bandwidth group and traffic
+		type.
+
+		Writing an integer to a bandwidth attribute programs the target
+		bandwidth cap in GB/s for that bandwidth group and traffic
+		type.
+
+		Examples:
+			cat .../mbwt/pcie0/pcie_write/bandwidth
+			echo 100 > .../mbwt/pcie0/pcie_write/bandwidth
+
+Users:		Platform integration and bandwidth tuning on systems with BPMP
+		firmware MBWT support.
diff --git a/drivers/firmware/tegra/Makefile b/drivers/firmware/tegra/Makefile
index 41e2e4dc31d6..59085e183fbd 100644
--- a/drivers/firmware/tegra/Makefile
+++ b/drivers/firmware/tegra/Makefile
@@ -6,5 +6,6 @@ tegra-bpmp-$(CONFIG_ARCH_TEGRA_194_SOC)	+= bpmp-tegra186.o
 tegra-bpmp-$(CONFIG_ARCH_TEGRA_234_SOC)	+= bpmp-tegra186.o
 tegra-bpmp-$(CONFIG_ARCH_TEGRA_264_SOC)	+= bpmp-tegra186.o
 tegra-bpmp-$(CONFIG_DEBUG_FS)	+= bpmp-debugfs.o
+tegra-bpmp-$(CONFIG_SYSFS)	+= bpmp-tegra-sysfs.o
 obj-$(CONFIG_TEGRA_BPMP)	+= tegra-bpmp.o
 obj-$(CONFIG_TEGRA_IVC)		+= ivc.o
diff --git a/drivers/firmware/tegra/bpmp-private.h b/drivers/firmware/tegra/bpmp-private.h
index b3770e71020e..3a15a7aa0ffc 100644
--- a/drivers/firmware/tegra/bpmp-private.h
+++ b/drivers/firmware/tegra/bpmp-private.h
@@ -33,4 +33,13 @@ int tegra_bpmp_mbwt_get(struct tegra_bpmp *bpmp, unsigned int instance,
 int tegra_bpmp_mbwt_set(struct tegra_bpmp *bpmp, unsigned int instance,
 			unsigned int vc_type, unsigned int bandwidth);
 
+#ifdef CONFIG_SYSFS
+int tegra_bpmp_init_sysfs(struct tegra_bpmp *bpmp);
+#else
+static inline int tegra_bpmp_init_sysfs(struct tegra_bpmp *bpmp)
+{
+	return 0;
+}
+#endif
+
 #endif
diff --git a/drivers/firmware/tegra/bpmp-tegra-sysfs.c b/drivers/firmware/tegra/bpmp-tegra-sysfs.c
new file mode 100644
index 000000000000..f56836fa3314
--- /dev/null
+++ b/drivers/firmware/tegra/bpmp-tegra-sysfs.c
@@ -0,0 +1,205 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026, NVIDIA CORPORATION.
+ */
+
+#include <linux/device.h>
+#include <linux/kobject.h>
+#include <linux/kstrtox.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+#include <linux/sysfs.h>
+
+#include <soc/tegra/bpmp.h>
+#include <soc/tegra/bpmp-abi.h>
+
+#include "bpmp-private.h"
+
+#define TEGRA_BPMP_MBWT_NUM_GROUPS	6
+#define TEGRA_BPMP_MBWT_NUM_VCS		3
+
+struct tegra_bpmp_mbwt_attr {
+	struct kobj_attribute attr;
+	struct tegra_bpmp_mbwt_sysfs *mbwt;
+	unsigned int instance;
+	unsigned int vc_type;
+};
+
+struct tegra_bpmp_mbwt_sysfs {
+	struct tegra_bpmp *bpmp;
+	struct kobject *root;
+	struct kobject *group[TEGRA_BPMP_MBWT_NUM_GROUPS];
+	struct kobject *vc[TEGRA_BPMP_MBWT_NUM_GROUPS]
+			  [TEGRA_BPMP_MBWT_NUM_VCS];
+	struct tegra_bpmp_mbwt_attr attrs[TEGRA_BPMP_MBWT_NUM_GROUPS]
+				       [TEGRA_BPMP_MBWT_NUM_VCS];
+	/* Serializes bandwidth requests to firmware. */
+	struct mutex lock;
+};
+
+static const char * const tegra_bpmp_mbwt_group_names[] = {
+	"pcie0", "pcie1", "pcie2", "pcie3", "pcie4", "pcie5",
+};
+
+static const char * const tegra_bpmp_mbwt_vc_names[] = {
+	"pcie_read", "pcie_write", "nvclink",
+};
+
+static struct tegra_bpmp_mbwt_attr *
+tegra_bpmp_mbwt_attr_from_kobj_attr(struct kobj_attribute *attr)
+{
+	return container_of(attr, struct tegra_bpmp_mbwt_attr, attr);
+}
+
+static ssize_t tegra_bpmp_mbwt_show(struct kobject *kobj,
+				    struct kobj_attribute *attr, char *buf)
+{
+	struct tegra_bpmp_mbwt_attr *mbwt_attr;
+	struct tegra_bpmp_mbwt_sysfs *mbwt;
+	unsigned int bandwidth;
+	int err;
+
+	mbwt_attr = tegra_bpmp_mbwt_attr_from_kobj_attr(attr);
+	mbwt = mbwt_attr->mbwt;
+
+	mutex_lock(&mbwt->lock);
+	err = tegra_bpmp_mbwt_get(mbwt->bpmp, mbwt_attr->instance,
+				  mbwt_attr->vc_type, &bandwidth);
+	mutex_unlock(&mbwt->lock);
+	if (err)
+		return err;
+
+	return sysfs_emit(buf, "%u\n", bandwidth);
+}
+
+static ssize_t tegra_bpmp_mbwt_store(struct kobject *kobj,
+				     struct kobj_attribute *attr,
+				     const char *buf, size_t count)
+{
+	struct tegra_bpmp_mbwt_attr *mbwt_attr;
+	struct tegra_bpmp_mbwt_sysfs *mbwt;
+	unsigned int bandwidth;
+	int err;
+
+	err = kstrtou32(buf, 0, &bandwidth);
+	if (err)
+		return err;
+
+	mbwt_attr = tegra_bpmp_mbwt_attr_from_kobj_attr(attr);
+	mbwt = mbwt_attr->mbwt;
+
+	mutex_lock(&mbwt->lock);
+	err = tegra_bpmp_mbwt_set(mbwt->bpmp, mbwt_attr->instance,
+				  mbwt_attr->vc_type, bandwidth);
+	mutex_unlock(&mbwt->lock);
+	if (err)
+		return err;
+
+	return count;
+}
+
+static void tegra_bpmp_mbwt_sysfs_teardown(void *data)
+{
+	struct tegra_bpmp_mbwt_sysfs *mbwt = data;
+	unsigned int i, j;
+
+	for (i = 0; i < TEGRA_BPMP_MBWT_NUM_GROUPS; i++) {
+		if (!mbwt->group[i])
+			continue;
+
+		for (j = 0; j < TEGRA_BPMP_MBWT_NUM_VCS; j++) {
+			if (!mbwt->vc[i][j])
+				continue;
+
+			sysfs_remove_file(mbwt->vc[i][j],
+					  &mbwt->attrs[i][j].attr.attr);
+			kobject_put(mbwt->vc[i][j]);
+		}
+
+		kobject_put(mbwt->group[i]);
+	}
+
+	kobject_put(mbwt->root);
+}
+
+static int tegra_bpmp_mbwt_sysfs_add_group(struct tegra_bpmp_mbwt_sysfs *mbwt,
+					   unsigned int instance)
+{
+	struct tegra_bpmp_mbwt_attr *attr;
+	unsigned int vc_type;
+	int err;
+
+	mbwt->group[instance] =
+		kobject_create_and_add(tegra_bpmp_mbwt_group_names[instance],
+				       mbwt->root);
+	if (!mbwt->group[instance])
+		return -ENOMEM;
+
+	for (vc_type = 0; vc_type < TEGRA_BPMP_MBWT_NUM_VCS; vc_type++) {
+		attr = &mbwt->attrs[instance][vc_type];
+		mbwt->vc[instance][vc_type] =
+			kobject_create_and_add(tegra_bpmp_mbwt_vc_names[vc_type],
+					       mbwt->group[instance]);
+		if (!mbwt->vc[instance][vc_type])
+			return -ENOMEM;
+
+		sysfs_attr_init(&attr->attr.attr);
+		attr->attr.attr.name = "bandwidth";
+		attr->attr.attr.mode = 0644;
+		attr->attr.show = tegra_bpmp_mbwt_show;
+		attr->attr.store = tegra_bpmp_mbwt_store;
+		attr->mbwt = mbwt;
+		attr->instance = instance;
+		attr->vc_type = vc_type;
+
+		err = sysfs_create_file(mbwt->vc[instance][vc_type],
+					&attr->attr.attr);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+int tegra_bpmp_init_sysfs(struct tegra_bpmp *bpmp)
+{
+	struct tegra_bpmp_mbwt_sysfs *mbwt;
+	unsigned int instance;
+	int err;
+
+	if (!tegra_bpmp_mrq_is_supported(bpmp, MRQ_SOCHUB_MBWT))
+		return 0;
+
+	if (!tegra_bpmp_mbwt_cmd_is_supported(bpmp, CMD_SOCHUB_MBWT_GET_BW) ||
+	    !tegra_bpmp_mbwt_cmd_is_supported(bpmp, CMD_SOCHUB_MBWT_SET_BW))
+		return 0;
+
+	mbwt = devm_kzalloc(bpmp->dev, sizeof(*mbwt), GFP_KERNEL);
+	if (!mbwt)
+		return -ENOMEM;
+
+	mbwt->bpmp = bpmp;
+	mutex_init(&mbwt->lock);
+
+	mbwt->root = kobject_create_and_add("mbwt", &bpmp->dev->kobj);
+	if (!mbwt->root)
+		return -ENOMEM;
+
+	for (instance = 0; instance < TEGRA_BPMP_MBWT_NUM_GROUPS; instance++) {
+		err = tegra_bpmp_mbwt_sysfs_add_group(mbwt, instance);
+		if (err)
+			goto remove_sysfs;
+	}
+
+	err = devm_add_action_or_reset(bpmp->dev,
+				       tegra_bpmp_mbwt_sysfs_teardown, mbwt);
+	if (err)
+		return err;
+
+	return 0;
+
+remove_sysfs:
+	tegra_bpmp_mbwt_sysfs_teardown(mbwt);
+
+	return err;
+}
diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index 2cf8490b8b2e..2074a549a009 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -1062,6 +1062,10 @@ static int tegra_bpmp_probe(struct platform_device *pdev)
 		}
 	}
 
+	err = tegra_bpmp_init_sysfs(bpmp);
+	if (err < 0)
+		dev_err(&pdev->dev, "failed to initialize sysfs: %d\n", err);
+
 	err = tegra_bpmp_init_debugfs(bpmp);
 	if (err < 0)
 		dev_err(&pdev->dev, "debugfs initialization failed: %d\n", err);
-- 
2.43.0
