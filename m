Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012041.outbound.protection.outlook.com [52.101.53.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DB03A6B76;
	Tue, 24 Mar 2026 05:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774331958; cv=fail; b=QF/uRUb4MMPl6z/NJ/OMZg7jQBELWvslV+E+zIvt7BzMqyto4qPXbUIQse7cmn1a3GFjGqpWA8aLsI2nUAfUzkYoj+SysLO1NwvuHI6miMX5GG627Pi2oiLyNclQCzbxFTn//Jn7sybAQ6FZVZwZbo+191VaNDwQQabNF21MESE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774331958; c=relaxed/simple;
	bh=fSr1W1ksUSBF1Zw+CBPKCDi2XSXcbiEH63fnGd3bHB0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ViK7xKcBzwHU2omN4coNbUivaeXsK5TQ6YFQczXs77e/zSKin3rRJe+vq+ZFze3kPgy1pRWC9hD9HcFNNz1CJRJW+d2Ab787IIKe4dZtnRgNum8hI2XZ0QeL1XsjVUDPUsn7/YBoqoN3ZesmfF2e2lHHDO/FThAE4f1eCBFuBn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=C7nSc8P0; arc=fail smtp.client-ip=52.101.53.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="C7nSc8P0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hE4uCZI5vfF5krwtvJ0jlXa/qfSSPZhV3z9bHBpmpCDixq6e2wEziwMA0csTDrjPBB+wDWDmlEeA+SK7TLGzqFM6pIrXNpSGA7hV9eAliG8Xitb6/4gO8Uwou8KK5vv0pORUnbNMRsA2839x96qjoA71SszEIP9YecLac5rLu4PxKC4XMqD0t/nfI/T5czgz2p50BusLAC6mtffN+pOSmuoAHLQuSLwlAe08Bg/nc1L3FnzwzivxQtwbSSe7YYkIppPU2QI1jNmcpoZgKyGJh55deijnzm939TcvJ1VlY/x7ata2s8UqbsKLGTy7LXyAe5v/GVG9xCxLCRj3HYgaeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SbHV7wkwCX6UrV3WJ2vDwnjgAvS3VB/pon8S+quAbrw=;
 b=lVqrIB2XOegxD7KJdPU/AFvsyBBO0oFf7nfa7+TX0YKAW8/k40U/UnirzjAfwxYwFad+THtjSWaRVOVWdSKSvvo/cvbzVI8GU+eQGnCqW7hnKBGGNBCZvV+gVQ93EXL5KTnaEL2Tx+lyEjH2s2qF8LxkA+GhDjud+dfUQPUdaaAihL10qNqKTvBIwgHyQayQuSuLayna5jfJ4JEGvB35Bwqs9iSZjMmmC+4uyD1DJ+QfFEaqT2Dt/9THjKcCybLsaP3Xi/FwJixZDA2QnM20oPjH//CPBU/1jkUb4oTI5cToNrpYpIyCrKPtbeZ8UoWT6p348UdjEzx6UxCVscVa2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SbHV7wkwCX6UrV3WJ2vDwnjgAvS3VB/pon8S+quAbrw=;
 b=C7nSc8P0YkoqfURPX86LYmVAMhDAuDbSjlmWTyj6WJXcpocT0wDxyBGfM091XYBvUpo4rGsRF2ZTX7Fns/DHpGlc0aib55a43NYo5P3cHRa/h5JiF5uQh6HiMp03yO9VEH6s/lqbMIDo3qvAoiQsF//2ug6G72nZO56xmIHsjYz4CLF5moAxIbOVjvXymtz1yjpjPq3cgad0P5jJMX1kdFmqVG8py71iqAxSofgkk12JpGz739dyWgvoR+U3F5cESxuA+jvLuP+8E/Iuud/55vn9a/lILc1umLPPWhYv0ks4bJ1oKfw3vvhbF3NkPurxJexJSb751E7SIBf4pF7WWg==
Received: from PH7PR03CA0012.namprd03.prod.outlook.com (2603:10b6:510:339::24)
 by PH0PR12MB5629.namprd12.prod.outlook.com (2603:10b6:510:141::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 05:59:13 +0000
Received: from CY4PEPF0000EE32.namprd05.prod.outlook.com
 (2603:10b6:510:339:cafe::43) by PH7PR03CA0012.outlook.office365.com
 (2603:10b6:510:339::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 05:59:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE32.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 05:59:12 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 22:59:02 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 22:59:02 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Mar 2026 22:58:59 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v10 RESEND 3/3] i2c: tegra: Add support for Tegra410
Date: Tue, 24 Mar 2026 11:28:43 +0530
Message-ID: <20260324055843.549808-4-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324055843.549808-1-kkartik@nvidia.com>
References: <20260324055843.549808-1-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE32:EE_|PH0PR12MB5629:EE_
X-MS-Office365-Filtering-Correlation-Id: bb0cfdc6-16b9-4bc8-6528-08de896a7977
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	nBNoON4RMdg2jmn5lzzZfUgI33AFfJIwrt6RAWRTYYl2NH8jOhY9x9cjvQhbxP5P7urQctMz1jOSOpt7gr1dzfA+Va9rAYtP/JaHUdnIv8hcwJtMPh1TNYdRy2Xz2hKpJHZHGoc476IN7Cvttb1m/I7HQlkugpnZ09oM5Jt+N1MywdcM24jYbibUj73QHnrLJIibjtFxl9a209ARfuHOAZMuk8nO11DXaCfk220TRbmAleHU7b3d4O49Mdn1UiT0/Ttn9p1paZaOcCZFtuaByohOGYEEiZTz+bXWm3/vVbEabRucjI5eO5yVq8EOeGHN+KzCh4K427ihmNB0RCqeZ0ked1lCS3vWW6bBQiQA4vWjqQqtOL7TrPXKy8FYYzCW3rjIFtxcuNVSUWLUjXLN13RqhuluaooPuSoBg8yiuHUWqQQZ6+8deTGVCIF4N8Q8f0uOhad48IYbHkPcSGWaeRrPiwUgyZ1gcKwzyA/U3p0xuQVf/Xa7iDGv8KedKh6PNdJQP+hCMp/EpGvBo46+Ad6gHEV1fUXE1n2IurQT50fpA4k0rQW6Rec8nzZc6fGRBtz8FrhiBpaFOKsZMLaCbGl+SJolUljF9i0qKUrMUdVKhAO9Uy/I33+n3jffX956yqnk9rk282GIHha6Gn/qJM4CTS3t00oCt5opPhGeryUEAfnFUdVxIIa8tFHf+Lsu+ydJfMfw5IlKFBUaB/Ijpf5rEjzVIdUmmn8p98e1HkWDpxLvEljcZ22+/N8HFKhQuZma/0im4D2BGQfEc3awHu2XOhBInrCeurTyqiQuIH/LYPHMXFIgFyHgkrhvzdFY
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iddyEgnCteI6DIWIzo5EOEH6Wwn4RCiluaqCcp0cUEeqA4l0MdDIujIBq3EpWpxUhvombXHIfFsteDdhxhsQgiOC94htlAHUnq7UDT01z4SBuXFj1bIh3ctWbE5I4GHNSdqI87kx2JP0UAo0ckHwkrPl1GxjMQfEt7sPW9MwgST02aJVm7rPKJWt1spnplkR4o6b1BoiqY4hCtzLLxM3dsA2BK9bDb+eFvp3hqidVym1Cr2b/RG3TlhpJ9Ivk3ki3fT05+7QkTKUDxIxcbb2yQSBzjOviX+vXuRNrJZ93GvBofa1/HZk+a1Rg/rg0IN+qzAFoJNvmt2+t2TxZ8y6MJw6CuIWAK3ZUkZZdbU+mghaAZ9dViDHXjnz1eFqP61IF8zrK9UxBponMvMkz2IIVhE1rSmHAh/ycA7y4YhymOwm1doeu3gegZ+HdJx1lo6q
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 05:59:12.9167
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb0cfdc6-16b9-4bc8-6528-08de896a7977
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE32.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5629

Add support for the Tegra410 SoC, which has 4 I2C controllers. The
controllers are feature-equivalent to Tegra264; only the register
offsets differ.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>
---
Changes in v3:
	* Updated timing parameters for Tegra410.
---
 drivers/i2c/busses/i2c-tegra.c | 63 ++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 2950930b5501..9fd5ade774a0 100644
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
@@ -2398,6 +2460,7 @@ static const struct acpi_device_id tegra_i2c_acpi_match[] = {
 	{.id = "NVDA0101", .driver_data = (kernel_ulong_t)&tegra210_i2c_hw},
 	{.id = "NVDA0201", .driver_data = (kernel_ulong_t)&tegra186_i2c_hw},
 	{.id = "NVDA0301", .driver_data = (kernel_ulong_t)&tegra194_i2c_hw},
+	{.id = "NVDA2017", .driver_data = (kernel_ulong_t)&tegra410_i2c_hw},
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, tegra_i2c_acpi_match);
-- 
2.43.0

