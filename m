Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE9A204689;
	Wed, 14 May 2025 09:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747216266; cv=fail; b=jG1QpCTDytDuqP+BuJVrGKbNduEg2/RMJUpD+HLtWIJvAbfeUdo7SVtKMf4nLB6GonrtqeWMhhVT/CiN0AaT+oTPSXqxv4Eb3wjZ+frLn8U4ENd1bbqw8l3rI+vv2IlqetwDCEepuNIeCbYTuG/mOLft37INgnwbdOiVSEadNHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747216266; c=relaxed/simple;
	bh=nT/5pSxp9cGZCW2TeijDApQpinbeUizDSJxZuZMC5mU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bt2DzVrR6EGNfJUCWTBd+ZM6wF6GZNNsyO+XSSXSR0xigBf9O703qiVo8ANPbFtzDEl00lLwIDtoUPwnc0or0VUKtso0gxxLZwJUGeS03UwvK7AmL0X3jJ2kVCSQ4cl012z2Y8/7siv/BEEiRa1L9RkDy2Joh2rCxomWYUlncG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MqyKwEUa; arc=fail smtp.client-ip=40.107.244.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MqyKwEUa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YvxRHs8PNxUolYrhlQCdTETIW7DgOkT/slSIwyqI8Rd3mLjJqDEXkGgNWoRcNrOe7/sYN+4Cn1xpdC4sY8B3o0toNrQAWVn9EvAm7EBiw2SxGUeIDVqlujYm9cvNEnATLGW4tj9aW+XLGDO8nJw8mk/0W2lLuArumafBXQ6KuXDMAtFRK/bP0rbY52NviRiij99ZDCkjDGwyh9Dp1MylMuTKKel6n3sxqekxNwF5bqRmxxuaR2bMHMPcs+p8usQi9DEY7xVI9dOMoVQ20UY9VRzonjiM/SdfTH7mXQ41acgdz7LyzFvPBiVjJHjZ1NnOKhaYRQgvGjhALFOgIQpylQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7HOxFBCyN08cdPaUgiodCDzDtlXE7akFvKSzEK5OQg=;
 b=uopengEef4Zf8BM02B/aj02Md836tBUwEWVqLW9sRZjVPOzBMtG4O32+cFKYcLbmVndW6jR2f6FoWMQTI2TEWsiNz9hjO8epAYclxOqh+yaDKTyBy4mhmlYNHaVpGkAmTlEj2OIXKHyhNjgecpOwYcf5nsdMwd4NfcZ3gpn+A8ZrSv7j62d7IkFs5mI/WK8setMjr4X04bSwIKWvkzwxOmzgpEtUu4Ic2Apk3PFXlKM895hmG73DwZn7CxRzeFuEtUZ2+txOoAwtkXCHcUGBWqfE2XT6Lw7VfQwYYuyMxq7ZR6/xtouwS62sETkoMZvYKsUZt9jE+BnMJhdaGqTDQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linutronix.de smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7HOxFBCyN08cdPaUgiodCDzDtlXE7akFvKSzEK5OQg=;
 b=MqyKwEUakSw09Ur9NfaTjwjNBvKjFEAGj9Bnpcii3RCuNXdhRocaDe+sd8d+4fx0b6DyeIlMxg0v/BTlGLGimJT+v7JdX+fHbhLGDVdQ5UOnxVamQ89VpFOZirLvFCCezUtlBRUM/aj/qP+mfCH7xsA6AUniFPN+S8vjdVe2BjCaKNFSVjW2cQqJKC3tFjquuosRMzNmoh6d4nS3i6xUf7CjuuUe5e+AkdD4BAN488bmG3Y7ewYJMNdPWBiHZK3Z7Yfh1LuxKhzp8CbswA2xxnAHDA6mVmNuuWvAoTdT/UqZFwA8h40nFUXUj1vEiB14kXtH/yjlB3z4uFHlrAtWfA==
Received: from SN4PR0501CA0024.namprd05.prod.outlook.com
 (2603:10b6:803:40::37) by PH0PR12MB7472.namprd12.prod.outlook.com
 (2603:10b6:510:1e9::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 09:51:00 +0000
Received: from SA2PEPF00001507.namprd04.prod.outlook.com
 (2603:10b6:803:40:cafe::3) by SN4PR0501CA0024.outlook.office365.com
 (2603:10b6:803:40::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.14 via Frontend Transport; Wed,
 14 May 2025 09:51:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00001507.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Wed, 14 May 2025 09:51:00 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 14 May
 2025 02:50:46 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 14 May
 2025 02:50:46 -0700
Received: from moonraker.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 14 May 2025 02:50:44 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Jon Hunter
	<jonathanh@nvidia.com>
Subject: [PATCH] genirq/manage: Fix lock in irq_set_irq_wake()
Date: Wed, 14 May 2025 10:50:41 +0100
Message-ID: <20250514095041.1109783-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001507:EE_|PH0PR12MB7472:EE_
X-MS-Office365-Filtering-Correlation-Id: b4c7af81-1a22-4c0b-a5b2-08dd92ccd574
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8UJkuZsLI4R22YFfTc3aE2c5UmvZtvXnhZhjikdvTEoG8rNO/CUPyVSi0H2H?=
 =?us-ascii?Q?rXrn41y2UvgRqKoXX7m1dfrShL/nB6qwUMytgw756sUhUbf/UtOSpBfKW1TY?=
 =?us-ascii?Q?6PZ19198utdlpke3cfWK7Ubt5CT7gckr+Q3/S3L02MhPCuMbU7LsFYJsCvvT?=
 =?us-ascii?Q?4gOwo/MB16TbQTjfIt6038LFkVQnfvImzDvj+HrNySxsUliTo1gvREhY2dCo?=
 =?us-ascii?Q?VovCzF298R8eOLQRlHKLtJcE66H09fchnDwmlxQbHeE6piL8lxEez0eumx4p?=
 =?us-ascii?Q?zNT6K0fBte+Xrm8QDknvMWH4ZGoLvqqFn0h71bHHDdwixHe39ictZ9P4gB6p?=
 =?us-ascii?Q?ufIy4COZ6Ue1l5EB+cD+T1gHNm2lT4PHqKTCbScYEn5cZNEltfXHmITRcp3R?=
 =?us-ascii?Q?aGTksbQkvaV9YNjH9vzJt4fvKCsPANjT5SKM5lGwD8qQodiFztKG4NrXePtM?=
 =?us-ascii?Q?ZwkERTXhPs4rAmRCaN/Q3xO8NcG4Q2Pwder9AULpRL3CHlYpdeaGXE/UVbfa?=
 =?us-ascii?Q?32CkxMNibAyiCJQbWqUvUWm8vM9dzfQrCoQ9RUCWE/NHwiGEr1KZ4i9d9GvY?=
 =?us-ascii?Q?2es1fzGIqe1SJ8arMzJQgSdo9o4s/oviUhNksqgKVUmLbeXy0F++to4Vsrho?=
 =?us-ascii?Q?IFNHBiNgX8kQs+/QWLKxQqRCK7/ZxMW5KNvQuOw++zG7es46BQIFky1SOJ/R?=
 =?us-ascii?Q?+UVvxcBz1ik8MeO/6WWdVQhsFLXia3OkPyfYAjdr1T9GdG7h5RGjZm9DwZBi?=
 =?us-ascii?Q?3uSJ4lqxe2IMPBtYTjmODxSWj1DbyabCgHGxkX6M+yr5sNw8XuVZhHtfyrf8?=
 =?us-ascii?Q?VS0RG30nmQGJ+31gRHx5zZjjOAtdT5RQ10NcCLo/ZkwGcMNlWNbd3abrDPON?=
 =?us-ascii?Q?6d+XWYg00pivRVzwibtpuZDVXWLj6RPoFCotFafmNvmI2xxb3uRWB0a4wDju?=
 =?us-ascii?Q?ywMz6OdADrhUIP9OT4PIKfKseShggMfkthhjGQL1acz+aMbamuIKeYMZZgGb?=
 =?us-ascii?Q?2NIv9eobqZhwhekCtnL12hKMT/V/rff3yzhs61wh0WQwI9Z56VeGQTsNyd5o?=
 =?us-ascii?Q?zRIgsC4eGDGyeUe+pXHdJrZbzbOFhiOV6BVoeE796BB/YJrP4w5zAGWnDbnj?=
 =?us-ascii?Q?8lxxOGEdNiwHCWqCphbKasLisPMa0Ks60ShLMmPEnvFK0i46SIOLKB/07T28?=
 =?us-ascii?Q?jaEYJFQ0WTWGadfaNR8sYMvRkXmzUqpEFV/OCaLdUkrrnbIQF1bZuw+rTru0?=
 =?us-ascii?Q?bojlzkj8YixXPAS+0p+tiBhwrX/3wA2AeyuEsRHDE01mmSisGTj/DRPosN62?=
 =?us-ascii?Q?VLg1p3utiPT1LURIGVDhQyiNYJwdYfCkEsFY5JruabgSG5JjGiKUVhX2FedT?=
 =?us-ascii?Q?tW/QWQSeUOkOfV7aLp+XnbXLsr/D2NaBgS5llhsMA623Sz1R5eXG8r5FJLGC?=
 =?us-ascii?Q?0K+NCQZceXjgq21RLucsewsipTVWHRGPSSfkqLwIukXUlj8H74dkx3/fPqlA?=
 =?us-ascii?Q?SRj3YhMATNejgNe6DkKnXJAHJlT73Zeq35sA?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 09:51:00.7070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4c7af81-1a22-4c0b-a5b2-08dd92ccd574
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001507.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7472

Commit 8589e325ba4f ("genirq/manage: Rework irq_set_irq_wake()") updated
the irq_set_irq_wake() to use the new guards for locking the interrupt
descriptor. However, in doing so inadvertently changed irq_set_irq_wake()
such that the 'chip_bus_lock' is no longer acquired. This has caused
system suspend tests to fail on some Tegra platforms. Fix this by
correcting the guard used in irq_set_irq_wake() to ensure the
'chip_bus_lock' is held.

Fixes: 8589e325ba4f ("genirq/manage: Rework irq_set_irq_wake()")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
I know that this is in -next and so I am not sure if the commit hash
will get updated before it is actually merged to mainline. Please advise
if you want me to adjust the commit message.

 kernel/irq/manage.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 2861e11acf3a..c94837382037 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -846,7 +846,7 @@ static int set_irq_wake_real(unsigned int irq, unsigned int on)
  */
 int irq_set_irq_wake(unsigned int irq, unsigned int on)
 {
-	scoped_irqdesc_get_and_lock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {
+	scoped_irqdesc_get_and_buslock(irq, IRQ_GET_DESC_CHECK_GLOBAL) {
 		struct irq_desc *desc = scoped_irqdesc;
 		int ret = 0;
 
-- 
2.43.0

