Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011044.outbound.protection.outlook.com [52.101.62.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE94A3ED105;
	Tue, 24 Mar 2026 11:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352611; cv=fail; b=msX2Km9vo2LYO8DALWcR5/qtPJfJ+ONlmqDUr7AyC7GH4M/jt9RYtorXKlwfnRYvBLouQERA2T1y0GiSbPrrE0+0A++z88YK4Fiy8ZV/1LAga35e6jKnsfKSeAX9ygcZJ0eTFcYQZ+PWQQdEJ6t5/E9LW95yDFFI4AZb2ORoZJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352611; c=relaxed/simple;
	bh=9RQVyYjQdHAZNwXNIvCD1gjWP+yX5K3COrViZg90RAI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mHqDjtlDLFAljhVnpFJHZL2eHalz+wnl8lqRLaNC1DpdV+tuOLfrdI8iWfzxXl2OoyIQjlAqPK/6Z0Z2e4leAXEyFxs06KcXC5+k53PfMni1TXlVAYhqm6Ok4UUjZf8NK689Hr/nOW7JJmKFZR3mqMppaqn/gJ2K5Ib0BA49dmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kDU1UfaG; arc=fail smtp.client-ip=52.101.62.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kDU1UfaG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ffUEx/L5/c4eR+wjZiXDdNOR6AOClFSQFA6joVO0iew6LTaL0B0awi18ib9f6OaEPeJZ6X+s9zfzpJjNkYwxSiSCnDRIFBkHyUduqSewqd2pg9ORVeaBJ7i55zNhrLndP3gtugNII45SecofRwQIBSvqVMorf07X1KdVPieB0/fO6Mcur/7Mf2GK2mXaP3as0OTIeM0jBYrpboLjCKdSBhlGBHwK6ApuMTXQpHPpRV3qvo5Pa+tUdk80lWiQ9LLPKSvWX/OTxOGe+7JzzskQAWoef8BhOQ5KOOZRlaRihVnHPN0guVFeyGFtr55YUBNHNNGN0iAnntzdlpJcppJFBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mue2dU3xSACewN9lBvp/6YPIOW8w9z+JBoR70uKBD2w=;
 b=Mq9sxpTcG2yqx5C5yCpSc/6lTTeFNgireHn8wpvfVsDdwd19aLXWAYDPDv56D+rj+pog4OKu2InW0cV2NhXT8YQ3tfi89syfaJlVImu/F55JfImE1xxuGaUOxcDcPLR+T0MuZmfna1U3tjd96RjgQvkDsbS6/WL52XnAd6Lri25Yo9MH8o5Ow2jAlqZkjtjydQp1jTn9GZBfk0G9ici/QjXGBTNrLk9/m9z56o4qb2qUGZEbM/Z17Tq4y4xo8xyyI05drUPDRBgSyVz9hbMXIEf/Rwn2SVdwepI58qWlYI1VaAbziKoisjWaa548itNkZp1zVJFPjxrxDpANOws20w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mue2dU3xSACewN9lBvp/6YPIOW8w9z+JBoR70uKBD2w=;
 b=kDU1UfaGlMTfvvlQGBYmppehVXVhqoaY68asygmUqzkxyHRF775ZYDj5gvgndk5Q6WOcu6GvdyQTwJ15Wn3mxGv6KkJ2rN0cw3BVmpR6/lLdAASYa0GjuNi7u/bNCabCoGIQQ/yTJaR9bFWpwXbeHdLiTIxZXFwp1D2uuFIkQVok21cjpILo41A2o8knThYYTjsu5+GcOBGo8ctBKbNvKek9qUJSeYYEu1pR9dPoegVb5QHDQb3TrkGOKtz+JQFYd7CMJJ0809Xc+nLFAFpbKjcntToqAFYYocfbxEWPJELo1a+E9ystJ77xzGP+Ly7aFPDeUQWeNC9xNkfpfCu46Q==
Received: from MW4PR04CA0136.namprd04.prod.outlook.com (2603:10b6:303:84::21)
 by LV3PR12MB9440.namprd12.prod.outlook.com (2603:10b6:408:215::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 11:43:24 +0000
Received: from CO1PEPF00012E80.namprd03.prod.outlook.com
 (2603:10b6:303:84:cafe::75) by MW4PR04CA0136.outlook.office365.com
 (2603:10b6:303:84::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 11:43:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF00012E80.mail.protection.outlook.com (10.167.249.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 11:43:23 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 04:43:07 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 04:43:07 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Mar 2026 04:43:05 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <kkartik@nvidia.com>,
	<kees@kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] soc/tegra: fuse: Use device-specific instance in suspend/resume
Date: Tue, 24 Mar 2026 17:13:01 +0530
Message-ID: <20260324114301.551949-1-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E80:EE_|LV3PR12MB9440:EE_
X-MS-Office365-Filtering-Correlation-Id: b3b4df72-7b21-4872-bf1a-08de899a8e1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	BpUELvAqv3mLzyHpeV2shqNGDbqpu9g7WQeMPFKOIMICytnNNI++vGtEgGBI7W6kxOiwZPbo4iBG+hfqRgl1Xl2KHBMtuSA0Tz3u7vqyiHE+2RHlOHYhlCn3dTtUS36fXaPzTjZhjSZLzJ70p0ErSOkkeIZtkmZao4H3cg2VilkAJ16aFkUvrX/LLyQTRy+9KCZ4Mz8y97m5RY7+HAoM6H9W+NnN4blqa6dhxaLbyMAHNvxVAksOfNVhpUA6AwVODxhVb+I9qhmdj/sy69kPASux8+UInmlttNBjm7fMkNZd5+E22j4KZxUj3CfzKNa7apnjW6cINVQPixe2p4PKGWW4Z5YUfQMs7l9wyW8scuagG9SJdlbMBfHKVL+vQWx/+3R2q6kNVf0ru6uA6DURRseKzo0jM48HNJey/TZKzlK15XOHecbhFwC0npflFnc2+Dw/dZkH+ZUFPrF0eBY5dgooLCxa9YFC3tuDCxMNzLAjRyWS/MFbtlznixAiek1gMrSz5qdi0Z+K9Vi168sWkeI+4WjPXw6A1uonRnh13I9VQmcvH8qSuUSJP55j0iCKP1tuPlTesKmujAJWzwhLS4VNc34CaO38AnCoxjVgaXOX2z5jlLs5s39LYX5w3dZKM6DrpUOvN1hTdLThMDLq++r96WvyHm7eyzANFmciNm8yK+3Uqj1Jk9fnJZfIluwB/ZzljydehdyxNkDRpvcDiRNZaT0wWzmPe7LocqOXJgaC+rXu4f+uTYGbCxa6aLgHxmYJDAZsoxM4Ef2DgpVslw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KhTN6r04VJb/NBmEdQW4G9Wp7Duayf9VAwA4m05dAJLE55eIDDEdNOy0XLCOqvrSIEN3u0LC9YmefJogqsN3lN/erCsx2PEB4WELimi7SbiJc8wBrrRrHDk7gcFcL+P3crqanOBZocInAkHfuJMW3mlpEMaA25mWRrG5W1+PqMTTYfzrRkeVuF43rep+ne7JEoJh8X75SkpLEwgUuboU2mcSFbVx2Nqmu8nsiHVfceW2MQ8sMVM8GnUMsMg7B6QAZozxh6JZnChZ5yZY620T0ccEYGOTxIfvj9PV7Q7qbBo5J66PGVevsPUe2bUrwQk6+8MDQ8fj0CvCyLc6N6Fp0V4a0ErDZD5M+n97oIlPM8hEnY75yTCYFA+gPSDgRbxg3Yg58qydWo2CRFNFVTmJbiZIXBibms1RiKvmWK0LlDhDWLHL4jx1y2pOJHpsZtPv
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 11:43:23.4067
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3b4df72-7b21-4872-bf1a-08de899a8e1e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E80.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9440

Avoid using the default fuse instance in suspend/resume callbacks, as it
always runs the suspend/resume callbacks for the default instance rather
than the device’s own.

Get the correct fuse instance by using `dev_get_drvdata()`.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
 drivers/soc/tegra/fuse/fuse-tegra.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse/fuse-tegra.c
index 291484595dcf..f38107d04ed6 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra.c
@@ -259,6 +259,7 @@ static int tegra_fuse_probe(struct platform_device *pdev)
 
 static int __maybe_unused tegra_fuse_runtime_resume(struct device *dev)
 {
+	struct tegra_fuse *fuse = dev_get_drvdata(dev);
 	int err;
 
 	err = clk_prepare_enable(fuse->clk);
@@ -272,6 +273,8 @@ static int __maybe_unused tegra_fuse_runtime_resume(struct device *dev)
 
 static int __maybe_unused tegra_fuse_runtime_suspend(struct device *dev)
 {
+	struct tegra_fuse *fuse = dev_get_drvdata(dev);
+
 	clk_disable_unprepare(fuse->clk);
 
 	return 0;
@@ -279,6 +282,7 @@ static int __maybe_unused tegra_fuse_runtime_suspend(struct device *dev)
 
 static int __maybe_unused tegra_fuse_suspend(struct device *dev)
 {
+	struct tegra_fuse *fuse = dev_get_drvdata(dev);
 	int ret;
 
 	/*
@@ -295,6 +299,7 @@ static int __maybe_unused tegra_fuse_suspend(struct device *dev)
 
 static int __maybe_unused tegra_fuse_resume(struct device *dev)
 {
+	struct tegra_fuse *fuse = dev_get_drvdata(dev);
 	int ret = 0;
 
 	if (fuse->soc->clk_suspend_on)
-- 
2.43.0

