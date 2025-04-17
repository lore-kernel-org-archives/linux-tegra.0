Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2077.outbound.protection.outlook.com [40.107.101.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A66D22A4EC;
	Thu, 17 Apr 2025 09:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744882175; cv=fail; b=gWjmtISQlG/2Zj28F3uK0uuNEgdlDPZ53uz2n0BejNCl3D7UFgdSnBi09lAsSZmI7oWd4scZyYq9Wta2S6jxbHc5YDakagKtKkV6/eL+Kh6fHayPo6fOjspa9eO7hM/S+1cyETPavb3DKD9mnN7evNzYEueheeQhY9BhWvTZb0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744882175; c=relaxed/simple;
	bh=8wODaiLMYPBK6J65EJWHa/0sK9fxUXBZItHBLW+DLV8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Bs1vfp4isBkRADxlxo63S0Wcnb+Pf+cOSuhRT+PQvvW4R8ZqG2uNvrIaiRxKCJ7T5hR74CHmIBGucR6ni6wLfhgNQFq0ep7zEE3q30+ruCCsJ2mCUfx85z8ZfxO4rK8eptH/nmn+YzHJx6UNM5kf4coBA5Y5D4sOyTXmnu+RJJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RNPRxH2o; arc=fail smtp.client-ip=40.107.101.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RNPRxH2o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=an26IVlidWojSg7LJRADE1lsuoHg+3S/xtOX1Q/PLWQUi5mYN1L/Ggdkc4iGBrH/PC4fDrDMZwa6yGn9YL3vOADk1Our4k0F5Y5tN1lqgDNgWAoU3WnK+0bhvZqXxOPAlqDRSnKqEbGgAUodkUEfVWqWu1stXqd4ZB1JJxzVrVlEhUpj+20Z4fofQVVCO4vCBZG/wM3C03wwcuyZr94Ak9fjoDHIOrQTOJDAykPAB11mUw/rWZ7tUQeE9lZH9fac8FtF9PeEhL8r119Ozf5IJhTA4Q/e9x0W9tmvTkYKWhjFe91Vfg8/cmBwOce74YWxhyWdKoXuXvPIKVIv6u3bZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZsKDdRv+yPN5oywjRmMj9hbVlV6R0jvxAKmUgubQwGw=;
 b=H5p0McjpAtv5PFPF18eo6XXwTRsoxlZqYWswsv3VjZkqZ20sY/EmlWtfuPVhP4eu/YkIEpYApiPvrCz1qVJZW5zl4HfJJiYoGGkq6eji6XZxWOXLr8v0jdGOYYvBDKJmNlHWya+g0YczqZ9YZ7DfNCgQr0NWu0heJf6PVn0bD/vfSRaQ/TIYizgehzhZBCq0TG9s+AfbaOEfpYKrSBlOUyC0tOHEC+FesDPDWKV2CJmJ3mHNtof8bXh8l2OxuGmmQR7BugyYJYtb1gYcBR6/C1K5drsW9rhEqtb1zknCcA4oMALbzWd4I2PsFMV77dS0HSTi7oQqBE8c32KzfVvu9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZsKDdRv+yPN5oywjRmMj9hbVlV6R0jvxAKmUgubQwGw=;
 b=RNPRxH2oHusRNkuA51U4OIPIrubgoWUcbR1ObO1s7URpmdlzP4BhQGKX2uuOf+zqxJCMBugdv3sS6/P16KKYlvNUWyMFOxGBSzsVppHMrpA4Yj184KMVO6LxrGhnB+A2jE6j5Iosz71dnDnP1Sn1rF8gzo5yj7K05VeY3LOR2B1UAUKf6vOyH+qC1iJ8eRSXHwXiIBMeJ0rxkCFpgxOdo1b04fVrRbUP1aHKxXtgIlO9IyUI400Y8+PNv708xHq2kKdU99/JCcuIBkm1xV1Ujch9og33gKKXFHjXTgRK/UjWBiWCVyNiEoeW+pkmkZ0wZHdT9gOfEHTeb2Bz9Hnbuw==
Received: from PH8PR20CA0005.namprd20.prod.outlook.com (2603:10b6:510:23c::13)
 by CY8PR12MB7097.namprd12.prod.outlook.com (2603:10b6:930:51::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Thu, 17 Apr
 2025 09:29:27 +0000
Received: from CY4PEPF0000FCC0.namprd03.prod.outlook.com
 (2603:10b6:510:23c:cafe::30) by PH8PR20CA0005.outlook.office365.com
 (2603:10b6:510:23c::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Thu,
 17 Apr 2025 09:29:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000FCC0.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 09:29:26 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 17 Apr
 2025 02:29:08 -0700
Received: from robelin-Precision-3660.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 02:29:06 -0700
From: Robert Lin <robelin@nvidia.com>
To: <thierry.reding@gmail.com>, <daniel.lezcano@linaro.org>,
	<jonathanh@nvidia.com>, <tglx@linutronix.de>, <pohsuns@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<sumitg@nvidia.com>, robelin <robelin@nvidia.com>
Subject: [PATCH v4 3/3] clocksource/drivers/timer-tegra186: Remove unused bits
Date: Thu, 17 Apr 2025 17:28:17 +0800
Message-ID: <20250417092817.2751534-7-robelin@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417092817.2751534-1-robelin@nvidia.com>
References: <20250417092817.2751534-1-robelin@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC0:EE_|CY8PR12MB7097:EE_
X-MS-Office365-Filtering-Correlation-Id: fa1e0045-b7b5-49b3-4ce2-08dd7d9258e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rDib9xbbUswcPsMzqIrPWegZ2ieWoYeGcGBeo3g8JoXXlWQTvIZxcVxkqVbw?=
 =?us-ascii?Q?3yNA8GKTtBK9toLUmJ8Hs2FTTfmY/YUi/ObleZOAEC4188KqYoLmg9mSo7Ir?=
 =?us-ascii?Q?+cT++PQnl4J1rsQciAcoOwr1HCpOc5b8D6Aiu7WqsfyTWQU6PJtiKCIWDnI5?=
 =?us-ascii?Q?tyCiOp0jUzErh/1KFJHb4Hl/fkJWTgbPrPAmkpKV/qvndyYgdmFizuZbHgwH?=
 =?us-ascii?Q?6DzSPQZ9lbxo+o3MJ+ChsLmh2jijG6A6nPf+/6rQ9Kl7cbh7Y+ltxQEZRlTL?=
 =?us-ascii?Q?nPpmTT6IZSU3cKTVMWQrN6v2+VFtJNwgJ8X8xd/s61JWxhHoZNCCfqelE/KM?=
 =?us-ascii?Q?gkfta7cTisqiM2n5aYq3Mf6FXCh/H4ORNXt5P/ire4xND3KVkQ0gsRf8DIlo?=
 =?us-ascii?Q?2hFQiEju1pCEQFcKUehlCTg5YoZCvop8A9F9s8KAATW18NnX5qrhjDUARtUG?=
 =?us-ascii?Q?3/+du2Y13Hut46BURp3mZS0OCO/gDwzxMn86n+NvnIEL8TbJjItx3dzaJWKF?=
 =?us-ascii?Q?3KmYfM5C9uzM6dawoCjmQBpfGjdJTbsBVoHoKXI4QbUS0PV2EHqO/L9Y+PqR?=
 =?us-ascii?Q?Iga5K4yJBRcRjnlQOSH0bQjD40UHwp/nA1nATq+VjsacFZAaiXXPrPXx9laG?=
 =?us-ascii?Q?v7ZJzNwj4+pG1tzsiGpA/MLDJouNoca0Mw01gxirneCqgW0u+9bRfiG7u3j/?=
 =?us-ascii?Q?6AhqkgCjLC24LQC/+sY/eZ7Y1GB3F/Fq0exNJWQbWTh9nvz5yCVLCiOaYCZc?=
 =?us-ascii?Q?EPOIa/zeSbhwNY01EbPI/x2/7X28kYawx2VDgLwgWyHEGbxhdO/XfSbh+dLy?=
 =?us-ascii?Q?GqQaNSPNLwrJgeM68aKrhMFKAElyMUYMUAkgLlynAr9RsfSN/bL+kU+TvU8b?=
 =?us-ascii?Q?dHgZGVDwRlkeN8GTLS3lBG5RRfYhrYQUA8q8avFUL3TShnbgRDgKLZjUbQZx?=
 =?us-ascii?Q?ygihZHk1N9KSuHHwstISvPmO3jlIQGiRwlusJ5MRNb7YP9Aq+YbvyVj1PMfy?=
 =?us-ascii?Q?+wVzSu1FVDtIwXTRXDVgYbRCO1Bw4Dh7E3U993w7BAmhBaxnC3+NJ57D5hHe?=
 =?us-ascii?Q?TGFSQTMyfJJQv9aCzXDYOXAoaOT93aoC0K/jj83YsbF3JuBzcBCIyE4I5lSo?=
 =?us-ascii?Q?an8IDPvUAuX/1Sns+lL2tyO44DD0UZ+Bz7o3AFkUIoAYeDLK63vReaoOxB8y?=
 =?us-ascii?Q?0GAZGlgPT9lEXWX8o2qigS+emRFtcLQ9b4Mupx3Be12nF+R1d8J96FpvWO7l?=
 =?us-ascii?Q?wgbuizn4qiwWvRYKUkEAHbT5UWK24ZiC0PyikhIBM8/0yUvg5XniAj/kOQi3?=
 =?us-ascii?Q?8fgscsVxJoptrD+6XlJ/eO6Tsx7FnOFkBs0skeKM7wNq2XluuprhSHBg1dkv?=
 =?us-ascii?Q?bPw8/Z2SvEVO7lQpuacee+lH0NlsHebSIsoijzShGjiE1yDswI4IDcwJXRhU?=
 =?us-ascii?Q?D7OKk8ux/Sxt8b2BaU7MUNG32w4Oiu1sI40tCUDb3E95/r4IlVk+5f9H7Md2?=
 =?us-ascii?Q?vBn00iOqlxdNWa0p1UvizZ456sEvRyOEVjRa?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 09:29:26.5126
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa1e0045-b7b5-49b3-4ce2-08dd7d9258e4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7097

From: robelin <robelin@nvidia.com>

The intention to keep the unsed if(0) block is gone now. Remove
them for clean codes.

Signed-off-by: robelin <robelin@nvidia.com>
---
 drivers/clocksource/timer-tegra186.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
index 708d9f8682ea..a52b11b05934 100644
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

