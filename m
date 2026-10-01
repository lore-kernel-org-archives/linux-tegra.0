Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013027.outbound.protection.outlook.com [40.93.201.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B8C2E3FE;
	Thu,  1 Oct 2026 05:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790831285; cv=fail; b=d72f9wCFcv0utLAzvQdq7FtI/WnY18Ah23/o1OV+aQ2pIR1/LY/vYH61g4lqG9VVpFoLAE8n8wvNalyeo9SVASQmbJuazT1r46PG+TSGgTBGcDz61QdS5ToePZ9CucgjJFTF5AwXCV0P8PDQUs+v1fuYO+4wPSecJ+HgmDvQYo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790831285; c=relaxed/simple;
	bh=d3XfaOL6EMur+jlQk9rcunb9Wd53w1CrnVSe6T8lnPs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NTFtN0wVuHoW4fAlTiHNifgQcpHdx3ZMh+2mqgTpJml7iFs3D87gs0lYTdlYmzo4ZMHF9fcICMzW2L0RjwQ5sYhp5jiTQ/589QOEjp4GQaYkhFCy/Qtgv3YnleaBQC8sLUwDu6gAlUjVArwOcS7rOt+rPHGwfhx147YrqcbVg7Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kU0wa8T7; arc=fail smtp.client-ip=40.93.201.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kU0wa8T7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tnnggvkjjxU8Y84LYyh1qYsZZvTxufsn1CVgqUToQo0d95X8gKSnJJCcgXovGuiDQ04ZsMZDfyapQzr2yfHmB17KXe1RD78ufOJ7Ne9+Lvju3l/VBI68SqDHJxhnh3Ww+0SfNn5/m1f3YDbrFlcSstqtop+9P97HsNeA00Zat9N/opwFHAocCZPuiFqWHEMcMxUgMS6eOOBDxdnxn45j3ko98p2xowA/hlVs2HR/X0l2VJbScTPJmcxM3wFr0uqoswAdl5cslBjdTul/GrGKRM01Fean2BcZO3y08ji0UQ3oeLaRU/uHEZfs9IbEk5OOPg4A94CV/N8jie9Fl0MYGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8TeYPfSMbZiuozWl0TfRif+DHM6JEgFLFBsrOHOyBcg=;
 b=Z9vkZ6DDfJ6W6S09/2g/xnuompN1H+wRAIENRVy9bx/OMxciHUiU9jI7J6eFOiUh0PqexrUaJ9XuQJyYT88KfLb3RnwDUdLcPznOK7XyCDtChdjPvoTOVl4eczJtXAuJDNKrx6ti3JGH6/jfL77YkHHGUFLtyu1V1ILTKl5wBo6EM8XU+Ihga7Rd2QYx+4/qq72Qie7EzFSVKUhKqRrR7fdRETt2IYAZ69j7Rs46iJU5dgS37a17dedpt0YEL/ArEUXWsgDQGg9Nj5osmkvL8GPeUDqGYRNo2uCluZNgJoL40LjGmCeTObryftrZnVX98EpKTsGTW9ZOny6b8mhKHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8TeYPfSMbZiuozWl0TfRif+DHM6JEgFLFBsrOHOyBcg=;
 b=kU0wa8T7JnBlFyouIlLSOeF817NcDGsOCExyOGtNbM0EX2KhxsZBDf5a1/3yXPsVNVRiFfmCGVCa7jritLp9Agrpv3+OL2Q0wKpD70IJWdBGB7E0klb436FyI01TC6oFwbDoKdG+p3mstMUDzx45nOgsU9UH4BL3N5SE6YpJnyMTy/s9gB1Lc7lbFr6+gMoW2KIKgnpzu2z0SSgLp/tEORbpzKLaZQDzwqxl9CMnRtzq1XeAqrrbSeKmddRRA/yJxv6ON+Kp0w1pFmZ9m1M/62/FE4PK0HQPtG4Apn/6usp8mRMY4S7xGLcdqTVpMRKmW+RRLlV/CPjok0reo+7Gow==
Received: from BY3PR10CA0018.namprd10.prod.outlook.com (2603:10b6:a03:255::23)
 by BL4PR12MB9536.namprd12.prod.outlook.com (2603:10b6:208:590::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 05:08:00 +0000
Received: from SJ5PEPF000001CA.namprd05.prod.outlook.com
 (2603:10b6:a03:255:cafe::9a) by BY3PR10CA0018.outlook.office365.com
 (2603:10b6:a03:255::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Thu, 1
 Oct 2026 05:08:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001CA.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 05:07:59 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 30 Sep
 2026 22:07:49 -0700
Received: from build-anrao-noble-20260906.internal (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 30 Sep 2026 22:07:48 -0700
From: Aniruddha Rao <anrao@nvidia.com>
To: <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Aniruddha
 Rao" <anrao@nvidia.com>
Subject: [PATCH] firmware: tegra: bpmp: Allow BPMP debugfs population to be skipped
Date: Thu, 1 Oct 2026 05:07:16 +0000
Message-ID: <20261001050716.2256810-1-anrao@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CA:EE_|BL4PR12MB9536:EE_
X-MS-Office365-Filtering-Correlation-Id: dfba4277-067c-4390-eef1-08df1f79f6b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|376014|36860700016|1800799024|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	17+20tujbSeBAayqFPgo4/QVOrie8zhudz8cUsz6be7ZT2EEjDndX/InsVoD2cY9Bg4LltdayZbCKDt84obhKW/3yCyhVBaYoIxpA6PGFUqDoXQcfUHA8QhZ5yC3nzckZOdpIIwm/96NNIHgtDRtlsWJeRKo4sPuuycxMnEYLp+hvODjw+B6aiP7++GGMCwmJnThndn80ByR/igpyYDmMhLRk8Rc91l9T4kwaIAE1w76x3h2gW3C9dbO/5Nzy4sxAMrmEuZGWxP0dF20D9xQZzolhjVH+mXfTokEGeWfsz1muFjXf+dwoDa2CaBMnr0+bxCZfTwPp8nzMMfh+rzR/hfah7Bj+ufAV8jxJ+J3TNo/fa8h/RP81+NsYkYBEaL5AasnXtkVAsivL0n1Efby1QgDl7xBZknRSL+q7b9gUd0FTvUWQxlX2WdwIYlYWojHg5Sm/VhQGHyI9COl43vg46CIUG5eT+QmMaor6USssJ4B/h8cboltP0+Hqq73YFIZnStiwYWiyOoZv0Jbdc09F5WXS+TskkO7QU7sAQBofDNuxCZFcRWfjOdq5A1kRX9y57ZH2cXMcolTD6QNS12MIQn27l7QOJv0cIUjV8VQZPj/FZWeZttSo4oNF20PXO8VTwTGAUngv7dOcsXI0psZykGqkkzUTwvXZY8aILVcQGsWZlU4XO6T+LRbNpQ8LW0iXowVQdBdZ/jREDjt1H6k4g==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(36860700016)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ym+EgGqc9pR6mIv8ifB64FMbOjLk3Pfc/fgm/wTipLo76Ulqx5Gl3Oi4SWyzZ/bOXWWJgFB2akF/cJCStO8EnpFCFRGMGIMrxk8Tt3ERQ0I41DVLqg9O6o43mu4XvgHedxfvAxC58rnhecCD/b59N38U6Ez0h+4YCWpNyzeE7oMFBmOy8z4iG91RJQTePQYz7qgkB+FVEs9nsH/pbd9FhtM6ol1ymRWPG97xFyYSpEayi9SbDgnNIVhJ3pgCCWePGfbc2xohmz9RyiqBMWbSqU0MOtYd9jZ6Kmidp2AfBQgLo2ylh/PCkziC+KKcs1Y3L+9Wcet0KH1fOgEcntEwd7ZS9/s4Pz3WAhgFZRQm/z4SVjXZUWhyE3boYT//Lbq/XXvvFAeGunN4bxVHwTK0la3wauR9jTQzkMbTQfBrblYwGc2O5GGdbAf/B2U04Yk9
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 05:07:59.9852
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfba4277-067c-4390-eef1-08df1f79f6b0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9536

Populating the BPMP firmware debugfs requires a sequence of synchronous
firmware transactions during BPMP probe, which impacts the overall boot
time. Currently, the only way to avoid populating the BPMP debugfs is to
disable CONFIG_DEBUG_FS completely.

Add a tegra_bpmp.debugfs module parameter so systems can skip populating
the BPMP debugfs with tegra_bpmp.debugfs=0. Keep it enabled by default to
preserve existing behavior. The parameter is defined in bpmp-debugfs.c,
so it is available only when CONFIG_DEBUG_FS is enabled.

Signed-off-by: Aniruddha Rao <anrao@nvidia.com>
---
 drivers/firmware/tegra/bpmp-debugfs.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/firmware/tegra/bpmp-debugfs.c b/drivers/firmware/tegra/bpmp-debugfs.c
index 33c6300af964..2efc48b522ac 100644
--- a/drivers/firmware/tegra/bpmp-debugfs.c
+++ b/drivers/firmware/tegra/bpmp-debugfs.c
@@ -6,6 +6,7 @@
 #include <linux/cleanup.h>
 #include <linux/debugfs.h>
 #include <linux/dma-mapping.h>
+#include <linux/moduleparam.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 
@@ -773,6 +774,11 @@ static int bpmp_populate_debugfs_shmem(struct tegra_bpmp *bpmp)
 
 static DEFINE_MUTEX(bpmp_debugfs_root_lock);
 static struct dentry *bpmp_debugfs_root;
+static bool bpmp_debugfs_enabled = true;
+
+module_param_named(debugfs, bpmp_debugfs_enabled, bool, 0444);
+MODULE_PARM_DESC(debugfs,
+		 "Populate the BPMP firmware debugfs (default: enabled)");
 
 static struct dentry *bpmp_debugfs_get_root(void)
 {
@@ -789,6 +795,9 @@ int tegra_bpmp_init_debugfs(struct tegra_bpmp *bpmp)
 	bool inband;
 	int err;
 
+	if (!bpmp_debugfs_enabled)
+		return 0;
+
 	inband = tegra_bpmp_mrq_is_supported(bpmp, MRQ_DEBUG);
 
 	if (!inband && !tegra_bpmp_mrq_is_supported(bpmp, MRQ_DEBUGFS))
-- 
2.43.0

