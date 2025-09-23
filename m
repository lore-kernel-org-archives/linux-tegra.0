Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012060.outbound.protection.outlook.com [40.107.200.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6348A1DC997;
	Tue, 23 Sep 2025 00:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758586875; cv=fail; b=WWKGyp0L/LZ5BY+cibvL3nCZXJXaQgcxVYldfWIMkEA3LyuQ/e8WkOScHrqtI8XNgATJYUFiMUEvA51yLsT+7C3PvERzYTs8dcLOCvbbCS+qxCKe+xx3oKTle7M4oxWyyBndE3dIvnL3HsotvNqYYgaWLauuTEHOaxdjmW9WyzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758586875; c=relaxed/simple;
	bh=qRJgQckacIWdlAZHCcPfz/JTQQNSqLY7Qn0FWEyuTzA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kqEfjZLMvSZEYW6bSlqO+pWKoYivkPJnwqL9kBG1fYD40nFbHlgxosgbcxEZmDpc+W1Hh4jDeJl+8WbX2YUDo3sl2Qa9EJUHJvEYaYDcB19kMuwnWULG3rrmsrYFdOt5BDU+QdZ3bkF+ojzO+RNvHLaw8qWmWdVoQuoZjLooB0A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MqDZkbg1; arc=fail smtp.client-ip=40.107.200.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MqDZkbg1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cOu/IWT2a7fPcvD0KxNUHfY1KuB3kXXO/wH1S8rbzJU3qBCKqAnweLsIToTQh/opG8EYxJiTa6etWw/Ce0RPIX1uSLfOWaUXM+j5NKfMDAOsklixlcnA4k7qVCVRxkv2/OAr10Vi817xUP9q3aGeWmqu4D9CGfhF0PRksH/O8TCHwTWFwjOvhIU46cEGsTPqrbFjq5RTl43Rad6ryihI1vx5/E0M7sQrPfTjgGfwGcGCYjEJ730GaN7RoFdoRWqPTekbZUEDFr820Tv83+jrO8D9iIAHplqAIYiXbjLFgja9yQBe3OXEQhhJNQTe7F6jJh9KNX3MeQ88t1tq89VBcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lq3diU7ewBtYebO25ZwTO3cBAfu/5zFRjTG3WOeYQlw=;
 b=ijsJr91OZRIQnrvIvR+LzBfTxZx7PpYSrA6/1T+eSpXPGJ7dqDDqYVdw9nnAVRzSBx37g2CivWmBUxEhHYfZ+zAIkxFSSyYnygFgalx2DbgbHekpIj+i5YwJaTiIw5VKxGQPuJrhi05xJLnWyNxZD7FLIRo3G6MWkKGoqCwzwpZ96IHkLsn3RivLHZjaO8J1o1NdxcdrWjGgWSgfvgX8U5O4RS17gLjr5C6YeLhpltyjvC1YlTgePqdp7DIKFzp0APAOeGa2IqnccsR+1FFOP7V03iO43e1dO4tQ72oy8FvBst8k7ImGRpHsor8tm3a1vTR4zlc6JGAKDU5svmLLIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lq3diU7ewBtYebO25ZwTO3cBAfu/5zFRjTG3WOeYQlw=;
 b=MqDZkbg1N6t6YPygiUaJnKe+TMAsu0ycKvKYFNcZopffSmtAhqM995LWRa6nsN25Pw0TXMtldfLEk5JMkkr66wZb1n7v6iuZmJIMbbDpHrA5L6sHiwH7XauDuK4X3/dq+ZeUAclhvyLMf3DqWCzRavKG+SkBke5W40P/R4uMRHJSq0/CcNYbeupfrkc8GeUZGa8MfKuY3mwghH4PWckmh2GebVdhHbhQwXZgeTZ9IqrMhJACv/IIgPR7UDHuzBe5vMcSP1OI2sJox2Y+lAlWkChRr2HeTp+5OfZQVMLB/JPc5P8edWuKptcTZ3yJFfeNr43abrOODm2XyZlPZYCelg==
Received: from BN9PR03CA0614.namprd03.prod.outlook.com (2603:10b6:408:106::19)
 by DS0PR12MB8414.namprd12.prod.outlook.com (2603:10b6:8:fb::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.19; Tue, 23 Sep 2025 00:21:06 +0000
Received: from BL02EPF00021F6B.namprd02.prod.outlook.com
 (2603:10b6:408:106:cafe::5f) by BN9PR03CA0614.outlook.office365.com
 (2603:10b6:408:106::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.19 via Frontend Transport; Tue,
 23 Sep 2025 00:21:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF00021F6B.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 23 Sep 2025 00:21:05 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 22 Sep
 2025 17:20:47 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 22 Sep
 2025 17:20:47 -0700
Received: from build-bwicaksono-focal-20250829.internal (10.127.8.12) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Mon, 22 Sep 2025 17:20:46 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <ilkka@os.amperecomputing.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <suzuki.poulose@arm.com>,
	<mark.rutland@arm.com>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <sdonthineni@nvidia.com>, "Besar
 Wicaksono" <bwicaksono@nvidia.com>
Subject: [PATCH v2 3/5] perf/arm_cspmu: Add pmpidr support
Date: Tue, 23 Sep 2025 00:18:38 +0000
Message-ID: <20250923001840.1586078-4-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250923001840.1586078-1-bwicaksono@nvidia.com>
References: <20250923001840.1586078-1-bwicaksono@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6B:EE_|DS0PR12MB8414:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ad9c191-0159-4d00-9528-08ddfa37162b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3HOxh1hk1xdo+EzNktlErC+SgxKWunih9KSZ0zZi2R966LO+C3svbskwsQiH?=
 =?us-ascii?Q?vdvu1iWYVzfkC7s2c8HGZ9PGoftD6bcPKnKVXWrdXzWrMJzDsEFGPUHv+J7b?=
 =?us-ascii?Q?z2ZYOgcPUO2v9VsFqmDl06qVSHiqQQlCRYjKb3/Nih6piUEUFFqSxmnciWzL?=
 =?us-ascii?Q?1WgIHFmIUVvwNagyZRupxWD1jV8MrNnOGHyy9ipe9loqhpNlcfT3o4qvfdQH?=
 =?us-ascii?Q?DIYNA0PZsDdGl30jGaDdVJsmnP1mnbjfiDH6yYMCHCSH6FfQq3B727xjRUuy?=
 =?us-ascii?Q?wbsvBAGK15iAmeWHLqNpkjP1B4Q7ri0rJo+m67oVq1cns2AZWFkoLwMFhPTP?=
 =?us-ascii?Q?WcNZ6QnZtkGgBKQzXCOUq/Pwqrq+EjbPwdG8KzVR7OQnB1N2ZBStW/M8pRPI?=
 =?us-ascii?Q?Eh99OT2i7DSbgZ4vahcNPAm0qyMY/DcU9fgf8XpLDZTsc9bjWLJktSwArU+o?=
 =?us-ascii?Q?x/QPTd/BD+q+1ruFR3z5CkYKfn5yC/o8yY3sej3kUg/9jTS9NTTlohp1CipB?=
 =?us-ascii?Q?yWKeZi191vcI0kiq5/ov8qFJDBSNVdjJeLPG3NdbYhLvqRghaFiuIt6QJMJl?=
 =?us-ascii?Q?TmQCGtjK3zi0sSqLe6ni1aeBUs17Ha14YWILAu2e3bgCyAEG1Y8GJaa5vjfB?=
 =?us-ascii?Q?aQmA9v7l4kpvggy2XYWV97HjJla7RSFcgZk4BXf+ynZkCArS9pn0sFxtpOJj?=
 =?us-ascii?Q?EzmyqcNqDsXafIHdl4C8WPhDA3aj7U01+y+nAOoYpaCz1Ot4fC9iyQTPOHJc?=
 =?us-ascii?Q?JqoR/kkZWxoBQ7RgTPK+U9RjuBwzhvadcP/ekEd3ZKV8vqFayOTWzXpGpZzE?=
 =?us-ascii?Q?slf0msBqTHplG5IaZx0BVsKy9Vs5kb7UdPvFEHQOIu9VDRR1vi/YiMxyRGo5?=
 =?us-ascii?Q?H+7lBaF6YKJ3cDuPewMg1ZdVTCMbzOa2FD2NcncN7LwXoxcYrqc1AbhsMqbl?=
 =?us-ascii?Q?SI4+Skt25Q7v/CTa2q/J+0rp4247nQoVGsCU4YR17Nr8Lv+8XLMGJJ5rDmYf?=
 =?us-ascii?Q?PW/umRQQQb1sKNMaKz/5jJYWISftqcmIgH63mKnQ3q+u27KpoqhfKAFHMjT0?=
 =?us-ascii?Q?mXrOnHiXQ3Dx5d9GwrrhevNaJzRDX6Qv1B9cmHEXdT42Y9LY1bKf9IH4eF+S?=
 =?us-ascii?Q?rY7xOoI0+P7uhyKIa/kY4NkM5xpLVQjTH2izVO5pUiRNK9eNf6FhMxBrbXUV?=
 =?us-ascii?Q?5k7bn+5HN7zkI+a29EfTh49rM5GfS5TRypvQO82L2vzTpbpyo0iqLu2tfX5d?=
 =?us-ascii?Q?+64B+mt92LJjWtuT/GKqWh5IJ3kvI/BdnjQOMdhzAegAqPcTv/C5DMg0TgxJ?=
 =?us-ascii?Q?GPLyyS0pLLMpVfwfq5R5JpSOs/3Ic9AZBk46H/URrbdgk0ge2ix+7xcSGEHg?=
 =?us-ascii?Q?FZckNXkG1fbL3byZh5SnAay+iw5DszDag0rzLisIf+U/TONAjpBNGa/bhIuH?=
 =?us-ascii?Q?H9vwKzDWxSVjbRU9zdkTaXwvaUA0BvU0ssD8Rz4TdD7XEWhmrVdGmsH/hw/3?=
 =?us-ascii?Q?LccGNtGmj20yLhbGmXAikme+X797+Ia451mc?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 00:21:05.6725
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ad9c191-0159-4d00-9528-08ddfa37162b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8414

The PMIIDR value is composed by the values in PMPIDR registers.
We can use PMPIDR registers as alternative for device
identification for systems that do not implement PMIIDR.

Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 drivers/perf/arm_cspmu/arm_cspmu.c    | 44 +++++++++++++++++++++++++--
 drivers/perf/arm_cspmu/arm_cspmu.h    | 35 +++++++++++++++++++--
 drivers/perf/arm_cspmu/nvidia_cspmu.c |  2 +-
 3 files changed, 75 insertions(+), 6 deletions(-)

diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
index 43770c8ecd14..d0ec1eb8272f 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.c
+++ b/drivers/perf/arm_cspmu/arm_cspmu.c
@@ -322,14 +322,14 @@ static struct arm_cspmu_impl_match impl_match[] = {
 	{
 		.module_name	= "nvidia_cspmu",
 		.pmiidr_val	= ARM_CSPMU_IMPL_ID_NVIDIA,
-		.pmiidr_mask	= ARM_CSPMU_PMIIDR_IMPLEMENTER,
+		.pmiidr_mask	= PMIIDR_IMPLEMENTER,
 		.module		= NULL,
 		.impl_init_ops	= NULL,
 	},
 	{
 		.module_name	= "ampere_cspmu",
 		.pmiidr_val	= ARM_CSPMU_IMPL_ID_AMPERE,
-		.pmiidr_mask	= ARM_CSPMU_PMIIDR_IMPLEMENTER,
+		.pmiidr_mask	= PMIIDR_IMPLEMENTER,
 		.module		= NULL,
 		.impl_init_ops	= NULL,
 	},
@@ -351,6 +351,44 @@ static struct arm_cspmu_impl_match *arm_cspmu_impl_match_get(u32 pmiidr)
 	return NULL;
 }
 
+static u32 arm_cspmu_get_pmiidr(struct arm_cspmu *cspmu)
+{
+	u32 pmiidr, pmpidr;
+
+	pmiidr = readl(cspmu->base0 + PMIIDR);
+
+	if (pmiidr != 0)
+		return pmiidr;
+
+	/* Construct PMIIDR value from PMPIDRs. */
+
+	pmpidr = readl(cspmu->base0 + PMPIDR0);
+	pmiidr |= FIELD_PREP(PMIIDR_PRODUCTID_PART_0,
+				FIELD_GET(PMPIDR0_PART_0, pmpidr));
+
+	pmpidr = readl(cspmu->base0 + PMPIDR1);
+	pmiidr |= FIELD_PREP(PMIIDR_PRODUCTID_PART_1,
+				FIELD_GET(PMPIDR1_PART_1, pmpidr));
+	pmiidr |= FIELD_PREP(PMIIDR_IMPLEMENTER_DES_0,
+				FIELD_GET(PMPIDR1_DES_0, pmpidr));
+
+	pmpidr = readl(cspmu->base0 + PMPIDR2);
+	pmiidr |= FIELD_PREP(PMIIDR_VARIANT,
+				FIELD_GET(PMPIDR2_REVISION, pmpidr));
+	pmiidr |= FIELD_PREP(PMIIDR_IMPLEMENTER_DES_1,
+				FIELD_GET(PMPIDR2_DES_1, pmpidr));
+
+	pmpidr = readl(cspmu->base0 + PMPIDR3);
+	pmiidr |= FIELD_PREP(PMIIDR_REVISION,
+				FIELD_GET(PMPIDR3_REVAND, pmpidr));
+
+	pmpidr = readl(cspmu->base0 + PMPIDR4);
+	pmiidr |= FIELD_PREP(PMIIDR_IMPLEMENTER_DES_2,
+				FIELD_GET(PMPIDR4_DES_2, pmpidr));
+
+	return pmiidr;
+}
+
 #define DEFAULT_IMPL_OP(name)	.name = arm_cspmu_##name
 
 static int arm_cspmu_init_impl_ops(struct arm_cspmu *cspmu)
@@ -361,7 +399,7 @@ static int arm_cspmu_init_impl_ops(struct arm_cspmu *cspmu)
 
 	/* Start with a default PMU implementation */
 	cspmu->impl.module = THIS_MODULE;
-	cspmu->impl.pmiidr = readl(cspmu->base0 + PMIIDR);
+	cspmu->impl.pmiidr = arm_cspmu_get_pmiidr(cspmu);
 	cspmu->impl.ops = (struct arm_cspmu_impl_ops) {
 		DEFAULT_IMPL_OP(get_event_attrs),
 		DEFAULT_IMPL_OP(get_format_attrs),
diff --git a/drivers/perf/arm_cspmu/arm_cspmu.h b/drivers/perf/arm_cspmu/arm_cspmu.h
index 21d7e6e2f2da..16799d596e9a 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.h
+++ b/drivers/perf/arm_cspmu/arm_cspmu.h
@@ -87,6 +87,11 @@
 #define PMCFGR				0xE00
 #define PMCR				0xE04
 #define PMIIDR				0xE08
+#define PMPIDR0				0xFE0
+#define PMPIDR1				0xFE4
+#define PMPIDR2				0xFE8
+#define PMPIDR3				0xFEC
+#define PMPIDR4				0xFD0
 
 /* PMCFGR register field */
 #define PMCFGR_NCG			GENMASK(31, 28)
@@ -116,8 +121,34 @@
 #define PMCR_E				BIT(0)
 
 /* PMIIDR register field */
-#define ARM_CSPMU_PMIIDR_IMPLEMENTER	GENMASK(11, 0)
-#define ARM_CSPMU_PMIIDR_PRODUCTID	GENMASK(31, 20)
+#define PMIIDR_IMPLEMENTER		GENMASK(11, 0)
+#define PMIIDR_IMPLEMENTER_DES_0	GENMASK(3, 0)
+#define PMIIDR_IMPLEMENTER_DES_1	GENMASK(6, 4)
+#define PMIIDR_IMPLEMENTER_DES_2	GENMASK(11, 8)
+#define PMIIDR_REVISION			GENMASK(15, 12)
+#define PMIIDR_VARIANT			GENMASK(19, 16)
+#define PMIIDR_PRODUCTID		GENMASK(31, 20)
+#define PMIIDR_PRODUCTID_PART_0		GENMASK(27, 20)
+#define PMIIDR_PRODUCTID_PART_1		GENMASK(31, 28)
+
+/* PMPIDR0 register field */
+#define PMPIDR0_PART_0			GENMASK(7, 0)
+
+/* PMPIDR1 register field */
+#define PMPIDR1_DES_0			GENMASK(7, 4)
+#define PMPIDR1_PART_1			GENMASK(3, 0)
+
+/* PMPIDR2 register field */
+#define PMPIDR2_REVISION		GENMASK(7, 4)
+#define PMPIDR2_DES_1			GENMASK(2, 0)
+
+/* PMPIDR3 register field */
+#define PMPIDR3_REVAND			GENMASK(7, 4)
+#define PMPIDR3_CMOD			GENMASK(3, 0)
+
+/* PMPIDR4 register field */
+#define PMPIDR4_SIZE			GENMASK(7, 4)
+#define PMPIDR4_DES_2			GENMASK(3, 0)
 
 /* JEDEC-assigned JEP106 identification code */
 #define ARM_CSPMU_IMPL_ID_NVIDIA	0x36B
diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c b/drivers/perf/arm_cspmu/nvidia_cspmu.c
index dc6d4e3e2a1b..b6cec351a142 100644
--- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
+++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c
@@ -322,7 +322,7 @@ static int nv_cspmu_init_ops(struct arm_cspmu *cspmu)
 	if (!ctx)
 		return -ENOMEM;
 
-	prodid = FIELD_GET(ARM_CSPMU_PMIIDR_PRODUCTID, cspmu->impl.pmiidr);
+	prodid = FIELD_GET(PMIIDR_PRODUCTID, cspmu->impl.pmiidr);
 
 	/* Find matching PMU. */
 	for (; match->prodid; match++) {
-- 
2.50.1

