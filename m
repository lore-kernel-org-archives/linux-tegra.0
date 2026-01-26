Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010020.outbound.protection.outlook.com [40.93.198.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12D934D917;
	Mon, 26 Jan 2026 18:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769451179; cv=fail; b=s/ufiKze4vQP7UMbm47cJ41qb4rRP82D6t+4YUOoQIFIsXvdtUodp4/bYZVoGMTvFMcLNg3yt+pQYN3d/4E2tcYqfr2FJTO4ZSgMqUH1tsaONFDSRp1dJyr2rJBWNUQ/mBxmQsJ1iMiRVvZW8+xX5k0l0NKQoH7iLwnLN8+qCXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769451179; c=relaxed/simple;
	bh=uW0U7sWv4q6D+t7dQEhGQ2iAta3BZxmXjZuKXSqECjg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=egVxGYSqe66zEOvmsyHyveG6On9M070qTFFIAFAKJn/QZ8qCrn4/6nYSXe2chxFexaSqJsocvkgNw058w6XK5KGrNZDR8kmiCt+Le+16IW8LYEOB2c4kL+4PFpvz8n/e7mMlIptY5LGxteXKRhPT8PfR0Qq9eMZSZHYhLnaPJ04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CITriqE7; arc=fail smtp.client-ip=40.93.198.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CITriqE7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CJT6mBVfkdhjAjM0vMKmwP44ZyO/1DdJmv3DPjrcCg78C8aWu5QDNpolKyHcysZqEl47jrzng9FShk7gGGQ5Rycur5kHXZ9JVt5yt/fKY9UmoHlBCxMY9DdYRu0h8u8/vKjx9MJ3O/53JdkRvX4GxCSEkhrEbnzaUoFX1J734m+S8VKTJASW6vqL39RWfxwC2y3Tz+Ds+wbzTu3cGDj0hHk/I3Ge8fZ4JSGqFnaIJR+wF/Qso8MMYkJcF1cKiqGDwfxVLQD/zEL6nktEg1i0B1pfVdttO/MQqz3c/1vw+4ZGRtcyIpyjRGHM6TYVCPiuPUY6OppLPe9yJ3zMZCLdlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qRL37xd9wtmmL9LmO6hkhJ+rDg1HbnpPEFTOE5j6uAw=;
 b=MDTSguK0jsxeMC2CEMYZ4nUbxValqMup4eX/pLPVdFuYgzf+mTCiNAAHkdz1KD+OvmcEQM7QF00lSlxzB85Ms1kBob9iFJ+KwxjA9w/jhBi4/KBlUkFh569J+ppaux1we87GdCDpyPbvAM1D2VOgFj+n0cP3arno4zCrGcMZC9pqKkECuf3aR5k51//xtZWcqtMbKnnucm9nicCYd8NVZluH2RhR2k/9k1Uqb0WVHNLSZE1mar7xz0kz953lSDAiwfSF5G0G8/pwOz0+zh5kF/WKntAII5wj0ZRsIQ0yuHwT7UAbyoEwAsTbp0SLV0qt1+gmG1hKmcLeFM+Oo92PGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qRL37xd9wtmmL9LmO6hkhJ+rDg1HbnpPEFTOE5j6uAw=;
 b=CITriqE7PMA765o8fDkbpShhgdhZmR8J9GXswtHHx60fe1lwLLR3GWrVeQ6VgrJK6y0NtU+UxCTFNpNrrFwGjQGnbw5IHkkZWtQV/hxHRC/hu76UWFFdLc+k6jC6TT6NFZcs0bK2jANbK4lsGbspvXemxcimqONCnax3sYFOGwcftdSiLUFNm365Hmz5CHolOKGxQ8f714S/E17xPYbtHARwjk2Am4ZUedhecEHl/AqU8bHRJsKUWLzzrilzIYC/6q+t+pxON1gBho19qHjmHvTjVI+HemIRLOo+HnRQdEo2/iFIK/DLEIZZxtdsVB2GTZCO8IoNdwOPJ69RGYeEhg==
Received: from SJ0PR05CA0111.namprd05.prod.outlook.com (2603:10b6:a03:334::26)
 by MW4PR12MB5603.namprd12.prod.outlook.com (2603:10b6:303:16a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 18:12:53 +0000
Received: from SJ5PEPF000001F0.namprd05.prod.outlook.com
 (2603:10b6:a03:334:cafe::18) by SJ0PR05CA0111.outlook.office365.com
 (2603:10b6:a03:334::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.6 via Frontend Transport; Mon,
 26 Jan 2026 18:12:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ5PEPF000001F0.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 18:12:52 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 26 Jan
 2026 10:12:38 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 26 Jan 2026 10:12:38 -0800
Received: from build-bwicaksono-noble-20251018.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Mon, 26 Jan 2026 10:12:37 -0800
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <will@kernel.org>, <suzuki.poulose@arm.com>, <robin.murphy@arm.com>,
	<ilkka@os.amperecomputing.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <mark.rutland@arm.com>, <treding@nvidia.com>,
	<jonathanh@nvidia.com>, <vsethi@nvidia.com>, <rwiley@nvidia.com>,
	<sdonthineni@nvidia.com>, <skelley@nvidia.com>, <ywan@nvidia.com>,
	<mochs@nvidia.com>, <nirmoyd@nvidia.com>, Besar Wicaksono
	<bwicaksono@nvidia.com>
Subject: [PATCH 1/8] perf/arm_cspmu: nvidia: Rename doc to Tegra241
Date: Mon, 26 Jan 2026 18:11:48 +0000
Message-ID: <20260126181155.2776097-2-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126181155.2776097-1-bwicaksono@nvidia.com>
References: <20260126181155.2776097-1-bwicaksono@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F0:EE_|MW4PR12MB5603:EE_
X-MS-Office365-Filtering-Correlation-Id: 1924f884-d81d-41c8-62be-08de5d068565
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xkCybv/wV7hrVSskD475cd0HvHBCOjKHGhhn136TuOQf9cvBOvYsvkuOYDMd?=
 =?us-ascii?Q?Qfhjgz+A3wH/CvP2LfvJsChjLCDzNsB99CAhItKlJiao9wqIPc4Ouz2I9mFX?=
 =?us-ascii?Q?W8MVfUoL1B7VSkUjg+a8Wb9Pbg9PTvhwoLigag9kOZCXqtDZ9Ogotsu/7rix?=
 =?us-ascii?Q?nYfAWtQSeRNYPmSEIcopN+Cuy0W4j+NttORm1LCfUCNK+tcgSWIEs2uzjb7U?=
 =?us-ascii?Q?LWIuVFUHu+LjGVpPgEYjfGccdm3V2o6k2xqavM8dCFYrM7xlsIOLmCfsCLcL?=
 =?us-ascii?Q?5yTc7GeFLf9JTOhTnZEl/LpGXtQPgqbEUTDk5t6TuGD8N8kJjxpXXGI/JG77?=
 =?us-ascii?Q?v7aY6tCuoDKMOZrTBilIZZSxO+8h5oVPVJOWyjz2nPdtXfsUR+cvQGqrRHzi?=
 =?us-ascii?Q?AK9tpOn29HbjGDYNXEk/xetGy3A8wa4hfvuyIEEuVziHPsnnaXfA8jBSHdhS?=
 =?us-ascii?Q?qzWT5k6vX9Ha+arx+hkbRvnPPv6BoD6JGVDY1iLfSaYOqduISOVw8KPfNBwR?=
 =?us-ascii?Q?hBZNmr5yHfHr3ocBeS+pyggW+ES+Bx+sShc3VMua4rPQPjAzH+JrZ2hgOYFb?=
 =?us-ascii?Q?epO+Y5O0uBB0yiM1UI4Xuh4z0KwUFR79RvU+Lf0QIsoqx6sc698ohZR8QmNM?=
 =?us-ascii?Q?IewDaU6PNHKyCgWHLsrLDmAiBcPunXxtOsq5YxdqzgaqD2muddyIXAu7Vs/Y?=
 =?us-ascii?Q?SpKn+tUrUijNoNrn10Y6dlUt+vvWmGx18P+9VAXhGtCj1mp5HwPfqEZxPYVx?=
 =?us-ascii?Q?j5HrOKi5Qt54xY3NQUHv8AeG4+DgPvBTevr6VtgX7RlebNvTY13yWvrs1nTa?=
 =?us-ascii?Q?BpOZFjRYt46Pgify8o4f+1bnd8/CyhKDT5MIvzIhOOMT9wmJ9LE4GvWXPoQG?=
 =?us-ascii?Q?SME0FHIHVDa9WX9cpYNBleLR9sOEaNAw14+1VIGqaRVV/NMJz7UADG2v5Gx1?=
 =?us-ascii?Q?m5p8P6mQWrm4RxGHJ/qwgF4O5PYwCPU+nyuj5FV01+BFKALwGNmOgN62WiEh?=
 =?us-ascii?Q?h4sx3+mFMnbvyLsHX8V7MrCe53qCZSlFSqJmVC//ywyc92mFphyi560vER7G?=
 =?us-ascii?Q?pn7ZHt39XtDJT1u//dbIuj4b7lsz/V92VAGUdzIkjJr6EzN0onH+c9mya0bm?=
 =?us-ascii?Q?jjhvipD5y6sZAQt4c5E2y3FrUhl+dRl/P6XvTebYfyUJqfCEmEBdL2Yamem5?=
 =?us-ascii?Q?56UCtxf/2Zoe+GFZatU13TKVJHhr88kcbgC4fHbtTqZcTpg5+FDs0w+hK08N?=
 =?us-ascii?Q?VmUaCeh5QY6qWUX2pwqagNf6ElS52Xlkbk3fMa757ugxCBVAmTKV4dH7jaGv?=
 =?us-ascii?Q?XP5A6ArVP/zeMr2JJhRfItbGL367FCm25pxF7r/7JjqnC+lgUvO4Ol/2MRai?=
 =?us-ascii?Q?VAuq9oBY3h5YjydJEmNbjs0KbUAzFTfdnquKnkRALSFEhzfQV2BLcYgQ35ms?=
 =?us-ascii?Q?D8WYOQRzbCwJDCPlrJ8qiBMeapHJwVrxR6U4Tjz34mST4DUUw3VCcc3bUxRt?=
 =?us-ascii?Q?MId2A3fkriqfNYWte/hi2SL8krEPtXX6ihAMlBpuqDanwDmxxGKsY2v4nAvd?=
 =?us-ascii?Q?zI04kvTrfPjEIppAmX1ibv+f8eZ/h3N19MJuAcrmfUcNIT/X7ngiE4H+U/Ni?=
 =?us-ascii?Q?DC3tYXMVZ0nG8YCcAkfG4Zp88KRprWVIy9tTNyt/gAM/0HRlANi7aoAWvHXH?=
 =?us-ascii?Q?05HnMA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 18:12:52.2181
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1924f884-d81d-41c8-62be-08de5d068565
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5603

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

