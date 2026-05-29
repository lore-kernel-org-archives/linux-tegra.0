Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011030.outbound.protection.outlook.com [52.101.52.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDD234040D
	for <linux-tegra@vger.kernel.org>; Fri, 29 May 2026 15:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780067465; cv=fail; b=KAou62XgtSqyRRYeuRlbf4kuCe1MzUnBDQMF6wKBhIk8a2xc33wVtTrBc4taop0USNGxTybNwYwE98Og0IegpLv8TTJMVcDPgrOBYGYIcRU+kqN4viLVk7ZksWIpVWJoHNqKoCnPsYkKgx/tubsxrw7e6/4WMSHSTTKFciHu1LY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780067465; c=relaxed/simple;
	bh=/YxdPQuQT3vmQuL6I0+G16FkqORZui1luMrrTSV03N4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ePlzcuouZeywPgzXUkzKxJz2J/MjDlYiuoP87TJpvQ1h11i8+/XSCcibAXIg2Up/SHvFsbYs5Wv9Vi6Yu683cT0FJCAxdE8wGb+NbVM/MzOo6AtMpGPdyiYHgnKMUICSm2Er+JtRcrs3xvKFzpdfZRLN2ErYCbB27Gc5Rf672Mk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WiwnLFQd; arc=fail smtp.client-ip=52.101.52.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WiwnLFQd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YE7gqNZQOQg5L0ySejUbzjC8NS/ne/xACFVCDoZGnCOB4poWqs+5vWrOciZAoulCPd5U4AUz5LczOmvJ0U28taGmOKaPVA1tZXyxtthk5vhdb69R0CatPfBXJDUEwZUOReqAuPwe3TKM3sn9R+T1LvFAE3u2MVZUgtgHJgfFpMZvgCtoV5vPGj2GAj2gf6RwUi6MFXXbpeJ+spk9BhdWiIrH1OAPVzbZpnq0SWwwF/p/f0HVWsGf2ayQ7yk/egzYtJEEZ1MH9tsbG+3X9X4CJ4knj2vO6j1vWkgf4u4W/NIP+ykuRM9c+8hLOtU0ne1zM2ScvnPbRe9fG51h8kk/mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WjppSEwYCdrnPkICckhtFVaw/53/bzFmjtGWFQkTeww=;
 b=Tdxhm0D/8eqN3xQtVsZne2fqNWCnSiYYrwtUakPReJkw+FRBRU4ilik0BXq/peSrhrfRjMFkb5XSQ+AQaLmbWYI4VKtFUxgZN17ZgE9JwGCIrx49qkATi1nQavlfCbjU0Ph+4hzQiykleAIkRpSjnbtK7BAXMoE3mJUYDOcAlJWxjspd47yuENFOWFurHMYPrYiFSGTPoIIto789l+PQeITs7wPxhWNCKf+v5/FbONoGo2MTgSKDfcFZ0DcF+APzXmnjm9eSibqnmiQVFsi7l7VJS5I8XzOzcTldjUMK8FtFG1wMhH8jdCo7h7+S3TdypA8NUfyUBkeI5c+Q/LGC8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WjppSEwYCdrnPkICckhtFVaw/53/bzFmjtGWFQkTeww=;
 b=WiwnLFQdfzg5C9f/k1XtzWDkLjLzaggs/KQRIi9LYx96PdunhdAQpU18TMv1xK6KLypyN2sjHWrvcXrX0R/PrNBA5t8UMrJt0x1nTlEUJB7SUdwTqS8DRLA1QvIabkcfyzta26JBEIeKrJnmVUZTdYYfr8ov3TY9Xre4DKMVUN9IM8IjXgWz/3OQnULZjkPOkf2FB96mgAlR38HW25Jc17zQwJkP6bGNFEOuXhTamIFs0XHcfYHu9iofth0J0gdrAEhpk7q3EYcedcYvqyNtQKK7vF9ekD2D34HE6WvsTeQD9d3+CLDbM5qmmCmWYdIdWROMz7BDhZuURRM6Mpq72A==
Received: from BN9PR03CA0467.namprd03.prod.outlook.com (2603:10b6:408:139::22)
 by CH3PR12MB9220.namprd12.prod.outlook.com (2603:10b6:610:198::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Fri, 29 May
 2026 15:10:59 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:139:cafe::2a) by BN9PR03CA0467.outlook.office365.com
 (2603:10b6:408:139::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Fri, 29
 May 2026 15:10:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 29 May 2026 15:10:58 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 29 May
 2026 08:10:42 -0700
Received: from moonraker.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 29 May
 2026 08:10:40 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>
CC: <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2 2/2] firmware: tegra: bpmp: Add support for multi-socket platforms
Date: Fri, 29 May 2026 16:08:46 +0100
Message-ID: <20260529150847.70545-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529150847.70545-1-jonathanh@nvidia.com>
References: <20260529150847.70545-1-jonathanh@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|CH3PR12MB9220:EE_
X-MS-Office365-Filtering-Correlation-Id: 89291b6c-cf25-4aa5-c3b1-08debd947d3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	9keGItnTTTJ7dPdZfQ7P//TVVL79wIhMXC7Mg3dg0Mj8wpRPThn3ySbvkrn0LQ5cG2MW6JpXsd5j0P7w5dNhS1vqHl/KU54D2kiGQ5t7nnYR+qPH0PhLMTTaf1OmAGn/T9L8hu86W0RG2YaiztGbUDiHRCvDCPCQ8u+4dPFpmTqnHgXkzqTHvoXFNYzQcEoUHFlWSihOcfYCWI0i4S3rkbvxBVP9Y74TaP9s2dvz2kie67iWSYh2sUSPSpus4t/XXjnx7/qNh753QYTjimlzVAyeUdjKsl3TvMLdyc8MwbsIylvSMH3YLwAHiEzYEY/GLtulpiuYjY0KxuylSTyc2AuxL4Iab+qDmKFboOWOmDbQEHUKwkP9vGpvhJU22+FGWZdLfwclt626Pgnt68RLo/B1a5kT5tXoEc82ItFWTSraoZcmRrElbs6Vf5IdV6XRF3QLFsc3J21Vbgl1rlMCzviHWVnpSnjb8Y2m+gtq+qTWPifqqXc5KEwkQ41TVBFzhf8Q4qGVCJA2c0reV1vP0kQQhFq2Gt/Pcz5dOqMgIwIdwv7TWBTqNsa3i2Vh1igBfY47xzZUVldQWGTapYbPRgzI2RqhV5zDqPk3lIeSdPGNTI180SXZSa1sgJqEJlyb1BBScjcX2OShXXvctbccnFZB2HvAod6yXEEEOXSMx7Kni6cAOF13B0sEf7oCAN+TaOIFGjLxnXMPJIOz3XS7x8asZ4apxN9lBNe8PggBUYw=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BXXj6Wmm7AlkgSXPQEsqsCHoUy9QVc6t3FUS1rScTPYpRitgFF5LAj8zvoTDxNEBT55VU3cE63pF0O8NJ6rW5BWzd0GayBPIIp/AJF98r+KF27XJrRT22ZeOQca0J8URL6ZMuGCPFM9ZZCnNQpNzMTI4Ovv5kjSMHLl+KKq1zvv5gUrPBDhjH0MfNAh2nmASob5aXJzGohtlFfJXxtg3bOqgvsCM0bfstNwbrC/7H89vhDvQ7vSPNb6mlKKegYLkcIbNojpElkW8CRn5BOh8yWXORHz6Xa3+sYEsLa598gzDqAX3QXpwQV5ZEPnFwhR5xdas+d54XRjiKjpqiRe9bYK6pYjlzjo5UR37VsLyuEbjUYl6VD1hOCVWzysJJq8f2xDhKpWUy8etK7ExBKGjncq9JFfxc4JBg2lkU7YaoeA95RB+XP6jUToQvHZIAIw1
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 15:10:58.5208
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89291b6c-cf25-4aa5-c3b1-08debd947d3b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9220

On multi-socket platforms each socket has its own BPMP that is
registered with the kernel, so the existing single fixed "bpmp"
debugfs directory name cannot accommodate more than one instance.

Group the per-socket BPMP debugfs entries under a shared top-level
/sys/kernel/debug/bpmp/ directory, with each socket's BPMP device
under a "bpmp.<numa-node-id>" subdirectory:

  /sys/kernel/debug/bpmp/bpmp.0/...
  /sys/kernel/debug/bpmp/bpmp.1/...

For a multi-socket platform, the root debugfs bpmp/ directory is created
by the first BPMP device that is populated. For single-socket platforms,
the existing directory structure is preserved.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
Changes since V1:
- Moved BPMP debugfs nodes for each socket under a top-level 'bpmp'
  directory.

 drivers/firmware/tegra/bpmp-debugfs.c | 44 ++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp-debugfs.c b/drivers/firmware/tegra/bpmp-debugfs.c
index 29037e2b3158..28a59ef1af12 100644
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
+		snprintf(name, sizeof(name), "bpmp.%d", dev_to_node(bpmp->dev));
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

