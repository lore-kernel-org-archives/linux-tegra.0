Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5C7202965;
	Tue, 22 Apr 2025 09:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745314717; cv=fail; b=nfJuSvnR6PT+7XBE7AxajdOLy0ivTFFyaRZ9nxnlBKslxW9mQfvP+V5/lRxQU3WwbBlKQAfKqPTJrX9LfBwRHpjpDKurDu4lqXPqUMgH8ClRX+yPwUwXWCq3id58anUGdH5FyQPJF1a08JAzwfr7q4QKHEnpb00HCz7QD90/tTA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745314717; c=relaxed/simple;
	bh=q2oDgiwaQj/sy93x0RGxXq5mZxl/mi5jNTxIKok18Hw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SACCEX0jFqJ0jzLFQIywK2OLo9grGKcJdpH4bg9LQcSdcTn28MzgyAFLvlzqcXpxvgR8C92TZCyavwfmeuO054jACX26fcFu897WZ3CS6w0iPvFdLLAlKwjGeh41Q7gm2FmvFa6yO4f4O3MCNzIPX4hbPHGumW4vQS9f6UiudOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CJOM742Z; arc=fail smtp.client-ip=40.107.92.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CJOM742Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zN0C00HVQkgQy87rPZyIhFTX3lUdbr0QSvwJW2S0fh/hby3vEyBBGrQv+0ORtA6un3VpLp7C0znRbcr6U2xy9LTAEWMQaAFxnGS9jZz6zQB7mcaJ5yj+Sk4w2kAYi8KbRnvwvr16ZuJrhb8M4Fq19xxueagyu2h+6LOymjfhhvPM4retdts2CaQ97LHzCKn6JCkrkZWQr3X4MGMFcey7gidVGkQqvoScHjpZ0OrJas4gav+vwWmMiRgtr4YuuyBhk/Kv4ciLhtzfVMi2nVtQoQFKpeP63TqECTIucnUDTbe3Hb8RjiF1H7lWAtBstAWTYj3/R/ByTK8Q4bi6tuse3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ck58qZIGbhj4Drsn8WWOT7IDvl3FtfYND3bv8RDeS7k=;
 b=JGu0+6vQ7jdY9A2W8FkDCtHhMpLQXbTTnu1B+mQf1Ed+l5F7AkK+ASge445M/wxtKt0BZqODDZrc6L2vq+jDOsq4NfNqFFsDQelc+StOYQNg99rn/ZY+Pv2eiVCG2xvK+kTjt9S2knB5F28fcyqnFU/jHziYm8MCgtUoqUZ0teghjuX8DIRnwU7wJFrs2I8OhJ2xdCw6VShDBQnJff4BiESCK6deRiK/1L2DPuKcpVmuQkgI/lJehl5uE+7LL1ZBOezbpbMeZYsshBWrUcXb0N4in+OqtuX680PCDii+j6QMxAozjroZZAL1fvR+g0BoFC/LEhz0w04r3xuLyLSnmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ck58qZIGbhj4Drsn8WWOT7IDvl3FtfYND3bv8RDeS7k=;
 b=CJOM742ZQyDXpzaUoiPEzbbSHDbg7hf919c1neSTlKocDmsXtSlTOICBkGJP4mhVWFUHm7sOxvAzXDuJX54Y3rxUpf8S5i+6eF7WZXVQHghHrhDUmDGHbpQLIrv3bZ8S+K+KPQTHE0PcG98QpPGbM5hdvUenF6XsKpFcGcsAvG5CSSaxqEBYXng8xx9UOgl0feY1KFrSkwLG85KsIx2H+5URn1G4L3uKE531/Sf2f11wI/qubPy2/OdUYofOeiwUk/W6UOcqHlLMfZUdDcct+beZDaKay4ff2Nc5kpg7Fb+SRqGMKnokytuXC0lGOYBZO8himTkNCCN07GQaoGFXIQ==
Received: from BN0PR03CA0025.namprd03.prod.outlook.com (2603:10b6:408:e6::30)
 by CY3PR12MB9554.namprd12.prod.outlook.com (2603:10b6:930:109::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 09:38:30 +0000
Received: from BN2PEPF000044A3.namprd02.prod.outlook.com
 (2603:10b6:408:e6:cafe::7b) by BN0PR03CA0025.outlook.office365.com
 (2603:10b6:408:e6::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.33 via Frontend Transport; Tue,
 22 Apr 2025 09:38:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF000044A3.mail.protection.outlook.com (10.167.243.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Tue, 22 Apr 2025 09:38:29 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 22 Apr
 2025 02:38:19 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 22 Apr
 2025 02:38:18 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Tue, 22 Apr 2025 02:38:18 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-sound@vger.kernel.org>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<jonathanh@nvidia.com>, <thierry.reding@gmail.com>, <mkumard@nvidia.com>,
	<spujar@nvidia.com>, Sheetal <sheetal@nvidia.com>
Subject: [RESEND PATCH 02/10] ASoC: tegra: CIF: Add Tegra264 support
Date: Tue, 22 Apr 2025 09:38:07 +0000
Message-ID: <20250422093815.506810-3-sheetal@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250422093815.506810-1-sheetal@nvidia.com>
References: <20250422093815.506810-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A3:EE_|CY3PR12MB9554:EE_
X-MS-Office365-Filtering-Correlation-Id: c20a32e8-8bc1-44f0-2063-08dd818170b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3D8feD/3xvsvPNcH/m/9C+Ku63pSTNVVn1KpZGnviqdUHneb8phZZazY2G2h?=
 =?us-ascii?Q?FJ4qocO2AcdPW0SNrEpgZovEHAZUn0AxVK2LH7IYTMXsTdpHLNEHLMlRF1mS?=
 =?us-ascii?Q?MJqRAwLB/TyGt3KzuC4GUEg1EVRppn5ZHh+1HZi0Yuxu+VuKaJRL/fVb9CjK?=
 =?us-ascii?Q?Ox5oGGgCsKPJS22OCzbSZsOdxOEAVqdNquvvFZe9eL5EZsx8cCCjvkok1bNi?=
 =?us-ascii?Q?3zg1OCM3y6tWFyprdnDdEZKVv7y/9EPR0GO2vSu+viM8QrEnsbbK9Q5OWUS6?=
 =?us-ascii?Q?mpsI1YJ3ELckqevgabAqvXK+PDF4y81c8tStKXPAae1BCgRTOudV5xyxQLBt?=
 =?us-ascii?Q?yjk+C+Cmsn4OjH2+CO1qJuqC0Iwd7XI2Hy8KDa5BbH3kK6fT8qNspxwsUGkb?=
 =?us-ascii?Q?r3nq+gFAD4ID/PVN6fjIQroQVxNhO0bM0ni8AqgvMuSTaqIofoYx86efBu4i?=
 =?us-ascii?Q?i3wqKcPrds9tYJ6OgNmROmDok1V9ctWfOU6ADIm6jW9UBqkkaS5nfMI/bif5?=
 =?us-ascii?Q?4SX+jvg5imx4rMHJ+Ka+9/4V/gi/gRwjJzdIbb6p8gTYnuXvuyS3KOpMqbGA?=
 =?us-ascii?Q?2XcxZUm3K/LJpX852ecrhgUY9tWq/bqR1G1Eyq4ovHFCQDcGibLB1A0nbo0C?=
 =?us-ascii?Q?UjcIJc8qmNMGyzEzjzIiBh4eRziVlOXxr0atvrl1lMFcvrTaVwV+wsABE4HH?=
 =?us-ascii?Q?dd6H26rSQkBAjlA0/21FmiQFs1zTye4TgQuYyAyAohB03dXOyNTrVg0Ohhg2?=
 =?us-ascii?Q?ZSrH8SbRdGZE9EgEfimLB0JJjZNXZaL6KkT/P9UwNp51zVaCm89GJzZwW+Fp?=
 =?us-ascii?Q?/2uWlsaQ+qWOT/zf9hE5ooPLvbLZbnIt4LoaVyaGLDcl67fg0UfZo3JSs1Jz?=
 =?us-ascii?Q?7m/h+WYTpQld9rxAxTeiUkkOrOksvDFGBaHNHImHMiMYf/iPPKwiOZ9Vxbhe?=
 =?us-ascii?Q?aGEdlCU5fGef5ueBmMMNrhiEI1mVW/UIFeSi2vUCL9NDcdv3y3euXy6Yv2iw?=
 =?us-ascii?Q?WoZ2Ec4/0hi5KWUcAk0Hhqlt0bm78J9mB5XtpqiyX36Z9c/txsVKwd+Lt5TQ?=
 =?us-ascii?Q?3u5Cz3V0M9adpaOyzVZJMUxSt0e3+0+6IGnebBkSDjf1zzJlBFR1GnK8glvE?=
 =?us-ascii?Q?NZ2vEfmuvNPqrnm1VqQCWVjzOzGcktxpvWX4Vr6eMxjOg473IBF5fqdVCjZ4?=
 =?us-ascii?Q?Q2nSMb7uFedYGaivZwhiohUKWvtY4U2KPCDkxy76xMrXB9o6wdHaFHMC1jCO?=
 =?us-ascii?Q?CU1zq4wm8vux5ohSg6AxZWfyReWmF7tJHW52+ZZUQbjcEPG/JACyNyhy6h2l?=
 =?us-ascii?Q?Meomvs+gMDWiWVUiOMoUQzaKpQlzZoRO7a5TX1ryEH7SMXtqJT9L8qoDoc9l?=
 =?us-ascii?Q?6TXOFxAjcljIVUIjJn2KmFibnnkW4RGVg+kx3jjx6bqlotetHO///RYSRd7M?=
 =?us-ascii?Q?uFXGlXUsjMm+lFfXkXTQRXBpT68BnitY/QfZJTrqLgrLNYKXeY+DmnKeP1ik?=
 =?us-ascii?Q?5F6pfeeXN+US0iUUa57a4u1cPwTEVbA4i+DV?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 09:38:29.5953
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c20a32e8-8bc1-44f0-2063-08dd818170b2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9554

From: Sheetal <sheetal@nvidia.com>

In Tegra264, the CIF register data bit positions are changed for I2S,
AMX, ADX and ADMAIF AHUB modules, as they now support a maximum of
32 channels. tegra264_set_cif API added to set the CIF for IPs supporting
32 channels.

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra_cif.h | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra_cif.h b/sound/soc/tegra/tegra_cif.h
index 7cca8068f4b5..916aa10d8af8 100644
--- a/sound/soc/tegra/tegra_cif.h
+++ b/sound/soc/tegra/tegra_cif.h
@@ -1,8 +1,7 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * tegra_cif.h - TEGRA Audio CIF Programming
+/* SPDX-License-Identifier: GPL-2.0-only
+ * SPDX-FileCopyrightText: Copyright (c) 2020-2025 NVIDIA CORPORATION. All rights reserved.
  *
- * Copyright (c) 2020 NVIDIA CORPORATION.  All rights reserved.
+ * tegra_cif.h - TEGRA Audio CIF Programming
  *
  */
 
@@ -22,6 +21,10 @@
 #define TEGRA_ACIF_CTRL_TRUNCATE_SHIFT		1
 #define TEGRA_ACIF_CTRL_MONO_CONV_SHIFT		0
 
+#define TEGRA264_ACIF_CTRL_AUDIO_BITS_SHIFT	11
+#define TEGRA264_ACIF_CTRL_CLIENT_CH_SHIFT	14
+#define TEGRA264_ACIF_CTRL_AUDIO_CH_SHIFT	19
+
 /* AUDIO/CLIENT_BITS values */
 #define TEGRA_ACIF_BITS_8			1
 #define TEGRA_ACIF_BITS_16			3
@@ -62,4 +65,23 @@ static inline void tegra_set_cif(struct regmap *regmap, unsigned int reg,
 	regmap_update_bits(regmap, reg, TEGRA_ACIF_UPDATE_MASK, value);
 }
 
+static inline void tegra264_set_cif(struct regmap *regmap, unsigned int reg,
+				    struct tegra_cif_conf *conf)
+{
+	unsigned int value;
+
+	value = (conf->threshold << TEGRA_ACIF_CTRL_FIFO_TH_SHIFT) |
+		((conf->audio_ch - 1) << TEGRA264_ACIF_CTRL_AUDIO_CH_SHIFT) |
+		((conf->client_ch - 1) << TEGRA264_ACIF_CTRL_CLIENT_CH_SHIFT) |
+		(conf->audio_bits << TEGRA264_ACIF_CTRL_AUDIO_BITS_SHIFT) |
+		(conf->client_bits << TEGRA_ACIF_CTRL_CLIENT_BITS_SHIFT) |
+		(conf->expand << TEGRA_ACIF_CTRL_EXPAND_SHIFT) |
+		(conf->stereo_conv << TEGRA_ACIF_CTRL_STEREO_CONV_SHIFT) |
+		(conf->replicate << TEGRA_ACIF_CTRL_REPLICATE_SHIFT) |
+		(conf->truncate << TEGRA_ACIF_CTRL_TRUNCATE_SHIFT) |
+		(conf->mono_conv << TEGRA_ACIF_CTRL_MONO_CONV_SHIFT);
+
+	regmap_update_bits(regmap, reg, TEGRA_ACIF_UPDATE_MASK, value);
+}
+
 #endif
-- 
2.17.1

