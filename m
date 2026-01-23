Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010038.outbound.protection.outlook.com [52.101.193.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F271737883D;
	Fri, 23 Jan 2026 09:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769162083; cv=fail; b=tnLGT9YHwQ9TvJBVKDvKTMhSi6LYnW+6IDpM/zlxCNdzvsZZ6lF35V+Dp4KgIz9ypEMqmBl/trZPgEW4jXg41ePtAcdNmO9OjwZiMZw/KmKYqs/YEpNgm/D3OzYwGBcuTzRb9HOhWPtnGdmU0SAyabKGGQdDVvyt8ulqVlGpfcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769162083; c=relaxed/simple;
	bh=D/Ukx3op+aayzHaWX+1a1K61ZB76JAun6JpOsQg2Mj8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Wb/zx2Y9t/F8UqD7+uMp40IKVtse9JpRrlOu4Aps3WOMglqC8qdhZPjtxNi65OndWuKEWZbEYNbQ3c37zJHUESJacHiqLicQ5ZGWDR4agEliEhbkOkrFRv3GkkzQ4QER0A0m7Ock+RKhE4ni8B++7ac5kHG96IDbLi5A5Yqc3dE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Fxp8TiNJ; arc=fail smtp.client-ip=52.101.193.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Fxp8TiNJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w+zOY71MtGriex0nUEuK1yb4cCTlDCuLVeZoph7zTGuOTLW962ReP5Qh8FABw85pOn0ufu39XqUFkN2ommjZ8diqfngRIYpn+9xDa7rOPv29bP7/yVlZHjeKSsu0TA9i3j7tBRwp+830rCWq26/42Y6WeB3y2GxK/kkz4KzQJlD4hb1CMlIj1whdQsOE1zvWp7pQGcT0o638hvLsZCfsQZ9J2PBhkgGS270aR5LhCtGQNHUD+382pqn9q3gfOYJtI1w9A5ARCSrFY3xeGPPh6R/ciaV8L8iCsA2oZcnaN7i3/jmHWngTqaPHmktQ1CEhkNUIP0nu7EsWGwk4z55MFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nT74UH64WBuLeAa/HX1NjlM7WX5v98EWviBr6/n8u4=;
 b=i4pGNMUuqx2s7l8SgJ/iMgpZDeHq23tId+6DRscmHGCdDwarp4GcOXa/jwU6pbsaBQd+WeScAmlVBzHT/tfsM6NbAfQ8BJ9dzoEosaXZQIsMjlhYPXQpfaMBet2QRIUfiGuF5Lz72XzyJCxK4X4HbPgb2nncmSahGFNrssMyrgZ83eEPCpiB0K8m9gS3j005ldtUmPZhIIXOkApT9JDl5b9vLyN5pfRmYE5l/99Dp8st3ifjrwc1iMDlwN7N/g4kNeazEFj7vz9LzGHQXwFDEWX6Db+EMhjecPMlhge+r4Q7bZxSe3lk941KtvC1XQ/Mse4BDHY60t22Ms++LAvIoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2nT74UH64WBuLeAa/HX1NjlM7WX5v98EWviBr6/n8u4=;
 b=Fxp8TiNJIZ/3bDmy9B0SJWj3EPzrXC8F0kc0Oscp0Jp4b/cu81dfnbqgjmDGeSoPry3UmjYIIXerx/nc0+ikFht6WijKN7fIoNChFwv9BarUHfBXiKWEiLX2bCjv6K5cZzjeG+6WXFbUEGRG6PTuQthfkyKbcMuMH4hRtCRzdTeVxnkb3kPUMZl09B3bAGxOX8Vrz/Joxz+y4KtzAKOWrglpYBZTtElR3ayer8FqJ4kPI933lPYeXwYCXKJwPDi6chWSheZOK8KckBbrC+8q6HKPzIKKqUo3YoXwRrXLdSPF8e0wgUJqjwTlzJS1uB3FoIi/o4rJWHmsXV67C77o9A==
Received: from BN0PR02CA0054.namprd02.prod.outlook.com (2603:10b6:408:e5::29)
 by DS0PR12MB7701.namprd12.prod.outlook.com (2603:10b6:8:133::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 09:54:26 +0000
Received: from BN2PEPF000044A2.namprd02.prod.outlook.com
 (2603:10b6:408:e5:cafe::e4) by BN0PR02CA0054.outlook.office365.com
 (2603:10b6:408:e5::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 09:54:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A2.mail.protection.outlook.com (10.167.243.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 09:54:25 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 01:54:13 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 01:54:12 -0800
Received: from sheetal.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 23 Jan 2026 01:54:08 -0800
From: "Sheetal ." <sheetal@nvidia.com>
To: Mark Brown <broonie@kernel.org>
CC: Sander Vanheule <sander@svanheule.net>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Thierry
 Reding" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
	Mohan kumar <mkumard@nvidia.com>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <linux-tegra@vger.kernel.org>, sheetal
	<sheetal@nvidia.com>
Subject: [RFC PATCH v3 0/4] regmap: reg_default_cb for flat cache defaults
Date: Fri, 23 Jan 2026 15:23:42 +0530
Message-ID: <20260123095346.1258556-1-sheetal@nvidia.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A2:EE_|DS0PR12MB7701:EE_
X-MS-Office365-Filtering-Correlation-Id: e652eaaa-1020-4a50-f270-08de5a65649b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Qkuy0IW0FarEKDmdfVLLNIKtQgqi2x4CgI5cPCvY8UTM7iGWQ/US9EAsu9wj?=
 =?us-ascii?Q?eyZVP4XFFQe+SffBnPQ8rM3Q+jB6hrqhMGoQDViXiLOPgfKNfy5rRep8J+to?=
 =?us-ascii?Q?tLjRd2TEswlScv7XH9nyQB8objW8iOCRubfBBt77XoH05bXegyqFw/WAtrTp?=
 =?us-ascii?Q?x/Hd/jSWwMnyQlbQ9G7Zk1dCjrUsrANOR62htU7hoXy9PLY5XF62KgDbvafD?=
 =?us-ascii?Q?sN5dKQX3FUWtWRzuHDwZLSPRfCuEkcNE0oVY+BwWmU6RdIh1M5DWdtioWfJE?=
 =?us-ascii?Q?ll8ch5NlzEkwTG1OiNIzLeF+mVywsswW0SPeZCjErhNGPs0gniaFLuS9bLFZ?=
 =?us-ascii?Q?ajIwjbWpjHGJQh1FCyx6LjIaR32Ulh/SuD7+FmMysI1WsdjXOxgtAkiQIIFz?=
 =?us-ascii?Q?GUuyRyESCXOSWYptLxR+7KCoM99VqNdPejo3eFT4GcmiDhGYuIkIheLp0kXt?=
 =?us-ascii?Q?hwYQQBzCoB5Vz3YdolGpIW259QgM4RwhOuHACZwiDv12YibT/WZf3YK8Sg7B?=
 =?us-ascii?Q?1p1QSpKC8Gs6VkCMr6mWI9JaT/rXU+Q1T+SF9iARDBqOll92XDrmc/xxGyPr?=
 =?us-ascii?Q?FO5zMeFAEjpnUPmWQ7+U8bAI6dBtaHWhRGpWPA3mX7mPmZpTQztMfH6Wlb0Z?=
 =?us-ascii?Q?USvXkhpEqSnmi6xzLOK5WAm6ZZb99jU/sJFVU6zRDA+4Bfk4E2jPX1oQ+XsL?=
 =?us-ascii?Q?4WtrH14YzuMBrE1AL2EWPTloAXK8dvHLbvWW/p3/wjFnKjJmp54zWgQE/59n?=
 =?us-ascii?Q?dgVVi79ETlllHdF55jiUUWffiHqfgSB+R1RJi9no4stvmL09RacaLEAQhzXd?=
 =?us-ascii?Q?uVAMh/tTqMD9okEMIQYickPofKKYhfZsjz5uWTMJvNcOY20KKyl1a41AFpmK?=
 =?us-ascii?Q?uFyg0uq4GoU592o/Z29dpFZl9FamP8u0oxjxKQxTTaJNoFJR6GQWzEk6QsGE?=
 =?us-ascii?Q?e33egykCQq4aPE3LfHgblHqn6xhCQL9LwIgIVKDizZB2s9t6FXyGyIES+02E?=
 =?us-ascii?Q?ILjP+DRxgbQsPHHsRnUq2szvxThj03pas+2EJldiJKVxfFf+e2/5jC5nu+at?=
 =?us-ascii?Q?lCZkk63ygmJH0odWPN5io83oJL/3nV8Q0xvQc/qvmXGUgY22NjXEddU2hv3S?=
 =?us-ascii?Q?8tB3Mv7Sf26+AnFpoliaArCicUXiNNghPHtNb+vkhu27hm1baqVkGJIDJWrK?=
 =?us-ascii?Q?qXmlivdwQNSfEUpx6PkRl0MkYZ+QUnrN3IapRsihSx7loQqRz7/LWN0jIqfg?=
 =?us-ascii?Q?tGP/Fb45bjINDFWhvRe7O6WTP+uyEWpWVAj4n6wRwjc+IQPc2594J+H1Zcqs?=
 =?us-ascii?Q?F7WeKlZeCkYd+cBTiw1O7RH57Vipxpm2u+UIoo8abJGjCGm6uGlGmyb/sXFb?=
 =?us-ascii?Q?AIgW88wg3JmFbayGMZzlvj1NjDM0G6ZzerGEaogUH9tO82oo7hB2oFVIMHIW?=
 =?us-ascii?Q?XIOSryF4qmIYkOZM1yMm5WFvEbIaLdbZRfZ+dAteDRSjjw2M7EEo3D/Eq1fg?=
 =?us-ascii?Q?RR10eBrjfjWF0SRpCq4iGzDyyrcY/WEJ6FUA5dZi3eSN8c9kltIT483rk0Xb?=
 =?us-ascii?Q?wBHuwcSc2cUeyNqFzrt+rg9x8UOWjjhqkYMlDE8MOcndtZ9lVzxVVnLCsIna?=
 =?us-ascii?Q?JLEjwNWmMWdbTVBy/INTuJWZWUWNtHnFasR7Pd3IC/wqgVSMZO9TmmCVFc/3?=
 =?us-ascii?Q?dyJfaQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 09:54:25.7353
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e652eaaa-1020-4a50-f270-08de5a65649b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7701

From: sheetal <sheetal@nvidia.com>

This series adds a reg_default_cb callback for REGCACHE_FLAT to provide
defaults for registers not listed in reg_defaults. Defaults are loaded
eagerly during regcache init and the callback can use writeable_reg to
filter valid addresses and avoid holes.

Tegra ASoC drivers set reg_default_cb and add writeable_reg filtering for
AHUB RX holes to prevent invalid addresses from being marked valid.

Changes in v3:
- Add AHUB writeable_reg filtering for RX holes.
- Replace flat_cache_default_is_zero flag with reg_default_cb callback
- Load defaults at regcache init using reg_default_cb
- Set reg_default_cb in Tegra ASoC drivers
- Add KUnit coverage for reg_default_cb callback

Note:
 "ASoC: tegra: set reg_default_cb callback" patch depends on
 "ASoC: tegra: Add AHUB writeable_reg for RX holes" patch,
 hence included in this series.

Sheetal (4):
  ASoC: tegra: Add AHUB writeable_reg for RX holes
  regmap: Add reg_default_cb callback for flat cache defaults
  ASoC: tegra: set reg_default_cb callback
  regmap: add KUnit coverage for reg_default_cb callback

 drivers/base/regmap/internal.h      |  3 +
 drivers/base/regmap/regcache-flat.c | 19 ++++++
 drivers/base/regmap/regcache.c      |  3 +-
 drivers/base/regmap/regmap-kunit.c  | 91 +++++++++++++++++++++++++++++
 drivers/base/regmap/regmap.c        |  2 +
 include/linux/regmap.h              | 14 +++++
 sound/soc/tegra/tegra186_asrc.c     |  1 +
 sound/soc/tegra/tegra186_dspk.c     |  1 +
 sound/soc/tegra/tegra210_admaif.c   |  3 +
 sound/soc/tegra/tegra210_adx.c      |  2 +
 sound/soc/tegra/tegra210_ahub.c     | 60 +++++++++++++++++++
 sound/soc/tegra/tegra210_ahub.h     | 30 ++++++++++
 sound/soc/tegra/tegra210_amx.c      |  3 +
 sound/soc/tegra/tegra210_dmic.c     |  1 +
 sound/soc/tegra/tegra210_i2s.c      |  2 +
 sound/soc/tegra/tegra210_mbdrc.c    |  1 +
 sound/soc/tegra/tegra210_mixer.c    |  1 +
 sound/soc/tegra/tegra210_mvc.c      |  1 +
 sound/soc/tegra/tegra210_ope.c      |  1 +
 sound/soc/tegra/tegra210_peq.c      |  1 +
 sound/soc/tegra/tegra210_sfc.c      |  1 +
 21 files changed, 240 insertions(+), 1 deletion(-)

-- 
2.34.1

