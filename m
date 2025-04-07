Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2081.outbound.protection.outlook.com [40.107.92.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5DE230BF9;
	Mon,  7 Apr 2025 10:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744021448; cv=fail; b=DA3HWg10ZFTWmegmAQxC5wUsnz5xNYpbAjFtWg8yLHHZeYn+DJWAXQDjcfSlEGercgWiOiUichRWMBQjyTj2UX5Mgp1/AMzySPytF+9H4BrFUnWxQOPrBppGdZwTT44IjyZQg8QfY0fUJcQOBNMMxK19RwqfUKKqGxHs9cJi8z4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744021448; c=relaxed/simple;
	bh=nPmlT6/PxCRJAkU4nJC5J/F/LiXxrvS/NiX9t3M2JTw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ipnm6q261fB02a2R8aPTYmyUlChNw3oZSii3AsWlDD5OxGvPaMFyzu+usnIz5F+W8iQ8s6hRB8vT4DxNt+BQqFjg2DC3LEIXjG1Yb1CQejl/i5vhHS+43qVspO7PELjs0Vo2kHg1Viwujh8FFbINrvh13evoS25sE/Q1CIU28CQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qerT+/gs; arc=fail smtp.client-ip=40.107.92.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qerT+/gs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sbTdrsA92hh6lAGw8BqJYFzYQq1NoThyT0cVrWpe8avTa5mu75alVBm92Hx4b1uxUtfC8aJzulJLbsyNJlPPymRCg2CR8Arub0qn7iGvG6tzIwAfab8/SYp6MVF1UOkaILGjxqJvH9zPDeBqqEBJ6HL2P40OLLQO0cToqHvVgeJyOiN/hluD2UHuPHVTJox5e3F/unQZ1JX2aIHYbdlk2Y+u7j1lrycDmIN5fYgzZrI4k4g1pHxtlNilH2Ao4H+EifiL2dQ1kDFXCTLf2gI+uMPPGEzmn4VnzS0sCrnvlmuCHFZS09OUGhYnVXWlix5awnoDp3C9Ta0O9Q9FmYmG+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1VpLP5z9A865jpGGGZP2EYH36YjgICTKX5v5/BbyPY=;
 b=jtv6AT3naw867H3ko4w+ASjW0WtKGY5ArdxihGmBBYkGwRu8GH5aczqJaenMNpe/TVrFZgZ5hJblQxUA36Yvf5pzSc2c0OhmCxiOxS9gSHI1hXikJenGyPzLvH/D0bZ082XArtzZJ/b9VTyeov2eqKpwkc7pSDozb4aPkR0qulXzaoFnwtU7WHMzsGREucvPhALarR5H3E7kkRQNZlGyWVSoGcXx4DpOwopBvVtnavNrcksJquJlAnfawVT9a/w2PbMVoNXvoZoBHX4gwiKQc2BzORAfKwqrGBFP/OWv1QK1JCVRLqP4+EYFMjIz3Pk49u64WpmXFHCRlNHFj+LDCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1VpLP5z9A865jpGGGZP2EYH36YjgICTKX5v5/BbyPY=;
 b=qerT+/gs7AGfJ0zRq0F4+zGm8TfzdvQYU29Z5+z3LGmM0KfEYBSLDLAlLs8D+GEQhflTMDxM7LnK6wOpQNOOCbe6xcVc7OhgiYNnCi8UWC+hr8PmEyQXD6zZhPTdVEs7pOXUPcNbc9gwElKXI2xj8Naz98CXETJY8vWcB+fi2Wl5+gCHcIaQUyM/b0R4kj+QsnfQayrt1y2mTtU2svSWTENRwqyjCbe1eIdhOOil+CJOIwYh0dJosCyFWsDgO/1rhv3aL2At/Bn//ndSb3zIsjLz1eLbE61w/CIMx97UC620XPXW4ekSuxSs/14xmaSJTaLhMj86oS3Aq+TWji0XXA==
Received: from DS7PR03CA0088.namprd03.prod.outlook.com (2603:10b6:5:3bb::33)
 by CH3PR12MB9282.namprd12.prod.outlook.com (2603:10b6:610:1cb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Mon, 7 Apr
 2025 10:24:02 +0000
Received: from DS1PEPF00017091.namprd03.prod.outlook.com
 (2603:10b6:5:3bb:cafe::35) by DS7PR03CA0088.outlook.office365.com
 (2603:10b6:5:3bb::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.33 via Frontend Transport; Mon,
 7 Apr 2025 10:24:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF00017091.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.22 via Frontend Transport; Mon, 7 Apr 2025 10:24:01 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 7 Apr 2025
 03:23:47 -0700
Received: from robelin-Precision-3660.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 7 Apr 2025 03:23:45 -0700
From: Robert Lin <robelin@nvidia.com>
To: <thierry.reding@gmail.com>, <daniel.lezcano@linaro.org>,
	<jonathanh@nvidia.com>, <tglx@linutronix.de>, <pohsuns@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<sumitg@nvidia.com>, Robert Lin <robelin@nvidia.com>
Subject: [PATCH v3 2/3] clocksource/drivers/timer-tegra186: fix watchdog self-pinging
Date: Mon, 7 Apr 2025 18:23:22 +0800
Message-ID: <20250407102323.2690911-3-robelin@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407102323.2690911-1-robelin@nvidia.com>
References: <20250407102323.2690911-1-robelin@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017091:EE_|CH3PR12MB9282:EE_
X-MS-Office365-Filtering-Correlation-Id: 853f522e-6d7c-4056-4fba-08dd75be50ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dRBxIuVpEjeI2I3es+Ba70BnSxDSxYKov8+rteZXlUhmT9dbo+jnvOmEY1CW?=
 =?us-ascii?Q?ZiBti0/p6RJz2qW8jrZowxLn2S0tUL37ioUf+7cBiGMZokbzt1jE5zsvJDsl?=
 =?us-ascii?Q?ueogCJYM4c6F2KdxPyfyoeb2pkweOcydI27r/S+uDqa5gFOHslOVA7CdMmDJ?=
 =?us-ascii?Q?oCTRaClRHVeTmA407TLPcT84dMNKcPLbD8f9vX6yWdF/mL/0VhoCJIdYuCl9?=
 =?us-ascii?Q?Sj9DuD7DNfeMzyDslnodLPlYFPqEvS8Fv6sAb1IRONxr2j2/4hitr3NJCF79?=
 =?us-ascii?Q?LlT6E+A5n5GNII03rh2sgJbFmlNniFFgK/7dYJTy5AOJOR0K3ycLRAqqAmEY?=
 =?us-ascii?Q?hlduXk9H89OMcAf0tEfW2cQBABgwwyLRLoj04V5BWI/awYxRIz0k9xKYVaXz?=
 =?us-ascii?Q?wec8YJwJSwbBc3bsp5at92Bufl1PFlbKxUDPwxH70mEFqARVym07aQoZP5PY?=
 =?us-ascii?Q?LnE22AR+r96SpGxoDJXtcEy18kGkIMh/mlPX0uQW0BZ+5Evfjfc/okyqmrdR?=
 =?us-ascii?Q?KJSjA8uJXklHzVhEfT/+jUFRin2gkStXYUVEJ9WpdlZJcNALFDehc5PQx20w?=
 =?us-ascii?Q?p5Cn6MhiDaZ4D91RbnvkOgbAJ/sWFV9M6Hi7ruevdY+gCD/6oIQi9D/4KZtC?=
 =?us-ascii?Q?m2TtaJ369/kGBsKH7Hnx2ToXHTDxBtMdkd3d1V8Xg9v/NxtCc/alyWcGfjDi?=
 =?us-ascii?Q?AJmSDAePLiP4vCmFFcuKc+IzioDABuA9MUjsF7FwEz8h3dRvo66o+UQJ8wAt?=
 =?us-ascii?Q?nYtMAJFFai7b2YOmNdjpwk+wGYMxoNHw1tHW9cdIYWqcvgMpUvW9koJYf7D0?=
 =?us-ascii?Q?WgL0YCDp6cysrdHs8vtSA/BDW7NtNZXvOoHftckUQHrTIdZzLWCOWSUvgz38?=
 =?us-ascii?Q?utr4TnbaU3wLve7D7WsoJMBZ/oKrSd14m2Av6y0tEgSIjqudzl/FSutJi5pt?=
 =?us-ascii?Q?aISrKX5hxU+zWMNCuch5ygg7zUUbzPP/bHKucxxK4CmMk21GonnOtpsXXa/A?=
 =?us-ascii?Q?P0RnXzC5wNXn0o15rNbW4fU2VfLOahhPb0ieFnmU/7TIgRlAVdeu5vJCG3nR?=
 =?us-ascii?Q?VceeHbGY+huzKFvakAWOVbY8/Ar+MoTx/yB0gOj55qkKzJGb3kUhhqa95Ked?=
 =?us-ascii?Q?l/3yMt4WrBofKMtKLJu8JmXIE5KTfbEly7PwM3J8t07MkCsFQmKlyhtYPuxL?=
 =?us-ascii?Q?xykiMNpoEEVlHEd8EmxfVdqlnsoe4qfnm7YMaRVCIBdWtiNzLiHlo/nNs+gU?=
 =?us-ascii?Q?QGPCX47EmX56p2wYzgpN/sJGY0AIjAPb/oOpWfd0xhRh8Di4Ka3AOMZ9Cdc+?=
 =?us-ascii?Q?ywqX+OgJumLECk1MovmnpGpky70S2t5gvhLeoCAnnISarCfCl/p9EtHdJqT7?=
 =?us-ascii?Q?8SMZGqOG1DvCplq8URXywGTaYKts/4zRqX7/Pm1dG209f0jKqHenXgRx7GvP?=
 =?us-ascii?Q?z0qrzPokRsQZNPTuqQQxjRN10bkjpALeOiR2xKSj4PtnSuA40rbxAozJJ0zV?=
 =?us-ascii?Q?Rc/v6DHIfCQr684=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 10:24:01.7169
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 853f522e-6d7c-4056-4fba-08dd75be50ef
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9282

From: Pohsun Su <pohsuns@nvidia.com>

This change removes watchdog self-pinging behavior.

The timer irq handler is triggered due to the 1st expiration,
the handler disables and enables watchdog but also implicitly
clears the expiration count so the count can only be 0 or 1.

Since this watchdog supports opened, configured, or pinged by
systemd, We remove this behavior or the watchdog may not bark
when systemd crashes since the 5th expiration never comes.

Signed-off-by: Pohsun Su <pohsuns@nvidia.com>
Signed-off-by: Robert Lin <robelin@nvidia.com>
---
 drivers/clocksource/timer-tegra186.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
index fc2ca86c1436..3967d023781b 100644
--- a/drivers/clocksource/timer-tegra186.c
+++ b/drivers/clocksource/timer-tegra186.c
@@ -175,9 +175,6 @@ static void tegra186_wdt_enable(struct tegra186_wdt *wdt)
 		value &= ~WDTCR_PERIOD_MASK;
 		value |= WDTCR_PERIOD(1);
 
-		/* enable local interrupt for WDT petting */
-		value |= WDTCR_LOCAL_INT_ENABLE;
-
 		/* enable local FIQ and remote interrupt for debug dump */
 		if (0)
 			value |= WDTCR_REMOTE_INT_ENABLE |
@@ -417,18 +414,6 @@ static int tegra186_timer_usec_init(struct tegra186_timer *tegra)
 	return clocksource_register_hz(&tegra->usec, USEC_PER_SEC);
 }
 
-static irqreturn_t tegra186_timer_irq(int irq, void *data)
-{
-	struct tegra186_timer *tegra = data;
-
-	if (watchdog_active(&tegra->wdt->base)) {
-		tegra186_wdt_disable(tegra->wdt);
-		tegra186_wdt_enable(tegra->wdt);
-	}
-
-	return IRQ_HANDLED;
-}
-
 static int tegra186_timer_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -480,17 +465,8 @@ static int tegra186_timer_probe(struct platform_device *pdev)
 		goto unregister_osc;
 	}
 
-	err = devm_request_irq(dev, irq, tegra186_timer_irq, 0,
-			       "tegra186-timer", tegra);
-	if (err < 0) {
-		dev_err(dev, "failed to request IRQ#%u: %d\n", irq, err);
-		goto unregister_usec;
-	}
-
 	return 0;
 
-unregister_usec:
-	clocksource_unregister(&tegra->usec);
 unregister_osc:
 	clocksource_unregister(&tegra->osc);
 unregister_tsc:
-- 
2.34.1

