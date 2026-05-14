Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012042.outbound.protection.outlook.com [52.101.48.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B585D531;
	Thu, 14 May 2026 05:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778735595; cv=fail; b=DnnWTrtSuxA+a+M+qf6d49mv4+k8c6nJ3Cs1zdN8gtbz4IQwFNWqfSx9bCX+7/NcresWhWvPouwIj4FJMHQpVtsJ3fB6EbWQfKOXvHvyUa6YOmvzTFnF1hqnCINJZGEKJKe4zVrP0obUicj5QnnuON6RtUS/L6EcrWI5AkQbcWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778735595; c=relaxed/simple;
	bh=KzQf2yOpcer7YmZHv8K7zBb1NGfCbr4lfIltcY/6LQo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mbM+jw4zBlTTbSQUS/q830blqd9Qbgps9aNFdQajysTWK1kO/GvXGT1dxeAnukF3PvAQrC4UOsxODtZG7Tk+gwDd/mJqPHa0gL/ZL5WE8DuFjjLMnpLMm3dmjZDdWw4IdPNIbJqDdcD8CuSm0kqxHA6o4r1/GmkReeleNXkL67c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=c7TWzOaB; arc=fail smtp.client-ip=52.101.48.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="c7TWzOaB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GAjn1f/qvA+PM3Q2AQfKC5sltyTsFdg9Z6YUQtAZA8/CWl/JVAOWujn/d9Qxkpu+t9T94bCCZaXq7vvisrfCRTvMEPZsB2BDINZT/hY7sy20mYnN1lpvE396d4Nn+wC7qHEL+NloA72rfGazfxGcsrAzzY6kyyraB5aoIutMrAaYwjzKyCx0Wan73NnyHUgXS+31D6WjIyEZuYK9a2B1XCQy8MH4yjUxBnGKPGsGXFsUaL/N6nJ1eNsn8XvqYNPEtK/7blf4hSHhzwD8Qgy2KV/2KzQtzHkYPdEsuo5tt60o+pDZ4fd5bxGe7JMMl4KFPwn9IoEW3YcYKIh9Jcj5UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yng7wWy5g7HcHRM+xb40S3feZhG0nQLb2xNqDj2r4PM=;
 b=AzY2Fc0Mny9UWvuVPLTGYEF7FSJ8zNZjPVUdr8aciLNdYFX4pP8+Zlf35luerz6inDKuFbRDQCE/IJOYHF8NHnP2EcOE5iCNz+5PpG7yLPdmnATsU4++ySCBWl0lLBB7nszOLrT8+pgoWBHEksZhBw2URlRxN2MYfEJraJKe5RUAe4dwGVLlumPZhPhXWrd/iL5LIeYzlPazGxfceqyy70Ts/61zzJAPsAetzYpS9g91HWiuOSusSe+BATA3aMBjHEsl0QHg7Fy9IuSOqyn0yL3X82mWwSJMh1CbTBkkiJAGAs9mjDclTthmZMFzEtUjkWOI1Z2l717Wdu3MWODZlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yng7wWy5g7HcHRM+xb40S3feZhG0nQLb2xNqDj2r4PM=;
 b=c7TWzOaBekZJqCKVyKudYyYgu28Gc9Lli+nnCSR3qGJLfw9CG8bJtHsIWDTwXRvF6x8EH1A5L2akfMAGMkEqHB74Yi6ParsolOVmi4dQouZhSj1kYlWdkE+hPgWGrXydkqvdtSVEPXRAA1wmQNjhFrJW1aYcSampbbzZ/KW7gkoP/UzMKFpPF2ew+BIG9HrK/XWP09NGYYHXsf2RtYWz9Km/vngpIwk0F+C1GcX/oeGpCJPdG2mHO6ZAGsJIZSKibj5xasSMXdkO7r/q77f+zBd8bHYVFNPyO5ScXq+MntnZ9Vpxovk3ZZKuPKDs7+RLT5Fj4AdU5WRVUXu7WhTKoQ==
Received: from BYAPR02CA0001.namprd02.prod.outlook.com (2603:10b6:a02:ee::14)
 by IA1PR12MB9523.namprd12.prod.outlook.com (2603:10b6:208:595::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Thu, 14 May
 2026 05:13:11 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:a02:ee:cafe::ec) by BYAPR02CA0001.outlook.office365.com
 (2603:10b6:a02:ee::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.18 via Frontend Transport; Thu, 14
 May 2026 05:13:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Thu, 14 May 2026 05:13:10 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 13 May
 2026 22:12:58 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 13 May
 2026 22:12:57 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 13 May 2026 22:12:55 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>,
	<mperttunen@nvidia.com>, <clamor95@gmail.com>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH RESEND] soc/tegra: fuse: Do not use fuse data as entropy source
Date: Thu, 14 May 2026 10:42:52 +0530
Message-ID: <20260514051252.2401568-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|IA1PR12MB9523:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ae333db-60bd-4a0c-96a9-08deb1777e17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|11063799003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KipZWMrIg9HMDErhOK6TwwPI0eREPuC7ZAIGy4RaryzZRsxmwjtC38JjPBOsKNZG7V1B+xVJUIb6L3TL4bjZykV+8d+7ZAu9skhDKTjM5qJLZfmSty/1HIo5t0OnnrHFIkcPGKE4nORW3W2a2SSZOMS6/yC4P07G/N3tNbRFkkpnX4DfB4wrW760oyGOPp+WpLYwq1KVUHT2E0DN2Ve34bMNfnHB9yqqLWHHF0ny6IroI84shaExjLFKlDmoPvyMsi3e966TroGScb5IJHnbpdZGnLkJfbiujuGHqbDBaN2qBVrQZKKdl0x/dJ8GVxbeQhW5erTRWR54M9ipmNLRvd3xRCypShZizkyzX/Mzza/hc5upQex1XYCBoyTN7/mN7NB0K9w4ZKiBDWKBhW4NgI0gGiHQ72+L0f6X6iXtv3+rXWNhchnWfhTV/9GloXBCcyRaq5NiYax03GeDwvEgv6LOnEVYDtcihsXDTptjI0pSrw6BUh7Sn8O7uOH8AcfUPeD3EdGMc8YauU0hDlPfVwfjR/0QIN4/K2ccOqKAj0qyuBn2z1uK7hmb370gwgo3PQo3jwZWISnbm5WqxFP0jHdBEdw+btFeFutjNAkOy/UJNI06z8X/38p0Ccr67klutxL84yfLqI+vX5RmIi490A6TvxTRfCMy0k+OIVRnM1vPt4m8QeO/RRLZPVHMhVYmMqh7G/8QC5vIVsZfH48n8RB7lVaetBMTKsU00JNZ1zY=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(11063799003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9DtVkD5UTF8u0QL2ETUrr8nTDAUsWkQUUPsv3F/6lHZBTmSbIcG04Km6576AtnOR3lUydlsTiFOxrx6TUs0LLJhnnNlOupnl18XZBPp9U0y8yTZJEhOLHxktrgeQEQYi0NEIGI2PUsn3OgZZT7WL7JA/DnpJOMtpNrGJZLsqFa2yEvpnDFaRkrUkGedJd2STCnn3OCtQDom9QwxbG04J+PoTSnMJfQzl5Mu7TB6CfzFZt5KRCYuSWQHu9bO2U+LJ8ReASXxmy4cyE4AOft45+HebVkoM5CXLoB2T1ZpC+4635Fzr9az2+35EV2FyfMdtBurSFqJH93Fpibajpug7gC1SGU2SjRjw2Hk3xXCRo5X6bxVCTq4BxY09P5N9eRwT/mljkTLgSBkLBIEIz6Nx+YdeCxv1uJR7LsrKNPuk8rIf6aVXzKxHgou8tSqf6cm1
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 05:13:10.7124
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ae333db-60bd-4a0c-96a9-08deb1777e17
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9523

Fuse values are static and device-unique but not secret. Using them as an
entropy source weakens the overall randomness pool because the data is
constant and externally observable over the device’s lifetime.

Stop feeding fuse data into the kernel’s randomness subsystem.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
 drivers/soc/tegra/fuse/fuse-tegra30.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra30.c b/drivers/soc/tegra/fuse/fuse-tegra30.c
index 524fa1b0cd3d..2fad8b13a3b9 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra30.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra30.c
@@ -64,28 +64,6 @@ static u32 tegra30_fuse_read(struct tegra_fuse *fuse, unsigned int offset)
 	return value;
 }
 
-static void __init tegra30_fuse_add_randomness(void)
-{
-	u32 randomness[12];
-
-	randomness[0] = tegra_sku_info.sku_id;
-	randomness[1] = tegra_read_straps();
-	randomness[2] = tegra_read_chipid();
-	randomness[3] = tegra_sku_info.cpu_process_id << 16;
-	randomness[3] |= tegra_sku_info.soc_process_id;
-	randomness[4] = tegra_sku_info.cpu_speedo_id << 16;
-	randomness[4] |= tegra_sku_info.soc_speedo_id;
-	randomness[5] = tegra_fuse_read_early(FUSE_VENDOR_CODE);
-	randomness[6] = tegra_fuse_read_early(FUSE_FAB_CODE);
-	randomness[7] = tegra_fuse_read_early(FUSE_LOT_CODE_0);
-	randomness[8] = tegra_fuse_read_early(FUSE_LOT_CODE_1);
-	randomness[9] = tegra_fuse_read_early(FUSE_WAFER_ID);
-	randomness[10] = tegra_fuse_read_early(FUSE_X_COORDINATE);
-	randomness[11] = tegra_fuse_read_early(FUSE_Y_COORDINATE);
-
-	add_device_randomness(randomness, sizeof(randomness));
-}
-
 static void __init tegra30_fuse_init(struct tegra_fuse *fuse)
 {
 	fuse->read_early = tegra30_fuse_read_early;
@@ -95,8 +73,6 @@ static void __init tegra30_fuse_init(struct tegra_fuse *fuse)
 
 	if (fuse->soc->speedo_init)
 		fuse->soc->speedo_init(&tegra_sku_info);
-
-	tegra30_fuse_add_randomness();
 }
 #endif
 
-- 
2.43.0

