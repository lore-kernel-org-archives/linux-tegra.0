Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012007.outbound.protection.outlook.com [40.107.200.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4298E3BED35;
	Mon, 31 Aug 2026 18:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788202796; cv=fail; b=dPfB0sZSw+CZ5ZGTbtNB7GCbHZdI9+WthV+SOaaj29QtC4J2ydHWp74Bcw6J9+qOlOTvrOaAzvpQ0FqjFiSmYAUhlVpfy0NLoCiA3xqfcodofEmUqXTEVujhT9lHehluyOnMhndskgfqmXeprsCDUK2Dn+C7K9hEz9AqH7izIYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788202796; c=relaxed/simple;
	bh=vqG1NjeK10bNpm2GB8DH6R9jQUmLwDZPFiYYZaM60vo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KPTy7tJDY7OmbcyQAamEMm3qRhjwd+pktefOlY9KjVhwLOgQkElVnwNYdK6vbQM2xZ3WFyGWw4MBQIf11diEJ4LKgp0Wotu9R0AOziXf8Tj8WKDk9z4BC2QkKgJyZb9SbUVjhHBg2OWKwsqrNlQ496OjqsMeqbJVyjxBra6WXZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nKgAwlUv; arc=fail smtp.client-ip=40.107.200.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nKgAwlUv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LC7EbTtCcQAgX/8b0iVDM4doGtHmfW1RQRQkSlyP5/S9TmXjS++hL/HZguUMbUD7SQcG97H85JHhsxud1iMWp0y+DunlmmYRg+RcRh9OQjiCIQUO6i2N7gmeOJfpFlb0udXcYXFYcMly3stxr13HwxuXhgAfLX2OVw9BcEgkOmVmpuYmjkfFhDXNun4qGGWO0pNmnj3H2sbJpAgcVX//u5JHO0VCUgM9tS9156DcnRg/d92A9VD0xY0kN9/bVJwPZBOdWVMnaoV/SQl6KcMNsX8YQtruMaReu7uUC6zXCKMWiYa+ZNe2VUDJPPVY+/w9KT7Q+CpiOPHzr6sEtjKiBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HF3kxcf0d2ufBP2i1WUE/jBvuQfuwR5XvGT9SCFgZGo=;
 b=SFvBFR+dV8gki/4WOSa4Ys69yO3o2ukl/HCipB6+WYS+6uIX5hPWkXfSUjfcZ+ez697S/0KzrDFU77JB058f/E6LbVpHb/7aKrncDllv/eTEta5ufCA4MhjgLA3xwkVok5hQWL9ytUwGijdyTEFjEoKspy/CQiRm/8vs16b7OZcPBWZ38p6x+zb3GRsnsI2vrON5hJI65mNz+ZRMnVCpFJ88z1Lx0fRjfe4OrlOqx1d6Vmfchs54Z2ypWShmjI116kABds4glMULRPs/qXB8KVSjnOkD8DaMurOMRINgkNOoh+72sHCp5j/61TX9j58epcZv2HZLd+9K/8q1AUgBeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HF3kxcf0d2ufBP2i1WUE/jBvuQfuwR5XvGT9SCFgZGo=;
 b=nKgAwlUvFXB+7vQe1QEENKXJ/ZligVxCnykL5n2A04TwzpaWz69h2PBx4CnHWhfSNPKtuaSdW9Tia1IPZLyWGuY6qnvryM3IhW2RTQY6NqLW2Y8YMkvGU23JI7JwtXmhMFHnOVypdvqY2RmgYyGKjBYnpqZVMjTe19cd0BLzTfTCCBOd95LLonJbPdrZit7B7cEIW3Em0aubZWeqYuvDmqa/f4qEGTxWZKVuwJ+cPGKpG7TotVzGaMMtHz69tmqYL9rmYqTFiAn0lmIDpjK9UoHyYwpVgajxxi3McxnYJsURDCSRNTPjiDIjRIuABrb6FKS0g6RjPJq+GCPWbu13mA==
Received: from PH7P220CA0024.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:326::11)
 by SJ5PPF6375781D1.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::995) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 18:59:41 +0000
Received: from SA2PEPF00003AE9.namprd02.prod.outlook.com
 (2603:10b6:510:326:cafe::3b) by PH7P220CA0024.outlook.office365.com
 (2603:10b6:510:326::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 31 Aug 2026 18:59:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00003AE9.mail.protection.outlook.com (10.167.248.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Mon, 31 Aug 2026 18:59:40 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 31 Aug
 2026 11:59:07 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 31 Aug
 2026 11:59:06 -0700
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.46 via
 Frontend Transport; Mon, 31 Aug 2026 11:59:03 -0700
From: Wayne Chang <waynec@nvidia.com>
To: <mathias.nyman@intel.com>, <vkoul@kernel.org>,
	<neil.armstrong@linaro.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <gregkh@linuxfoundation.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <waynec@nvidia.com>, <linux-usb@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: [PATCH V2 6/8] phy: tegra: xusb: Add Tegra264 support
Date: Tue, 1 Sep 2026 02:58:33 +0800
Message-ID: <20260831185835.3732707-7-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260831185835.3732707-1-waynec@nvidia.com>
References: <20260831185835.3732707-1-waynec@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE9:EE_|SJ5PPF6375781D1:EE_
X-MS-Office365-Filtering-Correlation-Id: adacfdc7-0209-4f17-9baa-08df07920321
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|82310400026|1800799024|23010399003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MLPZIcMw6heUJXH02WXpwYEpqTMHss7nMgwcwVHLJomg7yBDyBtEoULAEqnJHOnbjl1I4ioscIY3TwCm3iEEL28Ko3lyknspCHSaazyxHsXwMDzOsRy9ASN7fC9N8AG51CWUXRiuNchR7tmM0PH6gzSn9gPaop6YXyC1TGV120qDKwCuqq1Page6Txelm8fgaxLy7mii9w1vUOg24kYAZoKe8dREIcmIvPzaKYnCBp99t2550uXzyifXqse2R1hwd8sKVIQWrQSJBsQSwZGKXHGJGJCbcFL843VhjedbSVEKFQ3PJ+paPoVtsDY/VnA/1qKfw+9Kc7i6cYYfA+n9F4CSCBPjZf/NIYG3IOvPf818RdRxWluy9mgi4dxVRxJhxlMIQZx7LDUVYVyhBVDXTVLMzgo/UQU1EGEp+Ggj8PmMAU1LNijwW5Fnc2KynXGBsRc21n9XV14IfXPvRePFOAMjqXzjOgia7JWNUHoDQIwqmvkc2JEBR2MIbdxN0GKs5iku4F2rJ1wOjOamYzGYOUa7EslwNK0fDgcwUAFdTQiHGVRUsYd1F88LWazJyLlgzLo/kz+roiAXVsRkx/wf4xLTTI2B7cr21LXDQi7ssl3QA839xf0O3e918uh6npSnRUFVZ/OeC0ehLy5VAw3mVsctL+vtpODmtKvvUxIl4nE/N1mtwuDVOtJbs24rX60VmB6rQ43nHtHwzryl4DeOoQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(82310400026)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9V9PWn+H0K7RgnX+CNMxXG+WrLH1MIdSXAkAazU+fTKEUeTam+dzIOz2uTJGZDRPm4n5/2EVtfIUAgyAw4PJWdQtj9aB6TH5ca1uV/T6TsCYL2eSeify45FJZdEewEuhQLqpWgD9Wv+RfIDZbd66QKCbHAH0ue7ZO5BLE/31dr0znItSnfmHgGZi30pJNgZYIhGcLpDWf8+HeOQMXPn634hTY/ps2/o2LFV7CT+F3AbWk1SGjHspI0lpl1/Z0QGYi8lHT6G+6Q0zPfnG0S49JTA8cB9QDEoLiKzZF1PbyjOBEPofPuf/v9Fyf/vMPb1P/fqv1C2Tire0SgrEph6LouZwx6hxSpbHYGG1lgtyaIDQcb2s6Dg9dIvM+rWTq1uWsW8YqymuTo0mTia/4+4tYV+rMgUs7BU105eKeAxfMh6FMu2BF+JSuiPyL/69I6ZT
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 18:59:40.7656
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adacfdc7-0209-4f17-9baa-08df07920321
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF6375781D1

Add support for the XUSB pad controller for Tegra264. Most of
the Tegra264 XUSB PADCTL registers definition and programming sequence
are the same as Tegra234, Tegra264 XUSB PADCTL can share the same
driver with Tegra186, Tegra194, and Tegra234 XUSB PADCTL.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
---
V1 -> V2 : Rebase and update the has_per_pad_term for Tegra264
 drivers/phy/tegra/Makefile        |  1 +
 drivers/phy/tegra/xusb-tegra186.c | 27 ++++++++++++++++++++++++++-
 drivers/phy/tegra/xusb.c          |  6 ++++++
 drivers/phy/tegra/xusb.h          |  3 +++
 4 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/tegra/Makefile b/drivers/phy/tegra/Makefile
index eeeea72de117..33a695d4ed59 100644
--- a/drivers/phy/tegra/Makefile
+++ b/drivers/phy/tegra/Makefile
@@ -8,4 +8,5 @@ phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_210_SOC) += xusb-tegra210.o
 phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_186_SOC) += xusb-tegra186.o
 phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_194_SOC) += xusb-tegra186.o
 phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_234_SOC) += xusb-tegra186.o
+phy-tegra-xusb-$(CONFIG_ARCH_TEGRA_264_SOC) += xusb-tegra186.o
 obj-$(CONFIG_PHY_TEGRA194_P2U) += phy-tegra194-p2u.o
diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
index 9c1bcd4a72ac..322efdea0d80 100644
--- a/drivers/phy/tegra/xusb-tegra186.c
+++ b/drivers/phy/tegra/xusb-tegra186.c
@@ -1668,7 +1668,8 @@ EXPORT_SYMBOL_GPL(tegra186_xusb_padctl_soc);
 #endif
 
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
-	IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC)
+	IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC) || \
+	IS_ENABLED(CONFIG_ARCH_TEGRA_264_SOC)
 static const char * const tegra194_xusb_padctl_supply_names[] = {
 	"avdd-usb",
 	"vclamp-usb",
@@ -1753,6 +1754,30 @@ const struct tegra_xusb_padctl_soc tegra234_xusb_padctl_soc = {
 	.has_per_pad_term = true,
 };
 EXPORT_SYMBOL_GPL(tegra234_xusb_padctl_soc);
+
+const struct tegra_xusb_padctl_soc tegra264_xusb_padctl_soc = {
+	.num_pads = ARRAY_SIZE(tegra194_pads),
+	.pads = tegra194_pads,
+	.ports = {
+		.usb2 = {
+			.ops = &tegra186_usb2_port_ops,
+			.count = 4,
+		},
+		.usb3 = {
+			.ops = &tegra186_usb3_port_ops,
+			.count = 4,
+		},
+	},
+	.ops = &tegra186_xusb_padctl_ops,
+	.supply_names = tegra194_xusb_padctl_supply_names,
+	.num_supplies = ARRAY_SIZE(tegra194_xusb_padctl_supply_names),
+	.supports_gen2 = true,
+	.poll_trk_completed = true,
+	.trk_hw_mode = true,
+	.supports_lp_cfg_en = true,
+	.has_per_pad_term = true,
+};
+EXPORT_SYMBOL_GPL(tegra264_xusb_padctl_soc);
 #endif
 
 MODULE_AUTHOR("JC Kuo <jckuo@nvidia.com>");
diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index 9d74c0ecc31b..d0d0b252a205 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -77,6 +77,12 @@ static const struct of_device_id tegra_xusb_padctl_of_match[] = {
 		.compatible = "nvidia,tegra234-xusb-padctl",
 		.data = &tegra234_xusb_padctl_soc,
 	},
+#endif
+#if defined(CONFIG_ARCH_TEGRA_264_SOC)
+	{
+		.compatible = "nvidia,tegra264-xusb-padctl",
+		.data = &tegra264_xusb_padctl_soc,
+	},
 #endif
 	{ }
 };
diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
index 77609e54de66..d8d799d9e752 100644
--- a/drivers/phy/tegra/xusb.h
+++ b/drivers/phy/tegra/xusb.h
@@ -514,5 +514,8 @@ extern const struct tegra_xusb_padctl_soc tegra194_xusb_padctl_soc;
 #if defined(CONFIG_ARCH_TEGRA_234_SOC)
 extern const struct tegra_xusb_padctl_soc tegra234_xusb_padctl_soc;
 #endif
+#if defined(CONFIG_ARCH_TEGRA_264_SOC)
+extern const struct tegra_xusb_padctl_soc tegra264_xusb_padctl_soc;
+#endif
 
 #endif /* __PHY_TEGRA_XUSB_H */
-- 
2.25.1

