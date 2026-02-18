Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012004.outbound.protection.outlook.com [52.101.48.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF4633E36A;
	Wed, 18 Feb 2026 14:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771426725; cv=fail; b=tKOddr7mGoTfbzjHENUJ81aWjGcV1fgbEBabB6bM5aMIMNgY9ik4TYJCCLlS6hb0PxpklCHabeU82wxChvtKb+T27OiZM2TlVmpGoQtnV1QRXPMVj1fz4RO4KQgot2QK9yin3tep3Rz7uQSc6dHGm7zRXy54HBB2RewhCDKjf+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771426725; c=relaxed/simple;
	bh=AAEZjflkYWBsuZzBfjG0OTsJp4AAA+n9Rmj9UfvWzPY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=C+fo9padW34E+yWCK81HMFRb3jydG71fyGgMmGl1DaGKM3f2K3k3Zw50nwjLV3WJYf11rIZsBHr2UfMivYutT+bSH0vY12fLR1zo+cU1A+LH5/XpbTkpr3Dqigj7TYSJ9WZYyMcmnEwm0LjlDAVaBDVsqr1vruTRer6dd4bN1VU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rOq7ExJK; arc=fail smtp.client-ip=52.101.48.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rOq7ExJK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ngSXoxxTM4NbWtkEQiPO6Wy4PabpK1kJ/n97L6lvO12vFFfiFwhQ3azMVvtRebhWT4cw4kulBecczJzgsvIYUxm7nYmERMQ+IP+BHZpG0ANz1BHodPfu54E63rvV4CfdRPHFRX2BBQZS7wOXw8ectkn7Bmo5eFVLA7KlMcw6TVjJXNAUB2R+egktF6LCHkQgJ7zyNE5W9xVYPIQF4oTn3qsM+Bpu9bIpNzwLQxKOtcz2FNxiAlICKFrID1ihscrU4IC1WuqjotIgsIsvx0/SfhzLbXGyAVI+h5AINE/FDgtcFjvpzxdcY8scxNd8wiPovWdxK/Nrt35bf1EKif9oYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VULWRMqDwrQSkS2axa/l45VBaPx1mG1mXAyFjpAo658=;
 b=Vqd9tCloGWitkcol89zMU2C/jOGPHasKtTSf7GJaNcpKSH7LxLMl4j9Wd2dkgKfa8pxtsZLNtuO/po1r8QpGhvzfammR0CcJDtsPl8YMTGUGf1T+4Lk269CYsDGeVsibmgXYY4olV9jRCNUmtC+cWEgIJcCcMZAWJiyoRWCWL2jBj1mRx153cP4xhLndhVX+iV3OzWhNw0L1tokaEfZHgsTtUrL4qTH1to0mqNoYOjav77IK2O+Q/emYu3jhyvsW2Ntz0gN8zB298jw0FH1PcjO79mTRa9wWsUNIGfzmM+4oqYViNNJgOUtnqYtrE6L5rwB34xVqdI2tThk8HHMNXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VULWRMqDwrQSkS2axa/l45VBaPx1mG1mXAyFjpAo658=;
 b=rOq7ExJK+LqPhc70yJRykoe1xoR0AQSL0q/BkPD1hssQveYXnpDSOq4nZH9Wl4hJuj2QcMaqkBbbz9D6PGnUFuhfn0nMVtfCdDmgQEH8fnxpXszlqJ5qSCVs033J40yl1/pIdyCjkLP9qWMzZDOPow/ER7MPcrF7VHZMVw4BX8/dncApdF/ZQmg9y6480FEORvkE68KiqLuS4a1bln+oc8TtFW1lkSRUJINOl7l4BE6tBb9FmsX4UgqYI7rwJtijY4ozaf+1wBf5w2XSDJUuMWXZhhltmNXe3a6IYlY+eDAdlPRCmMfEUOYXPUIgzfxnd9smVW1PgPWmntRSt4+pBw==
Received: from BL1P221CA0002.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::32)
 by DS0PR12MB8042.namprd12.prod.outlook.com (2603:10b6:8:141::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 14:58:38 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:2c5:cafe::cb) by BL1P221CA0002.outlook.office365.com
 (2603:10b6:208:2c5::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.14 via Frontend Transport; Wed,
 18 Feb 2026 14:58:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 14:58:38 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 06:58:17 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 06:58:16 -0800
Received: from build-bwicaksono-noble-20251018.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Wed, 18 Feb 2026 06:58:15 -0800
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <will@kernel.org>, <suzuki.poulose@arm.com>, <robin.murphy@arm.com>,
	<ilkka@os.amperecomputing.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <mark.rutland@arm.com>, <treding@nvidia.com>,
	<jonathanh@nvidia.com>, <vsethi@nvidia.com>, <rwiley@nvidia.com>,
	<sdonthineni@nvidia.com>, <skelley@nvidia.com>, <ywan@nvidia.com>,
	<mochs@nvidia.com>, <nirmoyd@nvidia.com>, Besar Wicaksono
	<bwicaksono@nvidia.com>
Subject: [PATCH v2 0/8] perf: add NVIDIA Tegra410 Uncore PMU support
Date: Wed, 18 Feb 2026 14:58:01 +0000
Message-ID: <20260218145809.1622856-1-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|DS0PR12MB8042:EE_
X-MS-Office365-Filtering-Correlation-Id: 35b2c2fb-d320-4c1a-7b9a-08de6efe329a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NBuZCcKbwiBFcEaZ1AtHNK0w8rre5LkMW7XIktTj3zur8wASnEgcm65XJ+Ud?=
 =?us-ascii?Q?XaM3wI3ElMvfUwbRFT7iguk5iOKnzzK4CmaP0LyXh0Szltz5V2EvXF7bk2Ec?=
 =?us-ascii?Q?5wqL824Kdh5AuD0TvOqtPuuvuTC/8qESJwdcKyKn50SBo6av4MCWz/Qb2DVp?=
 =?us-ascii?Q?kq4KTWlNEAkAU476Cl6FdX87J3CC0sbj/lSGvbMdJdtdkJHekLvZaJRsbali?=
 =?us-ascii?Q?spEtZPnRuYTqEQ1Hv68QyDyJiqKDFdzkRNtIEe6XiC/XY66N7aREENN0/eO1?=
 =?us-ascii?Q?Y7Q9mC87S8mGHUd8TkjArzujBbIF5gv/U38A9dt9TugcEY4Xn5iUdxvm8kM+?=
 =?us-ascii?Q?ZQDURMq8WksM2l3+XIbiHENluXgfeL79/kOGcqUKsbDxQ1OBEgLxSGiIv9Zf?=
 =?us-ascii?Q?2iDwhmBHGWp5oN+pQZ/3ZmWkhkFXG0HGf9oYSamg3wBWWM9T3x65fCaNP9Wu?=
 =?us-ascii?Q?sKGfgelgzoQCiQJq4r2ab9+3mQH/QaxlkYls6Frlc+sFH5iea/ZT0GgoHYuG?=
 =?us-ascii?Q?aLAFg2XvzDaaF2iHnwuYLY/xJPm4rRVAWXLwN/m2/x/iE51rtb9Fh5mt+58T?=
 =?us-ascii?Q?2psIonsRp0/pA3XoQ47hkJgJDMONhmBz+KQqVDBkcMA/E0Ld6X788jXFZm76?=
 =?us-ascii?Q?iWaGHntmTFhIKC9FD2Cqd/jE2RAk/pvilBvqT0VkTHosi6fv5R9i+ETwVlSR?=
 =?us-ascii?Q?kxJasYqhFIDQ/vM4NhX9itcW57/tXl/vt9gOXXl8uYe0uH+XdGefDMxt3P+x?=
 =?us-ascii?Q?LMBqTPH6BevZ/OFktBW2+2Uh+GNdQO2MuKo8tCP30ECvR5aQIjPmgprhYpVl?=
 =?us-ascii?Q?8LVxNVlRdl3+Xd3wTNrK/Z5RL2aoUnxgiQ7/feZxLYhW4lo36fyR4lsQaGkY?=
 =?us-ascii?Q?oID6Tt/hAc/xLHVeG7i+j2WRGvELvzOQHlYYP5Wg176lI2yPvbv2XNsnX+LX?=
 =?us-ascii?Q?XmwkN0UwZxR+7dxJNugoWUWsb9CudUbq5eYfrg9hnE0fSNGBiqxVf1UoAkwg?=
 =?us-ascii?Q?tRiZgn4W6M0dspAheoFy00pZjMvpHF5in7u++b9ZyYiY0ffjJYo28ebN2AF/?=
 =?us-ascii?Q?zyjIh4AzJVk9NoPDmbUnDRIks3r1eZztOKrSZqakUvRQFBlnFUbsd8VBYeWZ?=
 =?us-ascii?Q?5db/kNqiuAWzbuHzHcb6A1CYPcokggB8ap8WARbqgx/m64EJfJlCXmg3iGEi?=
 =?us-ascii?Q?aS9TBrfYResgAjRDJju9psQvK/3+Au1mDSyzAeAZzWtKD2wVFj9Br/pNFzvy?=
 =?us-ascii?Q?xSzbO7XxxfAZmUE/VMxMR65c/9YyRrMvVi+5MXCq+UiUpMNoaUwBeCV2I0zB?=
 =?us-ascii?Q?tD4PMfin/EtT29DYj4SgC3eb5gYqkCXNWm9J78Nww3jMIM9IDLJ85205sxiM?=
 =?us-ascii?Q?iECBzn87afAsm7FEff5vYzijXiEG7bmJ3ME3IM/ZScTSVoYsDEDLKDPsPOSp?=
 =?us-ascii?Q?2TLLXqvFWhvkS2tnLO/a6Jqis81cM3NJW1fkdx6Uc42C0dWgIxAraQgabFXm?=
 =?us-ascii?Q?2dLuZyhZ/Ob1mZW3cdSo+hop5GobzAF3tbRF5+PUlROeeYJhM90FqoIa6iG6?=
 =?us-ascii?Q?HAmVOgj1YfJUkkjJw4vLS4OxnBNPo/33ntRGWtdn0ZIv6HVNFBqZiRXkTa3n?=
 =?us-ascii?Q?bxwFlTQu9KXaSgDb8eA+LdXhz0VhfKNw0Slfmw3VRe0NEwDtz2VwBUic07j+?=
 =?us-ascii?Q?QnrKrw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cc7sIq+/cfFinpI6rE/BQWFuBPhmLqgg0ZFn068X1zm/d8FaHRH39PrSnGIKCJWGhK9fR3OrXmgLiN0IaJxMJbramJeLGnFumBomxY/r2/7sgNKq04kNMO7OPfAnSAyF9NRb+J7d12V2dWUtoH+mXA1gH0u3iK/IHEz0AQHAQfk34F1bnBNpu4lA6soISOfZQ+LFn5Vy05SDeLAeyDmTvpp7R0XEmix9qumlShNE/nDb9C95ZfuAWXSWarXQBrVDEGtDbTqjIMQpn2twf/PJCkcinPRJ7AihLcFVU/EEMtNsYSJsEZf2j+RVYHHa4gMMkLIC/340D6cUeePxnD/6scLnQd3yuXzBmcWlMoyXGbQiQr4HBUIGriPZE303zTR0tunZrxJs6kAVs1DTPFJZHjJBuUR23B+/wWEFv+QYrpstp8hEFwlcCXB0l8YvVmXt
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 14:58:38.0934
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b2c2fb-d320-4c1a-7b9a-08de6efe329a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8042

This series adds driver support for the following Uncore PMUs in
NVIDIA Tegra410 SoC:
  - Unified Coherence Fabric (UCF)
  - PCIE
  - PCIE-TGT
  - CPU Memory (CMEM) Latency
  - NVLink-C2C
  - NV-CLink
  - NV-DLink

Changes from v1:
  * Add more clarity on the commit message.
  * Fix build error reported by kernel test robot on PATCH 6/8.
    * It was missing ACPI dependency on Kconfig for the CPU Memory
      Latency PMU.
  * Apply code formatting suggestions from Ilkka.
  * Added Reviewed-by from Ilkka.
Thanks to Ilkka, Krzysztof, and Jon for the comments.
v1: https://lore.kernel.org/all/20260126181155.2776097-1-bwicaksono@nvidia.com/T/#t

Thanks,
Besar

Besar Wicaksono (8):
  perf/arm_cspmu: nvidia: Rename doc to Tegra241
  perf/arm_cspmu: nvidia: Add Tegra410 UCF PMU
  perf/arm_cspmu: Add arm_cspmu_acpi_dev_get
  perf/arm_cspmu: nvidia: Add Tegra410 PCIE PMU
  perf/arm_cspmu: nvidia: Add Tegra410 PCIE-TGT PMU
  perf: add NVIDIA Tegra410 CPU Memory Latency PMU
  perf: add NVIDIA Tegra410 C2C PMU
  arm64: defconfig: Enable NVIDIA TEGRA410 PMU

 Documentation/admin-guide/perf/index.rst      |    3 +-
 ...nvidia-pmu.rst => nvidia-tegra241-pmu.rst} |    8 +-
 .../admin-guide/perf/nvidia-tegra410-pmu.rst  |  520 ++++++++
 arch/arm64/configs/defconfig                  |    2 +
 drivers/perf/Kconfig                          |   14 +
 drivers/perf/Makefile                         |    2 +
 drivers/perf/arm_cspmu/arm_cspmu.c            |   22 +-
 drivers/perf/arm_cspmu/arm_cspmu.h            |   17 +-
 drivers/perf/arm_cspmu/nvidia_cspmu.c         |  624 +++++++++-
 drivers/perf/nvidia_t410_c2c_pmu.c            | 1062 +++++++++++++++++
 drivers/perf/nvidia_t410_cmem_latency_pmu.c   |  727 +++++++++++
 11 files changed, 2988 insertions(+), 13 deletions(-)
 rename Documentation/admin-guide/perf/{nvidia-pmu.rst => nvidia-tegra241-pmu.rst} (98%)
 create mode 100644 Documentation/admin-guide/perf/nvidia-tegra410-pmu.rst
 create mode 100644 drivers/perf/nvidia_t410_c2c_pmu.c
 create mode 100644 drivers/perf/nvidia_t410_cmem_latency_pmu.c

-- 
2.43.0

