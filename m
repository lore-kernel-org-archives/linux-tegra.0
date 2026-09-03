Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010054.outbound.protection.outlook.com [52.101.61.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AEF37E5EE;
	Thu,  3 Sep 2026 18:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788460003; cv=fail; b=mtZ+ZcAp60gDavxxpRY2t4F/8Mbz/Uq+h5OBYQRsos6vwQUEhHmSYjLdLEnsloo0Za1pLjGpZuqCoT/yR3EzitosP/lNzwgF7jv0MUKou6nPnlw4iu2F2uVwrEabJ43zfE5+QR05giF8jsc4v+Q4RM8gVTXYrv3KrMiSCq3m9Tg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788460003; c=relaxed/simple;
	bh=3tB+8k98zv/TyZHbXEvAmBU7E8Og9/r08Ns/f6y72Mg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SlYukdrSlhPV/h5fZNVyULgxCm41wdb0sNWa6iNj2JKFr8+m8G3R8JvBWUNNhpJRG/g9ciiKWRXzPIifL1yGgqjtSYt07q9haEh8zCRUXfQoXGP0cySNVnow3ZmdmbzWiXYpl1OR9qd97rzbx3rZ6L3YcvKBdr65zhr+J6RSWcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=n05y6ghD; arc=fail smtp.client-ip=52.101.61.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="n05y6ghD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W1MoyYYfJmwmKvsfxHoUnwCwvrdJyBW+F/9cn6yhTNn9QWv65rbNkmoL8TjCBK+6QTd18mV6GSAnJB0ZdQi/1x8fMco+iX2xQ2Jyj7jG9KY+gjFKO3YkcUAD57iyUGdKCe8sbWxHHL+a7LVnp1LCA4E0bwcp4E4FZRTbFDqgBAwPi3riyHie3PxjLCPBFc7PYN5tgeGxvq5k4QOzIqE8UBIAybPgJfyrjOsBYJy/IQemwEfe16TopetTekYmZStAIjYcSkYIEK3HViP8r+ZhNU0m8pRKbeQI786bXXwQBD6UrFkNYrQrz6CPwoNA4lu7bsrJUrtrtQwJWuU+qmxvYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=356GEk+De4phEr3CgD0mAJphgN4dHzASBLJGhNv2SLc=;
 b=KGDU+hp/hzyh9/Mwrcf43vLffwz7hwb0MMzz3Mrl4KM2oSey6lCxnqo7SmCiB+r3JciebAz7aMxjohKT6DDLvT1FWWGhTvCXXr4VGWWAdj9G7Eu0m49jMy1MpDyl3Dc1CzFrRfEcS0AYsUVmFAsmmhVxPe6JuZRT5HfpSaigvvYTORGcDQaL3wB3EgZ7fxOlx6sb4L8U1Nm+h8HLmzBDiFv3SgmbCPyUqDyKUvIbDbYppDC3jUvAoJ9/UzPzioNAgs/wiZ8yQ5iMqkGx4nE4KlbXM2QAzDAct8JLseD7L+sDJU9he+bZ6BxKrQ30dZnBzWKr2XlqYhhwv5xa+VSZUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=356GEk+De4phEr3CgD0mAJphgN4dHzASBLJGhNv2SLc=;
 b=n05y6ghDHt8QCzJKeCBK4uX2ezVsPOvc339Al2Eu9eDBlTPhtjFBS8a59Z1G69DGT0vvvPLFQ2+5isBzsuCown7mEdOxLZDDupQlZClA23rrNpPfeyH+d88FcZ7j7b4JWkgsBw2QaDCv3/NPAosT5vI+Cibx0R4AMlVtt3DmDv67iVYUF6DQE7P13wA3wRkqNWhr+/0jorG47a6zKSx0UtYX52o5O7LjziKW9CLFkFS9b+t7I4EVOMVDe5ES7WiQdhrQePXZ/a73gvp54Vt7BBlXJJhw3/0oN76by+yyORyIHeFiupfpSoPUUEiML4YTrFA8meDsh+VA9fJh8pM8UA==
Received: from PH7P220CA0151.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::11)
 by CH3PR12MB9313.namprd12.prod.outlook.com (2603:10b6:610:1ca::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 18:26:25 +0000
Received: from SA2PEPF00003AEA.namprd02.prod.outlook.com
 (2603:10b6:510:33b:cafe::2f) by PH7P220CA0151.outlook.office365.com
 (2603:10b6:510:33b::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Thu, 3
 Sep 2026 18:26:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00003AEA.mail.protection.outlook.com (10.167.248.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 18:26:25 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 3 Sep
 2026 11:25:58 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 3 Sep
 2026 11:25:57 -0700
Received: from build-ketanp-noble-20260630.internal (10.127.8.10) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.46 via
 Frontend Transport; Thu, 3 Sep 2026 11:25:57 -0700
From: Ketan Patil <ketanp@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ketan Patil
	<ketanp@nvidia.com>
Subject: [PATCH 3/3] memory: tegra: Refactor Tegra264 mc-err code
Date: Thu, 3 Sep 2026 18:25:20 +0000
Message-ID: <20260903182520.950555-4-ketanp@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903182520.950555-1-ketanp@nvidia.com>
References: <20260903182520.950555-1-ketanp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEA:EE_|CH3PR12MB9313:EE_
X-MS-Office365-Filtering-Correlation-Id: a950f8d7-47e1-4664-a406-08df09e8dd19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|56012099006|3023799007|22082099003|18002099003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	Nx1FrZUySdqmkOmrShxvtg0UcQHcyoETfV2TFH11PFyAmKorfTaaLSXpTDX3JpbtjVOXm0uOBsGznVC+UKqzHSZHfks9aqA7SEzOqtGxt1ItMJvCkaVVchhcYhBX9sCW15cKh/poZHwkzmbTI7mqeKBwknZBUGbDKrjJnjhLuRMshkVKl34MCzO6dsZb5TPX5LIQk4ESbuH6BVV02R0InQcRvqMVi039t+ICQaVh8Ekmx+Wn00cbSp//0jTqbvtXiO6rzkl+BzBl/2zRxYSvlUCCSL2FcPuxW2SNkFELQh514XoVyserTkg0XzSbz1rg3N2dFl1J3p3ievyCpHZPfK183gwIat14cUwJpzG5mkZm4Z/GVuARZ3Z1xHKELaIHdPviPEK32KjfV/c2XcYURBQ5kq7YG7grhH2giAQc3v43xq8EEmFTAnluZjNeFX/i5UNrwyqGPIQXA6jmvbxosVXzSDS19hgMKw0avQQNqf6yj3UkKHcCaWrvM/hfrxbMy9sdjGNt7tZz2a9QiEvGQd5+4FuRjFmArQfq+rsdIbsJVFGRLKYmuzCmRi6+Wbm9MgcxZsRcmxU/kUZO4xJ4Yf3+1JUOl2duS68bxqmHvG9JivCwsS8B8hy4OX7fsgciJk3uzhJYvzdiylntw7o9/9PaGqxgKdRW7KZR6HKoGHJUAFTA/F1WiZO68sFrmnS5mA4+eZxAxiztruaDYjLGWg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(56012099006)(3023799007)(22082099003)(18002099003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aXA/AKKL8RGut7VdJhaolNF1aQkwxte3edVmBx45n85qfcAD9KGRucKZ2yItKkHVdAlapZEGk6FyHGAZIif+J/+2ehWsxt3v0XgB1ZQJGcR9l+Rqx6DoRcwIh35bBKYH7l7ZzvsaLVP3AOkr9TSYQD6aAFu7WR3OVCM2ESkzv/iklmE4+dkrzpm/p6Lc01UdikwjG7ePXEuXcxSeTdw9g2nAV9oXsYtiqruC1nByyzQE8KBM9kecTwUE/UjERjhL5nnlxcwKvyl89pJxjbhDbWuhqCzDicq+Kq4vQwVGfu9tAMFes2pu3fXlYFPNIFJEGwses+x1B4/OxCEqsRIelKnvruxgWxDOsMLxjXEOd7CEj/TXR6VZ2N/UwVb4Tk3ZDjGDoS2Rmp4Uwa3SYfKKqPk2K1kcDbLsqlLjkOPANoCmznDm7xFpXb8sUahos8E8
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 18:26:25.5001
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a950f8d7-47e1-4664-a406-08df09e8dd19
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AEA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9313

The MC and HUB error-logging paths on Tegra264 used large switch
statements that interleaved register offsets, bit positions and
decoding parameters for each error type, which made them hard to read
and review.

Turn the error logging into a more structured implementation:

  - Describe each MCF error type with a tegra264_mc_fault descriptor
    filled in by a small per-type get_offsets() callback, and move the
    register access, client lookup and reporting into a common
    tegra264_mc_report_fault() helper.

  - Describe each HUB error type with a static
    tegra264_hub_error_handler table, since the HUB register offsets
    are fixed on Tegra264.

No functional change intended.

Signed-off-by: Ketan Patil <ketanp@nvidia.com>
---
 drivers/memory/tegra/tegra264.c | 349 ++++++++++++++++++++------------
 1 file changed, 220 insertions(+), 129 deletions(-)

diff --git a/drivers/memory/tegra/tegra264.c b/drivers/memory/tegra/tegra264.c
index b40275ae382e..57e6395861ba 100644
--- a/drivers/memory/tegra/tegra264.c
+++ b/drivers/memory/tegra/tegra264.c
@@ -15,6 +15,47 @@
 #include "mc.h"
 #include "tegra264-bwmgr.h"
 
+/*
+ * Description of a single MCF error type: where to read the status and the
+ * faulting address, how to extract the high address bits, which bits encode
+ * the access direction and security state and the optional error-type sub-code.
+ */
+struct tegra264_mc_fault {
+	const char *const *type_names;
+	u32 addr_hi_mask;
+	u32 addr_hi_reg;
+	u32 addr_hi_shift;
+	u32 addr_reg;
+	u32 rw_bit;
+	u32 sec_bit;
+	u32 status1_reg;
+	u32 status_reg;
+	u32 type_mask;
+	u32 type_shift;
+};
+
+/*
+ * Maps an MCF interrupt to a callback that fills in the register offsets and
+ * decoding parameters for that error type. The register offsets live in the
+ * per-SoC tegra_mc_regs, so they are collected at runtime rather than being
+ * stored in a static table.
+ */
+struct tegra264_mc_error_handler {
+	u32 mask;
+	void (*get_offsets)(struct tegra_mc *mc, struct tegra264_mc_fault *fault);
+};
+
+/*
+ * Description of a single HUB error type. addr_reg is zero for error types
+ * that don't latch a fault address.
+ */
+struct tegra264_hub_error_handler {
+	u32 addr_hi_reg;
+	u32 addr_reg;
+	u32 mask;
+	u32 status_reg;
+};
+
 /*
  * MC Client entries are sorted in the increasing order of the
  * override and security register offsets.
@@ -814,115 +855,149 @@ static int tegra264_mc_icc_get_init_bw(struct icc_node *node, u32 *avg, u32 *pea
 	return 0;
 }
 
-static void mcf_log_fault(struct tegra_mc *mc, u32 channel, unsigned long mcf_ch_intstatus)
+static void tegra264_mc_fault_emem(struct tegra_mc *mc, struct tegra264_mc_fault *fault)
 {
-	unsigned int bit;
+	fault->status_reg = mc->soc->regs->err_status;
+	fault->addr_reg = mc->soc->regs->err_add;
+	fault->addr_hi_reg = mc->soc->regs->err_add_hi;
+	fault->type_mask = mc->soc->mc_err_status_type_mask;
+	fault->type_shift = MC_ERR_STATUS_TYPE_SHIFT;
+	fault->type_names = tegra264_mc_error_names;
+}
 
-	for_each_set_bit(bit, &mcf_ch_intstatus, 32) {
-		const char *client = "unknown", *desc = "NA";
-		u32 status_reg, status1_reg = 0, addr_reg, addr_hi_reg = 0, err_type_mask = 0;
-		u32 value, client_id, i, addr_hi_shift = 0, addr_hi_mask = 0, status1;
-		u32 mc_rw_bit = MC_ERR_STATUS_RW, mc_sec_bit = MC_ERR_STATUS_SECURITY;
-		phys_addr_t addr = 0;
-		u8 type;
-
-		switch (BIT(bit)) {
-		case MC_INT_DECERR_EMEM:
-		case MC_INT_SECURITY_VIOLATION:
-			status_reg = mc->soc->regs->err_status;
-			addr_reg = mc->soc->regs->err_add;
-			addr_hi_reg = mc->soc->regs->err_add_hi;
-			err_type_mask = mc->soc->mc_err_status_type_mask;
-			break;
+static void tegra264_mc_fault_vpr(struct tegra_mc *mc, struct tegra264_mc_fault *fault)
+{
+	fault->status_reg = mc->soc->regs->err_vpr_status;
+	fault->addr_reg = mc->soc->regs->err_vpr_add;
+	fault->addr_hi_shift = MC_ERR_STATUS_ADR_HI_SHIFT;
+	fault->addr_hi_mask = mc->soc->mc_addr_hi_mask;
+}
 
-		case MC_INT_DECERR_VPR:
-			status_reg = mc->soc->regs->err_vpr_status;
-			addr_reg = mc->soc->regs->err_vpr_add;
-			addr_hi_shift = MC_ERR_STATUS_ADR_HI_SHIFT;
-			addr_hi_mask = mc->soc->mc_addr_hi_mask;
-			break;
+static void tegra264_mc_fault_sec(struct tegra_mc *mc, struct tegra264_mc_fault *fault)
+{
+	fault->status_reg = mc->soc->regs->err_sec_status;
+	fault->addr_reg = mc->soc->regs->err_sec_add;
+	fault->addr_hi_shift = MC_ERR_STATUS_ADR_HI_SHIFT;
+	fault->addr_hi_mask = mc->soc->mc_addr_hi_mask;
+}
 
-		case MC_INT_SECERR_SEC:
-			status_reg = mc->soc->regs->err_sec_status;
-			addr_reg = mc->soc->regs->err_sec_add;
-			addr_hi_shift = MC_ERR_STATUS_ADR_HI_SHIFT;
-			addr_hi_mask = mc->soc->mc_addr_hi_mask;
-			break;
+static void tegra264_mc_fault_mts(struct tegra_mc *mc, struct tegra264_mc_fault *fault)
+{
+	fault->status_reg = mc->soc->regs->err_mts_status;
+	fault->addr_reg = mc->soc->regs->err_mts_add;
+	fault->addr_hi_shift = MC_ERR_STATUS_ADR_HI_SHIFT;
+	fault->addr_hi_mask = mc->soc->mc_addr_hi_mask;
+}
 
-		case MC_INT_DECERR_MTS:
-			status_reg = mc->soc->regs->err_mts_status;
-			addr_reg = mc->soc->regs->err_mts_add;
-			addr_hi_shift = MC_ERR_STATUS_ADR_HI_SHIFT;
-			addr_hi_mask = mc->soc->mc_addr_hi_mask;
-			break;
+static void tegra264_mc_fault_gsc(struct tegra_mc *mc, struct tegra264_mc_fault *fault)
+{
+	fault->status_reg = mc->soc->regs->err_gen_co_status;
+	fault->status1_reg = MC_ERR_GENERALIZED_CARVEOUT_STATUS_1_0;
+	fault->addr_reg = mc->soc->regs->err_gen_co_add;
+	fault->addr_hi_shift = MC_ERR_STATUS_GSC_ADR_HI_SHIFT;
+	fault->addr_hi_mask = MC_ERR_STATUS_GSC_ADR_HI_MASK;
+}
 
-		case MC_INT_DECERR_GENERALIZED_CARVEOUT:
-			status_reg = mc->soc->regs->err_gen_co_status;
-			status1_reg = MC_ERR_GENERALIZED_CARVEOUT_STATUS_1_0;
-			addr_reg = mc->soc->regs->err_gen_co_add;
-			addr_hi_shift = MC_ERR_STATUS_GSC_ADR_HI_SHIFT;
-			addr_hi_mask = MC_ERR_STATUS_GSC_ADR_HI_MASK;
-			break;
+static void tegra264_mc_fault_route(struct tegra_mc *mc, struct tegra264_mc_fault *fault)
+{
+	fault->status_reg = mc->soc->regs->err_route_status;
+	fault->addr_reg = mc->soc->regs->err_route_add;
+	fault->addr_hi_shift = MC_ERR_STATUS_RT_ADR_HI_SHIFT;
+	fault->addr_hi_mask = mc->soc->mc_addr_hi_mask;
+	fault->rw_bit = MC_ERR_ROUTE_SANITY_RW;
+	fault->sec_bit = MC_ERR_ROUTE_SANITY_SEC;
+	fault->type_mask = MC_ERR_STATUS_RT_TYPE_MASK;
+	fault->type_shift = MC_ERR_STATUS_RT_TYPE_SHIFT;
+	fault->type_names = tegra264_rt_error_names;
+}
 
-		case MC_INT_DECERR_ROUTE_SANITY:
-		case MC_INT_DECERR_ROUTE_SANITY_GIC_MSI:
-			status_reg = mc->soc->regs->err_route_status;
-			addr_reg = mc->soc->regs->err_route_add;
-			addr_hi_shift = MC_ERR_STATUS_RT_ADR_HI_SHIFT;
-			addr_hi_mask = mc->soc->mc_addr_hi_mask;
-			mc_sec_bit = MC_ERR_ROUTE_SANITY_SEC;
-			mc_rw_bit = MC_ERR_ROUTE_SANITY_RW;
-			err_type_mask = MC_ERR_STATUS_RT_TYPE_MASK;
-			break;
+static const struct tegra264_mc_error_handler tegra264_mc_error_handlers[] = {
+	{ MC_INT_DECERR_EMEM,			tegra264_mc_fault_emem },
+	{ MC_INT_SECURITY_VIOLATION,		tegra264_mc_fault_emem },
+	{ MC_INT_DECERR_VPR,			tegra264_mc_fault_vpr },
+	{ MC_INT_SECERR_SEC,			tegra264_mc_fault_sec },
+	{ MC_INT_DECERR_MTS,			tegra264_mc_fault_mts },
+	{ MC_INT_DECERR_GENERALIZED_CARVEOUT,	tegra264_mc_fault_gsc },
+	{ MC_INT_DECERR_ROUTE_SANITY,		tegra264_mc_fault_route },
+	{ MC_INT_DECERR_ROUTE_SANITY_GIC_MSI,	tegra264_mc_fault_route },
+};
 
-		default:
-			dev_err_ratelimited(mc->dev, "Incorrect MC interrupt mask\n");
-			return;
-		}
+static void tegra264_mc_report_fault(struct tegra_mc *mc, u32 channel,
+				     unsigned int interrupt,
+				     const struct tegra264_mc_fault *fault)
+{
+	const char *client = "unknown", *desc = "NA";
+	u32 value, client_id, status1 = 0;
+	phys_addr_t addr = 0;
+	unsigned int i;
+	u8 type;
+
+	value = mc_ch_readl(mc, channel, fault->status_reg);
+
+	if (fault->addr_hi_reg) {
+		addr = mc_ch_readl(mc, channel, fault->addr_hi_reg);
+	} else if (fault->status1_reg) {
+		status1 = mc_ch_readl(mc, channel, fault->status1_reg);
+		addr = (status1 >> fault->addr_hi_shift) & fault->addr_hi_mask;
+	} else {
+		addr = (value >> fault->addr_hi_shift) & fault->addr_hi_mask;
+	}
 
-		value = mc_ch_readl(mc, channel, status_reg);
-		if (addr_hi_reg) {
-			addr = mc_ch_readl(mc, channel, addr_hi_reg);
-		} else {
-			if (!status1_reg) {
-				addr = ((value >> addr_hi_shift) & addr_hi_mask);
-			} else {
-				status1 = mc_ch_readl(mc, channel, status1_reg);
-				addr = ((status1 >> addr_hi_shift) & addr_hi_mask);
-			}
+	addr <<= 32;
+	addr |= mc_ch_readl(mc, channel, fault->addr_reg);
+
+	client_id = value & mc->soc->client_id_mask;
+	for (i = 0; i < mc->soc->num_clients; i++) {
+		if (mc->soc->clients[i].id == client_id) {
+			client = mc->soc->clients[i].name;
+			break;
 		}
+	}
 
-		addr <<= 32;
-		addr |= mc_ch_readl(mc, channel, addr_reg);
+	if (fault->type_names) {
+		type = (value & fault->type_mask) >> fault->type_shift;
+		desc = fault->type_names[type];
+	}
 
-		client_id = value & mc->soc->client_id_mask;
-		for (i = 0; i < mc->soc->num_clients; i++) {
-			if (mc->soc->clients[i].id == client_id) {
-				client = mc->soc->clients[i].name;
+	dev_err_ratelimited(mc->dev, "%s: %s %s @%pa: %s (%s)\n",
+			    client, value & fault->sec_bit ? "secure" : "non-secure",
+			    value & fault->rw_bit ? "write" : "read", &addr,
+			    tegra_mc_status_names[interrupt] ?: "unknown", desc);
+
+	if (fault->status1_reg)
+		dev_err_ratelimited(mc->dev, "gsc_apr_id=%u gsc_co_apr_id=%u\n",
+				    (status1 >> ERR_GENERALIZED_APERTURE_ID_SHIFT) &
+				    ERR_GENERALIZED_APERTURE_ID_MASK,
+				    (status1 >> ERR_GENERALIZED_CARVEOUT_APERTURE_ID_SHIFT) &
+				    ERR_GENERALIZED_CARVEOUT_APERTURE_ID_MASK);
+}
+
+static void mcf_log_fault(struct tegra_mc *mc, u32 channel, unsigned long mcf_ch_intstatus)
+{
+	unsigned int interrupt;
+
+	for_each_set_bit(interrupt, &mcf_ch_intstatus, 32) {
+		const struct tegra264_mc_error_handler *handler = NULL;
+		struct tegra264_mc_fault fault = {
+			.rw_bit = MC_ERR_STATUS_RW,
+			.sec_bit = MC_ERR_STATUS_SECURITY,
+		};
+		unsigned int i;
+
+		for (i = 0; i < ARRAY_SIZE(tegra264_mc_error_handlers); i++) {
+			if (tegra264_mc_error_handlers[i].mask == BIT(interrupt)) {
+				handler = &tegra264_mc_error_handlers[i];
 				break;
 			}
 		}
 
-		if (err_type_mask == MC_ERR_STATUS_RT_TYPE_MASK) {
-			type = (value & err_type_mask) >>
-				MC_ERR_STATUS_RT_TYPE_SHIFT;
-			desc = tegra264_rt_error_names[type];
-		} else if (err_type_mask) {
-			type = (value & err_type_mask) >>
-					MC_ERR_STATUS_TYPE_SHIFT;
-			desc = tegra264_mc_error_names[type];
+		if (!handler) {
+			dev_err_ratelimited(mc->dev, "Incorrect MC interrupt mask\n");
+			return;
 		}
 
-		dev_err_ratelimited(mc->dev, "%s: %s %s @%pa: %s (%s)\n",
-				    client, value & mc_sec_bit ? "secure" : "non-secure",
-				    value & mc_rw_bit ? "write" : "read", &addr,
-				    tegra_mc_status_names[bit] ?: "unknown", desc);
-		if (status1_reg)
-			dev_err_ratelimited(mc->dev, "gsc_apr_id=%u gsc_co_apr_id=%u\n",
-					    ((status1 >> ERR_GENERALIZED_APERTURE_ID_SHIFT)
-					    & ERR_GENERALIZED_APERTURE_ID_MASK),
-					    ((status1 >> ERR_GENERALIZED_CARVEOUT_APERTURE_ID_SHIFT)
-					    & ERR_GENERALIZED_CARVEOUT_APERTURE_ID_MASK));
+		handler->get_offsets(mc, &fault);
+		tegra264_mc_report_fault(mc, channel, interrupt, &fault);
 	}
 
 	/* clear interrupts */
@@ -957,53 +1032,69 @@ static irqreturn_t handle_mcf_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static const struct tegra264_hub_error_handler tegra264_hub_error_handlers[] = {
+	{
+		.mask = MSS_HUB_COALESCER_ERR_INTMASK,
+		.status_reg = MSS_HUB_COALESCE_ERR_STATUS_0,
+		.addr_reg = MSS_HUB_COALESCE_ERR_ADR_0,
+		.addr_hi_reg = MSS_HUB_COALESCE_ERR_ADR_HI_0,
+	},
+	{
+		.mask = MSS_HUB_SMMU_BYPASS_ALLOW_ERR_INTMASK,
+		.status_reg = MSS_HUB_SMMU_BYPASS_ALLOW_ERR_STATUS_0,
+	},
+	{
+		.mask = MSS_HUB_ILLEGAL_TBUGRP_ID_INTMASK,
+		.status_reg = MSS_HUB_ILLEGAL_TBUGRP_ID_ERR_STATUS_0,
+	},
+	{
+		.mask = MSS_HUB_MSI_ERR_INTMASK,
+		.status_reg = MSS_HUB_MSI_ERR_STATUS_0,
+	},
+	{
+		.mask = MSS_HUB_POISON_RSP_INTMASK,
+		.status_reg = MSS_HUB_POISON_RSP_STATUS_0,
+	},
+	{
+		.mask = MSS_HUB_RESTRICTED_ACCESS_ERR_INTMASK,
+		.status_reg = MSS_HUB_RESTRICTED_ACCESS_ERR_STATUS_0,
+	},
+	{
+		.mask = MSS_HUB_RESERVED_PA_ERR_INTMASK,
+		.status_reg = MSS_HUB_RESERVED_PA_ERR_STATUS_0,
+	},
+};
+
 static void hub_log_fault(struct tegra_mc *mc, u32 hub, unsigned long hub_intstat)
 {
-	unsigned int bit;
+	unsigned int interrupt;
 
-	for_each_set_bit(bit, &hub_intstat, 32) {
+	for_each_set_bit(interrupt, &hub_intstat, 32) {
+		const struct tegra264_hub_error_handler *handler = NULL;
 		const char *client = "unknown";
-		u32 client_id, status_reg, value, i;
+		u32 client_id, value;
 		phys_addr_t addr = 0;
+		unsigned int i;
 
-		switch (BIT(bit)) {
-		case MSS_HUB_COALESCER_ERR_INTMASK:
-			status_reg = MSS_HUB_COALESCE_ERR_STATUS_0;
-			addr = mc_ch_readl(mc, hub, MSS_HUB_COALESCE_ERR_ADR_HI_0);
-			addr <<= 32;
-			addr |= mc_ch_readl(mc, hub, MSS_HUB_COALESCE_ERR_ADR_0);
-			break;
-
-		case MSS_HUB_SMMU_BYPASS_ALLOW_ERR_INTMASK:
-			status_reg = MSS_HUB_SMMU_BYPASS_ALLOW_ERR_STATUS_0;
-			break;
-
-		case MSS_HUB_ILLEGAL_TBUGRP_ID_INTMASK:
-			status_reg = MSS_HUB_ILLEGAL_TBUGRP_ID_ERR_STATUS_0;
-			break;
-
-		case MSS_HUB_MSI_ERR_INTMASK:
-			status_reg = MSS_HUB_MSI_ERR_STATUS_0;
-			break;
-
-		case MSS_HUB_POISON_RSP_INTMASK:
-			status_reg = MSS_HUB_POISON_RSP_STATUS_0;
-			break;
-
-		case MSS_HUB_RESTRICTED_ACCESS_ERR_INTMASK:
-			status_reg = MSS_HUB_RESTRICTED_ACCESS_ERR_STATUS_0;
-			break;
-
-		case MSS_HUB_RESERVED_PA_ERR_INTMASK:
-			status_reg = MSS_HUB_RESERVED_PA_ERR_STATUS_0;
-			break;
+		for (i = 0; i < ARRAY_SIZE(tegra264_hub_error_handlers); i++) {
+			if (tegra264_hub_error_handlers[i].mask == BIT(interrupt)) {
+				handler = &tegra264_hub_error_handlers[i];
+				break;
+			}
+		}
 
-		default:
+		if (!handler) {
 			dev_err_ratelimited(mc->dev, "Incorrect HUB interrupt mask\n");
 			return;
 		}
 
-		value = mc_ch_readl(mc, hub, status_reg);
+		if (handler->addr_reg) {
+			addr = mc_ch_readl(mc, hub, handler->addr_hi_reg);
+			addr <<= 32;
+			addr |= mc_ch_readl(mc, hub, handler->addr_reg);
+		}
+
+		value = mc_ch_readl(mc, hub, handler->status_reg);
 
 		client_id = value & mc->soc->client_id_mask;
 		for (i = 0; i < mc->soc->num_clients; i++) {
@@ -1014,8 +1105,8 @@ static void hub_log_fault(struct tegra_mc *mc, u32 hub, unsigned long hub_intsta
 		}
 
 		dev_err_ratelimited(mc->dev, "%s: @%pa: %s status: 0x%x\n",
-				    client, &addr, tegra264_hub_error_names[bit] ?: "unknown",
-				    value);
+				    client, &addr,
+				    tegra264_hub_error_names[interrupt] ?: "unknown", value);
 	}
 
 	/* clear interrupts */
-- 
2.43.0

