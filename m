Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958D01A2C06;
	Fri,  2 May 2025 04:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746160688; cv=fail; b=GzM8A8qEtDT02O0QkfGox+FMnP6RFclKqFqs216mOja9hclTkG6yo2PDe4iFtUM579xVFpnF6L1J4BA+1TEaovzJa0IW3mOMC3j4CwSgP9Iqe1s0IfdcRbxzzis62HeLkqOxPSUTkTpfUusnVDIU9yu96SBZGZOtzHxfr7c3KPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746160688; c=relaxed/simple;
	bh=icVHXhZyBN07VZDr1FU5xzA8tBrR69P+8CIX1UjE40w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oRugHEL8shBx6s89O6ch1kjfV/a+iUY0GD7LdemiMF0OetMmeALOea4Eg+TGu0DoRmpguF50uwaL1emn03GCN47Gyikbm0T83ie01v5rUGEiVDNyURe1jWn3mY7vx1P6ZJNqy6kaa/luHoKCC5tXELEuWxBxFNHEgP/d6fXWLLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FutVeuit; arc=fail smtp.client-ip=40.107.223.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FutVeuit"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M2fgf05tQ+UMTsAboyM5ufLjQluzoZIjkM0/Hmzynny2tDGeo+AqsR7ce2DtEtdsxNcYsbbFFXh2Jk+m2QLFkAMybCbd6LELqtWxNtrCz7zD67HChphcWXfwDG5hvcQ80yeww/FI/gbRy4zoTdswguB9YNz36XXX9kMSw0WZAR/j0cl72k3BCoavbrke79kBlQ/qQO6kmyehljVpVHCFpvJC5euEBNVRvYzkCqzCVl2VwvwQXnApZ15yllEb/yCf/aPTNJjy1BC5P5FlVgPnktwpHNT3M4wWqPsVbaGkmuCpk2qiExiFsyNtD7w4BvV/c/u7/VM1CE7dQgDp/w47jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NE26+DDznd9PiWs39GUsBJH58++ZiDTkExkLwoP6CAo=;
 b=K4lbCYSpjhGMPlJsbpkN3JNO58o991SZoIcEa5RCjr0Gk3UazrNrmv9VMj74vGLQrIzqD/MGrUgmKp4Mywky8ZNC7qewqaI/zVwd9VxeEmalZPuSCbyExUVOC8Ti0DnJwrHZkqM/oNas06/0qaKzUR8WvYTe++iNImrRX0dlwb9yntAqLyDvXxZ1aYlfErQMVajla329eO0kyRpJnaxneqPOAzBbcHg3c5ik2yBatpC15PvvsakoHEL+SwA5Z95Xr8CQnWsfgo5KKgRy1FjhysDzB4UX18Pv0bOSNB4U4YUExXDEwbc97O5pG2Ac4Cj2od6Rcz6XSPzy8PNx4fmYiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NE26+DDznd9PiWs39GUsBJH58++ZiDTkExkLwoP6CAo=;
 b=FutVeuitb8gjVz05y6m8/CWlgiVgYBCyla+9CpYAFz9olc7t0PJV9ew4JmF+2F1GmXx18woks75GDdWKgUVEy5++OLT68Ar6KZFcNVU6I3F785GuYY/MhhvUnI8cI+d+O7PC6yhUiQG92crtxSu3G5rmHxyhIXekfw5TUW59ASbVjDu5Jhbz9P/NEX1/HZ+NhVdSRCHAGxx9nBdgsDX1KMSrfoAnS/MR7U5nRgMa7CFGxHh79nEk3yqiZpNvk/2MjKabx4wqfvpkmw0jtBb5sOPqwQLpEiB9XKMWKfv6GBE5RFZ1dhErJpiocIDmR8OFowFXM3uGEdGZWHvgf9gpBg==
Received: from BN9PR03CA0926.namprd03.prod.outlook.com (2603:10b6:408:107::31)
 by BY5PR12MB4324.namprd12.prod.outlook.com (2603:10b6:a03:209::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Fri, 2 May
 2025 04:38:00 +0000
Received: from BN2PEPF000044AA.namprd04.prod.outlook.com
 (2603:10b6:408:107:cafe::ef) by BN9PR03CA0926.outlook.office365.com
 (2603:10b6:408:107::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Fri,
 2 May 2025 04:38:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044AA.mail.protection.outlook.com (10.167.243.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Fri, 2 May 2025 04:37:59 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 1 May 2025
 21:37:48 -0700
Received: from robelin-Precision-3660.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 21:37:46 -0700
From: Robert Lin <robelin@nvidia.com>
To: <thierry.reding@gmail.com>, <daniel.lezcano@linaro.org>,
	<jonathanh@nvidia.com>, <tglx@linutronix.de>, <pohsuns@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<sumitg@nvidia.com>, Robert Lin <robelin@nvidia.com>
Subject: [PATCH v7 1/3] clocksource/drivers/timer-tegra186: add WDIOC_GETTIMELEFT support
Date: Fri, 2 May 2025 12:37:25 +0800
Message-ID: <20250502043727.396896-2-robelin@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250502043727.396896-1-robelin@nvidia.com>
References: <20250502043727.396896-1-robelin@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AA:EE_|BY5PR12MB4324:EE_
X-MS-Office365-Filtering-Correlation-Id: ace08967-4c28-400d-86f8-08dd89331e52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ul7iRBnuZgs2/pyQ718fDFaXFqaBd0ZUOFjN2V6IiuC4HZto2fOx/Qr0By4j?=
 =?us-ascii?Q?ytkR4jKBYlTK5pZj4SuADOgLakJaCkY7GH6lJ3oVzTSpCcezEDkjxANfGmXP?=
 =?us-ascii?Q?pBY48nOxywbvrUyNZoBx8U2MFA4BDaWvdbblDcDJxjLXpVI7yJ+CxJatdOZC?=
 =?us-ascii?Q?HuAL37DWvmlk8HIMlh/uCAOLwmShgfhSvqARw/BcYF5PTzBfNXEYZiR4RkzZ?=
 =?us-ascii?Q?RxX2cEULPRqbTqcuP2RdwxWgLa660tvP41MPLD4kkkKLRo2RSrzO/71CHboj?=
 =?us-ascii?Q?hzLjOuK1EKDWY6MNFWQGpr3wc55lnClJUA4sLcJ+nMge6juRqph56m+IhZI1?=
 =?us-ascii?Q?44FsFMS5shynN+7mt7Tg/hqgqDbKP4++pxyUcFDfLUUvz/W9NmNpJlPXFG/m?=
 =?us-ascii?Q?NXYQrbPTFy9uBiTkJzFd9JBYoKEDA8S8xRnZjVnCE/2zGsiwlTS8MpQmKcBY?=
 =?us-ascii?Q?Z57kAdsApaaTC+pCAzcJ5oq8o32xPZgZMAG3HvJXhGz0WKQ1g8V7AZUMyTIh?=
 =?us-ascii?Q?KGjFKRFZtqYKeVY5P2BX4iPT9YVOMMWWEpXEX3FpDhh1oStjN3De0cpXzY+m?=
 =?us-ascii?Q?EGE4+XrUeSjvXlKSqMRjWWta7FKWbFI1W0oxB80WL9TQ7ACRfMn/hNm0z6mH?=
 =?us-ascii?Q?q1L0YFJz+obFuP97zgm22QciXuCKfIxJsMcA22fohIEh7fJHUHFlXJfdGPo5?=
 =?us-ascii?Q?cW8F+oxskXgpluc7Tt36K7j+/yh4ugR0iTXQPbQAS8JZS45cJsQh0gDbJlZt?=
 =?us-ascii?Q?CG1DxfC2hdqgv9f+vioccPsIvJUjE9K4+Ni48Hp/0ZHkJjT+MMJB8SUWifjT?=
 =?us-ascii?Q?XYSVlDJxE18nETU+i8UWlekD51PZjNKIBpWRmCZn/NiG+cTlBI/QJuBbqYW4?=
 =?us-ascii?Q?96ZP94TDj7zP8lEHe7En1657jBlzFnhYoq199/G2i5xIaDMD1R55w+SgWOzX?=
 =?us-ascii?Q?Je2/D+fthscle2La2+NCfhGi8W0l08eY2ZIO1lPxE2jz7sO6qF9u/jH4+nUb?=
 =?us-ascii?Q?AZT3ssiYtqKxO0rv6lfOLHAZVTx10LfXtwiWg4tEGqDRVOIT+Y/bN/HXx6pq?=
 =?us-ascii?Q?xrtqir3P8eo3OMFcUpQ0Y60n1VmCuv+oexJm9A6KBgNi0prGyPXp/kw58lA8?=
 =?us-ascii?Q?8BMdZsRifl4R81m4KgTqq9gAekQ1UmUrHkAEMOZGGEB4waTBiM9bindEI+1F?=
 =?us-ascii?Q?IOzR/64HFKlVg8Sk1rm7Z+vOmOXuuXeLpV+v3bb2zJ9mllQMPzyW54JQGNa9?=
 =?us-ascii?Q?t8zoT3kTdS5Xw+g7jnzCbXzYkgmomLBiuvFsSlXodsFraKz5ut+0PGlQZ/LP?=
 =?us-ascii?Q?fbd+DKMMrMBZBm4SO5oqW/LIB3A+3XSabIBAMtAJThQ70OhioVsXkaImlmo8?=
 =?us-ascii?Q?WF4B6QlWVpBFFH7CU0FVqpy/x78iq5wgFFJdk98xcpKJVQX/99XaH8sTLaA0?=
 =?us-ascii?Q?7oA/Y4cWky3hYeAP4Ojpw40gq0sCtFBzi1WlNaPp8bh3Smy4FHo1Cq7deNrt?=
 =?us-ascii?Q?FXOeaTXn8tssemBal0ZXQqOukbnwGBom1kol?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 04:37:59.9546
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ace08967-4c28-400d-86f8-08dd89331e52
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4324

From: Pohsun Su <pohsuns@nvidia.com>

This change adds support for WDIOC_GETTIMELEFT so userspace
programs can get the number of seconds before system reset by
the watchdog timer via ioctl.

Signed-off-by: Pohsun Su <pohsuns@nvidia.com>
Signed-off-by: Robert Lin <robelin@nvidia.com>
---
 drivers/clocksource/timer-tegra186.c | 64 +++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
index ea742889ee06..8d5698770cbd 100644
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
@@ -235,12 +240,69 @@ static int tegra186_wdt_set_timeout(struct watchdog_device *wdd,
 	return 0;
 }
 
+static unsigned int tegra186_wdt_get_timeleft(struct watchdog_device *wdd)
+{
+	struct tegra186_wdt *wdt = to_tegra186_wdt(wdd);
+	u32 expiration, val;
+	u64 timeleft;
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
+	if (WARN_ON(expiration > 4))
+		return 0;
+
+	/* Get the current counter value in microsecond. */
+	val = readl_relaxed(wdt->tmr->regs + TMRSR);
+	timeleft = FIELD_GET(TMRSR_PCV, val);
+
+	/*
+	 * Calculate the time remaining by adding the time for the
+	 * counter value to the time of the counter expirations that
+	 * remain.
+	 */
+	timeleft += (((u64)wdt->base.timeout * USEC_PER_SEC) / 5) * (4 - expiration);
+
+	/*
+	 * Convert the current counter value to seconds,
+	 * rounding up to the nearest second. Cast u64 to
+	 * u32 under the assumption that no overflow happens
+	 * when coverting to seconds.
+	 */
+	timeleft = (timeleft + USEC_PER_SEC / 2) / USEC_PER_SEC;
+
+	if (WARN_ON(timeleft > U32_MAX))
+		return U32_MAX;
+
+	return lower_32_bits(timeleft);
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

