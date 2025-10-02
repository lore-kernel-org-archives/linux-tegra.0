Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011037.outbound.protection.outlook.com [40.93.194.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39972FC880;
	Thu,  2 Oct 2025 09:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759395708; cv=fail; b=agd+zxN9jOj02cy/N9yuIzJOQl5n+hHWaUjYt0geEjFAy/TsC02Tk6C1tXK2zFXS6sF5rcvfZixd6/cbi1/+lDw7mVeN/LSWLScDKjDvghfdMsD9cX2SgzwI4LzyCMgWRJjNMq2vEuC5rpK9i6Ji7Yp1mJaNTVNeNwA1NueIlMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759395708; c=relaxed/simple;
	bh=bz7NWnNxg8a1C9bghWnPPCdlTCBxYAfIgyAxZ0Ky2rY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QQWRb2svFo+OEMK86UrC4eijlIMxQ/R//jNYv7xwAjpCnyM7v2txktMEQrnyFcNQT5uDgetod3BoXfJqqG/7XDGM05KGhlBwyqmWF8vlu5ITgffpf2YUk1TaUVkBtPw0DzIsozdEdcrakNKYCzrCyfArtsXdBf4yhoNehS/DQtc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=r5ySOGH0; arc=fail smtp.client-ip=40.93.194.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="r5ySOGH0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJuwoV7mE3F3PI6qoEnLaR4HmSAuvYIdYz31ulOIVt2PHL8QLJPEmnt6KzOa0szEVwQZcucvoEobPa8rKA3kAsE1H1/8rMCmkFdgmYHbD4KqRAUf6tuWWXUUxwwCabO1DCTX6ET+uGRRpCkER2XbNIBHAebvyWh/lraCZP00fCYLvfTNNaz3GbsOvstJQp+oWa9pmxevlkFJ4Rm+3x6mzRV7LkuWjz3oEkV3S39HiSY30PrGjn4P11OoPCzCppAoCXpNHfAvAGLV5I5Wvb+x96NOzrfb+T+INc+uyxqBdqIm6yKpJBm+mglgrVB5U3Sua9MAcI+tofwc+wDk6hmeCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=So07eoCYJimYHakkoZEfAOaM8uCU6o8iZ3+bNBpX2fA=;
 b=HchzVFPinQrIOJFVRqUCmMk77xA/cuz73Evv4vJVeZ7QwTOZ58fl1QenBul0hcCrIdXQI9S7YlCkpqBbLYsXyqx5wFDCXJiK71s/TYVnfIP0KIcPTfim3u2UpFhES8K/gWWF6jeJZwiOMRtUE8sMBAKJjV4FD+Bb+LceoLp2dqjPzVSrVyzRc+5ENNWqRIl8FS1r9J2xHmPwXbOTUd3M5kuBOO4T75lss9vgtEtaN68OcFWtcl44Ur/olNDH0XyVNdewcwQY7B8cCSxxWMwoH7nkkCP4ESIXlPdN8KDz5rGmp6yyVyOfYdZLM54iGnqJExRerwUTP1FHDoZW7kI5Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=So07eoCYJimYHakkoZEfAOaM8uCU6o8iZ3+bNBpX2fA=;
 b=r5ySOGH0PBoyyjlToxK1cBIVB28vyxWlyaPAAwapNER/Pt/AFLYJqOySUc6ItdC8JQ6hFa3KgIbjmOeGwP4Z31cPiKkCdwLXbc3HjReHuJHEjxV2nEGZPAagGetBvabqCbPqokdOsBZaxyQ9wFSjtRYfd7imyj4VuezQuMRCLCufgzGitIFFoWDcD9vZYx/oywO/PizavyAEXmGhRfJDx7nd45cjldbKLbxlTRspsIYOaappamBJ1ZjTKx4wcx9hVFNs6/HtEy7UvDNenVgUgqZr1a50zoS3qRmVDp8nsiQQzEMqDYcQoOFVxg0nLGwf37lEAV9Cp6XW6uLuYDKmfA==
Received: from DS7PR03CA0086.namprd03.prod.outlook.com (2603:10b6:5:3bb::31)
 by LV3PR12MB9332.namprd12.prod.outlook.com (2603:10b6:408:20f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.19; Thu, 2 Oct
 2025 09:01:38 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:5:3bb:cafe::12) by DS7PR03CA0086.outlook.office365.com
 (2603:10b6:5:3bb::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.15 via Frontend Transport; Thu,
 2 Oct 2025 09:01:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Thu, 2 Oct 2025 09:01:38 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 2 Oct
 2025 02:01:25 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Oct
 2025 02:01:25 -0700
Received: from build-ketanp-bionic-20250813.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Thu, 2 Oct 2025 02:01:24 -0700
From: Ketan Patil <ketanp@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ketan Patil
	<ketanp@nvidia.com>
Subject: [PATCH v2 1/4] memory: tegra: Group mc-err related registers
Date: Thu, 2 Oct 2025 09:00:51 +0000
Message-ID: <20251002090054.1837481-2-ketanp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251002090054.1837481-1-ketanp@nvidia.com>
References: <20251002090054.1837481-1-ketanp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|LV3PR12MB9332:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d8a08e9-64eb-4825-fb82-08de01924bdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DWqaxKr/wlRUDq7vOK5o6EgBOJfOm+T3m2WUY9jFAnKUxTvyKbfuOGD0XoOD?=
 =?us-ascii?Q?KqpWeNDFFbBbS7/DfdDsj9vOv/U6rr8K23SHQOk8BZpthv50lmV/MRwyoGXJ?=
 =?us-ascii?Q?nJ1InLldKHWcO3JCJc9+XsLoUuezI0cuaBqIcd39BcEEjL1g608stLGIgtSH?=
 =?us-ascii?Q?LIDgNizOL9XbhdrbL/IJhKa4NN5PQqwJY76HrpDacp2zG1E1mGruia1TInK/?=
 =?us-ascii?Q?xcogVNZ/Hm9p2lxPYUWY5p+E++ju23NcDsKI87A3O8WKl4zZXVGciAP/J2yQ?=
 =?us-ascii?Q?mVsxDejBfogq+eUodkZjgoV12tFsh0MYVlMjw05Ivk//hKszBwQ/4+gUtbj+?=
 =?us-ascii?Q?kfVjgapCwBBrmNd6X6CmNwgRBezY1FdCC4AuQUmK+y9MhJnh6BI5UNeRz7ky?=
 =?us-ascii?Q?6i77ZBzT+N2Bj5jH7OIo9MWD04cEqvRyK3g3aA4QDq1XdbElIqxtKH6u3RRL?=
 =?us-ascii?Q?OW5YH616NL3ZHVGKYfeYKxVnCd4CZqkHVRSdsRFmsCxpPoAjumGroPCO3WAx?=
 =?us-ascii?Q?hKxb2+2z9vnBip+sLBIOZoKznoUBjaP5NcFtHAHFCXd5TRRVayfbeHX02rD/?=
 =?us-ascii?Q?3N9QnypdAxkNVQViinFR2jG6eqRzvHN8iZtg/35cpxy/eCI9bnxJxeETFK17?=
 =?us-ascii?Q?hlMqB3Fx+SL+rtiJbrxK06KuoOpxZxDPfcy3KhSSaifH2zBZ1+f9NLVWoHjb?=
 =?us-ascii?Q?8ViKjHSLqq78dC+tMkBMw+CGP6XrtrAdw4d8L7yGvlFbhstWNuApTbmOE42a?=
 =?us-ascii?Q?ZsUdASq/ZCZ970sw4STLHu56QvflETgkfnwZ79ysXckLkbzU2HkI26PpvrFX?=
 =?us-ascii?Q?kHoBl+KvSrcc663BkK4fgOJV1arbusO1rrgRJ03mr7fT3aGedkvJv1Fo4CXm?=
 =?us-ascii?Q?FKNfmpyaZAZ6uomVepiyYDJvPnfgfdXMI4kWxyGWJT3PWiij77+t6nvoxHle?=
 =?us-ascii?Q?RA8qdOphs8JBT4mcAxXzQIw7MCTIP8+eqWl5D5ugRGpZJWUSgQqUKHjH/boD?=
 =?us-ascii?Q?pqC3wWpq18JZ5VBR3GMthKUIBwAzUYVrXQdw4i5z9Pb5tGT7Uif5wwoZEv83?=
 =?us-ascii?Q?HYtZXEflAk70ouDuu4hhrdQEeLeffdxQ7D13zWfOxyV7POGF0F/o2fB19Is8?=
 =?us-ascii?Q?tUbJy9aHvUqClWokNhPPxNy5z1DuZMy6NlRmwRQZ/iK+P1E1kTP5FfHHWvxj?=
 =?us-ascii?Q?AOVf5KAVIp5xobqhO37RUSkDt9EZw/nj2KXfAHJsjI82b4IOiWcxakvzNTsX?=
 =?us-ascii?Q?jJnqSW9KfkevScaiY5RFtfJKTiAL7C0tyT7ddRjI82KiPxpNlhw0TK8pHz0Z?=
 =?us-ascii?Q?GFxGHycW5Ebf2K7ExZtlmsx/C/SPccNONh6fQOgc9UD48waHJLw8M/hjL2SJ?=
 =?us-ascii?Q?E3yMlpVp/8+LQmVMF0xmoZTvxatgACLPQ4jgN6U/rH2LEQkFGrdb8TAYp/Zz?=
 =?us-ascii?Q?xOb7GNflb8tATT+m95luMJz7FeI6m8DsWZtCL5I1boJ0uEo6ozGfHS2XhZWV?=
 =?us-ascii?Q?bOD8/S1uYY6aJjy7kIDilFaNDqDWFa8OEcvpMMHS7KUVF2mOnL5D/7PGcrKg?=
 =?us-ascii?Q?bpcReA5dcrJSvp3Kqp8=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 09:01:38.1458
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d8a08e9-64eb-4825-fb82-08de01924bdf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9332

Group MC error related registers into a struct as they could have soc
specific values.

Signed-off-by: Ketan Patil <ketanp@nvidia.com>
---
 drivers/memory/tegra/mc.c       | 45 +++++++++++++++++++++++----------
 drivers/memory/tegra/mc.h       | 14 ----------
 drivers/memory/tegra/tegra114.c |  3 ++-
 drivers/memory/tegra/tegra124.c |  4 ++-
 drivers/memory/tegra/tegra186.c |  1 +
 drivers/memory/tegra/tegra194.c |  3 ++-
 drivers/memory/tegra/tegra20.c  |  3 ++-
 drivers/memory/tegra/tegra210.c |  3 ++-
 drivers/memory/tegra/tegra234.c |  3 ++-
 drivers/memory/tegra/tegra30.c  |  3 ++-
 include/soc/tegra/mc.h          | 21 ++++++++++++++-
 11 files changed, 67 insertions(+), 36 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 6edb210287dc..6c1578b25a61 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -56,6 +56,23 @@ static const struct of_device_id tegra_mc_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tegra_mc_of_match);
 
+const struct tegra_mc_regs tegra20_mc_regs = {
+	.mc_cfg_channel_enable = 0xdf8,
+	.mc_err_status = 0x08,
+	.mc_err_add = 0x0c,
+	.mc_err_add_hi = 0x11fc,
+	.mc_err_vpr_status = 0x654,
+	.mc_err_vpr_add = 0x658,
+	.mc_err_sec_status = 0x67c,
+	.mc_err_sec_add = 0x680,
+	.mc_err_mts_status = 0x9b0,
+	.mc_err_mts_add = 0x9b4,
+	.mc_err_gen_co_status = 0xc00,
+	.mc_err_gen_co_add = 0xc04,
+	.mc_err_route_status = 0x9c0,
+	.mc_err_route_add = 0x9c4,
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
+			status_reg = mc->soc->mc_regs->mc_err_vpr_status;
+			addr_reg = mc->soc->mc_regs->mc_err_vpr_add;
 			break;
 
 		case MC_INT_SECERR_SEC:
-			status_reg = MC_ERR_SEC_STATUS;
-			addr_reg = MC_ERR_SEC_ADR;
+			status_reg = mc->soc->mc_regs->mc_err_sec_status;
+			addr_reg = mc->soc->mc_regs->mc_err_sec_add;
 			break;
 
 		case MC_INT_DECERR_MTS:
-			status_reg = MC_ERR_MTS_STATUS;
-			addr_reg = MC_ERR_MTS_ADR;
+			status_reg = mc->soc->mc_regs->mc_err_mts_status;
+			addr_reg = mc->soc->mc_regs->mc_err_mts_add;
 			break;
 
 		case MC_INT_DECERR_GENERALIZED_CARVEOUT:
-			status_reg = MC_ERR_GENERALIZED_CARVEOUT_STATUS;
-			addr_reg = MC_ERR_GENERALIZED_CARVEOUT_ADR;
+			status_reg = mc->soc->mc_regs->mc_err_gen_co_status;
+			addr_reg = mc->soc->mc_regs->mc_err_gen_co_add;
 			break;
 
 		case MC_INT_DECERR_ROUTE_SANITY:
-			status_reg = MC_ERR_ROUTE_SANITY_STATUS;
-			addr_reg = MC_ERR_ROUTE_SANITY_ADR;
+			status_reg = mc->soc->mc_regs->mc_err_route_status;
+			addr_reg = mc->soc->mc_regs->mc_err_route_add;
 			break;
 
 		default:
-			status_reg = MC_ERR_STATUS;
-			addr_reg = MC_ERR_ADR;
+			status_reg = mc->soc->mc_regs->mc_err_status;
+			addr_reg = mc->soc->mc_regs->mc_err_add;
 
 #ifdef CONFIG_PHYS_ADDR_T_64BIT
 			if (mc->soc->has_addr_hi_reg)
-				addr_hi_reg = MC_ERR_ADR_HI;
+				addr_hi_reg = mc->soc->mc_regs->mc_err_add_hi;
 #endif
 			break;
 		}
@@ -883,7 +900,7 @@ static void tegra_mc_num_channel_enabled(struct tegra_mc *mc)
 	unsigned int i;
 	u32 value;
 
-	value = mc_ch_readl(mc, 0, MC_EMEM_ADR_CFG_CHANNEL_ENABLE);
+	value = mc_ch_readl(mc, 0, mc->soc->mc_regs->mc_cfg_channel_enable);
 	if (value <= 0) {
 		mc->num_channels = mc->soc->num_channels;
 		return;
diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
index 1d97cf4d3a94..a7f20850741f 100644
--- a/drivers/memory/tegra/mc.h
+++ b/drivers/memory/tegra/mc.h
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
index 41350570c815..cc66620da60b 100644
--- a/drivers/memory/tegra/tegra114.c
+++ b/drivers/memory/tegra/tegra114.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2014 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2014-2025 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <linux/of.h>
@@ -1114,4 +1114,5 @@ const struct tegra_mc_soc tegra114_mc_soc = {
 	.resets = tegra114_mc_resets,
 	.num_resets = ARRAY_SIZE(tegra114_mc_resets),
 	.ops = &tegra30_mc_ops,
+	.mc_regs = &tegra20_mc_regs,
 };
diff --git a/drivers/memory/tegra/tegra124.c b/drivers/memory/tegra/tegra124.c
index 9d7393e19f12..886dc68fea65 100644
--- a/drivers/memory/tegra/tegra124.c
+++ b/drivers/memory/tegra/tegra124.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2014 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2014-2025 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <linux/of.h>
@@ -1275,6 +1275,7 @@ const struct tegra_mc_soc tegra124_mc_soc = {
 	.num_resets = ARRAY_SIZE(tegra124_mc_resets),
 	.icc_ops = &tegra124_mc_icc_ops,
 	.ops = &tegra30_mc_ops,
+	.mc_regs = &tegra20_mc_regs,
 };
 #endif /* CONFIG_ARCH_TEGRA_124_SOC */
 
@@ -1307,5 +1308,6 @@ const struct tegra_mc_soc tegra132_mc_soc = {
 	.num_resets = ARRAY_SIZE(tegra124_mc_resets),
 	.icc_ops = &tegra124_mc_icc_ops,
 	.ops = &tegra30_mc_ops,
+	.mc_regs = &tegra20_mc_regs,
 };
 #endif /* CONFIG_ARCH_TEGRA_132_SOC */
diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index aee11457bf8e..a30158d92412 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -914,5 +914,6 @@ const struct tegra_mc_soc tegra186_mc_soc = {
 	.ops = &tegra186_mc_ops,
 	.ch_intmask = 0x0000000f,
 	.global_intstatus_channel_shift = 0,
+	.mc_regs = &tegra20_mc_regs,
 };
 #endif
diff --git a/drivers/memory/tegra/tegra194.c b/drivers/memory/tegra/tegra194.c
index 26035ac3a1eb..fade258c0ea7 100644
--- a/drivers/memory/tegra/tegra194.c
+++ b/drivers/memory/tegra/tegra194.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2017-2021 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2017-2025 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <soc/tegra/mc.h>
@@ -1358,4 +1358,5 @@ const struct tegra_mc_soc tegra194_mc_soc = {
 	.icc_ops = &tegra_mc_icc_ops,
 	.ch_intmask = 0x00000f00,
 	.global_intstatus_channel_shift = 8,
+	.mc_regs = &tegra20_mc_regs,
 };
diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra20.c
index a3022e715dee..46e97bb10163 100644
--- a/drivers/memory/tegra/tegra20.c
+++ b/drivers/memory/tegra/tegra20.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2012 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2012-2025 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <linux/bitfield.h>
@@ -778,4 +778,5 @@ const struct tegra_mc_soc tegra20_mc_soc = {
 	.num_resets = ARRAY_SIZE(tegra20_mc_resets),
 	.icc_ops = &tegra20_mc_icc_ops,
 	.ops = &tegra20_mc_ops,
+	.mc_regs = &tegra20_mc_regs,
 };
diff --git a/drivers/memory/tegra/tegra210.c b/drivers/memory/tegra/tegra210.c
index cfa61dd88557..994b1e0e7f37 100644
--- a/drivers/memory/tegra/tegra210.c
+++ b/drivers/memory/tegra/tegra210.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2015 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2015-2025 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <dt-bindings/memory/tegra210-mc.h>
@@ -1287,4 +1287,5 @@ const struct tegra_mc_soc tegra210_mc_soc = {
 	.resets = tegra210_mc_resets,
 	.num_resets = ARRAY_SIZE(tegra210_mc_resets),
 	.ops = &tegra30_mc_ops,
+	.mc_regs = &tegra20_mc_regs,
 };
diff --git a/drivers/memory/tegra/tegra234.c b/drivers/memory/tegra/tegra234.c
index 5f57cea48b62..23276f622aab 100644
--- a/drivers/memory/tegra/tegra234.c
+++ b/drivers/memory/tegra/tegra234.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2022-2023, NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2022-2025, NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <soc/tegra/mc.h>
@@ -1152,4 +1152,5 @@ const struct tegra_mc_soc tegra234_mc_soc = {
 	 * supported.
 	 */
 	.num_carveouts = 32,
+	.mc_regs = &tegra20_mc_regs,
 };
diff --git a/drivers/memory/tegra/tegra30.c b/drivers/memory/tegra/tegra30.c
index d3e685c8431f..f22febcbee59 100644
--- a/drivers/memory/tegra/tegra30.c
+++ b/drivers/memory/tegra/tegra30.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2014 NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2014-2025 NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <linux/device.h>
@@ -1400,4 +1400,5 @@ const struct tegra_mc_soc tegra30_mc_soc = {
 	.num_resets = ARRAY_SIZE(tegra30_mc_resets),
 	.icc_ops = &tegra30_mc_icc_ops,
 	.ops = &tegra30_mc_ops,
+	.mc_regs = &tegra20_mc_regs,
 };
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index 6ee4c59db620..d11dfefbe551 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (C) 2014 NVIDIA Corporation
+ * Copyright (C) 2014-2025 NVIDIA Corporation
  */
 
 #ifndef __SOC_TEGRA_MC_H__
@@ -168,6 +168,23 @@ struct tegra_mc_ops {
 	int (*probe_device)(struct tegra_mc *mc, struct device *dev);
 };
 
+struct tegra_mc_regs {
+	unsigned int mc_cfg_channel_enable;
+	unsigned int mc_err_status;
+	unsigned int mc_err_add;
+	unsigned int mc_err_add_hi;
+	unsigned int mc_err_vpr_status;
+	unsigned int mc_err_vpr_add;
+	unsigned int mc_err_sec_status;
+	unsigned int mc_err_sec_add;
+	unsigned int mc_err_mts_status;
+	unsigned int mc_err_mts_add;
+	unsigned int mc_err_gen_co_status;
+	unsigned int mc_err_gen_co_add;
+	unsigned int mc_err_route_status;
+	unsigned int mc_err_route_add;
+};
+
 struct tegra_mc_soc {
 	const struct tegra_mc_client *clients;
 	unsigned int num_clients;
@@ -196,6 +213,7 @@ struct tegra_mc_soc {
 
 	const struct tegra_mc_icc_ops *icc_ops;
 	const struct tegra_mc_ops *ops;
+	const struct tegra_mc_regs *mc_regs;
 };
 
 struct tegra_mc {
@@ -256,4 +274,5 @@ tegra_mc_get_carveout_info(struct tegra_mc *mc, unsigned int id,
 }
 #endif
 
+extern const struct tegra_mc_regs tegra20_mc_regs;
 #endif /* __SOC_TEGRA_MC_H__ */
-- 
2.17.1

