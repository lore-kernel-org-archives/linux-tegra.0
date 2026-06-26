Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012016.outbound.protection.outlook.com [52.101.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165AF373BE7;
	Fri, 26 Jun 2026 13:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782479695; cv=fail; b=Whf0SjplzDPLVnVY4gwf+roq0joP8T+A7XIpwC4SsQqq6W18tsMV9/M3KFrdx88j8P+jy6cEIu8w7Pk94ivZ81wrhtUY6HUmuXoRnK0VW8jvYHj9CovKEAL80bEdsYl/Yt0jpvbXvqaouhdMDP0mOxYlbetorlU7cXVBec8r8QE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782479695; c=relaxed/simple;
	bh=qJMGkQtFTtQXI9Tawn29Qe2Xq0YaSIyPEwRnIGpWjms=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=d1bzxiT/U/Xi2coePtTLmiNxMge5CqZUMHQn+SCY2DBTr2+k6Hrpdab/N8fnK9ssnAkFd6MhuYhuFTgadAKyRhkoDKtqZvnCzcgT3Z0yvzyw8t3rAc6SyPy1Qgt3TVnwfiq6u3hD7EtXbMkS+I/imW/3CJPc1+ljR2zSw6gL4hQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gffGdRpu; arc=fail smtp.client-ip=52.101.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gffGdRpu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oEVODPz0CWU6flz3eHEJZXhuZydWxbU7+PTrl4W7rBfHSNpFIDHCBNIBTBaPwbS5fdgiNCvLO4T/tZoCsqUKkZbzRhDsWl0ra5vlePRPbUuMqfWpifjOzGlXgn/99sl38Ae91f6kDXlQTFbf2YqSzMIXmtH5hmcBexoHn/quDZhhI3rdQOsJtTMVz1MhK9C/dkx7hrf+82Tb8ffCpoZG5FM4viOh4tvRR3oIl72FKjAs+uS6Kp2AnOFlBNHC21CknTSKgh4ocS3yamrwMMOA9M4ufi2h99/CnsgNww2xStiaGK7EH+QIMq33Phd/OC0bUNTOL40LHKHfXWvanCEV6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9M7i+YrbuwOfgbv3OZAkHS2PM0eEyJ/IUE8raZUdTsk=;
 b=c3eIjBnPLXOrH3VG2McU7ohWCT8KeoRJCrjZX/BLPtMLcU17NpR6TCb7nvnpxF39NRMeoXGBxCAihIzj5kYzdFMX0NMEP5//ptNeaWqs9hx4F3FJg4yYwnmSRVBSDJqVqXrgD19vmtd98WdegMKumoBqs3lOvvRYSSgQq5WPaZuFs0EKxbQPz8jDkdakrRK3e335Zey6kHlBQ+qB6cVkyM+slvmD+ev+49p0Aqkk9kz/8UxXshrrgOfBTWbqKgBqSy1NAKyS8RrgWMMPpbjZ8nyA1tgARGUHmf3jYBCWm5Kc0yCprUtcFHcJhDWEHMD+edY4qn96tsf2a21djh+kgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9M7i+YrbuwOfgbv3OZAkHS2PM0eEyJ/IUE8raZUdTsk=;
 b=gffGdRpuK0CcRo8sS6Kx4Fdp5/jmYkHHHxtOiJ0eKPCdnzG2GQ7CCujh3/7kw6fhNyEFjPSHR1dRgHrKSNU2c8+MM8EvnQ7KI7apO2/hvRRkCfiBP8giQPXKSg5HJmdPkjOI6SMTjiqV3GErtlwpnRGjo7dYgHu/MHJSAJRWZD2lch3gsZLdKr55bmm/mrD/T5QJPqhnGKAQBO0g7s+tCNe8ec0SQamAGc5Fe9/6cyNXX/Vk5NVDq5MONp0cSL3xz9l2JjgjIQIkZ8db6s2yRRl/+2wC2oBdEcnZnIhqvwzFOcxdEKg5k3uWqeIKU3mQB7ZSYCJcz+140WDbnzXA+w==
Received: from SJ0PR13CA0039.namprd13.prod.outlook.com (2603:10b6:a03:2c2::14)
 by MN0PR12MB5932.namprd12.prod.outlook.com (2603:10b6:208:37f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Fri, 26 Jun
 2026 13:14:45 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::3c) by SJ0PR13CA0039.outlook.office365.com
 (2603:10b6:a03:2c2::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.7 via Frontend Transport; Fri, 26
 Jun 2026 13:14:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.0 via Frontend Transport; Fri, 26 Jun 2026 13:14:45 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 26 Jun
 2026 06:14:28 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 26 Jun
 2026 06:14:28 -0700
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 26 Jun 2026 06:14:26 -0700
From: Sumit Gupta <sumitg@nvidia.com>
To: <krzk@kernel.org>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC: <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [PATCH v3] memory: tegra: add multi-socket support to the memory interconnect
Date: Fri, 26 Jun 2026 18:44:23 +0530
Message-ID: <20260626131423.3986998-1-sumitg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|MN0PR12MB5932:EE_
X-MS-Office365-Filtering-Correlation-Id: 38076e6c-b08a-4c33-8b40-08ded384e46d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|13003099007|18002099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	5ZlWFh513sqGlC/SBtZukzke0UJVI6fVgIrobQyvHibMoksjUG5X4pvi8FcBR9Ifhstoev4YzGA3LZ8923ISqoDpae/FoSTPfOj0zfpEsDAmbJlzNsf/WakZ8qEv3vqCEmwW0fWMZXmHwQ96nNgpgSG5IJfQc1tq/0BZtroaJxIitgMMlNleFKMBT2+/UIrnmsm3En+kUUSkho6Qr7VblUIH+c3I/DGyuvYvWOb49uPk7nAeYQ6v4bG8j0RjC6MkMv1hO6ZZxgN3c70fHNqFXx0z8i38UMzrTAM0ZxCLsMmQOvoT2ypSmJiVfvKCnc8T3yHoRtg4ZMN2F0AC6i00fjmBwS+xDcJbWxHsoiyCeivBy5VX8yaReXyT5tIFAinLCeMkGC/MoAYejA1f/un89ZmBy77iMYAxBfmlHGFZbkl8HWkLBsdkglxUG4T4W+wav9tfAqKXyx/pjiSMrDx1K6MiLpuwNox4Oc4LIQ54+D4bSfsg4QgRGQ7HDofcwu76WtYJuPYbvRKcD6/bcOJwljKwjUysdwrsLOk9IWM08clLa00+J2r8SK50cX12JOOq8i/zTwsQ/LB8yB0r5Naw+PhvG4y7xGh+Z2wThk4r/MO2qspXuJCvfdnjMTZ9nlI+6J+ysLIXv5Le5B8SLrqNCUN8JP3Ycf9Jml41Vw+lj1TQDb6WJyMG43VWEpG9zyT5V33reAV0UKFAVrvMHMNhkw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(13003099007)(18002099003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GoVekrWh1muqOpTUNRCDhs7GqjZlKLKn5wDhQL1t4/2EyZ6P1CEeLLoNfewYw1xNSeZEL4+XUwubLXj4mcTa2AHGQyp5P1Ygl7TpOq4zHvHlNwQuGJYG/OddjOsZUhdEX5xefdLZzcnrjGuHA76VqLNZjMEgTHkrOmH5pegVmDGEucOwydzWJGpANqJffP2CxJCCtvdTKbPDqrfp6WW99S/cq6qt6uSgiMHby35ZNG4j+ueD0fHjD5dP+EpEy7RriFrx7FbsylN5ZAg9OuqeXo3S6fpoTg3qYuYnVuse29anXoGuFl1niD7B8/sy3SfVvIxK5gPrl7eRBQly9rBhVEsj20hrZBIy5KBC6KbGcH8psmZPB0C1d7fd1Hjb5aHmkc37eX5DlDyiYa2Escj7ffE20tqVGiiAUc8+OR5Jv2zz0G/7Z17VTZiPzJdsPl8z
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 13:14:45.4125
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38076e6c-b08a-4c33-8b40-08ded384e46d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5932

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
v2[2] -> v3:
- Reduce per-socket shift to 12 bits to keep composed ICC node
  IDs below ICC_DYN_ID_START.

v1[1] -> v2:
- Mutex protected lazy creation of the mc/emc debugfs parent.
- Rename {mc|emc}_debugfs_root to tegra_{mc|emc}_debugfs_root.

[1] https://lore.kernel.org/lkml/20260521140546.3023819-1-sumitg@nvidia.com/
[2] https://lore.kernel.org/lkml/20260602132314.486066-1-sumitg@nvidia.com/
---
 drivers/memory/tegra/mc.c           | 40 ++++++++++++++++-----
 drivers/memory/tegra/mc.h           | 37 +++++++++++++++++++
 drivers/memory/tegra/tegra186-emc.c | 55 ++++++++++++++++++++++++-----
 3 files changed, 115 insertions(+), 17 deletions(-)

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
index e94d265d7b67..01499292dd5f 100644
--- a/drivers/memory/tegra/mc.h
+++ b/drivers/memory/tegra/mc.h
@@ -8,6 +8,7 @@
 
 #include <linux/bits.h>
 #include <linux/io.h>
+#include <linux/numa.h>
 #include <linux/types.h>
 
 #include <soc/tegra/mc.h>
@@ -167,6 +168,42 @@ icc_provider_to_tegra_mc(struct icc_provider *provider)
 	return container_of(provider, struct tegra_mc, provider);
 }
 
+/*
+ * Compose a globally-unique ICC node ID. On single-socket
+ * systems (NUMA_NO_NODE), the SoC client ID is returned unchanged.
+ * On multi-socket systems, the NUMA node ID is encoded in the
+ * upper bits of the returned ID.
+ *
+ * The client ID field is sized to keep composed IDs below
+ * ICC_DYN_ID_START (the start of the ICC core's dynamic-ID range).
+ */
+#define TEGRA_MC_CLIENT_ID_BITS	12
+#define TEGRA_MC_CLIENT_ID_MASK	((1U << TEGRA_MC_CLIENT_ID_BITS) - 1)
+
+static inline u32 tegra_mc_get_client_id(int node_id, int id)
+{
+	if (node_id == NUMA_NO_NODE)
+		return id;
+
+	return ((node_id + 1) << TEGRA_MC_CLIENT_ID_BITS) | id;
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
+	return node->id & TEGRA_MC_CLIENT_ID_MASK;
+}
+
 static inline u32 mc_ch_readl(const struct tegra_mc *mc, int ch,
 			      unsigned long offset)
 {
diff --git a/drivers/memory/tegra/tegra186-emc.c b/drivers/memory/tegra/tegra186-emc.c
index f71265b303b9..e25f485e136e 100644
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
@@ -258,6 +274,7 @@ static int tegra186_emc_icc_get_init_bw(struct icc_node *node, u32 *avg, u32 *pe
 
 static int tegra186_emc_interconnect_init(struct tegra186_emc *emc)
 {
+	int node_id = dev_to_node(emc->dev->parent);
 	struct icc_node *node;
 	int err;
 
@@ -271,26 +288,36 @@ static int tegra186_emc_interconnect_init(struct tegra186_emc *emc)
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
@@ -383,6 +410,16 @@ static void tegra186_emc_remove(struct platform_device *pdev)
 
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

