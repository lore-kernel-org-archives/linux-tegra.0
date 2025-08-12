Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEBF2E1C79;
	Tue, 12 Aug 2025 23:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755041889; cv=fail; b=VuWqNJoWigQVIZlEgDjbNThEXqFiiLDykfGAQD/6GM5LXBWip0os+7V9DgIjxFJGLW5CSHR7RgFReIuxhu10D+UoKX7yWfvqlEry363v6rIP5KZ3aK4CPPBBa8JymRRMeeTKISvRagBo3BHGZyOPueUtQRrX4ZdAecRcL9jKZPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755041889; c=relaxed/simple;
	bh=JcxksGImgFvJ2OJcQTFq1VRHz5MVcnanz5V0p4mp29U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iQQigvMcNCS2jptoQ+s0dihdAldULje6hTEKMqxdUbprDG5ATvGMMMcrnEKpOujkj7VmoUbWGpU6ThOm/ML3EoaUDwvLGikg72LrFHjiJmaQwDT/YlS/Ly6OFfrJMRC+Pqtj1WjMudAFzb6AbbUTUQdAoUJRvcqJE1wTXWo8x20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=R88Jlz9b; arc=fail smtp.client-ip=40.107.92.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="R88Jlz9b"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kzKxjJn/cfUPbMQ0Qavt5Q8p/wA6zXVWpmD/oZ/c9ZSPfthvBOgXd/h4lhJK/J2BiqlOO48K1RnFnW0dyfqRpoUhUhKd3ZzWy7Oby5hAr/ZZaICq2mt5u5EV9bIRnIGsssyUjTep1tUwanKTv7hkFUnh5YcF7T5IZGkie98rT87mBXOAQPSpCWqOhNmNv5nOI0FzwRzi1RJjuLI5xn62qTiJIICEdjnktId7JCwQe/erwl59Hm0gyCC0AxmnkYtnC6JR7VhWCWzQbGcHqH5dyzL5CgS50wVhc8Kj5YmFGvGJq4FNXnVqPeRuCaA6kb883VYc90sFB6/HSCGcgCI2HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TEs3pZaBMklhh+NrYbwXmuYb6QQTIhWhkZHo5K/d/DI=;
 b=k9W3eRwxBWrcC8PxtBpt9LiGEMNAQIRwCMEZFMjYUI/EamcRBs4Ws2RFbWyPbWzcRzoweUjjI7ANDI9/sk69QAjm77deWiZo34Ej3k6FNDChoQuKnDJTQvpKhF5//Z86NJUeRXc5RI7PNx8blR/q/5JcUhiKt6XddBHanFI5tLCNE9gM0WqXSDefEHu6AtTz1e8kIgFOoDQsPj5b4KLrE+83BjS/4gRQ7CkCVlYs38C2z2tbkS1KDJ8vCzFMGC1R2BQMer1yd72ixdZKM1X3FDHsB5dMxgmSYedtazTtMJxGA6d74gp0vfNwZBvmlUC0MdLMCmlf6XkpiUm/gPMMWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TEs3pZaBMklhh+NrYbwXmuYb6QQTIhWhkZHo5K/d/DI=;
 b=R88Jlz9bokDg+LAKdRazFa+Lsflp5W91UPr5dZYnxi3v9rRMlv0ijgJR5QEpUFHJATiKRfAyqDmTRXNkzjuISsA/1Dr6cIJ9zNi+XEUTPlxGsOzLQvku9PnyHa1a8/qh0k1sKJDad98I07xyzYViDlgMujrUYOPA7NkCf7S8XelsT9fo1nFQiq4GBcGzx5gW0UHRn37cOrl/D84EABwN5MDLdCCxnm/Ng4oYfaGNnAOciCBf3btog0v8dMWaJxl5kbJXM2mWi+2rEGg7AnOUqso9pLA1K6GvM4Az73wVVJmmEUzPgStN/bI36jbY8+jyVJIoAuC4VHv6+BaCZ+P1Sg==
Received: from SN7PR04CA0191.namprd04.prod.outlook.com (2603:10b6:806:126::16)
 by SJ2PR12MB8806.namprd12.prod.outlook.com (2603:10b6:a03:4d0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Tue, 12 Aug
 2025 23:38:01 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:806:126:cafe::5b) by SN7PR04CA0191.outlook.office365.com
 (2603:10b6:806:126::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.22 via Frontend Transport; Tue,
 12 Aug 2025 23:38:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.11 via Frontend Transport; Tue, 12 Aug 2025 23:38:01 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 12 Aug
 2025 16:37:57 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 12 Aug 2025 16:37:57 -0700
Received: from build-bwicaksono-focal-20241114.internal (10.127.8.12) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.14
 via Frontend Transport; Tue, 12 Aug 2025 16:37:57 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <suzuki.poulose@arm.com>,
	<robin.murphy@arm.com>, <ilkka@os.amperecomputing.com>,
	<mark.rutland@arm.com>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <sdonthineni@nvidia.com>, "Besar
 Wicaksono" <bwicaksono@nvidia.com>
Subject: [PATCH 1/5] perf/arm_cspmu: Export arm_cspmu_apmt_node
Date: Tue, 12 Aug 2025 23:34:07 +0000
Message-ID: <20250812233411.1694012-2-bwicaksono@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|SJ2PR12MB8806:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f5a8fd9-29fc-4950-d5b9-08ddd9f946d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T/T3L2g+C+fJM412stfGr+mnlCtKjE2Tu2jIl0aGKA827WYF9QJV2Eqk/PBc?=
 =?us-ascii?Q?2aST0DID0jn8ZpD8uirm2o5smNa7QbJMI3H7dxTFlAfwOMEOvowXkDo3lNm8?=
 =?us-ascii?Q?7/fvq5k0f+9v3QPsxUdy5G58S56pM0c3QIikzazGVIYmFfQC02IvEv/xD054?=
 =?us-ascii?Q?qaEH8/PiyvT/VXZpaydk2QOheDOrdQhLeesgPcbM+gJ8QNrEIgjkcajPDQAh?=
 =?us-ascii?Q?IbsshagFx2oHP/tHnvz/l2QrS0OtGGLk+e/iGxnSkRiQhDaPcnQsmqIbpYMY?=
 =?us-ascii?Q?pYdV9KIvc6diuR9ZI9DYEgDyUXddlH3KwU5zfhmMMLCVnO2GtFJUuRXldydz?=
 =?us-ascii?Q?tD850I327I6/ZT9KHRh6aXWnFT6owDz0dpNd8xG/QRTdKsEMXD6D1gBubl42?=
 =?us-ascii?Q?2bZ8PLv2n/5nKRXoEPBIfxNMcx4lX2AvrGHtS/yBR01CC6HtXz8xsrstWNWN?=
 =?us-ascii?Q?pVugW/Yl/uPlv02305RGZzIyiNVXJMH49G/R23gzHlSfmtdUsiUCAJ4V3mxG?=
 =?us-ascii?Q?kd6F7Tuz/oM6Get/t0+WqH3ieVqjiT21Mz7wDDxlXiWm2mAujDa+/qkiA4Uo?=
 =?us-ascii?Q?kUOioF21CIaP2nqzh6IphFtiJ7JycOdIkgXk2PhABPK66IZbgHqHKzVUWKpj?=
 =?us-ascii?Q?RGxgxUhbU4382tLRaYMdlryz3AyShcQz8HXJsyA4Z8Tf8CtdRdJVnIUfIgeQ?=
 =?us-ascii?Q?sI1Ovx5x7fZV0OpERk7Ho1pSz49tIdbDKNeHltUMFA6vT1K/CfGByPXL/Go5?=
 =?us-ascii?Q?JW5OSfSTD0/88f0Dxe5ILUfBOA02ExLBab7z5jh53VnbAUAfVU1QcrNV5fi+?=
 =?us-ascii?Q?voVFipechfGWtvFJlttd1l0txBMe1p89XE96RjnFRBpXP02EG7Dw0yF2TnjB?=
 =?us-ascii?Q?Oci4B+SF2J9Mn26YeNJMbahYbCJtlkNGlBHaAZuLkqZ+hoP/746g3kiMYuaY?=
 =?us-ascii?Q?vLXxD9NAXNEab1CD2qVTQQVlB/BrzLr63x4XZ4rEjZGAbTwIrPywWHTklFmw?=
 =?us-ascii?Q?2YaOHZcrhsGebyFIzM7duBaCfQPHeRN86uLu0X1L7GDhvEcFy9ULOIBix23J?=
 =?us-ascii?Q?hXVjE7fM4FqwXt7Gbj2TzWFQuwLL6KAWMjjBGaYk4+M8m9qGLt9Aoou8jPxQ?=
 =?us-ascii?Q?fxUYRumV0pW5qq1wp63TJGeZhYlpCY/4g9YBhiMpPbs4/wXrUPcgSikf3hTq?=
 =?us-ascii?Q?KWP71KqvrLgCSHC+NE5it0cpnKPk8e8VnmEzFDWB6VImCQa2e6kt/oQRmBAo?=
 =?us-ascii?Q?OpUm0en42G9QFltaEfYy88IuTq52R/2gyj57rv813P4ePyUNwjKmcWgmsKo7?=
 =?us-ascii?Q?zFS9ashG3FAYrza1m2rlVNanSfT91pvZH8orQoufH2aBtUY7NJ7/ozBCZ2WL?=
 =?us-ascii?Q?Vg5ig2LHNbTtorDBCueR/DyvsBS4ZXJCWC8F2DWoWdkZOxAB7kF2maoC+rSj?=
 =?us-ascii?Q?rYlGn2oqC5uwm9n8BNFcdyO2TrRVSmys/OryRXQh5U33IsONKaxf8p4sFfHT?=
 =?us-ascii?Q?E/ll33as+nnnEHAcrdTGeDPIB0U1O6euDh3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 23:38:01.3577
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f5a8fd9-29fc-4950-d5b9-08ddd9f946d3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8806

Make arm_cspmu_apmt_node API accessible to vendor driver.

Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 drivers/perf/arm_cspmu/arm_cspmu.c | 3 ++-
 drivers/perf/arm_cspmu/arm_cspmu.h | 4 ++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
index efa9b229e701..e4b98cfa606c 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.c
+++ b/drivers/perf/arm_cspmu/arm_cspmu.c
@@ -70,12 +70,13 @@ static void arm_cspmu_set_ev_filter(struct arm_cspmu *cspmu,
 static void arm_cspmu_set_cc_filter(struct arm_cspmu *cspmu,
 				    const struct perf_event *event);
 
-static struct acpi_apmt_node *arm_cspmu_apmt_node(struct device *dev)
+struct acpi_apmt_node *arm_cspmu_apmt_node(struct device *dev)
 {
 	struct acpi_apmt_node **ptr = dev_get_platdata(dev);
 
 	return ptr ? *ptr : NULL;
 }
+EXPORT_SYMBOL_GPL(arm_cspmu_apmt_node);
 
 /*
  * In CoreSight PMU architecture, all of the MMIO registers are 32-bit except
diff --git a/drivers/perf/arm_cspmu/arm_cspmu.h b/drivers/perf/arm_cspmu/arm_cspmu.h
index 19684b76bd96..36c1dcce33d6 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.h
+++ b/drivers/perf/arm_cspmu/arm_cspmu.h
@@ -8,6 +8,7 @@
 #ifndef __ARM_CSPMU_H__
 #define __ARM_CSPMU_H__
 
+#include <linux/acpi.h>
 #include <linux/bitfield.h>
 #include <linux/cpumask.h>
 #include <linux/device.h>
@@ -222,4 +223,7 @@ int arm_cspmu_impl_register(const struct arm_cspmu_impl_match *impl_match);
 /* Unregister vendor backend. */
 void arm_cspmu_impl_unregister(const struct arm_cspmu_impl_match *impl_match);
 
+/* Get ACPI APMT node. */
+struct acpi_apmt_node *arm_cspmu_apmt_node(struct device *dev);
+
 #endif /* __ARM_CSPMU_H__ */
-- 
2.47.0

