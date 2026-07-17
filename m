Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011002.outbound.protection.outlook.com [52.101.52.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B778B3B27F7;
	Fri, 17 Jul 2026 11:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784287965; cv=fail; b=db6690f+FrohWunRbdTxMsLACw0sc7rsL2ngDrAgxewncboSaEd3MmmRRTNwkB6xoDU7001yZD70NYraJcGJsfLpIYg7x3KC6umU6qoyqw6JYWYvl8Ystr1Q/8cyduSCEpdJ6nQ1psAPbQn5dDeMYRje1UOA6/VXNul8TDLaYJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784287965; c=relaxed/simple;
	bh=A7A6wTzAJBCIX+4aDFPU9E5DEIL8wyw3D25m43wxPQc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dodkOr3AGxvJEju6ensvFPDncPrp4PksnLh0o8z6DlBzq0eQv/kTdOGdcJ2sI5LKtNaD03LVGviZotefUs3msdIqmre8MWXRCkcZZtTzkcW5w5aUV1gfsnfIUfjC6PDLwTP/NH5IgiUzrIDuuZfUHipzNfVdUwRw6pjdEXPOGnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=i5tOX2UU; arc=fail smtp.client-ip=52.101.52.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="i5tOX2UU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yK6iQePpm8qBKTdjNj9FEjHM9h1tqql0ffJOrnwlZSH4Be+P8xtQ/+IGXHo18StqtwTZKX9OuvvnM6iRc6pcUlXt8vG9QT/h+7+i8mkuQ+UStb1P5tmdoL50AflAu+I2HMgyr4h+2fZEJAaw83jZqR4mr9et2zYLzvegGBKeb7LJLqfXETJ2WGGsJaGKO03MWbiPN7x2ncGXrbS9a1FLOH/Wo5gBjxSPza7/X+DoMBnsPX/xtljbCJP8KIkzgq7/Lq9xOpd5EmJPAk02Z+29X02SBo7uUZSdwcHTgRcS9plCTq2tgS5XIdowV4S9AkIToe1u8B6GYEp35rdPiTmxkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mPNSZtmqaSHehC7SAbaJk4749GETuQov9lRi45mKr+k=;
 b=OmDVgl2MADPZWBG+oXBFFr0BO3mf8w56LynJHh+9TCLWTHDjKeUv2agZRgaGNNax8QVnasLbaeUBLvhNwoalS1IeMh2yGzSsAg40pcteQxzZ138HTA+Q7WMehMzkV3Z2wPvV1L8MIRLylto7qkpw8VtJ+f5wVhsnVs5OnpUybEOp+6UmDPXxrp0ze60IeHo/ps/gFf9OpaDnbNLX9qoM3WwkkY82Ye49ne1Nn1Hy7/NGU7oNudEx4xRU27R4zKnjWKWmbGCDa4mMbc9LKqUdIDM2GfR0M836REKKRVQtA/z5LdMd0azUx9B6BZjDmJZkfLuAMYOSjQTZBAKUUrjD+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPNSZtmqaSHehC7SAbaJk4749GETuQov9lRi45mKr+k=;
 b=i5tOX2UUYUPLFtSnkwofFcgjGu9SVwu9oMWElAjzcIfqBUCI5PuuBE9yTtQe+eJ7L6x8jtGE0EgV/kn/a5QCHrtR4mnSn9x8heZTX+yJqyarDkfjCAWROB3QN+MTBv+ToLZ7rc7r6fmDN5kQe6dA21ewBhhDWYtbZzUXa5B3WVuip7/Hrk8+EqmQa3rZZsIF7VJdZUEz3muOpPFZqa8kuflf64lUGjqG12JTpxC4Ul1m3xy0G1l+TXp20sHB+6OANVz/mASPNAlbbPei4SOKp7OynQ4/jP9KHyAAGg7C8iXppHFgAvBsrmaocSs+5+/ZktizxyhuWLK9nSvKDpi3tg==
Received: from SA0PR11CA0022.namprd11.prod.outlook.com (2603:10b6:806:d3::27)
 by SA3PR12MB7998.namprd12.prod.outlook.com (2603:10b6:806:320::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Fri, 17 Jul
 2026 11:32:33 +0000
Received: from SN1PEPF00036F3C.namprd05.prod.outlook.com
 (2603:10b6:806:d3:cafe::15) by SA0PR11CA0022.outlook.office365.com
 (2603:10b6:806:d3::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.13 via Frontend Transport; Fri,
 17 Jul 2026 11:32:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SN1PEPF00036F3C.mail.protection.outlook.com (10.167.248.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Fri, 17 Jul 2026 11:32:33 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 17 Jul
 2026 04:32:17 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Fri, 17 Jul 2026 04:32:17 -0700
Received: from build-pshete-bionic-20260122.nvidia.com (10.127.8.11) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 17 Jul 2026 04:32:16 -0700
From: Prathamesh Shete <pshete@nvidia.com>
To: <linusw@kernel.org>, <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <u.kleine-koenig@baylibre.com>,
	<dakr@kernel.org>, <bhelgaas@google.com>, <pshete@nvidia.com>
Subject: [PATCH v2 2/2] pinctrl: tegra264: fix DAP2 DIN/DOUT pin assignment
Date: Fri, 17 Jul 2026 11:32:10 +0000
Message-ID: <20260717113210.599463-2-pshete@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260717113210.599463-1-pshete@nvidia.com>
References: <20260717113210.599463-1-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3C:EE_|SA3PR12MB7998:EE_
X-MS-Office365-Filtering-Correlation-Id: 03fad0ef-e9f8-49be-ab70-08dee3f71858
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|376014|36860700016|6133799003|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	E87rgy6hYJjE0sLMDwi9zIwMQ9czP7n5ipxSE+UQDNhFuywKsplxqPP4tGEvOdhNeF1R3i/lT+18Jds8Ae4tquPDlJLFZifJnXz1HRhMZ4mtyYbiWcU+UYCX9s3+TxYyc1RsbJU058lwnJIpasf48Mtg15jv8bn8kBc+IExlAbVX3zcez9boLo5wzvopz8PtzP786tx2aswiW8sBuV93xXX3HjGO7NWiNXbEnN4I2lJHP94U5XWGEBDD52k1E5u88R9XezX2MEOcaemagDpULBDYxKONg3Hhv6deuz27SaxDAoKSQMHBInwfROtQqJV9rpCW9/tpWqTlZochY55xxr6ECd2n8zNUvK3fudzbW9JCVjmCPuiroUhpJWIHQYx1cwRv3FXZPwb1UTM/NyIffF1Md7JU6QKEin5KiPoRWijNKvOjvThgB/mCKLPYU/IZ2PxKgbNHt0GHSDiPcp8ycwMk2lHGGv6UD12IT/QMr+4JJG8fgou/MzT96PwKIlvEdeS1s4yXnoFqiRV/AaCUeKvf/mIdOms40dpdTL4y0X2qol3R8j7a/QYQQMqFj2+KGFqKUoA7/6c+1qsHgGPIuvJ5pah2pICmbMiymgb1l3hyv7AVtOekYZ+QciBlkCaOLbFOdNIoWpvXdAxXRdaAMtJ+mlTIufP3mbWyMb5MgbcoxEujTZqWGV86NwcmnaT3ihxLVcJRtiwjFZgelmX3rg==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(376014)(36860700016)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zywnsLh+D++fBzFvB723n3N8m7JtXBtL1T009EWiFeJH0IgrTDKesmnNX2Tx2GrFf3HE06+XpVSmTGu7Vw5CdZbk0C7O0u3+ztu5EulwBHNAUSJnUv7mRhmcVDQfHTTxLlzxdEEu8MXdh3a2GBz3OvrkaHoKyrUfScW8Jy6xF3oo23Pc+nWkUN2ErJ/758kkpBUA/M5euzMH+89VZMfnxeIgWpgxOTV7vewcYuHh2Uh8YMZWObN7zPC5TRV1y7w17F52AHQtPTTAW4vLW4UQkbg2LtNrYsmMgaZhUxri1yBxhxgYTIkzQIMl8ppBetsf1Y+++rvIc9J2riuflmQXNQKBpKv4sturGVfdAGVOYNm/T1p0Dz60CTfyYcpDBuC28LFnhRgaoBYHQdix6ojt8JCb35BTf8vKoDWmr1ffpxyZcsTIPYRWMsQefoCifGO4
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 11:32:33.6835
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03fad0ef-e9f8-49be-ab70-08dee3f71858
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7998

The dap2_din and dap2_dout pin groups were given swapped ball suffixes:
DAP2_DIN was described as ball PV7 and DAP2_DOUT as ball PW0. On silicon
DAP2_DIN is on ball PW0 (mux register 0x6050, drive register 0x6054) and
DAP2_DOUT is on ball PV7 (mux register 0x6058, drive register 0x605c),
as reflected by the board pinmux.

Because the ball suffixes were swapped, the groups were also assigned the
wrong primary mux functions (dap2_din -> I2S2_SDATA_OUT and dap2_dout ->
I2S2_SDATA_IN), routing the I2S2 data-in and data-out signals to the wrong
pins and breaking DAP2 audio. 

Rename the groups to dap2_din_pw0 and dap2_dout_pv7 and give each pad its
correct function (dap2_din_pw0 -> I2S2_SDATA_IN, dap2_dout_pv7 ->
I2S2_SDATA_OUT). The register offsets are already correct and are left
unchanged. This matches the board pinmux.

Fixes: c98506206912 ("pinctrl: tegra: Add Tegra264 pinmux driver")
Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
---
Changes in v2:
- Rename the pin groups to dap2_din_pw0 and dap2_dout_pv7 and assign the
  correct mux function to each pad in a single driver patch.
---
 drivers/pinctrl/tegra/pinctrl-tegra264.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra264.c b/drivers/pinctrl/tegra/pinctrl-tegra264.c
index be64fba34dce..f8afb0bdb68a 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra264.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra264.c
@@ -96,8 +96,8 @@ enum {
 	TEGRA_PIN_UART4_RTS_N_PV4,
 	TEGRA_PIN_UART4_CTS_N_PV5,
 	TEGRA_PIN_DAP2_CLK_PV6,
-	TEGRA_PIN_DAP2_DIN_PV7,
-	TEGRA_PIN_DAP2_DOUT_PW0,
+	TEGRA_PIN_DAP2_DIN_PW0,
+	TEGRA_PIN_DAP2_DOUT_PV7,
 	TEGRA_PIN_DAP2_FS_PW1,
 	TEGRA_PIN_GEN1_I2C_SCL_PW2,
 	TEGRA_PIN_GEN1_I2C_SDA_PW3,
@@ -329,8 +329,8 @@ static const struct pinctrl_pin_desc tegra264_main_pins[] = {
 	PINCTRL_PIN(TEGRA_PIN_UART4_RTS_N_PV4, "UART4_RTS_N_PV4"),
 	PINCTRL_PIN(TEGRA_PIN_UART4_CTS_N_PV5, "UART4_CTS_N_PV5"),
 	PINCTRL_PIN(TEGRA_PIN_DAP2_CLK_PV6, "DAP2_CLK_PV6"),
-	PINCTRL_PIN(TEGRA_PIN_DAP2_DIN_PV7, "DAP2_DIN_PV7"),
-	PINCTRL_PIN(TEGRA_PIN_DAP2_DOUT_PW0, "DAP2_DOUT_PW0"),
+	PINCTRL_PIN(TEGRA_PIN_DAP2_DIN_PW0, "DAP2_DIN_PW0"),
+	PINCTRL_PIN(TEGRA_PIN_DAP2_DOUT_PV7, "DAP2_DOUT_PV7"),
 	PINCTRL_PIN(TEGRA_PIN_DAP2_FS_PW1, "DAP2_FS_PW1"),
 	PINCTRL_PIN(TEGRA_PIN_GEN1_I2C_SCL_PW2, "GEN1_I2C_SCL_PW2"),
 	PINCTRL_PIN(TEGRA_PIN_GEN1_I2C_SDA_PW3, "GEN1_I2C_SDA_PW3"),
@@ -827,12 +827,12 @@ static const unsigned int dap2_clk_pv6_pins[] = {
 	TEGRA_PIN_DAP2_CLK_PV6,
 };
 
-static const unsigned int dap2_din_pv7_pins[] = {
-	TEGRA_PIN_DAP2_DIN_PV7,
+static const unsigned int dap2_din_pw0_pins[] = {
+	TEGRA_PIN_DAP2_DIN_PW0,
 };
 
-static const unsigned int dap2_dout_pw0_pins[] = {
-	TEGRA_PIN_DAP2_DOUT_PW0,
+static const unsigned int dap2_dout_pv7_pins[] = {
+	TEGRA_PIN_DAP2_DOUT_PV7,
 };
 
 static const unsigned int dap2_fs_pw1_pins[] = {
@@ -1834,8 +1834,8 @@ static const char * const tegra264_functions[] = {
 #define drive_gen1_i2c_sda_pw3 DRV_PINGROUP_ENTRY_Y(0x601c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
 #define drive_dap2_fs_pw1 DRV_PINGROUP_ENTRY_Y(0x6044, 12, 4, 20, 4, -1, -1, -1, -1, 0)
 #define drive_dap2_clk_pv6 DRV_PINGROUP_ENTRY_Y(0x604c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
-#define drive_dap2_din_pv7 DRV_PINGROUP_ENTRY_Y(0x6054, 12, 4, 20, 4, -1, -1, -1, -1, 0)
-#define drive_dap2_dout_pw0 DRV_PINGROUP_ENTRY_Y(0x605c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_dap2_din_pw0 DRV_PINGROUP_ENTRY_Y(0x6054, 12, 4, 20, 4, -1, -1, -1, -1, 0)
+#define drive_dap2_dout_pv7 DRV_PINGROUP_ENTRY_Y(0x605c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
 #define drive_pwm10_pv1 DRV_PINGROUP_ENTRY_Y(0x6064, 12, 4, 20, 4, -1, -1, -1, -1, 0)
 #define drive_soc_gpio170_pu0 DRV_PINGROUP_ENTRY_Y(0x606c, 12, 4, 20, 4, -1, -1, -1, -1, 0)
 #define drive_soc_gpio171_pu1 DRV_PINGROUP_ENTRY_Y(0x6074, 12, 4, 20, 4, -1, -1, -1, -1, 0)
@@ -2051,8 +2051,8 @@ static const struct tegra_pingroup tegra264_main_groups[] = {
 	PINGROUP(gen1_i2c_sda_pw3, I2C1_DAT, RSVD1, RSVD2, RSVD3, 0x6018, 0, Y, 5, 7, 6, 8, -1, 10, 11),
 	PINGROUP(dap2_fs_pw1, I2S2_LRCK, RSVD1, RSVD2, RSVD3, 0x6040, 0, Y, 5, 7, 6, 8, -1, 10, 11),
 	PINGROUP(dap2_clk_pv6, I2S2_SCLK, RSVD1, RSVD2, RSVD3, 0x6048, 0, Y, 5, 7, 6, 8, -1, 10, 11),
-	PINGROUP(dap2_din_pv7, I2S2_SDATA_OUT, RSVD1, RSVD2, RSVD3, 0x6050, 0, Y, 5, 7, 6, 8, -1, 10, 11),
-	PINGROUP(dap2_dout_pw0, I2S2_SDATA_IN, RSVD1, RSVD2, RSVD3, 0x6058, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(dap2_din_pw0, I2S2_SDATA_IN, RSVD1, RSVD2, RSVD3, 0x6050, 0, Y, 5, 7, 6, 8, -1, 10, 11),
+	PINGROUP(dap2_dout_pv7, I2S2_SDATA_OUT, RSVD1, RSVD2, RSVD3, 0x6058, 0, Y, 5, 7, 6, 8, -1, 10, 11),
 	PINGROUP(pwm10_pv1, GP_PWM10, SDMMC1_CD, I2S7_LRCK, RSVD3, 0x6060, 0, Y, 5, 7, 6, 8, -1, 10, 11),
 	PINGROUP(soc_gpio170_pu0, RSVD0, I2S7_SDATA_IN, CCLA_LA_TRIGGER_MUX, RSVD3, 0x6068, 0, Y, 5, 7, 6, 8, -1, 10, 11),
 	PINGROUP(soc_gpio171_pu1, RSVD0, SPI4_SCK, RSVD2, RSVD3, 0x6070, 0, Y, 5, 7, 6, 8, -1, 10, 11),
-- 
2.17.1

