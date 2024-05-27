Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2061.outbound.protection.outlook.com [40.107.92.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05B415575E;
	Mon, 27 May 2024 12:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716814599; cv=fail; b=fweEUDi6OWQG6EdrpCN4E70OQP/JL/Xz3FsY+pP1dLEfd6rFRSNTIEtfRoqVfo0hOJmERI5aIwyJezoazfUPrKzMTrVT0lkzeI78iAY08H0Qh5jeb7vNmGi/rVvohItYG3MVFNQoLJiVAIps3rO2WXrDJRDv2XhvGPTD49PJIpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716814599; c=relaxed/simple;
	bh=a0REPNbuIHSoWHoQfsgWgJbtychCnXXW6GLy4PNwQok=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rJ71ChUS7JJIjUf4esCtJHq/2GNui9yOEkX/8xvfWuZmP1GIF4+Hf/tOA30lW/FI7adIDOPO4yIcnMsHeTXl+oQ0zfk34tXW2a1Ptneu8Qut4h650SUIDdEbpMkg2/Zsm/z3FPzAuKkGGyIbb6YExK0oC79dWNXzAP19gILFHP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZZoINmhH; arc=fail smtp.client-ip=40.107.92.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZZoINmhH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aVTCoY/eYPgjdomx6QqwL1H60wVhHvjmJtFh+9vqw46+gYT72YOmeDCsX+Hy9yu6eVGV0rg03gUeLQF8adic4mQhRm4D3ieZjfnszyN3i4yRUspIKsGRwol8DPvEWusyE4vVdbR6BjLrg8mQfoEl7w/5hZHGliTF783UJrotZbV1/76SmU5ctHGQ8/DXZFerbvs3jpCQVIvWYpldUZun+CB4XQjLQh4XNqkAzUjO0WI7Re4AyILmFp/f1S+82jxM6iyPL9VNwwA3+aH+w6/sIo1C2X3kWlMWOzsiy+8Lo0llOLqTEYj/uYSlnIEk9Tl0b1s/ZYJEni2ZRtBtohFHVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bl/ZA2+WnCpyMbxp7vZHNbPEAEvoiRjkFL+KokRs0Oo=;
 b=hH2r/qRcJT/cKcolSepG9Bja3SlTr3VcXU7pLyiHmjiR5fkPqN/Idk7k2d+Vf9kNFInTSPAHDQWlvyYmHy5aCRW8QL1JyqbhccRfExyAld5g8PsW7oznS8maPQgBlt+rcJQK6bTclFYzQLY7H53AdqqAmuMLVyx3HEN3V1Os2JF9i/l82R4aPEFSfbMXLE5tm1XtSUD/DAGpptEhQgqgvAxkzhAWVCLNG92j8FNXvibrDfz3wPMizqRfeqNHkt0jwMh6t+K5TY86DuYewcR3XepzOkETBjI+yeoK6RXjwYDAJLUVuqazShp774CMkn0oDsHRn9tRU81CMeNiUj96FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bl/ZA2+WnCpyMbxp7vZHNbPEAEvoiRjkFL+KokRs0Oo=;
 b=ZZoINmhHfiQLED99u6UKdNDJSuzsqK4RRJmg9xFlmwcYzptHSGNK48M7dtxGE4Gtuet1+h0fQGy1YUEheZrHfiAgIgl+CclrqSogW2QI1O0F3KlgVus7ckPg/XzqpcJ/uDbRFmCDH2MEK15Le9P0kv9QXdCgFBozbO4aWGGHHNoHBW/Q9Q4bPdmAtI1pWb8cH9piiA7oRXF+QiopTHSZEeHE9+ivLDqW8EobGMmD/ldzW5KN13X9tQwcCyhXKCs1Ab7/+ZdyAae95+XdmxWi2sqgr/KXeL1fCs7CnH4tb7wQodzVsiR1noxERgbU54/Nm8oX543lmrhUHGX4QG+V1Q==
Received: from CH3P220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::19)
 by DS0PR12MB7680.namprd12.prod.outlook.com (2603:10b6:8:11c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Mon, 27 May
 2024 12:56:34 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:610:1e8:cafe::d7) by CH3P220CA0008.outlook.office365.com
 (2603:10b6:610:1e8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36 via Frontend
 Transport; Mon, 27 May 2024 12:56:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Mon, 27 May 2024 12:56:33 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 05:56:20 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 05:56:19 -0700
Received: from build-spujar-20240506T080629452.internal (10.127.8.9) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.4 via
 Frontend Transport; Mon, 27 May 2024 05:56:19 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <linux-sound@vger.kernel.org>,
	<alsa-devel@alsa-project.org>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<lgirdwood@gmail.com>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<mkumard@nvidia.com>, <spujar@nvidia.com>
Subject: [PATCH v2 1/2] ASoC: simple-card-utils: Split simple_fixup_sample_fmt func
Date: Mon, 27 May 2024 12:56:06 +0000
Message-ID: <20240527125608.2461300-2-spujar@nvidia.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240527125608.2461300-1-spujar@nvidia.com>
References: <20240527125608.2461300-1-spujar@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|DS0PR12MB7680:EE_
X-MS-Office365-Filtering-Correlation-Id: 54d92d2b-7d32-404c-9dd2-08dc7e4c6ff3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|82310400017|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/Nqkcfo3QWXpSu4i9FJ6Ckbh6uxzPt6LzpI6YzZQiuHs92MWWBK0rbdDIUmf?=
 =?us-ascii?Q?WEVk8X/fqNPh+eBFvd7eRl80clkN8TqWmjg9nwEsMh0EU7p9Br75Uht8/E0F?=
 =?us-ascii?Q?KTUoEh4wZpxX4J6ukyH12hwizf1oEBWSRLpkxSBVjNEsgmSEXCgZtz0Q2Li7?=
 =?us-ascii?Q?b7WmuT71ey5hSnsDBtlSyO1U926cA+N7KdG7byp9F65BCu/X7JrqxQvVcfaN?=
 =?us-ascii?Q?60orFiRVdXa2RcHH/bGgYfUL5aXae++pPvZQ96d35z853i7q5quu3ZqaRaV5?=
 =?us-ascii?Q?8i8undD/Mm2xGy7bL+fi4pulvfo+Q3VhgQgAOrG6eSXMU+Z4DY1kt0WRq5oM?=
 =?us-ascii?Q?aW2OEe+Ql3lGTOuoZvWwTeB0ONKSefdxGDp8buQHPk/luMgKEQen4sbitlz7?=
 =?us-ascii?Q?zEWTrX9hRjkZEAm53pQuYkdWLizOfCCPS6/ATiMm5PzPS8Fcjsd9kdJlIMHc?=
 =?us-ascii?Q?FHfEpF+3S+T7U9CkjvZ4ndWiZZYu8nmOzHyrZPi+y+kTnR2YHNiU9C49t38+?=
 =?us-ascii?Q?965AAiIwb5BI5wiH+a2TiZIgLXP3NXuFlgSzlglh8j/pV410VGsd8hvkdsHw?=
 =?us-ascii?Q?cHFtOK9h632n7PhcjU6A4ZQpnjujTgm/Zkl+MZ01EnWrQ79JUB5lplrfQjZA?=
 =?us-ascii?Q?psDxz4/5uySVcInQ7vnbNxWxsIORYRDmq6Z245i2thw0qjwSvxtL8QTFhKT9?=
 =?us-ascii?Q?v4xjyHGIqr2GKiN5KfYHPppo6D5BFDtzukjirYPtDUyoP4ttIDwOcLx37BN+?=
 =?us-ascii?Q?e4geFNd495Y9++fbwSTRXoTa5icMPsKuxCjV7hoz0A4DC8Efplyu3McMnGN8?=
 =?us-ascii?Q?Q68PExbuYzhamylIEEJW+LuAa25bbx6u7Foz3XPVTM1gnEWJ/wci6aAjjSsT?=
 =?us-ascii?Q?8S5T8vaPzhFB6nLUUlmut2Q2NHqtvmXfAIm/s8qsuhpmC/zTk5AL1zfX3DM4?=
 =?us-ascii?Q?6f2Jqsoi0R5O1cd/EPM70TMXkiT4UqdJfVjLV3cHpJqqa5lsuqaty3m50372?=
 =?us-ascii?Q?Y+O7pE/8pzZb54lyvUSzGDi7apfqYWfBdMMt/atT5hcj2IOVfILWI6C8C8u/?=
 =?us-ascii?Q?MOwtZLcHNm51T2xY1M32Ec6NwAGedfv/4jMXUcmEdBiUK3FCOtL5sKWCVxas?=
 =?us-ascii?Q?ymMuNHRxVL3fQU5VvTnw70562A7EsYwO8968VbQK9Gc+9GumLkCrPdNIzeV7?=
 =?us-ascii?Q?95dFHWBADiSwoCGqnQKxUZ/Dc3cMg4mfJ3/YdoFpfMlAQeNXNO09O3DvrtHy?=
 =?us-ascii?Q?HDqI6dBlMx8Ufx0BUBTQo9Q2BqHaEflSc2IeUKNoNOqFZhHlXwGEO6gS0eTX?=
 =?us-ascii?Q?dTeM5QKldhn343wAR5zwGr2l9jl2EqCsuo/kkgQVevJWG3Mv8yK5daLu3OUr?=
 =?us-ascii?Q?duEA0fgms9zC87UYZVi0BxgyGtNc?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(1800799015)(82310400017)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2024 12:56:33.9056
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54d92d2b-7d32-404c-9dd2-08dc7e4c6ff3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7680

From: Mohan Kumar <mkumard@nvidia.com>

Split the simple_fixup_sample_fmt() into two functions by adding
one more function named simple_util_get_sample_fmt() to return
the sample format value.

This is useful for drivers that wish to simply get the sample format
without setting the mask.

Signed-off-by: Mohan Kumar <mkumard@nvidia.com>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 include/sound/simple_card_utils.h     |  2 ++
 sound/soc/generic/simple-card-utils.c | 26 ++++++++++++++++++++------
 2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index ad67957b7b48..2c2279d082ec 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -174,6 +174,8 @@ void simple_util_parse_convert(struct device_node *np, char *prefix,
 			       struct simple_util_data *data);
 bool simple_util_is_convert_required(const struct simple_util_data *data);
 
+int simple_util_get_sample_fmt(struct simple_util_data *data);
+
 int simple_util_parse_routing(struct snd_soc_card *card,
 				      char *prefix);
 int simple_util_parse_widgets(struct snd_soc_card *card,
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 81077d16d22f..f1f5a1c025fc 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -13,12 +13,11 @@
 #include <sound/pcm_params.h>
 #include <sound/simple_card_utils.h>
 
-static void simple_fixup_sample_fmt(struct simple_util_data *data,
-					 struct snd_pcm_hw_params *params)
+int simple_util_get_sample_fmt(struct simple_util_data *data)
 {
 	int i;
-	struct snd_mask *mask = hw_param_mask(params,
-					      SNDRV_PCM_HW_PARAM_FORMAT);
+	int val = -EINVAL;
+
 	struct {
 		char *fmt;
 		u32 val;
@@ -33,11 +32,26 @@ static void simple_fixup_sample_fmt(struct simple_util_data *data,
 	for (i = 0; i < ARRAY_SIZE(of_sample_fmt_table); i++) {
 		if (!strcmp(data->convert_sample_format,
 			    of_sample_fmt_table[i].fmt)) {
-			snd_mask_none(mask);
-			snd_mask_set(mask, of_sample_fmt_table[i].val);
+			val = of_sample_fmt_table[i].val;
 			break;
 		}
 	}
+	return val;
+}
+EXPORT_SYMBOL_GPL(simple_util_get_sample_fmt);
+
+static void simple_fixup_sample_fmt(struct simple_util_data *data,
+				    struct snd_pcm_hw_params *params)
+{
+	int val;
+	struct snd_mask *mask = hw_param_mask(params,
+					      SNDRV_PCM_HW_PARAM_FORMAT);
+
+	val = simple_util_get_sample_fmt(data);
+	if (val >= 0) {
+		snd_mask_none(mask);
+		snd_mask_set(mask, val);
+	}
 }
 
 void simple_util_parse_convert(struct device_node *np,
-- 
2.45.1

