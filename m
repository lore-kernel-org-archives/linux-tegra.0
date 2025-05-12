Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2071.outbound.protection.outlook.com [40.107.243.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64652550DA;
	Mon, 12 May 2025 05:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747027111; cv=fail; b=ScbiA/ZJSVPRxbIS+QCS8j4bcBNut8HeF1RJTAOe6sCsWojOr25CBAKjATJIM2obhbg9smcnt3xAqg92+XEtL51uw39p1Jf+RiQSM2tAcJCUCR8QAQaHk/vliGBaL5C3fm5ZNNgDjmwmhpBSL73i97kmzYs69egdsDXbMZmOLlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747027111; c=relaxed/simple;
	bh=q2oDgiwaQj/sy93x0RGxXq5mZxl/mi5jNTxIKok18Hw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WWtDBg6flCCV+funxDlGXnngnUhPxbj0AVlWAo8T87bG4sUg39LONNsHuos4821tPd7pHxG7W7AvJ8vrjN4VhpXIc0zETPDYcFiSz5Do1C2xf+R6YwRyalSzVo7Hww+okPpKB1NvnOqLky2XzEcowQRI9ZilqwL5j+OYloRAo+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YmhS4mld; arc=fail smtp.client-ip=40.107.243.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YmhS4mld"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rF3lxnAsa2Dk8c9LA2MWoliT0j/8XHTcHAkTR/v9dybzMPvo9qntzg0UoQNlHde036JNyD3/tVZWAS3gD1PBG3YqPxA34R0qP3abdm4HIpewc2SomhdE5plCgDrOOzqfEJEQStYWDCK4Ra96XjiZ5vBCXfmWd3764L59G9XSmFO0aM/gnPyNqjhbh67vvd9FRneYEArZCFJL3fiyjFj9Id2qQrFnMQBasX9vFpjBvSGXoT2i438svOlRK5nXPoBUNiFJYqwf0a75acWL8mxZJ0fwInkRUYHTSILEVP5emELE9Yl2D8P5mya9ubdAyHxKoV2jt28rp3MpU+dpcPz4Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ck58qZIGbhj4Drsn8WWOT7IDvl3FtfYND3bv8RDeS7k=;
 b=mmA9enssSftVMbfJPQpB3uPv5qyLmd6JjxzzsBX0JE+1+qK9d7bJTusOUbIsePkzL8dkt8Imce3HwvplO+EAoOjN1CfwCV7aQzbdHRf8sKmfP09NKPLePL533P7jkMqD6TsZXc+U22wOdeZuo7Zs6cq9bkxuggR1vAHzRLRTwFQFonD8Rw48kGH7yq9oG7R69FajvTVYJ2Qt8Lzeag6Qq9XIUX7M7jXKhvFkOCMF+zb7a15+U4yDpKdwyQBKbv2HZyOzIER0tA8nVCmeEa2XHY2Xmeq631XtEK9sZPD2QVbxFNTZlq0TmykHxW+UtSsuMl4Y6JuGvYn/Ye6ywsQS/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ck58qZIGbhj4Drsn8WWOT7IDvl3FtfYND3bv8RDeS7k=;
 b=YmhS4mldVXFSD1TDUP7nfBNqqCxBuw6wmCU45km4sA3hEzquS/TW/MWhljRpNL5gIWy6nMfeNgJVnODFM606lmPlPMUymFpu7J0NqEYoXC5xFuBIkLxsSnHimZD3Z31fbwgD/VxqI1YqQXqgMYI4+GQM+7BqwR2IpJDjMeGH1o0TStPKIy+JyxOTOgMyakLGPFkPl/3YBfIQI4S1OnnPNlYub0UUWJlWgka30I42GRetd+sGo43irddn9fg+1rspnq56a7yI9tDRET22iC4phrbHO0ASUSHj6D2t7pVlZmaowfJpz8AM1IUeqhkfw9410bGm7KITQC5aKtD3wNLDuA==
Received: from PH7PR03CA0030.namprd03.prod.outlook.com (2603:10b6:510:339::35)
 by CH1PR12MB9600.namprd12.prod.outlook.com (2603:10b6:610:2ae::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 05:18:26 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:510:339:cafe::13) by PH7PR03CA0030.outlook.office365.com
 (2603:10b6:510:339::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.29 via Frontend Transport; Mon,
 12 May 2025 05:18:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Mon, 12 May 2025 05:18:25 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 22:18:13 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 22:18:13 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14
 via Frontend Transport; Sun, 11 May 2025 22:18:13 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>
CC: <perex@perex.cz>, <tiwai@suse.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <spujar@nvidia.com>, <mkumard@nvidia.com>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v3 03/11] ASoC: tegra: CIF: Add Tegra264 support
Date: Mon, 12 May 2025 05:17:39 +0000
Message-ID: <20250512051747.1026770-4-sheetal@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250512051747.1026770-1-sheetal@nvidia.com>
References: <20250512051747.1026770-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|CH1PR12MB9600:EE_
X-MS-Office365-Filtering-Correlation-Id: da31d87a-a58a-4f4b-07f5-08dd91146c32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ep34dFbIMsiWFkYDFgsEo683cNS72FoqNs+KUTfbe+oeGHRElTy6Hx9NjBSW?=
 =?us-ascii?Q?T31U4AAfSOw9SbvxsTZms0NBKqemP1kNFA9SbJBye1+t7G345K17DqW+hu21?=
 =?us-ascii?Q?FEHbUgiaqMnEvkDHlxWmvg8eYBJQMaJlELSJzogrkWuyugZ2K4O8QfaButsp?=
 =?us-ascii?Q?IO/XfghdNn77JKFoJpOtvoPj8txf02mMwMvWzNq9+O95QqrS6LwjdiwK2nyo?=
 =?us-ascii?Q?LI0Plg+h6aseLigDyW4CjMzTR36N7rYyfGZr0gWio4e9Xl/948iDJl5XTWla?=
 =?us-ascii?Q?oFw+mA6C4mak7JNdvXy1uzjwf6XR0yq2v+uyI17AiwYtSjr/IopfJxksYyCy?=
 =?us-ascii?Q?AO33NQlJ2ulFC/E4ZwKPgC3KiDNkzEhUX38uUtm0iIpPwolGZ4Zr3Opxvsu8?=
 =?us-ascii?Q?HjdY0+dDmsg5gYUQ8xTbIl/r5zH8sdqgKWTIT50z7G5j9pOOdkbLBnQIaHD2?=
 =?us-ascii?Q?/pm5tZJakyxFE9T19Gh0ITcSeeIXTfbtDzWTyqQvCkOKScAbVO+zzKJFZmw8?=
 =?us-ascii?Q?2+p1ZhVuXP+rGxhCFofYysA3jf5R/gYrgA4g+v088A10JLpEX/Dy9RS9y620?=
 =?us-ascii?Q?hPK0tlY1PfIu6UMvzaIGwhPpaFYdb5Ox2spBY9MbxXV63K5HHyythZ/w3mkS?=
 =?us-ascii?Q?WepMbDDlMEj8YQmVWSMk6IEtjKso6EtL/kvfqdvfhM2c1tv4m3GQm9Ky0trf?=
 =?us-ascii?Q?IhVzL795V4/KXHtm/OimJtfvF1fQo5pBvIiXqnzlVbGaD3GVCb5l6P/dqTXp?=
 =?us-ascii?Q?BCmOB3Lsel6Ukxzz/OL3JM085ATj54XoNJDw6PvKdxYTR4Pn9Pi6FnQQFGqf?=
 =?us-ascii?Q?6IHea7qLJPbtr+n9A0gg+ZGLNlKuC8e/STkdugLI4g5OwLs29HqcdNB/EfBw?=
 =?us-ascii?Q?rUluF1mksNx5DdJCtNJLM692jrw7xZPEiSZU4yTMUKRmlqwzSTuY1CCMhxuI?=
 =?us-ascii?Q?cvWRbY3bp6lX5g5pk9oCqrKGUidz8fSC6f859tJOEZbq6EWLLbTPYLOEu6h1?=
 =?us-ascii?Q?mSS0+KzlrPN1gtH5AR+Jb+WaY0uKbZW5djOmROfWvx3Pe972TpoGrCJ1u3QH?=
 =?us-ascii?Q?ltp0Km9xOPI5G+C0fOEMxotrM+qjSorxhevjdM8xk0JPas5xLsGrAzTx3PXJ?=
 =?us-ascii?Q?OiVBjbYHhCP79FTG1F7J7WkxV4A1QRQHVHEe3XB3uTJaVQleSRsPaDKkmoc4?=
 =?us-ascii?Q?JAIMAgaNAA0HT1wvuHq2cGrSOo/9vXdFS8tQbSISSvwBze6OZ+YufusFUIhl?=
 =?us-ascii?Q?P2I8kthnOkXZsoKEjYogTJZxu+fcihtBDYOx+xA2eLEgnukgNBRpBX1ivdo1?=
 =?us-ascii?Q?tL6eT+dGmYwTtKYFERoOkD4smUPYPnspxK121pw9mA7QBNudYegm4bIdN2bk?=
 =?us-ascii?Q?v99txVlzKtRTIwGzCj0zCxQRM+1eY41SN4CFxeHMu/k2MeTyYIr+Nj/aaliA?=
 =?us-ascii?Q?EeBiFzISdLmd2c/Y4jJNjz/6nTRxD96RdOM2PnwVsyyrDHwnGGmZhI5XtRY9?=
 =?us-ascii?Q?6vdTW/JukxgT0TWz9F18RaadLUGofX+Jc61t?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 05:18:25.5996
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da31d87a-a58a-4f4b-07f5-08dd91146c32
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9600

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

