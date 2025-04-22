Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2077.outbound.protection.outlook.com [40.107.100.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F291020E030;
	Tue, 22 Apr 2025 09:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745314726; cv=fail; b=gWUbJzPw1JDx/hF8rdxQUgV3006K4zkjkX4akeZLW/XecWgU0ACckUfdQuiRE0A++o/DUBUMLAyJp76e6J35b0gdt2YpQnyvOQKBKzbsjNy9r5EWzNmmqXQ9sgi99XRfBtcZmr1so/ZOFKOdM6TMeCg9j8vrVyBBTqEmkxRvOd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745314726; c=relaxed/simple;
	bh=MKiy7ay/+K7VfiYJa8C/aKY3VL2aKPivL0sZC4+zq2M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sFHriaZlz0PRA/ID3XcTi9/XF0ybdVioW6lRtTkhKgd5jH3N0QEwFPvcBvmGK+Jmpn63lQE5Zl5tMe4qbNTK/Xle1KF84HDIiIeDATZjZ+FPSgKgi0Y0AAupcak0Sz7i/1SyiPsJq0VqGdNnCRyho0+9PtYSn6ysugOHKnUbMYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SWZ0ZAaV; arc=fail smtp.client-ip=40.107.100.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SWZ0ZAaV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=La9nOBOi7iG6jUKUWgY17AoWwsE+MJ4sDBBHJohJ/YF0Pd2AnRljErh2xndtMcgAydo1OJX/cy7u3XXSCazMFxcwU79fk06u8+7OeB/t25qJov5pqoVMvYaAw83vHNu1YzckhectJSDSsC7gCQJhZLlrc8c2LiiF3p22dkv+vaMzbetWICOkFfiGVOnLxk+nRkh/Ur4KkhjnATh2uApeFeu4il+zXWdyYNfABkTpnrYzAAZr8ACNeRhX1cLj5k1EraJ3wqleqrfG5fpRIBVOv41muZgNcTOxp3WI1bvbkq/kooFbV1yujybAGjb4/PNhMScT1Y8zILE/8dinG4SPuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJmBtqYN1kJQixBip+LnbcKnQ4BKV0oovXrTFIeddvI=;
 b=Hn2v2g2B6Rz/1f6wP9jEAZaoJSmAicAdlGwc0OapJpUyB9H+viubM3w3wDFQcrrofwMzYo16V70yfopn9l4WpYQwvPoeJl6l9aNi0Ojy0Jx0Daq2i7PeyXoEQqHM8JyK3zK8TbT489ByC0M7eYBmWvMK3CQFzmf+938r2WNjC7zu1H6ePlUDzpdaoqc4Q6qS5SmR4McwxRgwB9U8AQGwV9FQJAM17SEgPVep8bivTsvzv+ETOfLwjxXIU0SjtYrJFgjIacp7eB4lEGdU8B8lQhBoE4LU90AwmP6EloWoBQ/eqmGmfdwE8inTI8RxM8gEMtlsjhPOEHwaWjZBWOCUoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJmBtqYN1kJQixBip+LnbcKnQ4BKV0oovXrTFIeddvI=;
 b=SWZ0ZAaV7oFq8X4T4BnvzbkwFQEGm2+cMOnonsOpNb/qhos8+CFqV0USUlPl2OpAA87UxHLcw6E5R7Yra0GkrDbb2hDz+q6m3MDRoqda8dXb8SrKigNl2Or6mSdn1aFhF0x+Ee5n7s/YgixjStButqzCo1YaSYWDDvUbYcKjLVCrTsIo/FOqKNi8TWPLUMKaGjCjEmHtBlilxlM21+BVSgtohSxpJp1A+Dtk32nun1CfWNzVMgHcIYxA2Wz2ezjmsQOZn1/PFhT13NjeVb6N2+OUrNRG0U1P2zlAFg9pquTxWDeC77gr8b3fB+t3ioHUWfgHbfnoey0LXr3W5MlK+A==
Received: from BL1PR13CA0354.namprd13.prod.outlook.com (2603:10b6:208:2c6::29)
 by BL3PR12MB6473.namprd12.prod.outlook.com (2603:10b6:208:3b9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Tue, 22 Apr
 2025 09:38:39 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:208:2c6:cafe::86) by BL1PR13CA0354.outlook.office365.com
 (2603:10b6:208:2c6::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.31 via Frontend Transport; Tue,
 22 Apr 2025 09:38:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Tue, 22 Apr 2025 09:38:39 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 22 Apr
 2025 02:38:24 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 22 Apr
 2025 02:38:23 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Tue, 22 Apr 2025 02:38:23 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <linux-sound@vger.kernel.org>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<jonathanh@nvidia.com>, <thierry.reding@gmail.com>, <mkumard@nvidia.com>,
	<spujar@nvidia.com>, Sheetal <sheetal@nvidia.com>
Subject: [RESEND PATCH 10/10] ASoC: tegra: Tegra264 support in isomgr_bw
Date: Tue, 22 Apr 2025 09:38:15 +0000
Message-ID: <20250422093815.506810-11-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|BL3PR12MB6473:EE_
X-MS-Office365-Filtering-Correlation-Id: 14527d51-69a9-4093-c6f7-08dd818176b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9rksTQKZlsCPJRO4MlGy3pKvh67tQEDPLBlCiOGXu9ZgGRbzrDJiJoW6GRa7?=
 =?us-ascii?Q?mERcAEAV4PK40i9dAeHUgGCE1p8uLu66BVxUH9tGKpuLAon+ivNv2OjQdq0v?=
 =?us-ascii?Q?4eGfbv+M3Cfe8gYb2X7C2FqYAQWW3nO/iK1/6bDWe9BXvC67PJoyWk0xvekj?=
 =?us-ascii?Q?gczHP2onv4+Kz75dgEaOQLdy974WaSdhG3++QNMRal1L1KxmFJqIDuJ1nAZj?=
 =?us-ascii?Q?tS73bO0DuIJ+jHP2/Fx+RlK3BOEQ1VIpznb8/3nTOPcifo+xfWyWJTFdPdJA?=
 =?us-ascii?Q?VlTBI3X9stY3wbvmwJk6yCMN1nY5Tyf2DHTnWNI2UjZV4vNY4ayW0DeO/Fsq?=
 =?us-ascii?Q?P9oMnPpwQnJYs5ztiwjh/ybka22GSiOPyR0OrQf3CzkdDXU2dtostR2MeNag?=
 =?us-ascii?Q?2NlRLQugITDLHnXSftVPDbOaukK37wzC4+gRSuqZEv9vc3zCTSR1NmTpncYD?=
 =?us-ascii?Q?vLRaDZVx+D7oUGMYDC8kkuuGwc3aNmKEXnucIpxSBAC8Mx0iDCmXgfPnD1iI?=
 =?us-ascii?Q?y6u+l9AXJpQa5Wrvb+9wK58a8iyPY+TYL0o0NXwFpSyxay0qFC47MD4GvMBV?=
 =?us-ascii?Q?wD+A0tgvy+tMg2R1Grl7b6pqiSAhj6JR2jJyr0zPYlbvay2R/dRZpFLuUuWr?=
 =?us-ascii?Q?LX2pBqJUaOxLK8W2h0A16KRe3dH2GcHxlN9AtHk8WKbewie16wKSQaRZC8ah?=
 =?us-ascii?Q?zVGjNSh1OKuzY+Hm7/0qh9bMRySdF4HMw/StWtzez0F2fqBHzlUw96Q0yIro?=
 =?us-ascii?Q?59wphu0dFEYhsQbLooypLXS+aPbqN13wSn3AhxZMzIb4zMhKZTn9ssh/yUa2?=
 =?us-ascii?Q?vej86qXu5BIrDRilY/DlLZdCRJtdDSJGCu8EtAm+SCBGSL2/co4cMZEP9wgn?=
 =?us-ascii?Q?mreEVdl2eMoLuTjBdkbtXbAOlqB/sDQgpnqUrQDEKleI4t8dKNSSqWug7W8N?=
 =?us-ascii?Q?66zHwWfaxhqbvloEb1bLe11DJNaIptsKsWh1JwuOS6N3ZeOzOrnGOb3w8QZy?=
 =?us-ascii?Q?6VuajNTqKHcTnY3VGaZMn2eYZsiNO0ggZ+3TOuuKROFwEhwjuXYzNA0aN93O?=
 =?us-ascii?Q?//xHm5xZ0eclReJncf/ZPOqVp8/E4dOU90nsAHv1NSx7cjPfzhNkIdkVIwe+?=
 =?us-ascii?Q?+addQvEnPr/bRqxvUVZnwoxC7hnVJXuE+Bg6mOer0aaXGrwN4cnC8m7SwDLg?=
 =?us-ascii?Q?JYj3hqpQuGR2hM22lso3HAbWHCaWRBj8tGQIvLRL4uCfTSBSCv1HdbTZQuKL?=
 =?us-ascii?Q?TDArDT7LqlAw98ERA1JEmXeY5Do7tTG4YpTAeJuKN/nhoMPoZ8f8NB7WZR7z?=
 =?us-ascii?Q?vgAp1u9m1KnA+I583nKxLqMhKxo5uFa2csy9Q724MSE2pTtdGf13ByX6Feb6?=
 =?us-ascii?Q?8LcRUGQWvS6FFmlVyDDDv+wVUKVItln09heL2n4mRweZHJrC9+NhpMr9nN03?=
 =?us-ascii?Q?bhUpvzRIUaS+FVsnRC4GYEz2tcwLHwfJwllQb8VJYgGnhmky+QzAocfaIeFN?=
 =?us-ascii?Q?gSnTqkRi+55ROiiq0fJQ/4LaNTOC14IL3pNn?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 09:38:39.7049
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14527d51-69a9-4093-c6f7-08dd818176b8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6473

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

