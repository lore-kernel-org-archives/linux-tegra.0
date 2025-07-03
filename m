Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF28295524;
	Thu,  3 Jul 2025 10:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751539171; cv=fail; b=P6dMkN6TzAEnz/eOIjqLfzQLYDFKH3P5fnuZg/SroV9KTQZOfRnVFfupUEd1AIUj3+CRiM/wSEnU+vKVRoFubSEhvYg5GLD5ZWAmoXsc6GZE2Xv5JSk4G+n7ItoAoQsd+G2xjMwf/GKEi5aiK1rF29vg22jS4z1n5GSv4zv6dG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751539171; c=relaxed/simple;
	bh=E0LrexQ6elyDeFM39ydkOPBnl8RfXBFw49UjG7/+NG8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E59ZPffr56HWzpCih1HtVar7tvlWYh4flzvQmizAlnTe7w4pL1BWkZdS8p4fFzhQ4T0VEHrDziRdUeogIzid5Bd64kJW+2a2FVVj+Nfcz/ju2XUgRfRlTuiFmKrkeEvzEn++aM5PBUKcWS9ah1DoUrTHYD5vkkmMrKUXrktbhHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sGDfquau; arc=fail smtp.client-ip=40.107.223.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sGDfquau"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wOIRnMd4El1uenq27i2aeRZ+lxe9YMMt/G8CEKwJGZepXbpZP2ywkFc2PGUDPAUOqZE3ZGU4XqUrlqNrZIwYh9hIFT66B8jER11CqKRkVxyChoLqegzm+xllZXbSmg5KULE5fK59M080j3NKlzDRIFa/G3dntS7ACb5vmR1aDiQP8o56K8esPXrVNPg8UfTp2bR3KS6Iu5ze+Duw/32NncZ+icVGdysS4czltftPSccZ5+y8pckPTHTSXs1qzXRXnLwi8Q8JczfvPeDz96pymR0zgcaI7WECqx1k2lF+tzDDPYlptseurPNxndGBFyFd0r78LVGrwGRAXPgdZHydGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gHuX+9BW5f90eIPVpKHQRw8EtbPTwPG7Jq22Lca1Z0=;
 b=vKQeoE8plDWH9v3g4R1+F9L2zTcTwnAv0gPb4j+hnU/9INGLam4vet1g9RhWmGt18Ytn3CTiUtPSqOsGHdCgl0fO4ArJR0uThRjMFVhVkbxYwrX64Sqt3J6i64MFRgcM7Am7QNKG7g1ZAs+CbD/8VTmPA6qx2fzkVXQ3m0uz17HuZSi+9JTstTYvYgnmc0FJSIFv0TUR0Di47pS/Dwjl2yUkO98fPoHk4rPJIHh+0RlZB9xvsognvOtZ6m8UWVlLm0wDOBupldPcPqi+UAB9sTe56qUGGBmAS8zsGN2s690JuVObpZqJaSGhT2ZzQUvjDHa8lF4rQx8gEyc5p9kPHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5gHuX+9BW5f90eIPVpKHQRw8EtbPTwPG7Jq22Lca1Z0=;
 b=sGDfquauKZKQ5Cka4aNf6omnA1ze2nmK62gx4qUFNGvQySeuT56lbMcpHHTQfOvlakRKmmtfC0J7+thdyM2ahhcJqsRQLmE/UI6dttrJeSuXsEyi1D4Lb3fkk/TeuycYPvvVICXP01mBnqU5+bjyZ5ti+ObWpmFRp7DovOtKRE9iIWkxrkjn6BI2oaNzFHHTHQmia38DH637HfRJwkelSWd3UZgSETWXnYtysrAcgS8bq2paVrwF2Z7YBrXHjK6IMIjCLKkurRQRTsWY+Zbm5/uyrElmedWsk5jFW+e0puEMh3DozADVVMB+SyRydUD7dQcn2+Nmv6EQVlq7e7SxUg==
Received: from PH8P221CA0002.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:2d8::27)
 by PH7PR12MB8179.namprd12.prod.outlook.com (2603:10b6:510:2b8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 10:39:23 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:510:2d8:cafe::6c) by PH8P221CA0002.outlook.office365.com
 (2603:10b6:510:2d8::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.22 via Frontend Transport; Thu,
 3 Jul 2025 10:39:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.20 via Frontend Transport; Thu, 3 Jul 2025 10:39:23 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 3 Jul 2025
 03:39:13 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 3 Jul
 2025 03:39:12 -0700
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 3 Jul 2025 03:39:09 -0700
From: Sumit Gupta <sumitg@nvidia.com>
To: <treding@nvidia.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <tbergstrom@nvidia.com>, <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [PATCH v2 8/8] soc: tegra: cbb: add support for cbb fabrics in Tegra254
Date: Thu, 3 Jul 2025 16:08:29 +0530
Message-ID: <20250703103829.1721024-9-sumitg@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250703103829.1721024-1-sumitg@nvidia.com>
References: <20250703103829.1721024-1-sumitg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|PH7PR12MB8179:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a01f69b-0e13-499f-bc4e-08ddba1de03b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4eyjxQ1shADgGaFUBWWY1WPJ1/Gqn7u1Rrs1TgJnLmworLofEUp7xfV6qCwA?=
 =?us-ascii?Q?gz5R3PtV8W9hLfh6Mj2K04g3OnOFcswLJT0Xol8oe0Wf2seBbS/JL8a8j7W3?=
 =?us-ascii?Q?Vk/v0/aEfCp/o4oAjVDNk6DyOizlFumR7Ti1jwX1YWOeMTaEsnL2k452rTq9?=
 =?us-ascii?Q?SvyQS9Y+A+ALWaTMLcJpNQ9aaKVUoDlO13Te0DNtUXo8tDkXbUySKbVN7hJ7?=
 =?us-ascii?Q?mlk9XTcKblagXabgZDEq24BsGL15kvxl5pg0edbofht4W9kvjDMN0Bjsr7so?=
 =?us-ascii?Q?8jKRelGjBvOTlBqfmEJIl+ZmFCl6GqNj3wcKxezyI9vCoi4kA42C2CAE3JLY?=
 =?us-ascii?Q?WlD8k0rOX/K0Im+u3EZugBwMfCOPCbRBWbtSDPr2M9Q3pAwovYjyQVPMD4u8?=
 =?us-ascii?Q?cF7tzvZZelWPxooa7CnBzm5PWEPTk9xMeMOcHDsMt3PVcJz4w3u/OjRn6bcr?=
 =?us-ascii?Q?yCAKaC8GKyVYM4chUCs5EiD8WFrMpbj7pXtbTIupFd59XksLPgV1Ymk+XrMC?=
 =?us-ascii?Q?1cN86tDIt/62wScxh4+MTzUFnPrvuypQHyM5ueqleO91x7vmbQ6ytg07/uci?=
 =?us-ascii?Q?k1Mo/xAEp/eFHCMQZo9NPXwyLBryta0NCb0xq0NMeROcl2sMVbKCYtjfzO9F?=
 =?us-ascii?Q?hCht8cXKY3gs1dMPLjJwjTDRRzWN7UzbwxN/9149NZFN992UrsAPHkY2GT2I?=
 =?us-ascii?Q?7nqMa8ix8WTiHZWSmQqyD+/OuLW26uOcsjVva1rD9s72OKQVGSfgzlRe0SdC?=
 =?us-ascii?Q?8JK2AhFW7vHeIG7ZkpARtDpXptiWmWie6QsaucO9MJoeRMdIDWgDZuld6t/H?=
 =?us-ascii?Q?krKEqy8jWccIsR+cO0Wovh+VsbwLYpu+OrpWdlGawGxHS9WJMIO7Fw8wle//?=
 =?us-ascii?Q?UPU1vlrbWs6DbS2D9p97q6Luwgeu44wwrNWbYfXiTxEAR71T8iy+OteP12UT?=
 =?us-ascii?Q?9lSGWwrh3RsAkdN7FZstxKDcYKY8P0GQMLs70EhRz4JSJCQquPKaH52ZaS64?=
 =?us-ascii?Q?Kg3xu1EAfxSpu/CR/kJ0YkQ4zFTekTGSC34Z54f5aX3jHplx9zrLfVFf2fbN?=
 =?us-ascii?Q?OLak2reiR4iw7VsT/W/VU1mXoOTtqa2y6m9BoCX/09JgfwlCHtPbFkIKZ6+R?=
 =?us-ascii?Q?F4OAmm3v8WQi164shXgVoseQJYx0CtgqdcATJECcDAtSI8NNZmwTeGK+AaSN?=
 =?us-ascii?Q?LfX4pubHAemL+fHmy5J+MCp1WR+4bIYM2ofwf7jyqE6q80cXClPMeEYONDZX?=
 =?us-ascii?Q?hpJed9QWuHf8xPOgwvImIZXkuEx3RNkzFMEIEFFFiOBXGHgxP+vwn4C0o+RX?=
 =?us-ascii?Q?l39q76jDgZkjY6gXhuVzvzh3Xqa51YHDqqPQsR6eRvVhxVj9wwkcINq9bhGK?=
 =?us-ascii?Q?OLHQfyQzc1eSrgVUZ/KXaC6Ru/USb6Rs4PFmdZrlKk3geuaqL/9DXzKkqc2p?=
 =?us-ascii?Q?nIzgqESGobJTATVv/7UA0/Khld8JzIYSvhCF1S+Uz8JU9VbMxUgJYPrlrTES?=
 =?us-ascii?Q?0OVOZ4ESMNz8AYnsS4l8K9azeGvk5N/3w9IT?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 10:39:23.4001
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a01f69b-0e13-499f-bc4e-08ddba1de03b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8179

Add support for CBB 2.0 based fabrics in Tegra254 SoC using ACPI.
Fabrics reporting errors are: C2C, GPU, Display_Cluster.
Tegra254 is using hardware based lookup to get target node address.
So, the target_map tables for each fabric are not needed now.

Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
---
 drivers/soc/tegra/cbb/tegra234-cbb.c | 58 ++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/soc/tegra/cbb/tegra234-cbb.c b/drivers/soc/tegra/cbb/tegra234-cbb.c
index 69c7049386795..a9adbcecd47cc 100644
--- a/drivers/soc/tegra/cbb/tegra234-cbb.c
+++ b/drivers/soc/tegra/cbb/tegra234-cbb.c
@@ -117,6 +117,15 @@ enum tegra264_cbb_fabric_ids {
 	T264_RSVD7_FABRIC_ID,
 };
 
+enum t254_cbb_fabric_ids {
+	T254_DCE_FABRIC_ID             = 19,
+	T254_DISP_CLUSTER_FABRIC_ID    = 25,
+	T254_C2C_FABRIC_ID             = 26,
+	T254_GPU_FABRIC_ID             = 27,
+	T254_DISP_CLUSTER_1_FABRIC_ID  = 28,
+	T254_MAX_FABRIC_ID,
+};
+
 struct tegra234_target_lookup {
 	const char *name;
 	unsigned int offset;
@@ -1418,6 +1427,52 @@ static const struct tegra234_cbb_fabric tegra264_vision_cbb_fabric = {
 	.firewall_wr_ctl = 0x5c8,
 };
 
+static const struct tegra234_fabric_lookup t254_cbb_fab_list[] = {
+	[T254_C2C_FABRIC_ID] = { "c2c-fabric", true },
+	[T254_DISP_CLUSTER_FABRIC_ID] = { "display-cluster-fabric", true },
+	[T254_GPU_FABRIC_ID] = { "gpu-fabric", true },
+};
+
+static const struct tegra234_cbb_fabric t254_c2c_fabric = {
+	.fab_id = T254_C2C_FABRIC_ID,
+	.fab_list = t254_cbb_fab_list,
+	.errors = tegra241_cbb_errors,
+	.max_errors = ARRAY_SIZE(tegra241_cbb_errors),
+	.err_intr_enbl = 0xf,
+	.err_status_clr = 0x1ff007f,
+	.notifier_offset = 0x50000,
+	.off_mask_erd = 0x14004,
+	.firewall_base = 0x40000,
+	.firewall_ctl = 0x9b0,
+	.firewall_wr_ctl = 0x9a8,
+};
+
+static const struct tegra234_cbb_fabric t254_disp_fabric = {
+	.fab_id = T254_DISP_CLUSTER_FABRIC_ID,
+	.fab_list = t254_cbb_fab_list,
+	.errors = tegra241_cbb_errors,
+	.max_errors = ARRAY_SIZE(tegra241_cbb_errors),
+	.err_intr_enbl = 0x1,
+	.err_status_clr = 0x1ff007f,
+	.notifier_offset = 0x50000,
+	.firewall_base = 0x30000,
+	.firewall_ctl = 0x810,
+	.firewall_wr_ctl = 0x808,
+};
+
+static const struct tegra234_cbb_fabric t254_gpu_fabric = {
+	.fab_id = T254_GPU_FABRIC_ID,
+	.fab_list = t254_cbb_fab_list,
+	.errors = tegra241_cbb_errors,
+	.max_errors = ARRAY_SIZE(tegra241_cbb_errors),
+	.err_intr_enbl = 0x1f,
+	.err_status_clr = 0x1ff007f,
+	.notifier_offset = 0x50000,
+	.firewall_base = 0x30000,
+	.firewall_ctl = 0x930,
+	.firewall_wr_ctl = 0x928,
+};
+
 static const struct of_device_id tegra234_cbb_dt_ids[] = {
 	{ .compatible = "nvidia,tegra234-cbb-fabric", .data = &tegra234_cbb_fabric },
 	{ .compatible = "nvidia,tegra234-aon-fabric", .data = &tegra234_aon_fabric },
@@ -1442,6 +1497,9 @@ struct tegra234_cbb_acpi_uid {
 static const struct tegra234_cbb_acpi_uid tegra234_cbb_acpi_uids[] = {
 	{ "NVDA1070", "1", &tegra241_cbb_fabric },
 	{ "NVDA1070", "2", &tegra241_bpmp_fabric },
+	{ "NVDA1070", "3", &t254_c2c_fabric },
+	{ "NVDA1070", "4", &t254_disp_fabric },
+	{ "NVDA1070", "5", &t254_gpu_fabric },
 	{ },
 };
 
-- 
2.34.1

