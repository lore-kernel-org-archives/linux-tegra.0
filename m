Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2065.outbound.protection.outlook.com [40.107.95.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B71023A982;
	Tue, 22 Apr 2025 07:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745306930; cv=fail; b=aT8ce2yeIJ7X29RecMBEQpYV+B21PZMJXnve6Q9kOy0gnp3y7HnWCXWQKukJJ/ctm5JbnVBY+0iuZ6uxVULVe7OXd8OdHc6IFwe1RFVU2/wclC3vEwQ7Yo9Y+jYCEn/77DguFaYInnBYcol+BdLTol2Ic07nYR6JETfLsA56Q5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745306930; c=relaxed/simple;
	bh=q2oDgiwaQj/sy93x0RGxXq5mZxl/mi5jNTxIKok18Hw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oA/f5G+gKBlVQ4XKwiBjNQglCuFNcOX0zmJfeQoTkNw3nYQdfdcHh7aOGkrKMUYCvX8S+fqhzo9a9CGvttwLWjhu9FhH3NZ7gxo5LuWvY75gkKL4/b5W4qZvj3NS/3vIRYTlj/jDTgXQVj2wWOnBDmmlmR5fubt0I8K3siDoaRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qfCDII82; arc=fail smtp.client-ip=40.107.95.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qfCDII82"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xI9j2TU8kpI0T8Y2MAZwrpuzfX9yLW3xL6pnOo/x2OCRV/FE/6vYC9I3r2lpNHCzOJBpRbep/2BWkSwIZs8Uvd3TX3l4T7N2T+IezPUPPJLVE3Uj/Ct0oiz0K18eegWDCVtUq3xOXRJD1s1THqhnfeLZh7tXUm8Hb4RUeuHxEZSUOr65DPVNHd/oP9ppLxH6FKlKV5c1LKex6Xg60jv8D9gcb0tx7lIZPDAT7KgyY+yUeaY9o3Cnrchupe0bI/LvBFKRhpPMh9eOYDL6pQsWuEae2kkp+851nQsnUeLynu8xpjs1MQ97+ZFzL+pzOSH2yNiTH8ryYRjP4o8vc0ZVPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ck58qZIGbhj4Drsn8WWOT7IDvl3FtfYND3bv8RDeS7k=;
 b=mty6XLTOVYrBfyIQqQWtF8yB1sDF2aexESM3VoxIRaj6kFLrTBo2a4wKuRa2p4hcXPZZZXDR5LFOGqHh097nugGu1M7JJTh+mxyO5JW3zH7ST1XKRPyupDV/xuUwqCXS8zzPDwqFBAwRgFOYXgZ7A88djnx6xSmVI45JQk9CnlbOb6ZBr+c5HvNwMMGl+M70YJlr3RMXxnKuhiIgLm3ywYkAPWOGNPmbA7Rdgen5JbiTHG1xoTB9ZGI6dF8NWtuHU5yfV/LfsNLNH9cdPt8CHEVl6kWWvPEq2HMA9+QtJHyaEgp4Ez+oMQEGmD3s65LmLz3+M8z6AdoKO94GOLnyrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ck58qZIGbhj4Drsn8WWOT7IDvl3FtfYND3bv8RDeS7k=;
 b=qfCDII82Z6jV3vgJOrr5zdE81HZrjbsjgv+3J4lkJCd00jcuC9eSBqv8UhF5/9GEX3TIiuN/pkNzLVCoZsTYKI7QRiQ8TRG33z9mO/6VrTfDt1Mq+DNgDdVEw9KSZIQcPPL1UEffvxcqNWhXqbYXCyOosQox2NclQFeLQ7MkHnJNxrOtQFv740OYySYo9DeA5utHf27HiBBwJyBPvE+clnLPNSLIvMjZMX8lfTFFe+aowAykbdQt2SJW/xP85SW+hcyPeOwQ43t+e9Od5sZ5MCeA/7z9C4VeoA/SpTyRIVWYeqnm4UZIu90y0lAbGaCIrzgZY76Nh5DYU6wO4J102A==
Received: from SJ0PR13CA0006.namprd13.prod.outlook.com (2603:10b6:a03:2c0::11)
 by CY8PR12MB7706.namprd12.prod.outlook.com (2603:10b6:930:85::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.34; Tue, 22 Apr
 2025 07:28:45 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::89) by SJ0PR13CA0006.outlook.office365.com
 (2603:10b6:a03:2c0::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.33 via Frontend Transport; Tue,
 22 Apr 2025 07:28:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Tue, 22 Apr 2025 07:28:44 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 22 Apr
 2025 00:28:30 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 22 Apr
 2025 00:28:29 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Tue, 22 Apr 2025 00:28:29 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <broonie@kernel.org>, <linux-sound@vger.kernel.org>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<jonathanh@nvidia.com>, <thierry.reding@gmail.com>, <mkumard@nvidia.com>,
	<spujar@nvidia.com>, Sheetal <sheetal@nvidia.com>
Subject: [PATCH 02/10] ASoC: tegra: CIF: Add Tegra264 support
Date: Tue, 22 Apr 2025 07:27:57 +0000
Message-ID: <20250422072805.501152-3-sheetal@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250422072805.501152-1-sheetal@nvidia.com>
References: <20250422072805.501152-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|CY8PR12MB7706:EE_
X-MS-Office365-Filtering-Correlation-Id: 473430e4-b0b5-4fbe-bc72-08dd816f505c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?37SK863CZaDEb7wyAVa8tBQuClvsUhfbdkEyQMVz4oU9LojK+xCHcChhejFp?=
 =?us-ascii?Q?GopBbj5K2+iauNwTOk1dlLj+2TARidIKZdnBtDKSPFXJFZsxWnjUco8LIwLo?=
 =?us-ascii?Q?Md4HG2ugQVL1Ev7Oe8K+Gdln22KGtCBndFQEMxLiIHZxRCDrCQ8+10mikK/h?=
 =?us-ascii?Q?jakDcR9KeOwxgn5GT6xgFOJOpbPxVdCO1LVpLhwmU0SqLsufpJMSuIVTp3Kg?=
 =?us-ascii?Q?YvY4hz1TiBkKWq+jiiSR8PCgEu5dJDwPHbSshlAv9CfbgtYTdvTR9d9ATaOE?=
 =?us-ascii?Q?jXVJjnW43w0fuiuDk05cTatl3oS9vMEZj/nI62q4Gc5AAQlIWklF1gUW9ch3?=
 =?us-ascii?Q?+gvhGb4ppfFKqDHBCgvNKtZaJ+fiTKXDCFevsGnlnqBWkr2tZjLIoHiCr9bv?=
 =?us-ascii?Q?bmmpp2kacq+Vrn7omlbcIyKxyeM998VGeT9fIQxWU+yQIegkkildMi4WHf6n?=
 =?us-ascii?Q?wBcaF15gcH/dKuuVgZ0I9svxua38lCJbSB30HZfOi5eQqU4FoaLrEo40yE4W?=
 =?us-ascii?Q?0LWxqySlyzKD2ARAQPmV7PYXZGsiLogQmpvtIOD1QkG+PRgOcqQ5PwpH1/Ka?=
 =?us-ascii?Q?l/3CzCdCDP33Q6QTuBA9qNh+8YP72nrvu5gYgJ9Dm+ccafimyjNxq5/cD+ga?=
 =?us-ascii?Q?4OdlCV8UhQ1R7ramcaWKEGQUJFWDRE+n6IiZJSt9T7MVQaQkCdHDLIlzPfmu?=
 =?us-ascii?Q?F+x7GMcwLUTKvlJBbkQtoXe2CBmWP6MgJNkvlSxIoIDXl4I1NmWz5gdJ6Kvm?=
 =?us-ascii?Q?yaApVhXcpQFJWAhmeWbLQjTGsH9O8N3JICHMeygyw1bpioZpkjy1pKGn7A8a?=
 =?us-ascii?Q?tpjsdJpezBVDrK0BumD6oE5m4W/89EPJ+6yh6VPlvZkF0rxSqsgbRv9GKhmu?=
 =?us-ascii?Q?BI8jvlmxoeZOqrbsAwVmHce4kA6G2L0ywKYUsnsSPCFZqkhUy7p960qkBJZj?=
 =?us-ascii?Q?OP+HTyBf/htvgufNwm/msYEk1HDqtr6VuE+G/3nSTl52XISeKQ5bfgaoU3VK?=
 =?us-ascii?Q?Nivea797OuXuk2lhjnh0sZBed4tspyZx7f3lXP+IKc5OLOsha/LO6hBOWewD?=
 =?us-ascii?Q?9AL+ILzUMESrkoigrCEij9gQgc2+rbgBPVG1akr6UDuC2mupve6x6+0cThL/?=
 =?us-ascii?Q?TCuemTAvURGASlawnh60cQ89EzqirQYEmvA/7t9b/kHZoOo1uB4JcmiKaLcY?=
 =?us-ascii?Q?2Vohpe3vXNBoQS1S4HXquzq7k2T1YyRBcQZnJGXb9p18sOklor198MeqLa7V?=
 =?us-ascii?Q?p176M8fVRX9mki+A+iY+sS92onPdhyLEvPANvINf90OHM304w5L4ThbwaFJd?=
 =?us-ascii?Q?yghdJXoQYBi/R7ZS7KUacFJl76/3rGiyFop/YA7vdnYDKKdRIjlLFbg+H3LM?=
 =?us-ascii?Q?Xbc8tYGncyWZVPD816B3KRApEL3mIPEEG4FXWr4uPWEK7RZE7ntNhNorD1pJ?=
 =?us-ascii?Q?if9LeoCe2DZwpN50g7v/82Bp/RYBHpqYnrU5CS4cNueqgAx9Wjnfh8O13h9Y?=
 =?us-ascii?Q?cp7IVswtsBd7DwUSVm4RoBWaSnkb6AE6MGV1?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 07:28:44.4836
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 473430e4-b0b5-4fbe-bc72-08dd816f505c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7706

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

