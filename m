Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010056.outbound.protection.outlook.com [52.101.85.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872CE2D63E3
	for <linux-tegra@vger.kernel.org>; Thu,  6 Nov 2025 17:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762450392; cv=fail; b=UIDx1VyDfHgkQvSR3Od3wHiAkmLkOrDPjTlua/QhsvdBQ10O7Szll5UBWztnV/gH+C8AnOFNe/h1ASZ7PGp5WUJbqVe8rEUUqT+KeC65LyUqFL4SROYfYJrLYaMqwfk2dmBnkdO4+KrISwlQB0y+gzipxEhM1EYlEa4tFrivjBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762450392; c=relaxed/simple;
	bh=GMfkHWzHj9oY9qwqmoDCihtPpnqIFtalonxLoycghfk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NZ6gv/UJ2n10oafPCQ0YSYbWqXWYSig2y/7+SaW9i6sm+cdtrrwJ0sKHhIB2BSjA+qLNMQmwPB3iZbnDvnCqf8OFe1Ui7k1Gv28lkUgrDk/5tGuccGJ/8xSRgfip3pJ64G1DYa1iZP3QQ35XL7ntqhKrceyx+8iE08IjivhaIcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lt7IlBG2; arc=fail smtp.client-ip=52.101.85.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lt7IlBG2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OUYC4xbCT6/vKgEaQ/VoAE+RYYyXkHZKtb1RCfGNOThbF6ROSsaS+Icyi3xxfPwbGkdUqHvXSj7gba8+1Ocd8TGZcMP2lTMlsAXwEojmnntmOmsYoZz7coxMe/gHxlisGPL0DYi0viXxt2IkDsf995oYPnH9LWzttun8BEAKs5EQG1ONjmdnmQm7s7x3ACwPkxIDa3+/q4I1hNJO3QovAF4NhckVjV1KS/6prLPfhalq4kl+tWh6pS9Fhz5tPjMqZIO5ABxlBs0U59tWBoGY7PUCzs0CY9HAX6RZRVF4XMoJIGc4t8L4ouOOjL6v8Oa4o4J++0hZLU2hTkzMfYa14Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dq382SCco/Ic0obtxfWt1am3ZAhqUQaQvSFhKYvbplU=;
 b=q7zvxkqZjknlFTLJuNa5A9jQUQD7Z//FC2AVwVKvyQYe4FkOSaapcPpI/Re+xGCm+iktkXVKwVljuDJy9781qIgrU700ZuQxLbCgMtVM3hQSvhbyd1+tuE9w7eiJvB7vcZurqx9fi46hQH0L4Cf7pFnUKz4IsCotycfyKYRe1FZUnnsAdhBQ/6iWLkvVgGesO8zkZNmQ6MFtqdYcVq7eTlj3YYANvdcip4ILjaBgkxuVKTbsPYiiHqvp/FY5MXSXfonU2xvjvOPkShcwrzgAgnADmpSWEKv4PGjsPRsGriIWbMrUKG62zIiEuptsPTV75xdkBzRkGDp+7B8cgkwakw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dq382SCco/Ic0obtxfWt1am3ZAhqUQaQvSFhKYvbplU=;
 b=lt7IlBG20t7/QqV4ByjxuavfETfETLh1hED66IrcHrvlMKM+fPG0WvefLU9gWZcEKcjcFDFRC/ap+81vC6rGDcUbXFM7vk4bm3KfFCW2lVNal93L9CK9UXQ7QaAu9zD6fxfUK30g8DgXeEYXgUHUAIo/8gwHGcQ8CHIU47EUQ6rU4ThP8yQxm428bMd3iULfl9KHyd6tXyQnCh2p46eT7wB0OS3zg+FiVkdwDUJ0BxHmVO5rF+gnlX0ulHXGyHPG4zgqILqbtffml7vV+bVGPXo0xqe2Y4h+xLfUxdCNeA+A1Dmi4sjDx9blyDsPWj8swyavubBx0H3UP6PAFMWnUQ==
Received: from BL1P222CA0029.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::34)
 by SA0PR12MB4448.namprd12.prod.outlook.com (2603:10b6:806:94::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 17:33:08 +0000
Received: from BL6PEPF00022570.namprd02.prod.outlook.com
 (2603:10b6:208:2c7:cafe::40) by BL1P222CA0029.outlook.office365.com
 (2603:10b6:208:2c7::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Thu,
 6 Nov 2025 17:33:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF00022570.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Thu, 6 Nov 2025 17:33:08 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 09:32:44 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 09:32:44 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 6 Nov 2025 09:32:43 -0800
From: Jon Hunter <jonathanh@nvidia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Thierry Reding
	<thierry.reding@gmail.com>
CC: <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2] memory: tegra186-emc: Fix missing put_bpmp
Date: Thu, 6 Nov 2025 17:32:40 +0000
Message-ID: <20251106173240.1724099-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022570:EE_|SA0PR12MB4448:EE_
X-MS-Office365-Filtering-Correlation-Id: c049e7a8-0e3c-418f-820b-08de1d5a8d09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EPVci4jpPiCOC2yiWMMugVcB6Um+44OetASOUi7SR28CXJwOjhiAOrDegN8F?=
 =?us-ascii?Q?WdYve+fhlc+0jRSyR9jcbSyOP6HO7Id2c2TeZwu5J5vUGGm4bHP5dD6/7kHi?=
 =?us-ascii?Q?ptwyG0arQ4XYLEqfh9YUmdwmZQVZHXRLesyNwN8kH0no5J6UPQmz1P1SC/y9?=
 =?us-ascii?Q?oy4fbP2lBKurgRijK8vMa2IuUZQ3jQM1jDBdDNXVovY//NMgwxM0+nLy/xTZ?=
 =?us-ascii?Q?+yW2/4PM6gDBQA1GuQpMoAX1dTuamExzdFMpWB8q3bPRwoGQ68tQMkG+JbzL?=
 =?us-ascii?Q?xydKCplzu0VPIM+xEYpjJdQhfRJZocAumBtPbun6ERz6NprlgYo0A/FCfmOx?=
 =?us-ascii?Q?f2/1yvTL7JVgEFIPGDkb1hm9V0NCvm5igjqt0QfnUUlEKSYdkuLhBOdwpGMA?=
 =?us-ascii?Q?oNT56woWfvIpZW/fPKEfCx/79Kpc48dVelGyV9JMfo5dr7x6wOQgXSKYTO4z?=
 =?us-ascii?Q?4XYuHdC2zlw6axBLuoi7HZs/etc3G4HYQBbecqY8/WzoLm6ehmiIHonLwcku?=
 =?us-ascii?Q?KMg6KNPYy6/dv1LjHD8AEDcxr0Ero/qMlZ2E1ch7If7DsDQlf8+LO4o9BQpk?=
 =?us-ascii?Q?OweAHH6fDlxyUxbVo13FBUC1lGRfKAyg6+wTzRU0drLvHYxZwSzk4lF2e8PB?=
 =?us-ascii?Q?MG97eWwfFmvjRNkhG/LdkbTQTSNQ8e49qX3JOi2NcheFTcNu9ty2UBkfFpUc?=
 =?us-ascii?Q?4QGEvGk1qMsWO2qrMFB1yOdV07MUtWk8Ove4m2FKDi/euy1le9GZK5zci1+l?=
 =?us-ascii?Q?zXuMpUlZxkXSNyaAZ0ZNzPtRIKfBG6JQYArsFoIMl32aZ3svakOIecxinS51?=
 =?us-ascii?Q?ZUgMTuPToXUi4jOOXEgWWSua9hXHMN31hLABUUVr39lbkwYMcMKagpLflSqk?=
 =?us-ascii?Q?CB8Z0HCIdL1H571PLf7xWGWyy1dSnHRuwSpFC0XSHIFVc55H+c61MO5mKNRR?=
 =?us-ascii?Q?lBE9rdEyQGhxRcBChWexLcSB8yykjeUe8fWKbYnb1oZ4a0PeO2pjeO99WMur?=
 =?us-ascii?Q?5mKuaUgTuaUIRGOLBhBvgShdJ5TSVi+8Ts0omtpb4xNHwSYDRIQ1LdKnq0Kz?=
 =?us-ascii?Q?11lq4r5QBKWPNAml1tg/NfvPHnYCgo6LaZoRe3IJhLXJSnyY/Fkp6cZbZfqm?=
 =?us-ascii?Q?1eiWAFZO18yjLvJ6WV+QivDKH0PFrRm5s2Ori/ak7XC+2W50ojVsuN7X7/HO?=
 =?us-ascii?Q?PrWsk3wS62DP66mnBQtb3zJXQJ8IZt1Wp9TztAZT2yPMVVog/DeemtM8Ugil?=
 =?us-ascii?Q?3PMjkWrf7wgNrntpKw6GzxaSu2lEeCTqi50ABIKI0797hfzanAiFBkRk2BgA?=
 =?us-ascii?Q?FbxsfbEeAzIsSFr3VOdGZDNS0YIhkM7kKAh2cPeljim+1/ZS4mRDbGT5F5Uz?=
 =?us-ascii?Q?ERWzoD/ectCEDdfFHPSlestD8LQIhq0lmkPNxYip5TM22Xqtga+icICme/2J?=
 =?us-ascii?Q?y34P0r7IZsuSrCmKoqipfydSObQJGIsMFJeDPpykVx+HhtDnYg9NzBpR2m2P?=
 =?us-ascii?Q?1hyyLsFC0PTKURNlIlbddedVosC4kSsbOYXteIJGS0inGnUg7DD9aS+TkAOZ?=
 =?us-ascii?Q?bJj+7xV0Zs+LNCaGjBU=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 17:33:08.1492
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c049e7a8-0e3c-418f-820b-08de1d5a8d09
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022570.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4448

Commit a52ddb98a674 ("memory: tegra186-emc: Simplify and handle deferred
probe with dev_err_probe()") accidently dropped a call to 'put_bpmp' to
release a handle to the BPMP when getting the EMC clock fails. Fix this
by restoring the 'goto put_bpmp' if devm_clk_get() fails.

Fixes: a52ddb98a674 ("memory: tegra186-emc: Simplify and handle deferred probe with dev_err_probe()")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
Changes since V1:
- Fixed dev_err_probe message format

Please note that the commit hash reference is based upon the hash in
the -next tree.

 drivers/memory/tegra/tegra186-emc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/memory/tegra/tegra186-emc.c b/drivers/memory/tegra/tegra186-emc.c
index 74be09968baa..43595fd9c256 100644
--- a/drivers/memory/tegra/tegra186-emc.c
+++ b/drivers/memory/tegra/tegra186-emc.c
@@ -448,9 +448,11 @@ static int tegra186_emc_probe(struct platform_device *pdev)
 				     "failed to get BPMP\n");
 
 	emc->clk = devm_clk_get(&pdev->dev, "emc");
-	if (IS_ERR(emc->clk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(emc->clk),
-				     "failed to get EMC clock\n");
+	if (IS_ERR(emc->clk)) {
+		err = PTR_ERR(emc->clk);
+		dev_err_probe(&pdev->dev, err, "failed to get EMC clock\n");
+		goto put_bpmp;
+	}
 
 	platform_set_drvdata(pdev, emc);
 	emc->dev = &pdev->dev;
-- 
2.43.0

