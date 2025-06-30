Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2061.outbound.protection.outlook.com [40.107.237.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0424823E34D;
	Mon, 30 Jun 2025 11:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751281344; cv=fail; b=nCLhXa42U/q8AlOclQJkUB7y9KpcjCFVcjfe5J1jmqBKXtVzkwjFq3yOyaxvce155y+uNu1cmDHrjavXbWu6pyRqEXKpipznHTqbP0kk//GBuMci9f9KzbQ/j0fJDcwOU4fi6FoEZ7Rr/O302WQz8uSVILJKomfPAFOcETUhFo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751281344; c=relaxed/simple;
	bh=0GdN16f1sWA1RVo1X99kQHLrwtjlkEhR0rzqkrM+oP4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=coIc83YTk8pnSL35nQ7J6Dr+eQ2RwoyYDgqtrGGej+UIYwgTf/znqniM8DUf0WeOvgZGA6s9xzvTnjDbIrW7EWN7lIlsaZSLyknPt6oK/dERpyy8L4YNFwvVZgjvhzLB0A6czzhFNbLtIx8yTjC8gn7tkVkBlkwcEvR78KXrEcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Wd1b9nIT; arc=fail smtp.client-ip=40.107.237.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Wd1b9nIT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=riuP0UoQomIQCco42DMzrc6jT6KjhKvVbp3dz1G1YF5Fx/WQGYnSfblt1Lo8eIdeD+3G8jyxGPrNQF8qCEzL4rNWiswG7JpnIq6cITiaUem1DVDtDc1AzICZX607N3F8U4Ep5V2FOpoJq6c4k5hMrF5LOyeCfOUzgk9ajP7FQPJWS21EViBdqBtgdYOEzI1zam3VfCk97f8TxEOTv/3ilxChFmRhEEDtOcR/FVYEvnwo+Z14He0UXi/K2ZvISHUz8i2UpRRoTON6sB6mXpjzqRh2/7RA9ITBSB4Od8vwr4H4RACm6bumz0GUjkUmqw7kONz3C9zT2+n8WyFWTW3Xag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9AS/JLlwaLYGQyT1cHx01QPhUPWp7j9boaryDtimTys=;
 b=PDYRWawcSsJnohyy9APf7vD/KhuOkB7WxTsx15epn2YAbYeP7Cs4jHxP8e4JiwFrbjRONzlixFuf+7qcDbMugnd/+x7r5kUuuL4dz20WIhFKuwSlIISo5r5HmahAdmqHaF1y9qv+5x7NPFojIjLqeNaEsGITeZgl+ri77KK0mCVUw1CN02KOYtfWxg/dE+7RoPDaA3BddBUuD+QGixFxOB7psz7cURviCcjZo8uyKEa8pWwN9z7G37InV/9PJQfya8C/8iNTy10JizyfpqpoDHZ4jITRnt3xJNA5S7hJ+stHO3MOr+xqoInIbwcr3ZFiiuZI4gnSD2Eq/1iV8gfqQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9AS/JLlwaLYGQyT1cHx01QPhUPWp7j9boaryDtimTys=;
 b=Wd1b9nITz0lI0tiRVbgTBWE0CHBBWcyZOcIwsuTgemRGX5iiL8Uj49utlNmJvpZJs7eM411kOOYnqjFmgM5juUYfTBx5QqCZSFVt1cSD5S9tsw7dGnDHITRtSMvTMHEPSdTaRpIVzyG6UXoX5g0e4O/woo+RPBs23bP9mByrMY5J0Z3WUpvabD0HdOmeU7WVgTyqgAWdhBI3fKH30LpPApvVpI0IFNn6SnKUnIFEN2o6Y8xM1jexFXSW2C7LgWJow0UePKsnfMadQhBoJrZhIcSKepTo8csdAkTufSShYkelsA5l1mSMPX06fw2tVRssQshT0f2B5wsM1t8TbJDJTQ==
Received: from SA1PR04CA0002.namprd04.prod.outlook.com (2603:10b6:806:2ce::10)
 by LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Mon, 30 Jun
 2025 11:02:20 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:806:2ce:cafe::91) by SA1PR04CA0002.outlook.office365.com
 (2603:10b6:806:2ce::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.30 via Frontend Transport; Mon,
 30 Jun 2025 11:02:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Mon, 30 Jun 2025 11:02:19 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 30 Jun
 2025 04:02:07 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 30 Jun 2025 04:02:06 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Mon, 30 Jun 2025 04:02:04 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <daniel.lezcano@linaro.org>, <tglx@linutronix.de>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC: <kkartik@nvidia.com>
Subject: [PATCH] clocksource: timer-tegra186: Enable WDT at probe
Date: Mon, 30 Jun 2025 16:31:35 +0530
Message-ID: <20250630110135.201930-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|LV3PR12MB9265:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ec17698-d152-417e-cfa9-08ddb7c59509
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NnpzUG50dkhsekRybE1ZTlZ6SUlSUS9GK2lSbXMzcVM3czhDSmk1V3VnQzJD?=
 =?utf-8?B?N2V5Z3NkR1hXV2xCVzF3SmcrWXU2NURCMGZObDdmY1lLWHFaWjJ1QVB5V25P?=
 =?utf-8?B?MjhOKzk3ajFTWEdzeUdBNjh2Z0dEcEhLVjI3MEg0ZTEyc2xXbG9pRWxoZ0Jz?=
 =?utf-8?B?TEg5UGIzREJJZ3liNUFpaTFqWWRLSng3NFZtdzF3andwcVRTd2FhTndjMTlm?=
 =?utf-8?B?VCtMTWxNVUpOb0dNRVJrK0p6aUVBWUp5YUZIVGlCV2RBYkFmaC9XaEJyS1Rj?=
 =?utf-8?B?Nk5KMm5TNGNiMXdadERCWm9lZi8wbTZwaWVIR3N3dkFLKzNKcWh1YnFkcTBC?=
 =?utf-8?B?Zks5eVI1MVpaMTAxNmc4VzRtb3B1a21NY3UwQjk3czBHUldMZGxGMVRTL1Rn?=
 =?utf-8?B?S2tOem4vSkoyaTlHcHJzYUVLaUV6M2pSajRHVnQ0eDRaQmFOVmp0QVNMRlhO?=
 =?utf-8?B?WVdwcG9lQUQ2UnZiM3ZQZDFNMW9sb2llemlQTCtLMmZEd3U4NjJxcDBSTjV2?=
 =?utf-8?B?RlVUeFA1cDNIVGtMc20xZEZPSy80ekxBVDZXYml0RkVyc3pGOXRuY3hqOFpu?=
 =?utf-8?B?SlFGWWpYbWEwdkdJL2ltTjlrZGVzRTBXandVaFM1UU1OREJBQ2JuSVBPeC9W?=
 =?utf-8?B?YitIek1ZVks4TmFTU2prdUNlY2c5MWtPdjVIRkRvL1NJVCtSQzJRS3Z2NENH?=
 =?utf-8?B?V3Ryd0tVWDhZK0RVRkpaZ0l0Y1pUN1kxS3IyaXpaaXE3QmlhcnFyVFFOQy9P?=
 =?utf-8?B?YVN1SkM0dGVPY2MzSXFxU09HdHBaanZ5Q3NGS0N4Z2g4U2xuaUJ3NytNUStX?=
 =?utf-8?B?MnlOUld2QkI4eWh4MGJ1RDlqVHh2QUI1SVRrTTZjbm9GZGJhcmw3b1RTcndE?=
 =?utf-8?B?aTFxam1HUmJOcG5kYjdkV2VmUmJaUklweHF3Sml6TDVpZkVFN1RiOUR3Vk9X?=
 =?utf-8?B?aVZOSjNJNTRVSmxCdnlnYXNhanZmZDM3eDhSVHZqVlpIdXl5NnZmQWFUWG5B?=
 =?utf-8?B?ZWluSjBnckNaQ1hYOVFTejBHd29rYWVJTWpaV3hjZDZxVytkZGg5aVoyNmk4?=
 =?utf-8?B?VDY4WnJpbjBWWFIwMU1YdWFpTk1RU3phTllOVktvdnJLTHFSNzFqK3dwOWwx?=
 =?utf-8?B?QTJaUU52bnhqV2EzdThqUkI5dkExNWdabWxPZ2FUVW5KMDVBNWZyZlJydmtJ?=
 =?utf-8?B?bTZISjVlSVdYbVBlLy9OWGZCNkR1UzhSbGswVTdaY1l1RXhzdGVTRVJpbzZs?=
 =?utf-8?B?MUw5a1ZoTUNrc1dmdVArMWhaVklvUFErK29DWUpNRWcyRzNIVnRYR3lXOW1V?=
 =?utf-8?B?S0xrYzNsZzBtUTV0N2hpcnhqMlJIVFE5N3A5VUF0cnZyMzRQZHMxd2NNeUZz?=
 =?utf-8?B?aEtpeXp5K2d0T0JibGdQK2hGM2V4bFlrNVFob1RSMG9IT2ZOeGQ2Uk83RkY4?=
 =?utf-8?B?cEtrbS95SWJMQVFhTiszendnZDRmTUlDRnhKSTR3RGEvNk5mWklNRTVXQU1w?=
 =?utf-8?B?T0l3aDdpZ0o2Zm90RnFGWjBwbGFrMTg2WGg3OHJxUnVMRDZWN3RzbVFuZ09x?=
 =?utf-8?B?Nmo0Yk9nb0xJdWE4RWFxTWpOWkZFUnhEMEp2WmpBK1ZIS1A5YXBMeG5EQXV1?=
 =?utf-8?B?REl6ckFnZ040b0RsVzhXUk1ZTk56cGNxTHhXdk1nMkxVSUZMQys3TGRZaXNK?=
 =?utf-8?B?MVFiMWRhOVBSOUpqR2FBT2Fsa2taTkROYzRVaXJGTWUwa1BlTkZIWGswb1g3?=
 =?utf-8?B?MHVRTVlFQUU5UFY3ZnB0akEraWg3NjJWdHVidHBvWU9EZmU3bnNCRnQ3YVVi?=
 =?utf-8?B?SVJoTU52YVBnRzJ5NGtwQkRqSTlTZFpSQ29MZEY3TFNhdEMyV0tpQjFwVmRo?=
 =?utf-8?B?Z04xZElaMjYzZzh0c000Y2J6bm1QNkJmNklwa3NVYW93Mjh4em1uRHZIMEFY?=
 =?utf-8?B?K1pJOWRqVENheWFhNGNGQllIa1k3V01pQlR1UVh0Uy9hZ2ZBTzFMZzkxeHdI?=
 =?utf-8?B?c012MEZYVmdTYmFrWG9tNmE5cFZ5Zm4veWgxZlpHUTV2MkNsNDBSWnI1RVNC?=
 =?utf-8?Q?yfWhQR?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 11:02:19.2079
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ec17698-d152-417e-cfa9-08ddb7c59509
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9265

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
 drivers/clocksource/timer-tegra186.c | 42 ++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
index e5394f98a02e..59abb5dab8f1 100644
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
@@ -174,6 +177,12 @@ static void tegra186_wdt_enable(struct tegra186_wdt *wdt)
 		value &= ~WDTCR_PERIOD_MASK;
 		value |= WDTCR_PERIOD(1);
 
+		/* configure local interrupt for WDT petting */
+		if (wdt->enable_irq)
+			value |= WDTCR_LOCAL_INT_ENABLE;
+		else
+			value &= ~WDTCR_LOCAL_INT_ENABLE;
+
 		/* enable system POR reset */
 		value |= WDTCR_SYSTEM_POR_RESET_ENABLE;
 
@@ -205,6 +214,10 @@ static int tegra186_wdt_ping(struct watchdog_device *wdd)
 {
 	struct tegra186_wdt *wdt = to_tegra186_wdt(wdd);
 
+	/* Disable WDT interrupt once userspace takes over. */
+	if (wdt->enable_irq)
+		wdt->enable_irq = false;
+
 	tegra186_wdt_disable(wdt);
 	tegra186_wdt_enable(wdt);
 
@@ -315,6 +328,8 @@ static struct tegra186_wdt *tegra186_wdt_create(struct tegra186_timer *tegra,
 	if (value & WDTCR_LOCAL_INT_ENABLE)
 		wdt->locked = true;
 
+	wdt->enable_irq = true;
+
 	source = value & WDTCR_TIMER_SOURCE_MASK;
 
 	wdt->tmr = tegra186_tmr_create(tegra, source);
@@ -339,6 +354,13 @@ static struct tegra186_wdt *tegra186_wdt_create(struct tegra186_timer *tegra,
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
 
@@ -415,10 +437,21 @@ static int tegra186_timer_usec_init(struct tegra186_timer *tegra)
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
@@ -437,6 +470,15 @@ static int tegra186_timer_probe(struct platform_device *pdev)
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

