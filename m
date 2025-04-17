Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2073.outbound.protection.outlook.com [40.107.236.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A462288C0;
	Thu, 17 Apr 2025 09:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744882154; cv=fail; b=WhuBkojvNzlobJhMCaW6n0TTzNVMPZvmNE7mJIMBX/Zx7GtbrL7ksuWfnP306BLzmUW+xjW5Aa1bv++HX6N+DgpJLqUq25zPlpFwZWFNVK/76TcQe7Lio4NQPtvd5WW1s7gNW6y2dgHhSQ/din3acp20PVslqzM+LQfdfntQcYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744882154; c=relaxed/simple;
	bh=BP51ViC1bD50nt8v9h33KXrDqK2nJxIqH3zJTiN6L3M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MOgjwyt2EBunP+wrEiYshSYipbSt4dhSM7QgnIukmFtqyLj6EWBqDTnk15z8/ZirAywdX7p0Gcwa2acPi/XnSg7x+vowHxRGvB8vcSjCvUSkgTRCGYmJsV3xfVceicQZOLGCF/FwEY1JrGZwhipFwe43GzO8pYtAtd7LMqnLPDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ybw1pgh/; arc=fail smtp.client-ip=40.107.236.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ybw1pgh/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GiQYrRZrfjpgiMRnfGpMOpYH6SdJeT+CWW5jmBQLd5MwvgjlAnFH6RT+KZdm+cmW25XVhrlBpQ+DUw9VvnqTpAFRPv+P5IMaOgW+pB7ownsI1tRaLhSpbpw1nY2imTo4vthJ7uLnSMUe+P1/WYZa0HXFJBgw4jbunVmKrvov4gvSyrm4MTTSmBdTtev1z74ySxCixqGHaSZpvPX9Ep/u+Y7vqN1E7GwrzMpNRw54mN2tPHFtHEMaMLCj3eGfXuf9ET/YjnXIVym9jvxUeW56TAg3CczAjTHOgR9Ikj0IUDxAOOoE9ClfQp6yGmXxxecdTGZBlYLHZ9NOlQViRGkbag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uylIS/TL1JsJPqEnaYIRyaa5f28yxZdHl868qrc3SQ4=;
 b=lInQHFboLPCqf5EHWZaSmodKYej4V2Tb0wdOQmvAy8QeUQpZnkdl86e0ws+tdnr9IVFkagjUEVVuNMe2E/9bH+IHvf+3pcPaIKuHl1aCmYLPUQadqghZVVvI0q2QWm5OsVdqhALptL76wK2iUZ22g90ACiDEy8CzHr7NU7W4DuSauHG7MctYG4KodnTP95Joa6I7oV3emX6TJVjvA6LWu23ZSIrmnbImh+HT2rroGbY/Aivsed3kswXduXqbCq/X60lTfY8QqPSPHZrDkyH+0Sl5Ydk015ncWgmvzXYOUPG8r7MXct5rqmaAOj5lpxmnvm0mbHmWr1gA+6tbFTrk6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uylIS/TL1JsJPqEnaYIRyaa5f28yxZdHl868qrc3SQ4=;
 b=Ybw1pgh/VlFChN5E7tWpxFUABzdkY9DVkNKPq9X6WaZOZutOD9+1CDXXOV9NuRDnO7P6UNIEcUX81MykIaW7Vcb8dle9Ygrk5x4kM55tzE3FP32rEKoLTS1IK1TT7Lk23DkmWsaEIP0LRS1r0C9FCE1/+CeaXZFqCVEV30Xeugri8gHJfTyqiGqEnq6RKm8OhoCn/Am0rW+qFujkpxqaw0/gp6cNibbWmarl4l6U+hGHiFB0nWvdawIm1Cx32c5YdoG+yV6220VgTCabwAyUQiq8P8f1Fo3G7b1OuYsEAXeQ0aedjZGVN97UPS+AJZgvt38brdY5/ApGkuuKlmzKzQ==
Received: from CY5PR15CA0176.namprd15.prod.outlook.com (2603:10b6:930:81::19)
 by SA3PR12MB7830.namprd12.prod.outlook.com (2603:10b6:806:315::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.38; Thu, 17 Apr
 2025 09:29:07 +0000
Received: from CY4PEPF0000FCC1.namprd03.prod.outlook.com
 (2603:10b6:930:81:cafe::b1) by CY5PR15CA0176.outlook.office365.com
 (2603:10b6:930:81::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.18 via Frontend Transport; Thu,
 17 Apr 2025 09:29:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000FCC1.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 09:29:07 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 17 Apr
 2025 02:28:50 -0700
Received: from robelin-Precision-3660.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 02:28:48 -0700
From: Robert Lin <robelin@nvidia.com>
To: <thierry.reding@gmail.com>, <daniel.lezcano@linaro.org>,
	<jonathanh@nvidia.com>, <tglx@linutronix.de>, <pohsuns@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<sumitg@nvidia.com>, Robert Lin <robelin@nvidia.com>
Subject: [PATCH v4 1/3] clocksource/drivers/timer-tegra186: add WDIOC_GETTIMELEFT support
Date: Thu, 17 Apr 2025 17:28:15 +0800
Message-ID: <20250417092817.2751534-5-robelin@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC1:EE_|SA3PR12MB7830:EE_
X-MS-Office365-Filtering-Correlation-Id: 68b8a129-92a1-4f6a-c88e-08dd7d924da7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K5y6F9pEjkgVItY4SHzmnRSGgwZif6sVJkjcPrNY39Z+9UEcT9cSSPrFPbWB?=
 =?us-ascii?Q?LTQiZ+pvQxLf5u6hM82aPIyf1cCZHLu4pv64k78bJOyfFU4KrEQaVBONajzP?=
 =?us-ascii?Q?hzKgcixOHJsmp2sNTIkGaC00s+3v+kyMGNYdZ2d2fY/XWCKzoTx0jAUUZ6FZ?=
 =?us-ascii?Q?UbM4HdVr+5PPmysbZXwqEiVT3aVgA+XHXFzGipRVUZxpNNH2ZJH/HYAVxjAo?=
 =?us-ascii?Q?Hbbf/PsURWObqNAuD+Qcj+m30qh8YbTgAllm/7JwrT0oJYIoiBs9JFFyxOmR?=
 =?us-ascii?Q?tH48bPX1XMmxqZOojEVtMLUESfP94Je8kd2P+PL2BljXMh47XCEquyhpy+lG?=
 =?us-ascii?Q?IXMWw09htJRiGHBL08yUIacs+7wulmfgia4dSi6tswUjM3U1Y8hT+6twugkf?=
 =?us-ascii?Q?TFueN6vjZQKsrk0LD2RLJ901PUOz2trlQYMTCCnIAQhE825ENMc5ZCjPJdnS?=
 =?us-ascii?Q?DM6vjPjgtctgvjgnBR2vH9Pgago+4OyUgfrDLR8Z1kbnhG+qBqXiIs/crpKm?=
 =?us-ascii?Q?3eHpVWpOjx9fNo84UCkVy/wPFtVd+uYBDb33wXn4ym871WDOaLn5mLSH/qQh?=
 =?us-ascii?Q?5SJjqi4xwale6YRkuUDQxLvaijgrliUAsnNQk3wOJJdnC3qk7zPVricogsrd?=
 =?us-ascii?Q?ihC5ksMs9ZTHozbFuvCJpDas5m8d7FO8lmHViPqncd9jPsPzxbht8j/vHkrU?=
 =?us-ascii?Q?kB2tlj4+T33f+XpC8SmPIH75QKmBE+1plKrDj1Q9EVZ5UE8HrEXiGXkaX/HF?=
 =?us-ascii?Q?Zru46aDa0iQEa+RWJaT2B4sxqMHBRlEsuwuekE+9dOV4r4OavijNjbrrT4ov?=
 =?us-ascii?Q?hNPsYtBTy3KpuS/BvxPLuJ/iFXmSmGh8QXi7hI/uFiKxjQWE+liLSNgUGfdZ?=
 =?us-ascii?Q?sejDs2YLJoh6UvGpDZ2IO3uhvNDjTNGQHdHvH9i8G/YUlSEz4bvHx2CuCVRk?=
 =?us-ascii?Q?DfS09HA80yNVgEniPQEzdKCokk+zShwRLqVQhhbnA6gswiHyPW9cLY/wB7BP?=
 =?us-ascii?Q?iXHTLY2sLMzFUUx5CqnspTbFJsAEWxpXC+QwtbE8M4awxNmoyO4s/dx+Sil/?=
 =?us-ascii?Q?UzGZ0C4fk6ywvaSpQ4Ca7hUm2R+BXEIclj47smSSOGN32ceMSShICFSPGnO7?=
 =?us-ascii?Q?wmfmyfDqtoMALBZy5L+o9tlAzWimkySoIM4eMHKVkPvy3KNYFyfrM5Dh1AUq?=
 =?us-ascii?Q?RA8MX/OrKi8wttJl6JAggqucRfJ760TNCAsBwelbM25KHaS674G7ORXRQBr6?=
 =?us-ascii?Q?f0UK8b2bce/yMgsdpcIuYugavtQfGgxfVO87Ayv8lVTx3KwwIzRgkaV+dFso?=
 =?us-ascii?Q?8Zl4+PL4KaFq8Khjbx1jdsvl+e1b+pGLVILUAchtvQVjwBvtZXMfs6ijHwnc?=
 =?us-ascii?Q?pXGSToc1SVI+7jzhX7OeKdSbB/jNOvziBqUPLXZHj25+y3t7yokHXvVvmjFq?=
 =?us-ascii?Q?W0oWk+lcRuVEFdpIOc3SO+cDzy9o19W/I7AzjTJX3OE3k4r4FksL1Lrtwf4j?=
 =?us-ascii?Q?SR/mv4naIpnKynhGKCZvzUSX7ZHzvtE3Acql?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 09:29:07.6610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68b8a129-92a1-4f6a-c88e-08dd7d924da7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7830

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

