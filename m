Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2040.outbound.protection.outlook.com [40.107.243.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206915820C
	for <linux-tegra@vger.kernel.org>; Fri, 17 May 2024 14:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715955998; cv=fail; b=LRbyt5shY/1+ioAuj2GQFnepY3fI9Ayeuf4vOUvCSEg2T8KjK2ht16oZ9rENx89JzAlyXYxVI+Kj2bSz9TnJhqX3TJHMGcbVN9JnWNbOmJ3M+Dy6yQnnckY5fnny3kdXzv0hm68ZV+1yHIg76GFIFQeY3Vr2BmJQU0EYlR/i1YY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715955998; c=relaxed/simple;
	bh=iJwxNrbklCDAZBeDRCIYIRa/lz2B0adWKHl5zT4RtHA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iBI5HB1A1E59oVey2Rr5CerkGr1D5hi+Wo6I56f5dgcGv9A728N9Q2F6OZf+RpPTrpJnjkkY20I/HohBGOYkEPYn0WZC6xK0XFOBnpr+AD92ztPnohKJ/89sJjmZoHykJgWsL8zlSgBqP9kkN4I3vYlsL4V2P2gRdV5zS2b/EYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WkQodcHA; arc=fail smtp.client-ip=40.107.243.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WkQodcHA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EUc0xTHoyeM7860TvokD9TtKJpdkNyuvdB2l4Uapxx0/z9aELZZ5vyLBvxoE0/zlJmMTuQ13RKG1OH6dP83Mh2JM9HD1/S/llc8JxkmETJ3Vmzml6/Lo9Y7F7qvjvkZZ+/vBXUWtPjEDvbSSXWPLuwn+Ecf+a8ugaKYp7IxXax0DAtftJwKpy5sMkLVOOuGtYVJ4PaPDgu1EScoG4KWA75w5wcHPnTJyGynFBfs5t1AReO61oyAPaV8ghuYwXbLMD1UgWFt/jgbGMC+iGXzebaEsN5Wlqhe093flxGyJTmIznnWY6LwNIxYn6I6rYqlyj5ANRrM9m7ZhC8cXpSBnXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0shpfNB1Nv7DntnGV0xWnzDSzBDa1ZxWZG+cXieMorw=;
 b=YGJQyz56fdXWAbeoUThpggP8sFyAb8NHOOe5zWAHPkdLRKgHTD0XKqO/nztvrbI+J5k2X3BZuXD5S1XZckNsa+aKsBSj6FTPzJuKMsEnJ6eZx6Eg6V91d/X22yv+OzZWbIMCro84vtCJcIYsGAm7nwkMxtWdQ9WIXUPv8bca26XIWieo3VpSE0VuYshAuXr05IQj7ZC68hF8542t52BiM7rEbKHOfOsA5j3KTnLdMcCfd3eOU4Pn1oHe5j0HxGq6tYpfZEW9+ULgPVgtOtQpdz4KDbPLzuQt6csJwnURDy3bq/Tt0Mv2dbAJGcIK9Y296GaXNpTCrDBAoqDeTmqm8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0shpfNB1Nv7DntnGV0xWnzDSzBDa1ZxWZG+cXieMorw=;
 b=WkQodcHAg0wfiJQpdnwXow3u8yaHmd0gmzBxX8NSvQDhywL/N2IEpMMTzedkwc0Vh+JCaP1kzvt9WdfHJ7MriCBt6iUsa1gL5l0lIBSotgAq4d7xO1sbRA/2Xj1a7b1TAWCEmW7VIpNeq1fcwxPX8fgP3R5SfVosgdCwXNfGSRPBjLDIQ1I7ZMJBtwnB94H/O5f2e+Lao5m3yIWfJ7+LueFLo+nxE986PLWmfs4pdyznkWcSYXGKXsGMw6+eze5NKAtmrweCnw5uHpb86rPziSkMyjh5gtNOWrbruvtD1xkn9+cVGJXDEge1PgoQC4kIHUd8sBJRb0QcH/ORjMCH6g==
Received: from CH2PR05CA0035.namprd05.prod.outlook.com (2603:10b6:610::48) by
 PH7PR12MB7965.namprd12.prod.outlook.com (2603:10b6:510:270::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.27; Fri, 17 May 2024 14:26:34 +0000
Received: from CH3PEPF0000000E.namprd04.prod.outlook.com
 (2603:10b6:610:0:cafe::bf) by CH2PR05CA0035.outlook.office365.com
 (2603:10b6:610::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.13 via Frontend
 Transport; Fri, 17 May 2024 14:26:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CH3PEPF0000000E.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.21 via Frontend Transport; Fri, 17 May 2024 14:26:33 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 17 May
 2024 07:26:21 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 17 May 2024 07:26:20 -0700
Received: from moonraker.home (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport; Fri, 17 May
 2024 07:26:19 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>, Petlozu Pravareshwar
	<petlozup@nvidia.com>
CC: <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] soc/tegra: pmc: Fix and simplify resource lookup
Date: Fri, 17 May 2024 15:26:17 +0100
Message-ID: <20240517142617.18685-1-jonathanh@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000E:EE_|PH7PR12MB7965:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e75fdda-28f0-4549-149b-08dc767d5a3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|1800799015|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CTa7QuSI5MYcFKJmDtK0cme+sDCa/ugm9wVVoM5w/euAdAG3rnReIvfTg45T?=
 =?us-ascii?Q?adHMo/qZk4V/oEBCqjWu5b6BmF7apEp6cfc+/CsqxUXjd4fnamJsS8CbPafX?=
 =?us-ascii?Q?3w4XZvBCiBtZOjM/0vuXOW2edA4mk167QdzsspbL2Aj/1zUK/I7qVo7Si9tH?=
 =?us-ascii?Q?2LfJAY1zj++BDlnWSNp01khFvJL7yfnfxHtDbPkuZdKaU8/18pB7ncxHZ05O?=
 =?us-ascii?Q?IMMZ11WANMbf4+LQaFfH9A7tkGA/YbXPzeO+f9iyWF+NIdvqIB3DwpBlW5Zc?=
 =?us-ascii?Q?Id4Q+NGoCC53YoItHhGaWPMBrxAdUOopKMOWsXoecy712bO83QqB+Ec3X8IJ?=
 =?us-ascii?Q?XOkDSnBRAqhdJBu5dVELiCybD1zH9TbpUFCtc2bMPxTs+PEWq/W+uC8tKi29?=
 =?us-ascii?Q?HhI5DeCtMwc7iAn7QPSkoY0v2G8L0qNtJzSnmmHu4xbHNV11WCNi+rcuIn9D?=
 =?us-ascii?Q?CNBfpSAxH3cmui3TnMALSB56NjrQJZU4A9V1343N8B2dWyMKGjd6b5yz83WN?=
 =?us-ascii?Q?/65enPQHS4Zp/DEmF3T0In41js0/s0T9uIzZa09u0tAX9wJi+5me9wkvqHKz?=
 =?us-ascii?Q?M1nzaMnVmCIql5xJbhdyGPAFbEU1NkVhfWB5z8gp0JV4QjGoQbpoQT+hQ6nN?=
 =?us-ascii?Q?MsnW4gynYY2GwBjZcdp6tJd5DlxufFXcQY42XLPG543/zJLjz1cbDzIPj+UZ?=
 =?us-ascii?Q?0zy/8w/l6vBWFNhTmvOw28GMGNUGdubIR8dvAUbb53GfzrnxrJKTmYKmpwjF?=
 =?us-ascii?Q?NLF8xRQTRRfySeUud9tDjJidIsKPQyI2EOqN98Isxhk5aRMX7fXaKucVD+Xp?=
 =?us-ascii?Q?leRmwh4m8EzXxKA8IicoaV7uddyBndRVM2vmyRNRgRJ1E90QL0aWK6KfmxSe?=
 =?us-ascii?Q?xoBS4TLpTE0LvEsLoFO7BfjKLcN9QWRZ2gFk67W6U8lgWsJxjRNjw/ykgfFG?=
 =?us-ascii?Q?5Jn882SzDy7evxF6pVoMRfimPO0KYMnmBuso3CbIYugq6omPRNv6GmlNBqWK?=
 =?us-ascii?Q?roFRf56b/y8hryOEK7CBBVkzeAK1snZdmg6RrY3ENLxDMCaUoISiqxizgEkH?=
 =?us-ascii?Q?4osLmbTTs6nkXnJwJTtZ941I74vmBwCxUDXpHTTraNOXJpXa+Ns/jNLQ+mHE?=
 =?us-ascii?Q?lsDWPjfn2ZwjPIGBalsfd4hXSqatRBcsQdXpWRSNxjdWwelMEzXt3E08DS4P?=
 =?us-ascii?Q?Yj3XTYBJoYmhBWqJO/ZV1DheMI7iccyWCk9ziFnEMLvxwAOzMdYNeC1SsJTJ?=
 =?us-ascii?Q?6+oZmTBp/VaEKvvFqPrBn8FXmA8mA6lHbQKABqEVSg0hyPaj/u8A/i72kpZ+?=
 =?us-ascii?Q?C9TTImKAfUicwIZvAJMD0AId+yJwiB55OBMyEAM5HbmUue/Tpoxh9Rh51/St?=
 =?us-ascii?Q?IDNjiqdehxSYuAGek/vq8u8inX4K?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 14:26:33.4859
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e75fdda-28f0-4549-149b-08dc767d5a3b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7965

Commit 6f4429e21a7f ("soc/tegra: pmc: Update address mapping sequence
for PMC apertures") updated the resource lookup code in the PMC driver
and after this change, the return value from the function
platform_get_resource_byname() for 'wake' and 'aotag' regions is no
longer checked. Fix this by replacing the calls to
platform_get_resource_byname() and devm_ioremap_resource() with
devm_platform_ioremap_resource_byname().

Fixes: 6f4429e21a7f ("soc/tegra: pmc: Update address mapping sequence for PMC apertures")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
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

