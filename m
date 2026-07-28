Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012007.outbound.protection.outlook.com [52.101.43.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD793C3429;
	Tue, 28 Jul 2026 07:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785222158; cv=fail; b=izNZs78nHZuaDvKFGsGkFY6+0ZZvuGNnha/1hSDfTDJIzyl+z/TfUUGTL/ALtyNEFOlOoehhASPLVUlhxfPLKx7y9WgLDXgqSeLqtOwGDqzlm6tViYsgJ4bRdYJvQfaRMJck5EM+ErRWs6C5v/2ug+x05GPZ6tqTQ1ObYSbzzA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785222158; c=relaxed/simple;
	bh=2IJYR48afizK1CqmTGHC2Hk+e/4PmMsnPA+sqASCsHU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=npWVvK68HHxAHW385saHrEEfQOeTZcgm8VKUI83ZKN0AwRa6Z1ywKesOaUWDh4+l9R9onhih+x7a2RZi3kgFDkrB2lw2iqPVutlSFLmP0Z6WqC5IlnQI5YLIJXLB6bzRWapqfKCxPGx+YL+deQe9jPRPwmoIOty9yRw8PCJlcpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LScMIQ+d; arc=fail smtp.client-ip=52.101.43.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LScMIQ+d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OQfHOdBD+8KGwd/U0Sgl0ax9SYI6fV7k+VuoAEjIxwMXWgTQHZ3Ml61skTWxuiM85dMMkdrEusqyIv6cYRyNDaq2f2ONAcTGB6K7wiqA3qw9zCu6NNQvQxTgCLg4lvsbO0qYpQxBVzsSuDoDSq9dFch9lP5ngDjc4aAstKbJGoJC5mZxzZYM00J5oGfp5NF3PjXW20FQqsaJu1g28+mq3eTHWTqmVNiFfaXxebES9Is/EbHMp9qK83wXCFWc04Mftvg+TwngQTddRzBMFGBWbTjgxL5yIgIiQICNIYarmVyuvJiZpdeRJDRD3VbyC1mfT04tVK7srN7+2upTfRKCMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W15LkEiE4+qiqvGSh1vvk/zg7bwNSbju2GxvuJwEQ8M=;
 b=v7P6Gn9Ea3eOGgysWg0VK2rX+KywuSi8ahCaH4j4JbT/F8OWgxWApPQSFXbNEWjEnPMoDF4enye0AG0U1g9VfAp1eybuIVjUlJO+peOnvPEb4+P+ZzPvEFgBPGFOJmBcNpNOaIpm0Wqr9/j8Y6vN52q65k9K8HK4W6BRcAQzaubOiBd64blYx8+lZorTU1uHYyogQN10hTxDlDCxpowJRNE5yZMjK4rub1rJsNQ45z6JqH0JvBLAVkhzeStGT865KpMApXhoPUaFBJNQcnKcl+7lQDdaRas/FdQ7Lp7jpWqNuEFX1vfIe3KvrocJ7b8wXtQWzZxx4kzDtgvV/FotzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W15LkEiE4+qiqvGSh1vvk/zg7bwNSbju2GxvuJwEQ8M=;
 b=LScMIQ+douHZB5WTw46cRYerPh2eIiltf5gQ+7GV+0stM9IXOrSRJy/SC07LP/0hGh93Z59Pd/pWq5DcEDYwVVP5v39YHwIijWb5Aahc5UKvOVcsWzXKPddz2MG0pP9fAgl9C2Pa1htRrEehu0O64acRPSDWIq0QnYEIJhomPfJxbnxQxnitdTxW9LvnkLe0iO6/3BO7PqKEuxxw8Er/WLniH/obXTBFFGYEvGJcHLyOY93pzSdbda8xFaVFpPPLEr2oqwbW7onbeOZMQ9L+9AM4pP9lXxi6qkOQOH3G56p/iQqVx/hMrQL2XUH3SKQu6b4Bpm4+lOT8qO0r7H8T8w==
Received: from MN0P221CA0004.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::11)
 by DSSPR12MB999212.namprd12.prod.outlook.com (2603:10b6:8:376::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 07:02:32 +0000
Received: from BL6PEPF0001AB75.namprd02.prod.outlook.com
 (2603:10b6:208:52a:cafe::8f) by MN0P221CA0004.outlook.office365.com
 (2603:10b6:208:52a::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Tue,
 28 Jul 2026 07:02:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB75.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 07:02:32 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Jul
 2026 00:02:17 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Jul
 2026 00:02:16 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Tue, 28 Jul 2026 00:02:10 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Frank Li <Frank.Li@nxp.com>, Frank Li <frank.li@oss.nxp.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "Guenter Roeck" <linux@roeck-us.net>, Philipp Zabel
	<p.zabel@pengutronix.de>, "Jon Hunter" <jonathanh@nvidia.com>, Thierry Reding
	<thierry.reding@kernel.org>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Akhil R
	<akhilrajeev@nvidia.com>
Subject: [PATCH v7 08/12] i3c: dw-i3c-master: Add ACPI core clock frequency quirk
Date: Tue, 28 Jul 2026 06:59:50 +0000
Message-ID: <20260728065955.809445-9-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728065955.809445-1-akhilrajeev@nvidia.com>
References: <20260728065955.809445-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB75:EE_|DSSPR12MB999212:EE_
X-MS-Office365-Filtering-Correlation-Id: 49796b87-aece-4bd8-d388-08deec7631fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|7416014|376014|3023799007|11063799006|10067099003|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	UrqxLU7BQF6DFlSnp8vQai9QaSZ712A2N3SqPtzisUZYkU7zPZ7D5EzQzRBe+ItGau25FngT4/uz7IPGXpNUE+v5k2+A8RbzxulnzYAeBNHfdx4PxukrFPSsQLxLPcVS/+Ygm1A5++vgjGkt3SKR3bC0OaDd0+jnG2MfuSfGKDlsfem7NGzs5thRr3N80xTLd8EX/NIT6dQk19n/7pPtTFwpI4yxnWE/MES1Bs5f6AxS4sqEUfD5t2kxqjf2fKtU+he9oMegqBEJ1Q14Sqq/2uwgwVJ8PoReNJF927Yethf5wUfprQKvHozipRA4Ehsf4aQdWFJ0JHy/pnul+TgPgX7ueVeQCf6B1Y/Zc9nYJvvIryZh854LYNtqBp+C5uVOX8OZagXF+bjo4kOAuqXC9oKXXh5PLlV40xyaz92uS6l9yjjAoOJoLIt3gfXtrMA+DmlXX+6m4k6EVoWaAGlRczmX9Ri3QQEk5KE1xNbze0T8YcLOwa0qJwZELca0TuIs8GwWS6IrGRQymG6Jl/tchC7EwxsKgP24g88RZssdnZTWBoLlsgLNHPHyyo8fLPPkvo6vVOzBUt4U/l7634x05eIPlaFeFTnHLlkcfUV15G6inaox5HK/Kzq50Z4wpZjbnOWc147TXKe0O0SexZvBhegIUg14CHfGtVYIyvvW/5868f1K86rkdTo+OjH+jZNoa5qwPq782Ac/RHP15Ro5WQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(7416014)(376014)(3023799007)(11063799006)(10067099003)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1r9UVZmx2VP3KwfoDSEpgs/W1LFnei8WyXBKujjzQ0pSfmmVUHzkDebI5hrfhj6Rg8fugZP/IH4hNOUT6wt/B6LbsTlUAC29XPmU2uBci4F9qtVes6Y+ZY5k7PpBYpvAwuhlYQqPaVfgBkEi0THzP/LbQ77tGhBSyQfsXXrY0ok6czBI02/iYScXSlLFjSXKmZyxeYeFelqlEwu9WyA9ozng8ZkKGc+Qhqf6goOcy5Hs6naklM++Dn/mC3WSYow7d/XoPQhNm1Cgf7nq4cexwzva+wKTR0rkJXXFs84CYFmAVa4ksuQyyfBDruT1MfcggqWGrwez06GmX7zY/xwbT/Vqw4SLtrfUxLck5sMS0ZJhwIHcb33Q8PNXngsp+GIbUpHRYguoNHsx49UzpqXNMwSDfmGlBYsdcVKTTt6SSjJQEW95lC9ZRSn7O1ZSm/cy
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 07:02:32.0396
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49796b87-aece-4bd8-d388-08deec7631fd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB75.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR12MB999212

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
 drivers/i3c/master/dw-i3c-master.c | 45 ++++++++++++++++++++++--------
 1 file changed, 33 insertions(+), 12 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 29030fd9594a..273d7a002099 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -242,6 +242,7 @@
 /* List of quirks */
 #define AMD_I3C_OD_PP_TIMING		BIT(1)
 #define DW_I3C_DISABLE_RUNTIME_PM_QUIRK	BIT(2)
+#define DW_I3C_ACPI_SKIP_CLK_RST	BIT(3)
 
 struct dw_i3c_cmd {
 	u32 cmd_lo;
@@ -556,13 +557,28 @@ static void dw_i3c_master_set_intr_regs(struct dw_i3c_master *master)
 	writel(IBI_REQ_REJECT_ALL, master->regs + IBI_MR_REQ_REJECT);
 }
 
+static unsigned long dw_i3c_master_get_core_rate(struct dw_i3c_master *master)
+{
+	unsigned int core_rate_prop;
+
+	if (master->core_clk)
+		return clk_get_rate(master->core_clk);
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
 
@@ -615,7 +631,7 @@ static int dw_i2c_clk_cfg(struct dw_i3c_master *master)
 	u16 hcnt, lcnt;
 	u32 scl_timing;
 
-	core_rate = clk_get_rate(master->core_clk);
+	core_rate = dw_i3c_master_get_core_rate(master);
 	if (!core_rate)
 		return -EINVAL;
 
@@ -1573,14 +1589,28 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
 
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
@@ -1636,15 +1666,6 @@ int dw_i3c_common_probe(struct dw_i3c_master *master,
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

