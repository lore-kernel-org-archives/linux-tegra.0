Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011040.outbound.protection.outlook.com [40.107.208.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D7C3D301A;
	Mon, 15 Jun 2026 08:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512697; cv=fail; b=iSb8cOFm6lGf2OLlVdz9kLHw8XG9cBEB310i+BM96oofzAiiK8oxKrxZTGZMJ+W6V5qWpvYBvCO2h9FUXzOCcmoAklYEr/odgBVt50ED1pTkmKLvS3Pfppj6HtiIaqQyt348OPwOaj31Mf2dGIe3M4w1OmV7+KNGZPk5yumrUHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512697; c=relaxed/simple;
	bh=PgW93fdnOgbdIC21Lr1OcSjzkNNanyEoBucWEk8gnhc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X2onPHQwDmTa0SMyOpNq8FJJZuOi51k9zsivmgAEa2nYZvLJXPHF3c4zi9/j3bBgp6KG2Z/97GSpJg67S3Y5ryaS7wALkWZR1WnzxNuHXZ4xb/84iqOSm4ZTrJ6aJZjSn1WFqW9bPkgIQg11ghaX1flJ9x1rtqX9E5OI2US1KUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=f8GPs/Dc; arc=fail smtp.client-ip=40.107.208.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="f8GPs/Dc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+v+NKdO6yOoZz1VdY/RhyYnjpvElmrnGxIeeox3zuzktuhsa7IpRHRZ/omLs0d7DeUdlXGweUmyWto5kdSDsrOz9jvQpMpOIqlkxdqrHHxbV5QQ9jwb7AiX6hnfRIeW/vFghdS6cXa1nl1HKUfAxzZf3mFQKglX3llFMx6tkq7AALp9UDBqmuv/T0EuFVe5oGsk6YLlqluD+ck2kPI+//ECCNoiMqf+4ZKmkNp9FTd6t18bIVTZ4laxHtxAJ6kSJItoESvSlDJIsUkCcu+aQq/l8rwms7NTei77up9C3BZLh8hMiXbfWZjt62pwKOqqp/PHQycR5PLFubbS2ldAKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lg5+8ohFemUR9O1mLgfSlHla0L8K/BP5gjx0znJws1M=;
 b=I5WE4wjYPrg1I+rezdxE0k55KXX/k4Bv7EwR15Kr5XpIFgydGfTJlwUYqygK3K9NSriF94UY+A/IDMu+bhMo3qRE96IDBFCP7JU/FQFp6ycUxqMR+9NO34ePK5RTs5h2gR7YD1eH3rXdOGcEunZTPsOnh59IEMymRrBmfuO+CAN8uI/UTFDiQ7O5kbNYZISXKR+l5qyTGtqh5FBZgzVNH+50yemCyVGeggN9wWCTe+n2LfOyM8HgxQ5yB+XuPiA4N5LVHtX2bzv/D5LsGoTp83+xG7egcn8HUACwbR0jVeiVNcZcLzx3tzfKrEr4HVBpF9EfQMvgwQRLQTaofmKwtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lg5+8ohFemUR9O1mLgfSlHla0L8K/BP5gjx0znJws1M=;
 b=f8GPs/DcbQC8S+OX9V3wM5xrgj/4QIhGe0jSEK+OCItpxhcEcyhMaDqPK+GuVRULoqPxgGnszPfJjJXBms9bNTksDp20cr4QKRtUBdjjAn885yCLEEf4ZFEmojV/TknbGLRJbiLun/QCTOuA8Vp5KjS1iP9spoX88O5IlVXGu2xsucwULrDshOrCUKAbPisHTOjWmSznP7Xhz15tEEAZL9kZOL3rGYiHZEXhH8l2575U/tSc6kDadfcCu3yrZipL/P+CL8KwYfAcZTeFEGU2Da8v3CLypLOgm8+1F3i1olEb7NvHrcQfESlZLjqj2M8QAD+xbag6/v4gd3X0uML8Pg==
Received: from MN0PR02CA0020.namprd02.prod.outlook.com (2603:10b6:208:530::31)
 by MW4PR12MB6708.namprd12.prod.outlook.com (2603:10b6:303:1ed::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 08:38:07 +0000
Received: from BN3PEPF0000B370.namprd21.prod.outlook.com
 (2603:10b6:208:530:cafe::3a) by MN0PR02CA0020.outlook.office365.com
 (2603:10b6:208:530::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Mon,
 15 Jun 2026 08:38:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B370.mail.protection.outlook.com (10.167.243.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.0 via Frontend Transport; Mon, 15 Jun 2026 08:38:06 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Jun
 2026 01:37:54 -0700
Received: from build-anrao-noble-20260527.internal (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 15 Jun 2026 01:37:53 -0700
From: Aniruddha Rao <anrao@nvidia.com>
To: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Aniruddha
 Rao" <anrao@nvidia.com>
Subject: [PATCH 6/6] firmware: tegra: bpmp: Add Tegra410 MBWT sysfs interface
Date: Mon, 15 Jun 2026 08:37:31 +0000
Message-ID: <20260615083731.888055-7-anrao@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615083731.888055-1-anrao@nvidia.com>
References: <20260615083731.888055-1-anrao@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B370:EE_|MW4PR12MB6708:EE_
X-MS-Office365-Filtering-Correlation-Id: db8077eb-253b-40d2-c94a-08decab96c7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|23010399003|1800799024|56012099006|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NOw3+2xS++FquHPYmBvgo2x6iyqxqMcmlNQzZ9/Z4ote38HpCN7wLXFFX7rv1/0yu05z2Gu4qu2pQHdiBs9hrRj10hidPkcCbMNjmgysS2NUfJyIuKsqWbQS2uX5QMiIsyVjGZszJqZI80lHf7RWIKkLhW7QbV2BwUaNs3jVQVylUQHrsYAiErGHGcKJFfVMkLvRRpq7rCDgpcYfLpniYUcohnSdtnhCJGLFAliJ2Z4DkuSF8cBW29HiMXdDp3Fc8V3B3XDodOD4U+5OrIrN4kQKN8ZSHh44WTjIoCG15dnZNyzJ4TRsrbiP+g752GnHNNFDmOjMZwBtVJsY8ADxT8lMFjTQqw6JAipFYVEzStWcG5KukeLHdS+PsllSjIbyLiKuWh7ZGyILHG8KvaCDqvqvg4hfEw4oIuTNXkbf0ElvJjnEVvkHta7U+dffariftbX7T7DoQWkxuiaW8pGcRND7wuCHgOuspE7YTpr9VenW22g/EgiaGSvSd+qTWwsNLoxZzQenEzU4QSZk1skSTLJXSPlr/+vgFD+ZTva2GTtu2GeH2zNYvfiNZx2eoEHmzMty25WgbnouRT2HOEVDksIVUKb6R+JKwBpL4y7fO/Y7RoprVlK62ngHOc90+R1kv+srTdv2JmlgU91OIx5al3nCVu8ubcRZSWuUUkp+fu0LYNu4lR8m6txRm4VPZmCoovx63Qx+kxPP8bGOXU98nrwO6ASfsQ4GTCRx2W1nI6M=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	azdbZ7GBcisG8f5hSE7C2mbphzAyqWMVxnG3JEEkASzcKEii6mgIZheLq/bewdnmyXVZ/1l8DUW9STYmyxWKV80u6q5Az3FNqHviunt87cMhEEvDn40adL/sNaotu0VkzZsERae9Aa0nGwKXKy8bN0FqBjnPojMeuMSJWo87AxSI6Zr8IDYRUTDPgpqLKcXrjR0/5GjFQpkUamKYAcMXcpXvR0/rq6sclqRZzRyg7t0Z/TfK9REoscNskGB48M7tFTW6blFFcHW9gHhz3EJYY/M9W08xGM977mz8INIcnK10QWfMgraPc2RjclLN/fUCTDfF2xKEZM5r6SRfNN3/U1rC9WCdJpwxfdzMEQv9TzYw4AaUzydMi0vbXr82NK/aVosGOQQXi3kPb+glvIe85TPYPPIHK/x7jxk8OQrW+ymnOnUxwPIJTiLeqPYrfjm8
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 08:38:06.9120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db8077eb-253b-40d2-c94a-08decab96c7a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6708

Different workloads can place different memory-bandwidth demands on the
system. Selecting an appropriate bandwidth limit depends on the runtime
workload mix and on the devices carrying that traffic, such as PCIe
devices or a GPU connected over chip-to-chip link (Nv-Clink). That
information is not available to the kernel.

Tegra410 provides Memory Bandwidth Throttler (MBWT) controls for PCIe
and GPU connected over chip-to-chip link (Nv-Clink) traffic on the path
to DRAM. Each PCIe bandwidth group has a single shared cap for all
traffic in that group. A group may contain only PCIe devices, only a GPU
over Nv-Clink, or both PCIe and GPU traffic in a bifurcated topology.
Bandwidth for a group can be set per traffic type (PCIe Read, PCIe
Write, GPU over Nv-Clink).

Add a sysfs attribute on the tegra-bpmp platform device to expose a
narrow userspace interface/tuning knob for MBWT control.

A write to the attribute accepts a comma-separated tuple of
instance,vc_type,bandwidth. The instance field identifies the PCIe
bandwidth group. The vc_type field selects PCIe read, PCIe write, or GPU
over Nv-Clink traffic for that group, and bandwidth specifies the target
bandwidth limit to program. A read from the attribute queries firmware
for each documented instance and vc_type combination and returns one
tuple per line. Reads do not depend on a previous write. If firmware
returns an error for any GET_BW request, the read fails with that error.

For example, writing 0,1,100 programs a 100 GB/s cap for PCIe write
traffic in PCIe bandwidth group 0. A subsequent read reports the
firmware-returned tuples, including the bandwidth value reported by
firmware for PCIe write traffic in group 0.

Since Tegra410 is an ACPI-only platform, register the attribute only on
ACPI systems and only when BPMP firmware reports support for the MBWT
GET_BW and SET_BW requests through its query ABI.

Signed-off-by: Aniruddha Rao <anrao@nvidia.com>
---
 .../ABI/testing/sys-platform-tegra-bpmp       |  51 +++++
 drivers/firmware/tegra/Makefile               |   1 +
 drivers/firmware/tegra/bpmp-private.h         |   2 +
 drivers/firmware/tegra/bpmp-tegra-sysfs.c     | 210 ++++++++++++++++++
 drivers/firmware/tegra/bpmp.c                 |   6 +
 5 files changed, 270 insertions(+)
 create mode 100644 Documentation/ABI/testing/sys-platform-tegra-bpmp
 create mode 100644 drivers/firmware/tegra/bpmp-tegra-sysfs.c

diff --git a/Documentation/ABI/testing/sys-platform-tegra-bpmp b/Documentation/ABI/testing/sys-platform-tegra-bpmp
new file mode 100644
index 000000000000..2c08051ac39d
--- /dev/null
+++ b/Documentation/ABI/testing/sys-platform-tegra-bpmp
@@ -0,0 +1,51 @@
+What:		/sys/bus/platform/devices/<bpmp-device>/bandwidth
+Date:		June 2026
+KernelVersion:	7.1
+Contact:	Aniruddha TVS Rao <anrao@nvidia.com>
+Description:
+		Provides access to the Tegra410 Memory Bandwidth Throttler
+		(MBWT) control exposed by BPMP firmware for PCIe and GPU
+		connected over chip-to-chip link (Nv-Clink) traffic on the
+		path to DRAM.
+
+		The attribute is present only on ACPI-based Tegra410 systems
+		and only when BPMP firmware reports support for the MBWT
+		GET_BW and SET_BW requests through its query ABI.
+
+		Each PCIe bandwidth group has a single shared cap for all
+		traffic in that group. A group may contain only PCIe devices,
+		only a GPU over Nv-Clink, or both PCIe and GPU traffic in a
+		bifurcated topology. Bandwidth for a group can be set per
+		traffic type (PCIe Read, PCIe Write, GPU over Nv-Clink).
+
+		A write accepts a comma-separated tuple of
+		"instance,vc_type,bandwidth". Spaces around comma-separated
+		fields are allowed.
+
+		instance identifies the PCIe bandwidth group. Valid values are
+		0-5, where 0 = pcie0, 1 = pcie1, ..., 5 = pcie5.
+
+		vc_type selects the traffic type for the selected group:
+		0 = PCIe read
+		1 = PCIe write
+		2 = GPU over Nv-Clink
+
+		bandwidth specifies the target bandwidth cap in GB/s. Values
+		outside 1-110 (inclusive) are rejected by the driver before
+		issuing MBWT_SET. Firmware may still reject values within
+		that range.
+
+		A read queries firmware for each documented instance and
+		vc_type combination, and returns one tuple per line. Reads
+		do not depend on a previous write. If firmware returns an
+		error for any GET_BW request, the read fails with that error.
+
+		Example:
+			echo 0,1,100 > .../bandwidth
+			cat .../bandwidth
+			0,0,100
+			0,1,100
+			...
+
+Users:		Platform integration and bandwidth tuning on ACPI-based
+		Tegra410 systems (PCIe and GPU over Nv-Clink caps).
diff --git a/drivers/firmware/tegra/Makefile b/drivers/firmware/tegra/Makefile
index 4310cc0ff294..2fd060c66523 100644
--- a/drivers/firmware/tegra/Makefile
+++ b/drivers/firmware/tegra/Makefile
@@ -5,6 +5,7 @@ tegra-bpmp-$(CONFIG_ARCH_TEGRA_186_SOC)	+= bpmp-tegra186.o
 tegra-bpmp-$(CONFIG_ARCH_TEGRA_194_SOC)	+= bpmp-tegra186.o
 tegra-bpmp-$(CONFIG_ARCH_TEGRA_234_SOC)	+= bpmp-tegra186.o
 tegra-bpmp-$(CONFIG_ARCH_TEGRA_410_SOC)	+= bpmp-tegra410.o
+tegra-bpmp-y			+= bpmp-tegra-sysfs.o
 tegra-bpmp-$(CONFIG_ARCH_TEGRA_264_SOC)	+= bpmp-tegra186.o
 tegra-bpmp-$(CONFIG_DEBUG_FS)	+= bpmp-debugfs.o
 obj-$(CONFIG_TEGRA_BPMP)	+= tegra-bpmp.o
diff --git a/drivers/firmware/tegra/bpmp-private.h b/drivers/firmware/tegra/bpmp-private.h
index c3f466ae5979..ae26cc203aa4 100644
--- a/drivers/firmware/tegra/bpmp-private.h
+++ b/drivers/firmware/tegra/bpmp-private.h
@@ -66,4 +66,6 @@ static inline bool tegra410_bpmp_mbwt_cmd_is_supported(struct tegra_bpmp *bpmp,
 }
 #endif
 
+int tegra_bpmp_sysfs_register(struct tegra_bpmp *bpmp);
+
 #endif
diff --git a/drivers/firmware/tegra/bpmp-tegra-sysfs.c b/drivers/firmware/tegra/bpmp-tegra-sysfs.c
new file mode 100644
index 000000000000..150c189ba8da
--- /dev/null
+++ b/drivers/firmware/tegra/bpmp-tegra-sysfs.c
@@ -0,0 +1,210 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026, NVIDIA CORPORATION.
+ */
+
+#include <linux/acpi.h>
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/kstrtox.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/sysfs.h>
+
+#include <soc/tegra/bpmp.h>
+#include <soc/tegra/bpmp-abi.h>
+
+#include "bpmp-private.h"
+
+/* Documented sysfs / ABI bounds; firmware may still reject a request. */
+#define TEGRA_BPMP_MBWT_INSTANCE_MAX	5U
+#define TEGRA_BPMP_MBWT_VC_MAX		2U
+#define TEGRA_BPMP_MBWT_BW_MIN		1U
+#define TEGRA_BPMP_MBWT_BW_MAX		110U
+
+struct tegra_bpmp_mbwt_sysfs {
+	struct device_attribute dev_attr;
+	struct tegra_bpmp *bpmp;
+	/* Serializes bandwidth I/O. */
+	struct mutex lock;
+};
+
+static struct tegra_bpmp_mbwt_sysfs *
+tegra_bpmp_mbwt_sysfs_from_attr(struct device_attribute *attr)
+{
+	return container_of(attr, struct tegra_bpmp_mbwt_sysfs, dev_attr);
+}
+
+static int tegra_bpmp_mbwt_valid_tuple(unsigned int instance,
+				       unsigned int vc_type,
+				       unsigned int bandwidth)
+{
+	if (instance > TEGRA_BPMP_MBWT_INSTANCE_MAX)
+		return -EINVAL;
+	if (vc_type > TEGRA_BPMP_MBWT_VC_MAX)
+		return -EINVAL;
+	if (bandwidth < TEGRA_BPMP_MBWT_BW_MIN ||
+	    bandwidth > TEGRA_BPMP_MBWT_BW_MAX)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int tegra_bpmp_mbwt_parse(const char *buf, size_t count,
+				 unsigned int *instance,
+				 unsigned int *vc_type,
+				 unsigned int *bandwidth)
+{
+	unsigned int values[3];
+	char *copy, *cur, *tok;
+	unsigned int i = 0;
+	int err = 0;
+
+	copy = kmemdup_nul(buf, count, GFP_KERNEL);
+	if (!copy)
+		return -ENOMEM;
+
+	cur = strim(copy);
+	while ((tok = strsep(&cur, ",")) != NULL) {
+		if (i >= ARRAY_SIZE(values)) {
+			err = -EINVAL;
+			goto out;
+		}
+
+		tok = strim(tok);
+		if (!*tok) {
+			err = -EINVAL;
+			goto out;
+		}
+
+		err = kstrtou32(tok, 0, &values[i]);
+		if (err)
+			goto out;
+
+		i++;
+	}
+
+	if (i != ARRAY_SIZE(values)) {
+		err = -EINVAL;
+		goto out;
+	}
+
+	*instance = values[0];
+	*vc_type = values[1];
+	*bandwidth = values[2];
+	err = 0;
+
+out:
+	kfree(copy);
+	return err;
+}
+
+static ssize_t bandwidth_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
+{
+	struct tegra_bpmp_mbwt_sysfs *mbwt;
+	unsigned int instance, vc_type, bandwidth;
+	ssize_t len = 0;
+	int err;
+
+	mbwt = tegra_bpmp_mbwt_sysfs_from_attr(attr);
+
+	mutex_lock(&mbwt->lock);
+	for (instance = 0; instance <= TEGRA_BPMP_MBWT_INSTANCE_MAX; instance++) {
+		for (vc_type = 0; vc_type <= TEGRA_BPMP_MBWT_VC_MAX; vc_type++) {
+			err = tegra410_bpmp_mbwt_get(mbwt->bpmp, instance,
+						     vc_type, &bandwidth);
+			if (err) {
+				mutex_unlock(&mbwt->lock);
+				return err;
+			}
+
+			len += sysfs_emit_at(buf, len, "%u,%u,%u\n", instance,
+					     vc_type, bandwidth);
+		}
+	}
+	mutex_unlock(&mbwt->lock);
+
+	return len;
+}
+
+static ssize_t bandwidth_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t count)
+{
+	struct tegra_bpmp_mbwt_sysfs *mbwt;
+	unsigned int instance, vc_type, bandwidth;
+	int err;
+
+	err = tegra_bpmp_mbwt_parse(buf, count, &instance, &vc_type,
+				    &bandwidth);
+	if (err)
+		return err;
+
+	err = tegra_bpmp_mbwt_valid_tuple(instance, vc_type, bandwidth);
+	if (err)
+		return err;
+
+	mbwt = tegra_bpmp_mbwt_sysfs_from_attr(attr);
+
+	mutex_lock(&mbwt->lock);
+	err = tegra410_bpmp_mbwt_set(mbwt->bpmp, instance, vc_type, bandwidth);
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
+
+	device_remove_file(mbwt->bpmp->dev, &mbwt->dev_attr);
+}
+
+int tegra_bpmp_sysfs_register(struct tegra_bpmp *bpmp)
+{
+	struct tegra_bpmp_mbwt_sysfs *mbwt;
+	int err;
+
+	if (!ACPI_HANDLE(bpmp->dev))
+		return 0;
+
+	if (!tegra_bpmp_mrq_is_supported(bpmp, MRQ_SOCHUB_MBWT))
+		return 0;
+
+	/*
+	 * MRQ_QUERY_ABI only confirms that the MBWT MRQ is implemented. The
+	 * firmware reports GET_BW / SET_BW support through the MBWT ABI query.
+	 */
+	if (!tegra410_bpmp_mbwt_cmd_is_supported(bpmp, CMD_SOCHUB_MBWT_GET_BW) ||
+	    !tegra410_bpmp_mbwt_cmd_is_supported(bpmp, CMD_SOCHUB_MBWT_SET_BW))
+		return 0;
+
+	mbwt = devm_kzalloc(bpmp->dev, sizeof(*mbwt), GFP_KERNEL);
+	if (!mbwt)
+		return -ENOMEM;
+
+	mbwt->bpmp = bpmp;
+	mutex_init(&mbwt->lock);
+
+	sysfs_attr_init(&mbwt->dev_attr.attr);
+	mbwt->dev_attr.attr.name = "bandwidth";
+	mbwt->dev_attr.attr.mode = 0644;
+	mbwt->dev_attr.show = bandwidth_show;
+	mbwt->dev_attr.store = bandwidth_store;
+
+	err = device_create_file(bpmp->dev, &mbwt->dev_attr);
+	if (err)
+		return err;
+
+	err = devm_add_action(bpmp->dev, tegra_bpmp_mbwt_sysfs_teardown, mbwt);
+	if (err) {
+		device_remove_file(bpmp->dev, &mbwt->dev_attr);
+		return err;
+	}
+
+	return 0;
+}
diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index e9c0d6d3e24d..f637bdaa57cd 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -982,6 +982,12 @@ static int tegra_bpmp_probe(struct platform_device *pdev)
 	if (err < 0)
 		goto free_mrq;
 
+	err = tegra_bpmp_sysfs_register(bpmp);
+	if (err < 0)
+		dev_err(&pdev->dev,
+			"Failed registering sysfs attribute to the BPMP platform device: %d\n",
+			err);
+
 	err = tegra_bpmp_init_debugfs(bpmp);
 	if (err < 0)
 		dev_err(&pdev->dev, "debugfs initialization failed: %d\n", err);
-- 
2.43.0

