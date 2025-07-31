Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97D2230BE0;
	Thu, 31 Jul 2025 12:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753964335; cv=fail; b=cFq81rZDAQ1IuUtZz07hbHNbtdIbIdZlS7AtH24vAzkbn2l975a+wEqG11F26mkja2s4CTftDeje7pUXti/OriabAkWqLDyw1h+2IPRxPdbYM/FenyzJGBtrjRlln9rqu701sAbFOuDy8z2ZZfXMfBKQjBv0/R/V3J/wCsTTD38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753964335; c=relaxed/simple;
	bh=MKUaSfjkn0XRPorGnya9LXpH+SmuKfeABVntbwIN0GM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZXb+zZByXGfATV5qavbrISRArOMRCN8U7ymv+m5hHWuVRPCaIF6j0/NCgWODTqHLU07AeeVQfFuv7uLJ7H+ym+nQ3XVoBALiJufB2qSclJFLwei0z9gPYzexeXCJtQLMdLgpsu7BYnBr4dKhe9fKVtBVOGglt5hPAqjxJzIVWGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qSpsr+tm; arc=fail smtp.client-ip=40.107.94.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qSpsr+tm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lk/z7KoZCKm8Yn/KDx5wMJFBcwbXXaskXrdYleDKbLmDueSeAe1kZ2YpaO5GlzSrQ5fmr+oIfls4TjUJMwt71oLAYJxHd3bT/iN3OgbtLg7ypYGPLUV5AMI3dtsA1GN76QGZk1JVYYcBvjCwGFrv0HkotuXd+PomDTjftbrUmEmYscoa62R1HvbeHYE5wzKYnJy9uvlZBVmZi22IsjWGeI59b4R3f7pNCrvM42UPMwJlMrXBAb9IDdVAyNnhqJBc80WgJ0JXVHzrbmEWCFVp2T0G1GqdmrU6MDIHoBXfnrduc3eCYHgDxSCQ5L49HxacNjxEk3RstoOmSaE1+3Ms/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15LFOKYs4hWcswxQ0tVN/czEUtqFTyHXcN44aD7qIAE=;
 b=dGzN3HlDkv4/UZwEpEwli04rdEEr3DGKQDZhVaUP5AmQMUkqeoJD1gAi99szSLxdc5R/q78sHvhuKdUzKoRgWhvLi6FXeSfeGqlCVGOFbc10S4hrY16Y7V/+tDC3Xtcm0dl63Xtw9zYObh8N9FEl26c4U8+ECC1Fi+u0PcCnLDxrEwi5gy2bw0mdew7fknjuBS5LpIZuvf5L+3iNmCZ6HZfflm3gT9H9/wLlPilfvoLVSJ0Qbn2ymUogN8Ap93U0LYrK2rUBEh1GHAbQyLBkaROnnoNXaIL7iMGb9JTT6g+688Cb5zQUJiNq3fvRoZSUxF5ckTDUQ9JR8ZWD0djhfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=15LFOKYs4hWcswxQ0tVN/czEUtqFTyHXcN44aD7qIAE=;
 b=qSpsr+tm98XoRgO5vQXpVXtq/pWQFTRFbaiLkg3u6pdWgJplU8yQ4aeKxASmgNlXegH8rq9Hht7nqtATJoZLyKqfGfUzJEOss/SpNC5wcIWwr75CYsmRQfKDb9nzQuo1ck2JsH16UMsSWRjWjzQUZsFyj4AjcYJtmp+NaQd0ZEHRCDxwCmRpVt4Y2+KKhYJgRfyBKJH6gBNv2kTFqSYQ7b9dU7LEWFxleC/QhKSIpkhGIXlPr7WbsEZjVBjcn8RjAns7rTHZ77i7PvMj/AkobP9nQJ2on7rHY8o57EEMdhaoz0wBF6DGcAQ2C5zSe68aTUW7Hzlyihb6WUDGPS+uLw==
Received: from SJ0PR03CA0366.namprd03.prod.outlook.com (2603:10b6:a03:3a1::11)
 by MN0PR12MB5929.namprd12.prod.outlook.com (2603:10b6:208:37c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Thu, 31 Jul
 2025 12:18:49 +0000
Received: from SJ1PEPF000026C4.namprd04.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::dd) by SJ0PR03CA0366.outlook.office365.com
 (2603:10b6:a03:3a1::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.15 via Frontend Transport; Thu,
 31 Jul 2025 12:18:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ1PEPF000026C4.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8989.10 via Frontend Transport; Thu, 31 Jul 2025 12:18:47 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 31 Jul
 2025 05:18:38 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 31 Jul 2025 05:18:37 -0700
Received: from moonraker.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 31 Jul 2025 05:18:36 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
	<jonathanh@nvidia.com>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Ulf Hansson
	<ulf.hansson@linaro.org>
Subject: [PATCH] soc/tegra: pmc: Ensure power-domains are in a known state
Date: Thu, 31 Jul 2025 13:18:32 +0100
Message-ID: <20250731121832.213671-1-jonathanh@nvidia.com>
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
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C4:EE_|MN0PR12MB5929:EE_
X-MS-Office365-Filtering-Correlation-Id: 20e93573-ffed-4019-f3fe-08ddd02c66de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|30052699003|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u74tRvrMrA/OaexA/9JxgmEbOjT4yyIAsRZeaNLEKqbBja4o1SfZnPBB5zlD?=
 =?us-ascii?Q?E4P2NtlG3Rr/j5re0zhXZY2OPWUctfI1D+I2MLSV+j6wYAtffAd/xW/pPWi6?=
 =?us-ascii?Q?2mJfMYnJIWwCvNEPQHIvq889pe1TD43MMDtJdmqnXkl0YWTulxEuMU6431fy?=
 =?us-ascii?Q?bTPX39KyRajwNv5Q674gXWFYbB/kuzkjMFGYbJZqWUG4o/EKZz5cOXjSDSAJ?=
 =?us-ascii?Q?B6QBIqADNNQ+1VmQy+1cbNEgrU85x7M3d5CKyCq6CosPNJAjFjvi1tD2zabm?=
 =?us-ascii?Q?6X4OFFGk8aXp3UPs/kYxE9VQAgdQc5u+F2/0v8sAtkzmai2cqzIVVIuDLOqC?=
 =?us-ascii?Q?wZv1qTAOWS+sDc1UepWt1Tn/r3o0hDPGr/2MEbCuFdPul2lSQND14KfztVNE?=
 =?us-ascii?Q?avYeWjx4Mjnfy19M3sCyvssj8VFR2i2bERnirOSbgAjhyBZpYIQgjSNZLiMF?=
 =?us-ascii?Q?EdijBMbrV3y6Ctbf0zH0G3FQkXWgxDTC8V1gQRfezHXDOxON7NS2PC30I1Lw?=
 =?us-ascii?Q?+C93zpmBajEaNYTHwLRSk/QT9dVNUVGmcpxybAqNCLms1sC/2pqnLC33I6Mn?=
 =?us-ascii?Q?cqosSklbKSTV3212omPLCZlbi0kmajvJdVzb9Xfsqfa6n1K4E2XU1UzpuJga?=
 =?us-ascii?Q?dL0jFQJADKfDc4PzxUjL+cocXqlyeYSy/+8/JVa8JvVk2h152jkA9PL6NqtY?=
 =?us-ascii?Q?AF07y/Yj2mI8mtiWnCqBRF/zW1oomf0vOXof62dz+Jua7GEJr679NdDuoa5Y?=
 =?us-ascii?Q?HIGFRR9T24zZK+CNKcC/Zik7TlT7S7SJlqTwmag+ap6OK5fQbRIkTuVqb2L2?=
 =?us-ascii?Q?rhjubcZvulOfVoQUbFEUIcff9KsZsVp5nNu5Y9L4tEFWCgiZwhjg64c3sOLg?=
 =?us-ascii?Q?T+OXjbzEPFPByij3tevVFK5+10ENPwrPVISmyvqCCq8dySNoTuiefqGds/Fa?=
 =?us-ascii?Q?CGK4prWPex+gL+TPs/56sTGwnUQWz9OGI1/BvBH6XoOmRBRUIplHaRtutMun?=
 =?us-ascii?Q?hsZjUNwWfQZV+jz61nsrWVspQdFDtkM+2yrHEEjXVAkmGFP/+uD8YtJWqE7F?=
 =?us-ascii?Q?dHWFBRcHeoGgi2xTkDrEKCU52VF+cTgpxz8TSWz8qeLJmoiEdooDGDYUSEnI?=
 =?us-ascii?Q?VoJcEvz4OiErAUDtWRqmwR9j11cwr9gKHaEBqFwXES1TWII3DBCu3PRvt3EA?=
 =?us-ascii?Q?T08ha8vLt7otJKzoeqPGfxHn79rDDUqoEM6mR8b7uj+1AzPZWVaFKpQqHs05?=
 =?us-ascii?Q?sccdp44v7LsDrpNoa6ZlaQDdB4f4xS79LDcUkaC2sfGndaiqEIElNC5nCT1r?=
 =?us-ascii?Q?Mi32/Qh3btyqHIvMEBXICnNOCnHvlCcHQw1m+FoHwy4o7KDR4ibJqvf5YgZ2?=
 =?us-ascii?Q?zs1hfdcCVRv5xoEUAdiA8o9mmFgQKHaIZ4PlqM7KrHsrgUgdUOGOI3wx2oU2?=
 =?us-ascii?Q?gXZSd6cqwYpISRZcUThsil+gATscPlxWOdsv0ARh4RsfkqcJA//W6Do9/V0k?=
 =?us-ascii?Q?lv6GxhQSjuUp8p4X7zcquVhcatHB0DmUSZnE?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(30052699003)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 12:18:47.8868
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e93573-ffed-4019-f3fe-08ddd02c66de
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5929

After commit 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on
until late_initcall_sync") was applied, the Tegra210 Jetson TX1 board
failed to boot. Looking into this issue, before this commit was applied,
if any of the Tegra power-domains were in 'on' state when the kernel
booted, they were being turned off by the genpd core before any driver
had chance to request them. This was purely by luck and a consequence of
the power-domains being turned off earlier during boot. After this
commit was applied, any power-domains in the 'on' state are kept on for
longer during boot and therefore, may never transitioned to the off
state before they are requested/used. The hang on the Tegra210 Jetson
TX1 is caused because devices in some power-domains are accessed without
the power-domain being turned off and on, indicating that the
power-domain is not in a completely on state.

From reviewing the Tegra PMC driver code, if a power-domain is in the
'on' state there is no guarantee that all the necessary clocks
associated with the power-domain are on and even if they are they would
not have been requested via the clock framework and so could be turned
off later. Some power-domains also have a 'clamping' register that needs
to be configured as well. In short, if a power-domain is already 'on' it
is difficult to know if it has been configured correctly. Given that the
power-domains happened to be switched off during boot previously, to
ensure that they are in a good known state on boot, fix this by
switching off any power-domains that are on initially when registering
the power-domains with the genpd framework.

Note that commit 05cfb988a4d0 ("soc/tegra: pmc: Initialise resets
associated with a power partition") updated the
tegra_powergate_of_get_resets() function to pass the 'off' to ensure
that the resets for the power-domain are in the correct state on boot.
However, now that we may power off a domain on boot, if it is on, it is
better to move this logic into the tegra_powergate_add() function so
that there is a single place where we are handling the initial state of
the power-domain.

Fixes: a38045121bf4 ("soc/tegra: pmc: Add generic PM domain support")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
Please note the commit hash 13a4b7fb6260 is based upon the current hash
in -next. I have used the initial commit that added genpd support for
Tegra in the fixes-tag because this issue has really existed since this
was implemented.

 drivers/soc/tegra/pmc.c | 51 +++++++++++++++++++++++------------------
 1 file changed, 29 insertions(+), 22 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 2a5f24ee858c..034a2a535a1e 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -1232,7 +1232,7 @@ static int tegra_powergate_of_get_clks(struct tegra_powergate *pg,
 }
 
 static int tegra_powergate_of_get_resets(struct tegra_powergate *pg,
-					 struct device_node *np, bool off)
+					 struct device_node *np)
 {
 	struct device *dev = pg->pmc->dev;
 	int err;
@@ -1247,22 +1247,6 @@ static int tegra_powergate_of_get_resets(struct tegra_powergate *pg,
 	err = reset_control_acquire(pg->reset);
 	if (err < 0) {
 		pr_err("failed to acquire resets: %d\n", err);
-		goto out;
-	}
-
-	if (off) {
-		err = reset_control_assert(pg->reset);
-	} else {
-		err = reset_control_deassert(pg->reset);
-		if (err < 0)
-			goto out;
-
-		reset_control_release(pg->reset);
-	}
-
-out:
-	if (err) {
-		reset_control_release(pg->reset);
 		reset_control_put(pg->reset);
 	}
 
@@ -1308,20 +1292,43 @@ static int tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
 		goto set_available;
 	}
 
-	err = tegra_powergate_of_get_resets(pg, np, off);
+	err = tegra_powergate_of_get_resets(pg, np);
 	if (err < 0) {
 		dev_err(dev, "failed to get resets for %pOFn: %d\n", np, err);
 		goto remove_clks;
 	}
 
-	if (!IS_ENABLED(CONFIG_PM_GENERIC_DOMAINS)) {
-		if (off)
-			WARN_ON(tegra_powergate_power_up(pg, true));
+	/*
+	 * If the power-domain is off, then ensure the resets are asserted.
+	 * If the power-domain is on, then power down to ensure that when is
+	 * it turned on the power-domain, clocks and resets are all in the
+	 * expected state.
+	 */
+	if (off) {
+		err = reset_control_assert(pg->reset);
+		if (err) {
+			pr_err("failed to assert resets: %d\n", err);
+			goto remove_resets;
+		}
+	} else {
+		err = tegra_powergate_power_down(pg);
+		if (err) {
+			dev_err(dev, "failed to turn off PM domain %s: %d\n",
+				pg->genpd.name, err);
+			goto remove_resets;
+		}
+	}
 
+	/*
+	 * If PM_GENERIC_DOMAINS is not enabled, power-on
+	 * the domain and skip the genpd registration.
+	 */
+	if (!IS_ENABLED(CONFIG_PM_GENERIC_DOMAINS)) {
+		WARN_ON(tegra_powergate_power_up(pg, true));
 		goto remove_resets;
 	}
 
-	err = pm_genpd_init(&pg->genpd, NULL, off);
+	err = pm_genpd_init(&pg->genpd, NULL, true);
 	if (err < 0) {
 		dev_err(dev, "failed to initialise PM domain %pOFn: %d\n", np,
 		       err);
-- 
2.43.0

