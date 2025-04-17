Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2068.outbound.protection.outlook.com [40.107.92.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859B322422F;
	Thu, 17 Apr 2025 09:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744882132; cv=fail; b=Q0P5Cf7zXV1dAE73d88/GfYb3BwIfqjsBHQRZDRy+NtBOyXWe3T0+LOxTXjrl96jqdwCrId00JWKOjeVdk9CpvZAdk2VZltaUJskGx5SeEo7pZFJDPAQIPlvsdNr8gh2+wRrb54Tq1mY4c4cJf6neXayDbdG0GSKj15I1McwORk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744882132; c=relaxed/simple;
	bh=BP51ViC1bD50nt8v9h33KXrDqK2nJxIqH3zJTiN6L3M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AYYT1CZCq/pQ501Mwsjcl5FxJqMuvloti/jX3QgYVRD+KZX/1PvPNpZG4Pm0U4+OF54qIR6p5TBTzlHcM3YO9iwQt72U5WNrs1C3ZPaPdA3rxtdPgRdfBhGP5ONrRThCHz7XA+GTH+Oq/GixC2fJwkRGv+9Q8auQ1eypPFwQvfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AB+X1PNc; arc=fail smtp.client-ip=40.107.92.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AB+X1PNc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h13Hnh6RDV8mZWrefkAn2uDTh7ewUloJoO+MDVdbF84Ol6CndBuHYZVOO8Ddw80/J1bzZd+5rNHFLRLE+tVDlx5UNkPBURYDV8C+SSRQWlhV2PFGnwwRypGMS+o/laP94zohf7DS/XyvN2mDHaBIidHdLZImvFHL8k15V77fTZU92lMsoSkpmIwKt2/gdgOlTNpRVHV4ru+0n5RgSnAtNkoGwvSRNAzTWDUrQdFDjDmGkUvverLKtmksFJ1s2JLPUSp3BvNmrzWK3gS5ATvpFy06erHyPSqkioobMdPm8TFWDMvyLQoJVz9C4wAn+PkrqFtouUMVIXbspWa409eKyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uylIS/TL1JsJPqEnaYIRyaa5f28yxZdHl868qrc3SQ4=;
 b=hVXeB6Mrw2TOJ49EITVDKnZyqx2aEIk5ppofXk/tC212rjWP3tE+gOQYqapVn8/7Qk4GsDQxEiGQVZLynshg1dlUNxBXjRtROYR1qd+ugTpnWm9StBho7bZBueMm090LoaRvfcbG0IbqVPBPTBiYCLyF5WIJr1wIBAmMZI9F6dA2lE5MPQBsbFJRM/pPb9H90IiztZfqFVIQkoc+zsUvvqBfii0hoD3/yUoEaKKMGkkJlhzNgeT6eNwJ72g55yqk8SDmhnLFSJeYcah3rhq5vt1Syk5X7XSbTfgYhXkDIEbVftGCf4z48L4KfyOYopq60M1t1pvTeLQC20iXzli09w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uylIS/TL1JsJPqEnaYIRyaa5f28yxZdHl868qrc3SQ4=;
 b=AB+X1PNcdK03oenwo0Il25+Li8/JvRaY3Hsemqcgng/zSQ0QV3GU/rsRyq7JAcO383AGoQzoqi1sgjEi3gk458L1IOVht0faW/4UCsB4pt0hsJfjjpaby86JsafsNferBTJh5SR8UVKhUytE9nlGhphvTNiEzEMLXFY5fC8uGhkavUx4nVyM6+daMnGWvuFNLfWaYzrrnRynrkcFYpDDWj9hyqClP5Pu50Gd+fi20k13ZleQccMMhvidB2//T3T4/IluwN0W5ObezC46ApGt420wJJtjtGxRldkgPscwGF3enafx0VHsnMsLYQdFs3D+aTsqTnDT02cJxApcz5Yr/A==
Received: from CH0PR03CA0449.namprd03.prod.outlook.com (2603:10b6:610:10e::25)
 by PH8PR12MB7325.namprd12.prod.outlook.com (2603:10b6:510:217::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Thu, 17 Apr
 2025 09:28:47 +0000
Received: from CH3PEPF00000011.namprd21.prod.outlook.com
 (2603:10b6:610:10e:cafe::ff) by CH0PR03CA0449.outlook.office365.com
 (2603:10b6:610:10e::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.23 via Frontend Transport; Thu,
 17 Apr 2025 09:28:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH3PEPF00000011.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.4 via Frontend Transport; Thu, 17 Apr 2025 09:28:46 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 17 Apr
 2025 02:28:35 -0700
Received: from robelin-Precision-3660.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 02:28:33 -0700
From: Robert Lin <robelin@nvidia.com>
To: <thierry.reding@gmail.com>, <daniel.lezcano@linaro.org>,
	<jonathanh@nvidia.com>, <tglx@linutronix.de>, <pohsuns@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<sumitg@nvidia.com>, Robert Lin <robelin@nvidia.com>
Subject: [PATCH 1/3] clocksource/drivers/timer-tegra186: add WDIOC_GETTIMELEFT support
Date: Thu, 17 Apr 2025 17:28:11 +0800
Message-ID: <20250417092817.2751534-1-robelin@nvidia.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000011:EE_|PH8PR12MB7325:EE_
X-MS-Office365-Filtering-Correlation-Id: 4aa3be9c-0db8-4c2c-9efb-08dd7d924135
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kIoDnga161Z3GtMvEqBzg0h8SVpIOXyj4Fl+MGQDKpCWu2ARtbktHGE1ELYM?=
 =?us-ascii?Q?TScCnxIwwZ/vbus1Y6KPs9Pne05rsm7BNLpXv9sODaGYLCdsk35byKDQjT3V?=
 =?us-ascii?Q?HaHnNdvyHryoqtAI+Sxox1Q81hrt1yC11yXIcadIJy+2/4Wt2548HETrZJvk?=
 =?us-ascii?Q?K1VFu8FLta1WbSsgkckQ+snHCjQkWEqRvN0M/Swehtzpuiy6M4pspqqTNfYy?=
 =?us-ascii?Q?icLzO9IYe4PIWKSi88XhUIi7hxrUktNywjKD/CFDQ4CrOYOvK1H3f4kZBkpX?=
 =?us-ascii?Q?2VQuIO52suBPOaFzAgD33TKpTaZKdiI9pevAP0EOi0cpFi1wqWjRb4M16gET?=
 =?us-ascii?Q?AGMrPWLuoeAktVQB5WTM2ZkWl46yH/dYwlaW2NKVv2BKkv/9tfesRR5q9nPy?=
 =?us-ascii?Q?a2lJmL+u/cBzoONpBB2+jismP8OYIy5P40PNludPUs2wD0zfqXBZwqPlQeon?=
 =?us-ascii?Q?qH4Yt05PpkwTQM6cPS8VpFiwvbAweE7vqmMwVc2OhxuLKYCsUojZZNndWOOo?=
 =?us-ascii?Q?q2ry5wzEC1LWtsF2mqcwaLNFXHFPY0lU8Emjj8XDnSfwHEyZRTV8InhAj4pm?=
 =?us-ascii?Q?ASO3BlO1nTw7tBhAD422lJicgqlC77f/oQX8SR967TkmeV81H3S2mcZvYT5I?=
 =?us-ascii?Q?EfgZCoK4d+alnMrKXKaHStfKD0ILBBi6gH2KLayM1E7fUVOs5h1rYQJcbm/O?=
 =?us-ascii?Q?qh+NxkpoNbMUirvyUnLuhPAJxBjf82SzRehpGBTaXb/TQN8kRgXpEV5wShTi?=
 =?us-ascii?Q?yiriYoEljz8R/N6UVOw/MXx6GebdKXguy8RXgG1uXSxMzIF8viCcrmqgyZ07?=
 =?us-ascii?Q?/XOyNUd3ii1VDAe7sT70Ie1uY7Q3MnVe0l0L9hSzN9IhP7CoezhGh6XdCCIn?=
 =?us-ascii?Q?VXBunAgevp2kYmYb2EYKfuL3uFJS1Rttev6tgbswqDSbhVpyoM1TTyR+aotP?=
 =?us-ascii?Q?la9rgg6ocQpNsH/Zo3aq/2QeAd+TFBXSYSvTdEhv1xELdiARQdJR3/77Gn5p?=
 =?us-ascii?Q?aoiBddHauk8/zlA5VbOWxd5umivwmOPZxjl+ulO/gfBLSvh8kGJPeAJfQhaS?=
 =?us-ascii?Q?7ddEb8cyCw+yepujw6XBMsIPjC7Wmo4tDue4GBZXwkremV7WDD0HryGA/o/L?=
 =?us-ascii?Q?ogUevGGT7v7SFYryQZK5snSmuFnIgmAj44+z4ZTeotxQdLVtuuopw5fVPtuk?=
 =?us-ascii?Q?m+X30LVy+z2BveahY0o5FBmMAKTg9vifYhSpWo/Dxwvjm/ZK2icL6v6dlVo4?=
 =?us-ascii?Q?mAexOhSYVnbbGc4TCKKFzGZ9Nl8mtczOGgWTWpytdpq966+efHhVfah72ETF?=
 =?us-ascii?Q?8GwoK3KMHnJC8sLf5hZoLGN1TtQvf+Z56qhEOINtA5miHk11NH+Ap45sRuFf?=
 =?us-ascii?Q?U4TokvXBZrH6NEEEQivR6ggKoUo+pkonXY7r7p96du9pDUitDjZupCJMA6Y8?=
 =?us-ascii?Q?WrfmfWcWbKHmhaqQRSxgm5mLpvvbgizLClSUzj5AolhuYHDjW/FivpjKAkOC?=
 =?us-ascii?Q?pyf3c2wpg3pfxVUtwmLlxaNGdlVgZ2mZ9+3R?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 09:28:46.7787
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aa3be9c-0db8-4c2c-9efb-08dd7d924135
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000011.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7325

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

