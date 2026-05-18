Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013066.outbound.protection.outlook.com [40.93.196.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4756B24676D;
	Mon, 18 May 2026 10:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779099319; cv=fail; b=YNxz56s1E67jelJcAznwAIKVizxoJOI4xloqyEi99ngknlMrsh9+b1SRxsDTZZ8xIx4gbHKsMSX7eYzsg2DCjN1L0+wMcHNOnP9/6WjBmZRBNOhQMWr0oDnc3A9ahNUf4FjfOaN/FKffr3WqYGe6GyhNOmJBoZulE8IsfHXxcIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779099319; c=relaxed/simple;
	bh=XNCjz3R/Dy2RDM76Mxw8ZFWZDfl0S7VjRGmuw3pRub0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TsXrUcAXwH7bPTsdHAdpg2fV8Q9tt5KLOOR5RtijWW+6yEyDc8yfcuMfe866Hf3PP/TJjdMQJKnHAf2k5tMkCLYUDucidI+HA5XcAaqtRR/7OImRiEq9W9D7cOPx6QC047UYF3XQ6eRaX4EoKaCRirZEsHxwTUo8tPDKRNNJ+Bs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EqLYYhdd; arc=fail smtp.client-ip=40.93.196.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EqLYYhdd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kC6nh8/xUQWfYiipjN6z+G8GLvKAW333YuMPO76BpwOSFrrxHzcY2PobTaRjgz0JU5uVcAY/Su1emEk/fTOl1m0HmsyNBop5u1eyFz5z7VvOAf8j2KqOHL7CfdK6IJLZGqpWboEtPnZoOs09fAKx9pwR9P4S29lISv6160/veJ9/MElKrFHrSuJkWx5q3ix13JU829bCFX6UtntC+3LZfjyeL+QRMOZqkWM2fuhFl8TDFJg7+ZqzoYCL3Bobzhmugu+EiGdLzVNxVRCc7XrrwsJBjztOOOs4S50AMn1AB4hr9vSPl/Sz74DTWuqGbNGdeBL5mxYF9TX5dLNsoTRvkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ut+6QviZmBDBNXbs7jxjOvYb2uJ9x9LbVu2v2+wVLTc=;
 b=Ysf7Fjk2ir/pNx0QF797CoCOaTUQp/QABzvH8nIWnMl+6xoMVjtnlqn/acEUrzF9R4DB0PPnajuyTyduuW5jp6IDVqSrkTAuGbRQ8jhUrvlwgQUzyRLb677dE0dcRvwmAKMr7LBOpwdLlu4oeQBSEDkx74UbkYBa7Zsin9/IHYrv0EobOaqHDuw+LgJBI0snEClZvrtMQScs/Nf6DLHDcynAo/C6lF2xNNexRYLQMs3DL5SE/h0qFalpHwC66OXSRcWWoshbuNhL2t1XuACqhIrZ1RStx6IkEuoX4RkCNLarocDqi00r6nujA1+nDjvhSwdbKrac2/JX0ZzkiRXf7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ut+6QviZmBDBNXbs7jxjOvYb2uJ9x9LbVu2v2+wVLTc=;
 b=EqLYYhddaBdFAhbuA6VhH5Il/VBLxEasBWm9onem75VAZQlVHMIP2lqga4s/jJcfeN3UhyZMLfmMHoINyVN7iYRdyK2+aXiFWqS7IskaQrFwSDNmBOar9Z1tXZOYoymqyOfXz0xQiqtc7yGxGO5vtC7SsEIIm3ztfk2Ox3bddNr4Frhmdn+c4YEXOjK0dG14rjYjLAIHSto9ukMwxpR4l28ngC3KxTIQ+9kWWBwv/kKqPgsiU09QT+Oz+2NwlSi/hv2UjDGKnQfwjoy+9jYE8d2LfbC46nU6B2igVg4jwkPpEFZSfO0up/v0G7RSL4pSAngVS9cudCfL6A5msph4fw==
Received: from SJ0PR03CA0202.namprd03.prod.outlook.com (2603:10b6:a03:2ef::27)
 by SA0PR12MB4448.namprd12.prod.outlook.com (2603:10b6:806:94::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 10:15:11 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::7d) by SJ0PR03CA0202.outlook.office365.com
 (2603:10b6:a03:2ef::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.23 via Frontend Transport; Mon, 18
 May 2026 10:15:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Mon, 18 May 2026 10:15:11 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 18 May
 2026 03:15:01 -0700
Received: from build-pshete-focal-20260330.internal (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 18 May 2026 03:15:00 -0700
From: Prathamesh Shete <pshete@nvidia.com>
To: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Prathamesh Shete <pshete@nvidia.com>
Subject: [PATCH v2 2/2] soc/tegra: pmc: Add Tegra238 support
Date: Mon, 18 May 2026 10:14:20 +0000
Message-ID: <20260518101420.171465-2-pshete@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260518101420.171465-1-pshete@nvidia.com>
References: <20260518101420.171465-1-pshete@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|SA0PR12MB4448:EE_
X-MS-Office365-Filtering-Correlation-Id: 9422a11b-f94e-4a26-0b32-08deb4c658b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|3023799003|11063799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	xBH2PF2bGfbIJsZeudTywmWSgW0+JUpLIfHtYECF6G0IS9DTdc0diU9YQY4ImsFnSz4tmMuh1GelpHLzJrFEzvimz87xrayML/NydjEKkY2q8z+r1+2+nBDApHpPcFq2B1y/E1IXbbTyeW72PqaGMv3y1EQUIzU/1fCgADqg5Rd8wqlxqDQyl+qqG1BwbR1txEKLITmYSQ8o0SwKI2oTn06CHpeuTXyldloWAjY+/RuPvKjb6GcZr+7aWKC9oVRQCrOlMtyKpfFfDhVu9+dIgSVA1y36rs1zZPL1SAfEn9aclFPEjp6bD885r3JPnNRannql4GjyhFf/T/sHoVwhshnjrLBeksQ/mRWkDpy46gD5/YTJ6PLsSrmdDHKsUnPdfsdH5wPlSulIUH+BzsQQYFv2TfFOwQn5Oi4dFNNcjwKq6DOj33vjUHS3rTAEb9ezrRW3lYsLUmKkc8Ho2YdixfPwLEtvEssL/hU6I1f5MpJiMBF4mvrv7/nllv0/TH4+UuLsLCJ7lhIuFmSv4Pn30blb09l6qE1ZmVGo73kotLviyNRvCi3qpsl05pZUD0N4axMc5QCBM5Sny4GHOP47QRjk0mJiz5hrd38DESKtNudSBu6kPD5YTUoxOoRcFIcRLQbnt+h0ZHL02GhafsDEl3o9Gl4v1EmB0ZmyNESbltF/j6TaPF6iEc4SR6WLpZwn7XWdp1kGKyEN8nZ5d6qsQh6AtSZ32mOGQQsDdhhEtXc=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(3023799003)(11063799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rtB31ofW4J7WKe6wTTWsX9ydhQ8oe7WqDE0jpXBNeAJhc+8SWzgxK/mj+F7mieRemmEHs0sXX4e+37YPkhGhC3Z6hHFy+nxb19+UOdWnfyB4XqiJZeZB4Set6Op3jXspoWTSwvlmDoS/zxOmsbm8XUoH/Pq9pX1+DeBUJEZHMB0ASyCyg1onua6C+8hvrYuwTMI1uKWJb5HQL/D+Q4A9j1oKatcjAe3Q5EHaJ8rqEVy66WdpzdtzdPuAtdoua3XB+XSAU8KbC8fGukrrcUtoQ0Pnkv9AytHSUZoy9o/TcJP8723r1R/itx0LLFx8f67aOPyVMr1RmUzWYTjkr+lRyQYJL/BhYII6fM6cBHblK/PeksDhGI71MXNtOPCwUzxgJRtNzi6gTik/KPCc83hrptqBttDwqfNyEG6NH1+g5cWOaJ+HQECJP6BFXa4LSz4w
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 10:15:11.7883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9422a11b-f94e-4a26-0b32-08deb4c658b8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4448

The Tegra238 PMC is largely similar to that found on earlier chips, but
not completely compatible. Add support for the PMC on Tegra238.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
Changes from v1:
  - Add missing Tegra238 AOWAKE register offsets in the PMC register table.
---
 drivers/soc/tegra/pmc.c | 159 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 159 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 2ee6539d796a..cec9f7521144 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -4595,6 +4595,164 @@ static const struct tegra_pmc_soc tegra234_pmc_soc = {
 	.has_single_mmio_aperture = false,
 };
 
+static const struct tegra_io_pad_soc tegra238_io_pads[] = {
+	TEGRA_IO_PAD(TEGRA_IO_PAD_HDMI_DP0, 0, 0xe028, 0xe02c, "hdmi-dp0"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_UFS, 0, 0xe06c, 0xe070, "ufs"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_EDP, 2, 0xe040, 0xe044, "edp"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_SDMMC1_HV, 0, 0xe058, 0xe05c, "sdmmc1-hv"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_SDMMC3_HV, UINT_MAX, UINT_MAX, UINT_MAX, "sdmmc3-hv"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_AUDIO_HV, UINT_MAX, UINT_MAX, UINT_MAX, "audio-hv"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_AO_HV, UINT_MAX, UINT_MAX, UINT_MAX, "ao-hv"),
+};
+
+static const struct tegra_io_pad_vctrl tegra238_io_pad_vctrls[] = {
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_SDMMC1_HV, PMC_IMPL_E_33V_PWR, 4),
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_SDMMC3_HV, PMC_IMPL_E_33V_PWR, 6),
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_AUDIO_HV, PMC_IMPL_E_33V_PWR, 1),
+	TEGRA_IO_PAD_VCTRL(TEGRA_IO_PAD_AO_HV, PMC_IMPL_E_33V_PWR, 0),
+};
+
+static const struct pinctrl_pin_desc tegra238_pin_descs[] = {
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_HDMI_DP0, "hdmi-dp0"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_UFS, "ufs"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_EDP, "edp"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_SDMMC1_HV, "sdmmc1-hv"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_SDMMC3_HV, "sdmmc3-hv"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_AUDIO_HV, "audio-hv"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_AO_HV, "ao-hv"),
+};
+
+static const struct tegra_pmc_regs tegra238_pmc_regs = {
+	.scratch0 = 0x2000,
+	.rst_status = 0x70,
+	.rst_source_shift = 0x2,
+	.rst_source_mask = 0xfc,
+	.rst_level_shift = 0x0,
+	.rst_level_mask = 0x3,
+	.aowake_mask_w = 0x180,
+	.aowake_status_w = 0x30c,
+	.aowake_status_r = 0x48c,
+	.aowake_tier2_routing = 0x4cc,
+	.aowake_sw_status_w = 0x49c,
+	.aowake_sw_status = 0x4a0,
+	.aowake_latch_sw = 0x498,
+	.aowake_ctrl = 0x4f4,
+};
+
+static const char * const tegra238_reset_sources[] = {
+	"SYS_RESET_N",		/* 0 */
+	"AOWDT",
+	NULL,
+	"BPMPWDT",
+	NULL,
+	"SPEWDT",		/* 5 */
+	NULL,
+	NULL,
+	"SENSOR",
+	NULL,
+	NULL,			/* 10 */
+	"MAINSWRST",
+	"SC7",
+	NULL,
+	NULL,
+	NULL,			/* 15 */
+	NULL,
+	NULL,
+	"RTC_XTAL_CSDC",
+	"BPMPBOOT",
+	"FUSECRC",		/* 20 */
+	NULL,
+	"PSCWDT",
+	"PSC_SW",
+	"CSITE_SW",
+	NULL,			/* 25 */
+	NULL,
+	"VREFRO_POWERBAD",
+	NULL,
+	NULL,
+	NULL,			/* 30 */
+	NULL,
+	NULL,
+	NULL,
+	NULL,
+	NULL,			/* 35 */
+	NULL,
+	NULL,
+	"TOP0WDT",
+	"TOP1WDT",
+	"TOP2WDT",		/* 40 */
+	"APE_C0WDT",
+	"APE_C1WDT",
+	"APE_C2WDT",
+	"APE_C3WDT",
+	"SCPM_SOC_XTAL",	/* 45 */
+	"SCPM_RTC_XTAL",
+	"SCPM_BPMP_CORE_CLK",
+	"SCPM_PSC_SE_CLK",
+	"FMON_32K",
+	"FMON_OSC",		/* 50 */
+	"VMON_SOC",
+	"VMON_CPU0",
+	NULL,
+	"POD_CPU",
+	"POD_GPU",		/* 55 */
+	"POD_RTC",
+	NULL,
+	"POD_IO",
+	"POD_PLUS_SOC",
+	"POD_PLUS_IO_VMON",	/* 60 */
+	"POD_PLUS_IO_PSCPLL",
+	"VMON_PLUS_0",
+	"VMON_PLUS_1",		/* 63 */
+};
+
+static const struct tegra_wake_event tegra238_wake_events[] = {
+	TEGRA_WAKE_IRQ("rtc", 73, 10),
+	TEGRA_WAKE_IRQ("pmu", 24, 209),
+	TEGRA_WAKE_IRQ("usb3-port-0", 76, 167),
+	TEGRA_WAKE_IRQ("usb3-port-1", 77, 167),
+	TEGRA_WAKE_IRQ("usb3-port-2", 78, 167),
+	TEGRA_WAKE_IRQ("usb2-port-0", 79, 167),
+	TEGRA_WAKE_IRQ("usb2-port-1", 80, 167),
+	TEGRA_WAKE_IRQ("usb2-port-2", 81, 167),
+};
+
+static const struct tegra_pmc_soc tegra238_pmc_soc = {
+	.num_powergates = 0,
+	.powergates = NULL,
+	.num_cpu_powergates = 0,
+	.cpu_powergates = NULL,
+	.has_tsense_reset = false,
+	.has_gpu_clamps = false,
+	.needs_mbist_war = false,
+	.has_io_pad_wren = false,
+	.maybe_tz_only = false,
+	.num_io_pads = ARRAY_SIZE(tegra238_io_pads),
+	.io_pads = tegra238_io_pads,
+	.num_io_pad_vctrls = ARRAY_SIZE(tegra238_io_pad_vctrls),
+	.io_pad_vctrls = tegra238_io_pad_vctrls,
+	.num_pin_descs = ARRAY_SIZE(tegra238_pin_descs),
+	.pin_descs = tegra238_pin_descs,
+	.regs = &tegra238_pmc_regs,
+	.init = tegra186_pmc_init,
+	.setup_irq_polarity = tegra186_pmc_setup_irq_polarity,
+	.set_wake_filters = tegra186_pmc_set_wake_filters,
+	.irq_set_wake = tegra186_pmc_irq_set_wake,
+	.irq_set_type = tegra186_pmc_irq_set_type,
+	.reset_sources = tegra238_reset_sources,
+	.num_reset_sources = ARRAY_SIZE(tegra238_reset_sources),
+	.reset_levels = tegra186_reset_levels,
+	.num_reset_levels = ARRAY_SIZE(tegra186_reset_levels),
+	.num_wake_events = ARRAY_SIZE(tegra238_wake_events),
+	.wake_events = tegra238_wake_events,
+	.max_wake_events = 96,
+	.max_wake_vectors = 3,
+	.pmc_clks_data = NULL,
+	.num_pmc_clks = 0,
+	.has_blink_output = false,
+	.has_single_mmio_aperture = false,
+};
+
 #define TEGRA264_IO_PAD_VCTRL(_id, _offset, _ena_3v3, _ena_1v8)		\
 	((struct tegra_io_pad_vctrl) {					\
 		.id		= (_id),				\
@@ -4785,6 +4943,7 @@ static const struct tegra_pmc_soc tegra264_pmc_soc = {
 
 static const struct of_device_id tegra_pmc_match[] = {
 	{ .compatible = "nvidia,tegra264-pmc", .data = &tegra264_pmc_soc },
+	{ .compatible = "nvidia,tegra238-pmc", .data = &tegra238_pmc_soc },
 	{ .compatible = "nvidia,tegra234-pmc", .data = &tegra234_pmc_soc },
 	{ .compatible = "nvidia,tegra194-pmc", .data = &tegra194_pmc_soc },
 	{ .compatible = "nvidia,tegra186-pmc", .data = &tegra186_pmc_soc },
-- 
2.25.1

