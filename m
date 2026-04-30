Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012013.outbound.protection.outlook.com [40.93.195.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B356539B979;
	Thu, 30 Apr 2026 07:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777533035; cv=fail; b=IfQOa3OSRu0fpKAI1mVX0YRzlkTWuDhcLaaBp/LtIiBFacNZDrNRv/w3THPGVBmF+4HQIM8CrbchvVdjbEtS+kN1IMciOPw5LKTVoRk/8z4hj+VCbpSo3G3+xjo/PZ/xruVp2uEfnwjFE0ReDf3iVK5xqItXCgPg9bYQ+exI2Gs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777533035; c=relaxed/simple;
	bh=zjqbypxsyt1XMzlaVqI2bgB8MLW14ymwdc90M6cDXKw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jkkXBv/4/fRB60k1HJ47WkI0ILYWeJQhhtMCqLFuJ/V1Br2yqC557FOELDZrOV7XrAxevF31Pt8WWY2zseKnZua6cKBbj9G5oHjZ/tVtJWVtJCYR6BS2lvs+2m4zgz7qMp4AkLTPKYwnNPMKxbJCRXWfspqOz37KCLwMMEhdd94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=h6PKCrW/; arc=fail smtp.client-ip=40.93.195.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="h6PKCrW/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cXsqZ/jv9FwrPHKEzk/HtwqyMi9SWfJRmxyW8TTWVj9yRd4lEBo5PUlAHcrHeWb7fv+VQE4gXxe7XEz2fCmW2Kyizlxe6QnjgnNO60pNsopOHvuHZK1V7+u/iPWtU6WGC/bUPKse+FjZtN31mSK+/lv7WwO4FNPJl+lEKU9EC8IAEt5x+MNs3tdWB67epTOD26wORWd0EfV6qOGoWgw1YOrnwUN9DjPKy11GBllSKHsxp6+f7Y319/SLmZXVUaNDjzOTXv4D6cGEZjPEgjLYql/adNuIbyM3DQf/geurEnPBqRQorD58XI1oIFTDhz4NMPp3wdIJ+J3qJ7Cz9kN41w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZiEVNRv589QG3rRkA/bH+5e3wgqors4/M2n/TogZXE=;
 b=DPUP4nPCCWHm9iAasdBjiT9kBYZUkxoxeR0gyjQynSdfOU6c/Nt+nnaQkf29gMXFH4mEBjjagRm2MUt4umW9TGtBeM1F7r2O8U79TxV7jYDRGH95QQiTUBerFVmEko8WblcNBgkUvmalFX2KwDt8ti/dsyWWuAx1K7Q6r0oXGvVnaW/dUC4VU1B8YbFiZjtT7nMQANm5weKbuK9Z2UiXM0Am94CXq4FXXHnqVHnWpEWDXfDGUkzNv2gBHGF85MXT8v8dOSwxMi1zDWw/76xpuv+6X+Svw4POIZnxgNffrTsRJSOCt1eVRhsxar97pF/OpZQ776IdNumJvizgv5s9fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZiEVNRv589QG3rRkA/bH+5e3wgqors4/M2n/TogZXE=;
 b=h6PKCrW/mzxpjn3L6qBBPLB3czw9LdXvh7lbZaRhg4oIph73pct3RbpGp9U3UMv0wa8DfRDT5XS451yHNe9o7xxMM5wSWGngbb7ybxbitYvqZDMtmqdradxxiwVR7tWalZ/TyfpG40sS2Qqt/UepSJoBGgh24QHeNhChlyNHdSFNuTHLvw6+yq+PhAfka0aiAWO0pmbF2CxbcIjRoUjZBJChDLbrxqZy1l7I68E7XcJPG4uci8HyOHo4LVAC7tmhl3eBuHszRkC454yydr5ltfY8HrErMMEN5dKASC9bcaoIOKi3axSOhQQKwabYQfjVHcUWspV0E5/X0A4moGyJdQ==
Received: from CH2PR03CA0002.namprd03.prod.outlook.com (2603:10b6:610:59::12)
 by BY5PR12MB4179.namprd12.prod.outlook.com (2603:10b6:a03:211::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.22; Thu, 30 Apr
 2026 07:10:28 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::1e) by CH2PR03CA0002.outlook.office365.com
 (2603:10b6:610:59::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 07:10:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 30 Apr 2026 07:10:27 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 00:10:12 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 00:10:12 -0700
Received: from build-amhetre-focal-20250829.internal (10.127.8.12) by
 mail.nvidia.com (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Thu, 30 Apr 2026 00:10:12 -0700
From: Ashish Mhetre <amhetre@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <ketanp@nvidia.com>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, Ashish Mhetre <amhetre@nvidia.com>
Subject: [PATCH V2 1/2] memory: tegra: Wire up system sleep PM ops
Date: Thu, 30 Apr 2026 07:09:53 +0000
Message-ID: <20260430070954.1005564-2-amhetre@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260430070954.1005564-1-amhetre@nvidia.com>
References: <20260430070954.1005564-1-amhetre@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|BY5PR12MB4179:EE_
X-MS-Office365-Filtering-Correlation-Id: d4057baf-ef86-406a-8304-08dea6878ecf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	eJKXw1VQgdneU+KSujy0I8vkATwB6sWibRfhiW+0FGj1iD8d/hXzLSaibN+p4Cms49zGXscpRj847fDnSdhyeTg7X6cypwda1z2HmqACgRMORiT1hdCeEbE5GkETIKKo3vxLIVsE8WLX+x1hxK6Ji+g3VRQktb+OmkI97sLB405vN6y7iu7oy5/3hLGNX4zgCCZg4zxMkl6n+yXlSX7nJvR04eZJa5qJcog0g/bWTWmpmJnYWUAdjG84GqDj53TfOk6UFI6/69U10pG8ogY89CycZtP+y5VitTBEFNN4lfv7Mg6c2MAYxGs8Gcec/0DGyQATYZGwiXj2MPiodVsrt5X7NuZ6jRPP/FBwPdKLup5rw5sZ+0GM/8YXo+Dco5GeQuq8T+sGJaC2o82Pcp/f7QL7xcdYk/RZHQXko6QX41RLg/0n+f5brYo4Ys3WZtd0/vnSwKylb7/g+ZWKR4YBTiLegOuwH+ikkXbxZ7KWAEYzmoktUJsq+Z/hd3geBAEil84ISc+iEKSxSVhGBrYWmyVWsmtW2ZbKvqUlCnTyBpVCXPiMPK7A6HHkVeFV+IIZHPvBthHQ0DN6qZKEwQZuMQ5iuUfGxb1bOvVLuQyvRmEKHAxbvoGekyvTnMd2fDpTr/SXKPkkmCBjToGlzUn6sa+Zlf/fc7FyQIYtoOVIOU+rAcIy/a+VRRrPJDfDVNF7wWOxilgp73XT0j1uZsm+JhH25578ahvIfekSmRrrplzQKVfEawMjslbZCie+zXmTNalqUidTIRwKcbiexHPrDw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pzrIOqGdQ2EjAOBneUJFr9t9jFGnh1gauXU48NHgmy0lPHhNoDRBHZBjMKz9UbUNK4i0rcMRI2rhQgw/udjicTniBR9N1gEKEqX2oFSo395tWD1cjvPgxP7OijOkYjKYADa/6hRr07fVN6Wa8v05JR6M4MxVsfKmzM0Pmxcm/JUPbYJqJQcnJfXAAajK81RrqKWU7WzAq+ege4SBdxRNu8/tNdxZ9JZubdR5XOYIDocXfEQ6tBkPWrj7ufg3X123+o8PU4gKeDr8zeLsmfLdjKd1VQ2nbIkPe9uEkj6CrHxBqtsH7FIUa6oA/G12G1kamn0opJEChWBmd2EZf4kuJy05geZLAh9nYy0tx65UsOpLyfWuojE4HRKjvyzYY91jIUS6nWjBKoFsNFw0ZUGdG8KWpwNvdzUKXSXVXWMihhhATYFKNBkz6rURmoSll4bk
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 07:10:27.8440
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4057baf-ef86-406a-8304-08dea6878ecf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4179

The tegra-mc platform driver does not register any dev_pm_ops, so the
the SoC-specific ->resume() is never invoked (e.g. tegra186_mc_resume)
on system wake. On Tegra186 and later this means MC client Stream-ID
override registers are not reprogrammed.

Register a dev_pm_ops on the tegra-mc driver and route the system
resume callback into mc->soc->ops->resume() so the existing SID
restore path runs again on wake.

No suspend callback is needed as the resume path reprograms all MC
state from the static SoC tables, so there is nothing to save.

Fixes: fe3b082a6eb8 ("memory: tegra: Add SID override programming for MC clients")
Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
---
 drivers/memory/tegra/mc.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index d620660da331..343ac0018eba 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -13,6 +13,7 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm.h>
 #include <linux/slab.h>
 #include <linux/sort.h>
 #include <linux/tegra-icc.h>
@@ -1010,10 +1011,23 @@ static void tegra_mc_sync_state(struct device *dev)
 		icc_sync_state(dev);
 }
 
+static int tegra_mc_resume(struct device *dev)
+{
+	struct tegra_mc *mc = dev_get_drvdata(dev);
+
+	if (mc->soc->ops && mc->soc->ops->resume)
+		return mc->soc->ops->resume(mc);
+
+	return 0;
+}
+
+static DEFINE_SIMPLE_DEV_PM_OPS(tegra_mc_pm_ops, NULL, tegra_mc_resume);
+
 static struct platform_driver tegra_mc_driver = {
 	.driver = {
 		.name = "tegra-mc",
 		.of_match_table = tegra_mc_of_match,
+		.pm = pm_sleep_ptr(&tegra_mc_pm_ops),
 		.suppress_bind_attrs = true,
 		.sync_state = tegra_mc_sync_state,
 	},
-- 
2.50.1

