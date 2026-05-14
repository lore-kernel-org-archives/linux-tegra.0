Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013009.outbound.protection.outlook.com [40.107.201.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2311335E529;
	Thu, 14 May 2026 05:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778735952; cv=fail; b=Z4i/K1AkcubL2b88WbvyTvuEPrhknLCb9l361dSrkoiK84cC+/ipnw7YcEVoxTq3L+6Wh+0uIpHz/WCZkPd2MkiYEzoEyMJaNYOzdQDnJHu/kD0SAhidKB8Dp8wN07mERhjXxuP9FOvOtHeJoipMDERXITnexIrraryC5l+YZqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778735952; c=relaxed/simple;
	bh=efOn2I9HcUwmcTATI8OpVqnZ0q/rtbQHvmG9RE93meo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kG7Wurg2vKAUnsa7+xNpvKJJBEjLnu88MzuA/fZ5TzSfxCyAQLihc+ecjXij06qr9e9b3+uIgEwGzzVDFid1FqUClA7x6evYgE3q+uokiVVmoLxpS5fJZDUxt+P7dgCAqOv/4IuPE6ThAvUp701jhQMvYMtc/YFOj1/yx91T4Ko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PUCsZgYR; arc=fail smtp.client-ip=40.107.201.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PUCsZgYR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fme65nMz/4yNrRgoAU7xJexdNYpgzWE69y7l20R8tv7b8otJyBHegx/bQnnkMN6qCWlnYZr2SK70P2FYcsqYe3u4Ssela8w0PocGc166oQHsYEqQlEnEQmjQqOmx5nmTjB0ry5MbpJAEcrkDilT/Z7a8quaxj0BeKeSXgNCufXHA04TeMtmAbW61HK7BQ24dZVqqDfnaV8B8l9eApyU3uXR7IoHCLjBD+ao83+Jb8Jfja7SM26MTM/P3Cj0O1g2sY8fXjoj6LIq0TGXi+wGPKm4AnMZd1041r6xegiBPvrHRhlHhwtKgwuQI5aOJENcfq33DEAE2pGLpIbtJEDQ0Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hBn/A2EB0zqeWqONMq+Rft+whJ2Ox/9I/faQswInBSE=;
 b=iWaEuBvmiXr9U1Ti9WqNwmHiig5/B1e1CCSogQRt4XTiQDJwLbr3w3joR4+T0EjQr5EI/lTKwtsykW040bmtOedcxgTGO0HgG1dU4QIo2CkCa+mnywdYi1FW6wsmejcFXl+h664i+5pQcPGTywOJtbS7RfT8VzQMo1jhXP5ODH9WmqUH1S47uY6HAG7fqOvCBe7Q414uzDGQRRPDPSww/SopoR2ZQXNZKvx/dA5Z6VeQRYiS9kD4oCkx/NMps1YWPEQ6xQrTDDPu3A+lcbdelp0tCx35b6WrUah2CDA/hpgyoZy1tvlhDAmEzx6W8LHtA5em92gSh24UaWz0WHDS7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hBn/A2EB0zqeWqONMq+Rft+whJ2Ox/9I/faQswInBSE=;
 b=PUCsZgYRzQ2nkzLuorR5QgBcBKh0pieGxJKqzIWz0JTPFWrHuPG2OYz6tClA9pIEllJJ5ddeuJf5MmsOGvO54XvlSyekpBFnptu0K46yKOJcm3ulEruXVi5uMer3ooW2Wl+jtN4p87dwZUCVHdsIUl9kaDgyVXwswOr106zgyuiFqybg/sPVt73B+9VjeEkRamGUCmUlIMzdaRcl6mbOOKGF9nBoF33yzbTZ2MZWH86X+Z8em8cwuLyqAdHRlAxAHvb5GIobFEOANgmlWbviwzfJkaK7TcuLzrQ7SDZLCDfemP50pzXDRnaqHvQSG6yRrQCmSJehJlcBB9XcXUDSzA==
Received: from SA1PR05CA0013.namprd05.prod.outlook.com (2603:10b6:806:2d2::19)
 by CYXPR12MB9280.namprd12.prod.outlook.com (2603:10b6:930:e4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 05:19:05 +0000
Received: from SN1PEPF0002BA4C.namprd03.prod.outlook.com
 (2603:10b6:806:2d2:cafe::a3) by SA1PR05CA0013.outlook.office365.com
 (2603:10b6:806:2d2::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.18 via Frontend Transport; Thu, 14
 May 2026 05:19:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SN1PEPF0002BA4C.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Thu, 14 May 2026 05:19:05 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 13 May
 2026 22:18:51 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 13 May 2026 22:18:51 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 13 May 2026 22:18:48 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>, <chleroy@kernel.org>,
	<jirislaby@kernel.org>, <pshete@nvidia.com>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v3 RESEND] soc/tegra: pmc: Add PMC support for Tegra410
Date: Thu, 14 May 2026 10:48:46 +0530
Message-ID: <20260514051846.2401935-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4C:EE_|CYXPR12MB9280:EE_
X-MS-Office365-Filtering-Correlation-Id: f9cd4312-8f8a-4b7f-d336-08deb1785192
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	LOuyLo41F0Ab33vWF0kaHwQ2v6btbYvxtKdd5mHLR2Tst4QG3c9oiY0scP1OthyHH7zCvp31aSoXu2TkFi2rNTUQwoUCg+w4MPg1AR6MrGKZhqzikxAXwjiH/zxaAHWwSarcOvHM7xvZqiYXWgcIr5Fvr3xLeG7q65gyAk+aqdooWyGMsDiW+poJoSCQjiCVHmgON5e0KZY4vvvznFiuQ0Kx7lz3i4wjdnglpnyeWF0hbyjzGV4fccVE5RUUYXc/S0Yyl10c8bZiwSB2EoAm9V4KDGZiWgAYeqMspV7+1f/XgFAIIrLVBCjH9IjIezzmzgx/8/0F/25WWk4FAm/qW79ceQ3v9jDUSJ+YPaNvciWfWFpDxTNXRPSuy+87q/a1zMbY5lUZaHdVJRI1XmQSUwu9QvMKy+6Xb/n+fYAywcrAJBaklcyUo2ex/FuqF/fwmWnKGo09JwrETGCHXA+wKOc5kSGXKDlgtXgrKTrf0q+GMDiqyqz6/siYClEgAaIuV2xZ+TaUfp0apHsK1mXQ74PwZg9UdNktVYES9Syw9v4Ln/5L0WMtSh4TYb/YafiaiKXkBR8R9Bl8dQ/bAXq2uk0+Sv13e7ep36vNu14bz9N7OkUGAubbCqcOaSJ6dMgqmRc5wuSz+wEAbiJerqx/O5vdk4RznX5s4HZR8s3EZF9J+TOUlyUSJhotNakLsQzJaCz4qZrVhM9Xdt16nix/lPqW4gcHz2xlX5GB7iOi5E8=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MvuPKo5iCX60JstxqWs/TWLwgWIe9Nbzesa4C8bf2LWGH4WRFSi1fZIdHxkdseyJgRrW3qysgWlb/HfBWKylvLOcx68rbhBrBlrWhili1v71lyoB1mp5/doTbXrt0+/hyXQPXawel9ZPmvrAKRgNKC2Ow5xIRjkdXGyvicmWLBdzK8Q5wLdSRmSd/hYOXRI3vFOBdAcvkGHXJD8eEIYtTXiMHYfnEJMxgQyobsBcCnC0yxhn1P6vJ+HviacLE8bArtDeVuwP8421RZSh5BVu9SqQShy95+xxRrypmQFsLH23DOfc614vqsJDNdvWcs+mfb+WdRFqeAv4ojYF9HwW+HiwLfUTB9/GxG8WDdRUiqYAXyThJ6DbcYAn3T8MSO90/nQh+67zfM8P0ER94Ho5InZUJZWUA+8uL0ch83CilCI1791FTv3Z/rR2HH/IY4ia
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 05:19:05.4601
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9cd4312-8f8a-4b7f-d336-08deb1785192
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9280

Tegra410 uses PMC driver only to retrieve system reset reason using PMC
sysfs. Tegra410 uses ACPI to probe PMC, unlike device-tree boot it does
not use the early initialisation sequence.

Add PMC support for Tegra410, which uses the PMC driver to retrieve
the system reset reason via PMC sysfs.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
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

