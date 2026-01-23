Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013048.outbound.protection.outlook.com [40.93.196.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55641369981;
	Fri, 23 Jan 2026 09:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769162090; cv=fail; b=LIpxEpLc5hwMp3autcJDIa3dCyNCQtcCG6W2wBlDb197C/G8h7hM1wO+xRRbrQajY+IodFqJ+goLdHUujSwVoiE08vbrrzLLFlvEBYhfWO+UjN6Dt7or1voSDkj7STm33DpRI1UNetQfnp7E5EdkPQsoEh4rfhGe43qZtLzxwHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769162090; c=relaxed/simple;
	bh=dkYwpCL9CCAxPauEtELklHemwodMVosvAlVV7gPWbJA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oIva1BiJsPkDZbtS2iAy2UiicSHM8q8MiKZmUiwCoC6Idu1xQGvbomtx3BwQnkkf2yKx2s5CcL6D77um+FKFWDwf2SqVFmZxpvH9uJivCzqQ6N5f7dKQGbHwJ0ISsTVZTUOkHrThktXVURER9LAxylD4jtfnN0OtVI4r2Lkxnv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MLLPepxZ; arc=fail smtp.client-ip=40.93.196.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MLLPepxZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cfnm8yih31CdXQjQLr5msREWFAxAo2fOzfKcIxorankbK4MEXrzgRlHrmJqfiM97smL8wcbI45A0Fs8UTiejqqp4wamZiyJoll/LSAxBsRLhJWQ7bouc3eFUhOVJw51cHLRx4mlQgbojR4jD0jMGtgWMytJ3tgH5QqKRqio8fFuSBQOrRP9ndZcjpqwL9WFtZ2ClmGwP550D2OLvTYCLb/esS7llreGH8S1dci3KTdhI+tW6qmxrCOMNdb2g6gqZKEQcHGTad2oNfe1S5RKRdz7ynRRMUA4MMVA/KKtgclFipYaW7CKzmqppoh1PkFUT+dVJo6pktnVZ4S/o5AtkHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YpgRXCy0Z68hF8ysWA20gSCi/h++J3N16LejL6qolpU=;
 b=POy1e1N60AHTxi2uD4W5uH0A1fytIcIy48gOhZhntjHmZXnfZIlsQbnzRXG+Bl0cCqBpYmXsShwtVZKrsYEaecA4OT/6JOWH7dTVk3S7fXXfW+py0s3Aw6fsF4s3Vb/s3Km/AmAcxLJgU08JCdjTLNCDmpoABR4SYfj5eMkRW0csy25yH+65N1MMjBFO9TEX50hM4II2Vg7BrvnKRR2mc0wQgC1r7KkH1fzoZW6v9wxTWlxvm02WHR/VTSzMVHjfw2xaRGAmET0YjPrD6HuMspKEGr7YccByAbrLjvg3JIk0ntWJhfqNamfvq7fRRAZnljjfcwuA9/Ta2QxJildiIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YpgRXCy0Z68hF8ysWA20gSCi/h++J3N16LejL6qolpU=;
 b=MLLPepxZ0BaTzJU+OmcU3tvKMX52E0hLSmGsNR7fyDCrgNslIkRPwaemOaWxehkw02fDy93XaUKTX6RyPJgnnPWwdpyeuja12jqcuaXxuX1IKol7Exp0GDR/rno18LSmB2CH1qn6OOYB07w0EKHT2rdYHRAAP25Qr4h3P8CNtX3amKVRj22ybppbP0XdusUIokqQayKbtUM25nJw3waiyHWUEanR+ip6bsGeNwWvZCdMpvaZKQCiOgytVu3yCZ8gos0kCmeHwNgeDj3d19ipXqnj0ybNexZQGfYA0f2Tc99UGGsEMWH3h247+WaWTnqolS+7ZFwG7Y2c20LUU9WYQw==
Received: from BN9PR03CA0890.namprd03.prod.outlook.com (2603:10b6:408:13c::25)
 by CH1PR12MB9717.namprd12.prod.outlook.com (2603:10b6:610:2b2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.12; Fri, 23 Jan
 2026 09:54:32 +0000
Received: from BN2PEPF000044A3.namprd02.prod.outlook.com
 (2603:10b6:408:13c:cafe::5b) by BN9PR03CA0890.outlook.office365.com
 (2603:10b6:408:13c::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 09:54:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A3.mail.protection.outlook.com (10.167.243.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 09:54:32 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 01:54:17 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 01:54:17 -0800
Received: from sheetal.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 23 Jan 2026 01:54:13 -0800
From: "Sheetal ." <sheetal@nvidia.com>
To: Mark Brown <broonie@kernel.org>
CC: Sander Vanheule <sander@svanheule.net>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Thierry
 Reding" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
	Mohan kumar <mkumard@nvidia.com>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Sheetal
	<sheetal@nvidia.com>
Subject: [RFC PATCH v3 1/4] ASoC: tegra: Add AHUB writeable_reg for RX holes
Date: Fri, 23 Jan 2026 15:23:43 +0530
Message-ID: <20260123095346.1258556-2-sheetal@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260123095346.1258556-1-sheetal@nvidia.com>
References: <20260123095346.1258556-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A3:EE_|CH1PR12MB9717:EE_
X-MS-Office365-Filtering-Correlation-Id: a163dc45-22a8-49cc-5e74-08de5a65689b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Myep4L7opyVTIUemNXT/q+4xaxMB8fQi5b/yni5LzXejxQOI4b1L0DDNmyWx?=
 =?us-ascii?Q?IpQF2FBbLyvi3MsfQkpn2HM/CX6QUNS7QxnvqL0/zA66IUarkiKa48vIlINB?=
 =?us-ascii?Q?ylay/Xr8PVlqz02tap6tdwL5dMuMHnCEUtbRazH+UZbXIAjpBY+bFCGS9MUc?=
 =?us-ascii?Q?oFeeoSV4KiWASS/5B0Ptbxlibu2odQZogeWY7WH+7eKmQA+mpzfig21TXH5U?=
 =?us-ascii?Q?mjlHEKUorjCvuMsQn6Atuy3CTSOzfOobt8lXEc21Qh1fNl1bVP6B2j9yS1N0?=
 =?us-ascii?Q?cgQM35k/jEkIs/rIwMuAa8/5fRQA3zjE0bwWsB4fVRfu2LnOjBUlABhHAmLD?=
 =?us-ascii?Q?A8SM4rIesRMeLlST7JWUeXOyLnLRxZ/UCqwDV1r3DTKJdFWSgb637dcrmX+8?=
 =?us-ascii?Q?syn0P8MGLHvzJ7ryfoQ3tQeWDkhEqNX6vXoYG/eYVelL4/hohmyhUNap9SjV?=
 =?us-ascii?Q?1b+1nc2ElaRZ2KGtrAaNJ9xLo+KNjPVxf+2WeWL/oxEN/8Dw3wmpsS3wXzJd?=
 =?us-ascii?Q?OzcJuQnhTgE1viGN4qKEoMfbH9Tej1AF6w/cNdBgnp4uL9FcVs4Dy5tA6Or8?=
 =?us-ascii?Q?TyXtjaZzZdb0mV4OPpSYbMfoIBbj4AHQomTlSwDtkohQD6S+JZdfx5q2VQSN?=
 =?us-ascii?Q?YtAhcbsbt1HFdEnujZ6dSo54iWZGlm0mMIWm3gezYGhwpwuhZH8BQLa5MNgF?=
 =?us-ascii?Q?4V1e6HC7imA8EZaAuazU+wOGrx87mSLbL8L2HtTMUr9MkJsrxk2a8G1hYm0a?=
 =?us-ascii?Q?gczgsHIOT9ZSFqwG6+/+VzqWa7VHIgzruZQsyGxdcziQ9lKewIyqPdpR6K4L?=
 =?us-ascii?Q?CSaoQP3Q5FTVdwltgDoWkdpEFR3KYx1McEq549YO98lmcx8RXdAxLH2kZ+Gr?=
 =?us-ascii?Q?VLxj4H1w3wQWFg6DDjfwpzoXMomYY0XNJkp+yoSEvSdf/vJ0qByElOV/te7z?=
 =?us-ascii?Q?tPYUSab/wep9guIODCybSzH82aGEi+2STKO30xV1iAZuCh5yyqUni0k2Kxx9?=
 =?us-ascii?Q?qrQAvi0xemW0WynYDvcinsQBvNkImC8ysc3PwOipeMgbgnf1+4dIZo2sGz/R?=
 =?us-ascii?Q?X1BFFrRXDbeeZJudprCMePXCOerF/7bvJP1LZYyHRO6goERd+r+Dzjjxb6Ap?=
 =?us-ascii?Q?v1rvaF77dnk4/LZGL7FaoRwjyK16+jmz6zD1yHNy86CuqGPLp6EhTd/CKwIZ?=
 =?us-ascii?Q?0yIOiEkEyDbJyXXyjhiKqfpYCjl8psgPpApb82Vhj8I5Fq+YcdNZaDKfdbvz?=
 =?us-ascii?Q?lxt73Ocmc0RtwiGL1VaspdRYhly0NvOVh47+YeuZr/o+DD5f97FwyRDoNZZ1?=
 =?us-ascii?Q?pioQ2ZvjcDkcNMgAqeaSsBaA7U4WUB7ZmDe13boVi2eKPdC5UZn3PO43mKvl?=
 =?us-ascii?Q?+w/Lax2Kf6bhBZB9PQ8egN8D8OIzX927Pik2NklmLg2O3OcTvpb4l9Pmfr/M?=
 =?us-ascii?Q?bNg4w/EjePqMX3C8OeD3BvxGI+l6C9pqRjpL8ifahI4D7k7xsI0vkHrRYZxX?=
 =?us-ascii?Q?TbsqKfnAbwRFNJmqyJTfQ+3r3gESICzkFAdsOmNXgTmC+GWSymj4JAxLAE6b?=
 =?us-ascii?Q?JmSLldO5LLeFKOHeHpY81+JYjJ0wPm7T+zA2Rd0AwkB2pj0TVwMs6WmPef7k?=
 =?us-ascii?Q?QUYrIXLOUG4iXIGYLa6AQIA4P472573ruF491ausNw34iC1DYcsegbNgLPmP?=
 =?us-ascii?Q?qcVjWQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 09:54:32.4210
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a163dc45-22a8-49cc-5e74-08de5a65689b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9717

From: Sheetal <sheetal@nvidia.com>

Add writeable_reg callbacks for Tegra210/186 AHUB RX registers so the
flat cache only treats valid RX locations as writable, avoiding holes
in the register map.

Fixes: 16e1bcc2caf4 ("ASoC: tegra: Add Tegra210 based AHUB driver")
Signed-off-by: Sheetal <sheetal@nvidia.com>
---
 sound/soc/tegra/tegra210_ahub.c | 57 +++++++++++++++++++++++++++++++++
 sound/soc/tegra/tegra210_ahub.h | 30 +++++++++++++++++
 2 files changed, 87 insertions(+)

diff --git a/sound/soc/tegra/tegra210_ahub.c b/sound/soc/tegra/tegra210_ahub.c
index e795907a3963..fc5892056f83 100644
--- a/sound/soc/tegra/tegra210_ahub.c
+++ b/sound/soc/tegra/tegra210_ahub.c
@@ -2049,6 +2049,61 @@ static const struct snd_soc_component_driver tegra264_ahub_component = {
 	.num_dapm_routes	= ARRAY_SIZE(tegra264_ahub_routes),
 };
 
+static bool tegra210_ahub_wr_reg(struct device *dev, unsigned int reg)
+{
+	int part;
+
+	if (reg % TEGRA210_XBAR_RX_STRIDE)
+		return false;
+
+	for (part = 0; part < TEGRA210_XBAR_UPDATE_MAX_REG; part++) {
+		switch (reg & ~(part * TEGRA210_XBAR_PART1_RX)) {
+		case TEGRA210_AXBAR_PART_0_ADMAIF_RX1_0 ... TEGRA210_AXBAR_PART_0_ADMAIF_RX10_0:
+		case TEGRA210_AXBAR_PART_0_I2S1_RX1_0 ... TEGRA210_AXBAR_PART_0_I2S5_RX1_0:
+		case TEGRA210_AXBAR_PART_0_SFC1_RX1_0 ... TEGRA210_AXBAR_PART_0_SFC4_RX1_0:
+		case TEGRA210_AXBAR_PART_0_MIXER1_RX1_0 ... TEGRA210_AXBAR_PART_0_MIXER1_RX10_0:
+		case TEGRA210_AXBAR_PART_0_SPDIF1_RX1_0 ... TEGRA210_AXBAR_PART_0_SPDIF1_RX2_0:
+		case TEGRA210_AXBAR_PART_0_AFC1_RX1_0 ... TEGRA210_AXBAR_PART_0_AFC6_RX1_0:
+		case TEGRA210_AXBAR_PART_0_OPE1_RX1_0 ... TEGRA210_AXBAR_PART_0_OPE2_RX1_0:
+		case TEGRA210_AXBAR_PART_0_SPKPROT1_RX1_0:
+		case TEGRA210_AXBAR_PART_0_MVC1_RX1_0 ... TEGRA210_AXBAR_PART_0_MVC2_RX1_0:
+		case TEGRA210_AXBAR_PART_0_AMX1_RX1_0 ... TEGRA210_AXBAR_PART_0_ADX2_RX1_0:
+			return true;
+		default:
+			break;
+		}
+	}
+
+	return false;
+}
+
+static bool tegra186_ahub_wr_reg(struct device *dev, unsigned int reg)
+{
+	int part;
+
+	if (reg % TEGRA210_XBAR_RX_STRIDE)
+		return false;
+
+	for (part = 0; part < TEGRA186_XBAR_UPDATE_MAX_REG; part++) {
+		switch (reg & ~(part * TEGRA210_XBAR_PART1_RX)) {
+		case TEGRA210_AXBAR_PART_0_ADMAIF_RX1_0 ... TEGRA186_AXBAR_PART_0_I2S6_RX1_0:
+		case TEGRA210_AXBAR_PART_0_SFC1_RX1_0 ... TEGRA210_AXBAR_PART_0_SFC4_RX1_0:
+		case TEGRA210_AXBAR_PART_0_MIXER1_RX1_0 ... TEGRA210_AXBAR_PART_0_MIXER1_RX10_0:
+		case TEGRA186_AXBAR_PART_0_DSPK1_RX1_0 ... TEGRA186_AXBAR_PART_0_DSPK2_RX1_0:
+		case TEGRA210_AXBAR_PART_0_AFC1_RX1_0 ... TEGRA210_AXBAR_PART_0_AFC6_RX1_0:
+		case TEGRA210_AXBAR_PART_0_OPE1_RX1_0:
+		case TEGRA186_AXBAR_PART_0_MVC1_RX1_0 ... TEGRA186_AXBAR_PART_0_MVC2_RX1_0:
+		case TEGRA186_AXBAR_PART_0_AMX1_RX1_0 ... TEGRA186_AXBAR_PART_0_AMX3_RX4_0:
+		case TEGRA210_AXBAR_PART_0_ADX1_RX1_0 ... TEGRA186_AXBAR_PART_0_ASRC1_RX7_0:
+			return true;
+		default:
+			break;
+		}
+	}
+
+	return false;
+}
+
 static bool tegra264_ahub_wr_reg(struct device *dev, unsigned int reg)
 {
 	int part;
@@ -2076,6 +2131,7 @@ static const struct regmap_config tegra210_ahub_regmap_config = {
 	.reg_bits		= 32,
 	.val_bits		= 32,
 	.reg_stride		= 4,
+	.writeable_reg		= tegra210_ahub_wr_reg,
 	.max_register		= TEGRA210_MAX_REGISTER_ADDR,
 	.cache_type		= REGCACHE_FLAT,
 };
@@ -2084,6 +2140,7 @@ static const struct regmap_config tegra186_ahub_regmap_config = {
 	.reg_bits		= 32,
 	.val_bits		= 32,
 	.reg_stride		= 4,
+	.writeable_reg		= tegra186_ahub_wr_reg,
 	.max_register		= TEGRA186_MAX_REGISTER_ADDR,
 	.cache_type		= REGCACHE_FLAT,
 };
diff --git a/sound/soc/tegra/tegra210_ahub.h b/sound/soc/tegra/tegra210_ahub.h
index f355b2cfd19b..acbe640dd3b5 100644
--- a/sound/soc/tegra/tegra210_ahub.h
+++ b/sound/soc/tegra/tegra210_ahub.h
@@ -68,6 +68,36 @@
 #define TEGRA210_MAX_REGISTER_ADDR (TEGRA210_XBAR_PART2_RX +		\
 	(TEGRA210_XBAR_RX_STRIDE * (TEGRA210_XBAR_AUDIO_RX_COUNT - 1)))
 
+/* AXBAR register offsets */
+#define TEGRA186_AXBAR_PART_0_AMX1_RX1_0	0x120
+#define TEGRA186_AXBAR_PART_0_AMX3_RX4_0	0x14c
+#define TEGRA186_AXBAR_PART_0_ASRC1_RX7_0	0x1a8
+#define TEGRA186_AXBAR_PART_0_DSPK1_RX1_0	0xc0
+#define TEGRA186_AXBAR_PART_0_DSPK2_RX1_0	0xc4
+#define TEGRA186_AXBAR_PART_0_I2S6_RX1_0	0x54
+#define TEGRA186_AXBAR_PART_0_MVC1_RX1_0	0x110
+#define TEGRA186_AXBAR_PART_0_MVC2_RX1_0	0x114
+#define TEGRA210_AXBAR_PART_0_ADMAIF_RX10_0	0x24
+#define TEGRA210_AXBAR_PART_0_ADMAIF_RX1_0	0x0
+#define TEGRA210_AXBAR_PART_0_ADX1_RX1_0	0x160
+#define TEGRA210_AXBAR_PART_0_ADX2_RX1_0	0x164
+#define TEGRA210_AXBAR_PART_0_AFC1_RX1_0	0xd0
+#define TEGRA210_AXBAR_PART_0_AFC6_RX1_0	0xe4
+#define TEGRA210_AXBAR_PART_0_AMX1_RX1_0	0x140
+#define TEGRA210_AXBAR_PART_0_I2S1_RX1_0	0x40
+#define TEGRA210_AXBAR_PART_0_I2S5_RX1_0	0x50
+#define TEGRA210_AXBAR_PART_0_MIXER1_RX10_0	0xa4
+#define TEGRA210_AXBAR_PART_0_MIXER1_RX1_0	0x80
+#define TEGRA210_AXBAR_PART_0_MVC1_RX1_0	0x120
+#define TEGRA210_AXBAR_PART_0_MVC2_RX1_0	0x124
+#define TEGRA210_AXBAR_PART_0_OPE1_RX1_0	0x100
+#define TEGRA210_AXBAR_PART_0_OPE2_RX1_0	0x104
+#define TEGRA210_AXBAR_PART_0_SFC1_RX1_0	0x60
+#define TEGRA210_AXBAR_PART_0_SFC4_RX1_0	0x6c
+#define TEGRA210_AXBAR_PART_0_SPDIF1_RX1_0	0xc0
+#define TEGRA210_AXBAR_PART_0_SPDIF1_RX2_0	0xc4
+#define TEGRA210_AXBAR_PART_0_SPKPROT1_RX1_0	0x110
+
 #define MUX_REG(id) (TEGRA210_XBAR_RX_STRIDE * (id))
 
 #define MUX_VALUE(npart, nbit) (1 + (nbit) + (npart) * 32)
-- 
2.34.1

