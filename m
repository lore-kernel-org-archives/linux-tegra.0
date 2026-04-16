Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011022.outbound.protection.outlook.com [52.101.52.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD5837F8AF;
	Thu, 16 Apr 2026 11:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776340319; cv=fail; b=bPdkoZEZC88Tt1OQJd8SiLw40iVdPCLSw+zAjPlDg8v1Hg0MQwrMrDqNrgdCwRUJdr53+FlDFgVH7OJXGE3gdOVsWXq58gW/5FlNtAo0Yqf6kCTyZXF8xSihvtSYGru3aMGTMyPqv6hyUi8tnG21/T6vUwywXxf3TELYKMHZ9+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776340319; c=relaxed/simple;
	bh=S11LW3z1iTPP2d7WrXCA1g0HcKtLbUyVBKcvjh1mqqA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EjSHWM4Pulyfz90yTv6o3FC9KuVyV5v2/UAmixpNdLQKKGCMnvRWWm5FIB0eLMNqcKY99BAWRyacEIP6fJrJFxj9dutCFL9v4b5rMtztFBDeYZJxjnx/HEsEOZPkCnOnZj/F3/oc3D6+IVjv8LoervfwG1xX4vXXzQgL5kunZEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BddX2gzC; arc=fail smtp.client-ip=52.101.52.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BddX2gzC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=deAjk+WXLQyFZLTtE+fJNZmE16kmWIl4S7NuXxXvUsBJkLzojnvAdNCgBjkFRufoKgEcyh8qoyog5BiPvypoRlghHGsCmkJ3dKoUwOqnd7h0UkLcjuvq9J46kbMooOLfwdg9m7evALFziNeW7TcpPPrTJSYz8i9mU5/oR+7Wg2fhuxDoZzVFA6VeVqJFYsdxaLZyGqQAKurUcOi84aFli9S77XeiEQfalEJnP/3cxhyPD0lc/Bq4T7ZwzXpaFgoKLpIqZ/1nCbFuENoWAJGksvqqkgc+YFWacS2KjK6JRpJfNwH7tTDaLuPfvkAkMB7rsQ0VpNpx7DiFrvFEH0Lr0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aMvFitZRlfIOSAasfD3kc/GcM88s3DFn8aO0DGW4w2Y=;
 b=PPzLDrCpXEl/7PBqGwMTIDhZvDONpnANtR9Hgm4Zp2fX//1kgPQCUHfVDO2uoE6r9Uoph/1n1UT9uTQQsMtnM3/DZzVWpaaJbyrjNdCKVzMM9lnoj7la00fdblykLb3ehip1lO+d0M2/lasDA3c3F5trnJ0HBlos4ZeEVjjMc/8ZkR6R3dd7wJtlfibUgnGR3CWi3xi/lnBpVxZ5nlIZpKi9C7lpcXRA/TKshSEzFlkGngyJm1e1u4/hnNPZbTUA3B5tmXwk+bM3AUjBT/CmLiU2D6qbBoKSONb2OEQIQmy0lwqafAc/O59Ms4O0ORGg4Y2wB3Or+L4QxiGmJiW1Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMvFitZRlfIOSAasfD3kc/GcM88s3DFn8aO0DGW4w2Y=;
 b=BddX2gzCRI615/vBCWtU4Eb8CsL4fln3uDmQLXSP9Pu8nMT782SfG/KwfKq7SchmItnCo92s3QBGr7yM0TM4FlyOO+KVTSOtXuJ6R1AiX0pVwuCtZOnZu/XeRpTrXwKyDNQ/+rEl+TCwhoNIx0H/H6F8NDkK5f5NQhOZaC0p4byndSc/74jTby+9/kw495vjnZUBGt6k4gFEXKmkm6uXyAN4H3DhjioSYgP00icSfZmRLAssbRoagD6HCkd1HbIW/BRwZP1bqUB2ZFtmMwohVZKcDuIHLZK5MdvT5VXkOwoaWDicc9Tzhl2/MYnZyP/LVo8ffzYAaBfP7NuI8gp8GA==
Received: from SA9PR13CA0084.namprd13.prod.outlook.com (2603:10b6:806:23::29)
 by IA0PR12MB8906.namprd12.prod.outlook.com (2603:10b6:208:481::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Thu, 16 Apr
 2026 11:51:52 +0000
Received: from SN1PEPF0002529E.namprd05.prod.outlook.com
 (2603:10b6:806:23:cafe::4e) by SA9PR13CA0084.outlook.office365.com
 (2603:10b6:806:23::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.49 via Frontend Transport; Thu,
 16 Apr 2026 11:51:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SN1PEPF0002529E.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 16 Apr 2026 11:51:52 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 04:51:41 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 16 Apr 2026 04:51:41 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 16 Apr 2026 04:51:38 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
	<jonathanh@nvidia.com>, Christophe Leroy <chleroy@kernel.org>, Jiri Slaby
	<jirislaby@kernel.org>, Prathamesh Shete <pshete@nvidia.com>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v3] soc/tegra: pmc: Add PMC support for Tegra410
Date: Thu, 16 Apr 2026 17:21:34 +0530
Message-ID: <20260416115134.1032155-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529E:EE_|IA0PR12MB8906:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c3df78c-b8cd-49fa-b8ca-08de9bae8d03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4py77gEerzsKqX2nE+vOBNuglVTit24BgYSePEWoHJaodwz7VshQ9FhwgIwVtxUFSDzB57lEgSXbAm5SSs6iuJAgE9YSGH2ZH2wPS5KJ5mthxdSPKomT5HQb9O7cNtgJST2RxaN8chPEww/j1sz1VpKPd6UxsKeiNONu9Fq0QXLLI8YG3URRMyGt/qU4ScnAclag7fG1i2CNih7xhw+Jxv4eLFKNqUaPpzHDhV6NxiuxkHqdNJAMowEKCyTy/hnkT2Uf2gELLIsUKUZYbJtypaE4tzrl/BL7wlHHN4SwdCZ13PCCHCTQoqI7IMNCEzZofPpY8BwM/9knSFdsUzyRIYg+ArMvzwckoUmIYXsWnQe+bMpFCgAuI/cLqALe+ybwlUribzgH2nsPjSd/ct40vLPxxd1GfTF9QB5fe9GxpyWBHI+cHISC044QxfnlIzumbqqrcPab+yATwbugLQTotVqhpOuMihOzmtMZ2toitD/JSukVef4dmvtN3ep+HlymAyHMxZJU1gp8Kb7xZp2Tdjn6BNHphkZYdnRNPDqjVomb23+ZyCCHy5/Zj7qgpX+CvLidb5piuBjgxzVZbQCRhkjVUJLtbGgNzJ4A1N2H62TbtNOoWr05mMsSDM3EYoo8PQUPvGCRMY5kYxPpCkhsI0NO5mOO8sc8qVI4i4HXL5p+z3pIY6lVRu8AfQ7XtjhnW4ubEXFH+XyEGed8FyloDzljDjc9xDbgjMTPe9r4ibfBQFafJ1nKD9uoipc3+5SaWUe69OHgDKPjK5ceHtmG5Q==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0/llqmI2zlYaa5zuQUSIGhE2P08FOxlIC8jH1zJ+TtH+JizADOAnjeBw+RTANbg4ZIYW2YSjWpAXn9XDZcWb5rWiRmu7kEec1CTAGrb6O9vLRhexm24nFa82oT7W/7j8BCndMX7EIfiEzNaI+6OsQBEtOMYLEn1/gr799dhUxw+f8q5hTyE+ECARW7IsxHMrGWOs+KatY7VCt2LaLsetBG0iuMDzER0T1sspA/ZJiANJT0WiconUT2yXUK2Q03pc5mJuK3ufK7WmSEFOGiLpP/lfR8522Yd/YOOr5KsgYZruHKOoocPnIuLjXiFhw3KsE7RQVoL2THRp1t/an/4L6pp9tcCcFHnYUEUx21PxS0COtdCCgosbxpG8B8MgjDbxa6EuueEsJTh3qlVo+eAankPfPZpOljQPEbHc6qs3/27T9us16ySWMTDP8ePD0UiO
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 11:51:52.4238
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c3df78c-b8cd-49fa-b8ca-08de9bae8d03
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8906

Tegra410 uses PMC driver only to retrieve system reset reason using PMC
sysfs. Tegra410 uses ACPI to probe PMC, unlike device-tree boot it does
not use the early initialisation sequence.

Add PMC support for Tegra410, which uses the PMC driver to retrieve
the system reset reason via PMC sysfs.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
Changes in v3:
	* Remove unused entries from tegra410_pmc_soc.
Changes in v2:
	* Updated commit message.
---
 drivers/soc/tegra/pmc.c | 101 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 2ee6539d796a..f89de1969946 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -11,6 +11,7 @@
 
 #define pr_fmt(fmt) "tegra-pmc: " fmt
 
+#include <linux/acpi.h>
 #include <linux/arm-smccc.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
@@ -3117,12 +3118,30 @@ static void tegra_pmc_reset_suspend_mode(void *data)
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
@@ -4783,6 +4802,81 @@ static const struct tegra_pmc_soc tegra264_pmc_soc = {
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
 	{ .compatible = "nvidia,tegra234-pmc", .data = &tegra234_pmc_soc },
@@ -4797,6 +4891,12 @@ static const struct of_device_id tegra_pmc_match[] = {
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
@@ -4847,6 +4947,7 @@ static struct platform_driver tegra_pmc_driver = {
 		.name = "tegra-pmc",
 		.suppress_bind_attrs = true,
 		.of_match_table = tegra_pmc_match,
+		.acpi_match_table = tegra_pmc_acpi_match,
 #if defined(CONFIG_PM_SLEEP) && defined(CONFIG_ARM)
 		.pm = &tegra_pmc_pm_ops,
 #endif
-- 
2.43.0

