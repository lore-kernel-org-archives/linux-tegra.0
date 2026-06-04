Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010014.outbound.protection.outlook.com [52.101.46.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B703921DF;
	Thu,  4 Jun 2026 08:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780563539; cv=fail; b=FzSqAj9GYE0B9eV4J/wpVFgkMJ4A4URPUp/7yiCzxyWsJ9j3zEzL6a8e7UC1ZelO2qpp1PnuU281wYZDTwDmj9bkgu5Y5H2JPlWQte/7IhglbGp95FXBSKJlFl5iKG9aUzRhvMplVUblCOyHXjrozUnufMWJQjtW3MCsWg/hNDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780563539; c=relaxed/simple;
	bh=YPHH0tog5co9f8R/+Y7Yf/PShpA3bh4I7Kc2cTuSP3Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HkUnp+xb3cgNAzhC/1i9k+gw49pAE5oT5GY8TnYemB9R1NAXfNwvntXfq0q1KILeZrupyhjWFEtwcyH9QwP89duD68V7ritN97Ds9U5l33dUHXnbXaBVV8ARItf+6IYhT1ELBlDCfMEp7mIA4YqcYlCSvQkYJp4w7L6lDJU4C+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lU3HYlFp; arc=fail smtp.client-ip=52.101.46.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lU3HYlFp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iU8qdfSz1QgdEu/NNtoouvbuCwHXn0qTUjE9vF9tBCLKdHNdJt5AhJIhZ+PtKwMDwXEnXjesZ0vkqPg6lc8E0f8ps7X1AiXZldQW+CAXLgFNFQrF9oMtol3mKl32qFDKYHA2gLDkqOxaV0QwNAzOCOSDi0iu31sIi8K8YG5XRTBgiEKlKogCBZ2Pf/nQ4LlQe/WYnu6EzPbckXbGRHA0iUhyLwef7Dy1OOt04m2wT+2klCcg5ncYGlizbycpKJyhtHo6mgs3meJ6Lu7ANvTufdYqg4jmL+VN18xzcwkdq1GqcC+37sm1+OYy8GE8CGmDNFWinPEnV5G5pnrSerCB0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d4qew9tDPRgdx9r6DnRgy+P/zmT+AiyFDP3SZLIJBqk=;
 b=tgh5uzaZAjyKxnRPeYOxZnTN5AM5Z9oyotTClOJAX9EapZY3vicfJO3/gDUY9jsFUlCco9zm3kupv4zP6WzBEs849BDUlRsVfNxhsR3v84JiM4ac1U9b3BwEFmgS1TlFYAotBf9HcCRSOIlh9ew7YD2agqhwQFuq3Xvo5/gsyLs+mpENfJQS6jw84S6yZH/HI8Rbs2133lVZF4x2s/Lddo8Df+aIU9BHpX81N7wFZb6x2UdLh+rWbvYjTAohw8+j8wAhG2A4sVpBfV7n5iq2IMPChQn86ba9ZPjOZ2GyxGTQJOCU+Kew5QhXM+VLl+EKXP1pwnhvzLMrktOGzCz/Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d4qew9tDPRgdx9r6DnRgy+P/zmT+AiyFDP3SZLIJBqk=;
 b=lU3HYlFpI73hEdn7pH0GrAeT8v6WINvB5BvQ3OHXw1ZG9NmlqQ1JMzIPES+5StMVA3OUxj1k2616RDS55SqqSN8tfSTFSdfkIDZ4PqNvDK88BCROpZNbGrLe2L8O8ZZdtqMc4s21w/0CZIQatDorzxic7AIQ7OXSwsGZ5qjnh6ikyGo5K/iRYc2YJqR0YZlsXhXit/oNBUBSpJbr+S+nr+oURYF2zoolCX8P4yMaFCWQVYzr8AuFJ88jnRv0aRRNayOnwL8VLbAsCsVLiHlRlOU2+GMwdhDk4zXffgJt+JqnrNj+vv6LZ6cZ8hcOU3ia47HD8kXhvbd4afkc75zIeQ==
Received: from BN9P221CA0022.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::14)
 by CH8PR12MB999204.namprd12.prod.outlook.com (2603:10b6:610:35a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.19; Thu, 4 Jun 2026
 08:58:53 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:408:10a:cafe::5f) by BN9P221CA0022.outlook.office365.com
 (2603:10b6:408:10a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Thu, 4
 Jun 2026 08:58:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 4 Jun 2026 08:58:52 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Jun
 2026 01:58:32 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 4 Jun
 2026 01:58:32 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 4 Jun 2026 01:58:30 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>, <chleroy@kernel.org>,
	<jirislaby@kernel.org>, <pshete@nvidia.com>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v4] soc/tegra: pmc: Add PMC support for Tegra410
Date: Thu, 4 Jun 2026 14:28:24 +0530
Message-ID: <20260604085824.3435199-1-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|CH8PR12MB999204:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f30efe7-16a9-4add-2997-08dec217809a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	nQ7pHUufx2C3QT0hQE+yIMFlFpqCaezbtPM/SSeDHFShy+5s5fBOpgt0/3aFDQpA6ndKsEAMXHpYXzgOO+dwjgrw4L4YBeLsS6nxaoHUKs67b6W3h5qHoghWLepWSFWV+piZCJSbNml2oeE3zRZvtZq/6sys2L8ZQjH/QrFzDe4t4UMa9e31I58dZtMZmrE1uSNv+i0dPfALNyKBM4Dp1q2/FdEiLiD9HGZawaEN+7DFGVGANh8/uW2ANILUVcrJuprPwITMCzgL+kLgMWqTCPxeAxNbfvjsqQ2374nvr7oQplPjXb+C0HEldOlRCQTeSM8utVaqNL+NHI9LFaxzgaGDcoPePDXu8LKJ7ZA+ihFcEwbPnqBxRW7VUNd3svDHP4qpGa2i06aGKhNGnA6c3N6FjGKOwhpprDpj1yxc/0j1gyD0Q+hKzDYidvN8pDEXtosaand+20mtLyIdIgjHCYIILNtTI2oUr6bRRmYSjOaFp8yVGGiChMUyrQC6C8NtDt0pTd38+D6FVxqOp67U4tHJH71HBIqF0flo0swXxSNxUBp7F0bUUvGgLSk/WOAiXSZVXetCOrrs5yw+kUOKHHzdsw0hr0Iiylbhv/c1myW/LrK/GsORsyPXod25ZqDoRSWaVblbtC3/3DxMmbRbs3XwO1huPrwOy9zWZBIJb4qUoOtOoIqei/XYKPvrR99nEmAsg01fVWkd8/eYPpaXsK3Y+4IRGbAVVe/IZIpDtts=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GlGBocbD/v4KmuZh53RE8j5sT5xBrlgY8GhgqujkpvgCdpomPsa7tQMwz6RmgPH1eEYKqk7iGYTpeRwk+/pvhbc1uEivU/BqRpe7y2SVNfDFPvcVgUfCjNUlLAYxZZfAr/Clu4gh7Q1NzzotAhPqhsJEecJ/6Zm+DevziMDC0bY4EL2DUyigfd+6H7O6DKANOMEH6m1X/YY1Sbbc0ahxbkHLN7BnWPmBz4Qv6hJAQFacfcvagGugBgkkYgk8ATMAKyNaK1mE0l125FZZNgzpxePm61g7iIsEN8Jykp0SfHNr1Tc+EK0cxI3O5Gqhal3CAmGrgZ7t/BLVlBMj0EzE+1wudYHDO0GA3OsOsOSU8s6WJ9LnQJrLnT50h0sYpl3UtndqWpfSDVAv25uFbBLoWe+t0Yo1sDN9zlgyvStJkc3T9Fy0EWW8kMndJqtgzU6Y
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 08:58:52.8861
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f30efe7-16a9-4add-2997-08dec217809a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB999204

Tegra410 uses PMC driver only to retrieve system reset reason using PMC
sysfs. Tegra410 uses ACPI to probe PMC, unlike device-tree boot it does
not use the early initialisation sequence.

Add PMC support for Tegra410, which uses the PMC driver to retrieve
the system reset reason via PMC sysfs.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
Changes in v4:
 - Rebased the patch.

Changes in v3:
 - Cleaned up NULL and false initialised entries from SoC data.

Changes in v2:
 - Updated commit message.
---
 drivers/soc/tegra/pmc.c | 98 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index f419a5395545..2408dc049e1f 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -11,6 +11,7 @@
 
 #define pr_fmt(fmt) "tegra-pmc: " fmt
 
+#include <linux/acpi.h>
 #include <linux/arm-smccc.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
@@ -2980,6 +2981,18 @@ static void tegra_pmc_reset_suspend_mode(void *data)
 	pmc->suspend_mode = TEGRA_SUSPEND_NOT_READY;
 }
 
+static int tegra_pmc_acpi_probe(struct platform_device *pdev, struct tegra_pmc *pmc)
+{
+	pmc->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(pmc->base))
+		return PTR_ERR(pmc->base);
+
+	tegra_pmc_reset_sysfs_init(pmc);
+	platform_set_drvdata(pdev, pmc);
+
+	return 0;
+}
+
 static int tegra_pmc_probe(struct platform_device *pdev)
 {
 	struct tegra_pmc *pmc;
@@ -3004,6 +3017,9 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 	mutex_init(&pmc->powergates_lock);
 	pmc->dev = &pdev->dev;
 
+	if (is_acpi_node(dev_fwnode(&pdev->dev)))
+		return tegra_pmc_acpi_probe(pdev, pmc);
+
 	err = tegra_pmc_parse_dt(pmc, pdev->dev.of_node);
 	if (err < 0)
 		return dev_err_probe(&pdev->dev, err, "failed to parse DT\n");
@@ -4817,6 +4833,81 @@ static const struct tegra_pmc_soc tegra264_pmc_soc = {
 	.max_wake_vectors = 4,
 };
 
+static const char * const tegra410_reset_sources[] = {
+	"SYS_RESET_N",		/* 0x0 */
+	"CSDC_RTC_XTAL",
+	"VREFRO_POWER_BAD",
+	"FMON_32K",
+	"FMON_OSC",
+	"POD_RTC",
+	"POD_IO",
+	"POD_PLUS_IO_SPLL",
+	"POD_PLUS_IO_VMON",	/* 0x8 */
+	"POD_PLUS_SOC",
+	"VMON_PLUS_UV",
+	"VMON_PLUS_OV",
+	"FUSECRC_FAULT",
+	"OSC_FAULT",
+	"BPMP_BOOT_FAULT",
+	"SCPM_BPMP_CORE_CLK",
+	"SCPM_PSC_SE_CLK",	/* 0x10 */
+	"VMON_SOC_MIN",
+	"VMON_SOC_MAX",
+	"NVJTAG_SEL_MONITOR",
+	"L0_RST_REQ_N",
+	"NV_THERM_FAULT",
+	"PSC_SW",
+	"POD_C2C_LPI_0",
+	"POD_C2C_LPI_1",	/* 0x18 */
+	"BPMP_FMON",
+	"FMON_SPLL_OUT",
+	"L1_RST_REQ_N",
+	"OCP_RECOVERY",
+	"AO_WDT_POR",
+	"BPMP_WDT_POR",
+	"RAS_WDT_POR",
+	"TOP_0_WDT_POR",	/* 0x20 */
+	"TOP_1_WDT_POR",
+	"TOP_2_WDT_POR",
+	"PSC_WDT_POR",
+	"OOBHUB_WDT_POR",
+	"MSS_SEQ_WDT_POR",
+	"SW_MAIN",
+	"L0L1_RST_OUT_N",
+	"HSM",			/* 0x28 */
+	"CSITE_SW",
+	"AO_WDT_DBG",
+	"BPMP_WDT_DBG",
+	"RAS_WDT_DBG",
+	"TOP_0_WDT_DBG",
+	"TOP_1_WDT_DBG",
+	"TOP_2_WDT_DBG",
+	"PSC_WDT_DBG",		/* 0x30 */
+	"TSC_0_WDT_DBG",
+	"TSC_1_WDT_DBG",
+	"OOBHUB_WDT_DBG",
+	"MSS_SEQ_WDT_DBG",
+	"L2_RST_REQ_N",
+	"L2_RST_OUT_N",
+	"SC7"
+};
+
+static const struct tegra_pmc_regs tegra410_pmc_regs = {
+	.rst_status = 0x8,
+	.rst_source_shift = 0x2,
+	.rst_source_mask = 0xfc,
+	.rst_level_shift = 0x0,
+	.rst_level_mask = 0x3,
+};
+
+static const struct tegra_pmc_soc tegra410_pmc_soc = {
+	.regs = &tegra410_pmc_regs,
+	.reset_sources = tegra410_reset_sources,
+	.num_reset_sources = ARRAY_SIZE(tegra410_reset_sources),
+	.reset_levels = tegra186_reset_levels,
+	.num_reset_levels = ARRAY_SIZE(tegra186_reset_levels),
+};
+
 static const struct of_device_id tegra_pmc_match[] = {
 	{ .compatible = "nvidia,tegra264-pmc", .data = &tegra264_pmc_soc },
 	{ .compatible = "nvidia,tegra238-pmc", .data = &tegra238_pmc_soc },
@@ -4832,6 +4923,12 @@ static const struct of_device_id tegra_pmc_match[] = {
 	{ }
 };
 
+static const struct acpi_device_id tegra_pmc_acpi_match[] = {
+	{ .id = "NVDA2016", .driver_data = (kernel_ulong_t)&tegra410_pmc_soc },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, tegra_pmc_acpi_match);
+
 static void tegra_pmc_sync_state(struct device *dev)
 {
 	struct tegra_pmc *pmc = dev_get_drvdata(dev);
@@ -4883,6 +4980,7 @@ static struct platform_driver tegra_pmc_driver = {
 		.name = "tegra-pmc",
 		.suppress_bind_attrs = true,
 		.of_match_table = tegra_pmc_match,
+		.acpi_match_table = tegra_pmc_acpi_match,
 #if defined(CONFIG_PM_SLEEP) && defined(CONFIG_ARM)
 		.pm = &tegra_pmc_pm_ops,
 #endif
-- 
2.43.0

