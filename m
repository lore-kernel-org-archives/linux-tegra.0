Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2078.outbound.protection.outlook.com [40.107.244.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55525226D18;
	Thu, 17 Apr 2025 09:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744882143; cv=fail; b=D/5bmhZ1MCFWZ7fRuI66jrEX2dDY3HN9sxTT8VCBlkxalfH4hqNj/RXSYr8wF3cweoKh3C8p7aTceSt9XuQsMbobLFZ4ihFzIQOaaT4U1S8jFCO2tMH413OIPh7hRQUaScKs9+14old4Ni5Uz1dGZ8ho53ZDre+mDj/8oyUmd50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744882143; c=relaxed/simple;
	bh=xZfz5FAwK66wEUeYCsxbiBimCpTD369bxTfjwf6/mow=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KlJVWLCIL2YU/l5iF6sMd1lHdKHVNhQC1J0uydj/GGI4w0FloyoB7RiX4SiyjTngWAp5gEXRTG6E/5XN9NEGNZ/GE2FRJbUyDnj2Mn0outEY4rn/rA7UDZKJ8Yyc58Zm+/Iej1FR31lEH2YcXsFpizyrvIihnoXLW8pOw2G7cCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ch+vL+tu; arc=fail smtp.client-ip=40.107.244.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ch+vL+tu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cru7hes3jARyPm/+XnLTV38ur7NX/3VO+m0mnRInFgMDFb+BGwu8NFRmZwr0ezPMCCmcDOjEo04mQOuOMo0kz03hvadkh00DV9HP5nCrNusQYqrQgUwJ+XgdYoV7Yu5GVJ1Qv4yZ98n0zZ9cCP+b4tdDuFcMSOGs9agSawwdmwUbA5mCbWnHdK0wo0GxlxQ79NvBQ22g/ZwHJXsdI/E417jafdumSnX5heYBS4Zcq2ABm53tPuHbyr0P/xONtGfEuMtrrIQD2SdW+8A9MLU8L0UCYVABHt1RkPhloxG0+eYuijazncaNibW5LIeaqWpTal2hDDihUixPX9UFBaQl8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BppeThm+uNCh3mivB476OHi5m4/YPuG0/1YOsR/ypVU=;
 b=vuN5mKsaV5a8drvjoM89LqKhYdhS2BeBi3qcpW1Apwu8T+8POBB0FNN9Z6jv3E1P+nr8OmKSZVdvqZuLllpvrLYLGrB364nsrRayXvbEjU2M7v/jDjIJNZRLRAghHY824ySlYopunAaBNBgwIIORqnVk0kAPeWMLfraKkWC4JpuQoYBYo2i5pttw/GGKATWeq/6hsRkOFGmI9sMFcO35jsIsTd9UlF2Um5wUXfw9yOZWra8+e4HANgbAFPYJ9Y4EkAbIAx94CjECd1dk8ciSzyNY5dLQjpXP+9/u3WAAVBbVNPyyGD0Knx0KYb2Jg5uEcGxiiBCYC2d2P5dBp21h5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BppeThm+uNCh3mivB476OHi5m4/YPuG0/1YOsR/ypVU=;
 b=ch+vL+tuBWNP3g0l0M8pItKi37e7yErWQ4xvquOqnAPgoafupRL585Kp7hBT+sKVvYH81jiz20+92ueoTk+e1J5T5+WHaC4B5zHlaac4SxukZgY9bRyTbuH2qZ0nupG2sBNkh3FuPXJ4Ls/w9e60Z64ppcsPB+fkvA7CW2+eOVAoEhs9nyYqN2tyagaQqwz5mYPphymB7X4nzRMOgguDmI9Hn4nuu9ACcVeR+KfQa8OADjQaDD0LpsglHI+nX643eX96Yhzf2cewE/Hn+BsPpt2sUTwErH4kdt+/GtvhwfVDfkiVIDgDEsnvlQw600GIfB3NwOJ49ZnfoZJzikf+4Q==
Received: from PH8P221CA0037.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:346::8)
 by SJ0PR12MB6710.namprd12.prod.outlook.com (2603:10b6:a03:44c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Thu, 17 Apr
 2025 09:28:57 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:510:346:cafe::b8) by PH8P221CA0037.outlook.office365.com
 (2603:10b6:510:346::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.23 via Frontend Transport; Thu,
 17 Apr 2025 09:28:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 09:28:57 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 17 Apr
 2025 02:28:41 -0700
Received: from robelin-Precision-3660.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 02:28:39 -0700
From: Robert Lin <robelin@nvidia.com>
To: <thierry.reding@gmail.com>, <daniel.lezcano@linaro.org>,
	<jonathanh@nvidia.com>, <tglx@linutronix.de>, <pohsuns@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<sumitg@nvidia.com>, Robert Lin <robelin@nvidia.com>
Subject: [PATCH 2/3] clocksource/drivers/timer-tegra186: fix watchdog self-pinging
Date: Thu, 17 Apr 2025 17:28:12 +0800
Message-ID: <20250417092817.2751534-2-robelin@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|SJ0PR12MB6710:EE_
X-MS-Office365-Filtering-Correlation-Id: 050837b6-0769-4e66-7066-08dd7d924797
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4er5ROwu0w/pEdSeRJeFurfHA19xIFbTtj6EiF6JsGZqNSm3ioszHXKXjJ5o?=
 =?us-ascii?Q?iH9ZPMeMGyhORQV8hIw4p8ZbVSIrnoHXWJ7kels/Dmsz+j8vlJOeBW8oDoAr?=
 =?us-ascii?Q?670D/XDZQy92j6s+F3Y2r1+l4nA5TIW+bcB8ghy224tMMNQ9Ei5frSPzaXLK?=
 =?us-ascii?Q?jBcH/9ISblgXUdf8ndkkcA93JqcI8Xz4wxIFTq8WhwWf3nj0b/RjQjcXYh6F?=
 =?us-ascii?Q?RAIVm4FXpDaamoyDjGdnnT9/A+MQ6trVuIqj3vzJPEVFCgOFJkxydsceUlW2?=
 =?us-ascii?Q?5gkOv5ViB2nCKMuQrHuNWZ/8MGC/aq318jEUXSFEPbSl3WfzNWy+TOkIWOpp?=
 =?us-ascii?Q?NqjOcMrXVFtpT54pRoL0CO39iu+SFw2Q0BfMBbSdO3t0LYiDR7P4meGH2cUW?=
 =?us-ascii?Q?mCxJlIQmSPkrsyJyd5G4Ga7WDobMQWrgZQ7O+wxv6JbmP14eHniROsAjdiMw?=
 =?us-ascii?Q?YdxNvM0swoGzVa5I1sPh0jGv7Ee4P5Dlxp0FDnkKkUt9rlIxWKvnwAWWiZDP?=
 =?us-ascii?Q?yWXDA5e/6upFFUxAr8t6nQzPhvzPC+Qz8/RzQhDpqbrK2Yapu/bouf704t5e?=
 =?us-ascii?Q?UUWP62/5hO8HxumdtnrPnRznWlsvm7ciBPeyift2hRFryhJ1XJ/ZGsJQSxUX?=
 =?us-ascii?Q?n9XF8Rn4q5JDvB9MU4k4BH0iEA50TZaBMWh88gB+8OMKtU6DGsl2s8lvR7rE?=
 =?us-ascii?Q?IMd7NLQ6A/WUVQsBg92X7bNni5m+CtnpuIsMXs5juq20+dc9dRxdGrMW3ap5?=
 =?us-ascii?Q?VmkzenGgxBokSAUDYlpBGyx/UsUUIip7O9CNDaqpgaBBaDozXcn1Owsd18bg?=
 =?us-ascii?Q?JG/Kue0vfoEPXs8slSRoLmKJwwxfLYfw0Sl5JwGtfvbzLwuBRh4O5O/Kp+h8?=
 =?us-ascii?Q?Ek3rjUjA/h0RRRBPk8vGSWgIW1lEwSYja4eNWbNhDzfzKXkpO3+I9+Z1Affj?=
 =?us-ascii?Q?RCs1ZduFrzQMB4Z1j3ldCO3Z8BXZuVdPebO8OH2wMARSAAfCIGdIB75F9/3J?=
 =?us-ascii?Q?FaiBoNC4Am5ugAz3m43eBAY1xULAv963M5KsnZYub9kMNf6iUzuonkisYDX9?=
 =?us-ascii?Q?RYHp+qvKwShHMmDtIepuaM2s1m4zwJjOkDemnogCVqWekR/S3MwItjISuTac?=
 =?us-ascii?Q?yQaSMRXUkjklSvCgkPwhSYsE6mbaSNZRcgAHFShjVO654XWWUBh/9d0lpYxR?=
 =?us-ascii?Q?VJ7xhI/RHweyzaWz6Ky0mthh/OSRbMsBRh2IVAcGNWODfn4wYOL40Ctrlvim?=
 =?us-ascii?Q?e7JGDDJMVEn43NMaZi2MLacs8iFVmiFTZVQcojRgUpV27pA75/2VbI2dUG+2?=
 =?us-ascii?Q?R0746MAT5K6dLwmVI0suWstAvLS2oMtOr5fcccjq0BAdbgMXZFwXAKFhQ4dj?=
 =?us-ascii?Q?i/sQ9+SPHnJxL/i+k97HH9xxhhWMFeDw968aGY7NNuAJM5aXzq3vpXWSLsGW?=
 =?us-ascii?Q?+c7MEUQFzaTnuuVO4BY6TcmpU+3gitorwNPbOfbUKhTYAP7RTT15cPP6Ea1h?=
 =?us-ascii?Q?vzLHw/IvFUDYh/FYgo+jpDEgAMorbKqsCzd2?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 09:28:57.5188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 050837b6-0769-4e66-7066-08dd7d924797
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6710

From: Pohsun Su <pohsuns@nvidia.com>

This change removes watchdog self-pinging behavior.

The timer irq handler is triggered due to the 1st expiration,
the handler disables and enables watchdog but also implicitly
clears the expiration count so the count can only be 0 or 1.

Since this watchdog supports opened, configured, or pinged by
systemd, We remove this behavior or the watchdog may not bark
when systemd crashes since the 5th expiration never comes.

Signed-off-by: Pohsun Su <pohsuns@nvidia.com>
Signed-off-by: Robert Lin <robelin@nvidia.com>
---
 drivers/clocksource/timer-tegra186.c | 27 ---------------------------
 1 file changed, 27 deletions(-)

diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
index 201b24ca59f4..708d9f8682ea 100644
--- a/drivers/clocksource/timer-tegra186.c
+++ b/drivers/clocksource/timer-tegra186.c
@@ -175,9 +175,6 @@ static void tegra186_wdt_enable(struct tegra186_wdt *wdt)
 		value &= ~WDTCR_PERIOD_MASK;
 		value |= WDTCR_PERIOD(1);
 
-		/* enable local interrupt for WDT petting */
-		value |= WDTCR_LOCAL_INT_ENABLE;
-
 		/* enable local FIQ and remote interrupt for debug dump */
 		if (0)
 			value |= WDTCR_REMOTE_INT_ENABLE |
@@ -420,23 +417,10 @@ static int tegra186_timer_usec_init(struct tegra186_timer *tegra)
 	return clocksource_register_hz(&tegra->usec, USEC_PER_SEC);
 }
 
-static irqreturn_t tegra186_timer_irq(int irq, void *data)
-{
-	struct tegra186_timer *tegra = data;
-
-	if (watchdog_active(&tegra->wdt->base)) {
-		tegra186_wdt_disable(tegra->wdt);
-		tegra186_wdt_enable(tegra->wdt);
-	}
-
-	return IRQ_HANDLED;
-}
-
 static int tegra186_timer_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct tegra186_timer *tegra;
-	unsigned int irq;
 	int err;
 
 	tegra = devm_kzalloc(dev, sizeof(*tegra), GFP_KERNEL);
@@ -455,8 +439,6 @@ static int tegra186_timer_probe(struct platform_device *pdev)
 	if (err < 0)
 		return err;
 
-	irq = err;
-
 	/* create a watchdog using a preconfigured timer */
 	tegra->wdt = tegra186_wdt_create(tegra, 0);
 	if (IS_ERR(tegra->wdt)) {
@@ -483,17 +465,8 @@ static int tegra186_timer_probe(struct platform_device *pdev)
 		goto unregister_osc;
 	}
 
-	err = devm_request_irq(dev, irq, tegra186_timer_irq, 0,
-			       "tegra186-timer", tegra);
-	if (err < 0) {
-		dev_err(dev, "failed to request IRQ#%u: %d\n", irq, err);
-		goto unregister_usec;
-	}
-
 	return 0;
 
-unregister_usec:
-	clocksource_unregister(&tegra->usec);
 unregister_osc:
 	clocksource_unregister(&tegra->osc);
 unregister_tsc:
-- 
2.34.1

