Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EA11CB504;
	Wed, 18 Sep 2024 22:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726696819; cv=fail; b=RvT9V4ikEh+yd8Ie0vzgDTiDMGL1nz1ga9XYaklshK5Uy9xHwqobA/dVI0gGwWtSURGrj3xqUMkMofe9t9EETQ6Va1BKl2yY3wC0Nrow2a6US+Qrn8JfTePbGE6AsgYkjAR0f1or9tl/AzcVmeuYD5igFhV0SG3FfE2/esmp9Js=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726696819; c=relaxed/simple;
	bh=jSPLIjZ9OeKLwH8u/110KKi74geynQf039k7sB1jWsY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l392dn8YRPvrjP8WhV5IorMol7WyFjw431lEehJK4J7zBXeJJIGHdWW3d4LaNXu+WyVXPA1LCBoCBkJl7l6LxL2DbELo/5xZHwYAMlQ4D1gHkFwIweSdV0o6MmjkDmWZ64JF2xF/ygVneLgPz1w0ujGGg4CZSbaaQV8UMMzuZus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Kv37497W; arc=fail smtp.client-ip=40.107.223.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Kv37497W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SypBx4/Bl7lnYWaDT01vt08PXMKCpier+TwrcTYBxz2nDgGuBcX1G6sQICKPM60YVjCj808/lW38cqXuOj2wW81yPBcKuWAHlzeDdpMHWyowWT1GNXrvZNZGdsklE6GI9/kuqmz0IZ73j3XtmXcuPNWn8Lhoherek36/WpEjSScOZALxYDyZ4tR/Xg3jhvUg7coLGqqUkw5BJGajt4zG3twiWx++B7Q72hkouZuttcyFSQx4kx05o/5Z+8+L1nfbI6FLxst537X3tkhTiJMGMJQdS+GVpAr+6NKRPtFNS20wCAt2XLshqFyCTI7Qis3PviZrItj8/wf93KctqxbOjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aee/y9/63pXE0z8zyWuN+Sc2MRKS6VRz3Z324UqgkRI=;
 b=D2uEuwQ0JlUuvmXu1JYi6P7jJqAZYQ4MdpwBweZSK6RcLqBgbiUuhwUUbjBpbRZ17Je7qSTLlL+dRVnFU4mE73iRy+Ei9qMnPyht9gPeak2Gwqr/6bmU0CjwEVdkuWSCk69Ve+nWn7jlhkryg+ARTTjRmoURNcVHlUcXS9plughn33YfTJVQVvdrxzGCAen9gYLc4bDRh0/d32sNtNdr+AYwBWBIwvoBtQQxpx1n2gS1JB+FaagoMso39h803OVG6NXkPOq9u24r80J8jelFUFSEAcScfdTMkyurVVt0YHw3Xc9v4y+8pOIt9tEFtDIp7P88rsrBSscjYhNIhJjQkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=arm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aee/y9/63pXE0z8zyWuN+Sc2MRKS6VRz3Z324UqgkRI=;
 b=Kv37497W6Zwte+kIWPFkMHGrdz4dG7CK5Td/dI2h0xmv2JOJxoqCYw+XkSpLvhjShk4noA1oDxfO766M8RJOE3BTePTS4cWq5FjlpadekWHOWJJZwsv2NX9v1f+SuJbrrAUXlCFCNhKMjd0CSH6yw1I9n3BnCWRW2sYhzJIu/atp4A+ATfl+a2pPKxj6v1h3pUGx9CDjX36BF9QWhXolX/U5FphABsVuTVk/0VmTp6euOR32EX+HXQ7bh6WoKQNs3FWUxNpDJgeh9iM4Dl1ZqxzQ5MPxykuOks+VV3kncGfOxObQbj3RT05ff/QnXdkQweqCLmMFAWUVreebUUkvYA==
Received: from BN0PR10CA0017.namprd10.prod.outlook.com (2603:10b6:408:143::26)
 by CYXPR12MB9425.namprd12.prod.outlook.com (2603:10b6:930:dc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Wed, 18 Sep
 2024 22:00:12 +0000
Received: from BN2PEPF000044A1.namprd02.prod.outlook.com
 (2603:10b6:408:143:cafe::b7) by BN0PR10CA0017.outlook.office365.com
 (2603:10b6:408:143::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.30 via Frontend
 Transport; Wed, 18 Sep 2024 22:00:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN2PEPF000044A1.mail.protection.outlook.com (10.167.243.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Wed, 18 Sep 2024 22:00:11 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 18 Sep
 2024 14:59:58 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 18 Sep 2024 14:59:58 -0700
Received: from build-bwicaksono-20240327T112120892.internal (10.127.8.12) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.4
 via Frontend Transport; Wed, 18 Sep 2024 14:59:58 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <suzuki.poulose@arm.com>, <robin.murphy@arm.com>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <rknight@nvidia.com>, "Besar
 Wicaksono" <bwicaksono@nvidia.com>
Subject: [PATCH 2/3] perf: arm_cspmu: nvidia: update CNVLINK PMU events
Date: Wed, 18 Sep 2024 21:58:45 +0000
Message-ID: <20240918215846.1424282-3-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240918215846.1424282-1-bwicaksono@nvidia.com>
References: <20240918215846.1424282-1-bwicaksono@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A1:EE_|CYXPR12MB9425:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ca640ca-c2e9-44c2-9da3-08dcd82d44de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZImBW+U2My4fOkcmzfnvxwvd5UfpIVUkn+eOlHx6QhGzewDJ9ce8xYIhONGe?=
 =?us-ascii?Q?Nq/tLeUpemYenvafyhYdLqY0J/iTI/zjh5RGoWp1rOyCyXAs0x+uJ9G4fvJZ?=
 =?us-ascii?Q?zHGLa25bz61B8IL9sVjI/8c+QL/jFW8A9PhHl0ZWAY4dnicsLFh5pzx6rbfL?=
 =?us-ascii?Q?BeJojJqWU0c71K1JCv0lvilBaIZTv6BrlbEUuWaSXIufptmLX2SNqPVCY0LU?=
 =?us-ascii?Q?1ICODMQ/Kbnew1OE+mvxk+sIFx6jtaoFycMWhef64YJlBKGV+8cB1QygpzcU?=
 =?us-ascii?Q?F6QcpUOOsprjhezfSjpNnod122KWoeI5XTfyCz1M3r9E82hEV5gwfO6YMTNM?=
 =?us-ascii?Q?vofXZH+lBzhIT2cM4DxZ8hy8VqmwFhpiL+F6CwyfMeBqxpAVOgJP4hKBhN7v?=
 =?us-ascii?Q?Pydwei2aesDaQzO6BksO/5neLjpWKt1F80kLa4JIgmAIGg8AZ9MzqBsSe1j6?=
 =?us-ascii?Q?CqylAdc8svSsb/1humzOdqmROB60kX+FjUIMQMV3CoQBAO5qwsA9Z7gSDxaB?=
 =?us-ascii?Q?qT+v9Qe+/IffIcfO8ovBvFGUnGWGORlH5cDRs29+LXf9mypQDhGUVYULNVGo?=
 =?us-ascii?Q?uYBVCwtzE/sBmb4wUP7VQSlG+EJarlAyNiMpewQUYd2ALgU1rJ9ZKEkSgUpg?=
 =?us-ascii?Q?3+2mwwMPBQq29Ly+YrlZiymWFCvK3riEh+p8hYhES7v+aPc0GNZjiy4FTGKO?=
 =?us-ascii?Q?wMzmz5LRAIpe+7aMV2sqbNlee5pftUQ8xUcBV3+6EpXxqKKksjmBf0J7YUcs?=
 =?us-ascii?Q?Qd6dqfNPZ72t0iQA1Xhg2xEynFeaaHXYSLOVfzKG5p7Th16Jv417kgoRg1El?=
 =?us-ascii?Q?KPZ1FTN0xVjLvnquJqWRxJCbMrHIxWz5l4EX72+iGbkSPzpxl1dqlhfyvoBk?=
 =?us-ascii?Q?w9ejnq7mfhmhV6N+HQuYnnTkwRkxwAnZJ+XLdSXgxMjV574TFofBipCSMyon?=
 =?us-ascii?Q?GGE9y0Yip3EDG94f+J6T6E/ST5MbuY+fq1AQXCGh9AGIlsiQyUarxqsDUr/u?=
 =?us-ascii?Q?SfRDRwRzUmYSKWjXW2iUjObb8ZpUCObVJqh09H1ISlhleEW5VlCnzQiJ4oKd?=
 =?us-ascii?Q?w8n/BXnvnAT31hrBTdHP85+UjLJQziKC/PsF9TMXl6VnBOF9c/92zBHvJmyb?=
 =?us-ascii?Q?sofEtuwKFG5erIY+tjZPOiUNOvoAmIvocdTfZz/ITl6MuO33U86Af9Jc1T/a?=
 =?us-ascii?Q?8jkw/ylFGUC/d4g2NYrnB08VFP7AR+N4YuqLoFaBIbe2gk9fmyEmb8JKtWMQ?=
 =?us-ascii?Q?zMAdaBVSd3kp57YAT6binAZexwQOD6W+pmeMre5+ZOsrIvtwP3E/tixS7w+L?=
 =?us-ascii?Q?HEH223R2LXh7vnNfDrISzKPvcOW69PHY6fnmZ6fGystBI1hhIobcOag/kDrq?=
 =?us-ascii?Q?z4inq9DLbitrkjYaCEgZAHztvOZGrAAtZn72oiTxmCS3jl6rA2hC05WsFFMc?=
 =?us-ascii?Q?exUvSfKMuAM6SrGFlD75A5YSi1D+09q8?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 22:00:11.8304
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ca640ca-c2e9-44c2-9da3-08dcd82d44de
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9425

Rename loc* and rem* events in CNVLINK PMU to cmem* and gmem* events.

Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
---
 drivers/perf/arm_cspmu/nvidia_cspmu.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c b/drivers/perf/arm_cspmu/nvidia_cspmu.c
index ea2d44adfa7c..d1cd9975e71a 100644
--- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
+++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c
@@ -112,6 +112,25 @@ static struct attribute *mcf_pmu_event_attrs[] = {
 	NULL,
 };
 
+static struct attribute *mcf_cnvlink_pmu_event_attrs[] = {
+	ARM_CSPMU_EVENT_ATTR(rd_bytes_cmem,			0x0),
+	ARM_CSPMU_EVENT_ATTR(rd_bytes_gmem,			0x1),
+	ARM_CSPMU_EVENT_ATTR(wr_bytes_cmem,			0x2),
+	ARM_CSPMU_EVENT_ATTR(wr_bytes_gmem,			0x3),
+	ARM_CSPMU_EVENT_ATTR(total_bytes_cmem,			0x4),
+	ARM_CSPMU_EVENT_ATTR(total_bytes_gmem,			0x5),
+	ARM_CSPMU_EVENT_ATTR(rd_req_cmem,			0x6),
+	ARM_CSPMU_EVENT_ATTR(rd_req_gmem,			0x7),
+	ARM_CSPMU_EVENT_ATTR(wr_req_cmem,			0x8),
+	ARM_CSPMU_EVENT_ATTR(wr_req_gmem,			0x9),
+	ARM_CSPMU_EVENT_ATTR(total_req_cmem,			0xa),
+	ARM_CSPMU_EVENT_ATTR(total_req_gmem,			0xb),
+	ARM_CSPMU_EVENT_ATTR(rd_cum_outs_cmem,			0xc),
+	ARM_CSPMU_EVENT_ATTR(rd_cum_outs_gmem,			0xd),
+	ARM_CSPMU_EVENT_ATTR(cycles, ARM_CSPMU_EVT_CYCLES_DEFAULT),
+	NULL,
+};
+
 static struct attribute *generic_pmu_event_attrs[] = {
 	ARM_CSPMU_EVENT_ATTR(cycles, ARM_CSPMU_EVT_CYCLES_DEFAULT),
 	NULL,
@@ -234,7 +253,7 @@ static const struct nv_cspmu_match nv_cspmu_match[] = {
 	  .filter_default_val = NV_CNVL_FILTER_ID_MASK,
 	  .name_pattern = "nvidia_cnvlink_pmu_%u",
 	  .name_fmt = NAME_FMT_SOCKET,
-	  .event_attr = mcf_pmu_event_attrs,
+	  .event_attr = mcf_cnvlink_pmu_event_attrs,
 	  .format_attr = cnvlink_pmu_format_attrs
 	},
 	{
-- 
2.34.1

