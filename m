Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2077.outbound.protection.outlook.com [40.107.92.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B5822A7ED;
	Thu, 17 Apr 2025 09:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744882316; cv=fail; b=AapiWR4C8TojKPo2Kzn4vC8kHn9jxpALWqM1awIMhh3482uXNBDLpuSL2ZP9ASJpSfzYW2YNoz7D9y7M6JJZHQxSNa4LgRQTrW0X+v5YSqfSe8gAqHWxkiJuu+siMwE92zoiZGCPjxcQXKBGXu5tIX98zIopVtOGpT1Oc0ye4xY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744882316; c=relaxed/simple;
	bh=8wODaiLMYPBK6J65EJWHa/0sK9fxUXBZItHBLW+DLV8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GBbYJEo2d2/7BY8cz6yW/BtkKSQm94YFlwPvK+gDKyYJFxwHNOMgS41GIcUjk8jdfeLv6rjao+ksu+jXqKj6B/bZ+Q3ShRPzstRy9C14MDUqBI6RkuJ1MGqcRzsRp4hFAUnkVLWTbH/dGb0K4YdiA8+yUK2p5k3o1ziYJLWlmgw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=n/zrVRoG; arc=fail smtp.client-ip=40.107.92.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="n/zrVRoG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PnBV825+wRTnyqsD+ALkGHY//eV7NoMd5SggaqIdTFNNlLqCC2/b35PCGfQYHbTlPb65XUi0eT0fMsYUu6vIpcoTqXIZuZxoJX7gwkS2hCGkMo91Mbn0CEpHSMO+JPk6QzjUicHhQiIqjqt92f3nR7aJBZM0LvVBv8sTV4Ivm1bzcUQHGEoqkVZBF82QYzj9A74Q0WXjQL19e9hdjsqy+gfRs86w5frVvPrnByReOjCjO46osB6CsUTv4kc48qKllaYKlRidTVsob4NLLP7eUW3gRGPWeGT2MwovDTBUijHkA8lsmnLJoXaNcK1oN/fnrZeeRQdwz0Auc7fDOYXUww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZsKDdRv+yPN5oywjRmMj9hbVlV6R0jvxAKmUgubQwGw=;
 b=M/uapIB5j9G0woJ4lENOTS8jVlVrTH8Hj2qa+Bz1Mvlt5zTPXZiQOrqGKWygXwKDqsa/SaD1fCnFM7SqEH0o8cgAr76qDGZDQzo0C6gx6rQ74D/yXmim9X2XmkvVeSmfDF79ZbQSyU3Z/nsr3XTEjk6duAch1uRhLMbnqUqXF8xxxyRTQv5YUkXrtZzOJrmpKrrHbHT2K8OcCvYCJZn6d67TS2IIs8CrWMcCTY3IYLGxuROXEMTHUF071tXdh3ZgSplcqrX546bxtnwoFLmN44vpF+omcE98glY7+fIe4ZlvLPI1xZzwOBOhJu6zApCsobUGsRkNMrp1Vzjfc91NeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZsKDdRv+yPN5oywjRmMj9hbVlV6R0jvxAKmUgubQwGw=;
 b=n/zrVRoG8jGjZvblc6XsAulCmTH62Cs4RkogtwuuOZIX8v1eQEg6oMcfP+MnpHrD9hj/9wGv4pccORbGhrKT9Zn60oN4/GOrwX7YpPXWKZJafl/yyPH99h42Mzy7+1VnbsxummbIJY71fIPUQts9pOuiJdyvd0KCjlXbKcHGMoGUnV0oWG2NuegfLenvl+C5A34NmjJ79z47l+AWa8sPHuomwLibBKfQOBU20aY5I0rrj6msPH+dZ3MiMfnJKCe/plCMJfiYuGBT+U1+151hc2BnN1LusuInx21G0jKUgcZiCQ1m2070PMRwr04NdTasvJcu6qiV4Q2eN8P9rul5Xw==
Received: from PH3PEPF0000409C.namprd05.prod.outlook.com (2603:10b6:518:1::48)
 by MW3PR12MB4410.namprd12.prod.outlook.com (2603:10b6:303:5b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Thu, 17 Apr
 2025 09:31:49 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2a01:111:f403:f90e::4) by PH3PEPF0000409C.outlook.office365.com
 (2603:1036:903:49::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.15 via Frontend Transport; Thu,
 17 Apr 2025 09:31:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 09:31:49 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 17 Apr
 2025 02:31:34 -0700
Received: from robelin-Precision-3660.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 02:31:32 -0700
From: Robert Lin <robelin@nvidia.com>
To: <thierry.reding@gmail.com>, <daniel.lezcano@linaro.org>,
	<jonathanh@nvidia.com>, <tglx@linutronix.de>, <pohsuns@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<sumitg@nvidia.com>, robelin <robelin@nvidia.com>
Subject: [PATCH v4 3/3] clocksource/drivers/timer-tegra186: Remove unused bits
Date: Thu, 17 Apr 2025 17:31:10 +0800
Message-ID: <20250417093110.2751877-4-robelin@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417093110.2751877-1-robelin@nvidia.com>
References: <20250417093110.2751877-1-robelin@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|MW3PR12MB4410:EE_
X-MS-Office365-Filtering-Correlation-Id: 8176a29c-4ca1-458f-4212-08dd7d92ae06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fRt3YowmtnNMDFsg0z124Mtuvmau03ygdyE/El3yQB0YykoRrrbpvS9dqcUa?=
 =?us-ascii?Q?DKrVNLgaBpxRP05SSaYl4NbStlKWLN7U7W71RzbmQJCrFlrSdfNDB3otSoNv?=
 =?us-ascii?Q?vfcnxG8NVIrPcagg02rq/x+BThfCA6nLE41+Ql0szJ/RuTGIYJxn1MRapRpr?=
 =?us-ascii?Q?8c3spBdhfy371dkawXAK5Cv3C83gIvIkk5yk9caiBFuwLbpb9ZIJudKrmWOk?=
 =?us-ascii?Q?CBLOrc8cOXiZslrwfVa7aZi6jgvZxWCA5ttRct+sHRnjUmrFRJDwm3eNvcXK?=
 =?us-ascii?Q?sA+2+6zzszl/qfalYoZmTOspY1g7fjHxtMAFkcHGQpCXnDrpyVn/5YFIo9je?=
 =?us-ascii?Q?v/qzz+D3W9lnpDCYnK1Oz2GXDzLnvl5CJQVdFyVrfBFf0J2+Ra7ws9KDd4CC?=
 =?us-ascii?Q?OMSWV+z8i0ri+uGUoPbQoMdTyIoCbXH0Oqf3oFfpniNZyvK7AbCBZ9yl1Ovq?=
 =?us-ascii?Q?fbmWkiildwdT23fZco9u0MOanAS8P4zv9ZTitX9yXP1Zmc5sJIo2ZkQAfzLX?=
 =?us-ascii?Q?jP2vfuPzWSyi7HOI9Ux/v/Xob8W+F11JgZcNBNt7Y8lxwP73pkNYk5xiSzsB?=
 =?us-ascii?Q?bfwbbyHP4C4ZeTBFiQFgwvHLAi3SDSImjTPmyRhpWke5abmy1KUzg0KUVPOX?=
 =?us-ascii?Q?FjobeB5Z2K4bP+wSii/DQWCyj1bnfWsFddEcIck29kBZ96PNc1cLKT5F46tH?=
 =?us-ascii?Q?YRM4E9TADSOcWV2iwpGu5BdMGej0lgb8njXQQjJKcVqXlFLoEeS4xsWg8hV3?=
 =?us-ascii?Q?8H2Y9bpTggZcprW3cAIvsKG3qpBzydE+GFvvAnTdPWVy5vl9TBvqGvQM1Bn7?=
 =?us-ascii?Q?gyfQqVvwpO1uc0pAC66NOjJDfxVh2VqNwAmFSvYFGO3OeZqSnWk1iObwOTu0?=
 =?us-ascii?Q?uTuPhAN1XIjKlNhH0kxog5oIlB69yt4PsXVQwUzcPcWoqJbRn3MsPGiPs8Zt?=
 =?us-ascii?Q?i7Eew6Ur2ou4Mdvju9gQ9hO5WAkBnGbwvfcFxJPi2a/d+NzqbCs4ZUQqljJG?=
 =?us-ascii?Q?ZYEKNOz3Am6A4QFYcAmZ7e6tycf2V3UT0sDKQ5CR1Jj1+US5me3OLelAt8WW?=
 =?us-ascii?Q?X/ikq/DkTFrzpHEZXQngIKxbH4L21lIIndgQN3+1gFvTQ/4H1kKqE9hJNSvd?=
 =?us-ascii?Q?h58jp3p18rqbaWvYYEnOIPlB22SlpRl5CTjeZcESBYVxE+KFi3lhmhiGO/rc?=
 =?us-ascii?Q?FADKLt7JdsFCcbfE5oS0Zy9dPZseqj8964ouEAbC3lka3qzm8AQzW2qh0k5D?=
 =?us-ascii?Q?kD8JYTfEAp9O3eAJhtshuFdTJtmwvpe79EK5vWbklVZPHqXyjWt93wWY2w4j?=
 =?us-ascii?Q?NRB2Dm0Xwsm0VAZ+u5lPo11tjiKuSMz2jJmDgx4MkX7P7iEfZGlpcPzcfWjg?=
 =?us-ascii?Q?00k/7lrrOjxVVwNNoedujWN4fSm9uicSkd5HweNr/eVnXxyS4xtrgnnir7hv?=
 =?us-ascii?Q?cwHThKaMXnf98SZR50mOJ1JugBtMjtagY1QTee5yVbmkPnTEEKczbl5KqkV2?=
 =?us-ascii?Q?YyXItC6MW7910NCQhjo44WHNye0uBVyiTnxw?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 09:31:49.3415
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8176a29c-4ca1-458f-4212-08dd7d92ae06
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4410

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

