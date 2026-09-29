Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013041.outbound.protection.outlook.com [40.93.196.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F484FDE48;
	Tue, 29 Sep 2026 10:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790676010; cv=fail; b=QGoGK6SNcpiIUM5M6LM5gMolaC+sF4mfg2V53W4NlczC8o3ITF8U3//Ez+nQ4nQVPWJFvehez0XU4+LV5hzHehmxn2xvRqxsXyDbo1OVCdvEmHLn88WWpSymADOI3y0nqXjLh8yKn5UdG3ZbAMoeCqxdVFCVU3IKhcvcXPicmvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790676010; c=relaxed/simple;
	bh=as6/Sgogt5IwIeH9hfKW11VRkowjttlKVP1F+SwGDps=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vh0C2QIZeydQkMFx0PCvUgQe/ZcqPyJEC5T3zeCP2AFuDAKN9qf63DNQTFkQLUtpnFpDp+uS3xn/Y8+pk3ktdja6w05NRj0U89idGU0xt5rcbeNO7zTeUcwCXAO8rKEqCkhwW/jFM8e9T4euetxskuCOS0A/EXw2Jwjzc9v2Wl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hnXVeJxD; arc=fail smtp.client-ip=40.93.196.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hnXVeJxD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=anWwJ3AppV99YkZCcyLVU9KIjZEGOhlneCY2MOj0L/MzHMyhJxTmdAIDyw8f3PbGCU1+A+DOh77taFWX35XWu06DxRe8iaeuFPCVVhDkvkcb7NO4T5JmL1mzioWtc83nGG+Gle9aERZ+H+pkd0ABOaJEg3Vo7oQX5IwW0uyLkrCKCwoXC25ZvxWWgQ3GxKkilt07N6DwRFuO6sqh885sjqbhPNiRQ/GB7CHIzhY3BcQ+TK7CUArViP5gH70gNAkxMvbvph5c6e8f0A2rJkhyU3DtqokDdf3hyr4vlrPwvD9i1jTnucFgDg/3siexqM1ZLbvrKivLhfb9jWhbrPcqhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tqGSWT8Ei5aYFXDgYbpAKYQ3aLL0RjkaumeUHvzwzv4=;
 b=EXY4e4t/xIlDeQ3ozn7Tr1ItAkL3tl+Sa0SDG62G5zADJKBFM3MT2lrDR63AXEZHuaaurUszPDhnT8ngGsx6HeqJPH7g1XI5a0XUz17lX2dZdEahq0yTuXwnYXrveaOK8BZPRPtnqxyUCjGU/876Nnbeudx5Kg8Ew/OqSrl8a57BFpXxsOmp/kuecGD3Grb+xLNzOt2a+z4jf7F5d6giqlvBfh9h24/99AfRx2jZpF/QnZx7088SRIQzGGPoJn//sdtVu0XyzIkqjAEYjCwXcHnh+Z0lsVgqFYCXqQsb0TIX3/A8A8kvhZZuRjXC+saCDaNhV4kIzOsa3HkV/DZPXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tqGSWT8Ei5aYFXDgYbpAKYQ3aLL0RjkaumeUHvzwzv4=;
 b=hnXVeJxDtRc7lJNlQTZe1/cK8AGRIeujKs0RzgTcGE51Fi3VRFmQlmxAhECtiIRbrmSew0WnZV4G6dybEkMRLCABc75/GBDsIpCrouVrIX7ye/yPmcOk0MoQPQqZZcZuoLtQZClBMXIphiPfu2Um9KbrLaMOkDIZ8DQ8M61uw5joPw/5cUNFGb/71qmOYU3K68hbLnplJpd4/RG3O8ChhJq/yplCM1ALBsGKm65kKNlcg/bvlkK4BW7wbnSF6uOz4PjGrlTZXQhxACkCd7YA3pdomPWJMr48gr+8+YLeFmLlJpJEkCn+zJ38FZXCFkRk59d9aTqRF50hJapCkIAtKA==
Received: from CH0PR03CA0434.namprd03.prod.outlook.com (2603:10b6:610:10e::16)
 by DM3PR12MB9288.namprd12.prod.outlook.com (2603:10b6:0:4a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.25; Tue, 29 Sep
 2026 09:59:56 +0000
Received: from CH1PEPF0000AD78.namprd04.prod.outlook.com
 (2603:10b6:610:10e:cafe::3) by CH0PR03CA0434.outlook.office365.com
 (2603:10b6:610:10e::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Tue,
 29 Sep 2026 09:59:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000AD78.mail.protection.outlook.com (10.167.244.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 09:59:55 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 02:59:36 -0700
Received: from build-anrao-noble-20260906.internal (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 29 Sep 2026 02:59:35 -0700
From: Aniruddha Rao <anrao@nvidia.com>
To: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Aniruddha
 Rao" <anrao@nvidia.com>
Subject: [PATCH v5 5/5] firmware: tegra: bpmp: Add MBWT sysfs interface
Date: Tue, 29 Sep 2026 09:59:15 +0000
Message-ID: <20260929095915.2215685-6-anrao@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929095915.2215685-1-anrao@nvidia.com>
References: <20260929095915.2215685-1-anrao@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD78:EE_|DM3PR12MB9288:EE_
X-MS-Office365-Filtering-Correlation-Id: 95a2802a-ffb1-442b-4515-08df1e106a29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|10067099003|11063799006|56012099006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Q4aKABVePZaF+cCQ0sk3AOc9w6Nu9hRr4CTBOjFlXgmKqJHTfjeUqkRUojr1SVG6i8XRPhXXkXa/729s79oim5R+LaGEN+QRZPPVM5kqaBh3pvt0VaKoPPjIvH66qVDRap/ZIyMVgpe3btG3hvZrR81JQabjnMlG2FBfXTNpANj2a8Go3zKERI8xscmb2kCb+/qSlEoYFEAjlNDxuGvxgxPGAdUf69hCNe+DuTBrnbkOn+kZ94o/wQAtqkmPF3i+DLL1Wrsxov1Rct+IAVRcn5rTQIs/tGhtNWYJwXNkzdWCOsibUL/Mp8Gh+9lHMNbZVYJY+h4fOJJVPAeIidZFfsktEPPTiGzjeYYR/2BGfeZvQGWY7a0Asq643ByDuZmQeHwlBtGkxvaG5h89H9iv6JWt1ogGW4Arrp1Q9JkViFeenTyYXv/VgmWeLuRtR08wemUeR4RnUf446zUGDlKOmMFBK7ocSt5ZDQVMeO88IDHKtO6IVXLi+CXs/UyRyMuxj80lcNwqU1DpQpiJELivehMDk8JbGZ+kX47yUY7MGnyvwIJePQSDRFLt45vRNWmglrj2Jnk1B4I/iV+62E9ng65dSKHQ1aSJiLQ2+5ZbuymcJbRjqspejuilBtAx4YmCc/0TNVYZ9z3lHTn4tJfuuj9t9pd42fI0N20sr9hj7luIsJGlePzfmPJvedZaSZPh6k+n+wQan926gJmt5prk9w==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eLax5I0zVZCQkerAuW+wQnr8zz3knP2NFG8CLY0geouUIH4WzWzBCNG/MAUnhgkOTVzztQf5XTDaWMpU2lqg09pSqCTyF8o3UtcNh4eRQ3Dgck6Huc0CQL5KPzfZVOHX3kMkDIkgH4DH0Isar48/oeBMjelUwB7LKyS2RWlqK0cyo1l4tk7GkpazA54422GjBiuSYe2wjvFPuccAtrMlRRrB89Ub5IHdnT6LIe15XQPN6ZUzl8KZo8wGFh5683yCka4lDNMAgGS/NAfqxJkxuPO2yKMYtYrD7JxWEYTk2C2ai/PBqiGT8DYxdoY/nsvOg31dvr/HQ08pEmUO4Af3fFZEZBj4K/MtqC1qe7Ljl2F1Utcp1UYN4x92UaN7utAZI389WPqmDpy6muDALm4zGsHCqcvVFMzx8dsvqmNxmm7HYWlKdPUa5+r3N3pkaDAd
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 09:59:55.7747
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95a2802a-ffb1-442b-4515-08df1e106a29
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD78.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9288

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

Describe the available bandwidth groups and traffic types in platform
data. Each entry maps a sysfs name to the corresponding firmware
instance and VC type so that these values can vary between platforms.

Add sysfs attributes on the tegra-bpmp platform device to expose a
narrow userspace interface for MBWT control. The attributes are arranged
as mbwt/<bandwidth-group>/<traffic-type>/bandwidth. The directory names
come from platform data. The current platform description uses pcie0
through pcie5 for bandwidth groups and pcie_read, pcie_write and
nvclink for traffic types.

Reading a bandwidth attribute queries firmware for the selected bandwidth
group and traffic type. Writing an integer programs the target bandwidth
cap in GB/s for that bandwidth group and traffic type.

Register the attributes only when BPMP firmware reports support for the
MBWT GET_BW and SET_BW requests through its query ABI.

Signed-off-by: Aniruddha Rao <anrao@nvidia.com>
---
Changes since v4:
- Describe MBWT bandwidth groups and traffic types with platform data so
  firmware instance and VC type values can vary between platforms.
- Document the sysfs hierarchy using platform-defined bandwidth-group and
  traffic-type names.

Changes since v3:
- Update the sysfs ABI Documentation date to September 2026 and target
  release to 7.4.

Changes since v2:
- Rename bpmp-tegra-sysfs.c to bpmp-sysfs.c.

Changes since v1:
- Register the interface only when firmware supports GET_BW and SET_BW.
- Expose per-traffic bandwidth attributes.
- Remove software bandwidth range checks.
- Guard sysfs registration with CONFIG_SYSFS.
- Rename the sysfs initialization helper.
- Use generic MBWT wording.

 .../ABI/testing/sysfs-platform-tegra-bpmp     |  48 ++++
 drivers/firmware/tegra/Makefile               |   1 +
 drivers/firmware/tegra/bpmp-private.h         |  26 +++
 drivers/firmware/tegra/bpmp-sysfs.c           | 207 ++++++++++++++++++
 drivers/firmware/tegra/bpmp.c                 |  35 +++
 include/soc/tegra/bpmp.h                      |   2 +
 6 files changed, 319 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-tegra-bpmp
 create mode 100644 drivers/firmware/tegra/bpmp-sysfs.c

diff --git a/Documentation/ABI/testing/sysfs-platform-tegra-bpmp b/Documentation/ABI/testing/sysfs-platform-tegra-bpmp
new file mode 100644
index 000000000000..5d0b525bd72a
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-platform-tegra-bpmp
@@ -0,0 +1,48 @@
+What:		/sys/bus/platform/devices/<bpmp-device>/mbwt/<bandwidth-group>/<traffic-type>/bandwidth
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
+		Each <bandwidth-group> directory identifies one PCIe bandwidth
+		group. The available groups and their directory names are
+		platform-specific. Current platforms use pcie0 through pcie5.
+		Each bandwidth group has a single shared cap for all traffic
+		in that group. A group may contain only PCIe devices, only a
+		GPU connected over NVCLINK, or both PCIe and GPU traffic in a
+		bifurcated topology.
+
+		The <traffic-type> directory selects the traffic type for the
+		selected group. The following traffic types may be available:
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
index f0a7d6254bdc..39cf31771836 100644
--- a/drivers/firmware/tegra/bpmp-private.h
+++ b/drivers/firmware/tegra/bpmp-private.h
@@ -24,6 +24,23 @@ struct tegra_bpmp_ops {
 	int (*resume)(struct tegra_bpmp *bpmp);
 };
 
+struct tegra_bpmp_mbwt_vc {
+	const char *name;
+	unsigned int type;
+};
+
+struct tegra_bpmp_mbwt_group {
+	const char *name;
+	unsigned int id;
+	const struct tegra_bpmp_mbwt_vc *vcs;
+	unsigned int num_vcs;
+};
+
+struct tegra_bpmp_mbwt_soc {
+	const struct tegra_bpmp_mbwt_group *groups;
+	unsigned int num_groups;
+};
+
 extern const struct tegra_bpmp_ops tegra186_bpmp_ops;
 extern const struct tegra_bpmp_ops tegra210_bpmp_ops;
 
@@ -39,4 +56,13 @@ int tegra_bpmp_mbwt_get(struct tegra_bpmp *bpmp, unsigned int instance,
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
index 000000000000..c7bf7f13f5d7
--- /dev/null
+++ b/drivers/firmware/tegra/bpmp-sysfs.c
@@ -0,0 +1,207 @@
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
+struct tegra_bpmp_mbwt_attr {
+	struct kobj_attribute attr;
+	struct tegra_bpmp_mbwt_sysfs *mbwt;
+	struct kobject *kobj;
+	unsigned int instance;
+	unsigned int vc_type;
+};
+
+struct tegra_bpmp_mbwt_sysfs {
+	struct tegra_bpmp *bpmp;
+	struct kobject *root;
+	struct kobject **groups;
+	struct tegra_bpmp_mbwt_attr *attrs;
+	unsigned int num_groups;
+	unsigned int num_attrs;
+	/* Serializes bandwidth requests to firmware. */
+	struct mutex lock;
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
+	unsigned int i;
+
+	for (i = 0; i < mbwt->num_attrs; i++) {
+		sysfs_remove_file(mbwt->attrs[i].kobj,
+				  &mbwt->attrs[i].attr.attr);
+		kobject_put(mbwt->attrs[i].kobj);
+	}
+
+	for (i = 0; i < mbwt->num_groups; i++)
+		kobject_put(mbwt->groups[i]);
+
+	kobject_put(mbwt->root);
+}
+
+static int tegra_bpmp_mbwt_sysfs_add_group(struct tegra_bpmp_mbwt_sysfs *mbwt,
+					   const struct tegra_bpmp_mbwt_group *group)
+{
+	struct tegra_bpmp_mbwt_attr *attr;
+	struct kobject *group_kobj;
+	unsigned int i;
+	int err;
+
+	group_kobj = kobject_create_and_add(group->name, mbwt->root);
+	if (!group_kobj)
+		return -ENOMEM;
+
+	mbwt->groups[mbwt->num_groups++] = group_kobj;
+
+	for (i = 0; i < group->num_vcs; i++) {
+		attr = &mbwt->attrs[mbwt->num_attrs];
+		attr->kobj = kobject_create_and_add(group->vcs[i].name,
+						    group_kobj);
+		if (!attr->kobj)
+			return -ENOMEM;
+
+		sysfs_attr_init(&attr->attr.attr);
+		attr->attr.attr.name = "bandwidth";
+		attr->attr.attr.mode = 0644;
+		attr->attr.show = tegra_bpmp_mbwt_show;
+		attr->attr.store = tegra_bpmp_mbwt_store;
+		attr->mbwt = mbwt;
+		attr->instance = group->id;
+		attr->vc_type = group->vcs[i].type;
+
+		err = sysfs_create_file(attr->kobj, &attr->attr.attr);
+		if (err) {
+			kobject_put(attr->kobj);
+			return err;
+		}
+
+		mbwt->num_attrs++;
+	}
+
+	return 0;
+}
+
+int tegra_bpmp_init_sysfs(struct tegra_bpmp *bpmp)
+{
+	const struct tegra_bpmp_mbwt_soc *soc = bpmp->soc->mbwt;
+	struct tegra_bpmp_mbwt_sysfs *mbwt;
+	unsigned int i, num_attrs = 0;
+	int err;
+
+	if (!soc)
+		return 0;
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
+	mbwt->groups = devm_kcalloc(bpmp->dev, soc->num_groups,
+				    sizeof(*mbwt->groups), GFP_KERNEL);
+	if (!mbwt->groups)
+		return -ENOMEM;
+
+	for (i = 0; i < soc->num_groups; i++)
+		num_attrs += soc->groups[i].num_vcs;
+
+	mbwt->attrs = devm_kcalloc(bpmp->dev, num_attrs,
+				   sizeof(*mbwt->attrs), GFP_KERNEL);
+	if (!mbwt->attrs)
+		return -ENOMEM;
+
+	mbwt->root = kobject_create_and_add("mbwt", &bpmp->dev->kobj);
+	if (!mbwt->root)
+		return -ENOMEM;
+
+	for (i = 0; i < soc->num_groups; i++) {
+		err = tegra_bpmp_mbwt_sysfs_add_group(mbwt, &soc->groups[i]);
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
index f2b739977f13..d91e833120b1 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -1085,6 +1085,10 @@ static int tegra_bpmp_probe(struct platform_device *pdev)
 			goto deinit;
 	}
 
+	err = tegra_bpmp_init_sysfs(bpmp);
+	if (err < 0)
+		dev_err(&pdev->dev, "failed to initialize sysfs: %d\n", err);
+
 	err = tegra_bpmp_init_debugfs(bpmp);
 	if (err < 0)
 		dev_err(&pdev->dev, "debugfs initialization failed: %d\n", err);
@@ -1186,6 +1190,36 @@ static const struct of_device_id tegra_bpmp_match[] = {
 };
 
 #ifdef CONFIG_ACPI
+#define TEGRA_BPMP_MBWT_VC_PCIE_READ	0
+#define TEGRA_BPMP_MBWT_VC_PCIE_WRITE	1
+#define TEGRA_BPMP_MBWT_VC_NVCLINK	2
+
+static const struct tegra_bpmp_mbwt_vc tegra_bpmp_acpi_mbwt_vcs[] = {
+	{ .name = "pcie_read", .type = TEGRA_BPMP_MBWT_VC_PCIE_READ },
+	{ .name = "pcie_write", .type = TEGRA_BPMP_MBWT_VC_PCIE_WRITE },
+	{ .name = "nvclink", .type = TEGRA_BPMP_MBWT_VC_NVCLINK },
+};
+
+static const struct tegra_bpmp_mbwt_group tegra_bpmp_acpi_mbwt_groups[] = {
+	{ .name = "pcie0", .id = 0, .vcs = tegra_bpmp_acpi_mbwt_vcs,
+	  .num_vcs = ARRAY_SIZE(tegra_bpmp_acpi_mbwt_vcs) },
+	{ .name = "pcie1", .id = 1, .vcs = tegra_bpmp_acpi_mbwt_vcs,
+	  .num_vcs = ARRAY_SIZE(tegra_bpmp_acpi_mbwt_vcs) },
+	{ .name = "pcie2", .id = 2, .vcs = tegra_bpmp_acpi_mbwt_vcs,
+	  .num_vcs = ARRAY_SIZE(tegra_bpmp_acpi_mbwt_vcs) },
+	{ .name = "pcie3", .id = 3, .vcs = tegra_bpmp_acpi_mbwt_vcs,
+	  .num_vcs = ARRAY_SIZE(tegra_bpmp_acpi_mbwt_vcs) },
+	{ .name = "pcie4", .id = 4, .vcs = tegra_bpmp_acpi_mbwt_vcs,
+	  .num_vcs = ARRAY_SIZE(tegra_bpmp_acpi_mbwt_vcs) },
+	{ .name = "pcie5", .id = 5, .vcs = tegra_bpmp_acpi_mbwt_vcs,
+	  .num_vcs = ARRAY_SIZE(tegra_bpmp_acpi_mbwt_vcs) },
+};
+
+static const struct tegra_bpmp_mbwt_soc tegra_bpmp_acpi_mbwt_soc = {
+	.groups = tegra_bpmp_acpi_mbwt_groups,
+	.num_groups = ARRAY_SIZE(tegra_bpmp_acpi_mbwt_groups),
+};
+
 static int tegra_bpmp_acpi_init(struct tegra_bpmp *bpmp)
 {
 	return tegra_bpmp_ping(bpmp);
@@ -1197,6 +1231,7 @@ static const struct tegra_bpmp_ops tegra_bpmp_acpi_ops = {
 
 static const struct tegra_bpmp_soc tegra_bpmp_acpi_soc = {
 	.ops = &tegra_bpmp_acpi_ops,
+	.mbwt = &tegra_bpmp_acpi_mbwt_soc,
 };
 
 static const struct acpi_device_id tegra_bpmp_acpi_match[] = {
diff --git a/include/soc/tegra/bpmp.h b/include/soc/tegra/bpmp.h
index a33582590a3b..f55db918ccb1 100644
--- a/include/soc/tegra/bpmp.h
+++ b/include/soc/tegra/bpmp.h
@@ -16,6 +16,7 @@
 #include <soc/tegra/bpmp-abi.h>
 
 struct tegra_bpmp_clk;
+struct tegra_bpmp_mbwt_soc;
 struct tegra_bpmp_ops;
 
 struct tegra_bpmp_soc {
@@ -28,6 +29,7 @@ struct tegra_bpmp_soc {
 	} channels;
 
 	const struct tegra_bpmp_ops *ops;
+	const struct tegra_bpmp_mbwt_soc *mbwt;
 	unsigned int num_resets;
 };
 
-- 
2.43.0

