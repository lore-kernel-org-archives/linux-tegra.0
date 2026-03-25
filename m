Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011053.outbound.protection.outlook.com [52.101.57.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34283559C0
	for <linux-tegra@vger.kernel.org>; Wed, 25 Mar 2026 19:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774466820; cv=fail; b=Thw4b+VZCTNEgc9rQMu4+9tRdpPvbKTp2zfXAaJyvb3+KBA+/EkptC4i7i5iI3Fh7hApOuzxsOOrF0PuoaPo59H34XzZRdEQxClRvkDA3RNhtamkWbsAJnB+AimYeVfaAQqn/B8zu4gaVKfQp6sXk5p1hUamY+v6oMD8LykXLYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774466820; c=relaxed/simple;
	bh=fqETSTchytMEoOb4oTcpjd/dWUQX4uvxOoU+83GhBXQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a/gYbGhGw9aQglrs6/XTiDKy8x7JGUWB1z8CPBxYYbUjnBixR2TMwbYCxBBdQAXFIFY6f12K0cKqbxFIyP0mjZerlf8vp3S8RiH/RHdDs0MKFIkrs9SVjYik22bqDGFOYwaYHigPDwR+6qE3JHdz+w6iyjZMiKUrWuJKeT6QtIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FmBI7erZ; arc=fail smtp.client-ip=52.101.57.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FmBI7erZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RpLtOYDRp5P+oShG3hDncSL9gzoWhUhoV7UaIb6H7hVegFNqjWP/ADv+/wqimbQ9UWl/XiaViK0Sg81FGOqsJFYs1uI/94rUpIpmvdl9oB6Ey5+KKHBvQVtoHID8pILzHTU1CtI9nKlwtqy1rZJsBt26F+LdHUR+Grs0uZL0F6ZHDBMpT7mqV/gCgMncL2HJYsMKGZB8v2y/5Lz/UNnjFvNXNQghmg68P1DSdW1ptGLxPDVntleID8VCPeYcUc8O2fFSeWW3/VOpFf6xwey6O6oQ55Gvy4DfDI/zZ76Ve6dpQ585THR72CU87VI58kQyzidJy/kIMSG1SBs6ZUoCPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aiVfFrZRoE198H5izMTcc0JdtjEtQkGYusErFXdVO8g=;
 b=MTWKlxGieefR1HOb4bP8uWPZv5mSi2YnKRKgfgNBeqax0wjUCZ42ZNaglmFLtFs9mChRhGa+9r7AuhiKfjpusYdhT4FaxJvG2KTpjxc7sOrD523sh9qC2n6QjdsmIv39l16GlurTR5litLA323ahegXegL/vpz2fHPX2/7fcE1+AMIt5vSAR8Y/Pz8FTEaFbMCRoq6BxqvHBGChN1ORNDPVjHPNRWsVneMSoUVH6bNBaf5B0kCFc2jvbn2wsZWwLTstYRs9i9WK9ym3IYXIwSnmvt2SW2m+T17J+PC+1HI4mc9CYJwJOYqxrgNgKNjHSS96DcIdAdrkEZTYndCRtyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aiVfFrZRoE198H5izMTcc0JdtjEtQkGYusErFXdVO8g=;
 b=FmBI7erZ4pk8MrH1rahXw9emtHqTroNlh1CsMz74r9GFN/zhExFaRMxSj5+/GMwKC8v/H+BR+cp7/lYsJLvhYmIpXYyaamDC7nwNp+ywFJ4gvYhVrjfhWz1uUtcqK3RsJQS8AZYUK17DSASIMb2riju31ZONS99wh2B+KhHvhWxROi+Gr4UgTaxNJhUMdz2d/7tPRKvxKhQu7BtEHo+aw8dJ+QUDLaIGqn7/mvw8rIA0KvPSQtMkC/pp1mzCqauMyCqSgjkzdf9RGpXp/dGjVJWIsLC6V+f4xSimO8iB1aCeWEZD6RWT/35cR7u7oPgtSGrh+KZgn1Li9ce0hw0BwA==
Received: from BL1P222CA0028.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::33)
 by MW6PR12MB8949.namprd12.prod.outlook.com (2603:10b6:303:248::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Wed, 25 Mar
 2026 19:26:54 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:208:2c7:cafe::f5) by BL1P222CA0028.outlook.office365.com
 (2603:10b6:208:2c7::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Wed,
 25 Mar 2026 19:26:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 19:26:53 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Mar
 2026 12:26:37 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 25 Mar 2026 12:26:36 -0700
Received: from moonraker.home (10.127.8.14) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Mar 2026 12:26:35 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>
CC: <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 10/10] soc/tegra: pmc: Add IO pads for Tegra264
Date: Wed, 25 Mar 2026 19:26:00 +0000
Message-ID: <20260325192601.239554-11-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325192601.239554-1-jonathanh@nvidia.com>
References: <20260325192601.239554-1-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|MW6PR12MB8949:EE_
X-MS-Office365-Filtering-Correlation-Id: 8519ed5e-5034-4929-ed6e-08de8aa478e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	d26bmSVSmAEJyX12dD/re90tcMpf2ZgZLW81CqxD77HPjk64oo/rHDh3aAPYwnKnjj2MtWrES8WQymINbbw1AFfCu8ftC62t66FeGEGpwgyqdYuCOvGc9eQppKPBLikHoHpT+9bzOET1zVBuNdeyd/yS3oLvLe5Wm7sbC+ms3ErH3ITf74wzB5Q4iFeTCPNpGfnHkzDchcwUG//oLeKsq6t7IdZ3wkJEPTrRm+1RPoULqIZJU1V4oC9KLf/U27j6OznhStVnIgTYvqlW/aivrn9WEUywkvJfwmr25aKP4wLz2SfB35wFfY/28tOK4bHUEEp4R8H6iVYJZK+2jcl2GFpPgIZFIAyRM3V6A+BBhz6mDhlDXeBKaD+vaEvwJH2jgtpVz+z83RUaHGJqvJfvVbFR7vpfqeQV47jtxyMuoQEpZsRdCa1knvR/UNnID9+wZThKhtuZ9VhpbdnSG7yowAfn/skHHZHH1mu55V7tvrOATyQVmMqP3+FeujlrcoTdE6Dq9xfB7HU+JSG7mu9WXYDr6hw27dROgcZrnfAEp6xqzvT6wq8AA0bbrRuOptAN1en2AMzoWbFHJJxIIN3qqoe8PFD+yDLTDi+55GL6viWplEy4pdlpPeM/NZLMALccckubR6xykhmWsUjXGAkQwe8Bi5qTDweuYkgsRScg+9zcExR/0yIOPxLIrLfUJ3VPo16B6gxLG3R3wxrEqvXnubVEv5riWcqcdafxTKPWWMW9HY/UyoP2/VpXuZcG5y/S9QW3087CTiNL6aoBufbRuw==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	3l3bw00WtwqkDMimA5IEW7r5Ox7ytz8zbSFSV/77W6QKLN/gBXF8W9PClPxDJCuzh//kKPc0PH70kJ4xKNsfU8u+AXs5VrSBN2LxHbnEtwaLRVhFSJnPXFR/qKmXYUExGSWUp6vr/pcTkM7nQvcm21YtJxNWLEmsJD/fQSVJe1foeesUXZWXRaIG70NSXEdxy8DPk+34KX/oTLcKvMw4CGSd+pETYnEx++9BMwm0fE9h4j70DmgErEKUVVgyI5wBDOYfeqkxSXVdGxlcafwqV0tjV/vk9OXitzNm45W6fKVGv9HWYAOHGkiDCKCS86geUotfdYQzSjcjcTWhdvtYTLYgdDRRCw3g6mlbzo3Yx/EKCGILuSwlUCyct3MmFJEjaI5BbGC0c8111BplKWqii2nJAaVQENxfofFzmY9uC/wGLyrpKYBH52xrBq5JhKdL
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 19:26:53.8648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8519ed5e-5034-4929-ed6e-08de8aa478e2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8949

Populate the IO pads and pins for Tegra264. Tegra264 has internal 1.8V
and 0.6V regulators that must be enabled when selecting the 1.8V mode
for the sdmmc1-hv IO pad. To support this a new 'ena_1v8' member is
added to the 'tegra_io_pad_vctrl' structure to populate the bits that
need to be set to enable these internal regulators. Although this is
enabling 1.8V (bit 1) and 0.6V (bit 2) regulators, it is simply called
'ena_1v8' because these are both enabled for 1.8V operation. Note that
these internal regulators are disabled when not using 1.8V mode.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 66 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 64 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 6f0808faf4b5..eca56119b381 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -201,6 +201,9 @@
 #define  TEGRA_SMC_PMC_READ	0xaa
 #define  TEGRA_SMC_PMC_WRITE	0xbb
 
+/* Tegra264 and later */
+#define PMC_IMPL_SDMMC1_HV_PADCTL_0	0x41004
+
 struct pmc_clk {
 	struct clk_hw hw;
 	struct tegra_pmc *pmc;
@@ -301,6 +304,7 @@ struct tegra_io_pad_vctrl {
 	enum tegra_io_pad id;
 	unsigned int offset;
 	unsigned int ena_3v3;
+	unsigned int ena_1v8;
 };
 
 struct tegra_pmc_regs {
@@ -1931,11 +1935,18 @@ static int tegra_io_pad_set_voltage(struct tegra_pmc *pmc, enum tegra_io_pad id,
 
 	value = tegra_pmc_readl(pmc, pad->offset);
 
-	if (voltage == TEGRA_IO_PAD_VOLTAGE_1V8)
+	if (voltage == TEGRA_IO_PAD_VOLTAGE_1V8) {
 		value &= ~BIT(pad->ena_3v3);
-	else
+
+		if (pad->ena_1v8)
+			value |= pad->ena_1v8;
+	} else {
 		value |= BIT(pad->ena_3v3);
 
+		if (pad->ena_1v8)
+			value &= ~pad->ena_1v8;
+	}
+
 	tegra_pmc_writel(pmc, value, pad->offset);
 
 	mutex_unlock(&pmc->powergates_lock);
@@ -3724,6 +3735,7 @@ static const u8 tegra124_cpu_powergates[] = {
 		.id		= (_id),				\
 		.offset		= (_offset),				\
 		.ena_3v3	= (_ena_3v3),				\
+		.ena_1v8	= 0,					\
 	})
 
 #define TEGRA_IO_PIN_DESC(_id, _name)	\
@@ -4583,6 +4595,50 @@ static const struct tegra_pmc_soc tegra234_pmc_soc = {
 	.has_single_mmio_aperture = false,
 };
 
+#define TEGRA264_IO_PAD_VCTRL(_id, _offset, _ena_3v3, _ena_1v8)		\
+	((struct tegra_io_pad_vctrl) {					\
+		.id		= (_id),				\
+		.offset		= (_offset),				\
+		.ena_3v3	= (_ena_3v3),				\
+		.ena_1v8	= (_ena_1v8),				\
+	})
+
+static const struct tegra_io_pad_soc tegra264_io_pads[] = {
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIA, 0, 0x41020, 0x41024, "csia"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIB, 1, 0x41020, 0x41024, "csib"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_HDMI_DP0, 0, 0x41050, 0x41054, "hdmi-dp0"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIC, 2, 0x41020, 0x41024, "csic"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSID, 3, 0x41020, 0x41024, "csid"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIE, 4, 0x41020, 0x41024, "csie"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIF, 5, 0x41020, 0x41024, "csif"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_UFS, 4, 0x41040, 0x41044, "ufs0"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_EDP, 0, 0x41028, 0x4102c, "edp"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_SDMMC1, 0, 0x41090, 0x41094, "sdmmc1"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_SDMMC1_HV, UINT_MAX, UINT_MAX, UINT_MAX, "sdmmc1-hv"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIG, 6, 0x41020, 0x41024, "csig"),
+	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIH, 7, 0x41020, 0x41024, "csih"),
+};
+
+static const struct tegra_io_pad_vctrl tegra264_io_pad_vctrls[] = {
+	TEGRA264_IO_PAD_VCTRL(TEGRA_IO_PAD_SDMMC1_HV, PMC_IMPL_SDMMC1_HV_PADCTL_0, 0, 0x6),
+};
+
+static const struct pinctrl_pin_desc tegra264_pin_descs[] = {
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_CSIA, "csia"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_CSIB, "csib"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_HDMI_DP0, "hdmi-dp0"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_CSIC, "csic"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_CSID, "csid"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_CSIE, "csie"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_CSIF, "csif"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_UFS, "ufs0"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_EDP, "edp"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_SDMMC1, "sdmmc1"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_SDMMC1_HV, "sdmmc1-hv"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_CSIG, "csig"),
+	TEGRA_IO_PIN_DESC(TEGRA_IO_PAD_CSIH, "csih"),
+};
+
 static const struct tegra_pmc_regs tegra264_pmc_regs = {
 	.scratch0 = 0x684,
 	.rst_status = 0x4,
@@ -4705,6 +4761,12 @@ static const struct tegra_wake_event tegra264_wake_events[] = {
 
 static const struct tegra_pmc_soc tegra264_pmc_soc = {
 	.has_io_pad_wren = false,
+	.num_io_pads = ARRAY_SIZE(tegra264_io_pads),
+	.io_pads = tegra264_io_pads,
+	.num_io_pad_vctrls = ARRAY_SIZE(tegra264_io_pad_vctrls),
+	.io_pad_vctrls = tegra264_io_pad_vctrls,
+	.num_pin_descs = ARRAY_SIZE(tegra264_pin_descs),
+	.pin_descs = tegra264_pin_descs,
 	.regs = &tegra264_pmc_regs,
 	.init = tegra186_pmc_init,
 	.setup_irq_polarity = tegra186_pmc_setup_irq_polarity,
-- 
2.43.0

