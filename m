Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012016.outbound.protection.outlook.com [40.107.209.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C7C28642D;
	Sat,  4 Oct 2025 19:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759605113; cv=fail; b=RcSJ/ZyxUZL5XfxRYRMtNsf80VJVqFvovVVy5r6s7DAJ6GE4XE//03bNNJ+R9CDiFBsJ2SPMGjLsejRw7I2GA395T+J3uEeJJADurEkkAJyyagKCAKZMhuXt+vNcsi/42GQgFUyb107Sd+yrd84W0Z2tmrk8Q7ZT4cKOvdmel/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759605113; c=relaxed/simple;
	bh=bz7NWnNxg8a1C9bghWnPPCdlTCBxYAfIgyAxZ0Ky2rY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sb9sLae6Gpwf8UJD6oM9rRNeNJpYS3T6YgsxHo9jU/9YQtSPjw3/Xzl7F3MlugBhFZJNxNvLZvKT7aKEusqTndY7jO8LiINZSDHp3hVZ0JFrSdTxShc2WeDTNeMRVtkTbOdCTLvk/zzHfN2X1ixYyHH3hNJWnO0ov5eK0EGYg4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AYA4zxHP; arc=fail smtp.client-ip=40.107.209.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AYA4zxHP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tgiazYrInYS9xz1u12L974Iww/X0COackDlGI3GvVY5tp+xffpRVFO/FvmcIt9dTFcC+LzIamvUXrjYZqWuOeAajacx2JrJMFiMdozfRXwFQlOkxycQN1mdBbUXbAra2ZgwXOSkU4M9PVMK3daedv3cSXflC0kOkiVQ+s1bCkFcd99MSrFurxYC1nWGOUuxfUTLyKMXAD1/sLs/5QCTfYPoU7QOkfOv5CeLvb8T9qTqIOY/GBX5rSbbrdcuSak8B2rDbtCQVbNmtkplQa/uq9pdOZRg7L9vMZSAAfQORzfktbO+oCBbptUApwcL5dC6OOmOl8Mn3X6w79ygsiNF69w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=So07eoCYJimYHakkoZEfAOaM8uCU6o8iZ3+bNBpX2fA=;
 b=L2RLU5JtdJfwnt0EpIV6ZN3yZViDHR14DE613MvAk7c+OSTmJtGiDGfIJotC5h2eBoq+uMAatVQHmAhSOvwzsvgTyeVT9xcmGQzdLawUy+DddmsK5W2oXs1jVLtLqiTnK/NVmRdXX2eqscq50vXJ9Cy7F17bXDsroVHSAhC6yCTAzS7r7ff8hrTcCv2vlzWYFffEzbwjyQ2Ts4TQwAAxfafcy5Uc1BYaMwiBcKM5tvn4Osm79wm7rLqRSyIJrSS7+lBU8SXFguDyaS8+NQLjFwGNzTmv1E5BKnJ+eaOb1ezsW8OKIaY8byg2LYpUEob9QTy6K6+5k3Obd+qDjzX78w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=So07eoCYJimYHakkoZEfAOaM8uCU6o8iZ3+bNBpX2fA=;
 b=AYA4zxHPDipvDQgmzCIfV1qg4X1UaXHjFJBmJYKKhR+vLpB40zr1IzP5Ir9cZ72m+V/QUaj6Aiuj0WngEJeTofFWuy21005U6N+EzjcMvClbI7Cqqz23vP6yDH8yxv96j/r0bIPmph4ZJQrv8hcchLhaO5tM3TzI/mmWRWppuPazUVo/Qe4T3w/JHHW0CbXtHDEvMIYx/L+lhJbyN/dyAvxylINf8+m2KbTs+XoO89dmMDYIauX/W/kXWaq1SFtO7ijEuv6Hn8Xf8RTZMbuWZq+4VMH2W/ZY6aBY6qjmuEhdJqIlamQhZ116bCHolhMvXC7BNJDVAA2Sy9qhR7kH0g==
Received: from MN0P222CA0022.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::29)
 by CY3PR12MB9607.namprd12.prod.outlook.com (2603:10b6:930:103::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.19; Sat, 4 Oct
 2025 19:11:40 +0000
Received: from BL6PEPF00022575.namprd02.prod.outlook.com
 (2603:10b6:208:531:cafe::5f) by MN0P222CA0022.outlook.office365.com
 (2603:10b6:208:531::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Sat,
 4 Oct 2025 19:11:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL6PEPF00022575.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Sat, 4 Oct 2025 19:11:40 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sat, 4 Oct
 2025 12:11:34 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Sat, 4 Oct 2025 12:11:34 -0700
Received: from build-ketanp-bionic-20250813.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Sat, 4 Oct 2025 12:11:34 -0700
From: Ketan Patil <ketanp@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ketan Patil
	<ketanp@nvidia.com>
Subject: [PATCH v3 1/4] memory: tegra: Group mc-err related registers
Date: Sat, 4 Oct 2025 19:11:20 +0000
Message-ID: <20251004191123.2145307-2-ketanp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20251004191123.2145307-1-ketanp@nvidia.com>
References: <20251004191123.2145307-1-ketanp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022575:EE_|CY3PR12MB9607:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f207b82-ce1d-445c-eaee-08de0379d951
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wLze2pgZpCOdCLkF85HSzCgvUc0puykQWUSqgqtJ8SOPuw6OVGoAhTWc7AM3?=
 =?us-ascii?Q?zauZPoZ8S6C99npgADsWGRBNwkRcNFyp2aPHgLa2/hqLfe3kNz4biGlYJ2Ge?=
 =?us-ascii?Q?T/TxIEqpVcGOisMcii0oIOpAlLz9pIjoc9ZnGBhG2MAq4HreT4TR0YauxDV/?=
 =?us-ascii?Q?j/H+aCxvIVx6AjIUKQ8gQbSCHYmFE939TnmodPNIEtfiDa+KCPWlkH8NizOQ?=
 =?us-ascii?Q?PEHERkdmHFZzxjEUBNhi+giQf7hz9EmrsISqeMafiGkOp7y/fqloIBWNawcD?=
 =?us-ascii?Q?94RJNjr4CE8HjxR+fLjwXkPBnwAJA5F9hEILz+grn9r7BJy1xEPuZT3oHE44?=
 =?us-ascii?Q?gaJrxUEE9iPFaksHE+CRGQQBwPS2/rmjcNvLUQYF8xzOgmkKMh9RnvPLqerd?=
 =?us-ascii?Q?yY1RJ3LAQsYgtmInOVvR6EIqHYGH8SllFNaE2oUaN6/b/pdVqIiS+wZ7PxtS?=
 =?us-ascii?Q?TNzGm8d+YqImVErsTJ11CdlM5k16xTBo1TDuTdi1z8r9CyllaymGvlAtIT6O?=
 =?us-ascii?Q?wLlR7DOjPSFaR0+s+e4dc15wytfsn0a6SYYaIWfe+5kwdzWTe4VW/cUHxz2B?=
 =?us-ascii?Q?GPSPrZAOgtK/Mx+dvb56m99imHGCcjeVTp0LihrCbSn2kHdXpq/Jb/1jZvB1?=
 =?us-ascii?Q?sJyEjeNcF1iV7eNcPG8ttA37uBQY7WN7aKq5ziMGegoAyRncOlkQxldOcXn+?=
 =?us-ascii?Q?zwxR1Jz2tAHa8XxC3kH4g6w6jezu+WFnPk1VN2Vsa4f9u00gCkE6V4TRYQBj?=
 =?us-ascii?Q?UCsnoFeNoqS/8nJEz507WB2498vf21XaKh9iwJYTvBOvvGayCrvSy6y4FNDq?=
 =?us-ascii?Q?6AtfQRti/JuD/3ng/Ym4Py+TMcng80oWESZkSZvzM28vq2kxdynBP3BIV76n?=
 =?us-ascii?Q?PLrEyoZja1scQJ20jv1qFwEZV4SSJuWpHeuSnz4V4tHite9ABnj6Y05Wts4S?=
 =?us-ascii?Q?viLxvLL0ANFbxGsn5JiN1jbnS2UQmoGBPi3Q8q6U2pHWyrwkRwFVRpWKL48a?=
 =?us-ascii?Q?7C6j2MmGE8XzTjFZXJqkDSCkeKoP/68gg8JcZnNIQtvHFr/qtiEoIJ7qwiLk?=
 =?us-ascii?Q?vkM1VC3VXZ51+e+D2ULtNyjFyPy7THxR6C0SmJvlC2NQJaNtlpAvC2MJTg0t?=
 =?us-ascii?Q?sJgt5/zezq4Chm+BNWNfld6jHA3RnSHmhN4o9vInp2nj9zuCswy78Hyp2doJ?=
 =?us-ascii?Q?akZrpnd++0SJy081NasepAU7XgAVM4tyAKRRTfEnqMey1bTM6tV2NSHERIhz?=
 =?us-ascii?Q?tUp31En1zqwLhQKEo4vdMDmyGO1Z2NizjkyLzY8YzlNonu+LQBOclSgxh7D7?=
 =?us-ascii?Q?h3ncdC+N1NBLPZpzzv/7f1YB4BVfAfPOCRsrlh7t6aZrNM8rd1GTnuO7yatC?=
 =?us-ascii?Q?j9pktbZotsyxDiTY18Osiv+0IFcGkjLYN9JUNBOLIEz+QVKZMZ2uN6jtp3vO?=
 =?us-ascii?Q?hnwy8G6VPc1qYGfv0zKpMQtdhiNF9JinAx0rJj31gj3CSo4ukVQfPWpn+Sun?=
 =?us-ascii?Q?uCbx0Gmnl3/N7fSQt6wWL+OSBE16e8iiv/7s5/pPgxKaCCeLuFNHxP2ZszSc?=
 =?us-ascii?Q?O5nWNEiiV6eeNBrKIn4=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2025 19:11:40.3957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f207b82-ce1d-445c-eaee-08de0379d951
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022575.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9607

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

