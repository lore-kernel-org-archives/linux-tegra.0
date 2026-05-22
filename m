Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010023.outbound.protection.outlook.com [52.101.61.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59419272E56
	for <linux-tegra@vger.kernel.org>; Fri, 22 May 2026 10:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445018; cv=fail; b=DOIb57jDlD5FIDUuYHjO2T5J2EvPQJc19Z0vizfC8dx9DflIVIHSrsAIRHe0G1k3Lwwj3JRdge4nCMZqyOhxzW5mzjO5qflXg1rxq8f55mQjbHy+ZvtgcCXu0QWhg0i+kZYyZJAecWiBjLNLccXndUQQjMbdT+buHl4Lx5GEPNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445018; c=relaxed/simple;
	bh=fukL9UMy7L/e6lh6cbUczxMFzlAEmDkRVRPJgsbLAGg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AU/HiMUebDWR2/lQGFw4UUBCzgOnOzS2pFLUeSkuoqXaZ1OXiLkCj8396ImuOP++c56Gbjr7ipW0gbk5hv9brLA2pOstZQ5RUk3bYcYeCSd82f/95ZM9HPIbGhlhcDII8gxIKCDrlCYpcuRul/B4VDN/d/O0nrQZ7kQay194kvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QyZZRjNm; arc=fail smtp.client-ip=52.101.61.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QyZZRjNm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ysvh2dUeUvqT2TTyHI4WyRHbU/ToiPnvEVA6FJZnU8wpRSfWv5IluKUteIEXAf7sbXucbLKTecWJfqJWRnbagkqnA1/zDRvWKDMWUzShie0ynEuvjGQWK1NpHypTzFTYUzjMx8otbUOnPvKkrK+GLE3swYIioDoIbUoEsZC9UKt+mrAA1zUGtDGQRXwcbdyWorGSi5LxsGRkNOON/7Vc9EunVLSDm1Kntgb51A+57VRqBCw8oGkkVuhwQjVmr/A8GJxRWkrSzXdrOGP0VhbOblGxxltjUc1vdNPMMZcisgeJCGsSovKY1G3NyTnhtodAWFtmdXxlLM6n/ncZlnuU+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bb49RLj1sjYbw2oT1UH6YhtTp3+1EAOFLyleG+c1JNU=;
 b=nNm+C0Q32LT2tHUXKXEYA97cJbMwUKUkJtNxXeLLEVuUjHCSsiaXkUcRKFOY0gXFkcLLB8XGvfSxbbN6QrOOhl6P8El+9UfXgppo4u06sla6xWOwaVwKyH7U/8OSCMO2FwAlRPVKN9+eMF+DJMNpgGY72rm4JOQadS8V2mSL0RqSgeo2ucQqlXBkE1R/KwR5MLOyxoGwtII1zqMB9I4zNmD4j9hjEP/ya5XNBINCofsPMCsta99UNp8304Tj2ADp/agSIZVo64DBFh9ujzmti55DD6YmUO908bWKbmyqOVrx6ZfhtXfj2OhiD0y+837xj/mIjM/73+7HvWsqzVRR+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bb49RLj1sjYbw2oT1UH6YhtTp3+1EAOFLyleG+c1JNU=;
 b=QyZZRjNmiUWs9U2f0TtaHwhmSL7Z96MBJt+wvTbhC4f6463on1J/azp4cNwtxBIXKWmcfFyEQC7MSWXr19NFiElEEsoEvg3AL64KCDLdLLMgMl9h8+WE0rQRVy5RdK24GBHHmKpu56EZW985H6O2LCHI8r3T70v/7LHasdKPOar71X9twT/OpOHyCKcgepY/ILB+CzQ36wM+YJiYopC9ugxbhumR2GpmOJFXUSmEc8qwE0sUojSpxO84aipFii+P6YwEwYWYrZdnxZX9YqiBG7HTbJ8QmLgX/RKYM07ChjBzbIlnjK0BYiAp6ZB4A5Xe2VM82il8ZGs+KD9J1PUH4w==
Received: from BLAPR05CA0036.namprd05.prod.outlook.com (2603:10b6:208:335::17)
 by DM3PR12MB9351.namprd12.prod.outlook.com (2603:10b6:8:1ac::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 10:16:52 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:208:335:cafe::5b) by BLAPR05CA0036.outlook.office365.com
 (2603:10b6:208:335::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via Frontend Transport; Fri, 22
 May 2026 10:16:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.0 via Frontend Transport; Fri, 22 May 2026 10:16:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 22 May
 2026 03:16:30 -0700
Received: from moonraker.home (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 22 May
 2026 03:16:29 -0700
From: Jon Hunter <jonathanh@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>
CC: <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] firmware: tegra: bpmp: Add support for multi-socket platforms
Date: Fri, 22 May 2026 11:16:14 +0100
Message-ID: <20260522101614.24028-1-jonathanh@nvidia.com>
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
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|DM3PR12MB9351:EE_
X-MS-Office365-Filtering-Correlation-Id: d24d8592-c4d4-46fa-246b-08deb7eb3e17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|11063799006|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NwnmcKrfsPNhC9Pac9Tj80VmBJGRSLYG/DJaACWuwO2yIh7Mrn0vucUfhw7Cn7puWq+MHPbEpvNX3w+EIuErgTXCvZkSixmJh0T8oX0tFiysSnQ+ajQ4DZamwj8//9RDH5QsUPYOKdPE8X0XI2DJwQDPuOV9w03aPF2CuODelYb/SpuHkqxeg5gzBHNBebA+PGDgnKX2fnmjKMQ6d3WmHYHHPrJ6hr43+d8QXjLmu44S3C/kEAlvxXwp4lSr/0m84AELR405n4A9vcQ4gzfwh4F7gHP2LKwAfqTxr9H+tSozeyxrvWEZ7hPhaUP32GGjs0hSeDSXRbpwg46cDGcWKtxxxNWTxQht9KdqWy1q1rflqULLjo5NxHem2AMu7hNYi1HF7cAtjRKcIKynEAO/ajY4iAfHD3H755CbeQz++bzXKY2Gl+3ReLApQOsAa0gz3DZwhqi2t6VrFr2/kClCGiH4kZGmjQgq5FaTlySyP4OuDAbMl0zGKCw9bSh0lg4Dcqw7eylbpddd9xr+czfamvAk5e+BtZKYXt9hEtcECb6hFgN41lJYVLENJx8WQthmhVh1f+g+35PR50KrZat1focc7qWzjEzk70rDDGa+7YskdJh5M2VuIzyh08RqshI//Jo0HJuK20kWQcTJGrQ5i/B8sP/9AJc1hk0CjDGMM/kL0ZIj8Mn0B6LhwtK301r5gjvPj1210dbI+gdM3cgLkQF1XDMqT/TbY1+29sBVIuQ=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(11063799006)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vdbko/AKkZwS5bWFj9fw79ehtVcwioVnu9IBWPVc6guzK2r8C+pnwxDNqLd+zrtUKZSWvPoK9nZU+yq1a8UJGvQjms/cVset4Afhy7VVJRBlgJbvWmcWSJ9gzjkzImMGfZNsu/4eT3l8/gmBk/XAHQVk695uq37CVxGy6R1xnoQViIPu7hdfbndUq/ov1kAcFotJoX+RX3Anz9id5y5i6+ogdXtXwQjB5LBLccoKrjWl7V+5dJIL4k1j2GgoZCn1ck5KUlgDwGisHq/NYHQUlOPMSEtE2EhEU4l3LdaKdTq9UMPzBEJ+kbtVBs+DaXTzoPrTBV+JZ7WSTtriR3Hieb2WPj37s9GkqpJpSH97t9hPMkPoz80yzpNXpEti+gdPkeAQg32oFgrXI3erN/8yoovdTEUPyJXpYVIilJhPD3Q3M3eROQC4yj0y7aK1R76o
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 10:16:51.8048
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d24d8592-c4d4-46fa-246b-08deb7eb3e17
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9351

On multi-socket platforms each socket has its own BPMP that is
registered with the kernel. For such platforms append the NUMA ID for
each socket to the BPMP debugfs directory name to ensure there is a
unique name for each BPMP. Note that a 32 byte array is more than large
enough for storing the name.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/firmware/tegra/bpmp-debugfs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/tegra/bpmp-debugfs.c b/drivers/firmware/tegra/bpmp-debugfs.c
index 4221fed70ad4..4f15aae5f124 100644
--- a/drivers/firmware/tegra/bpmp-debugfs.c
+++ b/drivers/firmware/tegra/bpmp-debugfs.c
@@ -772,6 +772,7 @@ static int bpmp_populate_debugfs_shmem(struct tegra_bpmp *bpmp)
 int tegra_bpmp_init_debugfs(struct tegra_bpmp *bpmp)
 {
 	struct dentry *root;
+	char name[32] = "bpmp";
 	bool inband;
 	int err;
 
@@ -780,7 +781,10 @@ int tegra_bpmp_init_debugfs(struct tegra_bpmp *bpmp)
 	if (!inband && !tegra_bpmp_mrq_is_supported(bpmp, MRQ_DEBUGFS))
 		return 0;
 
-	root = debugfs_create_dir("bpmp", NULL);
+	if (dev_to_node(bpmp->dev) != NUMA_NO_NODE)
+		snprintf(name, sizeof(name), "bpmp.%d", dev_to_node(bpmp->dev));
+
+	root = debugfs_create_dir(name, NULL);
 	if (IS_ERR(root))
 		return -ENOMEM;
 
-- 
2.43.0

