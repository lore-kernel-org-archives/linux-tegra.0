Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011054.outbound.protection.outlook.com [40.107.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E8038E10B;
	Tue, 24 Mar 2026 08:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774340959; cv=fail; b=l/DjuLr6PHvAqY0AT6mDZoWo+spsMpj/3m6N+JJZdeeQ41STWvHfXzx5xwRusqL/jK6U8z+ZGDbRkZAONk4phCM2CFdQ0iRGpiQjAat7+qQlKW4tPc5vLbn0QVxtuQjLCd2C8+UUwdK0MKfFPwUEum3CBhdqk/ghw67ELGu2BMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774340959; c=relaxed/simple;
	bh=cvjHgnEmXIWIJNdFEEWPb7NcfQkftdw8kOALM4bF8Hg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=g4yZuXZ/cyPUxr/uI+MlXHW623QPfg26FSHDrzn6+JTjsyFDtQ/bGmhS7lMq6O8syZHKiakkPHp+clo9px05kNY48UnHX4JjQoXEyRKa3jP2+bI9oppOpsXVW3gLH1ZGpf9VIrT45LCT8q53wcyhmcVPS/UDbAfv9X5tF22flm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=shsVesEA; arc=fail smtp.client-ip=40.107.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="shsVesEA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cUwnhmU0onGHW4BSTNPmxdZ2VWQIPLhPXNZVCHNlQb/Pad8GTLDhg+2zkuPbJd4z/pltSaedTG6BeWkhOhTVcybKAwscZfldlKWWjwapaaMcclFDcVLZa73Wp5d1omBqEFW64yU9QiMBEjs5bInM3k7LUDTVM1kVAGJHtJ3muINUO6/tJbHmMKuIiEHgzsU7TTO3IfBdRWFNHP0Spt2Em87T1SCuFM2M3x7+9dJTCsqi6vruSqyvLcp1O9Y7J1/WFQTkltmHdCmtLKXFWynS+/khPmqhsfrR51wTpMqsNnf3k8hO9uvozokRbp04YtS9lLEGXWfAS0Pveos3ePNvyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SlA8YH6yP+hX8UxUxv+4/MIAi1Kh34S6hOuLaW8Jd9g=;
 b=aQorIVMGXb+5GHIXlWKnedOrrngpMAHFoG2J3jq2wDLz86lsaeEhef8eam7C2RVqZCqE6TIJCvePbyIOJliqo1UgfyeUz4QYGkmPlHAwkZYn0oOH6WT+eYzpUlaJwLeo99/n8G6Q1DJX1S8fc9n5G1JrTD4MerbqBF+sPw06L26Z2MZXRk/ao7T4pEV+ZWe/oB6kTudlfn1EHG4LLZ3M/hsXUKxt6IJLmzmYY9fEGIdDRtmW2+Gmz0QE4JFEy40fYLRmzwXYuewi2pvBLyVKxBOY+/4fpAeJMWx5n86OiQEkLZ4C0evS2Y+LUGw1OodJoQRY1AaN6sXDVbOUY4DbzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SlA8YH6yP+hX8UxUxv+4/MIAi1Kh34S6hOuLaW8Jd9g=;
 b=shsVesEAV9mSaozeSp+N+gKdruATExgqGFqALBRkS6nYxBbO7CejJoCEZDcwkz+szcKrsjWbl77sLh5/idKBrnZM6muo5CMIbbNYxjjf5uzXwC/l0C6xOSI+eqTgz6nGeBmtHP4dFD3Ohr6TYrQM0NzLkL9N3o9xpCWccwFouaaGK8BTwluVhsBOPhJruDdcIioPzQm4lmEnEKPvjY3QzHLZPsL88cviqBmqPkScDQnxEEm7aXbFNCumc1k70MsJ1DFanBav4PLaAOM3wt8ZTRR6E3ompR4bWUIBzl5CvOMNSfZ+p+tVaKs/yZFZZLcOnT+4PW8BZBZAijftbigeuA==
Received: from BLAPR03CA0053.namprd03.prod.outlook.com (2603:10b6:208:32d::28)
 by IA0PR12MB8982.namprd12.prod.outlook.com (2603:10b6:208:481::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 08:29:07 +0000
Received: from BL6PEPF0001AB56.namprd02.prod.outlook.com
 (2603:10b6:208:32d:cafe::4d) by BLAPR03CA0053.outlook.office365.com
 (2603:10b6:208:32d::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 08:29:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL6PEPF0001AB56.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 08:29:07 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 01:28:57 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 24 Mar 2026 01:28:56 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Mar 2026 01:28:54 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<jirislaby@kernel.org>, <pshete@nvidia.com>, <chleroy@kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v2] soc/tegra: pmc: Add PMC support for Tegra410
Date: Tue, 24 Mar 2026 13:58:47 +0530
Message-ID: <20260324082847.550771-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB56:EE_|IA0PR12MB8982:EE_
X-MS-Office365-Filtering-Correlation-Id: ac58ebc9-8ce1-4831-93c0-08de897f6ac2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Zf3dAu2iwVSBA9f6v1MnIdGqYL5dv6VutP8GgYSkiu6desIG4WXQpTbs4X0MayLdRlHTZj7gFC5ugXStryPPkpxrJ2QZzWp2+Z66eer+PfJOCdj2VsP6oZ/pKVXAZ8uzDIAwvAAnJt6n+hWmz1r1RrPzAvHZNjBki4aej65H/0h6xYgocDUrt68NnhQU/kk/wH2aI9yabz/XoQZmfrjMlegZKhKklAuLhW0b4ZTRZGAzcHyCY8DN1vwmCJp43UHnhKd8SGqAIDvB11HXuRZtVcOWua/FFp+wupu7V5RQbVubMcutCZBcYAiRJF646MJPDZHkoJuwFqZH3NP0J1ANk/ST+1Z07QythPQnfw6w4a48mo1OVAB5KgR/Cr+VyFpV7/iDsTNsEiJYHsTc5CmTRud9yPpJkpkcDS5iEUMUtn5slmcPjnGDURXnfWjWlgZsWMUOVPtegCbK8kWnaSw4rltPBKp6K8x+mcT1npum8RfjE2KIWsQhsXEHKFvDkaHcw4BzgNO1WM5IfuktRbFIQ8v9krXYfCViCHsWrhhIOK2kEJEuN/7g2fk4FgWusiH6vZBAczFLA90c+EmAfjSPMn4USNs/HiNJBSCOVSs0JPowME5Wp8L0SmkY2HsrYof7AqeN/xbQD3zX9HhHbB0+4tsG01hGh8QJgU5a6xG4OLxZOXcl/mEgFttbqvrBYb5aMkKu40SUTuZmxe+QEVkkmyhiPSs3/8z00g0nlVAGcyFEHn71N5/r7aIUoXa+QstutFW8k3cW2JT+eRNmib3zww==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jLgONNkHSjrx2avZXsIexWO1L7CCfBuFz8Ttmcsf3icaf5ugIfZ0dSsB5Vj9DCNAJ8vrmKW4rtwXPnFqMVP5I4IWDdvEnFdGoES4mmKrtx25DQBBH0eqczzpHXS/TWjmHRzQL41kpkf6egyby4Dnb3xUPR/h2vAILNHtrC4lQ7WDy1mLEhx73MeTS+8AUaC4z5Po3Nat+93ieOC1XZXotIEUDWG81nC2zwZi52H3HAF4tv1BG7hJYFDp1Xcv/uvBKo6JfeDUfHIoSX4autcyJm6qTb/zGaMpz2l/9PThns9NXc8x8L9FM3aIInQxA+MzLb0baXdeRyLLKJFc7jTtHQudN3SgF8036KWfttOYSmfFlY1/Gnc1MKFF1nekwhsz1o2jyJrnMv/WJz7ds6DpiztAkZnjd6h125gTQcn4HUak4oB6KWHRswPyr5H4UQG/
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 08:29:07.6190
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac58ebc9-8ce1-4831-93c0-08de897f6ac2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8982

Tegra410 uses PMC driver only to retrieve system reset reason using PMC
sysfs. Tegra410 uses ACPI to probe PMC, unlike device-tree boot it does
not use the early initialisation sequence.

Add PMC support for Tegra410, which uses the PMC driver to retrieve
the system reset reason via PMC sysfs.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
Changes in v2:
	* Updated commit message.
---
 drivers/soc/tegra/pmc.c | 128 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index a1a2966512d1..f17dcfd0aeae 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -11,6 +11,7 @@
 
 #define pr_fmt(fmt) "tegra-pmc: " fmt
 
+#include <linux/acpi.h>
 #include <linux/arm-smccc.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
@@ -3095,12 +3096,30 @@ static void tegra_pmc_reset_suspend_mode(void *data)
 	pmc->suspend_mode = TEGRA_SUSPEND_NOT_READY;
 }
 
+static int tegra_pmc_acpi_probe(struct platform_device *pdev)
+{
+	pmc->soc = device_get_match_data(&pdev->dev);
+	pmc->dev = &pdev->dev;
+
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
 	void __iomem *base;
 	struct resource *res;
 	int err;
 
+	if (is_acpi_node(dev_fwnode(&pdev->dev)))
+		return tegra_pmc_acpi_probe(pdev);
+
 	/*
 	 * Early initialisation should have configured an initial
 	 * register mapping and setup the soc data pointer. If these
@@ -4615,6 +4634,108 @@ static const struct tegra_pmc_soc tegra264_pmc_soc = {
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
+	.supports_core_domain = false,
+	.num_powergates = 0,
+	.powergates = NULL,
+	.num_cpu_powergates = 0,
+	.cpu_powergates = NULL,
+	.has_tsense_reset = false,
+	.has_gpu_clamps = false,
+	.needs_mbist_war = false,
+	.has_impl_33v_pwr = false,
+	.maybe_tz_only = false,
+	.num_io_pads = 0,
+	.io_pads = NULL,
+	.num_pin_descs = 0,
+	.pin_descs = NULL,
+	.regs = &tegra410_pmc_regs,
+	.init = NULL,
+	.setup_irq_polarity = NULL,
+	.set_wake_filters = NULL,
+	.irq_set_wake = NULL,
+	.irq_set_type = NULL,
+	.reset_sources = tegra410_reset_sources,
+	.num_reset_sources = ARRAY_SIZE(tegra410_reset_sources),
+	.reset_levels = tegra186_reset_levels,
+	.num_reset_levels = ARRAY_SIZE(tegra186_reset_levels),
+	.num_wake_events = 0,
+	.wake_events = NULL,
+	.max_wake_events = 0,
+	.max_wake_vectors = 0,
+	.pmc_clks_data = NULL,
+	.num_pmc_clks = 0,
+	.has_blink_output = false,
+	.has_single_mmio_aperture = false,
+};
+
 static const struct of_device_id tegra_pmc_match[] = {
 	{ .compatible = "nvidia,tegra264-pmc", .data = &tegra264_pmc_soc },
 	{ .compatible = "nvidia,tegra234-pmc", .data = &tegra234_pmc_soc },
@@ -4629,6 +4750,12 @@ static const struct of_device_id tegra_pmc_match[] = {
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
 	struct device_node *np, *child;
@@ -4679,6 +4806,7 @@ static struct platform_driver tegra_pmc_driver = {
 		.name = "tegra-pmc",
 		.suppress_bind_attrs = true,
 		.of_match_table = tegra_pmc_match,
+		.acpi_match_table = tegra_pmc_acpi_match,
 #if defined(CONFIG_PM_SLEEP) && defined(CONFIG_ARM)
 		.pm = &tegra_pmc_pm_ops,
 #endif
-- 
2.43.0

