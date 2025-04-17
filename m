Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2046.outbound.protection.outlook.com [40.107.236.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D17227B9F;
	Thu, 17 Apr 2025 09:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744882313; cv=fail; b=tUNbpAMKaEMQ3gpSxe395s0nH2LStIi1K3jrofzDquVkM9ZKt2iLX6pdoj+6W0USqjz/RIK4G/C1c6xJtxizT+l9wjrrxn35Wit7fEBCiSHBk6tltlPMUspiLBjZJnjh1zAleEudAOlGlhl5TmQ4m8+lOvo3aupMMf8mYXoDe6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744882313; c=relaxed/simple;
	bh=BP51ViC1bD50nt8v9h33KXrDqK2nJxIqH3zJTiN6L3M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pp0SUxKcg4vfTgtqpeO4PDKNAlu7v+tcSJMoe47MI1bm9YNNnIbcEuay/OEG/Myd8QFOw6qy5QTsPK9QlIlSeE5SMja2f1+T9UEiPcvahPArTgF9+IfDbreTqWLseab7Ixo/0tn1FEoQZBo18pklsOhIw0wv5d82CsADkzTEnYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Q2Xe8TVe; arc=fail smtp.client-ip=40.107.236.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Q2Xe8TVe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dlTwxbcHL3nV279URatqvrrPgF1gA+VvmuzAyhxy3S+w8Fo8VY8gr/4E2pEGYfXtz7Diau1qqrmhUDdTMpSElsRnDwVQh907ZOKLB1q5ALp6hZEmFB/mdSNZlBILhcqGnpug6A5wSnuETlcCqR3pi2vM2gjbPTdP0fDOoxkC3mXmHWNHPoCRe9usE42nzWMMHvRNzeXqujTSIQBZ+kopkx3Dv1PFzlip0WpZBXEhvB5UPw1QRlAUYqgrf8/ia6Hw4l0i8vEFbznF4IquZYrNKrwVjIYYaFSEMUKVKji9sTSjY7+FXBI0+E1UDaAHXL0GIbilEyILJzHAt+eea2l38w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uylIS/TL1JsJPqEnaYIRyaa5f28yxZdHl868qrc3SQ4=;
 b=BMgVp6sc75yqjJd6edx7otMITirF4FY4eYJnJobNCNbKDx+pn8nr3tLAUzkwPxcHj0XxYojDvvdLyxJW79KsdkQz32cwOtsPa3pfHfuqMx/u1/53U/PpBpL/wFrwlvQ6dbquS/qzlxOYqnDS4tW/RBU7luYvt9VzF4C90ya9MlaDVkqJFUX4/2H1aY2vkR7rvVXDPkLXhRX4TIwkP43X7SPf0toauaLZlNwscn8rO3RPm6opSXEa3QnNNjLft/uMj6hPDs5JJoZoxnzhsgsig5g6JbEFJAgv3Tx6aMt1w80pMVB7MVsfyQujOoJzh6UjwcxwibmMMkLtNGuIZNDoYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uylIS/TL1JsJPqEnaYIRyaa5f28yxZdHl868qrc3SQ4=;
 b=Q2Xe8TVeezdHB7bCX+c1a96zgDgkH617WubELdlc5UyOAep0bpD+wGkl/e7AZJ0hk7EUK7IqYqtF1aGbxWOYoA/3Vw9dy2fQHj/mOKvXd/zxzqr4sMZQXYTnV0B27NLC3DNhJ6PD9OEJXHo1ycLUldb80+UGEDg3A3Lme4f2GTnacW5dZE2ftBQv0F3ezHChwmwu5McUG4j7uPGhdkIpmcyolSppStZf3Zh7DCrml+7tdPm3v/SJpZ40zs1o2OAM1RI6PCBlNj9WfrQp14XnZHlWLnE092VkXAZfC4+WOQ3uNk8ij66kRd/dyp/wdYEbTuDMrKE4jgx6uWkAXaQuQw==
Received: from PH8PR07CA0001.namprd07.prod.outlook.com (2603:10b6:510:2cd::26)
 by DS7PR12MB5910.namprd12.prod.outlook.com (2603:10b6:8:7b::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.32; Thu, 17 Apr 2025 09:31:45 +0000
Received: from SN1PEPF0002529F.namprd05.prod.outlook.com
 (2603:10b6:510:2cd:cafe::fa) by PH8PR07CA0001.outlook.office365.com
 (2603:10b6:510:2cd::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.15 via Frontend Transport; Thu,
 17 Apr 2025 09:31:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF0002529F.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 09:31:44 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 17 Apr
 2025 02:31:29 -0700
Received: from robelin-Precision-3660.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 02:31:27 -0700
From: Robert Lin <robelin@nvidia.com>
To: <thierry.reding@gmail.com>, <daniel.lezcano@linaro.org>,
	<jonathanh@nvidia.com>, <tglx@linutronix.de>, <pohsuns@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<sumitg@nvidia.com>, Robert Lin <robelin@nvidia.com>
Subject: [PATCH v4 1/3] clocksource/drivers/timer-tegra186: add WDIOC_GETTIMELEFT support
Date: Thu, 17 Apr 2025 17:31:08 +0800
Message-ID: <20250417093110.2751877-2-robelin@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529F:EE_|DS7PR12MB5910:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d7a7764-3872-449b-ddae-08dd7d92ab65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o+t4HZGwkmuAtSw9k2HkR9PDdCsN4SiV6C8JkZdRPJkrbVDUlHMqRWH2VwOF?=
 =?us-ascii?Q?IUND03gfOT/ki0UrB3lbXpPClqIIyZIXgI19enjgAgJORysdTKkvjn9OVvy7?=
 =?us-ascii?Q?nkyRGC5q5fkYP0U33CwGE3C4UtoZb9TlwKX+w5TcWPUMOYsfjCmQwSQ+xK+n?=
 =?us-ascii?Q?EVykDF6re/G51YW1jp94pYDrCEQ/1Jpc4GJ3AGChlcZ+JBAsSJ1v/wssS+5B?=
 =?us-ascii?Q?Fs5qwq2X7FHxUFP6G3aC+2IzE46iMMweVyXq5+c+LhdoJSWl4KuOaLdI0ajI?=
 =?us-ascii?Q?taMcJOaiWxRmbSD+J6vXGfnEWkKX8g0/lGrmw4gRdU7EvIFSfZL8y064Reyc?=
 =?us-ascii?Q?b6ARBvyZj2RIV8wVuCvwP9DCWhfhVYRGwp8RKI2z+MtVVgTqpn6eugxoSuii?=
 =?us-ascii?Q?6rBfsxLvaopCriuvQaCttMM5/Z8OvSy7zX/RhtoRqGLPQ7y7eXu9ZdWfdxX6?=
 =?us-ascii?Q?jSG5K01EFI8RqysiWizZcWB8GDLTbt3r4intYCRAzGVLEs4uhCAfwo7SVRnw?=
 =?us-ascii?Q?4poe62+pOH7jJKaBJr+/S5Tds7ZIrJ3O3gTNmdPGd8fzgF59R1x1hk1rI4rl?=
 =?us-ascii?Q?XecF8Fa7x+lDnK5UHPAJks+z3pELrHNpGnTKY4obHRwLOJTxtlVK9xHAHhWL?=
 =?us-ascii?Q?0Ka+I0iQffsGhgsTJuq3C6LwJCJhpfiYnWjjBj5tU1eYBN9du3m0XADeF7ZD?=
 =?us-ascii?Q?gt+EOhZE1z1NEiVXgKB8aSwYYB/sZlWZbFu1OZ74lfA/jzoDODq3rebLUKe+?=
 =?us-ascii?Q?0FQIDbytP0YEnqPn41kNlLOqNm9KRmnSo9NIExItJFOa9+PYiVGNxJATwnPD?=
 =?us-ascii?Q?QZsmy5YKvWADpNWXdAd+wzUaMMF6S6H2IQLizxLNYvsJGVzEc6CHfJubvruj?=
 =?us-ascii?Q?dK0PiO1aXj1CSH/4bDDsQDb1jFjm6KgygPCtE4ea+F4UI5tVW1y0/K9DyadP?=
 =?us-ascii?Q?ay2HaxqTyg4EhM9aTtVm2dR+iNTXQv/ftub7vR5HSCrmMatIN/cfiJEv572y?=
 =?us-ascii?Q?qNTQh1WcbaMJ9R8KKDyAgmiWhgFWyPBuHAFu0bY/MmPPhqNFSnasfdBkxu5J?=
 =?us-ascii?Q?foEbsk3r6377YRfFgPukQp7vmQBLQK9QrXRAz12x0yydI/FnYt9MGwWkJ5oT?=
 =?us-ascii?Q?Ho/ag/tMxxUO8CRY4MPvCAQ7fjWPdvJ8hT+lE83kb/tV5uuQpiR+PwLYOsQz?=
 =?us-ascii?Q?q0fAQtqlyAFK96ErC6MdmfR8iNDonZhqmqnarEQIjJLksAxfGvJGRaEe6dTm?=
 =?us-ascii?Q?qcxW7A5xqepmdgfDIC1aLzd83WHxuVbUXw3PU3rjsQzdFKEf+Ef9zx3t5Y/I?=
 =?us-ascii?Q?6Bhkf1BfgFBN/l5CtZ/V+E8imiu5EOZM3nmZOI5ym53kzsd5Pz+FFVR7CC/n?=
 =?us-ascii?Q?vFliVn499ARkVsk4sJ4O7VRxaZrkMf84l6SydBZDEBZNtNt5vZYT06/2vZaa?=
 =?us-ascii?Q?X/Qo6FpymRfeByuKwH3LWoOTujTz6H5aeRuPj8WsJAsSDA6tqQehRr2Di/TS?=
 =?us-ascii?Q?PplBcJQdO2sF7bjHiMSbs1qqseAK9x95m/DF?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 09:31:44.9349
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d7a7764-3872-449b-ddae-08dd7d92ab65
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5910

From: Pohsun Su <pohsuns@nvidia.com>

This change adds support for WDIOC_GETTIMELEFT so userspace
programs can get the number of seconds before system reset by
the watchdog timer via ioctl.

Signed-off-by: Pohsun Su <pohsuns@nvidia.com>
Signed-off-by: Robert Lin <robelin@nvidia.com>
---
 drivers/clocksource/timer-tegra186.c | 56 +++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
index ea742889ee06..201b24ca59f4 100644
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
@@ -235,12 +240,61 @@ static int tegra186_wdt_set_timeout(struct watchdog_device *wdd,
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
+	/* Get the current counter value in microsecond.
+	 */
+	val = readl_relaxed(wdt->tmr->regs + TMRSR);
+	timeleft = FIELD_GET(TMRSR_PCV, val);
+
+	/*
+	 * Calculate the time remaining by adding the time for the
+	 * counter value to the time of the counter expirations that
+	 * remain. Do the multiplication first on purpose just to keep
+	 * the precision due to the integer division.
+	 */
+	timeleft += wdt->base.timeout * (4 - expiration) / 5;
+	/*
+	 * Convert the current counter value to seconds,
+	 * rounding up to the nearest second.
+	 */
+	timeleft = (timeleft + USEC_PER_SEC / 2) / USEC_PER_SEC;
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

