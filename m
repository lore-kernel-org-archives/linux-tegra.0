Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6190261390;
	Mon, 21 Apr 2025 10:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745230139; cv=fail; b=kNzHlcsSWFxyrHYeO/6YSa9Ve2HNCDGBraoHKPrF7J4GHs9a3KtnidXhmnPd3iAVAosiFdLiB/mkTbOnh4haTn9kNHK7E4zf5Q6m62lufSnLlPZqeikXCtQko86g5bqHodF2IxRhm3FIbmsLbD21t05ImvXweb4lhPNfiEDqn8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745230139; c=relaxed/simple;
	bh=r1Iq0N37h2NNJ+KyWXlAPUxl/haBcEmc15i+fEaiqZI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b2ouQzETymLfqpXanYPmgFVzpiaaehtp2Lf9JKOuPLeYoVsMCinXla4RXQHMW5uBMyqCkx/kCVI04LQbk7s0WPo/b/GcTn9fNevLjZ4fsnCLbUy5L2eV/qrooVNzmxcMtClRVnKeIxPUdKQAr9I6OV1/2sKew7yYbmDtorv5Jbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=C5rqGgEk; arc=fail smtp.client-ip=40.107.94.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="C5rqGgEk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bztaeGkyBR5ENdOLCxqHnK49kSi+U9iFUmdrKQLnfrYSAEFX5ezGoeAsRGdwP9Lp0iJnI04vxTJmg35pwiYJA1Kd6xyYFR+we9OwuHYBHg4J3FfQ7gFNPbq9KifxgXH2CoZRbK0rKgVhmn6Xo1eOcj6cYi0UvfUZ+vMr/LWup/iU+n5x1dHYBSQHzDITi/Cjc2nc0siIEoQb9iyKM0cNqMy0WLDNQuKppcuBCTf4MCjLE1h/R9SCVZSW45gKv9N247hoZc18Bn8iQJPPSitiGL4vRpw3NmfDN9P+jl63iSNCrJzOtX8QiWoN7Yr/f60bJLGnw86EAVbx/i+uYEPVfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U7SI/OPKWDN5kAkGzPndDgbIjpX2GUDHKWrSSRyhwoY=;
 b=d6nJ7flSdgOqQdWb3tSmoN0B35u6rdePwD2l9XMzX0/VXlnXGnbTlc5IKwQNsRhfkXrvuKDDthhs9d7CMHduNoe4N+noWmykBnV1yHSXSXeEOJAJS55aHwnCJgBO9uyrxHO2gW+1pYwfen4UDMP2ySeg/EjVVR/fIUMiWTnjHRnNXQ6+1goiHOKPcGmDjlEgRzn9Ui6mvV5WNYLe0eU+71JMVy5g0iosHlfmOcu2A8FRFl1NFOv1HsD93BKmoNT14mrCST9z2wCUo1WM7QGZqYlTOxiLyPKtPWhs9PnxfCc2lrk/d/WYxxXdcbxppnU4uM9y27CKX/EWF12RQoiMAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U7SI/OPKWDN5kAkGzPndDgbIjpX2GUDHKWrSSRyhwoY=;
 b=C5rqGgEkJJflcHfq9Ka6E1SnAY9xvHGeexifZ1qZfzUzu/t2C38J/lkjLaPVHTvVLZmWQltxeo8sOgSv+ongVH3bPKC4HVWsVZn42or5t6g+2jjJuC9g4VHnIW6uZ/TFCvcAoa9OCB4EAd3/9M+3MwNtsGmbnH+XQhn30SImG+GP9WkpzCaWBioXW6RsC26EXq9DEE2sGplzxerJa/mupX92xsePMVj6YieosFmMCqgTI4dcMMGSNg5NQ7RU5DeQaMqNUhQi541tI4VO5nLA0v3ziJHK2FwDpkoJJEFN4G95RQIcpQa2UKIIcY1f72gZGVC28Me2zT4tY71NPlw99Q==
Received: from SJ0PR13CA0062.namprd13.prod.outlook.com (2603:10b6:a03:2c4::7)
 by SJ2PR12MB8956.namprd12.prod.outlook.com (2603:10b6:a03:53a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 10:08:53 +0000
Received: from SJ1PEPF000023CD.namprd02.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::d5) by SJ0PR13CA0062.outlook.office365.com
 (2603:10b6:a03:2c4::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.25 via Frontend Transport; Mon,
 21 Apr 2025 10:08:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF000023CD.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Mon, 21 Apr 2025 10:08:53 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 21 Apr
 2025 03:08:41 -0700
Received: from robelin-Precision-3660.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 03:08:39 -0700
From: Robert Lin <robelin@nvidia.com>
To: <thierry.reding@gmail.com>, <daniel.lezcano@linaro.org>,
	<jonathanh@nvidia.com>, <tglx@linutronix.de>, <pohsuns@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<sumitg@nvidia.com>, Robert Lin <robelin@nvidia.com>
Subject: [PATCH v5 1/3] clocksource/drivers/timer-tegra186: add WDIOC_GETTIMELEFT support
Date: Mon, 21 Apr 2025 18:08:19 +0800
Message-ID: <20250421100821.2907217-2-robelin@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CD:EE_|SJ2PR12MB8956:EE_
X-MS-Office365-Filtering-Correlation-Id: 60beaec7-8bd0-4e38-0915-08dd80bc853b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5vIX/iEQ/mV2wFjNNyqdS9jSdwhc6K+PqpJ8ICsEzm16Q2fa0qRjoaGREbLV?=
 =?us-ascii?Q?946/0H0seBwHWIao+IQKzNYqdLGWv3/xzcNS2vsomMxsY4g5FIhTvnX3HYgo?=
 =?us-ascii?Q?akewihc1mqB3F6/jfUPA74xJUBklknSe9zGmXUQrWY1yUnC929RVvZPqnMzN?=
 =?us-ascii?Q?1SlMumIViQ4XoQbTT4tQwmGNUVJetb+LZt2qG5XpK0KDwE4+Xq/jYK4vxBum?=
 =?us-ascii?Q?r4LOVclE1pVucNXJVJKIO9p4tpCV9SFxpfNnxZDzGUt/J1f7fO6S+c9SBg/h?=
 =?us-ascii?Q?kr7F7wZfaG8kcLlRt95XIYXN4fFnz8dwaQVXkRi16cAmR7dypD/ESilTb/+v?=
 =?us-ascii?Q?AtejracCCPazy2E4G0PG1Nt8P/GG6X6kuQSg3Anf4mUvAxXXMGNo7Do1QKvM?=
 =?us-ascii?Q?Kg6Z9qhRcduahZhUAbk3REQgDSnAzGl/WV6xqTdkO2v1lgtDZnJM7ZoONXSR?=
 =?us-ascii?Q?zOsUfEIpmoXoPdt9NWJICm0Hz5idU6IdQvajPgrEDRmCDZk1SYsnkWWekd0a?=
 =?us-ascii?Q?BJSFD9iCV31a2B50YG2fN9EKtjAgOyDNznpQf2Pe2XdTXnf5gTJqkvYzYTwX?=
 =?us-ascii?Q?l5+/zRoL7+qszXLaY/MzZN8qucPpS8z8JZzCCAwKQPjF+9qJkB0FrLedTP4P?=
 =?us-ascii?Q?efL0ljO8KMVmuBNpcdvWQOZPuqgyAbCwMpNwY1yEI5nsufHI2O0lsarp39lz?=
 =?us-ascii?Q?mScQCwSn+4sPgqDHTC9rxAerPHQ3z4sYlxcKGWq4OppM6Qrfqk4jErE434wO?=
 =?us-ascii?Q?hbZWUQCCNfoLTFR18PhPcW0rJNnndtEANp7D/hilsxcuLmrBy315I04VZ3jo?=
 =?us-ascii?Q?iV9PdXapXlUR9joT3ZAktYSH65NugsGUtaRk1gU2m9xRteQMhP8WWix2j/U1?=
 =?us-ascii?Q?L+tRD9yJTd+R6Qun/+/Ds2Mzb5RP+n4IOgsWsUJ1FGP8Z9bZW0exF26A9qOP?=
 =?us-ascii?Q?lBz0aqQgUyg4B1P10dxg0ztyDwby1OsT6dk2c/tT8gQLDGv0G7BZQadsTcDA?=
 =?us-ascii?Q?HIzZBDtXn+wC8ORoXlkcYSkaRzQQttsdT0tAjGPnRRmUWgrv475O0KNCKlwX?=
 =?us-ascii?Q?Umw1i6h/lvik39WFZ2BSTHh9mQvNJH8Zcc1aDPsgs4H3Jn/iyTMUkVCJCrvX?=
 =?us-ascii?Q?P0ld+H26AHa06AnK0xkIjisRIKdYnxrgE8SZF/rtfcCgqnN1T7NXoAA2zUFD?=
 =?us-ascii?Q?9d57jZ+x8S2byS0GrJxrB6es0l8bQ1dvWC/IGTFimK2Eg3660aJJQ2b32A55?=
 =?us-ascii?Q?BJNy9yOV0v608H1iQEei+JK5jAMMLW6LcX6pkjZp1SRN4Agjhxj7HX/xvy1F?=
 =?us-ascii?Q?UVHV6Hc6+aM/sFC1rnHzNSQsB9rqg6cWUr7GYhM7ve2aVY+ajBfy3/4k/t+4?=
 =?us-ascii?Q?V3uwJ7OvFwUeYWgddRyiBJD3wfXoFvLcaumQdwxePFbtRCvk0akUQYc9180P?=
 =?us-ascii?Q?VS2ktilzwrYnIgmRnuHEqL9rs/MAkw74fALQPI4WMNyq8p/J9rmDfHQZM801?=
 =?us-ascii?Q?11AUqVEtO6jU31A/OVS5kIsvrNaO1OGtnXdo?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 10:08:53.2798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60beaec7-8bd0-4e38-0915-08dd80bc853b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CD.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8956

From: Pohsun Su <pohsuns@nvidia.com>

This change adds support for WDIOC_GETTIMELEFT so userspace
programs can get the number of seconds before system reset by
the watchdog timer via ioctl.

Signed-off-by: Pohsun Su <pohsuns@nvidia.com>
Signed-off-by: Robert Lin <robelin@nvidia.com>
---
 drivers/clocksource/timer-tegra186.c | 58 +++++++++++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
index ea742889ee06..56d08bf1b6b0 100644
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
@@ -235,12 +240,63 @@ static int tegra186_wdt_set_timeout(struct watchdog_device *wdd,
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
+	if (WARN_ON(expiration > 4))
+             return 0;
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

