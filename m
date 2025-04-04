Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC7B1953BB;
	Fri,  4 Apr 2025 11:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743764421; cv=fail; b=a7hIyRrOdgs1zzmipSRVu0WzjTf3pMlDgbhY///aVYwmZap2ibLF6Gwr2eZvo+RBBCf23U72eGuRSrBdIUHRx/2yz7H8XYT9yaPIF2XVNd3BO3oBN/hlhrJEL92J0gGFFzJthu4RvVizeGLFioPk71tAs2qBLBxZtXBlum0Nzyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743764421; c=relaxed/simple;
	bh=xLtKPiR4KlsemkFPelwRmKabakdoPYDB5nsptMogyoE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dqkPhxHv6B/XtuHesNXK/SdhKEC5fEWBSDjy9e2yaQZFQDf06fG3EUT3qL/ZqcUY211X0k2nuTWPUB598I/RCfXWFUl+etZ4mcuqt2CNLif3w/wc2fhM34qNITuj8jYK1nJTh1kJet+YzcEKw6go5SSpkT4pEAKdUYXAlYjd7NE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uKauYmXs; arc=fail smtp.client-ip=40.107.236.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uKauYmXs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vqNQQyOaVxoIh9ApS2hCP7dUsnv9sAikcwt4yja1hwMDzkB+miq3kz+WahBBm6WQP4ybQE0TIvw+KQYnVovWGq18bjkEH+g9QoEQzFwZS/KL9C5gXNmyJ3dbTidH2C/IRdFrOVU/BqIWgYmVd05+XER9EUOJdTdyGjtc8kBbCGv7lGyKoQ95fgsRwiWoF+yh5zJrBc94zIMdaAmDkpoOK9bgAmyDZYFw+FBjWSP4MvePRttVQOr0m4DwbGxM1YnuqVwfN5xgV7SI9rhfFB33XPBn459jqC+FQ0f0d28iHOVlHJuHV2eA7SsawKVXWdcEnhoZjwwJvVJDahYBS/uuqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yvoii8GcPOB5XzLBctQqAIJSxCRjGX4EC8ymvBehka0=;
 b=OEjbmvizypkN+9QjHqfTQG6La3hbNC6Hgo0NruCMWvO9/HGHZKnNkwroVET3tCWxq22sojyIVUgIO0K15ApXl95Z7y5zxB1DNqcbZr36OPozbPdEkOTZXWGlKpL0ls6wo1Wnvh71JXhP8EHtzh/h61N+763pPjUwZjbgXbT6fljWyJ7D3dkigtYiIZbYzbD9zd4raQGOAhN9Z7j10CNhhQPhs4CPBEHJa+eiE2E4QyL8mOuZmJWR8vfEVH/8emgdUXhKrCfTOEqEVdiIHNXWjLdHm9j0lq8lObuXZbj9+JJ9xNR/q6EUIO4n+kjeYfz06hG9EjnkwEPDhC4ObVJLxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yvoii8GcPOB5XzLBctQqAIJSxCRjGX4EC8ymvBehka0=;
 b=uKauYmXsntSaiAyTeMv0VDd5vsRSv5C2lsE3SvD0Kfczbe8qFEoVt0h32P0hHxRmCgGh1mnNi++6RJuwtmVBe+2rkd+yE84JQtSd6mMl8+Ii+H9fmo6ml9UF6MtrBF929syntg0gKMfd8KkCXksZNJ3EibZaeocn9o28dY4jMKi31RVKNlbHz3pj6txHjuKYF3yq1GYxw5yMN172W9ZtmshMSPGB8kp1R5zlvRsBCBq8GHnCwCD3chksVGiG1MPM1VuBcppiDdZPJCnwZEi8/O8qtaX1NByyZNa2q1gRey3nzLV1leE+2mFPGkJFoS6jotx4QyFHJ63JlJj6Y2OqBw==
Received: from BN9PR03CA0793.namprd03.prod.outlook.com (2603:10b6:408:13f::18)
 by SA1PR12MB6945.namprd12.prod.outlook.com (2603:10b6:806:24c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Fri, 4 Apr
 2025 11:00:11 +0000
Received: from BL6PEPF00020E63.namprd04.prod.outlook.com
 (2603:10b6:408:13f:cafe::64) by BN9PR03CA0793.outlook.office365.com
 (2603:10b6:408:13f::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.41 via Frontend Transport; Fri,
 4 Apr 2025 11:00:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL6PEPF00020E63.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.22 via Frontend Transport; Fri, 4 Apr 2025 11:00:10 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 4 Apr 2025
 04:00:03 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 4 Apr 2025 04:00:03 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.14
 via Frontend Transport; Fri, 4 Apr 2025 04:00:03 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <perex@perex.cz>,
	<tiwai@suse.com>, <linux-sound@vger.kernel.org>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<jonathanh@nvidia.com>, <thierry.reding@gmail.com>, <mkumard@nvidia.com>,
	<spujar@nvidia.com>, Sheetal <sheetal@nvidia.com>
Subject: [PATCH] ASoC: soc-pcm: Fix hw_params() and DAPM widget sequence
Date: Fri, 4 Apr 2025 10:59:53 +0000
Message-ID: <20250404105953.2784819-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E63:EE_|SA1PR12MB6945:EE_
X-MS-Office365-Filtering-Correlation-Id: fb55c5e3-a941-4b89-884f-08dd7367de7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3Uz55Dob2iww+x8o1Pf7t22K1CPBa4HOvB6xAunG1tqlPbCLDmvwoMCp4NvH?=
 =?us-ascii?Q?L/o+/R6RfzQr8ULslTlLjJvqj7D3j2F+QT5O7NPnCAQ27Jtx8pyYp9aBttya?=
 =?us-ascii?Q?uecElbQE5Duo9k/7Tpupl2u/6GYAABmQLncHziOFX00ywxMVb9p2GOJl+X13?=
 =?us-ascii?Q?Gvh2f/28WFcasYv7PfilVHeCfaqOF9nakKOE5ZwBd9pwFXTnUYzoWfJucXhh?=
 =?us-ascii?Q?jESWEouKUUZ9drAXBcw9LOJlb5Nj4oddhbgZmRK5X6g4MUjjctIyrAnA51j+?=
 =?us-ascii?Q?1CIp6ZNKLdh5wDbE4hvyvXafHDztZ9ir0BsbRANhmqVLqYPjFctvg74Fwhm9?=
 =?us-ascii?Q?Lbk0HA57Mlz1JX/NcOCcrRjXDzVlQk6xYCFRsFv4p9Y3GN/LrZAcENMdgnD9?=
 =?us-ascii?Q?ZidWCXXyb4P20BxZL0e12kcvQifMJ25gAPTTcVK8F/kwTDM/OWQ0Ocn+KDy6?=
 =?us-ascii?Q?zzp9nrl5MJD8Zn4dkJi/l7g28wwP0zCCORbeg8vGkxo9epVJ7xXbngLUqc6e?=
 =?us-ascii?Q?caLSrZ1+O7qcTJ6m0HT9dQOx5OpALkYrihmPATyTGGckyD+ekNdKVID9U5rY?=
 =?us-ascii?Q?bs2LNvxbwLog71A/0vyWVOFj8hQEhgI4Krgw8LrlS2CR2PjT/AW8JENmFXOo?=
 =?us-ascii?Q?mXo2y73F7/1jSiO77pYNHUeWxw3KBfjCfKVVSpxfsCGSZOYUzIOn5FmN5bpb?=
 =?us-ascii?Q?hdOgIiJ5BWfCbYge1kKTlmLxaCLKWKZTOMH9WVmtZ+ySMTgKTQ7diAhzIoD0?=
 =?us-ascii?Q?BW7BXsL+wlHPClVfwRLhEX+XKmK/YT0xMKf1ZF+5LLMKayuziWL37XGi/LH1?=
 =?us-ascii?Q?PUGdxS9q6slazABj2ZaxDEivuM9T94c4HtGKIk61vcxyTA2ZpdK7oQZ0KvIe?=
 =?us-ascii?Q?7eWb8pwb0pWNqHE8ZqHIUHZU5sFptPmw7So3rXpF737IU7NXhHWuxG8ZoGL7?=
 =?us-ascii?Q?CzrhX8cDjX79qpzUL/u3wnyS6+ScLO3I7tLAfKuLOgxQpNy7gpq6F7yy/9fJ?=
 =?us-ascii?Q?1zF0hm27C7TBsOEFuN4fWIaxsBmep6cN3OyYJOYudJ+m5m/xE+o4AGxx4+IW?=
 =?us-ascii?Q?6wl1rWEkwCMBIZbmZgltWSQW6R+GvLWpOOFqSMcMRJkrPldNmjLFxQv8luZH?=
 =?us-ascii?Q?jIX4ByVEeK9Tsv84dPmrOrNT9fQjTr0gzl7U+g1+S8b7O+hgO8P122MrUEn2?=
 =?us-ascii?Q?Y1/r2NW2Q1Khf13JPasnCFDKW4iCbA8BCQo4TcenGJUW6xR0iOE6TuZ/ClKd?=
 =?us-ascii?Q?knY78mDLVoNRO9xsAHW1Y2xKascjMF5nsw1kutOuzFnVi2zBD0kiL6JcpVFa?=
 =?us-ascii?Q?WUCLPo3M8IJFa5JHiNH4auJXaCc4UTjOxcgQFpMxsa7924EZOIviUTEeOG1F?=
 =?us-ascii?Q?csESM7unEU6SHC4pNYZOhm4c9ZNjqSsIoroQ9VcUF7+R9l8y7bTNXz+UEU5q?=
 =?us-ascii?Q?WMs/xbZqUskRXywvA7hLBbv1OmC8y9D36ANh08YH5Xx/Myl+xUhpdk2R+4lm?=
 =?us-ascii?Q?WsyMwpac26joOMM=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 11:00:10.6157
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb55c5e3-a941-4b89-884f-08dd7367de7a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E63.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6945

From: Sheetal <sheetal@nvidia.com>

Issue:
 When multiple audio streams share a common BE DAI, the BE DAI
 widget can be powered up before its hardware parameters are configured.
 This incorrect sequence leads to intermittent pcm_write errors.

 For example, the below Tegra use-case throws an error:
  aplay(2 streams) -> AMX(mux) -> ADX(demux) -> arecord(2 streams),
  here, 'AMX TX' and 'ADX RX' are common BE DAIs.

For above usecase when failure happens below sequence is observed:
 aplay(1) FE open()
  - BE DAI callbacks added to the list
  - BE DAI state = SND_SOC_DPCM_STATE_OPEN
 aplay(2) FE open()
  - BE DAI callbacks are not added to the list as the state is
    already SND_SOC_DPCM_STATE_OPEN during aplay(1) FE open().
 aplay(2) FE hw_params()
  - BE DAI hw_params() callback ignored
 aplay(2) FE prepare()
  - Widget is powered ON without BE DAI hw_params() call
 aplay(1) FE hw_params()
  - BE DAI hw_params() is now called

Fix:
 Add BE DAIs in the list if its state is either SND_SOC_DPCM_STATE_OPEN
 or SND_SOC_DPCM_STATE_HW_PARAMS as well.

It ensures the widget is powered ON after BE DAI hw_params() callback.

Fixes: 0c25db3f7621 ("ASoC: soc-pcm: Don't reconnect an already active BE")
Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/soc-pcm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index ebe99d369ca9..d7f6d3a6d312 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1595,10 +1595,13 @@ static int dpcm_add_paths(struct snd_soc_pcm_runtime *fe, int stream,
 		/*
 		 * Filter for systems with 'component_chaining' enabled.
 		 * This helps to avoid unnecessary re-configuration of an
-		 * already active BE on such systems.
+		 * already active BE on such systems and ensures the BE DAI
+		 * widget is powered ON after hw_params() BE DAI callback.
 		 */
 		if (fe->card->component_chaining &&
 		    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_NEW) &&
+		    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_OPEN) &&
+		    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_HW_PARAMS) &&
 		    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_CLOSE))
 			continue;
 
-- 
2.17.1

