Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012016.outbound.protection.outlook.com [40.93.195.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFD733D6C1;
	Thu, 21 May 2026 14:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779372376; cv=fail; b=Gpzr3krL0AwbY/FYfYBvX6OksTGAK4foVPD1H0Fbse+cbI+ScxII3XdkoossrwJ0uGPRFX0MTtpFYNNAHCijq40s912jZOh0aMyKV7y/uXsXRQEG66ZyPAo4HjmO9kNew8SMMtt2QlUm2S69OtFYUeJhhr50pNNG65NInzd8p44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779372376; c=relaxed/simple;
	bh=BrIK6d2FNbw3i93TWKil4k8QJPeNxDD1G3vCnBpWRho=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TWdBwkLymAOI2noCvo2RU6yPE/c8TsHrjUYNmHeSL+O9GvoF4JUMzgaZmljhsqG+i8CaSIme2DF3H0+5GsuJNUcB+Ot28tv4yShCtA9Ldk+uRgZJeAP9mA3PqLPkMOrUQciTIXi7S+Y3fWtMBnDkiSmKgJLXNHIoGqUIN48C96M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PY190Y97; arc=fail smtp.client-ip=40.93.195.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PY190Y97"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EBBxmO6fxOjPO/4RW1vl8KM3UYKg6ehij8HbEIq0urPQrLyg7LPMlF8L8ZBvsGhzZuUqQCNrxw7/tJVDGRyr7stDb6lb5TGYqxmCJgmIBm+CCRFvW8qZgDEg6Q00dttOl+L0unxHCpaAXY1yq3Q4j+zGtIzou8G7Q1D5pE6ajW/QCTVmW4sNByUGJK0jjGkXRjDTumD62FZmbXzJv4R6OREC3iyblpQLw4Ghvo51ugk3a0mGNm2qn+Q22ZbweEeP7UmKdC8JPD1sobPrEmFOISafWriskuZPVFh8204yx0U5ft23muCUIef7TFs/iyjrAtYFOqvVDUsyv5TBkF7XUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/WjXuh6FtGhoF5Z4ivBpgEpuLJwDxN+goH1Z61tbZ9Y=;
 b=njHNVOsTm1JvrkWoudNnKE5Q/cV4HoUDAmdhU1eUfBpEPtSOqNq8ijnHmUJcIaP0gw08FQgcMqgo8DIKRLBVjyIZK5dGfZFjAmi5pP/FRJGzpKXHBUknOCW752rNKIRa/3aPEbUTdZmasLbu7jHEviPCWMkEfKNhulPP95e4hgq7jO56a34auz9dvZH6bZvQdsQpX+goVW2wNzaWi7b++2hP/ToCQB4aKnjCR8jivkCo+2GoklmxJNZYQNdhX5eC7rMqOeR1vmIhPKnDIPVd3wtgnTSh5z32xjrlTUnCBu+6+2MICQq4Joat6LT6LAFRbzQfP0rYC1+2gIHRSd1iAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/WjXuh6FtGhoF5Z4ivBpgEpuLJwDxN+goH1Z61tbZ9Y=;
 b=PY190Y97d/Rzm00AOm1c/ycFklPIROnB77h9NZr0hDQTsPfbCDFHGK/hLp4uuqTKb2p/p64YPodCD1IJ02PXa4L9rhiG2q+SNkD8U1kBjwPwGgoBD6eJ1DBIUuH7T56XEPJPOoAgcn/GET/VqMwpwWK9bWphGI3y7qBmxTfeplltkTOo24+FUl+jYfDMdNr5F7jWRV1SkpsYDrR04YrTfaadAG2jjvtVCkDUirHoi8KN35aoo+4j9sJM0awtLVtEsVlpyG1Hfxw1kDP1zplzLMOtPGhxB3fEqSNCH2/uP4be2DYcRCTr8CdOXAhlFV2GAjCqcj+84cIqG6KLPiM/Fg==
Received: from DS7PR03CA0068.namprd03.prod.outlook.com (2603:10b6:5:3bb::13)
 by MW4PR12MB7438.namprd12.prod.outlook.com (2603:10b6:303:219::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 14:06:09 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:5:3bb:cafe::68) by DS7PR03CA0068.outlook.office365.com
 (2603:10b6:5:3bb::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Thu, 21
 May 2026 14:06:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Thu, 21 May 2026 14:06:05 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 21 May
 2026 07:05:52 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 21 May 2026 07:05:52 -0700
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 21 May 2026 07:05:50 -0700
From: Sumit Gupta <sumitg@nvidia.com>
To: <krzk@kernel.org>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC: <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [PATCH] memory: tegra: add multi-socket support to the memory interconnect
Date: Thu, 21 May 2026 19:35:46 +0530
Message-ID: <20260521140546.3023819-1-sumitg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|MW4PR12MB7438:EE_
X-MS-Office365-Filtering-Correlation-Id: dff84dd0-e4e2-4ebb-38e3-08deb74219bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|11063799006|3023799007|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	sxLshPLWOFdn1n3PY7iWaLz1n0MrnB11Qy53eNh5pzaTKRbLbk+1nOyovCnHZgPRPIJ76z6XAlHS9PXrZyhgCN+qA2z9Exa5MiLAq8sEXqDP+ajYoC+VKkcMVLy0LJ324gTe0+I40c1WSsffu78zj0Y02Du71tHeMyT2r37GxWm7WlR4hWkb87FWlxkENU0DsVCtNqT1eaSPvQdZczjq526AYggNYL3WKz0S69oTntEBC0IL8l7U6NrqQT5tWGdExOAXSchmFJrV6B42kKhSfwBf55W04OAvV7Mo9YoW8ztZ4BKxjGIGdA7PA4l+YvKycVBTlGfiaOqFzU0JawCw3wZq2vI49jaBeT338aJoFWANsZj+51KoEyV5CtUCX3SmZpz5Bi1tWJ0LLlA0S/XehZcByODdSHy/zmLPCd+XSJDiBMzeXWuVvg+zW8IvNpH+6DdYRTHNTXJ7HdCqCqb5EtpWdekYybn0rG3cfMOaZG4ZAJyHoL0TDjzpW00UJ0DVqbpGmYVooxwpDoYeZnSMfC+RZYRlC+N31z0hvxRB1AS9Hbjab8DJ8llTMG1zuIPmYZpQCFOpCwm/2y3uYGy8JRdnnxcaDegwedI4hVB+YSQBrwXRuFNnixeS8X7MaM14ii75Bb6bPj5lHyOqS4pyYeoM5gvd79xD43HHNWxQff6HjPRimyqarO760HUju8aIP3K4HTZXFPNhiuru9dCRkAUfmCi49oq3Vv+xz99bDPA=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(11063799006)(3023799007)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vnJN+j5v/4ZYWZdUpSwWKA4Qa1eoo1+PegXitIcGK5U2OAZqPqDvBUogCDkPhKvhCRO5kkqM8yPd9Z3Z1cx02SEBq7GbEluiSzkKsNayFveDnzGoZdQ1vKMu938OHLst8l1xz3O3f8frYjcucriHwjRnidD26yQkgdF8ty23/m+CN0HoV1pC8bg3dJeTaqu4BLQZx+kpsVFUUv6zpX0RAH9LGNHaxeYWUHu2hYXUv4eoqnUOiR6/RKZLjpySS3f0/UnQJa7ZdWlyB/gsEQkywI8UEcx7fkWjTeTTV+egeYMvnglDBQ/BWWiu5xYeyJTDiymesOic/3UjKSdCp/DkYLmVFlv9RyqexlW1gJuNnKtuBBlzc1TBhNd0Qt2m4pr9tRS/SbtFxA5MMNG2G22/qAhBUt2YvSEKNNJP+S8tTAMlm1g0zve728nBnUw+0SOv
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 14:06:05.9718
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dff84dd0-e4e2-4ebb-38e3-08deb74219bd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7438

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
subdirectory under /sys/kernel/debug/{mc,emc}/. Bandwidth requests
from MC clients in a socket are routed to that socket's local
BPMP.

Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
---
 drivers/memory/tegra/mc.c           | 34 ++++++++++++++++++++------
 drivers/memory/tegra/mc.h           | 31 +++++++++++++++++++++++
 drivers/memory/tegra/tegra186-emc.c | 38 ++++++++++++++++++++++-------
 3 files changed, 86 insertions(+), 17 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index ec80ea9cc173..7bef758d0049 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -22,6 +22,8 @@
 
 #include "mc.h"
 
+static struct dentry *mc_debugfs_root;
+
 static const struct of_device_id tegra_mc_of_match[] = {
 #ifdef CONFIG_ARCH_TEGRA_2x_SOC
 	{ .compatible = "nvidia,tegra20-mc-gart", .data = &tegra20_mc_soc },
@@ -778,7 +780,7 @@ struct icc_node *tegra_mc_icc_xlate(const struct of_phandle_args *spec, void *da
 	struct icc_node *node;
 
 	list_for_each_entry(node, &mc->provider.nodes, node_list) {
-		if (node->id == spec->args[0])
+		if (tegra_mc_client_id_from_node(node) == spec->args[0])
 			return node;
 	}
 
@@ -834,6 +836,7 @@ const struct tegra_mc_icc_ops tegra_mc_icc_ops = {
  */
 static int tegra_mc_interconnect_setup(struct tegra_mc *mc)
 {
+	int node_id = dev_to_node(mc->dev);
 	struct icc_node *node;
 	unsigned int i;
 	int err;
@@ -854,31 +857,40 @@ static int tegra_mc_interconnect_setup(struct tegra_mc *mc)
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
 
@@ -957,7 +969,13 @@ static int tegra_mc_probe(struct platform_device *pdev)
 	if (IS_ERR(mc->regs))
 		return PTR_ERR(mc->regs);
 
-	mc->debugfs.root = debugfs_create_dir("mc", NULL);
+	if (!mc_debugfs_root)
+		mc_debugfs_root = debugfs_create_dir("mc", NULL);
+
+	if (dev_to_node(mc->dev) == NUMA_NO_NODE)
+		mc->debugfs.root = mc_debugfs_root;
+	else
+		mc->debugfs.root = debugfs_create_dir(dev_name(mc->dev), mc_debugfs_root);
 
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
index 03ebab6fbe68..e02f4d0229b9 100644
--- a/drivers/memory/tegra/tegra186-emc.c
+++ b/drivers/memory/tegra/tegra186-emc.c
@@ -13,6 +13,8 @@
 #include <soc/tegra/bpmp.h>
 #include "mc.h"
 
+static struct dentry *emc_debugfs_root;
+
 struct tegra186_emc_dvfs {
 	unsigned long latency;
 	unsigned long rate;
@@ -207,7 +209,14 @@ static int tegra186_emc_get_emc_dvfs_latency(struct tegra186_emc *emc)
 		return err;
 	}
 
-	emc->debugfs.root = debugfs_create_dir("emc", NULL);
+	if (!emc_debugfs_root)
+		emc_debugfs_root = debugfs_create_dir("emc", NULL);
+
+	if (dev_to_node(emc->dev) == NUMA_NO_NODE)
+		emc->debugfs.root = emc_debugfs_root;
+	else
+		emc->debugfs.root = debugfs_create_dir(dev_name(emc->dev), emc_debugfs_root);
+
 	debugfs_create_file("available_rates", 0444, emc->debugfs.root, emc,
 			    &tegra186_emc_debug_available_rates_fops);
 	debugfs_create_file("min_rate", 0644, emc->debugfs.root, emc,
@@ -239,7 +248,7 @@ tegra186_emc_of_icc_xlate(const struct of_phandle_args *spec, void *data)
 
 	/* External Memory is the only possible ICC route */
 	list_for_each_entry(node, &provider->nodes, node_list) {
-		if (node->id != TEGRA_ICC_EMEM)
+		if (tegra_mc_client_id_from_node(node) != TEGRA_ICC_EMEM)
 			continue;
 
 		return node;
@@ -260,6 +269,7 @@ static int tegra186_emc_interconnect_init(struct tegra186_emc *emc)
 {
 	struct tegra_mc *mc = dev_get_drvdata(emc->dev->parent);
 	const struct tegra_mc_soc *soc = mc->soc;
+	int node_id = dev_to_node(mc->dev);
 	struct icc_node *node;
 	int err;
 
@@ -273,26 +283,36 @@ static int tegra186_emc_interconnect_init(struct tegra186_emc *emc)
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
-- 
2.34.1

