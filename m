Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2050.outbound.protection.outlook.com [40.107.236.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D7C24EA8B;
	Tue, 22 Apr 2025 07:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745306946; cv=fail; b=TyiuYOC0khwQM4yYxYf5EGyxq59eBr0SbZ2Nwdefq+60ak8kvO0yNco0uQAhONnRPxmL9h5+q6T83I56JOXIkNOv7cvscv6rR5vSGiYd7YjXhPRj2FKXkmiRmq1KZLUz5eFmpvwTA4IGokEjk85ydXxKu7GoDX+Xcy8phdY3kOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745306946; c=relaxed/simple;
	bh=MKiy7ay/+K7VfiYJa8C/aKY3VL2aKPivL0sZC4+zq2M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mu0lNGo4t12UStfh/wFdgavR4Sg70079TU71uDXvPCQXv7fduG1RsKW6KE6hHi0gdCCD1n1+vTYI9fcoCcgRBLj98dLQ8VM/0gUlmbmXdxUT3LIoIy9Bdl0kIb5R1p7o7rDVx2R8nute6EQcZ28vJS/vQ4kLVOH5mDg5OFi7SVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jGOkRPNu; arc=fail smtp.client-ip=40.107.236.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jGOkRPNu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/eMBJ4BxFPNzu8uRydCkDtLq1ZuGqTQ/RgNqpGxpSf5UsrEl0EPmKq0GjiV1u/lNU6SF96z0QoojuZqTW7ResxMyuICEePm95LnbtmJNIrsY1gFMHZvsoeDJVoZq55w2eDgMOtuj5kKCzWqe7tJr0m4o5Yf5zFyK8CfPbCIA+7YrzqzxfrO0JXjaPKXJaHyozi9HnmABWgr7xcPj8L0+5XpSvLujlGBerzHlAoW/KGsr0Vs9HWpDgMpW69ievZiw/JTwXp3Do2tjDjZkDz6ExvksJKzI1QKB8ZywWwIsOsD0o1kg5c6FUvTHPc8nvMkz2w3x2TJnKCQwmYffFou2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJmBtqYN1kJQixBip+LnbcKnQ4BKV0oovXrTFIeddvI=;
 b=gDWUvE5+Q+5lLcBECZLnIpvsV1h4l/wgYeQ2uH1TXP92xW6OrfDlSM7EK647G2LIuEOhbduongcuUytAZIkshvVY7GxmQShvbt2BQic16wuyXyNi++krnD2xSpigLtLSca0/iVBegsfYJe8+5ljUiIWoX+BT9hzMw/irWR5rSZ0JnUaa17iuYWfZ5bwYoi7RzJ3yxdNxf1+YdEVNb87HV9Tk3vZQKzdJhmBpPBgxb3naTimnrc2JtIPfbmfOoRrEWFbK3Xbxz3t3b7v1H0KZPY3DWh9unmbbROG45I1TEn8pP9Y2oZtRj2B76/orSyVw7gHoDDWBtH1iDp5/Z1A2MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJmBtqYN1kJQixBip+LnbcKnQ4BKV0oovXrTFIeddvI=;
 b=jGOkRPNuK863j3309MarfOhiXxD7r81fBzk48+xy/9jNhXYSOyZ0OaH5FNCi+QCQ8pvtcYZRmXB9MlGZ2ydrDMoeCq0L/QAkH4cDcGbZKvx08JabrAFbKHJ9E8AkABmItiRg0Bwzqz0xMRL50nx3wA3K/h/WiOetu5y2cQpQ5QBS1rUxWU3rxOzB8khBADvwFAteFvgIkgWTxP7IZr2WOnTkXZ/PVvywVUWQ0cDlV4BR4MLqme0cKrTjPPxDbDh2MqaTrBnE1iGEncox5m72zGQ7Tw0SCU7681PTTd7hPDcGappwNhaBnHbSMds9Tz1IbsG6ojNuBTvd9EuLmEFEXw==
Received: from DS7PR06CA0053.namprd06.prod.outlook.com (2603:10b6:8:54::8) by
 SN7PR12MB6958.namprd12.prod.outlook.com (2603:10b6:806:262::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.30; Tue, 22 Apr
 2025 07:28:58 +0000
Received: from DS3PEPF0000C37F.namprd04.prod.outlook.com
 (2603:10b6:8:54:cafe::15) by DS7PR06CA0053.outlook.office365.com
 (2603:10b6:8:54::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Tue,
 22 Apr 2025 07:28:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS3PEPF0000C37F.mail.protection.outlook.com (10.167.23.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Tue, 22 Apr 2025 07:28:58 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 22 Apr
 2025 00:28:41 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 22 Apr
 2025 00:28:40 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Tue, 22 Apr 2025 00:28:40 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <broonie@kernel.org>, <linux-sound@vger.kernel.org>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<jonathanh@nvidia.com>, <thierry.reding@gmail.com>, <mkumard@nvidia.com>,
	<spujar@nvidia.com>, Sheetal <sheetal@nvidia.com>
Subject: [PATCH 10/10] ASoC: tegra: Tegra264 support in isomgr_bw
Date: Tue, 22 Apr 2025 07:28:05 +0000
Message-ID: <20250422072805.501152-11-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37F:EE_|SN7PR12MB6958:EE_
X-MS-Office365-Filtering-Correlation-Id: 7490579a-0fb9-461c-97ea-08dd816f5879
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2dAYHAwCV1S75350mFe+eUFteDlk6UbOzo6mLSu2B0JMDX3nLfImdoZ4Htw3?=
 =?us-ascii?Q?TsrFgS7XD8r+LLAyB/zTMWKixiEapBqkr/MlE7FrLircioy+FV1R+bCtpX0F?=
 =?us-ascii?Q?6yDcx4X5IssWz5TMWwQAhHs5TmSJ4jvZL791db50ERtA2BeYxrHEt89QoZD7?=
 =?us-ascii?Q?s03T+8Kdavd/5Vzc2A3CCUau+HypgD/INbGfrd9tPQdOwMsgCciDCGubj+bl?=
 =?us-ascii?Q?YhpB2PQx0w2TZV1VK5QMBboMhXQ7FJeK9QHY+wxPxvjQrDXHteA5/xq32XsY?=
 =?us-ascii?Q?5F9CB3MIO8HY6p3LlTK6asHZv/ckdT3tXKT/+BHuKzxKS/kfJxpn2NUoX5TG?=
 =?us-ascii?Q?7N/+q31O4dBraX/mNdM8OYCD7P6kKDs8hyzluoIhodxReSx8AInIxzs1wm9N?=
 =?us-ascii?Q?fVMKBX4xqPsa4xxWUmb9OZ+Vx6mwBD9qh9cZBYJ00fp6Tqa9Ulu5vmGXYOWA?=
 =?us-ascii?Q?jVXyWxj7rnZouFUVKhSvfPjO1+kWVLbp49fWRU3pZ7RDuKxyy4Y4xj7uGqEx?=
 =?us-ascii?Q?KHoGuJic8IRPHqhztyCwVIXafMtQA5KracsFgQCCmnBBOL0+ZyMCRQvzcLTM?=
 =?us-ascii?Q?YPvinNKfWqQWuxt9GMl/q9GB4IypmmQgPUHF9YRmZdS50/009w03Y1BL98GM?=
 =?us-ascii?Q?jqca0MZZNSLm1KzwF88pjs3FQdJuUN61VMhb7oPNI2GUfhn/WLcOXaqkyN8p?=
 =?us-ascii?Q?I8vJIVOFHgoK7ugniEN8ejyj6Ovgr4sEPV1OsdkYV0NVQpSSREs0N9KQaM0w?=
 =?us-ascii?Q?Q8jNMPYGWgOwhW0vIbmFV83axdsPvBLWPtSHLIiODSsZgoQhyeldalR4ZCTt?=
 =?us-ascii?Q?WCsmHvFcWKwucirrZroi5qBnd7pXUUdvDGAmuOM6J+kDCoKCoqA5TngQr/qp?=
 =?us-ascii?Q?MhNCPv+7jHL7Ov//tTB+PNLeW+aMsMW8oIylQUKcaO3o9gGsu6APzk8j3xtk?=
 =?us-ascii?Q?01B83gWiRVVAaM1TmBrpapm6Hb/GOwfs1WfZ1nahkHWNuQheCMso7SQnsNIo?=
 =?us-ascii?Q?uW3kt2b2hVK/VKn1viWUcXfWgwa4vezcFbpjfvyv7TN6lqrBhHhzrPD+lBaR?=
 =?us-ascii?Q?KpUcyMRxlHSqpZqBM+ekGV4hKJVNWJ7dctMit8rKCvx9Sjo4Mj9BqjKth5oZ?=
 =?us-ascii?Q?T+7ZSn/YrGs+KxQUfxtdpN0R2JYnVouAK5UV6AOEY7H/8nxaA6OpVebbBO3U?=
 =?us-ascii?Q?3yDrsZcGVG0aeI2b7p/S10ZSGKMbXMAxI56PNuVcsZv6uLXp7PVjqG6tvRIV?=
 =?us-ascii?Q?2T97pRC01YFY2TRQYJecQghTweqfoejvkXk8/0H11tQettdXvuxGUjHzCGhp?=
 =?us-ascii?Q?EvAYP/mYbPy8II+TPsShTO3l0r7cwoPS0gKc8hQrzLi9YqxFpjF5EBBIZERP?=
 =?us-ascii?Q?IGY2Bu8DGSr8sql3MOho4mpLq61AvXU/XU1l0HG7u6oKNJXkJmF6ojkHhpX4?=
 =?us-ascii?Q?2VZMIZ5ks/TGBObSuaYlYSA983nTL3EFE6mSQgnmzE3Y4dD77X5z5op3hG3g?=
 =?us-ascii?Q?vXkrOEf1dRiPCwj3OMAsujElH0W57+0Hypm4?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 07:28:58.0476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7490579a-0fb9-461c-97ea-08dd816f5879
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6958

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

