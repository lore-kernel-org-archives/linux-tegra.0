Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2073.outbound.protection.outlook.com [40.107.223.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4823426157E;
	Mon, 21 Apr 2025 10:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745230144; cv=fail; b=qlAvnC+fN38bBN+QSxFHxBDhG3M0xFC9RZcLcwSzM6L8jSi8fVT1DmEn5U7m8YbnbC1bYFrLqxJnY2lIKmZmhlcx8LrTD9Hy2Q70hZUI30CERAR/l2M8zXgRu7e/anArgauv4aWoU5rjPEHEkyNDBk3A+S0tvobVYpXGwbzHric=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745230144; c=relaxed/simple;
	bh=SUCoBEwc/ZQBKf9VtDBeuhd3All+r3hMSBGlqOpobsM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xd2qZGx8Iu/huBa+KLwG8VYEZvAYJav5zzegjkROpHXLfqTeGNoi0DA6SdH1ESJEykKUoDa5XIdxWRxPUJ7jaxAvlkyPlPajrBP15XBWOhQMxdWtF+XDLyjoZVu2Gma1VNHRdfRRgF5mLbTl1FNakXK4Jbz59hGpUXypbc24xIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ln7wt0ri; arc=fail smtp.client-ip=40.107.223.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ln7wt0ri"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WfNkLqKi0p1wgHGXB/lBBshpo6D4LEq+cPzUF5mVgFl/dmobZtlsgVj8qiIeE6pk6xWWTlTehdJftilsvqQULpsxSpUWhtpE1vW1qebadWlljGt1qAPv+iJ8tuNIqkImzng0iE37PKTIqrUxdkbRMmhVTZDCrbHTJ9qylmv/bNO1a1OwhQkqP7PxySKACzh7eek8V2QsQyPDyWN1zUVY9qqI23u9HQXtG05hqSKSeddzP9ZxxAqEi7/7n0AS+prfgxTsXpupO/Fie5NpwFxCqwO+gxzK4qeqNNZQAdC7DmJu3STPw8pl2WsZYR6gD2L2pgI5ScrlZL94Vmmb6IsgrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JsQqPHrrQh5gLajH6xPpDqwWeExoM8ZLXW0N1I2rc0Y=;
 b=wh7rmMLVM52bXWnss7V711QNRxI12yDgYSXFkBJyY3l/awTSi7FM6i0FP6in9VUmZabxHg+jKsejZXAkNjXKMeFvEyeUQ9hzyXBdmDv60PWwxouyYqKk9BZJvrXqdPo6KdssvR02Vflbh2RpCp7lmQabzJu7tan7nCfxnbmD7aY47ya5UvN3h4piwczrTuSXr2MerKcmHXqIOv04luOzrZpBjX8K1Ks0Y3OL3jkBBUIgYNoOcL9pAi+gPn0BnGoN3BXB1WuqMfkimkXpT2ZrR+G6AIzbu+MaoGZkwPSwSamM1dA46jabIOCCnLAKrcqtzRoxpkNSnqMv5+qTCJvk2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JsQqPHrrQh5gLajH6xPpDqwWeExoM8ZLXW0N1I2rc0Y=;
 b=Ln7wt0ri8Ug6jH/VeqjAeo6hPTP0SXyeKAlM2Y2hfv1ZyRVrmiS+1aT+oE7FO7fM5CoihDGrB+kQ9NOzQXou2fxHPTyjan9NqCjUowFWhoSFzcScNDEhB8/fQQtN1ehXupDMJVEScrN4eNCf3PS9N1m9wl2/B+DBimhYf5wf+UJb+gY2CGRZquuDrw0isRSkoc83DYf3k8bhdR6LFjr05pMuyJuBPUIrkix55n2vhrRSqWNsCxZZHBFe7HYM66odKlbOo9VfQSDASzLXotYQvCJRSok+a34r0YB5ATT2gN5Y5T6pOhJ34JlSTbxf44pfMEIzc047M00Wn/vI8UziZQ==
Received: from BYAPR02CA0014.namprd02.prod.outlook.com (2603:10b6:a02:ee::27)
 by DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 10:09:00 +0000
Received: from SJ1PEPF000023D1.namprd02.prod.outlook.com
 (2603:10b6:a02:ee:cafe::e9) by BYAPR02CA0014.outlook.office365.com
 (2603:10b6:a02:ee::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.34 via Frontend Transport; Mon,
 21 Apr 2025 10:08:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF000023D1.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Mon, 21 Apr 2025 10:08:59 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 21 Apr
 2025 03:08:47 -0700
Received: from robelin-Precision-3660.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 03:08:45 -0700
From: Robert Lin <robelin@nvidia.com>
To: <thierry.reding@gmail.com>, <daniel.lezcano@linaro.org>,
	<jonathanh@nvidia.com>, <tglx@linutronix.de>, <pohsuns@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<sumitg@nvidia.com>, robelin <robelin@nvidia.com>
Subject: [PATCH v5 3/3] clocksource/drivers/timer-tegra186: Remove unused bits
Date: Mon, 21 Apr 2025 18:08:21 +0800
Message-ID: <20250421100821.2907217-4-robelin@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D1:EE_|DM4PR12MB8451:EE_
X-MS-Office365-Filtering-Correlation-Id: dd61f253-10ab-4f9c-766e-08dd80bc8910
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?be49j5soKYn1Hwf8EajLxZwb4SBMO5zrvlcMZez96Akrd7wOgRcqjFlgiaIP?=
 =?us-ascii?Q?jgP66triYe7o7SEuGklR097AL+ABZKrLHlitxjVw3GXQ0Cx+4N6xqZAZ7V7x?=
 =?us-ascii?Q?x4OR81rVXsQ0/NeU0nFv3+cTNQHJNP8l6MZRDgIGLsuqmQ+7BB6PM3p/G4M8?=
 =?us-ascii?Q?2AWLcynnCklfXk51W8k/n9ti1ounmu3rj236eseoYZi4Jc+2E3iUt94uLG/d?=
 =?us-ascii?Q?0AJTc+oA8OEo1S6M2VGMrZcq51DOZVeY3AL/3TnIeFpva2S/AtjSwnQB6Sud?=
 =?us-ascii?Q?ub1/lqwcTvNXZRMQ8yG1xStiTWVrwe4IPTAXRi/3yYUTEk+GDftnsnKil5j2?=
 =?us-ascii?Q?uaYcXWDPHflk2VdILi8hOHYqWoPI1UBq/90+1a1av1ekR3LuJBjE2G4O7Yz5?=
 =?us-ascii?Q?BcIHE3BYx4+jXpMT4tfxwTthXjdSdqHABkoS8hwVdWn8wJ27B0KHQbjQ/lrq?=
 =?us-ascii?Q?q4VhIvWiebwDcElNWwPahpasayOmLtQ143q61CzHZaVmFaAJH7NI9TYJzaI/?=
 =?us-ascii?Q?DgNFaZFgeY0EiuvNb+HbMjGZo34nrDoDC36MTByJAdXpeCE4ucJ1W2JK1vwg?=
 =?us-ascii?Q?gt4Ih0l9qL0L1CmTpp11vYA/OFLJ7Ifcaye40K30nx+d957zer7/BNBITNMc?=
 =?us-ascii?Q?LNGN6Qfu25L3vZhfIYONkzc+0RGlkpw2ytyTXC9dJGtb4a85pp364FggKSUu?=
 =?us-ascii?Q?sgZMDFAiPAXB1BuR3X0Hk0rfj8WuNWFgEjjrDdhzsEyJqAqjszsJ8+OxoapU?=
 =?us-ascii?Q?+wJN+EHS7N9bHp3ZXGZl1adqaAP7DACbXMzhe9Lu7UVy1wGM3v/UKr6d1z6/?=
 =?us-ascii?Q?PXAb+MEIZtHge4DdjtKixdm30/m+2t9kaoWtw7vdi+2tnQ281eZZhxVH3COz?=
 =?us-ascii?Q?auQmgitHObHT5zsOhiOi09q6FBMhBSIcBJ2s6l4yPRsnwHSx0iJGBDwcgLuP?=
 =?us-ascii?Q?KbjNE8aoy84eivAfptIPCyvAozGq51qjYgy0BEiklPZo0h4yqH8JuBP8mMmj?=
 =?us-ascii?Q?AlSzUrI2g0btZBvnCE8RdUcjpp1EAcv60YSIXcj8HKxhMBiZsu2aDQimwJEh?=
 =?us-ascii?Q?a5zgm4eH673FR3tUbKdBzzoQkMeE0vchrhSRd1KiFQ9A/gi1foA6LBpm8sbN?=
 =?us-ascii?Q?VbdpEGHJrGIFoJRjnC2/FjJmSokU2uZzbtv7cb4Zif0D2Fn9fcCEmaJrFBIl?=
 =?us-ascii?Q?jJMz8Z3pUPbGtxeksTURu/AeJR88qTwCQD1jXW/JHeGlbyI6vkwF5SnTML3F?=
 =?us-ascii?Q?Phi4PkgOO42zoEogY4/c/k1ec5n37E3kHY5plRgZyfgd74mTZ/lHteu+1SNd?=
 =?us-ascii?Q?gEONoWYFgzuHeXZCVDaDCWBbgJvFW6RLnKgs9ZCRvZldk8R9RAsKYI8E9w9s?=
 =?us-ascii?Q?XgLyy1tSSg3TNeet6mA6qM4iNmESUAFA4avyHFuw8KWWKbVzVXijgXUM2slj?=
 =?us-ascii?Q?LWkAFvxsqXcsM3O8ZsfK834rP11THicT8ejryVS3EEojuUuJfEOAGH8Ua73w?=
 =?us-ascii?Q?uux1iwie2dxyTzCYUWieRnFOtELXKfFqH444?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 10:08:59.7200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd61f253-10ab-4f9c-766e-08dd80bc8910
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8451

From: robelin <robelin@nvidia.com>

The intention to keep the unsed if(0) block is gone now. Remove
them for clean codes.

Signed-off-by: robelin <robelin@nvidia.com>
---
 drivers/clocksource/timer-tegra186.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
index 4f06eb1ad309..1f4bde813a72 100644
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

