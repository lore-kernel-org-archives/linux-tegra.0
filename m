Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2047.outbound.protection.outlook.com [40.107.236.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF98D27602E;
	Tue, 29 Apr 2025 06:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909189; cv=fail; b=hKqqu4/MEkuAF3KHUssLOxeiezTZs+Xq+D3C5A3Lgp4vDE2+C3zizOI4a13SikfoLbp1Xf0jh/DKrhyngv1cM7+yfpQB+G2LmZyo0iQbZOJWKKRFRDrE88kt9tu0fw+olDVxFHpfTn5ZlBqtoo/QDx2DYS3ajStnHNYEGinJHjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909189; c=relaxed/simple;
	bh=GLa+T7LCfhwwda+BTGdPKBaUB0BQ7tnHDqtZvIOetdU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IVnNUQ1nsob8XOwNsd1hvJ5tGD1MjvoNc8sDUE9Tqr88tF5eZxcjtr/xoAMCwtOR5PE7sSl/6X1JOfx0dMi0nLZpuujmht+gwKWf8jHcpVHIGLvX7HrO3s0z2N3CQmEb/RfaHIaNWXxUH+ELqieUmLL2+o1X9DgaFkkk2Z9aaoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qGgy8Tf/; arc=fail smtp.client-ip=40.107.236.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qGgy8Tf/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rHb4EyEGUXvEYyxKSOj+C3DVmuMkgHZi/vlNwreFa/rSpxdKjqHo1CUwkjWCschlDK1yqPAycUuvkgsrtKZBKA6K8s6Rr1TUlVQw0mTW9xrkpITUeZx3Ed7mRG1oiz4A7qxkQ4nZOS2Z4zuof+KxE6Dw7pmOZxzYfbBODn5/orY8VDCnZNisZVhXPrf8VHTFosgr1jc2+PUXUV1/edC4joRr8rQZ3N9xaTkNZr2uP3jpb8NwxiVDeiF2vTD8QOCdzKSqow9klZyon/xAnj4JfplDCtjXj1KX15iKcUbY27t5+0gwGqJUqTpQnvOMI+517jTSl7rXYZokiMxUNFTHvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eE0lPHtgnCJ1/iH4X7kGGvQ7EnCuQjHWDkNoI8UIMx4=;
 b=JygAvhmbk4cuczNHr3t+vFiREJU5O12dZiG+cpdgnkyiNeqqXkOA3lAemZIaQJfxijrVOWkLobiwH524jajvm4FgANV2qKDWTH/zIJAXV7/GnrOi4LDZcE4o61X8iw8XiQdGYXdTkGTRZToO8hD1r+ig+V34IyvCMaXpEDDmnkZaNU3J8K7AxP8mewN1TO2beCSwgD5Ccq8sY3+Jpj+V5dSu5tJdp2t4Lm80X2fwg/X+1EaEeiLkiZhhyI/SDQRUek54Tk3Gg8rM4lPkG4TtLwfcOtbcfwB7ETQqzpouVGbv4H2YQuB4UPOBifrRR44vRvIZC9uSaBhW2T/yE82wlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eE0lPHtgnCJ1/iH4X7kGGvQ7EnCuQjHWDkNoI8UIMx4=;
 b=qGgy8Tf/RYarqoInGXowdAsQZiOewmxJ6djQBmPd8yT4a4odHT4eI8IQotR9URpnvAP+VZ3N8c2PpqHYCaAfIu9ZmkIJaDN7iZIEzcjg6td+f+Frf4JbB5CfuCzK+e8Pq54xiP3u7+xJq44D38z4K7gANzxk7CPQ2KhB5SLfI2nTbD12/m+1fHGg442CemC0wLxkmJRep1RC/Ap5CMA4/p8hZuA6MkJMg7DJbykZ6ieXMfZWqSgBY7ucdTMgao1Elw72yNTG4lrCaS7joTe3iiI96GgMDPWVNF29VSssKvsev1dFUYUhZK0hiTV1FjMlYYro2zNX2sdjJmQV5Xx+SA==
Received: from PH8P220CA0006.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:345::7)
 by SJ0PR12MB6805.namprd12.prod.outlook.com (2603:10b6:a03:44f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 06:46:23 +0000
Received: from CY4PEPF0000E9D5.namprd05.prod.outlook.com
 (2603:10b6:510:345:cafe::15) by PH8P220CA0006.outlook.office365.com
 (2603:10b6:510:345::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Tue,
 29 Apr 2025 06:46:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000E9D5.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.33 via Frontend Transport; Tue, 29 Apr 2025 06:46:23 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 28 Apr
 2025 23:46:05 -0700
Received: from robelin-Precision-3660.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 28 Apr 2025 23:46:02 -0700
From: Robert Lin <robelin@nvidia.com>
To: <thierry.reding@gmail.com>, <daniel.lezcano@linaro.org>,
	<jonathanh@nvidia.com>, <tglx@linutronix.de>, <pohsuns@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<sumitg@nvidia.com>, Robert Lin <robelin@nvidia.com>
Subject: [PATCH v6 2/3] clocksource/drivers/timer-tegra186: fix watchdog self-pinging
Date: Tue, 29 Apr 2025 14:45:39 +0800
Message-ID: <20250429064540.1642030-3-robelin@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D5:EE_|SJ0PR12MB6805:EE_
X-MS-Office365-Filtering-Correlation-Id: b1b61a4f-bec6-4b4c-9166-08dd86e98e6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vWzhDByZ4AvO0BdgLaXX3GEEU1FLMEnsygg5spy82MBnMaYhhzs0OZB+6nAP?=
 =?us-ascii?Q?GA+oJi/Rr0+wXG0vzspINTqljwEs3T1jbFfgWORz9JhqUv3a6GYzhic/iXAL?=
 =?us-ascii?Q?UHFbi5khkb7hUOnouG6k+pe9jy8nagQOOnhdt4u/LOXm5rx6ekz9Ivvmbbgw?=
 =?us-ascii?Q?i5+c41Y5QqoMt9XRdVkYf8dszyHAjM+S8VkucoP3gINvKrzRisFzT0wWNFI0?=
 =?us-ascii?Q?KfnVRxYFYTUM5wtC2hQSAPBLFX7GY6tHzmFLioce4AW7pfHsSZRaWOVNu2l1?=
 =?us-ascii?Q?gGHzxLcFmL/BJbx1qMshrdTNyHq+r4WBliokvhBlbxwNWXumT3tp2JpxhriR?=
 =?us-ascii?Q?0aySh61cEzWsVBQkjar6CcWrZhbZ/bj4kQepoQDAKS+H5/05P2Yqqh0jW55g?=
 =?us-ascii?Q?MhmrqDGNWqp8d/UR8RnqPHo9Dv7rlGdeyg2VP6t4i/Qhp/VHi//UK8pwKqqE?=
 =?us-ascii?Q?LeHxrHtoGgifRIEB6rRcETnZ6HZ8LF2CYdZCG1VKkoNy7wMMoh9Bj5ens/S0?=
 =?us-ascii?Q?jfVdqLC+v7U3xzXaC9gW51AIcSAhH+YZzzAxLAQdU0k5YVugnJAMzE2MAqtC?=
 =?us-ascii?Q?rzKDygS1FkPR14r4P4LkiEWV0mj2OsijmP4X7lRkw1hSNxQy5t93M3ZfVxqX?=
 =?us-ascii?Q?ZRH1lp578bWUAIHa5T5nXVke0gmD3Hck5k/5btkY8XKsBOcJcMTzjSUrC/1S?=
 =?us-ascii?Q?1Ze/2tczs5Vrekub4QIuq/D5Lde3jo77tuwU4x/tSWJlu36cEw3H4PSLstMA?=
 =?us-ascii?Q?XAv+qf6mZsL0aI4ng4omluWV5GQkOSIDyVG0LMYNIY3q2UTN9Bgka2QT5Or+?=
 =?us-ascii?Q?BRO4Sl367iICuv1nscKw4hEaOxoPAXGBARdX7w03k94K/XAC0rcz55OFXuyC?=
 =?us-ascii?Q?vEcXwWgCrDyBnONYeeITC6DKTxhjCBJN0eNvoJ7n4R3lFwmXt8q1KgFMD/vx?=
 =?us-ascii?Q?Eahvm/OZFL7z+JHoRuHy+YGwaOC1hI8Haig7bEVBu4uwHudbDjzCDoViZPGE?=
 =?us-ascii?Q?5bJ4RrYJJr6vqHj1nA6srI7nDe2U50DNB3Gs9yYhWIM2Fiev3PPrEvy8cNVW?=
 =?us-ascii?Q?4s7rKt0Dbjmnnx1UTLWnIJnV2XsNM36fw2mVx/B6j+rdHY7mQ3sIH/dtJjZU?=
 =?us-ascii?Q?wCF34zAzTvqE7N1w7a8BJdiK0SX8ddsR45TePP0Jf8dqe/Kn5oM3vvQUDYJe?=
 =?us-ascii?Q?kAANnn17QB3t2fe+HQIgxn0FndxH+U3pQRsZVCkNfsXFs2VqZNhMm4y1sJlG?=
 =?us-ascii?Q?DVnjV6+zCO/G5Gwjd2sBoArHLGwYRksaO721N49UNxJUDW3iuG21FW6gu+Wt?=
 =?us-ascii?Q?iBt9p6R1YokdNYKIeeyMlS4Bd72w+Mb3TXdrsXuwHWZhzhRuFkT0KUsFhS7T?=
 =?us-ascii?Q?F/8UtWsIYdoKiFWCRU2W6TEkHC2OtR7qKMacHrnRRpXFlxDJCef2x+Ry3Xlq?=
 =?us-ascii?Q?VhC8FzWJrbff+v2GzI2NEsp+pi8NY0k6sZd9Ttf7minmEcSkujHtz393Xwbm?=
 =?us-ascii?Q?DwyQs6aqHjh0IernQ1lazBUY2Qx9xGBWQKwR?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 06:46:23.0230
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1b61a4f-bec6-4b4c-9166-08dd86e98e6a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6805

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
index 800f6650ebd4..132aa574c686 100644
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
@@ -424,23 +421,10 @@ static int tegra186_timer_usec_init(struct tegra186_timer *tegra)
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
@@ -459,8 +443,6 @@ static int tegra186_timer_probe(struct platform_device *pdev)
 	if (err < 0)
 		return err;
 
-	irq = err;
-
 	/* create a watchdog using a preconfigured timer */
 	tegra->wdt = tegra186_wdt_create(tegra, 0);
 	if (IS_ERR(tegra->wdt)) {
@@ -487,17 +469,8 @@ static int tegra186_timer_probe(struct platform_device *pdev)
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

