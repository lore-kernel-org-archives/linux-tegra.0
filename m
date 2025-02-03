Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01751C3BEE;
	Mon,  3 Feb 2025 10:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738580004; cv=fail; b=pxMv3dIZ2wjTxnUG9M+bahcLD/mN/XQE/GSaSgelxpypI6R5A3kFOgy7jSDtAsglfmU2w8qzJG/uKpCi2lULcoaZ40hDS+Va3rvCzT+cFqhBCjO1UzxZ/P8Rha5B0kjlxCrggU+6bqdpkVWZWA6NS41X2crQhOgw5Gz2gpEvb30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738580004; c=relaxed/simple;
	bh=UBbEHxZvcXeiHEVv7bID1CfzxyrfmYnVw9ITInXpwDM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=stsLUaNwlrk5WegVhs9wFL5MfU6amKAfxtYCYzczxe/BvOFkmMeH3cY7si/6sdrQ6wh50sdmUfTPe+ZWpQGwLi/Af7zYsO+s9XvNYLu1+J2XRZOyqrdiP9zG76Ck347oUg+v2mRt7XJ6Sk//uOkIGHVMTn62NrOCp+AKOtL+m0c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uWR/nSk3; arc=fail smtp.client-ip=40.107.220.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uWR/nSk3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w5ot0yuNMlWIsY0kskFxIiX+bgNxaYwtSsVn3M3L+MkZVJIMu6Ky7SGhsCTU7RFpfdc9s91Pov+iB+bdt7b4onHAzGhG2x1/m2mzvI3sHSgX4G9SscmUfAFJUn13YSIy3Y/QvPM9yTNdOzZ38IRv5ziAKtDwYNNqSdiVefEDt5a+lPYZOxqSz8Mpv+GMFLGKks43IxeUsN+JQmLfIce4/g1T1gXdlKZqA42wqHhF2Qfh86WyMDXAOTmmHZWdOlSlaln5KSHc+m8wS7hWSKUIJQcO1/EvLGgjROWUZhryaepY6hFChjaczOgEsWnvkUfMZOmzpYWEo4xo4k0voU7aDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEeNjKPwvrvSVpbKg11xh0LWsHVVo6mHTUhPuN/UHGM=;
 b=Z0DdiRRLoHQc34YwAI5aai+P69XXJXSFoXTWRjBYJxSuZ4CaQNLWNAvhYwMy3p8Y1ZvtO6/ezbsPWfZf5jvgbt0YIykWN/Nud5eC0jJk+orcpMLV3Jpne4HybXlb8EhYmtyk5lZiQ0mR0VUo+TDztbKgw5VyOL+18lCKR92dTffy19VBar8YupIZOA4QDDRzgtOgyH/Pq7VLmEiYjYT3lwMnPfxIdzoq2n113FiYJgx4Npx8Qnn1uT94RVU2WJ4YIenWnwxX3ZuHdix1DdvfXRJDZcERNrP87Z67fF4vtkM4LIHQtZFqouR2+RSh7UCjaiVoZxs8d3IQiriKHbczNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEeNjKPwvrvSVpbKg11xh0LWsHVVo6mHTUhPuN/UHGM=;
 b=uWR/nSk3zirE2RpNEbblIw8R/zJz2YbNjgO9m7MVowMJKg1/9Xi2u7an3yUcgTY97RhUmAeBvWs5HBaua1ENu8r47GtzaQe0Es5+E5grC6n1PyY7Ck90ZVx2v7h2zRLoyyUNOBt4zmI7PfJSF2yuPmqXWldS44wdPryx7HDaj0U8lkgbrT51DzIz8e3LqRh8f6SXA+uF864YT2+HfYhRMM3Dgd0T4tgpeGmM/A8jx3IagTWCsjPdojxqcastWqla8HFG9LKXSvMbA8j1f5E7rLhQ8kPWRo/F5n4b3usVSfaeSgnT+7We2oya5RyS5GWVjrBWTOqNmGa4HaX6BvIbuQ==
Received: from SJ0PR05CA0058.namprd05.prod.outlook.com (2603:10b6:a03:33f::33)
 by IA1PR12MB8238.namprd12.prod.outlook.com (2603:10b6:208:3f9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 10:53:17 +0000
Received: from CY4PEPF0000E9CD.namprd03.prod.outlook.com
 (2603:10b6:a03:33f:cafe::bb) by SJ0PR05CA0058.outlook.office365.com
 (2603:10b6:a03:33f::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.24 via Frontend Transport; Mon,
 3 Feb 2025 10:53:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CY4PEPF0000E9CD.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Mon, 3 Feb 2025 10:53:17 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 3 Feb 2025
 02:53:06 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 3 Feb 2025 02:53:06 -0800
Received: from build-sheetal-bionic-20241119.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14
 via Frontend Transport; Mon, 3 Feb 2025 02:53:06 -0800
From: "Sheetal ." <sheetal@nvidia.com>
To: <broonie@kernel.org>, <linux-sound@vger.kernel.org>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<jonathanh@nvidia.com>, <thierry.reding@gmail.com>, <mkumard@nvidia.com>,
	<spujar@nvidia.com>, Sheetal <sheetal@nvidia.com>
Subject: [PATCH V2] ASoC: tegra: Add interconnect support
Date: Mon, 3 Feb 2025 10:53:04 +0000
Message-ID: <20250203105304.4155542-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CD:EE_|IA1PR12MB8238:EE_
X-MS-Office365-Filtering-Correlation-Id: 1748a32c-551d-40ce-ff26-08dd4440f74f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ut9VYP/QLx462UaBeqEnV6oEJC0fDyAjFWUd8TkQUKBPYSGxhDKI49Qnhh6A?=
 =?us-ascii?Q?0i0LSRFsrHhfrCf5/IBrYi4c2eblw2LWvqN/n5jbhdldWEytNLwXCyIti2bG?=
 =?us-ascii?Q?2MDimQjAs2TLQpRszDJollvWgau9jf2nlDC9dZ3aCGc0hixO6UpI4aw/ERRG?=
 =?us-ascii?Q?/WxH3RnLK6Ra2QmkhZrOUqMT1wgzyLnFKlQT4zTnFiBFHQwiqlwSusQ2K0io?=
 =?us-ascii?Q?kp0I7FkQ8Mc5ohZ7teY/i5k+KboQgOkkCk1RnzzNSPiY3yFDVBsRO16TDPiS?=
 =?us-ascii?Q?fnxEGy034TRGBuOI/5TgUjk8rimO9IAx3G2vxNdr5ndtKt1Ed0+eNfN5t8OX?=
 =?us-ascii?Q?divX+xuiJfySH/NLR/lkAVZBdiaDP9daPADVrqHbj4NRm+8399lt2DAF3ER0?=
 =?us-ascii?Q?DOOnpMF5vFUVW6GIhdys+uD1jLEEHK8y1SwTXgCcn0t5+gCIm9SGvk30rhzS?=
 =?us-ascii?Q?BkxC0COq7keAapdSXpoJpqK/PK/7NtbwxeNWxn1r1CEkFlMGqEcLoOIvd5kX?=
 =?us-ascii?Q?MTA8xV0vYVAQYoyDLfUVjH5SI38VWGIP7XWW+2jgUp8yfsAhurTQKrhVnpDw?=
 =?us-ascii?Q?GuUvQqP9FM7ZYKv8//KIWkbpUSGcBD/pZbweZJvQaRgdHdQw7mfKkNX5WMvj?=
 =?us-ascii?Q?XTQHJqnabxOVc+LC0LbYy1WA/xWs6Sgjx009oTegZmlEYuFzNcuOg6NyMvcY?=
 =?us-ascii?Q?KtK4yAgzVEbdJh8cYKCnCaxyO4yZalSyu7F2Ieyknrrk5oiIC43INi624Zey?=
 =?us-ascii?Q?UHfKpO9s2HV1SDULpNoja2yAI9zNEhB75btaaVjQWKmqn4gZxmKEhFbMtSFj?=
 =?us-ascii?Q?qpjotkT2Pa5AEOTRfccfq5Bo94uv0MA097H3/1l9Z6dq10rZLcY8TBCIF19b?=
 =?us-ascii?Q?OtVw5oUZV36xfM8OjietWE+4Xg4u1+ryj3nn+FSRW8E7AIf+GtUAtSu2at38?=
 =?us-ascii?Q?IOBOQlE9HK+hJTgUfWcD6MjxjQxYN0RYc92yLUY2JW6GKyB2SKMT/cKgtlUP?=
 =?us-ascii?Q?JIIgklhRjsQUupBQjjKSNtkX8Sl+SEz8ofZQdW7zxyC4x2UqzAFcNtIeLDCb?=
 =?us-ascii?Q?4G5/dXVc68EsiWPBJjawB9BBPbYw25MzzwPKLRUEBi2JxXZSkDeM8ffdWYmD?=
 =?us-ascii?Q?sgjirdeUUymNpFkTi+jQUA5Y6ubmziQHcsHtahxFojjhsAFAMh8gL28cyCFm?=
 =?us-ascii?Q?5ozsoy6n2QNiOPXfGww1gP0NYOOz/Kv6WBI3VTJ6mcJd1PSmR8OUEb10prg4?=
 =?us-ascii?Q?359r+/xMfMPl8KxUobKrFrP3+dYUhOCYBDufeAkr+mmNlkpWKXnI4N+8KotB?=
 =?us-ascii?Q?oIS+y5BMdvCL7d5Mu7XNw4XOdKghSDvkEjeuaG+Qm39fKu/TMV2U8pEklvOR?=
 =?us-ascii?Q?dznCFtXrr4zrzZrbDXCXxhlUQXsbCoTCj85Id29tlkb/ypWH3mQdYsu/eBm3?=
 =?us-ascii?Q?hQSMZtHP1aRereINpEZs/W0FWuJc7y5SHLlpz3BZkO3rpvq0BahDIdKt4C3K?=
 =?us-ascii?Q?iMSrUqVXJBJDXqc=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 10:53:17.2882
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1748a32c-551d-40ce-ff26-08dd4440f74f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8238

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
v2: Fix pcm_id parameter uninitialized warning.
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
index 000000000000..7789efe13873
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
+	u32 type = substream->stream, bandwidth = 0;
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
+	if ((adma_isomgr->bw_per_dev[type][pcm->device] && is_running) ||
+	    (!adma_isomgr->bw_per_dev[type][pcm->device] && !is_running))
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
+		adma_isomgr->current_bandwidth -= adma_isomgr->bw_per_dev[type][pcm->device];
+	}
+
+	mutex_unlock(&adma_isomgr->mutex);
+
+	adma_isomgr->bw_per_dev[type][pcm->device] = bandwidth;
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

