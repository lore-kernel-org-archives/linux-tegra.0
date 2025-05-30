Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E63F221F2E;
	Fri, 30 May 2025 13:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748612079; cv=fail; b=l3BOGyDO55MzamUk1e9f3h+pqW6mQAwWCtSuChDCuHau7quwU+qPB3TpZMsdcZMd/chPQeVNA28ennZnHy5WUbO4W4Ac7CRK/J98kUTCglk2nY+ukgsMCzK2lZkiAVq4teUtqB+Y1bYyQ2ZxgJDLapsLo3o+UuxvMY+HykHPNM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748612079; c=relaxed/simple;
	bh=Kumzdb5/svUa3a9Ux2XluA+p8+adP34LBGm2XB8WEkQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WbwGEtPQSZNP2NMYteRBz0HPBrqESfylF6CnbQ7Ff1ZMEtnRJC0OVBmTpIN6j9NQPccnqcEzbnU9qZgKiKKfnD5zb1SfP8SmM1b+d7WmiLw3AScthRBDA8GxbBYUS8UyPw+gGSlUizRxRaIkEfUMS4/URljy1ZqGy2wOP7qG100=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=t4wVZeS/; arc=fail smtp.client-ip=40.107.93.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="t4wVZeS/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IAvi7Y0gNcq4XmJrIX6BezwvzahmkvDdkYHBD2+JgiwmMApFchSv61B0N9ePvggIvSk/rzyabz8S696nqcWq8Sv5W/imQzqXo9wWh3B/1g3DYAdLdoAjSZ1tzy6V9/VqoBLfHYD8URyrkRnng/2C4SxXx+9wKNndGQ2FIsKJRaJiF6Fvi1aIMNSMF4o44XMss68qmpjVrMtvg026vSA9pya3HaravM/j33CfUnk9LIug4UYDEG7QqVzJzmSg6ypD5WkyX2MRwxqwHYFfgFG+rr+kwdY+Hq/bTNnBG1IebDiK5Bxo1ROaXLYRrPyF1iVMujFrhPedQW4z1oJZ5VCqBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VA1NsBbg0UsGo0lP2yT2kXkmCRBNvFccvOhb8w/De6o=;
 b=wSnpK85i/A8FkvJuehuU0soz0PBIEgv/SwwW87MTFpzlSDSy0nZwX9Bf/JWbb9pCzMfPimmuB7JRjY0ajD3WgzfsFWqG+yXJQENWAzbVNbjXcsHzEueBcBzH0XL+dQOrQvFM+CtCzoH/3mjh1HBs8qw0vEfx6uQm+3i/cMTfbGTGu74UoNpt5T7qvE37bdKf7uH8h0ikVi2M/g5ivEiwz68wLYFpZVOd1zsmS5lhh7ncEjfkF/vk6EdQDgfmiOWMu9TzqoRB0EriLyfTucbL1bonTDnFLRIfHiIz2gIzOkL2tO2ToGLiHXowZvC4nJUD8OieaPilHQe+cy7Bt7WrQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VA1NsBbg0UsGo0lP2yT2kXkmCRBNvFccvOhb8w/De6o=;
 b=t4wVZeS/tMKrqmWSx4Q3qzxdpX7QAqfXBgEclz7DpExMliwGA0kBQDQj3lwOvvuokUj/2Ej+6uWdVGojWh+5/PbM+b3HH/FaGVK6BqBvDrrFxEwXL+iQAmYc1L6zGZah614HUNkfB6dH/6OGrb+IUegBGMEbnjnb6jCPTJbkTgMzrlcNmJ8LHvzBj/VHjLiagphka2loxZfDP/a3rcU77QUICEuk/PLx894xPWiZrrUfYgIyr2ou7OF62HjyWovQc+x/DT3Y8btbk+t9xW5n32mQPuUq4INUAc7weI4JzJJ/UraF/RhdqBYXvKhpbX1tdYYlvVQxVN/X028Ym66nZw==
Received: from DM6PR06CA0088.namprd06.prod.outlook.com (2603:10b6:5:336::21)
 by SN7PR12MB7251.namprd12.prod.outlook.com (2603:10b6:806:2ab::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Fri, 30 May
 2025 13:34:35 +0000
Received: from DS1PEPF00017097.namprd05.prod.outlook.com
 (2603:10b6:5:336:cafe::9e) by DM6PR06CA0088.outlook.office365.com
 (2603:10b6:5:336::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Fri,
 30 May 2025 13:34:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF00017097.mail.protection.outlook.com (10.167.18.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.18 via Frontend Transport; Fri, 30 May 2025 13:34:34 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 30 May
 2025 06:34:17 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 30 May
 2025 06:34:16 -0700
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 30 May 2025 06:34:13 -0700
From: Sumit Gupta <sumitg@nvidia.com>
To: <treding@nvidia.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <--to=tbergstrom@nvidia.com>, <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [Patch 1/8] soc: tegra: cbb: clear err force register with err status
Date: Fri, 30 May 2025 19:03:29 +0530
Message-ID: <20250530133336.1419971-2-sumitg@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250530133336.1419971-1-sumitg@nvidia.com>
References: <20250530133336.1419971-1-sumitg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017097:EE_|SN7PR12MB7251:EE_
X-MS-Office365-Filtering-Correlation-Id: 6caf1d49-6e69-4910-f271-08dd9f7eb77c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1Hjdu3g8B0NXm3oNzJGwMrCpIA0uTHDQKFx378dk/eV2v/Tta21uSdMSWhMg?=
 =?us-ascii?Q?j6Xna6MkEhXgVedk3uvZNSwO3gqfrRDBo6Vfhnv0jSAFfFGtXx+areauzC68?=
 =?us-ascii?Q?cxYYu+g4xJB+WxiThwzElCGZVBTJ+qLa+QayXkvijiD1NGiALaWuAkSSKmDD?=
 =?us-ascii?Q?M5KQChGoqOY9VepmfBRA9a6RahQk5U9v66XmjPtaZjmZPA/Q4JK3uGJc5Gzz?=
 =?us-ascii?Q?0eYzKaFVvnYzao05JNNzliR7N3ZNOhnJnWo+yYNhjC+uYHlB1jQgPaK+K8s7?=
 =?us-ascii?Q?6a5UgLhrXW6zUbXFYCQ8vympAU6h+VURQJ/dO9chGYzmq7WzxSx8EFi2CDco?=
 =?us-ascii?Q?+/DOk+p9zShsjtbKYsUklkLma7PV1fNatIIgQDEPsrWf30lVeMF9d52AGF3T?=
 =?us-ascii?Q?qhQkldasiImXT/eLoNvd7laUM1p+RRpyiAri+6lTgPkJMm0q6sLWjS4Q3yx4?=
 =?us-ascii?Q?uNWq9euPSRNKHzqB4TloYK540qQH1o4lVhapCxaUce1b6i5WdVcfrrqj4GjI?=
 =?us-ascii?Q?J5iSlfSvIBO22q6d+/kAEmRuzFGJVZdkz34cP3HV2Jhn568ZXCotfUUuzXAS?=
 =?us-ascii?Q?8+I/1BljiCc6yaJm5oqDfmoC+5fgMSn1G21qtfy2Hf3ZQE8es/0PM0pDoqjF?=
 =?us-ascii?Q?/EJel7gaLvVlrihdm905fRECWiVg5mRDILBlhq1vtgSpFUFoSQKNwOixIVOV?=
 =?us-ascii?Q?7WqbTG/TKmBwSkDks7mcOhI5fKlANzfkDJHZYZ3zyAq/EROkA0Rb36g6vN48?=
 =?us-ascii?Q?X7bGMG7m/mII7ezTzkq70ZiEYyo3Npr6+WqohYbjjKTceJboYDs5mWApGEfM?=
 =?us-ascii?Q?ym8+ZX+s+dwLrqD2Ej+JLZ6Erf+GVMwbgdASfVTCAtG3LrXFToD7qF6NPooS?=
 =?us-ascii?Q?Q6SZ/pcTSFXXvQH5LKpXlMhU5jg8DnPaUZWgm8nDV9iOCZWr9tsXN6tTmIaz?=
 =?us-ascii?Q?mmSAeLolZEHBdSUcG93wEy9jaWTEfN/9V3Qq1M3Fk+mO2W/AZpviq07pWPDP?=
 =?us-ascii?Q?u4LZlrt1J+UqxIzxj/EnlJNvI2hbFVuhQSN5hO1kzhNLWqrUY8PAmhUNPRn4?=
 =?us-ascii?Q?FvQrfmPbU47N5Y5Fz/TzCo8dALsWs0YTd/aeglW6a6A57hy6Ytd3dO2AB85+?=
 =?us-ascii?Q?Fm8omT0iGLPLLudU2Q+YWgRtEODAHp/nC9ehbXzCBre021nYqyH3H4ASXjIJ?=
 =?us-ascii?Q?JA0Hxn4z8UoJ38gHleFYXuNa7BqI2CYSc23aWXdjNDQvVpxjgaGt8bdfbegU?=
 =?us-ascii?Q?PGtpaV2Tyfd4htb4EgmyKV1QSRFdp9MmSwi2XOsx33eH2e/pXpeYIWVkSdyC?=
 =?us-ascii?Q?ZRiY2t7dMYeuiOI5M2+k/rbT+gzsNrco+1rPWGMkhXgom78RyTv3LKagOaFZ?=
 =?us-ascii?Q?iexruQnyGjCx5kxbkJOwghwIVXcjEB6mrdx4Lg15p+i80iSZnnmNIwRwO+pD?=
 =?us-ascii?Q?2OwEr7R6y9LtX8lTvi7da1WfL5GqhvW4OGfAiAmZpGfJAx8ErJ/n0PE39Is+?=
 =?us-ascii?Q?5dPLY6vgjP61nuY2GNgesvS4e/Dcu3fSSs4S?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 13:34:34.8570
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6caf1d49-6e69-4910-f271-08dd9f7eb77c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017097.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7251

When error is injected with the ERR_FORCE register, then this
register is not auto cleared on clearing the ERR_STATUS register.
This causes repeated interrupts on error injection. To fix, set
the ERR_FORCE to zero along with clearing the ERR_STATUS register
after handling error.

Fixes: fc2f151d2314 ("soc/tegra: cbb: Add driver for Tegra234 CBB 2.0")
Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
---
 drivers/soc/tegra/cbb/tegra234-cbb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/tegra/cbb/tegra234-cbb.c b/drivers/soc/tegra/cbb/tegra234-cbb.c
index c74629af9bb5..1da31ead2b5e 100644
--- a/drivers/soc/tegra/cbb/tegra234-cbb.c
+++ b/drivers/soc/tegra/cbb/tegra234-cbb.c
@@ -185,6 +185,8 @@ static void tegra234_cbb_error_clear(struct tegra_cbb *cbb)
 {
 	struct tegra234_cbb *priv = to_tegra234_cbb(cbb);
 
+	writel(0, priv->mon + FABRIC_MN_MASTER_ERR_FORCE_0);
+
 	writel(0x3f, priv->mon + FABRIC_MN_MASTER_ERR_STATUS_0);
 	dsb(sy);
 }
-- 
2.25.1

