Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011026.outbound.protection.outlook.com [52.101.52.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4794F1E1DE5;
	Mon,  2 Mar 2026 08:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772441692; cv=fail; b=jAt7VN6z/lGAnysSrlFSgMWpjPaWhBjCtbwdU80uQSuc7oF1b5doO3U1BmaKXcDT2k/M9fu96Dajcy/so57Em2LAAM7DV/yJmiiCnSYoSPtuZdTkNp0erDb5ZN6IiHmCKQOZNRq86ZWs8uEH78NcMyTQAJvtkoU6p1yzIHxunM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772441692; c=relaxed/simple;
	bh=QQWl2JmI7KmG/LcS7heFMzKFjo5iYKupNstn32D0L2E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dr3eW5x35v5WUMRq/czosSquPUCOiZA3/zKPW8twLJ5dxbBdsDJP631nT44zK23czobf8A3lLacp1U6TZ1KNzKFYvjixyGayrQpC7/Uz7gNVJ+e9iC4w36tb8EG84n9rhOz6fZGQAw+XeTYFhBmlt2EQDvWedtuea+M3xJhRoWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=f2hjdS/m; arc=fail smtp.client-ip=52.101.52.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="f2hjdS/m"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SFPtrTPqML7N9jQdE2fHHmkvPaQN1UdSzRC7yBO/zzXUn8B5WNhwbktZfPdek/WCbU+D9IFNiWADzhqnYwjrG1bl9poJsiGPLG5pBlzgpnKO5GN2rMS+Q32nyDY2tf11FbaYNq3oQk07q4+ME/Nu34vKOWfgod0Tl0AAf/3xsy9p43xk8qBfI/lR5WL7WnYEmo5qoGdP6C86DNZyfX3a3pU44c3tQX+4laqmuwVLihRpIU4SqWDJpNEnzknQFmXln2ED3/AQJ7Pl5cqgsUDHVjCQvMERRg7Hwt2U8Bodv6cDv1gJklnzm+MWjEVRKfiRufJ1YocYwKFEUCsDJSrv2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+JUjC3eslQe/SgNeXLuwem+FCMfis02f9Rmdi55NedI=;
 b=iAEgX8m40Fzh3a2tKiDvH5DazLbQbznJSGur5DmDgPeMaU/WSgdgwcfSB4bBGI4tttWVLyRcvnEFRT5rB+YVtn0w/RR4Fx75ynDowGwvErQVB86e3b7UatJLQds37bnAgj1HHUd0rw3Uy7hgAbMFSsquS+jphF3JkX3ZgknDbhv+pNdZxBng9FWq62Z4bJk8AwGxisVxKVa5YYgDoOqFAP96RffcpE9Gk4PsQPnd5z6Zvlu9/1nTNYsh2mZVozYDKrjaud8/xv1mMdFQfNO6kdKMN6bnNzLogVJBwp8zw0IoHWvTV0BVXTxOtLufntcNmXICNq9SvVdoM0OSuk7Vyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+JUjC3eslQe/SgNeXLuwem+FCMfis02f9Rmdi55NedI=;
 b=f2hjdS/mYc++Mb03hlzW2QbD/73ox3Tn6t2T9aj+YahnggCugzv/kG97oW5RsQvd2Ce4N7u9Og6sajPumH+b4R92Nb9wM/OnyM6ozzN080gbjRh5WQkjFpNK8QRpH5Y1gt6s5sartJn+746dFPVrYibLzZIMpXERqbiNcxr/ANEsZEzs9EKYKJQSSwOZYqPB/LHIsbXsylOGZJqvSyfdxxj8zU8+2NbZ62N4AApmhCpX0bt4M208j8JAJWpN9/qpwxJUHRdkcc4JD5Gz5Fpkvv3PqsEhWrcCfzGrouRl+XGan6CD3R4moyDaXlGHh4uD8iyM5HZQ6NVBxcyqIlTtdQ==
Received: from CH0P223CA0007.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::31)
 by SA1PR12MB9516.namprd12.prod.outlook.com (2603:10b6:806:45b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Mon, 2 Mar
 2026 08:54:43 +0000
Received: from CH2PEPF0000009F.namprd02.prod.outlook.com
 (2603:10b6:610:116:cafe::ff) by CH0P223CA0007.outlook.office365.com
 (2603:10b6:610:116::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20 via Frontend
 Transport; Mon, 2 Mar 2026 08:54:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH2PEPF0000009F.mail.protection.outlook.com (10.167.244.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 08:54:43 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 00:54:25 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 00:54:24 -0800
Received: from sheetal.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 00:54:20 -0800
From: "Sheetal ." <sheetal@nvidia.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>
CC: Jonathan Hunter <jonathanh@nvidia.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Sameer Pujar <spujar@nvidia.com>, Mohan kumar
	<mkumard@nvidia.com>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Sheetal <sheetal@nvidia.com>, Aditya Bavanari
	<abavanari@nvidia.com>
Subject: [PATCH 2/2] ASoC: tegra: Add support for Tegra238 soundcard
Date: Mon, 2 Mar 2026 14:23:23 +0530
Message-ID: <20260302085323.3139571-3-sheetal@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260302085323.3139571-1-sheetal@nvidia.com>
References: <20260302085323.3139571-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009F:EE_|SA1PR12MB9516:EE_
X-MS-Office365-Filtering-Correlation-Id: c5094acb-c8be-4067-839f-08de78395906
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	ueoWEVsHbOXkcBp6X8E9uHb/DeBgbSN1QKOGhFjiC6yLw8j/S9VbcEbZbrWmLz3X6eusmpeyHHtORl5+jD3/v32XfwBVyVkFtJ26AwTo/CaJynWDbdEGI94Sl5TIorwMD0XMryRcxXI289b82+OFqK2LVRzEpaW1HpArc210UoslIT74SBvNI0Yu9PdTl8/gWK/mFReO+LNKLPfGa/bPXVeFyCixw6Ji1GV26lDXFe3bZyuqqjMO5EJF+KhUHWQNJMiiGq+51dJ0cD8DbfUsBqwzyrgfUr99hEH/MMrnL+8ltrATtrbt1ews1pWWDlK2sE0Kd5JYjTYyY0zOQXnCEi3pyGx95zJUTqHDOKmmuBFnudvlxX3/Sn974qDNmoGqo+vRHKahJ3tzd4vfBaevySRWLNRAvuq1/pApOsoAtfz30gHAwhjdGmB4nlkDkaLVI/K2MZ6JoLow47nnnMbsPC0kc5F1MGVIm6rpz2RfMQ52WDu9yKPuarPfMG66RadXol9fPPOASdEt26N9/JwnXe6mAJIw3oqhJMmaP7FhAUg4+5VDMi/b402W25aP65WJzU3GJYV+9Ff79saKDXndmK2zwmNjLF3ggBhtzwHvCfsUF25jCJVMPatVNIzj6pxJASsayDIPPb8B5Lr52hk2cZaPqA/Y3pf/V1kmQxNfc3ZCOBxtWFFTgJ4Xd9E6JNqpvvWErVEC/KGr+/sokD0ezC0ESTQHQ9q09zjUZQWX5v9wD6RKRUC2PZCKOo9RD7s1nY/GKg87yW+xZlgOlu8C4LE1mnCbdRYmTDzulRVLwnwaGC6yeABOeG8/5gPpGq2qSF2MBK34LLdUu/C6fF5ndw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Yk3eRSEpvJA3SxQ1Q1HrMPq9cKJPpw2UyFruTFeenTGLkP1pRRgah3sVxtKAca9sSBqAmr0kZEoBSbndffLWO/Rdhj/hWaE27yQiuD5HWkuMGceflGNd8w+NHN025E9SwpBktJk7umxtgW191XdYQX99L7KV/2iuUtToA/qCyCK/j2zOpZ7HDYxVavVLVO5b6Sq63253+sQomToeH5SJUak20y7MgfGOlOj09Fp2uhIE0XwzCbsBhXLJuaDewDW7noGDlaRvhGUs5V16Nh76Lk7G7tF4wwvpzJQ7M6eoHbuklED4CeKu66kOHoJSD8rGH1DQZdTKFstcYE3qWiGl6PSN17YMBucXtO2OmWC4nlDHGJYdB6imI7vmvAgn4P8Uqxc0ixdmrR9bTQyBgaqOvZN23/GsbA82UFGR6JajSyAb3TbnkA/ZXAzKGUwe6T+2
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 08:54:43.3729
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5094acb-c8be-4067-839f-08de78395906
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9516

From: Sheetal <sheetal@nvidia.com>

Tegra238 platforms use different clock rates for plla and
plla_out0 clocks. Add Tegra238 support in the Tegra
sound card driver to apply specific clock configurations.

Signed-off-by: Aditya Bavanari <abavanari@nvidia.com>
Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra_audio_graph_card.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra_audio_graph_card.c b/sound/soc/tegra/tegra_audio_graph_card.c
index 94b5ab77649b..b6dadd6a3d3d 100644
--- a/sound/soc/tegra/tegra_audio_graph_card.c
+++ b/sound/soc/tegra/tegra_audio_graph_card.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-// SPDX-FileCopyrightText: Copyright (c) 2020-2025 NVIDIA CORPORATION. All rights reserved.
+// SPDX-FileCopyrightText: Copyright (c) 2020-2026 NVIDIA CORPORATION. All rights reserved.
 //
 // tegra_audio_graph_card.c - Audio Graph based Tegra Machine Driver
 
@@ -231,6 +231,15 @@ static const struct tegra_audio_cdata tegra186_data = {
 	.plla_out0_rates[x11_RATE] = 45158400,
 };
 
+static const struct tegra_audio_cdata tegra238_data = {
+	/* PLLA */
+	.plla_rates[x8_RATE] = 1277952000,
+	.plla_rates[x11_RATE] = 1264435200,
+	/* PLLA_OUT0 */
+	.plla_out0_rates[x8_RATE] = 49152000,
+	.plla_out0_rates[x11_RATE] = 45158400,
+};
+
 static const struct tegra_audio_cdata tegra264_data = {
 	/* PLLA1 */
 	.plla_rates[x8_RATE] = 983040000,
@@ -245,6 +254,8 @@ static const struct of_device_id graph_of_tegra_match[] = {
 	  .data = &tegra210_data },
 	{ .compatible = "nvidia,tegra186-audio-graph-card",
 	  .data = &tegra186_data },
+	{ .compatible = "nvidia,tegra238-audio-graph-card",
+	  .data = &tegra238_data },
 	{ .compatible = "nvidia,tegra264-audio-graph-card",
 	  .data = &tegra264_data },
 	{},
-- 
2.34.1

