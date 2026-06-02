Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012050.outbound.protection.outlook.com [52.101.48.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184FE2517A5;
	Tue,  2 Jun 2026 13:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780406622; cv=fail; b=Pn28uwH/oFZEnrUIY/Kz5WR9Ht5DUVSMJ4nVji342JBxMTLHyT/JWMcBQftwmqo/K6Nw8/vIbs/6PaxfO8yb5+JCrcN8eXYC/WDmTW+kulqzmHBoSXtERZUF+s6q3p2YdXeD/VR6ki+cxxDo+wtGeo8UjA5JnfS9J+xKLKhO0xo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780406622; c=relaxed/simple;
	bh=TUXIPzoX5sHTgh306aiJRwH3oRCPn8OOswRBorQvCRY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=b8bycb4txcjkc/LkcCFXuVKmPHcKp5i/OmTM7JMnzymrdjTFHXDmtOhr0M8lfnxTTWZSTitqO38Vd1ClLRp+9KhNTaoZz+1e97zgElVAszezcIpM0rwZG0UeWWhUwWjo0EpSwKRVeJOLE+ysuv8irXP2kdBrBgVpDbHpSuw37x8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=V51JdiBs; arc=fail smtp.client-ip=52.101.48.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="V51JdiBs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uKrqnLOjaB56YC+D4vbfZe4Ar9mphX3lDzjfANO2j2fizYSHXhqmKQQ5EpcwPyBEn/LUpB0EKVAxjMAwhoeD1zUzo5QIFHHEcpOEDovlbOJP1330/DgrwE7bzWuSc6mzw1L12q6QO3pADC1ypHbO8D+ygAudGYvwb5imzKOcxU0PyB4DlprpeJgqMI1RpYOMwyHHzoudAg41hw3g4u1D9R5BWopbDQ5RZJ0dZrMS1xsdXir+x8sFrZ0EHwWXZsHiOVUDo4/YToe2tcGiHN3LpQQggOPgcFXa9yBMxJGfcn/SPOiML9pLCX0k6hPlNCQxVCXr5irfsH6SztVNB4PHiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZx70U6/WIGhKlh/fCBWHuu1tCmW/ba1q3PXcP1e6Ww=;
 b=RkGAW11J2olLotkwoj3XfDVUkSPsKedIRXNqefZWKBKsHqVikaFE/o092y+OsUQ2MOnmy3r4FV3RLilrVonW4/w/vKd1ObFspk2j6Rr4yYvxPJY+ksIk8m5QbYuPD5P5gunj6YnJzRW9Hh7DKADUFFJ0VuqD5xt3CPrx6adJ2tPYtXZz8zrKx0i5QYiZca4KbGeZ7Gop8ETLtUsAnu4KkZTRGUCyDfU4lGGwA8wBQY3d5Qmjr1qS1/efr93ZuXykLKfkUpLY1QXjKX4mzQrInlbB06PC14xCy3v/XKTUfubqvAk4XYfR28g80FEwMWN4HcxO60CcwZGHqj+bupxWrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UZx70U6/WIGhKlh/fCBWHuu1tCmW/ba1q3PXcP1e6Ww=;
 b=V51JdiBsr3+j/7FNO21WtA7l/4MM9jCeAFLtVAk7cb5jruSM8GsCTcxFRE+1eJVnQWM0mPXQeMXx00EH8AfYpjo0ACYmnbqsmKezBENMqF6suXbk16i9GUQ4J2+qn1BsIbU6pbbbspxhA5hMlxRe9ysRwePvAgXI0/W8zJ/iccouccIkiWVunOBdwomSuFbnEORTWbF0HBUfkuSiDqdYoV53mqGh4ZM35yJm986nZJwKW3yqZFnQkRpGQLRaFZGFIiKEH/nKCNTNHVm67T3EfpuXACzABIoctKooGme6mmNo0gcIvhacrz0re+85SxYENEnI+KIxv9vInDAnoIU4dQ==
Received: from DS7PR03CA0123.namprd03.prod.outlook.com (2603:10b6:5:3b4::8) by
 CHXPR12MB999246.namprd12.prod.outlook.com (2603:10b6:610:2fc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 13:23:38 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:5:3b4:cafe::5c) by DS7PR03CA0123.outlook.office365.com
 (2603:10b6:5:3b4::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Tue, 2
 Jun 2026 13:23:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 13:23:38 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Jun
 2026 06:23:19 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 2 Jun
 2026 06:23:18 -0700
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 2 Jun 2026 06:23:16 -0700
From: Sumit Gupta <sumitg@nvidia.com>
To: <krzk@kernel.org>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC: <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [PATCH v2] memory: tegra: add multi-socket support to the memory interconnect
Date: Tue, 2 Jun 2026 18:53:14 +0530
Message-ID: <20260602132314.486066-1-sumitg@nvidia.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|CHXPR12MB999246:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fca8ab3-50a4-4288-96d7-08dec0aa282c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|3023799007|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	VHUPf9uGZcP6Qrm8vUaUCw/HIdpuTo1powHZqqfx6FjPgizo+VI7Hkd/I44gZN7mOfu2KsAaRiD/4d5AG0+RWRqKGukqyfGZAYymkvfg8FSvgKwLnDQxnHi2eRfa1GWEEDYq74bul1PXUszoSRDrPAxBeF6pGERruz6TnmVXQoJygGAKCO4+7ljskQKtNsgYdUz8z2v8AIbiWr/ZoHAVedCJ6M0LIYzBzySVNCw+Fbo8xTsaMWVnGasW0m+AohcFnu9ot9AAgxiSFU5MZio8lgb27q+G8ZzS59R+L2nUz8rpDPgEF3b8ONZ8M6l8kn9GrIePGQxfsXgZXsew45eEB66aOGqt7GJJAerpsau/TAs96Xpb/7q3cicQsyw0ZI6t3hoMILCuuSNfmLq5D/1bSNADQLU4I5pBix8NjbYcvbxQwnowzs5JpGWPanUsze0SotS7TJInqXM6wHd6IHjbVb80I5lim8aY5JdswPN4tW7kjZXcymIS9m6kQM8w013A/yWoHu8FwlcPliIfKj4O1/GuNq4KJxygGwC8NLORyqicZ8BG210HyGuMvXWHR0vhSGgj1nKICPwGLjV7xPl8jAm+BQIMGgsraojyuA/lBvzCZqWD96BBMRgGxd+Gb0rty+2+Ffvdpb2qEQkvi5iMwgSg8yCAXqRZHlydaE27iPCXaYU1lc0HE+fdCnQgVwI3dAUK1Lq+/yrLqs6zr2Jbjcay1OUldcgqE939zfbWw3U=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(3023799007)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AYFAYrZZGIVM/caNkfvbjahs+OznfmHp7ka72GKxOm/+KKN8dNmTcITaydfhaUJ52VWCDal0sDcHZSoYoE063d5wz4I4nSq2ffZH3KxG6Dsfl38qIDdS0xCb0V93mjCYr/9PbwvwBZf3/yDGYG5rp4e8LiUunSGKiKifkZh0BiFfEbsiHEs9oOtuyI9fkVOla23LxasCet6moS5EMtFGQ4y40GG56xpZDC9/YSs9RYYsggKDn02XW37fgtOUcffinGRBzXDqDLOCqjLMQ+gCAE7Fwq8OOb7REqPMBizliyndpVYG4dEw8xWArlhI2qP1PM4Bvw0X0/brHolpK/kYf2Io3p1gQhxAHnPUWHnMgn5AZqYfSdEGj/MjKiCKB9zAyf8IHqaiyaiUhaV8B0yCJ0NlH7rFDpkeY2v4uEdNujGsvxwIMlZmbJ2TbNC9YKOt
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 13:23:38.2684
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fca8ab3-50a4-4288-96d7-08dec0aa282c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHXPR12MB999246

Add support for representing each memory-controller instance (one
per NUMA node / socket) as its own interconnect (ICC) provider,
with its own MC client nodes, to match the hardware topology on
multi-socket Tegra SoCs.

Use the NUMA node ID to make client IDs globally unique across
per-socket providers, since the ICC framework allocates node IDs
from a single global IDR. Per-socket MC and EMC node names are
also derived from dev_name() so they match the corresponding
debugfs subdirectory. On single-socket platforms (NUMA_NO_NODE)
the existing client IDs and node-name strings are preserved.

Each socket's MC and EMC therefore get their own debugfs
subdirectory under /sys/kernel/debug/{mc,emc}/. The parent
directories are created on first probe.

Bandwidth requests from MC clients in a socket are routed to
that socket's local BPMP.

Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
---
v1 -> v2:
- Mutex protected lazy creation of the mc/emc debugfs parent.
- Rename {mc|emc}_debugfs_root to tegra_{mc|emc}_debugfs_root.

[1] https://lore.kernel.org/lkml/20260521140546.3023819-1-sumitg@nvidia.com/
---
 drivers/memory/tegra/mc.c           | 40 ++++++++++++++++-----
 drivers/memory/tegra/mc.h           | 31 ++++++++++++++++
 drivers/memory/tegra/tegra186-emc.c | 55 ++++++++++++++++++++++++-----
 3 files changed, 109 insertions(+), 17 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index ec80ea9cc173..51ad0d3e48d4 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2014-2026 NVIDIA CORPORATION.  All rights reserved.
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
@@ -10,6 +11,7 @@
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
@@ -22,6 +24,9 @@
 
 #include "mc.h"
 
+static DEFINE_MUTEX(tegra_mc_debugfs_root_lock);
+static struct dentry *tegra_mc_debugfs_root;
+
 static const struct of_device_id tegra_mc_of_match[] = {
 #ifdef CONFIG_ARCH_TEGRA_2x_SOC
 	{ .compatible = "nvidia,tegra20-mc-gart", .data = &tegra20_mc_soc },
@@ -778,7 +783,7 @@ struct icc_node *tegra_mc_icc_xlate(const struct of_phandle_args *spec, void *da
 	struct icc_node *node;
 
 	list_for_each_entry(node, &mc->provider.nodes, node_list) {
-		if (node->id == spec->args[0])
+		if (tegra_mc_client_id_from_node(node) == spec->args[0])
 			return node;
 	}
 
@@ -834,6 +839,7 @@ const struct tegra_mc_icc_ops tegra_mc_icc_ops = {
  */
 static int tegra_mc_interconnect_setup(struct tegra_mc *mc)
 {
+	int node_id = dev_to_node(mc->dev);
 	struct icc_node *node;
 	unsigned int i;
 	int err;
@@ -854,31 +860,40 @@ static int tegra_mc_interconnect_setup(struct tegra_mc *mc)
 	icc_provider_init(&mc->provider);
 
 	/* create Memory Controller node */
-	node = icc_node_create(TEGRA_ICC_MC);
+	node = tegra_mc_icc_node_create(node_id, TEGRA_ICC_MC);
 	if (IS_ERR(node))
 		return PTR_ERR(node);
 
-	node->name = "Memory Controller";
+	if (node_id == NUMA_NO_NODE)
+		node->name = "Memory Controller";
+	else
+		node->name = dev_name(mc->dev);
+
 	icc_node_add(node, &mc->provider);
 
 	/* link Memory Controller to External Memory Controller */
-	err = icc_link_create(node, TEGRA_ICC_EMC);
+	err = tegra_mc_icc_link_create(node, node_id, TEGRA_ICC_EMC);
 	if (err)
 		goto remove_nodes;
 
 	for (i = 0; i < mc->soc->num_clients; i++) {
 		/* create MC client node */
-		node = icc_node_create(mc->soc->clients[i].id);
+		node = tegra_mc_icc_node_create(node_id, mc->soc->clients[i].id);
 		if (IS_ERR(node)) {
 			err = PTR_ERR(node);
 			goto remove_nodes;
 		}
 
-		node->name = mc->soc->clients[i].name;
+		if (node_id == NUMA_NO_NODE)
+			node->name = mc->soc->clients[i].name;
+		else
+			node->name = devm_kasprintf(mc->dev, GFP_KERNEL, "%d-%s",
+						    node_id, mc->soc->clients[i].name);
+
 		icc_node_add(node, &mc->provider);
 
 		/* link Memory Client to Memory Controller */
-		err = icc_link_create(node, TEGRA_ICC_MC);
+		err = tegra_mc_icc_link_create(node, node_id, TEGRA_ICC_MC);
 		if (err)
 			goto remove_nodes;
 
@@ -957,7 +972,16 @@ static int tegra_mc_probe(struct platform_device *pdev)
 	if (IS_ERR(mc->regs))
 		return PTR_ERR(mc->regs);
 
-	mc->debugfs.root = debugfs_create_dir("mc", NULL);
+	scoped_guard(mutex, &tegra_mc_debugfs_root_lock) {
+		if (!tegra_mc_debugfs_root)
+			tegra_mc_debugfs_root = debugfs_create_dir("mc", NULL);
+
+		if (dev_to_node(mc->dev) == NUMA_NO_NODE)
+			mc->debugfs.root = tegra_mc_debugfs_root;
+		else
+			mc->debugfs.root = debugfs_create_dir(dev_name(mc->dev),
+							      tegra_mc_debugfs_root);
+	}
 
 	if (mc->soc->ops && mc->soc->ops->probe) {
 		err = mc->soc->ops->probe(mc);
diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
index e94d265d7b67..be6ec0f63f59 100644
--- a/drivers/memory/tegra/mc.h
+++ b/drivers/memory/tegra/mc.h
@@ -8,6 +8,7 @@
 
 #include <linux/bits.h>
 #include <linux/io.h>
+#include <linux/numa.h>
 #include <linux/types.h>
 
 #include <soc/tegra/mc.h>
@@ -167,6 +168,36 @@ icc_provider_to_tegra_mc(struct icc_provider *provider)
 	return container_of(provider, struct tegra_mc, provider);
 }
 
+/*
+ * Compose a globally-unique ICC node ID. On single-socket
+ * systems (NUMA_NO_NODE), the SoC client ID is returned unchanged.
+ * On multi-socket systems, the NUMA node ID is encoded in the
+ * upper bits of the returned ID.
+ */
+static inline u32 tegra_mc_get_client_id(int node_id, int id)
+{
+	if (node_id == NUMA_NO_NODE)
+		return id;
+
+	return ((node_id + 1) << 16) | id;
+}
+
+static inline struct icc_node *tegra_mc_icc_node_create(int node_id, int id)
+{
+	return icc_node_create(tegra_mc_get_client_id(node_id, id));
+}
+
+static inline int tegra_mc_icc_link_create(struct icc_node *node, int node_id, int id)
+{
+	return icc_link_create(node, tegra_mc_get_client_id(node_id, id));
+}
+
+/* Return the SoC client ID encoded in an ICC node ID. */
+static inline u32 tegra_mc_client_id_from_node(const struct icc_node *node)
+{
+	return node->id & GENMASK(15, 0);
+}
+
 static inline u32 mc_ch_readl(const struct tegra_mc *mc, int ch,
 			      unsigned long offset)
 {
diff --git a/drivers/memory/tegra/tegra186-emc.c b/drivers/memory/tegra/tegra186-emc.c
index 03ebab6fbe68..e6a2e19693c0 100644
--- a/drivers/memory/tegra/tegra186-emc.c
+++ b/drivers/memory/tegra/tegra186-emc.c
@@ -3,16 +3,22 @@
  * Copyright (C) 2019-2025 NVIDIA CORPORATION.  All rights reserved.
  */
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/debugfs.h>
+#include <linux/fs.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
+#include <linux/mutex.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 
 #include <soc/tegra/bpmp.h>
 #include "mc.h"
 
+static DEFINE_MUTEX(tegra_emc_debugfs_root_lock);
+static struct dentry *tegra_emc_debugfs_root;
+
 struct tegra186_emc_dvfs {
 	unsigned long latency;
 	unsigned long rate;
@@ -207,7 +213,17 @@ static int tegra186_emc_get_emc_dvfs_latency(struct tegra186_emc *emc)
 		return err;
 	}
 
-	emc->debugfs.root = debugfs_create_dir("emc", NULL);
+	scoped_guard(mutex, &tegra_emc_debugfs_root_lock) {
+		if (!tegra_emc_debugfs_root)
+			tegra_emc_debugfs_root = debugfs_create_dir("emc", NULL);
+
+		if (dev_to_node(emc->dev) == NUMA_NO_NODE)
+			emc->debugfs.root = tegra_emc_debugfs_root;
+		else
+			emc->debugfs.root = debugfs_create_dir(dev_name(emc->dev),
+							       tegra_emc_debugfs_root);
+	}
+
 	debugfs_create_file("available_rates", 0444, emc->debugfs.root, emc,
 			    &tegra186_emc_debug_available_rates_fops);
 	debugfs_create_file("min_rate", 0644, emc->debugfs.root, emc,
@@ -239,7 +255,7 @@ tegra186_emc_of_icc_xlate(const struct of_phandle_args *spec, void *data)
 
 	/* External Memory is the only possible ICC route */
 	list_for_each_entry(node, &provider->nodes, node_list) {
-		if (node->id != TEGRA_ICC_EMEM)
+		if (tegra_mc_client_id_from_node(node) != TEGRA_ICC_EMEM)
 			continue;
 
 		return node;
@@ -260,6 +276,7 @@ static int tegra186_emc_interconnect_init(struct tegra186_emc *emc)
 {
 	struct tegra_mc *mc = dev_get_drvdata(emc->dev->parent);
 	const struct tegra_mc_soc *soc = mc->soc;
+	int node_id = dev_to_node(mc->dev);
 	struct icc_node *node;
 	int err;
 
@@ -273,26 +290,36 @@ static int tegra186_emc_interconnect_init(struct tegra186_emc *emc)
 	icc_provider_init(&emc->provider);
 
 	/* create External Memory Controller node */
-	node = icc_node_create(TEGRA_ICC_EMC);
-	if (IS_ERR(node))
-		return PTR_ERR(node);
+	node = tegra_mc_icc_node_create(node_id, TEGRA_ICC_EMC);
+	if (IS_ERR(node)) {
+		err = PTR_ERR(node);
+		goto remove_nodes;
+	}
+
+	if (node_id == NUMA_NO_NODE)
+		node->name = "External Memory Controller";
+	else
+		node->name = dev_name(emc->dev);
 
-	node->name = "External Memory Controller";
 	icc_node_add(node, &emc->provider);
 
 	/* link External Memory Controller to External Memory (DRAM) */
-	err = icc_link_create(node, TEGRA_ICC_EMEM);
+	err = tegra_mc_icc_link_create(node, node_id, TEGRA_ICC_EMEM);
 	if (err)
 		goto remove_nodes;
 
 	/* create External Memory node */
-	node = icc_node_create(TEGRA_ICC_EMEM);
+	node = tegra_mc_icc_node_create(node_id, TEGRA_ICC_EMEM);
 	if (IS_ERR(node)) {
 		err = PTR_ERR(node);
 		goto remove_nodes;
 	}
 
-	node->name = "External Memory (DRAM)";
+	if (node_id == NUMA_NO_NODE)
+		node->name = "External Memory (DRAM)";
+	else
+		node->name = devm_kasprintf(emc->dev, GFP_KERNEL, "%d-dram", node_id);
+
 	icc_node_add(node, &emc->provider);
 
 	err = icc_provider_register(&emc->provider);
@@ -385,6 +412,16 @@ static void tegra186_emc_remove(struct platform_device *pdev)
 
 	debugfs_remove_recursive(emc->debugfs.root);
 
+	scoped_guard(mutex, &tegra_emc_debugfs_root_lock) {
+		if (emc->debugfs.root == tegra_emc_debugfs_root) {
+			tegra_emc_debugfs_root = NULL;
+		} else if (tegra_emc_debugfs_root &&
+			   simple_empty(tegra_emc_debugfs_root)) {
+			debugfs_remove(tegra_emc_debugfs_root);
+			tegra_emc_debugfs_root = NULL;
+		}
+	}
+
 	mc->bpmp = NULL;
 	tegra_bpmp_put(emc->bpmp);
 }
-- 
2.34.1

