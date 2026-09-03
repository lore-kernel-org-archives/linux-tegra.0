Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011003.outbound.protection.outlook.com [40.107.208.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD6A40B0F3;
	Thu,  3 Sep 2026 07:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788420026; cv=fail; b=qoyXoXWSGRuxTYce0TmyFFF1wwuNPSmgILoqDaGHu2k6gs9/X79O2W9T/tfIk3eqApIGcdIa/Pm3HBzMTKxl/yKBf9nyfkRhtI0iMqfY2cFAXsSBvI06IxEyysKl9aaZLm46k5FDqgv1B7nxRcNCV3qmya0zgjc44t+9tqX72B4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788420026; c=relaxed/simple;
	bh=4Go2NXhhW7cBQXHA4ekKCIIvxmtHE99Dl/0tJWDogcg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QjdKEJCRtrhmDsn96InNVnxOTh1vVj4swDgRVQ1VHRbajHKsM4CfP0e2ZZZn9QQFkGnq/8MHFa6zAcjzAGRmJrN3UMSA2y+hGNKEutZdJDysMp67We5tqUPDNo33Mq/rf7aXKLPJdm19oLej3/0iXu1TXsiProUUOh8EnpDZ000=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Z5KnUfJp; arc=fail smtp.client-ip=40.107.208.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Z5KnUfJp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fod7TcSIx0r9KeK3uwaNE1DT8cVhHIztRrqqjfnz125e+OeqSJszImTfOLyMXZ3dqUWAJ7S/7mgleoUyqI7z0OKV507kgxZbGs26dJOTUR8TJNOSTgU+KGZHStX+QgDOadmX8rc0WBsGWQ3EcuOZBja8oFLkuolzqJkcooIJ9+4YK84kB41m/sTt8jySNTrJy1/Pn+Wv1EJTWq4xMbXWUIKh7LwyiLRjMH1unaufTj+thZ/ScxuFBnRs4fCjHuC0mhkyDKkBw89aNL+omkuvXDUmYX+LWBFEHSfr8tuJqinelZiGgXZkFWjDV8zHInHgbx8WX8lKLtdE19+iRRrjBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Lt71KdVBb2eX69CwP8/oiMZpe7u/bsRDOP1JNMslmA=;
 b=bKpBeCYRM4l7DER5LsdSs0fTkVtRQ2o1jKEH/icELM3VqNKZTOYuUtPvgFm3kE9c2B5pC4C5GSt7DxKk6gsHlc+5kAitjcIbZNVqXQ6FRmrURU/UpltaEGmai6A6JVhY2OQme0c5xRf9h4y/uVQIW0iQlW/JPsF9+mmMBf+njdYqjrYKlVWVLW8HHGSGU+ztAggDyxY1w6GY3pOiFm1+vuWysS+f+fHNlxAqBhkSK/GtCC5hr8jkCGCRMBPJHHx1YKw9Bz/NnY99MFZJeOlwWxMrZU120o/9/2rOwAYs+norLitvO5N6tUvcG794vqVQh1LpcupC2oUuMzSkUvw9OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Lt71KdVBb2eX69CwP8/oiMZpe7u/bsRDOP1JNMslmA=;
 b=Z5KnUfJpRVwaEXP6AcJ+NRCNuczgtl27sKNXQCyCGg+kERHCEgVOajfip9U3K5HdiIyHgpq2YwsobujN6qYjyyRB4pp2fs3TTmjiwVkS9FBCvGsLQhx/FAAnJQbkYahDIMe91As3gZqRWyC5Pl7n/HOJ6mINgO5Z5B4qjPSqw/pefSSGfKFu8em7trH5IcE9Df2AYPadgOsKh/1+eX0E0EkV4TgLbe7nszTOzAwrX2YrUnnHhqv0eFjsWC/2nItX4RuzTFcX1J8TtrFwDay7QdN7Iq9RTq9vZuNLz4TRNzdLegcj9A2KCoZ0mebG38JXBt30CSCYn0Bxjp0lNDdvrg==
Received: from CH0PR03CA0073.namprd03.prod.outlook.com (2603:10b6:610:cc::18)
 by DM6PR12MB4041.namprd12.prod.outlook.com (2603:10b6:5:210::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 3 Sep
 2026 07:20:14 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:610:cc:cafe::4e) by CH0PR03CA0073.outlook.office365.com
 (2603:10b6:610:cc::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Thu, 3
 Sep 2026 07:20:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CH2PEPF0000013C.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 07:20:14 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 3 Sep
 2026 00:19:59 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 00:19:59 -0700
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.46
 via Frontend Transport; Thu, 3 Sep 2026 00:19:56 -0700
From: Wayne Chang <waynec@nvidia.com>
To: Vinod Koul <vkoul@kernel.org>, JC Kuo <jckuo@nvidia.com>, Thierry Reding
	<thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, Manivannan Sadhasivam
	<mani@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Wayne Chang
	<waynec@nvidia.com>
Subject: [PATCH V3 4/4] phy: tegra: xusb: Add Tegra264 support
Date: Thu, 3 Sep 2026 15:19:37 +0800
Message-ID: <20260903071937.533646-5-waynec@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260903071937.533646-1-waynec@nvidia.com>
References: <20260903071937.533646-1-waynec@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|DM6PR12MB4041:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e0dee7c-1956-4e77-8627-08df098bcc5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|7416014|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	LRrwnikrPsCUkqrzUP67qRjIuUJnMzjzCB+eS63/q4ilhQ3r/02Cn6xZqnEArhMmjd5aFRwW0TeGF5sKVbitKogaAUlHySRpgh3rPpkT8pcyj9I3jyjLggZNjnz9TBUmvJtl2fX13D0lscAygwSF1/BnkNkWNL9fskeIDQ5mMBjfrGe+1OoBRjx17gbUShospPdQGn91glZ0cTTIpgE/O6n0M5xaUfAYtOB5gUXLJG5GRbe8kjSG2dKyE7cuXAGiyHKLU+Od6Z4Pw7uQS0uiPSwYD3nchZ2/OeITGKZdhBg4PA3FuDSp0cDndi3h9jg8WPPR/UG3KzkqiTMBvz1P1cvdSC1ZZKit0sCZDUjSViVC32ggwYQ1UyYDYUZdudOa1AkYmsy4emmS66YxNtsMno6xjumbTwRz6w1l8QoMY93rWiP+ZeMXpY5KkmLTBcbxEAIkB5Vlx2LLRIsiilJBSRNGlm+q0Pj05iJw3mxN7Kx4lUpD0ijK9VylCI+gI5SZ+OL3AgbaJRkD4fdwyh4BLWthuFFx6iFGlaLTOySqPD6Som7Q/XHDkS2ojjFjjVju+BdDlxcPiAv2/raOTara9Dy0fmqoBE3r4V+/Qz7uRWQIbhwhg1RZIcA7kTKtNNc0s+bLDH53T7aHoF1NQFW/t1FNbsLt0YBZtQxjTB2S9JDI77OHjG8oqpsY4kyMQOtpmMJap9gLu/sVXnVlG0sw0g==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(7416014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ivVNMvx5N2P+6VgTkriwsZvwpSJ8dCE7qEcLYB73rtYQi/X/4PJcoZwBmNyf0LlRnAgSW7GBw2ST8R/hg68zBAUE3QIsANg9cvBQtqP4WQyQk0PUGPTFu6cOQJ96ygleoXJolRDhPgXtgU0HU9S2alWK9n5qqf4pfVDDnjjHPB+W1FUWCQSmhRHdLa/I0WSir5RINOE/5Ybkk2BErtM1os1eVZAL/PKr75G2DS35FFkg1nqyD1Y7oZMin2iGjZcoFps8f0VtyRX48DZNi6XOU2lwkrEgn3Ajqut0Czv6V+aUylrfckC1oL+XaxgrIeKZhZ+Qy6rsrfdiMXHli6CuT2QLfxMvkrRpp8SBV7uNGe7YFADR8EfbLZTdsEw80gj5kFVH39zXUjOeH9TP6Eqo/V1VTuMJ+xBkvorD0p2Q9SoXgQ6k4ktU+74GTGWEwVF+
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 07:20:14.2120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e0dee7c-1956-4e77-8627-08df098bcc5b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4041

Add support for the XUSB pad controller for Tegra264. Most of
the Tegra264 XUSB PADCTL registers definition and programming sequence
are the same as Tegra234, Tegra264 XUSB PADCTL can share the same
driver with Tegra186, Tegra194, and Tegra234 XUSB PADCTL.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
---
V2 -> V3: No change
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

