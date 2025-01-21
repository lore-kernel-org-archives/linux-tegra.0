Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2073.outbound.protection.outlook.com [40.107.236.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA8D1B4137;
	Tue, 21 Jan 2025 11:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737457810; cv=fail; b=aQkZoJvTRe8gbwXjWNUBZNh2FqxyrP7lifClfUAbG3ZvW7L4JaYI8YfgY+JOGboCDOGRw9w9mfFxgUu/qIP4Fw7z14F60brykAFGKBMJlrRB3DDBzYU3p9ESJZuFbW6Q7/EtTGO2m6NBJSMPISx9yj3/2AddON+vJbUngv3rPIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737457810; c=relaxed/simple;
	bh=bNG26iv2etZGFNJRaf/R7Flngymf0T+cLk4dOkiXvLY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=U2sK4nozWQ2XoMHi93MoS72wh6HT0jkmKL4zXTeuNxFUM5FQSOWIIuVHbJOlZeklIX0HcsWFM6VkUJJgzSQLUWKip8qIdGZZJvT67mD4nV2IXOJ04+7lrVvdPo2cgpTEvtysIUES937l5qXGQ7qEM9OoEXxFjCuQdo2VL3rI7o0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lrnipY61; arc=fail smtp.client-ip=40.107.236.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lrnipY61"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IFhzpyVgvmXg6IVgYZiOKnutLYf5q0bxTOqGyzUPijYgzEQ+Ob+faF8NYbBsxjZMb6e4GMdPA4BGeSX3+W7GpdPPGD+p2UDV8ZXFppnA/Kxt8ORLvg9kR8zwVGw82d7FP1xHYxxcJRfRegseniLljFe06J6u6CkBjZcEaTNvh9OLTwuE9viECMTjyYz88HzYmjyTqQzfGN6JWLzyznYtBgHIDfPfWzPguQwhUemrwOwougWKUCSu9jotUupzbe5K/w9QCupcK3a5FgtnP0tM/yvqObjmjsw67HStB3OubyhOV0m1MHJEebdckLnzIO2hmGozI9a2tmVt2a4Gpvckmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPrWkbSTJVK+WGrSDhyFtqFn09I8W/nZMP/aQ6Us7f8=;
 b=wfff0BxS6HAzOas3Ozql0BVvYEglNvvP3ceUG6H318R8vjMkLFwI2bjilwErvtv1R1wiw0Rc+x9y6A3mzgNJGv37r6Ca0Yck5DQBCdMwnaB9GkLVAh6SmXmTQwhT7af3dRrH/4hXM1+eneI7ra0j6ZOuTrQReZyG6xUsT7LEhrIwFSUixQ5gJ8QtlxTrldVTuH5mVouEX5sqAVgScXGGNyVhY+hzeJxLWmqMTeAY0qhglNeoAOE4x4hfb7zZn7xL0BFeBVO0bsK62yb3mfxKHbTkQP7SQpvO6iIOnKxuTUFgSEuyhsF8XGnR532elkhYowUDL8Tx9gglcBNoFpPcVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SPrWkbSTJVK+WGrSDhyFtqFn09I8W/nZMP/aQ6Us7f8=;
 b=lrnipY61PO9FJwtjLbnrbOK07UpTZoM2WmNd3EvdKQQRCBOM4QpTSeVtWf0UoRyg+jueoCOPIHyV7hlhtt6S/JYqq3tKTldE0wrkJXduf1nykLqhgsVEI65dj0kuYifMopH6UU5nPvOcYn0ZAiSXTnj7zHgIaiYoyAvCEASeDRSasgpZ4XV+9t7gZgDtOIvNIv8zdL5po3lbYAlQBz1GxW635OPpZFDMd6mey+bCJ+SmtIwZHWDzqqmHbrlBQaqxuJXa3vqzIoM1XpGr0wwq7jjVc7KdGMWhasO4Fxzq+crO3XLtLqsgGpThpqTn26JXWgvnb0QytMrgompI9lt6eQ==
Received: from BN9PR03CA0508.namprd03.prod.outlook.com (2603:10b6:408:130::33)
 by CY5PR12MB6252.namprd12.prod.outlook.com (2603:10b6:930:20::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Tue, 21 Jan
 2025 11:10:03 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:408:130:cafe::86) by BN9PR03CA0508.outlook.office365.com
 (2603:10b6:408:130::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.22 via Frontend Transport; Tue,
 21 Jan 2025 11:10:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Tue, 21 Jan 2025 11:10:02 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 21 Jan
 2025 03:09:52 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 21 Jan 2025 03:09:51 -0800
Received: from build-sheetal-bionic-20241119.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4
 via Frontend Transport; Tue, 21 Jan 2025 03:09:51 -0800
From: "Sheetal ." <sheetal@nvidia.com>
To: <broonie@kernel.org>, <linux-sound@vger.kernel.org>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<lgirdwood@gmail.com>, <jonathanh@nvidia.com>, <thierry.reding@gmail.com>,
	<mkumard@nvidia.com>, <spujar@nvidia.com>, Sheetal <sheetal@nvidia.com>
Subject: [PATCH] ASoC: tegra: Add interconnect support
Date: Tue, 21 Jan 2025 11:09:28 +0000
Message-ID: <20250121110928.1799377-1-sheetal@nvidia.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|CY5PR12MB6252:EE_
X-MS-Office365-Filtering-Correlation-Id: c4bd8840-4ed9-45da-f07a-08dd3a0c2745
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3ms21zoyrlC8qTgQF416hqEV0uX85oBsUZ8At2sDp4qL5ioPgEzBh6laTFD3?=
 =?us-ascii?Q?SZRXNyQ9SL0C9c4WhFH2Nxydr5oYa0pRJRKJLeHNn0aiIKEztrmLJtNeLxNG?=
 =?us-ascii?Q?wuuZyZlfBO71lqQq0JZHOVQmf8R1c5j3yGDHIee3oRbsqpynKmbohkGtTNlc?=
 =?us-ascii?Q?UcJpqDMXTBpGMGc3zw9vcPNrwcl8VtFlPeI7vvgPHql+cuOA5QpvR02enDbK?=
 =?us-ascii?Q?UPkZmwMcrpbxmEjGt3Dqu2cH6mjD/9K3HiGQkhuMI/hCCAwTa4EGesqT3Z2n?=
 =?us-ascii?Q?pGGQUAu52OSU3t/mCp7UKZ9GYd+UuC02z0/opor92KCKScHuzKcdyg7eZVGM?=
 =?us-ascii?Q?ZEbAQuLhy4KiDFvyasiSWYVWvT7fYCCAHYZcen2KELGjrGVDQYXQ9wDebAkw?=
 =?us-ascii?Q?5Bulgp0nM2YehySc3gyOqjxT70YMJqKAwnubYoijz1KW3bqeq73zIjUXddFd?=
 =?us-ascii?Q?2KZLI291ve+50JQeaVLTgRRAkwH4ffUhYC1M0Q1cJOWgpYl5kV6qwBhMzSla?=
 =?us-ascii?Q?cGukDCMVSE7oZt281Lj1Ri8ED5rr+NA1qnzZqkRbvuw4zQ+dIoKJsGODsOcC?=
 =?us-ascii?Q?7ZMYo1wJAB2kHfsR7sxKYPpLiYyzlCQK3KLvJJZugX4IUJF877c4kS5Cf6HR?=
 =?us-ascii?Q?3wVIR+Jc8f93SeElhu69a+X12ZOCSOoNvzhn5cmf3vUm3zVVmCvmvUfU5QbR?=
 =?us-ascii?Q?TK61JAQM2y2G19c5EQtdLWKt4CuJ05rwJMgLjhh6takS0Bo8Ow1Iyk3l9mZE?=
 =?us-ascii?Q?GBMJ32WfXyWLQz51LYfXS8E7+HGSXeLxjMeadwOJfqF0BKfEJDp+a4kIOqRE?=
 =?us-ascii?Q?/xbaNeyNBBH/xM74aDDiaukXZv4SxHDY4RdG9wS1ikb69Wy5HvXI5H/W8sn+?=
 =?us-ascii?Q?TX3dr1B4TBI2Srgqq+f5anPubxcsxWwdELbNDWp5E+zng+tYxUQAYzdxVSzU?=
 =?us-ascii?Q?DMW5iT2TiNuAV5UZEfuwjuTiJQhSmqKoCb0mdfLBtyvOkGmHHBWBftxqZSc2?=
 =?us-ascii?Q?9+CkPQzSXe8SgpCOMOKXC4pY4hxHWxGRATmUVO+UYJTmLHnft9LMJ/f7cxyM?=
 =?us-ascii?Q?1Orc7ptjVscOZMAQ4zK7Rjs3ho0A2yNLfvzwLL5OfYsWCDILLsBf0Wln7tx0?=
 =?us-ascii?Q?zfxSyVjN+31AnGajnLuNLGPBO2e/wC5ddABkbcJTdjSYSy302exmKHxWuB21?=
 =?us-ascii?Q?SbsU3R0RJz6te77ggZ5xmdr1DpLUo9rQUsQHxqmHmE2LMjSSoQIeOCUtZA1f?=
 =?us-ascii?Q?isuU0CBWBTkAB8xhg5qulDvD0ZsyBQVBaCrNNAHnKjrsQb7sZR//ei23E40V?=
 =?us-ascii?Q?OoMJH6oippjh2tXvo7nmnQyKt5T3sVBvtL4/4br8Wf6ESg9bjVGlbBhZQ3D/?=
 =?us-ascii?Q?koqMNmYpDnen2CwFThZBKmsqlugt4Szg6aS6jY6YIsRasZvuih3SJ4Z57WiR?=
 =?us-ascii?Q?AXOAbMM+RrR1K7+TewhWFUj0xDitu0rAnHSldQu+tJ+n9jW52LXd9XK5yTc7?=
 =?us-ascii?Q?NsNGK+ZH+RC6aVY=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 11:10:02.7360
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4bd8840-4ed9-45da-f07a-08dd3a0c2745
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6252

From: Sheetal <sheetal@nvidia.com>

Add interconnect framework support to set required audio bandwidth
based on PCM device usage. The maximum bandwidth is determined by
the number of APE PCM devices and maximum audio format supported.

If interconnect property is not defined or INTERCONNECT config
is not enabled then the audio usecase will still function.

Validate bandwidth updates by reading the interconnect summary sysfs
node during PCM device open and close operations.

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/Makefile          |   2 +-
 sound/soc/tegra/tegra210_admaif.c |  24 +++++-
 sound/soc/tegra/tegra210_admaif.h |   9 +-
 sound/soc/tegra/tegra_isomgr_bw.c | 132 ++++++++++++++++++++++++++++++
 sound/soc/tegra/tegra_isomgr_bw.h |  31 +++++++
 5 files changed, 192 insertions(+), 6 deletions(-)
 create mode 100644 sound/soc/tegra/tegra_isomgr_bw.c
 create mode 100644 sound/soc/tegra/tegra_isomgr_bw.h

diff --git a/sound/soc/tegra/Makefile b/sound/soc/tegra/Makefile
index cea4b0d54378..defea7f53f11 100644
--- a/sound/soc/tegra/Makefile
+++ b/sound/soc/tegra/Makefile
@@ -13,7 +13,7 @@ snd-soc-tegra210-dmic-y := tegra210_dmic.o
 snd-soc-tegra210-i2s-y := tegra210_i2s.o
 snd-soc-tegra186-asrc-y := tegra186_asrc.o
 snd-soc-tegra186-dspk-y := tegra186_dspk.o
-snd-soc-tegra210-admaif-y := tegra210_admaif.o
+snd-soc-tegra210-admaif-y := tegra210_admaif.o tegra_isomgr_bw.o
 snd-soc-tegra210-mvc-y := tegra210_mvc.o
 snd-soc-tegra210-sfc-y := tegra210_sfc.o
 snd-soc-tegra210-amx-y := tegra210_amx.o
diff --git a/sound/soc/tegra/tegra210_admaif.c b/sound/soc/tegra/tegra210_admaif.c
index 58fdb0e79954..f56d1e03239d 100644
--- a/sound/soc/tegra/tegra210_admaif.c
+++ b/sound/soc/tegra/tegra210_admaif.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-// SPDX-FileCopyrightText: Copyright (c) 2020-2024 NVIDIA CORPORATION & AFFILIATES.
+// SPDX-FileCopyrightText: Copyright (c) 2020-2025 NVIDIA CORPORATION & AFFILIATES.
 // All rights reserved.
 //
 // tegra210_admaif.c - Tegra ADMAIF driver
@@ -13,6 +13,7 @@
 #include <linux/regmap.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
+#include "tegra_isomgr_bw.h"
 #include "tegra210_admaif.h"
 #include "tegra_cif.h"
 #include "tegra_pcm.h"
@@ -262,6 +263,18 @@ static int tegra_admaif_set_pack_mode(struct regmap *map, unsigned int reg,
 	return 0;
 }
 
+static int tegra_admaif_prepare(struct snd_pcm_substream *substream,
+				struct snd_soc_dai *dai)
+{
+	return tegra_isomgr_adma_setbw(substream, dai, true);
+}
+
+static void tegra_admaif_shutdown(struct snd_pcm_substream *substream,
+				  struct snd_soc_dai *dai)
+{
+	tegra_isomgr_adma_setbw(substream, dai, false);
+}
+
 static int tegra_admaif_hw_params(struct snd_pcm_substream *substream,
 				  struct snd_pcm_hw_params *params,
 				  struct snd_soc_dai *dai)
@@ -554,6 +567,8 @@ static const struct snd_soc_dai_ops tegra_admaif_dai_ops = {
 	.probe		= tegra_admaif_dai_probe,
 	.hw_params	= tegra_admaif_hw_params,
 	.trigger	= tegra_admaif_trigger,
+	.shutdown	= tegra_admaif_shutdown,
+	.prepare	= tegra_admaif_prepare,
 };
 
 #define DAI(dai_name)					\
@@ -800,6 +815,12 @@ static int tegra_admaif_probe(struct platform_device *pdev)
 
 	regcache_cache_only(admaif->regmap, true);
 
+	err = tegra_isomgr_adma_register(&pdev->dev);
+	if (err) {
+		dev_err(&pdev->dev, "Failed to add interconnect path\n");
+		return err;
+	}
+
 	regmap_update_bits(admaif->regmap, admaif->soc_data->global_base +
 			   TEGRA_ADMAIF_GLOBAL_ENABLE, 1, 1);
 
@@ -851,6 +872,7 @@ static int tegra_admaif_probe(struct platform_device *pdev)
 
 static void tegra_admaif_remove(struct platform_device *pdev)
 {
+	tegra_isomgr_adma_unregister(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 }
 
diff --git a/sound/soc/tegra/tegra210_admaif.h b/sound/soc/tegra/tegra210_admaif.h
index 96686dc92081..748f886ee74e 100644
--- a/sound/soc/tegra/tegra210_admaif.h
+++ b/sound/soc/tegra/tegra210_admaif.h
@@ -1,8 +1,8 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * tegra210_admaif.h - Tegra ADMAIF registers
+/* SPDX-License-Identifier: GPL-2.0-only
+ * SPDX-FileCopyrightText: Copyright (c) 2020-2025 NVIDIA CORPORATION & AFFILIATES.
+ * All rights reserved.
  *
- * Copyright (c) 2020 NVIDIA CORPORATION.  All rights reserved.
+ * tegra210_admaif.h - Tegra ADMAIF registers
  *
  */
 
@@ -157,6 +157,7 @@ struct tegra_admaif {
 	unsigned int *mono_to_stereo[ADMAIF_PATHS];
 	unsigned int *stereo_to_mono[ADMAIF_PATHS];
 	struct regmap *regmap;
+	struct tegra_adma_isomgr *adma_isomgr;
 };
 
 #endif
diff --git a/sound/soc/tegra/tegra_isomgr_bw.c b/sound/soc/tegra/tegra_isomgr_bw.c
new file mode 100644
index 000000000000..539c989514db
--- /dev/null
+++ b/sound/soc/tegra/tegra_isomgr_bw.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// SPDX-FileCopyrightText: Copyright (c) 2025 NVIDIA CORPORATION & AFFILIATES.
+// All rights reserved.
+//
+// ADMA bandwidth calculation
+
+#include <linux/interconnect.h>
+#include <linux/module.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include "tegra_isomgr_bw.h"
+#include "tegra210_admaif.h"
+
+/* Max possible rate is 192KHz x 16channel x 4bytes */
+#define MAX_BW_PER_DEV 12288
+
+int tegra_isomgr_adma_setbw(struct snd_pcm_substream *substream,
+			    struct snd_soc_dai *dai, bool is_running)
+{
+	struct device *dev = dai->dev;
+	struct tegra_admaif *admaif = snd_soc_dai_get_drvdata(dai);
+	struct tegra_adma_isomgr *adma_isomgr = admaif->adma_isomgr;
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_pcm *pcm = substream->pcm;
+	u32 type = substream->stream, bandwidth = 0, pcm_id;
+	int sample_bytes;
+
+	if (!adma_isomgr)
+		return 0;
+
+	if (!runtime || !pcm)
+		return -EINVAL;
+
+	if (pcm->device >= adma_isomgr->max_pcm_device) {
+		dev_err(dev, "%s: PCM device number %d is greater than %d\n", __func__,
+			pcm->device, adma_isomgr->max_pcm_device);
+		return -EINVAL;
+	}
+
+	/*
+	 * No action if  stream is running and bandwidth is already set or
+	 * stream is not running and bandwidth is already reset
+	 */
+	if ((adma_isomgr->bw_per_dev[type][pcm_id] && is_running) ||
+	    (!adma_isomgr->bw_per_dev[type][pcm_id] && !is_running))
+		return 0;
+
+	if (is_running) {
+		sample_bytes = snd_pcm_format_width(runtime->format) / 8;
+		if (sample_bytes < 0)
+			return sample_bytes;
+
+		/* KB/s kilo bytes per sec */
+		bandwidth = runtime->channels * (runtime->rate / 1000) *
+				sample_bytes;
+	}
+
+	mutex_lock(&adma_isomgr->mutex);
+
+	if (is_running) {
+		if (bandwidth + adma_isomgr->current_bandwidth > adma_isomgr->max_bw)
+			bandwidth = adma_isomgr->max_bw - adma_isomgr->current_bandwidth;
+
+		adma_isomgr->current_bandwidth += bandwidth;
+	} else {
+		adma_isomgr->current_bandwidth -= adma_isomgr->bw_per_dev[type][pcm_id];
+	}
+
+	mutex_unlock(&adma_isomgr->mutex);
+
+	adma_isomgr->bw_per_dev[type][pcm_id] = bandwidth;
+
+	dev_dbg(dev, "Setting up bandwidth to %d KBps\n", adma_isomgr->current_bandwidth);
+
+	return icc_set_bw(adma_isomgr->icc_path_handle,
+			  adma_isomgr->current_bandwidth, adma_isomgr->max_bw);
+}
+EXPORT_SYMBOL(tegra_isomgr_adma_setbw);
+
+int tegra_isomgr_adma_register(struct device *dev)
+{
+	struct tegra_admaif *admaif = dev_get_drvdata(dev);
+	struct tegra_adma_isomgr *adma_isomgr;
+	int i;
+
+	adma_isomgr = devm_kzalloc(dev, sizeof(struct tegra_adma_isomgr), GFP_KERNEL);
+	if (!adma_isomgr)
+		return -ENOMEM;
+
+	adma_isomgr->icc_path_handle = devm_of_icc_get(dev, "write");
+	if (IS_ERR(adma_isomgr->icc_path_handle))
+		return dev_err_probe(dev, PTR_ERR(adma_isomgr->icc_path_handle),
+				"failed to acquire interconnect path\n");
+
+	/* Either INTERCONNECT config OR interconnect property is not defined */
+	if (!adma_isomgr->icc_path_handle) {
+		devm_kfree(dev, adma_isomgr);
+		return 0;
+	}
+
+	adma_isomgr->max_pcm_device = admaif->soc_data->num_ch;
+	adma_isomgr->max_bw = STREAM_TYPE * MAX_BW_PER_DEV * adma_isomgr->max_pcm_device;
+
+	for (i = 0; i < STREAM_TYPE; i++) {
+		adma_isomgr->bw_per_dev[i] = devm_kzalloc(dev, adma_isomgr->max_pcm_device *
+							  sizeof(u32), GFP_KERNEL);
+		if (!adma_isomgr->bw_per_dev[i])
+			return -ENOMEM;
+	}
+
+	adma_isomgr->current_bandwidth = 0;
+	mutex_init(&adma_isomgr->mutex);
+	admaif->adma_isomgr = adma_isomgr;
+
+	return 0;
+}
+EXPORT_SYMBOL(tegra_isomgr_adma_register);
+
+void tegra_isomgr_adma_unregister(struct device *dev)
+{
+	struct tegra_admaif *admaif = dev_get_drvdata(dev);
+
+	if (!admaif->adma_isomgr)
+		return;
+
+	mutex_destroy(&admaif->adma_isomgr->mutex);
+}
+EXPORT_SYMBOL(tegra_isomgr_adma_unregister);
+
+MODULE_AUTHOR("Mohan Kumar <mkumard@nvidia.com>");
+MODULE_DESCRIPTION("Tegra ADMA Bandwidth Request driver");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/tegra/tegra_isomgr_bw.h b/sound/soc/tegra/tegra_isomgr_bw.h
new file mode 100644
index 000000000000..86db3cfd4e43
--- /dev/null
+++ b/sound/soc/tegra/tegra_isomgr_bw.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ * SPDX-FileCopyrightText: Copyright (c) 2025 NVIDIA CORPORATION & AFFILIATES.
+ * All rights reserved.
+ *
+ * tegra_isomgr_bw.h - Definitions for ADMA bandwidth calculation
+ *
+ */
+
+#ifndef __TEGRA_ISOMGR_BW_H__
+#define __TEGRA_ISOMGR_BW_H__
+
+/* Playback and Capture streams */
+#define STREAM_TYPE 2
+
+struct tegra_adma_isomgr {
+	/* Protect pcm devices bandwidth */
+	struct mutex mutex;
+	/* interconnect path handle */
+	struct icc_path *icc_path_handle;
+	u32 *bw_per_dev[STREAM_TYPE];
+	u32 current_bandwidth;
+	u32 max_pcm_device;
+	u32 max_bw;
+};
+
+int tegra_isomgr_adma_register(struct device *dev);
+void tegra_isomgr_adma_unregister(struct device *dev);
+int tegra_isomgr_adma_setbw(struct snd_pcm_substream *substream,
+			    struct snd_soc_dai *dai, bool is_running);
+
+#endif
-- 
2.17.1

