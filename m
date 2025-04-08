Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2077.outbound.protection.outlook.com [40.107.96.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95918488;
	Tue,  8 Apr 2025 08:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744101044; cv=fail; b=Gu/BB1EkjFaw2lCw5q0AY6e11BT7DekdgV0A3laGwvG9KGlDXnkHEDPtdUL2nv2F0r+b9MgunH3y4GUqHDd9kQ0utgqod9OA6lHp1zkNa2M6oVqkJw1ztFD5AOpuvLYjLV2/U4BNYNViIZjthSV7l2L05fv2Pl2u25OpjQsLBo0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744101044; c=relaxed/simple;
	bh=agUcQTvsniCPc0DAXWAEDiMaF0H2zWFxfS03gQvJGoQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DGgr5WJ6kv5CebL1QIm3SqyeIMsPtIUOIZmMz3JQSoOS2Z/wHwsWjH9ni7C1N8Lhvd56tgKty9sJcBWW+7DeXOabYA+J142121ybjL639CNvZ7BUdI6ev9cPKnMczP4pxDdiSzSHxziWZkjU8hi9csL0LhYUfOsVE27mR/kuEYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ETKtoNLq; arc=fail smtp.client-ip=40.107.96.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ETKtoNLq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kJPAfS4e0vTLo3ECttAHyeZ1pAo+BM140lsOfWnhiq9ysJagmFKWvfPkaPXTIMTETGBJx8fKhhvPeHlpPFYxr/ePedFHP33tdHeU7jPSuKob/RkChVGYLTxYvvEcCj95s65OvnoZ4gUj1SLNJYn7S4OdQ1rUYn2z7guwYazH81PzK+8f3Lz69sqkXxRxLwSKLHW04l9nWzUpAIo1mKWvAHu4s4+ROTEtoVvHGClRnU9GvNevQPg7n66i5VYYeL3PPfzq4POhOOJ/oYfvAwxP1o+D3K+xVAE1moK3AJQVJdPKOyQ/ugLoDPe0yKCSfyNWSgLVj44cVqFKRrOgD3GOSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VPgLC8sUynbGV9MOqRlsU5b+TZNrT2hYqmKd8oPAlaU=;
 b=a/nH5+DfYbEXAUkva7ONb5HsVpfugzLvkFDwUcuVrF06unjreBO92fpvX3+TiZujswG57fX5JjP5xHGeiBGqRMtrViBmESvXBHfg85fpT5+IyITR1TDzbFAFSTFUPNVl84WVhM+3gBVUFY47q+QHYEFc4TGp8Q9UiIY4DPNzjR8a8P45UQu8rj17hHbMoFIPogxClsN7BTgijX0vi2yLl0G1kE31FgOS5U845L4fVZ6k1SoSMVhKaLus5tQQ9ewfSCjiE29x4s0D0F8xktPn0o+/igldDLPbWAskP63Oq1P8TF+eypCnpd3SDQ1l/jpBWxHSbaDTu00+/EKkON/aWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VPgLC8sUynbGV9MOqRlsU5b+TZNrT2hYqmKd8oPAlaU=;
 b=ETKtoNLq0Ft3yNw/FK2wrAyoREix4Mk5gu9ZuM/9rIQWf1LsncyNicsZLVKuyKE3JxYXJVGDGhUUHqzz4RonEjCiCFxddUxnC+WapPsx7FUpW1aOtIs1PFS7+c8DgfXQj/h7/aoSf7RbGfDRf9OFBHL/2Ief4MU7oRcWsYh9urXDkrSbDtOdcqC0FF6BfXvap5lhG+hpy9GsmNWqg7KhRBstCVi54qbRrTzawDkTqY2j5t2ntABNrGqTvjS1SNLmYNU3Z3zYpYEqZ+uHDUXhAxFxlvIBx+prkvG32G8DyqQOD2T/P4sNxU3WRqjCbIrGsAQjgAFZlEJazh31aYV27g==
Received: from MW3PR05CA0024.namprd05.prod.outlook.com (2603:10b6:303:2b::29)
 by MW4PR12MB6897.namprd12.prod.outlook.com (2603:10b6:303:20a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Tue, 8 Apr
 2025 08:30:37 +0000
Received: from CO1PEPF000075EE.namprd03.prod.outlook.com
 (2603:10b6:303:2b:cafe::17) by MW3PR05CA0024.outlook.office365.com
 (2603:10b6:303:2b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.13 via Frontend Transport; Tue,
 8 Apr 2025 08:30:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1PEPF000075EE.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.22 via Frontend Transport; Tue, 8 Apr 2025 08:30:37 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 8 Apr 2025
 01:30:24 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 8 Apr 2025 01:30:24 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14
 via Frontend Transport; Tue, 8 Apr 2025 01:30:24 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <linux-sound@vger.kernel.org>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<jonathanh@nvidia.com>, <thierry.reding@gmail.com>, <mkumard@nvidia.com>,
	<spujar@nvidia.com>, Sheetal <sheetal@nvidia.com>
Subject: [RFC PATCH v2] ASoC: soc-pcm: Optimize hw_params() BE DAI call
Date: Tue, 8 Apr 2025 08:30:22 +0000
Message-ID: <20250408083022.3671283-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EE:EE_|MW4PR12MB6897:EE_
X-MS-Office365-Filtering-Correlation-Id: b744253d-dcaa-40d1-71d3-08dd7677a3d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KKWlHqFL6o0WeBxVfH08feTxAXpxLQEgjLm2blVuhgKuUTFuI2rLQ0Gmqv2d?=
 =?us-ascii?Q?ZaKrk2kf3QyJ65nnH2yBifbpBONSVwgra/PhgIJ/K2sxzeShQ7OTv5qfAFRR?=
 =?us-ascii?Q?wa/pWgKSnOSZAAHY+/wxyas+6dx3ZX8WUAgVXCQWusFkRD9CfwCp1NBoLEsb?=
 =?us-ascii?Q?pyXb/cFEVr8XWI5+xVIwawRYiRhL13JfsOKq+4QSENy9RQQOeaiX8k860XGC?=
 =?us-ascii?Q?VS+cz/53DGgY6RyOsm4vVsz5Nc9vYGeR96kzppJ6N/oiuKDH0XoMFdUjEB+o?=
 =?us-ascii?Q?1C6zD3k9y0mNG3ONrZBO3ytl875MVvWggAwas1n66fXG7JUNIw4xlu7fUDvV?=
 =?us-ascii?Q?3NszpM9LXqYqPPOFAX32xnPE13CDhRw/rIcV5wIT/DSnwGerz2WnUdqLsjqN?=
 =?us-ascii?Q?sPLrYVWFaYd8T6tCGs5hkATDZKQxo40BXjtkCeX+f9jcD4r27rqY7HhiWc1w?=
 =?us-ascii?Q?wi6oFj7NZ9u/jDUs8UuoHhFyAc8nBqKc3Xp9KJ+4HCdY5qpZYlAaf49v3btR?=
 =?us-ascii?Q?qCwBHuf8MR6AvPDKhzzhk1sfT35FSpEnZDmRGK+e2n6hGNJcoPpMEnq7s3mJ?=
 =?us-ascii?Q?QANrIoRWyXXk7++WjRNbvn8i+zEc+Qq7T9uAZJeP3iHlQb0km7ch1StKEmTH?=
 =?us-ascii?Q?/y5b6XnLPUX2YihNRPQwTGVcqIXPfdsXSXJheRcM6XFDNwxRtkYUaJMkr60Z?=
 =?us-ascii?Q?E03OZ5O34oxyjhlwTNfqsAB2Cq5LlXRycjSHAua/NWbYPIsjWtb7vZ8FmGOq?=
 =?us-ascii?Q?l2Wb1r4Az2lt4ZUPgf5POijFsc/8KadWdjMtegnIZ25BfCcefsErokUOdRpq?=
 =?us-ascii?Q?tTJ32mAhvaoSwkNCDd5RF6XqZfo9d2HJAjAzhGymFlY3bKV3bhbjOh6w8Ceb?=
 =?us-ascii?Q?8n98cxjShjF0/S2KApvNt+v57MU5rObkawLP3uCsuA1cNFXybAIVh8vRLD7K?=
 =?us-ascii?Q?yHTmR2mk4QwG5JsghK6LlJV6iCuruN6KFdLJ4ZhKL3yMX2lbTQ/SqtZYsJZG?=
 =?us-ascii?Q?tCB3k9frMKihxFbUN4eHDltrosjTx50ytiDTPKWzAeiSCBrrWbbjR6BOuNnY?=
 =?us-ascii?Q?mhmek+GO3xjDvURRtcclBmXsq9c+Pu2OcJtKElNo4ToT4R0UZdCfrWxxAU4d?=
 =?us-ascii?Q?EN4i4+CXdxVa8OqGOKml16r0kLxeHU9yi1q61iProiyteH8TpUNnYDF8A2Jv?=
 =?us-ascii?Q?4u797qreupVLe8x6wGITsNXTiWQyHvTUMvf9H4W7jxFoR6TV4Z6emruURUz8?=
 =?us-ascii?Q?ggi9sulLeAHhRsyi9eua5XKerY8XpfBmiNNmwEFhK1JTrY/lc1BmUJt32wbu?=
 =?us-ascii?Q?JwGNvMZcE+qfi8HvHclzbM7va3GVXPlyklM5C+wrhJ8jnbBNvZsLba/933Ez?=
 =?us-ascii?Q?UDCuti7gHP6ItEc0X5+kjY7gMj1avbqrS71Tw8n/f14v4dDeI/0e7YNSJyPz?=
 =?us-ascii?Q?72C8CEX28WjjcQebxlOxYFtp/3wHM4EK5gE0UhrXlk6E+PWLARMz2TcQPCeL?=
 =?us-ascii?Q?qaFi1vojm1+yxcw=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 08:30:37.7270
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b744253d-dcaa-40d1-71d3-08dd7677a3d3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075EE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6897

From: Sheetal <sheetal@nvidia.com>

The hw_params() function for BE DAI was being called multiple times due
to an unnecessary SND_SOC_DPCM_STATE_HW_PARAMS state check.

Remove the redundant state check to ensure hw_params() is called only once
per BE DAI configuration.

Signed-off-by: Sheetal <sheetal@nvidia.com>
---
Changes in v2:
- Update commit message as its not a fix.
- Marked as RFC patch as it requires feedback from other users
  perspective as well.
- The patch is being sent separately as other patch is not RFC.

 sound/soc/soc-pcm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index d7f6d3a6d312..c73be27c4ecb 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2123,7 +2123,6 @@ int dpcm_be_dai_hw_params(struct snd_soc_pcm_runtime *fe, int stream)
 			continue;
 
 		if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_OPEN) &&
-		    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_HW_PARAMS) &&
 		    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_HW_FREE))
 			continue;
 
-- 
2.17.1

