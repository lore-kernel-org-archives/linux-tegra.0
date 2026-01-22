Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012024.outbound.protection.outlook.com [40.107.209.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABE134FF7D;
	Thu, 22 Jan 2026 11:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769080112; cv=fail; b=ameyrrNt5G9WaGKyERYboXeEMtPgFwobWF3NUa6QgXH+opuQwZs6BLbC5DeNJ2ds0PwJF6CHAptLXcKW2s+SAt0KxXEg2bCUrz/Z0paXVUFfWx+jSHanHh3czg4DUfDSrcum9ziWAGcdGPQc/tEeEIXFg4Bi9wXxIHO3SaqIOB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769080112; c=relaxed/simple;
	bh=wCKMIJm9YgrWykAWIknwAbLma0VBFXWNDFl+Yz/OTBw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NAThCBPv0jIippGZPEymRwX6qalKvl1f0VXuTMso7Uuhc5IDM3UT7IIPhZS1t9S5yreMEt2tiXr/7Ga65z9hGplbYml5EjE9OC6QHKj7I5cLv5RBPJGa3D7U0OpacG2YyDDkVm94rQ82VMEKZZMnFQsQ+Cl6wM8imZAhE3SyXQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Bp+lMjZC; arc=fail smtp.client-ip=40.107.209.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Bp+lMjZC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rFi3vyAGyJRCUxpktPk8QdBizJW+ec6IxsbgvkFnlu/QUgNgOaoexKrFWjvJOrA3utTA3QF+ju6EqlLRc5T3Tj8G+qeVlo+f2C4yX1qGKjx0U5JqHVaqEkyYpgl6/vIG2nfqNIyhmHa0B8MYo7dV9VHWeHCesxhnwc31qiZhSYs8bs+9lmjUBDOkyOnpCv/2NMs0zWf+Di9nBt/6Q2gCbMclNhWSeblnws9jfTnsfavB/J2jKP79SA1ZNGpbzWjZ11owlVKM2Vz9rHOJjM3rGM+V5tDy51pOT0iDT7i90HFEHfnToD4T3PGCGEyl9ssl7MpCo/qR/+bu/LCnlA47DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XQDDJty4PRzZEL6qDqmCGsCQQIG2jFdeR9cgqgPdUyg=;
 b=d4KT+2yXGhyBXxOF+0E8auU70/8Jt2aCG50ONef+0tQgJrD6RRwu7DBrGEJSkSykh9nXjVWfVnscgziXGKFkc2+A7S1ibR2pZOIXg1Auqu5hqrAk6AGHqGlCJQetXQGm8Gawq0wiYH7nXN4XQwCgJwisaqMQR9fB8j5tQaWmvoQS5xfhgEtEpkZ38D9Muxqs+5iWqw7ayOtV/b4574PwHKhbyuWyvQylguDRmg+p2Evw+2xgNFfWa6ZwMdxfvK3rnQCKPhqdFv9+KacTowk1iLN/wMwBCiP1JYswp1eXeS94mk0+oa/dZd78OiuUjw63zskz/wXbixyfNusKXTlKQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XQDDJty4PRzZEL6qDqmCGsCQQIG2jFdeR9cgqgPdUyg=;
 b=Bp+lMjZCQvA8Fz84snRkggTSlGEonpe/Id7bmQNg/WfuCxUn4sRHcnb3ee7NL7wuIhLvn2GdkQ/h5TYCq/djSgIQ3gbsDJFBx1sWsgdY8eCs9jjUrWr8cMXKP+Fler+8Ut7oF90WdgR57z8Z4ciaBisEk0cQKIrw/QCBBt6kQz/HVfQHcXY1Rh9+i2iJg8ETOZqbOCcvr+DV4ExL9o4c6apPEu5Ili5uY8mP4hfehxfi6lkmi9TIgOvzgaLn8kWKiNU16wa5Cz1j+c7G1wOaAHq2+ZzlBRqEWSQSBR9zxzShiPf2Mi8Y24p/EwBxA2429FBB4rb9JR1lUQvAXHpiIg==
Received: from BL1PR13CA0063.namprd13.prod.outlook.com (2603:10b6:208:2b8::8)
 by CH3PR12MB7690.namprd12.prod.outlook.com (2603:10b6:610:14e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 11:08:27 +0000
Received: from BL6PEPF0001AB53.namprd02.prod.outlook.com
 (2603:10b6:208:2b8:cafe::59) by BL1PR13CA0063.outlook.office365.com
 (2603:10b6:208:2b8::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3 via Frontend Transport; Thu,
 22 Jan 2026 11:08:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0001AB53.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 11:08:26 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 03:08:11 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 03:08:10 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 22 Jan 2026 03:08:08 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<jirislaby@kernel.org>, <pshete@nvidia.com>, <chleroy@kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH] soc/tegra: pmc: Add PMC support for Tegra410
Date: Thu, 22 Jan 2026 16:38:05 +0530
Message-ID: <20260122110805.97899-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB53:EE_|CH3PR12MB7690:EE_
X-MS-Office365-Filtering-Correlation-Id: ea8214f4-86aa-4032-3666-08de59a69150
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GHHUCNRRabL34GXf0JoRbzJNHQJpsSD7Q1msRbuL5vcH2+k/Bf+wDWK47LTw?=
 =?us-ascii?Q?3e8onMQoZtJyO1TJbstZs+qYfzdhyrd1Wlf0piJPNKeHDzyLS2Rf/eOzAOhZ?=
 =?us-ascii?Q?8icAjbVtd5c7I3sJXHqIU6o3a3wD3wFf3jGKc5GPsLLepNZyT8KDJ5XfIPe4?=
 =?us-ascii?Q?g6eXQv4i2Y2i87CaeCh8lTRST1v9RDYE6LW7ehMAJ4qDa8BLNMYA+ShF7C4i?=
 =?us-ascii?Q?Pl34ZIPKoYLmq5LCqJ/s/upxd86zgUtVSaIjNWl/Nxdmna11opjKQPYczBhF?=
 =?us-ascii?Q?dRKvR/XEZCozy/0zHD+gi/ycjy6eoeZtThBLLWuJ6e7DIhFPcGQkyVMCvPhi?=
 =?us-ascii?Q?5z6KnyOwN3XQHoHwjMVfU2DevGqh/C2S3qkkiKMQQZyVomOjrCn8dbAFUYme?=
 =?us-ascii?Q?d8sVDw45IBXHyqd/nIsUXB/bkmpm5qE22ggg8e7vJdecj0XoVq/VyXPSJBma?=
 =?us-ascii?Q?UMbrc9WXMcVT9WHFPyAbN8uE20S+u08DjEFg1A4A1R8hPsOX9pu3qOilXSwR?=
 =?us-ascii?Q?V2HYGmXvmJ0SVOuYl9opyxKGXLZQ1SMhbRsknvblETTskEnFzpQ3huyuGnqw?=
 =?us-ascii?Q?AzrHo6OIeKljoZ4d2Opa6V7YA10iGIpddbjQRtjW0/yvYF/m+aecKlAIuFes?=
 =?us-ascii?Q?FpazlIVNWoF5CfvQ/GOzrXzJ4WxHPg7JW766tKs5UPnPDFuEnHJzkRVZ+ysE?=
 =?us-ascii?Q?rqVAaNtiwX0BEWspsaIWhrRrwLju/80CidfBENNBKmC2b+UAEm4nXt6ikTo1?=
 =?us-ascii?Q?MtP1aIHYAjNSdfhfbwcNW2ODlj51s3sdphyON+L2uhfpXx/xvg200UHZRlcc?=
 =?us-ascii?Q?KqCLiMc2Dvlo5nN6Da6h37gw3Ewf/aH4t0hEs9abul//RLjNI+1kRIqGmSsp?=
 =?us-ascii?Q?f7ryFFpcAJ2qYiTdKsC6BmgWp//wLmh+7+ECKQdNvQ6OgPpKx9IXCIJlpI3h?=
 =?us-ascii?Q?zWwLvtJvXm0+EIIffwdqU7RNUtZumH90eQQDuvOSPrHQQHkLLVSArBZb6V9V?=
 =?us-ascii?Q?ZNZOLAvQj1NsCJ2BI6EvWV7gdEDHnWHaS5g6VbVwFZNbzMx4nhAW0aH+BYp2?=
 =?us-ascii?Q?tKhbq7MOzg1gkdd7uLi0Z5SN7NyCPxShZsGFGHwt2IXklwh5XzDUamRdBE2n?=
 =?us-ascii?Q?VZAZoPQo6pdv2tRVnWrEAm6y8i2vUN5TKp42N74+aNAnb8wmC4L/JAs9/bkU?=
 =?us-ascii?Q?oequdGLNrsN9cubX2uorHYe60KINrdBYm1msv5m4xOvNV/Ep5CAhxhRV69tJ?=
 =?us-ascii?Q?Woh1KtZiq8voHaLRrroVNuYIFmS5C96Q55ynOeOxY/rKTWVfZvUpqa5Pnhpn?=
 =?us-ascii?Q?weMZuuIa0eWaBSFHYJICneZ2k8+hHwHLcMhrXR4hwJgGqdm2o9UAXM45uxj2?=
 =?us-ascii?Q?Tlfs/0qZbkNkJnwqL675oGJ2xMbpishoGh4+/WXV2cVEvQEfrSm66ZGIWfFI?=
 =?us-ascii?Q?Rp3jd9Yc+vKmDxnUmXyoxlBRNcUwf0q2o17fltOtO+XDZaevk2amqUYIkVcE?=
 =?us-ascii?Q?v3ck/kQTmqQ6Lp+A40ik9TkpGOFtoDWuOhcoFHI5KraM5XDyuJ36waT9FDFo?=
 =?us-ascii?Q?Wf377IhByJZ+7QYrhfbmfU0ZmACaHR/rl/J1RDOGPYTjZX4yStK4GLV6jFSf?=
 =?us-ascii?Q?0HDHkJB24eDjSsFPRQbISOffK4S+5D5Tf/PxiDCY90K+mwGLJkJ+2cWtAwsU?=
 =?us-ascii?Q?/TRrLw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 11:08:26.8792
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea8214f4-86aa-4032-3666-08de59a69150
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB53.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7690

Tegra410 uses PMC driver only to retrieve system reset reason using PMC
sysfs. Tegra410 uses ACPI to probe PMC, unlike device-tree boot it does
not use the early initialisation sequence.

Add PMC support for Tegra410.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 128 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 9cdbd8ba94be..2bdcd6d30261 100644
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

