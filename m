Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011008.outbound.protection.outlook.com [52.101.62.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2751478852;
	Thu, 26 Feb 2026 16:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772123535; cv=fail; b=RXWB3lthzrwEGM6haFI8NYpTUq3LY4hjySGxu6WyLNKgxIABpX6M6YDtM3h/Pl/NHb0K+W4xncqjlcBRP11hTgxQnA3yNP3FLXFHjitaiDRGO6K7uFHag0VVSQZ6xy9YBCadHsi9dkmQvJah0lXYJkhUpFU8ZoGVvP+pfyT7b1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772123535; c=relaxed/simple;
	bh=+R2+Vhio1BMCqC9O2c3pFe9VX7IX+MO2vS8j0U8dE+w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cM6ezr/NLcIJEdbysv5Tmlj6rp4/vWcliLt715LFKC0kTP/6UnPes2kMrpqukfsQSC5SbEB2FQO7DwzBRxU43tl/g98xyYiXdfZXimEsO2K87M44Z70YZ8t+mOdR4DKqHj3jaEQ1in9hiLq8T/HIwBvX/SFjflmM9YANiKLh++Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=e/aMd0T0; arc=fail smtp.client-ip=52.101.62.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="e/aMd0T0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CjnN+phwip5L8CH8aNScAv9O0XjvPnTSSlbp89Le5W/qaYalz6qAp9cpLQQA+b38pC+prqJ8r7GydKt1k4T5/OuQfR2YHJ0v7qsoUgKv0PzOisB5p+7jH5YWfwfdJwlFmNtrTiuzE5TGd00Q/b+iPG75PcvrHXBaBxJoddrQC3xYS2oAiSfWfdpcLEgH8D9VgzeJxu9rQMDXpmPj/xunGA87/vAU91PiZyzQ+1HTo27Tejcrzlyhtw9rAvJsWfLmuIqQTix4xsPxX5zTU0X4HhKUyMmGXu2ualgqjGwMrudZCUyiKuSd1da9dEBwMvgJT/2h+jiAW1MwZfGD/TA+yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eT/VL8ux/xsjQAcprzZRQHb2PNZe74ipsMcUjJWmzsk=;
 b=dH/TFg8OvFc38mdup/o16uvoCYfeCZtnrqGrI/DvuwPR7QhUa3oJbtSAdr0PDcIDVyATVVe1hxUH0VrXf/7ieRD9BDBzUZvpsj8KUSDxBMktymGBUOmzUXV2rgXJlynKVEAQSnUINpLladi8eQX2lgVSbV66CwSBzQCKvfLjAjhOlu05PqvOqD2EzvAaaBTg0dddPhvUjjmdueVgeYtd/UAIoiO8i8+L8szf4FSs8zPVyhArcwgI7os0TcuQaBM3Vzh8XrG1FVrfYA5WDjaEeCCxLQcp83HqfdwB4XEFoMklJRKB8nT0WlGnaCasoIYreWGlbg7moicKf0RJ7nM6gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eT/VL8ux/xsjQAcprzZRQHb2PNZe74ipsMcUjJWmzsk=;
 b=e/aMd0T0qwXskukrollU4ahZBJ2C7WGxzQldScFW5lbQNnYls4Q312TkoPmp2ioTyfyhL38Ky860+fG6VhAdHt45gk340/BmCJed3SrV0o652d6n4lZBW2Wh0JQ2r8F4xp69JoaWc8oHsJWyICbU/hhJOQwVCFkgXoG8Ze8zOHQY09Xc0vQ+pBidxbiGiUGk5O+LlVTpdfNd+5scftoAiSMkDSa5TikUeXzZD7+F2kuApB2cX+okFuoDV6R7ewci/MKxtOimD5oWWxgNH32lLT3Gzzq59G9G7my7B7N4O19EBqdx9PmkSWrOe5z9Es3z+qD/ymGlMs795C1ke9Z0LQ==
Received: from BN9PR03CA0592.namprd03.prod.outlook.com (2603:10b6:408:10d::27)
 by DS7PR12MB6070.namprd12.prod.outlook.com (2603:10b6:8:9e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 16:31:59 +0000
Received: from BN1PEPF0000468D.namprd05.prod.outlook.com
 (2603:10b6:408:10d:cafe::b9) by BN9PR03CA0592.outlook.office365.com
 (2603:10b6:408:10d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 16:31:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF0000468D.mail.protection.outlook.com (10.167.243.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 16:31:58 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 08:31:33 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 08:31:33 -0800
Received: from build-ketanp-bionic-20250813.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Thu, 26 Feb 2026 08:31:33 -0800
From: Ketan Patil <ketanp@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ketan Patil
	<ketanp@nvidia.com>
Subject: [PATCH v7 1/6] memory: tegra: Group error handling related registers
Date: Thu, 26 Feb 2026 16:31:10 +0000
Message-ID: <20260226163115.1152181-2-ketanp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260226163115.1152181-1-ketanp@nvidia.com>
References: <20260226163115.1152181-1-ketanp@nvidia.com>
X-NVConfidentiality: public
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468D:EE_|DS7PR12MB6070:EE_
X-MS-Office365-Filtering-Correlation-Id: 824a3584-e9da-4521-b394-08de75548ffa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	Sew3WYjHA8kNVyMUFOkPi+DrXqFqBfTTm+RSBeogGpF0Cir7673AHIfBRAGquK4foa/8GrvxgI24gukqzwUiTt+Ob3SZgep8XKd2wLKXzfi5N+N0qCHnacJxJ/Aavs/SzPO/qI4U4vMncRWlamVu/4nQ+0meDP5zExBDtve/JmV9DyZn/aYVqGDdCDYNxrnGHitaRXpu9/VKUq627EgYACTdBmzJXyL2oykFPFSm4+b0ZgGT6LLSRVJhhGnO0SpgxiwEuuxh78IUWghfWkEScHu3ls2q7o+o0/C9rV5MtS+q63ZsNeQw3mToUCdUtYChc9oVcKKL38H0emMBCeXXV0gSgi8GPmo5ttFDgcAnwCJVmyWm2UQOrlZCvFasxg84XxkCmVCDN/WBVtz/s+tuAu3vQF4kKJlt7f+lDm6KTazgF8c9HXFbU2Ynx8XYI1afXDyXijEgEkcKDDDqwFFIl3Dgpgs9OFvXkpa0vt+PtU7yOl0UlKSG3cHP74fvDSUDGp9CggTfU9S5zTxMsW9ER/B1EJBxQY34pTyZ/zR1csGlSz9ClhZ5mQfI/ddjdYXneuP6ZL8fvVYCCKcMOVRaP7NZNCqs3a62I0o7guWnXnsMX7l5i65oRLUWik1ADeMIabM9vFng9aVibcranXtJbx52D6Vbho4JSfe3QNvjyT06QcqYS9KLWxzgBGjnN5r/TtxKjFSbztnapSULQ7VGfGNkwx3KU36w9TncdlSFVWRr0dY5JW3XHswRrJSl5X9FWbsug6jgGKb6b+mnAZDaQoiGIkjyRqCP9/8p+28q1wnFcbZydfKFVdjo9YvGrDDYlzC+jYOanPyudda7CJJkog==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ABV9cxT3/NvwcebK3N4LoyevRUMuqCkrTg2r9i9Eov3wjIJ2W+oFV+ke1M8/A4ExjKMLTr2nJmC0WD/TlS6GUu0V9XcMiJPayuru0nvMUe7cXKPzFDhrBnUwsqeIDxVNhVyKuAwcIlRQUUS79IgsKD6ArG99qp1Nq0T8gekEfvBO+FRgJ6pmF3yEdH3o4xDYWALDLD08z/OEUmVNBnZkJhzTmv8ftgE7naykbobiRipkxsUrxDxwnNn4ySzmJlC2pHguKmXQDC1zAnNDDX/3/Nye07zcrk/dXxu6MpU1X+o0HFQ0v46yoodFEe4bwLglcoEmTx2+837A5BO/4t/LKnE5fN8sxdNHnQ2Mb6SU95Os23eyZO7xlaxgwQWMDFDxwkv4+3oWfFATEU1FVvfzPuVhc6pOXbut/gCZdA9wMLHYzJzcM7vXygFg26j1Mh9C
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 16:31:58.4476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 824a3584-e9da-4521-b394-08de75548ffa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6070

Group MC error related registers into a struct as they could have SoC
specific values. Tegra264 has different register offsets than the
existing devices and so in order to add support for Tegra264 we need to
first make this change.

Signed-off-by: Ketan Patil <ketanp@nvidia.com>
---
 drivers/memory/tegra/mc.c       | 47 ++++++++++++++++++++++-----------
 drivers/memory/tegra/mc.h       | 16 +----------
 drivers/memory/tegra/tegra114.c |  3 ++-
 drivers/memory/tegra/tegra124.c |  4 ++-
 drivers/memory/tegra/tegra186.c |  3 ++-
 drivers/memory/tegra/tegra194.c |  3 ++-
 drivers/memory/tegra/tegra20.c  |  3 ++-
 drivers/memory/tegra/tegra210.c |  3 ++-
 drivers/memory/tegra/tegra234.c |  3 ++-
 drivers/memory/tegra/tegra30.c  |  3 ++-
 include/soc/tegra/mc.h          | 22 ++++++++++++++-
 11 files changed, 71 insertions(+), 39 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 6edb210287dc..1dacbe2aba4e 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2014-2025 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2014-2026 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <linux/clk.h>
@@ -56,6 +56,23 @@ static const struct of_device_id tegra_mc_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tegra_mc_of_match);
 
+const struct tegra_mc_regs tegra20_mc_regs = {
+	.cfg_channel_enable = 0xdf8,
+	.err_status = 0x08,
+	.err_add = 0x0c,
+	.err_add_hi = 0x11fc,
+	.err_vpr_status = 0x654,
+	.err_vpr_add = 0x658,
+	.err_sec_status = 0x67c,
+	.err_sec_add = 0x680,
+	.err_mts_status = 0x9b0,
+	.err_mts_add = 0x9b4,
+	.err_gen_co_status = 0xc00,
+	.err_gen_co_add = 0xc04,
+	.err_route_status = 0x9c0,
+	.err_route_add = 0x9c4,
+};
+
 static void tegra_mc_devm_action_put_device(void *data)
 {
 	struct tegra_mc *mc = data;
@@ -600,37 +617,37 @@ irqreturn_t tegra30_mc_handle_irq(int irq, void *data)
 
 		switch (intmask) {
 		case MC_INT_DECERR_VPR:
-			status_reg = MC_ERR_VPR_STATUS;
-			addr_reg = MC_ERR_VPR_ADR;
+			status_reg = mc->soc->regs->err_vpr_status;
+			addr_reg = mc->soc->regs->err_vpr_add;
 			break;
 
 		case MC_INT_SECERR_SEC:
-			status_reg = MC_ERR_SEC_STATUS;
-			addr_reg = MC_ERR_SEC_ADR;
+			status_reg = mc->soc->regs->err_sec_status;
+			addr_reg = mc->soc->regs->err_sec_add;
 			break;
 
 		case MC_INT_DECERR_MTS:
-			status_reg = MC_ERR_MTS_STATUS;
-			addr_reg = MC_ERR_MTS_ADR;
+			status_reg = mc->soc->regs->err_mts_status;
+			addr_reg = mc->soc->regs->err_mts_add;
 			break;
 
 		case MC_INT_DECERR_GENERALIZED_CARVEOUT:
-			status_reg = MC_ERR_GENERALIZED_CARVEOUT_STATUS;
-			addr_reg = MC_ERR_GENERALIZED_CARVEOUT_ADR;
+			status_reg = mc->soc->regs->err_gen_co_status;
+			addr_reg = mc->soc->regs->err_gen_co_add;
 			break;
 
 		case MC_INT_DECERR_ROUTE_SANITY:
-			status_reg = MC_ERR_ROUTE_SANITY_STATUS;
-			addr_reg = MC_ERR_ROUTE_SANITY_ADR;
+			status_reg = mc->soc->regs->err_route_status;
+			addr_reg = mc->soc->regs->err_route_add;
 			break;
 
 		default:
-			status_reg = MC_ERR_STATUS;
-			addr_reg = MC_ERR_ADR;
+			status_reg = mc->soc->regs->err_status;
+			addr_reg = mc->soc->regs->err_add;
 
 #ifdef CONFIG_PHYS_ADDR_T_64BIT
 			if (mc->soc->has_addr_hi_reg)
-				addr_hi_reg = MC_ERR_ADR_HI;
+				addr_hi_reg = mc->soc->regs->err_add_hi;
 #endif
 			break;
 		}
@@ -883,7 +900,7 @@ static void tegra_mc_num_channel_enabled(struct tegra_mc *mc)
 	unsigned int i;
 	u32 value;
 
-	value = mc_ch_readl(mc, 0, MC_EMEM_ADR_CFG_CHANNEL_ENABLE);
+	value = mc_ch_readl(mc, 0, mc->soc->regs->cfg_channel_enable);
 	if (value <= 0) {
 		mc->num_channels = mc->soc->num_channels;
 		return;
diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
index 1d97cf4d3a94..bbe3e2690c64 100644
--- a/drivers/memory/tegra/mc.h
+++ b/drivers/memory/tegra/mc.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (C) 2014-2025 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2014-2026 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #ifndef MEMORY_TEGRA_MC_H
@@ -14,8 +14,6 @@
 
 #define MC_INTSTATUS					0x00
 #define MC_INTMASK					0x04
-#define MC_ERR_STATUS					0x08
-#define MC_ERR_ADR					0x0c
 #define MC_GART_ERROR_REQ				0x30
 #define MC_EMEM_ADR_CFG					0x54
 #define MC_DECERR_EMEM_OTHERS_STATUS			0x58
@@ -43,19 +41,7 @@
 #define MC_EMEM_ARB_OVERRIDE				0xe8
 #define MC_TIMING_CONTROL_DBG				0xf8
 #define MC_TIMING_CONTROL				0xfc
-#define MC_ERR_VPR_STATUS				0x654
-#define MC_ERR_VPR_ADR					0x658
-#define MC_ERR_SEC_STATUS				0x67c
-#define MC_ERR_SEC_ADR					0x680
-#define MC_ERR_MTS_STATUS				0x9b0
-#define MC_ERR_MTS_ADR					0x9b4
-#define MC_ERR_ROUTE_SANITY_STATUS			0x9c0
-#define MC_ERR_ROUTE_SANITY_ADR				0x9c4
-#define MC_ERR_GENERALIZED_CARVEOUT_STATUS		0xc00
-#define MC_ERR_GENERALIZED_CARVEOUT_ADR			0xc04
-#define MC_EMEM_ADR_CFG_CHANNEL_ENABLE			0xdf8
 #define MC_GLOBAL_INTSTATUS				0xf24
-#define MC_ERR_ADR_HI					0x11fc
 
 #define MC_INT_DECERR_ROUTE_SANITY			BIT(20)
 #define MC_INT_DECERR_GENERALIZED_CARVEOUT		BIT(17)
diff --git a/drivers/memory/tegra/tegra114.c b/drivers/memory/tegra/tegra114.c
index 41350570c815..ea7e4c7bb5f8 100644
--- a/drivers/memory/tegra/tegra114.c
+++ b/drivers/memory/tegra/tegra114.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2014 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2014-2026 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <linux/of.h>
@@ -1114,4 +1114,5 @@ const struct tegra_mc_soc tegra114_mc_soc = {
 	.resets = tegra114_mc_resets,
 	.num_resets = ARRAY_SIZE(tegra114_mc_resets),
 	.ops = &tegra30_mc_ops,
+	.regs = &tegra20_mc_regs,
 };
diff --git a/drivers/memory/tegra/tegra124.c b/drivers/memory/tegra/tegra124.c
index 991d4f7bc070..f0cfe14bb475 100644
--- a/drivers/memory/tegra/tegra124.c
+++ b/drivers/memory/tegra/tegra124.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2014 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2014-2026 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <linux/of.h>
@@ -1275,6 +1275,7 @@ const struct tegra_mc_soc tegra124_mc_soc = {
 	.num_resets = ARRAY_SIZE(tegra124_mc_resets),
 	.icc_ops = &tegra124_mc_icc_ops,
 	.ops = &tegra30_mc_ops,
+	.regs = &tegra20_mc_regs,
 };
 #endif /* CONFIG_ARCH_TEGRA_124_SOC */
 
@@ -1307,5 +1308,6 @@ const struct tegra_mc_soc tegra132_mc_soc = {
 	.num_resets = ARRAY_SIZE(tegra124_mc_resets),
 	.icc_ops = &tegra124_mc_icc_ops,
 	.ops = &tegra30_mc_ops,
+	.regs = &tegra20_mc_regs,
 };
 #endif /* CONFIG_ARCH_TEGRA_132_SOC */
diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index aee11457bf8e..51e2dd628fb4 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2017-2025 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2017-2026 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <linux/io.h>
@@ -914,5 +914,6 @@ const struct tegra_mc_soc tegra186_mc_soc = {
 	.ops = &tegra186_mc_ops,
 	.ch_intmask = 0x0000000f,
 	.global_intstatus_channel_shift = 0,
+	.regs = &tegra20_mc_regs,
 };
 #endif
diff --git a/drivers/memory/tegra/tegra194.c b/drivers/memory/tegra/tegra194.c
index 26035ac3a1eb..5b7ff2dd6812 100644
--- a/drivers/memory/tegra/tegra194.c
+++ b/drivers/memory/tegra/tegra194.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2017-2021 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2017-2026 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <soc/tegra/mc.h>
@@ -1358,4 +1358,5 @@ const struct tegra_mc_soc tegra194_mc_soc = {
 	.icc_ops = &tegra_mc_icc_ops,
 	.ch_intmask = 0x00000f00,
 	.global_intstatus_channel_shift = 8,
+	.regs = &tegra20_mc_regs,
 };
diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra20.c
index 4748113bfe9d..1b2b598ab564 100644
--- a/drivers/memory/tegra/tegra20.c
+++ b/drivers/memory/tegra/tegra20.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2012 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2012-2026 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <linux/bitfield.h>
@@ -778,4 +778,5 @@ const struct tegra_mc_soc tegra20_mc_soc = {
 	.num_resets = ARRAY_SIZE(tegra20_mc_resets),
 	.icc_ops = &tegra20_mc_icc_ops,
 	.ops = &tegra20_mc_ops,
+	.regs = &tegra20_mc_regs,
 };
diff --git a/drivers/memory/tegra/tegra210.c b/drivers/memory/tegra/tegra210.c
index 3c2949c16fde..e166b33848e9 100644
--- a/drivers/memory/tegra/tegra210.c
+++ b/drivers/memory/tegra/tegra210.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2015 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2015-2026 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <dt-bindings/memory/tegra210-mc.h>
@@ -1287,4 +1287,5 @@ const struct tegra_mc_soc tegra210_mc_soc = {
 	.resets = tegra210_mc_resets,
 	.num_resets = ARRAY_SIZE(tegra210_mc_resets),
 	.ops = &tegra30_mc_ops,
+	.regs = &tegra20_mc_regs,
 };
diff --git a/drivers/memory/tegra/tegra234.c b/drivers/memory/tegra/tegra234.c
index 5f57cea48b62..512d054d7592 100644
--- a/drivers/memory/tegra/tegra234.c
+++ b/drivers/memory/tegra/tegra234.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2022-2023, NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2022-2026, NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <soc/tegra/mc.h>
@@ -1152,4 +1152,5 @@ const struct tegra_mc_soc tegra234_mc_soc = {
 	 * supported.
 	 */
 	.num_carveouts = 32,
+	.regs = &tegra20_mc_regs,
 };
diff --git a/drivers/memory/tegra/tegra30.c b/drivers/memory/tegra/tegra30.c
index a6bcde4b92c0..337501a30a73 100644
--- a/drivers/memory/tegra/tegra30.c
+++ b/drivers/memory/tegra/tegra30.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2014 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2014-2026 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <linux/device.h>
@@ -1400,4 +1400,5 @@ const struct tegra_mc_soc tegra30_mc_soc = {
 	.num_resets = ARRAY_SIZE(tegra30_mc_resets),
 	.icc_ops = &tegra30_mc_icc_ops,
 	.ops = &tegra30_mc_ops,
+	.regs = &tegra20_mc_regs,
 };
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index 6ee4c59db620..372f47e824d5 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (C) 2014 NVIDIA Corporation
+ * Copyright (C) 2014-2026 NVIDIA Corporation
  */
 
 #ifndef __SOC_TEGRA_MC_H__
@@ -168,6 +168,23 @@ struct tegra_mc_ops {
 	int (*probe_device)(struct tegra_mc *mc, struct device *dev);
 };
 
+struct tegra_mc_regs {
+	unsigned int cfg_channel_enable;
+	unsigned int err_status;
+	unsigned int err_add;
+	unsigned int err_add_hi;
+	unsigned int err_vpr_status;
+	unsigned int err_vpr_add;
+	unsigned int err_sec_status;
+	unsigned int err_sec_add;
+	unsigned int err_mts_status;
+	unsigned int err_mts_add;
+	unsigned int err_gen_co_status;
+	unsigned int err_gen_co_add;
+	unsigned int err_route_status;
+	unsigned int err_route_add;
+};
+
 struct tegra_mc_soc {
 	const struct tegra_mc_client *clients;
 	unsigned int num_clients;
@@ -196,6 +213,7 @@ struct tegra_mc_soc {
 
 	const struct tegra_mc_icc_ops *icc_ops;
 	const struct tegra_mc_ops *ops;
+	const struct tegra_mc_regs *regs;
 };
 
 struct tegra_mc {
@@ -256,4 +274,6 @@ tegra_mc_get_carveout_info(struct tegra_mc *mc, unsigned int id,
 }
 #endif
 
+extern const struct tegra_mc_regs tegra20_mc_regs;
+
 #endif /* __SOC_TEGRA_MC_H__ */
-- 
2.17.1

