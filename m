Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010018.outbound.protection.outlook.com [52.101.61.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D56B3B42EB;
	Thu,  1 Oct 2026 13:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790861359; cv=fail; b=C0xGa4ioEsOSY9RCz2u4se0e5ZFiqU1SPwCt2Ge/jDOvmidZ1ilvPJ3GXDCGselJ4uMXoMwTHo6ZUGkuizIdi+DGZj3tSO2qrrt/4YbwWPbwkYMHbvY6E638d2ixJGlAcl3DvNcdBHRJY9Nop7skF150Zvb3uPyI23zUxk0066I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790861359; c=relaxed/simple;
	bh=tqDBmC5EtaruyGbeSuE5jOveOPlRbXYSaP3BgWryerI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=r7HvgDtghKijoqeEzjzMk/bqkt2PFaYq7PhVx7sKXwNx3Nb7v0qFfHVE8b8rlIis69kT2z4jGDauhZb0U2LU7ZwARSkKO6cpopS7qfg8m/A5HkcNN0lxXWuFQFNfundGusD8bQsJ8S27VNQBZUmz53tTC2r3VWubwOympgrRYIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=R1oyUYZ/; arc=fail smtp.client-ip=52.101.61.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="R1oyUYZ/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q6RFKen6NdVi2NKXgSVp0gn3nYp31fubDmq8zr0L52v46h8XyIAVGcknOVie1RKVvtHjz745n/ZfDa+bAHZdxA3KK5M5nkigeY9BFxu4gIYYkcgEfzT7Ub21L+z1dtiOB4cSz7YZUEbSVjwRIWGR2C8U7gIp5FAI4v/J9yaE7D5bbX5rTFqZ3++DfE/ZtvQ6WdmTGROvwLnsu+ZrUMfj7/LEjXktqC4Y3c2CcoAKXgoTBeT+HyQ2Wfu1EJxkovedt2DHl3EHeKl+6C6Let2uQ2aJx5yM6xe2zTR6wWyYYhltxwRUaDWSYVrRBpWeKr81TcjuzHU4ro708KlJpX8IPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=smU7cvlD/qgbnrvLq16ppLYPi+T6QBm1chQeCjzJucw=;
 b=Z1a9MY8DxV/NCXEh+Hb8KO0x9k1zV1wjacUIn6p0Cy7dSV/LgVYSPYBXrlKAxaV12c+8VlcZ4iXtqe0DaFwLPSJ/DkuV719H0qFZScyQQc4VIW94KVHXxhpeTI4H+CYBmmTKN+6L2Q37iF+XgiT5pNPDJEXYn3l2XVc3rt/GBrJkE/IRWr3LtHItC3sJdR+XRVbbu4juXmDV4mMqJPcJcb1u7+xLLxhuVsl1dHlvn08leQoC5a54ib2FHxsHA9gB4hAcWm3Xv4N7rIVEaRUCEa2I+WH1lFcIA2EFBwoCF8MoyROwJcKmlEFw6sK894IV+2HVHbIm9F/TtREMJfgZqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smU7cvlD/qgbnrvLq16ppLYPi+T6QBm1chQeCjzJucw=;
 b=R1oyUYZ/CwB0zF25aR9fxQJOob4i1cxmBQjliRiBiYqPQapf9acjgfgwfJO3wG3SkY/lSHdm3oN97up2W8GN95r4PB/znwZjA+OArqrK5yyUwUZoR/mXAcrx0j8C4HlcLZBUr4R79JECUchiLhVZFecsjn897CQ77rAoVlBdz1F0q6siYQkwfRwvMcuBDlkTIHseSh3BAGNOwd/kIC5kxVs4vQuTDpciyiq0k0Mb+1FWkPRCtCDgL3Sp/riF9V/EgE85tA3QcJNagSDirk0mx7AuCoYLR4N6boImc6i/AVD7TtkEWUMPmveK0Ua4SU1zluq3dFnFVuTSDrIRrb4RlQ==
Received: from PH7P223CA0002.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::28)
 by CH1PR12MB9600.namprd12.prod.outlook.com (2603:10b6:610:2ae::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.27; Thu, 1 Oct
 2026 13:29:03 +0000
Received: from SJ5PEPF000001CA.namprd05.prod.outlook.com
 (2603:10b6:510:338:cafe::1c) by PH7P223CA0002.outlook.office365.com
 (2603:10b6:510:338::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.17 via Frontend Transport; Thu, 1
 Oct 2026 13:29:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001CA.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 13:29:02 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 1 Oct
 2026 06:28:38 -0700
Received: from [127.0.1.1] (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 1 Oct
 2026 06:28:34 -0700
From: Jon Hunter <jonathanh@nvidia.com>
Date: Thu, 1 Oct 2026 14:28:20 +0100
Subject: [PATCH v2 3/3] phy: tegra: Add support for Tegra238 XUSB pad
 controller
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261001-tegra-phy-v2-3-3e453b1fb271@nvidia.com>
References: <20261001-tegra-phy-v2-0-3e453b1fb271@nvidia.com>
In-Reply-To: <20261001-tegra-phy-v2-0-3e453b1fb271@nvidia.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>, JC Kuo <jckuo@nvidia.com>
CC: Thierry Reding <thierry.reding@gmail.com>, Wayne Chang
	<waynec@nvidia.com>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Jon Hunter
	<jonathanh@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CA:EE_|CH1PR12MB9600:EE_
X-MS-Office365-Filtering-Correlation-Id: 98236ff4-fa72-41f0-afa0-08df1fbff583
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|23010399003|1800799024|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	oIYzpGcPlfGbgbinPpLhE6oV67t8mwZ+WrNn2NZ5yodvNm8fTpi8KMLpS/jelxZgAi/7ziSIChpOEYmuAUwUh4wWOqZA8/cgUBG4VmHIXz/0nAmifBVEDKrBz5ekAlev918oAhRbqacXd/IQba4hico9GxWcHO8rsidHotSvKpYdd4OYhcBiIF62sVKZ+SKsoFKeFRXlnT3ISgjkRwtmuE98uQJxhfFb7kF2na+YTejHcrZTv8IIEQKnmgI8VxCxiJyI70Rblh250t5qf9Elyb5Q+nFYBqbN2u/o3ncXnj1TyxjleNsMYVdJSaaLhORCdLyUNXYPQiDDWRjnlW9RABPLyFZUkf6MHxOR/uBZZKPkcX0qLlLPG3TVd1ng/m5ZQnuqDUXi1qQd826ZoWBdEApCLTgy3aXzzN4xkZs6z+LYXI/bMeT8nTmQdoNuVu7K3v3uU/qnYKITGQvA2SEbCbpyKJJEoWDwZzfJ+vJFEzqHG50+kPzf3uOEptTEDypHRzzx6pq3sXcYqvE9TfT5v/mM024i7vuY+mHuZ4EWBbPO8Va6dgPJBsphBhO/ZHNvD8FwCKMVrVYfxYWgc8ucCqoZwAReMLdyiQVYcddm0IVHHqJ+orHR/1X4AhF2KHZbhVu7nthADkSNSWKdDtyrjLMahPWW6j4z8WG92zDCn6SANeZN6Rbdjfp6FHsQkHcqppAsv7H2HhWGj8Ye8zuHyQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dRoX4Vnm8825Vluhx8Jpu7f0ZCYB30WyyHtU1v+/EfHAb+ldW6IpSVyYE0xXkNP9JvpmSzccqIzuU31282pvQAVisHg06UXMd+9vjIhtQE9Xuo573l7jNOI/RgqTevO4pvShGs1SEKUn07wHsY5Y0iGBPfgb/lB5l8EHrbiTzZLQyICfw41LWf37RNSmtVsOOWEmxB8DV9FD/zt1hpOIGUJ1n7qEOQzwttEE0fQ4NxddomJU6cwVHrhrtenQSMOMuN+pWjlE8uRbxUP97TPxc8eYnsbHbdB+CgCAYCcM5jyrPEOnrfpz2d4r1wnhdP36BIp4mv6imiYRQL7m5X3oEc6HMgtP8+FsTg8iumzmZzgGjTvb6BIfHgJ7rNUC+C9FCGF/9603h3acuI6dBCAxht9ZGGrQwal6Tqz3Jlg8ySZ8CoBaF6M/WSdyx48gHTNH
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 13:29:02.7778
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98236ff4-fa72-41f0-afa0-08df1fbff583
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9600

Add support for the Tegra238 XUSB pad controller by populating the
Tegra238 specific SoC data for the controller. The Tegra238 has three
USB2 and USB3 ports, uses the same port ops as Tegra186 and has the
same supplies as Tegra194. Due to the dependencies the Tegra238 device
has on the Tegra186 port ops and Tegra194 supplies, drop the compile
time guards around these structures.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/phy/tegra/xusb-tegra186.c | 29 +++++++++++++++++++++++------
 drivers/phy/tegra/xusb.c          |  6 ++++++
 drivers/phy/tegra/xusb.h          |  3 +++
 3 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
index 322efdea0d8077732d87ee3f958761b773224594..aa8ab94fad4cf0bed231c2d6116a19a4446de145 100644
--- a/drivers/phy/tegra/xusb-tegra186.c
+++ b/drivers/phy/tegra/xusb-tegra186.c
@@ -1599,7 +1599,6 @@ static const struct tegra_xusb_padctl_ops tegra186_xusb_padctl_ops = {
 	.utmi_pad_power_down = tegra186_utmi_pad_power_down,
 };
 
-#if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC)
 static const char * const tegra186_xusb_padctl_supply_names[] = {
 	"avdd-pll-erefeut",
 	"avdd-usb",
@@ -1665,11 +1664,7 @@ const struct tegra_xusb_padctl_soc tegra186_xusb_padctl_soc = {
 	.num_supplies = ARRAY_SIZE(tegra186_xusb_padctl_supply_names),
 };
 EXPORT_SYMBOL_GPL(tegra186_xusb_padctl_soc);
-#endif
 
-#if IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
-	IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC) || \
-	IS_ENABLED(CONFIG_ARCH_TEGRA_264_SOC)
 static const char * const tegra194_xusb_padctl_supply_names[] = {
 	"avdd-usb",
 	"vclamp-usb",
@@ -1755,6 +1750,29 @@ const struct tegra_xusb_padctl_soc tegra234_xusb_padctl_soc = {
 };
 EXPORT_SYMBOL_GPL(tegra234_xusb_padctl_soc);
 
+const struct tegra_xusb_padctl_soc tegra238_xusb_padctl_soc = {
+	.num_pads = ARRAY_SIZE(tegra186_pads),
+	.pads = tegra186_pads,
+	.ports = {
+		.usb2 = {
+			.ops = &tegra186_usb2_port_ops,
+			.count = 3,
+		},
+		.usb3 = {
+			.ops = &tegra186_usb3_port_ops,
+			.count = 3,
+		},
+	},
+	.ops = &tegra186_xusb_padctl_ops,
+	.supply_names = tegra194_xusb_padctl_supply_names,
+	.num_supplies = ARRAY_SIZE(tegra194_xusb_padctl_supply_names),
+	.supports_gen2 = true,
+	.poll_trk_completed = true,
+	.trk_hw_mode = false,
+	.supports_lp_cfg_en = true,
+};
+EXPORT_SYMBOL_GPL(tegra238_xusb_padctl_soc);
+
 const struct tegra_xusb_padctl_soc tegra264_xusb_padctl_soc = {
 	.num_pads = ARRAY_SIZE(tegra194_pads),
 	.pads = tegra194_pads,
@@ -1778,7 +1796,6 @@ const struct tegra_xusb_padctl_soc tegra264_xusb_padctl_soc = {
 	.has_per_pad_term = true,
 };
 EXPORT_SYMBOL_GPL(tegra264_xusb_padctl_soc);
-#endif
 
 MODULE_AUTHOR("JC Kuo <jckuo@nvidia.com>");
 MODULE_DESCRIPTION("NVIDIA Tegra186 XUSB Pad Controller driver");
diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index 0635f0d82c963514603b4265fbaba28b44c2e057..89ce9ac8730060a0c4f1f03a8b848e863cb59efc 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -78,6 +78,12 @@ static const struct of_device_id tegra_xusb_padctl_of_match[] = {
 		.data = &tegra234_xusb_padctl_soc,
 	},
 #endif
+#if defined(CONFIG_ARCH_TEGRA_238_SOC)
+	{
+		.compatible = "nvidia,tegra238-xusb-padctl",
+		.data = &tegra238_xusb_padctl_soc,
+	},
+#endif
 #if defined(CONFIG_ARCH_TEGRA_264_SOC)
 	{
 		.compatible = "nvidia,tegra264-xusb-padctl",
diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
index d8d799d9e752272cd35b77c66f7181719fc12f89..b9de4f3b5781569ae28a13a7fc8aeaa826662bd5 100644
--- a/drivers/phy/tegra/xusb.h
+++ b/drivers/phy/tegra/xusb.h
@@ -514,6 +514,9 @@ extern const struct tegra_xusb_padctl_soc tegra194_xusb_padctl_soc;
 #if defined(CONFIG_ARCH_TEGRA_234_SOC)
 extern const struct tegra_xusb_padctl_soc tegra234_xusb_padctl_soc;
 #endif
+#if defined(CONFIG_ARCH_TEGRA_238_SOC)
+extern const struct tegra_xusb_padctl_soc tegra238_xusb_padctl_soc;
+#endif
 #if defined(CONFIG_ARCH_TEGRA_264_SOC)
 extern const struct tegra_xusb_padctl_soc tegra264_xusb_padctl_soc;
 #endif

-- 
2.43.0

