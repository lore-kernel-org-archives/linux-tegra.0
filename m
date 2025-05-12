Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2048.outbound.protection.outlook.com [40.107.96.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81798255220;
	Mon, 12 May 2025 05:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747027112; cv=fail; b=q/+6tNXaisGiXeBe1Mi8VND6JSG9LczuXuZZ1Y1olWM+WzG9uAh9vl1YlxwL3y7WpmWYSmmnVNKKltV7+gduEMFZby1sBUgrn9UkPS0dhMtQAObdKnlexi+d520FXesNfg58EblslRlXN7vXB4Qj0IXwGC8IahaZQNQ5a6oMjyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747027112; c=relaxed/simple;
	bh=MKiy7ay/+K7VfiYJa8C/aKY3VL2aKPivL0sZC4+zq2M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dvG/9aWJMWk5wjZ0PMYUKHYs9BkJTWyKDPRo4cD1kma2ARJ4wY1aiyRwIUS/P6AGf8pR89d06eBmApOJNq+LUg5p9I9SUEuTh6cXWY1pH3Jw3i8vC+pyc61TbIpOc/1G+5/dALKn6DbUKLrwo6DBtKAufsaL9xqCLNE4HgMzfNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=M9E/NdtY; arc=fail smtp.client-ip=40.107.96.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="M9E/NdtY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQ127guNFpjCAMfiCVz3bsZwct1wG8fV8ZmAPuu6iuNT3SKxcu+UTPxTZY9+E7fmfCSnf4h0FbjUIzZf0m//H43FOG95DoFu/b3C2JoBfp6wQKKpCMFOdENFDWFFC17zSKFMwIf3BSRvrZ8d+/lBckNh/NT5h2a5EZeu6A38bwtuL4B+WRzfSj83k2DxqSuXCXlxHI0nvFmofvJYSooRUl15+1+PohCvDApX7EG+RocXE+KD12s69oqNaYXb6LbjhKCwmrdZbpTNG2/UXqgXTWsEmRaE1Qm1JH7YjWctDRRcGhyRDv8Cg+5ZVlc0agqG3+FOjOEFl5Zhb27H5OrVnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJmBtqYN1kJQixBip+LnbcKnQ4BKV0oovXrTFIeddvI=;
 b=VxQHGKEyG+OnVwqth2rm1r9Y7kx7jk9jhegW5o1Du3PQG14aXwOB6Vb1MslKZUHLsuBR9KjrTT2X3T208falcdGnb+swQZ5bUtk1VAKzAC86+04bHj1kaioHFZy0UEmh2/Px7m4TBOgN2S4wZhXkE3p1dx52lBHH4e/EVmx+G5+8pA+g95LUxYKzvnSAdjse4Auzg28sD3UUPATlexqCfv2eo58F9YU09cwaI10gf1ZnoKxyxenmtOFtjlU7jk6nfhHyirazmUp103HzAEBq6SDEwEiqYd64NXzfockSoJQZ5jxUOuDEzhNc8F4VHybOfcMeWvmKMk/6dF9aIW2Jug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJmBtqYN1kJQixBip+LnbcKnQ4BKV0oovXrTFIeddvI=;
 b=M9E/NdtYsh96v8VJhDlOnYnVF+eYd4ByqAzrifnTRL+SB+7P5rCa+y4Ug7Blr7Bl3q6ZOKT7k+cOw3brtw38bO4fcHIaPkrBu8s2gdpc/iBf2z/rJVvz6WWBpn8TJ9L63CzENf/ehVD4rWakdp42kEIKsEajcjzZoufaZNixG/VXpA5x2p9W7rzre+O1ESoIEsG374uZlJnBUxphu+ZqJIbdwpHmg96JtgJUnKhIBhVHnO0GI3OqP4gZefrTvzYXnzCRd3FIvQ2DE5SXZ+4auZQkz5BgSoQFntdXbv3FbchwyOvGB9Inqxb9+XkRfT00HgaeJAY2aQZCk24/LVj4kA==
Received: from BY5PR03CA0002.namprd03.prod.outlook.com (2603:10b6:a03:1e0::12)
 by PH0PR12MB7487.namprd12.prod.outlook.com (2603:10b6:510:1e9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.27; Mon, 12 May
 2025 05:18:27 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::d9) by BY5PR03CA0002.outlook.office365.com
 (2603:10b6:a03:1e0::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Mon,
 12 May 2025 05:18:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Mon, 12 May 2025 05:18:27 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 22:18:16 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 22:18:15 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.14
 via Frontend Transport; Sun, 11 May 2025 22:18:15 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>
CC: <perex@perex.cz>, <tiwai@suse.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>, <spujar@nvidia.com>, <mkumard@nvidia.com>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH v3 11/11] ASoC: tegra: Tegra264 support in isomgr_bw
Date: Mon, 12 May 2025 05:17:47 +0000
Message-ID: <20250512051747.1026770-12-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|PH0PR12MB7487:EE_
X-MS-Office365-Filtering-Correlation-Id: 68d09278-262c-4f39-e2b9-08dd91146d65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?z+AaIP8VUXYTBGG1RV5ev7jEgV8fAU1uw/tdgd/K82lZZ9uzX9u9AGRq5EW0?=
 =?us-ascii?Q?dNb5B6d+dVPPPhdzUJcKhN0oYtTshuKrGjhsh358dAqGPJzcIEuYBC3IFwFm?=
 =?us-ascii?Q?mG/9t79RM/sjH4pqGwtW/UP3a8a68Amwaz0oinSUez3OXfh1M28hvQv11GZD?=
 =?us-ascii?Q?K6R5Hx/wrjm7QQ7H8DcKKkWzYuyu9C7+li+YdAmajnwmrFN8Jf4GyNF6eHSJ?=
 =?us-ascii?Q?FTWUh+vDfgvIow5gTqaYxWiZEbh6169nbXnsfTKHEwY/cpTyRfimLKQPs5hp?=
 =?us-ascii?Q?j3cyKUG8zyF6YubFmdYyTLcpu0LDWX+JAhzCKVOsPtDrXwijUoL6Unel8bin?=
 =?us-ascii?Q?8l35ak0o+gRZu6OV6OeGd8SppTE6dK81sBwI7n1G2ynfGA58enbVcE4LM93a?=
 =?us-ascii?Q?2ZTze8A2rxd9ajPr/OcgsZjhQzjc/u3PVdLQpB9JoDxe+vzANRTkdqicwmwq?=
 =?us-ascii?Q?WGbiwIjqUL8QfRNQSGJyYRMGZ9TBy0ELsd6Lnh99VZdNj5s79kbeDWn5PRk/?=
 =?us-ascii?Q?KDLlSvWg6DUbMLup4hGUohL4lFL6Q83SGNJYWGY75AB92g6U4UIX+JxqIwsK?=
 =?us-ascii?Q?cRAqxSV8ohpuH5mnt9UuXH1dUpMa5CC4AV12kllnenY8Y6JnUedPekLi37WP?=
 =?us-ascii?Q?rghBQ3QxYtTAAeBpLUBio0dvQPXGLiceMVSRIQ5EPsO8/f3Y0dKpH9i28Qro?=
 =?us-ascii?Q?CFt2gvvMi8xsgq6z4dBg8ftVqCrKVAINtp9xrLZGsYXQAMibiciOQkXNtuHx?=
 =?us-ascii?Q?c56ig0SYXQ7lh0uehACkV823lik6v1L7t9L2Jagr3GzmZzVya7voI/vK1lHs?=
 =?us-ascii?Q?4dnf8ykWO/OsancUKzXViOuOu195cdN5EexzajuZCw30pANFyP7p0v5RI5k7?=
 =?us-ascii?Q?5bl7kyA4BKclyecvL1VOVrr5lm83j5+FN1ENhmHLrKe5LbpnQwp6iO8XCx2I?=
 =?us-ascii?Q?xAXDgGkGrdciCWugRpvr83cFe6a8KdRtle5K1rCvLXas1duyUqQcGyyPayzM?=
 =?us-ascii?Q?tRFeNDunjUd2KhKbih4Cwg9Akey2OCZ52Cs8HqRzuejv9GpfYtDQzR/qCWRK?=
 =?us-ascii?Q?RK+gsf6VhLGg6PsxPyvMULrNBm/+YF3PeOaDNlXlvWLxTMNwWEJCbiFuZnV/?=
 =?us-ascii?Q?kKRX52l9t/bJo/IZN5eQC8Cmi0j05cF+BMgMX1SVB9cnADHfByBX65KuCgvH?=
 =?us-ascii?Q?wk2dwrPaPKAUM3mmBkpWaODi55NmuKYBQ0ycxPj1o//O+urW69tSSqHKGkIJ?=
 =?us-ascii?Q?Yapkw+ltye9hEMiUSADpqgxjTFUfBALWW/3rzn2CypS5sK+YN34vSropHVzC?=
 =?us-ascii?Q?IfXa5Ji0Tpr8Xyu64HNjhJg4QGIiGZQ78dLCiXTbShsVQ3ZcBrnF17d0Semo?=
 =?us-ascii?Q?gnVAqqAhUl/4v+/8RyyCI73hcCBcG4vUqYr66ugoH1OQX4XNtji6/+IWYuRx?=
 =?us-ascii?Q?CETUMtF3yn2qPY+qo3OsPfeBPHdnHFZ5TW+2zJJIv9h24zGsu0ouFKehTXrz?=
 =?us-ascii?Q?j8wpmhoxqc/HZhCIj3OLDxwsFKeiJqsWgQTX?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 05:18:27.7080
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68d09278-262c-4f39-e2b9-08dd91146d65
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7487

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

