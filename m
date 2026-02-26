Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010021.outbound.protection.outlook.com [52.101.61.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5983843E9E5;
	Thu, 26 Feb 2026 16:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772123533; cv=fail; b=DEwhVCViWNpWlnfxvCMnV2QVs8mpkCrXB4T9dWR1nDVR7sdN+U7IxacNLmTbudeRgxuENvUMHzkxzps65Mk3rLvzg7cEyZ8x8T+FCJVm1/hnXXOBT/PZiB6wy04dTdoiAMVLQU2UiwAYykqif3e/Bd6FgvD7mm+jkJ7SxOeGYiY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772123533; c=relaxed/simple;
	bh=VKymSGjcJ/2pfKTKqe1IzQlari2fHTXKXFHis+T5+4c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ohGmfsAwY/nbtvU3pcXWErIc3U2PkqBmlG33ozaXkX1s20Y9prmmL9AUQBV1jt+rf3WS9K85Eezr8C7cXDeKTcCxhUG+SHolVOWVgYdDKhlD6cKaZFjkOrCMh+Gaxi9Q32LpdnhBduMkC8OA0Ru4GZqN6kucFmeCq+r1BBnyA58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QrIuUJ8b; arc=fail smtp.client-ip=52.101.61.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QrIuUJ8b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gzGZ6iFrg3uffuuLRuPbO673AGTicEt1wSnEq/ztC1fc5Cq4N4FHO59uCMPTN7GX2HtXnJ+nwUjoR0wyPHIfXsdZzL3z23A0vZQqUMSqYx6ICC1XIpmwIMSxU9u1/BNV0uC3Slwp0eu1XEKM4PErQQYo00FtQYZSsOchbaQunWlRahh9ptFeqXSJl/0JV0RSmgAs4Sdd5pl+WCm9348Bcwv3nQrrdjw0rD4nf3d6xwAssr9xVlN4e3X8UL5R2A3kMKAzEmEEpCn//hQnZgbL23LBEz8vZOzoZ+9yW6EoYnjuFbeLJgxlO2DU0IuLslCxoXRTR0mXCXSgGn4aXt6+7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/q0313Ni3usj8dpsPQzeDED8S/QxnuyuTh0OApD3yYY=;
 b=J5gzOk72FIXmRwbXTt/JKRd7F5Jn3QY+zf1v4a6y1pP3dfUi73yhAJsD4Abw2rg6DrNkWW+eEnXABzIP/o4KiZ/GcZReT5dTsw+7zGvanSe4rT+DYf1j2X8FwsF6SOT3GFEe6wUInrl8A67DZRF1fi5HMF2bAt681CbHq5+OSiemn0mt485C27lUMgTR4ZxtA2dZt0hTSbC/p4hiz2Z0IFtLwN2kJN2ArgnbkOfALs0Smyz/6Krm8Ar6XqMPfQ4ahkbym3q6MMqDh5Q6/j6x7ZrpaKxxHzSPUqrWVcGfnSL4MEOeuUE5q6KsiR3ljVvUS9ec0VDI2cwsmt5Hbh3S+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/q0313Ni3usj8dpsPQzeDED8S/QxnuyuTh0OApD3yYY=;
 b=QrIuUJ8b3silpqi4XovN8PG9eJlOXdTd8qrCSXTxb8MCSvYNXDqNWevT3caPVafufSMo5Nxs3hFB7wOVwaukwEnBSz5/Cz2rmnz9tEXw6CnjVH4ok4TWnE/nIbK5ORvvf4YtKMByP6bWxTH5LnRLBSoHL9+B0FSVMNy1IvZQlnkBh7//8eM4L7O7zESROU354MqghhNPWetRV2UZMEEMVEKI3Z4mwO68iAD99A2WPHlrpqJMr8+ixUPvL4LWIipDF3UYdzN+7IOnkEfrkBSw9DBct7gYvh889roI6KXvV5f+ibRqC3Olkd0X01VXtYk2/k89xMQ4d1RXfpEqiA8Ebg==
Received: from SA0PR11CA0192.namprd11.prod.outlook.com (2603:10b6:806:1bc::17)
 by IA0PR12MB8303.namprd12.prod.outlook.com (2603:10b6:208:3de::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Thu, 26 Feb
 2026 16:32:07 +0000
Received: from SA2PEPF00003AE4.namprd02.prod.outlook.com
 (2603:10b6:806:1bc:cafe::53) by SA0PR11CA0192.outlook.office365.com
 (2603:10b6:806:1bc::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.25 via Frontend Transport; Thu,
 26 Feb 2026 16:31:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00003AE4.mail.protection.outlook.com (10.167.248.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 16:32:07 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 08:31:46 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 08:31:46 -0800
Received: from build-ketanp-bionic-20250813.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Thu, 26 Feb 2026 08:31:45 -0800
From: Ketan Patil <ketanp@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ketan Patil
	<ketanp@nvidia.com>
Subject: [PATCH v7 5/6] memory: tegra: Prepare for supporting multiple intmask registers
Date: Thu, 26 Feb 2026 16:31:14 +0000
Message-ID: <20260226163115.1152181-6-ketanp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE4:EE_|IA0PR12MB8303:EE_
X-MS-Office365-Filtering-Correlation-Id: ce2f1f80-0ca2-4cf0-3be3-08de75549521
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	Eg9nbwh0Qivu6qe0qzmEQzVYomzoBOPtrZTwKZP5qm8gkn80xQOC/A29nGyvdiD/aiTKFTsMSIMNPPVIa8I6nndSwBr8EVWcXqha+S0NfZXwYL2oL0W4JbSABLCOtImZAFkuHyC1zZ2PnaVetazIHWecoPYnHjSXZDQKVbNjYwqNSy+3XCXNNfDySRPBUwnF5Ro7636dqjYlepm0Vvs9F0XQjV5hEL9+CD1pDD/+QnS/Tqz9MVFVad9a/wDN0H1PRA+f8DXdKCFTUmKrzQ2i9+6hV6lTfIHWezIo9kGpwcARf44J+Jvcpt1F49fyQYECF6s9flRYQ+1OoiHrUhokUZnFrhSXanMr6qzscedvb3cn+u/d1Hn7Sm5un3EKkidYvXq+ZNNntb/0CJZSRW4SJmhF8iPtn3+u3i5AhGVT3J9f42XJMAwFOEyvn7gMjOEKNtxvCJDBFBNI+nVS5ekDtCWsaYQllqWgFaJoN8sl0rUQZwQUEHPxiZYVp9gAfbYsP2isGairXU5ZSTen2aSCvIUygfMIj7MixpnY8ydNAmlgZXMRylYAunT6Br/d7c2N1Diq2vf7oLdOvuFk95Fgzqog2sElXgvPoCj4hOPuiU36buDtaMY+FI0nMcIhG+ZyFxl+8PUzzmHIpmzbmYKG8abeQqTRLQuG4j+faC/1+WWJA84OCeOMRdYPHmQvn4C8kPNf7HUaL/5jqTroBCtU5KHUrkehnWYtACC7hDPcI5UCB8hlPwGgQEJ9JG20dWaTnCrf3MnvxkiY7i7TYNNpJ3Ikd9XoGHgoOB3VV0mU2z7BRjtAs1kMChiQxzf8IkbL7wCRZ50DHXDXtjU9TiWmPg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kjC/8yjw93iBGMXlQowUjmZEE9vYTlN30BbiKaqZOY4sJT3q5jvAAeNDsviOPREKhhgOT4QEyGF6/zv4u42SPLgZIJihragFzGlwf6GBcplCJIfHxyzoI1Ye6EUnl5h+k1drxXtQg10rydUQulK1JvNd5Xp0g1nhMKcxTJ6qldBPmsAukNTbb+7ssWNc8WCNKnbxHFdr4F+Bn12Pmldcgt+DDOmvdEDGEw4IZs5gOvfrJRAmaRjfvxl1mAivUJFTkqgaZjsLscU3znm8onpoNA4qYahonjZdTT6FyTuaQJDYPKKDrLroKlWyzw6pC880/U6zCX1/QQRijEEXrk3Eco/lxNI89r9dnYjoRv04PVCdTjSavDvgnUA5Gv6Fj8H3bDu0Yw7/M7jZe1rIu5wocPR1yA7ntF4sGQTfFRDLeGLQXx9CDsmFZ4amObpMkMzZ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 16:32:07.1353
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce2f1f80-0ca2-4cf0-3be3-08de75549521
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8303

Add a new structure for the intmask register e.g. MC_INTMASK_0 and
it's mask value. Add an array of these new structures to prepare for
supporting multiple intmask registers. This is done in preparation for
adding support for Tegra264 which supports multiple intmask registers.

Signed-off-by: Ketan Patil <ketanp@nvidia.com>
---
 drivers/memory/tegra/mc.c       | 16 +++++++++-------
 drivers/memory/tegra/tegra114.c | 12 ++++++++++--
 drivers/memory/tegra/tegra124.c | 28 ++++++++++++++++++++++------
 drivers/memory/tegra/tegra186.c | 14 +++++++++++---
 drivers/memory/tegra/tegra194.c | 15 +++++++++++----
 drivers/memory/tegra/tegra20.c  | 14 +++++++++++---
 drivers/memory/tegra/tegra210.c | 14 +++++++++++---
 drivers/memory/tegra/tegra234.c | 15 +++++++++++----
 drivers/memory/tegra/tegra264.c | 17 ++++++++++++-----
 drivers/memory/tegra/tegra30.c  | 12 ++++++++++--
 include/soc/tegra/mc.h          |  8 +++++++-
 11 files changed, 125 insertions(+), 40 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 72d967218522..5a4316f51291 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -595,9 +595,9 @@ irqreturn_t tegra30_mc_handle_irq(int irq, void *data)
 		}
 
 		/* mask all interrupts to avoid flooding */
-		status = mc_ch_readl(mc, channel, MC_INTSTATUS) & mc->soc->intmask;
+		status = mc_ch_readl(mc, channel, MC_INTSTATUS) & mc->soc->intmasks[0].mask;
 	} else {
-		status = mc_readl(mc, MC_INTSTATUS) & mc->soc->intmask;
+		status = mc_readl(mc, MC_INTSTATUS) & mc->soc->intmasks[0].mask;
 	}
 
 	if (!status)
@@ -979,11 +979,13 @@ static int tegra_mc_probe(struct platform_device *pdev)
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
diff --git a/drivers/memory/tegra/tegra114.c b/drivers/memory/tegra/tegra114.c
index 3a061a2d881e..02dd4e26288a 100644
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
@@ -1108,8 +1116,8 @@ const struct tegra_mc_soc tegra114_mc_soc = {
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
diff --git a/drivers/memory/tegra/tegra124.c b/drivers/memory/tegra/tegra124.c
index 4d394889c1e9..df87c5038625 100644
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
@@ -1267,9 +1276,8 @@ const struct tegra_mc_soc tegra124_mc_soc = {
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
@@ -1297,6 +1305,15 @@ static const struct tegra_smmu_soc tegra132_smmu_soc = {
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
@@ -1304,9 +1321,8 @@ const struct tegra_mc_soc tegra132_mc_soc = {
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
diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index 94cad76c52ac..91d56165605f 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -901,15 +901,23 @@ static const struct tegra_mc_client tegra186_mc_clients[] = {
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
diff --git a/drivers/memory/tegra/tegra194.c b/drivers/memory/tegra/tegra194.c
index 38852b2a0f44..a8cc57690696 100644
--- a/drivers/memory/tegra/tegra194.c
+++ b/drivers/memory/tegra/tegra194.c
@@ -1343,16 +1343,23 @@ static const struct tegra_mc_client tegra194_mc_clients[] = {
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
diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra20.c
index a5cc770437ae..ff9e151b5a4c 100644
--- a/drivers/memory/tegra/tegra20.c
+++ b/drivers/memory/tegra/tegra20.c
@@ -695,7 +695,7 @@ static irqreturn_t tegra20_mc_handle_irq(int irq, void *data)
 	unsigned int bit;
 
 	/* mask all interrupts to avoid flooding */
-	status = mc_readl(mc, MC_INTSTATUS) & mc->soc->intmask;
+	status = mc_readl(mc, MC_INTSTATUS) & mc->soc->intmasks[0].mask;
 	if (!status)
 		return IRQ_NONE;
 
@@ -769,13 +769,21 @@ static const struct tegra_mc_ops tegra20_mc_ops = {
 	.probe = tegra20_mc_probe,
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
diff --git a/drivers/memory/tegra/tegra210.c b/drivers/memory/tegra/tegra210.c
index aa606df8a679..f58f3ef6f681 100644
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
@@ -1280,9 +1289,8 @@ const struct tegra_mc_soc tegra210_mc_soc = {
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
diff --git a/drivers/memory/tegra/tegra234.c b/drivers/memory/tegra/tegra234.c
index 67d5d4e01a65..87b22038a5fb 100644
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
diff --git a/drivers/memory/tegra/tegra264.c b/drivers/memory/tegra/tegra264.c
index 5203e6c11372..172a48b56484 100644
--- a/drivers/memory/tegra/tegra264.c
+++ b/drivers/memory/tegra/tegra264.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (C) 2025, NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (C) 2025-2026, NVIDIA CORPORATION.  All rights reserved.
  */
 
 #include <dt-bindings/memory/nvidia,tegra264.h>
@@ -290,16 +290,23 @@ static const struct tegra_mc_icc_ops tegra264_mc_icc_ops = {
 	.set = tegra264_mc_icc_set,
 };
 
+static const struct tegra_mc_intmask tegra264_mc_intmasks[] = {
+	{
+		.reg = MC_INTMASK,
+		.mask = MC_INT_DECERR_ROUTE_SANITY | MC_INT_DECERR_GENERALIZED_CARVEOUT |
+			MC_INT_DECERR_MTS  | MC_INT_SECERR_SEC | MC_INT_DECERR_VPR |
+			MC_INT_SECURITY_VIOLATION | MC_INT_DECERR_EMEM,
+	},
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
+	.intmasks = tegra264_mc_intmasks,
+	.num_intmasks = ARRAY_SIZE(tegra264_mc_intmasks),
 	.has_addr_hi_reg = true,
 	.ops = &tegra186_mc_ops,
 	.icc_ops = &tegra264_mc_icc_ops,
diff --git a/drivers/memory/tegra/tegra30.c b/drivers/memory/tegra/tegra30.c
index 8a26a2f204e9..8389e3af0121 100644
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
@@ -1393,8 +1401,8 @@ const struct tegra_mc_soc tegra30_mc_soc = {
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
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index b9b1763b10b5..e6da035d1306 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -185,6 +185,11 @@ struct tegra_mc_regs {
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
@@ -202,7 +207,6 @@ struct tegra_mc_soc {
 
 	const struct tegra_smmu_soc *smmu;
 
-	u32 intmask;
 	u32 ch_intmask;
 	u32 global_intstatus_channel_shift;
 	bool has_addr_hi_reg;
@@ -219,6 +223,8 @@ struct tegra_mc_soc {
 	unsigned int num_interrupts;
 	unsigned int mc_addr_hi_mask;
 	unsigned int mc_err_status_type_mask;
+	const struct tegra_mc_intmask *intmasks;
+	unsigned int num_intmasks;
 };
 
 struct tegra_mc {
-- 
2.17.1

