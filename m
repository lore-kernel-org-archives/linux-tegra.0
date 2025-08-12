Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2044.outbound.protection.outlook.com [40.107.102.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D391A2874F0;
	Tue, 12 Aug 2025 23:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755041908; cv=fail; b=tk2ZhVsz+/mtTy2hGWPG7SO8xzyvhMhkIhilk+IRCQMZ264ht/euZ2nZefOHmp2d8PdrUYSq5cHmFoXDJvZdwpOoyZ2Q7PC7Q7zoMqXx3cCwocxmMms92vM05wykrck2Mh5Oq37NjHESDDHRACsZj2WEZdGYV/+hTJjuS1+d7oc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755041908; c=relaxed/simple;
	bh=/Ytx/vrznCFwcwIM3KDLKoCSXhekVzIt67Ym7Aa03CU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eMiaLWQRp0YuTDzc2h0lJS9Q+Y4J2KqBWY5K/09VbDhBjsCfvp5FyCX/rNOQ2kCCJCQWxQzW6lJphqnaR963ja7iBlTroRU1rU3AquLYGF5fUh9T1V2LaQL+3KK5nBObAoyJmf0E2LIj2mqivDadN75AilH2O+PN/0yuRzB2LQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Imh6cHGV; arc=fail smtp.client-ip=40.107.102.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Imh6cHGV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g0lDQTFcJdUu1d3kZFPdXd6ezbGZMLjFXBFb6XTUo0uCo1o+2FfAasu5QnQrkrIJwpOFLZ9M5CXClo10fY4UtBoSWnwjqYU+teupmXSwi6cKrzY1Sv6VzJ691+hvSufGhPP4I62jZoEh0YvSm+Cyss9J4mB/NsB4TUtr2ou+PwhBPfGeLJ32s2V73j8aJyWpO79rPmSJx6InS8bVSq/ft2MmgvQ4nz0gIolMn7sHb4HHmMQB0GuJYwIw1SL4h4yIxIp05T6hBHopjphAyibNLuMzoyYjkHb8j6PtM8XqqR9hCLIyZp3HyyyB0ln0G5NnclLILYEgBNGr7v2KmT6Gkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pzXeE6fbJG4if83P2sUDSzaFmYJrNDbe/dcvCaRJdqs=;
 b=J03y8OjuhnE4jtJZ13V832BzZ5vYtCrrPLiYTfCtOa6+9wZ65F8v7EoMnYKaIgnCZGG3P3Mp1UcEnSqlPwUBuxRveuj25OtAGyP6Ud8eAjZXE6SDqYe1nMSYrVLJ4cHK9bLhUNAFyYFagCuH0jrsjutCOx0noeh0menxIpaEhXoRb7idsxLTJArEzKhyQ7KdYktJaGZ/K1E34Te16ImoZXuXOAm1LSemryWQxcP/4JGOEqmSohUv9xj79xcj/DDn122qpRn7h4ogVVfTgirV9Ej7XTSOuOwLXg4xlr4wa9bxgx1eCiPoNOLfbd7UGfXvjDVYNjkwmTtcOAfgB3aCdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pzXeE6fbJG4if83P2sUDSzaFmYJrNDbe/dcvCaRJdqs=;
 b=Imh6cHGVs/ujYo7AkzYrzcHuVICMEQMXrPPXdEmhTHGgih1+B50ioagbUhFY8Ef7zIOTe8Hisoz/7I5CxDUI48eXwQZm2vYktjG2fbYfmljol/zX/XfPvd44En74rAKeXGBrfkZyvRuXVwHjBoAeLeUQdOyF/x7pk9jCnFTf8T6PjwSyPzPTgJrUs4EK8QACIo2gTOzwze2CuTneWAcvzCv55lTqX6kU4wZ6TJ+f7XPFfdXW/6MPMWdFMBfATE7Asjes24gQgdPmmS6fBZJTcStKYQ4ysv1rJfkEOZd0tBgKmm2gjOWWhi14V8fowyAxwI/6w7xL+csoq4X5kVINaQ==
Received: from MW4PR04CA0330.namprd04.prod.outlook.com (2603:10b6:303:82::35)
 by DS7PR12MB6142.namprd12.prod.outlook.com (2603:10b6:8:9a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Tue, 12 Aug
 2025 23:38:21 +0000
Received: from MWH0EPF000971E8.namprd02.prod.outlook.com
 (2603:10b6:303:82:cafe::a2) by MW4PR04CA0330.outlook.office365.com
 (2603:10b6:303:82::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.15 via Frontend Transport; Tue,
 12 Aug 2025 23:38:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 MWH0EPF000971E8.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.11 via Frontend Transport; Tue, 12 Aug 2025 23:38:20 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 12 Aug
 2025 16:38:07 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 12 Aug 2025 16:38:06 -0700
Received: from build-bwicaksono-focal-20241114.internal (10.127.8.12) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14
 via Frontend Transport; Tue, 12 Aug 2025 16:38:06 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <suzuki.poulose@arm.com>,
	<robin.murphy@arm.com>, <ilkka@os.amperecomputing.com>,
	<mark.rutland@arm.com>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <sdonthineni@nvidia.com>, "Besar
 Wicaksono" <bwicaksono@nvidia.com>
Subject: [PATCH 2/5] perf/arm_cspmu: Add callback to reset filter config
Date: Tue, 12 Aug 2025 23:34:08 +0000
Message-ID: <20250812233411.1694012-3-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250812233411.1694012-1-bwicaksono@nvidia.com>
References: <20250812233411.1694012-1-bwicaksono@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E8:EE_|DS7PR12MB6142:EE_
X-MS-Office365-Filtering-Correlation-Id: f12e630d-07f7-4451-5787-08ddd9f9526c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Exq5TMNuoy3C0+4WH93q9guVM6azv0cSNTduBZRMODNIDOtfuhvyyMfbWYRi?=
 =?us-ascii?Q?sMLAMty+3vZLkd3SiYvIGs/Ys3ZDqugz4WGPLxe23+qOdrApWFT324VW4kFb?=
 =?us-ascii?Q?90s00BwNQeQWhrMAF/aBMcdOJKQppeyytYVwX9pNLXTfS4ba2EEpsnqQNdG2?=
 =?us-ascii?Q?pDrlFOoviPaF31yIHM3kSttM3XKuZ4+embOFb1njqocTrfImJifpn/2zDtDg?=
 =?us-ascii?Q?6RR2FwPRrZ1ZMusxDte38wRXACsOix+h1VCoG3WV63j0DgemYfqsXJ4ztsGZ?=
 =?us-ascii?Q?x7hJ0mODsEjLqoBYtJj0Y8wPgm0vy9QGu4v1wqZQ65wAlmzkc5WpyhFJuFK4?=
 =?us-ascii?Q?2ciTbWDSjcjO2rQ1ujdovnFJk63K9HDckIIjF3KMxnsh0qRr7JQtirYijsSG?=
 =?us-ascii?Q?A9PIeb+EDgVKbAE4adbQ1QxRk6AVIs9GXXB5yhwKq3GYA2zc/fRdEC9eqenz?=
 =?us-ascii?Q?EECZpaBY6jP5tNPr+ZjGIGBwHXX0tT98IY/hmWBAXBZIu5d3Kkf1fO63WqGk?=
 =?us-ascii?Q?ZcJ13s7siII5tkpOH8nYcOF8nXqdDhxGibhKEXPl5AHip5NH8+FUY5moj+Ag?=
 =?us-ascii?Q?/PMT7Wx1kbjNrtH+P6WFJEqAmXJPHWEX95RDBj+eUT+YZTj/ItX2TtIXhmHs?=
 =?us-ascii?Q?Gaqw7pbjDoNP3bWHo2PfKUV2tcylbS5ZQ8agQ6ilu5Q74W4j4M36RtXN0VLR?=
 =?us-ascii?Q?RbcYrBoC6FJU29EzaY8f82lQtnA4zfxn4Cmx3O843s1m7nIW4KKVrgGa2VrR?=
 =?us-ascii?Q?9Pc+KWjfxGL8NkO1UMX7RqlAjb1RQIZfDyOvbliHfq8wXrxAUWFbKPC05xkC?=
 =?us-ascii?Q?Pc5tw+/yXgGV/PHcHpvh9kNiQe+l0nw8tO49Ur2r5Zm83yYrCghfwYbOJ9AF?=
 =?us-ascii?Q?QXVNvVcW5/iOvrNRHDRJzgRION3XPtCiHjzC8uPNRwdQhaKwaY8BPFG0oWrN?=
 =?us-ascii?Q?aQIeSYgWV7+gc+7xXkitNDYHoIe2hM6l6bKhHhVIODW3mF2gM/VD0v2sY8tl?=
 =?us-ascii?Q?3AFPAZkgJKpOXeRU6+GGCEoFjK6AeodxzC6JVuoCFHp/K8+LKQRGWyEsraCX?=
 =?us-ascii?Q?pZhJm8PwnL0rgUJnu1PNWzcqubj45IYUuBS48WONFp0XQ7B1N4PXXJVoV7bb?=
 =?us-ascii?Q?df+4NyXxnepc4s7QnQp0/7/x03Q3/ppdxCOpC1roofQ14hHLIpk6zwAwt0GL?=
 =?us-ascii?Q?pr0KvRWHEMkaomcPQkH1k78exQgt0g5KsUgUIpfC9lL/PQg7FJnVPaHjkJq6?=
 =?us-ascii?Q?ZaCcco5VUy549LCnLjrjUpC1+OEg16GJiMRMCxXlXNSmWor8djWyL9yORt8V?=
 =?us-ascii?Q?pwnrinXyXBQ0027hDfHD6IjSqHDOA05P5/nbmPMQER4FNtshGYvQqWh4OCob?=
 =?us-ascii?Q?9iLWF5JdemE+xKbgH6Um8kHsSrdNv9AiPI4Ar51Cf4aqNuDJ/K8CM20dCWTz?=
 =?us-ascii?Q?LLUdm+c6f/hUpgtN4gXASZoc1BJ6Rke3JfvzrRP28QiH/ZPVBw7pedB4U7rw?=
 =?us-ascii?Q?89xOMXjo7qg8XU+PM1Hrznktj3dbqu/9Ahre?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 23:38:20.8532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f12e630d-07f7-4451-5787-08ddd9f9526c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6142

Implementer may need to reset a filter config when
stopping a counter, thus adding a callback for this.

Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 drivers/perf/arm_cspmu/arm_cspmu.c | 4 ++++
 drivers/perf/arm_cspmu/arm_cspmu.h | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
index e4b98cfa606c..595e4bdd0b4b 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.c
+++ b/drivers/perf/arm_cspmu/arm_cspmu.c
@@ -816,6 +816,10 @@ static void arm_cspmu_stop(struct perf_event *event, int pmu_flags)
 		return;
 
 	arm_cspmu_disable_counter(cspmu, hwc->idx);
+
+	if (cspmu->impl.ops.reset_ev_filter)
+		cspmu->impl.ops.reset_ev_filter(cspmu, event);
+
 	arm_cspmu_event_update(event);
 
 	hwc->state |= PERF_HES_STOPPED | PERF_HES_UPTODATE;
diff --git a/drivers/perf/arm_cspmu/arm_cspmu.h b/drivers/perf/arm_cspmu/arm_cspmu.h
index 36c1dcce33d6..e3a4dd068805 100644
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
2.47.0

