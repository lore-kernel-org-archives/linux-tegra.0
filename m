Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012055.outbound.protection.outlook.com [52.101.53.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A709A36F417;
	Fri, 30 Jan 2026 17:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769794307; cv=fail; b=AsYPsOf8GMLcEZAKPlgJyg4+pIQIY0arxcrtu0yLpjXrHW9Zw2SAmRkZ+CHtdwHuy/T9iBFx3qQgMTccpGMEMzVBQkH9QvIL3UOg3YilGGqMJUYSbW1i+8ixdZCorxNLWrMCWHhJKKmPeDCjhJYRbV3iCKJtnmWtoapZjNh86N0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769794307; c=relaxed/simple;
	bh=f9infTZqCm1jVjrCICPoq/krhd3WdBBxJuRZG4SRVPM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UFHRI3+uH6C6Q00jBNHspvRqc1E3dbetoWp6oCpJ4Qdsi8wKmG1v+gSXslcJM7CgkayWiGn2zCZxCaYi00567jWrDT+MsuEWZBlOyjJrG1XVwtzHxU2fE2fc9BGmrD16OTp6aZkMaa0F2He+ab/Gzi0yD7/tAuoQCdoId/PINjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tgFA9vHo; arc=fail smtp.client-ip=52.101.53.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tgFA9vHo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f0XwMLUUUOIpsK3Je5IwRDLcC9UURV5nds1ape4hSmMzr0fEnA6+B2NoGyzh7qArwVGel/MUkpLZfoYo+W08yN1Ub7s3sKscx3cqNzR7sLD6tkWeNOpo8GqTJbppmhBMmXYThXx6I/uCbGViWOv6EsMTQH+UrICeTtRjlGEMzZmS51BWvuqYJO9Tn8x5/I6QMbIkjatUv+ILXJXCZ7++ETskrw8V+w58cwN2seTChNO9O0BlGbqWbs8bNhgmg34gDaMCpnWVgMAV7CTZ3ZyvuqAnAdGIdco2mn6oRFVyhtOIPIWxDiT7rQIno0KOOxKtr+68HVfQ/3vw0rtAOtPBlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KM7aCe89k7VFJVUztZCL5tjSkOTAbFPez5PFKFuWheM=;
 b=Gvpp6AerzbT5PkYoIY4Vvi/ZdFKdarWkEAAL41cIRFw2lLzfIsaF57s5IAGDiZbUBqB9Q1OMFLnV0aTjK6vuMzGM4TKJSDD572T2tXcA42HEoOT6sOVCjCXchPyBuqZJVVxOT34mu1653zUEwMfCxp5OvRci66JzoXj4FFDbmqwRSqH87OyUWfNjraEilxOXiSQuGK1NoixEyBaeubmZzO9emQaBnQgcOCpkeeqgxDQDdN/XQU+ryLrnw6bR3Lmse2Ll5hgDGdqQMYbzLN+E5Trv/zgMaH19c1SgyR1zuoWI4oDxsCtyA9xruWIS8KPgWkyEBIBXPB8kA8pBBDzBBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KM7aCe89k7VFJVUztZCL5tjSkOTAbFPez5PFKFuWheM=;
 b=tgFA9vHoyEJd6e3J56zyx/rRV/LQDG88KHsvzGso3jvh1P9s3+obYcex4mKP7lpV4wMe9OpzZhXBOKsJGhwkXNRY3cSJ3tja9cAal6sggJkeIYz9ynLDq0Z54EvJY0oZ2uc2Yftof7W0P5bodw36yjPWRekLfSDw6oYVk9Ns0Emu4+TYeo5XEuPEllpeXziX1QP0cLQ+O1/HA69jucyob8wTNuZbFbo3m/QDFmWdUKwmf1HDM0IC6lX2aFNYqaQyyFB7Z806wFA+w1erUkqjJy+yrTkqF3D051pGKCe8HjNurScIl67Xba6yY6foRnH4tMwSR72lf7DFwkWXS1aRMg==
Received: from SJ0PR13CA0106.namprd13.prod.outlook.com (2603:10b6:a03:2c5::21)
 by MN2PR12MB4373.namprd12.prod.outlook.com (2603:10b6:208:261::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.12; Fri, 30 Jan
 2026 17:31:34 +0000
Received: from SJ5PEPF000001ED.namprd05.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::f2) by SJ0PR13CA0106.outlook.office365.com
 (2603:10b6:a03:2c5::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.2 via Frontend Transport; Fri,
 30 Jan 2026 17:31:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SJ5PEPF000001ED.mail.protection.outlook.com (10.167.242.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 17:31:34 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 09:31:21 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Fri, 30 Jan 2026 09:31:20 -0800
Received: from build-ketanp-bionic-20250813.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Fri, 30 Jan 2026 09:31:20 -0800
From: Ketan Patil <ketanp@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ketan Patil
	<ketanp@nvidia.com>
Subject: [PATCH v6 4/4] memory: tegra: Add MC error logging support for Tegra264
Date: Fri, 30 Jan 2026 17:30:55 +0000
Message-ID: <20260130173055.151255-5-ketanp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001ED:EE_|MN2PR12MB4373:EE_
X-MS-Office365-Filtering-Correlation-Id: dc40b2c5-af9d-437c-0fff-08de602569fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g6PJNN9RCynnGqemwjawlRYu98AN4O5ELezRpN2ens8jsIZRi9ddCQruuFoV?=
 =?us-ascii?Q?/0eh4N/N3cGvvkDESncqseX/5MgtfU+cbMmND6qZepUf9KXUyZ5NvcDovpN4?=
 =?us-ascii?Q?X8bAgXAG8OdejuAaxK1+zwpRiup3rSEOko7kmhXIQ79ejI0Uy5Xbv1s/5HeX?=
 =?us-ascii?Q?CVPZkbG3qKjruAd/uAa6/lDA+ujnb8u4GjM5xrvGJhrgOyBlHgrDsfFD+j8o?=
 =?us-ascii?Q?1Vp3fNcjP2kkhyFNfsMuRAvmS5S1beli1HDeJCxrZF/1jujzOupvR/zMzAWq?=
 =?us-ascii?Q?p0iivV9d5i/pi5VtxCPKw7DGPXIz++53aJ7frZBscdCWoxndz1YONSASSbi9?=
 =?us-ascii?Q?UMcvchj4wgGGL+aFjl76h+/Q3/9BCdQeyBvWe6roPkr/ew0jeH822kvCVnyH?=
 =?us-ascii?Q?M+J81SA1/WXv7aO58vJW17sjuh1rTeky5khjll9zTTrjGrXuFf7rS7QgdVQJ?=
 =?us-ascii?Q?ZoFY7+sZTP2VmbCxGpKW4fwIu6gSsqulw1mViWj7TohJZattJQx4eFCBoUXx?=
 =?us-ascii?Q?a7ws+p/e2Wujy3TTgBZWj9f41/yZysXoUlLOIqv21m6hjpoYUjbveeNTQ94h?=
 =?us-ascii?Q?vEtuYFzhnhK2FI5GjwoQXxXJQ9h/L/UTH2QTdugQxjIYoMKXkFNUXMOrFc1k?=
 =?us-ascii?Q?2aWK2ieYTDhFNw7Pp4J3tosn7dGtYGLQv5Pfn87fNvBSWnltPl5cJVPgCQnR?=
 =?us-ascii?Q?xfGXofFd0Gu7enC++PqLqlZhoo6IyhE92sdj4lbXbUu7rEYB0xSSw7WFIuYH?=
 =?us-ascii?Q?QP2kbbHjAD1Az0a0HqPmIy2EEBehJqU4slRPA6NjdvYU4turAC9+vn1Nz5yo?=
 =?us-ascii?Q?sK1JDI7nHrpfR0nQ+8sHyFJslIiGeC7omuicPBHSyHVA3f53xmIGjgbz8Uch?=
 =?us-ascii?Q?DxkiU6MBcpHi+RTbf2a9xvr/ZpoUW4mrvWaSkrKePniZmAtAuvyygpO4AWDe?=
 =?us-ascii?Q?v3fY0p87CuTkOmWAdwqMnpwzepqwYcan1OIL3ZtrlysX1Ty/bRdWaEpQRxpM?=
 =?us-ascii?Q?1BD/7gMfHTF08z9+Q9jejQcCW9UFoEeGCOl3+nu8D2ZLCOUUfW5TYS4tqHDe?=
 =?us-ascii?Q?jSJSvI0+bm3X2cZbJrl+d6OEW8hotC/FEHlMGjzDqEv3tsLdopxXX/YNPs1R?=
 =?us-ascii?Q?PLmHtezgzij38SHrXdGV2KAcX0gh0La88G1+zG8VBg/oY8O7JxJfcMprLTwx?=
 =?us-ascii?Q?vrWyY8LSExg7AYUBVgd/ffx1h9lJnSBpmIrqkOHuAitXMDUj1SmX0uFrzV8B?=
 =?us-ascii?Q?bQXiQOwBEthGIbfu+SV3LdgDr+H8wAFoOBmlqaFzQFV6nYe1JnhJ6EAd9hAR?=
 =?us-ascii?Q?dsOd8ZJ4dKQd6CToOVXfX/HLlvdYx3aEzIFQfPR/Qxuh+EQnYphtWwHkLZf4?=
 =?us-ascii?Q?UJXE4dnh5VwzMG7wPn+eFlDXDtwMBp73i5S1RQUXs9tRCAqQH+jV3/qbjb6+?=
 =?us-ascii?Q?pYLhjFAiQPvNF5Gn/jwhfH/UikSvQENwKluOqocxZ7N6T4wAqVa/Mxsjmrnv?=
 =?us-ascii?Q?5q1JdB5CfX2KkuvixT8m8TgE+Kc0r55/K6UFJFjqxgH7CyUog0OB91NRb5Vq?=
 =?us-ascii?Q?sUEMGU0Oij2kK7TXElmwMjqORe0kcc9Ag5+e4svmX/8tC7NXs7Ua7VtuNzlT?=
 =?us-ascii?Q?TwnNkY+VmTQrwpJEbacmoEN+I61epc/AZU1w87fCXI7/DsNi2MtsK8an7aNb?=
 =?us-ascii?Q?INJdKQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qCS9I7rrSYV4FZO54Dj9vP8vvigccMUivZwEHLkf7fj+vxx45aos9w/9HDW4dVVs+WuEBl3a70buwpr0HjMsmFxBkvcttSGPnaC5MRgYa2I6L/IEl8FVkXqKoEVpZvWV6xI4Y4c6ms90wIAqOnbb/DWUeVUSnDMmKw/SwK/Ko+1mmdkqX0JEUxnBaMEYhe7yBHH9fNTircwQBzKztJDIr1EFpDVKr2o6jCYMZDc7B+bmMgH/Hmyek1nVqb9q8MZ5XXoto3kMzSaaypRifFJC4aORSD43u8ybThVjlSpxukyTSKLFDmJ7haK7EL+lrNb5O4qpqC02CxCzjhR5lMSNriDYUuoPXdvLlvlsfyMxujnxi/Hx0pfMhuGHOiO2GHT43H9r4D4DgFcXFWVC2thjZwfglJ9tYF4HwbjolF+3Eb3El9Q4DU2CCGIgsacYfYO2
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 17:31:34.1107
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc40b2c5-af9d-437c-0fff-08de602569fa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4373

In Tegra264, different components from memory subsystems like Memory
Controller Fabric (MCF), HUB, HUB Common (HUBC), Side Band Shim (SBS)
and channels have different interrupt lines for receiving memory
controller error interrupts.

Add support for logging memory controller errors on Tegra264.
- Add MC error handling flow for MCF, HUB, HUBC, SBS and channels.
- Each of these components have different interrupt lines for MC error.
- Register interrupt handlers for interrupts from these different MC
components.
- There is no global interrupt status register in Tegra264 unlike older
Tegra chips.
- There are common interrupt status registers in case of MCF, HUB, HUBC
from which figure out the slice number or hub number responsible for
generating interrupt and then read interrupt status register to find out
type of violation.
- Introduce new SoC specific fields in tegra_mc_soc like interrupt mask
values for MCF, HUB, HUBC etc., which are SoC specific.

Signed-off-by: Ketan Patil <ketanp@nvidia.com>
---
 drivers/memory/tegra/mc.c       |  35 +--
 drivers/memory/tegra/mc.h       |  83 ++++++-
 drivers/memory/tegra/tegra114.c |  13 +-
 drivers/memory/tegra/tegra124.c |  32 ++-
 drivers/memory/tegra/tegra186.c |  24 +-
 drivers/memory/tegra/tegra194.c |  17 +-
 drivers/memory/tegra/tegra20.c  |  23 +-
 drivers/memory/tegra/tegra210.c |  16 +-
 drivers/memory/tegra/tegra234.c |  17 +-
 drivers/memory/tegra/tegra264.c | 428 +++++++++++++++++++++++++++++++-
 drivers/memory/tegra/tegra30.c  |  13 +-
 include/soc/tegra/mc.h          |  10 +-
 12 files changed, 648 insertions(+), 63 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 49c470f7b1f7..a102a8ea7926 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -597,16 +597,16 @@ irqreturn_t tegra30_mc_handle_irq(int irq, void *data)
 		}
 
 		/* mask all interrupts to avoid flooding */
-		status = mc_ch_readl(mc, channel, MC_INTSTATUS) & mc->soc->intmask;
+		status = mc_ch_readl(mc, channel, MC_INTSTATUS) & mc->soc->intmasks[0].mask;
 	} else {
-		status = mc_readl(mc, MC_INTSTATUS) & mc->soc->intmask;
+		status = mc_readl(mc, MC_INTSTATUS) & mc->soc->intmasks[0].mask;
 	}
 
 	if (!status)
 		return IRQ_NONE;
 
 	for_each_set_bit(bit, &status, 32) {
-		const char *error = tegra_mc_status_names[bit] ?: "unknown";
+		const char *error = tegra20_mc_status_names[bit] ?: "unknown";
 		const char *client = "unknown", *desc;
 		const char *direction, *secure;
 		u32 status_reg, addr_reg;
@@ -669,9 +669,11 @@ irqreturn_t tegra30_mc_handle_irq(int irq, void *data)
 					addr = mc_ch_readl(mc, channel, addr_hi_reg);
 				else
 					addr = mc_readl(mc, addr_hi_reg);
-			} else {
+			} else if (mc->soc->mc_addr_hi_mask) {
 				addr = ((value >> MC_ERR_STATUS_ADR_HI_SHIFT) &
-					MC_ERR_STATUS_ADR_HI_MASK);
+					mc->soc->mc_addr_hi_mask);
+			} else {
+				WARN_ON(1);
 			}
 			addr <<= 32;
 		}
@@ -696,11 +698,11 @@ irqreturn_t tegra30_mc_handle_irq(int irq, void *data)
 			}
 		}
 
-		type = (value & MC_ERR_STATUS_TYPE_MASK) >>
+		type = (value & mc->soc->mc_err_status_type_mask) >>
 		       MC_ERR_STATUS_TYPE_SHIFT;
-		desc = tegra_mc_error_names[type];
+		desc = tegra20_mc_error_names[type];
 
-		switch (value & MC_ERR_STATUS_TYPE_MASK) {
+		switch (value & mc->soc->mc_err_status_type_mask) {
 		case MC_ERR_STATUS_TYPE_INVALID_SMMU_PAGE:
 			perm[0] = ' ';
 			perm[1] = '[';
@@ -753,7 +755,7 @@ irqreturn_t tegra30_mc_handle_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-const char *const tegra_mc_status_names[32] = {
+const char *const tegra20_mc_status_names[32] = {
 	[ 1] = "External interrupt",
 	[ 6] = "EMEM address decode error",
 	[ 7] = "GART page fault",
@@ -766,9 +768,10 @@ const char *const tegra_mc_status_names[32] = {
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
@@ -977,11 +980,13 @@ static int tegra_mc_probe(struct platform_device *pdev)
 			}
 		}
 
-		if (mc->soc->num_channels)
-			mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->intmask,
-				     MC_INTMASK);
-		else
-			mc_writel(mc, mc->soc->intmask, MC_INTMASK);
+		for (i = 0; i < mc->soc->num_intmasks; i++) {
+			if (mc->soc->num_channels)
+				mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->intmasks[i].mask,
+					mc->soc->intmasks[i].reg);
+			else
+				mc_writel(mc, mc->soc->intmasks[i].mask, mc->soc->intmasks[i].reg);
+		}
 	}
 
 	if (mc->soc->reset_ops) {
diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
index 464cf75ccadc..28b01f6173f4 100644
--- a/drivers/memory/tegra/mc.h
+++ b/drivers/memory/tegra/mc.h
@@ -25,6 +25,7 @@
 #define MC_INT_DECERR_MTS				BIT(16)
 #define MC_INT_DECERR_GENERALIZED_CARVEOUT		BIT(17)
 #define MC_INT_DECERR_ROUTE_SANITY			BIT(20)
+#define MC_INT_DECERR_ROUTE_SANITY_GIC_MSI		BIT(21)
 
 #define MC_INTMASK					0x04
 #define MC_GART_ERROR_REQ				0x30
@@ -76,15 +77,82 @@
 #define MC_ERR_STATUS_WRITABLE				BIT(26)
 #define MC_ERR_STATUS_READABLE				BIT(27)
 
+#define MC_ERR_STATUS_GSC_ADR_HI_MASK			0xffff
+#define MC_ERR_STATUS_GSC_ADR_HI_SHIFT			16
+#define MC_ERR_STATUS_RT_ADR_HI_SHIFT			15
+
 #define MC_ERR_STATUS_TYPE_SHIFT			28
 #define MC_ERR_STATUS_TYPE_INVALID_SMMU_PAGE		(0x6 << 28)
-#define MC_ERR_STATUS_TYPE_MASK				(0x7 << 28)
+#define MC_ERR_STATUS_RT_TYPE_MASK			(0xf << 28)
+#define MC_ERR_STATUS_RT_TYPE_SHIFT			28
 
 #define MC_ERR_STATUS_ADR_HI_SHIFT			20
-#define MC_ERR_STATUS_ADR_HI_MASK			0x3
 
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
+#define MCF_INTPRIORITY_0					0xce34
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
@@ -187,15 +255,18 @@ extern const struct tegra_mc_ops tegra30_mc_ops;
 
 #if defined(CONFIG_ARCH_TEGRA_186_SOC) || \
     defined(CONFIG_ARCH_TEGRA_194_SOC) || \
-    defined(CONFIG_ARCH_TEGRA_234_SOC) || \
-    defined(CONFIG_ARCH_TEGRA_264_SOC)
+    defined(CONFIG_ARCH_TEGRA_234_SOC)
 extern const struct tegra_mc_ops tegra186_mc_ops;
 #endif
 
 irqreturn_t tegra30_mc_handle_irq(int irq, void *data);
 extern const irq_handler_t tegra30_mc_irq_handlers[];
-extern const char * const tegra_mc_status_names[32];
-extern const char * const tegra_mc_error_names[8];
+extern const char * const tegra20_mc_status_names[32];
+extern const char * const tegra20_mc_error_names[8];
+int tegra186_mc_probe(struct tegra_mc *mc);
+int tegra186_mc_probe_device(struct tegra_mc *mc, struct device *dev);
+int tegra186_mc_resume(struct tegra_mc *mc);
+void tegra186_mc_remove(struct tegra_mc *mc);
 
 /*
  * These IDs are for internal use of Tegra ICC drivers. The ID numbers are
diff --git a/drivers/memory/tegra/tegra114.c b/drivers/memory/tegra/tegra114.c
index ea7e4c7bb5f8..ddc81d844723 100644
--- a/drivers/memory/tegra/tegra114.c
+++ b/drivers/memory/tegra/tegra114.c
@@ -1101,6 +1101,14 @@ static const struct tegra_mc_reset tegra114_mc_resets[] = {
 	TEGRA114_MC_RESET(VI,       0x200, 0x204, 17),
 };
 
+static const struct tegra_mc_intmask tegra114_mc_intmasks[] = {
+	{
+		.reg = MC_INTMASK,
+		.mask = MC_INT_INVALID_SMMU_PAGE | MC_INT_SECURITY_VIOLATION |
+			MC_INT_DECERR_EMEM,
+	},
+};
+
 const struct tegra_mc_soc tegra114_mc_soc = {
 	.clients = tegra114_mc_clients,
 	.num_clients = ARRAY_SIZE(tegra114_mc_clients),
@@ -1108,11 +1116,12 @@ const struct tegra_mc_soc tegra114_mc_soc = {
 	.atom_size = 32,
 	.client_id_mask = 0x7f,
 	.smmu = &tegra114_smmu_soc,
-	.intmask = MC_INT_INVALID_SMMU_PAGE | MC_INT_SECURITY_VIOLATION |
-		   MC_INT_DECERR_EMEM,
+	.intmasks = tegra114_mc_intmasks,
+	.num_intmasks = ARRAY_SIZE(tegra114_mc_intmasks),
 	.reset_ops = &tegra_mc_reset_ops_common,
 	.resets = tegra114_mc_resets,
 	.num_resets = ARRAY_SIZE(tegra114_mc_resets),
 	.ops = &tegra30_mc_ops,
 	.regs = &tegra20_mc_regs,
+	.mc_err_status_type_mask = (0x7 << 28),
 };
diff --git a/drivers/memory/tegra/tegra124.c b/drivers/memory/tegra/tegra124.c
index c5529f79fbb4..b21b10562ab2 100644
--- a/drivers/memory/tegra/tegra124.c
+++ b/drivers/memory/tegra/tegra124.c
@@ -1258,6 +1258,15 @@ static const struct tegra_smmu_soc tegra124_smmu_soc = {
 	.num_asids = 128,
 };
 
+static const struct tegra_mc_intmask tegra124_mc_intmasks[] = {
+	{
+		.reg = MC_INTMASK,
+		.mask = MC_INT_DECERR_MTS | MC_INT_SECERR_SEC | MC_INT_DECERR_VPR |
+			MC_INT_INVALID_APB_ASID_UPDATE | MC_INT_INVALID_SMMU_PAGE |
+			MC_INT_SECURITY_VIOLATION | MC_INT_DECERR_EMEM,
+	},
+};
+
 const struct tegra_mc_soc tegra124_mc_soc = {
 	.clients = tegra124_mc_clients,
 	.num_clients = ARRAY_SIZE(tegra124_mc_clients),
@@ -1267,15 +1276,16 @@ const struct tegra_mc_soc tegra124_mc_soc = {
 	.smmu = &tegra124_smmu_soc,
 	.emem_regs = tegra124_mc_emem_regs,
 	.num_emem_regs = ARRAY_SIZE(tegra124_mc_emem_regs),
-	.intmask = MC_INT_DECERR_MTS | MC_INT_SECERR_SEC | MC_INT_DECERR_VPR |
-		   MC_INT_INVALID_APB_ASID_UPDATE | MC_INT_INVALID_SMMU_PAGE |
-		   MC_INT_SECURITY_VIOLATION | MC_INT_DECERR_EMEM,
+	.intmasks = tegra124_mc_intmasks,
+	.num_intmasks = ARRAY_SIZE(tegra124_mc_intmasks),
 	.reset_ops = &tegra_mc_reset_ops_common,
 	.resets = tegra124_mc_resets,
 	.num_resets = ARRAY_SIZE(tegra124_mc_resets),
 	.icc_ops = &tegra124_mc_icc_ops,
 	.ops = &tegra30_mc_ops,
 	.regs = &tegra20_mc_regs,
+	.mc_addr_hi_mask = 0x3,
+	.mc_err_status_type_mask = (0x7 << 28),
 };
 #endif /* CONFIG_ARCH_TEGRA_124_SOC */
 
@@ -1293,6 +1303,15 @@ static const struct tegra_smmu_soc tegra132_smmu_soc = {
 	.num_asids = 128,
 };
 
+static const struct tegra_mc_intmask tegra132_mc_intmasks[] = {
+	{
+		.reg = MC_INTMASK,
+		.mask = MC_INT_DECERR_MTS | MC_INT_SECERR_SEC | MC_INT_DECERR_VPR |
+			MC_INT_INVALID_APB_ASID_UPDATE | MC_INT_INVALID_SMMU_PAGE |
+			MC_INT_SECURITY_VIOLATION | MC_INT_DECERR_EMEM,
+	},
+};
+
 const struct tegra_mc_soc tegra132_mc_soc = {
 	.clients = tegra124_mc_clients,
 	.num_clients = ARRAY_SIZE(tegra124_mc_clients),
@@ -1300,14 +1319,15 @@ const struct tegra_mc_soc tegra132_mc_soc = {
 	.atom_size = 32,
 	.client_id_mask = 0x7f,
 	.smmu = &tegra132_smmu_soc,
-	.intmask = MC_INT_DECERR_MTS | MC_INT_SECERR_SEC | MC_INT_DECERR_VPR |
-		   MC_INT_INVALID_APB_ASID_UPDATE | MC_INT_INVALID_SMMU_PAGE |
-		   MC_INT_SECURITY_VIOLATION | MC_INT_DECERR_EMEM,
+	.intmasks = tegra132_mc_intmasks,
+	.num_intmasks = ARRAY_SIZE(tegra132_mc_intmasks),
 	.reset_ops = &tegra_mc_reset_ops_common,
 	.resets = tegra124_mc_resets,
 	.num_resets = ARRAY_SIZE(tegra124_mc_resets),
 	.icc_ops = &tegra124_mc_icc_ops,
 	.ops = &tegra30_mc_ops,
 	.regs = &tegra20_mc_regs,
+	.mc_addr_hi_mask = 0x3,
+	.mc_err_status_type_mask = (0x7 << 28),
 };
 #endif /* CONFIG_ARCH_TEGRA_132_SOC */
diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index 23ec433f0f92..135eb5603637 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -23,7 +23,7 @@
 #define MC_SID_STREAMID_SECURITY_WRITE_ACCESS_DISABLED BIT(16)
 #define MC_SID_STREAMID_SECURITY_OVERRIDE BIT(8)
 
-static int tegra186_mc_probe(struct tegra_mc *mc)
+int tegra186_mc_probe(struct tegra_mc *mc)
 {
 	struct platform_device *pdev = to_platform_device(mc->dev);
 	struct resource *res;
@@ -76,7 +76,7 @@ static int tegra186_mc_probe(struct tegra_mc *mc)
 	return 0;
 }
 
-static void tegra186_mc_remove(struct tegra_mc *mc)
+void tegra186_mc_remove(struct tegra_mc *mc)
 {
 	of_platform_depopulate(mc->dev);
 }
@@ -124,7 +124,7 @@ static void tegra186_mc_client_sid_override(struct tegra_mc *mc,
 }
 #endif
 
-static int tegra186_mc_probe_device(struct tegra_mc *mc, struct device *dev)
+int tegra186_mc_probe_device(struct tegra_mc *mc, struct device *dev)
 {
 #if IS_ENABLED(CONFIG_IOMMU_API)
 	struct of_phandle_args args;
@@ -154,7 +154,7 @@ static int tegra186_mc_probe_device(struct tegra_mc *mc, struct device *dev)
 	return 0;
 }
 
-static int tegra186_mc_resume(struct tegra_mc *mc)
+int tegra186_mc_resume(struct tegra_mc *mc)
 {
 #if IS_ENABLED(CONFIG_IOMMU_API)
 	unsigned int i;
@@ -903,18 +903,28 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
 	},
 };
 
+static const struct tegra_mc_intmask tegra186_mc_intmasks[] = {
+	{
+		.reg = MC_INTMASK,
+		.mask = MC_INT_DECERR_GENERALIZED_CARVEOUT | MC_INT_DECERR_MTS |
+			MC_INT_SECERR_SEC | MC_INT_DECERR_VPR |
+			MC_INT_SECURITY_VIOLATION | MC_INT_DECERR_EMEM,
+	},
+};
+
 const struct tegra_mc_soc tegra186_mc_soc = {
 	.num_clients = ARRAY_SIZE(tegra186_mc_clients),
 	.clients = tegra186_mc_clients,
 	.num_address_bits = 40,
 	.num_channels = 4,
 	.client_id_mask = 0xff,
-	.intmask = MC_INT_DECERR_GENERALIZED_CARVEOUT | MC_INT_DECERR_MTS |
-		   MC_INT_SECERR_SEC | MC_INT_DECERR_VPR |
-		   MC_INT_SECURITY_VIOLATION | MC_INT_DECERR_EMEM,
+	.intmasks = tegra186_mc_intmasks,
+	.num_intmasks = ARRAY_SIZE(tegra186_mc_intmasks),
 	.ops = &tegra186_mc_ops,
 	.ch_intmask = 0x0000000f,
 	.global_intstatus_channel_shift = 0,
 	.regs = &tegra20_mc_regs,
+	.mc_addr_hi_mask = 0x3,
+	.mc_err_status_type_mask = (0x7 << 28),
 };
 #endif
diff --git a/drivers/memory/tegra/tegra194.c b/drivers/memory/tegra/tegra194.c
index 5b7ff2dd6812..2be6250db9cc 100644
--- a/drivers/memory/tegra/tegra194.c
+++ b/drivers/memory/tegra/tegra194.c
@@ -1343,20 +1343,29 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
 	},
 };
 
+static const struct tegra_mc_intmask tegra194_mc_intmasks[] = {
+	{
+		.reg = MC_INTMASK,
+		.mask = MC_INT_DECERR_ROUTE_SANITY | MC_INT_DECERR_GENERALIZED_CARVEOUT |
+			MC_INT_DECERR_MTS | MC_INT_SECERR_SEC | MC_INT_DECERR_VPR |
+			MC_INT_SECURITY_VIOLATION | MC_INT_DECERR_EMEM,
+	},
+};
+
 const struct tegra_mc_soc tegra194_mc_soc = {
 	.num_clients = ARRAY_SIZE(tegra194_mc_clients),
 	.clients = tegra194_mc_clients,
 	.num_address_bits = 40,
 	.num_channels = 16,
 	.client_id_mask = 0xff,
-	.intmask = MC_INT_DECERR_ROUTE_SANITY |
-		   MC_INT_DECERR_GENERALIZED_CARVEOUT | MC_INT_DECERR_MTS |
-		   MC_INT_SECERR_SEC | MC_INT_DECERR_VPR |
-		   MC_INT_SECURITY_VIOLATION | MC_INT_DECERR_EMEM,
+	.intmasks = tegra194_mc_intmasks,
+	.num_intmasks = ARRAY_SIZE(tegra194_mc_intmasks),
 	.has_addr_hi_reg = true,
 	.ops = &tegra186_mc_ops,
 	.icc_ops = &tegra_mc_icc_ops,
 	.ch_intmask = 0x00000f00,
 	.global_intstatus_channel_shift = 8,
 	.regs = &tegra20_mc_regs,
+	.mc_addr_hi_mask = 0x3,
+	.mc_err_status_type_mask = (0x7 << 28),
 };
diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra20.c
index 794255914f2e..d1153bb996ee 100644
--- a/drivers/memory/tegra/tegra20.c
+++ b/drivers/memory/tegra/tegra20.c
@@ -695,12 +695,12 @@ static irqreturn_t tegra20_mc_handle_irq(int irq, void *data)
 	unsigned int bit;
 
 	/* mask all interrupts to avoid flooding */
-	status = mc_readl(mc, MC_INTSTATUS) & mc->soc->intmask;
+	status = mc_readl(mc, MC_INTSTATUS) & mc->soc->intmasks[0].mask;
 	if (!status)
 		return IRQ_NONE;
 
 	for_each_set_bit(bit, &status, 32) {
-		const char *error = tegra_mc_status_names[bit];
+		const char *error = tegra20_mc_status_names[bit];
 		const char *direction = "read", *secure = "";
 		const char *client, *desc;
 		phys_addr_t addr;
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
@@ -771,17 +771,26 @@ static const struct tegra_mc_ops tegra20_mc_ops = {
 	.num_interrupts = ARRAY_SIZE(tegra20_mc_irq_handlers),
 };
 
+static const struct tegra_mc_intmask tegra20_mc_intmasks[] = {
+	{
+		.reg = MC_INTMASK,
+		.mask = MC_INT_SECURITY_VIOLATION | MC_INT_INVALID_GART_PAGE |
+			MC_INT_DECERR_EMEM,
+	},
+};
+
 const struct tegra_mc_soc tegra20_mc_soc = {
 	.clients = tegra20_mc_clients,
 	.num_clients = ARRAY_SIZE(tegra20_mc_clients),
 	.num_address_bits = 32,
 	.client_id_mask = 0x3f,
-	.intmask = MC_INT_SECURITY_VIOLATION | MC_INT_INVALID_GART_PAGE |
-		   MC_INT_DECERR_EMEM,
+	.intmasks = tegra20_mc_intmasks,
+	.num_intmasks = ARRAY_SIZE(tegra20_mc_intmasks),
 	.reset_ops = &tegra20_mc_reset_ops,
 	.resets = tegra20_mc_resets,
 	.num_resets = ARRAY_SIZE(tegra20_mc_resets),
 	.icc_ops = &tegra20_mc_icc_ops,
 	.ops = &tegra20_mc_ops,
 	.regs = &tegra20_mc_regs,
+	.mc_err_status_type_mask = (0x7 << 28),
 };
diff --git a/drivers/memory/tegra/tegra210.c b/drivers/memory/tegra/tegra210.c
index e166b33848e9..8e5011ea57be 100644
--- a/drivers/memory/tegra/tegra210.c
+++ b/drivers/memory/tegra/tegra210.c
@@ -1273,6 +1273,15 @@ static const struct tegra_mc_reset tegra210_mc_resets[] = {
 	TEGRA210_MC_RESET(TSECB,     0x970, 0x974, 13),
 };
 
+static const struct tegra_mc_intmask tegra210_mc_intmasks[] = {
+	{
+		.reg = MC_INTMASK,
+		.mask = MC_INT_DECERR_MTS | MC_INT_SECERR_SEC | MC_INT_DECERR_VPR |
+			MC_INT_INVALID_APB_ASID_UPDATE | MC_INT_INVALID_SMMU_PAGE |
+			MC_INT_SECURITY_VIOLATION | MC_INT_DECERR_EMEM,
+	},
+};
+
 const struct tegra_mc_soc tegra210_mc_soc = {
 	.clients = tegra210_mc_clients,
 	.num_clients = ARRAY_SIZE(tegra210_mc_clients),
@@ -1280,12 +1289,13 @@ const struct tegra_mc_soc tegra210_mc_soc = {
 	.atom_size = 64,
 	.client_id_mask = 0xff,
 	.smmu = &tegra210_smmu_soc,
-	.intmask = MC_INT_DECERR_MTS | MC_INT_SECERR_SEC | MC_INT_DECERR_VPR |
-		   MC_INT_INVALID_APB_ASID_UPDATE | MC_INT_INVALID_SMMU_PAGE |
-		   MC_INT_SECURITY_VIOLATION | MC_INT_DECERR_EMEM,
+	.intmasks = tegra210_mc_intmasks,
+	.num_intmasks = ARRAY_SIZE(tegra210_mc_intmasks),
 	.reset_ops = &tegra_mc_reset_ops_common,
 	.resets = tegra210_mc_resets,
 	.num_resets = ARRAY_SIZE(tegra210_mc_resets),
 	.ops = &tegra30_mc_ops,
 	.regs = &tegra20_mc_regs,
+	.mc_addr_hi_mask = 0x3,
+	.mc_err_status_type_mask = (0x7 << 28),
 };
diff --git a/drivers/memory/tegra/tegra234.c b/drivers/memory/tegra/tegra234.c
index 512d054d7592..d920144e6cfa 100644
--- a/drivers/memory/tegra/tegra234.c
+++ b/drivers/memory/tegra/tegra234.c
@@ -1132,16 +1132,23 @@ static const struct tegra_mc_icc_ops tegra234_mc_icc_ops = {
 	.set = tegra234_mc_icc_set,
 };
 
+static const struct tegra_mc_intmask tegra234_mc_intmasks[] = {
+	{
+		.reg = MC_INTMASK,
+		.mask = MC_INT_DECERR_ROUTE_SANITY | MC_INT_DECERR_GENERALIZED_CARVEOUT |
+			MC_INT_DECERR_MTS | MC_INT_SECERR_SEC | MC_INT_DECERR_VPR |
+			MC_INT_SECURITY_VIOLATION | MC_INT_DECERR_EMEM,
+	},
+};
+
 const struct tegra_mc_soc tegra234_mc_soc = {
 	.num_clients = ARRAY_SIZE(tegra234_mc_clients),
 	.clients = tegra234_mc_clients,
 	.num_address_bits = 40,
 	.num_channels = 16,
 	.client_id_mask = 0x1ff,
-	.intmask = MC_INT_DECERR_ROUTE_SANITY |
-		   MC_INT_DECERR_GENERALIZED_CARVEOUT | MC_INT_DECERR_MTS |
-		   MC_INT_SECERR_SEC | MC_INT_DECERR_VPR |
-		   MC_INT_SECURITY_VIOLATION | MC_INT_DECERR_EMEM,
+	.intmasks = tegra234_mc_intmasks,
+	.num_intmasks = ARRAY_SIZE(tegra234_mc_intmasks),
 	.has_addr_hi_reg = true,
 	.ops = &tegra186_mc_ops,
 	.icc_ops = &tegra234_mc_icc_ops,
@@ -1153,4 +1160,6 @@ const struct tegra_mc_soc tegra234_mc_soc = {
 	 */
 	.num_carveouts = 32,
 	.regs = &tegra20_mc_regs,
+	.mc_addr_hi_mask = 0x3,
+	.mc_err_status_type_mask = (0x7 << 28),
 };
diff --git a/drivers/memory/tegra/tegra264.c b/drivers/memory/tegra/tegra264.c
index 5203e6c11372..5eac05b63d4f 100644
--- a/drivers/memory/tegra/tegra264.c
+++ b/drivers/memory/tegra/tegra264.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2025, NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2025-2026, NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <dt-bindings/memory/nvidia,tegra264.h>
@@ -188,6 +188,41 @@ static const struct tegra_mc_client tegra264_mc_clients[] = {
 	},
 };
 
+static const char *const tegra_hub_status_names[32] = {
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
@@ -283,6 +318,320 @@ static int tegra264_mc_icc_get_init_bw(struct icc_node *node, u32 *avg, u32 *pea
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
+				    tegra20_mc_status_names[bit] ?: "unknown", desc);
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
+				    client, &addr, tegra_hub_status_names[bit] ?: "unknown", value);
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
+static const struct tegra_mc_ops tegra264_mc_ops = {
+	.probe = tegra186_mc_probe,
+	.remove = tegra186_mc_remove,
+	.probe_device = tegra186_mc_probe_device,
+	.resume = tegra186_mc_resume,
+	.handle_irq = tegra264_mc_irq_handlers,
+	.num_interrupts = ARRAY_SIZE(tegra264_mc_irq_handlers),
+};
+
 static const struct tegra_mc_icc_ops tegra264_mc_icc_ops = {
 	.xlate = tegra_mc_icc_xlate,
 	.aggregate = tegra264_mc_icc_aggregate,
@@ -290,18 +639,80 @@ static const struct tegra_mc_icc_ops tegra264_mc_icc_ops = {
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
+static const struct tegra_mc_intmask tegra264_mc_intmasks[] = {
+	{
+		.reg = MCF_INTMASK_0,
+		.mask = MC_INT_DECERR_ROUTE_SANITY_GIC_MSI | MC_INT_DECERR_ROUTE_SANITY |
+			MC_INT_DECERR_GENERALIZED_CARVEOUT | MC_INT_DECERR_MTS |
+			MC_INT_SECERR_SEC | MC_INT_DECERR_VPR | MC_INT_SECURITY_VIOLATION |
+			MC_INT_DECERR_EMEM,
+	},
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
+};
+
 const struct tegra_mc_soc tegra264_mc_soc = {
 	.num_clients = ARRAY_SIZE(tegra264_mc_clients),
 	.clients = tegra264_mc_clients,
 	.num_address_bits = 40,
 	.num_channels = 16,
 	.client_id_mask = 0x1ff,
-	.intmask = MC_INT_DECERR_ROUTE_SANITY |
-		   MC_INT_DECERR_GENERALIZED_CARVEOUT | MC_INT_DECERR_MTS |
-		   MC_INT_SECERR_SEC | MC_INT_DECERR_VPR |
-		   MC_INT_SECURITY_VIOLATION | MC_INT_DECERR_EMEM,
 	.has_addr_hi_reg = true,
-	.ops = &tegra186_mc_ops,
+	.ops = &tegra264_mc_ops,
 	.icc_ops = &tegra264_mc_icc_ops,
 	.ch_intmask = 0x0000ff00,
 	.global_intstatus_channel_shift = 8,
@@ -310,4 +721,9 @@ const struct tegra_mc_soc tegra264_mc_soc = {
 	 * supported.
 	 */
 	.num_carveouts = 32,
+	.regs = &tegra264_mc_regs,
+	.mc_addr_hi_mask = 0xff,
+	.mc_err_status_type_mask = (0x3 << 28),
+	.intmasks = tegra264_mc_intmasks,
+	.num_intmasks = ARRAY_SIZE(tegra264_mc_intmasks),
 };
diff --git a/drivers/memory/tegra/tegra30.c b/drivers/memory/tegra/tegra30.c
index 3f3c7d996b49..936f127b6f4f 100644
--- a/drivers/memory/tegra/tegra30.c
+++ b/drivers/memory/tegra/tegra30.c
@@ -1384,6 +1384,14 @@ static const struct tegra_mc_icc_ops tegra30_mc_icc_ops = {
 	.set = tegra30_mc_icc_set,
 };
 
+static const struct tegra_mc_intmask tegra30_mc_intmasks[] = {
+	{
+		.reg = MC_INTMASK,
+		.mask = MC_INT_INVALID_SMMU_PAGE | MC_INT_SECURITY_VIOLATION |
+			MC_INT_DECERR_EMEM,
+	},
+};
+
 const struct tegra_mc_soc tegra30_mc_soc = {
 	.clients = tegra30_mc_clients,
 	.num_clients = ARRAY_SIZE(tegra30_mc_clients),
@@ -1393,12 +1401,13 @@ const struct tegra_mc_soc tegra30_mc_soc = {
 	.smmu = &tegra30_smmu_soc,
 	.emem_regs = tegra30_mc_emem_regs,
 	.num_emem_regs = ARRAY_SIZE(tegra30_mc_emem_regs),
-	.intmask = MC_INT_INVALID_SMMU_PAGE | MC_INT_SECURITY_VIOLATION |
-		   MC_INT_DECERR_EMEM,
+	.intmasks = tegra30_mc_intmasks,
+	.num_intmasks = ARRAY_SIZE(tegra30_mc_intmasks),
 	.reset_ops = &tegra_mc_reset_ops_common,
 	.resets = tegra30_mc_resets,
 	.num_resets = ARRAY_SIZE(tegra30_mc_resets),
 	.icc_ops = &tegra30_mc_icc_ops,
 	.ops = &tegra30_mc_ops,
 	.regs = &tegra20_mc_regs,
+	.mc_err_status_type_mask = (0x7 << 28),
 };
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index 89f94abfaada..f263eb5b446c 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -187,6 +187,11 @@ struct tegra_mc_regs {
 	unsigned int err_route_add;
 };
 
+struct tegra_mc_intmask {
+	u32 reg;
+	u32 mask;
+};
+
 struct tegra_mc_soc {
 	const struct tegra_mc_client *clients;
 	unsigned int num_clients;
@@ -204,7 +209,6 @@ struct tegra_mc_soc {
 
 	const struct tegra_smmu_soc *smmu;
 
-	u32 intmask;
 	u32 ch_intmask;
 	u32 global_intstatus_channel_shift;
 	bool has_addr_hi_reg;
@@ -216,6 +220,10 @@ struct tegra_mc_soc {
 	const struct tegra_mc_icc_ops *icc_ops;
 	const struct tegra_mc_ops *ops;
 	const struct tegra_mc_regs *regs;
+	unsigned int mc_addr_hi_mask;
+	unsigned int mc_err_status_type_mask;
+	const struct tegra_mc_intmask *intmasks;
+	const unsigned int num_intmasks;
 };
 
 struct tegra_mc {
-- 
2.17.1

