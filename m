Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011060.outbound.protection.outlook.com [40.93.194.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19D4364040;
	Fri, 30 Jan 2026 17:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769794301; cv=fail; b=qmzButK1TvAKRaH5HB3BFpiWxjM0KMu534KIfzp3SXTjFYUHoMoEk2h8b0yM3tB8hyoL6cIrfpZ94MHwyrTpKX0rqZvXgxW6YOGnQ+beqCfHqJMc452vBKiJNcdonZ+h3C6eEEVdbt7B/vFxlkQG2wrGS/Q617pXmTneCnexsk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769794301; c=relaxed/simple;
	bh=JBHft8+p8NIU0Wy8BZccOino7AAx3XQ8uXpnWACqypA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rav1oInLMFiOHMbXrMEg3fd/TFAJDgsm0S0Fr6rVPdhWh9gjEGpPdo1IueaOWuaxuA8fMcthXDh9aFZ7D2eotiqa+er3PEHKoIyge5GABppsZGCeMZRBjMvhLDxAEiyoRI3BTim/vtpsYjFDZG3KeVTdVKNxnSDZmetCzh1E7ss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=acOpvVUo; arc=fail smtp.client-ip=40.93.194.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="acOpvVUo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Csq4aRzQeEpwzYBxHqTU4juh9gJrILIwwD/4ld5EX4O57VG4ANmNMzdWelYbv8KHpuFRyn7uYgN9PS6cnb523zbveAgVHvDiAq0vT8hdFxj5Q+ykpSloH+NHyoNI2JG6iSZpj4mPJau0mv+h0JvZKhGvzZGrSbIqkXWOGhXI6Mf8yOjhvmbPWiyG+mb+khuvDelSSccBdcJdVsIrZSiC6yA0G5zifhcHc+MX8Y0KSCT76gOZ+Pkk/2Ua4KNxSBujWvUKa4FwCr6ikno00WgZBLbEuz3Es1ho0UwgufUCUs71VODlRcvM8k3Oixk/oykvK5loB3TCGhrRh98j3GUehw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qThP87H3FJ7t4Bm1czLg0Vbh//Zr+WTwyGBBuQmTeDs=;
 b=VX7AYqOg7EtmU8llcbQobFeh8dm/di/101aFmDr6xWsvCgVqSqRxRBVWD2LH2WmCaHh/l5Acy9fbOR0UMECa5uZGD1/H/b0EMAuB2YOdGwbayaftTnCQK8OkS1+NdmnZZXV8j8GwhWIJoyYPjiBTRS5a85ZVT46KYRoEmNlhFnoFnIICiyf0I6Cbl8NE2xaO0KVi3TShcikoMxwuo1QczdzwI+PC7LLBSvQu4zA6K/21IhlNG+cKjHl7Paiuo5Qvuzw/Ea4nogC+o53EKMvSAW08BYd+SLYhYeHoE6IqO6g1ZAKV1fav+z+WYltqOt2eW3G0RpVdhkUl5sfR4JXD0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qThP87H3FJ7t4Bm1czLg0Vbh//Zr+WTwyGBBuQmTeDs=;
 b=acOpvVUou/FAH3PqySH+JmN0i+jJsOhFgszpuCxvBBPDAR7IKTPjc2cSqRcczQXKfo/HHNlKYo/dvpAp/rBUysfGwaPj+sp4TMyhr75SGO8Tv4fDQsBcsbcWq+S81/HVkzO6b7G3sxgvtmyu7j7lbf27UlW4VZaLoisY4/98XXeYh4iLkiVMEAzUwOtYGbdx+Aoun/nVmAttdW09Vr+v0d3wpBIIJqGjWPLhbSFKszwha3U8PQUAQv+a5KIIZAgITpIQzhQLh9hZDnA2GTb7p4HpEsYi+sxWfytTc+M1wEKaW5EzMYl6b+OAphTis8CQkCsi98zF22BdfW1yh9jkLQ==
Received: from SA1P222CA0196.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::23)
 by SA1PR12MB6751.namprd12.prod.outlook.com (2603:10b6:806:258::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Fri, 30 Jan
 2026 17:31:33 +0000
Received: from SA2PEPF00001508.namprd04.prod.outlook.com
 (2603:10b6:806:3c4:cafe::15) by SA1P222CA0196.outlook.office365.com
 (2603:10b6:806:3c4::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.13 via Frontend Transport; Fri,
 30 Jan 2026 17:31:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SA2PEPF00001508.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 17:31:33 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 09:31:16 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Fri, 30 Jan 2026 09:31:16 -0800
Received: from build-ketanp-bionic-20250813.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Fri, 30 Jan 2026 09:31:16 -0800
From: Ketan Patil <ketanp@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ketan Patil
	<ketanp@nvidia.com>
Subject: [PATCH v6 2/4] memory: tegra: Group register and fields
Date: Fri, 30 Jan 2026 17:30:53 +0000
Message-ID: <20260130173055.151255-3-ketanp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260130173055.151255-1-ketanp@nvidia.com>
References: <20260130173055.151255-1-ketanp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001508:EE_|SA1PR12MB6751:EE_
X-MS-Office365-Filtering-Correlation-Id: 00d1aed6-1e65-49ce-bb42-08de602569c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xboJXkhibHSZVqRcO4C+4zRmOzutnh6YwWMSEqL49G6m0GZNzn28GbGQWhsj?=
 =?us-ascii?Q?jXyjbCudm+h0rkf4ovyuWEjPsKmjjku9B3mQJWkzZ9sIHW9API0sx7fUpfip?=
 =?us-ascii?Q?EA4ym+2QR7uqsXViLppJJ1lv0BjUCj9TN8WWhpX6AFW1ImXKgFU0K98EKI7y?=
 =?us-ascii?Q?uzWlACXQgVww7Txvy15e7Ec147iL3v2DL9i0oSE1Rcg670SGuALyY52Bqrxh?=
 =?us-ascii?Q?RYfOC8n5slRLyJoMUL9xxuy1ICcmPWBgCACXQmwmBqDcZ1+GKhLTI1Ry4HAy?=
 =?us-ascii?Q?tvttM9AgQceHAFzouN30xhgm4GKOjDAveNI0izmeCBT/lJBNZdvuUOljolmf?=
 =?us-ascii?Q?o7J37TSj0sMTm/YCdtyQr+nIiH0ZmHPJFvBsmOeJYGQyDsgfnZxDDuK0dTvp?=
 =?us-ascii?Q?z2KLNqXD3smJoH2nJdnco7+tG/RAp9OYOQgImacZlaK1GoloVefk1o/acqOG?=
 =?us-ascii?Q?Fq4eoWzoGO1j34mUasTRI4kVFQZw0nkC2zcPZtnZYOBP6GKiREI8ETguMU9l?=
 =?us-ascii?Q?yK977OFtSH0t3NDsFHMZ/FqSKUGr9z8Vh/WJM/uP4AKXtL3F2t+SiQBoCalt?=
 =?us-ascii?Q?80+kkph7nMQrTCj3h/aJVfn4+N2J7gnpuCbKkT5d7dAUuLh4fueTVSje6tJc?=
 =?us-ascii?Q?YtHbGWbrLFKJA9pEKQdAdl8rOliOGuxTWdEeU4ZuXUjUyeblW0a3LTO5srHA?=
 =?us-ascii?Q?9bjoX977lxjQnFMg0ui4H/C8bDgdljYRLvmUsYe8k+WWZBhZ7Lmn6wJy2DYF?=
 =?us-ascii?Q?ZeeXU0Wncf8hd5go/9hDjUpSxebvKd/I2rgqhYZ2GOciy/b+L3PSp126Fo7f?=
 =?us-ascii?Q?ZucsA/2w97IQXFdOv/s+q79K3Q5nvGVZz9Lz8m760e6BCFYBkcz+9VYJ3g3b?=
 =?us-ascii?Q?p/MzKXKo9xlaQcERmB9Fx3QzCjVaCUFjeoVY7x+PfmUp4kFfJ2CAjST+osSE?=
 =?us-ascii?Q?WB3iiGST7SNfjHSqb0T9qap93Bc8YH+CPm08CTbyt7q27p+qIYSj/RBO9qth?=
 =?us-ascii?Q?3pioh9Vvbj4ZiSk+W5rTXgq20TEc2fnXee9zXLafn4leM8PoMeqI9JK4sHWx?=
 =?us-ascii?Q?7xyxseKnuB2bIjD1AtGPxpdCaCadggs6tM+Dcqb6P95rqU/f0nkHo1BPTpqd?=
 =?us-ascii?Q?M6BKYnhbIO9kHH3DJW3nOkAk4tGl4IZpWJvlh9rrzsyI5ILwGNCDDxOAzrWK?=
 =?us-ascii?Q?BH73Vrsdt7gJ7KsAkQrhID8BG2Ykjb7l40rYG/y0fT0SS9syHvyejNZFl2Go?=
 =?us-ascii?Q?ZFG+qp7cy3JnzfBfOBx+jS/VCNZ8qgoAv6gBlUB4sWKAuoC7ABgzhxtt4RfD?=
 =?us-ascii?Q?Pb0k2dT0IY93H3T43vkY0aLMMbGOdxbkwrBNANdSUExDOEG2E1hzv7VH64rO?=
 =?us-ascii?Q?i341oOEHfJu+OoNRd0zGnS3GY20NoVEJqFfFV8TjIeGftW5LJcUz5fV2xjn3?=
 =?us-ascii?Q?SS8TONtV4AzRDICbU6L+UvU30gMguVuKO1KiCZBobKGXXdxz6jSIXiEnj0bd?=
 =?us-ascii?Q?wX2cnHDOZbhaI4hxHqNNHYg2oOJ7062AcA2ymvvhtdRJbfWpTDyhdlXFzxg+?=
 =?us-ascii?Q?s3eJspfSJ+DY6qvTSb2F6IAeGzsd8dfMSfX1MDwvx4dtlAyN6XRd5U8MUIgd?=
 =?us-ascii?Q?TVl9HCbVicWAAl5VohA0/2fKkFm3Rvd/zyIDYMNKZuoKEcoIz6e5H++Bw43E?=
 =?us-ascii?Q?uFJocA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	95TXtFR+OSNdQpHJVHIhM8gUYtuGqwfBHHKe12WScAx2QKZF0t51M7DFAtzfPaS4sZHBQoKagPegtMs4ArpNuUDDlfhHeB4vILQEwtkDJd/HfQmA61oG56StNR2pT49pWgq1QjoP2vvFt9n4uEf/+OPXABDe+Eqjaw4nOdaaQa6sbR5WDmKoSZP1fNB4j/OAaXRrqhgZAQALUD6sKEq2Egb4I2RW1MouGiOFdPiW5nU6cHXDNRrt/NedA6ut9Ioj45IE+aD8lXNo0ctrOvR7FYAorfKCaRQ2ifzW5hLw7WpP0klgwzAwCIuscKr23wCiSM51ZYkH6Kr9SBTQMdxqmAqDDGIZquZe7XB9sMlrH6+Rzo3BPHiOM9Lz50sAdwVJiFVmKoB534SDLfX2wrJ8LtjmqFTBBMmMhaEhMgM8cHsj+f54npkly6W7UM3j6mIt
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 17:31:33.6384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00d1aed6-1e65-49ce-bb42-08de602569c3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001508.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6751

The current register definitions are not in sorted order. Sort these
registers according to their address. Put bit fields and masks of the
corresponding registers below the register definitions to clearly
identify which fields belongs to which registers.

Signed-off-by: Ketan Patil <ketanp@nvidia.com>
---
 drivers/memory/tegra/mc.h | 62 +++++++++++++++++++++------------------
 1 file changed, 33 insertions(+), 29 deletions(-)

diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
index bbe3e2690c64..5f816d703d81 100644
--- a/drivers/memory/tegra/mc.h
+++ b/drivers/memory/tegra/mc.h
@@ -13,13 +13,35 @@
 #include <soc/tegra/mc.h>
 
 #define MC_INTSTATUS					0x00
+/* Bit field of MC_INTSTATUS register */
+#define MC_INT_DECERR_EMEM				BIT(6)
+#define MC_INT_INVALID_GART_PAGE			BIT(7)
+#define MC_INT_SECURITY_VIOLATION			BIT(8)
+#define MC_INT_ARBITRATION_EMEM				BIT(9)
+#define MC_INT_INVALID_SMMU_PAGE			BIT(10)
+#define MC_INT_INVALID_APB_ASID_UPDATE			BIT(11)
+#define MC_INT_DECERR_VPR				BIT(12)
+#define MC_INT_SECERR_SEC				BIT(13)
+#define MC_INT_DECERR_MTS				BIT(16)
+#define MC_INT_DECERR_GENERALIZED_CARVEOUT		BIT(17)
+#define MC_INT_DECERR_ROUTE_SANITY			BIT(20)
+
 #define MC_INTMASK					0x04
 #define MC_GART_ERROR_REQ				0x30
 #define MC_EMEM_ADR_CFG					0x54
+#define MC_EMEM_ADR_CFG_EMEM_NUMDEV			BIT(0)
+
 #define MC_DECERR_EMEM_OTHERS_STATUS			0x58
 #define MC_SECURITY_VIOLATION_STATUS			0x74
 #define MC_EMEM_ARB_CFG					0x90
+#define MC_EMEM_ARB_CFG_CYCLES_PER_UPDATE(x)		((x) & 0x1ff)
+#define MC_EMEM_ARB_CFG_CYCLES_PER_UPDATE_MASK		0x1ff
+
 #define MC_EMEM_ARB_OUTSTANDING_REQ			0x94
+#define MC_EMEM_ARB_OUTSTANDING_REQ_HOLDOFF_OVERRIDE	BIT(30)
+#define MC_EMEM_ARB_OUTSTANDING_REQ_LIMIT_ENABLE	BIT(31)
+#define MC_EMEM_ARB_OUTSTANDING_REQ_MAX_MASK		0x1ff
+
 #define MC_EMEM_ARB_TIMING_RCD				0x98
 #define MC_EMEM_ARB_TIMING_RP				0x9c
 #define MC_EMEM_ARB_TIMING_RC				0xa0
@@ -39,45 +61,27 @@
 #define MC_EMEM_ARB_MISC1				0xdc
 #define MC_EMEM_ARB_RING1_THROTTLE			0xe0
 #define MC_EMEM_ARB_OVERRIDE				0xe8
+#define MC_EMEM_ARB_OVERRIDE_EACK_MASK			0x3
+
 #define MC_TIMING_CONTROL_DBG				0xf8
 #define MC_TIMING_CONTROL				0xfc
+#define MC_TIMING_UPDATE				BIT(0)
+
 #define MC_GLOBAL_INTSTATUS				0xf24
 
-#define MC_INT_DECERR_ROUTE_SANITY			BIT(20)
-#define MC_INT_DECERR_GENERALIZED_CARVEOUT		BIT(17)
-#define MC_INT_DECERR_MTS				BIT(16)
-#define MC_INT_SECERR_SEC				BIT(13)
-#define MC_INT_DECERR_VPR				BIT(12)
-#define MC_INT_INVALID_APB_ASID_UPDATE			BIT(11)
-#define MC_INT_INVALID_SMMU_PAGE			BIT(10)
-#define MC_INT_ARBITRATION_EMEM				BIT(9)
-#define MC_INT_SECURITY_VIOLATION			BIT(8)
-#define MC_INT_INVALID_GART_PAGE			BIT(7)
-#define MC_INT_DECERR_EMEM				BIT(6)
+/* Bit field of MC_ERR_STATUS_0 register */
+#define MC_ERR_STATUS_RW				BIT(16)
+#define MC_ERR_STATUS_SECURITY				BIT(17)
+#define MC_ERR_STATUS_NONSECURE				BIT(25)
+#define MC_ERR_STATUS_WRITABLE				BIT(26)
+#define MC_ERR_STATUS_READABLE				BIT(27)
 
 #define MC_ERR_STATUS_TYPE_SHIFT			28
 #define MC_ERR_STATUS_TYPE_INVALID_SMMU_PAGE		(0x6 << 28)
 #define MC_ERR_STATUS_TYPE_MASK				(0x7 << 28)
-#define MC_ERR_STATUS_READABLE				BIT(27)
-#define MC_ERR_STATUS_WRITABLE				BIT(26)
-#define MC_ERR_STATUS_NONSECURE				BIT(25)
+
 #define MC_ERR_STATUS_ADR_HI_SHIFT			20
 #define MC_ERR_STATUS_ADR_HI_MASK			0x3
-#define MC_ERR_STATUS_SECURITY				BIT(17)
-#define MC_ERR_STATUS_RW				BIT(16)
-
-#define MC_EMEM_ADR_CFG_EMEM_NUMDEV			BIT(0)
-
-#define MC_EMEM_ARB_CFG_CYCLES_PER_UPDATE(x)		((x) & 0x1ff)
-#define MC_EMEM_ARB_CFG_CYCLES_PER_UPDATE_MASK		0x1ff
-
-#define MC_EMEM_ARB_OUTSTANDING_REQ_MAX_MASK		0x1ff
-#define MC_EMEM_ARB_OUTSTANDING_REQ_HOLDOFF_OVERRIDE	BIT(30)
-#define MC_EMEM_ARB_OUTSTANDING_REQ_LIMIT_ENABLE	BIT(31)
-
-#define MC_EMEM_ARB_OVERRIDE_EACK_MASK			0x3
-
-#define MC_TIMING_UPDATE				BIT(0)
 
 #define MC_BROADCAST_CHANNEL				~0
 
-- 
2.17.1

