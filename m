Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2062.outbound.protection.outlook.com [40.107.243.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3C92561CB;
	Mon, 12 May 2025 06:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747032215; cv=fail; b=ALlA0ncBW1xfDDVk5vaAsDczmlqrpp//nox3VnL3YERvjb6Ix8jMX4jXpgfr20T1A0G5jdafgKe/dW75EKiOOV2KTpiuJS0Yg/Q1fuyRQEj3FzVZyGlP3WewhglSztnUlVx0sDXyEjzc2L0lXl+GIZRTTysfBHcd/Ost0zVxpdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747032215; c=relaxed/simple;
	bh=teDxLu5DsHlpOqqKq5EOrTaltmR9rHlN6B3UDgTGs6Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qav6GreDUdPxouPsBZK9+CYHtnKl/dZAiUZid9RRinAlB79EsFB8tHQv9b2E+eAUlREgTgCDL/T7IiJD4JvhwQaY17wF5XPTAgAbnwRzX6Tm9Byx6JpKzuli6Dm83NQJRCR5y3b1a4bu3Ga4WiEi8kQsHZmmmzNGmD3eL+5P9lk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IAXB+/Vi; arc=fail smtp.client-ip=40.107.243.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IAXB+/Vi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OXTglyIkfSLGRxEhyvq1zjV0sKRjwBa/7AnblBjB1pqpzYyzLgYlZnUBwQSb8xRkeDEENLsCqSImulPqR7CpWi7zkRNlUbkMbxfmfHIdKcfx/xx9n9oPWJ8ABmNd3f8jLw6rbhDdUpmI9+sYSx88X51bWuxm2IZDJs/Vh6AVXBsF6ZaVvhtjAVDZJ/HWLTT/NPKF5YWy8c7+FeroWvIDOGpSQm/74eByZ1qy33n+ZtL8M9KIlkPj5hxRaHU+IRyfGB4RIRc3a+S9yiQOGqwLE+3YxIke1IhD3sPCmdt07gIK6i5sqzwbmfvJDx0HzqJjKFXsQOvy87+a0i7F2iX/eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ObXZ4ovDQ1HqvOZOOo2uNpzUqri2fkqo6/3Mtg/f/Y=;
 b=a7WCz4Jgs++pp4hIuE/cYjFrRzruULLhb2HE8FCJLYdF9lamtFk4aUYAcct+QqUf9tP1Kz6ImgtbUeKq1wCaSEuLqdQQcyvG9pycpq2frmhHn9Q4DQKwfup/wFhug5HX7QvTyCPD/zRnK6gLoWzoqSZc+LDq98I46xlsJSfKE2rcHTS1ouo7W7RaSIBNF4/O7rmtO+A3+g14p8ptIAX27Nb8AldE+Cu7Yx9fchMRT0PYl1jjq5uy9LC4ZrN/6HJ/62ydCETxJDdSJf5KGwoM0yuCTd2GPgVkIITxzA1nFDlKSf+2nQIICxfh5nT7BSzwEqhGYaIUTNtuwYzr7vNimw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ObXZ4ovDQ1HqvOZOOo2uNpzUqri2fkqo6/3Mtg/f/Y=;
 b=IAXB+/Vi8i3GWs3gRM0OQF6EaSEzDLmHRbO3id/q6WvWfRNz+Nm+GJhe/ima1gz1zsFNX5Ak4LDbueh1NTuMHl7GplUiI4+ZTWg7IbxnhVOSHG3ZucW6o1Ue7COAR0SoqPH0iaXYE29YYeETncj2BHh9+QoeUiueTU8fYsn0Yw8kLa52+lOQWteGqsR7g1yPVjBrOBVVMKkYP8NY4fkPLQb29BtKQgXfL89BjwkY1LV+7i1QMnHSo0IyvW90FEeBa99eTE5Lnr2kq4/axTimJ3pFVRku7KKHQzXKazxbg5BQQcnembblYMCV3f3ThA4+FwkfsvOKV6VFkci09jWyOA==
Received: from DS7PR05CA0087.namprd05.prod.outlook.com (2603:10b6:8:56::9) by
 PH8PR12MB7136.namprd12.prod.outlook.com (2603:10b6:510:22b::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.26; Mon, 12 May 2025 06:43:29 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:8:56:cafe::5c) by DS7PR05CA0087.outlook.office365.com
 (2603:10b6:8:56::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.9 via Frontend Transport; Mon,
 12 May 2025 06:43:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Mon, 12 May 2025 06:43:29 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 23:43:18 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 23:43:17 -0700
Received: from build-sheetal-bionic-20250305.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14
 via Frontend Transport; Sun, 11 May 2025 23:43:17 -0700
From: "Sheetal ." <sheetal@nvidia.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <perex@perex.cz>,
	<tiwai@suse.com>, Mohan Kumar D <mkumard@nvidia.com>, Sheetal
	<sheetal@nvidia.com>
Subject: [PATCH 3/3] ALSA: hda/tegra: Add Tegra264 support
Date: Mon, 12 May 2025 06:42:58 +0000
Message-ID: <20250512064258.1028331-4-sheetal@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250512064258.1028331-1-sheetal@nvidia.com>
References: <20250512064258.1028331-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|PH8PR12MB7136:EE_
X-MS-Office365-Filtering-Correlation-Id: eb53fce9-b24e-46d8-daa6-08dd91204e30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Jy4avTdDfHhEYRtStWJ2bX4Sw5lQOR/I3U1CNotSYJXM5ehvrqwXfdy2kaI1?=
 =?us-ascii?Q?RSlawRo8X5odf7aapO6DuNzTe3krmE4O/PVPbwHCdvTWiU/jvYMUyEg5NUvw?=
 =?us-ascii?Q?GNvpBjaBmjU3Jeq2DTJ8m+JqRDlnk+YHICv8WbdwW7cJIB+t/nuVRV65/y8+?=
 =?us-ascii?Q?HmTx0sQU1uT/n2tSvOECUFBkrM2vTPDPWLGV3W1qMETZqETBRmHybRWQ8Foi?=
 =?us-ascii?Q?rtOUVvusWT29nbHjuIQjLNGwv1ucZUrXXLyDG8GcNEJCQ126m/5yPXMUDNem?=
 =?us-ascii?Q?xI//sNh6Zz0IPTs5jH/g4d8Sx01SQQ0754ZKGMNLoJZ5X1vCTXA5NgJSuIDU?=
 =?us-ascii?Q?8llqujUNx5BqnMsjyLiuPwqI0waObZx3ZJGtPP3w8m5WynJgk5gbyzRERuqf?=
 =?us-ascii?Q?4r0gWCr5Nye2rNZJMiIiG0swlZMSM72tbDCZL2GxYz7rts3TVBPYd4mJwNOh?=
 =?us-ascii?Q?VtDRLglqC749Ckchi7dz+Pe+jCGfuW7GDun5arcURQHgj4ZrogE1HHPffGYU?=
 =?us-ascii?Q?nIs6q99+0ycZaa34KtztstpN3Gq4z5caPFdk+SQa3eb37DqgfN1kl50bhwVv?=
 =?us-ascii?Q?GLYIOaHmm221nfig87BQlzHNmOm3T7MP6CdqsKurYdPsOVbXjwAzVhrKN0EV?=
 =?us-ascii?Q?F8VRmqbg2ImFIzybnCoa9A/AkbOGp76jDn+CpVL2zM6SquWIEvOVJLy+6fLA?=
 =?us-ascii?Q?j9TWVx8XmVXXsO+DO9UbB83ZvOO9VfYPO9YO3X/SG32WMYQoAu9jdbbdJqBb?=
 =?us-ascii?Q?2ZeC84+rLu2pxVJMLsOlmSWAdCNxSNp8gEFDauPXWtrYU+2CUtvkCpGbx3I4?=
 =?us-ascii?Q?xWaz22mjZDoU/dyFjQQeU+lcOYU3IdduOEXGizpHgJ6eVnTDdfPZ/6Gxqf3k?=
 =?us-ascii?Q?ngP0IPHY3ZS4KL5GeeNl2CSNi0GDDXxJy1fv3ayqMEUClpxiccwF4B5MUcPv?=
 =?us-ascii?Q?ld+aG04B8nkrBQcg+e3GbXryjXbHU7DtoRop1nSiKDVrO5DA0hHChCwFwtZ7?=
 =?us-ascii?Q?HlQk3CpQJTQg6b/uTHgV1vpioyDqziFxrmGMca1yzbU3+duElnqyx5jIwx58?=
 =?us-ascii?Q?PFDutBnoJ6Y6CWL3Xu2b9XQ/01CUcO3cV4ngbwyzlIhNrTeqyowjMkFMd/U5?=
 =?us-ascii?Q?aHO3j690o/nIDfGIyNlOMQ/xEZmBeCtHuZ62uMWpsqwW+D7E0bGcXlDsSFTX?=
 =?us-ascii?Q?9Vo5N/7uzypSa9iBfBAl1jfiOwkBFLihngO+h8TjAOZLrHOMG1XuOzfHy1t5?=
 =?us-ascii?Q?sKFipYlv067f/KdXTZFD1/CpUCxNwJW59Z1KPES0b3Q9oVgVe1gY8o+ia6aV?=
 =?us-ascii?Q?7yFLCB30x96kVaLMLWEeEngnllQrg5g6VYjreJO4FVSNb00HL9fY0kXvJqax?=
 =?us-ascii?Q?BmllYrMq+BVeIEosL6aU/yQUaYcetC9otsKy20Ak3fhaufagDZt6upWyvoqR?=
 =?us-ascii?Q?yDGVBGadLcwuwFmmw/qIJ1qsyvwIhVmm0k+S7H6DpwlfkpYp+StjaY4NwIH2?=
 =?us-ascii?Q?V2vQt60qCCXobe1s1MTPl/ghKnvraKS6rYDc?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 06:43:29.1937
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb53fce9-b24e-46d8-daa6-08dd91204e30
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7136

From: Mohan Kumar D <mkumard@nvidia.com>

Update HDA driver to support Tegra264 differences from legacy HDA,
which includes: clocks/resets, always power on, and hardware-managed
FPCI/IPFS initialization. The driver retrieves this chip-specific
information from soc_data.

Signed-off-by: Mohan Kumar D <mkumard@nvidia.com>
Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/pci/hda/hda_tegra.c  | 51 +++++++++++++++++++++++++++++++++-----
 sound/pci/hda/patch_hdmi.c |  1 +
 2 files changed, 46 insertions(+), 6 deletions(-)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index a590d431c5ff..8c0dd439f5a5 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -72,6 +72,10 @@
 struct hda_tegra_soc {
 	bool has_hda2codec_2x_reset;
 	bool has_hda2hdmi;
+	bool has_hda2codec_2x;
+	bool input_stream;
+	bool always_on;
+	bool requires_init;
 };
 
 struct hda_tegra {
@@ -187,7 +191,9 @@ static int hda_tegra_runtime_resume(struct device *dev)
 	if (rc != 0)
 		return rc;
 	if (chip->running) {
-		hda_tegra_init(hda);
+		if (hda->soc->requires_init)
+			hda_tegra_init(hda);
+
 		azx_init_chip(chip, 1);
 		/* disable controller wake up event*/
 		azx_writew(chip, WAKEEN, azx_readw(chip, WAKEEN) &
@@ -250,7 +256,8 @@ static int hda_tegra_init_chip(struct azx *chip, struct platform_device *pdev)
 	bus->remap_addr = hda->regs + HDA_BAR0;
 	bus->addr = res->start + HDA_BAR0;
 
-	hda_tegra_init(hda);
+	if (hda->soc->requires_init)
+		hda_tegra_init(hda);
 
 	return 0;
 }
@@ -323,7 +330,7 @@ static int hda_tegra_first_init(struct azx *chip, struct platform_device *pdev)
 	 * starts with offset 0 which is wrong as HW register for output stream
 	 * offset starts with 4.
 	 */
-	if (of_device_is_compatible(np, "nvidia,tegra234-hda"))
+	if (!hda->soc->input_stream)
 		chip->capture_streams = 4;
 
 	chip->playback_streams = (gcap >> 12) & 0x0f;
@@ -419,7 +426,6 @@ static int hda_tegra_create(struct snd_card *card,
 	chip->driver_caps = driver_caps;
 	chip->driver_type = driver_caps & 0xff;
 	chip->dev_index = 0;
-	chip->jackpoll_interval = msecs_to_jiffies(5000);
 	INIT_LIST_HEAD(&chip->pcm_list);
 
 	chip->codec_probe_mask = -1;
@@ -436,7 +442,16 @@ static int hda_tegra_create(struct snd_card *card,
 	chip->bus.core.sync_write = 0;
 	chip->bus.core.needs_damn_long_delay = 1;
 	chip->bus.core.aligned_mmio = 1;
-	chip->bus.jackpoll_in_suspend = 1;
+
+	/*
+	 * HDA power domain and clocks are always on for Tegra264 and
+	 * the jack detection logic would work always, so no need of
+	 * jack polling mechanism running.
+	 */
+	if (!hda->soc->always_on) {
+		chip->jackpoll_interval = msecs_to_jiffies(5000);
+		chip->bus.jackpoll_in_suspend = 1;
+	}
 
 	err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
 	if (err < 0) {
@@ -450,22 +465,44 @@ static int hda_tegra_create(struct snd_card *card,
 static const struct hda_tegra_soc tegra30_data = {
 	.has_hda2codec_2x_reset = true,
 	.has_hda2hdmi = true,
+	.has_hda2codec_2x = true,
+	.input_stream = true,
+	.always_on = false,
+	.requires_init = true,
 };
 
 static const struct hda_tegra_soc tegra194_data = {
 	.has_hda2codec_2x_reset = false,
 	.has_hda2hdmi = true,
+	.has_hda2codec_2x = true,
+	.input_stream = true,
+	.always_on = false,
+	.requires_init = true,
 };
 
 static const struct hda_tegra_soc tegra234_data = {
 	.has_hda2codec_2x_reset = true,
 	.has_hda2hdmi = false,
+	.has_hda2codec_2x = true,
+	.input_stream = false,
+	.always_on = false,
+	.requires_init = true,
+};
+
+static const struct hda_tegra_soc tegra264_data = {
+	.has_hda2codec_2x_reset = true,
+	.has_hda2hdmi = false,
+	.has_hda2codec_2x = false,
+	.input_stream = false,
+	.always_on = true,
+	.requires_init = false,
 };
 
 static const struct of_device_id hda_tegra_match[] = {
 	{ .compatible = "nvidia,tegra30-hda", .data = &tegra30_data },
 	{ .compatible = "nvidia,tegra194-hda", .data = &tegra194_data },
 	{ .compatible = "nvidia,tegra234-hda", .data = &tegra234_data },
+	{ .compatible = "nvidia,tegra264-hda", .data = &tegra264_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, hda_tegra_match);
@@ -520,7 +557,9 @@ static int hda_tegra_probe(struct platform_device *pdev)
 	hda->clocks[hda->nclocks++].id = "hda";
 	if (hda->soc->has_hda2hdmi)
 		hda->clocks[hda->nclocks++].id = "hda2hdmi";
-	hda->clocks[hda->nclocks++].id = "hda2codec_2x";
+
+	if (hda->soc->has_hda2codec_2x)
+		hda->clocks[hda->nclocks++].id = "hda2codec_2x";
 
 	err = devm_clk_bulk_get(&pdev->dev, hda->nclocks, hda->clocks);
 	if (err < 0)
diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 7167989a8d86..6c860fda6648 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -4551,6 +4551,7 @@ HDA_CODEC_ENTRY(0x10de002e, "Tegra186 HDMI/DP1", patch_tegra_hdmi),
 HDA_CODEC_ENTRY(0x10de002f, "Tegra194 HDMI/DP2", patch_tegra_hdmi),
 HDA_CODEC_ENTRY(0x10de0030, "Tegra194 HDMI/DP3", patch_tegra_hdmi),
 HDA_CODEC_ENTRY(0x10de0031, "Tegra234 HDMI/DP", patch_tegra234_hdmi),
+HDA_CODEC_ENTRY(0x10de0034, "Tegra264 HDMI/DP",	patch_tegra234_hdmi),
 HDA_CODEC_ENTRY(0x10de0040, "GPU 40 HDMI/DP",	patch_nvhdmi),
 HDA_CODEC_ENTRY(0x10de0041, "GPU 41 HDMI/DP",	patch_nvhdmi),
 HDA_CODEC_ENTRY(0x10de0042, "GPU 42 HDMI/DP",	patch_nvhdmi),
-- 
2.17.1

