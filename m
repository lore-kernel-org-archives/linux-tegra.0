Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013066.outbound.protection.outlook.com [40.93.201.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE392DCBE6
	for <linux-tegra@vger.kernel.org>; Thu,  6 Nov 2025 19:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762455975; cv=fail; b=PaJkUBoQfC9Nuaw51hQKhLQidsnqjlS7C9enGjk8kkfL1nOc8fbeZRGwm9lt/L+QsNZgZx3Nxb3T1hyE6ymn1XWo4bRmUMv3bQyieihelz6d8uOE/QGfY7IqORdBm5YzpdR/Wyf9h89154C8F86VzhAKnPR+mg/hSjcsCbJo4ds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762455975; c=relaxed/simple;
	bh=fsff7LaURPPQ1Tlwz3j2xYHSUSszgIY6qucrX3TcTRo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=r02pwUY4Ahvr26hSwnRDgbGrZVPc7KDqnrxGoyN1b7zsQzeNGYslrTBbckRSuusfXDr0XWhlXItWuf+AJJQnlbdeuSpe/xMBgib6Bbs20TbfIK5rXzth2pPWyXWtH6qUfMXnLQyLKnd34lDkRx7OE0/N9mw84csIx0fntDx2BnE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jBUeWdZz; arc=fail smtp.client-ip=40.93.201.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jBUeWdZz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JhmzuPlZhlRYKrc4RC4LeSMq2c+wEFE4DoxdaLfVL9LfW15mvIsR7PNH6Xmc//xFQx/CXKeY+ydnLdkVGcwVuxoRFoT1LRsqIqqY3aA6hnSwJt1HorPXogzj71KBSZ7PdPsU+aegx9pFDFsMKqpZofUyC/vpYivmeNugi86u96A5Kf37YMuWU7RnTXaPqouA8020Hsy1iXk9GRjfsp7lZS4vTa3XwffsSgjHbPmrZkw0qcSWpO7fQIyfqD7w79UtdxxMpH7j0ebm6vSiWAhU08S3nTBYgal43sCHxEQ42Zeml1SXTqPmZB9eaewMH28K1/r9Z0BHjM2XrTDudCHg7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r14IgAfY9l/sWUXZq0O+KHKYiIq8itg8k7AtotiGTVg=;
 b=Dj6a8P1XU5YUv4nQXpNubiafrDgnSOBsq4GxBEy+y8z8M3SyM2xCPYx3bj0um0jH89m8qguf6hwAN8kDaLHEa8ZWNm8Bb+mLD5mBnyWUUQG/g/axzYdvOwHI3mGJ2tjs94HdhWLR8i2tk1T4O+t75jK0j9uLYMsrG6fPTwdNBwYkVRa1BNXtCwKAALEhAea1WzPvorS+5lujgfQeEfQlmwvDAY/Xy6Sb45n+voCtJv/0rbhOuR1cUTTCCEZvj9jDxb8dhhZOmXAxKCV0eJo8K345payvjAAbvdJv6tV07hIwA+1DjdkMhHh/PTsBUYwK8/8Rn6JyJ0SI9mpJd+C4JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r14IgAfY9l/sWUXZq0O+KHKYiIq8itg8k7AtotiGTVg=;
 b=jBUeWdZzn0BIZhmulithZK1efRRDXG1ch+C9Z0ATrSKyT3kLOlc+owEfUwYUG2nM18lVt3+yZs/Kf9yRFb3rh7O9URJYinEYcSv6Agju37OLhNCUP5YFZNaWAa3PZiNdHYis2tYLuutNogfBs20A2sOoAdfCt7HHGduYbU5QIlh3qgfne398eiXuIQ0kfsR6+rkEhncTKyhA64V+KH1VQ9ehvtnjt5uV7EMPsR38bR/DJIijmFY/WWyOalnrsHk0Qds4jFXwYYs+t01kRK4JdfXjibhqjLVxznoR0kryofTO3X/M8c/4awwoKQtt4PJQphG1ssV2MtixoWTd/8bDEg==
Received: from BY3PR05CA0043.namprd05.prod.outlook.com (2603:10b6:a03:39b::18)
 by PH0PR12MB5646.namprd12.prod.outlook.com (2603:10b6:510:143::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Thu, 6 Nov
 2025 19:06:06 +0000
Received: from SJ1PEPF00002314.namprd03.prod.outlook.com
 (2603:10b6:a03:39b:cafe::1b) by BY3PR05CA0043.outlook.office365.com
 (2603:10b6:a03:39b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.8 via Frontend Transport; Thu, 6
 Nov 2025 19:06:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF00002314.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Thu, 6 Nov 2025 19:06:06 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 11:05:54 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 6 Nov 2025 11:05:53 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 6 Nov 2025 11:05:52 -0800
From: Jon Hunter <jonathanh@nvidia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Thierry Reding
	<thierry.reding@gmail.com>
CC: <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V3] memory: tegra186-emc: Fix missing put_bpmp
Date: Thu, 6 Nov 2025 19:05:50 +0000
Message-ID: <20251106190550.1776974-1-jonathanh@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002314:EE_|PH0PR12MB5646:EE_
X-MS-Office365-Filtering-Correlation-Id: e795b62a-e11c-4ff1-19a8-08de1d678998
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xZFZWeIUQL6C59MEhkRw1CmUyUEXbDfJbvNjgJ0BcD1SUTpgCWtwsSBX7PBO?=
 =?us-ascii?Q?70qVqZoBCClCX5fWDk7jiuHp14MLB91QsgtMawKpWNblmJ11aQXCyXSvF8Qr?=
 =?us-ascii?Q?yLi3uE194NIyovKc9vo865r2gdpe9v6X6KQlreZ2mYCiBOu0MtvZApXZ2SAt?=
 =?us-ascii?Q?i0e0mm1UW1k+5rxUNwE38RnTKNDjPU1w3bz+cRosbCxjvEMPgMh3kJxVXl8f?=
 =?us-ascii?Q?u/eBNlvzCBslSFTh95F37x7YV8nZmxjrGKoTQP7x5ZU1AHUW2aUo/PPK67i8?=
 =?us-ascii?Q?yB1iq6YRhK7MTuDk5YvpR+rI1o40U3xqjBvSmm78Xbfil21kMNd0+PESELMN?=
 =?us-ascii?Q?oz/SVKMZIpLAHzAN3ij3Tcp3C6qTIV9PV9jPDIs3I0xMW1fIi4GUjt/JIYp/?=
 =?us-ascii?Q?nxwayrLDRdbqlynP1TQ7uyXkyclJ9wpwK8aVvFwGskB0UDmOLHCwjBzWUJw2?=
 =?us-ascii?Q?nNDyGeiWyyGBz+1pUydRxyb/HxSZHli0HooOchrOQXY4OZVI/NHF4MYsa00V?=
 =?us-ascii?Q?mPd40ab9Jao3PpFJRjT80entvWRKE4o1vNf3qak7RJVzIpkq+aKwutiI28so?=
 =?us-ascii?Q?734p69ms+QtEL3QX1edfs3s3wbigIfz7Wz8uTaq6hwwrCuwHF09PeZL4xVrF?=
 =?us-ascii?Q?srXN8yAACPlLeKdkAOWxi4so8JogJpIExCNhPtKJevBD4msTVF0S2QA84aVC?=
 =?us-ascii?Q?cc0b/qDHzCkzM7+t8RK5C3z5rt5dhL6BQdHkq/bQ4nBQoL/Pnsqi8Vz04yvV?=
 =?us-ascii?Q?l7Z6psl2qD1cjGbAryIVOIGlj6XxVFay4mP+srEZ96wbthRR63mhSBCa6vab?=
 =?us-ascii?Q?rrR/dGUSv4tePIbc1GRmh2xXWmXzxRpo5C8kNDlyfGm76wq2Q5XtlophwJYn?=
 =?us-ascii?Q?jbwmLnIz9RDv2siTbsKiCrzqSxJEhZdEtPUZB3vBq+fxLz+JOENHCjbf464B?=
 =?us-ascii?Q?K6FXNt1q7hKRBqjMVRWWRZDKUBZIPeUrBvdF7uq8YJU6m+lInCkiaDCggOVS?=
 =?us-ascii?Q?hGlAY+amfcu7V7jqEZjHqV8dZRvJmDbO9MAv8lDX7Kr4RE0+NoiC302cvCN0?=
 =?us-ascii?Q?6KE+E9720ijH9K4J8U1ewQEIxfc3+w8Oq7u4jT7Bny4o/VW/Ep0wGIBhMSuP?=
 =?us-ascii?Q?82bFAmEZOws2IzXTG2jrz/or8nkZd/MOezXGtoLs7kabY8BvmuVgwaGGDWGI?=
 =?us-ascii?Q?wan3kLoUA/IB0cz1MuEIbERnpzatOeauJeaDPkPOnymQkbfbZGyPVSunyBz3?=
 =?us-ascii?Q?dv7CxEXEVjE/paMyH+k1qgzGsIp6zNYIM2RnBn1UJmO9Ompe1JKHLT6NtUVD?=
 =?us-ascii?Q?940qHr7MgqWIgWRz+8Nu0NmMrfyB0OK+IJvEhXVMrvG+wVvG6cLRg45XEYSF?=
 =?us-ascii?Q?RUtl8F8FHLpFAIse6gt3JcyJ7QFApTILCyxjCdmV+9WaTFw+OQt7sQTIPBfv?=
 =?us-ascii?Q?uBZb31wCNIaq8/bBShjVcRjJZ0E3zkW5Lbfx7FB+pwQ+wgycELcMCjEsLA1a?=
 =?us-ascii?Q?LV/QtnOczTElDTar62mE2SpVeDhKJTse6s8Y2K/VgXTjSP/XFWb0FkvNkkop?=
 =?us-ascii?Q?w4lMJ17HSmyNUAKucVo=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 19:06:06.0215
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e795b62a-e11c-4ff1-19a8-08de1d678998
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002314.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5646

Commit a52ddb98a674 ("memory: tegra186-emc: Simplify and handle deferred
probe with dev_err_probe()") accidently dropped a call to 'put_bpmp' to
release a handle to the BPMP when getting the EMC clock fails. Fix this
by restoring the 'goto put_bpmp' if devm_clk_get() fails.

Fixes: a52ddb98a674 ("memory: tegra186-emc: Simplify and handle deferred probe with dev_err_probe()")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
Changes since V2:
- Eliminated extra line for initialising 'err' variable.
Changes since V1:
- Fixed dev_err_probe message format

Please note that the commit hash reference is based upon the hash in
the -next tree.

 drivers/memory/tegra/tegra186-emc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/memory/tegra/tegra186-emc.c b/drivers/memory/tegra/tegra186-emc.c
index 74be09968baa..b73daf5326cc 100644
--- a/drivers/memory/tegra/tegra186-emc.c
+++ b/drivers/memory/tegra/tegra186-emc.c
@@ -448,9 +448,11 @@ static int tegra186_emc_probe(struct platform_device *pdev)
 				     "failed to get BPMP\n");
 
 	emc->clk = devm_clk_get(&pdev->dev, "emc");
-	if (IS_ERR(emc->clk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(emc->clk),
-				     "failed to get EMC clock\n");
+	if (IS_ERR(emc->clk)) {
+		err = dev_err_probe(&pdev->dev, PTR_ERR(emc->clk),
+				    "failed to get EMC clock\n");
+		goto put_bpmp;
+	}
 
 	platform_set_drvdata(pdev, emc);
 	emc->dev = &pdev->dev;
-- 
2.43.0

