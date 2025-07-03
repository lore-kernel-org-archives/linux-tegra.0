Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04102D46D8;
	Thu,  3 Jul 2025 11:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751540682; cv=fail; b=pnlhqoAzZXkSzQEjVn8jwRjknC657NFVXTnqOZioGVpzYWJR3/PzrVI04icWTzJz7zEXqFLQQP7fMYX/etkN/9Vh8vZa7nGhcOE4NH5rLdQjyeyYjvBPoSATvbRCk64Tsm7fTcHJRdC7ifnFoD9O67EqnmbHusmMfu02InZTIFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751540682; c=relaxed/simple;
	bh=CdEkV1SZrHW+OvrNZmOiBJINaYE7Ptm3UNlHOwkloAw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bMz5GuQhtIfo6XEJDZHu/9FjusFx5wT3vsOZ1qW3Hl5aA2z6fCLLXH8PDL9RE4C+bBl+dsLe605Nj5MWx1aPsm5r8/YyB0GftWcU5Mn0Z3TgsVRFAxsnHM5/BmOhffKj+TQmMx5mFwfZO7fG4v89ByPf0GPHY7cHl0qi/MU/EuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=l9BDYS88; arc=fail smtp.client-ip=40.107.93.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="l9BDYS88"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PNcD7+ydOB76pOIIgEzhoNoy/aZhkRzftXbK2mzbQ6025fvbI9lkwOt4OvO5WI5/YJEQ+ZkCjI/CmQfvQ8qTLuoTGbHKjFH1a2LxM1La/4vtQoYoIb6JSunXDp27yzVriPjJXlb6wVKpmWGUV2NCoQPSoeom1ansunjNeZDScYFzGegoveTIw8MDdQpOaZJsZj/JlQYgQdtZeL58SViFqdg585vsryglut6MEH8dJkmcl5yTavZ2Yaz95Z2kWxvDtyzKcYjgruaZIXWjuq2a7nJh1PZ0Fy1jA1TpdwNW1ds21/8DwXLRZ0XtlsjBghDiEbUS7ptdZlSLAXDoLffzIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cy5SI3fV4zfHc5RI9fJnCJt+WfVdZTa9qd1Ee+ECRY4=;
 b=UyDxs2GPtRzEEI9wcgfBR29kR7UBwRyVDgdt7rjADSjj25iQkoZXJoYT0OlFObUwzS/R+OAYEe1+NR2vMo71QW14Gsm+bxNKO58Vu+yGAw6hR0qwkktQb7KwGU41CRnyarA0c2ffyijPivQ0PKeQMfXaLZ9w5uB+q+B2U6fLddMTF60/Dif2j+eVA4CnF0kFjdL0QsYHQBCG2EKWSvusp+jbzty4nfSY6bFgkcoCh8agswSO0SOxxp0oWqVaZSoj0KteyzGm57mdEHoxN/2bYnDjVvX/jViwPtfJOmAKoZIkrQvVcTGRrJrm3V06RGu43SjXrj1rgZ0qeiyd6jmjkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cy5SI3fV4zfHc5RI9fJnCJt+WfVdZTa9qd1Ee+ECRY4=;
 b=l9BDYS88JJIKUDoGcNaGQwqqhhf6XUvLvqtRxeoY3h6XVO+R3dl8SeUcbdjx6GLJrEfdM4lh0hyGR53BcdiaXleRJj9IiAD76attD63mKVy9N5qqAxHHh4kyT8Sj/7TouutlJw/vH9cPmZ9i0oRAFJk0CVqc0Tbe7KeOkBGp6BosF9+zqgQShCI2Mhjey3op9g//i7VCijc6Rrg9ubX7VfTlZR0CZ+pVCK3fz5lMrM1bCvqIVMSuql3B3rjPsdtU7CO3U2bUZzy9oi95TF+f7jTdiWfRKTaMdwihiQMQ1TOSx7bJtkh8OhKXDS+T+v8YZVo2pZwOEujW6Tuh4SQs1g==
Received: from BN9PR03CA0878.namprd03.prod.outlook.com (2603:10b6:408:13c::13)
 by PH0PR12MB7838.namprd12.prod.outlook.com (2603:10b6:510:287::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.27; Thu, 3 Jul
 2025 11:04:36 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:408:13c:cafe::fc) by BN9PR03CA0878.outlook.office365.com
 (2603:10b6:408:13c::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.19 via Frontend Transport; Thu,
 3 Jul 2025 11:04:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.20 via Frontend Transport; Thu, 3 Jul 2025 11:04:36 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 3 Jul 2025
 04:04:21 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 3 Jul
 2025 04:04:21 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 3 Jul 2025 04:04:19 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <daniel.lezcano@linaro.org>, <tglx@linutronix.de>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH v2] clocksource: timer-tegra186: Enable WDT at probe
Date: Thu, 3 Jul 2025 16:34:15 +0530
Message-ID: <20250703110415.232741-1-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|PH0PR12MB7838:EE_
X-MS-Office365-Filtering-Correlation-Id: bb7db18b-9a2d-430b-f1bf-08ddba2165fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OHc1OVo1aWRaMWlFWlZJNngwdklBdHZiM0NmS0dCNmk3OVQ0V2d3Y2gzRlk3?=
 =?utf-8?B?MlArOWg5WlVjUVphc3F6T2pVeE9Kdk5mRGVsRzkxUGdpNGRrcnRGRjg3amRn?=
 =?utf-8?B?RThOUEZ4WjJLWkpTM3pwaEZTaEoxSmFBeEpLcjJEV3h4ZlRaeWJXRWJicDRM?=
 =?utf-8?B?YTVxUXlSUUN3aTkwZTRTc3BzSzVYQmZZUG9VWFMzcjJtWTViOVFpWlAwU1lH?=
 =?utf-8?B?c1h3aU5NRVc0TlhmTnAreW51WkxXV2JNWGRzeU85VTN6cGFpSHhUZGNHazMr?=
 =?utf-8?B?aWxicW0ySWg1NFFyMlgxV0VqUTltUTA3c1dMQTdMZ1FDbUNGUkVXaVZ5SmdP?=
 =?utf-8?B?cjdLN28xVXRuUFB6OGwrbjFMajN6TU9keFhnLzkzQTFEOWNqNFBZTk5lMUMr?=
 =?utf-8?B?Mm1ISzFldklYRTFsMGxkZExIQ1hja2VTQUxzZmhRWDhweU9nK3dxekRzdzdq?=
 =?utf-8?B?ODZ6MW5zR2Z0VEgzdXZPYUt6RzIzOTl5QUZjck9YY2FyMEluQTF5NG5CTCtV?=
 =?utf-8?B?ZUdPNzN3eEFRTDl3TGpJbnpWOStRL3dHbFRBeDFXejR2Rk83bjBpa1JBYitP?=
 =?utf-8?B?L0VwL0VZQWtHOVZDVHphNWRsb1pmQUk4VCtFaGE5WFRHZjRpZmtqWitVTmto?=
 =?utf-8?B?Q01EYm9jbTBSTFhSVFJHakFIaCt2SzNlV3dTTVhxRUljY3Z6Tk9QQkF6eUdS?=
 =?utf-8?B?QmtxMlJWQnZYVGI2Ty80Rkh4REo5MmZCc0JZa1czYzlBbWhQc3FBWTR5TWx3?=
 =?utf-8?B?aWpHUkM4Zy9PN3pGVUlaYlo1UTBDYWpLdUpkNXhNZk9LVUVjekpZUEE0M09Z?=
 =?utf-8?B?b3lKYVR1emFOWDZFZjk0d0NuVnhxMGQ2MDI4MW5obWFzejZ6b3BZelcrUmdm?=
 =?utf-8?B?SWpLOXk1MzA5b0krTzFZK0h3SXV4aStDamd0VEFHZzZJVDlqb2xrSVlRVG8y?=
 =?utf-8?B?VUJEYzRyRVF1V2JQVHRpRTd0RmZReDZXbHo5ZEZ4OGpweGJrYm1hckMvSklT?=
 =?utf-8?B?MlU0MThpTU5ZaHd2UFZadTVGVExrdjd0UTB2bW04bU9QZDllenlTTTVIRGYr?=
 =?utf-8?B?RkdvcEtvTmZKblY0bEc1QWhOZ2JMWjlERlFSYWc0K0NMc1BReTZBanhRcThM?=
 =?utf-8?B?SEZDcG92Ti9ERlVKUkF1b3FhMDVtdm9ZNDVlSDR4N205cHlXQVFhN3hIYTJ3?=
 =?utf-8?B?RGpEUGhkSXpvcko2azIwaWNodkE1bXJmcndVN1lhL1NBSGpJd0JxdkFkTWtH?=
 =?utf-8?B?c3grYlAvUzhCdTFmT243T2Y0ZGdhYkZmY1VtdlVwbERCZW9aTWUyRi80ZWVn?=
 =?utf-8?B?bllyOG5CWWd6SkRYZFBFMGVvdVJNMHd4K1BJbWlqWmQ4eHYweU8wRjdJOGhK?=
 =?utf-8?B?SjhSNnBvRWZ4SjBmbEhSaE5acXdlZDJjQiszNmdBWTVjVDV0NXFLTEZObjBW?=
 =?utf-8?B?QWNUa2E0U2pEdGcwYXZ1NEtodE5FQ3lEUnNDSW9BbndYZEVxU0c2TTA5dWhL?=
 =?utf-8?B?Y2JZRWdzSGhjMDNNSVhwemJlSm9JVnlkUmpKeW81NXRVQm1kOXhQWTJyMGNv?=
 =?utf-8?B?QVNnMEhHNS9FNDZhand5SUhhbjJzbDd1eEFHMFl2UFVHYlRUdHRlenBRSjBL?=
 =?utf-8?B?emlZZERnSDlvY3VQdHVhdEp6NXpUcnc1TzVsclQxcjBDakJiSDYycUpvN1pz?=
 =?utf-8?B?MU5URTZvRVE2aGJsREg5Mk5Gc1lxR1hvNUJsclJIK2NjWmtPTHFmc2pYSnVV?=
 =?utf-8?B?cjFuNUNVMTJGNlN1UUZaSVozR3l5Mzg1d3daZTJ5eFE3WWRucGhKajlGcXFh?=
 =?utf-8?B?dk1GK0YwaUExeXgxdXU5SkltbWI3dG9yNjA3U1BsSFJmL2ZRWk92UEpnMjht?=
 =?utf-8?B?cmlGNjNyanlJdTRqS01hazlXVEhVTHcvRmUrTEdLNUhhRkc0bWNVbkRnRVpZ?=
 =?utf-8?B?aGdYbENLQi9TWjR0NlVzTGtrUVNnbDltaHpPWjJrWEEyR0x6UVdtN2lxSmxG?=
 =?utf-8?B?bzI1Nk55VTJScDZ3KzZOS2FOdERPYmZIeHJLN0dzWnRiNnFIZ0ZaVDhGOWZO?=
 =?utf-8?Q?/0JFhq?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 11:04:36.2447
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb7db18b-9a2d-430b-f1bf-08ddba2165fd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7838

Currently, if the system crashes or hangs during kernel boot before
userspace initializes and configures the watchdog timer, then the
watchdog won’t be able to recover the system as it’s not running. This
becomes crucial during an over-the-air update, where if the newly
updated kernel crashes on boot, the watchdog is needed to reset the
device and boot into an alternative system partition. If the watchdog
is disabled in such scenarios, it can lead to the system getting
bricked.

Enable the WDT during driver probe to allow recovery from any crash/hang
seen during early kernel boot. Also, disable interrupts once userspace
starts pinging the watchdog.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
 drivers/clocksource/timer-tegra186.c | 46 ++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
index e5394f98a02e..bb16a119d55f 100644
--- a/drivers/clocksource/timer-tegra186.c
+++ b/drivers/clocksource/timer-tegra186.c
@@ -57,6 +57,8 @@
 #define WDTUR 0x00c
 #define  WDTUR_UNLOCK_PATTERN 0x0000c45a
 
+#define WDT_DEFAULT_TIMEOUT 120
+
 struct tegra186_timer_soc {
 	unsigned int num_timers;
 	unsigned int num_wdts;
@@ -74,6 +76,7 @@ struct tegra186_wdt {
 
 	void __iomem *regs;
 	unsigned int index;
+	bool enable_irq;
 	bool locked;
 
 	struct tegra186_tmr *tmr;
@@ -174,6 +177,16 @@ static void tegra186_wdt_enable(struct tegra186_wdt *wdt)
 		value &= ~WDTCR_PERIOD_MASK;
 		value |= WDTCR_PERIOD(1);
 
+		/*
+		 * If enable_irq is set then enable the watchdog IRQ for kernel
+		 * petting, otherwise userspace is responsible for petting the
+		 * watchdog.
+		 */
+		if (wdt->enable_irq)
+			value |= WDTCR_LOCAL_INT_ENABLE;
+		else
+			value &= ~WDTCR_LOCAL_INT_ENABLE;
+
 		/* enable system POR reset */
 		value |= WDTCR_SYSTEM_POR_RESET_ENABLE;
 
@@ -205,6 +218,10 @@ static int tegra186_wdt_ping(struct watchdog_device *wdd)
 {
 	struct tegra186_wdt *wdt = to_tegra186_wdt(wdd);
 
+	/* Disable the watchdog IRQ now userspace is taking over. */
+	if (wdt->enable_irq)
+		wdt->enable_irq = false;
+
 	tegra186_wdt_disable(wdt);
 	tegra186_wdt_enable(wdt);
 
@@ -315,6 +332,8 @@ static struct tegra186_wdt *tegra186_wdt_create(struct tegra186_timer *tegra,
 	if (value & WDTCR_LOCAL_INT_ENABLE)
 		wdt->locked = true;
 
+	wdt->enable_irq = true;
+
 	source = value & WDTCR_TIMER_SOURCE_MASK;
 
 	wdt->tmr = tegra186_tmr_create(tegra, source);
@@ -339,6 +358,13 @@ static struct tegra186_wdt *tegra186_wdt_create(struct tegra186_timer *tegra,
 		return ERR_PTR(err);
 	}
 
+	/*
+	 * Start the watchdog to recover the system if it crashes before
+	 * userspace initialize the WDT.
+	 */
+	tegra186_wdt_set_timeout(&wdt->base, WDT_DEFAULT_TIMEOUT);
+	tegra186_wdt_start(&wdt->base);
+
 	return wdt;
 }
 
@@ -415,10 +441,21 @@ static int tegra186_timer_usec_init(struct tegra186_timer *tegra)
 	return clocksource_register_hz(&tegra->usec, USEC_PER_SEC);
 }
 
+static irqreturn_t tegra186_timer_irq(int irq, void *data)
+{
+	struct tegra186_timer *tegra = data;
+
+	tegra186_wdt_disable(tegra->wdt);
+	tegra186_wdt_enable(tegra->wdt);
+
+	return IRQ_HANDLED;
+}
+
 static int tegra186_timer_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct tegra186_timer *tegra;
+	unsigned int irq;
 	int err;
 
 	tegra = devm_kzalloc(dev, sizeof(*tegra), GFP_KERNEL);
@@ -437,6 +474,15 @@ static int tegra186_timer_probe(struct platform_device *pdev)
 	if (err < 0)
 		return err;
 
+	irq = err;
+
+	err = devm_request_irq(dev, irq, tegra186_timer_irq, 0,
+			       "tegra186-timer", tegra);
+	if (err < 0) {
+		dev_err(dev, "failed to request IRQ#%u: %d\n", irq, err);
+		return err;
+	}
+
 	/* create a watchdog using a preconfigured timer */
 	tegra->wdt = tegra186_wdt_create(tegra, 0);
 	if (IS_ERR(tegra->wdt)) {
-- 
2.43.0

