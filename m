Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010041.outbound.protection.outlook.com [52.101.201.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA3C346FC3;
	Tue,  5 May 2026 11:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777978837; cv=fail; b=B4jBNY190FcLmZca51WsBz8Cd8Jvh5VwtBI4TxLF8VVmLG8etC5SHDxz9aj7SNIaebxckgNwqpHTUYnsPwJ33141mU1lw/8yc4Cbg8b3YjHvW5maVWKa9+mBPcEmCG46IC8sNv5vLEhnn3M22S9MXBfJGrMehu939bi1wpKpE3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777978837; c=relaxed/simple;
	bh=BiNTVTcIfeCMbsf0UcGSI9ZHtwbxyg4Auvm3XXWYwFE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KkUoMYrwLd29gEanH/WIWRfGzGULqtDiZCaduCNWBu6xXSbwt13Rgg0svklKKPcYHo4V/97PLN6gvSV3V1TYgZiB6IS+IDftuhmp40in/P1bCufjqxQt+3hVegCoglo9r+9mmJI5xDPTS8GVoOoSWMwlIo00tFJNW3wjyj/7lAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sZZHn+Xy; arc=fail smtp.client-ip=52.101.201.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sZZHn+Xy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ian9AVtQHYz7myGrGDGHZOYilU6IDZ8lnCVpIP6nOSAGlu4wjnd+kNOAutuLG6YpCDHhlQyGFMvyEjqGHjg0ENymg9p6VI2YX8jgDRM5yOtuSnnGObMa2UP7xYNZ7Fl4EEPV0kImG6cMkyJro7qo9IxitexfGi/xXMIf4KWy8DzUuuocJwHTG8OaU2DvJdCN7n30pqHMPCxjnmu8i4L3XqgIJvtZr9urHPSNmI0sNSbJUSByvUHE9lj/9tvaReCvskS2OXxdc6EVmGYlWYocjldWDlWdiNul5MSHJIl5yWQRWLlVURdeNeJ0u3Vy8eEcYBPZma2rYovDHl7vWF4dBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1lZ+uAG2E5p17Fl5NU24FOSVgZ38a2zZyG+Zzj81oJw=;
 b=D1V+aa9APnSCOdBwG2Nmc9ddS8WKRGdTmd2gj8QGvH539N7r1mJHxBYkxRRbVhv5S6VV5vdfQmk14NyrcNQrIruYNqvIiAmXewx9Te/Fjob60RFF2/PFbwfkxrU4lRKTMAkEON3igNtK/ADzofUT80nzXeXmZ6Ehw7PyQJIUCo1cUgR6D/nEl29hVdZrpe3CJA1INOXyQaCeaksx5oVKHFZ1+P9lM2icVfaQZlomNgC9g4iaBU6UeJvR8dC1Y9EdlP/snFfYZlHeAbrIoaC6X+vx2o/vCvLT9WKjLKoSiaEZ+0OVPf5WQwx70//PKEkDCQstYbP63QFhsQZ++kZq7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1lZ+uAG2E5p17Fl5NU24FOSVgZ38a2zZyG+Zzj81oJw=;
 b=sZZHn+Xyce0rQ9rPZHbmPpbfEC4uGEncmca0V6OntSGQ/RhTjx0hg8aISgnOWSjx/yOiAY5cH9pq6HlTGxSbb+UCsruzEPzn6NYxVb6MsQrOF/T4SHBS7TsVI68c3VozsJDw3tuI45bD1RdJhWJSmPnPZ/yQ9BC/CIU6bNOCocv5bbUx0f5HCvFiL9GP5yxCT6vgdcwFVguXo+73+eFmYr19yqHzAjrKu4Nhs5qDsLzYP1aKBpxe1Td3VYD/G/2hcpf2gDe8wn3G1P0VtqoGHhoZn7Jgv8FEQtSCtdUD6qTcsnFtidkppucvQbBlzbX9mU0f+LaMc5aqS71q2DX+8w==
Received: from MN2PR01CA0010.prod.exchangelabs.com (2603:10b6:208:10c::23) by
 MN2PR12MB4094.namprd12.prod.outlook.com (2603:10b6:208:15f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 11:00:30 +0000
Received: from MN1PEPF0000ECD8.namprd02.prod.outlook.com
 (2603:10b6:208:10c:cafe::de) by MN2PR01CA0010.outlook.office365.com
 (2603:10b6:208:10c::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
 5 May 2026 11:00:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MN1PEPF0000ECD8.mail.protection.outlook.com (10.167.242.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 11:00:30 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 04:00:07 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 04:00:06 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 04:00:03 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko
	<digetx@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, Thierry Reding
	<thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, "Kartik
 Rajput" <kkartik@nvidia.com>, Wolfram Sang <wsa@kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <mochs@nvidia.com>, Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH 2/4] i2c: tegra: Disable fair arbitration for non-MCTP buses
Date: Tue, 5 May 2026 16:29:26 +0530
Message-ID: <20260505105928.38457-3-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260505105928.38457-1-akhilrajeev@nvidia.com>
References: <20260505105928.38457-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD8:EE_|MN2PR12MB4094:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b4b5249-0543-4c5a-ab70-08deaa9585e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|18002099003|22082099003|921020|56012099003;
X-Microsoft-Antispam-Message-Info:
	ItPN8CVd3aW8IixgfEvo5dGgM50QlER7sVlu2+QDKlhbZ5yJ9JEAH4dOt9S5QdnVWizMc786Ql92mZxJKM9Wrznksz1aeqwM3zI+J2ogAdlRId/yIBgAxATFKliVlpqDMFUd+ZhkqhAcN8OlDPF//6hndPQ7AK0G87098pUVcN0mk7eKuzw+vwV4Ccw0S/fOkeCFyYwxFnXGTaVBqo5HS+Fgc+DzCRSKbQ4TIblveWElMMgV+flVLHEGbqobFQKdHxjscNoNOcXWNEB5v5wPDWkYbmC0/PebOy+dpt6A5Ra3RMjrl7FlahsfVwKG0MhBeXT2rlBs4Mh7KdZ4Fwu85gdCqJiqPRRTn8g4CDxjlF+s8DmAc20Q6UaP9LO8tY3+loiVhEHV9KVM2w938nuyV5XNKUok/gTzFBolhJZ7IwaLj5+p77fYo+h3IHGwH5qP27QIcmSEslK4N9ZK5BEyW9z+YEZI+VjtFefVb4CdPwhNM9ANlTR695PC23C/iD77d60pcVSgu0qhd86a7a+sCPWVHFI9wvIBVzIa5HfOaRENEGHRVnuiNfc7pfx1m0URPS4g82LHbsGT11YzVGhOQDNaN0xhmgx90mznP1Z7dbNHNd2YLFT8cTrcZBmQHYPaadfKPTE30RZwwwmR0K1XiAbKtsrP7L+kZKjcDXB+BI94ddYwJYUson/9kGRoIgsh7JAozsUnzsRXN11Go6BNKX7FG2kcQsRVqodl58yDZVviB+C4G15EpeEZx46VJAcCDsk2g5pyPsbTSAHtpWxAoA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(18002099003)(22082099003)(921020)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ibhgD7r//R+Ao1YFDxmdsVJtdWuONPHdxZk326d4UG6mPvkbY57FxjBfJxdS8L5F+JujDRwSXnqPm0oAq+nH+25oLnhvBje4DiHbvgOVyXxzvnFsp91iy6uIF8bdxyPpTYtYkG4OQ6Aa3S19mVqRYaU993UGbFSAYh1j6qy+93vCtnhT7WBrFLy/dGk2CwUnPFD+sY2b6KbURIrz73K74tK0iMaQr23rinwOkPUHrmfAgrFjoPX97udwLBiO/d6DTK9z7kPBSSQyK8B9og1v2GsPUwpNo8Iul+f3Ci98UfatPRo2Zr8lXMXx/Hq7tHbqC7VdMfrCs03PmdaW44UVu7u/EOX8/bZTXSO6ZQwp5NlNQhPvGc6KSjinZzoe2n35Le9jNmtKQWVrd6y+0ODAZTRvLwYZOALDiEGYQRMpp0aoKMcOOYnKUF8MNTZocElt
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 11:00:30.4409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b4b5249-0543-4c5a-ab70-08deaa9585e3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4094

Recent Tegra I2C controllers have a fairness arbitration register, which
allows configuring the fair idle time required to support MCTP protocol
over I2C. It is enabled by default, adding a per-transfer latency overhead
that impacts non-MCTP I2C buses.

Disable the fairness arbitration register during controller init for buses
that are not MCTP controllers.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
Assisted-by: Cursor:claude-4.6-opus
---
 drivers/i2c/busses/i2c-tegra.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index a21f6457d41b..1d274431e209 100644
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
@@ -476,6 +481,7 @@ struct tegra_i2c_dev {
 	void *dma_buf;
 
 	bool multimaster_mode;
+	bool is_mctp;
 	bool atomic_mode;
 	bool dma_mode;
 	bool msg_read;
@@ -914,6 +920,10 @@ static int tegra_i2c_init(struct tegra_i2c_dev *i2c_dev)
 	if (IS_VI(i2c_dev))
 		tegra_i2c_vi_init(i2c_dev);
 
+	/* Disable fairness arbitration if not an MCTP controller */
+	if (i2c_dev->hw->has_fairarb_reg && !i2c_dev->is_mctp)
+		i2c_writel(i2c_dev, 0, i2c_dev->hw->regs->fairness_arb);
+
 	if (i2c_dev->hw->enable_hs_mode_support)
 		max_bus_freq_hz = I2C_MAX_HIGH_SPEED_MODE_FREQ;
 	else
@@ -1779,6 +1789,7 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
 	.has_interface_timing_reg = false,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.has_fairarb_reg = false,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 	.regs = &tegra20_i2c_regs,
 };
@@ -1812,6 +1823,7 @@ static const struct tegra_i2c_hw_feature tegra20_dvc_i2c_hw = {
 	.has_interface_timing_reg = false,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.has_fairarb_reg = false,
 	.variant = TEGRA_I2C_VARIANT_DVC,
 	.regs = &tegra20_dvc_i2c_regs,
 };
@@ -1845,6 +1857,7 @@ static const struct tegra_i2c_hw_feature tegra30_i2c_hw = {
 	.has_interface_timing_reg = false,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.has_fairarb_reg = false,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 	.regs = &tegra20_i2c_regs,
 };
@@ -1877,6 +1890,7 @@ static const struct tegra_i2c_hw_feature tegra114_i2c_hw = {
 	.has_interface_timing_reg = false,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.has_fairarb_reg = false,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 	.regs = &tegra20_i2c_regs,
 };
@@ -1909,6 +1923,7 @@ static const struct tegra_i2c_hw_feature tegra124_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.has_fairarb_reg = false,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 	.regs = &tegra20_i2c_regs,
 };
@@ -1941,6 +1956,7 @@ static const struct tegra_i2c_hw_feature tegra210_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.has_fairarb_reg = false,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 	.regs = &tegra20_i2c_regs,
 };
@@ -1974,6 +1990,7 @@ static const struct tegra_i2c_hw_feature tegra210_vi_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.has_fairarb_reg = false,
 	.variant = TEGRA_I2C_VARIANT_VI,
 	.regs = &tegra210_vi_i2c_regs,
 };
@@ -2007,6 +2024,7 @@ static const struct tegra_i2c_hw_feature tegra186_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = false,
 	.has_mutex = false,
+	.has_fairarb_reg = false,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 	.regs = &tegra20_i2c_regs,
 };
@@ -2041,6 +2059,7 @@ static const struct tegra_i2c_hw_feature tegra194_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = true,
 	.has_mutex = false,
+	.has_fairarb_reg = false,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 	.regs = &tegra20_i2c_regs,
 };
@@ -2075,6 +2094,7 @@ static const struct tegra_i2c_hw_feature tegra256_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = true,
 	.has_mutex = true,
+	.has_fairarb_reg = true,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 	.regs = &tegra264_i2c_regs,
 };
@@ -2109,6 +2129,7 @@ static const struct tegra_i2c_hw_feature tegra264_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = true,
 	.has_mutex = true,
+	.has_fairarb_reg = true,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 	.regs = &tegra264_i2c_regs,
 };
@@ -2143,6 +2164,7 @@ static const struct tegra_i2c_hw_feature tegra410_i2c_hw = {
 	.has_interface_timing_reg = true,
 	.enable_hs_mode_support = true,
 	.has_mutex = true,
+	.has_fairarb_reg = true,
 	.variant = TEGRA_I2C_VARIANT_DEFAULT,
 	.regs = &tegra410_i2c_regs,
 };
@@ -2175,6 +2197,7 @@ static void tegra_i2c_parse_dt(struct tegra_i2c_dev *i2c_dev)
 
 	multi_mode = device_property_read_bool(i2c_dev->dev, "multi-master");
 	i2c_dev->multimaster_mode = multi_mode;
+	i2c_dev->is_mctp = device_property_present(i2c_dev->dev, "mctp-controller");
 }
 
 static int tegra_i2c_init_clocks(struct tegra_i2c_dev *i2c_dev)
-- 
2.50.1

