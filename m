Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012054.outbound.protection.outlook.com [40.107.209.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FED3BE153;
	Tue, 31 Mar 2026 11:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774956263; cv=fail; b=CC6AloxwGeOp5fP0URvEKYXzDxu7vskCyCXXtG5BQdDb6PO5mykQ4sLdrwFltHHfYcpp54oWMwgXoDj2NJF93MHqXdfQCBcgExVLI3hcuQKJ/KwliccMIC9lsz89MNAIsKl2nh+m3JwOZ96E1zyavGX4aYCfRYPLeeQWUuwMzO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774956263; c=relaxed/simple;
	bh=zYParcjyVPsQKwnBbL7c9pZqZDfR+KMhhaHV89SUqUE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bQOZZ8y7sx/aw3AY7Q9xDrmvOZG2ft0/uhJ0j9XJ+ES8qpt019a0fRBrqNnnQ65uxYP+Zq36ZNNoVpT7yhYhd35VFG2FPWwPk9NNn1/ari2XuLKWP/ZaERzl1wMlcE8FEAHUanZAlk5wTfw1UP0TCGdKQkbuijq0NwMFaTUX6KU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XycSZCAi; arc=fail smtp.client-ip=40.107.209.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XycSZCAi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OWa+t/4EUMULhpyUMoYW40cHN28CvA0l19Lucq5TXrj1iHrnjeG6fL+FTxVQQVeNyrz7ZZR6is1ujAM52DsNi4uUU5gkcoXEht1n9wRx7eqFIGtEOQCEuBi6FDXM3MBLY4SVZFqKtt4EgUjvBEldafB0uDCw50S7Dz4nWwsrjOF04HGej3bP8Ny3zEa2k2dZlyevCrXcyUK9kyYRhd45aztmG1PAoAucOiBPahNmPIWwwUPF2VXMstJuR+G+SshngH8PeKE/GPsJvS7dnyWt01pcwD6qr9wTU2b8INPM9IU5WNJ3Q5RbZdCGUCv7HJYs9RieXSspdqOeBaKlNChiLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x04YelWNpc+2ecDBgT37J/Vz0ZQ8pPBvwnuVxA/Jk+4=;
 b=ROMfhQsm1n/28oyPCuQytw1WwYThxxrIJaIaxP0ZxSyVW3nqYkMqIfr6gJn8zPKwhwts6NmmQY4FJNLUeTU/1QBK0iw3wVQVt7OwZRO2XM2yjZ0+FPoDNAVyCYmKLA32c5cn8d3OrpZBI8BoGSCJzgR6eQ0oWHAst4vlrft0edSI2rSHm2oZJ9EJphmaf38hgSfRBm9t9aSd0oKEFmeshUfECAcQQxFoMA8X90KuQN9koG8O1wXJkxW/MKCtiixWOJ9fp1zofGxN3lwr5ZmTCz8jlHhI/7V5DdUaY5wKCvgKnDDj3KnqwDtm4MjmBXtC0IbEKAQK9tOssa2bM0xAIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x04YelWNpc+2ecDBgT37J/Vz0ZQ8pPBvwnuVxA/Jk+4=;
 b=XycSZCAikhmL6JZOJJmIBTnkHNh7rqv7UiqpxvHE2+ML4uv5Wjo+PkuqO2eNKStFvcasRziOBzYnwgghsIWFicyvgzxZrQv8pkci3cE/kWGCrVmHGU50IP0qBakRd2c59EQMle9wqVaBkOl0eiv5AK3JkvlmeUz+Z0IPEoNE5ulvrP9RwSxFOkD7jyuKw8dZXxINhzM6H0+QvSCk13jkWvHajolvJTM5KUm5xoSfvs3XtdIcWs5+TUzTkDaseTR5WQVdUq37KhVb06mlgnWeEfLfwhLAtvF9XNHe7iap6j+QkzxhtRMnnf03hxOXn4DIpvfbrvwhIZ2j0E4gW5FIWg==
Received: from BYAPR08CA0037.namprd08.prod.outlook.com (2603:10b6:a03:117::14)
 by SJ2PR12MB9137.namprd12.prod.outlook.com (2603:10b6:a03:562::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 11:24:12 +0000
Received: from CO1PEPF00012E66.namprd05.prod.outlook.com
 (2603:10b6:a03:117:cafe::5a) by BYAPR08CA0037.outlook.office365.com
 (2603:10b6:a03:117::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Tue,
 31 Mar 2026 11:24:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1PEPF00012E66.mail.protection.outlook.com (10.167.249.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Tue, 31 Mar 2026 11:24:12 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 31 Mar
 2026 04:23:56 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 31 Mar 2026 04:23:55 -0700
Received: from build-amhetre-focal-20250829.internal (10.127.8.12) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Tue, 31 Mar 2026 04:23:55 -0700
From: Ashish Mhetre <amhetre@nvidia.com>
To: <krzk@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<=thierry.reding@kernel.org>, <jonathanh@nvidia.com>, <sumitg@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, Ashish Mhetre <amhetre@nvidia.com>
Subject: [PATCH 1/2] memory: tegra: Add T238 MC support
Date: Tue, 31 Mar 2026 11:23:39 +0000
Message-ID: <20260331112347.3897841-2-amhetre@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260331112347.3897841-1-amhetre@nvidia.com>
References: <20260331112347.3897841-1-amhetre@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E66:EE_|SJ2PR12MB9137:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ab63a8e-c7b4-4d99-1bf7-08de8f180903
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	r1jXfL/s8jrZpPtk9lwT1JzjgqUALJVqwDKVsrkAqZX3OoEh065RpOxgrBB0EZSecg5gp21T80O5fag+RQaaDsbQybJIatW9IDFe2GlXmzgnbpeDww/i4EVw/EOt7pSyWesHy5/cUQj6XiXB6CMlBH3gFlJgXQr9wsuziWfUsjiYb+sWkIqGX2N0YulZ0ao9BuIVLUhV2QhIRFYIw+8Nm6ksW/cJRen1la954KarJWwtkNEh2x0nhpf/xshGWvi7nudPA/GLyuebigh8vnzcNLlTSFhmzhCf+hEiH3GJp+Xhwy3DERdMNINfJ0RDsRDVZVP8GpitFy91acrijVr6i/j1dfJR825jkQ+5Gcf+gV2h+qZNobapPkL9FNakg/BvWWELZZgFr0v65RPZZN/0EoTWRwfac+Hu/u1bNVGMOdHRzlsMmz1DMnh3kz09WhdGXD06tvU68xZux8sOW/BqNWJLozYQpIRzSsTYnIv01YabwEgTqmuNtjYGZ18PJ5SBc0n7Gxaihl59drG4FoVrEbma1Jnmuaygt9nmY+mE+85f8h1haAHYViIo3HRXti1YblLzmDlxqJhz8Iz8P8Y4ViISQGoEwLuh0KY0DZ3ltsHhQTZ9I1EbaKcBsvIJJQU/yi6RAItwUxsGY6faLG4CE3o7YL+TBq8YYWlYhQKo37WpgRGA3lvbDxE/eJ5PBQalVJxUn2utDArUyjnuIBeyXjSBA+XuCBgMWOGVn9O92PcBBMbxHWxVXMFV3Q+DpE4azyQpECcVfUgD7r/dYcfY6g==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xzElUbxpl2tZkw6WvQwyf2i0MyHWAzsJqtGiCpU/g/+6A/YFNVHoU+a/NhiwUEi8VKauUserxERJ5M83QbCy4tuiKFGp2alNuZHi02gVEeIl9m4YuWXRyIHCFJzKoTpPbmKqISS4kMI9gSeHXkw+AJkUyjLvCLaDgrLHWzGGrNisZ3y3cq0jS+6n7Y7fv7qCeUrtQE8oFRGHDsmHoeOh+J7B2wPNiJ0iY6WuLTFGBCR6+ukV2FSSSfPbH2b5XwZpGuZSlF7IvYIhdoo+L8d+GIeiz8I2B8VkD8xj12bDdpV3po3KK+HyVXg0wuHdc7WNtmFWkyEoX2Wkd+dz/366hP/pAQTkEs/7fAU3mD4fs30Lzfw4lOPkYcjAim5Yjg7Rw2Qup+JtboC53pR/1G8ksfW7+WR4AKioc0AU13k1ZgmJ1JA8gx2bBzY8gQKBZFjr
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 11:24:12.5357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab63a8e-c7b4-4d99-1bf7-08de8f180903
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E66.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9137

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
 drivers/memory/tegra/mc.h       |   6 +
 drivers/memory/tegra/tegra234.c |   2 +-
 drivers/memory/tegra/tegra238.c | 395 ++++++++++++++++++++++++++++++++
 5 files changed, 406 insertions(+), 1 deletion(-)
 create mode 100644 drivers/memory/tegra/tegra238.c

diff --git a/drivers/memory/tegra/Makefile b/drivers/memory/tegra/Makefile
index 6334601e6120..0d50e37d43af 100644
--- a/drivers/memory/tegra/Makefile
+++ b/drivers/memory/tegra/Makefile
@@ -10,6 +10,7 @@ tegra-mc-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210.o
 tegra-mc-$(CONFIG_ARCH_TEGRA_186_SOC) += tegra186.o
 tegra-mc-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra186.o tegra194.o
 tegra-mc-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra186.o tegra234.o
+tegra-mc-$(CONFIG_ARCH_TEGRA_238_SOC) += tegra186.o tegra238.o
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
index 649b54369263..d0da4a5f192d 100644
--- a/drivers/memory/tegra/mc.h
+++ b/drivers/memory/tegra/mc.h
@@ -238,6 +238,11 @@ extern const struct tegra_mc_soc tegra194_mc_soc;
 
 #ifdef CONFIG_ARCH_TEGRA_234_SOC
 extern const struct tegra_mc_soc tegra234_mc_soc;
+extern const struct tegra_mc_icc_ops tegra234_mc_icc_ops;
+#endif
+
+#ifdef CONFIG_ARCH_TEGRA_238_SOC
+extern const struct tegra_mc_soc tegra238_mc_soc;
 #endif
 
 #ifdef CONFIG_ARCH_TEGRA_264_SOC
@@ -256,6 +261,7 @@ extern const struct tegra_mc_ops tegra30_mc_ops;
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
index 000000000000..5abdca16a275
--- /dev/null
+++ b/drivers/memory/tegra/tegra238.c
@@ -0,0 +1,395 @@
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
+	/*
+	 * Additionally, there are lite carveouts but those are not currently
+	 * supported.
+	 */
+	.num_carveouts = 32,
+	.regs = &tegra20_mc_regs,
+	.handle_irq = tegra30_mc_irq_handlers,
+	.num_interrupts = ARRAY_SIZE(tegra30_mc_irq_handlers),
+	.mc_addr_hi_mask = 0x3,
+	.mc_err_status_type_mask = (0x7 << 28),
+};
-- 
2.50.1

