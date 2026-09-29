Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011024.outbound.protection.outlook.com [52.101.52.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC3F2D0620;
	Tue, 29 Sep 2026 09:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790676001; cv=fail; b=I+2adcs4Ab481iijxgWawfQXiwCbMQre+IrObUwZ8twcrfaH8C4brcqRNT/qNLhiZNf9p3oAmTvLU/FS2iuOebQp2NYvrtViDi2I0HM36a26W6HE2VWl2SedohdqUoUcoj49IkrGIHHo9o4cElmxGeeid6NGzs+RTPJZFwjZV9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790676001; c=relaxed/simple;
	bh=TzCnywfxM/8FFfWdfnFgVBTEcZxcvj+O9zxfl6XvkMA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UvGbkuHSd8yoI+onrxDnpKfxD/mrVg5bt76ued4Aw1Ex5Mzy6Fh9smbKOqi/ryfG5liVIMxMLyVoApH6MHU5igKCemc8gJymHAmvpk/cJYwVk4B8dSwfC/LLiUuklvffSYtuxhUfVLvDvWpL+bPwBvQKlq2Qpb6j5WVAgKoTK6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=k9PLE4wb; arc=fail smtp.client-ip=52.101.52.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="k9PLE4wb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d3WlSxT45yna15L18tEQnDNq7jAHCIffrgQegDmO4YqmYyRkywNqQr3/jmsAGrToodcLAk1hBpG2uwIZwjfCh97yuFe172ewY9d4DIFjSkfKwdV5uodw0EcvcQ1rzm7C9Gq/lBFb04AxnB32Qb7GFhWmNhRu6ZIE+vKqrTXpzF4372lu36EfQoFguG3DxIhTbDC0nl6I4rD1xTuBzlOkBA/7C/5Xt6HTK6ekCEbF5xX9y4ZGUybywrygkgzPkfA0swmr4HA1aKSExSgNxSqmiyRN0SYWWkvmcWMq8Mi+GGAX614mPpa+iV7t4rWaRTBioZAmGh6/DzO9SEdsCpCWqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6OMQmEA+jFytPv97Feq9jcwp0+TVzLZ4tx9R8cVnpK4=;
 b=AtCQpKF8DkqE1cLiwrZDEYR+lbkeAOBm7YvfwT/INv5riuGSAhSqd3zNALXJLgE0x3qZe2m1PaMo4u8YqETAbJB8SpKVGmsHsVhg0A0fUhsnP4ft/SFuGppRVfBu1QqvQDBJ3yRUEHOWZSBSq7BKPKFfNMSxNicRnq4BhLTuWdTEzAjiFfv+V1alGyiGxhpmtV8fi9+bqjb7t9TTeTbOh8n2SzgtvAhX4BW5OuHvXIGNs42DCw2kLkGsIjHcfKKNEZQMyEsGy4NNusZeKgxwNJa4w69mESHaCdYC0Rgvjha+A3YIZGCz2YP53mmESSwnPHMQXN1zjvevIB51F9W2Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6OMQmEA+jFytPv97Feq9jcwp0+TVzLZ4tx9R8cVnpK4=;
 b=k9PLE4wbrOz0iuT+ZkVbKpm2re5LOpQfUzDRpkTNZzVHciPzaBx4aT+r5soyw2LNESIE9jPtGxrzrkXc/Y1bC/AuHEUYe71jHcajYJR/NesY8zeb+4jI1hXbW3Gq4mfeNMlIG0vsXEUu5NJahHRtK1pdXfxqjrsbovpkBLMvgdWESgbI3A7ucdebmpGi6daeHU+KgC1PuS7rUTlSVy3CqgOAO4xItW03cwm3uTMGFTNunF42o9Leqp37CQJjiMIujePIffQaiOdYQnn29yTZoVjds6UdyCf3ITbCGMrWUgu3DhtRj1a9muZapNsn6oOiDsa35Js1vyxUsKIlI1yTIQ==
Received: from CH5PR02CA0024.namprd02.prod.outlook.com (2603:10b6:610:1ed::6)
 by CYYPR12MB9013.namprd12.prod.outlook.com (2603:10b6:930:c2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 29 Sep
 2026 09:59:49 +0000
Received: from CH1PEPF0000AD75.namprd04.prod.outlook.com
 (2603:10b6:610:1ed:cafe::75) by CH5PR02CA0024.outlook.office365.com
 (2603:10b6:610:1ed::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Tue,
 29 Sep 2026 09:59:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000AD75.mail.protection.outlook.com (10.167.244.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 09:59:49 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 02:59:33 -0700
Received: from build-anrao-noble-20260906.internal (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 29 Sep 2026 02:59:32 -0700
From: Aniruddha Rao <anrao@nvidia.com>
To: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Aniruddha
 Rao" <anrao@nvidia.com>
Subject: [PATCH v5 1/5] firmware: tegra: bpmp: Move channel initialization to helper
Date: Tue, 29 Sep 2026 09:59:11 +0000
Message-ID: <20260929095915.2215685-2-anrao@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929095915.2215685-1-anrao@nvidia.com>
References: <20260929095915.2215685-1-anrao@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD75:EE_|CYYPR12MB9013:EE_
X-MS-Office365-Filtering-Correlation-Id: d676f6a3-3a44-4634-2c6d-08df1e106666
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|10067099003|56012099006|11063799006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	iQ1DAun8pQVXznOmSsE0arBTLr/KrxJy+YrVMREZzfYWcKXj8d1anstXUr8GAjiEIDJ/IH80Ge5ZAqA8Mo+7i8KFE0soDJN6pVxIC61b7BRrxHhMdjq5zyc137x+sA/Ubwplzsw3B8k0XdynfNEc/4qTJ3YNXPFoOJX4vNLbVmg820P5pHdyEbxiUBcNvZ+LOXLm3LxJtCJ3lLVXToqv6f+CQMB7V2Xg6ZXegoTIwDTsCBshh7sVo9w9PT+9lb/VAYyYpYxAcajoa/6kcDDrgWBQCC2QrFcVDukT067z57H5AysAuWrgtUxgbQJSznmqo3+t8FNshEY7rqvZSBMXpQ8168eyDl3KZrmKxuNTGxhM0POrGvUxPOYBUagj/jnG+CPEP0zihVfh99WWk3iOKroSpCAWmvORKoQ0jYKuHGN3/drbL3V58aGP9KqgQchxPRZLL7yES5aOTNDgAN7yXcXn1hcb/hGpGR3Epehu6YTRlz57YJHHrAukaTw+OJ/d6BbC9CpT3tTy+P2ejfrKOv84ypvV6lxqqVi7lKT5LCLCtBzUQI0bu9Node7r3qFIHNsHTzV+/HGVmBgxZvUpaewIm0bO4tdoUWtTBwaRJ0AIslT6ZXT90Pcaowjo1qe+5W1Y1h13Com38/Q9QrB+DsOSwDRQnGpQwNyEjh2uBAhjsUG6xuB8fIbbgzAQDCs3kXRSzqHou3m8e+sEm8nyfA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Gw4bKslY7SslhsQtlw2qEGLFoNBMFseNDA8XF8EuTylGA18eAJ6w/XWWnEadglaSYG71sAhWwzCaFNeq4ILsFzUHS4SxkFFRDv/BTgH5u1hzcYfRjR+bspRoSsEJTTLL1u2LN8UC/eJwzfvV8px8meHnTBf65c2uyHaKZN1B1+fy3vQHsAvSSFI8+6hj5jrlNrHxVoyROzi+vRws+nrLh+Dloy3rxwPcpZi452j9Xhz6GRW+cm2COmR0Vs1hCG6I0I5pGAvf9lXjFjwxqwNO6x4hhj3+1ETSczKCfF2OBaR7xoIr48q03NIS316sfGmBu15Oh7vG0jIy8J9YAvNWnLZVWUDnGGYobRkG3o5mn7qApDtcF7RyYNtf24gq/QWf6GB92kngf1wLAA4EJ4o6FEMqBtf1mWAYZ2MaGvmTpSG7tTry8XeOciknXDbWBMjx
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 09:59:49.4594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d676f6a3-3a44-4634-2c6d-08df1e106666
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD75.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB9013

Move BPMP channel allocation and initialization into a helper.

This keeps the probe function focused on sequencing.

It also lets later patches decide whether mailbox/IVC setup is needed.

No functional change is intended.

Signed-off-by: Aniruddha Rao <anrao@nvidia.com>
---
Changes since v4:
- No change.

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

