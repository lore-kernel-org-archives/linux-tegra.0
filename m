Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012006.outbound.protection.outlook.com [52.101.43.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44813F86E2;
	Mon, 18 May 2026 12:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779108231; cv=fail; b=FeidLb1y94v5zAPtG0hi2YGbOv2ZVQJjaxyMaTrc76/PQtCFxNBGMBGSwF/rzavax9GKG7GFH/81EOvWxkJgEdKA5RioM0PqPferQLIMi7msqRgf3BDSTgr88tAnuf0dLK158Y6MOpsJTKi7PJpNm6HzMRJf64jNHjm+e3W8x9U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779108231; c=relaxed/simple;
	bh=Ess03CZnYKvex0dz+HPg1CxOuAesGWFThSc5dwMqSDA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ee3c06X1UdfrXoKpwyeZte74FdW4eQEIxnmLdzHrva6oiULAEuW9pUpHirzgOGVrA3HBrwRJhXcyGcggihLwj2hm9VloYImoJvUwXzJ61LQtaavtfZWaAlJj3sVGnPk9ioPirv4vKrkEnWK3Z/ugpOoH5GWNahh586FQgnts9qk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iL6SAmkw; arc=fail smtp.client-ip=52.101.43.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iL6SAmkw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h3xFPVyZ0tNYzxVyRkl24JnQHPCOA9NXvQ5MubvVAaptjoFRQVSK3FJ+vxxsEnCMX+NqTg776b3ckbj62zQ8AMb1yLMFJks/6cpaCjojeKJNWjFlejcjWm/lwJHXtTDu2JWCjWQhc9Rv3NB68DPFflvMjYAQK8PyLd+wtEKEeZ4FKh30wh2oFlr1kzyBOVmQbvUL1hU0QwLbkbIM4g878h9f/C+oxsJVw0PfgBluVipFE75ryJgC/BUd2iFCMbYNKbNg9+ZrJUp2xxfhD/lHlWGv6nHxDcPEH2qDLMOrd379R/5QmXViFj4dmbLW0P6bOMAVsLsdnsXK3+B4ta0F/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oMOntB3ESDCME649gHBdK9/we3klVxL2hKB0+4XeMT0=;
 b=YkyyUddqhSKTRE8f4+QWhkKqY3iaxQcZCrdrmYd+vKIk2Lf5VJ48Z8eXLXgwhKlu0Y2IlPZz59gvZgac9MWxkaAJ1igoDTwIFUPFW8HilMbyR3zz83ZC33XKijsd9HlGBPst+oaPBnQ0y1IyyBdVlowiqsePemLA9usrqTTDvGvEnaUs1wnq8xc4UihSmX9q1DG5kH4aN2ST/Ty0OaI5DlwLYYHYN8LOl8w9wItF/C9ia8i+j0UsqGmnnbl+kdJaRKZjq3q2YjDheoRakqi81YMNwo+/2wKiI7UjRZ3G0NelLKRPFaOZk3JbJETy5E79CIkv9niYY6u7C0PVk7AtEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oMOntB3ESDCME649gHBdK9/we3klVxL2hKB0+4XeMT0=;
 b=iL6SAmkw6zjzrwQNcSXNC/BFuKYS26xGvNc4sfXklGBL8LS1rxvh2XuZXJVKCHIJXY9k/Fpm5rTS24LLGxBce1W5DYs8moSWcN5AOSObTGyJrEFfUFzgtTKGbUxAairDlyCHGIC1nBk0gnRyhpq7kFcbydlFpK51x/1Q/KCymV0bWjPtZ8vRXAZdOJ/XnPXRbgO6bLcz4tQvu6DG1ebXXnqmg64WRc3J7x3UVQs7yCwzcAlG1tYphHUrgnh1N6qWIhaaZ4Ve5x0bKu3qTzg5+dICDJOC/xk+Ja9FUyZUJkeROvflHRCQj3zOeONYP42yk4/36aOYGb9TWyHqoIerDg==
Received: from PH8P220CA0030.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:348::15)
 by LV3PR12MB9094.namprd12.prod.outlook.com (2603:10b6:408:19e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Mon, 18 May
 2026 12:43:45 +0000
Received: from SA2PEPF00003F62.namprd04.prod.outlook.com
 (2603:10b6:510:348:cafe::f4) by PH8P220CA0030.outlook.office365.com
 (2603:10b6:510:348::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.24 via Frontend Transport; Mon, 18
 May 2026 12:43:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SA2PEPF00003F62.mail.protection.outlook.com (10.167.248.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Mon, 18 May 2026 12:43:42 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 18 May
 2026 05:43:18 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 18 May 2026 05:43:17 -0700
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 18 May 2026 05:43:14 -0700
From: Sumit Gupta <sumitg@nvidia.com>
To: <krzk@kernel.org>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<robh@kernel.org>, <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [PATCH v2 1/3] memory: tegra264: Skip clients without bpmp_id or type
Date: Mon, 18 May 2026 18:13:04 +0530
Message-ID: <20260518124306.2071481-2-sumitg@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518124306.2071481-1-sumitg@nvidia.com>
References: <20260518124306.2071481-1-sumitg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F62:EE_|LV3PR12MB9094:EE_
X-MS-Office365-Filtering-Correlation-Id: 703873d4-456d-4318-3628-08deb4db17cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|22082099003|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	JN1nTV7qvjOHb11/e4kUhcvI+CogllxJzOG/5//eZ85CtKHXP3bajEJWHHyH3TaznZrMWnrfZuWn5xNkfOGE90hwMCYGV9YHMWFwv1m1knJU3C5XGggsiFyoWS8cmt1zkrYfR/C48KI9AnRiygcZWg+rALDdtxjYtaH5pTGs3IzAW1Q4CSA8TnKU3ixt2QBWRNlb52QnTEi+jsyH4xvqdUav+N8saQayJnJw8eJvkLavSR5v1HJgqWhaSL/LYfkS05RmtmD94sL9hLU3KctZRHJNueoALS3tMP62eGk+nb0NjjkyulMbKdduIETBBNdlDMHrj5xREGWvHX7BTzDRuBBnJSGDMliUwSNajVNJllL+aA8vyWZsFtWGCimPn6UPD+FeHtVhfrtSka471hcr7wrWPO88h3tOj5C+aFoKIS+KY7oiI0x4S6/grdZdtH2JTDcxKL15Fq7aMSzoIehqbl+zru0/BHZJXAMpICeY1/EXoVpX6tYfLSlCHRGG/0Cf6Lnz/ygseSAH81ry2saNBgodtd/KTznzpDOV/4Ah3jtNKjUJ5tyOfZkaMB0BqPZYtsv+sFo8sG0biGAmet9QBgSaAYAd9LtBxok3T9jZkg9iieWqNm2XSCd1LA6MhVgiUNZm8072jFpsJ7MEy8B4rSfCy6c+LlUZ0RrrfeVhYuIHJ6qpH0VHFxcqWuS2q2NHw1zzqxouRhaGQWhZvZXf2DOUeqbxFnV3DTnbJzaS7Lw=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(22082099003)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	d0VPyqNUIf6aYb4/kMpTZzTqZ6Apon7D+BHH+4OetzP4EE/wJcW3VTK0U7qX7P17mDAyd1jIAdq/BwDxC1acyTHnNEIQsSE/EFbmLHTlFbObaIxNKDXN+c+oF9cdypmTGSlMrDpNHfQcj95z2bJ9bkFN7PrHCDMLl2BH2LcaZrNq0qatsc7VB+g4kyUQN5XNZfndlOa5TvWDgsBj56XIXsuvM+vzorBDEOkg3IxiJjzAtGv+DjzxUuJwylghH93MlfMMZlHNmcWys5cN3chBOE20MuyDZN6mkActxGDgGKeT9U99bC6T0Cux9rvQvRQA2OmL4P9xGI4DSJL8A0NRM1dgaJDbFGMh0bK9OWpLv1p9YJ/sa3n1fAlGwRlZ8VAeiZd5Ikeir0SiWZvJ85B1iP0JV8RzS0nhejyAe+QHWWCZPHfMDQBCwjAC81VyjY7C
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 12:43:42.2021
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 703873d4-456d-4318-3628-08deb4db17cd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9094

Some MC clients are present in tegra264_mc_clients[] only for
fault-log naming and have no .bpmp_id or .type assigned. Skip
forwarding bandwidth requests to BPMP for such clients in
tegra264_mc_icc_set().

Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
---
 drivers/memory/tegra/tegra264.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/memory/tegra/tegra264.c b/drivers/memory/tegra/tegra264.c
index e43ef14da1ee..e62890841725 100644
--- a/drivers/memory/tegra/tegra264.c
+++ b/drivers/memory/tegra/tegra264.c
@@ -262,6 +262,10 @@ static int tegra264_mc_icc_set(struct icc_node *src, struct icc_node *dst)
 		return -ENOENT;
 	}
 
+	/* Skip forwarding bw requests to BPMP from clients without bpmp_id/type. */
+	if (pclient->type == TEGRA_ICC_NONE || !pclient->bpmp_id)
+		return 0;
+
 	if (pclient->type == TEGRA_ICC_NISO)
 		bwmgr_req.bwmgr_calc_set_req.niso_bw = src->avg_bw;
 	else
-- 
2.34.1

