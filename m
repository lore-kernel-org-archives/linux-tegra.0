Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012028.outbound.protection.outlook.com [52.101.43.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1591138C40D;
	Tue,  3 Mar 2026 10:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772532254; cv=fail; b=GzjjKK+F0XOA1AEAlS9kISzVyTC5fpn1261RceRZd3s1zWkWFGs8E5JZXGs1yU/thmb6h4t4F7+YdU3QbW6MYubMQoUZ08NfVjA2u9HtyP0ddK1HSoMHT7wdN72wWQRnSJx+cIoJZWsAG2abu+6RZ0npqwsZiqwF/wvmELDCfxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772532254; c=relaxed/simple;
	bh=Gqkd5kQ5zH973YnnkaJ0jRtvfwvF32Et/bhXZnEeZKU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fYV75Zzk5wHRA3LFE1i3kvBjwVM2QXVW3/FdNFNyOIw3gWyaj1zKxRpHTPDiLowYX4PVcXwqPHdzfVgY6TIJ8a1MWYTo3ZyFQ/WVVlJ5oy7EwGqQxjt+3bWzFQF20w2QYq/3p8ZCyG6IbGsjP/f3ekp59FljGCR3RbEHLz6jE1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ArWUg6p1; arc=fail smtp.client-ip=52.101.43.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ArWUg6p1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ejgixP2qEk2UT1JL0FmwNFA4bE394Qjkx+b7rKTo/drOuG0X0UbuX0jSgrzBE/8EyBUbbOBbxbu069M708bdldNIw6M4m2clV4EnROdSbkS4qY5a2vujtgq/5uk4vg6ONehTEZT9nvuyPQq2nzvPn46fclKUXOzjXGATT6k91Hg9mvrCS7spOBFpqm+cvqaBPDeOvSaCmWNthQP40zDDVrqJyxkavVckvNcAuwILx7mbTRyfWTHO9n3+/Yn1HjDEQ8RVRhFcPKScdXCqy+a/VltXLBMPSuutxqLyCw8Cx+3CJ0Nkbw52+QuuM7DbcutCtnYGw+MX4t4dawSwa4QNQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WVW8hrtNSuE328DO2H4QY5j4ktghoOKevkCWOROqeX4=;
 b=xjzZ/j/aJy766Q0dM8unOJrz+6ERc/zxFwi1pQyZbkbNspWz3IO7vnm+9nvj6WvYHegecskThk4OwhCFwoyOfQ8NE9AEInedmfMKGUQZEZZF59y8BBN4RaonVvdDXDMUctV0H7awdrEGf4LsNnLUOkknjyGN/+cv/S+CgNGoGTgcL+r6CUjFIt33kMsmWyvCur9BVQoEYIMwhECcthp/YTHtKwbinb4NsE3IcOEekRe9WNu8Fd7ENhksFPmjV+2AS57v+VFjhPArQUGD1UFH3pyHNy7e7yMsc3Wewvj3yUHaT4j3hrszwen379dx8Ot+w5Uj8QPuETtCiwaObHCKpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WVW8hrtNSuE328DO2H4QY5j4ktghoOKevkCWOROqeX4=;
 b=ArWUg6p1WsLU7b+0OTZC1KRKOHl6baeZ0vJOq/3anItoUOJcpM63PxKELujHY2odCkmRqD19II5f+jZhH2rK7Kt8NcG253OdxDq2M/kHvtYfGQfZdBqkH047cBFjJ+rxVw8w663DqpzfPPfuEy9KaiE9P4Bpq+oIO9JGN76QORLrVndXpLBUtgsDnbr9U3F7L9VnFrM8CHOPU/gXavHkWSP6cXeB97AVGfhWfGg+GjxFze46k4ibtUL9xh+VXr4Ht4JxrbtSOx13/ThwP2+c1B3rM3hrL7k5iBEpU9vY+16os9gYOEyKiSjaMeb+S4GfVOiyuofjQUzZwRGxSWVF8w==
Received: from DM6PR07CA0131.namprd07.prod.outlook.com (2603:10b6:5:330::19)
 by MW5PR12MB5623.namprd12.prod.outlook.com (2603:10b6:303:199::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Tue, 3 Mar
 2026 10:04:08 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:5:330:cafe::f9) by DM6PR07CA0131.outlook.office365.com
 (2603:10b6:5:330::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Tue,
 3 Mar 2026 10:04:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 10:04:07 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 02:03:52 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 02:03:52 -0800
Received: from sheetal.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 02:03:47 -0800
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
Subject: [PATCH v2 2/2] ASoC: tegra: Add support for Tegra238 soundcard
Date: Tue, 3 Mar 2026 15:32:49 +0530
Message-ID: <20260303100249.3214529-3-sheetal@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303100249.3214529-1-sheetal@nvidia.com>
References: <20260303100249.3214529-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|MW5PR12MB5623:EE_
X-MS-Office365-Filtering-Correlation-Id: 715ddd67-4d64-48a0-54a9-08de790c3577
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	Vtea1MfJvcaudOT0FZmU54wlBkQavk6qDSOQc43gCDEEVB6r0apI5tlV8bnGEKdqVLJE24q8Gay8XhcpeZDkBcPc/JP7aDw/yxKqrXiVQL8tozbbkYJtBocqj4XGaO/YOF/uRw3wgR8TJJoEsm9brHKty+fZ2wTD8rL6QfxWDr7yu8p7e56TTdrDva+kjtZDSx5wnSohzQ+QaUVTt0SCb2dM+963tXImOPs/sLAnVd/EBRzC1/imPRRv19kXCPqRVGyrOk1hJmLWXmu7Ume1F3mHXvKu+yb0cug9T0I5cafYrDkBuDVk+MxeDAHNfaofEqqCcA0RCfIUd7lWYew6Dwpc9qA85gdPtXZ+MxjRyX06fBjw7CBI4d7v2mCCRLqtiHw8vp+eavy2x10UEJP4y70a6U9QNecqE47/S6OymBLvqjXlLiGL70nEEQYJcn4Vu/h2Fr6iKAkWnGg5tZIZoWicYC4Y721kfyMoxVh639MMZsPDupRhBYOlBeclwp9X+Dkyk5WP4RSHrZ+xUbb1BPoMvDR5OfUOh1FRf+MgCg91vsIkwr2iTVJS+R6aeak5hrEVx2yiAm1SOvi9b7tLs7ALJtqdYOmcJcSbsHuBxaoUyx08pj5B1EV2PQwaJbEkYEcm4gYiWqEXtkU1SLAFw09crCVrqiu8EhbCQsK5TKmAShQ6X7hxn4Cl9/b+EtirHxK9bGecrKN8yDFnzb/UQ9rlPMnYCN8lCWMmTuarHFRLHM70sihLVv6Z6eYFDuc8pXOBqeHKjA7XIPiPAdpN2uGkA5nN3BXBWIkTzSSItgcTB6bL1JKgiH5eMSrxDkxkC0UMYoWLAcCWvF0xjR8TzA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hH3UMVX4BR8m+hJ6L4j8nD5MpG0AzE6CsIR3AMqBUDSbr56LOddIHh/N9KnZ9jAWqzdqAh+yIMDJ9SFUBgW2srsbQRauhdOZPmWccTle01kx9BNxoXArplJoUharuQ0P5Cb8YdGZI9387r6RWjkpaLNPqK1/HXgIefAJ90Fsh9kM/ZXOSqhCXI589PcE92R2rDo8ndoYSTiB8QBEWdpS15UGs9d5TbU7i4dNbfHjwdln2uDX2WoA1dihbG/bJD/qmOItKQRX+Ltar81a+7jKjjr+U0We7no284zkfgJIBo0lPbPBQshBGREP4sKBRP1KWQ/FUGkWOi6rp7jmDweXHBmZn6SmuS/yPHb4hfityQZ3Df3TEQxfnaVgmdx/89f8+DivOYChI4ILqIy9A0ptuvAjah0JFyt/5R8cuhIQDtXcsB1DGKhnXCXSrjRy9D6T
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 10:04:07.5348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 715ddd67-4d64-48a0-54a9-08de790c3577
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5623

From: Sheetal <sheetal@nvidia.com>

Tegra238 platforms use different clock rates for plla and
plla_out0 clocks. Add Tegra238 support in the Tegra
sound card driver to apply specific clock configurations.

Signed-off-by: Aditya Bavanari <abavanari@nvidia.com>
Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra_audio_graph_card.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra_audio_graph_card.c b/sound/soc/tegra/tegra_audio_graph_card.c
index 94b5ab77649b..b6dadd6a3d3d 100644
--- a/sound/soc/tegra/tegra_audio_graph_card.c
+++ b/sound/soc/tegra/tegra_audio_graph_card.c
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

