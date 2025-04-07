Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9816233730;
	Mon,  7 Apr 2025 10:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744021440; cv=fail; b=lthi/vmwBP9Yt1KltAkCoI55qWap6j0alp1/P7D5aJ+2F96n34kjKuoELF9RP4DRopUJaicwgEdr3B7S6dhLh6KHaV4ObPdAXRxCMnNulENNUAN9X1bUVPnod0ZBR5PX2lTx1hL9Auj4wqSHHmP3fgI43ssNKw7fqrTX1GgxLiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744021440; c=relaxed/simple;
	bh=1xnaE5Q6WzTqQT9/AgPQOP2O45w2UH/ih4TSkaUMlEo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wk5yZ+NPEsnKQJbzAauiyznblOZZOjeJoxjLmeSOyso69slb0G5rQLFkbELwg+GHnaK6TztihCttBRjxJkAYBLTK0oeDP4+0wu5rIqGtVKkb89qUueExHyla2yTYozam+gQXLhnBN7zspWkcbKYOhXwekVyIj5g9AO3L6t7RX6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=F3P+l6FF; arc=fail smtp.client-ip=40.107.243.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="F3P+l6FF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NR36nc+YrdkhwcdaaZBlGUKbQ/YW0P8ZY4r2cAtrFrjYOEKEeTykV4/hnLlozGmmTn5eB3us1hfYGqdPb3LmvYs827c1h5KfUM0IQADvdHMOFTo1pVzz1tl6vZPoYyPPwK//DphjEjx8VOlAgmyWnch/rLcz2dtpN5Fv0IDo4uhH1bpFl4DMSGbhZTFLhD73+Jkb8GOLlizIKQuVLgil//L7KoPCoXF2UPAUFGzMwjnmFClm/VI2fJGjNjzJD870mNfvbHzIPq0R1rzat4D9u0rAGSBzUsq0Ewya3PkJrrve90QYx14YBf7fIDrE5829GKFyvO+gC0ILqbOjUM+dbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xuRALAx4iavJWHRDu89e1uSam6abKNqIeJ0diKZs8ts=;
 b=DSWxOMXIhK0Mf2hnFYIF5ghsS5ffr8lsGK32eRXlJ0YgdIo43SPk5kOZprP/rQXYAUTczM/aax/fXuG4LQUZoxOsQ9Z8lPjvqYtR9NNJ0IjIcHLF8nC90+yHgs6abud/nHcEwDW27kRa8rsJ/Kw7f7WQ85oabS4Dzk1oCdWGxwHKpEAoT1p8ZXFUEQv5R+qqoeVf5Yq7STFgDzOyMuNUqY6c4FkgpMxSYRQNgMRlpuVeBlOMpsqOU/WQM0b/AmiacuPehHJc7osdu/l3JNTh7k/LeRiLwdwb4CO0N+0J8mfNllhLD2k64Wn7J3eR9N2jOmFl+6s21wQv9jjbeErZXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xuRALAx4iavJWHRDu89e1uSam6abKNqIeJ0diKZs8ts=;
 b=F3P+l6FFT0qeP82QD9Gf4jBiWfVFLC+ZAgHSz/0Gi2aWWkc4l3EaiUPEi2y7fVLuaQhSWpHk11rCVbA3OGivGCXJ9+y1b31NvudGzeH55i05gTPP7Xt+azQIm/oZCfAbaEHjbQss43DXP8l5B7ZETc4muIHpCJo3bh7lOPxX3j/hA25SEarMmyMlc66PRHvJU6m0I59nGmR7loI2nmcHFMw6LX8qcyBmCPPYLZ4zXS+QmSHpE5vDvAnbVgc6ehEQkuhHeAj81exv2j59WKnXHTbOxa/ulDtmlDlJ7j2ulAhBDujYEZQz7EVHIUT3Ln2F70+4VxK+RA+EhUhRktgVTw==
Received: from DM6PR14CA0067.namprd14.prod.outlook.com (2603:10b6:5:18f::44)
 by SN7PR12MB6670.namprd12.prod.outlook.com (2603:10b6:806:26e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.46; Mon, 7 Apr
 2025 10:23:56 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:5:18f:cafe::63) by DM6PR14CA0067.outlook.office365.com
 (2603:10b6:5:18f::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.35 via Frontend Transport; Mon,
 7 Apr 2025 10:23:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.22 via Frontend Transport; Mon, 7 Apr 2025 10:23:55 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 7 Apr 2025
 03:23:44 -0700
Received: from robelin-Precision-3660.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 7 Apr 2025 03:23:42 -0700
From: Robert Lin <robelin@nvidia.com>
To: <thierry.reding@gmail.com>, <daniel.lezcano@linaro.org>,
	<jonathanh@nvidia.com>, <tglx@linutronix.de>, <pohsuns@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<sumitg@nvidia.com>, Robert Lin <robelin@nvidia.com>
Subject: [PATCH v3 1/3] clocksource/drivers/timer-tegra186: add WDIOC_GETTIMELEFT support
Date: Mon, 7 Apr 2025 18:23:21 +0800
Message-ID: <20250407102323.2690911-2-robelin@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|SN7PR12MB6670:EE_
X-MS-Office365-Filtering-Correlation-Id: bb9b224b-d3b9-4bc9-b949-08dd75be4d69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ufx00z+OeiQ6ga1IVhsSrISldH15ovGUc7fAjYyldoh71sX1J9u4Q6Cbfy4M?=
 =?us-ascii?Q?ZxtxScoQxYvNy3XsUq+eVyKkuAimLNQPPb+R85NWXLpxxb3FtqlXecFS956O?=
 =?us-ascii?Q?3ytPHdsB4fVwYqhwOfOR33WfACG0H9A2cv8Z3nc4rJGnViD2WXQhLvXTosgz?=
 =?us-ascii?Q?d/SElMTt2Cj6NH9GDx3acsdT2EHDFcIuqYmB/6IMDD65JGTaBnMIFKzVr+Hx?=
 =?us-ascii?Q?FzynJEveGqV+jZjbbclOG1vSw9UwIsP0v0X7FpO0eDXC0YKEMUBfZz7wyYlU?=
 =?us-ascii?Q?P8vrg+kBDePjrw7UP9OTyId1VwdS1Bm9qHPdXLWVZ83iqlQu6x1cjZSkIvRJ?=
 =?us-ascii?Q?ZpM+1ZJxk35cLlTiC379zmWM7HXb8WKgkUdopxefK5qndav3oBRroRdPO++r?=
 =?us-ascii?Q?irsyV3QCczt1RnC7rB6WLs5/FFpMegst7szd8LsaoY2P0/Ljn/YwMiIJ57ex?=
 =?us-ascii?Q?yZQyxJG2CAROwtJBvBZaWl/+C8V4TrxvtKdDInbBmNgoQhDacWJrzfTrDYVZ?=
 =?us-ascii?Q?BA2EgFHfZDXRIJwazVeDBMARX6qaU7w+4s8ZVKFgYR10YPqtCeJZ9aBHWigY?=
 =?us-ascii?Q?QOCmQQL3vUnjcgHrba9SGlgPSeKV5WuIAsKnb4vjSbBsl/ck5lXh7lyFIKM+?=
 =?us-ascii?Q?MFXnQwGdnxPnIYVrO607dihLQEN1DAOP5KuwHevrvsqoNK6Qnh9LoG3vyeMW?=
 =?us-ascii?Q?KaN7ndAa+ym+n4l/ou6LngWL8b+me4IEFKVu4zFyDxKG+cJuoJpWR0KqIi92?=
 =?us-ascii?Q?Ku8DnT/4l12ikpnUigLZ7nS/b3un05K6ZtPvaHBT79CW7qLrRQSzYk2vJu9S?=
 =?us-ascii?Q?fdIXe9yPT8QSOXutP8bH9/oce5pAmYD5MRZAV6gBGd/HPh8jWQ4d1R496epF?=
 =?us-ascii?Q?zZo8aBB7Oti2OY/QRXFnZcekBxN3laq451PMyFQ4C/YI8U0exyVQsFJwPKdy?=
 =?us-ascii?Q?00UD4KQ48bvcRoofOWOdZxbR1qKy/BYy8shJWql5f+zCLbmVNadKttY1Cfkh?=
 =?us-ascii?Q?ijIpHGd2R0bZDuhlu8ZXDj6HuKUy3ZwO7Lpx8e26VY2VxNnsLZsUcH6MjZM4?=
 =?us-ascii?Q?t5e8YJMt6jy4885hKH2Nrkr0PxzjoUdXSEwrgMAv5LSuZD6Ngykqog919SmX?=
 =?us-ascii?Q?4YY/Ahqtc5qTQxLg24t24VopLWExdiQrGRvyN4V3ZwiQ7hcuUQXzHlTkdmn3?=
 =?us-ascii?Q?07ZPx7iV9/vwWz9Hmxh+501HGUddoIzmKC2dmuWgpY9+KKSP+QisNy/wdr9t?=
 =?us-ascii?Q?0HL8sem/gKx3h5qzYkQTpevccOrQ0Gr3jNZtAHKQ75FpwB49ULJOfOthypf1?=
 =?us-ascii?Q?gjxJ3KYuA6nZFbmSux3Tv9MLEZoEU+3gaPImj2f2areDrhfR25r//pmxf5yJ?=
 =?us-ascii?Q?6sveezyVcGAVYIGxNkmNxlz2QFqKZrixAhf7EvPwp9CyyaE8vRMQxnJedqKv?=
 =?us-ascii?Q?fkRtPEItlqDAoEx8aFWcsJG4ft4zDfpGsG0aoasTqCq7r8lEXvuhu5//1XUT?=
 =?us-ascii?Q?rg3nhKaZqh0o490=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 10:23:55.7926
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb9b224b-d3b9-4bc9-b949-08dd75be4d69
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6670

From: Pohsun Su <pohsuns@nvidia.com>

This change adds support for WDIOC_GETTIMELEFT so userspace
programs can get the number of seconds before system reset by
the watchdog timer via ioctl.

Signed-off-by: Pohsun Su <pohsuns@nvidia.com>
Signed-off-by: Robert Lin <robelin@nvidia.com>
---
 drivers/clocksource/timer-tegra186.c | 53 +++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
index ea742889ee06..fc2ca86c1436 100644
--- a/drivers/clocksource/timer-tegra186.c
+++ b/drivers/clocksource/timer-tegra186.c
@@ -1,8 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2019-2020 NVIDIA Corporation. All rights reserved.
+ * Copyright (c) 2019-2025 NVIDIA Corporation. All rights reserved.
  */
 
+#include <linux/bitfield.h>
 #include <linux/clocksource.h>
 #include <linux/module.h>
 #include <linux/interrupt.h>
@@ -30,6 +31,7 @@
 
 #define TMRSR 0x004
 #define  TMRSR_INTR_CLR BIT(30)
+#define  TMRSR_PCV GENMASK(28, 0)
 
 #define TMRCSSR 0x008
 #define  TMRCSSR_SRC_USEC (0 << 0)
@@ -46,6 +48,9 @@
 #define  WDTCR_TIMER_SOURCE_MASK 0xf
 #define  WDTCR_TIMER_SOURCE(x) ((x) & 0xf)
 
+#define WDTSR 0x004
+#define  WDTSR_CURRENT_EXPIRATION_COUNT GENMASK(14, 12)
+
 #define WDTCMDR 0x008
 #define  WDTCMDR_DISABLE_COUNTER BIT(1)
 #define  WDTCMDR_START_COUNTER BIT(0)
@@ -235,12 +240,58 @@ static int tegra186_wdt_set_timeout(struct watchdog_device *wdd,
 	return 0;
 }
 
+static unsigned int tegra186_wdt_get_timeleft(struct watchdog_device *wdd)
+{
+	struct tegra186_wdt *wdt = to_tegra186_wdt(wdd);
+	u32 timeleft, expiration, val;
+
+	if (!watchdog_active(&wdt->base)) {
+		/* return zero if the watchdog timer is not activated. */
+		return 0;
+	}
+
+	/*
+	 * Reset occurs on the fifth expiration of the
+	 * watchdog timer and so when the watchdog timer is configured,
+	 * the actual value programmed into the counter is 1/5 of the
+	 * timeout value. Once the counter reaches 0, expiration count
+	 * will be increased by 1 and the down counter restarts.
+	 * Hence to get the time left before system reset we must
+	 * combine 2 parts:
+	 * 1. value of the current down counter
+	 * 2. (number of counter expirations remaining) * (timeout/5)
+	 */
+
+	/* Get the current number of counter expirations. Should be a
+	 * value between 0 and 4
+	 */
+	val = readl_relaxed(wdt->regs + WDTSR);
+	expiration = FIELD_GET(WDTSR_CURRENT_EXPIRATION_COUNT, val);
+
+	/* Convert the current counter value to seconds, rounding up
+	 * to the nearest second.
+	 */
+	val = readl_relaxed(wdt->tmr->regs + TMRSR);
+	timeleft = FIELD_GET(TMRSR_PCV, val);
+	timeleft = (timeleft + USEC_PER_SEC / 2) / USEC_PER_SEC;
+
+	/*
+	 * Calculate the time remaining by adding the time for the
+	 * counter value to the time of the counter expirations that
+	 * remain. Do the multiplication first on purpose just to keep
+	 * the precision due to the integer division.
+	 */
+	timeleft += wdt->base.timeout * (4 - expiration) / 5;
+	return timeleft;
+}
+
 static const struct watchdog_ops tegra186_wdt_ops = {
 	.owner = THIS_MODULE,
 	.start = tegra186_wdt_start,
 	.stop = tegra186_wdt_stop,
 	.ping = tegra186_wdt_ping,
 	.set_timeout = tegra186_wdt_set_timeout,
+	.get_timeleft = tegra186_wdt_get_timeleft,
 };
 
 static struct tegra186_wdt *tegra186_wdt_create(struct tegra186_timer *tegra,
-- 
2.34.1

