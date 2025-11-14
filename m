Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013049.outbound.protection.outlook.com [40.93.196.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5DC324718;
	Fri, 14 Nov 2025 16:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763137084; cv=fail; b=JAyrOFvRmuF6Gv8R8avbc/HHpczX2VqU3ZtbqMnjRM3v2yCqVRO95E0NS90iBisLCLBbaQj0iIsYyWWfsSbFJPSHPtlFI9JgoK43NCKNl7eNkHGtl6eEzUpQudd876smEwdY/XzAAW8Q77b+FXMmUb6i9oVfeKKU+gLiHwpQqzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763137084; c=relaxed/simple;
	bh=e9dUWKdmPCxB6sNqIRZo/X9tDh1eowwonGXq8Zwkg48=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JXMG44ODVei2v70zc5bOk97aiA/mL3iDRYEIvFm1m+juXLyhLaucE42ZX9hmVZjKXqdOcaEpZGRN2TADKALH/2+R56hiIqHFuCNFuDdDOpbirIOt3mmvQhZMtZTAwFTX9LbPs9Jv/22uioMIZrOeqJ70zqH9Su4qvjblpfJtnEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FxQd/QYd; arc=fail smtp.client-ip=40.93.196.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FxQd/QYd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GxzWoHkKI1kjZ+DusPfalaFCWesT7OOxEaGdi3pHJjctkgVx5MjToOo8pQ8Ni3al7gREHly9fUOFFEC17dF5UHnQ4A0AkGzqTvTEOnED04fPbnQ+hQwLtQv7tIJ0mb3iS6TlAUyVcNBaz32Zz0waoN+EC8C9pWtxW/JyYQuIGk5cWHqX7CH+WF/qUWwnpEcTG4aKFRVrFwKauURzz6kxNWVt7BQvFYv4nuwryl1Y6at42Y1+E++h5FE61fV3wqQ0zEUq8Y1s6vOlk6j+ANGXUJKBTHgb5mQmYHK62zKqibMbKHKEtJ8J9DAQjJ43aXlvaIYXiYPbtbp6JW7lILmQoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BgGbb1Kwms6BYp8mknq76+RhS/nBx6mLp+GuJ/xVaYU=;
 b=Xcq/xYH1soFD7Dd4T8iSrW99WNJbwC0tfCmubVdq6KWQsFIOCyCBegvOTNS/sfki9otyClPboEqQA74/3/ghO3Bw8E1P7kUoFWTTDxuvISLlAegRQkwFmClpiOiQiQwIciy7e5mXK419MHi5HwcIZM9rFrV5a4CuQPba9g6aD8LDLSJYUr8WXYQYNkUz0ogZwGPnwRtstzJL70XB91QDPgPE0luaRskTzqhR7jmkZgX3WXs6IDoyscEYo1PbX3r4nVjZXMvhZ3egrxV1wRE0wYmeSX2O5+amF05ryxx/wvpdAQ5pkaP7fxyJIc43ACxQgp2XOTGLxbpBmPhgTQqFKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BgGbb1Kwms6BYp8mknq76+RhS/nBx6mLp+GuJ/xVaYU=;
 b=FxQd/QYdhbOKr1HYZQQyLG6/5NVr0//vVRAO7RL0Y8rHWj0sUYHPMzC3t4mOeXqQlpZFUIXhvxtfOmYCg9Amuf4OMFzlu/lvLei8qsO2pWA5KIVVEETNiJNYFFSpfpNs3v2UV6x64LfEYrb68goZwcZbY5DzEqlKP40DGS+eK4+7eXShD1X1qfBJ/1xKPAUIlnhK8e3b6qsjdLH0oZgqR3NO38BQcvESnHtiGxFstY5MDxfBPzc4Ww49oWoeBRDS+rh1S/GflhaB0hRvqZ61pL8RzxUmBPqmotIClXxziKZKqjVjZFnb0WlEJ5ym6fxXMtM/NcidCeVh5OKZN2P0ZQ==
Received: from MN2PR07CA0003.namprd07.prod.outlook.com (2603:10b6:208:1a0::13)
 by SA3PR12MB7859.namprd12.prod.outlook.com (2603:10b6:806:305::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 16:17:57 +0000
Received: from BL02EPF0001A0FF.namprd03.prod.outlook.com
 (2603:10b6:208:1a0:cafe::14) by MN2PR07CA0003.outlook.office365.com
 (2603:10b6:208:1a0::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 16:17:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0001A0FF.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 16:17:57 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 08:17:32 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 08:17:31 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 14 Nov 2025 08:17:29 -0800
From: Jon Hunter <jonathanh@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>, "Prathamesh
 Shete" <pshete@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, "Jon
 Hunter" <jonathanh@nvidia.com>
Subject: [PATCH 2/2] soc/tegra: pmc: don't fail if "aotag" is not present
Date: Fri, 14 Nov 2025 16:17:11 +0000
Message-ID: <20251114161711.2655355-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114161711.2655355-1-jonathanh@nvidia.com>
References: <20251114161711.2655355-1-jonathanh@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FF:EE_|SA3PR12MB7859:EE_
X-MS-Office365-Filtering-Correlation-Id: 961cdd51-8f05-495a-0096-08de23995f89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iSCnO0NlaGnfrXu1fbCv/4E/1EZF+9cfbaaInkMAz7KskvPxaVvxE/2B42QB?=
 =?us-ascii?Q?Fn2mhKvQW1WU5KxydbWTo4Vx846KvqxiMfjt5VBOmruAsMPSyYeEYK52/atn?=
 =?us-ascii?Q?5mzL4mGaNd9fAr0sPFwJYxSUmYS0L7jLc/TFZyySKPvab/rZY9skL6qtmdx2?=
 =?us-ascii?Q?eA482Azx6BLy0/MigV4iCNk+2PQVEhTcBaB/tkWbS6XZStGx/89K71/omD5u?=
 =?us-ascii?Q?//OMIRFm5xUh1S/2Ugf9eBSM4lQ/eBOefxTk8CZGtV4gStRxtlKSDxsB1ViG?=
 =?us-ascii?Q?iTItQbcGhb+7EI6k/3xbTKVJ6UvjLj+dlSGB+sFsEdO3EIXvpf9QpcPEtlSs?=
 =?us-ascii?Q?8j4XyK4rmvDy9Cl9TSJP8LOEgrRTHq2g7qlFfN8GiMqXtBDhmxFIVwG6LgNb?=
 =?us-ascii?Q?j4X3S30rzzSi7hrtsoOxITvoOrKoN85gJWJOcOWBzjAjnivxDoPOgVRwNUQI?=
 =?us-ascii?Q?a/6GOyGw7dtqxZNjFTDMxBPTL8YszEGF/oUKW8OdhkaHq5jtsUHmggbpjPY0?=
 =?us-ascii?Q?cCeXFywWvzASwhyCKjVMpwZaJcowOt5LRGnH2gUFt7rVVA4DqLez6Z2hJpS2?=
 =?us-ascii?Q?X9zgJ0vqfYGg1EP8l9SYMCCdq/bYJN9E4L0W0ek427fqqMb2p2DwXBau5OOo?=
 =?us-ascii?Q?gyY4rdTy28GjA5qy0KQcR7aW6hr87ofMWbJNldcxClnh0WUpZKLCzjoPIZqM?=
 =?us-ascii?Q?G8YQo7lLU7QxYW2RypjXrysMN4bMs4s/UKWIifIDqBDpNv/YlSujvDsYg8SC?=
 =?us-ascii?Q?a4t1U9EaKsBQpsw5qxhZgQZ9vehC6uIwIH5NLDXjgZBcb/IokcMPCtk42xxy?=
 =?us-ascii?Q?7yCQV9vMp2FwHUWxewjZ6djZWaWzn2TTwXXUGtNNSVKHzCxDaL3CyWCfAWnp?=
 =?us-ascii?Q?LxI2vZDqeLQZNyp1WlMlrjd7/A3AMK67+FuYjHCNjIP3P4Qw1MFcux8PlLDs?=
 =?us-ascii?Q?MmblSqO7qT/LtQSZLvjxTuhjCRpgm2QwOCUMp0JwFu5GU9Tg67eo+pi/YuGD?=
 =?us-ascii?Q?JGDTMBdGsXOy9cwSt7N2QNfmbBmSGkk4Kd4kA4NIqdam+u2krfuPpn9XsrP+?=
 =?us-ascii?Q?1QqO8/U4spc50X4pOhyV9gSW0ali+X+Z40ZtqAzdV2pEnw1oSutE07FZU3XG?=
 =?us-ascii?Q?hqH/AIqDWZIftiImgtG+Hy5rfjX6iDi778a6Mq/jr9WvQz3+H/X4c/h0O5y2?=
 =?us-ascii?Q?jCvnv6AwpH+0u7IXDb070ryT5cjX1kcagRD1ieoRSM05WLixJjtKXYK40hld?=
 =?us-ascii?Q?zDkzjUByud+2ARo3bWU52oZnlIHkMwh/NhuKLr21DMWJTpQPirisTE2vBP3R?=
 =?us-ascii?Q?6r3FU2+jw2EhnPedjaiMUTh9oAz2jvhTVYw+papD8HwSFdsyVACprqH8pRkY?=
 =?us-ascii?Q?RQZCaleJ/63hzXfJJpAwq/jqO6LJPc7pWFA1YflGx10/bzARXnQc0Cufu2f6?=
 =?us-ascii?Q?q44hJ9Cq4eBKw+whxH/QuMIMFHqNIhhqa8egiSljJvIfQ4HGNY8jezXL84FG?=
 =?us-ascii?Q?ypB4DxdkyW2Ro7G6bl/FMnwpfG6dAZBASpF3j6eaIn5a7bfJhl6hkP7hXxA8?=
 =?us-ascii?Q?VQT0sKvaAHk4OG1mvfY=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 16:17:57.0304
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 961cdd51-8f05-495a-0096-08de23995f89
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7859

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

