Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012034.outbound.protection.outlook.com [40.93.195.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0B434678E;
	Mon, 18 May 2026 11:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779104466; cv=fail; b=sVLrokVtK6r+VWY9zCmxYpxk5IgS8AfXTNHUw3ePgzzkndgS+3rwgdD49kcr6LMvCCSKqjmIxjvgwfLutyxJlueSOtOkhDFxNq4PZ6dWIZN6ovKqqRGLGzOYXEa22g+eVRbXAQiw9NuNr4/liCbVYqu2B43pjWrn4yOfUgpxTvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779104466; c=relaxed/simple;
	bh=A6JnN1F/mh+rpXmivkkrYK7W35ZoulKb5U+ytILZ924=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NSXHdmE4cOaMvndefgIZOgpLdBUZMZgViDRv0qBhk7faUBrtyjb+C85aW2SgE0JO/KVzmMukhxntZo4XmuVsZ1OG50ELEH4tfp2YB4s9Tt3aXhDl4vZ0rPPXIP37kTkCNBat8wLJNemubvzCVXd6rTW8U2fRBhO3+G5I5P01FaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YGu01Cb5; arc=fail smtp.client-ip=40.93.195.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YGu01Cb5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PvUv/IF9VTsjtkuVIOHE0BeEA0EVQgfF08MhgxMx8rKuJvx7RWHvsXDzhq4f/wlDk/+fiNcycfKWXYkotNm8NGQochyt2EJ2Ztx8vgut9I23OG5g5Bl0X+yJ+3lBvg5jdQ8ZccuQUBk45TNWF+OohhI8RgzNugYMOsDHCP+LKh5oPJEhruIMbSXPD9JMkYRJStpPtVmv9sjQf1DWyghx8zRSRf4Tr1hZo3daUmOLsJAaBuyEz6JprD8/q/kJS2pK7Tf+d37zQ+jr7zkKcLHJPFjEU75yFZR6yu1e+85AEgeOhqykmnkqK4sIqqPCuInvtu2Kf3jGyjDwrVhBYOw0Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wcRYeuew/FyAaQl4YQYt+vIVRwrlsYDiva/s2S0t8xc=;
 b=m12kKCPAolF6kuqrgbq5eraxqG41Dr54wqrBxH/PZlrq39V18V5z/XfP3JPbDjbtkVYlRPs9p6jsKLx7sktcnHbK/KTmi4CN0++QVaaWsfWgxiBxIuRBfce7qQqxfyVeXv87Lsbc7iC7oSpqggAXCmX064eYLmn+Ofg28gWNJ7P7IK4p5JtbG39SHBMrCju512uYKcclHh6KSakNoYufyRICt3n9AZ1UEOwodABuHp5I3C2kZWlVerujHFf13orCS8vm2P0eyKXgGq78CCZOP1Zf5xpXhnoA5pi32HZ1JlkeVTPdLG3Bn9J3J5Fs+BtOh9M0VSWORVIgWmQuinZx0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcRYeuew/FyAaQl4YQYt+vIVRwrlsYDiva/s2S0t8xc=;
 b=YGu01Cb5Tgk6T93inKkFfNFhZFpzQvslQWKcKVM1q2cdo/EJibYbUvqlRlK57vBxB0aOeOP4vkVT68t9K7vjEl5ESnohLEXLSPa7+W0QRQe/oIaElwC5xa/47skdhk3MOMqqeUsg/qp9JG1iEcv0txcIOqlMjrqZK1+T8wgI8gCiu9nGTQ3Y0ZB82JJBKZoSR7zn1DojZaOudLFf/3nywwLdEqNCqwWr+QIppSQULFnIsC++QND0GOis8DcqvbZ+C1I7Yt5jgay63FNWMoYnEqrSfhh5/WcktwHgRTOLSiNhAgP3CTd9rGyWCcEpVCtzoT0UExYJoZEzc/KkSInwvQ==
Received: from SJ0PR03CA0257.namprd03.prod.outlook.com (2603:10b6:a03:3a0::22)
 by DS5PPFE52C859EE.namprd12.prod.outlook.com (2603:10b6:f:fc00::666) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 18 May
 2026 11:40:45 +0000
Received: from SJ1PEPF000023D9.namprd21.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::d0) by SJ0PR03CA0257.outlook.office365.com
 (2603:10b6:a03:3a0::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.23 via Frontend Transport; Mon, 18
 May 2026 11:40:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF000023D9.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.0 via Frontend Transport; Mon, 18 May 2026 11:40:45 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 18 May
 2026 04:40:33 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 18 May 2026 04:40:32 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Mon, 18 May 2026 04:40:29 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko
	<digetx@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, Thierry Reding
	<thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, "Kartik
 Rajput" <kkartik@nvidia.com>, Wolfram Sang <wsa@kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH v2 2/4] i2c: tegra: Disable fair arbitration for non-MCTP buses
Date: Mon, 18 May 2026 17:10:11 +0530
Message-ID: <20260518114013.62065-3-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260518114013.62065-1-akhilrajeev@nvidia.com>
References: <20260518114013.62065-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D9:EE_|DS5PPFE52C859EE:EE_
X-MS-Office365-Filtering-Correlation-Id: 757fdfb0-57d0-4e5f-4857-08deb4d24c61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|22082099003|3023799003|56012099003|921020|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info:
	JH6NTpitPkqlbZdFGMMvxMTKvYCy+s+WoLzvaZ2yL6zqYOY5ljuo+j0X+J4Cr70dEYBo4TorRxX7xcqLoO6Td3MGoN0rvz0RXhLTIsiDxOX9ZILu8HOPoclI0hgrg66IpzC0sUqY1R3lZJcP2nNCH8oK1vQaI+bev8rPzYeT039Bs4wQzBHsKr1AatfCIa3lzIpY0pUZ73enkNLs1VJs5ftzw7VS9O4ud8gU19h5umTqy7yV3YykygqNKCT0VyCqwHwoiSLMJdJEb1QdgiXq0KniK0oS+uGF6LSIAKb01dFfFpjkKXU/8zmlTjsI26ndkfzbKujeDG+ji9uOH53C/7tbuJF2OiyLLweWJDTnsV3HYl3JgdL8nqzGs1w14mG/70AFAYj4qxYMlndaBe6Qa0AHRHbAwyjfa+b9OP8CTkqQDgXMABo/qeeRKT7UbVqLyjXC2AmbrtlelG/x1zLT3ewg3AHrGzXPpEB1eJO3kHEUlp9WYTsqDfEzmfTSUaSo+AImh7EXbFTL+y/lP/M2fvUqSFQAc9kfJfWleo5vXViNoLLgl6HuQgWzaZsSO+VMCb9VTQzr8Sikw/qlKNyVxKRnd76LizfLLnS1ZfVp7CyxNWkn5fshs0ubT3SXw25pdc7MjL6jccMB5edHzdiWLHE+qk3i1qj1Da39mP0vDoMpOG0bCRFzlSRg2F7oNKLvoDMYF+7NBspDZyaEl1dha+9kSLxhhDyprpQooaUAiyWLx99xrCw+vHf6WkQKcpwWAF8jifXRUPVrojSlZyJuYg==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(22082099003)(3023799003)(56012099003)(921020)(18002099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yNXy5R31poASOfrW3LIyeRYOajN0CfXBlMefjkNj0H3Tf2+ukOtafSi3FcwRTFpilrAxs8PYBJeXs0nyK6b9RVvPX31b9tl3zFXUGfyalplcmKGvfmgWgFij3GGW0mwbk8JwBCnjdNbKg5CeyS6Y48FRfKbYAF75Ws+kKx9299BKmoXENpNqwwHjYQDtIzPQCA1ga9F/nmCULzCWHm7+bX5eTcEb//TkHxvaJ4XDFuruk4vFkg/hjP+NTu5ZixnUFI3Ko0JW8O7CbI/G37oCIbm3liRUXy+VoLFOjYy8Ud+j9wgYZHwGYYoxcOgABJK/D0Ha1Cy/fQvel9rvdqGDDTmTX+Ii/XJewbeTPtygUdB+NjDSG/oaXLP1dr75UAfdEJCuHeWlznDzdDKzudegCJU6zM3EOXwUela0CYq9fcITIMZo8iIhyruha94udsvs
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 11:40:45.0581
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 757fdfb0-57d0-4e5f-4857-08deb4d24c61
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFE52C859EE

Recent Tegra I2C controllers have a fairness arbitration register, which
allows configuring the fair idle time required to support MCTP protocol
over I2C. It is enabled by default, adding a per-transfer latency overhead
that impacts non-MCTP I2C buses.

Disable the fairness arbitration register during controller init for buses
that are not MCTP controllers.

Assisted-by: Cursor:claude-4.6-opus
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index a21f6457d41b..f96a118249b3 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -164,6 +164,7 @@ struct tegra_i2c_regs {
 	unsigned int master_reset_cntrl;
 	unsigned int mst_fifo_control;
 	unsigned int mst_fifo_status;
+	unsigned int fairness_arb;
 	unsigned int sw_mutex;
 };
 
@@ -272,6 +273,7 @@ static const struct tegra_i2c_regs tegra264_i2c_regs = {
 	.master_reset_cntrl = 0x0a8,
 	.mst_fifo_control = 0x0b4,
 	.mst_fifo_status = 0x0b8,
+	.fairness_arb = 0x0e8,
 	.sw_mutex = 0x0ec,
 };
 
@@ -300,6 +302,7 @@ static const struct tegra_i2c_regs tegra410_i2c_regs = {
 	.master_reset_cntrl = 0x0ac,
 	.mst_fifo_control = 0x0b8,
 	.mst_fifo_status = 0x0bc,
+	.fairness_arb = 0x0ec,
 	.sw_mutex = 0x0f0,
 };
 
@@ -379,6 +382,7 @@ enum tegra_i2c_variant {
  *		timing settings.
  * @enable_hs_mode_support: Enable support for high speed (HS) mode transfers.
  * @has_mutex: Has mutex register for mutual exclusion with other firmwares or VMs.
+ * @has_fairarb_reg: Has fairness arbitration register for SMBUS/MCTP support.
  * @variant: This represents the I2C controller variant.
  * @regs: Register offsets for the specific SoC variant.
  */
@@ -412,6 +416,7 @@ struct tegra_i2c_hw_feature {
 	bool has_interface_timing_reg;
 	bool enable_hs_mode_support;
 	bool has_mutex;
+	bool has_fairarb_reg;
 	enum tegra_i2c_variant variant;
 	const struct tegra_i2c_regs *regs;
 };
@@ -436,6 +441,7 @@ struct tegra_i2c_hw_feature {
  * @msg_read: indicates that the transfer is a read access
  * @timings: i2c timings information like bus frequency
  * @multimaster_mode: indicates that I2C controller is in multi-master mode
+ * @is_mctp: indicates that the I2C controller is used as an MCTP controller
  * @dma_chan: DMA channel
  * @dma_phys: handle to DMA resources
  * @dma_buf: pointer to allocated DMA buffer
@@ -476,6 +482,7 @@ struct tegra_i2c_dev {
 	void *dma_buf;
 
 	bool multimaster_mode;
+	bool is_mctp;
 	bool atomic_mode;
 	bool dma_mode;
 	bool msg_read;
@@ -914,6 +921,10 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	if (IS_VI(i2c_dev))
 		tegra_i2c_vi_init(i2c_dev);
 
+	/* Disable fairness arbitration if not an MCTP controller */
+	if (i2c_dev->hw->has_fairarb_reg && !i2c_dev->is_mctp)
+		i2c_writel(i2c_dev, 0, i2c_dev->hw->regs->fairness_arb);
+
 	if (i2c_dev->hw->enable_hs_mode_support)
 		max_bus_freq_hz = I2C_MAX_HIGH_SPEED_MODE_FREQ;
 	else
@@ -1779,6 +1790,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.has_interface_timing_reg = false,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.has_fairarb_reg = false,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 	.regs = &tegra20_i2c_regs,
 };
@@ -1812,6 +1824,7 @@ static const struct tegra_i2c_hw_feature tegra20_dvc_i2c_hw = {
 	.has_interface_timing_reg = false,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.has_fairarb_reg = false,
 	.variant = TEGRA_I2C_VARIANT_DVC,
 	.regs = &tegra20_dvc_i2c_regs,
 };
@@ -1845,6 +1858,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.has_interface_timing_reg = false,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.has_fairarb_reg = false,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 	.regs = &tegra20_i2c_regs,
 };
@@ -1877,6 +1891,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.has_interface_timing_reg = false,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.has_fairarb_reg = false,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 	.regs = &tegra20_i2c_regs,
 };
@@ -1909,6 +1924,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.has_fairarb_reg = false,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 	.regs = &tegra20_i2c_regs,
 };
@@ -1941,6 +1957,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.has_fairarb_reg = false,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 	.regs = &tegra20_i2c_regs,
 };
@@ -1974,6 +1991,7 @@ static const struct tegra_i2c_hw_feature tegra210_vi_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.has_fairarb_reg = false,
 	.variant = TEGRA_I2C_VARIANT_VI,
 	.regs = &tegra210_vi_i2c_regs,
 };
@@ -2007,6 +2025,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.has_fairarb_reg = false,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 	.regs = &tegra20_i2c_regs,
 };
@@ -2041,6 +2060,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = true,
 	.has_mutex = false,
+	.has_fairarb_reg = false,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 	.regs = &tegra20_i2c_regs,
 };
@@ -2075,6 +2095,7 @@ static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = true,
 	.has_mutex = true,
+	.has_fairarb_reg = true,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 	.regs = &tegra264_i2c_regs,
 };
@@ -2109,6 +2130,7 @@ static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = true,
 	.has_mutex = true,
+	.has_fairarb_reg = true,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 	.regs = &tegra264_i2c_regs,
 };
@@ -2143,6 +2165,7 @@ static const struct tegra_i2c_hw_feature tegra410_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = true,
 	.has_mutex = true,
+	.has_fairarb_reg = true,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 	.regs = &tegra410_i2c_regs,
 };
@@ -2175,6 +2198,7 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 
 	multi_mode = device_property_read_bool(i2c_dev->dev, "multi-master");
 	i2c_dev->multimaster_mode = multi_mode;
+	i2c_dev->is_mctp = device_property_present(i2c_dev->dev, "mctp-controller");
 }
 
 static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
-- 
2.50.1

