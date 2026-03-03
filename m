Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010040.outbound.protection.outlook.com [52.101.61.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79569369206;
	Tue,  3 Mar 2026 10:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772532213; cv=fail; b=tEr/nIOE/jStGjU/blBPOp8YzlhgJyzJ3/4mo9cO2I2GiCZQJSD+XTnDY6bwMTcNCoc+jqAnZCwgJLz4IsKiIVn5ITIA5AL/kwD26L0aLx4yjeWfu2TaTmlh4cDDwmZ60Nat+RLSClIBCeCbecELA6RZf/VwcqgQeYyOH9c6fzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772532213; c=relaxed/simple;
	bh=48IBkmoHR1NsaOCZNmqT1STEc+dTA+cSEZGNXnl48iQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=C+P0DUe/PxdIgx4IUOz0ONGiaK0m+6ehDWouJBNF8SslS2KcaMGB9W/bGPsrqiqiWwJHyzBIxJhxX7DITPSKbyeEXbh8s0T+vc3/OvVMNZsv47mIRWji52gmetp9VX84mnA1EDByD5RgudzMFzfj9xFwo0aaPN1COf1C8D05zn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GOlhHg/h; arc=fail smtp.client-ip=52.101.61.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GOlhHg/h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9h56D7mnjT7xomweDW9+QtfkRhfdDkyYIU1Go+JuhLXKx6mKaebT0n3e2tJJS5W+6AYCVkQjfrl5Q2lt8xqH0Usl60zjsFz07Jx5CDpUYFc8P04QX9Vdv56IKa4QSt9s4CdUjdS1ErrknpMLD+y1zeEUw8GnjHj7o2a27b5pCq5exQimuc8+Mgd+Nzvqwd98+9n8G6e/38v6Jpcm5m6dq3iO5GBel45MueAqYltcQPlNUCLX/YGkwlehs3L5w0ZX6j//GFMoo/lJ+PC05j4WUE1pyteiArALQqM2xTO/ayTq+hRAXd5mnEK3vbQIMeu+c/L8LVQKndAGOlnOCNXxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJDOxiS6yRrfWn8bMrCofYTYn4r7N2Yj8ceooA81Ovg=;
 b=NKc/6Mqsd4ZI3J52N4f+eaXgN3L7URMlsmefAHKS/sYMuQs5OYo7dTvCePk5bFg5ibB1k4EwCtNeEFdk08qx+2dsYvIG0ph1ojYE2M/llucncWcuRpEgO+2LW5htmeA0klGVIHqJ1Oamlx/fCti4tyfqNQJHOAp7yQn5SfiQh0jv80gmwJBWOQ7eeYOfIgqJDt3047w4uUbU9kumjNwHLry1gHVNwXoXgbn+Qwh96deOJlNbg0i7+2N6PuuPCOjtgz5PbnwzaXPpiIVV/s9LwG9pj/Pvzyl3ieKJL+nqs9Hzw21DzBC4/nhLYOOCcnPodT6gcfMpKk92dg9B0dMxyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJDOxiS6yRrfWn8bMrCofYTYn4r7N2Yj8ceooA81Ovg=;
 b=GOlhHg/hyQ0OL862PbHC18S9EJXk7AN/nHVbXZooS+a2gZ81jOBW7zgR2Q/sTRBUFdOuYdWr4KmjRRkIgmu5NA2Up19F8TuLG03FZcpaLBnFNJlCNIetdcbDrFOiaha+nDoXpH9iVwxMURNo07JeBO3vtvDruP9fHM76R5vfc13QL/sUECCV6OBy9Z8Ex5V7ph4GIj6en67T63u6zKTdNB5Wu//gLPkRP4sGIvR5z/thF9zZGb2wnU9nfb30LMuWRUuhuThFq1FOwdUD1Rp0KbIch+TV/CAwchdkRHv9nj1arlfN291wn90HcU7EVhrPY0RpGH5B+096GJR2Pm5ZfQ==
Received: from SJ0PR05CA0152.namprd05.prod.outlook.com (2603:10b6:a03:339::7)
 by IA0PR12MB8206.namprd12.prod.outlook.com (2603:10b6:208:403::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 10:03:26 +0000
Received: from SJ1PEPF0000231E.namprd03.prod.outlook.com
 (2603:10b6:a03:339:cafe::47) by SJ0PR05CA0152.outlook.office365.com
 (2603:10b6:a03:339::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.19 via Frontend Transport; Tue,
 3 Mar 2026 10:03:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF0000231E.mail.protection.outlook.com (10.167.242.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 10:03:26 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 02:03:07 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 02:03:06 -0800
Received: from sheetal.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 02:03:02 -0800
From: "Sheetal ." <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>
CC: Jonathan Hunter <jonathanh@nvidia.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Sameer Pujar <spujar@nvidia.com>, Mohan kumar
	<mkumard@nvidia.com>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, sheetal <sheetal@nvidia.com>
Subject: [PATCH v2 0/2] ASoC: tegra: Add Tegra238 sound card support
Date: Tue, 3 Mar 2026 15:32:47 +0530
Message-ID: <20260303100249.3214529-1-sheetal@nvidia.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231E:EE_|IA0PR12MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e5c7724-2bff-4c4c-08e5-08de790c1d00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	hbb8iyRuFW6CPmGGLOY7siLRhyXBVH37HD7+3ivVV+o9s5ON+wPG+mPw6PBJwXxqJcmclaPbIo/sjd2rbbn1bXpciBVNtU0vED+1a733PXLxB9+TCcEGEV7NM12ECxajEoX8a/tFG040CG0SabecHR6/nF5FpJEq4sJoleBbrY0kwbCGC5uhj24aczgVpWBuac1yb/9Amca1Ikfrx2nBxuqRR1ULAVxc6C6br0H0mWxsgceUtxkh3HU+FC1m5xTn3mKcG8eEkM5u7PHJd6auemmUgjvt1sqavF0pum20BJVGhGhvcrCZ03giwaWwW+pqsShz1Wbokew0L0Uc6HfWz5B+6c6WkTTrBgOz77orbzgXGTXE50tOSnsdsQDFeO94g/iWVPtVLgMbPLzeWht54p54MT53nzQKLY+lOM4AkjBhoNIeYWbKB+rAf7Lap3cBcR1TCqondPewHv08puJCb+WNEchb4gQevIr9wR2St0H1OiZL+4VNtCEIaHz++FjhIggN84QjwJxRQNqBnZ5q5mUHDHrQiExmcuCzCTGosdyjTWYJh0ioW8o6jIIfaKFLrDQjCAiFD86MVPHXxv9enDXK8BQ2wFKmwmaJodhG9UDjp3GKmdS2Vggli2tljDVJBypTW9X+xutfUsOh7pY0mOz2BHvkv+IaRpcQZoujVSacpepYe6Hy6m6BLd1/fozyas6gM/8JWCLMrHlj85+yxqZSGYcdh4g8X3rMDA6X7/KPjA7J3KJKm1TwZC9KowUSmIzHUOsbbig7iFlBiJuzBkT5n/7Q4p3GlKxXgaajzPRIBWeIZt9kKcZxh3LroLrn1mR6cxJ2BaY571EJURZKhQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Nf4mwA3UzFdVgSu/pjAtdD4ya1KgGqDRPjbbFko+TxxRkdEwRX1vz3UB7Pyhu1C4Y8Md+DCbSDwp5RaqvdP59N4DK5kZYnMBw59I4LC5yBsqsV/Pz/fEnUIr+kBGxZWcA4TXpC1PZcJTVfYSmt0fWgmaEQAS2vCWaFDYI0EvTtn6HebNdsW6k0RZT5nRIamg8vrJdy2ifLK0bOXI2BBdvpjYtcrEvFdRfbDShAvEjZFIAA8TlW4hMJWa5FdsTvoufiVBLaP2kwwek8YQH4W/ebyLS1cZdMg9NeJotrgI6WUcShYl+ITkbrV1W2aB8A4wKlxCI30vor4C6OsyA41fcrvCQzVc9K4bZFTHaAJVUz68DjIx6k4k0OouvJ2olRzbohEl7sKLryrdS/SKOAZhziHxVkXQtZbsGZ6h7UQEeVXiL+aZw9UDfFfV77ycMbvJ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 10:03:26.5037
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e5c7724-2bff-4c4c-08e5-08de790c1d00
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8206

From: sheetal <sheetal@nvidia.com>

Add Tegra238 sound card support in the Tegra audio graph card driver,
as Tegra238 requires different PLLA and PLLA_OUT0 clock rates compared
to other Tegra platforms.

Changes in v2:
- Drop SPDX-FileCopyrightText year update from patch 2/2

Sheetal (2):
  ASoC: dt-bindings: tegra: Add compatible for Tegra238 sound card
  ASoC: tegra: Add support for Tegra238 soundcard

 .../sound/nvidia,tegra-audio-graph-card.yaml        |  1 +
 sound/soc/tegra/tegra_audio_graph_card.c            | 11 ++++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

-- 
2.34.1

