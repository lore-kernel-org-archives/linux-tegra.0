Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010004.outbound.protection.outlook.com [52.101.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CEA37B035;
	Tue,  3 Mar 2026 16:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772553643; cv=fail; b=bPFA9mGdba3bX5TvgPgBh7QxaOBx0THpCDW1ET4abA1dFRzftg6y2kBRrAqJbIlG2QAp+yOoX6cldqXXY7ATSffpWIUSyELDAY+elD2vsm9UqfXGzkJdakojOMa/4WTlLHdi4BtRjzjRoCwgGnRk9fxlfTYkGN8k6jBZuQzXWtg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772553643; c=relaxed/simple;
	bh=ofvyOV3BEB5zGh2hcr9H3VXArYP59G2YefZ6RiOxuhA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GDhluJSo8PRFB4q9pSU+BbRG8SKP9Pel9gwKuxLd41wdqmG9p9Ejtuy5U+3jqIugP06wCQBAYhvbtaC0JbjLFvJ2lK23lmWMJkPAUHc/EmqBzoFsPwNa3lN3Eoz3Rlmr5pSQ+EH80BWsunOSU26cwzDM0Jk8r4UO0jdSCW7gVp4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bBoY/h2g; arc=fail smtp.client-ip=52.101.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bBoY/h2g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J4n6sjfrz+wTPsnj6vI+0ZORh6urF2ptAUMCANDKv1J+YRVGaKZj9qMyQSfRRM3S9Mzwh6/eZYur70KzW1w54R8VWIpMS0QZAiz9biSnBiXj0njpz4kc9zFq4l061xrBzHPFnxxHh7IqtnGArjp6vArmH6JIt058guSp06jkRa6fa85F1bJTM+f0f4CNfdM1tN5qhLQKdGSDEK9SyZbR6yK1T1FgKPvwDkg531C0PLqiw2f7/VmA3A76uUfVWUTL0WFx/t5413/VXfzayfAH+mZZn9Zs3sTrTiNT+jlPoPaiQPcPxfHyCNuog6aHyFIWdIzOKD8v1BDkxgX7mmCqYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tzdCQx4yvc4MJM5JRdOuJEj3Y3sDwzt7ETfiLpd81tY=;
 b=ULCiYqM8i7AGjecxuCJ7TvXoygE5NwJWS8saiICXUthvLFvFxgs1QChospvappI7ffzKtfQ5hWKuO7PcsqHQAE0NnUkL2+u/ySz3bv3P4GNU/BO4xjTqzgAW+RpSBW9xSMwUMPejPQO/p62TjL2eM3cYUf6HrFvS951f8cG4gTr5b1hEJH4tbdzhj/20nr8tv7vfJdGBj5c90H3pIYJUzTie9Vpsz/PTli/ZcAMVVGGv4M/MSA8MAo2wd+/+aZrKFtk2udjN1wv5MxmbcqJ9+apEvueGLIsN3Eqea84P/A5b2Uirc1jYevMyU/8BTVOe9mM+6IHffdyv6R8tsooILA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzdCQx4yvc4MJM5JRdOuJEj3Y3sDwzt7ETfiLpd81tY=;
 b=bBoY/h2gloZfWWaPvf5zbz6NYTAOYuUlrKiDk4JaIuLJWanLQ7VqDgrYxy76WblkGI9bgMfOjXoswfLpMtiHTooP7gERn2dFBfxO7md5Lf4OhowGAqvuMROgTR+izGfvP9k3FlZVy+tcEzj4z81BsHaljcHyh/WOpSm+EjEQNaBJk7cxRbrILky5D9nEZfpXnIeEzU2BgSIiJ8TY1A4a9N23ZkfXpH3+sNuXGaP9UEGX69nIaNN0ZjFQapUBgPNSqTP/rqDaGT+aRD4pO1QVmr5MwBsDBsgD4KeJo89FzFlIJc749JTvEphOQ/NzPv/nAG0CAm8/YQz1q1l8j4XA5Q==
Received: from CH0PR04CA0024.namprd04.prod.outlook.com (2603:10b6:610:76::29)
 by SN7PR12MB8789.namprd12.prod.outlook.com (2603:10b6:806:34b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 16:00:35 +0000
Received: from CH2PEPF00000142.namprd02.prod.outlook.com
 (2603:10b6:610:76:cafe::8e) by CH0PR04CA0024.outlook.office365.com
 (2603:10b6:610:76::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Tue,
 3 Mar 2026 16:00:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH2PEPF00000142.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 16:00:35 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 08:00:14 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 08:00:13 -0800
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 08:00:11 -0800
From: Sumit Gupta <sumitg@nvidia.com>
To: <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [PATCH 2/2] soc/tegra: cbb: Add support for CBB fabrics in Tegra238
Date: Tue, 3 Mar 2026 21:29:27 +0530
Message-ID: <20260303155927.1885297-3-sumitg@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303155927.1885297-1-sumitg@nvidia.com>
References: <20260303155927.1885297-1-sumitg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000142:EE_|SN7PR12MB8789:EE_
X-MS-Office365-Filtering-Correlation-Id: 56f5220e-f5cc-4455-2982-08de793e0184
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	d+GmWNCW4XlezQbpWs+v26X350LPJKkvMnTZYUPRLcwrcOYk87yXrTwvcSTKafPgsSHDzS2wTogKMwvh+8wj3eqbsnhOntnIihYwNq3MeOys8fju7fkZyhytKYCf2MtUFeNJR71NwWchExkVYjg7MdHoNxfo8lF0J68Ck45SOddbfFlEPZRYSvkeM6e0CK4H3chUFx4tD8l1mK0mW7MvMtLP5p7KQm6Kfp6f+6/jDXmB5rFHpz5S1D+snl5zun62Q2Vxm9PxSvqlTbCacBhB5DpHmB9lkEx+XT1cTZK3PbUHa6icc5X4inoLorT47iVI8NPTHAcN9ngL6ID6PGxtW+LQAVpUWIM758qTkfBuhHPvddjEf76cbNv1Wj2dwH/Hh9PWJbK5NlorpUHP/qpncDJQpRBYf0W4CfB+ZOlPq4m3/MXAOqNnsj2/wrUJdaZt+u3Y4yJBajMLBZaIYIVg6viN2z2o6oISpLo4fZPU0sFpVaLymV9QyPMMBbTfOAMMYsjKMtVQj8EO5d13QAeq0z1+3XeZIEnqB31kwANGUuC08wbNOqnPmr83SzRxN5K7iDnO5zHOvKfxvDoe8PWk38kk0x9SKrVIkeGcLNC2JHOsRgPm+J1xzyufkUesnj/99u7O/bq4OFQ/W3VxHKoN7rqVq57vrnYMkCdUM80hDo0XngdFNFTJLbUEN/NVU9rI/FnkxDQngVk4rZYjul4EIEoZzzjZVbn5Ijf1EqzsKf79umjttwB6VdfeQk1Hoo23CazX1iU+u9iN4/QGNe4gkd248/3inrVeKZvmQxhL4X4W3CZ5/mI4SMlTQbCI5gMU4LBCrmdMVi79NOjnoLmhmg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yQlDCiVmg+KGKaSS9JK8p7UkJ/D701wIVSa3YgwtG7ox/zJTf4dKmtfII/TMSi0hAOf+BzObqg1qBwvcpJ7L19AdCffo+r/qT5lmwaV+uswWCVWsaos/iL0b0fdhLscgHSm+uOgQ4AnmkPTk4jzPFWcqqMVHAHi/1gheD/08G8KSWZAVhQM6t94oQsD5zF+hSVjPJjNbHQE7Nni3F1k2ILb6fxjAUtA4c+LHqfQeSrl851DhHSG7kzGbI0RVD13QQWtolshwhAWYmzJtO8XIo1jDW1vuN7YxmDw7Gx449fx3Cjr4TjrWPMlPQwd9Rg/km2ZQzbx2V6or2XZeInkHFgNwMqhRa2gLPXL0JC0OJ+2oPme2MhVCOn6NxU+bZq0JuKhxuF3j7g4xHNO+2ofRmN8htVWNuwT1ZO/3s6fnkS1Dy8K3p1qLjbgRkXI4unUP
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 16:00:35.2228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56f5220e-f5cc-4455-2982-08de793e0184
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8789

Add support for CBB 2.0 based fabrics in Tegra238 SoC using DT.
Fabrics reporting errors are: CBB, AON, BPMP, APE.

Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
---
 drivers/soc/tegra/cbb/tegra234-cbb.c | 134 +++++++++++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/drivers/soc/tegra/cbb/tegra234-cbb.c b/drivers/soc/tegra/cbb/tegra234-cbb.c
index 7e387fc54c6b..fb26f085f691 100644
--- a/drivers/soc/tegra/cbb/tegra234-cbb.c
+++ b/drivers/soc/tegra/cbb/tegra234-cbb.c
@@ -89,6 +89,15 @@ enum tegra234_cbb_fabric_ids {
 	T234_MAX_FABRIC_ID,
 };
 
+enum tegra238_cbb_fabric_ids {
+	T238_CBB_FABRIC_ID  = 0,
+	T238_AON_FABRIC_ID  = 4,
+	T238_PSC_FABRIC_ID  = 5,
+	T238_BPMP_FABRIC_ID = 6,
+	T238_APE_FABRIC_ID  = 7,
+	T238_MAX_FABRIC_ID,
+};
+
 enum tegra264_cbb_fabric_ids {
 	T264_SYSTEM_CBB_FABRIC_ID,
 	T264_TOP_0_CBB_FABRIC_ID,
@@ -999,6 +1008,127 @@ static const struct tegra234_cbb_fabric tegra234_sce_fabric = {
 	.firewall_wr_ctl = 0x288,
 };
 
+static const struct tegra234_target_lookup tegra238_ape_target_map[] = {
+	{ "AXI2APB", 0x00000 },
+	{ "AGIC",    0x15000 },
+	{ "AMC",     0x16000 },
+	{ "AST0",    0x17000 },
+	{ "AST1",    0x18000 },
+	{ "AST2",    0x19000 },
+	{ "CBB",     0x1A000 },
+};
+
+static const struct tegra234_target_lookup tegra238_cbb_target_map[] = {
+	{ "AON",         0x40000 },
+	{ "APE",         0x50000 },
+	{ "BPMP",        0x41000 },
+	{ "HOST1X",      0x43000 },
+	{ "STM",         0x44000 },
+	{ "CBB_CENTRAL", 0x00000 },
+	{ "PCIE_C0",     0x51000 },
+	{ "PCIE_C1",     0x47000 },
+	{ "PCIE_C2",     0x48000 },
+	{ "PCIE_C3",     0x49000 },
+	{ "GPU",         0x4C000 },
+	{ "SMMU0",       0x4D000 },
+	{ "SMMU1",       0x4E000 },
+	{ "SMMU2",       0x4F000 },
+	{ "PSC",         0x52000 },
+	{ "AXI2APB_1",   0x70000 },
+	{ "AXI2APB_12",  0x73000 },
+	{ "AXI2APB_13",  0x74000 },
+	{ "AXI2APB_15",  0x76000 },
+	{ "AXI2APB_16",  0x77000 },
+	{ "AXI2APB_18",  0x79000 },
+	{ "AXI2APB_19",  0x7A000 },
+	{ "AXI2APB_2",   0x7B000 },
+	{ "AXI2APB_23",  0x7F000 },
+	{ "AXI2APB_25",  0x80000 },
+	{ "AXI2APB_26",  0x81000 },
+	{ "AXI2APB_27",  0x82000 },
+	{ "AXI2APB_28",  0x83000 },
+	{ "AXI2APB_32",  0x87000 },
+	{ "AXI2APB_33",  0x88000 },
+	{ "AXI2APB_4",   0x8B000 },
+	{ "AXI2APB_5",   0x8C000 },
+	{ "AXI2APB_6",   0x93000 },
+	{ "AXI2APB_9",   0x90000 },
+	{ "AXI2APB_3",   0x91000 },
+};
+
+static const struct tegra234_fabric_lookup tegra238_cbb_fab_list[] = {
+	[T238_CBB_FABRIC_ID]  = { "cbb-fabric", true,
+				  tegra238_cbb_target_map,
+				  ARRAY_SIZE(tegra238_cbb_target_map) },
+	[T238_AON_FABRIC_ID]  = { "aon-fabric", true,
+				  tegra234_aon_target_map,
+				  ARRAY_SIZE(tegra234_aon_target_map) },
+	[T238_PSC_FABRIC_ID]  = { "psc-fabric" },
+	[T238_BPMP_FABRIC_ID] = { "bpmp-fabric", true,
+				  tegra234_bpmp_target_map,
+				  ARRAY_SIZE(tegra234_bpmp_target_map) },
+	[T238_APE_FABRIC_ID]  = { "ape-fabric", true,
+				  tegra238_ape_target_map,
+				  ARRAY_SIZE(tegra238_ape_target_map) },
+};
+
+static const struct tegra234_cbb_fabric tegra238_aon_fabric = {
+	.fab_id = T238_AON_FABRIC_ID,
+	.fab_list = tegra238_cbb_fab_list,
+	.initiator_id = tegra234_initiator_id,
+	.errors = tegra234_cbb_errors,
+	.max_errors = ARRAY_SIZE(tegra234_cbb_errors),
+	.err_intr_enbl = 0x7,
+	.err_status_clr = 0x3f,
+	.notifier_offset = 0x17000,
+	.firewall_base = 0x30000,
+	.firewall_ctl = 0x8f0,
+	.firewall_wr_ctl = 0x8e8,
+};
+
+static const struct tegra234_cbb_fabric tegra238_ape_fabric = {
+	.fab_id = T238_APE_FABRIC_ID,
+	.fab_list = tegra238_cbb_fab_list,
+	.initiator_id = tegra234_initiator_id,
+	.errors = tegra234_cbb_errors,
+	.max_errors = ARRAY_SIZE(tegra234_cbb_errors),
+	.err_intr_enbl = 0xf,
+	.err_status_clr = 0x3f,
+	.notifier_offset = 0x1E000,
+	.firewall_base = 0x30000,
+	.firewall_ctl = 0xad0,
+	.firewall_wr_ctl = 0xac8,
+};
+
+static const struct tegra234_cbb_fabric tegra238_bpmp_fabric = {
+	.fab_id = T238_BPMP_FABRIC_ID,
+	.fab_list = tegra238_cbb_fab_list,
+	.initiator_id = tegra234_initiator_id,
+	.errors = tegra234_cbb_errors,
+	.max_errors = ARRAY_SIZE(tegra234_cbb_errors),
+	.err_intr_enbl = 0xf,
+	.err_status_clr = 0x3f,
+	.notifier_offset = 0x19000,
+	.firewall_base = 0x30000,
+	.firewall_ctl = 0x8f0,
+	.firewall_wr_ctl = 0x8e8,
+};
+
+static const struct tegra234_cbb_fabric tegra238_cbb_fabric = {
+	.fab_id = T238_CBB_FABRIC_ID,
+	.fab_list = tegra238_cbb_fab_list,
+	.initiator_id = tegra234_initiator_id,
+	.errors = tegra234_cbb_errors,
+	.max_errors = ARRAY_SIZE(tegra234_cbb_errors),
+	.err_intr_enbl = 0x3f,
+	.err_status_clr = 0x3f,
+	.notifier_offset = 0x60000,
+	.off_mask_erd = 0x3d004,
+	.firewall_base = 0x10000,
+	.firewall_ctl = 0x2230,
+	.firewall_wr_ctl = 0x2228,
+};
+
 static const char * const tegra241_initiator_id[] = {
 	[0x0] = "TZ",
 	[0x1] = "CCPLEX",
@@ -1505,6 +1635,10 @@ static const struct of_device_id tegra234_cbb_dt_ids[] = {
 	{ .compatible = "nvidia,tegra234-dce-fabric", .data = &tegra234_dce_fabric },
 	{ .compatible = "nvidia,tegra234-rce-fabric", .data = &tegra234_rce_fabric },
 	{ .compatible = "nvidia,tegra234-sce-fabric", .data = &tegra234_sce_fabric },
+	{ .compatible = "nvidia,tegra238-aon-fabric", .data = &tegra238_aon_fabric },
+	{ .compatible = "nvidia,tegra238-ape-fabric", .data = &tegra238_ape_fabric },
+	{ .compatible = "nvidia,tegra238-bpmp-fabric", .data = &tegra238_bpmp_fabric },
+	{ .compatible = "nvidia,tegra238-cbb-fabric", .data = &tegra238_cbb_fabric },
 	{ .compatible = "nvidia,tegra264-sys-cbb-fabric", .data = &tegra264_sys_cbb_fabric },
 	{ .compatible = "nvidia,tegra264-top0-cbb-fabric", .data = &tegra264_top0_cbb_fabric },
 	{ .compatible = "nvidia,tegra264-uphy0-cbb-fabric", .data = &tegra264_uphy0_cbb_fabric },
-- 
2.34.1

