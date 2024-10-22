Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2072.outbound.protection.outlook.com [40.107.236.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6611284A22;
	Tue, 22 Oct 2024 04:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729570474; cv=fail; b=A9sppnOxRkVPp9SYuf5hKGTCx5wEEpEm8eA+oPi7Eb2MPKhso3VHvE/ohVh0dTI6xaH28nx1g1CVeggX49LYpRkkpdemaqoSedKbXc1LREDnGjIIIjjWwpyvhl27gxgJj134J6Kh5pinMh4kvAc28QHaFuSl/1jBB8hUV65cZC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729570474; c=relaxed/simple;
	bh=UW6b27a2c3YYyhuS0ict8KzuU8mBx1No4PlLtnK6wUo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ng6rbmSxCAEEeTuENtxKkftMRcBBjMSrb4PG8t7iDPev4x8D7co924PCBoixnnkcATQiVJXywC6xo4SqZur8sv67dSgB1h5zdO67pvKnQzELmGj+PgmUS1KlU2guOY0qL2j2RncTRFaivaPHbvzb76tL5CLCjBj0D9uiLHJL7Vs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Tr4nTv5F; arc=fail smtp.client-ip=40.107.236.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Tr4nTv5F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jVU+Za3Qg+tpfkrGfwrE1Fyh5uVxx8eOSQV3iJ/splTRowL5qiaO2il+uRL6mvyFz0XYh7kMATO6Rpv+qRJv7AC4GbmQ1tZIBGqh0KqqNHHynRrAz4KdqN79UNqrHrMpFrRqvrq5LKL8xaxa+cgKU981pZ8A2C9tF/tEwpvroF/uNO2zdmD9v8PBdmqFqEvGN34wfGEd6Wu4cX0QjvSMRVmhU7zioVzcQ6EsWX0hrUfUJVsI3UxZQPeKk+XBeRC5P5z2ruotpUL78jTCyPY44x0RC0Q2yw6XGsN0xeX1gVPZxEgra9GprfulFnCdX20iH5PDRKa5msCeJCmy4JjerQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xEa0y6dfZQrmjws3g7JNhuOZUx6oCw9umhgIDVLbtfQ=;
 b=c1w8CDHFUx4zMyzI0yJt1xbjiIgKhqeUj2d/KRZIyV7DUfV60QRgbRYyKIS+ElGmr5dQuU847F3ce+jB9LYfbtg9F509qWnltMhiTKrACb8qPy+8oyQPvOL2W3ty+u+0MxY/EWASdXRKQn5ErzecfgUuOKg1Yn5mh739kU97mlgjaa7fnqryB4SQxTkFaGdyljsXjuCzlVYUBCnz8z7Oy6BwgWrLn12Jnlyv9kzMW7GJUXwYP5FFEZ2NewrukrvCUXxF7TCT0TaEj1QlCRJvnXu9YWo421ZadFcaGz8NkCfPpvhns1NOe5NCpZdyYbt2yHn5+gJrpidl/Gi4y8fjYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=perex.cz smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEa0y6dfZQrmjws3g7JNhuOZUx6oCw9umhgIDVLbtfQ=;
 b=Tr4nTv5FBOpJ/A0TPZ65N2eiR6eTpm0rDc4C//a2MHJ1D6IxT4aRdYZ4eWihZFF2/IT43BM67LlA+I2Y1j7R6C7nvdhKGaznYWBlwCWUnMmcy8KsO3Y3z/RD9xLk127rRZjz5KN/b1W0QrSqDX8ZRUsIYJ+J369xyEBwquj2ltsGV+3HAlDA9YQwRJqZubdiVNJS4d+N87wSoC8rz83Vws/aFBS5bu5CoTPGMr5aHQs43sy84rWk2q4ti8x2cDnZ24cer4/wkyQU2pPAjEs2cwFrp7J5GsTB1sdn8c6TS4PkqHOCHKyYLcj1hu9cMWKpqaDPgl/Do5HtWM0Sv1RELw==
Received: from MN0P222CA0005.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::8)
 by CY8PR12MB7313.namprd12.prod.outlook.com (2603:10b6:930:53::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 04:14:27 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:208:531:cafe::ff) by MN0P222CA0005.outlook.office365.com
 (2603:10b6:208:531::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29 via Frontend
 Transport; Tue, 22 Oct 2024 04:14:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.14 via Frontend Transport; Tue, 22 Oct 2024 04:14:26 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 21 Oct
 2024 21:14:25 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 21 Oct 2024 21:14:24 -0700
Received: from build-sheetal-20240822T015656669.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.4
 via Frontend Transport; Mon, 21 Oct 2024 21:14:24 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <broonie@kernel.org>,
	<linux-sound@vger.kernel.org>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<lgirdwood@gmail.com>, <jonathanh@nvidia.com>, <thierry.reding@gmail.com>,
	<mkumard@nvidia.com>, <spujar@nvidia.com>, Ritu Chaudhary <rituc@nvidia.com>,
	Sheetal <sheetal@nvidia.com>
Subject: [PATCH] ASoC: tegra: Add support for S24_LE audio format
Date: Tue, 22 Oct 2024 04:13:30 +0000
Message-ID: <20241022041330.3421765-1-sheetal@nvidia.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|CY8PR12MB7313:EE_
X-MS-Office365-Filtering-Correlation-Id: 818d87eb-8f09-4300-eb4f-08dcf2500458
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Y7AM62YhId1c00omKv8fGSwNl4RJgWoITN1cgvdDJ8rAez8RNdZtEqK1NLfD?=
 =?us-ascii?Q?1zCN34V6Sbse6lPZ6nLiZyVq3ETipDHjDr/LkzG0HF7AtZMSj5JU+NLfmZlo?=
 =?us-ascii?Q?KFk7gJKw3y1CFJVLqb1sOCzW9aIg2dyfe0D1wBDklmeYV7krJ5B1VfXoxw3o?=
 =?us-ascii?Q?6Lyc3C68f0hgxl6sbEV4EkRWaabkOLSdLTpvOm5DeiYOVMRhKRv+VtQsHca2?=
 =?us-ascii?Q?0I7H3yZFvbDCFFrn+fe1EoMHD12SqlwSDb/7tHVSfn3DV9UbS/wHlIjm6nqW?=
 =?us-ascii?Q?7SLren+XhVtHdJiGeYfUQQAhWZ2oO8PIvWyus5h4Zl+rdJnUlYDDPSiDpNQq?=
 =?us-ascii?Q?rc2D8VUieUlVW3mzFguUFUGlA3joXrWcT2Cr61CDYtvt3VqM/87YtW1Jj1rR?=
 =?us-ascii?Q?Sgajg3y48KIl888mD+4kTIKBe3bkchwWM0DxahYberetRLBDy1SdU9iTJNn2?=
 =?us-ascii?Q?1/VeRKlZrWT14gQ4THW0KjyCgsZtOlHOLTjtDSA1iq+EWchZ39ZNw4L6kJSX?=
 =?us-ascii?Q?yOn2/+kcNk12tUWE1UJM+odLKy/Qq7Y47VWCA/A98dxVOShvKPMqUX+M6Sq1?=
 =?us-ascii?Q?f0zAJK310gd/+eqKSKwrnA1p1sdWJwmtHCHgcpLUt0ZYyT/0UQrgyBoMlIvY?=
 =?us-ascii?Q?1gTi2BoqscFrltwVM/4a1LfitTisZcrH9okvoVBsXzKnUfKevQruXU13w+WM?=
 =?us-ascii?Q?Ss5DpNjhPWDLCtzAYviH/XsmTkfF/eS5OmmSrGi+A2eh66NUr7AK2dbSJlaj?=
 =?us-ascii?Q?diZZ2uD0eBuKezrXnCDKF5j6jCAMz0gJ0pX7qiNlqbiPAXhTiiz7CvWW/Yjs?=
 =?us-ascii?Q?GafQIjuo6TYH89XMUuo2R63Iv1SP2GfSstWazXWkhw2AiW8mWlHNPO/Tlzhg?=
 =?us-ascii?Q?W7L4uBOJE+If0qijTMhQXMHc5iyuMczJYm/pLt61DT3NRzZW/3xWm4M+u9j5?=
 =?us-ascii?Q?HWOfN6sKkpa/41U1xaHzY7XEn0cJiAT5RdTPOAw7+XXjJdANuIXRr3PZZYvj?=
 =?us-ascii?Q?GT+ywL4cv2NUk7umzYjYAUjig6dOi0614NZUWCDhwux8NvYIPrEv2VPa519p?=
 =?us-ascii?Q?jTowWjQvfaQqeQqfsUJ4WXZbCUns9cNDlQ+8jklkCtDeF3EaQ/0dwi6lHw+W?=
 =?us-ascii?Q?FddZL4crafz4gBYQWhkwfE4/yiqD0C56sUAcR1atAbHaUUjy3NTwa5Ab4zDg?=
 =?us-ascii?Q?hJ1Do5pIvRq6wiqoJVD8lDuX9YbI3Ig1+rcdTrP54J6FCk1TIkk/0S3b7rL7?=
 =?us-ascii?Q?OzTOZ9MNVB3FC9Gqt/cNgeXJsbGX5rCG086HIirYXI+L7iCv7fWvoDv58POt?=
 =?us-ascii?Q?JdOBnn2yf4yQworCYW9AuRO/PQSIVUgIVPszDTy1FQgAroTXkzGXrkp0t3rD?=
 =?us-ascii?Q?Q9yiTgD5yd65mg+YXtVJ2Xxflv1nVMp9kgRXgQ16w4Ywdvnzxg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 04:14:26.2134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 818d87eb-8f09-4300-eb4f-08dcf2500458
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7313

From: Ritu Chaudhary <rituc@nvidia.com>

Add support for S24_LE format for all internal and IO AHUB
modules, except for ASRC (which is already supported).

The data flow happens as mentioned below:

- ADMAIF picks 24-bit valid data and converts it to 32-bit before
  sending to internal AHUB modules. This makes the driver change
  simpler for internal AHUB modules.
- IO modules CIF converts the 32-bit data to 24-bit before sending it
  to the external world.
- To maintain consistency across modules, conversions between 24-bit
  and 32-bit occur either at ADMAIF or at the IO modules CIF.

This feature has been thoroughly tested and verified with all internal
AHUB modules on the Jetson AGX Orin Platform, as well as with the
external RT5640 codec.

Signed-off-by: Ritu Chaudhary <rituc@nvidia.com>
Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra186_dspk.c   |  3 +++
 sound/soc/tegra/tegra210_admaif.c | 11 +++++++++--
 sound/soc/tegra/tegra210_adx.c    |  9 +++++++--
 sound/soc/tegra/tegra210_amx.c    |  9 +++++++--
 sound/soc/tegra/tegra210_dmic.c   |  7 +++++--
 sound/soc/tegra/tegra210_i2s.c    | 14 ++++++++++++--
 sound/soc/tegra/tegra210_i2s.h    |  9 +++++----
 sound/soc/tegra/tegra210_mixer.c  |  9 +++++++--
 sound/soc/tegra/tegra210_mvc.c    |  9 +++++++--
 sound/soc/tegra/tegra210_ope.c    |  9 +++++++--
 sound/soc/tegra/tegra210_sfc.c    |  9 +++++++--
 11 files changed, 76 insertions(+), 22 deletions(-)

diff --git a/sound/soc/tegra/tegra186_dspk.c b/sound/soc/tegra/tegra186_dspk.c
index 508128b7783e..1be6c09cbe1a 100644
--- a/sound/soc/tegra/tegra186_dspk.c
+++ b/sound/soc/tegra/tegra186_dspk.c
@@ -245,6 +245,7 @@ static int tegra186_dspk_hw_params(struct snd_pcm_substream *substream,
 		cif_conf.audio_bits = TEGRA_ACIF_BITS_16;
 		cif_conf.client_bits = TEGRA_ACIF_BITS_16;
 		break;
+	case SNDRV_PCM_FORMAT_S24_LE:
 	case SNDRV_PCM_FORMAT_S32_LE:
 		cif_conf.audio_bits = TEGRA_ACIF_BITS_32;
 		cif_conf.client_bits = TEGRA_ACIF_BITS_24;
@@ -313,6 +314,7 @@ static struct snd_soc_dai_driver tegra186_dspk_dais[] = {
 		.channels_max = 2,
 		.rates = SNDRV_PCM_RATE_8000_48000,
 		.formats = SNDRV_PCM_FMTBIT_S16_LE |
+			   SNDRV_PCM_FMTBIT_S24_LE |
 			   SNDRV_PCM_FMTBIT_S32_LE,
 	    },
 	},
@@ -324,6 +326,7 @@ static struct snd_soc_dai_driver tegra186_dspk_dais[] = {
 		.channels_max = 2,
 		.rates = SNDRV_PCM_RATE_8000_48000,
 		.formats = SNDRV_PCM_FMTBIT_S16_LE |
+			   SNDRV_PCM_FMTBIT_S24_LE |
 			   SNDRV_PCM_FMTBIT_S32_LE,
 	    },
 	    .ops = &tegra186_dspk_dai_ops,
diff --git a/sound/soc/tegra/tegra210_admaif.c b/sound/soc/tegra/tegra210_admaif.c
index a866aeb2719d..58fdb0e79954 100644
--- a/sound/soc/tegra/tegra210_admaif.c
+++ b/sound/soc/tegra/tegra210_admaif.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
+// SPDX-FileCopyrightText: Copyright (c) 2020-2024 NVIDIA CORPORATION & AFFILIATES.
+// All rights reserved.
 //
 // tegra210_admaif.c - Tegra ADMAIF driver
-//
-// Copyright (c) 2020 NVIDIA CORPORATION.  All rights reserved.
 
 #include <linux/clk.h>
 #include <linux/device.h>
@@ -285,6 +285,11 @@ static int tegra_admaif_hw_params(struct snd_pcm_substream *substream,
 		cif_conf.client_bits = TEGRA_ACIF_BITS_16;
 		valid_bit = DATA_16BIT;
 		break;
+	case SNDRV_PCM_FORMAT_S24_LE:
+		cif_conf.audio_bits = TEGRA_ACIF_BITS_32;
+		cif_conf.client_bits = TEGRA_ACIF_BITS_24;
+		valid_bit = DATA_32BIT;
+		break;
 	case SNDRV_PCM_FORMAT_S32_LE:
 		cif_conf.audio_bits = TEGRA_ACIF_BITS_32;
 		cif_conf.client_bits = TEGRA_ACIF_BITS_32;
@@ -561,6 +566,7 @@ static const struct snd_soc_dai_ops tegra_admaif_dai_ops = {
 			.rates = SNDRV_PCM_RATE_8000_192000,	\
 			.formats = SNDRV_PCM_FMTBIT_S8 |	\
 				SNDRV_PCM_FMTBIT_S16_LE |	\
+				SNDRV_PCM_FMTBIT_S24_LE |	\
 				SNDRV_PCM_FMTBIT_S32_LE,	\
 		},						\
 		.capture = {					\
@@ -570,6 +576,7 @@ static const struct snd_soc_dai_ops tegra_admaif_dai_ops = {
 			.rates = SNDRV_PCM_RATE_8000_192000,	\
 			.formats = SNDRV_PCM_FMTBIT_S8 |	\
 				SNDRV_PCM_FMTBIT_S16_LE |	\
+				SNDRV_PCM_FMTBIT_S24_LE |	\
 				SNDRV_PCM_FMTBIT_S32_LE,	\
 		},						\
 		.ops = &tegra_admaif_dai_ops,			\
diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra210_adx.c
index 109f763fe211..3e6e8f51f380 100644
--- a/sound/soc/tegra/tegra210_adx.c
+++ b/sound/soc/tegra/tegra210_adx.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
+// SPDX-FileCopyrightText: Copyright (c) 2021-2024 NVIDIA CORPORATION & AFFILIATES.
+// All rights reserved.
 //
 // tegra210_adx.c - Tegra210 ADX driver
-//
-// Copyright (c) 2021-2023 NVIDIA CORPORATION.  All rights reserved.
 
 #include <linux/clk.h>
 #include <linux/device.h>
@@ -127,6 +127,7 @@ static int tegra210_adx_set_audio_cif(struct snd_soc_dai *dai,
 	case SNDRV_PCM_FORMAT_S16_LE:
 		audio_bits = TEGRA_ACIF_BITS_16;
 		break;
+	case SNDRV_PCM_FORMAT_S24_LE:
 	case SNDRV_PCM_FORMAT_S32_LE:
 		audio_bits = TEGRA_ACIF_BITS_32;
 		break;
@@ -237,6 +238,7 @@ static const struct snd_soc_dai_ops tegra210_adx_out_dai_ops = {
 			.rates = SNDRV_PCM_RATE_8000_192000,	\
 			.formats = SNDRV_PCM_FMTBIT_S8 |	\
 				   SNDRV_PCM_FMTBIT_S16_LE |	\
+				   SNDRV_PCM_FMTBIT_S24_LE |	\
 				   SNDRV_PCM_FMTBIT_S32_LE,	\
 		},						\
 		.capture = {					\
@@ -246,6 +248,7 @@ static const struct snd_soc_dai_ops tegra210_adx_out_dai_ops = {
 			.rates = SNDRV_PCM_RATE_8000_192000,	\
 			.formats = SNDRV_PCM_FMTBIT_S8 |	\
 				   SNDRV_PCM_FMTBIT_S16_LE |	\
+				   SNDRV_PCM_FMTBIT_S24_LE |	\
 				   SNDRV_PCM_FMTBIT_S32_LE,	\
 		},						\
 		.ops = &tegra210_adx_in_dai_ops,		\
@@ -260,6 +263,7 @@ static const struct snd_soc_dai_ops tegra210_adx_out_dai_ops = {
 			.channels_max = 16,			\
 			.rates = SNDRV_PCM_RATE_8000_192000,	\
 			.formats = SNDRV_PCM_FMTBIT_S8 |	\
+				   SNDRV_PCM_FMTBIT_S16_LE |	\
 				   SNDRV_PCM_FMTBIT_S16_LE |	\
 				   SNDRV_PCM_FMTBIT_S32_LE,	\
 		},						\
@@ -269,6 +273,7 @@ static const struct snd_soc_dai_ops tegra210_adx_out_dai_ops = {
 			.channels_max = 16,			\
 			.rates = SNDRV_PCM_RATE_8000_192000,	\
 			.formats = SNDRV_PCM_FMTBIT_S8 |	\
+				   SNDRV_PCM_FMTBIT_S16_LE |	\
 				   SNDRV_PCM_FMTBIT_S16_LE |	\
 				   SNDRV_PCM_FMTBIT_S32_LE,	\
 		},						\
diff --git a/sound/soc/tegra/tegra210_amx.c b/sound/soc/tegra/tegra210_amx.c
index 38a2d6ec033b..a9ef22c19e81 100644
--- a/sound/soc/tegra/tegra210_amx.c
+++ b/sound/soc/tegra/tegra210_amx.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
+// SPDX-FileCopyrightText: Copyright (c) 2021-2024 NVIDIA CORPORATION & AFFILIATES.
+// All rights reserved.
 //
 // tegra210_amx.c - Tegra210 AMX driver
-//
-// Copyright (c) 2021-2023 NVIDIA CORPORATION.  All rights reserved.
 
 #include <linux/clk.h>
 #include <linux/device.h>
@@ -144,6 +144,7 @@ static int tegra210_amx_set_audio_cif(struct snd_soc_dai *dai,
 	case SNDRV_PCM_FORMAT_S16_LE:
 		audio_bits = TEGRA_ACIF_BITS_16;
 		break;
+	case SNDRV_PCM_FORMAT_S24_LE:
 	case SNDRV_PCM_FORMAT_S32_LE:
 		audio_bits = TEGRA_ACIF_BITS_32;
 		break;
@@ -266,6 +267,7 @@ static const struct snd_soc_dai_ops tegra210_amx_in_dai_ops = {
 			.rates = SNDRV_PCM_RATE_8000_192000,	\
 			.formats = SNDRV_PCM_FMTBIT_S8 |	\
 				   SNDRV_PCM_FMTBIT_S16_LE |	\
+				   SNDRV_PCM_FMTBIT_S24_LE |	\
 				   SNDRV_PCM_FMTBIT_S32_LE,	\
 		},						\
 		.capture = {					\
@@ -275,6 +277,7 @@ static const struct snd_soc_dai_ops tegra210_amx_in_dai_ops = {
 			.rates = SNDRV_PCM_RATE_8000_192000,	\
 			.formats = SNDRV_PCM_FMTBIT_S8 |	\
 				   SNDRV_PCM_FMTBIT_S16_LE |	\
+				   SNDRV_PCM_FMTBIT_S24_LE |	\
 				   SNDRV_PCM_FMTBIT_S32_LE,	\
 		},						\
 		.ops = &tegra210_amx_in_dai_ops,		\
@@ -290,6 +293,7 @@ static const struct snd_soc_dai_ops tegra210_amx_in_dai_ops = {
 			.rates = SNDRV_PCM_RATE_8000_192000,	\
 			.formats = SNDRV_PCM_FMTBIT_S8 |	\
 				   SNDRV_PCM_FMTBIT_S16_LE |	\
+				   SNDRV_PCM_FMTBIT_S24_LE |	\
 				   SNDRV_PCM_FMTBIT_S32_LE,	\
 		},						\
 		.capture = {					\
@@ -299,6 +303,7 @@ static const struct snd_soc_dai_ops tegra210_amx_in_dai_ops = {
 			.rates = SNDRV_PCM_RATE_8000_192000,	\
 			.formats = SNDRV_PCM_FMTBIT_S8 |	\
 				   SNDRV_PCM_FMTBIT_S16_LE |	\
+				   SNDRV_PCM_FMTBIT_S24_LE |	\
 				   SNDRV_PCM_FMTBIT_S32_LE,	\
 		},						\
 		.ops = &tegra210_amx_out_dai_ops,		\
diff --git a/sound/soc/tegra/tegra210_dmic.c b/sound/soc/tegra/tegra210_dmic.c
index d9b577f146dc..7986be71f43d 100644
--- a/sound/soc/tegra/tegra210_dmic.c
+++ b/sound/soc/tegra/tegra210_dmic.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
+// SPDX-FileCopyrightText: Copyright (c) 2020-2024 NVIDIA CORPORATION & AFFILIATES.
+// All rights reserved.
 //
 // tegra210_dmic.c - Tegra210 DMIC driver
-//
-// Copyright (c) 2020 NVIDIA CORPORATION.  All rights reserved.
 
 #include <linux/clk.h>
 #include <linux/device.h>
@@ -139,6 +139,7 @@ static int tegra210_dmic_hw_params(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_FORMAT_S16_LE:
 		cif_conf.audio_bits = TEGRA_ACIF_BITS_16;
 		break;
+	case SNDRV_PCM_FORMAT_S24_LE:
 	case SNDRV_PCM_FORMAT_S32_LE:
 		cif_conf.audio_bits = TEGRA_ACIF_BITS_32;
 		break;
@@ -325,6 +326,7 @@ static struct snd_soc_dai_driver tegra210_dmic_dais[] = {
 			.channels_max = 2,
 			.rates = SNDRV_PCM_RATE_8000_48000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
 				   SNDRV_PCM_FMTBIT_S32_LE,
 		},
 	},
@@ -336,6 +338,7 @@ static struct snd_soc_dai_driver tegra210_dmic_dais[] = {
 			.channels_max = 2,
 			.rates = SNDRV_PCM_RATE_8000_48000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE |
 				   SNDRV_PCM_FMTBIT_S32_LE,
 		},
 		.ops = &tegra210_dmic_dai_ops,
diff --git a/sound/soc/tegra/tegra210_i2s.c b/sound/soc/tegra/tegra210_i2s.c
index a3908b15dfdc..07ce2dbe6c00 100644
--- a/sound/soc/tegra/tegra210_i2s.c
+++ b/sound/soc/tegra/tegra210_i2s.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
+// SPDX-FileCopyrightText: Copyright (c) 2020-2024 NVIDIA CORPORATION & AFFILIATES.
+// All rights reserved.
 //
 // tegra210_i2s.c - Tegra210 I2S driver
-//
-// Copyright (c) 2020 NVIDIA CORPORATION.  All rights reserved.
 
 #include <linux/clk.h>
 #include <linux/device.h>
@@ -629,6 +629,7 @@ static int tegra210_i2s_hw_params(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_FORMAT_S16_LE:
 		cif_conf.audio_bits = TEGRA_ACIF_BITS_16;
 		break;
+	case SNDRV_PCM_FORMAT_S24_LE:
 	case SNDRV_PCM_FORMAT_S32_LE:
 		cif_conf.audio_bits = TEGRA_ACIF_BITS_32;
 		break;
@@ -656,6 +657,11 @@ static int tegra210_i2s_hw_params(struct snd_pcm_substream *substream,
 		sample_size = 16;
 		cif_conf.client_bits = TEGRA_ACIF_BITS_16;
 		break;
+	case SNDRV_PCM_FORMAT_S24_LE:
+		val = I2S_BITS_24;
+		sample_size = 32;
+		cif_conf.client_bits = TEGRA_ACIF_BITS_24;
+		break;
 	case SNDRV_PCM_FORMAT_S32_LE:
 		val = I2S_BITS_32;
 		sample_size = 32;
@@ -720,6 +726,7 @@ static struct snd_soc_dai_driver tegra210_i2s_dais[] = {
 			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S8 |
 				SNDRV_PCM_FMTBIT_S16_LE |
+				SNDRV_PCM_FMTBIT_S24_LE |
 				SNDRV_PCM_FMTBIT_S32_LE,
 		},
 		.capture = {
@@ -729,6 +736,7 @@ static struct snd_soc_dai_driver tegra210_i2s_dais[] = {
 			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S8 |
 				SNDRV_PCM_FMTBIT_S16_LE |
+				SNDRV_PCM_FMTBIT_S24_LE |
 				SNDRV_PCM_FMTBIT_S32_LE,
 		},
 	},
@@ -741,6 +749,7 @@ static struct snd_soc_dai_driver tegra210_i2s_dais[] = {
 			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S8 |
 				SNDRV_PCM_FMTBIT_S16_LE |
+				SNDRV_PCM_FMTBIT_S24_LE |
 				SNDRV_PCM_FMTBIT_S32_LE,
 		},
 		.capture = {
@@ -750,6 +759,7 @@ static struct snd_soc_dai_driver tegra210_i2s_dais[] = {
 			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S8 |
 				SNDRV_PCM_FMTBIT_S16_LE |
+				SNDRV_PCM_FMTBIT_S24_LE |
 				SNDRV_PCM_FMTBIT_S32_LE,
 		},
 		.ops = &tegra210_i2s_dai_ops,
diff --git a/sound/soc/tegra/tegra210_i2s.h b/sound/soc/tegra/tegra210_i2s.h
index fe478f3d8435..543332de7405 100644
--- a/sound/soc/tegra/tegra210_i2s.h
+++ b/sound/soc/tegra/tegra210_i2s.h
@@ -1,8 +1,8 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * tegra210_i2s.h - Definitions for Tegra210 I2S driver
+/* SPDX-License-Identifier: GPL-2.0-only
+ * SPDX-FileCopyrightText: Copyright (c) 2020-2024 NVIDIA CORPORATION & AFFILIATES.
+ * All rights reserved.
  *
- * Copyright (c) 2020 NVIDIA CORPORATION. All rights reserved.
+ * tegra210_i2s.h - Definitions for Tegra210 I2S driver
  *
  */
 
@@ -87,6 +87,7 @@
 
 #define I2S_BITS_8				1
 #define I2S_BITS_16				3
+#define I2S_BITS_24				5
 #define I2S_BITS_32				7
 #define I2S_CTRL_BIT_SIZE_MASK			0x7
 
diff --git a/sound/soc/tegra/tegra210_mixer.c b/sound/soc/tegra/tegra210_mixer.c
index e07e2f1d2f70..410259d98dfb 100644
--- a/sound/soc/tegra/tegra210_mixer.c
+++ b/sound/soc/tegra/tegra210_mixer.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
+// SPDX-FileCopyrightText: Copyright (c) 2021-2024 NVIDIA CORPORATION & AFFILIATES.
+// All rights reserved.
 //
 // tegra210_mixer.c - Tegra210 MIXER driver
-//
-// Copyright (c) 2021 NVIDIA CORPORATION.  All rights reserved.
 
 #include <linux/clk.h>
 #include <linux/device.h>
@@ -248,6 +248,7 @@ static int tegra210_mixer_set_audio_cif(struct tegra210_mixer *mixer,
 	case SNDRV_PCM_FORMAT_S16_LE:
 		audio_bits = TEGRA_ACIF_BITS_16;
 		break;
+	case SNDRV_PCM_FORMAT_S24_LE:
 	case SNDRV_PCM_FORMAT_S32_LE:
 		audio_bits = TEGRA_ACIF_BITS_32;
 		break;
@@ -312,6 +313,7 @@ static const struct snd_soc_dai_ops tegra210_mixer_in_dai_ops = {
 			.rates = SNDRV_PCM_RATE_8000_192000,	\
 			.formats = SNDRV_PCM_FMTBIT_S8 |	\
 				SNDRV_PCM_FMTBIT_S16_LE |	\
+				SNDRV_PCM_FMTBIT_S24_LE |	\
 				SNDRV_PCM_FMTBIT_S32_LE,	\
 		},						\
 		.capture = {					\
@@ -321,6 +323,7 @@ static const struct snd_soc_dai_ops tegra210_mixer_in_dai_ops = {
 			.rates = SNDRV_PCM_RATE_8000_192000,	\
 			.formats = SNDRV_PCM_FMTBIT_S8 |	\
 				SNDRV_PCM_FMTBIT_S16_LE |	\
+				SNDRV_PCM_FMTBIT_S24_LE |	\
 				SNDRV_PCM_FMTBIT_S32_LE,	\
 		},						\
 		.ops = &tegra210_mixer_in_dai_ops,		\
@@ -336,6 +339,7 @@ static const struct snd_soc_dai_ops tegra210_mixer_in_dai_ops = {
 			.rates = SNDRV_PCM_RATE_8000_192000,	\
 			.formats = SNDRV_PCM_FMTBIT_S8 |	\
 				SNDRV_PCM_FMTBIT_S16_LE |	\
+				SNDRV_PCM_FMTBIT_S24_LE |	\
 				SNDRV_PCM_FMTBIT_S32_LE,	\
 		},						\
 		.capture = {					\
@@ -345,6 +349,7 @@ static const struct snd_soc_dai_ops tegra210_mixer_in_dai_ops = {
 			.rates = SNDRV_PCM_RATE_8000_192000,	\
 			.formats = SNDRV_PCM_FMTBIT_S8 |	\
 				SNDRV_PCM_FMTBIT_S16_LE |	\
+				SNDRV_PCM_FMTBIT_S24_LE |	\
 				SNDRV_PCM_FMTBIT_S32_LE,	\
 		},						\
 		.ops = &tegra210_mixer_out_dai_ops,		\
diff --git a/sound/soc/tegra/tegra210_mvc.c b/sound/soc/tegra/tegra210_mvc.c
index 4ead52564ab6..119f17501478 100644
--- a/sound/soc/tegra/tegra210_mvc.c
+++ b/sound/soc/tegra/tegra210_mvc.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
+// SPDX-FileCopyrightText: Copyright (c) 2021-2024 NVIDIA CORPORATION & AFFILIATES.
+// All rights reserved.
 //
 // tegra210_mvc.c - Tegra210 MVC driver
-//
-// Copyright (c) 2021 NVIDIA CORPORATION.  All rights reserved.
 
 #include <linux/clk.h>
 #include <linux/device.h>
@@ -441,6 +441,7 @@ static int tegra210_mvc_set_audio_cif(struct tegra210_mvc *mvc,
 	case SNDRV_PCM_FORMAT_S16_LE:
 		audio_bits = TEGRA_ACIF_BITS_16;
 		break;
+	case SNDRV_PCM_FORMAT_S24_LE:
 	case SNDRV_PCM_FORMAT_S32_LE:
 		audio_bits = TEGRA_ACIF_BITS_32;
 		break;
@@ -569,6 +570,7 @@ static struct snd_soc_dai_driver tegra210_mvc_dais[] = {
 			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S8 |
 				SNDRV_PCM_FMTBIT_S16_LE |
+				SNDRV_PCM_FMTBIT_S24_LE |
 				SNDRV_PCM_FMTBIT_S32_LE,
 		},
 		.capture = {
@@ -578,6 +580,7 @@ static struct snd_soc_dai_driver tegra210_mvc_dais[] = {
 			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S8 |
 				SNDRV_PCM_FMTBIT_S16_LE |
+				SNDRV_PCM_FMTBIT_S24_LE |
 				SNDRV_PCM_FMTBIT_S32_LE,
 		},
 	},
@@ -592,6 +595,7 @@ static struct snd_soc_dai_driver tegra210_mvc_dais[] = {
 			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S8 |
 				SNDRV_PCM_FMTBIT_S16_LE |
+				SNDRV_PCM_FMTBIT_S24_LE |
 				SNDRV_PCM_FMTBIT_S32_LE,
 		},
 		.capture = {
@@ -601,6 +605,7 @@ static struct snd_soc_dai_driver tegra210_mvc_dais[] = {
 			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S8 |
 				SNDRV_PCM_FMTBIT_S16_LE |
+				SNDRV_PCM_FMTBIT_S24_LE |
 				SNDRV_PCM_FMTBIT_S32_LE,
 		},
 		.ops = &tegra210_mvc_dai_ops,
diff --git a/sound/soc/tegra/tegra210_ope.c b/sound/soc/tegra/tegra210_ope.c
index e2bc604e8b79..c595cec9baab 100644
--- a/sound/soc/tegra/tegra210_ope.c
+++ b/sound/soc/tegra/tegra210_ope.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
+// SPDX-FileCopyrightText: Copyright (c) 2022-2024 NVIDIA CORPORATION & AFFILIATES.
+// All rights reserved.
 //
 // tegra210_ope.c - Tegra210 OPE driver
-//
-// Copyright (c) 2022, NVIDIA CORPORATION. All rights reserved.
 
 #include <linux/clk.h>
 #include <linux/device.h>
@@ -47,6 +47,7 @@ static int tegra210_ope_set_audio_cif(struct tegra210_ope *ope,
 	case SNDRV_PCM_FORMAT_S16_LE:
 		audio_bits = TEGRA_ACIF_BITS_16;
 		break;
+	case SNDRV_PCM_FORMAT_S24_LE:
 	case SNDRV_PCM_FORMAT_S32_LE:
 		audio_bits = TEGRA_ACIF_BITS_32;
 		break;
@@ -129,6 +130,7 @@ static struct snd_soc_dai_driver tegra210_ope_dais[] = {
 			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S8 |
 				SNDRV_PCM_FMTBIT_S16_LE |
+				SNDRV_PCM_FMTBIT_S24_LE |
 				SNDRV_PCM_FMTBIT_S32_LE,
 		},
 		.capture = {
@@ -138,6 +140,7 @@ static struct snd_soc_dai_driver tegra210_ope_dais[] = {
 			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S8 |
 				SNDRV_PCM_FMTBIT_S16_LE |
+				SNDRV_PCM_FMTBIT_S24_LE |
 				SNDRV_PCM_FMTBIT_S32_LE,
 		},
 	},
@@ -150,6 +153,7 @@ static struct snd_soc_dai_driver tegra210_ope_dais[] = {
 			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S8 |
 				SNDRV_PCM_FMTBIT_S16_LE |
+				SNDRV_PCM_FMTBIT_S24_LE |
 				SNDRV_PCM_FMTBIT_S32_LE,
 		},
 		.capture = {
@@ -159,6 +163,7 @@ static struct snd_soc_dai_driver tegra210_ope_dais[] = {
 			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S8 |
 				SNDRV_PCM_FMTBIT_S16_LE |
+				SNDRV_PCM_FMTBIT_S24_LE |
 				SNDRV_PCM_FMTBIT_S32_LE,
 		},
 		.ops = &tegra210_ope_dai_ops,
diff --git a/sound/soc/tegra/tegra210_sfc.c b/sound/soc/tegra/tegra210_sfc.c
index e16bbb44cc77..df88708c733c 100644
--- a/sound/soc/tegra/tegra210_sfc.c
+++ b/sound/soc/tegra/tegra210_sfc.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
+// SPDX-FileCopyrightText: Copyright (c) 2021-2024 NVIDIA CORPORATION & AFFILIATES.
+// All rights reserved.
 //
 // tegra210_sfc.c - Tegra210 SFC driver
-//
-// Copyright (c) 2021-2023 NVIDIA CORPORATION.  All rights reserved.
 
 #include <linux/clk.h>
 #include <linux/device.h>
@@ -3133,6 +3133,7 @@ static int tegra210_sfc_set_audio_cif(struct tegra210_sfc *sfc,
 	case SNDRV_PCM_FORMAT_S16_LE:
 		audio_bits = TEGRA_ACIF_BITS_16;
 		break;
+	case SNDRV_PCM_FORMAT_S24_LE:
 	case SNDRV_PCM_FORMAT_S32_LE:
 		audio_bits = TEGRA_ACIF_BITS_32;
 		break;
@@ -3395,6 +3396,7 @@ static struct snd_soc_dai_driver tegra210_sfc_dais[] = {
 			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S8 |
 				SNDRV_PCM_FMTBIT_S16_LE |
+				SNDRV_PCM_FMTBIT_S24_LE |
 				SNDRV_PCM_FMTBIT_S32_LE,
 		},
 		.capture = {
@@ -3404,6 +3406,7 @@ static struct snd_soc_dai_driver tegra210_sfc_dais[] = {
 			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S8 |
 				SNDRV_PCM_FMTBIT_S16_LE |
+				SNDRV_PCM_FMTBIT_S24_LE |
 				SNDRV_PCM_FMTBIT_S32_LE,
 		},
 		.ops = &tegra210_sfc_in_dai_ops,
@@ -3417,6 +3420,7 @@ static struct snd_soc_dai_driver tegra210_sfc_dais[] = {
 			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S8 |
 				SNDRV_PCM_FMTBIT_S16_LE |
+				SNDRV_PCM_FMTBIT_S24_LE |
 				SNDRV_PCM_FMTBIT_S32_LE,
 		},
 		.capture = {
@@ -3426,6 +3430,7 @@ static struct snd_soc_dai_driver tegra210_sfc_dais[] = {
 			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = SNDRV_PCM_FMTBIT_S8 |
 				SNDRV_PCM_FMTBIT_S16_LE |
+				SNDRV_PCM_FMTBIT_S24_LE |
 				SNDRV_PCM_FMTBIT_S32_LE,
 		},
 		.ops = &tegra210_sfc_out_dai_ops,
-- 
2.17.1

