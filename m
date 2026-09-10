Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010033.outbound.protection.outlook.com [52.101.85.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A77D3DAADE;
	Thu, 10 Sep 2026 09:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030812; cv=fail; b=P4R6EuT5QFi1+PPrK2JjytuoaAEcGNa9ADh/EVp5Tcm5PE9BHx7Px9/4z9OU5LOd8oqiVbvuDOG24PPSDXQ1pNa9KGyexuA6eK8RK308lcNglsWB6vLdq+kIeNmo/ku++3crgS7m5oKi690Qa4B45OMBr3tulMHAEJjUxWKb2o8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030812; c=relaxed/simple;
	bh=7pyxUeNZEzfSxEzwzJQI4tLTJcOFizhwT7YG/ZCfMGE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PeUn3uQdtX6PRMmS7b2tE1GS9T+TlUpxcnZfRQrTOtkzCOX4Xw+Eo5MIuNAYvNUX89N/RscT07dSNq+mzJb9Mp7Ca2H3rOCUFPOeDt/8d5xRibahfOYSHDYjk1YdhIBwroNrxF2ryyL1ad2qF+ltG72MyHTk73lfTjt9yK8QPCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GDliqo9O; arc=fail smtp.client-ip=52.101.85.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GDliqo9O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VqOedI0veUlTVUCaDTi8ycWOmic2rUqNOU8H3O9pnwJ3cfjqRBNQEBf2B/L+F0G3jQV48qVxBldlpA3GMsQ5JqLKDwOaOzozLGQLzKOo3SM04f69Tdcu/8Uy/SfthvrwL+X+FFvwfCfqMnDYooEgLSMt4FmtblNSD11aSBu3EmoUIa/2rIMb/qkSBt3ND9qwA0odVWI0Is0mY2ih9TXByPDYMdccYbeVnovnWXJhtkKCtiOV2SADP7vipJGWxOGIGomEkFkb6HUQguZPm+YRMEZDyC5v+cqCFk4+QxnDCz0A/Vk6n5QjjEzNhIdTkTorT6cHCfs9m4dtF44HZPoXTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o6L6z2uK+0eY+GNixCS5zLBaUdXornZrMWEAwiuB8E0=;
 b=DX/4g6v0BUAXJi7YJJn++LE4FRgHrp0tcEIvxkYnX9R1YeTGRR/XQ64bW3quMskUrgrh5TZSGFloeGxaytHSR77Ex8U8s6O6sou2hELspE4xlEzYjfUG9XPlD/mVugKI5KdPx0qh8JzZm3bYD/ScERoNl9kFEuoKuZlHZGf+ZG04q54aK/zJwar/uyQ//93/+HLvSdw9GFuquuCo3mu7q3yR7VtJ555TQdyYSWZ0+/dlPosuOEMqf5hftcYyZ9juoG/lT2fYuin5+RzF9GFN+b7sT4DiGK56dguyrFpyV/OS3MM1royxoEgG8rMosfJisHXkJ6BXcyNw9XKhVCu21Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6L6z2uK+0eY+GNixCS5zLBaUdXornZrMWEAwiuB8E0=;
 b=GDliqo9O51Af6WW7DTDA7vfoXSHqI1b9/lTxIMujJERWO4OKn9I+T+Grv8mFpbCNK+oJDaLAcgu37QOPgwKUNuqRGKHXMyvcIUoU4Be/lqnN4987I1DKj4plveNr+rngPdvLZyT6m4RU3oMypAu855fc5SooK5D75E3lwBqqS09cvrNRL7pZAKFaT0ii7ZDxN8i77wDvo/ozGJwz3ZXj7o15zUZi1vsoKSqg5zI7Fbz4MvfbQQwQjzBKC825luguWEjp5mevb7dXJgiqZ13gC0YYGCpoT9x74Ix5rnTkEr5KllgcaCh8kPwH1JQYeZ0NItaSTV3uzKeoT/rFfBE/wA==
Received: from DS7PR06CA0013.namprd06.prod.outlook.com (2603:10b6:8:2a::13) by
 DM3PR12MB9391.namprd12.prod.outlook.com (2603:10b6:0:3d::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.9; Thu, 10 Sep 2026 08:59:52 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:8:2a:cafe::34) by DS7PR06CA0013.outlook.office365.com
 (2603:10b6:8:2a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Thu, 10
 Sep 2026 08:59:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 08:59:52 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 01:59:38 -0700
Received: from build-anrao-noble-20260906.internal (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 01:59:37 -0700
From: Aniruddha Rao <anrao@nvidia.com>
To: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Aniruddha
 Rao" <anrao@nvidia.com>
Subject: [PATCH v4 1/5] firmware: tegra: bpmp: Move channel initialization to helper
Date: Thu, 10 Sep 2026 08:59:15 +0000
Message-ID: <20260910085919.2522241-2-anrao@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910085919.2522241-1-anrao@nvidia.com>
References: <20260910085919.2522241-1-anrao@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|DM3PR12MB9391:EE_
X-MS-Office365-Filtering-Correlation-Id: e22e39a7-0856-4fb4-7569-08df0f19e0b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|1800799024|82310400026|6133799003|10067099003|56012099006|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	YkJhZzk/2xQTA/UkRsCXWchFgpHqQNuMn6yaLNsKaboQqHxj4T3Ru0GABGQPiR3vvIZS1jz9H3DoQBOXv46hvWxrDyqkTn2bR0AUfB8EAm5741c9w6UVyGhakggwIUrM+TJP1PqGLpwQQcB82xSLV/0SITmeB3/0FQ9CjhTWjDIUmRpNowJ0SLOXvNBm8rCUyA1Wa3CHHV8ipbt0UvMfngkQIXSkBW3clRW/5wiUNhdcBgiKZMwghJRpbkI9zjHmI+aDZydhXwm597OtVPTV52BF9lLR8iRbnTW8Qwx6U1qh2t6bpph26FfiH+O+4Al9S4io307u5F8CSuPI1E3oZmcGfYBAyINavokV2OxN2ZvpUVHxXhF4YlKstrHl5f/1kC7H++mJR3WVT03j9KpE/opB3O/2ATDeh/veY4Gh/rS8mlYApApIWzcbAXzciYR+G6ogFWqrDmJNQeyF3bpUa6bD/FGkFW2hU7cxb9DidJ4FPo2ECBeAfUrv19cvw3X7Jq9JORs8FxLHr4y7EJBXER00/DzIM9gkhDVg0H6ZyD9lai0RhW8MU5p7mHRLMpJNv49EW+Z3uqu7td45gdVDilRFsCUayFPZFwbg170JhwnFn3jw31qkfBjp6mgmZOPkvfcgtvwvrQIGnsAbdQxoycAU2ihh4CR9JY2wu5AKIGLE95S7yP4nZWnY3AJ27Gze64RQPMuTWkuCImcAC2r1OA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(1800799024)(82310400026)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YAyvyvqrL+xxyW++hQATV8knNozYKkYqCzHffA+yKfHGAoR4B/Cb2tgUO6KVFSScjIFbc29eO/tyMAZIYkxmCyicJGiN/xdav1fweVe8nveRGvfAtiRoYBMqXRPlcRaJpKg+k4ZAFvw9iAYS/19aTJyLE0e0xlA+H7TnLWJWzqTTi/ZnyaCuboSjSbZylhESKh4CwKqvtsObD5sFCvSFfOmT6udAHkfiw4Az4WEt+tx+xwliZWu+hm4wOWlgKmZxn13W5IQO1RDX7Xdw5OE0q/p8m9QdXi/6y1HPhYjRu+j1lR6xp3zMXUmNFJCtxepL8NVvUSyoe3BwqAWLY63wAaM8skOS7472R6YgO1kAmqnFKVSfaWjps3SvYfsqr4uL7qDd5/f7xNKx99qlThBOoqdQwlzPjxYw2RFI4tat4/ceitkYV7CajmaVkrrESpaf
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 08:59:52.6647
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e22e39a7-0856-4fb4-7569-08df0f19e0b1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9391

Move BPMP channel allocation and initialization into a helper.

This keeps the probe function focused on sequencing.

It also lets later patches decide whether mailbox/IVC setup is needed.

No functional change is intended.

Signed-off-by: Aniruddha Rao <anrao@nvidia.com>
---
Changes since v3:
- No change.

Changes since v2:
- No change.

Changes since v1:
- Keep OF resource initialization in tegra_bpmp_probe().
- Move only BPMP channel allocation and initialization into a helper.

 drivers/firmware/tegra/bpmp.c | 44 +++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 17 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index 753472b53bd8..0eb99b1c5068 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -733,19 +733,9 @@ void tegra_bpmp_handle_rx(struct tegra_bpmp *bpmp)
 	spin_unlock(&bpmp->lock);
 }
 
-static int tegra_bpmp_probe(struct platform_device *pdev)
+static int tegra_bpmp_init_channels(struct tegra_bpmp *bpmp)
 {
-	struct tegra_bpmp *bpmp;
-	char tag[TAG_SZ];
 	size_t size;
-	int err;
-
-	bpmp = devm_kzalloc(&pdev->dev, sizeof(*bpmp), GFP_KERNEL);
-	if (!bpmp)
-		return -ENOMEM;
-
-	bpmp->soc = of_device_get_match_data(&pdev->dev);
-	bpmp->dev = &pdev->dev;
 
 	INIT_LIST_HEAD(&bpmp->mrqs);
 	spin_lock_init(&bpmp->lock);
@@ -755,31 +745,51 @@ static int tegra_bpmp_probe(struct platform_device *pdev)
 
 	size = BITS_TO_LONGS(bpmp->threaded.count) * sizeof(long);
 
-	bpmp->threaded.allocated = devm_kzalloc(&pdev->dev, size, GFP_KERNEL);
+	bpmp->threaded.allocated = devm_kzalloc(bpmp->dev, size, GFP_KERNEL);
 	if (!bpmp->threaded.allocated)
 		return -ENOMEM;
 
-	bpmp->threaded.busy = devm_kzalloc(&pdev->dev, size, GFP_KERNEL);
+	bpmp->threaded.busy = devm_kzalloc(bpmp->dev, size, GFP_KERNEL);
 	if (!bpmp->threaded.busy)
 		return -ENOMEM;
 
 	spin_lock_init(&bpmp->atomic_tx_lock);
-	bpmp->tx_channel = devm_kzalloc(&pdev->dev, sizeof(*bpmp->tx_channel),
+	bpmp->tx_channel = devm_kzalloc(bpmp->dev, sizeof(*bpmp->tx_channel),
 					GFP_KERNEL);
 	if (!bpmp->tx_channel)
 		return -ENOMEM;
 
-	bpmp->rx_channel = devm_kzalloc(&pdev->dev, sizeof(*bpmp->rx_channel),
-	                                GFP_KERNEL);
+	bpmp->rx_channel = devm_kzalloc(bpmp->dev, sizeof(*bpmp->rx_channel),
+					GFP_KERNEL);
 	if (!bpmp->rx_channel)
 		return -ENOMEM;
 
-	bpmp->threaded_channels = devm_kcalloc(&pdev->dev, bpmp->threaded.count,
+	bpmp->threaded_channels = devm_kcalloc(bpmp->dev, bpmp->threaded.count,
 					       sizeof(*bpmp->threaded_channels),
 					       GFP_KERNEL);
 	if (!bpmp->threaded_channels)
 		return -ENOMEM;
 
+	return 0;
+}
+
+static int tegra_bpmp_probe(struct platform_device *pdev)
+{
+	struct tegra_bpmp *bpmp;
+	char tag[TAG_SZ];
+	int err;
+
+	bpmp = devm_kzalloc(&pdev->dev, sizeof(*bpmp), GFP_KERNEL);
+	if (!bpmp)
+		return -ENOMEM;
+
+	bpmp->soc = of_device_get_match_data(&pdev->dev);
+	bpmp->dev = &pdev->dev;
+
+	err = tegra_bpmp_init_channels(bpmp);
+	if (err < 0)
+		return err;
+
 	platform_set_drvdata(pdev, bpmp);
 
 	err = bpmp->soc->ops->init(bpmp);
-- 
2.43.0

