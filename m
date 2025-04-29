Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323DF26B080;
	Tue, 29 Apr 2025 06:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745906409; cv=fail; b=SJGimDJeRklJdMX5DV0pekKsYt1pV5T4LMKslsnaWKmMKGKR6beM2fylFMDrsx9qv9duLog8rhTCOY3V+TPC8/lEbGTqBtnxcpUw375nABc6+gDddZynlnwKlPJzi9yTIA7o17AP3t6T8LYXe1/mdUd1W6UoRxxkHBXDjH92Eog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745906409; c=relaxed/simple;
	bh=q2oDgiwaQj/sy93x0RGxXq5mZxl/mi5jNTxIKok18Hw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TBLU42Ukj2Z0H/LUZK0BULk+DRcbYvoy/cPyz1ReQpu0sJw3JZ72AtG01TUhlptU5f/p+rZ1EKxSrput2pxezM+y1Aa3/a9fmcGMxFNbS6RxGn6J7GX4AZ7kgIP/vaG7gNhBXhdA6JvjgRiq25P3G1kq6YqTBunqSlxgwvj++bo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JcZsmIhu; arc=fail smtp.client-ip=40.107.223.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JcZsmIhu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xqF9Urmeom6Hcqco4/tsqueYdnU2So3IB+CxhFzXBoiaC0PtGnnFVTPxJMVoQf9nWd8WG3lwEhK4P/s5ADCHcYBGp7Q3RjXq7hwH3jF9o7wDZTURxYjB5l2XCuy+vmndn8rjrKKKfEtODEFKz7wHXYTjMtSxTaAdzvsLHd7IYhgTl6vesL558T3tnzYzLRUc+KD1ondA19R6MkLn2OvrtPbcwosTNFNpCB1OjRMKq0X44+ivlB9wAZpHajLulomeiYgBynSy/COSgsAKQUi7V28PLaZiJFzl+//3ZuzZsvABjp4XqsrUuJZZINfKmHvpkvybMgBIDlq5jWsiFAWcHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ck58qZIGbhj4Drsn8WWOT7IDvl3FtfYND3bv8RDeS7k=;
 b=HMJgVbdQ7zpDRWO1kA6Jq22Nl0YU/KqLjhOK6QHD9jP4FDot36OaQ4/V4KqiHEDdAkLU+VgM2JSETg+dSbL3nGIT0INiE9HZ3ZduRFUMrV1DjOHisTvpN7RcpnPvbNgFvPfrR5Gu2Ck3KIIMxPa6X9sj+YG05iedmLXbMMsd0fCCVwwA9Fcahsz+gLQVz/D9ecwQOeaDwXaOW2433kJTdL0i61VO/UMboJ2C0UGnbTmRpQEjaS0oES6TS9Nr73WihDgAQCH7I4XMez2lHFgPlt7Ij625X4tNfYqCbEc97/d/HMkHKoY+OXCQW8XAnsOENmkQWMjpwhZMWlfD3x96sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ck58qZIGbhj4Drsn8WWOT7IDvl3FtfYND3bv8RDeS7k=;
 b=JcZsmIhuihbawu+1LRv8v4qhluZI415EQcCdEgUKfkdQLxK7H09ZRz6/ziY9eAfzultL655LbJkrGblt1V91GW7fZMbJsOQ6kufJcf9JzwWsHk5hORxSaQ/gZSHDUN/ksLJI1FQKgXrJ8oo3NtBs1rytVFCXtf5YfLc4PdvPJlnMCOM/Q0CwDaX35QAdP3PNTMXEpHB1OWRTkf11eVs29iz4T9Ak/zBoAFzG5Ta7A/cAPbTD91GOvjHDxeO/0hPR+kL6+ZcE2Fvlg4sEH3iQ+Zyecp0cp3xke/ri0GauYpAS0yHm6mIGNej/j8Z19YGxseINTMlwAcvWCiAz4Jg40Q==
Received: from DM6PR05CA0054.namprd05.prod.outlook.com (2603:10b6:5:335::23)
 by DS0PR12MB9447.namprd12.prod.outlook.com (2603:10b6:8:1b4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Tue, 29 Apr
 2025 06:00:03 +0000
Received: from DS3PEPF000099D9.namprd04.prod.outlook.com
 (2603:10b6:5:335:cafe::87) by DM6PR05CA0054.outlook.office365.com
 (2603:10b6:5:335::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.23 via Frontend Transport; Tue,
 29 Apr 2025 06:00:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF000099D9.mail.protection.outlook.com (10.167.17.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 06:00:03 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 28 Apr
 2025 22:59:45 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 28 Apr
 2025 22:59:45 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Mon, 28 Apr 2025 22:59:44 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>
CC: <perex@perex.cz>, <tiwai@suse.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <spujar@nvidia.com>, <mkumard@nvidia.com>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v2 03/11] ASoC: tegra: CIF: Add Tegra264 support
Date: Tue, 29 Apr 2025 05:59:33 +0000
Message-ID: <20250429055941.901511-4-sheetal@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250429055941.901511-1-sheetal@nvidia.com>
References: <20250429055941.901511-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D9:EE_|DS0PR12MB9447:EE_
X-MS-Office365-Filtering-Correlation-Id: cbf2b4dc-d05e-4510-d042-08dd86e31587
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hmNpgSKM3IFYbtDKnKnjvKFcS/r8EShp+/h5tKZu3QxR8cyWf2YjygWA9g9M?=
 =?us-ascii?Q?QUcRnx4hSggsAbuxayBtHw3GwWxVowmlyAn1U1EA1yhJuch/aRgu7nnuAWuX?=
 =?us-ascii?Q?HuXvXi47+bEhpLI624nfzAzpHd08BrPDRxMVxsi6uu/ycYRTfS2gfiX4juw5?=
 =?us-ascii?Q?a6UQvAmBHfn21ufa5bDFVFUqjnWsJWz50j6Yj2dzTmJtU1m8l4mwvTVUJBDo?=
 =?us-ascii?Q?TQC6EOehXMJOXRg48/Wh8x4j97oasyTPUhP2+XMV2iKiUPCKZul0fGsry7P4?=
 =?us-ascii?Q?G17k3lWQExxaWIfO60R+fis7p65vhr5idbyrJywLV6xSgFtPSCt3Yy2tkaSO?=
 =?us-ascii?Q?9Xuaq+JU4AFZvz13y5hKi0qDzBiWme7XKglP2CmYuRr4wiB9ALu5ccY91JlX?=
 =?us-ascii?Q?yUGmcDza/7DbF0TnqDUWl5oyQ4W1q3X8nqMjA+PYeNV4gCLfDx5aaIloe1++?=
 =?us-ascii?Q?eAHC+Gf05wdPSneXOqU21XbVcVvlJQQxkEOvF1/yRSkcoPXKyZqdzFJa8IDs?=
 =?us-ascii?Q?AwKhCPFztYMpvjHP4+K0IXKSAh3DnCiYNUKqpaxgfuaidXrTpnrvAZLQvnsa?=
 =?us-ascii?Q?b8nMLjpjNBJXlXTYIHj63UqMyoW0pnP9vICqVJrozvOEMROTutzLamCn7SWL?=
 =?us-ascii?Q?PCSxumx3sKeP2msh3W5JbCScmGNxVroKeDg5gLxHitAfOcQBOPEBgMToIeEn?=
 =?us-ascii?Q?+pF/NXqI+cllIhqzfjWaEAAN29GgwtPEiaTaYAqGwek2Zq+nyBrm/ibKfkwh?=
 =?us-ascii?Q?d39pfxIKO29LKcnIFpG9iKD/daS6JCbdTIths/oik1ER3ETJ660/6B4Z9J16?=
 =?us-ascii?Q?YaUy4yn423ihJxlBW/vhVR14xOGCnxdwuAugDYNRAABwZJxCzRYSSnL1GIcO?=
 =?us-ascii?Q?3crFh8+vrvvrhQoxd3Mr9Yev5AOZvs+dKCBZb6YkMRQwbTUuEeINp5An7Wzz?=
 =?us-ascii?Q?oXIgiHtZov/FADzDPE2EwPUXTH0lU7Y8jPORZDFCzeAiS3zt3n8bShxG+QAE?=
 =?us-ascii?Q?DkmKgAVUoFynVmJkKGtMteoDtelK1BOAjqt1JfmHMc7df28TPJmEkiC2vk6r?=
 =?us-ascii?Q?uh6sHAV0bepi8g58hdroSJhLNQERjPJu+4z1pY5hRd+JcVDEAEILquVH+pZ4?=
 =?us-ascii?Q?FmGGAoYPqIPi1AXMOgNKJp2TzafdOoyyRHc6ITmEXhDN5VUuQSuK94/Kq44k?=
 =?us-ascii?Q?ssqMeEADPfJW1rcGObx2GCn4nmbfJej/k5gyqUKVf2mPJt4QJCWieIa+kyRs?=
 =?us-ascii?Q?2wsTRPVyGoCVkyWQABV/jkDzyX+EGNQsNoMl/CPc0v7MRrPvbiT37WUpKypl?=
 =?us-ascii?Q?kJU3JQtE9yKgxHoTyoXqCiEaTYWBWrS0RAylgdpHFHvOzEqTTKJygqK2y7rv?=
 =?us-ascii?Q?YrnWzrqMYmB5pAsLhRfNwdnqSwGgL3lGpf5oI0PjrHwzsC81iod5T5aZTzxW?=
 =?us-ascii?Q?pKiLUY59BP+s/U7FhkBVqVtQjfuLXSO2RzgBV6KS8BpyzIvntrDboAsBjVUh?=
 =?us-ascii?Q?fVet/yr7/mN6bpNCH5Y6hcLFWEDcPAClLdtJ?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 06:00:03.2019
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbf2b4dc-d05e-4510-d042-08dd86e31587
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9447

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

