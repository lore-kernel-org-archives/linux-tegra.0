Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010029.outbound.protection.outlook.com [52.101.85.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436D034D4C4;
	Mon, 26 Jan 2026 18:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769451190; cv=fail; b=O5Jl+4B1UY40qIvsMoW5Gt481czlrU+pwXCzJtSDS9WdmsiWhcysxR8H1hGwK6Qn9r5jJEqiMe+x7tDC+XV8mPqasxSF+BhtyzwXiNE39bbEngPsJgyUuyBdMfG0Zb93i5T3Du1LBr6+lkUl35YZB8srGSIri+Pfz7x6X6DIFsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769451190; c=relaxed/simple;
	bh=X8hjqm73bxLF0gI1PuIWnrTaSHsZn4kK7pCF7PJvkqw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dsylskrSCVYw52MkNI+bOR7bC9SWMxOne1OrfTzNjsuD5MRAUzKa2EkqAY73+ZfXXfd5Tf2C7973InIpkuU2t+dc/TzXp1fycaV3us1mdX52Qgshx4PfVbpeL5gbkyAWIiQo7c1cfKjQ+UsFlPbVzlCVcIks49DnOSCxRT+TEkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oxib6wVR; arc=fail smtp.client-ip=52.101.85.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oxib6wVR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XG2qgtRkaSy/Tf/C8Tqo3u+cDNQTJQ4QJNlT2+IXvZgKFYk50GCkul4r9J4qqMTODz7+KbF52U2dg/tDh2GPqr1tfFKz2tE/bb5H2iW3HrKNqenVTzpZW+Dfu8gtQMiHgrP0EQGS2uyykyKNgGhZzEdIddh6ULvzk0pNbjkAA6Aqg+0CnM5ZxwPLkZzpmx3ZEeD0NjOdpAQZeb9wnD09y64yhx7Ndx+ros6zMki1wktKKpGXoZJUMNx+62O3wv6Tt8QRIyMSnHjvYPDFJwpMhMH+K8mHINGenU6xxZBGtOtz4IkbCkj/eWxUVcVJEw0ZfbE5hY3zl2eEQWo3qUT+og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yqf4Qqi2yDdZR+l6Sk0MncPYW3D/fC2br5uN8FgtaS8=;
 b=Tr8rzX1GkC72DlJtadS1u6TBhMnraS07Ff25VtQmIY3d/evUcYjqlCZAKI1hy6CoNFBYZAUu9ENXGNQsNZ+/NDzjOqwngMaNq8vAeAGHIrHxSnLOEf8PNMBG1Z4df+ezdULowxWn88IghspFqjlWWdr+nLbQURxtI2Ma6jQRb+oiJqKyE0IbqTDy1FqwjWd/Q3m4mZ9RFuNynwT19uRcOPwabB/2cecbKARfzEN/c6zQLSta20graj7TOK7+3clR0lvk5o4TPGzXTf43l2ksOSQVQlmh5aT/GEdY+9XZC1JhLZQj1dhU9UrU27/M0N+X8Ox5Sxy1FKeQqTg4w6OZ8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yqf4Qqi2yDdZR+l6Sk0MncPYW3D/fC2br5uN8FgtaS8=;
 b=oxib6wVRjFJWZyGP+vWXfk9LFCdtrtSoIaC+Psb61LuCqfP553PQSkUBn/flH3mpwzsCkwQ1EdIOtA+1eGY3OuFZ07osUpL2E1LRQWoXL+hFamOjNN5Xv2wJz9EupIzL7uykQ6lYx/w00NjEWjZEMsWQZBsLnE5ejd+Iy7014wMa3rGoQ6Cbz55gv6XjTOlXRCRl9AGW5xqDNWMKkjTkcnvCECsWD0TAURWoK3QitPFq1C+JzMWAZQuyhgo3WapkrWh/D1I8B1i6E0+AkW1xDyHl79q4qpjLo6fVbFd3F6tj+uF5pWavZ4wbagiRliz/m8Gu+w3P1jRajA9gHUSEQg==
Received: from MW4P223CA0024.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::29)
 by SN7PR12MB7225.namprd12.prod.outlook.com (2603:10b6:806:2a8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 18:13:02 +0000
Received: from SJ5PEPF000001F5.namprd05.prod.outlook.com
 (2603:10b6:303:80:cafe::82) by MW4P223CA0024.outlook.office365.com
 (2603:10b6:303:80::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.15 via Frontend Transport; Mon,
 26 Jan 2026 18:13:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SJ5PEPF000001F5.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 18:13:02 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 26 Jan
 2026 10:12:51 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 26 Jan 2026 10:12:50 -0800
Received: from build-bwicaksono-noble-20251018.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Mon, 26 Jan 2026 10:12:50 -0800
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <will@kernel.org>, <suzuki.poulose@arm.com>, <robin.murphy@arm.com>,
	<ilkka@os.amperecomputing.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <mark.rutland@arm.com>, <treding@nvidia.com>,
	<jonathanh@nvidia.com>, <vsethi@nvidia.com>, <rwiley@nvidia.com>,
	<sdonthineni@nvidia.com>, <skelley@nvidia.com>, <ywan@nvidia.com>,
	<mochs@nvidia.com>, <nirmoyd@nvidia.com>, Besar Wicaksono
	<bwicaksono@nvidia.com>
Subject: [PATCH 3/8] perf/arm_cspmu: Add arm_cspmu_acpi_dev_get
Date: Mon, 26 Jan 2026 18:11:50 +0000
Message-ID: <20260126181155.2776097-4-bwicaksono@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F5:EE_|SN7PR12MB7225:EE_
X-MS-Office365-Filtering-Correlation-Id: b1e1b9de-d1f3-4b23-b68b-08de5d068b56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qbA5fhkLK5AxXaT3eaYqjSQcg8fkFSbA5+SUIG85Wgva8HW1D6lL5sbSdWsv?=
 =?us-ascii?Q?EZvpCo0oAEFSEQgHxCwZqrFhVmHcAUGz6t8fEP+5wBroEkeFndpIaWesX3HM?=
 =?us-ascii?Q?24XYuJiyFirCuMYdGAwLxsiroMK/d1yX11foqz9A1sKZtMbW3Lzkb5PsNQn6?=
 =?us-ascii?Q?3GrwHMuug/+gFUcJpIuHFHznpieBS8XA6X2ELA8q811DHttUSFyiZRaOupWT?=
 =?us-ascii?Q?k5VR0dPLkdq3JX1e6vTlk8nIIfqQVKMHH50sUQczPk5/ybnAehRIC4SDnMbR?=
 =?us-ascii?Q?6rz6hMef7S/nTpZ3eQ5jsDRrFdwa/4L8G/YPAXWfOjfocZaBwGJBivcPOC4/?=
 =?us-ascii?Q?/2F3qi9WcsPUb6vfYBetKneXv2UuVbcPmQvgeZlputXa1aU6xBQZPB2VyDd/?=
 =?us-ascii?Q?RSWhHJFNSInKHf48Z8404TnmvC/0kMBiVa4PT+grsMAqU6Z8GgelwdjUilxG?=
 =?us-ascii?Q?YIhKNOOuUe2r23+b7oSHZl/750C5XJ/QtIVNqcRTgkkJdapuigFKk5Ucbmjo?=
 =?us-ascii?Q?SsS+otU+sMje7fe15xIMc8loH6IMuwl1KEu1E9bEQGaHWhNx/LDwCnTNc5Xq?=
 =?us-ascii?Q?o5GsC6AuGljXi2B9yckakobX6AFt0uJovo0Il4mXD4SBEv2nq4Fo1dA79qb+?=
 =?us-ascii?Q?UFtEULEY5UTJQ+1NhIPSxI6pPt4eU8/kG8G8TQSbr15Dh3PPd1uHgVNE71Py?=
 =?us-ascii?Q?0Y7Owj/ljtv5AYWHfXCaHk8SeW+ecFV1BrRPmbPLPxOxu2LcoVNASUankzOs?=
 =?us-ascii?Q?vgYls70hkPZiT2HTWgTC24Z7iYwKQK97UTJ2F/ggQJ8JPIOODBIKGbxOOYNs?=
 =?us-ascii?Q?hcozA2zMrzQW5a8fp6DdX6yJVKSCb89p8yUM81hYVGIewcRHM1AbMz0cojzD?=
 =?us-ascii?Q?l7BidSvlVgX+TAgORJ56PBu6JiXKN1w9bt+CUGmjthBeH4Q2kvEKiH3SXhjH?=
 =?us-ascii?Q?FN0ZADSLkHmqA0VaFEygFn3dRMbkyMm/n/UoC3PI10N8LTHmWKhU0kUW7jFd?=
 =?us-ascii?Q?A9Fh6Noyeu1G94PzO9TQezb0WOJe/jamcX1Y8jSREhu6QvZY32r/+1h6mljx?=
 =?us-ascii?Q?uPub8515IFSHIBqQw5UwuRukQ2uHx+CiipuEz8uS35dbfXTOgOPMsRRgdY56?=
 =?us-ascii?Q?vetxGmgVdtwXkEkf4SrDtmF+tvdAmKL3Ffi68eUrnewlqQZaiNjlNdot++dU?=
 =?us-ascii?Q?B9YbzZc+XjYEGlPhAfwW9n5H7FLdHXQqfTGUyKuvBck5bwOqny88YtiiVHe2?=
 =?us-ascii?Q?7j3b8W9AbDFwDGtXxOcUhPLDKA5/n5b5nTv4+/A4yK7Ukvjw5cXSbzAhvK66?=
 =?us-ascii?Q?bngSw5795pHojiFArx9/abCMsZ4AdY3NCS6e8OMgFKo5wjWvKnPtRjkEmbgr?=
 =?us-ascii?Q?I7Hnj7MrXWgR0IQAIQXZhA0cbj7IWYF8vsJo19LsI+0F9vntIo+y7Jb6tdfn?=
 =?us-ascii?Q?l9lqK6/UnVZY1BjA8V9X7/uiUoAUnYYgz5QkyLsbxouAlEYTgnbxO2uz4LxB?=
 =?us-ascii?Q?lDA5Cxk55FSjs0uTstVz+96mTYkXHnSoPqgboR/V3JG/PQ+5oU7uKqw4A1mX?=
 =?us-ascii?Q?Du9EphZ0klJXdiEpsHJf9tBkOUXzjOJw9hxSX6PVCGtVSmbEZd4hYYCWrgDc?=
 =?us-ascii?Q?whvuSuGArSY7qNDS0640FjHecc39QSCJpCVGkqhv73mXC+mnVjsxpc8VGMZg?=
 =?us-ascii?Q?N+v6oQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 18:13:02.1795
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1e1b9de-d1f3-4b23-b68b-08de5d068b56
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7225

Add interface to get ACPI device associated with the
PMU. This ACPI device may contain additional properties
not covered by the standard properties.

Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 drivers/perf/arm_cspmu/arm_cspmu.c | 24 +++++++++++++++++++++++-
 drivers/perf/arm_cspmu/arm_cspmu.h | 17 ++++++++++++++++-
 2 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
index 34430b68f602..dadc9b765d80 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.c
+++ b/drivers/perf/arm_cspmu/arm_cspmu.c
@@ -16,7 +16,7 @@
  * The user should refer to the vendor technical documentation to get details
  * about the supported events.
  *
- * Copyright (c) 2022-2023, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ * Copyright (c) 2022-2026, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
  *
  */
 
@@ -1132,6 +1132,28 @@ static int arm_cspmu_acpi_get_cpus(struct arm_cspmu *cspmu)
 
 	return 0;
 }
+
+struct acpi_device *arm_cspmu_acpi_dev_get(const struct arm_cspmu *cspmu)
+{
+	char hid[16];
+	char uid[16];
+	struct acpi_device *adev;
+	const struct acpi_apmt_node *apmt_node;
+
+	apmt_node = arm_cspmu_apmt_node(cspmu->dev);
+	if (!apmt_node || apmt_node->type != ACPI_APMT_NODE_TYPE_ACPI)
+		return NULL;
+
+	memset(hid, 0, sizeof(hid));
+	memset(uid, 0, sizeof(uid));
+
+	memcpy(hid, &apmt_node->inst_primary, sizeof(apmt_node->inst_primary));
+	snprintf(uid, sizeof(uid), "%u", apmt_node->inst_secondary);
+
+	adev = acpi_dev_get_first_match_dev(hid, uid, -1);
+	return adev;
+}
+EXPORT_SYMBOL_GPL(arm_cspmu_acpi_dev_get);
 #else
 static int arm_cspmu_acpi_get_cpus(struct arm_cspmu *cspmu)
 {
diff --git a/drivers/perf/arm_cspmu/arm_cspmu.h b/drivers/perf/arm_cspmu/arm_cspmu.h
index cd65a58dbd88..320096673200 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.h
+++ b/drivers/perf/arm_cspmu/arm_cspmu.h
@@ -1,13 +1,14 @@
 /* SPDX-License-Identifier: GPL-2.0
  *
  * ARM CoreSight Architecture PMU driver.
- * Copyright (c) 2022-2023, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ * Copyright (c) 2022-2026, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
  *
  */
 
 #ifndef __ARM_CSPMU_H__
 #define __ARM_CSPMU_H__
 
+#include <linux/acpi.h>
 #include <linux/bitfield.h>
 #include <linux/cpumask.h>
 #include <linux/device.h>
@@ -255,4 +256,18 @@ int arm_cspmu_impl_register(const struct arm_cspmu_impl_match *impl_match);
 /* Unregister vendor backend. */
 void arm_cspmu_impl_unregister(const struct arm_cspmu_impl_match *impl_match);
 
+#if defined(CONFIG_ACPI)
+/**
+ * Get ACPI device associated with the PMU.
+ * The caller is responsible for calling acpi_dev_put() on the returned device.
+ */
+struct acpi_device *arm_cspmu_acpi_dev_get(const struct arm_cspmu *cspmu);
+#else
+static inline struct acpi_device *
+arm_cspmu_acpi_dev_get(const struct arm_cspmu *cspmu)
+{
+	return NULL;
+}
+#endif
+
 #endif /* __ARM_CSPMU_H__ */
-- 
2.43.0

