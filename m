Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011040.outbound.protection.outlook.com [52.101.52.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8DE5275B15;
	Thu, 14 May 2026 12:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778762979; cv=fail; b=K9Bk7NC4JBIEwGNjRKYt2GozQ/GZG/tx0YbQmzdc/uvbb+iQG5EGfe0WwhhxZNnmDtieTuhpXthKfuHe/vTOG7/gpQ2YVWLSxQz8i4zwmYdUf6XPKCgESyXcSzxAe+TVGOk4ln0ahlKvnriaxexkRZRTdjFDQS8N8Nwohpm3h84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778762979; c=relaxed/simple;
	bh=9A+3iHHU/ZOAAtVZRIVsUJ9jirq2UtYvPi7C5sPGnPw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kEgpWjXNJZIqCnwM9hRKjiB22QLZyyPNgvd20zhwQTAHWnt46hCUt+deLhcmvuVPAJMWV/HFZjgASd1ql0IdWBTbhkDTJksiwSVSDnypHfDFDJPSDBDLOCX585LojP8LO7aInf54PtBg+ebIK5sbJX3oASOR887qsD8aSCuGDl8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GQGPZpd2; arc=fail smtp.client-ip=52.101.52.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GQGPZpd2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WZeXJL6K5J1Gdf+WPwxYDanFxdDdt+z0m/KgNUB2EStYQkS+uX1+RKXYp0r4B0aOh2X8to6n9uft+72vkRzP8ETJCaJGY5Wt7f7Ywb9nBG6wI82m5YyzTEOEIlV1eW7kybLMblmBdJm4HQ6zslzGG467FXJeMCIBP0rvRaovH91fcq7AvQk6+zK7YlQpcWZCxnUfiWr4j9xNrhyZ3CdHc0ctPwlTbRfobk7f+L8q/wePqNnv60X3GEnTAeI+s8WhIa+w7grcS3CfQBw3gzWFX/Fqwurxgc6/iU547yrXj9bxZVujxsgzWvEiR2PZt9lUdZskRXYKve+5JtFY6FU69w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ceZvsLbWdxjR96PNHbkgqThROMwhS7nmA88CUkFbhPc=;
 b=kbq6iuiomy+sapG2SdV93v1o4m8Wh4NXrwtj8cY+hbK0k9d7VUeuolHrGKfcYO3bpw12MXJ2ZS3sOAMrmvBJf4te1PlXYy31XVqx6vPzm+hr3ABgLZGr+XbnZFfGZXNEBD8w2yuf8seriN6IJVvV3Z3MNrfNHJnnvCMutWt8diuTECgn563gOUr4UU2HLqBplZXnVxG+cdFVqXScQ0lA9atqP7cHsqdq4z5SUCbqJcGhgXHzFoDdXJduU+RykUvXJMB3VEihdV37Edv+PCDZ5+/5d27sPjG2qt8Sk8Tta2d3RfRpJG1TntXekzpztFnlJkx9N0MoLM418vQL5ckcLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ceZvsLbWdxjR96PNHbkgqThROMwhS7nmA88CUkFbhPc=;
 b=GQGPZpd2vibrrSivWzmsk6l4FZV6jc//NE9AlZBXb5gMQKgF5HbrFx+sMZbIhg0PaJEhw9V2RAQxXCZYmnQ3Tgt9xtsRTMXBMgtEZFeZ9SCJ5VUA2J7xJPa0r/lCgY3lI4H/OlFZGYJUCES5WA8A9f8dv7xI9YiacT4bFCClBcmDI81S3j82Bl6/S3VLJz+Xb14QmaDO2LSkZBbForemJFbViqpqTjFwnFmStGahOvyGfClvhKN2xoNUR9pbW5pAwOyk7JM3R0Z+uFRvDb3rPQRulwX/8PWAucWbt+/ogmMSiapYDZB/uUUOhBy0rXiyoymiF8rRPfy9smzLs2F2KQ==
Received: from BYAPR02CA0007.namprd02.prod.outlook.com (2603:10b6:a02:ee::20)
 by DM4PR12MB6615.namprd12.prod.outlook.com (2603:10b6:8:8d::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.18; Thu, 14 May 2026 12:49:30 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:a02:ee:cafe::ab) by BYAPR02CA0007.outlook.office365.com
 (2603:10b6:a02:ee::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.19 via Frontend Transport; Thu, 14
 May 2026 12:49:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Thu, 14 May 2026 12:49:29 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 14 May
 2026 05:49:13 -0700
Received: from build-pshete-focal-20260330.internal (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 14 May 2026 05:49:12 -0700
From: Prathamesh Shete <pshete@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
CC: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
	<jonathanh@nvidia.com>, Prathamesh Shete <pshete@nvidia.com>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] soc/tegra: pmc: Add Tegra238 support
Date: Thu, 14 May 2026 12:48:56 +0000
Message-ID: <20260514124856.108606-2-pshete@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260514124856.108606-1-pshete@nvidia.com>
References: <20260514124856.108606-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|DM4PR12MB6615:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f52b9da-06b1-4d21-e31e-08deb1b73d58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|56012099003|22082099003|18002099003|11063799003|3023799003;
X-Microsoft-Antispam-Message-Info:
	z9ySoq35P28RbGvr5GcKdljSFnlOGbI9sGfa1fPAJwxBwcwO5JIHPrKOT5HJng0b+murzwVbfKDCaqlis+usCvhr1wD+/muKf2dxECH5zFVeSQOcR/TqpqCfA/ChGxkxkDsD8IuPITIsqUCPuel5bCF18ksRrTh6FmL6TedldNh03vlJm/tB35hBauUM7ee1SQzDxK9yrglK1RPEVxk+e0GN57gqera9vCnCZfqUjAlpiE4HPOCWZ4N3iv3we92H7J8sZl3vk3fotra6YRHb+Y23J8P9UGyRItiWBqMQadEK/xfwcgotbyenLqQVZX/Fu71SuAdTIqV8BG82nCKgtf+tSuYyfJMcIh4l6D6yRnaTybL5/L+9pH4/LjqcrZwVOmfNe5h+fys59Nf+YFyeQbe/HErt1vNBZXOCbMVF1tq4RT/oEDMiu76zCtaKfCqTTT0IHX+kxHuRRki8+zLQ8V7kmv1rD4wJG4l1E8ZxBMF24goR1nbpWcpLTnsEr8EBoxiKCvJbUdHvYJxqKz4llIJFCDE1uFw3HeGuY2wcBfF8/ZsFjgnanwzLC7jjlu8maYiM/IyyDRnNc/pGOc4wQBN7b8vqjxm240ZMTxrvu7+fWTI+/EFA+eMNaDkIEE2VKCmVXf9ptsuZIe64vJmrm7S5mrwI1AMUBwQNRCOtUqRiUjRHan2wRPF/gVV/YjWRVPfU+K2Rh/yEYf+reK8l3NIReA7swQEpEanNw0bqxYI=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(56012099003)(22082099003)(18002099003)(11063799003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Dhud7fJSyi4b3sljcylb/cprs3xn4fgMJNwDOF4D9CtCRrWQ6QZQugrGJH6FWXgMMID5fJwcgquqYwgNE8EbbpSzAYTwqWtFfD7WikRvJ3CJWj5yGmmnQYA7Mjz94OpVtxWGvWgJmGW81HKYOJm1MEjkwi+NbGGMsakDpjwPge6RpoFE1SKlQgsZrVeDh3c0BELkL3cl3pp10jDQ/S5gNOU2X2SjhiPsHsrJl6iumO0R5gT9ItmqyS8nkJA4zE0aJnlIfhBR7/PHnFrqSiZAfqwhamOnOXfFh+PlkQjqVNKL8Ufpg0nWL/+hhSsh15lf+VcVwd9gRVqNCfrQPD7DzboFHrxr96zlSu/rMzlJdbJL2JPK9QWlafMBSNGjiUWaUskuzPM7UBW5zHOzEdpwcdS3dHPx+m4A2xwxiBnLjtfGhqsR5w+OGtNOBxCjraNz
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 12:49:29.9029
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f52b9da-06b1-4d21-e31e-08deb1b73d58
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6615

The Tegra238 PMC is largely similar to that found on earlier chips, but
not completely compatible. Add support for the PMC on Tegra238.

Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 151 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 151 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 2ee6539d796a..4724b98fb1b1 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -4595,6 +4595,156 @@ static const struct tegra_pmc_soc tegra234_pmc_soc = {
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
@@ -4785,6 +4935,7 @@ static const struct tegra_pmc_soc tegra264_pmc_soc = {
 
 static const struct of_device_id tegra_pmc_match[] = {
 	{ .compatible = "nvidia,tegra264-pmc", .data = &tegra264_pmc_soc },
+	{ .compatible = "nvidia,tegra238-pmc", .data = &tegra238_pmc_soc },
 	{ .compatible = "nvidia,tegra234-pmc", .data = &tegra234_pmc_soc },
 	{ .compatible = "nvidia,tegra194-pmc", .data = &tegra194_pmc_soc },
 	{ .compatible = "nvidia,tegra186-pmc", .data = &tegra186_pmc_soc },
-- 
2.25.1

