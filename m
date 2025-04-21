Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C6A26156D;
	Mon, 21 Apr 2025 10:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745230143; cv=fail; b=VfAHddcXtImHWz+Zwa84mOYwZVzkU2jly4JPHk+n34sq19tWYg67QiXrl/TbHYvxoOaxohNyfyFzmlRKCguiPnE0Ztbdx5VzKDo9dw8w2RZHzQsTYH8vW6pz4+BqU1VtkcV3nybkDTv8H0Ot0cXKDk7oytUsvrgXXmZ/8VRCNoo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745230143; c=relaxed/simple;
	bh=Yb/n3JY1Vojv2KvH67cZXPmsp/z/230dJiXVoLwGm0w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Old6Qa6D9xpsbe9hPnptJF0pqNjzAT5DsGIKeI8SHfD7NI/QJiSYMmPF5qwGpq9CXTqufA3nj2UO7i2oSlPXIOQJ2k91+Ve/l0KFwn3YqHFc2hvANyiO3wDYKehEpL3b/Xg22lUckBqQLS/MlSfcj2TpyVeyf2WmqIEWztm1XoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HkckL93O; arc=fail smtp.client-ip=40.107.93.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HkckL93O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=my1I47M+SP3q10KjmmhcHhdF8r3LhsNHHY7x5/lkAPQeEu3rNH1Ec9XFszBPC8uNEGGZb1OuZi+/JgIVIj+RuLZzHfFpf47Fhqra7aqynFhznKpyJScIo8o2/IyXjjQhcLfeNN/qWd4AUzK1As2E8yvTIHI183GysoID0ViihBdD6wkA4NjAiEq1t/zNdcWmjweXlw/7kjUuJ3fAyBJSOjr2Nxs43SVHYHHCGzzcOUGZMRRKZhrnqOX4NVNjGMlDfpLLKjT38LNepBUragOMzyOc61/vPUHtJnscXBNhcNafGcg2G8oVOcmwht27FcZgxWTv3kGVXC1cvz0Zv3Fq8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=338rOiqvn1SFHxi+tbPqBsLNhUaAYbEWD0BEUQ9Cxe4=;
 b=wvV2Ni22ykOz6j1C6nLVZkSN5cVkUDPaKDekinBUmjhaWTmVumVhtzDNt7fwOF1RTgKy1S1NCzUDifa29koQqKLOcr5QETOTOcveS3fpBvpEPYCqfd5NDEh5CgvghUfIZ/vMR6z3kxw7dO3IcptPPg6Rz1CfKeJX1gPFVr/xZzlxkOc+ICoRW3JnwzCUd0uKE5cR6NXPlwCs5by9igk4Y88/2E3hHaD1x+7wBAcHHy5DVrk5ivv2UgSLc8qgivPEUH6rhzQR2c39TY7awhmkZlnyBoBnsxq4vfSuCPC4tfeUoJMvp+OpAI5Tr7u8XRVwIKL6XeJjfMEW1jj5xApFfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=338rOiqvn1SFHxi+tbPqBsLNhUaAYbEWD0BEUQ9Cxe4=;
 b=HkckL93OZ4/lmV91BTcgSe6+oXhDw0a8RHpquflIGr+WVo3c6S4rYjI1xjPiMhD/i2jHfjNzjgIWisfQWOp5hpFDHbe3I+XLjE6tfDoubnAxb6mRkJIyl0mUbtgUTRtJrbEsr3g3vCxKVBX7YEcoCQ81cG6oo6uU7s49hy+K3AB1CF+hIRlVsD157L43qtgyEaAogXReRaQox8BtNP2xipwSMB3PZLf9YwaErBqe0supR9ylV0UJU/Z1xFxhBLx5MttSZmbtRPxPWJwRq0s/u4CLMi+aVRpPhuXZQFBOcydhh/L4y6scZbtt66CyH2hZ6iQltErBy7/B2ISycmbp4Q==
Received: from MW4PR03CA0049.namprd03.prod.outlook.com (2603:10b6:303:8e::24)
 by PH7PR12MB6718.namprd12.prod.outlook.com (2603:10b6:510:1b1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 10:08:56 +0000
Received: from SJ1PEPF000023D0.namprd02.prod.outlook.com
 (2603:10b6:303:8e:cafe::5d) by MW4PR03CA0049.outlook.office365.com
 (2603:10b6:303:8e::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Mon,
 21 Apr 2025 10:08:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF000023D0.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Mon, 21 Apr 2025 10:08:56 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 21 Apr
 2025 03:08:44 -0700
Received: from robelin-Precision-3660.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 03:08:42 -0700
From: Robert Lin <robelin@nvidia.com>
To: <thierry.reding@gmail.com>, <daniel.lezcano@linaro.org>,
	<jonathanh@nvidia.com>, <tglx@linutronix.de>, <pohsuns@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<sumitg@nvidia.com>, Robert Lin <robelin@nvidia.com>
Subject: [PATCH v5 2/3] clocksource/drivers/timer-tegra186: fix watchdog self-pinging
Date: Mon, 21 Apr 2025 18:08:20 +0800
Message-ID: <20250421100821.2907217-3-robelin@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250421100821.2907217-1-robelin@nvidia.com>
References: <20250421100821.2907217-1-robelin@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D0:EE_|PH7PR12MB6718:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eaefce5-d1f9-47b8-c32d-08dd80bc86f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cpe7gS9bqLCsQtopsRV7uH6sSZIVwO8E8h6+t7y+U1kJ70hcvupi3ZrGXQsg?=
 =?us-ascii?Q?FuycCnsFxmOymgnTUJIZ5WTo+6GHZtRwogN0efU+DOFG+MateDZNDUKCg7MN?=
 =?us-ascii?Q?hcogZNqM3pFO081Iv9F8G9uO5TfZdIimMoyh3YGGTPNTuQ16pW/qTJ3Rzv9Y?=
 =?us-ascii?Q?fPcaqq+PXUln+UYJ5r/8E7FqUCu6zX46+ZRmSCeLScHwZAdzyWY65L8rDKJp?=
 =?us-ascii?Q?j7NDYJaM0AZl+VvgBZinNQv2bn3QRB057JE3oDNAg/QVYfxwIUopNKwGYoE/?=
 =?us-ascii?Q?9c5ITirBwMmOnViIOYah+5tOROE4jnoEnBd2rvD1juikmo56TRelEqDdk92Y?=
 =?us-ascii?Q?iFsLEGxHIN/oM+n453Q+lnKXTNp+3J3r76QENld8yu+Jle62+dS8JaKxfzzA?=
 =?us-ascii?Q?L/D76WBAgoz4u96MDz5LKJ8qt1lZbr35La5IlD501tjfpdQzD/ov1hRnmUG7?=
 =?us-ascii?Q?TJnt5ntBCfm2r+Nsh4zE+XzhjrjSemYM2CI8Lvj6UxRbipzW/ShkDt/cxeZx?=
 =?us-ascii?Q?9kdFq/r/AOW153FmTb8mTLNmBk/3g3NjZePH/hMDNv4nmLtnOtFhEChmC6WY?=
 =?us-ascii?Q?u+0snFwKneBkqiHYCJTZ2J+PAfP6PVnwqC+voLvUKg3goZdYabBdKZ43RaIj?=
 =?us-ascii?Q?BJNxoZo2zeImTYCSADwc4D5/YHuHJdntKb2UD3lbWQdz+BqLCmjXlyp/4wZM?=
 =?us-ascii?Q?DB18r2dbYM119jpPg52IfF9vJM3smFNdSLv9kjhEDtWg8/glsFkSa0O/xkOX?=
 =?us-ascii?Q?xh2iiYL01wvXQGUTy+S+Rbr1iweTU4/6d4OXeWBjGiyXVuQL8qUSmCwpk/g4?=
 =?us-ascii?Q?iyt3v7v8h9z7EifUcqeZZOxiXQ3BkUs+Slvxht+R9jZ3TTrqQ10hC/3+q8EM?=
 =?us-ascii?Q?h8tHZ00ufTPbzpfrRotArECV1Q6mOPG+AWXCFek0Mz1/lfe1Msvo/nPTIeYf?=
 =?us-ascii?Q?P11HW0Gz8gFtcfpB8tIQBVlMlLj3J0tg/7v/x9txNTzijzQcrwWBlShg66DD?=
 =?us-ascii?Q?KS5UgcnMsJDYC443NXNsODFij/ozhjDGxAVRKEPq/AQ0klcFlfmMrCvDBeZe?=
 =?us-ascii?Q?GvGCe5PFgeAhvxOkEZN8rXzAfKdYYs/9PkvQJGWbgTNTM2XD4MEk0IJxuNdx?=
 =?us-ascii?Q?05HPX6SWUhL1h5xluM8pfapB0tOvrDWUZXNiznxpkwfT+ErP7zCzH4k+Z5AK?=
 =?us-ascii?Q?9+bgFAZzRTHkwwjTNu8Kk7hUnIw+E7AHazQTgWPeU/03EjXkM5MyFA09oufz?=
 =?us-ascii?Q?TE5XuQl7oBa0zG31qsbfdXPCwqRE7HjgZTwXDs38AX0gFzuixDaEU1hoYUcD?=
 =?us-ascii?Q?g+HBy7Pw6hTGyzjzk0FFX3gDQi6narFG7nD42hqUo6wMmH6e1cfLU0oBbKfe?=
 =?us-ascii?Q?2xA0wwBQZadwuZMNHl5/SMsjz/UccMcQ+EFqo5JXkXQDPn/f/nlK/NcxWg0V?=
 =?us-ascii?Q?tPeHSWh3dCTp29L/teZG/G9OY9+lBtNkakMj7qn3nYHk7J+8teKJcIIC4LT7?=
 =?us-ascii?Q?/VsY6FtCEWxtObsggEyS2bRiHWONmR6kJi1v?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 10:08:56.1728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eaefce5-d1f9-47b8-c32d-08dd80bc86f6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6718

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
 drivers/clocksource/timer-tegra186.c | 27 ---------------------------
 1 file changed, 27 deletions(-)

diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
index 56d08bf1b6b0..4f06eb1ad309 100644
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
@@ -422,23 +419,10 @@ static int tegra186_timer_usec_init(struct tegra186_timer *tegra)
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
 	struct tegra186_timer *tegra;
-	unsigned int irq;
 	int err;
 
 	tegra = devm_kzalloc(dev, sizeof(*tegra), GFP_KERNEL);
@@ -457,8 +441,6 @@ static int tegra186_timer_probe(struct platform_device *pdev)
 	if (err < 0)
 		return err;
 
-	irq = err;
-
 	/* create a watchdog using a preconfigured timer */
 	tegra->wdt = tegra186_wdt_create(tegra, 0);
 	if (IS_ERR(tegra->wdt)) {
@@ -485,17 +467,8 @@ static int tegra186_timer_probe(struct platform_device *pdev)
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

