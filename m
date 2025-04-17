Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2066.outbound.protection.outlook.com [40.107.96.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02F7227E8A;
	Thu, 17 Apr 2025 09:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744882166; cv=fail; b=gCRTijZ17mSTmubZ8AaNf+rlcs5aNoXoekFlmr1O3dRMCJTEkupUmGc0OVNEDrB9cQcRMEW/uhk48rKdOA1V1lvTmTYsFApTGTV8q8zbiDQdbpteStFvQ1QucL2qwAOnOKfT1AjmYk6ABDJNNqoAeITn2VoJPW4Y3NpzOfPlAGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744882166; c=relaxed/simple;
	bh=xZfz5FAwK66wEUeYCsxbiBimCpTD369bxTfjwf6/mow=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qdgEIbPaCjwtrrgmVrk04sSOy4Wjx4CItvoR7nQTi/4fK8wv5URSN8XpC80zhkLfmnpvSDsBf76kavPI1stOfqkB0FCsrCEdWLJpsvrg6k7ouxbxDg5Dxrk9GpQVN0XhkI6S+g0l+BNS1jF6ZuIKhHZS4lcW/LTbOv05vIf4Aso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=F5l4gcka; arc=fail smtp.client-ip=40.107.96.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="F5l4gcka"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SBbAzQ2J/4yFVZWzr9vr1iL3EgYBcgULLPJXRKFyG2nxeBDLKcDGZ9gEGuN5nrTatnhHW/2vdunvaLw5w3N5zC7YTZPk6ghIplARp6jZSGgDHLvXhDZQbiUJ4r/VCHkJ1wRYYjGICTC3dav6vlBZ3unTOKbDgzcUwKBu222SFEToa4ixDv7CFUghFwbRw9r1/LjC2r2scSws2FCJ4DWMvk3EbrDolvAGyXka++kH73qCIjToeDy6qaJES7thmM7OvlJUzapryVAtw/nxpqaOBqz1hStfiM67PhUUqnbWq/VDjYviIc9CE3K6xMf3xD6EPtUccn/KtDR3YQMABhRFqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BppeThm+uNCh3mivB476OHi5m4/YPuG0/1YOsR/ypVU=;
 b=uLWwcHM0aBmGip3S6Gh/CYWMzU8adwhJ72mAgn6DsFlvQo7BdsFa93QQ4pK2D8Jbu/O4ymVDl4yCGYOTW9C5WkPBWcU6hWyZ585H2YQlUvVg6UH17tMd7F5BAaKnpkgWJlf9mToOgHNmAIMGRnR8KnyZnbr/Ix6jThGQAyxqj3ydOJtQgnyr2v9H/oE22TdY40j7mzoi0O09inYTiESZbFCJ3M3q0teC0IkN78c4qF2Ssr0I6cE+pydByf+7SJ4SAc5PcDu5+FvLlszKVvMBnG3x04yT3I9+gr41l30ieFrCopBL8ROVrcTlIFmdupGxbFsDwEjc9QZCleuUmOsHWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BppeThm+uNCh3mivB476OHi5m4/YPuG0/1YOsR/ypVU=;
 b=F5l4gckaknKId4ssYbJwxpoMTZGxvrrucKbsZ3P5QRDmUvE8T89IXPI1ne6p8jKiCUsPToNdoyMZXn5FyQ5GHFzWZDz9RAU8mS8gIRcttUUGUxMQCD25NYHqBIKcxF6th6Txd74NiRsSccY7EEZ1HMehMseGk3NFP/L9vbPpR6oD+LOybDbVhZok+CZ7TVJ/VmNUtKcgmbTxutfPXesedvkpP+rmCFpGBlJ6rQa0HJEOHw/auuQguWgtOOLtLVouvtRDha6oLzfJgrAnL6lgYhDvRSxI04qqz1jG4BcHWWI0BSMa36IamohreNNZgZyrnuWuLD91+O8NJy9hbvO6kw==
Received: from DS7PR03CA0346.namprd03.prod.outlook.com (2603:10b6:8:55::9) by
 DS5PPFE52C859EE.namprd12.prod.outlook.com (2603:10b6:f:fc00::666) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.21; Thu, 17 Apr
 2025 09:29:20 +0000
Received: from CY4PEPF0000FCC1.namprd03.prod.outlook.com
 (2603:10b6:8:55:cafe::66) by DS7PR03CA0346.outlook.office365.com
 (2603:10b6:8:55::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.18 via Frontend Transport; Thu,
 17 Apr 2025 09:29:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000FCC1.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 09:29:20 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 17 Apr
 2025 02:29:02 -0700
Received: from robelin-Precision-3660.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 02:28:59 -0700
From: Robert Lin <robelin@nvidia.com>
To: <thierry.reding@gmail.com>, <daniel.lezcano@linaro.org>,
	<jonathanh@nvidia.com>, <tglx@linutronix.de>, <pohsuns@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<sumitg@nvidia.com>, Robert Lin <robelin@nvidia.com>
Subject: [PATCH v4 2/3] clocksource/drivers/timer-tegra186: fix watchdog self-pinging
Date: Thu, 17 Apr 2025 17:28:16 +0800
Message-ID: <20250417092817.2751534-6-robelin@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC1:EE_|DS5PPFE52C859EE:EE_
X-MS-Office365-Filtering-Correlation-Id: f87a843f-1d48-47c2-f77f-08dd7d925532
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qATIwKBKCA//EUVpi/qOjuKoDmOfwUTXyh+2o03EBsWEccmdGczpUfHIA3IX?=
 =?us-ascii?Q?lVFeK9Wh2XDWLu/uhQqsxf42VrlKSd2qTAExwAanitaVrFhpf4CZx49Hrfvb?=
 =?us-ascii?Q?LGgVC2TcCCqpa3Ygzrpx5l0/MKl3namtnJKyeAYQNejN5THy70GnLpLm3CAY?=
 =?us-ascii?Q?ZFz7M68GjXJmE3a+dhYwVV3nkGzhczmmnuadxkmHHcBVcyyg2oAxp6c/TEfZ?=
 =?us-ascii?Q?re/6w6hXRJCuWlJF/K3/8y+CEPny9n/9g4ge3Hp4JOjd9rNTG28/ZqNFS+Jm?=
 =?us-ascii?Q?uP0oTGGigOwYTmFk0Qw9BYdhM7jOEVGu0wU55SR7DemgpKJ2ASQmy/I0MXYn?=
 =?us-ascii?Q?Uc9toZQ0tQjbke3DkGl+1DS1VPfZ89c+k2AHPn9yCw9zl8ibMNWXl6i7nK5F?=
 =?us-ascii?Q?ckkHcTJA99amvIJi6kqnSPVIuqg8ecTGNGyS3HIBwnnoeDiB+OJjvqmErFof?=
 =?us-ascii?Q?RNOGoPB4q1a8Vx/XuMUye6KBqxIdot/LTutWwa21mb3P1DDwaAKQ3aAAdqjU?=
 =?us-ascii?Q?c5OWsRtSzZiI8sjXrgZzxFTYEeaYZKy7Z6LtjfuuEWvot5x28wOg+pjaaeg8?=
 =?us-ascii?Q?kRadcgRac9UzBtpO4XDrOMUQBDTaOjRpE1CbJx/ABUmeL1LJ3i6/2bYL8BGk?=
 =?us-ascii?Q?OST3vR6V5jaF/JSe3Skpoj17WYkseBVL9UH0i6xHYB/YTTGRBo3jGi3ij+Dd?=
 =?us-ascii?Q?CbyB7JHSEo7sGmdsp8lhXinuVWfxngLEm2hK7btWQeySAAKtOm30qBpAk96j?=
 =?us-ascii?Q?1qTWKs0wXBiPcKWlOnxK+I2+5No0q5j/LR7QiQL/VZgeWLrtEx+5S8rawMaK?=
 =?us-ascii?Q?rIIiHopE9HTc3ySKCfsS7htDHmqJrbgwY9EMPKTqBZXg3z/+I9Y82mmhC2qt?=
 =?us-ascii?Q?Ra3h2ez++Wyi/3ofA20uUKkWDiCwoEvJxn7u9LNMfmM//JNG59l79hL0DbJX?=
 =?us-ascii?Q?zwTKaER9FVmnJh0SBuF8do0b5TVsPwiF72hwGgCWL5L+RTDj8mA1WCO/JNz7?=
 =?us-ascii?Q?SpPCYL1wtVNAdptSDOuokW0StebpfE9dIhqxq+lRmfze6oMsWQOsVsSZobkg?=
 =?us-ascii?Q?sm9/FR3pIckKMh3lu4UFRwmI+neZsJsBsAp+vriO5Wja5c4GOluA4MSoBgqe?=
 =?us-ascii?Q?UoyWB27XYqyMDdr3sUR4/BN2Spmc01FcOsowcLLFk4o+2y5w44duISJ2PeWh?=
 =?us-ascii?Q?9mqOMui6+7VdFtzpoBll/GhS/U6i+vBCK3rjpwIzsuiG9z/jcD4pe1E6vD/v?=
 =?us-ascii?Q?+PDHr9yhbAuLnQ1H8U8BTsDELSYzV1lxOlYHq2k8Wj/zCnOFIsgxonOFel6N?=
 =?us-ascii?Q?cl4cSAHbsItchcw02caGGKk2mEutLWi+9sTmrghJb3qCFUEDE/5VxYIOmkUW?=
 =?us-ascii?Q?xSj1oObh5LXlDpXaJbFo7Vwq/KhEWrb6ePfaxRUcJooj22S0Dsd7Lax+IPuW?=
 =?us-ascii?Q?xBf590eD/mT5fQskNhlOgCNQXfbGTF/wmU3i3FL4PwrYFbLudL52MnPLbPao?=
 =?us-ascii?Q?Gn9Q721p1QBCu/gzZ7SvICbkELsbL7SNyDJW?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 09:29:20.3016
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f87a843f-1d48-47c2-f77f-08dd7d925532
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFE52C859EE

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

