Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012060.outbound.protection.outlook.com [52.101.48.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B06372EF0;
	Fri, 14 Aug 2026 09:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786700229; cv=fail; b=o86JzXo+5XjVEiXw4ohNS3rETwtj7MX4kfrX1jN6NrS2k6VK4Xy6JcTRM/3wCHLcNpqSPHGMqf9F9iV/PacQMKwCY8zvSkl9WYfseMSmtBoCjZy5YXvPvELxEumyWH124LrMvmBm89Fv2exFJBvYVMI5phUuZCFXnFdJluccANg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786700229; c=relaxed/simple;
	bh=6BS60n1PLX/lX3kTKV/3BIfvcKK9I7dQ/ao6A5GvpQk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sfNosvpjwqWgFc9/IR/pBe5k5VJOSm5Xy3GU5n2OSoZeFpULCVeBUfsnHzdsO6SjW2W/iIyY/0iTXZUVh7sOuETS6EmX0/vByR7Gz/aMc6Xz8vsWCi0X+pqSb5A+XodUQUs/4ruPXXiaqZeemyqyHYpfZNiR6VQja2BpitMHYng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=r2Jkuwis; arc=fail smtp.client-ip=52.101.48.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="r2Jkuwis"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uTfv+BSNCmSRNXUR0aYM2dIsIBgvYOE7/+J2cWCRf3L3HhHEFnueIV4Fm4EjpEdOH7ajDbi+ZhzvIik/cDLxSqOKn7LXtv4ewWSTxQbCwTybHj6UaF/3Oeakmdkm2zH6wwZQOseotVDaEWbEo1wBsGdywN96l+sEtxXjTpMJE2qFMMbpKHpd9fgdSa+9SoETr+AR6+o28YhpwJHZyhV6NFa3j7VOzRcoD1q/6zWXq1cowbnHYuwcDbXwXW7svmlx6JbtSk7Bc0KERNBre0tSNuY5lHbC+WsyNXdzZs6OiT3w/Xr3ixjoWYLmWSDJO7xGGB/0/G7eWovTz7C8F46bkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kq7c+7h/KE24YRiy38RLQ2TwPW2WuimjSkKBbbVL5BQ=;
 b=vjySJbLf9eqaaKcXAXSQu0ft9iL1aiX53bZJdJXqniwfpfbhK+aEbi97yF+xKrB2iUS3zQBWB3+BBBI5xyZf2xzjFCAffV9oHV29O9vpg1prfvn2d+lGTti+pbF8T9Bon01pXSlkmg6+7XoWtS6FNmcHVlzU+QeF/zxBBPYqPCOBY+HwKJJMg6I5yP4vkXo8jijZcT/gs3/f6sTIs4b9ljH6lrrly2iWQVRwkx8kbnPn1orLVIobUMqk5Ncd8eZJZ6boxxURBWMczxphEulOnXNVAUpqmAoOWTTKtoMvMw4UZTRmsWedp3dm913XfOaMzQMOZgXHL4dvwEtSI6gWmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kq7c+7h/KE24YRiy38RLQ2TwPW2WuimjSkKBbbVL5BQ=;
 b=r2JkuwisOeswFDXGm8n/XCW1IVqcQOncU7tzUrG9flCVX9rOSKm+K3A6XzHqLT7mWsPVzz4TrhbVhjnmzKkgZaq40BkzLNcFv2aWME/HJ+vgjG0jS6G37a5RhQ+vGKdcaJMMkGWrFBO7/Ej/vQKO+ywFrPcjUA79DkUjHu1BPkZJ12+q5iuCWGKpEXM2GlJrSqPIaDhICSAqKIpVwEwyw8vr/qv6tzDVfTbIgH0PbQNNFzuy0dTAw6HCrzs9wcG8VkIURPy9y0N1x0MCPZaTdZ5n587+DsCdK/Sn35ahhNjr0oE/zm7OdqQ1+UoH9V3DtSLCHpnUQt1W9CMEtSIDJQ==
Received: from DS1PR03CA0009.namprd03.prod.outlook.com (2603:10b6:8:450::15)
 by PH7PR12MB5688.namprd12.prod.outlook.com (2603:10b6:510:130::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Fri, 14 Aug
 2026 09:37:01 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:8:450:cafe::6f) by DS1PR03CA0009.outlook.office365.com
 (2603:10b6:8:450::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.16 via Frontend Transport; Fri,
 14 Aug 2026 09:37:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Fri, 14 Aug 2026 09:37:01 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Fri, 14 Aug
 2026 02:36:46 -0700
Received: from build-anrao-noble-20260527.internal (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Fri, 14 Aug 2026 02:36:45 -0700
From: Aniruddha Rao <anrao@nvidia.com>
To: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Aniruddha
 Rao" <anrao@nvidia.com>
Subject: [PATCH v3 5/5] firmware: tegra: bpmp: Add MBWT sysfs interface
Date: Fri, 14 Aug 2026 09:36:25 +0000
Message-ID: <20260814093625.1567353-6-anrao@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814093625.1567353-1-anrao@nvidia.com>
References: <20260814093625.1567353-1-anrao@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|PH7PR12MB5688:EE_
X-MS-Office365-Filtering-Correlation-Id: f799799b-9b43-4ae2-a402-08def9e797c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|82310400026|376014|56012099006|10067099003|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ybLQ/+Ge6NB030bqHwKq3O8C+qFG74TpbeCJAYcWu/7bZmBgdmk3ehy6/F+7mrhRFYg4GHsyrELS3X0WJ/Lbrr2mrrMKskSkVjdPnaFyanXgsQntGC/lfWbzpHkbvsgZpyylKw5RXdN6D+s9EdMtp8D67f49InahYW7lzUP1P5t2R5CUQOzPjweE6UDnroBsLLThJ/kKRAeQY//ZHhsaW1K37gRDvHJJTjJ2+AQl06C5o015Cv3gzVPeWuNi7mfe4CwvfiwJE0dJIfJ/lG2U5nbkqf6MByJJHwzL8Pri71eKx4Ya45R+tbq7Ve6Fcm7aYgoyCYiEm1uWsKgTlJV8utx0JRQffSh9egdMxWNOYh2IGN7fTLAbungSmqWrTK3KcFHKe1OuIO2ofEFaGJOBQ3v96H8IyKlsHtHbMvNv40TI+uykvN4yd01sUJkCc5O75jZ4dnHlbtLYDwyl5JOom9SNn364VFedEwdxNjm09QLF17+AYgRTZqqyS1vVxnfhLAGRdWOBP3VN/YxO7rjypyYFgvpA9+a2goK/StXstGtRxkoNrCcLLHAW897zzmbKVKhyBLdDELG9me1H5V/Tr2Bu0biPFESV4dG6heg1YyKYCIpUEpzD0WRW65wrTioshzo50okZ7PTSTMh2B7BkMC4ifpcHWNFFrtf34jH/tkhfoEwFIYqFBDb+rUdvLRr90LF4/9zoAnKertuZfuOQHw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(82310400026)(376014)(56012099006)(10067099003)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EVoBx9fUjWmu2jepK03ZjFxbqhhGu0T/rELsxWm47dZ8FBcAe50ZtHzt6gp71ngIdUy7Gp83/OqgXfusZTr1eqY42iJRLbLzxjGj3ql6P/9vYoJfvBY3NBkLMeS/HfEmQuxZxoyRiuTdObbKJD9GmlB3OqdPIWxgRjhxwZ/Debzyf2piYDmDO2U1gdNejNm2xZQUQgRN/DfPa3mRRAmKivWhVb62e+XYjOgXIQmGEyTyUddU+tj9oMIjuG9guBiuWd0aMjvBMaSsmm7g1nq3LmzJnLUQl/L48cXxsX4WJtBIVJU/bgl5GTvyT5pJCnF+2LoRKpuSxQfigUqGsKTZMSh6m9GK2vSTSTxV1tTmMoy8stCaj7z+IhrwGk1ykO40Ffn0FEliSGZuehdw+XyOVQ9JP3puBkOCu1EgdBs9PQxO9k/a50fm3OmFXHEFMj6y
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 09:37:01.0925
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f799799b-9b43-4ae2-a402-08def9e797c9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5688

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
Changes since v2:
- Rename bpmp-tegra-sysfs.c to bpmp-sysfs.c.

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
 drivers/firmware/tegra/bpmp-sysfs.c           | 205 ++++++++++++++++++
 drivers/firmware/tegra/bpmp.c                 |   4 +
 5 files changed, 267 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-tegra-bpmp
 create mode 100644 drivers/firmware/tegra/bpmp-sysfs.c

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
index 41e2e4dc31d6..97f7a5db9d0a 100644
--- a/drivers/firmware/tegra/Makefile
+++ b/drivers/firmware/tegra/Makefile
@@ -6,5 +6,6 @@ tegra-bpmp-$(CONFIG_ARCH_TEGRA_194_SOC)	+= bpmp-tegra186.o
 tegra-bpmp-$(CONFIG_ARCH_TEGRA_234_SOC)	+= bpmp-tegra186.o
 tegra-bpmp-$(CONFIG_ARCH_TEGRA_264_SOC)	+= bpmp-tegra186.o
 tegra-bpmp-$(CONFIG_DEBUG_FS)	+= bpmp-debugfs.o
+tegra-bpmp-$(CONFIG_SYSFS)	+= bpmp-sysfs.o
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
diff --git a/drivers/firmware/tegra/bpmp-sysfs.c b/drivers/firmware/tegra/bpmp-sysfs.c
new file mode 100644
index 000000000000..f56836fa3314
--- /dev/null
+++ b/drivers/firmware/tegra/bpmp-sysfs.c
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
index 4bfd96ba9919..0314537a2b05 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -1070,6 +1070,10 @@ static int tegra_bpmp_probe(struct platform_device *pdev)
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
