Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2088.outbound.protection.outlook.com [40.107.236.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10270275114;
	Tue, 29 Apr 2025 06:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909183; cv=fail; b=YqomRK8I88P91E3MNhDl8kINdFgZtMJNk2aSDJg5UHmsb4COet09szQbJNscRtc5BbgHbfUuEB+odiDDw9OxxzqHJJEX3b2+HDWPClho6nYbMdTGGkjVFjFKDtbtJUfCdTv5drGWnkEItNtgwZiSO3kJyxTGb8BpNPpS2muCXrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909183; c=relaxed/simple;
	bh=GLu/ANu5hBC/Du6mcPtU/tmFO7OphBQP/ydu/5b3kYA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qbHM1CjfirBuXzigbSb1INg7PqTvibc+OOMInJIADY9z2Jd5ZOWs3KS6jpcLLjRfPTluSn5kiLTtYlKcmLFHPlrF0FeUQr1FHph1jyimUMxfu7qi0A190Zzo8a/T3PqpssHVUokkJSnuflCBBWimzpDUZ4AjXMLwEByH9avKB4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dxjds+Xi; arc=fail smtp.client-ip=40.107.236.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dxjds+Xi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Efwv9mpsdnHUKwtG2rC7G0s3e9C2xJtmKwkU0yuwlAvN7HjB9p3gZGHegt6z8n2x5f0enbj+kZgNiUL5DI7ZefBMI+4GXxjf6sHaLcZJQic3eTJATuDfgZJvYXQELtdwl3JOmFTuZ5DsgBktCc4dZWg7a9i5IPoXtgXg9LJPxwfpiTSFdP7a0t71DS/saiHzUSiDsHxOtHKFA0d4zx8l2M312xbvn7cEEeUCbE0s8VFDVttoK1dH1Ajbfd9wZ88sWmkkpDDU0JEri5vw6hIsQ4CBSPNHSpISNdCQanlckXO9JrCxRpasaM4JQUyKTvk+uGUaHvDK+FOeNY/jrsuh4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S7MKQp/WYvcmf6MISm/PppsacUWyLTbu2WpEGJirz60=;
 b=ECf5BIwFkNxprTUuPp2wthMHy3Iiujq1T6xUAwhLwVSmouPcC3NMnes3NVS6T4IekJUR7egU9fjGI9qjxwG1y75leUyiPtkU+zc7znbDTcPJhOsARYJNk8FM3kIuJlMnG7oFau8hZ3aKnvT8VN6T/IFUxvg/boaankNZr/ELUaYJAvm+dVMJ6Py2pGiR963OlVFK+kRS26eCv+EuA+TUOHZ9exWbFYgaIW4ZS4m5+ZamdJLBTE3i9Lf+ffvAXGXMkiP5kMPWe78korYwV/a1AFsGelGGb9PVWytlPVPdqBBXiZ416KJAX6r6mOMs9x4xZRFv3by6HzSNZiWVaaTN0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S7MKQp/WYvcmf6MISm/PppsacUWyLTbu2WpEGJirz60=;
 b=dxjds+XiUsYAPKxFaM5CUL/u7ixmr/qENyPjDWrdF++G4O/sW84tsviMm63rlcwb2zj6tAdCydI6bQXdrOQuMVpXN/Ljm2Wigho9vetVTgvNZsh9QqFDeGgZTAz7FcyxuSF+cjjcospWq0zUqKPIWenSKy3xUvFi8NzCgkxC2lTHjvhfUjBmiSSy1L55vS1N1cSzFlLqtVmBIarKs7uZU7IaxC6ElaVICi1aNpPRvC+qzwocWOLwggXAyWAp+QSamJgNn2iT3qQagWXA2fp3T9nxtCe6MO2ixTg4EhaDpMmatI1bNC60k8vyeLDvExf5uGLLxv2peWfwvM90p7hv6Q==
Received: from BY3PR05CA0040.namprd05.prod.outlook.com (2603:10b6:a03:39b::15)
 by MW6PR12MB8868.namprd12.prod.outlook.com (2603:10b6:303:242::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 06:46:17 +0000
Received: from SJ1PEPF00002310.namprd03.prod.outlook.com
 (2603:10b6:a03:39b:cafe::1f) by BY3PR05CA0040.outlook.office365.com
 (2603:10b6:a03:39b::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.23 via Frontend Transport; Tue,
 29 Apr 2025 06:46:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00002310.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.33 via Frontend Transport; Tue, 29 Apr 2025 06:46:17 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 28 Apr
 2025 23:46:02 -0700
Received: from robelin-Precision-3660.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 28 Apr 2025 23:46:00 -0700
From: Robert Lin <robelin@nvidia.com>
To: <thierry.reding@gmail.com>, <daniel.lezcano@linaro.org>,
	<jonathanh@nvidia.com>, <tglx@linutronix.de>, <pohsuns@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<sumitg@nvidia.com>, Robert Lin <robelin@nvidia.com>
Subject: [PATCH v6 1/3] clocksource/drivers/timer-tegra186: add WDIOC_GETTIMELEFT support
Date: Tue, 29 Apr 2025 14:45:38 +0800
Message-ID: <20250429064540.1642030-2-robelin@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002310:EE_|MW6PR12MB8868:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c19cdbf-ccd9-4b9e-c464-08dd86e98af5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hG6TfbR6Ov0uhlddx32XjT/R5U5Vi0Yx7PUO4s45XuP+Jrs0wGvucpp8J2Rr?=
 =?us-ascii?Q?WWr+W3Qmyi8bcHkS7soSz1JcRMe+HKN0583ARntBZCjZoVJGsOOYAYavK/SF?=
 =?us-ascii?Q?njOwBOY6U/MrHhUgr2hF6MhpCWhjVv3nZC3IF/Bada3xZ5F7WQuH/izcKgUW?=
 =?us-ascii?Q?xcWjPnvt0igQFnjk8ROk9UPktF6b2245oVwGCQPilpUZ4jnjlJJmzd4RE4Ey?=
 =?us-ascii?Q?QxGVjiK47vlo8ZjM6lcTUwhdI/pn3u4dhyBSjDMLQrzQnOzDEUCHCM6jPaEn?=
 =?us-ascii?Q?ncNJQ1ExS2OFip29BU9rxyTlgkfkPapF0fGz5ZRtalvQvoR1/yX45j8U4YtG?=
 =?us-ascii?Q?xSK/Kf/N9brPEBRQBFNk0sfoFKVxVPztGS5YT5ziR8oJ1xfe6K4cUivrCfv3?=
 =?us-ascii?Q?WkH1knOxQ9X+bA+2u8NamrhmROJfC9gsrSs45nwGptOD9S/rsOLYIIdjnmT4?=
 =?us-ascii?Q?b+BW6oNQDIiXuxp/avvbf1CDRtfcPDNR7+e+5nm9DWXF4FDqYohQu60h/87k?=
 =?us-ascii?Q?VzpNTxjSdJXR9370G3VkXlEp37eJQNexgklX23phndUziP2aO1SWavK1To6p?=
 =?us-ascii?Q?qc4GjBFIzVsuBvgoXADdCQ/lyvD+5B1NoFlqL/fnmtSGx1FZLZlZZI0Jx+RE?=
 =?us-ascii?Q?4yN2A4qRgWSI6Sh3yC4kVgrOxAon/lU7uL1OZoWdDvQXjkzlQvF2xJvDvCnl?=
 =?us-ascii?Q?haMhIX+8ylpHRw+Fn+KyaE3bz9e2yb6d0zhre9U1xbDEH87RA1jBlGUSPYgS?=
 =?us-ascii?Q?qgZdYc2lwBJN07ZonhNj/zoyCC/oQeQbCM9XrhYr30RMbnAvNGIW8PKfMRFl?=
 =?us-ascii?Q?3wsGF30O77jRL/cs40b3TwOHcZqxKo+e2u4YiQ5K99yi34rYueM7JT2LMEcF?=
 =?us-ascii?Q?kMMKtSV8G3ocblnKROw2Q3LOykFE3v7hgslnlWIbgvfUsV16SGthXBrOpApt?=
 =?us-ascii?Q?HNWAPjzbKzkvz1lpvPFeI4CXdWPdtECmE7bfPcx9QE+XylG+RwjlXy5pdOnP?=
 =?us-ascii?Q?6Uw6Pp7YoHfT/UjSH5guDeRT8jguGqmy7lvlPzjgQ1IieVzeGu+Ux3X1yxNz?=
 =?us-ascii?Q?KbKow++5bvj+gBBeRoy4XhzjO4wj2VdDRksZn4rtQRToZNPeCR0kFh/4Ygms?=
 =?us-ascii?Q?E7b56ZaljEbknNR/N3SZhKtZ38EM1Xi3wVwSBpXqdUghow5jOvpJawgGJR/T?=
 =?us-ascii?Q?l4bxi5S210IXGLXNKNbMFy/k7fG2gICnGsePc2Clv8yM8mvHZHNDg4r25vPl?=
 =?us-ascii?Q?sot0SFELfZN3TvjUJ3Dd9aOyoOliqli5ySQ5mFLIBUqg7N/R2ZCH6fixe8ro?=
 =?us-ascii?Q?1xpxfIEQxTMZj14EmwxmmVf45Z4Giax3elrwD3VYu+rA68XruauMpUTMLV2B?=
 =?us-ascii?Q?IgIJD66fBZHWoHc+6ViuZfVDTF4KBp0yJNBJrzG/gqNpGF53foEXh6AsFqCN?=
 =?us-ascii?Q?pzwB7zutyYcoqvD7rEWzoTI7zJe/bpvJPTjgu8uiMOpTW0S9SiLkWH0vDCu2?=
 =?us-ascii?Q?DV90m1dca+tDF2K8HCBuivmRyxXEV6eHW9Iy?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 06:46:17.2054
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c19cdbf-ccd9-4b9e-c464-08dd86e98af5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002310.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8868

From: Pohsun Su <pohsuns@nvidia.com>

This change adds support for WDIOC_GETTIMELEFT so userspace
programs can get the number of seconds before system reset by
the watchdog timer via ioctl.

Signed-off-by: Pohsun Su <pohsuns@nvidia.com>
Signed-off-by: Robert Lin <robelin@nvidia.com>
---
 drivers/clocksource/timer-tegra186.c | 60 +++++++++++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
index ea742889ee06..800f6650ebd4 100644
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
@@ -235,12 +240,65 @@ static int tegra186_wdt_set_timeout(struct watchdog_device *wdd,
 	return 0;
 }
 
+static unsigned int tegra186_wdt_get_timeleft(struct watchdog_device *wdd)
+{
+	struct tegra186_wdt *wdt = to_tegra186_wdt(wdd);
+	u32 timeleft, expiration, val;
+	u64 timeleft_us;
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
+             return 0;
+
+	/* Get the current counter value in microsecond.
+	 */
+	val = readl_relaxed(wdt->tmr->regs + TMRSR);
+	timeleft_us = FIELD_GET(TMRSR_PCV, val);
+
+	/*
+	 * Calculate the time remaining by adding the time for the
+	 * counter value to the time of the counter expirations that
+	 * remain.
+	 */
+	timeleft_us += (((u64)wdt->base.timeout * USEC_PER_SEC) / 5) * (4 - expiration);
+	/*
+	 * Convert the current counter value to seconds,
+	 * rounding up to the nearest second. Cast u64 to
+	 * u32 under the assumption that no overflow happens
+	 * when coverting to seconds.
+	 */
+	timeleft = (timeleft_us + USEC_PER_SEC / 2) / USEC_PER_SEC;
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

