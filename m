Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012049.outbound.protection.outlook.com [52.101.53.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFD8311C01;
	Wed, 27 May 2026 14:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779890524; cv=fail; b=WQjbVbRwENFl2EyGknfL/a+I7Q4dHNGIW/5wdTE93SK5AOl8oOK+/585J/1wXaxz06K316LdsT+0Tj0h/GMfZ+EOUl1p+J915ERLNRllHQ2wI6qi4yG+Yko7VPPgdsyfTX8c/Kp4ldzCdG24GC6ef2CITe2FPiN92QA5hDvD2eQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779890524; c=relaxed/simple;
	bh=+1fCtE72XPlqlzK6ifo34DqGyhggfzIROVjFp7ANvag=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ShecM+iTnjYU2jlvxAmroInhQwZQLa9klvZZ7SFtfNeI9WvwwbBfe0k/IV0wBTP4h7fiDvIvH1b20bFSrPoLWuImnDKjgF+Kq0NkBBN+BHBScpS3dYSwl3HT+MYwtILPKB/mDWvHfGjDclnejgpNi8XcENgsicZ0crTXNrDHpRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VpfQd8yC; arc=fail smtp.client-ip=52.101.53.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VpfQd8yC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n6u5wcS5PkNh8gMVWiV/ndRbhCUQbMr7NrRt5495epUtZg6kFZo20xfgpU1mGf2rhmK1OzryQ1scrBKIB9ITmhQcfAD0043AuwpS7oV7UUn3zw4nrUFZO53cUwAJDwpwXlixRi8X9qtcz88hWWXnMJnB1KcFF7/GuTRIySexjSZw9oZhrODBOZC2JSzKOOF07njdVz2fYEh990p7L0pl1M8+neI4utulVJkzHFazQECrnQrq34uKGiIGhhj7lAlAdEhTlr1vg2QlJ3mwX/DiMbzVgy25V5yT54le2t22HEYRGif1+DI9okh22G8Hk4hEj79O2KOh4r6OA3d7v41J2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYeAvjN84g0eQKOl4lctAVYfOMmsCHi+SmliX7oDCIo=;
 b=Fpokac/3dBQ5VKz6aOrvUM3LD/grCl0+DKTATB4om4+mdgW/ppdXaEEOxXPeVJpQySPgkbEACWcE5sIsRmWyZI8xClpqmLRkk61DmzrZp503hDjJACwXK5jm0aWP907TooBu8PCv9xeG+xcg6rF4c+JDOfKGCFx34u0xN1Mh1WVoLbFhYCMt8Fv4q4QS/IIpqaKpE1yn9/6ex+Tm5jDhawvcxspto0vpROSn2jSs/6N88sIQplP6F3PutCp+KXi7esUNJXrIZ4VgdBXY97Tw3V4h+cR6w5R13MwOvjjk46AhK7prtxubVjnN7jQUDnWgFD8BYZ14afYdGPfk7/ceJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYeAvjN84g0eQKOl4lctAVYfOMmsCHi+SmliX7oDCIo=;
 b=VpfQd8yCLaxpmFVLTQqZI7R2VGEKRxYma7uvMAphn8Nc1zgdyRBgFY1+y6ONVp3FL6RSgzGD4KKZp1/Fd82CvTvCRSiGw0HnuKVkfK8ryXe0OdpGjhpohNabM4hJQTkOIjPQ6GChh4idf7gxCEu67g2Tu3XTEYL6ix7aZ6t64QKAd6nm0eZYERoTeTw/O1wwzzG4U/IaHxq0n1dGX498lMD/JCsSxASyP8mhpWe25A3clVgDSCfhSgCDu4uWdGX9dJyHL/qERg9iGfjIVWbinLf+tMP93sNdpAE5xYX1+X1QvS/l5LKBwMX+HCmiD+xXUYvxc22HlmocpaoBtllouA==
Received: from SJ0PR03CA0093.namprd03.prod.outlook.com (2603:10b6:a03:333::8)
 by PH8PR12MB6987.namprd12.prod.outlook.com (2603:10b6:510:1be::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Wed, 27 May
 2026 14:01:57 +0000
Received: from CO1PEPF000075EF.namprd03.prod.outlook.com
 (2603:10b6:a03:333:cafe::e) by SJ0PR03CA0093.outlook.office365.com
 (2603:10b6:a03:333::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Wed, 27
 May 2026 14:01:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1PEPF000075EF.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Wed, 27 May 2026 14:01:57 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 27 May
 2026 07:01:38 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 27 May 2026 07:01:37 -0700
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 27 May 2026 07:01:35 -0700
From: Sumit Gupta <sumitg@nvidia.com>
To: <krzk@kernel.org>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC: <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [PATCH 1/3] memory: tegra186-emc: stop borrowing MC aggregate hook for EMC
Date: Wed, 27 May 2026 19:31:25 +0530
Message-ID: <20260527140127.49172-2-sumitg@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260527140127.49172-1-sumitg@nvidia.com>
References: <20260527140127.49172-1-sumitg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EF:EE_|PH8PR12MB6987:EE_
X-MS-Office365-Filtering-Correlation-Id: ded02d4b-18ce-4f9e-cbb5-08debbf8842e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	PcBWRo3tBNaDV59tRI5dkOjfGWKRcaeHA8NPcgxXkr2WbDncLlMvRQ+WwSWYATWHJdDwpPTm7JAIuD8/fcI4oAY8woOunPUrovLC9CtIQSRAnfNOshwXKV943zYhI/idJ5wzRrmprfvqQRPSHcD5YnD+86qIz+1kLbvOo5O06W/v0x4gJF6yDCq2Q6AZTsIJVASaC7s+piBG4kScf7hW4WVgdgA6YrOAjXLhuB2vTXDsRY0pNtKBxV/Tstg8P3LKktXKqmwJh6L1QqrDM6UjR5VejHCpHdqrZ1rW2EPfOmRMbeHk3xNWcNEq4qO2ztVIG3Y05jpc6JPx+aGCGzKqN3nMp3VshgNXg6yYL4W/KWxVawGDa1OVE2q8Cj6nGeBGJeljtNLyGkmoKoRPSVUUbhnC+k2smebaEj5tFRO8zbd4iTmqd2SXTKgG2DOmdSdVpH8T3Rj28DPjkKLirYPc/d2NQx0FRb9mslEW5PESmw81rdZ100R9OoJwtTugXStEE0zxd9ZUlS7gd/gdTJAEPpXCaIbb3inVyshPQNzb9zoC24D1JHK+HSrfXE92LtMCZI6p86bl/SAI9vuvRKazzJraPln20XauhfLkZgQkGkZmwAaxjT2Y2+NaWpod61TGwnlHqwRDnwdtRI0eS9KkwC9HSs3LSAPMtEwEMKzZIRWQHA4qdw0KfM9OJjRR2s2CCScDSQaRw1ImKHx3oPaBRVJH58ZdOaHHyPa7G/6UBO0=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gCYw70mW+bij80V9wCJZO8JjdNseMpjtcLq0nIXSESEQfC2unC3dGzigngysADDzZx/swKhF7Ys2kQPox1qT5jq/RGBasiheEfsFLdDUQ+Ioj88pXJdcYoKOw1u9WQQzhOvBX9oW8IDHUOTplu0SUeGHlweKr0pnywHymPauKLz/6SX7ghT2jn4ehxowGgu/XoTzq/QLwOAv7zjSg/Zc5uetovePyWcW+SCpZRg/H1cdsfRdSnTfnh2gyxxGPSpMsH/aoxgEdQ4wnx2xXSbnhODCOagnfUBNqqLCdMafGBw/OKhg+zrCQBUf7bMzHqowxGeNxMgDfbpKCWI4J0GxVyJOuoRJX75fKieiX77exDqsR5Gf2yB/UoTJdDm61PadMdIOWYvDK7i/vJbEBw4S4NyNVomSEoe/AQiQVWIbjzU6a2kuvnBFvaiGhELtp/3f
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 14:01:57.6366
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ded02d4b-18ce-4f9e-cbb5-08debbf8842e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075EF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6987

tegra186_emc_interconnect_init() copies the MC's ICC aggregate hook
into the EMC provider.  That hook (tegra234_mc_icc_aggregate /
tegra264_mc_icc_aggregate) uses container_of() to recover 'mc',
which is only valid when the icc_provider is embedded in struct
tegra_mc.  For an EMC node the provider is embedded in struct
tegra186_emc, so 'mc' points into unrelated memory.

This stayed harmless until commit faafd6ca7e6e ("memory: tegra:
make icc_set_bw return zero if BWMGR not supported") added an
unconditional read of mc->bwmgr_mrq_supported at the top of the
hook.  UBSAN catches the stray load on every EMC aggregation:

  UBSAN: invalid-load in drivers/memory/tegra/tegra234.c:1104:9
  load of value 112 is not a valid value for type '_Bool'

No functional impact in practice, since the hook's only other mc
dereference (mc->num_channels) sits inside a
TEGRA_ICC_MC_CPU_CLUSTER* branch that EMC nodes never enter.

Fix this by setting the EMC provider's aggregate hook to
icc_std_aggregate, instead of borrowing the MC's hook.  The MC
providers continue using their own aggregate hooks, where
container_of() correctly resolves to struct tegra_mc.

Reported-by: Jon Hunter <jonathanh@nvidia.com>
Fixes: 9a38cb27668e ("memory: tegra: Add interconnect support for DRAM scaling in Tegra234")
Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
---
 drivers/memory/tegra/tegra186-emc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/memory/tegra/tegra186-emc.c b/drivers/memory/tegra/tegra186-emc.c
index 03ebab6fbe68..f71265b303b9 100644
--- a/drivers/memory/tegra/tegra186-emc.c
+++ b/drivers/memory/tegra/tegra186-emc.c
@@ -258,15 +258,13 @@ static int tegra186_emc_icc_get_init_bw(struct icc_node *node, u32 *avg, u32 *pe
 
 static int tegra186_emc_interconnect_init(struct tegra186_emc *emc)
 {
-	struct tegra_mc *mc = dev_get_drvdata(emc->dev->parent);
-	const struct tegra_mc_soc *soc = mc->soc;
 	struct icc_node *node;
 	int err;
 
 	emc->provider.dev = emc->dev;
 	emc->provider.set = tegra186_emc_icc_set_bw;
 	emc->provider.data = &emc->provider;
-	emc->provider.aggregate = soc->icc_ops->aggregate;
+	emc->provider.aggregate = icc_std_aggregate;
 	emc->provider.xlate = tegra186_emc_of_icc_xlate;
 	emc->provider.get_bw = tegra186_emc_icc_get_init_bw;
 
-- 
2.34.1

