Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011045.outbound.protection.outlook.com [40.93.194.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A270135773A;
	Wed, 21 Jan 2026 15:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769009474; cv=fail; b=iOuXabLq5bX9eJVE1dWy8M5qxXsf6jXBsgxD2LYmvp/c0BJkM84bOCIOIBZtVpaPtBlSlbxemeK23XRpKo7yCZG0OEhCm2BWUXxHv3r5uaO3rbu6a0ib/a9YHMWd1aYWFHGPplr/r0YqRBhVwR3vpEdJIwHeKfTFR9MYaj8iQKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769009474; c=relaxed/simple;
	bh=GKb6P06nPBL+4WFccWc5JBVNJUGfvPhJbxM9caxCLGk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bGdNqKfIe7rDgSlzVKrSQ2JsJnuxqvLAhESFPKuKsg5F9/1f4tPx24eNtdnYLEkEhsXTwzUxTIxq62vumj57IsdG+aGGEeALzM77rRVoQftuV0G4FfHcyvm2ZVcadQo+vUFm9mXDRyVfNviAOROLELm38YIiopULrlD08GKjbXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AeAz2jRv; arc=fail smtp.client-ip=40.93.194.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AeAz2jRv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MqivaUyZ6j1KQ7zudsHyJ1bj/YUedghb3UxFxHnm7FGj4IfafaiQPBhIs7lWOCexEeCLXCTdMnAjdVdap8BcPO2A8m8NH07t8SOa+92Q6yVRZIXGGWrPkdsnO1os3xR+NVwK7F7TvdPCjcmDhxbi57+Pwh3EVzEqZ5lXVxOsZQDat8Q6ZCy1/7cSQKD1bqcvHYLFmwthh0tYtPcP/gcTWbFCoTE+ACXKKBGETn6847ZTbXebwhVYyYuBVfZEKu6vrE5Vgi2Q8Qbzw7PYTnUsWCvTxUnQ0rgdg1b0bIdFX/nd1r4GEFAbErXpuyWelWccIQ8UnkV4CjS+9dx3nBb+YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0/C6H9rjMdSCZN2wB8ng96XTIwUwp4rCysLOAXl2kHE=;
 b=k4ljaPneJB6+LU7AIWGReBm0V74W48RMHzaWnn88AmAU5y1h6Jvx85aIMEfAEqG5qveBsy+vvo+vNNGVc0wHOTyMxl21ozga7Ru5yI2a1lmZGUNrkAQpGxaB8XoVA5TsXlRrVQP16IBfQa4OTx9BJDmyd0llkJYBYOsC6E37GZQ2XcotAcGKDdaOdlHrWjLuuOXe6mhNtBJfkQCQLPZiOy+6GVJ+bVW/hfKBY5HG+x+GoXrLIQxxejRCfMWaSpPhAtFKJxg4GTUeqOGfM8upQ9HdhJa5J9gEJlaZrHCdOC5slqdBWqO4DZ413/uFIJQEpsaKCxT+mJcC8cEj8Cv+8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/C6H9rjMdSCZN2wB8ng96XTIwUwp4rCysLOAXl2kHE=;
 b=AeAz2jRvhA9/dGE2ifi9dOj0ERjN5ekxEoF7G8IiM63+ajtMnYGR/J1DwqTbyX8DISoxBJmxzsTw3pDUVpMEDr0ELBaUsV0e8jzhShN86MPNJdrftgto5Ggyh3ZwkFZKEsH6O5q1Mtem+1bhdF9G84MZNJvVzN/n0h2KXI5fcnauCXAgW2+3/DO/OmFs+sdZ2RVolTT9krXlhAob8KhEpUvR3BqIM2UA53ADeQzFtpPQWZcC6eHPEZOiOR2IftWanPiryzHlNKJ8FQoNN7jcQTaG+9pUOQGme7tYbiVLE0NNn0SXSnzpwytf7YovHTPEE2Y5quECUb0yqaGxSN8gAg==
Received: from BYAPR08CA0030.namprd08.prod.outlook.com (2603:10b6:a03:100::43)
 by LV8PR12MB9335.namprd12.prod.outlook.com (2603:10b6:408:1fc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 15:30:57 +0000
Received: from MWH0EPF000A672E.namprd04.prod.outlook.com
 (2603:10b6:a03:100:cafe::b1) by BYAPR08CA0030.outlook.office365.com
 (2603:10b6:a03:100::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 15:30:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000A672E.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 15:30:57 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:30:26 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:30:25 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 07:30:22 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v9 2/4] i2c: tegra: Move variant to tegra_i2c_hw_feature
Date: Wed, 21 Jan 2026 21:00:09 +0530
Message-ID: <20260121153012.92243-3-kkartik@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672E:EE_|LV8PR12MB9335:EE_
X-MS-Office365-Filtering-Correlation-Id: 2110405a-3d5e-4bca-5051-08de590212e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kiedoVRFebfW3cH9Te7E+59koU9hPYYIfKsmx/EGiIJYJ7E/uBZPGpetxgPy?=
 =?us-ascii?Q?5HcnJht10U07kRnv7UH/R47wOVeOoFdSYx8usF9vS/catfuyYnB/Rfdeasxr?=
 =?us-ascii?Q?S6L42G2iabTLL7rNKARxfsk08tr0WM5pkOySWdQHQLoszJjQWsOQNTfAgwaE?=
 =?us-ascii?Q?S6ioH4fySOeNAjhq6FGpOxImgMntFIFqA6z+X7bv0BxXlk8sm+Zp75OepBu0?=
 =?us-ascii?Q?dlerlsK+lu1Jppero030jb7aAI4656pOlpM6toKH3DD6ym3u+sjcLskWWzhJ?=
 =?us-ascii?Q?QDDKZeg2Jn5huzxgGHsu+l/U03X0ulRHcTChzlASg38DwEP0Ax5hHmROLhWs?=
 =?us-ascii?Q?9uDooQBDhIkcoumvxHCX15QptO2n/frfA50tsdjDGh2mDJjPxTlEqObmhSFi?=
 =?us-ascii?Q?iPISNTTI267vNb83VaT+Xn2um7Iy5v1I0SZcvqlPXFFKwa7FCjmWXLNSljyL?=
 =?us-ascii?Q?7oRrx7kiOuve+twuz90RTn1WKm3Wp9JsZynsZIknZNzT2eBBhYVKMkkIBz4W?=
 =?us-ascii?Q?tD9+jnsrprFkzVP1RJhYPsiXVwGnsNW9iu8vs7J/tp/p1KWlBhqmD+AthftG?=
 =?us-ascii?Q?4AQQvBSt0NDwT+Z2nym7azRaVXDwtRZ5784WMZJLfnugFqTB9TyxBK6QyLJV?=
 =?us-ascii?Q?eIdscF5H8BHplGIFGJv5jrT4tLHqRv3xNJuiFwc1wJkt6aMrt+PZgb3uYYyp?=
 =?us-ascii?Q?2EOe3sKb3AuJVBcg2fQ6E0b/mMGNYwV0uWeS8c+8KCTYuwpNH4pJ+hoSFv3m?=
 =?us-ascii?Q?CNfVWCSknuRazB5hgbhWbFbuf4envKIbj+vxP57LIuqcLMID2J7Y+TgifwCy?=
 =?us-ascii?Q?noZZsobq1y/AK9jgfaaYHNGKHJsFGf6XSVT3HsQnzycp+qhYvpCS2FIDn/MA?=
 =?us-ascii?Q?7YI8CJ20Zigv7dUYA1MhKSgVJz+Lg74UE981HdaH3h1jcx6DKjQz5pejDDnn?=
 =?us-ascii?Q?clfyOYprtLZ1R+nlpHJLK2x24C5qHOJMUJrj/B0SnSJACUz7KaoToafY2p2h?=
 =?us-ascii?Q?pNWdlIIuJc0lOYOuueMZxG2U9Ik3mKAVErIlrAb8KMhyp22tLZ2lgnM8PBle?=
 =?us-ascii?Q?Oe0rABDlbCXLZX31MM9TANHofmRGsTBV5YbiZXnyp0+3in8HdeJCBDR3dASz?=
 =?us-ascii?Q?ys4Opc4EDs38kVqDqk/FQIIcHYGw416WmK5NeNt0/wM+I3iPDV04eknXasqK?=
 =?us-ascii?Q?lnmz26S9DsQPAYf0oP50AyMUS+y6KlLI4Yuoiulk/9VHcXprG1R556xtId0I?=
 =?us-ascii?Q?QwPK01oEMa/qOzzJZfkCQSTZw+CtV3m+t4WIX3JSI1xb/mKMiAJfofs8S9SP?=
 =?us-ascii?Q?Nxh2bdEXmsJxCcXTDiINnk1+3yEE2x5aFQ0Ftf9EXQGOHcGwy0WFegabBMuq?=
 =?us-ascii?Q?9UC2ZFVjntDzqfcwbLziTAqMI+AX2bckoLRlWlc6mNKbCNViKLyJi5XwmHWj?=
 =?us-ascii?Q?0owuI29tvmmzqmxASuEH/eqHePGT8dj3o5uGuYnBTgo0NGphUyVKv0jxW+Yv?=
 =?us-ascii?Q?jMw5LCw6vynFkjwWnF07tIYswiBu5K2JyXYEYkE9HLufXJ72b6XxzJ2ygiML?=
 =?us-ascii?Q?6nlf0B1DS5z3XCAckaFeVyDgK1ESUFiRktcOtWvPPABuVti2kLRVVPr7MMH0?=
 =?us-ascii?Q?3yFw5CTuzJEAgd5YLEQBDcZ2YTSCEd+MGbNEo00x+quRtqtwNZUXoQi8dzPm?=
 =?us-ascii?Q?PPdt4ZtOrPEi1WqbLGd8QGley74=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 15:30:57.3786
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2110405a-3d5e-4bca-5051-08de590212e8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A672E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9335

Move the variant field into tegra_i2c_hw_feature and populate it for all
SoCs. Add dedicated SoC data for "nvidia,tegra20-i2c-dvc" and
"nvidia,tegra210-i2c-vi" compatibles. Drop the compatible-string checks
from tegra_i2c_parse_dt to initialize the Tegra I2C variant.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
Changes in v5:
	* Updated commit message.
Changes in v4:
	* Reverted the change to remove config checks from IS_DVC and
	  IS_VI macros.
---
 drivers/i2c/busses/i2c-tegra.c | 98 ++++++++++++++++++++++++++++------
 1 file changed, 81 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index c2c60ba4fe5e..2ef5fba66b0f 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -235,6 +235,7 @@ enum tegra_i2c_variant {
  *		timing settings.
  * @enable_hs_mode_support: Enable support for high speed (HS) mode transfers.
  * @has_mutex: Has mutex register for mutual exclusion with other firmwares or VMs.
+ * @variant: This represents the I2C controller variant.
  */
 struct tegra_i2c_hw_feature {
 	bool has_continue_xfer_support;
@@ -266,6 +267,7 @@ struct tegra_i2c_hw_feature {
 	bool has_interface_timing_reg;
 	bool enable_hs_mode_support;
 	bool has_mutex;
+	enum tegra_i2c_variant variant;
 };
 
 /**
@@ -280,7 +282,6 @@ struct tegra_i2c_hw_feature {
  * @base_phys: physical base address of the I2C controller
  * @cont_id: I2C controller ID, used for packet header
  * @irq: IRQ number of transfer complete interrupt
- * @variant: This represents the I2C controller variant.
  * @msg_complete: transfer completion notifier
  * @msg_buf_remaining: size of unsent data in the message buffer
  * @msg_len: length of message in current transfer
@@ -332,13 +333,12 @@ struct tegra_i2c_dev {
 	bool atomic_mode;
 	bool dma_mode;
 	bool msg_read;
-	enum tegra_i2c_variant variant;
 };
 
 #define IS_DVC(dev) (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) && \
-		     (dev)->variant == TEGRA_I2C_VARIANT_DVC)
+		     (dev)->hw->variant == TEGRA_I2C_VARIANT_DVC)
 #define IS_VI(dev)  (IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC) && \
-		     (dev)->variant == TEGRA_I2C_VARIANT_VI)
+		     (dev)->hw->variant == TEGRA_I2C_VARIANT_VI)
 
 static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
 		       unsigned int reg)
@@ -1647,8 +1647,42 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.has_interface_timing_reg = false,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
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
+};
+#endif
+
 static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.has_continue_xfer_support = true,
 	.has_per_pkt_xfer_complete_irq = false,
@@ -1677,6 +1711,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.has_interface_timing_reg = false,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
@@ -1707,6 +1742,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.has_interface_timing_reg = false,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
@@ -1737,6 +1773,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
@@ -1767,8 +1804,42 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
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
+};
+#endif
+
 static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.has_continue_xfer_support = true,
 	.has_per_pkt_xfer_complete_irq = true,
@@ -1797,6 +1868,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
@@ -1829,6 +1901,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = true,
 	.has_mutex = false,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
@@ -1861,6 +1934,7 @@ static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = true,
 	.has_mutex = true,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
@@ -1893,6 +1967,7 @@ static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = true,
 	.has_mutex = true,
+	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 };
 
 static const struct of_device_id tegra_i2c_of_match[] = {
@@ -1901,7 +1976,7 @@ static const struct of_device_id tegra_i2c_of_match[] = {
 	{ .compatible = "nvidia,tegra194-i2c", .data = &tegra194_i2c_hw, },
 	{ .compatible = "nvidia,tegra186-i2c", .data = &tegra186_i2c_hw, },
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
-	{ .compatible = "nvidia,tegra210-i2c-vi", .data = &tegra210_i2c_hw, },
+	{ .compatible = "nvidia,tegra210-i2c-vi", .data = &tegra210_vi_i2c_hw, },
 #endif
 	{ .compatible = "nvidia,tegra210-i2c", .data = &tegra210_i2c_hw, },
 	{ .compatible = "nvidia,tegra124-i2c", .data = &tegra124_i2c_hw, },
@@ -1909,7 +1984,7 @@ static const struct of_device_id tegra_i2c_of_match[] = {
 	{ .compatible = "nvidia,tegra30-i2c", .data = &tegra30_i2c_hw, },
 	{ .compatible = "nvidia,tegra20-i2c", .data = &tegra20_i2c_hw, },
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC)
-	{ .compatible = "nvidia,tegra20-i2c-dvc", .data = &tegra20_i2c_hw, },
+	{ .compatible = "nvidia,tegra20-i2c-dvc", .data = &tegra20_dvc_i2c_hw, },
 #endif
 	{},
 };
@@ -1917,23 +1992,12 @@ MODULE_DEVICE_TABLE(of, tegra_i2c_of_match);
 
 static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 {
-	struct device_node *np = i2c_dev->dev->of_node;
 	bool multi_mode;
 
 	i2c_parse_fw_timings(i2c_dev->dev, &i2c_dev->timings, true);
 
 	multi_mode = device_property_read_bool(i2c_dev->dev, "multi-master");
 	i2c_dev->multimaster_mode = multi_mode;
-
-	i2c_dev->variant = TEGRA_I2C_VARIANT_DEFAULT;
-
-	if (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) &&
-	    of_device_is_compatible(np, "nvidia,tegra20-i2c-dvc"))
-		i2c_dev->variant = TEGRA_I2C_VARIANT_DVC;
-
-	if (IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC) &&
-	    of_device_is_compatible(np, "nvidia,tegra210-i2c-vi"))
-		i2c_dev->variant = TEGRA_I2C_VARIANT_VI;
 }
 
 static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
-- 
2.43.0

