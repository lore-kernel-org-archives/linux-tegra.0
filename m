Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010056.outbound.protection.outlook.com [40.93.198.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14BF30DEB7;
	Mon, 12 Jan 2026 04:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768192161; cv=fail; b=Z7J2VaJsYyQe5Sogd8CJQeU3jAtPfTHI82TWRYH+A8/2Pwz64ELiZvLYKh15fgZJTe6fHYEsWUtBb1568EYigJ0vd5cO9wguEyc+kXUivCxKap+tfZ5s4TJdYoHHvEjQ1Ouhp9exngJPzrevdThhCk2m1kSdUSSIKzBMKN1OYUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768192161; c=relaxed/simple;
	bh=rxU3BsuezU1VYgdwY4ua4SkUfpoWkFIAMapH8fk8Tw4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HnHcqpGmg8BK1sKPrdfS5kL6oUyfwNHJlyi4xZeufcdkiuo7OG3y+ba+bvlmw1mK/+6wmSUx4P2zlMOMcmi0OJVjWJcH6YjwmOCxLfFgGkWH/TltCI6s1u76Uf1W/M8vBffZA/8KXUFOkAwR4WKhIQTZQe3rZL4EWtlnz4jYj8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=l7RTztcq; arc=fail smtp.client-ip=40.93.198.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="l7RTztcq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pPeKDgJX4speOke988qcIiKXrT7l7ikoCndrfRxJd3mJMO3RMI/UAk6jANjcLHN7gk0BiLNw0aSxQQt4UxrTLkrFpBu+tc6EitLSctd4GvJApojpb0d30WWE67pOMXgUMeoXA2tV8w/Q0cnqXhGDVPjkZ1wYotDduh3u3COF0QQn9B2w+/daRUVajzAh9X8Kf0zQ5UKAyl7BK3m7R8LGThfy30jwHmEqCfg4HZDQ75zZj3V/F28uD+sPSfbNn/j8X6lgJPfbXv+SrOdtIos/OhTYYlGgsF/a0NkXdob8qYSTdvhd3NkGPGL8esQkwGUbOBY7dCPgewAJq5vVCofF9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bm1EKQ0pHRLjTzcOGUcb/nTFlv/YFXIicxwT+G/+x0w=;
 b=tEQofH5BtArHXyOKYHUh13/Juz2iYuahRJTWkj13gaxsxli//ej9IEtCabi2X/q+dc2CbLHBeGz8PVDPP3gO2Y1QyoB6uZxDnSVgjzumXDI9UdL4TH8HZsFNhnozIXa8I9oG2YxSnrrVDNU8YO0H/U+JeSJko7W/8WjkmB98T+y+vejTNlA2SCjZONKgoLofmgjIVRP9iRQG3K6KupcJZlSaPHOXOUd0oYs6G4etBYWtJfY7NGc7mphjFYtEutqUfA/aA6ns+J109AMYxlRbR6LwtDOQ05cz5M3u0l4QSYO+w/gahE4ZHaYv/sIjvMol4R+HIMrnRWuiSU5CUgzCpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bm1EKQ0pHRLjTzcOGUcb/nTFlv/YFXIicxwT+G/+x0w=;
 b=l7RTztcqa8AhsIbzbm1jDV06KSXomSy34WHLv8CecnNMXRCpSsAeR/OYCVevFkylL00qbsMjy3H+3t13CnbIZ8LLzav87tZiiDPoCglksFTF+51QmLju5hsg0INcG9TKXhGEzNbPkteIMg5fThMX5U7nhyVhtpMyirshpfmi5Z6HOITD5ZvGOjug0vmJuV+Ep14Fw0NwGOyoHetpsuaBFl79U9Ve768km8Q413z4RMhPT5AGfmDXkQ2ibbJXaB4uNdhfBd6luC8O/stpvILl40+0csOl8hSslBfDZ+v0JJsX4ruyBt8UY9bxR9zE8ScjEKPAI5tKzCP5iPFSEGMK6Q==
Received: from PH7P222CA0030.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:33a::13)
 by MN2PR12MB4341.namprd12.prod.outlook.com (2603:10b6:208:262::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 04:29:15 +0000
Received: from CY4PEPF0000E9D3.namprd03.prod.outlook.com
 (2603:10b6:510:33a:cafe::d) by PH7P222CA0030.outlook.office365.com
 (2603:10b6:510:33a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 04:29:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000E9D3.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 04:29:14 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 11 Jan
 2026 20:28:57 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 11 Jan
 2026 20:28:57 -0800
Received: from sheetal.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Sun, 11 Jan 2026 20:28:53 -0800
From: "Sheetal ." <sheetal@nvidia.com>
To: Mark Brown <broonie@kernel.org>
CC: Sander Vanheule <sander@svanheule.net>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Thierry
 Reding" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
	Mohan kumar <mkumard@nvidia.com>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Sheetal
	<sheetal@nvidia.com>
Subject: [RFC PATCH v2 0/3] regmap: Add flat_cache_default_is_zero flag for flat cache
Date: Mon, 12 Jan 2026 09:58:38 +0530
Message-ID: <20260112042841.51799-1-sheetal@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|MN2PR12MB4341:EE_
X-MS-Office365-Filtering-Correlation-Id: 326988c9-38ef-42b9-033f-08de51932444
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q1QwlVK2pA1dQCXoCL/K349XcZ6b+2zKh2cO7avGRFQlzboidhhdhq3fyX1c?=
 =?us-ascii?Q?1wz9Tk4TzxXzsJvG6pgumR0cATHK5MNtLpIb+4aFa+1NeOTZ+ns2FkN+7rch?=
 =?us-ascii?Q?bnWZ225KmxhR+9eGlmE8PdeC028HBq0qwuIXzT4zcyEYWEGQ+69LKkekFUR5?=
 =?us-ascii?Q?6qTwQZime1qUZKvlag0lNGFHpk9ug6WnBzvjcfX3zhBDd5zt+0wpDL6nk7M/?=
 =?us-ascii?Q?eCyDDAgEA4LMTbQYpWwgnxz3+MIxmHmCRAzCWp5SJTlp+JdrxQ6y8LODXq9F?=
 =?us-ascii?Q?KxmzEAT0TenNxhu6gnkvN7ftcUszO64yeX6FSgB5CLs9gYEr3c3zSU4DxvFj?=
 =?us-ascii?Q?OfXWnzhVYgyLSH8GDNQr3dKUrqti9uhD/+d6AQJdfsqw6TzLb6AmoLveN5Re?=
 =?us-ascii?Q?4PC4imNmqJUTZLcqSRRJaW1DffDvShmMk8dfxELqSf8hh0XTP96gw/zAV0DY?=
 =?us-ascii?Q?NqlRw3c5Nhx4jEDD+sob0qpfnNgB2H5VyD0syjGoNSmpwaCrESxjpRw6JNGV?=
 =?us-ascii?Q?6IPZyCZtVV+KRPAYgLoEMGsblmk4Gp9TdmGLwEx/vdomKV/1ys65XBMwwnzs?=
 =?us-ascii?Q?1BCMOBC2YuFwO6I5z6T7JPWE4hWPpv1hmGx4nGXscN7NB3gc0s8qpefMSsbQ?=
 =?us-ascii?Q?b4xsJPGpXB6TMDIJOQiApDDIUg7RA4YRMJBTcAAR0zVPUkLaj4YcQcpp9qbi?=
 =?us-ascii?Q?MsQST1i/Z4NUGzRGGIFtwfm9I6rSek9hOriN4oH9uS45mynh9ViS4AHyIOyk?=
 =?us-ascii?Q?9nFwKl0oi4Tt1Z66hspXU+BoMrMh5wrcEH0XJ4Qil1dSc7nk+nepKUhdRN3N?=
 =?us-ascii?Q?5MidQ+hP8roo1ZRgMnvfX2HYmCMwCTyeknKdYC7pbDA5EiK+xvF+xAhXNZUq?=
 =?us-ascii?Q?X5H48Bim3UibgunhkwBFqEFy+I8gSqIIS/dYeRwGDoggsfa+cnHyAltyGbL+?=
 =?us-ascii?Q?Vq6wJKmLEJ0GsaeOyBkHCCECI/iNNdhgbArDMe5qx1Z+YQAqEtGfg8lb6lDl?=
 =?us-ascii?Q?x5Ld6+rItZZxOkYm+4MhbMp/AySVUwL3g+OdTObABO0V5OVLTEZMop6SBZNt?=
 =?us-ascii?Q?gp01b9UD0TblCMDQMm2QI7+HbqF0AGLMP2KqS/LyEkewIPIbgk+s2tmfKjh3?=
 =?us-ascii?Q?2VovEdsn4+7ztvAyRe84BvmHA4tZNkm7Q06tHIxFLzPLFHXZF35Es1zNejbC?=
 =?us-ascii?Q?8v/DuofsGcL9IdPymopf4MnsAlxic8rQUG3muDzY+oYv5GyLALTjKyJJ3l+C?=
 =?us-ascii?Q?UpUoLwpj5EeEMGHkSx1M4c6vqHkZMT8Lwq9EjD3L9T8mhCKbplVzc5kGyvIB?=
 =?us-ascii?Q?vRr7Hcb0ouwUjzxpnJioVojfjEujK12DuDzf1upwvOzW9VYLXnxntcwfIyWV?=
 =?us-ascii?Q?7Dx8i+1PVc1Wejz25KmaFWEZoBGBxNaJx4d7MSdgSuARVXkA4uQ1n/E+pMZX?=
 =?us-ascii?Q?Y6PSoSc06QNVokZcC8BIzqR2lV1XSxgQDC4BbJtyKDgxQr8a8Sumf77dHJBE?=
 =?us-ascii?Q?dSceJh0rdEIlcKqw3ErLtNT6lcYTIQ+fdWD4imeKMLJmHYoh+/3WzWiyQjpT?=
 =?us-ascii?Q?3wcNahSjgLBQtucMezI=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 04:29:14.2251
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 326988c9-38ef-42b9-033f-08de51932444
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4341

From: Sheetal <sheetal@nvidia.com>

This patch series adds a flat_cache_default_is_zero flag for REGCACHE_FLAT
that marks cache entries as valid on first read.

For hardware with zero power-on-reset registers, this avoids the need
to add all such registers to reg_defaults (maintenance burden, code
bloat, no functional benefit) just to set the validity bits.

By setting valid bits on read rather than at init, only accessed
registers are marked valid. This keeps regcache_sync scope minimal
and avoids writes to unused registers or holes.

Changes in v2:
- Renamed flag from cache_default_is_zero to flat_cache_default_is_zero
  to make it explicit that this is specific to REGCACHE_FLAT
- Added KUnit test coverage (patch 2/3)
- Updated commit message to explain why valid bits are set on first
  read rather than at init time

Sheetal (3):
  regmap: Add flat_cache_default_is_zero flag for flat cache
  regmap: Add KUnit test for flat_cache_default_is_zero
  ASoC: tegra: Enable flat_cache_default_is_zero for audio drivers

 drivers/base/regmap/internal.h      |  2 ++
 drivers/base/regmap/regcache-flat.c | 12 ++++++++----
 drivers/base/regmap/regcache.c      |  1 +
 drivers/base/regmap/regmap-kunit.c  | 93 ++++++++++++++++++++++++++++++
 include/linux/regmap.h              |  1 +
 sound/soc/tegra/tegra186_asrc.c     |  1 +
 sound/soc/tegra/tegra186_dspk.c     |  1 +
 sound/soc/tegra/tegra210_admaif.c   |  3 +++
 sound/soc/tegra/tegra210_adx.c      |  2 ++
 sound/soc/tegra/tegra210_ahub.c     |  3 +++
 sound/soc/tegra/tegra210_amx.c      |  3 +++
 sound/soc/tegra/tegra210_dmic.c     |  1 +
 sound/soc/tegra/tegra210_i2s.c      |  2 ++
 sound/soc/tegra/tegra210_mbdrc.c    |  1 +
 sound/soc/tegra/tegra210_mixer.c    |  1 +
 sound/soc/tegra/tegra210_mvc.c      |  1 +
 sound/soc/tegra/tegra210_ope.c      |  1 +
 sound/soc/tegra/tegra210_peq.c      |  1 +
 sound/soc/tegra/tegra210_sfc.c      |  1 +
 19 files changed, 127 insertions(+), 4 deletions(-)

-- 
2.34.1

