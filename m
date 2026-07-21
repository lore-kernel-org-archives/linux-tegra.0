Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012062.outbound.protection.outlook.com [52.101.43.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6191B382F1C;
	Tue, 21 Jul 2026 04:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784607024; cv=fail; b=RBFNpyxcteouteQz1KoUvgCMpRvybB7JU4fX+dOOhTRff6vUShOLJdV4lsy9W5NOuq/pNjKzoJTKPDPTevmD0FmJY6XVcQa9mr5Bj57wkENHRS5Tgy3CPNLtNn7Eoaxt9IE+1QkqYqrFVuYISbuSeIflqLt1bQ6zrGOAloJhRio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784607024; c=relaxed/simple;
	bh=wlF8AkqTq4PWSFfpbhtMsB+YvHGVONpFJg+YZe643UM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ohauCogPtrtAqcCDWyH/KExYepkCesBzJl6S5M3y0e+5x1Ft3CdNZ0XeHr6CWmP6Eb227JxQo4evGOYVXAYsXCBODRyfxDYyKszAjeUpGDFUutOMNJEpejfu5Au2B1ub1EVZFYGDCCjCW7w5SlWc1jsQvFEjOxrcFS71C8e6ILo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dVGxnie7; arc=fail smtp.client-ip=52.101.43.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dVGxnie7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VQIJaVFdE+Fq2Tj3fWWJRugfJOGQw3cUGCcm8t7Oeoy7xiNJE6uShZwPvlRVdJAoNCLol/EsQIEiUWSzzHD8uwLv9wyl2GVMij558TFY5mx5JFISWO3ItkYUL4gfWXR3hX47mRa6BG4sqGj5TLPFPogB3wjJAN4p+HYAGqCoD03q0+dJlOmX6UonFU0t04qNKY2tqN3bUfHhaa+qJbZ/iI7JpXiu2cMGs55b1brnYHu1AJOUCL64V6d0nlAFFUP2gyOhmOmyPFuAo4/tSS3qiLaoqL0tjb8KPCDKNaAcnnCNASqQEL2fDvb7kaMEzfqDTCm46F8s9ty16IW0IfYLhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m8gJs5Sgug3HHxAuVqwc8d8hvADhSGUOv/tXNoHT8jY=;
 b=N+tfNU6A8zvAG2ynw60p2cFmnnsNlwlQtSIQFr2/4fWuZEQlmQkQwUGdmSXrJ1LoCu5yWkMLgQxWvOtYJZYo8TtzyStdOPsX4Ey0+qIiDGk/bKYjVYRykxqddoKZWjD28QMTYWpN+EcRUzL+6QcvozHGgjKEBmd9LOg7NqwvkinXquS7Wynqgve40Kp7S60r+l4Vx2UBRr+7G8gL+FiBU3Geez0nvv31oSkzo577bKQWL8VfGBxa0nwQ9ee0XrvKHP6TJ/KEoU70D0vyOD/VSlagWDGzycTTtGi05ppqTXYTcUjszxo/CGh32RdtHP7C54onqYiOpocF83frk/DysQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m8gJs5Sgug3HHxAuVqwc8d8hvADhSGUOv/tXNoHT8jY=;
 b=dVGxnie7vbjAglloG8ngd/H5EFvOfG87w963QummsaHRuJO27ob9FhWhzOl5zRZUVV/6MTPamD6B8GjVVfA7n4ENLIhl1Z4IrvZ46UK5W4j+T4tnZ0qszFZLUnSQhRuc4f6mTJWrTu4gjL/3FCxmCy6pj47VAH2YAZtQgZxM0D81S6tJc1FyEwRDS2mLtny+ADWUzso5z5wLxMneP7F5LAVoWoOrRnSuwSmeSBRN9CpLn/MBdLbygbK56JPg/L6Jsi1W0XKSmxkrqqyGTlSZhvb8ugHAX5XuttCItwpuXEgP3ER+4lloDcfHg8A8DTyKsLaamxdA7eF4cz2dSE5Y1g==
Received: from MN2PR01CA0042.prod.exchangelabs.com (2603:10b6:208:23f::11) by
 PH7PR12MB7378.namprd12.prod.outlook.com (2603:10b6:510:20d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 04:10:13 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:23f:cafe::6b) by MN2PR01CA0042.outlook.office365.com
 (2603:10b6:208:23f::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.16 via Frontend Transport; Tue,
 21 Jul 2026 04:10:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 04:10:12 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Jul
 2026 21:10:00 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Jul
 2026 21:10:00 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 20 Jul 2026 21:09:55 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Frank Li <Frank.Li@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>, Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Akhil R
	<akhilrajeev@nvidia.com>
Subject: [PATCH v6 08/12] i3c: dw-i3c-master: Add ACPI core clock frequency quirk
Date: Tue, 21 Jul 2026 04:07:56 +0000
Message-ID: <20260721040805.1696503-9-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
References: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|PH7PR12MB7378:EE_
X-MS-Office365-Filtering-Correlation-Id: 5078e592-2081-439e-95cf-08dee6ddf64c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|1800799024|36860700016|376014|7416014|10067099003|3023799007|11063799006|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	2GMvhaSPuOzwlw/U7nBp7RzyZQzvVM5G5KcyG4/O6G6Yp94QdMMVXoVlx0n8E4e/3Og2sNoXzBH14cfPDfQ7q4ojIbyse6+ZI8T28RcBB8JtWcrhYfdNyKeHHPyV3T9meJ0BgBD7rOdHN7ShqgSez/p59KnE3vijmOFEXOGtIMglZU452WiZtJal2t/7SLqPTLjGSlEY/3E9ugTLPf5/gUVTuDDuNGZ2rYYpu3jbcWfHgpoMdLs5x8cL5+qZT/dwcdxOhnP17v7V+HE8XmqRH5yI/2Rt50nRuEGKdtkBFn9PG5k7ZL8IQGNkKnb0nILvcwvduExQXg+g/vUYV73aSWI7dB4un0T074U0sciVgrqqwuJMzJ7epK4CRhki+nuZh5heTdJXf9gsA2xQ+m0RPa1Hq5XetS3jyVs5SvYuXRRofYbQIz6XIEwui7y7V0/zbftnpau6cAoWg+O+K12Mptx7zOI7Qf/TyPuPBldT36gYBkMd1rWjOyOOYg9bHb/OAD9k5GnaorgjkmDt4vzxE1RYUfmIZTdhbXO+fcf4N07Fo4dpM952tPaBDxx/zbDGMdFZG2OUzrMovmcKBHIA4qvpfdq8RXiZWp2x5NmZaoHSVsOWnv/qD/jOpZdpXHV5kJyIhLYKGGaHZ7NQWSBEw06D5rBX+tiJlNt6cwWC2W4RSG48Ei/rLulTzg+4/dR4a1tLFDkLPvRMqMamyUGE6g==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(1800799024)(36860700016)(376014)(7416014)(10067099003)(3023799007)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	t5fVN7EXt92hd85VYn/8iTCaY8QqaxR1y6WV1Jy4kogKBJllJM23S8EJxdZNFUSW47EDmv6iNaVOpGRGrvgYiY+n/HNRrr2AxGG/NsZTjCwzifud3P8oNhdwaYReUBLznc5cvJAtlpkLu2Nj0WmwH1HW1idGv6NLOUvALD//SElEuIwKNuLBFwnjIU4JYHbMSyUAqX6fZNH97SVvaZWgIGG1edUoffULgMbpw1HzKFQ/0vMZcX3ozAZN08YRXA5hK5yzD4yTemlfcbEPXIAF/zdrFfYCi3N7+MPc13xVC6SG1e/4msmBjEoGRqhdY8eMhmiphjHZSPRzwkzar+gBhkg0nb17fON0lJ83FnOYpNyovPwuTG+hzYnpyY2TnMnkUZNMC9eJeR85rLwca971H+mOIYgmQ8W1afOqDJ0adPq8CrqZxAoYddha9X/WskPZ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 04:10:12.5649
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5078e592-2081-439e-95cf-08dee6ddf64c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7378

Some ACPI-enumerated devices like Tegra410 do not expose the controller
core clock through the clk framework. Unlike device tree, ACPI on Arm does
not model clock providers. The hardware is expected to have its clocks
enabled by firmware before the OS takes over.

Make the core clock optional and allow selected ACPI devices to provide the
core clock rate through the "clock-frequency" _DSD property when the core
clock is absent.

Resolve device quirks before acquiring the core clock so platforms without
the ACPI skip-clock quirk still fail probe immediately when the clock is
missing, before any MMIO access.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i3c/master/dw-i3c-master.c | 50 +++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 12 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 29030fd9594a..3ec3ab1c13b4 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -242,6 +242,7 @@
 /* List of quirks */
 #define AMD_I3C_OD_PP_TIMING		BIT(1)
 #define DW_I3C_DISABLE_RUNTIME_PM_QUIRK	BIT(2)
+#define DW_I3C_ACPI_SKIP_CLK_RST	BIT(3)
 
 struct dw_i3c_cmd {
 	u32 cmd_lo;
@@ -556,13 +557,33 @@ static void dw_i3c_master_set_intr_regs(struct dw_i3c_master *master)
 	writel(IBI_REQ_REJECT_ALL, master->regs + IBI_MR_REQ_REJECT);
 }
 
+static unsigned long dw_i3c_master_get_core_rate(struct dw_i3c_master *master)
+{
+	unsigned int core_rate_prop;
+
+	if (master->core_clk)
+		return clk_get_rate(master->core_clk);
+
+	if (!(master->quirks & DW_I3C_ACPI_SKIP_CLK_RST)) {
+		dev_err(master->dev, "missing core clock\n");
+		return 0;
+	}
+
+	if (device_property_read_u32(master->dev, "clock-frequency", &core_rate_prop)) {
+		dev_err(master->dev, "missing clock-frequency property\n");
+		return 0;
+	}
+
+	return core_rate_prop;
+}
+
 static int dw_i3c_clk_cfg(struct dw_i3c_master *master)
 {
 	unsigned long core_rate, core_period;
 	u32 scl_timing;
 	u8 hcnt, lcnt;
 
-	core_rate = clk_get_rate(master->core_clk);
+	core_rate = dw_i3c_master_get_core_rate(master);
 	if (!core_rate)
 		return -EINVAL;
 
@@ -615,7 +636,7 @@ static int dw_i2c_clk_cfg(struct dw_i3c_master *master)
 	u16 hcnt, lcnt;
 	u32 scl_timing;
 
-	core_rate = clk_get_rate(master->core_clk);
+	core_rate = dw_i3c_master_get_core_rate(master);
 	if (!core_rate)
 		return -EINVAL;
 
@@ -1573,14 +1594,28 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 
 	master->dev = &pdev->dev;
 
+	if (has_acpi_companion(&pdev->dev)) {
+		quirks = (unsigned long)device_get_match_data(&pdev->dev);
+	} else if (pdev->dev.of_node) {
+		drvdata = device_get_match_data(&pdev->dev);
+		if (drvdata)
+			quirks = drvdata->flags;
+	}
+	master->quirks = quirks;
+
 	master->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(master->regs))
 		return PTR_ERR(master->regs);
 
-	master->core_clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	master->core_clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
 	if (IS_ERR(master->core_clk))
 		return PTR_ERR(master->core_clk);
 
+	if (!master->core_clk && !(master->quirks & DW_I3C_ACPI_SKIP_CLK_RST)) {
+		dev_err(&pdev->dev, "missing core clock\n");
+		return -EINVAL;
+	}
+
 	master->pclk = devm_clk_get_optional_enabled(&pdev->dev, "pclk");
 	if (IS_ERR(master->pclk))
 		return PTR_ERR(master->pclk);
@@ -1636,15 +1671,6 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 		master->has_ibi_data = true;
 	writel(thld_ctrl, master->regs + QUEUE_THLD_CTRL);
 
-	if (has_acpi_companion(&pdev->dev)) {
-		quirks = (unsigned long)device_get_match_data(&pdev->dev);
-	} else if (pdev->dev.of_node) {
-		drvdata = device_get_match_data(&pdev->dev);
-		if (drvdata)
-			quirks = drvdata->flags;
-	}
-	master->quirks = quirks;
-
 	/* Keep controller enabled by preventing runtime suspend */
 	if (master->quirks & DW_I3C_DISABLE_RUNTIME_PM_QUIRK)
 		pm_runtime_get_noresume(&pdev->dev);
-- 
2.43.0

