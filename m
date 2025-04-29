Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C7A275856;
	Tue, 29 Apr 2025 06:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909186; cv=fail; b=nYAHkyBEfxVHv+xxKYRMp2yCP092ebfvcUTtVaH32fDjAt9aqnSzsiM3ZCHHO6c0U7zx6sMDGZojZH8FYJyRniLezABF6apwxvfGCvcH+xeUi0fOqQ9pmHSy2fMxd9LbRTf4UIOFvk0gE9aRa2pdy1Eo0zVBRrORT+CZ/43yl+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909186; c=relaxed/simple;
	bh=9vYTafAF99MCUOKZq0524VZFNLuCOfmDqyseli8+CHA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Oy4WQF2/m2GSwLZ1MktNaKnr25XE3nalCDsU7hKHWiGtKlGzy2ZL1443gpLSlv5OYpRrSiluAjB6Un158/ouwiZ5JEZaEi6w2JNMfejyV6GK0C3tRE+ShgOhZ4s+AE69eHXnIINdSEgQ4uSFEfJWzDTl5V9YoBl/bbF4drCl+3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cA4M78Ko; arc=fail smtp.client-ip=40.107.94.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cA4M78Ko"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XazK6nEjf38aWIWK/12FSkg0eqov+3Uq4LqnNG1HCi6IjQkgEB+C/BrdAXClOKIOLa5pNIveORIepQCMk+6dqDzejGezHIxE0/IamvNHm2Nhlzvrqkjtqmqqz8/FQXBbfrF/Ov3umHIAjZnPDy55CsWsOBDTRV5OMQsl2Fvxn3Gqyi3M9sXeDFpv/Jbz5gaFN89I6cC+ijeDLintF0VrF0fLYuxuqMOOkhmyi8s/eKt2wuZHO0FDqFmm0ZNo9jAYjp4TL/fvPicYPEZdYSISSObHVP0wHIrW2SIga0wuSd/1RmVXABUfR3/2HATlKlAWGWyNudRzLrwgpgsCjvl9BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YausadEqMdedylRXwwMh8pxwq9uBMN9hrS680P5G2xE=;
 b=hj6RIsnpkjczyrgklSaV04MmmXqF3bDL+PZm0R5qq/HO8iE5xcINq1PxkaLIJ3Ibk4D22zPhgNaSC7QJJ9juvZ8FkM5jgbi0BqN8+7BFcwFPknQxnUBWKidhiL1q2sb+vCW2qszjz3ncE8lDr8BCK6gEqAQfex650y6UVjuWS/aEQUxh1pkAIpUaIWJqJi3okFVbEmbQucuKnen5OnZr7SQUbJB3PAZu0p01wK3DMNPNb5hygCdJqLse7+mk2i0ATa2hpM9D7KAVvEoFzBqiPntl+MawFj3AUisurJ9EtjVHI0ld02Ix1z1mgVZwywxHo5OYy7w8l8fuJ7c4R/NwhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YausadEqMdedylRXwwMh8pxwq9uBMN9hrS680P5G2xE=;
 b=cA4M78Ko/p+fFAJYoio3Bf0vwK+3kd0QCkxP68nDrHvi6cN7KhD9I3Tj1hVRKwDLkyrorihU9KVotP0gIbxtHLlKe9gJgcgRd3rPLF+jHyipwKKZbWxxXaHPQACVWfkDcQ0wXydJya2J3wPU/v7cNEm56JBKGN68ZmIGrwAd0sXn6Jl4x4zzAXl3aXijQcDDEhvpnkI1Vhrd/imKMPnErqGVH0pLFYeefAw/d7B82h5hBb+o8p6ncTR2tnrP/8QPg3vWCg5p4efsY9lGzw1kcJ0reHRrzEIGaalimi93VwFlYu5Gm0aAE1MoDkiFcxSJ3TexhQyrZu156uAY7tFB6g==
Received: from BY3PR10CA0013.namprd10.prod.outlook.com (2603:10b6:a03:255::18)
 by LV3PR12MB9215.namprd12.prod.outlook.com (2603:10b6:408:1a0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 06:46:21 +0000
Received: from SJ1PEPF00002313.namprd03.prod.outlook.com
 (2603:10b6:a03:255:cafe::11) by BY3PR10CA0013.outlook.office365.com
 (2603:10b6:a03:255::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Tue,
 29 Apr 2025 06:46:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00002313.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 06:46:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 28 Apr
 2025 23:46:07 -0700
Received: from robelin-Precision-3660.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 28 Apr 2025 23:46:05 -0700
From: Robert Lin <robelin@nvidia.com>
To: <thierry.reding@gmail.com>, <daniel.lezcano@linaro.org>,
	<jonathanh@nvidia.com>, <tglx@linutronix.de>, <pohsuns@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<sumitg@nvidia.com>, robelin <robelin@nvidia.com>
Subject: [PATCH v6 3/3] clocksource/drivers/timer-tegra186: Remove unused bits
Date: Tue, 29 Apr 2025 14:45:40 +0800
Message-ID: <20250429064540.1642030-4-robelin@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250429064540.1642030-1-robelin@nvidia.com>
References: <20250429064540.1642030-1-robelin@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002313:EE_|LV3PR12MB9215:EE_
X-MS-Office365-Filtering-Correlation-Id: b4c04054-5e66-47be-307a-08dd86e98d52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GyKBKpRQijdc5Itzu2Qjf3bBecnL7bU6J1JtwyJcPeNnb6kn5tyqoEC+hlwP?=
 =?us-ascii?Q?qwSTSBx4AxexpJyV9ubS0IPfbvu3BrNgnUMLN9JExKPommCjgYn7QJ895T2R?=
 =?us-ascii?Q?DGwiWsui04uAst0B7h3m/FCLBfITx9jjUJv9Zc0HrJXt7JUWZMc+7eIf1h5o?=
 =?us-ascii?Q?nYqHpWhH+fmL2ZhbC/8Uou615p8ibrVY8gA/q8T0pcfJ9MbHRhH4KYyJ0TCb?=
 =?us-ascii?Q?TYRx4faIdUzc08FyaovAibZmeC3rG9bgfJ2ks091J1ujc6foOjwKLYEkJLbT?=
 =?us-ascii?Q?f/l+x/2APM976OfHp3h7ej/aEutyjNzK96Xk3ZcazVzp/oGCueiCUBqvmzKZ?=
 =?us-ascii?Q?hybUtiRYLqwHAvRtGbCMTJusLXEZBqqUBt5mstGFj3Q97TKQX1PnjGd/TPWr?=
 =?us-ascii?Q?DCQTUtb2ntiBlR/LMUDMdYqlpwOBFMF5AtXCwZirMtzypU7f3n3O845vyMyK?=
 =?us-ascii?Q?QfJFsneI4xUITOm4IwPd9LTRkXzzWgJYDCuJOyVZiKQ4vL0JQZWHz9ZINLze?=
 =?us-ascii?Q?i1R5h7XA09hKjO2w2YNb3tzx+Ezs7vmyNXE8zuTt0ZiPDyH2dJwdgOzJfm2Y?=
 =?us-ascii?Q?IQhYWpmsQXT/9Ay3M/zGLRP8ysF5PSuiuSyFltpQvG0TxKPQmKqcZ018YeAi?=
 =?us-ascii?Q?ZAzGD0ODPRT8e45T20WoszF26/qbtmp/Cp7VLgHoiYvq9RgBYYxg30ArxYTR?=
 =?us-ascii?Q?kIxsFYhXd/U0p+hJPxwrLafy7BWs36XORiOgJqLQ+mHvbIDp2weVrep+gWJz?=
 =?us-ascii?Q?Z92ISPaf3cO3TAZ5F7lOHPQb/CS/nYGbLg0reEC+hSugtEJdv7/8+eMDp2aD?=
 =?us-ascii?Q?tWm/7NjNb8KAcE0XK8N9+UQYUVo4yv9nQP6Oo8BfrnWllgcWRY/1OAI9Fdat?=
 =?us-ascii?Q?E8kQsPVCh/cwUegvkkN0PQKgnoUFxF6yuOdLDjl9D4i8x41lqGSDusSpQ8pl?=
 =?us-ascii?Q?7UIuP4q8eft+sIvW3hBQFhAJNoL3gT7BGV+Cqo/dU7UAbJC5FgtokMv7l2jN?=
 =?us-ascii?Q?uhrutdVAgiLwItWZWWfjH66Ozqr7//XdHqtcnaPC7XlDx+XWNfjV1ZLwpy2a?=
 =?us-ascii?Q?H0BckFSrJsNaF0cQsEvPtHRg3dHNAUcwpDS6EI2iDWfk2ECqgKkbEFCAlStu?=
 =?us-ascii?Q?wtf7csp/DE6hqTwsklOyxG/VGUhwiChEG2+1u7zIsDe2aYKRR1IEjLEwxqaO?=
 =?us-ascii?Q?P3iv1wK4HaguO9Cn6jhAMmmCuzuyLlw89NZxnrGbH4CWV4oPS+jPjnQjvppi?=
 =?us-ascii?Q?lYSOvmMsxj58yeMChd1lhgFvN0Kdqju/DZHT74d9xVphGF1cAXttZmlwsWcb?=
 =?us-ascii?Q?e7TMKiivDk8KFfNOdSloXz5u+YH0jAwXrELf4dryZymw2dDax5EBXZ4V5y/R?=
 =?us-ascii?Q?I8SsiwvHE7/LijIEOetOWY+LIl1NsxisXIIjO0suqdQ/zYksfbdn06DkxZ0u?=
 =?us-ascii?Q?nu3Eb4VjdsbF8B/p4GZ+CRJTgWyJwWCc59JQCttix9UKrf/i04Jm92OUAYUa?=
 =?us-ascii?Q?yl3TQfNTKsKbhMkkaKVsfFvUTaXTQf6XWuMJ?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 06:46:21.1643
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4c04054-5e66-47be-307a-08dd86e98d52
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002313.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9215

From: robelin <robelin@nvidia.com>

The intention to keep the unsed if(0) block is gone now. Remove
them for clean codes.

Signed-off-by: robelin <robelin@nvidia.com>
---
 drivers/clocksource/timer-tegra186.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
index 132aa574c686..29555c9eff80 100644
--- a/drivers/clocksource/timer-tegra186.c
+++ b/drivers/clocksource/timer-tegra186.c
@@ -175,15 +175,6 @@ static void tegra186_wdt_enable(struct tegra186_wdt *wdt)
 		value &= ~WDTCR_PERIOD_MASK;
 		value |= WDTCR_PERIOD(1);
 
-		/* enable local FIQ and remote interrupt for debug dump */
-		if (0)
-			value |= WDTCR_REMOTE_INT_ENABLE |
-				 WDTCR_LOCAL_FIQ_ENABLE;
-
-		/* enable system debug reset (doesn't properly reboot) */
-		if (0)
-			value |= WDTCR_SYSTEM_DEBUG_RESET_ENABLE;
-
 		/* enable system POR reset */
 		value |= WDTCR_SYSTEM_POR_RESET_ENABLE;
 
-- 
2.34.1

