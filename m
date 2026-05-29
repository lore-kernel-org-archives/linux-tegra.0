Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011056.outbound.protection.outlook.com [52.101.57.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6363238F248
	for <linux-tegra@vger.kernel.org>; Fri, 29 May 2026 17:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780076062; cv=fail; b=PXn7ekSGCF7uPaBvHFRzUrp9gLfZCo8M75cqmkZctlzw2KO3iPAVLDDjAJFBBnagRw7n9fe917Dpykfb7f3cgvGxm49rNv1X3nnAamJxS9fBdGM6V2Jx7niu3+pNE68Fz/xWH64ztzmJ9LSVlycX4jqbzEFFybHMqZ6kJUSC67U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780076062; c=relaxed/simple;
	bh=yA6Wzk7eBdQRIGf2F+JX1QFlcwiD7vbJzG8mnwEZP5E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mP4MRC2KuibBIq4w2nQjNhSUpkqLcyJqbKnmioVal3tZREztZw4qMuTzeehxN1QTz54RXQBdunBn7t7bh8362MqDrNpSWwKDGLguwyQrubL6o6+dXBi5oZjlB3okFZhKwQ7iFglKo7A/gq1ynjEYYpevjoxjA5Te0xGiQcv4bew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dQG17mda; arc=fail smtp.client-ip=52.101.57.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dQG17mda"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kYPpSIaG1xKPjl82pZiACxwuuCeJvf6zKP1m0T4MtRHCTIIXXBkiyH56h+F851tpVES/3Tl8XJ8qt+/TsQaoK86feV31lHJdYrmk2srj53lds128bcLuCL0rXqG57l0ZeipmHoEI3alLylXkuFcpS55y6EywALnb8QiTnxyAI8x9/ac9Z9ttUBluJeD8+vVsEP88uxv2ii8SdGEAFX0O9Xj2s3huN9lDTVfMHXBff84UWFTC/EpPCT39cQZc+9q2qQIfUk9LxipniKaoIDvArh7V8R3TzcofWxX+KsQTHWrGlGDLb2b9H1U4TzJed0igtHbOjyXNBO9xlw+szuJ/HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPrDv3WMIQCms0rq9MwknRqBPGmvwKqZx3oK0omAYFY=;
 b=JS+q7HTffjTlmuXzPtf+JKoG+pzVSgXtVhslOJi8E59upZZeRY7IPFTogY+wJZsSUxtcIpQuneCHxdalBgGQoCvERbQjb8f+DHraydaRw3Z0HiyhcsTLtVyIFL2VbjtNSxVx22qlxpoYhMQ55n+qIlw0NlnQi9uEGJR1dxyzWEKiq+PBQCLKXCmaUM7/5OPbObhSQXoW8o/A3HQf4HCRyQWN2ZXuYcGeUkuwrY5laULi7LI+fuCtmnm9QHW8vqmlqPtZETB3+bG6Z4tJ0G6jrTbs5jwmrR1NRJ0rUeQhaRSDi+nD6VgyUX1CYKJjq0BDBu5DO3uyGmLmy5tK+IH6Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPrDv3WMIQCms0rq9MwknRqBPGmvwKqZx3oK0omAYFY=;
 b=dQG17mdaEovHQyI+nENC6Bi2HQUaOUUQ4TmxdhdbIBY+w1/js6KPN1h09/wSxxvhzbn4b7D8PiMdxDIThIrJjEO5CL1uRcZP8XNJnMhr/rykafxS8pokQOoOs2Z5ufo2JQFo8ggzd6onmmlxoW1Id+oq7qDsXJHKcrvpDDZbleKdlrRPcmQKRgae0IjdHORL3xNTFwLA20qEHTCZXh+jfpgo8wuB7Gfw4/xFCGV+BpAjhdLO+G2Zi/bnV0alj8IvyFXgEPKlwEoFH9zOhOPhYe0CdSKdj+jwHeG4mphyO9X+ycsTPhRgqjnTxGzDVFCmkKFg92W/Ou7nN99DAx/ZqQ==
Received: from SJ0PR03CA0060.namprd03.prod.outlook.com (2603:10b6:a03:33e::35)
 by DS7PR12MB6309.namprd12.prod.outlook.com (2603:10b6:8:96::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Fri, 29 May
 2026 17:34:13 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:a03:33e:cafe::4d) by SJ0PR03CA0060.outlook.office365.com
 (2603:10b6:a03:33e::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Fri, 29
 May 2026 17:34:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 29 May 2026 17:34:13 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 29 May
 2026 10:33:53 -0700
Received: from moonraker.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 29 May
 2026 10:33:52 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>
CC: <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V3 2/2] firmware: tegra: bpmp: Add support for multi-socket platforms
Date: Fri, 29 May 2026 18:33:37 +0100
Message-ID: <20260529173337.155722-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529173337.155722-1-jonathanh@nvidia.com>
References: <20260529173337.155722-1-jonathanh@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|DS7PR12MB6309:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ba1b0ee-87a5-4d39-b666-08debda87fe7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	Usqh+HdNWOf8kfuTTJHQNid4TEqyO4323ZxnDXSvK6DhznmzsD7jrxqlmkR/WBRoMCwMBgjn2Jw2GxE6bt/hdjzyWD0SVsGRXLvN4kQz95cRWqWyOkHLRpAim9Z60DX4L/mz+bPm35bhuQqNpCJ4nP/gt0DftbaEnbIbi+eaTuqg4751cYcAkfay0dZxbTDoQPgTY+cu+iPOezUb/rn7Z9g9uD9p/CLTAIGB4ElFflftEjwOoFaF+XF1FebZPgj3riCZ66b+5jp8iNJEHNVrz3ONYhGJP2j7UWPxv9S73EoExrT/TjaXkVvf6R7JBsSlkPVsteuUQeAvojKVFe1AU3a2kltTDE5+QhNa3tf2uwILMMcQHwXZTYzjQVdbbaMz2hHAD8JqYSq7rvAVVwE9P3eheUKdRpd5u6TowX7D2Iltx5JBLbA2Z9r873pcWSNEKO+vS3s6P2jHWi7Dwx3wUa4ZP4IzZ+XKLYqnXzYUrssmJaJAEDNT8vXJxrdcUeXyz9g10vIaSnSV+lz1z4oN4CbHGlQTOJJT3+aTC5evfyU6aImFrqP8TV82xtZigP8a7ErjdhBIzQX11gHQEpC+QNbFEHM19E1iE24NfGVgpziFhHz00aRKr4yDAg+nrxST3bonrf30j8k7QA/ui3O+eNFAZn/TDK+6bPhT8f85qHcexnjYUEeKG2VCKtRHPaibrcKZsb9oz/Gc3MthQYl4LdFh8p0vYiygEEicioFfh6A=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gdUg2p7LwkehDNJrgJyavmzKiWs4vg8+8ObW6BkYDjzgkZSHtXHQyGZIsKB0f6O6FdU5pydD3oZwp/dTIC5iDJ1GlfBoHB0EkmL50fzRst/csrSKrO9XERx/LLmxGrw6m7T1iQ59v2yCgXDpimOxy5kFJ2b2GYXd4wi71MyDkCW4Z5mUeeyKNCtdwYjAqjKkOcFG01sA4ivLpUheSL556a4k4wdNFmpMZuiAusFi/uUr0hQ+Mzob5W4OAJFQPc5UV2vVPr3DPh8W1P5WgfPNwG1FX+RaqdH4Na80Vl8+o1XEfTHjq8dTgkmyBtDrHyXct5jwFUZvuxlCdrBZikKEWDhazSNYCRtL6WGPpqEcS5pPh5ulWJPAGUobAS5RgJRcxQswjSMr/OczyNzqf7tGLlP8vhPvGFmIbsGfvQME+3uP0rWhwmtGQWl5G9ayknTh
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 17:34:13.0579
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba1b0ee-87a5-4d39-b666-08debda87fe7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6309

On multi-socket platforms each socket has its own BPMP that is
registered with the kernel, so the existing single fixed "bpmp"
debugfs directory name cannot accommodate more than one instance.

Group the per-socket BPMP debugfs entries under a shared top-level
/sys/kernel/debug/bpmp/ directory, with each socket's BPMP device
under a "<numa-node-id>-bpmp" subdirectory:

  /sys/kernel/debug/bpmp/0-bpmp/...
  /sys/kernel/debug/bpmp/1-bpmp/...

For a multi-socket platform, the root debugfs bpmp/ directory is created
by the first BPMP device that is populated. For single-socket platforms,
the existing directory structure is preserved.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
Changes since V2:
- Use NUMA ID as a prefix and not a suffix for the debugfs directory
  name.
Changes since V1:
- Moved BPMP debugfs nodes for each socket under a top-level 'bpmp'
  directory.

 drivers/firmware/tegra/bpmp-debugfs.c | 44 ++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp-debugfs.c b/drivers/firmware/tegra/bpmp-debugfs.c
index 29037e2b3158..c05adba87869 100644
--- a/drivers/firmware/tegra/bpmp-debugfs.c
+++ b/drivers/firmware/tegra/bpmp-debugfs.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2017, NVIDIA CORPORATION.  All rights reserved.
  */
+#include <linux/cleanup.h>
 #include <linux/debugfs.h>
 #include <linux/dma-mapping.h>
 #include <linux/slab.h>
@@ -769,9 +770,21 @@ static int bpmp_populate_debugfs_shmem(struct tegra_bpmp *bpmp)
 	return err;
 }
 
+static DEFINE_MUTEX(bpmp_debugfs_root_lock);
+static struct dentry *bpmp_debugfs_root;
+
+static struct dentry *bpmp_debugfs_get_root(void)
+{
+	guard(mutex)(&bpmp_debugfs_root_lock);
+	if (!bpmp_debugfs_root)
+		bpmp_debugfs_root = debugfs_create_dir("bpmp", NULL);
+	return bpmp_debugfs_root;
+}
+
 int tegra_bpmp_init_debugfs(struct tegra_bpmp *bpmp)
 {
-	struct dentry *root;
+	struct dentry *root, *d;
+	char name[32];
 	bool inband;
 	int err;
 
@@ -780,11 +793,22 @@ int tegra_bpmp_init_debugfs(struct tegra_bpmp *bpmp)
 	if (!inband && !tegra_bpmp_mrq_is_supported(bpmp, MRQ_DEBUGFS))
 		return 0;
 
-	root = debugfs_create_dir("bpmp", NULL);
+	root = bpmp_debugfs_get_root();
 	if (IS_ERR(root))
 		return PTR_ERR(root);
 
-	bpmp->debugfs_mirror = debugfs_create_dir("debug", root);
+	if (dev_to_node(bpmp->dev) == NUMA_NO_NODE) {
+		d = root;
+	} else {
+		snprintf(name, sizeof(name), "%d-bpmp", dev_to_node(bpmp->dev));
+		d = debugfs_create_dir(name, root);
+		if (IS_ERR(d)) {
+			err = PTR_ERR(d);
+			goto out;
+		}
+	}
+
+	bpmp->debugfs_mirror = debugfs_create_dir("debug", d);
 	if (IS_ERR(bpmp->debugfs_mirror)) {
 		err = PTR_ERR(bpmp->debugfs_mirror);
 		goto out;
@@ -797,8 +821,18 @@ int tegra_bpmp_init_debugfs(struct tegra_bpmp *bpmp)
 		err = bpmp_populate_debugfs_shmem(bpmp);
 
 out:
-	if (err < 0)
-		debugfs_remove_recursive(root);
+	if (err < 0) {
+		if (!IS_ERR(d))
+			debugfs_remove_recursive(d);
+
+		guard(mutex)(&bpmp_debugfs_root_lock);
+		if (root == d) {
+			bpmp_debugfs_root = NULL;
+		} else if (simple_empty(root)) {
+			debugfs_remove(root);
+			bpmp_debugfs_root = NULL;
+		}
+	}
 
 	return err;
 }
-- 
2.43.0

