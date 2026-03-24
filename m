Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011022.outbound.protection.outlook.com [52.101.52.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B7C3A3834;
	Tue, 24 Mar 2026 05:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774331952; cv=fail; b=NpbZ4i/8JauIT3dCX9adUABlroABS6BIVOS+MEGMfweaNs5O6k39nsiIkzUJyB/WErKNX/WaOEAHWhRY2AHC4tAD+RqOT7ryMWGSkp+mdvQlODlPFPFdnl0eRMJlCIi3wxVn71HLnWrlACzDro6Ru5l1sT1DGmhda0++gwl/m/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774331952; c=relaxed/simple;
	bh=NW+Bbc2Ve3i77ufPYvgl/aVohtdz9zyGnPsnJxKmQSw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GCdIY2R2c5N56GIk0eTe1Cb65hVlHihpG9nBX3U3t2xjnvZXa93+vIxbe2mTzcRe9RwK6Ae9eDAcRTbYDOZGv3v3v66YIWQrNl0TJHXDhsyZWZS4XHreb1tXG8Ox9MZSJgae2x927KJQM3tfHAktyMdbWSLeutYW6JGVHBxdQvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DOlFsGir; arc=fail smtp.client-ip=52.101.52.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DOlFsGir"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k9yONEYOIycSWRDgZsTrkQlrqjFqIQheAsAG/t5W8whZY7WVRs1aBxjYU9uo/MCQd+j4nHNQjF7j5toAXCinPwCdov+dFmwDNRbAMlRzdIq3BIA5gFKrp0p2Jy73E7DB1juAuS7vKLXMB0YycFjHV8VN2i0NCRGPJNfz8kE3QYhzFZsDZZx1Je1p7mZaVUiDYoJ2fImVCbaL1WBIijD9n47Wa0tMVBX4kPJeUu1kspfDuw5HjONzBKFqfbxl0ztdwwD3DzKGhlxjvvgOuB5ak3XxNmOaGAXpInjl2OB10Lmqkn9c+CAOzVHvRN4bKWtyiNZFO0VqITxZ85qPpUEWzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ii4nculvLFlkOj2NEl0dym+noZCxp66JpsP848qUk6w=;
 b=e78wvZuPbl5tuRGo7IqbxAstULu/NWPWX5Fc0Mw/AoQYLjIF7tfTelFkjW826mz27G0O0ij6RM9jbspPwhLi4nNbG+im8N8ouwkAdI2/TgtlZZmazt/KSW5Ld0OOoYvsEw8kDaXhvs0X9xGUbGPCEu/V+zfD8AiMv32hkiX3T11BoIsLnmXEGzXT14B5xyxNZV6Ml4XghkfL+tVTQ5ko3vk/5/y8trrcmYOYi9ZdiQPgaaQvUmSpmKwMtVAc6O75+VhFH/2ElLKpNpKg70K0+N7/+XlrQXesSB1ylD0JfwwT6zXXQ73l9BKSPNEFP5oO0fZZic63XcWcDhho92QH6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ii4nculvLFlkOj2NEl0dym+noZCxp66JpsP848qUk6w=;
 b=DOlFsGirKqYlh5EMZWVDQZH6h6vAsW+DUkHq6c7/n4hvKXPbHv/UfS3wtzVYz2AjlUzX0EzuRfLLIyVtpABov+AQuqG28FzbUbvdyiFf9F2TOBhS3zq+LpKlwA102rnVI2wyAHGrowqxsERJ4ADzZp1MtQCb23Iz7nOzsB1f5cMOwyMzPai05jlKL7Yis5yfw5fm85zwNXTm2XeRzbu4DYyxcsOB32656W/ueQPkycUkGf5+MFv30bWmHq/E49XOQWpbKNkxH1r1Eay/IrqtvN4ATYBUsSw99I2tfGzBHfTnJSj/EO1/OJSWjPlqu8HmsCKnh4ze7sLSr0gpcjYdAw==
Received: from CY5PR16CA0017.namprd16.prod.outlook.com (2603:10b6:930:10::6)
 by LV8PR12MB9358.namprd12.prod.outlook.com (2603:10b6:408:201::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 05:59:05 +0000
Received: from CY4PEPF0000EE33.namprd05.prod.outlook.com
 (2603:10b6:930:10:cafe::c1) by CY5PR16CA0017.outlook.office365.com
 (2603:10b6:930:10::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 05:58:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EE33.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 05:59:04 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 22:58:55 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 22:58:54 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Mar 2026 22:58:51 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v10 RESEND 1/3] i2c: tegra: Introduce tegra_i2c_variant to identify DVC and VI
Date: Tue, 24 Mar 2026 11:28:41 +0530
Message-ID: <20260324055843.549808-2-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE33:EE_|LV8PR12MB9358:EE_
X-MS-Office365-Filtering-Correlation-Id: 44abfc07-57a5-4964-d5fb-08de896a748e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ICod7AD0PIky3n6vrSL3feDqFUTNDtJ3leOIrc/GeOd+Itn0So0mBudL5xXLQDy2oBTOIdcEkPJEcxHpqiMG2FqagyQ0ztkxxCI121VKqdT/YLnUNbh1r3LXS+P9rC1iWoKmwww/9IcS4FGsKDZddFwCKMYj1PmW/hOSHxkJMA/K/CIRFYqx5t7Tp1LVpc5HpkuAF4VtqeBSIgQFZBZM/dTXZZlNXo4mDEzKGxc8B+MI5iOJMzh73mpG8VChNF8nPFUWNyz+OFZ+/bLdJOhletf8DsqibgR5WxceY24SS6dsoMEnPXLJTLk74+bGePXJTpVQrIBg2yzwlNb/eRY3ZzzWjLSiOkUzH/p4fOdOWnHbK5yhbtRDNPB7CnpMyJ4C5Bl4VEEF7OfV/xD7Umfomuicw06biYu+kbkU6eRn3BdO1KxiprCcaFtg26n5xQvk4fo62O7FqDXBnPFl8jYBFzqbqYOjp0eBYDc9sEkekvtazNBIeKReMcSpXzRpMqKHRkjxDBkEyEQZwNgj1b6wI0VkZDN8zpl4eG3bmrAN8A9xs4OiBPuE/1NQ+YpMLFa9TN5APUu4ZlJPs9qWHVt7KydeG0pZ5aB9YNNkrEFDxWVbVI1EUsPwSY6n62k/6KyWpt1aAsOXvB7nQ0qZ0FZnl4F+dyd2npXAQsFfzCZKKIfHefwgp2X5Zi7Cp47uB1ZiaM/OYBEOu9M/0MOzcjzjdhFyK2r8p39wYBr+zlcU/i9M0bvrl/v/w3vnyZlrm1a/+5fVqcjMBoc3+QKTAXQYsl1qMYnafWLkAPFJ4xCdTaaujR6IkfntjJXwgxFwSLRn
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nO5L2qUq08Q3JcXRHKHkehBA/DvTMbgcz0vyoU017wqUt373ImG7hLVJbrAeyjS50iz9Umwc6IKnZ6BduqeCEM4OuTnWze6IIU7dsNdM+OtAaCUfTDWKt48LqT8YfkIQ+uXBIhsCoUXIFRRgTZW4DY+xZFV0DAc/96Qe6fFN5ArovnwT26qmZTm7/wl1l8RqNdDLEMQD0BWHSGzktamJ5ssy+on+e3DkGGMhCagVmdr02/MV5AOE7haVRxdJD0K8ZyXKmfQlRK1l7+tlIzb6i18snftqm6pY7xNdyqdAbAVh4oRJrmw8LGa2G3vQx/6MxEGIwqHZHjKuskbRAQO3PY7Yq+uj438XMx91O7toMUjH98dEIQe4ouXMgTafEoRwpoZdlSEBT/bHi3UmIc0PmA6YLQmG/uGkjlvpX+UaO8cUSK9n7BnSTixUxeruGbDT
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 05:59:04.6846
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44abfc07-57a5-4964-d5fb-08de896a748e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE33.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9358

Replace the per-instance DVC/VI boolean flags with a tegra_i2c_variant
enum and move the variant field into tegra_i2c_hw_feature so it is
populated via SoC match data.

Add dedicated SoC data entries for the "nvidia,tegra20-i2c-dvc" and
"nvidia,tegra210-i2c-vi" compatibles and drop compatible-string checks
from tegra_i2c_parse_dt.

Suggested-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>
---
Changes in v10:
	* Suqashed "i2c: tegra: Move variant to tegra_i2c_hw_feature"
	  with this patch.
---
 drivers/i2c/busses/i2c-tegra.c | 112 ++++++++++++++++++++++++++++-----
 1 file changed, 95 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 4eaeb395d5db..a336dfe855a4 100644
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

