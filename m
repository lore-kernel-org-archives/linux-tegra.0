Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010051.outbound.protection.outlook.com [52.101.56.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EB443E9E4;
	Thu, 26 Feb 2026 16:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772123547; cv=fail; b=CALEZ8B0RJrPiCwkMRh3N0YbFcPKrSOrm1A4iRfEgHubjtp00e1VylArcuSDv2FH24wDdkVfXRUlQf+1L1GYMr2ydpS5Euh0La7P5JtG/vANWez8UAcHjQYKnTBN0pqfA0bHox1L1Lr3Pc4FBX5fRhJCWqPqu9fSvdZy8d0dG8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772123547; c=relaxed/simple;
	bh=1TC/T2xm+cbr4LyJuQXwS/x3iMWiU5zynCJzxBWhv5E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aiM7ehAQN7eHXK6VUTUc4T3yekKda4bM7ynIcCp2Mmo44F2Zx5McG+A4YKen9re4PSm1BsRjehQ6qh7oFm/oAzWECga8R9L5/+QKJ1wKJAKg7xAPJHoOYk/uewb7QgT+2JGL0u5CSFdoUVdyUhqqlG/csePaB0q82ERRxUDDDqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LQQGwY8S; arc=fail smtp.client-ip=52.101.56.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LQQGwY8S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tsxpqvHTOSq9Wp5UbWj4zUat1pUt0qlmPwKomCPE/1Q+oJF5fj1fI8C2w5938RI5NUcpqPSJh5DJKjx4sp8SrTwJFmajonyeu/BNNjDyoT8pc9PDf+7t8F+oMYvObyEsL7J6MMpVS9Qo6zXCdcFgpco73rtf7e2ijauXh6VR+UVNi0cVmEPjYx4ugn9oLIPvd1ISh9XBuiOiXHjffEIBJPynm5909PxGQoOu07EGQ3xE0fRbDYQXCwaIwI6qBe79Se7s5CjIjLhPxhjuWTTGHIvosnT1+eyZ2eIDcZwbocWQ2FS/LxDmiFk8iA6bQcBHyWlMnxwJmS/+BbLYWXjSvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RvkmB7SQuBHv00mOnJSRBLDDP9+wauischvcHHlq6xE=;
 b=RYMcoesZ8nI73UP7cSw+j3qTXY75BN0BbuvVIbnmXtbX4K7GqP5N2HlFN5U5VWbvuWM76hyTERixjZjPPUCJSmzRNjhc1D94iH9xlKmbmFh6y7G3L5x/od0lJP2ah4c7UbAdcc2gd3ozCi5dgu5c612fU2Lg5/RsYjc3Fn/6Qvp8+9944ZQGYwh5cMgr5EKJ4swS9P+Pr5WuxTu1baHy0Oht8t1RoPLtBpGZ0m7odBs+046+Bua9kt4eZCfUByyJalMGUGRD0j7SYoi+IgQtESSQl5TI+fSHOeyKlVGYeLPnZMCTXoEW9LdAzZucT8nYpPmbhavpG6CzjXLc11PEkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RvkmB7SQuBHv00mOnJSRBLDDP9+wauischvcHHlq6xE=;
 b=LQQGwY8SbO1SCy4PygYQRFxqU8f0VLUnpOv86+vSiEruWzaTmb21+sYUtkhO3QXuKAOKLUau2SDm9CIIBUwU8tt99irJfanjm2Sh/sQqwljDXDn4+38quiRztcu4xwBkM9Xbs/q23ZWYfrHfvi9CKA5NxIx+EjyHX6KBKGH7BahYfvsgwlVhOjaQSwGN2uDnNb7VYR90Spije18vtQYtoMNEnkT3W7oCFN8Ed8v0vii4sPJ+V4lCAuVT2uoKuf7h8ffczgMg0KEnAQvwlMVNom0fNIwKaDbVJbmjfnwnGiWh/cxGTYIbgrqU/2km8s39T+bTuQghImPB9Ol6srH6TQ==
Received: from BN0PR04CA0006.namprd04.prod.outlook.com (2603:10b6:408:ee::11)
 by CY5PR12MB6300.namprd12.prod.outlook.com (2603:10b6:930:f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Thu, 26 Feb
 2026 16:32:15 +0000
Received: from BN1PEPF0000468E.namprd05.prod.outlook.com
 (2603:10b6:408:ee:cafe::42) by BN0PR04CA0006.outlook.office365.com
 (2603:10b6:408:ee::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 16:32:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF0000468E.mail.protection.outlook.com (10.167.243.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 16:32:15 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 08:31:48 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 08:31:48 -0800
Received: from build-ketanp-bionic-20250813.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Thu, 26 Feb 2026 08:31:48 -0800
From: Ketan Patil <ketanp@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ketan Patil
	<ketanp@nvidia.com>
Subject: [PATCH v7 6/6] memory: tegra: Add MC error logging support for Tegra264
Date: Thu, 26 Feb 2026 16:31:15 +0000
Message-ID: <20260226163115.1152181-7-ketanp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468E:EE_|CY5PR12MB6300:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fee4cd7-1b15-45c8-bc0b-08de755499f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	cwCV5zfVbXBvaI/NPrv64r16adboX078KQQgU3GyyfuJAkyQBApLyxhlPZa7+jdZ8wUxOOJyPa6lqeHsmpTPngGD5Qqeq7eHHLNHGAt4L8MSWLBMEyFbbpns82qIioaDqukm1kQhNqbyIb+Di1za2UvIIrvWkXgXEEP9awI6RaMgVyIJ0/ZlzOmsohL+OMYdmjkaDoGQh2k1BT0pycqXzfv/IMI6c9IE5UWtL75Dfqxr6Zq0rPG/Lcesz6Itt+g7nwGJYNicfxXv8XBAlB7hBLNGTwQjjb6HBYPuTMht1p56fi8IaZqcTY7wOl2KnARw8CrD0QJgLmoFJuXcUc928YPf7I/el82eqW/5syKGwWyJ8qPp6p77B5Nk4a+6mhLQ7e0yPyslobeAo8RuhKGTaiChfQ7lzkhdo5UYhHmLPNKElQcoVzUMTm8TRe3uiz96bH8xL4RpbhiG4ouaBiY2Q+Ybdzr1KZsg90nb2p0f/Ncil9KUk9rDXPF79CWKdQQBUeSqGUddtGkB5RL5RHiACtuZhvCPDQ1d97+6Jkl/6xqDdvkV/QJ3O6X2c04dn0Kos3KtH/4qFYY13EogFTqWvQX4+1WDMRRNQZxxB2x6Lm5VDoSoy2xjFO06tYjtYORhXkuYH26Z52YiwNMr+/O/3vhsWgSlpdVtc+htT0W3FZ2/MPiEDG0JDiLNon8NBu78uONSokw6KRc3Q7Yl5QWDXVHNaDVpIArdhIrFUft9Ove/hBcbePPWzmmPc7YlnpGgyU3DHBT3EChgC49C3UZiWZ0Fwda1nCCh/AsklL+c/0JLjnOYTpSwikE2STMgQOX7leNPVXy9o9FYPhqSfzve5A==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lCcCxGyfnetAm9qFUHeo6S4bqLrn0QOpiWV6zRJCx2P0QKQXgCr9Ja7XGkcXzMd06U8BY4h0iErak2+x0JesW48/K7PKF0M1bAm3QeZcuy43Eb5zmDPvIcBi++GnYfunDRPnYCjTt1HswI8VnyjrsYBaBcyT3pB8+H/P4q9yEiW60/lMR3H1HL24UgO030AUJC0K4wHP2ssFutDYTsmc/osLjpMG1IZWjxsIGbYx/bHQyCLQhidJ2GwgNrfli4w7oCG+yitBX0r0fvjyydyoJnsVgIGBVePMqHPFmQ8pV0KZG38r8/Iddmpgggw2GkiMNff1ly4OdYtJHGtiprYlnqVgS0ftsDuXbM5/BEle82lFjMkDmy9t7sd7yrnLGKkigF6tSp8tZx9he8fW24+cgGwQ5gfc6FQCwM0OW+JldXYXgtX16WdPtUB+ZM32zAOS
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 16:32:15.1982
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fee4cd7-1b15-45c8-bc0b-08de755499f6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6300

In Tegra264, different components from memory subsystems like Memory
Controller Fabric (MCF), HUB, HUB Common (HUBC), Side Band Shim (SBS)
and channels have different interrupt lines for receiving memory
controller error interrupts.

Add support for logging memory controller errors reported by these
memory subsystems on Tegra264 by:
- Renaming tegra_mc_error_names array to tegra20_mc_error_names
  because it has a different bit index for error names compared to
  Tegra264.
- Defining the intmask registers and mask values supported for
  Tegra264.
- Registering interrupt handlers for interrupts associated with these
  different MC components which read the interrupt status registers to
  determine the type of violation that occurred.

Signed-off-by: Ketan Patil <ketanp@nvidia.com>
---
 drivers/memory/tegra/mc.c       |   5 +-
 drivers/memory/tegra/mc.h       |  72 +++++-
 drivers/memory/tegra/tegra20.c  |   6 +-
 drivers/memory/tegra/tegra264.c | 411 +++++++++++++++++++++++++++++++-
 4 files changed, 484 insertions(+), 10 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 5a4316f51291..1f1c38b9123c 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -700,7 +700,7 @@ irqreturn_t tegra30_mc_handle_irq(int irq, void *data)
 
 		type = (value & mc->soc->mc_err_status_type_mask) >>
 		       MC_ERR_STATUS_TYPE_SHIFT;
-		desc = tegra_mc_error_names[type];
+		desc = tegra20_mc_error_names[type];
 
 		switch (value & mc->soc->mc_err_status_type_mask) {
 		case MC_ERR_STATUS_TYPE_INVALID_SMMU_PAGE:
@@ -768,9 +768,10 @@ const char *const tegra_mc_status_names[32] = {
 	[16] = "MTS carveout violation",
 	[17] = "Generalized carveout violation",
 	[20] = "Route Sanity error",
+	[21] = "GIC_MSI error",
 };
 
-const char *const tegra_mc_error_names[8] = {
+const char *const tegra20_mc_error_names[8] = {
 	[2] = "EMEM decode error",
 	[3] = "TrustZone violation",
 	[4] = "Carveout violation",
diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
index b286c2558fd5..649b54369263 100644
--- a/drivers/memory/tegra/mc.h
+++ b/drivers/memory/tegra/mc.h
@@ -25,6 +25,7 @@
 #define MC_INT_DECERR_MTS				BIT(16)
 #define MC_INT_DECERR_GENERALIZED_CARVEOUT		BIT(17)
 #define MC_INT_DECERR_ROUTE_SANITY			BIT(20)
+#define MC_INT_DECERR_ROUTE_SANITY_GIC_MSI		BIT(21)
 
 #define MC_INTMASK					0x04
 #define MC_GART_ERROR_REQ				0x30
@@ -76,13 +77,82 @@
 #define MC_ERR_STATUS_WRITABLE				BIT(26)
 #define MC_ERR_STATUS_READABLE				BIT(27)
 
+#define MC_ERR_STATUS_GSC_ADR_HI_MASK			0xffff
+#define MC_ERR_STATUS_GSC_ADR_HI_SHIFT			16
+#define MC_ERR_STATUS_RT_ADR_HI_SHIFT			15
+
 #define MC_ERR_STATUS_TYPE_SHIFT			28
 #define MC_ERR_STATUS_TYPE_INVALID_SMMU_PAGE		(0x6 << 28)
+#define MC_ERR_STATUS_RT_TYPE_MASK			(0xf << 28)
+#define MC_ERR_STATUS_RT_TYPE_SHIFT			28
 
 #define MC_ERR_STATUS_ADR_HI_SHIFT			20
 
 #define MC_BROADCAST_CHANNEL				~0
 
+/* Tegra264 specific registers */
+
+/* Registers for MSS HUB */
+#define MSS_HUB_GLOBAL_INTSTATUS_0			0x6000
+#define MSS_HUBC_INTR					BIT(0)
+#define MSS_HUB_GLOBAL_MASK				0x7F00
+#define MSS_HUB_GLOBAL_SHIFT				8
+
+#define MSS_HUB_HUBC_INTSTATUS_0			0x6008
+#define MSS_HUB_INTRSTATUS_0				0x600c
+#define MSS_HUB_HUBC_INTMASK_0				0x6010
+#define MSS_HUB_HUBC_SCRUB_DONE_INTMASK			BIT(0)
+
+#define MSS_HUB_HUBC_INTPRIORITY_0			0x6014
+#define MSS_HUB_INTRMASK_0				0x6018
+#define MSS_HUB_COALESCER_ERR_INTMASK			BIT(0)
+#define MSS_HUB_SMMU_BYPASS_ALLOW_ERR_INTMASK		BIT(1)
+#define MSS_HUB_ILLEGAL_TBUGRP_ID_INTMASK		BIT(2)
+#define MSS_HUB_MSI_ERR_INTMASK				BIT(3)
+#define MSS_HUB_POISON_RSP_INTMASK			BIT(4)
+#define MSS_HUB_RESTRICTED_ACCESS_ERR_INTMASK		BIT(5)
+#define MSS_HUB_RESERVED_PA_ERR_INTMASK			BIT(6)
+
+#define MSS_HUB_INTRPRIORITY_0				0x601c
+#define MSS_HUB_SMMU_BYPASS_ALLOW_ERR_STATUS_0		0x6020
+#define MSS_HUB_MSI_ERR_STATUS_0			0x6024
+#define MSS_HUB_POISON_RSP_STATUS_0			0x6028
+#define MSS_HUB_COALESCE_ERR_STATUS_0			0x60e0
+#define MSS_HUB_COALESCE_ERR_ADR_HI_0			0x60e4
+#define MSS_HUB_COALESCE_ERR_ADR_0			0x60e8
+#define MSS_HUB_RESTRICTED_ACCESS_ERR_STATUS_0		0x638c
+#define MSS_HUB_RESERVED_PA_ERR_STATUS_0		0x6390
+#define MSS_HUB_ILLEGAL_TBUGRP_ID_ERR_STATUS_0		0x63b0
+
+/* Registers for channels */
+#define MC_CH_INTSTATUS_0				0x82d4
+#define MC_CH_INTMASK_0					0x82d8
+#define WCAM_ERR_INTMASK				BIT(19)
+
+#define MC_ERR_GENERALIZED_CARVEOUT_STATUS_1_0		0xbc74
+
+/* Registers for MCF */
+#define MCF_COMMON_INTSTATUS0_0_0			0xce04
+#define MCF_INTSTATUS_0					0xce2c
+#define MCF_INTMASK_0					0xce30
+#define MCF_INTPRIORITY_0				0xce34
+
+/* Registers for SBS */
+#define MSS_SBS_INTSTATUS_0				0xec08
+#define MSS_SBS_INTMASK_0				0xec0c
+#define MSS_SBS_FILL_FIFO_ISO_OVERFLOW_INTMASK		BIT(0)
+#define MSS_SBS_FILL_FIFO_SISO_OVERFLOW_INTMASK		BIT(1)
+#define MSS_SBS_FILL_FIFO_NISO_OVERFLOW_INTMASK		BIT(2)
+
+/* Bit field of MC_ERR_ROUTE_SANITY_STATUS_0 register */
+#define MC_ERR_ROUTE_SANITY_RW				BIT(12)
+#define MC_ERR_ROUTE_SANITY_SEC				BIT(13)
+
+#define ERR_GENERALIZED_APERTURE_ID_SHIFT		0
+#define ERR_GENERALIZED_APERTURE_ID_MASK		0x1F
+#define ERR_GENERALIZED_CARVEOUT_APERTURE_ID_SHIFT	5
+#define ERR_GENERALIZED_CARVEOUT_APERTURE_ID_MASK	0x1F
+
 static inline u32 tegra_mc_scale_percents(u64 val, unsigned int percents)
 {
 	val = val * percents;
@@ -193,7 +263,7 @@ extern const struct tegra_mc_ops tegra186_mc_ops;
 irqreturn_t tegra30_mc_handle_irq(int irq, void *data);
 extern const irq_handler_t tegra30_mc_irq_handlers[1];
 extern const char * const tegra_mc_status_names[32];
-extern const char * const tegra_mc_error_names[8];
+extern const char * const tegra20_mc_error_names[8];
 
 /*
  * These IDs are for internal use of Tegra ICC drivers. The ID numbers are
diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra20.c
index ff9e151b5a4c..27dd6886f86e 100644
--- a/drivers/memory/tegra/tegra20.c
+++ b/drivers/memory/tegra/tegra20.c
@@ -713,7 +713,7 @@ static irqreturn_t tegra20_mc_handle_irq(int irq, void *data)
 			value = mc_readl(mc, reg);
 
 			id = value & mc->soc->client_id_mask;
-			desc = tegra_mc_error_names[2];
+			desc = tegra20_mc_error_names[2];
 
 			if (value & BIT(31))
 				direction = "write";
@@ -724,7 +724,7 @@ static irqreturn_t tegra20_mc_handle_irq(int irq, void *data)
 			value = mc_readl(mc, reg);
 
 			id = (value >> 1) & mc->soc->client_id_mask;
-			desc = tegra_mc_error_names[2];
+			desc = tegra20_mc_error_names[2];
 
 			if (value & BIT(0))
 				direction = "write";
@@ -736,7 +736,7 @@ static irqreturn_t tegra20_mc_handle_irq(int irq, void *data)
 
 			id = value & mc->soc->client_id_mask;
 			type = (value & BIT(30)) ? 4 : 3;
-			desc = tegra_mc_error_names[type];
+			desc = tegra20_mc_error_names[type];
 			secure = "secure ";
 
 			if (value & BIT(31))
diff --git a/drivers/memory/tegra/tegra264.c b/drivers/memory/tegra/tegra264.c
index 172a48b56484..e43ef14da1ee 100644
--- a/drivers/memory/tegra/tegra264.c
+++ b/drivers/memory/tegra/tegra264.c
@@ -188,6 +188,41 @@ static const struct tegra_mc_client tegra264_mc_clients[] = {
 	},
 };
 
+static const char *const tegra264_hub_error_names[32] = {
+	[0] = "coalescer error",
+	[1] = "SMMU BYPASS ALLOW error",
+	[2] = "Illegal tbugrp_id error",
+	[3] = "Malformed MSI request error",
+	[4] = "Read response with poison bit error",
+	[5] = "Restricted access violation error",
+	[6] = "Reserved PA error",
+};
+
+static const char *const tegra264_mc_error_names[4] = {
+	[1] = "EMEM decode error",
+	[2] = "TrustZone violation",
+	[3] = "Carveout violation",
+};
+
+static const char *const tegra264_rt_error_names[16] = {
+	[1] = "DECERR_PARTIAL_POPULATED",
+	[2] = "DECERR_SMMU_BYPASS",
+	[3] = "DECERR_INVALID_MMIO",
+	[4] = "DECERR_INVALID_GIC_MSI",
+	[5] = "DECERR_ATOMIC_SYSRAM",
+	[9] = "DECERR_REMOTE_REQ_PRE_BOOT",
+	[10] = "DECERR_ISO_OVER_C2C",
+	[11] = "DECERR_UNSUPPORTED_SBS_OPCODE",
+	[12] = "DECERR_SBS_REQ_OVER_SISO_LL",
+};
+
+/*
+ * MC instance aperture mapping for hubc registers
+ */
+static const int mc_hubc_aperture_number[5] = {
+	7, 8, 9, 10, 11
+};
+
 /*
  * tegra264_mc_icc_set() - Pass MC client info to the BPMP-FW
  * @src: ICC node for Memory Controller's (MC) Client
@@ -283,6 +318,312 @@ static int tegra264_mc_icc_get_init_bw(struct icc_node *node, u32 *avg, u32 *pea
 	return 0;
 }
 
+static void mcf_log_fault(struct tegra_mc *mc, u32 channel, unsigned long mcf_ch_intstatus)
+{
+	unsigned int bit;
+
+	for_each_set_bit(bit, &mcf_ch_intstatus, 32) {
+		const char *client = "unknown", *desc = "NA";
+		u32 status_reg, status1_reg = 0, addr_reg, addr_hi_reg = 0, err_type_mask = 0;
+		u32 value, client_id, i, addr_hi_shift = 0, addr_hi_mask = 0, status1;
+		u32 mc_rw_bit = MC_ERR_STATUS_RW, mc_sec_bit = MC_ERR_STATUS_SECURITY;
+		phys_addr_t addr = 0;
+		u8 type;
+
+		switch (BIT(bit)) {
+		case MC_INT_DECERR_EMEM:
+		case MC_INT_SECURITY_VIOLATION:
+			status_reg = mc->soc->regs->err_status;
+			addr_reg = mc->soc->regs->err_add;
+			addr_hi_reg = mc->soc->regs->err_add_hi;
+			err_type_mask = mc->soc->mc_err_status_type_mask;
+			break;
+
+		case MC_INT_DECERR_VPR:
+			status_reg = mc->soc->regs->err_vpr_status;
+			addr_reg = mc->soc->regs->err_vpr_add;
+			addr_hi_shift = MC_ERR_STATUS_ADR_HI_SHIFT;
+			addr_hi_mask = mc->soc->mc_addr_hi_mask;
+			break;
+
+		case MC_INT_SECERR_SEC:
+			status_reg = mc->soc->regs->err_sec_status;
+			addr_reg = mc->soc->regs->err_sec_add;
+			addr_hi_shift = MC_ERR_STATUS_ADR_HI_SHIFT;
+			addr_hi_mask = mc->soc->mc_addr_hi_mask;
+			break;
+
+		case MC_INT_DECERR_MTS:
+			status_reg = mc->soc->regs->err_mts_status;
+			addr_reg = mc->soc->regs->err_mts_add;
+			addr_hi_shift = MC_ERR_STATUS_ADR_HI_SHIFT;
+			addr_hi_mask = mc->soc->mc_addr_hi_mask;
+			break;
+
+		case MC_INT_DECERR_GENERALIZED_CARVEOUT:
+			status_reg = mc->soc->regs->err_gen_co_status;
+			status1_reg = MC_ERR_GENERALIZED_CARVEOUT_STATUS_1_0;
+			addr_reg = mc->soc->regs->err_gen_co_add;
+			addr_hi_shift = MC_ERR_STATUS_GSC_ADR_HI_SHIFT;
+			addr_hi_mask = MC_ERR_STATUS_GSC_ADR_HI_MASK;
+			break;
+
+		case MC_INT_DECERR_ROUTE_SANITY:
+		case MC_INT_DECERR_ROUTE_SANITY_GIC_MSI:
+			status_reg = mc->soc->regs->err_route_status;
+			addr_reg = mc->soc->regs->err_route_add;
+			addr_hi_shift = MC_ERR_STATUS_RT_ADR_HI_SHIFT;
+			addr_hi_mask = mc->soc->mc_addr_hi_mask;
+			mc_sec_bit = MC_ERR_ROUTE_SANITY_SEC;
+			mc_rw_bit = MC_ERR_ROUTE_SANITY_RW;
+			err_type_mask = MC_ERR_STATUS_RT_TYPE_MASK;
+			break;
+
+		default:
+			dev_err_ratelimited(mc->dev, "Incorrect MC interrupt mask\n");
+			return;
+		}
+
+		value = mc_ch_readl(mc, channel, status_reg);
+		if (addr_hi_reg) {
+			addr = mc_ch_readl(mc, channel, addr_hi_reg);
+		} else {
+			if (!status1_reg) {
+				addr = ((value >> addr_hi_shift) & addr_hi_mask);
+			} else {
+				status1 = mc_ch_readl(mc, channel, status1_reg);
+				addr = ((status1 >> addr_hi_shift) & addr_hi_mask);
+			}
+		}
+
+		addr <<= 32;
+		addr |= mc_ch_readl(mc, channel, addr_reg);
+
+		client_id = value & mc->soc->client_id_mask;
+		for (i = 0; i < mc->soc->num_clients; i++) {
+			if (mc->soc->clients[i].id == client_id) {
+				client = mc->soc->clients[i].name;
+				break;
+			}
+		}
+
+		if (err_type_mask == MC_ERR_STATUS_RT_TYPE_MASK) {
+			type = (value & err_type_mask) >>
+				MC_ERR_STATUS_RT_TYPE_SHIFT;
+			desc = tegra264_rt_error_names[type];
+		} else if (err_type_mask) {
+			type = (value & err_type_mask) >>
+					MC_ERR_STATUS_TYPE_SHIFT;
+			desc = tegra264_mc_error_names[type];
+		}
+
+		dev_err_ratelimited(mc->dev, "%s: %s %s @%pa: %s (%s)\n",
+				    client, value & mc_sec_bit ? "secure" : "non-secure",
+				    value & mc_rw_bit ? "write" : "read", &addr,
+				    tegra_mc_status_names[bit] ?: "unknown", desc);
+		if (status1_reg)
+			dev_err_ratelimited(mc->dev, "gsc_apr_id=%u gsc_co_apr_id=%u\n",
+					    ((status1 >> ERR_GENERALIZED_APERTURE_ID_SHIFT)
+					    & ERR_GENERALIZED_APERTURE_ID_MASK),
+					    ((status1 >> ERR_GENERALIZED_CARVEOUT_APERTURE_ID_SHIFT)
+					    & ERR_GENERALIZED_CARVEOUT_APERTURE_ID_MASK));
+	}
+
+	/* clear interrupts */
+	mc_ch_writel(mc, channel, mcf_ch_intstatus, MCF_INTSTATUS_0);
+}
+
+static irqreturn_t handle_mcf_irq(int irq, void *data)
+{
+	struct tegra_mc *mc = data;
+	unsigned long common_intstat, intstatus;
+	u32 slice;
+
+	/* Read MCF_COMMON_INTSTATUS0_0_0 from MCB block */
+	common_intstat = mc_ch_readl(mc, MC_BROADCAST_CHANNEL, MCF_COMMON_INTSTATUS0_0_0);
+	if (common_intstat == 0) {
+		dev_warn(mc->dev, "No interrupt in MCF\n");
+		return IRQ_NONE;
+	}
+
+	for_each_set_bit(slice, &common_intstat, 32) {
+		/* Find out the slice number on which interrupt occurred */
+		if (slice > 4) {
+			dev_err(mc->dev, "Slice index out of bounds: %u\n", slice);
+			return IRQ_NONE;
+		}
+
+		intstatus = mc_ch_readl(mc, slice, MCF_INTSTATUS_0);
+		if (intstatus != 0)
+			mcf_log_fault(mc, slice, intstatus);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static void hub_log_fault(struct tegra_mc *mc, u32 hub, unsigned long hub_intstat)
+{
+	unsigned int bit;
+
+	for_each_set_bit(bit, &hub_intstat, 32) {
+		const char *client = "unknown";
+		u32 client_id, status_reg, value, i;
+		phys_addr_t addr = 0;
+
+		switch (BIT(bit)) {
+		case MSS_HUB_COALESCER_ERR_INTMASK:
+			status_reg = MSS_HUB_COALESCE_ERR_STATUS_0;
+			addr = mc_ch_readl(mc, hub, MSS_HUB_COALESCE_ERR_ADR_HI_0);
+			addr <<= 32;
+			addr |= mc_ch_readl(mc, hub, MSS_HUB_COALESCE_ERR_ADR_0);
+			break;
+
+		case MSS_HUB_SMMU_BYPASS_ALLOW_ERR_INTMASK:
+			status_reg = MSS_HUB_SMMU_BYPASS_ALLOW_ERR_STATUS_0;
+			break;
+
+		case MSS_HUB_ILLEGAL_TBUGRP_ID_INTMASK:
+			status_reg = MSS_HUB_ILLEGAL_TBUGRP_ID_ERR_STATUS_0;
+			break;
+
+		case MSS_HUB_MSI_ERR_INTMASK:
+			status_reg = MSS_HUB_MSI_ERR_STATUS_0;
+			break;
+
+		case MSS_HUB_POISON_RSP_INTMASK:
+			status_reg = MSS_HUB_POISON_RSP_STATUS_0;
+			break;
+
+		case MSS_HUB_RESTRICTED_ACCESS_ERR_INTMASK:
+			status_reg = MSS_HUB_RESTRICTED_ACCESS_ERR_STATUS_0;
+			break;
+
+		case MSS_HUB_RESERVED_PA_ERR_INTMASK:
+			status_reg = MSS_HUB_RESERVED_PA_ERR_STATUS_0;
+			break;
+
+		default:
+			dev_err_ratelimited(mc->dev, "Incorrect HUB interrupt mask\n");
+			return;
+		}
+
+		value = mc_ch_readl(mc, hub, status_reg);
+
+		client_id = value & mc->soc->client_id_mask;
+		for (i = 0; i < mc->soc->num_clients; i++) {
+			if (mc->soc->clients[i].id == client_id) {
+				client = mc->soc->clients[i].name;
+				break;
+			}
+		}
+
+		dev_err_ratelimited(mc->dev, "%s: @%pa: %s status: 0x%x\n",
+				    client, &addr, tegra264_hub_error_names[bit] ?: "unknown",
+				    value);
+	}
+
+	/* clear interrupts */
+	mc_ch_writel(mc, hub, hub_intstat, MSS_HUB_INTRSTATUS_0);
+}
+
+static irqreturn_t handle_hub_irq(int irq, void *data, int mc_hubc_aperture_number)
+{
+	struct tegra_mc *mc = data;
+	u32 global_intstat;
+	unsigned long hub_interrupt, intstat, hub;
+
+	/* Read MSS_HUB_GLOBAL_INTSTATUS_0 from mc_hubc_aperture_number block */
+	global_intstat = mc_ch_readl(mc, mc_hubc_aperture_number, MSS_HUB_GLOBAL_INTSTATUS_0);
+	if (global_intstat == 0) {
+		dev_warn(mc->dev, "No interrupt in HUB/HUBC\n");
+		return IRQ_NONE;
+	}
+
+	/* Handle interrupt from hubc */
+	if (global_intstat & MSS_HUBC_INTR) {
+		/* Read MSS_HUB_HUBC_INTSTATUS_0 from block mc_hubc_aperture_number */
+		intstat = mc_ch_readl(mc, mc_hubc_aperture_number, MSS_HUB_HUBC_INTSTATUS_0);
+		if (intstat != 0) {
+			dev_err_ratelimited(mc->dev, "Scrubber operation status: 0x%lx\n",
+					    intstat);
+			/* Clear hubc interrupt */
+			mc_ch_writel(mc, mc_hubc_aperture_number, intstat,
+				     MSS_HUB_HUBC_INTSTATUS_0);
+		}
+	}
+
+	hub_interrupt = (global_intstat & MSS_HUB_GLOBAL_MASK) >> MSS_HUB_GLOBAL_SHIFT;
+	/* Handle interrupt from hub */
+	for_each_set_bit(hub, &hub_interrupt, 32) {
+		/* Read MSS_HUB_INTRSTATUS_0 from block MCi */
+		intstat = mc_ch_readl(mc, hub, MSS_HUB_INTRSTATUS_0);
+		if (intstat != 0)
+			hub_log_fault(mc, hub, intstat);
+	}
+
+	/* Clear global interrupt status register */
+	mc_ch_writel(mc, mc_hubc_aperture_number, global_intstat, MSS_HUB_GLOBAL_INTSTATUS_0);
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t handle_disp_hub_irq(int irq, void *data)
+{
+	return handle_hub_irq(irq, data, mc_hubc_aperture_number[0]);
+}
+
+static irqreturn_t handle_system_hub_irq(int irq, void *data)
+{
+	return handle_hub_irq(irq, data, mc_hubc_aperture_number[1]);
+}
+
+static irqreturn_t handle_vision_hub_irq(int irq, void *data)
+{
+	return handle_hub_irq(irq, data, mc_hubc_aperture_number[2]);
+}
+
+static irqreturn_t handle_uphy_hub_irq(int irq, void *data)
+{
+	return handle_hub_irq(irq, data, mc_hubc_aperture_number[3]);
+}
+
+static irqreturn_t handle_top_hub_irq(int irq, void *data)
+{
+	return handle_hub_irq(irq, data, mc_hubc_aperture_number[4]);
+}
+
+static irqreturn_t handle_generic_irq(struct tegra_mc *mc, unsigned long intstat_reg)
+{
+	u32 intstat, i;
+
+	/* Iterate over all MC blocks to read INTSTATUS */
+	for (i = 0; i < mc->num_channels; i++) {
+		intstat = mc_ch_readl(mc, i, intstat_reg);
+		if (intstat) {
+			dev_err_ratelimited(mc->dev, "channel: %i status: 0x%x\n", i, intstat);
+			/* Clear interrupt */
+			mc_ch_writel(mc, i, intstat, intstat_reg);
+		}
+	}
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t handle_sbs_irq(int irq, void *data)
+{
+	return handle_generic_irq((struct tegra_mc *)data, MSS_SBS_INTSTATUS_0);
+}
+
+static irqreturn_t handle_channel_irq(int irq, void *data)
+{
+	return handle_generic_irq((struct tegra_mc *)data, MC_CH_INTSTATUS_0);
+}
+
+static const irq_handler_t tegra264_mc_irq_handlers[8] = {
+	handle_mcf_irq, handle_disp_hub_irq, handle_vision_hub_irq,
+	handle_system_hub_irq, handle_uphy_hub_irq, handle_top_hub_irq,
+	handle_sbs_irq, handle_channel_irq
+};
+
 static const struct tegra_mc_icc_ops tegra264_mc_icc_ops = {
 	.xlate = tegra_mc_icc_xlate,
 	.aggregate = tegra264_mc_icc_aggregate,
@@ -290,13 +631,70 @@ static const struct tegra_mc_icc_ops tegra264_mc_icc_ops = {
 	.set = tegra264_mc_icc_set,
 };
 
+static const struct tegra_mc_regs tegra264_mc_regs = {
+	.cfg_channel_enable = 0x8870,
+	.err_status = 0xbc00,
+	.err_add = 0xbc04,
+	.err_add_hi = 0xbc08,
+	.err_vpr_status = 0xbc20,
+	.err_vpr_add = 0xbc24,
+	.err_sec_status = 0xbc3c,
+	.err_sec_add = 0xbc40,
+	.err_mts_status = 0xbc5c,
+	.err_mts_add = 0xbc60,
+	.err_gen_co_status = 0xbc78,
+	.err_gen_co_add = 0xbc7c,
+	.err_route_status = 0xbc64,
+	.err_route_add = 0xbc68,
+};
+
 static const struct tegra_mc_intmask tegra264_mc_intmasks[] = {
 	{
-		.reg = MC_INTMASK,
-		.mask = MC_INT_DECERR_ROUTE_SANITY | MC_INT_DECERR_GENERALIZED_CARVEOUT |
-			MC_INT_DECERR_MTS  | MC_INT_SECERR_SEC | MC_INT_DECERR_VPR |
-			MC_INT_SECURITY_VIOLATION | MC_INT_DECERR_EMEM,
+		.reg = MCF_INTMASK_0,
+		.mask = MC_INT_DECERR_ROUTE_SANITY_GIC_MSI | MC_INT_DECERR_ROUTE_SANITY |
+			MC_INT_DECERR_GENERALIZED_CARVEOUT | MC_INT_DECERR_MTS |
+			MC_INT_SECERR_SEC | MC_INT_DECERR_VPR | MC_INT_SECURITY_VIOLATION |
+			MC_INT_DECERR_EMEM,
 	},
+	{
+		.reg = MCF_INTPRIORITY_0,
+		.mask = MC_INT_DECERR_ROUTE_SANITY_GIC_MSI | MC_INT_DECERR_ROUTE_SANITY |
+			MC_INT_DECERR_GENERALIZED_CARVEOUT | MC_INT_DECERR_MTS |
+			MC_INT_SECERR_SEC | MC_INT_DECERR_VPR | MC_INT_SECURITY_VIOLATION |
+			MC_INT_DECERR_EMEM,
+	},
+	{
+		.reg = MSS_HUB_INTRMASK_0,
+		.mask = MSS_HUB_COALESCER_ERR_INTMASK | MSS_HUB_SMMU_BYPASS_ALLOW_ERR_INTMASK |
+			MSS_HUB_ILLEGAL_TBUGRP_ID_INTMASK | MSS_HUB_MSI_ERR_INTMASK |
+			MSS_HUB_POISON_RSP_INTMASK | MSS_HUB_RESTRICTED_ACCESS_ERR_INTMASK |
+			MSS_HUB_RESERVED_PA_ERR_INTMASK,
+	},
+	{
+		.reg = MSS_HUB_INTRPRIORITY_0,
+		.mask = MSS_HUB_COALESCER_ERR_INTMASK | MSS_HUB_SMMU_BYPASS_ALLOW_ERR_INTMASK |
+			MSS_HUB_ILLEGAL_TBUGRP_ID_INTMASK | MSS_HUB_MSI_ERR_INTMASK |
+			MSS_HUB_POISON_RSP_INTMASK | MSS_HUB_RESTRICTED_ACCESS_ERR_INTMASK |
+			MSS_HUB_RESERVED_PA_ERR_INTMASK,
+	},
+	{
+		.reg = MSS_HUB_HUBC_INTMASK_0,
+		.mask = MSS_HUB_HUBC_SCRUB_DONE_INTMASK,
+	},
+	{
+		.reg = MSS_HUB_HUBC_INTPRIORITY_0,
+		.mask = MSS_HUB_HUBC_SCRUB_DONE_INTMASK,
+	},
+	{
+		.reg = MSS_SBS_INTMASK_0,
+		.mask = MSS_SBS_FILL_FIFO_ISO_OVERFLOW_INTMASK |
+			MSS_SBS_FILL_FIFO_SISO_OVERFLOW_INTMASK |
+			MSS_SBS_FILL_FIFO_NISO_OVERFLOW_INTMASK,
+	},
+	{
+		.reg = MC_CH_INTMASK_0,
+		.mask = WCAM_ERR_INTMASK,
+	}
 };
 
 const struct tegra_mc_soc tegra264_mc_soc = {
@@ -317,4 +715,9 @@ const struct tegra_mc_soc tegra264_mc_soc = {
 	 * supported.
 	 */
 	.num_carveouts = 32,
+	.mc_addr_hi_mask = 0xff,
+	.mc_err_status_type_mask = (0x3 << 28),
+	.regs = &tegra264_mc_regs,
+	.handle_irq = tegra264_mc_irq_handlers,
+	.num_interrupts = ARRAY_SIZE(tegra264_mc_irq_handlers),
 };
-- 
2.17.1

