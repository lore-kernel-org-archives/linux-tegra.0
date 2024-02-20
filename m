Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2046.outbound.protection.outlook.com [40.107.243.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7591569950
	for <linux-tegra@vger.kernel.org>; Tue, 20 Feb 2024 12:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708433099; cv=fail; b=aG/LCT7cOfjr8nMIgLrH8sm9ms+q68m8xZZ92riUMaUmoq4Yt6Ef1XKi76AEql875dMCm567PxyRlP0QId1wQjM4LmyE/jk8QnJPr3CSCi+CtsRsUZw2QMSZ+pCuUfHrxaZkJc4xjI1uhTPjp/VnNpX2feV6jMuaDG+wjnPxe2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708433099; c=relaxed/simple;
	bh=SPo1/ZhExEHQC50rJT00UGdXHNGHQ6iuQKBXGe3qLVM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=apAxI3TdeiEXw6juagP4urto7BEBVYx95uh0ugjYCkHDp5IlZJ3iQ/5uldoB9jSEXah5btK8SmIta1cW7g90ipMhuvCUrOjLGGw7HpJbstywCHbVRPaOHoYjM9zvYP8Bip4nYN+Wcqec5ybijIGn76/na5QztrwqnHuIOSX8cjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JaU6rT1+; arc=fail smtp.client-ip=40.107.243.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JaU6rT1+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KVFI7jTqLp2o4aCWsm3A6xU6EU5CZ37r5HB7i/orReQOfEo0PAeXUk1CCL4pB5As4es0wv2rfMRLUkSHgmGpFJPU+DocDGmRqiJ7qhFTZJVeLzvMkTurf9be6xGT1x6I0qAus3xvyVPVucXf/TQCfpGTnVQxAC41ghXlNfB8TpDzpdu4+qMdLMZ9mgxXW6h1Fs5Hwp5JMReGFruyXldfS66B4da0iRhtCkNP7c4OlyV6pJSjZYXVj2oTwMFWQXg4hCXzqa+0c711bdHpfN0qkDHRI9Wojysf2AgyuSD5Sl5EySRgi7PoiIEZLU/3dNbDn541E+KU99fQ8ZxFvvOILA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K3T+7QDl81KhVEnPfS3R8S7qJuKP9mcKUZLHaiGkVCE=;
 b=U11M1Wl0XjQ28v1HYaijTXb34kQhz+jT1QBYCwfJSRyOKsBAdIAT1EWVQMKYie7EoXdmP6KBaU6RTs7+DF6N+qxsmIp1fHaCQdGOF4BRtsJz9vzHATcuv4o3cDUA9RCTHetKhZuQ8ZPNcvkcVaF2kbvjJCR2GOaLCrCMm89y8iRTwAk/FBsnXHhc/Rkt30cOa6Rf6he0a0sj3NwUL8GwqmJBi9TeXtn+z2gQygIPEb1eV1MN/m9I2zkYdKrGTkQGKaxAz2h2AJtfvFZ9tWr+fSJNW6WQgaNHDr509RoJlHozCZ+/1hE4XFA4uXrboQ9yIbkC5KSu6jZ9Pnsr1/zkWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K3T+7QDl81KhVEnPfS3R8S7qJuKP9mcKUZLHaiGkVCE=;
 b=JaU6rT1+dIX2zVono0cr0FmAgVqZ9UTLSbuOaVFCGRXryt4UaBH8bN076MSTszrr2yqghkUkHZMo3pGgDIqQQBkIyReQO0O8FapATNONhcdfwbBbbaxpAqDL1FfDb12St1UlkIJOZt6ev5hSGlcxQSWyZ7xytPPSgQZ0/oKPSWtjrB/wxGaR05fNNG82lmLVPoaUh2gLJdptdYTetdkEBG7vsCRvbluizGtT1oaeJIzwkqz9jCIwz17ecUdyOWQsMEEpxXEK5wV+Ty772O1k8Tt2tyhJOElzhUYbSTiVXGrHfbjsJt+vUNRIxDWUy9O8nl0tdOqoGsZfXdnuoKqcUg==
Received: from BN0PR04CA0092.namprd04.prod.outlook.com (2603:10b6:408:ec::7)
 by LV2PR12MB5942.namprd12.prod.outlook.com (2603:10b6:408:171::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.20; Tue, 20 Feb
 2024 12:44:54 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:ec:cafe::f3) by BN0PR04CA0092.outlook.office365.com
 (2603:10b6:408:ec::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.40 via Frontend
 Transport; Tue, 20 Feb 2024 12:44:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Tue, 20 Feb 2024 12:44:54 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 20 Feb
 2024 04:44:33 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 20 Feb
 2024 04:44:33 -0800
Received: from moonraker.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Tue, 20 Feb 2024 04:44:32 -0800
From: Jon Hunter <jonathanh@nvidia.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Thierry Reding
	<thierry.reding@gmail.com>
CC: <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2 1/3] memory: tegra: Correct DLA client names
Date: Tue, 20 Feb 2024 12:44:28 +0000
Message-ID: <20240220124430.19072-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|LV2PR12MB5942:EE_
X-MS-Office365-Filtering-Correlation-Id: b88ae6da-5b9a-4e96-d0b5-08dc3211bcd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CXbw/ynhtQGBihXpCK6+JXtj/caHjj/XVzzQf31Aw7NtJYaiANXzCW+oCwwFBJhuS0n3DDP43MurXWqBHRc5DQeB3ycVKGC5ifXHt3ADlOApq7WoqmRBr38nbLT8rfGWvmLkjHyXyh/8YR0hyXUZLer9i7NYxfvvjf2e8tBiCUL44H03ZEDPvnSOB/36MXHotARNrj1dpVUTgTla7Ie0+7IIqtXTKztAGg5EmvKGhTmbaHRJmCICp+sOcv8stgwstuF0y/D8ef3KSZQMP1M39dolFVTkegmHlsL+0Zv04YcFNFszRnwueZ87Q+4jKxmuD6jUNx+ZXrxK+sBcTjQD3fRtyT4SRzokM5/kK6+ERQSKHksO2kAwMAE3jLF8vE443KVy6sXBS/VO7RaAU0egI0tPHLlWkhCEsX1YVyf+/Cz0V/bAE+1h7xh/NB6b60Re/Cec4i/qLmAixqRVC3i+54oVGZhGHgZ9mS0tUKtzyDG8PqhZpODtUW1yqVePVJvtAJZuAaQspthAtDJ9xPMe+5pVGDBIxnTP6JBZnmUgqW14yfTQS5yywjKxSHZwyIOlkkleMopjxe+KTXK1ZbWXp+n0CAQ9VuY8Hg/GBwcJysVUrqwrZd15Om5M91NNUlz6PNTS9VQqXqjQaucR3f+Lu1uRvO69TS8w+eMaIfOxvuE=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(36860700004)(40470700004)(46966006);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 12:44:54.0383
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b88ae6da-5b9a-4e96-d0b5-08dc3211bcd4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5942

Some of the names for the Tegra234 DLA clients are not unique and do not
align with the name of the client ID definitions. Therefore, it is not
possible to determine the exact DLA client from messages that print the
client name. Fix this by correcting the DLA memory client names for
Tegra234 to align with the name of the corresponding memory client ID.

Note that although the client names are also used by the interconnect
framework, interconnect support for the DLA clients has not been added
and so this issue does not impact the interconnect support.

Fixes: 5cd24ca0985f ("memory: tegra: Add DLA clients for Tegra234")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
Changes since V1:
- Updated commit message
- Fixed fixes tag

 drivers/memory/tegra/tegra234.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/memory/tegra/tegra234.c b/drivers/memory/tegra/tegra234.c
index abff87f917cb..b8a7af2d36c1 100644
--- a/drivers/memory/tegra/tegra234.c
+++ b/drivers/memory/tegra/tegra234.c
@@ -121,7 +121,7 @@ static const struct tegra_mc_client tegra234_mc_clients[] = {
 		},
 	}, {
 		.id = TEGRA234_MEMORY_CLIENT_DLA1RDB,
-		.name = "dla0rdb",
+		.name = "dla1rdb",
 		.sid = TEGRA234_SID_NVDLA1,
 		.regs = {
 			.sid = {
@@ -407,7 +407,7 @@ static const struct tegra_mc_client tegra234_mc_clients[] = {
 		},
 	}, {
 		.id = TEGRA234_MEMORY_CLIENT_DLA1RDB1,
-		.name = "dla0rdb1",
+		.name = "dla1rdb1",
 		.sid = TEGRA234_SID_NVDLA1,
 		.regs = {
 			.sid = {
@@ -417,7 +417,7 @@ static const struct tegra_mc_client tegra234_mc_clients[] = {
 		},
 	}, {
 		.id = TEGRA234_MEMORY_CLIENT_DLA1WRB,
-		.name = "dla0wrb",
+		.name = "dla1wrb",
 		.sid = TEGRA234_SID_NVDLA1,
 		.regs = {
 			.sid = {
@@ -699,7 +699,7 @@ static const struct tegra_mc_client tegra234_mc_clients[] = {
 		},
 	}, {
 		.id = TEGRA234_MEMORY_CLIENT_DLA1RDA,
-		.name = "dla0rda",
+		.name = "dla1rda",
 		.sid = TEGRA234_SID_NVDLA1,
 		.regs = {
 			.sid = {
@@ -709,7 +709,7 @@ static const struct tegra_mc_client tegra234_mc_clients[] = {
 		},
 	}, {
 		.id = TEGRA234_MEMORY_CLIENT_DLA1FALRDB,
-		.name = "dla0falrdb",
+		.name = "dla1falrdb",
 		.sid = TEGRA234_SID_NVDLA1,
 		.regs = {
 			.sid = {
@@ -719,7 +719,7 @@ static const struct tegra_mc_client tegra234_mc_clients[] = {
 		},
 	}, {
 		.id = TEGRA234_MEMORY_CLIENT_DLA1WRA,
-		.name = "dla0wra",
+		.name = "dla1wra",
 		.sid = TEGRA234_SID_NVDLA1,
 		.regs = {
 			.sid = {
@@ -729,7 +729,7 @@ static const struct tegra_mc_client tegra234_mc_clients[] = {
 		},
 	}, {
 		.id = TEGRA234_MEMORY_CLIENT_DLA1FALWRB,
-		.name = "dla0falwrb",
+		.name = "dla1falwrb",
 		.sid = TEGRA234_SID_NVDLA1,
 		.regs = {
 			.sid = {
@@ -917,7 +917,7 @@ static const struct tegra_mc_client tegra234_mc_clients[] = {
 		},
 	}, {
 		.id = TEGRA234_MEMORY_CLIENT_DLA1RDA1,
-		.name = "dla0rda1",
+		.name = "dla1rda1",
 		.sid = TEGRA234_SID_NVDLA1,
 		.regs = {
 			.sid = {
-- 
2.34.1

