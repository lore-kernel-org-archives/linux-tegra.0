Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010057.outbound.protection.outlook.com [40.93.198.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C26D2FDC27
	for <linux-tegra@vger.kernel.org>; Fri, 22 May 2026 15:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779465543; cv=fail; b=mDPiP3ONlpklGYRA6AH/CSWo31y+R1hfOyGuRjrTG89bpgnfpMVjwra/vPEQvONcu6V9zbQk96k/qr4wWctb1A7wXbkXOm9j+JgimLpcDyv5iQ8XZUXTOeNVspZeRXvdoQDeC2m/5/cHOhu3r6mB/XjFAsthpUIHcem/IDrYJXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779465543; c=relaxed/simple;
	bh=o6n95cgvsF4EYyevfr3yHh0H42qpw9/z4URmrc6F2Ps=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=S6ezMswNOGxIHlPIn/HRmuYhkdbBwDi4/F+wuc4uWIPx7Y/nbkHK/80+kyWYnpcnRA9lrqPO7PeprR5EzsAnAl5Bb2yZM+H1KX8Y1IO922/vfB/EP7y81JVWyGEIeuacLHY1cg3HLXz/wNH0LWm4czpGbhs60iupfb0C/pL/nOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jq0GXRGE; arc=fail smtp.client-ip=40.93.198.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jq0GXRGE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hZBN6bLOaRmNNpnBeKusLXPRj+mBuP0J78dYZhBBb1Zqsi3oGo3DeLdX4Tl+aT1vb8Rqnw4i+meTXLL1wNYFLpOQ59eEWZ9v+d+nbFY4meU+dmRjz+jpYrfOtIvReCgGlJv26P8onEgNZKJr7lg+9lrEzQWAUedMrYzi5DmeogeBbo6N0lYFh/GgbKEsgVO9mM1+abZlerpevPJkY0JI5Vkcr3znVqnzVjX1nqDNyOcFAPhxkqq+UZ6c3WWAayWmG27i77O/LbsuYOfcXdgUihNYrbpApGi5bbrkCGh4/Qu3KhxVP9NFg2ZbBBUY9KqKrozN3WCJ89qUxaKR+csdUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1IfMuCZe+iCQ6UELQiU0Ml0V0JrMwy9cFavuYk3JSg=;
 b=k/A8VX+n/QCmOODlkL2pH8j0wVQpJzYIGGi2zqXYfEJ9llLuAcmPOrf857h3OO3Rirzl5Z6RVSOdHMWF/u7VDGWS60Om6SQPUKUMZDtHZ+i0IcsilCHS8bSfZuOzUyKwf9Ct2acUFKTmlsfetFi1MKYO2WEb4OO8hKFIeF6EN7QpelWw30py5ED0emxn/lgGOWbcOSh/r0JyLBoQPMjr9khOSTgarDB206rOAcgEfunhCYGBfIya46aN1fsi+gak/eRT9m+4ypybQBRATUkQNI/6gM9HvY+h+Yir0yepEe8Lw6rbifQ0NnLRnYaGvwclwoyftCmRgMPSNYWCGTUnxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1IfMuCZe+iCQ6UELQiU0Ml0V0JrMwy9cFavuYk3JSg=;
 b=jq0GXRGEj0japI27rqiUc4Cm0k3y946Rno08gVwpC5nvBzk3GyFvMyTa+Rj1zq49F/+I+g3sclQBY3Uod/cjA64U+iaS5klXp6knbZL24WMRs+YX3tAyuIZaR+ygFYBmk4BPQ+21elcZj5tQLgy6cShHYLgxzf9NxJW+QJfYywuYaGuK7fPNB7WVPTSYthdZPHzjkUA0WS/XD17jun87fdg2LxCS0qs84qFh54fF7PyvUStxU2Sqwm2XCKqBaWIhNIMiMQTn9CqdVUjpxQb0rPTOD5ta0meTUVd6fDwYfGPoGJ3RbqyOf3s/Yyuqwup4BLiWAfH68R6FhNYahGzBbQ==
Received: from DS1PR05CA0012.namprd05.prod.outlook.com (2603:10b6:8:457::9) by
 SJ2PR12MB9190.namprd12.prod.outlook.com (2603:10b6:a03:554::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.17; Fri, 22 May 2026 15:58:56 +0000
Received: from DS2PEPF000061C8.namprd02.prod.outlook.com
 (2603:10b6:8:457:cafe::44) by DS1PR05CA0012.outlook.office365.com
 (2603:10b6:8:457::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.9 via Frontend Transport; Fri, 22
 May 2026 15:58:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF000061C8.mail.protection.outlook.com (10.167.23.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Fri, 22 May 2026 15:58:54 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 22 May
 2026 08:58:35 -0700
Received: from moonraker.home (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 22 May
 2026 08:58:33 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>
CC: <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] soc/tegra: pmc: Populate powergate debugfs only when needed
Date: Fri, 22 May 2026 16:58:24 +0100
Message-ID: <20260522155824.76002-1-jonathanh@nvidia.com>
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
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C8:EE_|SJ2PR12MB9190:EE_
X-MS-Office365-Filtering-Correlation-Id: aa4f8ad4-f5a3-4b26-a009-08deb81b06bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|56012099003|18002099003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	05TuMalGnNEZFQ50TfXAas+9QXwGrnMtpbeY6eCXqQ2oZmAVkWhfZ7p88DGJHk123mLvz0uEUbQeq9MjANwZqP7Aj+ksspwfcBfBq1ka9osT2YLwLE2UJl95wXCyZMP+dnDVy8LcPuzcUhCNyR5UbNeN9NnjiPd/Kpn5o2cljEUuruKZBmHu4kGWO8p/UV6Zhg6QwUuFnyAS9ZIYyKfBuk7wDu76KNkBZmLJxRBKTBvto9VrNMXdw9gg0MDZyBnPBL1Q/Ujx3LZXEDUAo8Z6fxgtx+ESiDR9FMyokUWSTulBu5Y9W4iU4MrjsaUlBy6ZBFsVfsYDIq7wlDOQmBozRK08n9K2QMWmBn8sVbgjfJX8Q/jjo+XzjymdS7U753zZRd/mA8jzZ33bRmj+9CLhNZcCdn5fpplLymjUUeFCx/OH/d6gssW/4CGCCGBaXGoq0GXwFlpuDKEkW8eavzmWbLoyowLw/MMdwZMilp0sY4e6BXc/9GqyqbXOPwfKwXSv/66IdEoZR/WuGUvyIiDFcJRkRjAgUgjpC85T6yKk5qI1aJOZKOnGS0EhAo5iS+74+yHx6xspojjiDe71+t2wUH/VNSpyFjJJlTDeFnCG0Zq+MZ1WzK4wFNFO4lFApmUTX6b9aHTWyOrzSRJuA/oOVvV07f80Go3+oSkh7CGQqAxY1MUHdUeJJAu36s2xo+b+L+rKy7jj4XpOf+fsi8yuzixuPZA8G0iAQMdcaoSa+vA=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(56012099003)(18002099003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	28qHMITqETvnh6KkaCb4qT5U/0e5dywWv4l7rUIBskOB1e81/VdFo410HYcobPaFJooUz+Qt19QD3E5fRwVSmnvmRXVRCGV8U01MA9h6WDwjvhjZUV5b1VEgWrTxJl+iqNW21tOh3U8zlIJdc2XEoeYYNxbN5fBigzI5X2IlwPIO3xuU8UVVuBWfGO6zYMMdUHG4Pk/qj6MUWifca5tPbtsTfz6JSQyoX9/0pkhcQ9O2oo1joLfTU6+d0f80p9YRhABXPuNhI3GdepjTkziiJEduRU4HKaVW7yKmFpPBCML/pfCSbWXlscmPP8/loPAFMB/zTTvJUTy+uDm5mXObEEzSgtnBqmmbMs177S1YN9bj6MgpAzzO6GzQvBgZ8H6f/oI4LjcV+s8+CrRtsRlcf+WUpdu5dgnJIMeZHFgu037bmnDTjtiGTokElaiSiB/H
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 15:58:54.8486
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa4f8ad4-f5a3-4b26-a009-08deb81b06bc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9190

The 'powergate' debugfs node is used to show the state of the powergates
but for some devices the 'num_powergates' is 0 and so it displays
nothing. Therefore, only populate this debugfs entry for devices where
num_powergates is greater than 0.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/soc/tegra/pmc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 2ee6539d796a..3f9771dd22a5 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -3284,7 +3284,8 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 	if (pmc->soc->set_wake_filters)
 		pmc->soc->set_wake_filters(pmc);
 
-	debugfs_create_file("powergate", 0444, NULL, pmc, &powergate_fops);
+	if (pmc->soc->num_powergates)
+		debugfs_create_file("powergate", 0444, NULL, pmc, &powergate_fops);
 
 	return 0;
 
-- 
2.43.0

