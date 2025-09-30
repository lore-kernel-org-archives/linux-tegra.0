Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010030.outbound.protection.outlook.com [52.101.193.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8939195B1A;
	Tue, 30 Sep 2025 00:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759191999; cv=fail; b=JEYoDC8dl+0xZIZbufoD7Pl2qSJ1kOPL60EXRCxNpgLsKPPtUDaq0A+0q9DMCdvVrddYSM+cESxys9zfQaS/BRc0hbr8d9rDwrP2QSfEz5S9bNKh9BQmd136hePVH13s+gARbvJtqP3wrizCrE0+yjm47WbKCALtGGFcVG3DSpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759191999; c=relaxed/simple;
	bh=9wyZcV/bqeiSmO+ffV3UwdUgWTEI/+a3C+8gFAtEprQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MRIrgE9zE5VDu/f6e0+lA3kKcywHe4+CALIcrJOc8kHQ6ARBRKzOm9jEFIv2jY427R40jWSq/ThK6/MVAA/YRZnzaW9YJUEVC4kCsb5PI3zvbjrNat+UvHYRSvLHFNIiFQaJyZaJrNtfN8L4vulGZGszXG5eoFTVwfhf86RbXDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=n/RfbqZZ; arc=fail smtp.client-ip=52.101.193.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="n/RfbqZZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n2ATbIZDLwTavSIkyx2zCQvQjzrQsizgi1KeC1BjJg4npf2N8oWZEFpg5MKjml1Giwctqt8MI8eaAum/2cggCJ68ftJ30aTdlcegkDV0mzT7eEPm7lDzxgTeLojUWvCETAQ7S+qE6gYH7wtFX3JVdI1qBQpFgONG4JJHvmYhr804+8I9e3+A9++ovpu1HzZGSkpjceKAG+WeetKRgtr8i0OHyKTdSZy86i+U5QZgTjIA24p0CyA1JAEbaxcvMyPOwvOQ/4UW3+2IBD1cnNFZiPDLTXNGJj9Z0HAZVsosP1Y3cA9g3C/xpcRCQ9/GYV5/JUAtHeJcD4pppLsXMgwZ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mcoSLyH83u5vIrvg0WLBYhdFxJENHwNG7RTNXrnzRn4=;
 b=Reken/D0SHI57Tq+ziuD+a73C9P6lj8GogaZXBwzMFLOmJT7mX2PjTNpPUM/eCOw5ilHD5n3pFrUX3Tf0KFq1VWNTPKOSzv1TTBFOSvo1jEdVu8I9U/sojryd8biMnyPJ2j2EOEf3c8wBHYEvpvQ0pb5dNEeX1/C24xLFyFSNVscV+HZs05gRA4U26OUFFoRG753XOQcw7RTTC3NT1Jqk00BMe2Z4Z4Egu+glFDyQ0Ygtiehsg6iJRYVDN//xb4c/AEhCg+4WCLReuPwnPJQZ8DWkRVfYeCCPtguY6YzLGI2c07D2RGVVWj1X/X7QBUmTOd9qFd2B9yQ3hG07DdRdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mcoSLyH83u5vIrvg0WLBYhdFxJENHwNG7RTNXrnzRn4=;
 b=n/RfbqZZIMMCSuE+rL1u2tcGD6QCoBk3RJrGERzjPp6O3sPPrEcMO+WRqfHP74x9i6adcb3EGnS5pzFp539h8mmhXYVIYov1N6TQ351OkiJtwBY1qRTu3p7iTzrF02YFWY4hZhjm4FNZH6pqdxBqL+tlafqLr6eMs9BlqxvqgLX3wmKO0kcN6nJ9ph7T0Y49lq5xyODCft5MwhQNxDG+PQZSIZdfTdXWm0WhWPFGQlwrsQS4hqKrGkQGHZwktyV5Uil2Hs+4HZux6MxfrVf5GX+IKOsioVCgK4PKM9etnkA8pHp6pQD9HAuHqVr1mFiMGSTxSgiX0z0p3qeHXbhRSw==
Received: from BL0PR05CA0024.namprd05.prod.outlook.com (2603:10b6:208:91::34)
 by LV2PR12MB5846.namprd12.prod.outlook.com (2603:10b6:408:175::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Tue, 30 Sep
 2025 00:26:34 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:91:cafe::df) by BL0PR05CA0024.outlook.office365.com
 (2603:10b6:208:91::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.13 via Frontend Transport; Tue,
 30 Sep 2025 00:26:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Tue, 30 Sep 2025 00:26:33 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 29 Sep
 2025 17:26:23 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 29 Sep 2025 17:26:22 -0700
Received: from build-bwicaksono-focal-20250829.internal (10.127.8.12) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Mon, 29 Sep 2025 17:26:22 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <bwicaksono@nvidia.com>, <will@kernel.org>, <suzuki.poulose@arm.com>,
	<robin.murphy@arm.com>, <ilkka@os.amperecomputing.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <mark.rutland@arm.com>, <treding@nvidia.com>,
	<jonathanh@nvidia.com>, <vsethi@nvidia.com>, <rwiley@nvidia.com>,
	<sdonthineni@nvidia.com>
Subject: [PATCH v3 2/5] perf/arm_cspmu: Add callback to reset filter config
Date: Tue, 30 Sep 2025 00:26:01 +0000
Message-ID: <20250930002604.346306-3-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250930002604.346306-1-bwicaksono@nvidia.com>
References: <20250930002604.346306-1-bwicaksono@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|LV2PR12MB5846:EE_
X-MS-Office365-Filtering-Correlation-Id: 46e0a2a1-2526-40cb-2f36-08ddffb802b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ur3CPgF67NIoK1bJD93IxlonX1A54jIRtsrxOW1ZatsEeFI1mzTKatfsgZBN?=
 =?us-ascii?Q?ks1R1t38lfIOK4JcDO0IoPnFkH59NKqgboVNp45cLQepTveQJyNmWc6t1Hp1?=
 =?us-ascii?Q?7jNOeg2QTTP3Aht5UVgLDpM1ASDcb+HhqX47HtsbsNG8fmyFBSPhLpYAtx1/?=
 =?us-ascii?Q?+Zw8PxaZk/NnAImTESv4jBhPFT2oSmFfrjGBw54MeIbq45+VfDrKh51xDNFG?=
 =?us-ascii?Q?m8ZwJ55mEa+81BZQMtHSHw/CuwApagd6n1NGZtz/Cg9c3D1GImjlS3B6GS2/?=
 =?us-ascii?Q?S51UTZK9gSSgGtauiOGK5aIp6rSCJW6nCjLWgrGKa6t4qlpeCi3Qg5I00OAT?=
 =?us-ascii?Q?x6pS1Ol2psh4gbDL0MU4UTwIvYUVNHC5v8xEEAvYb4SS7f+GabpRAttHbSaP?=
 =?us-ascii?Q?9ZxQT1WY2Mqa2mVQk1kyC/TmNPNDGYqIys9gOd6iGEdC7jqG5eulj40Tf336?=
 =?us-ascii?Q?IZlp+hMXNikD7EZ7ONtqrgQnLhK4nY6I9xpNYrpFAVWv+K2w8hKdlDFlVw5R?=
 =?us-ascii?Q?o2wGgQxls/dIo6WTJ7f0gr9kOLT+urCTiHdR9/4ZVImtOOFokO1PnexBlPBF?=
 =?us-ascii?Q?DgAO/r52+1OUVRVEWlEgGAoVG1P4Yq6vFaBI3rY4ZHd1KNzca31rx+G8qnvE?=
 =?us-ascii?Q?H+BRUgdm671DFj0k+spHIwvbpt/MWSup1uNXsIisOzzCvczqxBYDGXLntydZ?=
 =?us-ascii?Q?JiQWchJmX3uBQ1Byci4cMF8AJOCGkeHpeQZ3xrro4FrQELnCONAECv5LRD5D?=
 =?us-ascii?Q?gLw8kuixYv1qObqs3R/J9yWaRvHwb8ZdwRvrXx+ELmhZxq2HOOzXNYmdFAGJ?=
 =?us-ascii?Q?95WFfyy5BZG9ZWFXJ7wXoVow4z1z6YvIoknsRxkR7r6KArSEkKpKIz0k3TVM?=
 =?us-ascii?Q?R9K3gZIVZlJQVXyOhrZAfeCKDgogFHodkL//r0vs3NRJ6kbNPXYMKKhaU3Su?=
 =?us-ascii?Q?uWMl8TzdEODDSzu9V8y01R3l6kC/BUUsZ0KeXXswJ/jtoiwpNC+6MCNMwwWT?=
 =?us-ascii?Q?tJf8RQYtTG4aEOTKwsYNngxrfppgSYIwl9HODRCw3CPpyY9koAqm9w8MXcIi?=
 =?us-ascii?Q?2Y/meT15lU6mYWjYdkjOuWZ8OU3+bB4hhFZcVbYYln21K5TNZtsR9WKdX8su?=
 =?us-ascii?Q?IMmTozddrtdxCXYzr5cNgTuu5NVTtOrP/BgiFPzG4lHKmwA43FwXzhJkCpEp?=
 =?us-ascii?Q?bErPqs3jPzw0usQBIQzYDX3Z0UCwJB9QfkKQ9Ve9AdYvxX7UkqvIbJAtxmnZ?=
 =?us-ascii?Q?8R9ADhSoJT66o3Oy6SMo/UDlM3OW4hJhY9vtoG5FRoxqph63pH7DADUkaR8V?=
 =?us-ascii?Q?EuARUA475BzqnXxxKEtDndzKSmqg7iay2v+N86sZ97l7Vb6ZpbFzlvT52Dun?=
 =?us-ascii?Q?G5lhfdyP0bFtSu61S6HwiKOFETSrfQzPK0llBrFR99JC3CMrZHf5LaHOFeec?=
 =?us-ascii?Q?CZzlcXw6ns+RwsfbpfM1I2hFtCwt+dqhRYM+T2D4MNmy7zfw4zgOADMez3Ed?=
 =?us-ascii?Q?jvEkj/FxHq46LBvKqBpFT+FKUIgUtDys+LepzxlUeNpnawE1IFYCb4O7up94?=
 =?us-ascii?Q?c3JJAyL018Lu0kzbS4o=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 00:26:33.9344
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46e0a2a1-2526-40cb-2f36-08ddffb802b8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5846

Implementer may need to reset a filter config when
stopping a counter, thus adding a callback for this.

Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 drivers/perf/arm_cspmu/arm_cspmu.c | 4 ++++
 drivers/perf/arm_cspmu/arm_cspmu.h | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
index 75b2d80f783e..43770c8ecd14 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.c
+++ b/drivers/perf/arm_cspmu/arm_cspmu.c
@@ -815,6 +815,10 @@ static void arm_cspmu_stop(struct perf_event *event, int pmu_flags)
 		return;
 
 	arm_cspmu_disable_counter(cspmu, hwc->idx);
+
+	if (cspmu->impl.ops.reset_ev_filter)
+		cspmu->impl.ops.reset_ev_filter(cspmu, event);
+
 	arm_cspmu_event_update(event);
 
 	hwc->state |= PERF_HES_STOPPED | PERF_HES_UPTODATE;
diff --git a/drivers/perf/arm_cspmu/arm_cspmu.h b/drivers/perf/arm_cspmu/arm_cspmu.h
index bba513224586..188a884b4494 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.h
+++ b/drivers/perf/arm_cspmu/arm_cspmu.h
@@ -153,11 +153,13 @@ struct arm_cspmu_impl_ops {
 	bool (*is_cycle_counter_event)(const struct perf_event *event);
 	/* Decode event type/id from configs */
 	u32 (*event_type)(const struct perf_event *event);
-	/* Set event filters */
+	/* Set/reset event filters */
 	void (*set_cc_filter)(struct arm_cspmu *cspmu,
 			      const struct perf_event *event);
 	void (*set_ev_filter)(struct arm_cspmu *cspmu,
 			      const struct perf_event *event);
+	void (*reset_ev_filter)(struct arm_cspmu *cspmu,
+				const struct perf_event *event);
 	/* Implementation specific event validation */
 	int (*validate_event)(struct arm_cspmu *cspmu,
 			      struct perf_event *event);
-- 
2.50.1

