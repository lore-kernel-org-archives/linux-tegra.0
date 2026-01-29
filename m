Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011034.outbound.protection.outlook.com [52.101.52.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2EE3803FD;
	Thu, 29 Jan 2026 10:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769682706; cv=fail; b=Gpt2+nu17davsh9ERbH7JhgtgWE5/IjL/IpWkJ6NG15CrV2bSWpWZoZB+Xqgxm/nhhMikVc1Z8P9mze2DBxf3vwKTmCw/SRNnbCKtIe7weLpK8A5CD1eCCqaFxWKicztAOqLlqIg4AhwWfqqAzBj5+adlbwi2P0lxCXstTDGkR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769682706; c=relaxed/simple;
	bh=55n+AfspH9ZpjwtPE47qkrGgxJRU8jG9SnH866MykQk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uxLfWCA07EtL/beAhMP+gFPgAZ/fc6HtU2egTPA7bqFmfQF+n/yyfUszDAgvjy1pjg7A4lOpNwc2EVCK5PjMyonNieP3k1GAkl5OqUYRI9zIAziJguYZCbcuO+5gJH11W40lr4EaKBxIEFb9bByNUAMFEB1N9zI/ykVuc3b42kY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ky9ew3Ys; arc=fail smtp.client-ip=52.101.52.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ky9ew3Ys"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ULi72TrnkLOGyaERuyaTM9GyRCWA0RIJWV4D6D3bTx0xfRWUPgWvnqHDgXfBP8iPQ2RJkS7YrYs1f7sQMPYG6Y4yP8BJvDsIJ2HTwnwSFsvXHChwYVWBLlhAMqqqiVaX/wAfjw5zAq/bzUhsM8lzKyuJ33/EtVsF0uhsR/zX5b64yXOPdf8SVS3Qa0oStP1/FEG2uF3agL9aAJL7mvRLrjQeD8A+P6MlhQouL9bcwcqXnlkyxBd9/z5jQi+5MGkhR3vfJR2x+I8dBe/jkKdsynCDPEc62VRf8M56zEiA0rOqBclMmPttGhH9wrXAULsNhxcSWgsaaN7X4jMeJWlQGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JeP8N+4U74LCL1IozxMk+ueXVHALF/l+BffP9S3FspE=;
 b=mG2AGpyrHLKIK3v22ls51/RTWtr+hWSpw2D6SrJWX/uB/AO7daAsnf2lHNbYRFT5hzOHVw7/yvhvn+HTkw7kEBlbpEGzFDj8G0j9qCnSytE3pDlUpywnzYIAhaRcDw4Ki9TpUz7m7QENbWzyjlmGSvg6v+SUl4uOW+iXRvRyVyULYh+bqToXJtJlNjCGViRB/EKUkGo35xdU0GMyChSKMxLFrtZS6jy6NgHisEmEgXmubXNctQygM1PJ5hliZ1Bq9DqSEo1ORG6zKmyeZzc628BpJ0shpILsf9YtDgNa9LT5eCnfvEuoaQaQhXUP1Ls8aWOJFP1M/21siMZIIo2Vdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JeP8N+4U74LCL1IozxMk+ueXVHALF/l+BffP9S3FspE=;
 b=Ky9ew3YsonobnLOkT7VqNd+pHFAybY7cLDyN89vCmLAkQgEMjAbJ4mGAHCt5jTFjA0r9UN9R/V3Ut/2Il3cK2Nbs0vnM9HFUCbvrodL9YAKH9B8/kL+4nex09q4jZuQjg3KhAM38NzlC/WT5vLZtDCuDJSNzawovHHDeFlTU/p0G5cIC5DqAiIU+cykyuaJ8LJ8rqTSfX59ofX5SchB7AEVLI/mAE7jd6d+vTbpMCJBcUDo804OHqOzQ/pGNJI4Nlm8KYxqi/XMiogIzRsj0KJcKhY+XuwQHNwsz5qaHtXIydRowH1N9GjQrqFUBxt0dTNCk2kN5uc25DYrU6S24kg==
Received: from SJ0PR13CA0082.namprd13.prod.outlook.com (2603:10b6:a03:2c4::27)
 by CY5PR12MB6106.namprd12.prod.outlook.com (2603:10b6:930:29::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 10:31:38 +0000
Received: from SJ1PEPF00001CE2.namprd05.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::5) by SJ0PR13CA0082.outlook.office365.com
 (2603:10b6:a03:2c4::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Thu,
 29 Jan 2026 10:31:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF00001CE2.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 10:31:38 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 02:31:18 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 02:31:17 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 29 Jan 2026 02:31:14 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v10 3/3] i2c: tegra: Add support for Tegra410
Date: Thu, 29 Jan 2026 16:00:43 +0530
Message-ID: <20260129103043.148490-4-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129103043.148490-1-kkartik@nvidia.com>
References: <20260129103043.148490-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE2:EE_|CY5PR12MB6106:EE_
X-MS-Office365-Filtering-Correlation-Id: ff2aff62-0185-4767-716c-08de5f2195e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MRiRVBcL97bs26S98AWfpRirRL5VbA4iG9Iff8MvIi6FH3POGI+vP0LhJFZz?=
 =?us-ascii?Q?abx7t5gbJ23ydCS+nKN3bKeNNbPHP26PvOGA1d7nMKOk19wSpJjHFhdysmLH?=
 =?us-ascii?Q?O7J16tma1+fdl//cpOwo+iBHh1E06TXuVs12xk88lFqtMKyiJHnZlWLVRGbP?=
 =?us-ascii?Q?zMCuIy5D+9hCriPSRx5KwiKTiprnEY2N5LaiHFuYRKtvZFVQUAoBwtizg3WD?=
 =?us-ascii?Q?Var8zDYru6fO2o3VR3t5I/yFIucfc1alPOswV23TNay1TGhLMnWQcIMP7O7y?=
 =?us-ascii?Q?H4umLi5IBTXx8/DesTo8/ibFcUn1+7h/1uLs4Ppd9nOOknxwp69ohMcievrl?=
 =?us-ascii?Q?FvM7EvVfWBM87Dr8TGZx8SuGz4OsVnWeB62XCLbJHMGU0LyYqCbxPknI/CZw?=
 =?us-ascii?Q?hZQT9+EgyMuplKOy+OtXmtQnb2k7xFPUlR9Fy7i6IiHCzCqTl0fXBjnYSlV6?=
 =?us-ascii?Q?Sw8w79K0ULgKbHhClnz7NK5VLDzsRvArHRebVibxuT1NF8/kpBZ49uZZX68G?=
 =?us-ascii?Q?Tmohu6GAifIlSDq/N72u+dPO5YvneKH2K46AMvxrTIJ9rhMFy+AIWemRWfQj?=
 =?us-ascii?Q?vuGKLRUtpjNmBFuHHf5IMYPyIZkb7vExhDSg0Djge3Qh2DenCJ6OzPq5Tv7y?=
 =?us-ascii?Q?/ILi0sFy4C1Q8uLh/ITrVY8E5HXRdsV4amQ33Nu10WXwS85Mf8CK1F4oD6L2?=
 =?us-ascii?Q?mRDI5QAU9E0JcYJsLSiWPl06s+FYJKYNCed0P/7Vn7r+2BTZBjg5tTNBg5RQ?=
 =?us-ascii?Q?BAxA8U2CmTvwJxEvSNWNjQQpeMy7xZM2cXQVe5fusKxYiI9SXF5AE3qModGe?=
 =?us-ascii?Q?nZrj3a1AWg6ppwPpqVuOoU281i/qGQAJcNitsf11fljHbWq4xSKQdTYAdB3j?=
 =?us-ascii?Q?ruxmkoralUePKEw7tTP2XeQSCmrRnve6KkALzLoK+GBjP3p6fbBr4IrVLpDf?=
 =?us-ascii?Q?iO2L+kzmCHXL7+dxVIN6XFf9yyG7rgj5SveNbdI4Y2ls7fY2YBZs1wf+/wi1?=
 =?us-ascii?Q?3gHlM8sYAYsfBHCGBILrWkwPVxmR/+7JwLz+1T+vawhYhl9oYmjktC2R5xFx?=
 =?us-ascii?Q?E0F1GurzFvaNEpZAxe4qSIlc+Z1mfM9JLBq40vKpjHdGmjGufvSGFI11YVg/?=
 =?us-ascii?Q?VFMDnkhOqt/8AKq3TvQzspsoiqoDEX7CWOFSdAkC+F1CxXQtJ8zAIyuFgawD?=
 =?us-ascii?Q?rqek7MpNLgG6qDRBu/5F3gFNL6MV6nKDarGlyuYAXiKreIHy8S8VrMYobALw?=
 =?us-ascii?Q?9AnpuT+QVxSkYVeckpmKuNet7al8f1UatafloTVES+evFA4xFqAQs00cqh/v?=
 =?us-ascii?Q?GXiZIYrYQnQMq0iP36gxCIxhrCtTgCPdbiX8zRz12Te0h2vbzMtjMVZ7LkQz?=
 =?us-ascii?Q?49x/F5mYCM4XIO9UFFMqrlSINE8fNcdjUkOoY4lznSt3M8Fb1XSATvORj8wg?=
 =?us-ascii?Q?YkQkE1Gq3E1GdptZCyV1HdxXa2L4HZUh2WT4GAfNc4EsA8lLuFh4ZlcybDfn?=
 =?us-ascii?Q?vZ6ERzqRfnDyjOG0kiQDftkeljDd+Qi2lkX94OK7l+2wVBM95mXY0wUeDB+R?=
 =?us-ascii?Q?LuW5UBDFnA+XXLdQKtq/urwtJObqw23QPFzGAbeo8ED5bDTDP58CvJp3CQuH?=
 =?us-ascii?Q?P3olKtS6zINY4lyqwq4X4TuYudFV2krL1JcK8t8V7m7twRy2QzhamJ/e/CLG?=
 =?us-ascii?Q?460+9tsUafIBCUEBj4An0YjRPH8=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 10:31:38.6248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff2aff62-0185-4767-716c-08de5f2195e6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6106

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

