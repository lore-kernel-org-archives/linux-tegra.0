Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011047.outbound.protection.outlook.com [40.93.194.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F33C40F726;
	Wed, 22 Jul 2026 11:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784718400; cv=fail; b=OFzWdFw0NNLDekjz0aSnKckQ2gAfkJGZp4uHmwVf+WfaUIu39+VbipXdRgUSSHGUUrdjNm1kjMJnlQV9sICgdhRYRCuF3DcHFlPQstX8pUyKhAdUi52aAdgw+i/KHTiB5dYabDeB2DryDZIczNyZZW9YffWNp48l3iwL9VI47VA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784718400; c=relaxed/simple;
	bh=NDR27yYusl2hQoCdVPtmPr31Oa1fZamuI82NOXB52uI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fwqb4ZO3NuPHZZxYhnpvCY9zNeXHAFgPoWMyDo+nYxOxY3dwYT6xWG4+YILgFmXC7pSR+NBRudHoN+iUZRt6C0Xa8viIxY/DZGJE8uaRElhxQhYykqQwc7gTmpbS8HUiGhKAtuxM1xLTANCQCNhyylu9uBxYV8FgX+oTFICLYzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cGbBnm1k; arc=fail smtp.client-ip=40.93.194.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cGbBnm1k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4jy7vV/xEQm658F4bcHkDYmoZt1C+4UKjZDcaIUU0un1ppS0wz63qmEMkNBiUBhYY+GWYr6y/TtsnBVTfgsYLAaY3Eckmyt+YwyuOMEWLktgT2kW+SSlZ9TIylynWuvCFTKvibk97Md+sCHCg4cRup2TgZbcN84dqI/AlmImd2yLB5of27XUsSaoW3cN3r+m76xepgjXwe8kgnxFaLhaTCj6andqDLlmOxXJf7pfcTpRzMzWyunPoE+zvH3Irfea0kojuq1cfwj8hcOPqI3bB5b97X4hv3aVHdsAM9ZnzEnnNqoaku3LmjMpvB60I7OYZaqXaQMgFbmykdPxQnE2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ixvd1qZ93bFSuIJ3Ks37LkG9R2RNrRW9wMv7jORp/HQ=;
 b=bZuNAdUdeSE5w0D8G3dQsuNhbmlRiY1lAsQYg4ImyeRD/TCkxW/U8UZwAPMUtiCEdTh08PrEywRJA3QN9NpGKV0YeCE/n4zhraOU+0NgH7on4xNc4OIyFh3kj7wC4bI/0g0MSKgHcEYJhn17niBHn4pd6RfV/zAQysujwKC7IHyOaUuOrAhqkb0dhlqyIb592d7OLFFzQR0xxFyheRGtrGjN3F8abG8wpj36MPUEr6pdLN3He0yyVT4ysYj/dUqgIWXDCApSl7ibN9DMG6mHnbHRH6uT6U/h80diAsCx5LeDbTcGWXy4ewWVrUA53ZVEA3LO0mhY7GdxWUETrzp1Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixvd1qZ93bFSuIJ3Ks37LkG9R2RNrRW9wMv7jORp/HQ=;
 b=cGbBnm1kdub+qCuuK2ASuJk8w2BOhEJjvy1S1zGcocNlxGU7Bkl2FG8xmT4LjzBoPaEeuoyGk58T5msvRddnfZ2dQ2QNCdUPS34OK3QbIh0unYY3dAbRnfD3QL50wVz7rvPQLTyu6WPXi/hEemflc2Rh2+DiEOtn9uXCtuIEwANBiRDziHjyCCr5Qav5CX62EOPLumsFrV0TyYDuuKMaWTG5VNWRYQyXvyYwuRulVGzrTkMj9tu//Q1wEesDKhsL7tteeXXzU6ZIDc6MqM/eh9UIDZivq+/8Q/iG3mPN6junxRzgdT2huQ9VbjtOdqwgIpBQeD5x9hpYxEIPEXA7hQ==
Received: from PH8PR02CA0044.namprd02.prod.outlook.com (2603:10b6:510:2da::9)
 by IA0PPF80FB91A80.namprd12.prod.outlook.com (2603:10b6:20f:fc04::bd5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Wed, 22 Jul
 2026 11:06:35 +0000
Received: from CY4PEPF0000EE39.namprd03.prod.outlook.com
 (2603:10b6:510:2da:cafe::1a) by PH8PR02CA0044.outlook.office365.com
 (2603:10b6:510:2da::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Wed,
 22 Jul 2026 11:06:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EE39.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Wed, 22 Jul 2026 11:06:34 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Jul
 2026 04:06:19 -0700
Received: from build-anrao-noble-20260527.internal (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 22 Jul 2026 04:06:18 -0700
From: Aniruddha Rao <anrao@nvidia.com>
To: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Aniruddha
 Rao" <anrao@nvidia.com>
Subject: [PATCH v2 1/5] firmware: tegra: bpmp: Move channel initialization to helper
Date: Wed, 22 Jul 2026 11:05:40 +0000
Message-ID: <20260722110544.193551-2-anrao@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722110544.193551-1-anrao@nvidia.com>
References: <20260722110544.193551-1-anrao@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE39:EE_|IA0PPF80FB91A80:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c9e7864-4b7d-45db-6167-08dee7e14adc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|6133799003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1znu05kQr84+EBluSu/O94fbj8IZHh31Iy1U0DlUiwWS4KikXtWFjo3oesp789kPKrqjh6W+6EBmojS1DHD0eMTalsLjf4rt0grRXZChW3ySXz9OmRO/PbmSRtRxEyREeKHjwBzS0CzJ4mcSgcLdbucZ8RgJEBkvXIxylbVBGJJlwnBdAwGYSzzQ2Zl7j5XRYcDuWNFHxNkJ+Kqe3PZ1ymatP09Dh2E5TZ80S6Ud+5EraJaRvNztDwSC//ZPtlNRo3tkZOoFl3Wx2jyX3MQGs45N3PxSN33av5yZKbEr5JM1KlLhEHSVGYYqxHcxdTULFXSE2VxB3ZAnUHUUe+BBZtnzpKNOzsb+G9gdMl5m3fJZWj+Z/KFbD27Dr/HVBI3Vo2m+CJ1rWqa+P1zRFi3pRt0iag/Zo5aaYAyCLNDRhSXLYZFAAtt6z/25XbXTNAMQs9iyT/HxzAV7NGSLTW4lkyefJqjdkyR9XDrVf2kTLlKxMY4Icc7OitBUPKpSugDUXMKdNSBDTHk4ZOICM+9zevh0SEY3fLQxDoAgFCVQIRLRDxJ2xLxwixbdDmEuHeOgVNEyut7TFKsvTVD8OQN2fvCvBb4wDJbk1p/N/21FrbpBGm9z+S2FvANUCGeGAP68zF73d6PMKvxsGzDcX9cMRwL9PHShuI+lE6A6zeXPbzVqz5o0iHWJrfYVzDz/tfar+YySO8e3Dy4Ii5zTIcT/rg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5ZC75DTC/GGyMGx009Fd+t4tbjVKCCsl0dNkuLhY2AbfcdR2Lf0thecfefR7DXz8gdWR2Dz2qLuZr56qKrBBd8YPzh2Sbs3OvsoNoHauNSSecTFmF08LBv2gr4e7Y9i2nBMfXNbJUjcgyxSmbKcoYLifCoAnJ3nqWNVNMWfdLDlCSsJqWavekztUVbidFYPU3PK2TSPxRrOeq5ehcYtt0SI/YFuADk0iAYiPJz2SXSMG9yDxyEWn5iIHn2NH0ntD9bemkP9fPoC7kFW2+8qy4WZlA+TeNe9BzFufsHG/4AAdafmD2JWd89WdNB0g2p8Rd3W3ZfC59xtSzKROSrolmF/uxRwAYLrocT9i6x+1AVnzqr5WNpnohW4sIPZSESpQma3/J6p4exWnie0SMi3RE8K9jhig0H1XQeWyFUky8puXHEvYc+yBSqsFBOURxU7g
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 11:06:34.2248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c9e7864-4b7d-45db-6167-08dee7e14adc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE39.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF80FB91A80

Move BPMP channel allocation and initialization into a helper.

This keeps the probe function focused on sequencing.

It also lets later patches decide whether mailbox/IVC setup is needed.

No functional change is intended.

Signed-off-by: Aniruddha Rao <anrao@nvidia.com>
---
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
