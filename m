Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012011.outbound.protection.outlook.com [40.107.200.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128673803D8;
	Mon, 27 Apr 2026 07:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777275296; cv=fail; b=cdNe4tUSInWqiwK+y2hRvGkW55IgE6bibFZLYoPHneOuOXp9TO/tsRR18A3dNKXnrS0mqIuv87okCbKjgx2mC3C0SUo4MfU+mR17kxKvqfEXGh9+lYWrRK7UqB/4pwQF1PlVQ2Qb9e+d42Uuin90rXi0QqaKJcvdLbn306woAdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777275296; c=relaxed/simple;
	bh=GA+o0VZoXJIvEzbXk0OpEvNZ+HBvfKOK5HiUB2v4HRQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YXjwGR78kPFIng53OUoTThhXsHRKa5WHS6hip7TpnSFh47S63UDfQNwaPazCFW7x8rMeMU5YwdUmx6vNU+biksHVmS2kX5KVtbiEj/9Qr2q/pyQum1rN5I/ZRIzEHshMtg0xKG29bSO2kawoo6Q67iTsBjCXhm/ovKrryuD/QIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ztzvj6NL; arc=fail smtp.client-ip=40.107.200.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ztzvj6NL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sChNwVFiMF6wsESBwn0D3kXWKjXOjdP2Aj7GUazuVaLUjNYxrRww3f975vgGmezZFY7EaL4Pzx3B+d4g0PjPvMCgTSk1WXble2G2q53vMP0wSZUe5vbExx6BwFwCRbVgnOK9kcCbQGTVwtgqWyfXQ5fgQs0eD5KgSzMgOE3B3H1AHzWOPevA2znfazfeZBCTODviIVqUbgUpkM/M3wyVf0sTNF1VbOb/rQEpIPn5U+Vh0XI2zRiCQzQw5UP3PaFVmwNOdO25hX7XNq71OK0mjq67mymi1rLIcd4way6zbFuirVSEFyZfpJiYtikl2UV0u33xjqnBgH/9GmnzZZRf9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g6ZE+EyvdYhaBAsKz5of2of45SOvrU2pZ72lubJsmr0=;
 b=UAdkimrE15Z+A36tNCNjYupy/rcxzrziEnmkRnZN/1D8gpKiGGJC5+oVJ1eiKYamWQgu0BPL4j8nYu1b3WpICpNyjOto0kgjknXudifatcMaRTY0+OFt/pWn1/4eAB46CGwliiUOnjCbXOwIsMg0Aea6jB55WpFxSFGlx2eAGcut5S9ev9PK7lJFVZ6g6f4MzvUBe9rHxDs6s0MEHptssAl72xal2QcA+sDWY0jYfbecO078AjYrkG9/YIbwaSImLW4l9tkIlk3P3KbEIk6Bxm4aEOWjU9bQ5wpFqggAmfj4+Faxdvrgdal90WAns3YN57Hoft6UdeSaAIj8O9MNVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6ZE+EyvdYhaBAsKz5of2of45SOvrU2pZ72lubJsmr0=;
 b=Ztzvj6NLUxWJHAs8g+1o4WnGHvGqDiQbI5JuEystQArQPnLXE3hoknB8pvUYkuojjiRKvmTZxnWMn58Q+4lOXmXIicMQ8g7BixuBUENS7pMR3XpmbYUGWzI9x6wiAYst/fpYr8W4fU5VLHxBMvWX4sn/aq3uLBvvUroOBh0o3LTflJQxiBZTieSQn+00BwjcYaybOmb1yANMrqbl2LILNslkf4ugS+CxYkRHjmvJ1Zsc1uchQnbevzI59mMifHfBDQVm8SVz/t/ibjKXGAaoWEtpSpmD1SueTeMMiZeExrChcIG847Es/20l21v8i0PCHYgf9l7s+RqViYoYBkc5mw==
Received: from SJ0PR03CA0211.namprd03.prod.outlook.com (2603:10b6:a03:39f::6)
 by MN0PR12MB6056.namprd12.prod.outlook.com (2603:10b6:208:3cc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Mon, 27 Apr
 2026 07:34:42 +0000
Received: from SJ1PEPF000023D7.namprd21.prod.outlook.com
 (2603:10b6:a03:39f:cafe::82) by SJ0PR03CA0211.outlook.office365.com
 (2603:10b6:a03:39f::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 07:34:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ1PEPF000023D7.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.0 via Frontend Transport; Mon, 27 Apr 2026 07:34:42 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Apr
 2026 00:34:35 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 27 Apr 2026 00:34:35 -0700
Received: from build-amhetre-focal-20250829.internal (10.127.8.12) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Mon, 27 Apr 2026 00:34:35 -0700
From: Ashish Mhetre <amhetre@nvidia.com>
To: <krzk@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<=thierry.reding@kernel.org>, <jonathanh@nvidia.com>, <sumitg@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, Ashish Mhetre <amhetre@nvidia.com>
Subject: [PATCH V2 2/2] memory: tegra: Add T238 MC support
Date: Mon, 27 Apr 2026 07:34:19 +0000
Message-ID: <20260427073419.567360-3-amhetre@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260427073419.567360-1-amhetre@nvidia.com>
References: <20260427073419.567360-1-amhetre@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D7:EE_|MN0PR12MB6056:EE_
X-MS-Office365-Filtering-Correlation-Id: f21a712f-5609-423a-9f94-08dea42f7263
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	6FZIqyCWZ92yFunjxM8mLCg7/GZPreUv5NMSkolFi3AAPExxHsj16GvA4zqDCu1U8xWTywe02tzQljiwXEiHdhrl2faHtcbxlPL0LEJcGbbWKxcDi1nKPgT0lvvRQc1zmQEhATfdIKDZMNHbaEy+HPh/7ChdMf1DjLJOPDf2/oZL4esXDsugRNyoKrhKF8pjpuZqzKhphDJwuCMWojfI+XzR3cN3y5eD0DmZEXCqdC2144IZKYdjeGDI5dp86zMzYhBVqtZ5EhPUb72nkSe+DqUNGNYXlYEWkvQMNy88PHUpgmDOwgjx8j3mtWgfkiGPzTLZWgF4oOK8q6kOSdykF7CmIqH30xpYcU2fxNRcu1nQiMKz6RYAsYZnTyWk0o25m20MZnUJRZKrnfSnBqdy3N4GbFQw+LsDa5OLvlE9YR0qiRbQTnZ2fB5WiXFUKjDeV9Q98iEUvpI5wiR5au4Wky9bk13cjQHGF8jZDINKUWw8xc4zY+oUbr8ms5K3LL60H40WDY2qcmQUztHLJybq9QhGtCRFe7Pxsvu8F58q9fXMIYF6ihsU7T8a9PudYE4ZFW8/sXfkF6gr2WnxNsPGZt9UbwGCgsnEAhc23KAX3tDfZDr5j9sdDXSiZfkoU/bsYuXdyrNv8xC18+Tq0AlFeVax6OQDxNBtAeieu/+cvHAb9gBblLK+OhgMYw8J66+2d6hiLtljPnadSlOBD94pW2GNQq75qb1hHALbV/CXlHeRb2kyGbyOOrVIsz+QHVUSM0EjeSg22AVpCu1pEMQOvw==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aL3DhKnURcR1R28x1Ok4QUiHXnnFRdYIKNiptZClGzxHmaCNk8KrwTHVHXNdPlssqGgwsXdextfwkrAGp9AP5+nrutJgP/dgRjwRxPgXC9N6bjSg6o50QsWbDEf/QW+syFmhpSQrrA3/06juZo7YCszRMIWRaQN1Bcn17aeIBFocF3Edbdi0mo3CloaB4NL9Pl6GQR9IoF5XQpw8zkuFLSiTD2nXEoodEpC72OXbz8Yr4xNOIiwiuZ36qEWMubXZwiwpBZ7X52aGsIR/rKHXs+35R49IUuaACV9Dnq29qy5QPwBSUr7j8NdzI3smyrv1UwY/WYykJXoyFLc0DSUvFnOA6MHh+HPOYu7BXTAu7IUjn4+cAeqo1kRrDxrIbjVwxcp14ALEKqv4WA8mYDfORQikb4+TDMFJvgo+Sdo6K5QP+s3+IucSH7Y7QygUjoTp
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 07:34:42.2540
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f21a712f-5609-423a-9f94-08dea42f7263
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6056

Add Memory Controller driver support for Tegra238 SOC, including:
- MC client definitions with Tegra238-specific stream IDs
- Reuse of Tegra234 ICC operations for bandwidth management via BPMP-FW
- Device tree compatible string "nvidia,tegra238-mc"

Export tegra234_mc_icc_ops so it can be shared with the Tegra238 MC
driver, as both SoCs use the same ICC aggregation and bandwidth
management logic.

Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
---
 drivers/memory/tegra/Makefile   |   1 +
 drivers/memory/tegra/mc.c       |   3 +
 drivers/memory/tegra/mc.h       |   9 +
 drivers/memory/tegra/tegra234.c |   2 +-
 drivers/memory/tegra/tegra238.c | 391 ++++++++++++++++++++++++++++++++
 5 files changed, 405 insertions(+), 1 deletion(-)
 create mode 100644 drivers/memory/tegra/tegra238.c

diff --git a/drivers/memory/tegra/Makefile b/drivers/memory/tegra/Makefile
index 6334601e6120..7c2fca12076b 100644
--- a/drivers/memory/tegra/Makefile
+++ b/drivers/memory/tegra/Makefile
@@ -10,6 +10,7 @@ tegra-mc-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210.o
 tegra-mc-$(CONFIG_ARCH_TEGRA_186_SOC) += tegra186.o
 tegra-mc-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra186.o tegra194.o
 tegra-mc-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra186.o tegra234.o
+tegra-mc-$(CONFIG_ARCH_TEGRA_238_SOC) += tegra186.o tegra234.o tegra238.o
 tegra-mc-$(CONFIG_ARCH_TEGRA_264_SOC) += tegra186.o tegra264.o
 
 obj-$(CONFIG_TEGRA_MC) += tegra-mc.o
diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index d620660da331..10ef3c323e22 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -49,6 +49,9 @@ static const struct of_device_id tegra_mc_of_match[] = {
 #ifdef CONFIG_ARCH_TEGRA_234_SOC
 	{ .compatible = "nvidia,tegra234-mc", .data = &tegra234_mc_soc },
 #endif
+#ifdef CONFIG_ARCH_TEGRA_238_SOC
+	{ .compatible = "nvidia,tegra238-mc", .data = &tegra238_mc_soc },
+#endif
 #ifdef CONFIG_ARCH_TEGRA_264_SOC
 	{ .compatible = "nvidia,tegra264-mc", .data = &tegra264_mc_soc },
 #endif
diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
index 649b54369263..e94d265d7b67 100644
--- a/drivers/memory/tegra/mc.h
+++ b/drivers/memory/tegra/mc.h
@@ -240,6 +240,14 @@ extern const struct tegra_mc_soc tegra194_mc_soc;
 extern const struct tegra_mc_soc tegra234_mc_soc;
 #endif
 
+#if defined(CONFIG_ARCH_TEGRA_234_SOC) || defined(CONFIG_ARCH_TEGRA_238_SOC)
+extern const struct tegra_mc_icc_ops tegra234_mc_icc_ops;
+#endif
+
+#ifdef CONFIG_ARCH_TEGRA_238_SOC
+extern const struct tegra_mc_soc tegra238_mc_soc;
+#endif
+
 #ifdef CONFIG_ARCH_TEGRA_264_SOC
 extern const struct tegra_mc_soc tegra264_mc_soc;
 #endif
@@ -256,6 +264,7 @@ extern const struct tegra_mc_ops tegra30_mc_ops;
 #if defined(CONFIG_ARCH_TEGRA_186_SOC) || \
     defined(CONFIG_ARCH_TEGRA_194_SOC) || \
     defined(CONFIG_ARCH_TEGRA_234_SOC) || \
+    defined(CONFIG_ARCH_TEGRA_238_SOC) || \
     defined(CONFIG_ARCH_TEGRA_264_SOC)
 extern const struct tegra_mc_ops tegra186_mc_ops;
 #endif
diff --git a/drivers/memory/tegra/tegra234.c b/drivers/memory/tegra/tegra234.c
index 87b22038a5fb..9fbd34d4abe0 100644
--- a/drivers/memory/tegra/tegra234.c
+++ b/drivers/memory/tegra/tegra234.c
@@ -1125,7 +1125,7 @@ static int tegra234_mc_icc_get_init_bw(struct icc_node *node, u32 *avg, u32 *pea
 	return 0;
 }
 
-static const struct tegra_mc_icc_ops tegra234_mc_icc_ops = {
+const struct tegra_mc_icc_ops tegra234_mc_icc_ops = {
 	.xlate = tegra_mc_icc_xlate,
 	.aggregate = tegra234_mc_icc_aggregate,
 	.get_bw = tegra234_mc_icc_get_init_bw,
diff --git a/drivers/memory/tegra/tegra238.c b/drivers/memory/tegra/tegra238.c
new file mode 100644
index 000000000000..938c8985600e
--- /dev/null
+++ b/drivers/memory/tegra/tegra238.c
@@ -0,0 +1,391 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026, NVIDIA CORPORATION.  All rights reserved.
+ */
+
+#include <soc/tegra/mc.h>
+
+#include <dt-bindings/memory/tegra234-mc.h>
+#include <dt-bindings/memory/nvidia,tegra238-mc.h>
+#include <linux/interconnect.h>
+#include <linux/tegra-icc.h>
+
+#include <soc/tegra/bpmp.h>
+#include "mc.h"
+
+static const struct tegra_mc_client tegra238_mc_clients[] = {
+	{
+		.id = TEGRA234_MEMORY_CLIENT_HDAR,
+		.name = "hdar",
+		.bpmp_id = TEGRA_ICC_BPMP_HDA,
+		.type = TEGRA_ICC_ISO_AUDIO,
+		.sid = TEGRA238_SID_HDA,
+		.regs = {
+			.sid = {
+				.override = 0xa8,
+				.security = 0xac,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_HDAW,
+		.name = "hdaw",
+		.bpmp_id = TEGRA_ICC_BPMP_HDA,
+		.type = TEGRA_ICC_ISO_AUDIO,
+		.sid = TEGRA238_SID_HDA,
+		.regs = {
+			.sid = {
+				.override = 0x1a8,
+				.security = 0x1ac,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_SDMMCRAB,
+		.name = "sdmmcrab",
+		.bpmp_id = TEGRA_ICC_BPMP_SDMMC_4,
+		.type = TEGRA_ICC_NISO,
+		.sid = TEGRA238_SID_SDMMC4A,
+		.regs = {
+			.sid = {
+				.override = 0x318,
+				.security = 0x31c,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_SDMMCWAB,
+		.name = "sdmmcwab",
+		.bpmp_id = TEGRA_ICC_BPMP_SDMMC_4,
+		.type = TEGRA_ICC_NISO,
+		.sid = TEGRA238_SID_SDMMC4A,
+		.regs = {
+			.sid = {
+				.override = 0x338,
+				.security = 0x33c,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_APER,
+		.name = "aper",
+		.bpmp_id = TEGRA_ICC_BPMP_APE,
+		.type = TEGRA_ICC_ISO_AUDIO,
+		.sid = TEGRA238_SID_ISO_APE0,
+		.regs = {
+			.sid = {
+				.override = 0x3d0,
+				.security = 0x3d4,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_APEW,
+		.name = "apew",
+		.bpmp_id = TEGRA_ICC_BPMP_APE,
+		.type = TEGRA_ICC_ISO_AUDIO,
+		.sid = TEGRA238_SID_ISO_APE0,
+		.regs = {
+			.sid = {
+				.override = 0x3d8,
+				.security = 0x3dc,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_NVDISPLAYR,
+		.name = "nvdisplayr",
+		.bpmp_id = TEGRA_ICC_BPMP_DISPLAY,
+		.type = TEGRA_ICC_ISO_DISPLAY,
+		.sid = TEGRA238_SID_ISO_NVDISPLAY,
+		.regs = {
+			.sid = {
+				.override = 0x490,
+				.security = 0x494,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_NVDISPLAYR1,
+		.name = "nvdisplayr1",
+		.bpmp_id = TEGRA_ICC_BPMP_DISPLAY,
+		.type = TEGRA_ICC_ISO_DISPLAY,
+		.sid = TEGRA238_SID_ISO_NVDISPLAY,
+		.regs = {
+			.sid = {
+				.override = 0x508,
+				.security = 0x50c,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_BPMPR,
+		.name = "bpmpr",
+		.sid = TEGRA238_SID_BPMP,
+		.regs = {
+			.sid = {
+				.override = 0x498,
+				.security = 0x49c,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_BPMPW,
+		.name = "bpmpw",
+		.sid = TEGRA238_SID_BPMP,
+		.regs = {
+			.sid = {
+				.override = 0x4a0,
+				.security = 0x4a4,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_BPMPDMAR,
+		.name = "bpmpdmar",
+		.sid = TEGRA238_SID_BPMP,
+		.regs = {
+			.sid = {
+				.override = 0x4a8,
+				.security = 0x4ac,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_BPMPDMAW,
+		.name = "bpmpdmaw",
+		.sid = TEGRA238_SID_BPMP,
+		.regs = {
+			.sid = {
+				.override = 0x4b0,
+				.security = 0x4b4,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_APEDMAR,
+		.name = "apedmar",
+		.bpmp_id = TEGRA_ICC_BPMP_APEDMA,
+		.type = TEGRA_ICC_ISO_AUDIO,
+		.sid = TEGRA238_SID_ISO_APE1,
+		.regs = {
+			.sid = {
+				.override = 0x4f8,
+				.security = 0x4fc,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_APEDMAW,
+		.name = "apedmaw",
+		.bpmp_id = TEGRA_ICC_BPMP_APEDMA,
+		.type = TEGRA_ICC_ISO_AUDIO,
+		.sid = TEGRA238_SID_ISO_APE1,
+		.regs = {
+			.sid = {
+				.override = 0x500,
+				.security = 0x504,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_VICSRD,
+		.name = "vicsrd",
+		.bpmp_id = TEGRA_ICC_BPMP_VIC,
+		.type = TEGRA_ICC_NISO,
+		.sid = TEGRA238_SID_VIC,
+		.regs = {
+			.sid = {
+				.override = 0x360,
+				.security = 0x364,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_VICSWR,
+		.name = "vicswr",
+		.bpmp_id = TEGRA_ICC_BPMP_VIC,
+		.type = TEGRA_ICC_NISO,
+		.sid = TEGRA238_SID_VIC,
+		.regs = {
+			.sid = {
+				.override = 0x368,
+				.security = 0x36c,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_NVDECSRD,
+		.name = "nvdecsrd",
+		.bpmp_id = TEGRA_ICC_BPMP_NVDEC,
+		.type = TEGRA_ICC_NISO,
+		.sid = TEGRA238_SID_NVDEC,
+		.regs = {
+			.sid = {
+				.override = 0x3c0,
+				.security = 0x3c4,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_NVDECSWR,
+		.name = "nvdecswr",
+		.bpmp_id = TEGRA_ICC_BPMP_NVDEC,
+		.type = TEGRA_ICC_NISO,
+		.sid = TEGRA238_SID_NVDEC,
+		.regs = {
+			.sid = {
+				.override = 0x3c8,
+				.security = 0x3cc,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_NVENCSRD,
+		.name = "nvencsrd",
+		.bpmp_id = TEGRA_ICC_BPMP_NVENC,
+		.type = TEGRA_ICC_NISO,
+		.sid = TEGRA238_SID_NVENC,
+		.regs = {
+			.sid = {
+				.override = 0xe0,
+				.security = 0xe4,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_NVENCSWR,
+		.name = "nvencswr",
+		.bpmp_id = TEGRA_ICC_BPMP_NVENC,
+		.type = TEGRA_ICC_NISO,
+		.sid = TEGRA238_SID_NVENC,
+		.regs = {
+			.sid = {
+				.override = 0x158,
+				.security = 0x15c,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_PCIE0R,
+		.name = "pcie0r",
+		.bpmp_id = TEGRA_ICC_BPMP_PCIE_0,
+		.type = TEGRA_ICC_NISO,
+		.sid = TEGRA238_SID_PCIE0,
+		.regs = {
+			.sid = {
+				.override = 0x6c0,
+				.security = 0x6c4,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_PCIE0W,
+		.name = "pcie0w",
+		.bpmp_id = TEGRA_ICC_BPMP_PCIE_0,
+		.type = TEGRA_ICC_NISO,
+		.sid = TEGRA238_SID_PCIE0,
+		.regs = {
+			.sid = {
+				.override = 0x6c8,
+				.security = 0x6cc,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_PCIE1R,
+		.name = "pcie1r",
+		.bpmp_id = TEGRA_ICC_BPMP_PCIE_1,
+		.type = TEGRA_ICC_NISO,
+		.sid = TEGRA238_SID_PCIE1,
+		.regs = {
+			.sid = {
+				.override = 0x6d0,
+				.security = 0x6d4,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_PCIE1W,
+		.name = "pcie1w",
+		.bpmp_id = TEGRA_ICC_BPMP_PCIE_1,
+		.type = TEGRA_ICC_NISO,
+		.sid = TEGRA238_SID_PCIE1,
+		.regs = {
+			.sid = {
+				.override = 0x6d8,
+				.security = 0x6dc,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_PCIE2AR,
+		.name = "pcie2ar",
+		.bpmp_id = TEGRA_ICC_BPMP_PCIE_2,
+		.type = TEGRA_ICC_NISO,
+		.sid = TEGRA238_SID_PCIE2,
+		.regs = {
+			.sid = {
+				.override = 0x6e0,
+				.security = 0x6e4,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_PCIE2AW,
+		.name = "pcie2aw",
+		.bpmp_id = TEGRA_ICC_BPMP_PCIE_2,
+		.type = TEGRA_ICC_NISO,
+		.sid = TEGRA238_SID_PCIE2,
+		.regs = {
+			.sid = {
+				.override = 0x6e8,
+				.security = 0x6ec,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_PCIE3R,
+		.name = "pcie3r",
+		.bpmp_id = TEGRA_ICC_BPMP_PCIE_3,
+		.type = TEGRA_ICC_NISO,
+		.sid = TEGRA238_SID_PCIE3,
+		.regs = {
+			.sid = {
+				.override = 0x6f0,
+				.security = 0x6f4,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_PCIE3W,
+		.name = "pcie3w",
+		.bpmp_id = TEGRA_ICC_BPMP_PCIE_3,
+		.type = TEGRA_ICC_NISO,
+		.sid = TEGRA238_SID_PCIE3,
+		.regs = {
+			.sid = {
+				.override = 0x6f8,
+				.security = 0x6fc,
+			},
+		},
+	}, {
+		.id = TEGRA_ICC_MC_CPU_CLUSTER0,
+		.name = "sw_cluster0",
+		.bpmp_id = TEGRA_ICC_BPMP_CPU_CLUSTER0,
+		.type = TEGRA_ICC_NISO,
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_NVL1R,
+		.name = "nvl1r",
+		.bpmp_id = TEGRA_ICC_BPMP_GPU,
+		.type = TEGRA_ICC_NISO,
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_NVL1W,
+		.name = "nvl1w",
+		.bpmp_id = TEGRA_ICC_BPMP_GPU,
+		.type = TEGRA_ICC_NISO,
+	}
+};
+
+static const struct tegra_mc_intmask tegra238_mc_intmasks[] = {
+	{
+		.reg = MC_INTMASK,
+		.mask = MC_INT_DECERR_ROUTE_SANITY | MC_INT_DECERR_GENERALIZED_CARVEOUT |
+			MC_INT_DECERR_MTS | MC_INT_SECERR_SEC | MC_INT_DECERR_VPR |
+			MC_INT_SECURITY_VIOLATION | MC_INT_DECERR_EMEM,
+	},
+};
+
+const struct tegra_mc_soc tegra238_mc_soc = {
+	.num_clients = ARRAY_SIZE(tegra238_mc_clients),
+	.clients = tegra238_mc_clients,
+	.num_address_bits = 40,
+	.num_channels = 8,
+	.client_id_mask = 0x1ff,
+	.intmasks = tegra238_mc_intmasks,
+	.num_intmasks = ARRAY_SIZE(tegra238_mc_intmasks),
+	.has_addr_hi_reg = true,
+	.ops = &tegra186_mc_ops,
+	.icc_ops = &tegra234_mc_icc_ops,
+	.ch_intmask = 0x0000ff00,
+	.global_intstatus_channel_shift = 8,
+	.num_carveouts = 32,
+	.regs = &tegra20_mc_regs,
+	.handle_irq = tegra30_mc_irq_handlers,
+	.num_interrupts = ARRAY_SIZE(tegra30_mc_irq_handlers),
+	.mc_addr_hi_mask = 0x3,
+	.mc_err_status_type_mask = (0x7 << 28),
+};
-- 
2.50.1

