Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011002.outbound.protection.outlook.com [52.101.57.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD6C27FD59;
	Tue, 16 Sep 2025 05:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757999944; cv=fail; b=EpiB/jZUF6dC6dpmGSwH6fG+ZE9x5uG0d/32X88QiGkkiku78TTAbm9At6H9Tq/mhVVTN2VsQNL2wc8jqQUaJ6IHCY/HoBzOFvQbvmGckoF+q3YqxAjsWaIs6Z3JJbLIVEkOIZd+5fg8kKdVBf0P6xdx3zseQOwwX76/wIgmEa4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757999944; c=relaxed/simple;
	bh=2OjvlNTqfpQS2ZydKPB49s4URjxhKx0QgfchdJ+/+NI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MLIHvgwClZBqjeMXKav1fffPaFwhXlMw+PUonwbMolCRK+K24qSujRh6jE40ymQkpEne5lIRhe2WK0KN8gUIKEACBSLC7mA5TMaK3qaEtUiG9XBuZCDTbHuq1gbpBbHA+KsCDXrREhzYk6IZTyVrHC51qullDDPXLqp6cnQrDIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=go9fHs4/; arc=fail smtp.client-ip=52.101.57.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="go9fHs4/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OBGaJPJucWabEkofjgPzv5A1f3IssetNK4GzpVfouOC76Qv3VMKXKclJErkX3pRkpKHdXuNDmhmnILUyeETHr4Ux/2mEyRqoEOutPoLmNihVC0SODrz+CRkLAttOTQ7J0gdn0Bg6VxcRIEJccgGtR1jvsRw62AITWRUiCf8pHkyNLFqJnfeDyWK6aasRyQ6IZDcmU3OYKYiUyG8eJxIH2Y5Dm+FufBzXqL4T8BEzwiaCL9xQtV8PfwVhyN1x8JTJPJfeRdKpzQ7FJdMpZipM1rNm7dmnv1tc75P0qGMvPKqDq4c9iWuN/WbStaFfhicWajmieh8sD/5SDMRBUr2SOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=62a+n6h3NnIIHRJVL5PTjzdsYU9PohaFz7UmJ9EPZME=;
 b=E65N7N06C95g5ocIlqkqLzUvdHpuWYKUFsaNOQHgodDrX0EExy1sjVCHYkH4qHEIG08K2asAazsLPc4Wgqtu0hvncAS/sQwomiTnuUn2ubp/8nzFDTXIOfTzSMqarTZql82bH+7LoG7gKRYj1VcS/ZKs3zP4tlAyXi8kF6FsT94PMk2V6DVoEX+lvwJs18ufPrBEd9UJ6kqU0QPh7JY6iqZ6Q5P6LNTk1R11AgXNY5eOkvL8CiBFom2CMcRtqyONfCO6VIgawAD9xoPQT90xvouusxR5ppe9YyWbpdWGT6nb6UwKm9pB5PGswmMuWDuY8iKjC/guJQIRtXZOoZr/BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=62a+n6h3NnIIHRJVL5PTjzdsYU9PohaFz7UmJ9EPZME=;
 b=go9fHs4/TtxTA/9lUJn257dnbcdHwHpa2CoUgxfALCO2aIRBnQTe+Qn0Hq58qItVyzE+aQu4fB1xFo5OlbRLempTdcDjpt88MO0FVxMi0O281Gq2UsWEAzMvwEMgdR+FbBGiThZ6iqEuoA16dvqw8wD8EiuElf1VKJVR6TybVUYyY+SbdoURxhw1z5YeE0wnjrixBx7kRZpZyg0S+RRyvvfhggO/0xZhdO42ZUCJplBUoRzAjNeETw0pNKqVhBqxnr19rH5NcdZeJMSQkpnakOqU5XiZq7oYQ+0vgygZfC0hk8cxkH4/WSlC/6nLX5QMtKmzHOK45pyOOiMSAJRj2w==
Received: from BN0PR04CA0010.namprd04.prod.outlook.com (2603:10b6:408:ee::15)
 by MW6PR12MB8951.namprd12.prod.outlook.com (2603:10b6:303:244::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 05:18:57 +0000
Received: from BN1PEPF00005FFE.namprd05.prod.outlook.com
 (2603:10b6:408:ee:cafe::e7) by BN0PR04CA0010.outlook.office365.com
 (2603:10b6:408:ee::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.21 via Frontend Transport; Tue,
 16 Sep 2025 05:18:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN1PEPF00005FFE.mail.protection.outlook.com (10.167.243.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 16 Sep 2025 05:18:56 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 15 Sep
 2025 22:18:45 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 15 Sep 2025 22:18:44 -0700
Received: from build-ketanp-bionic-20250813.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.14
 via Frontend Transport; Mon, 15 Sep 2025 22:18:44 -0700
From: Ketan Patil <ketanp@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ketan Patil
	<ketanp@nvidia.com>
Subject: [PATCH 2/4] memory: tegra: Group register and fields
Date: Tue, 16 Sep 2025 05:17:52 +0000
Message-ID: <20250916051754.39250-3-ketanp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFE:EE_|MW6PR12MB8951:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a96812e-0a08-40d8-ad14-08ddf4e08909
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2W1pxgqAv6fXy0mRcgkHlfPFaIvXttX4FjeTIOmYnh0QtYY4qV1t4R+jqio3?=
 =?us-ascii?Q?s+G4FLQ7W0LzHl18htCtTPC/tlfDXWtZSmwQU71pvdE3kPFD/YQQRfk3YPXX?=
 =?us-ascii?Q?vr28oII34JJtwrKIfgK6D/lHJGqnEm2HZJwi4gYSlcT5QcP9vHloY5q4MMhP?=
 =?us-ascii?Q?cEhYwVpMpX3Bd2qiaNqJC6XNyCXIqhOfdsxd1Z/BmqPYE31u96EGq74qiYtB?=
 =?us-ascii?Q?+SljdllrWpLA91wsqpE4o7f00/3JZkBOyq8wOujn2Z893JA4COmyuPwaEwC3?=
 =?us-ascii?Q?0RkccmdfXqTlOYpxtn9RED0Adx32RuRhsS24zL83wIBnxOBp2WsNsNPFMcS9?=
 =?us-ascii?Q?7bJoc4VXfIfS4/mDG5giN5KcgHAKBimbToDkyYR4/bW2HurYXvRvNkZP/KSl?=
 =?us-ascii?Q?aX3XRehGjYYS6pDua79Msb0IilUDlxMnKJ084YTkhrAoAI3QXNAc1j6nnuTj?=
 =?us-ascii?Q?KcocitGj2Q9LzlhfNJyX3sajov6E47UJgXWMr1CF41Mr5Kthn9LreVyigU89?=
 =?us-ascii?Q?En4LaUG2SycKa4sHTgltgvs3NxyfK+3JWvw1wmxQvrLcnxT9pc3GrHWZEKU6?=
 =?us-ascii?Q?6XFVuPxnW2w9KKdzzdVQegZKZ+DyzQeSllKq2hZJCYFqkI+BzelgPzp93N5n?=
 =?us-ascii?Q?UP6D+dpR45LQeu8/ShT2niKxmdUlzUlIHWsHywRpbldMClY/kNLfMnsyBE4k?=
 =?us-ascii?Q?54IbyHGkXnjSuipSiFIrriVuxg/vHnGITf8Ht3m1Frbwlqvt3Tu+vMWgSpz+?=
 =?us-ascii?Q?eoCIoZeFpGLNiPNWY81Vwwdt22LjDcvtRaSf7iC+vcVbzAAUmCusSa1BWNYw?=
 =?us-ascii?Q?E2WvlxxR1wGaavTKDp85uMo0TSvvM/6YDp6YLMZa6ax0mu3QumlzqPKsPo7z?=
 =?us-ascii?Q?qjFLPJzv6wXixC8Aiq0njuCP8QqYEmy3ZyHiZ/F6BbHN+3HxP2Fd74A2k5DF?=
 =?us-ascii?Q?RF97ke9alzSTZC+z7gNxjTRFq2O3/t46hc5ev92xFiDoMh8kv6tU+51f3c1t?=
 =?us-ascii?Q?IwP2wNpVcENmMacl8PjA39ggsrkV3aronfq9X4oDfYhvg0qcnT+iqr3RzEWk?=
 =?us-ascii?Q?zB3Tg8Qu7vMd8wReLy+S3z75JaB/D+JteSuXiYrXLaiRzgd+8sB2uUt6wTQS?=
 =?us-ascii?Q?988zoSeSR0vUau7HqjBP4AjMPpno9XjLYcukW62i0x4GQRJYcfA/m6ZedtX0?=
 =?us-ascii?Q?CpHSkyL7pUPoWvO9UnaeG1rkDNunrkfhr5PXg+hUwae8kY5kWvunHUeuOLEA?=
 =?us-ascii?Q?Km36W2LmSh6QhmqZXXdM+EhSRHMuERVz40Q7h8WrxhZEH5H0qoXSxttblWqW?=
 =?us-ascii?Q?TXRbkMpb9EyF+yPvINBFMHwhvyqp8VEldmwtZuhBe5wDDGw51TVzKdSJWEkg?=
 =?us-ascii?Q?bKuV+6reSal8HITEWtNLO5y3JRc47PJLFEgRGCjrRvOoi8ulWMcesz0k2Xoy?=
 =?us-ascii?Q?fWweAycmnb9JfEMWMNGzX6pqipiDnbsybKTawIi2AW57y5Nhhy8/jjIzFdCI?=
 =?us-ascii?Q?X3pkCuGh5/tOSxtLdh23tlx20l3zb87dvkdO?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 05:18:56.3725
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a96812e-0a08-40d8-ad14-08ddf4e08909
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8951

The current register definitions are not in sorted order. Sort these
registers according to their address. Put bit fields of the
corresponding registers below the register definitions to clearly
identify which fields belongs to which registers.

Signed-off-by: Ketan Patil <ketanp@nvidia.com>
---
 drivers/memory/tegra/mc.h | 49 +++++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
index a7f20850741f..482f836f7816 100644
--- a/drivers/memory/tegra/mc.h
+++ b/drivers/memory/tegra/mc.h
@@ -13,13 +13,31 @@
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
 #define MC_EMEM_ARB_OUTSTANDING_REQ			0x94
+#define MC_EMEM_ARB_OUTSTANDING_REQ_HOLDOFF_OVERRIDE	BIT(30)
+#define MC_EMEM_ARB_OUTSTANDING_REQ_LIMIT_ENABLE	BIT(31)
+
 #define MC_EMEM_ARB_TIMING_RCD				0x98
 #define MC_EMEM_ARB_TIMING_RP				0x9c
 #define MC_EMEM_ARB_TIMING_RC				0xa0
@@ -41,44 +59,31 @@
 #define MC_EMEM_ARB_OVERRIDE				0xe8
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
 
 #define MC_EMEM_ARB_CFG_CYCLES_PER_UPDATE(x)		((x) & 0x1ff)
 #define MC_EMEM_ARB_CFG_CYCLES_PER_UPDATE_MASK		0x1ff
 
 #define MC_EMEM_ARB_OUTSTANDING_REQ_MAX_MASK		0x1ff
-#define MC_EMEM_ARB_OUTSTANDING_REQ_HOLDOFF_OVERRIDE	BIT(30)
-#define MC_EMEM_ARB_OUTSTANDING_REQ_LIMIT_ENABLE	BIT(31)
 
 #define MC_EMEM_ARB_OVERRIDE_EACK_MASK			0x3
 
-#define MC_TIMING_UPDATE				BIT(0)
-
 #define MC_BROADCAST_CHANNEL				~0
 
 static inline u32 tegra_mc_scale_percents(u64 val, unsigned int percents)
-- 
2.17.1

