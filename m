Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012012.outbound.protection.outlook.com [52.101.43.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AD13806CA;
	Thu, 29 Jan 2026 10:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769682697; cv=fail; b=pHy8JysePgdTDR7bfDc25KWOkc6C4x2vBt1Z8ajrUrEl5AFYr0TyujDBdS8ZP/tC7wXRQE20aFo/Yp0Tww3HJJw12Zl/0n9zOcJgU986wK1pFFC1VyG7HhZT4RyC5J7UzbRMQxH5+F8pADjr+NTF2vtBmSF5935armWY36PI/dw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769682697; c=relaxed/simple;
	bh=PwuAbrpzNH/UsP5sAvw17JaEHQrtUrLM8hXnHgDyQss=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dhV52xEQewqAnPljl74TdeLJlNNTmbkdQx1ctYFSDzn6LpCetgBG0FJnepjREXAxeQQpdEjA+JT3Vgn66NoWmH7T77uctGvKN32c9FUjbCgGqp62qJ8158IgRN9sQviZLEAfN9LxM2G4dYKsBG6dCuWJRYlhcKCvAPnpd4xCa50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fcVc0M2c; arc=fail smtp.client-ip=52.101.43.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fcVc0M2c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BT/Nx5xZyunf2UGpy1cYUjDfFUODja0ScDgJeOcScdsowwynUcV5PmfNGQkWjnO6UvP6PJn3ojBrGj0Zgh2j7JQq7/VeQydoFOZu+erAKktQjSoW3YcxwNVCg7KQFvxP/vAo2GzcxK5pBzuJfG3AtgK8B0LQMo86BdzDAGVuG7b54yYk6STiyDEvJTlvOa/dFJjncTNgI/sUAcWnzYODtdhr/x2SsviziEqAp4QAV98ibR4iln2JALv80PqcwrGPHnOBZTAoGxhXiPWGi1UWpZUMzc/IvMupLUcjP6xcmv2V4PLZ+PkmXFqGv0/2pKhzT6CNmOFIOJhYOzH0J9xIDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CfoeOCz9mvBIindMbYAWBdiPplHPTKcmkUQE1aZD+BQ=;
 b=cICIThQPco+mo64tWmqF0GnzxP2AYmA8LX1d5LxfXTH/CcdWx3aM77M1hRI+9+Nq8g+PVJ4nocJur6C8vIMHt8RMxCuD0pETdz+tmH5AX8ZYTfX1gUg6uelg/lkl+YcMAbrsRU0ScIS7uopESGx++Q53wQhVfcbaBML3+72fQYs8caAF7gQHm4/pNKC+tEl3pt/uQTofSiixJFGlsY01LOfkiOBjYevLRxsUDft6eoxSrc23zpYAC5toRMMN0WykHKF2l/bkXIPhf6wRQZjTMXkn/qcIv1UtkTl9Bs6KjWEMSe7YDOZizDgt4/FjKMwRQ2ocJiTb+TEL+dkw1xbJiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CfoeOCz9mvBIindMbYAWBdiPplHPTKcmkUQE1aZD+BQ=;
 b=fcVc0M2cdt0V/OA4mryhTuLTR62+tA17I59cQau0MRxArNX4mmQisJVFYxrxgZ5/ahyB26bq8foFivcSokcf8HrUGZZ31zCw9Z9ExMspkiGeQIuKa8SoncAXuy8Cz+RP9Dj/UKvGO6oRGHItyIPZPmhhq32EGiX61yhMiQIDcljQ8CbbxlTOf4oVn1As0JREbppzE8Cr0syRscV4FblF5IEqYih7T+GJnf2n28P93hFiSRM1HTnzvkXP1WZWUfagGigX15daHAahSAzOUZAOtow3KW/e7gQ7FpHwnfEmw/YpDkwbYB3l2EkdCzK/WS829AWWplqufzlzNtjbw7wANA==
Received: from BY5PR17CA0046.namprd17.prod.outlook.com (2603:10b6:a03:167::23)
 by BN7PPF0D942FA9A.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6c7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Thu, 29 Jan
 2026 10:31:31 +0000
Received: from MWH0EPF000989E8.namprd02.prod.outlook.com
 (2603:10b6:a03:167:cafe::39) by BY5PR17CA0046.outlook.office365.com
 (2603:10b6:a03:167::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.8 via Frontend Transport; Thu,
 29 Jan 2026 10:31:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000989E8.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 29 Jan 2026 10:31:30 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 02:31:10 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 02:31:09 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 29 Jan 2026 02:31:06 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v10 1/3] i2c: tegra: Introduce tegra_i2c_variant to identify DVC and VI
Date: Thu, 29 Jan 2026 16:00:41 +0530
Message-ID: <20260129103043.148490-2-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E8:EE_|BN7PPF0D942FA9A:EE_
X-MS-Office365-Filtering-Correlation-Id: d8d38434-28f3-46e5-bda9-08de5f219127
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TsTp4gdd181EriVVKqUA5QMbkZj9TIGVODdAeI5X2sLG7DM2S2xOO0ZQvZQg?=
 =?us-ascii?Q?t4QxIMBD7GnHbg9i+BZtGcKf/77pVHb3qtb2aZwE10qhy40Oo4XStSDUMV7D?=
 =?us-ascii?Q?6vdjajKaMTOrkNbibuRueFKfU4iX85/LF2x4NFfV1h8Uy15S/nLc2VTrXNlg?=
 =?us-ascii?Q?kMqM6WK/iPFU4pzn7GzaUlLXspiDdhPCNB5LhD1si/1nnq5jdekbXLZU++28?=
 =?us-ascii?Q?lYuiXe9f6uQQNzntudbCCj2qAPttu3rQsI4DlgNSXJJxmEan3ZL6gHoTec0H?=
 =?us-ascii?Q?fLRq+YprHPcfURz7n9Rxv7QnM/NwMR05QJrQFSDOgBQrXWdrKOmE3Bhj8uz+?=
 =?us-ascii?Q?4E8c+jVK+AI8vMOPyjyU/2SobSH/qoE9CHbSAwu11JFUZmPn4MDpuny/+rCV?=
 =?us-ascii?Q?7TCFvXxirPRAA6Wat/dzGFMWeJS5CVT7M14mjrfwe2Ji6P0Ylo9cpjTAvx3X?=
 =?us-ascii?Q?TLyq4bebVq5XCvx1RfsAnP9qVVo0klIChRMPR3yo0oluhET+NZRsGcJBG1Oo?=
 =?us-ascii?Q?NNiWg1k0dkbrnWGcU1WgqUqU6V9fuHUa8j9MqbNH7AIg7Il7mbVOhcH+yEgs?=
 =?us-ascii?Q?4iQmzSTBZgbmx+ALN3L6F/NBYxe8nV1j/qcDDBpHBP5Zx/9uM3fPOm4TX4hE?=
 =?us-ascii?Q?DWN0xttH+AlAD1+wt3UoIDcbafzXA5n4uQt/5+1iSOd/So3+/hKCUtGwbQSz?=
 =?us-ascii?Q?rYvWqxpueu3Nl0O+nUZE6KXgT0rYJZcZL1t2UKjLx34WHcy38YE6mTUZuuHu?=
 =?us-ascii?Q?LTk04VPihLoToVOgqtT9lN9g4XyA5D6OVBue+/mT8U+SQpvhoOyVxqH+7mPu?=
 =?us-ascii?Q?hvO7sDSxIBUGi68bP3i1P+udKukyW+De/IWyrVvQoYNBb0JuCCgIKN8+fi+Z?=
 =?us-ascii?Q?qzJQKurssArISMgdyjvuFrAQN8LPmfw4tsI6n1Rwvi5hJ4efA4dCWjvpXHUh?=
 =?us-ascii?Q?84KPcy2xTg/p9xq9JyCh2ZLwkh/xrCcikFmtbbos1TG2xMVOonAp2xxeiYfu?=
 =?us-ascii?Q?e0bQ3JeHzNFloC02ko10YWdlI8pqeSTkIk9S9UJ/PaRLziC57/pkso5iGkLF?=
 =?us-ascii?Q?8Nl49lnqOuKb09HSL1NrNgIIYfkRAuStJNbmAb+vHyqqkbzetui71EOJfl06?=
 =?us-ascii?Q?66OjqbYV+7mBSOqjueLJHcevaqiYzk1+69IHcG2oCSmOqwuUXez9XgdrZjQs?=
 =?us-ascii?Q?C0p8LnFCQxQXG3D26A9jvMf9oOumjVicmtC0/J0lexaa3oR7pmHnL6Rof7wk?=
 =?us-ascii?Q?epYExPuion/lpi1vXe1zVwuwyD5VeGcExTqUt7pXj/ODJdNt7IllYkrh/kop?=
 =?us-ascii?Q?rKaBCkIu9MClg2t7xJlF9NoWOvxev6r5IRF4PrhI+gpeoYc1AmG7Ko8qLspf?=
 =?us-ascii?Q?0aPzniKJNhOZlzpZ06PMMcOAJPuT3ZAEriPjRrCbySaCbS2NlS4z3v1DvKqJ?=
 =?us-ascii?Q?sHJZMHIOXS4qjFPKDMEfz6CwjRksT9G8daBybmTUCI4mMAibasc6I7VaZzna?=
 =?us-ascii?Q?7rHj+fI7oIkqtTLQ7dgfwnCNYA5gwVUIaA9X37tn6ELSh0A3u1YtwWc8ATsJ?=
 =?us-ascii?Q?iv09fRY2EK3SZNuLKrSFertrkfMZHRr9E4oNVilwlKf646+55pWLCisM/j0Z?=
 =?us-ascii?Q?ZXfRZUFn6qDjD2vryPpJIcsf+jkfUelwgiXp0JujfwVMIgCFOlF578Y3D1b/?=
 =?us-ascii?Q?WWKW2lEXHxwYcEIz/27Cr5DmbbY=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 10:31:30.5641
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8d38434-28f3-46e5-bda9-08de5f219127
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF0D942FA9A

Replace the per-instance DVC/VI boolean flags with a tegra_i2c_variant
enum and move the variant field into tegra_i2c_hw_feature so it is
populated via SoC match data.

Add dedicated SoC data entries for the "nvidia,tegra20-i2c-dvc" and
"nvidia,tegra210-i2c-vi" compatibles and drop compatible-string checks
from tegra_i2c_parse_dt.

Suggested-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
Changes in v10:
	* Suqashed "i2c: tegra: Move variant to tegra_i2c_hw_feature"
	  with this patch.
---
 drivers/i2c/busses/i2c-tegra.c | 112 ++++++++++++++++++++++++++++-----
 1 file changed, 95 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index bec619b9af4e..2ef5fba66b0f 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -171,6 +171,18 @@ enum msg_end_type {
 	MSG_END_CONTINUE,
 };
 
+/*
+ * tegra_i2c_variant: Identifies the variant of I2C controller.
+ * @TEGRA_I2C_VARIANT_DEFAULT: Identifies the default I2C controller.
+ * @TEGRA_I2C_VARIANT_DVC: Identifies the DVC I2C controller, has a different register layout.
+ * @TEGRA_I2C_VARIANT_VI: Identifies the VI I2C controller, has a different register layout.
+ */
+enum tegra_i2c_variant {
+	TEGRA_I2C_VARIANT_DEFAULT,
+	TEGRA_I2C_VARIANT_DVC,
+	TEGRA_I2C_VARIANT_VI,
+};
+
 /**
  * struct tegra_i2c_hw_feature : per hardware generation features
  * @has_continue_xfer_support: continue-transfer supported
@@ -223,6 +235,7 @@ enum msg_end_type {
  *		timing settings.
  * @enable_hs_mode_support: Enable support for high speed (HS) mode transfers.
  * @has_mutex: Has mutex register for mutual exclusion with other firmwares or VMs.
+ * @variant: This represents the I2C controller variant.
  */
 struct tegra_i2c_hw_feature {
 	bool has_continue_xfer_support;
@@ -254,6 +267,7 @@ struct tegra_i2c_hw_feature {
 	bool has_interface_timing_reg;
 	bool enable_hs_mode_support;
 	bool has_mutex;
+	enum tegra_i2c_variant variant;
 };
 
 /**
@@ -268,8 +282,6 @@ struct tegra_i2c_hw_feature {
  * @base_phys: physical base address of the I2C controller
  * @cont_id: I2C controller ID, used for packet header
  * @irq: IRQ number of transfer complete interrupt
- * @is_dvc: identifies the DVC I2C controller, has a different register layout
- * @is_vi: identifies the VI I2C controller, has a different register layout
  * @msg_complete: transfer completion notifier
  * @msg_buf_remaining: size of unsent data in the message buffer
  * @msg_len: length of message in current transfer
@@ -321,12 +333,12 @@ struct tegra_i2c_dev {
 	bool atomic_mode;
 	bool dma_mode;
 	bool msg_read;
-	bool is_dvc;
-	bool is_vi;
 };
 
-#define IS_DVC(dev) (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) && (dev)->is_dvc)
-#define IS_VI(dev)  (IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC) && (dev)->is_vi)
+#define IS_DVC(dev) (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) && \
+		     (dev)->hw->variant == TEGRA_I2C_VARIANT_DVC)
+#define IS_VI(dev)  (IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC) && \
+		     (dev)->hw->variant == TEGRA_I2C_VARIANT_VI)
 
 static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
 		       unsigned int reg)
@@ -1635,7 +1647,41 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.has_interface_timing_reg = false,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
+};
+
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC)
+static const struct tegra_i2c_hw_feature tegra20_dvc_i2c_hw = {
+	.has_continue_xfer_support = false,
+	.has_per_pkt_xfer_complete_irq = false,
+	.clk_divisor_hs_mode = 3,
+	.clk_divisor_std_mode = 0,
+	.clk_divisor_fast_mode = 0,
+	.clk_divisor_fast_plus_mode = 0,
+	.has_config_load_reg = false,
+	.has_multi_master_mode = false,
+	.has_slcg_override_reg = false,
+	.has_mst_fifo = false,
+	.has_mst_reset = false,
+	.quirks = &tegra_i2c_quirks,
+	.supports_bus_clear = false,
+	.has_apb_dma = true,
+	.tlow_std_mode = 0x4,
+	.thigh_std_mode = 0x2,
+	.tlow_fast_mode = 0x4,
+	.thigh_fast_mode = 0x2,
+	.tlow_fastplus_mode = 0x4,
+	.thigh_fastplus_mode = 0x2,
+	.setup_hold_time_std_mode = 0x0,
+	.setup_hold_time_fast_mode = 0x0,
+	.setup_hold_time_fastplus_mode = 0x0,
+	.setup_hold_time_hs_mode = 0x0,
+	.has_interface_timing_reg = false,
+	.enable_hs_mode_support = false,
+	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DVC,
 };
+#endif
 
 static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.has_continue_xfer_support = true,
@@ -1665,6 +1711,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.has_interface_timing_reg = false,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
@@ -1695,6 +1742,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.has_interface_timing_reg = false,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
@@ -1725,6 +1773,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
@@ -1755,7 +1804,41 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
+};
+
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
+static const struct tegra_i2c_hw_feature tegra210_vi_i2c_hw = {
+	.has_continue_xfer_support = true,
+	.has_per_pkt_xfer_complete_irq = true,
+	.clk_divisor_hs_mode = 1,
+	.clk_divisor_std_mode = 0x19,
+	.clk_divisor_fast_mode = 0x19,
+	.clk_divisor_fast_plus_mode = 0x10,
+	.has_config_load_reg = true,
+	.has_multi_master_mode = false,
+	.has_slcg_override_reg = true,
+	.has_mst_fifo = false,
+	.has_mst_reset = false,
+	.quirks = &tegra_i2c_quirks,
+	.supports_bus_clear = true,
+	.has_apb_dma = true,
+	.tlow_std_mode = 0x4,
+	.thigh_std_mode = 0x2,
+	.tlow_fast_mode = 0x4,
+	.thigh_fast_mode = 0x2,
+	.tlow_fastplus_mode = 0x4,
+	.thigh_fastplus_mode = 0x2,
+	.setup_hold_time_std_mode = 0,
+	.setup_hold_time_fast_mode = 0,
+	.setup_hold_time_fastplus_mode = 0,
+	.setup_hold_time_hs_mode = 0,
+	.has_interface_timing_reg = true,
+	.enable_hs_mode_support = false,
+	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_VI,
 };
+#endif
 
 static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.has_continue_xfer_support = true,
@@ -1785,6 +1868,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
@@ -1817,6 +1901,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = true,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
@@ -1849,6 +1934,7 @@ static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = true,
 	.has_mutex = true,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
@@ -1881,6 +1967,7 @@ static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = true,
 	.has_mutex = true,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct of_device_id tegra_i2c_of_match[] = {
@@ -1889,7 +1976,7 @@ static const struct of_device_id tegra_i2c_of_match[] = {
 	{ .compatible = "nvidia,tegra194-i2c", .data = &tegra194_i2c_hw, },
 	{ .compatible = "nvidia,tegra186-i2c", .data = &tegra186_i2c_hw, },
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
-	{ .compatible = "nvidia,tegra210-i2c-vi", .data = &tegra210_i2c_hw, },
+	{ .compatible = "nvidia,tegra210-i2c-vi", .data = &tegra210_vi_i2c_hw, },
 #endif
 	{ .compatible = "nvidia,tegra210-i2c", .data = &tegra210_i2c_hw, },
 	{ .compatible = "nvidia,tegra124-i2c", .data = &tegra124_i2c_hw, },
@@ -1897,7 +1984,7 @@ static const struct of_device_id tegra_i2c_of_match[] = {
 	{ .compatible = "nvidia,tegra30-i2c", .data = &tegra30_i2c_hw, },
 	{ .compatible = "nvidia,tegra20-i2c", .data = &tegra20_i2c_hw, },
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC)
-	{ .compatible = "nvidia,tegra20-i2c-dvc", .data = &tegra20_i2c_hw, },
+	{ .compatible = "nvidia,tegra20-i2c-dvc", .data = &tegra20_dvc_i2c_hw, },
 #endif
 	{},
 };
@@ -1905,21 +1992,12 @@ MODULE_DEVICE_TABLE(of, tegra_i2c_of_match);
 
 static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 {
-	struct device_node *np = i2c_dev->dev->of_node;
 	bool multi_mode;
 
 	i2c_parse_fw_timings(i2c_dev->dev, &i2c_dev->timings, true);
 
 	multi_mode = device_property_read_bool(i2c_dev->dev, "multi-master");
 	i2c_dev->multimaster_mode = multi_mode;
-
-	if (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) &&
-	    of_device_is_compatible(np, "nvidia,tegra20-i2c-dvc"))
-		i2c_dev->is_dvc = true;
-
-	if (IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC) &&
-	    of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
-		i2c_dev->is_vi = true;
 }
 
 static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
-- 
2.43.0

