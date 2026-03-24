Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010030.outbound.protection.outlook.com [52.101.201.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422753EFD10;
	Tue, 24 Mar 2026 11:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352553; cv=fail; b=WpsAwdpC6tGC3Mgq/leWTFTSwGYpFZDBzp3/v+4dgWJBY0pA9U7x5/OjdFxVPisQFuCmyydUtk6bhLCyLgK5py1BJVqP9zkn5a/8kz0UmZZB8rTsavk2QuOToIrPh5oyH5n46ejvdZYxaaVbvEShJVoxV1QYm+TaoEgzl3QNAlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352553; c=relaxed/simple;
	bh=KzQf2yOpcer7YmZHv8K7zBb1NGfCbr4lfIltcY/6LQo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BuX4QO9jKTXNxQQK4k49yceF2gJOBOifQyiGIAtpsmOv9w0LN3YGp2nmWMCV786+XFflznzfMeaO6RTKBiQik3+fhbZSLf/XTxZnymSto09/gjNZooBjXTjavltc0nXW1SsduhaM76NwCO2NWtKnT3ykN3gIRRZTqIktLZaSVt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=f7s4Lny1; arc=fail smtp.client-ip=52.101.201.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="f7s4Lny1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oi3ZL0YGnyhRzPtRbhfPgRs9dk3ywzp73rjlGLbfyzG8tgs9pEn/jIeBDlEXdjET4oEcnfVf9UAn9237m1HeNbiL6PJKmo2qhoKQEm6L7ZoepUaflnuDuoUIPjwOYkISdDmONILjrR1ao36pz4uyzduFCP2AdZKIgmCA/RDep2SbXYblF83DE/4LSU34IgcIBQpmSZBHULX/z9aetpNurXKb6SKKXFrDnA/hVbhQfKHuYs9jUmssgQfNJnLOt7f2S8XJV+RVhkqNIp+bWrSQ7rvtUaDTa3ttHSH6l1JE38Qt2o3cwIUHr23jMi71nMKLxACUpQuHTPkz/YX33ffdeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yng7wWy5g7HcHRM+xb40S3feZhG0nQLb2xNqDj2r4PM=;
 b=dX/ZXklQBZseI0dge4uRPDiLF7BbBgRCDk00bk6leCFiM8aQbgmBxB7ONZtN+BZ0ssZNGifP2+yEs6+spdlDT39UUznZ+El2wkKtQXHCmBowGnCqIi1hEmBSMe2WahK0tCcnYsrgnh8JPAv6kdB5RWzkrr/ZHHAl6Qb1cxERFFuID0FDmItB2IyjQCJv4WzTpLTE2ENsMLYZnYJ4aFQp6VehuKCdQxQrPj+2CgklNTqR9UYFeGeDQ8SIC3Rc5GVridX87hS14ULX0lYEQ3MQtqoyuZl7LNMRyx9/nZYJaiifViTiEAscaTts92KLchAdzjKFhm5fXNUUGY6IiLqscQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yng7wWy5g7HcHRM+xb40S3feZhG0nQLb2xNqDj2r4PM=;
 b=f7s4Lny1pO12Sbs1EhPM5qUpF892MSCfcu6pDWWFVYEfa0+CCnSX9z00bMxaUTPOs93p72pPqk4UkhC3jkS5iIKiJN5xmibpfia7TC2d7f6UXfQFOhRPlLT20KaFQkqCW/S2ptQg0CXhR+kApMEiyXBkQWLad8okdiduV7e885pB5LUHMKzU7eIQw6cZ+RJJ9LBI3epZCMTUMaj3zM3BABvXJ3l91ENQuMJxFo7gcUTq19oolzGrdfXkSmo7qpOsYpfv3Sorbmw1nvzJiaKPAMyWN8K1kMhi27lVyA9VMWMAD26gH7vorduari2NeLMd6flXDztIu3id/Nxp38rmSg==
Received: from SJ0PR03CA0260.namprd03.prod.outlook.com (2603:10b6:a03:3a0::25)
 by MN2PR12MB4159.namprd12.prod.outlook.com (2603:10b6:208:1da::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 11:42:26 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::5) by SJ0PR03CA0260.outlook.office365.com
 (2603:10b6:a03:3a0::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 11:42:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 11:42:25 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 04:42:09 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 04:42:08 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Mar 2026 04:42:06 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: <thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <kkartik@nvidia.com>,
	<kees@kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] soc/tegra: fuse: Do not use fuse data as entropy source
Date: Tue, 24 Mar 2026 17:12:03 +0530
Message-ID: <20260324114204.551879-1-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|MN2PR12MB4159:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a13236a-8bba-424a-38b8-08de899a6ba6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	17tGEt19ScJvHtXULHj9e/e0TfK4nC+GtQTDglY6nAqIPBpddxmFnhi7r42fURrnkDD9kFA8Pvh/pZWhsoRuueCsim2v0Xjk5xhRrmZkIvFV8o3sOZYvIDoySj/AcVKLfUYMrm0QJ6C11evNLtuctUjxjfdK5hx3DfBXxjNnX2QznPaGAougjFUMtUDFQ5wESEhykLofKqNeWKaTK7jb20/LSm8DP9twzxmxwilZknrLq1aYeEhjkwzKbXZ9UzRjyepo/aF+d6hx0UONWL6DvTJ5WdKrfEukJ4b+AY9nhJRNC9oIGYonTt8SgHPyp6nz1PPR8R31uAcF2SqoXNdambic4lBkwY4K7WWTKwksMscsAca2c1HoNAZXYIMm4RIoGKrbL8vWwZam2V/zO7upB4SrYPE33ofk0+A4gEuCaH8UaaCzJQ47ZhJSn+OpEMQ3TXQ0L1rheMquu2p//enRQbPSBDpBD2L9R8me0rRiPM9ZlWnvS3wjgaIVNtoB5ILzsAOU1XoTBVbkd6/VX4LVZe7/NN4uHrAiUdgtaNwvkjJRKr5zAz55cLHgMZ7rBuiVjRXtE3nudOHZIyW4Fj12WRkiV8FXsUb+3oABdlw+Is7TgUbdzpKxQhCdnqdE3TdaLj63UOzxjLDU922PPWKFj6gmmyPM4rpsQBKxPxcXXrOE48+dCjklzEgGHhBaQ16C0z2aQE/JItVPk1cLafK1TKzVBt9aaAyrjtf6OOokxPOmMNjw6roVAHvrYDrPdIKAXKQjPj9g8zCJJYelPHIvug==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	W2XyVKkiwY+Olu5XHim2wsGFV63eYqMZw5CQpLfGNwq6zlkUjPtDRuJTOgo0BhqkPif9OAKQx6z7lHrYTi7Xn3S0zz3jsuACIdL2cUG8jfkkoq1kkXKIiYRw1+nsGo3zZvO7a4v5PvGojXpf64OmzSaG3ar1eW4+8YPpNUtFUA3fNgCKhjRnpFwWABKrKkfDRSPIyz7BftICk0rbfDOwr9SVIYv0WV3xk2aQd0vPlaFkORhg/1b8DrbXId+AcmnHcdfNiO6JJPZ4/d/FIRo4P2N056HBw9J/zP79+5DVAz3CmS2Dvr4EdcFk/xdIXfVTbL8p86j30VSH+l0CU7UWr+A1597lrzo9elM6lV2Kt/CEoQoF31SJg5fbp/hrdjuY25ocR5A7ltc9IwtXz0NSIVD3TESPU3mOqFYCLerZ5WD2G/Zq1cs6g+PDiORfBpdb
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 11:42:25.6258
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a13236a-8bba-424a-38b8-08de899a6ba6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4159

Fuse values are static and device-unique but not secret. Using them as an
entropy source weakens the overall randomness pool because the data is
constant and externally observable over the device’s lifetime.

Stop feeding fuse data into the kernel’s randomness subsystem.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
 drivers/soc/tegra/fuse/fuse-tegra30.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra30.c b/drivers/soc/tegra/fuse/fuse-tegra30.c
index 524fa1b0cd3d..2fad8b13a3b9 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra30.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra30.c
@@ -64,28 +64,6 @@ static u32 tegra30_fuse_read(struct tegra_fuse *fuse, unsigned int offset)
 	return value;
 }
 
-static void __init tegra30_fuse_add_randomness(void)
-{
-	u32 randomness[12];
-
-	randomness[0] = tegra_sku_info.sku_id;
-	randomness[1] = tegra_read_straps();
-	randomness[2] = tegra_read_chipid();
-	randomness[3] = tegra_sku_info.cpu_process_id << 16;
-	randomness[3] |= tegra_sku_info.soc_process_id;
-	randomness[4] = tegra_sku_info.cpu_speedo_id << 16;
-	randomness[4] |= tegra_sku_info.soc_speedo_id;
-	randomness[5] = tegra_fuse_read_early(FUSE_VENDOR_CODE);
-	randomness[6] = tegra_fuse_read_early(FUSE_FAB_CODE);
-	randomness[7] = tegra_fuse_read_early(FUSE_LOT_CODE_0);
-	randomness[8] = tegra_fuse_read_early(FUSE_LOT_CODE_1);
-	randomness[9] = tegra_fuse_read_early(FUSE_WAFER_ID);
-	randomness[10] = tegra_fuse_read_early(FUSE_X_COORDINATE);
-	randomness[11] = tegra_fuse_read_early(FUSE_Y_COORDINATE);
-
-	add_device_randomness(randomness, sizeof(randomness));
-}
-
 static void __init tegra30_fuse_init(struct tegra_fuse *fuse)
 {
 	fuse->read_early = tegra30_fuse_read_early;
@@ -95,8 +73,6 @@ static void __init tegra30_fuse_init(struct tegra_fuse *fuse)
 
 	if (fuse->soc->speedo_init)
 		fuse->soc->speedo_init(&tegra_sku_info);
-
-	tegra30_fuse_add_randomness();
 }
 #endif
 
-- 
2.43.0

