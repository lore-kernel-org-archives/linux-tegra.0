Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2067.outbound.protection.outlook.com [40.107.93.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39172172794
	for <linux-tegra@vger.kernel.org>; Tue, 11 Jun 2024 07:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718092591; cv=fail; b=nZk8cjhoR5kobCr6eSgWKlMMppmQ25yeGK83tFBsgXBDm6SCugwg5+ZocerNCOhcLYs8vUSNMymiyf8YnEjQc55xBvPemo4Jzwkmh29zDNmJNaIsXcZpFS/Lh+FA6YBDHa+690RvrvMVJcPJbC0zu9wSZOLIbvG1f9xkRq0Pvkk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718092591; c=relaxed/simple;
	bh=HD22XPabmz5Ef0AJCCaWVaYNk5yMzOSnz8hNPpiu7Mo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jy2xsCSO7oko6k4Dr1+dm3xXnqmACzmoJ8xARB7mAzYKFkIMe0syPptf+QDq4ssaqrXqLZzyQCXLtnVRq0ECBSaw858LvH/rZlf8DmUlch96F6pRAuJ8T8x6HIah8OMjwTfpbGLzuthEl2GYXB8H05WX/8ccc3c+rT47sdHoWh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZQuG/FI2; arc=fail smtp.client-ip=40.107.93.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZQuG/FI2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KjFUZZnaHJhR6+VI7eYOMI2xbmMuJbGcGVBwONSIUyjdASqNxHydQaviM4xxBjyEgsSoansr5xfhupOBTK+6Ps5lqdsFGonk++APitbK2dElU5Wf6F6xbpZ1MVSBnzdDKsf48B/XB5waF1rBx4qTbHnXj5enRIZb1ne/7lM2HoHkIBwVduSrSsjpBGQe2xhuThmpl5TJYf96aJXfw5CASJZLndSfG0RXW6DiurtYOcKCylr9PSo+D4VYP5Pj1eVeRmgti0HZOObFuBob15z5ui18ushGEmhU4RDN+oeJNuTK9PhLf1dxmlZgvfDJ0f/rKBRxN+3s0zD7aFlCBX3TMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YpK5+xXnGPGopcg8XfwA9gIL+8BbiNPAgwMGOsEn9SA=;
 b=HtPMyyjWWz6ag3XXB5VYW+LUtFvP6844AId8/3d/bxY2LVy/CkpXI+AY181heFbdL/8Z/FJVML7ehPhv1NfQ0pL0JXitPZv/AnjtTbDZBo/n9GYYTHDC4Uj2+yyHTpYOViuDxqDjV6LdpadOShlIt/5pXxjnc5eZMrLc3cTR7NKI+V22SPvSlRuTG9eJ/CQyEspm4XtGYnNo9h9+CXfqByayWsfyEYEMKSZnENd35CFfPApITxg3tDnMFlE0dqfboMSki5RSGy10w/YPWFym6/Y8f74FgwskY1b+OQsSQBfDRj6jTPU9kp9Id7SXAIXqpGIqw2DE33LdG6lKd75giA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YpK5+xXnGPGopcg8XfwA9gIL+8BbiNPAgwMGOsEn9SA=;
 b=ZQuG/FI25P2QTn1f3qifSHHD2pseeM3d7wtHkJHblWtLZwTIK5cJC4OBYFwFJzEWpkPWCj2avpe/B2DGF5OrQINZzSoNpBuftA2B9eb2O7XXoah2PCds4lhSKqrQUWllTkDMucbQgQikfAoRMRQrv2FtFVgO40HGToDXoPdfrvCDziPJObm2gYNBbAPhXOl4qfhQplDBMSG+rBxQlZufMeY4WaupUqUhUEUy8y6Vsp9BsW2In4at+zOz6TaFmHvyfLBICHU8CO36hom63yS7fWk13pb+JvMcSM4+U3t8WMNkQFrjF7oSiif7svbLSrxg3yXavJDmvS2khUlAwgXtzA==
Received: from PH7PR17CA0029.namprd17.prod.outlook.com (2603:10b6:510:323::23)
 by DS0PR12MB7970.namprd12.prod.outlook.com (2603:10b6:8:149::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Tue, 11 Jun
 2024 07:56:27 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2603:10b6:510:323:cafe::37) by PH7PR17CA0029.outlook.office365.com
 (2603:10b6:510:323::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.17 via Frontend
 Transport; Tue, 11 Jun 2024 07:56:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Tue, 11 Jun 2024 07:56:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 11 Jun
 2024 00:56:15 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 11 Jun
 2024 00:56:14 -0700
Received: from moonraker.home (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Tue, 11 Jun
 2024 00:56:13 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>, Petlozu Pravareshwar
	<petlozup@nvidia.com>
CC: <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2] soc/tegra: pmc: Simplify resource lookup
Date: Tue, 11 Jun 2024 08:56:03 +0100
Message-ID: <20240611075603.65118-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|DS0PR12MB7970:EE_
X-MS-Office365-Filtering-Correlation-Id: 065f9f29-ff2f-4792-802e-08dc89ebff41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|376005|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zrR7t87vhDQdmEaErp9BktdCfgYfY3TzEQbnZV/n11mcfJ0tKRV8E7q4NZny?=
 =?us-ascii?Q?lNS8b58xx1h5WNcfpd6kfDtyGlCGKrl8Ne2JPcpqHq5uyOyMxTqB6rhkKG4a?=
 =?us-ascii?Q?krN/yecrfz5ylvf05PLXDHCWYotX57HQih2irNkufTXS6Ax7gQQCXgWWEUOQ?=
 =?us-ascii?Q?eFskuc1ToMSqbdRhx4bDAchZiWRFAGNPpC4b4XDDmX9dNJB2yZkD/HQp61Cj?=
 =?us-ascii?Q?DwxT3E8aZre3qJpK/sY7L30ACvyorNVDtc1mL+04dx1IdmLc9ae351gtDugg?=
 =?us-ascii?Q?G2nsy/UWXRvuXneGtV7DQnsU4KSpC3BIB0CNqDC2STIHn9NZozLZH+LV/gLn?=
 =?us-ascii?Q?nNWFCc4hrInYD1YueLqaKPkd6Df0fGfs9w8W3/LN2voE7OBMDJxrcK9Uo5Jb?=
 =?us-ascii?Q?gkjw4cRNT171UoFzuskdpfc2wrL9zSYiM79NtZDiyHuAaD3b1bwKnIQ5cKvT?=
 =?us-ascii?Q?La/h9vS8OquerrxvMmU+e1yE6AnrvUoxiYeqdHCE+IF304S1mxRymps2Mtfw?=
 =?us-ascii?Q?ZpOfGPhS1d3AsXRTmaa24hAPsXSgIVEuqX6eUMP3EXfL3gbZS27+hvGycs4c?=
 =?us-ascii?Q?9UpRvhn6FK1UOtVsTejfNxnNHUbEmIfDzR4rlh5diyLPJMs4YEQheeng4jWr?=
 =?us-ascii?Q?QjK/s8anVQxS7DdCYLqHyybPsyBJVEhArlNrVd84ULKcShmFQlHjLn+qCXug?=
 =?us-ascii?Q?zTURiNzFOQ1chRaSmSqkUWOy/3jHD4VieeNoHjRHF0rZd5IwYXprI2RkfHR7?=
 =?us-ascii?Q?4PECCHaG47DtJrfDaHwsZ/px4G+BwV/GnPALt2eLMTIsGWA3yU0FhDpJYpbt?=
 =?us-ascii?Q?DOfK9xQzmC83idYgjpLQOUebSKQKaFNqlQyuEPqlOUwPBEqrDGoDw7PyNWJ1?=
 =?us-ascii?Q?PAor7rBpbpchAkBs/jlnPM6T2sst7piiKCapNnZGZOwtN2H3Sv9s2JWV7I8T?=
 =?us-ascii?Q?gxdxAVXGxtTPkS/bAZ4pv3ir+nQGC6k4EpTWvBFA8rU8sha1zSK87BEnpowQ?=
 =?us-ascii?Q?iFvaZit2iqGUdKs8SO1O/9/nlqzptJKFKFesAkR/4IvgfvyNxJAQ7OEUMeOO?=
 =?us-ascii?Q?Rvr8w52wSwkHpSZiuz8Fb72cDhZBd920DnK13rU7NNvfBRrD/y5vI6roLEv/?=
 =?us-ascii?Q?0/HvcISzEdcxkIqTt8yRGI4oSFnA12TQdqbnDJPFecQ4IhvwieQmwkqqMEF0?=
 =?us-ascii?Q?9xWUMrBtX5oIMin3Xoccr8rZ6DqwKPnLaOQqfcMMDgchCkEVgsruECTQLUR0?=
 =?us-ascii?Q?HodDmZOuSyJKpdOozMJVn7mJwnfcswJJsUKGUAZ54tsGKgcPJFHnyiv4vke7?=
 =?us-ascii?Q?WpFTNbMXusf2pKzD8qfSFztmkUko6LMWBKloRkg4F9PkN0VmWH0eefUFBt8v?=
 =?us-ascii?Q?3bhhC2xXJGuZ2hZVKhmjSQZhywYOUcxMYFQikbZsNy0f0tH9cw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 07:56:27.1007
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 065f9f29-ff2f-4792-802e-08dc89ebff41
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7970

Commit 6f4429e21a7f ("soc/tegra: pmc: Update address mapping sequence
for PMC apertures") updated the resource lookup code in the PMC driver.
Instead of calling platform_get_resource_byname() and
devm_ioremap_resource() simplify the code by simply calling
devm_platform_ioremap_resource_byname().

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
Changes since V1:
- Update commit subject and commit message.

 drivers/soc/tegra/pmc.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 91d0ad6ddefc..6c37d6eb8b49 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -2891,15 +2891,11 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 		pmc->aotag = base;
 		pmc->scratch = base;
 	} else {
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						"wake");
-		pmc->wake = devm_ioremap_resource(&pdev->dev, res);
+		pmc->wake = devm_platform_ioremap_resource_byname(pdev, "wake");
 		if (IS_ERR(pmc->wake))
 			return PTR_ERR(pmc->wake);
 
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						"aotag");
-		pmc->aotag = devm_ioremap_resource(&pdev->dev, res);
+		pmc->aotag = devm_platform_ioremap_resource_byname(pdev, "aotag");
 		if (IS_ERR(pmc->aotag))
 			return PTR_ERR(pmc->aotag);
 
-- 
2.34.1

