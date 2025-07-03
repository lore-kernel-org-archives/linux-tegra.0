Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2070.outbound.protection.outlook.com [40.107.102.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8492E3AED;
	Thu,  3 Jul 2025 10:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751539157; cv=fail; b=qsBjf28/mG4qj+HxogUGV0Iwa9TekpNW32f/0amPq/l5uPdb2P5GXaQUc9xf+SVKo1yEtVqnPDmt/A+EJZgTOMCZFsMTH567k6tH/GYl+hdQzD8iLjdFFwzdNRljQFYXszjPvhrmQ6/kTWmwAFOn2o2qxgWOqGfqjtlDWPNM1tk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751539157; c=relaxed/simple;
	bh=GAd3Hu9DwxYJziad3smIK9XQIX83WSA458K0FDZ2Dn0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hz7qwIOQXmYG6MukcYehnlDrYFDnXpf/t23oaZ4jII72KuOUnSGfo69TsRS6D2A59h/5mdNa6ei+O7P0o/l+BEOItRnNYHIxV5jS9jevlfaQVLepgYLAmNrl3hOJwDUUAYDNBV20qaIxrwQxLWcu+BNKQi9btYbIJzzbP4U+rs8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZxkjrWgP; arc=fail smtp.client-ip=40.107.102.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZxkjrWgP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nXG/m/7pR3Q2Gga2znplquXMbaqqCXbJmQRftZfGAf592rPrSZgDFRZ00v6dyBaHwPmLVbFy4gdFcBelKRcP1HruwhRhw7QMWuorbOCJh4QPfVkr0c3zhx95ltVK08cKb4RuWvsTyBRT1IXhcuMJ60eaxbZpKHT+DHaR/iHNpGhLjhlpZwf1UZKM4IkKDdQ/qkKNM6iSfC12ZHLepnGR74/23Uiz3uQoJX83phVB4F4ZR8Iw/JGLC7g+hD6DpR6xPl5I8gkc0OWjNaITQlPj9K9NLnNiCnrQE5InddGsTGkb5RwAb2fX2LY3YrMzagl7AIHN0adCu/DRYZ60r3CMnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mX94FYAOioId3W59YqPFeA889HLqKEb1R7tsmPrrbTE=;
 b=s7tq3vLCtoLKwhOOSyojnBDzLxjIucVMvCfHS8DDsas1s+o+WrYbl5Nbz49vDtuoytpssnyH5pqbvImcM10jvf1zHKj+JVb+u7IqXYbPVLFn8pxHr4QcH6/hGRj/0roJBqKa9lYYQ15L3oZVhijPK6CvfB3uiJRjVUMB8/ZLnbVhiZnx41Z/k6GVCvJLNKcWdvTrAUrcIRtEV13qfPLwJv/4JAzlYIw5hT46KeWnpKpJUfn3Kgv4LrnU5auifzLggY7ydJYtIsMzSQY1htneId0ogBauBaGA9ppYS3VP6lKgmCfEYWum1TcYGCo+wkV6fOzlfzYHLX3Et5YnGyqB8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mX94FYAOioId3W59YqPFeA889HLqKEb1R7tsmPrrbTE=;
 b=ZxkjrWgPe/UlzZHzmnGUIVQymQxd/jVdMjjNdGrd1zs+BnHUojDRVdoFI3Bo9/j5RpO5VaHT7lmM7o4r/OuM4kz8LTjRH/UonMdhGkMbSTM1fGg5Hm1TQTCH9gZ25NWLYMOtSHWerH5FjjOQQSGs5xyNVp5QOCW9Ji/WpjHiRtGqID46H+ZTOiqy04+iC01KT1nZovX3nYx1uWyhMPomntYhruFcgd9tOdIuCq+m8phn7cutq8Hc2bKg2CezSeW9ZVrtmLNOyDQFYPFlPUDQ3oO52/36M9rICINkS6ZtGC/FgV0mn6n4obaeAL/V32VrqpWrYhKc3ylEMbp9V4cv1g==
Received: from SA0PR13CA0011.namprd13.prod.outlook.com (2603:10b6:806:130::16)
 by LV3PR12MB9144.namprd12.prod.outlook.com (2603:10b6:408:19d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Thu, 3 Jul
 2025 10:39:12 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:806:130:cafe::c8) by SA0PR13CA0011.outlook.office365.com
 (2603:10b6:806:130::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.12 via Frontend Transport; Thu,
 3 Jul 2025 10:39:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.20 via Frontend Transport; Thu, 3 Jul 2025 10:39:11 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 3 Jul 2025
 03:39:01 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 3 Jul
 2025 03:39:01 -0700
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 3 Jul 2025 03:38:58 -0700
From: Sumit Gupta <sumitg@nvidia.com>
To: <treding@nvidia.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <tbergstrom@nvidia.com>, <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [PATCH v2 5/8] soc: tegra: cbb: support hw lookup to get timed out target address
Date: Thu, 3 Jul 2025 16:08:26 +0530
Message-ID: <20250703103829.1721024-6-sumitg@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250703103829.1721024-1-sumitg@nvidia.com>
References: <20250703103829.1721024-1-sumitg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|LV3PR12MB9144:EE_
X-MS-Office365-Filtering-Correlation-Id: ae52d5af-05b4-471a-7d14-08ddba1dd935
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rpagjnTY+6FfdeReGOuZ4veRHPUjrnBiuqkEd7emDph/5A27vCjgBe3QibKb?=
 =?us-ascii?Q?JiFcswd9RxoA8NaIl8FRLWxGB6wRo2iPpRJ3UTJQyNyawcmP3HxLPE0NDJCi?=
 =?us-ascii?Q?c7S83aD21ZQLkY+AxHQ7UYRqPkhO2SmcnZGZRb/Wuk7ELhn+JtLcuRrxxBEf?=
 =?us-ascii?Q?0vUJ6sfP6yrtEM1joWZ/d7ahL+EWcSZCoV+CcZLipuQbE2T7zgkT3K7l4wjA?=
 =?us-ascii?Q?VzDB33i/AcXS9orcV9QTqHGuWW+Jew/v5KIKgeNYz2xVRAITbjupAYHR4kmG?=
 =?us-ascii?Q?bCcuUOWCgx5Ff//wt6raLNqEd7XVi3kXrG4GO40ZY8WNuGOR79d3IJQUUBGx?=
 =?us-ascii?Q?XtDY8PBsNUfKDwPYsiDHp46fkm6b6skrVomP0rdTlx/KmrzIfCUsEUgSXEmx?=
 =?us-ascii?Q?cxyhl1ox3LQivr6jlpSWuUgeLlvhhOWdc388TYVnpLMADIyETqVyVwLMeCqr?=
 =?us-ascii?Q?vpXlDcciF4nzHOdPI7fIOqtd5afUme5+aO52WzPPbmKMfOssWczcLWKXL9mV?=
 =?us-ascii?Q?2uWXj3h8lTr1bYn8mntMiMY0ANoLEW98fjDC7LJYsuNmxKt0Hba9KWat1iBu?=
 =?us-ascii?Q?MwW2NDJhbRynJIFEgGuEALV/2iYf9zgee5+pfCpR73ltMkYUEL7XU+rh/18j?=
 =?us-ascii?Q?X5Twc1S1hTk4DCvry07O+SCpnhJEtu3ffihcNnvs/+SGAC2W4rv3UlBDjBQG?=
 =?us-ascii?Q?xeSZ9EMEH6pFbBCzO2exP/yfio0N3FFblZBx9qWNxFIq5mAlMytGHkxrrmU/?=
 =?us-ascii?Q?X6Eowjjdx1b9uZEcdVAtg8nyfP9UPdjrznBvSN/esRt8HUzPkJlZgGWRUTmf?=
 =?us-ascii?Q?L/1ebZ4gJTkCMSd3NquxFLltkRdZ498VXe3F9FC/rs6vKgqTNiIPjOaW4USk?=
 =?us-ascii?Q?0D/oEov5aAmMhL+kJtE7wjcCw/TjaN6mzqwQ2hbkmrNi3zkiNML8ltmb4wpk?=
 =?us-ascii?Q?+OZHRihOmLdWwJ6ouwZzWvidJvQpTXw+qr8uEGnkVr0ePWwg96rXAWxmlXNw?=
 =?us-ascii?Q?MFqpshwnnxM+RxahmcA59cczpEZth5aeIRdcHB7D/sQLU+vC10K+gUTjn+gf?=
 =?us-ascii?Q?N+G/GQQSnJxpv13PWoe9LRqr+3dvF5JNuTLPwqPXtasEzCvalX9UyEN7QrVj?=
 =?us-ascii?Q?bhOBt/Ygd7t6MvHYDw9nq8iGhgTHa2A9CZz7B6jf96IPAZGociISuCHq+uxL?=
 =?us-ascii?Q?nwWTpx+vX1AB5ilT7DhApPoXFox9burLQQEdeyrMmHCjiZWODMmcnpczD7ei?=
 =?us-ascii?Q?6JdfhDb72FXzRWlfj7vpkyx6dC0eNC9OA/QcilQ1khMXvsgJrb2t4kEKQJis?=
 =?us-ascii?Q?0oGKFtIM3YaJbej/q2giD+zc6V+KkfmxUrJKrBbLkcQdJYQM3C8x1du5UuoG?=
 =?us-ascii?Q?ORenqrY27TIFTnCd6EYkmTy1QNNUZQARqmKfi8yapF2rCSffqznyMqEMV+G4?=
 =?us-ascii?Q?7q8ydlF4iD/i6zASTCE8FZtz+7eVQtYfun38kcEghmKQsGuASrxpmwBl/3+D?=
 =?us-ascii?Q?5JNCnB3o//unq4F4B5DeZ7O7gqWlVKXMFeVh?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 10:39:11.5970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae52d5af-05b4-471a-7d14-08ddba1dd935
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9144

Add support for hardware based lookup to get address of timed out
target node. This features is added in upcoming SoCs and avoids
need of creating per fabric target_map tables in driver.

Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
---
 drivers/soc/tegra/cbb/tegra234-cbb.c | 41 ++++++++++++++++++++++++----
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/tegra/cbb/tegra234-cbb.c b/drivers/soc/tegra/cbb/tegra234-cbb.c
index 10f57f17fee8d..aab0cd85dea5e 100644
--- a/drivers/soc/tegra/cbb/tegra234-cbb.c
+++ b/drivers/soc/tegra/cbb/tegra234-cbb.c
@@ -30,13 +30,17 @@
 #define FABRIC_EN_CFG_ADDR_LOW_0		0x80
 #define FABRIC_EN_CFG_ADDR_HI_0			0x84
 
+#define FABRIC_EN_CFG_TARGET_NODE_ADDR_INDEX_0_0 0x100
+#define FABRIC_EN_CFG_TARGET_NODE_ADDR_LOW_0    0x140
+#define FABRIC_EN_CFG_TARGET_NODE_ADDR_HI_0     0x144
+
 #define FABRIC_MN_INITIATOR_ERR_EN_0		0x200
 #define FABRIC_MN_INITIATOR_ERR_FORCE_0		0x204
-#define FABRIC_MN_INITIATOR_ERR_STATUS_0		0x208
-#define FABRIC_MN_INITIATOR_ERR_OVERFLOW_STATUS_0	0x20c
+#define FABRIC_MN_INITIATOR_ERR_STATUS_0	0x208
+#define FABRIC_MN_INITIATOR_ERR_OVERFLOW_STATUS_0 0x20c
 
 #define FABRIC_MN_INITIATOR_LOG_ERR_STATUS_0	0x300
-#define FABRIC_MN_INITIATOR_LOG_ADDR_LOW_0		0x304
+#define FABRIC_MN_INITIATOR_LOG_ADDR_LOW_0	0x304
 #define FABRIC_MN_INITIATOR_LOG_ADDR_HIGH_0	0x308
 #define FABRIC_MN_INITIATOR_LOG_ATTRIBUTES0_0	0x30c
 #define FABRIC_MN_INITIATOR_LOG_ATTRIBUTES1_0	0x310
@@ -320,6 +324,23 @@ static void tegra234_sw_lookup_target_timeout(struct seq_file *file, struct tegr
 	}
 }
 
+static void tegra234_hw_lookup_target_timeout(struct seq_file *file, struct tegra234_cbb *cbb,
+					      u8 target_id, u8 fab_id)
+{
+	unsigned int notifier = cbb->fabric->notifier_offset;
+	u32 hi, lo;
+	u64 addr;
+
+	writel(target_id, cbb->regs + notifier + FABRIC_EN_CFG_TARGET_NODE_ADDR_INDEX_0_0);
+
+	hi = readl(cbb->regs + notifier + FABRIC_EN_CFG_TARGET_NODE_ADDR_HI_0);
+	lo = readl(cbb->regs + notifier + FABRIC_EN_CFG_TARGET_NODE_ADDR_LOW_0);
+
+	addr = (u64)hi << 32 | lo;
+
+	tegra_cbb_print_err(file, "\t  Target Node Addr : %#llx\n", addr);
+}
+
 static void tegra234_cbb_print_error(struct seq_file *file, struct tegra234_cbb *cbb, u32 status,
 				     u32 overflow)
 {
@@ -445,8 +466,18 @@ static void print_errlog_err(struct seq_file *file, struct tegra234_cbb *cbb)
 	if (!cbb->fabric->fab_list[fab_id].is_lookup)
 		return;
 
-	if (!strcmp(cbb->fabric->errors[cbb->type].code, "TIMEOUT_ERR"))
-		tegra234_sw_lookup_target_timeout(file, cbb, target_id, fab_id);
+	/*
+	 * If is_lookup field is set in fabric_lookup table of soc data, it
+	 * means that address lookup of target is supported for Timeout errors.
+	 * If is_lookup is set and the target_map is not populated making
+	 * max_targets as zero, then it means HW lookup is to be performed.
+	 */
+	if (!strcmp(cbb->fabric->errors[cbb->type].code, "TIMEOUT_ERR")) {
+		if (cbb->fabric->fab_list[fab_id].max_targets)
+			tegra234_sw_lookup_target_timeout(file, cbb, target_id, fab_id);
+		else
+			tegra234_hw_lookup_target_timeout(file, cbb, target_id, fab_id);
+	}
 
 	return;
 }
-- 
2.34.1

