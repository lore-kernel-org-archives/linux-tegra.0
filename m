Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011001.outbound.protection.outlook.com [52.101.62.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8125D30E831;
	Mon, 27 Jul 2026 14:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785161517; cv=fail; b=jOwD+xcyVJP1deyBMsT5QpqlY7WTaBPEDk/a5vl6blHX1eg+djhRPwzM+YwIXkkEO+LYqAxT+xAMNvdcjVTR9QmfOU1QUStjUQzwDSQVL++66+recHjN5D+DN489WRziB86vdzFoJk4MMMXkuW9qkS3F1akyGRESe4X2PaS9Fmw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785161517; c=relaxed/simple;
	bh=A7A6wTzAJBCIX+4aDFPU9E5DEIL8wyw3D25m43wxPQc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RV3qvw3zVK6+DyhLKAGYbxsrUCyKwldt/ZwAXCShxh+mUXUdcZBV2rHfBjHmZToos4zVPdTGVYlVTZPpoKMhSOUJpvkBuDTiIRK0oh42GCDmJq3dHIwaPWEZooTCVSn+gbRO7WANb2Kw4j5ANcP8ZAYo7ZHrbfGBVW/N9oTTCBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HXIlUi7G; arc=fail smtp.client-ip=52.101.62.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HXIlUi7G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bD2/e9QSYjRVdol6RwRyXWpW5bkXYJEz0dtbBc6TW5bIRjAiK76R90ZN/oFzUg3uXVsZi/jsSblJql1BHg5SosrC31jPw/afFiywqg+G3URdl0Z8abtP4kXg68QRgz6WpiCRkjZrgIF4zjb0oC+dj2Jm/XTD4HE2nH4N9xY7eac21tQnjv27TkoRGJ8a8ZowV1poJgsUEdHboNu0mhpm3xQX92TLM3E0R6pfUt5ikJcPn3PVWwQ8wO+3U0LIrR/t/3FtKsEVGauU0IVe6sGyNmwtv7BusfpCH2LjFTqEfhpAjMDTIr+pYvAcMfkRmN12kR392/sZwUIZulpGJ/pdwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mPNSZtmqaSHehC7SAbaJk4749GETuQov9lRi45mKr+k=;
 b=dZXzXuGteRP3ZKXe93c0BLj+aeYFjxof2j2QphIdIpIrnGYtnVVtnZsObXsdz1mDaIy9jbAr4Oo6sNQnQpVxnYLJ5alZ4XDW7s+kJbY0XiW91R8FD8uJ5x+Tux/6hKM4ZfhMXLcz3cyXpbL3yhTOx8B7V+nwNTWTJAuyH97u5UBXbRBne2SfLzsQxhc4s3S1Co+uBFTtgK3baxhWfY9SIrwznJZNnNSXrrJ7mFVxo5XFvARqmVfwtD+oS1p2o3QJeRuruknjhVx5S7RR4v7eDntyB4d1LjUqODLeACz4Hhl9iqx08ecKGzDRCwp1Gr6S/2PcDlcbugunGJFpsE2nTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mPNSZtmqaSHehC7SAbaJk4749GETuQov9lRi45mKr+k=;
 b=HXIlUi7GYIbJwiD/PriMjSSyMmmJ+eEly3T9d34NC4x4FyihJl8MQNxC6FhEa/gj7/VbUr/XJx7Dxlqhv1cja+Me5uMSBTM29lF4uj7VtTgrhE1ahqsY4aRENO1/GFwXgyzYlDrOOc+yqPBrMU6kir7CPqeYqCdyQcGPsCsAAUqKM2wbrP6j+18+fzN896uMJb1/pmdG8V7kJg2c9dbKd4GnkORDqVf9AZ899ztiQ7HTedYkzbvC3ZiYTFsXbaiTUhr71dS0TzkeeBSAxRi5eky9zIQForegClVqUrdH8H79iY2qUsPvuKnPMKDwi84PQtMsDs5cSd30bpbpzaGo3A==
Received: from BLAPR03CA0025.namprd03.prod.outlook.com (2603:10b6:208:32b::30)
 by IA1PR12MB8520.namprd12.prod.outlook.com (2603:10b6:208:44d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 14:11:47 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:208:32b:cafe::22) by BLAPR03CA0025.outlook.office365.com
 (2603:10b6:208:32b::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Mon,
 27 Jul 2026 14:11:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Mon, 27 Jul 2026 14:11:47 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 27 Jul
 2026 07:11:27 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Jul
 2026 07:11:27 -0700
Received: from build-pshete-bionic-20260122.nvidia.com (10.127.8.11) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 27 Jul 2026 07:11:26 -0700
From: Prathamesh Shete <pshete@nvidia.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<pshete@nvidia.com>
Subject: [RESEND V2 2/2] pinctrl: tegra264: fix DAP2 DIN/DOUT pin assignment
Date: Mon, 27 Jul 2026 14:11:21 +0000
Message-ID: <20260727141121.772110-2-pshete@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260727141121.772110-1-pshete@nvidia.com>
References: <20260727141121.772110-1-pshete@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|IA1PR12MB8520:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d0662b8-3649-4ba3-8d60-08deebe8fee9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|56012099006|11063799006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ApmrHL4pVnFkg6ftg+vdud05euhNPLuLJijTpienyXghzi/nLqdiR+6h1l7kLO0B84RCP8r5bMzwzyhzZuFDiMhOIMPEiOht/XGjcTS06wxlgQvhvADXFKGCCyUuKsbirsJZJX49CUQAE1pNfddoT9oz6ZfQe7XQiphVFo+x/JarlqCFZ/QpV+EcvkVHeMlURg01ZMUyvmO7FiU2VxNLqzu1NVBAVLf1wSmhn3dmwV8+qajSenq5RqNHq5IKkJbzSQs0lvwUkBrO4UOcPfbeSO2nl+Fr5g10WhjnX+S1YlKJ0dqwzIcD/+ln1OvTJ3EbxtB6yq7JGISEdAcQB2HnpkuNsT3RTMfbILvppDeT/nYYWA/GgI6XD3LV4I5Sb7TOrE2f2kaVw7W/9dWdkx7nbvJxq5gIP9L4x7DYQ0LeLZng6U5mhB6m3ZVQFXKOr75M48glnrjlpf1JMEOhcaEiH9jAsupK4QMFmuyHiZzGkWpkIFY5lzmRekvcr90c3T+6AMFRIFqk9YgTZNTfDScrcINPhIG5JlEq4DfoEuUeSA+3tG0TOlE6raXzrZdU5QsREV2Obpdx1ZIP2oIr9/CaA+BMgDhqFO4/WsPVjt0/wtK3/Q5soNK/9hMvLCS4TvBMLJoTqWvR9hXG08LIvjMhGWonwbHL3vl9SNi9sOn5kdUmupuc92q1YzKyIOj1FTgBLLhHXjMayZrSKdaGetxp7A==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(56012099006)(11063799006)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jPiWAil3eKqJfMnSl4pC9Nh8Q0ya8w4h1l2vs2LEisiWT/BpNVaWQxyyonzAKjE9IprCe6u93mk2QiCwTJV9jFgIPE6P7TyHCwNL4qsdFl83pQEjZxlabAB6Aa909vfXsDyn0nuyQGbOhb7CtxIwFBcdCgUHwSXeSXip1OXwvKP0egLi/9ab4fkCDg+k22V4oJOc/IWMw+zcYrtL66QYygChkRpZcoblyRtP33NzOVmZvfCkzkaaDqQTI2ZUqX3O5sgDP4yQF5ORw0daJ+Kd3U9PazwlKqOSENYZ+lpShAgcPPwHp00AVHLy1Ml/dhsL8I2CtYSRS1XBd8Xu7T52un+EZzLO0gigxeA1g1KtA88EMAjFuXwk2w9fB5ebD+BZE/p3fNqpUiTGDOcBqzzswjnDeHRFwl8o2uw9TxV/a9CyU8x97UdqZf2IgBBzfOLy
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 14:11:47.3003
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d0662b8-3649-4ba3-8d60-08deebe8fee9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8520

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

