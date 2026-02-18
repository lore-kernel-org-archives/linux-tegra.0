Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010014.outbound.protection.outlook.com [52.101.193.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CF133EAEB;
	Wed, 18 Feb 2026 14:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771426735; cv=fail; b=qTYXEJb5OT3ZM1+HlsFMDMI1KZJOBS2NDp+M6G5VddFIJ+3eHe/gTZd1kZ7F5PsBbb2EiVGS7YURVnSllfFwTDjOqSIOY7VTXurHraJNwKv4oE6UAPIs3y2KjnslA1nSiUp5myhfxv6C7nFtjqC7r8JXAX56W19IHTsEHcKtzAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771426735; c=relaxed/simple;
	bh=uW0U7sWv4q6D+t7dQEhGQ2iAta3BZxmXjZuKXSqECjg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ItjjNRFate6VpHKGnXB2aPn9KQZvOg/FJOurAOhdmnokyfEed/rJmk/kQj6t0JDfizMpLzcP8kaodpCzXJDNeRfG9sAF4rJqhW0yxj2doaybgLZtFWiNr5c0wRxDzXlxVXPk/eE/CFnG+LebqCJ02DNsV9Yje5LnaFswPT21rM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rWCqHbkx; arc=fail smtp.client-ip=52.101.193.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rWCqHbkx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mZykbKbpkbLVj124OJEdfM53ZUuq3Pzq0piiFewyWmnnfuhgwxazYi6ifuGj+Kx5F37bwoYuspQ/9hIw5Lke+frWjHbSYH4OcbkvrsogUayDZSDsOmepXZQzDt+we0eirE0dzHRoXwo3cSpm94hqutQqxs2IJ3l44Nxrf9YtI0K8NTX0DEZhIYBkkahyTik6nrhuALBINJ68hqY0/Ptu1kqOg6mWDncqpFdfYdGWM6JTaQ6MSLO9A7P3RhHbQpc8O0M46ZnN3jB8qiHlhDW0XZJ16QqLN3v9YKQMP1qnz2x71TwcjZe/P/JMn6a2aAq3o8n2423i7cqqg2gxNUXyOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qRL37xd9wtmmL9LmO6hkhJ+rDg1HbnpPEFTOE5j6uAw=;
 b=ercozNaaAV+q36SFaJCXDIeMWyCSAweNWP7sspxCCZQeVEZyqz6c2iV0IUWMos71L3wdcz9uT+Ea13Zp/Cvh9q7pcSoMRY1rWGihd+nHbWuNAC9NV5i5/9WUP4f8PPfI6Q5uqqU3mHyPy4DuMkjoV4qclM4E+eWj/5SuNakdMn3yqwbGJFgQfOgKFW0px149fnQdx/ZxKChoAofEfRo+YlZe2XJu0WqbXsShvRclKJfDWFmB7yIybz4Kkeoa77Vn4f9L31NgirL+bJNboOtXSq7DJQAGFArseh58mUPqoAAOUvN5tnK9pAzJrgbdgrfpMb1BEuEp3erKc3DRpigwew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qRL37xd9wtmmL9LmO6hkhJ+rDg1HbnpPEFTOE5j6uAw=;
 b=rWCqHbkx2IFKkjLeCb5Hd89RW2CUMlKAAyJRqBmBOnuf7Q+mxHnn6uioioj7xDzMnDxO2J/eGXm31FjLHzjaQ1RcdfYbQQJjOlLlx2tCZt8s5gGJ58pYBbIy8D3oeKg1caTzmUncx3U0SxCs+Xlj+IerI/YV5M2QzBKHQN1BGelTh0wflcG+yz0lDy2WmvRZU3N4WMTx359AbLNwrXiOILYB6gK0BSZsWw3JyCcuHflSOdPbxCmPbswIXlXfrD4xrXBz0fzHjcswTWo1DwQW8MnY9Dcl/kxvy4/cageK6bCfq5rQEmjdeXhrrqGQPxV2Kndj6b4mfdCU933S5+IyMg==
Received: from MN2PR07CA0003.namprd07.prod.outlook.com (2603:10b6:208:1a0::13)
 by DS7PR12MB6262.namprd12.prod.outlook.com (2603:10b6:8:96::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.13; Wed, 18 Feb 2026 14:58:46 +0000
Received: from BL02EPF00021F6C.namprd02.prod.outlook.com
 (2603:10b6:208:1a0:cafe::dd) by MN2PR07CA0003.outlook.office365.com
 (2603:10b6:208:1a0::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.14 via Frontend Transport; Wed,
 18 Feb 2026 14:58:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF00021F6C.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 14:58:46 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 06:58:24 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Feb
 2026 06:58:23 -0800
Received: from build-bwicaksono-noble-20251018.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Wed, 18 Feb 2026 06:58:22 -0800
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <will@kernel.org>, <suzuki.poulose@arm.com>, <robin.murphy@arm.com>,
	<ilkka@os.amperecomputing.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <mark.rutland@arm.com>, <treding@nvidia.com>,
	<jonathanh@nvidia.com>, <vsethi@nvidia.com>, <rwiley@nvidia.com>,
	<sdonthineni@nvidia.com>, <skelley@nvidia.com>, <ywan@nvidia.com>,
	<mochs@nvidia.com>, <nirmoyd@nvidia.com>, Besar Wicaksono
	<bwicaksono@nvidia.com>
Subject: [PATCH v2 1/8] perf/arm_cspmu: nvidia: Rename doc to Tegra241
Date: Wed, 18 Feb 2026 14:58:02 +0000
Message-ID: <20260218145809.1622856-2-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218145809.1622856-1-bwicaksono@nvidia.com>
References: <20260218145809.1622856-1-bwicaksono@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6C:EE_|DS7PR12MB6262:EE_
X-MS-Office365-Filtering-Correlation-Id: 37e70239-1d6d-463d-1aea-08de6efe3773
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/tpNuGBockSTxS4rf1x92lxFbtmsWsJSaXuLxQO418NFhQt6Z8BfEvUh6M6s?=
 =?us-ascii?Q?RXRoMoxIkFDobNgSmHKS1BNl2aoPqYS8Y+3MoJmZZm1rAuOUOtgVvyCb1F6H?=
 =?us-ascii?Q?M/MAqE9FaiyLaHk+5sUiqxlsGAWSAyGXvPDFat7XICl+RC2pNnj/xDN4Qqnj?=
 =?us-ascii?Q?v2UIMUTdOD1a8Ep2NJTmS/VZK1AAGlbQ4p759akANZEL9+XPQ2J6iBj/ug0d?=
 =?us-ascii?Q?YbmAQdaZNl74bMhrNTpIo/gn+o6K30wHGduwe1Jte/PckWqb/KPLEQoRDLmU?=
 =?us-ascii?Q?CtCJJuaLDKcNREAuA6n0aidBcMyB6InTvHbTAW8S8bP1DOH426Qj3nkZGiQ7?=
 =?us-ascii?Q?OwqENwhVh4BMQ/wYYSNizV93Ta/o9VAxoQxT+Y3iaBdFx+ttnUE2boNztTIH?=
 =?us-ascii?Q?Zoswrj5V6KFieIB84jhAOoWnoNYE66+V94F6Blc17xTAnbUEJakxRgVcJCTV?=
 =?us-ascii?Q?dHNqXQolwQ6cVm+KxX5kxCWRaOFPCzRIPYrmV1Nt6yRYLU95k/g05/dE8H5g?=
 =?us-ascii?Q?vPAMzPF3iTGRYUsZhd97VLwCTe+IPibsDFe6n5MA69OCxhf8uJiESrlcGgoa?=
 =?us-ascii?Q?srf0NAa9w/JPK/LIRGdfs9KkeXQq3j441h0+2pTxbao24Pzu2Y9BPMsRihFz?=
 =?us-ascii?Q?iD8naGNuuCvooKBP2klUBbfc5zl0b/48okxD4cgX50iSgR3f8Bgn/8dCdN1x?=
 =?us-ascii?Q?w8RvFalCysdavoBVDq7nR9P960YZzEEruNruRekmKEuw+EmAVF2ujGRyphcs?=
 =?us-ascii?Q?uvWa5hR/ebv3j7QtIi3lgi9iApXDGBD5uLObqRZrEmERXHya27yThT9TayFK?=
 =?us-ascii?Q?RjfHu9VPTRGTB0dHX1elGbV28WSulbBFisA6PrV1xkjfBLGtJd5SnT0XHJLS?=
 =?us-ascii?Q?TkB01xgzjjJnWQxtjPBV4GGJEfc/aFUghuhbxfb0Rb5MDyDw0FSUK1f7WjOQ?=
 =?us-ascii?Q?iz7yyc29evP58G99YR2mSk+Qy718URZznIVhClXwmmPokKlC/+ocP20OK3g1?=
 =?us-ascii?Q?76/A64kxRZ6ifTyf6jd+i2P6iuFoCf+27r3xqg8qd//Rmsxbkx3NzgmFixdW?=
 =?us-ascii?Q?noRak7kB7Ew9isqNStgswByK6Xt80kgpd2E8LTCnS7/c7/Q1aqFzYd8wl78i?=
 =?us-ascii?Q?I+fKUVgS3sXik6/9Jm2UBoySg6Ebh5P0eDlWlmB1Htc4GGtpWnWyCLFD6MzB?=
 =?us-ascii?Q?B0kX+TD3y7pKtrSNhr1Zjaf56oAO/89PLjkJcfEX38rgS/r8mfREoVivtp7X?=
 =?us-ascii?Q?HQEs/6X+q1GCmVK8bz6jeKGBpGv4WQqaP1Y/Yp9tWF0Vsx/XNsMV9rtwmXc7?=
 =?us-ascii?Q?uHy9K10Bd302P3KADCYUSWNicWEFwHfFA1k3GgGLCD/OPl998CmV4AryYSN7?=
 =?us-ascii?Q?ECqbN8GSv2r/UsWNKXzdGggSzLPd2FYvbX4ZnDrL1f3TxkC0cMvHMhvk35S6?=
 =?us-ascii?Q?8UDIHBmMneS0i8egrQk+J319ZkD96qJ72X2xGKF6xuIVGfIUsJHSCndFqGBj?=
 =?us-ascii?Q?3pNuSlLTnoBoVZLP/6yPGZAJQGCxX+r06RBrTseD8Y7PzE3QsHq6ncg4nAQS?=
 =?us-ascii?Q?EeDPfDFdHejVaiR/T8XgGjtP6pwDrUpI1hF3wgRZU+Q8LROZKn2rEkFAZ3A6?=
 =?us-ascii?Q?i/N03vbVgpQcHNx+4ligNquo95wG5IDxWVpbfhfq20IDguqDSO5Z+iIQtrpo?=
 =?us-ascii?Q?+73vbg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yZEgDHVRLk0KpR6leNd20oYgEO2dXWYlcZf2fmEhLLgUBhpAYpc86vF2TJUTarEnGGxJDzs/lWcDm64SN/nFbhbBy3Eo/gSHWIEIUhCQ5z2VaeNgi5ZoxpltVubd0lOTW0k1cAIUglpg0+ppQMefrBBYRmup91CreL7VA63PCswkipU4vpszUJp91NxWCQ8V3dshhikFsF0ZK3bsJBSDMfjsw2d8V/Z0Y+duUVE9+tnCyY4v6RgLUPwwPMpI9gSCn4LhkPrKyqkq0D4htOGga5/9TRV8KV5VqrmAT1MwQLrJhKmcvUZsaZwKTkO1NDzMi9h+tCmPazOD+f9TCO2nWg4UsSVoa/IbrqjDo8x8fZDCcvsBlyCCV+jx13OJPytDnnh7rgtGNw2CWoqN7NNykmV3LOMMqm53MRG6RjjhWudfst/6Ia+QYl5ygZYVNlwD
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 14:58:46.2408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37e70239-1d6d-463d-1aea-08de6efe3773
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6262

The documentation in nvidia-pmu.rst contains PMUs specific
to NVIDIA Tegra241 SoC. Rename the file for this specific
SoC to have better distinction with other NVIDIA SoC.

Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 Documentation/admin-guide/perf/index.rst                  | 2 +-
 .../perf/{nvidia-pmu.rst => nvidia-tegra241-pmu.rst}      | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename Documentation/admin-guide/perf/{nvidia-pmu.rst => nvidia-tegra241-pmu.rst} (98%)

diff --git a/Documentation/admin-guide/perf/index.rst b/Documentation/admin-guide/perf/index.rst
index 47d9a3df6329..c407bb44b08e 100644
--- a/Documentation/admin-guide/perf/index.rst
+++ b/Documentation/admin-guide/perf/index.rst
@@ -24,7 +24,7 @@ Performance monitor support
    thunderx2-pmu
    alibaba_pmu
    dwc_pcie_pmu
-   nvidia-pmu
+   nvidia-tegra241-pmu
    meson-ddr-pmu
    cxl
    ampere_cspmu
diff --git a/Documentation/admin-guide/perf/nvidia-pmu.rst b/Documentation/admin-guide/perf/nvidia-tegra241-pmu.rst
similarity index 98%
rename from Documentation/admin-guide/perf/nvidia-pmu.rst
rename to Documentation/admin-guide/perf/nvidia-tegra241-pmu.rst
index f538ef67e0e8..fad5bc4cee6c 100644
--- a/Documentation/admin-guide/perf/nvidia-pmu.rst
+++ b/Documentation/admin-guide/perf/nvidia-tegra241-pmu.rst
@@ -1,8 +1,8 @@
-=========================================================
-NVIDIA Tegra SoC Uncore Performance Monitoring Unit (PMU)
-=========================================================
+============================================================
+NVIDIA Tegra241 SoC Uncore Performance Monitoring Unit (PMU)
+============================================================
 
-The NVIDIA Tegra SoC includes various system PMUs to measure key performance
+The NVIDIA Tegra241 SoC includes various system PMUs to measure key performance
 metrics like memory bandwidth, latency, and utilization:
 
 * Scalable Coherency Fabric (SCF)
-- 
2.43.0

