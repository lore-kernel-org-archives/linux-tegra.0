Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013022.outbound.protection.outlook.com [40.107.201.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB622798E6;
	Tue, 16 Sep 2025 05:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757999937; cv=fail; b=HZqSLKNbEVF7kEzRhpzaKdBTjuFsTVtyiODmU8dw/eLNmyML42eclGUmizHRAu70hWFCnrCoMhltNGcVYI1Is2W9AKiKVVKjywGcRcUnwvjZaRWyILRmxRe+Y/OB3FkMKXy2F/EFrlfvPv3BWE8WLZdK6xLhoHGP8ryI4W3Iz2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757999937; c=relaxed/simple;
	bh=bz7NWnNxg8a1C9bghWnPPCdlTCBxYAfIgyAxZ0Ky2rY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OHUdFZKDjgpExoVi/VvXaO3MiC2q4V7j26rrRFbPguLftyUWInGjX3VxYwh8SbiaQBw86pjEKR2nrkAJ7aTcGgKy1j+l35nzDXk/hcqKKsHiLRcs+HZS8AWIdaogp7fzVteaSgeXXpqYSF/FbnLYQaUHnjnFDSlAjomSmjLJIS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LcxL76o9; arc=fail smtp.client-ip=40.107.201.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LcxL76o9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vaLU8J0dS/QKDLwQhomemaQt2XHUci5aVKWIchzkDCIoLRX2Jsw2G1ttYwc7JdAEp6H4YzqD6QtsOdBGD/9ApAtOwMCelmif9JteoWoSu6xPqtMXCmeDr+YffKK+eR0nsCPJUqj9TzUPLW1cvejdNTdjKRQddwGIuvRZUmijTJAjtWBIpMPAgIQiQ6WZt+BAzndlP3X8cel21XQp6D/LaMMZTzCdyM1/6N2eROIaqbMO+AwhHK8E7JVKBxWs7ytzqJKO/Po+GGA8ZiVuKiqo7JF+c2NxeXYQTltDQmhPqLSb0k0Rvo6si/yYW4SOrYVwy0ZsFfhwiwGHGTfNb3snQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=So07eoCYJimYHakkoZEfAOaM8uCU6o8iZ3+bNBpX2fA=;
 b=OariV3Ez6TVk31tc+9AkyZDx+rrCVUaLxp/EJU1YokQ1QGfLfHwfcCGiyNu+ImbnaGckUlbrbGJhFa25mV5yxGiP97YpVY3VXLokgMVT8yBw8NlhE94j7hjtQIGLEQIfg/28QZw05EfhZ7wEpE/T1t0/8sVcW2Fl7Km98b3yIMQ/1vNDlqgMF2r1tjAsboVyHsCXuMMalo5Duq5KaDktHXWp0TZuIFHfufwbVorlOsvUPfUTPRDY5Kmc8RWA1Zg+LtGyBfQcNEZoZUglxDNp1U/h6Ul7dDe/L6UG4k5PYDVbbW9Vgm/SU/ls6OUHt36/bP39yOZ8GPOT+CtqyZ1BiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=So07eoCYJimYHakkoZEfAOaM8uCU6o8iZ3+bNBpX2fA=;
 b=LcxL76o9n8iKjrNCK8Kd1PNHzAvsNVeKQGxFyFNoZiZFzO/lqc4AxR/khtgefxP6bIRpoDLZlEqiIH7DaKuT6p+B46xXa1QULqXfGFtpTzJIb0rgwLxdLuzNGn6bVwMZ3xpHMBzntVX5iAoy/sSEpzKEPM2U4+nVCY7mY7lyy+k7JSu3g/y0OBd9L37G0ZA8QFmy3h3N/EA0vsHoyAeCEXavldO9guCj/IAuAPNNagF9mVtfV60jza8Evc27g9XWRS6FEZbqXlJZ2LasrXpBPAXwTDTavhZzfA4QoDCLRDhscYgPhqGMkC1SQd1cgp6D/AHL5akqjBbNWtLQmx5dZg==
Received: from MN2PR05CA0060.namprd05.prod.outlook.com (2603:10b6:208:236::29)
 by CH3PR12MB9171.namprd12.prod.outlook.com (2603:10b6:610:1a2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 05:18:50 +0000
Received: from BL6PEPF00020E61.namprd04.prod.outlook.com
 (2603:10b6:208:236:cafe::84) by MN2PR05CA0060.outlook.office365.com
 (2603:10b6:208:236::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.13 via Frontend Transport; Tue,
 16 Sep 2025 05:18:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL6PEPF00020E61.mail.protection.outlook.com (10.167.249.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 16 Sep 2025 05:18:50 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 15 Sep
 2025 22:18:40 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 15 Sep 2025 22:18:39 -0700
Received: from build-ketanp-bionic-20250813.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.14
 via Frontend Transport; Mon, 15 Sep 2025 22:18:39 -0700
From: Ketan Patil <ketanp@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ketan Patil
	<ketanp@nvidia.com>
Subject: [PATCH 1/4] memory: tegra: Group mc-err related registers
Date: Tue, 16 Sep 2025 05:17:51 +0000
Message-ID: <20250916051754.39250-2-ketanp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250916051754.39250-1-ketanp@nvidia.com>
References: <20250916051754.39250-1-ketanp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E61:EE_|CH3PR12MB9171:EE_
X-MS-Office365-Filtering-Correlation-Id: 840e06b3-c22e-4de3-2793-08ddf4e085a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mDbA4Mkm81WybTyQeKocXDRuUcOU3/OXCkvRQ1ii70eTckgpOIdeiOaoL17D?=
 =?us-ascii?Q?U1Dk/ytIOhbbMNlmXd2G/sksbv5HiY5kJb97uYVfuqFc1ONngaS7/qU7VGdn?=
 =?us-ascii?Q?kV5FqIEUY8xfSlv8sx4mOU7wgMZoMaGNo9GLHTPWZtcAvA0FqJpVvrnYXtPS?=
 =?us-ascii?Q?gq0+OFrta3VWhABRaDTMZlOpNYMyyVcGHkJixglEIr+Gh3+36ChiHIkbX0Ej?=
 =?us-ascii?Q?p2A5WTsiefIZIp3XmwRwBNd9DWEwLpgbh78Fl2VH0M99/Zk+hl47wiql9KhP?=
 =?us-ascii?Q?yuSR2eUA9ohivv4C6k8YDbv6EX57Os6maARoAHVD842BFD5AWBgXGQHRfSJC?=
 =?us-ascii?Q?YbWi1LEei05L93b6bZ4Jqx6aMqkkilMBnk/RuJsS7X7js2TrcXA3+20C2F6+?=
 =?us-ascii?Q?Ex+TLgaYdBFcQqoGU1MMk8gY5qt1zGz8Xp5Eog9b6bK+YlCLD7PlgxnPoH0H?=
 =?us-ascii?Q?Knl7oemeHOg5L7liBWrmLH7PO1C86L9GTocMbm+SJd9pslDfClOz17uZYfYW?=
 =?us-ascii?Q?GIsBb9uJ4lIKhdRNQW9+gbzWi5KmIvd3nigFlNwO1s9EOC/xiTTRcXojbOdf?=
 =?us-ascii?Q?C+cY1eYMLwm0LI+xk12TUrxNUdWZUH6SCouBWooBAv8LJ+T2AgNa/jYC7lnT?=
 =?us-ascii?Q?VkBmXjkW3+d/0gA/XfTKfDedpkRt2iO/svan60PZgEM17SPFbudBrIrNT2Tz?=
 =?us-ascii?Q?eSG5Khj9j34V1MAxwzIkd9otmVB/aISvkALqc7EVx5AmLD1TDne7u05aiIxM?=
 =?us-ascii?Q?+6xYr3sdsaoDYCbu2HTdgfBHXCQntll61cJMC5EzsEeYp1SsEew6UtIE/WcV?=
 =?us-ascii?Q?TNhFqvhPjXqTpE5S1q7xvftStJjqd6VFDm2q8WUo1Ckm5j+6RZYVVcGubEVB?=
 =?us-ascii?Q?eXEq/w8zAbUdaa61YQHZd2yvPcPtEZGfz+qz6O7ZC5kWnFB3mmL8jiEoU5Qc?=
 =?us-ascii?Q?lnqDuVTFD012ShrnoPjCvLIkquzpHn+o0svDA0JhtAeplVQbeiXhkvS6uDCk?=
 =?us-ascii?Q?r6G5RO3wTV81PJnPQn8KHEvrGNMipEuv66uITD8VYWhRm3bKyXSXla5RFecc?=
 =?us-ascii?Q?WtkY4yCpDvLYByYf3VpAJKNsa3MJ6ZX0lr15Tn6Ct0HVBRWjBKj/RYqk4nlY?=
 =?us-ascii?Q?cXdeuJPxUl0baVPAdzXwGzsK9N5DY3m0XWXwubKLrZT9feEOcDwTuTUNq2tb?=
 =?us-ascii?Q?2wbmMSS8wnh1ZKPmz/tkjcbkbIOlOcOzdagH0VIyY0Js7q5RD8wW3FrnLe+P?=
 =?us-ascii?Q?wJu3vlndDN5sf6LBKpo2H/6jVY5LTcQdCMcUPRGnitjV717TCFFtO0yjDv43?=
 =?us-ascii?Q?W2lkN/TcwV4gwKsn8LqxmzUykPSU6AWoIGa19vToYNeT6Qb3y/nQOBqJSmeo?=
 =?us-ascii?Q?HOmLTGk9ml9xUJLeEr2xW2jmKJzsveEAIwwMcWx8isr7saalrJH8am90KDgy?=
 =?us-ascii?Q?1xv7W4SXE8iHhQr8elLJ7YCfIPJ8tjEKO0iVndkOWo7dz+NbjERnnLP0YF/o?=
 =?us-ascii?Q?Ibxv3nD+EMDp1JqcXIyGu2UF2x85jo4H9s+h?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 05:18:50.6933
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 840e06b3-c22e-4de3-2793-08ddf4e085a0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9171

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

