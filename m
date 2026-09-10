Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011034.outbound.protection.outlook.com [52.101.57.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262053DAACF;
	Thu, 10 Sep 2026 09:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030820; cv=fail; b=oJ17xsQKf/kb+lTbFnbPWYKUpjU8L6Y8TUFoShgiDL4tlu/bNnk7FUbcRJxVrNFAtNExFso/e6xcsC8oBBKR0kzHSVUMhnndhizly8gbMV+wZK0CtuoHntzlIzh6zKzxEywqSiiePZW8qnTV8POCgA7oxmonwYXsN/F38su71vs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030820; c=relaxed/simple;
	bh=GoEOZcHwdVo+xqTvn4xNsnF1Bd5EjidOK1bpUM3Xw4E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hm19IjGaw4Kid5TEz9y2TiqYWxHhvi1GxMmjTkEsvnJ+PJsCSYyGkk5OIxi+ARvhicmFeUITxOjySOVGNHaGeLzzRZRqAKR3IAOnvfxZbf7KEo+nsrpsfvtZxAwgHkeYuCXUWkKGQydUbcvB/IIm4x8ivy0+/MSLNrXeExVgVQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nK4hE86E; arc=fail smtp.client-ip=52.101.57.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nK4hE86E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vW51KhZ07GVxpYN+bzGlm2W7JGprzQDyZucpPOeCjg30G/mfELPak2SZjTGCWsktDPZ35EQa1F+o23ylQeLPwcjzwjAeAWdxRocH+zrizBaC7sa2Jo/k2jB2KmWyK+SGzNsSJiuBtOEh+kmwDWcwRRfxfxq1B1biBKcXMw6dVgymQ0WUy5+SMbZZWB3ixyJi5dKsd3L+/OU7+id8ml1kOZ3ARGspOOGOhONuvX+mPivjeTlH41dkzC3m+ozXVWIplJZnbOe6n5U7SJzujBqXeZMvQX6mUMzsxvR70oFamS563mil/zKEvXazijtGiWpk+IfSz6YYK6K0S8RPBY9zkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SQshqhDmt7ISI/C/v1K9YeziwuFr4ycejSvxCIYXvuQ=;
 b=TYY0xIJF85KrrzwRVvB0B/opQGGT6fqjX9zpG/F8GoVjiWXH1IhFPUrE2FFXNK7fGXb+MULRtH0zSkaBzmqfRGnfqEsf6u5pDL8eh83yiHM7uvJeE02GLzh+AFqqpwoaBATJiiHIZn0coIgdAYbg4xqL7lzOrAJU9NOt5sLRz8+LqA+IFtZi4xK87nr1UAT4n9xGKn/zvr5jUlCFnZyhYl5o3Pwmsc4xcnWWdPXzyQ/7hSuHLZ5+wIR7PASTEdiy0krWKboxWPi3UBRXJ3r+H63YOzAjtlsWvxZu3F2aTTIpZXUHv1Et0uGN0tecQEo/JmyQhMS6BkDoXSYR3ZkOCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SQshqhDmt7ISI/C/v1K9YeziwuFr4ycejSvxCIYXvuQ=;
 b=nK4hE86ElIMm5G+iQuWMtmEBvSxm0ci1rhvluS9x+XFgnLqTrbTRo4gglXSD0nWI1e22weauxV0ogNFznMlh4tK60fexUicDyJceDmSe6kOncB0y0rZJvVWXvDo/tFo6CWejYernJjG0rELb4BffgnfSLKQememQEhfIbr92FIgAS/jiXvnsxWJVhP5+w6OnWfCMtiKX+Neg961FxnjUb8NoqNukFrsdO6Pbe6cziD7AXJ9PDf16SPrxF4r9SJTDKUo+x0MToSvOyhMzKg4su3SyHcglgl1248DD3t7/+KvYKCaZKoJhH5Wc9y8apUKki/EqBgC1OvYFuNbIR7Pm8A==
Received: from DS1PR04CA0027.namprd04.prod.outlook.com (2603:10b6:8:243::7) by
 MN6PR12MB8472.namprd12.prod.outlook.com (2603:10b6:208:46c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 08:59:55 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:8:243:cafe::b) by DS1PR04CA0027.outlook.office365.com
 (2603:10b6:8:243::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Thu, 10
 Sep 2026 08:59:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 08:59:54 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 01:59:40 -0700
Received: from build-anrao-noble-20260906.internal (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 01:59:39 -0700
From: Aniruddha Rao <anrao@nvidia.com>
To: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Aniruddha
 Rao" <anrao@nvidia.com>
Subject: [PATCH v4 5/5] firmware: tegra: bpmp: Add MBWT sysfs interface
Date: Thu, 10 Sep 2026 08:59:19 +0000
Message-ID: <20260910085919.2522241-6-anrao@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910085919.2522241-1-anrao@nvidia.com>
References: <20260910085919.2522241-1-anrao@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|MN6PR12MB8472:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ad0cafd-7b03-41c5-ef96-08df0f19e1e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|23010399003|36860700016|6133799003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8+Oaa/3R7T+kLZkcAhwOY321NwUZuP9aWr/RiRdHF3u2LdhXUKQifc94yM2TIN5gU9CXDYkyYmjLWzOGH0DXAH3vNxuDFEqc+2YpbSZjoj8AjlNW9xo/0KTpnQJcSrmrIzgJsZyu4gql2bbBFMfA6HpmfwZh/AGMUjiYWZBXGYbfWr/HgZCE1JoCzQM8Wmy02V1cCRX60hQfHFt0eTEgMFoK6Xdjh6GBwIreSWAIkJEpNxw8K8BT733Hon4YtSEzv9xxkdFtUwmFxqODq3E1Erets0Opjt/cYPphiv+q0MKh3l7cJS8lA7dJfDsWKyG79O0CcbIcclDhNKL5+wmhqO4lnugXQ1QqT3mpopf6V6eUerMRrpTGBaGLFfk6LtEE4/f2hjYZ5WftfFlB0/Dx0h6qFCcnJdUMbELJVAAWImfYT8tgz5YXFpSEAdovh4Wvy/S4LatuLa5hS+RVcKT/tAumOWu6GP2N/wVn5k9AI6dF34lQ6ga0CKis4KQrhcEkJY4AktYZffxVdq0toqLHXgHbYDspj/a/8CjmP81S1RCVqYSRz4HqbFsSdayLNWJs6Ac6MK1kUlsP9PTm5Fp4HdqMN3vYoKUjdSsbMHt8sKaaF3UdfkC985YrnmVdvfBZlCy+JoR/41uJ2xyjlzJRQ+ZgZ4qWEjR75Joidd21eLp6s8qc9QE9H37LZnq63/4N+i3oXEJvm7mEdAN6rB7cuw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(23010399003)(36860700016)(6133799003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BsH3m8hClFaofVkYxwIIWXNAYZGg3iIwX53BuQwZXyuwOLm1q6CAkj5gTnS9wHcORoEj9iLM0If+ukhxNTdx0bpDx6km32Qhfz4p3Y/nZaO+jpNvATTyX5LTIQq8gaj9FONsAd2aBzWPK7aOmdYiC1IIZfv+ZYvpRy7SsP/J72zmCWHVsQpHuJ5lDanBFZebJHu5jDP3Os8UiwqjfKpJiGNivSv56QPFCwSax7fQiDV60EoNML4fyBVvnsGxY8vJNZxyS1ny/oBXNGe0r/qPbOHle4xGRBNMTZmX0XINmKRAyiZRD+E1nw9Qtve/kqcLgO/5YGC1Mk0GQYFb7kFygd6ztRiamFzCTNQhej4j6bhws7ekVd5CbxlY3PjuKmrUWRob7P38Vgl+Dy93TWxWxUyhzpFJhS2uHFoE2XxogvDceLPC9lDTgMI6lBdAklVZ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 08:59:54.7266
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ad0cafd-7b03-41c5-ef96-08df0f19e1e3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8472

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
Changes since v3:
- Update the sysfs ABI Documentation date to September 2026 and target
  release to 7.4.

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
index 000000000000..244c91893005
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-platform-tegra-bpmp
@@ -0,0 +1,48 @@
+What:		/sys/bus/platform/devices/<bpmp-device>/mbwt/pcie[0-5]/pcie_read/bandwidth
+What:		/sys/bus/platform/devices/<bpmp-device>/mbwt/pcie[0-5]/pcie_write/bandwidth
+What:		/sys/bus/platform/devices/<bpmp-device>/mbwt/pcie[0-5]/nvclink/bandwidth
+Date:		September 2026
+KernelVersion:	7.4
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

