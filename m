Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2087.outbound.protection.outlook.com [40.107.223.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972D727465E;
	Tue, 29 Apr 2025 06:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745906416; cv=fail; b=HYIgPCkLcJy7g9uTVmrIySLbXgkzDz3mLkLlZyVdEuMluG8xZyRt+aJA86mP4hMUjzMxGczKszcJkAMa5cQ2FD5yzXlRnJ3l20cTa8K57qRa69S0+EeK32ZRjkN97G+7SDV8/FIAG2VtBA+K6+pSpgWT6DLSaGX0wTVaIG6L128=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745906416; c=relaxed/simple;
	bh=MKiy7ay/+K7VfiYJa8C/aKY3VL2aKPivL0sZC4+zq2M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iNomfh4XTYrzpAvQXku1sc8KsKDx0hJwTh4ptFDu42zuRD5bHVsj8iO6UESu2ljahBnlxDBObPJFcSPJGoN5tJiVsUFpLJeKodo7wTQcW6ZWfRilrKxQ8JIFsXT4j766iDE4ZyF7pwgZ7y8MwJFkBnse30gcbUKbVIJxCJcpw/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mueLiBM2; arc=fail smtp.client-ip=40.107.223.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mueLiBM2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vKHcKOdqj2QCn2Tz2p/UDakAnU7lKYa+GzdNi3hy7Q4e+AzmkIJ4inHTDMW+VhhqIDrAL4il6zlzaiuV+u8HpH3wJbnkXBBsd7nqwSXMKvlAo5b+TTMBXl4jP+Xv4IL/euoFH6G9EoFr86VwjC1b+5ADqo4meyaIoEGZf4V8GgJVU+5G5OjqZcJlQF+Lwe/Ms1XTGYcVgxTnf70Y76t3jI3/HsvnhdQLo3r/ssXeEubu9VxHDaam7sZJxRZCfAXW+m2VGqJjhP4OBtXrdvPUvmsMfqPejna7DFJ+69DI32O7GVhEcLhZxeYoEbknXwZRbLXijp5OT2+M9S3lmXi1RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJmBtqYN1kJQixBip+LnbcKnQ4BKV0oovXrTFIeddvI=;
 b=oZd8LHiP6yP7UzP9Mib1lk2DoY1GCTxAITPS2jdNHLxW19HHiXF1Wi1LHYMDy1KDCAe9FY3w4KuWAk5NRXDzoCk++YZGxVwq5/ux8eM9YP6LhLuOkg7gR+tDKQv89EPycV860PJqJcRf29WCRcG3bSkQO8t2lTqOguAyZsAp3frc85iv5nmmjfjhrgXr2fsxNWMeur+P4kOdGAT79xdAAbmWuwW6V16Jt82aQRU2W6pIYCDNoGAcGZt+uidB5uimS7elt6iS+gI5wDbm/rrXJuj0Uzh9JNI7I2uwrIgXTeVOhn9FRcbjdP9cSHnkvO8xjCHdWDbRcSujLqcY4ty/HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJmBtqYN1kJQixBip+LnbcKnQ4BKV0oovXrTFIeddvI=;
 b=mueLiBM2IF+PvQuaHb1fJA/yIb+yUuB2s6oC+pescP8q7dfF9p5qChdvXwREjrLkdp80cQdbOvsRCzVxyW39h1HObwFvJlBaBswJJSCGqeaknYXMNm8Z9qneoKXCh0daXCdbXZ2ZZZwzUJI1UiHHlyAuE7GEqxruZpcVSsMa2mrZ/B5vueFUw+du6LjDtC7eeOAU64zFhDVaFQnuXY50UwS9LklJabmd6EdvoVa56dsEP2LPlBxRA+XI94jJbFzcd8j5YJqEE/SffmZWEpzkc+u/F1kc4NjEy98p04hBxKBtMq5zfaT5A8mbdozLwG6PORJLWsIjRKSYyKmST3fYjw==
Received: from BN9PR03CA0412.namprd03.prod.outlook.com (2603:10b6:408:111::27)
 by DM6PR12MB4404.namprd12.prod.outlook.com (2603:10b6:5:2a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Tue, 29 Apr
 2025 06:00:10 +0000
Received: from BN1PEPF00004684.namprd03.prod.outlook.com
 (2603:10b6:408:111:cafe::12) by BN9PR03CA0412.outlook.office365.com
 (2603:10b6:408:111::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Tue,
 29 Apr 2025 06:00:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00004684.mail.protection.outlook.com (10.167.243.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.33 via Frontend Transport; Tue, 29 Apr 2025 06:00:10 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 28 Apr
 2025 22:59:51 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 28 Apr
 2025 22:59:50 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Mon, 28 Apr 2025 22:59:50 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>
CC: <perex@perex.cz>, <tiwai@suse.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <spujar@nvidia.com>, <mkumard@nvidia.com>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v2 11/11] ASoC: tegra: Tegra264 support in isomgr_bw
Date: Tue, 29 Apr 2025 05:59:41 +0000
Message-ID: <20250429055941.901511-12-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004684:EE_|DM6PR12MB4404:EE_
X-MS-Office365-Filtering-Correlation-Id: f8d3ee67-ea1d-410c-5932-08dd86e319e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zd+SnDPOkSV2Qvit9i8wHdOttkrN4+Ff1mYE02wIJB035Jdp/zZ44XePeyQ0?=
 =?us-ascii?Q?HbCpx64EefzmwIU4oevZ6kAexTHjy+FdAk+fG9C+MNknZJoMn/KBWXgiUDyZ?=
 =?us-ascii?Q?3AI0dBDUzzEDYrTBES/hjUSHRxMbywYQGDLPvt+EW2xX04Aj6vNl9Xk4ytQT?=
 =?us-ascii?Q?DsYeQmpYrKR3SwiD74GOSh2A6xSx2qOEoNcwk84bGEA8HFj5ND0wkSU4QULO?=
 =?us-ascii?Q?L9lm4BNGa87axf3GJn1eC6LHh9ARGmVdSxb47rqNT0tldKV3iOCAEWS1yQaU?=
 =?us-ascii?Q?CC6UMA8eLN6BeXphGdNAcVKrt0iAq8dbonaLxOlGagsIK0icBcJjVtap6UK5?=
 =?us-ascii?Q?2tOah2eaIeuo35c/6MuZc5dfrFhbAX03UEHNfvLnEOke39Nry0zgl6EpAN7+?=
 =?us-ascii?Q?w6c561zeOQAxGsD+JeoUfcYwxxSoT9eXxnzQPimtr7ocqbt3+quL5g7JxA9z?=
 =?us-ascii?Q?PDDrH36/Zh4ckrlClNIDacgvYJEUcVspS8YhPcjNGbnE2TxdAzeR4Meh04gW?=
 =?us-ascii?Q?zBNBBKfE4i0W4wAHJ8sVYI2/uqDVtjVKBI47czq1CjxIwiJRRfdfx1aHR/t9?=
 =?us-ascii?Q?gLImbl8uTsvDe0LN3BbqS1YJOTIVwKK9IWvAod5H7YKJBs+yhJEo1aVmn473?=
 =?us-ascii?Q?lXadJpYC94Y983VqUDc95L+/EgnW2iH6u1bx6CkiAlubc5ScuMBr77aOgoAq?=
 =?us-ascii?Q?kTtvN/yu1IWyJ1k+y6Rg0sfjac3a14U9tihV0RaLS1VDueKPBjULS7QoUoSN?=
 =?us-ascii?Q?LM04IA7d8mUrIlN13l5tgSCkTuYWAV5G3naD3Zzxq5Oeylhf96nTR66u7bta?=
 =?us-ascii?Q?URs2c7+p/5s1jYrocqO2ihswpx6rs3dy6Wc2aqUekE4UEGhGKZ374XgZhbnp?=
 =?us-ascii?Q?RkhAnSQaDmVCx4fgEtd0s2pmeC33DHM2PtLKmRNVtm7G3OV8gcG9jF3dMQY+?=
 =?us-ascii?Q?2pVlplOIag/iEWD8JEw6kqDl489mOVJskEIc/OpVL0kWHBEzgf5GwPsC2bxo?=
 =?us-ascii?Q?jkl5z4XaZW5LHz1wY9F6hR1os8ua4JE4vEKPk2b4tfww4+Ye5LkhANPpRg1W?=
 =?us-ascii?Q?2Q/oHV8UpwYTIarHzTo72QBeD+FrqRJ7VLHnwYCZ9uTCCNjCydK2kjetEvKv?=
 =?us-ascii?Q?mnP7MC/UuRqOd8oFhvGa6XLf/kCY61bp6FQpqiihtzO5wzm8isMB50xGrle2?=
 =?us-ascii?Q?reOlGVx9UHsw6DMuI8dSXpMjSTo3c+8K/f93vyNpSza1gavsKrLK7RGgmD71?=
 =?us-ascii?Q?VP/o78rsw3fpzzC/fnOamdJ/C6vCM4sPxs4UdYP79y4FI8UvXqtH/HVV7fiA?=
 =?us-ascii?Q?aPoUFb8/Ykrnz7ttQThPHn+RmdYBlVckxtokNSoUHSOn5LBXlfxlRu0quibL?=
 =?us-ascii?Q?aRPbUnl2xuFkMjsXxbJ5OnU6hvTtQVy3oi8X6M/c6z91MvfGhm+poalBmYvG?=
 =?us-ascii?Q?tc9IQMzbvePLnV9TsurHsU4LNvMsiqO7cNyj5Hxq+gsdmaNZb4cMFliDXSco?=
 =?us-ascii?Q?SxM4LjHoJuDEK6xK/t8U2SQ+cLndeC8xVnbg?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 06:00:10.4191
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8d3ee67-ea1d-410c-5932-08dd86e319e0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004684.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4404

From: Sheetal <sheetal@nvidia.com>

Tegra264 supports max 32 channels, hence calculating the max
bandwidth using the channel info from soc_data.

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra_isomgr_bw.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/tegra/tegra_isomgr_bw.c b/sound/soc/tegra/tegra_isomgr_bw.c
index 18e802bca6a6..fa979960bc09 100644
--- a/sound/soc/tegra/tegra_isomgr_bw.c
+++ b/sound/soc/tegra/tegra_isomgr_bw.c
@@ -11,8 +11,8 @@
 #include "tegra_isomgr_bw.h"
 #include "tegra210_admaif.h"
 
-/* Max possible rate is 192KHz x 16channel x 4bytes */
-#define MAX_BW_PER_DEV 12288
+#define MAX_SAMPLE_RATE		192	/* KHz*/
+#define MAX_BYTES_PER_SAMPLE	4
 
 int tegra_isomgr_adma_setbw(struct snd_pcm_substream *substream,
 			    struct snd_soc_dai *dai, bool is_running)
@@ -98,7 +98,8 @@ int tegra_isomgr_adma_register(struct device *dev)
 	}
 
 	adma_isomgr->max_pcm_device = admaif->soc_data->num_ch;
-	adma_isomgr->max_bw = STREAM_TYPE * MAX_BW_PER_DEV * adma_isomgr->max_pcm_device;
+	adma_isomgr->max_bw = STREAM_TYPE * MAX_SAMPLE_RATE * MAX_BYTES_PER_SAMPLE *
+			      admaif->soc_data->max_stream_ch * adma_isomgr->max_pcm_device;
 
 	for (i = 0; i < STREAM_TYPE; i++) {
 		adma_isomgr->bw_per_dev[i] = devm_kzalloc(dev, adma_isomgr->max_pcm_device *
-- 
2.17.1

