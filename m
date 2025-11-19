Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010068.outbound.protection.outlook.com [40.93.198.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F41F344030;
	Wed, 19 Nov 2025 09:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763545089; cv=fail; b=BuRVYzGCt7CB/dxJdse7+8wE3PGLPfywFG64AEp0LNQARWx5tWd/YwYBuprizuRDzZhilh15KF0wojKQbUSQAJgPtmx9X4G8utbaj6BuUvm8JTwus8iEQXLbIJGojz0r6qdr3BWPechry+hvH/Hp2wVlunHzD0k1rZz629daXdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763545089; c=relaxed/simple;
	bh=o+cC32M3+CKUzm7GezfFJ1+c7AIF8d4MnuEJuFpwdvo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TY/V3Y6jtk0gGdO0zdYyZ2U1TUrLLhUsFezFwV/9UU5VjLtW34bsq9WZXTvyRKM17aL2dwSOcbv6hUioXRV6kT66zvtLMU41l7pT4is+g8eJtuA2rWC9TM2FSZHVXeOXkilGwUhVEjYNqQktdBwriWGriR2uP4aI8bVJg6rM+oQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=k5731J4E; arc=fail smtp.client-ip=40.93.198.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="k5731J4E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DwymceVH27pYzElheP7IoxGuJB+Wi7EytBJPRNmVunmyCfWRKN+IOAlkQ2qNH2I1x/qIBo7M27kiZBgQaz7zcJ2p3qxDEvOiYLhPUQ/r0gWHXrH5MdXjE6kmTt+HKEdWvpRCnCvYp7QypQ6Op0+/DVK/vDOD1vXFoLI14dFxqciBgQh7o9KMlQ11dumhuWwSDqCCpov+W8wNTawzbzgilKJnBRidrY3TJiGQF9udkJVKcNtQ6luY+NpQ/TdXW7VRXAMngP8FjG38DRGLLoW1x14E9ssMsVhEgelz9AEa5QPX03JkSAV6m7AXy6A3do2IGq6XaKM0shEIkMNIbY4zbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WCiZvvye4uIPG2ojGkW3ipFyiDZLm7pUreWVkkMvVc4=;
 b=X0YAwRvrhocYGcIEw2l+qsaUCTeEuxu6nKWAufnEagS7/QeAGLOi8pptG7TNoatVMUEicK4Qjw1mYTAbYm51X0bdWz0cM/sYpqrjUx/OhzjtwLR++XGdK/Mv7GomWcAgYnqZFGljcIjKfSlauiBYmgrYego0P7TEmNm5HNRsYzMCbjul5MfANW4s4DN8TefWrSxGPyOQOVN+CevmptxQD98Nw+FdOJLeF6MxiRFdNDyA6WqjwieW8UHg8I+0QNq3RJizu+uitbAWJ6XYdARt2kwF4m1zGoinVsuuv3JLGunHgbh9hktnkASANTvxkA5Vao94MmRr4d3lZLe1gNXWSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCiZvvye4uIPG2ojGkW3ipFyiDZLm7pUreWVkkMvVc4=;
 b=k5731J4E5Z1AsVx+HTtf24M1Jq300zbhiQ5D3pi7HbiNXaNX/lT0EP4NrtVSfNtr/jtbHY+AaQrEk/udXJNgU9haqM8CG0LDsTbGhq8NX5leqawC6L1t4hXrWZ33fLh6+0+6hzC2iVGUcEA8G97wSQ3CxKc6owzGEtIKurOO90UeWZHlaRxUmF4aYQqetVxAy3tK/YTrb+dJ08ms7Z0hrMfuRz/eWhz3ZDb8zQtONfIwTnYasGSnJLAAVJi8LN5sdMWFsR+xpFqXoAlNqzdRVyi90HNBAVCd2fQwP2ZTYjy+nEiRVKJ0AV7UBKzqEhFvOmI1s+xQHbDw9XmvMeofDQ==
Received: from MN0PR04CA0023.namprd04.prod.outlook.com (2603:10b6:208:52d::28)
 by CH1PPFC596BECF8.namprd12.prod.outlook.com (2603:10b6:61f:fc00::621) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.20; Wed, 19 Nov
 2025 09:38:03 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:52d:cafe::a1) by MN0PR04CA0023.outlook.office365.com
 (2603:10b6:208:52d::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 09:38:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 09:38:03 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 01:37:46 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 19 Nov 2025 01:37:46 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 19 Nov 2025 01:37:44 -0800
From: Jon Hunter <jonathanh@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>, "Prathamesh
 Shete" <pshete@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, "Jon
 Hunter" <jonathanh@nvidia.com>
Subject: [PATCH V2 2/2] soc/tegra: pmc: don't fail if "aotag" is not present
Date: Wed, 19 Nov 2025 09:37:29 +0000
Message-ID: <20251119093729.441654-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119093729.441654-1-jonathanh@nvidia.com>
References: <20251119093729.441654-1-jonathanh@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|CH1PPFC596BECF8:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b96ada5-8e65-4f4b-c302-08de274f5639
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YBT+mJV5YZ+1LzgUvShMQAYnjfpTyQobIwoL3iCiFK4Wu/sYmQ7dBsJwQRrz?=
 =?us-ascii?Q?QeeHhM120pAJZIyRUYP8uJ59uPf36GTtdmxQqKMUKFtvgoPplzjXQ+3wVAeN?=
 =?us-ascii?Q?5v+qPNvJ5lzGVKPcE3tg0HngG//H4u7pfZ+8q043jZoO0xg9yStNL2gjd/QL?=
 =?us-ascii?Q?VJdBEk9F2EvVwBeQA6MRFLiIOw0tWtgWejLXqV7a8bQwI9yZlmog600pLkOK?=
 =?us-ascii?Q?DGpFvFoPaCo4TwYx9lWQkCAmYV/AiQ286AoatJCN6sMcQ9kxB1roCqG0voai?=
 =?us-ascii?Q?63Tfg53pu0l38li+Qx/F9V0NTjDs4FyZZPMsJJtVGlsZQuC5ejR9+/I5mLSS?=
 =?us-ascii?Q?QhNfwvC7ZGJhm38C+Q3wU1twB3/XRj96sXw4k4Px2pDuEHgk1HTlz/Yn/bin?=
 =?us-ascii?Q?QsRZ2WdkLELNgY0NGpJr9CeR+1a1jYAse8IC1ANh48b15rtIb/z/5CHE2an2?=
 =?us-ascii?Q?r/951qe/IYdcnL72C9Jo6wczRIfYR310XpMVb5+RyygmWU70xY5AgWO4SV7U?=
 =?us-ascii?Q?gnZtv2zp/KUWQsLFoXsTYeXOjIyCfCtEVVwcwc+8hGMJ2DH9dbdRuAQFZLRC?=
 =?us-ascii?Q?Nzx+y4CzgDUR0T9EIp46vAOvIVteWQYF5MV8DCwUsPE6Mf4Mc8jc0T8L7mfp?=
 =?us-ascii?Q?uy9SySq1RXKjaiDWHTgYAxpSTVt394AOoJfYlpZ2BswYVZt3/vB7cE+sevBH?=
 =?us-ascii?Q?aowmD4URtiFzuHFJogx/7ffien6k7Qa5d/plHq/NCBEQ9x+MLN+zV1cqn4am?=
 =?us-ascii?Q?zIdDmiZqftWts76J1AQvrf+ldY5jVxK/e2Lq62+1u1Cq5Ts5oz7/085L6z7J?=
 =?us-ascii?Q?/7bd7m9okt3Br4YS3EK40fDpRpmHRgec/2fog30zrYOYfiEsjYnQugndN//J?=
 =?us-ascii?Q?MrzW0/Nwe5lQmbR8vxjzezEV/SJCv66sL8i507UuYr+9uU5Ms5F6SUKYLXO0?=
 =?us-ascii?Q?qhecw2/fL3/7ZgGb4fLG1+2I+3nDhKKGMMSYj1XVCkDfOA1XXuZXZgx7Z74J?=
 =?us-ascii?Q?tqHF9hAm8j+A6U7Z6RozTsAPam5A2mMGTFpdTfR55bewzY1iP9K6f9GCNamW?=
 =?us-ascii?Q?+pby4FfK8ZHTUUn/flSvFS4h3z0VNVQsp5TFWklUFLwquC/KA10C11zodz9e?=
 =?us-ascii?Q?hDk1tTruuNwTZV3aOk5cZ7ETMO3r3SyiSjphD7sZkUmjf+8yn7WapnXJOWu9?=
 =?us-ascii?Q?XmTXGUjbhFI61rUAUEiZjcPQeiQRDXfz5t2hewJDArhz+GQ31JJTbHqvuRfk?=
 =?us-ascii?Q?C/2drG2wBDbHSXVMRPIV9C4nAa5/0vxAFxtEDyJG4BDV+V+ZxQCeh6na7aal?=
 =?us-ascii?Q?AWzmO4+KyBk/G8yZ3PZI5/jwtQynxYshH9eU+hir+AcCDDaQQaRANQ+q9M1o?=
 =?us-ascii?Q?qSGz0z0lahN0MPtX84IxJsVG2mLwpbhhvx2g82mI+Nk/NYoJp24dj92cmB1e?=
 =?us-ascii?Q?gc0e/69Qbh5PK808DSMZGI61O+PcInDoge3jCLX3VsGd3RUnNG2tQ53bOjR3?=
 =?us-ascii?Q?vR1SA3SeliPeQsho0Al0Da4eSeBJeYJGvnw2kb0+ye6Dbuy7k52FOpPfq0US?=
 =?us-ascii?Q?lR0xFTYUbX4mNQ/hNCI=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 09:38:03.3896
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b96ada5-8e65-4f4b-c302-08de274f5639
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFC596BECF8

From: Prathamesh Shete <pshete@nvidia.com>

The "aotog" is an optional aperture, so if that aperture is not defined
for a given device, then initialise the 'aotag' pointer to NULL instead
of returning an error. Note that the PMC driver will not use 'aotag'
pointer if initialised to NULL.

Co-developed-by: Shardar Mohammed <smohammed@nvidia.com>
Signed-off-by: Shardar Mohammed <smohammed@nvidia.com>
Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
Changes since V2:
- None

 drivers/soc/tegra/pmc.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 034a2a535a1e..d8c8894a8f38 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -2897,9 +2897,16 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 		if (IS_ERR(pmc->wake))
 			return PTR_ERR(pmc->wake);
 
-		pmc->aotag = devm_platform_ioremap_resource_byname(pdev, "aotag");
-		if (IS_ERR(pmc->aotag))
-			return PTR_ERR(pmc->aotag);
+		/* "aotag" is an optional aperture */
+		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+						   "aotag");
+		if (res) {
+			pmc->aotag = devm_ioremap_resource(&pdev->dev, res);
+			if (IS_ERR(pmc->aotag))
+				return PTR_ERR(pmc->aotag);
+		} else {
+			pmc->aotag = NULL;
+		}
 
 		/* "scratch" is an optional aperture */
 		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-- 
2.43.0

