Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010047.outbound.protection.outlook.com [52.101.193.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4004218AF;
	Wed, 21 Jan 2026 15:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769009480; cv=fail; b=L7cNY3p6Dpu8QuAuG2sm0I/dfaNmh/ERU/cYNmZ51vR1TLITwLS+WlVceo+FEd9Ri5iMnO9rGlIsoejM6p7LM/y/2BLJ/QQDHxs0UpG4wq0np9Bf2ODiihbhu26rcslRbl4UyCMq/HDQifD3YjCSffVOxweIGCBigd97EidXkWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769009480; c=relaxed/simple;
	bh=55n+AfspH9ZpjwtPE47qkrGgxJRU8jG9SnH866MykQk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ToEiQRy7tCkGlDTxH8CjuKK7A+xC9N5uw+Ffl43TtagtOvUTapeusq86YvfLkcDuxOKr+pTABmTibMGnY35rYopEYPbr4WasoJ/B1NxJTfm/7Xz7wvzviIGnedFG42lFiAnAPWHC/HU0MbnpcLO3c+sk6S1z+VexBR0GUZ2fKck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cyfozQ/r; arc=fail smtp.client-ip=52.101.193.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cyfozQ/r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NqAkxvVBIZGhzpLGGaPMdQ36922XdJqdSNwgHYvOTz9tcjF6XJYKGIoeLbW+PvCmu5VsNZuOl6G9WJYeBWob+/fiqi5rLHLS2tD7PB4dZNsDa7I7xKANdPe3FlVLGO6Rtpxvmdd3x4Mkpya5HbaUTQa17SEcuXxzrqvDNoxPrmGsX3vnCJAwveV+BuOWkg0C22ZhrxWqpjqe+MWk3Oul1FuQ1TtmiTNC3sit4bxaVCvsMyW2KXCi+rxqJy+P8G1ggJwLYNo73uXlYnPJjkWe2SXK+UPwQQ+01HU3tURJHOS55Z0YNRZhr67F8NdD5ej7PqPRwQ4+JggFN+KK5hV9rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JeP8N+4U74LCL1IozxMk+ueXVHALF/l+BffP9S3FspE=;
 b=osLSW4Ii03sahQe2V0KDpYggmMP5evvkXv0rNVk/usRzhTX80IPekK398835gwu0ifCEsmbxszLQl/10WEtCwTId9pfdUsEkLTqFHMP9wDppSYl7nXTFAjwajpdu04TY8nHdEtS8oQWn+NdEoJ8pVxEBfd8Eu3WXIrTvFSEH5jnhD3W1vM0UHchoFLqTvetRMWa9zu3uXUTYYt8hK7lHYOrv7ICb2HRI2E+In8K2yc8xWx0DmmqtAjpzxZbtajGwMEn/UiV7+Sb2G2LCioWnOGKzkJ0Ec2bC4TutFHTUgfoD/88S8UHLvdKcR2/GSsPd7t14eiSL59tYGJCCz2ADIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JeP8N+4U74LCL1IozxMk+ueXVHALF/l+BffP9S3FspE=;
 b=cyfozQ/rpvidYQEBfkxthYVBfIqHBeHzd5pZp+9QWUc6JbFQE5pZhAuIipKjpn0MxuYnDVd9FnxuOUKqL25JrhzC5FJG+ewJWUJrAvAgjss2spkNprAyAfOmoM6hCCcTgIRXQhvlRpF4XtrSXWHoxVHbKbRpFt7ohBREoKCW1TFSy9Bplgjf/emwcd2BkPFbZ812MIDEy3kIw5gjqDpNFHvHquvpfFuXwp+zMvFQgxizyrK9cLK0ww03FHqYeXd3akGrOqXYqvUHRDtR/ZTUq9uXdgS4kRGwvkAYpqVIHx3i0a021+H4ScRiqxEz7FohgfOt9t9ZynlJaRudZu1bXA==
Received: from SJ0PR03CA0194.namprd03.prod.outlook.com (2603:10b6:a03:2ef::19)
 by IA1PR12MB6162.namprd12.prod.outlook.com (2603:10b6:208:3ea::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 15:31:09 +0000
Received: from MWH0EPF000A6732.namprd04.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::f0) by SJ0PR03CA0194.outlook.office365.com
 (2603:10b6:a03:2ef::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 15:31:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000A6732.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 15:31:08 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:30:34 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:30:33 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 07:30:30 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v9 4/4] i2c: tegra: Add support for Tegra410
Date: Wed, 21 Jan 2026 21:00:11 +0530
Message-ID: <20260121153012.92243-5-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260121153012.92243-1-kkartik@nvidia.com>
References: <20260121153012.92243-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6732:EE_|IA1PR12MB6162:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f82bc9f-b0f0-4e23-ee65-08de59021999
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gS4/JYX2LgBXYNevRlRKYbZsDsRD1x+PcV9mnhLFBI2IjXTsw6oYYB6W7pPT?=
 =?us-ascii?Q?jvu4KlTQpUJ/GXTnChFfiLoXbdPqwxcMhHtAyRfFhzvbImQJPakkV3DsrzWo?=
 =?us-ascii?Q?JI+j/x7POih8IFrw1SqJR8nAJ34DJ52MMYVgNNkT01xIyihBZ2Sr2mXLqG58?=
 =?us-ascii?Q?yAmz4/zKWxwsshLtbiXiOEzOWnsaiJM26AFfwgHZYvYYj38iX8S85d561br8?=
 =?us-ascii?Q?Z+0N4u4Vl5VcufqOoaGc2OnuqjNSEXJ1/CaBnyjLAdqddtUfimn71K06gb4I?=
 =?us-ascii?Q?+fQfcCclkALJC9I9ZViAZV2tWyTFRqajq7gzJ0NMB+afzseaicXYm96BXG66?=
 =?us-ascii?Q?pSsdb9fKtoXkK78kwnp4Vpa4XmI7iYhoLQ0Z8M6nMlje2eAXTQNGYNsqNkS9?=
 =?us-ascii?Q?kCO5+iQDRxjK4eL4Z1krszjEJvGKN71EVrqR+n3uqHDT+Y2VyrA2tTxzEqKp?=
 =?us-ascii?Q?DmKE5WR97j4+pp1ocRgcIn0HODIxs2oFOvy7px/o80vkE+zN3k0C5DZ8T1da?=
 =?us-ascii?Q?VtMcJxYNn0XNjyGxQiF9V8VfWNfJzQzfDYFEBpie7wqcGbmDzQIPTJ1L+fAz?=
 =?us-ascii?Q?05uzRIKPief5F8XS7juMloWjh52PJ7vhdbITTiYbRlOtgF98Y5A8TeTcL8/3?=
 =?us-ascii?Q?mBKmDV+Li1//kkuMRZcQV65V+dNh/C63xrYfDLS944UAEuD7oRMnv6RRPO1o?=
 =?us-ascii?Q?M05VHDOvkvokj9nqliLyMkoOdBCoQZ8GWspqwoCYKFb6nSwSjaEjAr02tq2h?=
 =?us-ascii?Q?Q2OPSnaGFW2JoByYawjZEvyJrZcEUEt1r3jo40LiIKshdrtFO9YiB7QdXL+/?=
 =?us-ascii?Q?nbSTgjZgO7FpQ93nBzIdaiFQWy6ogrd9+u3o8XDM+RDJ6s5kjUtu3ihtzHs6?=
 =?us-ascii?Q?/ZWHmy+FuyIXGkcBuss2aZJawOKI+DxfmnHrn7SlvNRbYqn2GH2juB2AnuI6?=
 =?us-ascii?Q?v14SCir44L2Ug5/KAH/cqIq3xxOIMhxAm1ZNuFgby/+VeJNOSHfGAoslVIBs?=
 =?us-ascii?Q?Y+NA+8Gt9CkLjPlio8rJ0x7XbNtuyET876LhQGQh9rLLQAvVF8/Xnj7CRQoD?=
 =?us-ascii?Q?VbbN+Na/UupwEiT/f+IF2kuyCLMQ2BcToJXE6NFUTYTe7i6yrq7AzaQG/xlr?=
 =?us-ascii?Q?w2BIHVppo6jqev6jEAby/QY/7CancsdZ2YSgYAXr7c3KAnt5Eu4mF7fJpyMf?=
 =?us-ascii?Q?z4eo+TldMH5zn8ofmpomeyKhM8siKc1Tx+OgwqPmikkszRuQhhyXhNAdSs4A?=
 =?us-ascii?Q?PhYMIcK8wnhNiDYkS5Zdo10GnQ5g26hsLu7NCYH0/gOA0499Hq4L1cD8lwOM?=
 =?us-ascii?Q?IEAnkH4DqL9omBx/oyOx6dSbbkiNKuTwdJSQOelqpVN8K241IVmmlMlXSHOP?=
 =?us-ascii?Q?pqY8dDOP9KsmvXXA0JLf+V93+PfRthUn68RB+A9MtsPIIriEGQyb1JwA3SOh?=
 =?us-ascii?Q?S6lZh/Va7Rv4sQKBazqFqrl6rP79B/91TKxg1LcFFwn5wIl8j2m/TEMc2Ntz?=
 =?us-ascii?Q?TVgUYIWjUUQX1PE8KA37Qcj642e2eZ9b3wVsrlC6pmQCFgr83V1B+7acengA?=
 =?us-ascii?Q?D4NCR0OccaU8SI7RJCHmfy/L3ycmjO988B+dIT43Ps1FYs+KA2zjqcuWPuWr?=
 =?us-ascii?Q?0zHy3ReER7g8exQQ77JDYMfcVohZdmzK2bSdWUqXXEdfPqZwn3HniRkGH+lO?=
 =?us-ascii?Q?QUywmVbbaOmFMDCpzwVGOApqcmE=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 15:31:08.5940
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f82bc9f-b0f0-4e23-ee65-08de59021999
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6732.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6162

Add support for the Tegra410 SoC, which has 4 I2C controllers. The
controllers are feature-equivalent to Tegra264; only the register
offsets differ.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
Changes in v3:
	* Updated timing parameters for Tegra410.
---
 drivers/i2c/busses/i2c-tegra.c | 63 ++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index d845b8782f4f..3c672f05373c 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -275,6 +275,34 @@ static const struct tegra_i2c_regs tegra264_i2c_regs = {
 	.sw_mutex = 0x0ec,
 };
 
+static const struct tegra_i2c_regs tegra410_i2c_regs = {
+	.cnfg = 0x000,
+	.status = 0x01c,
+	.sl_cnfg = 0x020,
+	.sl_addr1 = 0x02c,
+	.sl_addr2 = 0x030,
+	.tx_fifo = 0x054,
+	.rx_fifo = 0x058,
+	.packet_transfer_status = 0x05c,
+	.fifo_control = 0x060,
+	.fifo_status = 0x064,
+	.int_mask = 0x068,
+	.int_status = 0x06c,
+	.clk_divisor = 0x070,
+	.bus_clear_cnfg = 0x088,
+	.bus_clear_status = 0x08c,
+	.config_load = 0x090,
+	.clken_override = 0x094,
+	.interface_timing_0 = 0x098,
+	.interface_timing_1 = 0x09c,
+	.hs_interface_timing_0 = 0x0a0,
+	.hs_interface_timing_1 = 0x0a4,
+	.master_reset_cntrl = 0x0ac,
+	.mst_fifo_control = 0x0b8,
+	.mst_fifo_status = 0x0bc,
+	.sw_mutex = 0x0f0,
+};
+
 /*
  * msg_end_type: The bus control which needs to be sent at end of transfer.
  * @MSG_END_STOP: Send stop pulse.
@@ -2085,6 +2113,40 @@ static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
 	.regs = &tegra264_i2c_regs,
 };
 
+static const struct tegra_i2c_hw_feature tegra410_i2c_hw = {
+	.has_continue_xfer_support = true,
+	.has_per_pkt_xfer_complete_irq = true,
+	.clk_divisor_hs_mode = 1,
+	.clk_divisor_std_mode = 0x3f,
+	.clk_divisor_fast_mode = 0x2c,
+	.clk_divisor_fast_plus_mode = 0x11,
+	.has_config_load_reg = true,
+	.has_multi_master_mode = true,
+	.has_slcg_override_reg = true,
+	.has_mst_fifo = true,
+	.has_mst_reset = true,
+	.quirks = &tegra194_i2c_quirks,
+	.supports_bus_clear = true,
+	.has_apb_dma = false,
+	.tlow_std_mode = 0x8,
+	.thigh_std_mode = 0x7,
+	.tlow_fast_mode = 0x2,
+	.thigh_fast_mode = 0x2,
+	.tlow_fastplus_mode = 0x2,
+	.thigh_fastplus_mode = 0x2,
+	.tlow_hs_mode = 0x8,
+	.thigh_hs_mode = 0x6,
+	.setup_hold_time_std_mode = 0x08080808,
+	.setup_hold_time_fast_mode = 0x02020202,
+	.setup_hold_time_fastplus_mode = 0x02020202,
+	.setup_hold_time_hs_mode = 0x0b0b0b,
+	.has_interface_timing_reg = true,
+	.enable_hs_mode_support = true,
+	.has_mutex = true,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
+	.regs = &tegra410_i2c_regs,
+};
+
 static const struct of_device_id tegra_i2c_of_match[] = {
 	{ .compatible = "nvidia,tegra264-i2c", .data = &tegra264_i2c_hw, },
 	{ .compatible = "nvidia,tegra256-i2c", .data = &tegra256_i2c_hw, },
@@ -2395,6 +2457,7 @@ static const struct acpi_device_id tegra_i2c_acpi_match[] = {
 	{.id = "NVDA0101", .driver_data = (kernel_ulong_t)&tegra210_i2c_hw},
 	{.id = "NVDA0201", .driver_data = (kernel_ulong_t)&tegra186_i2c_hw},
 	{.id = "NVDA0301", .driver_data = (kernel_ulong_t)&tegra194_i2c_hw},
+	{.id = "NVDA2017", .driver_data = (kernel_ulong_t)&tegra410_i2c_hw},
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, tegra_i2c_acpi_match);
-- 
2.43.0

