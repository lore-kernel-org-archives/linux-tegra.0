Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2040.outbound.protection.outlook.com [40.107.212.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D661B7F4;
	Mon, 21 Apr 2025 10:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745230134; cv=fail; b=RQ+1Z6XxrYSnmX6krA7IlxwcjmXE7m8qwJIJQ6rMfkBc1OV/+N7NwWIW6PL6dwCxERhcMBcB3hpeNfIAC+Mlidui8+4j00ASbK/bmblq3yNIyLlzUNsIafkpNONNL8pW8CI6MlB+Ff7KsOYUlj6eRPEOqfaaJH9z2ALJn6SoHEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745230134; c=relaxed/simple;
	bh=WsDsS+yGIyCZ5EHPbYYR0lQZYfrhAV9A/AXAwkt+hQE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=t2p/CmbVB5PQBT2JezboRm701KTQKPRCnYxFOVVk4vAUwLj3ILEzWNVxweGaXgpcL6QDlnCbRthEJZZkQup3f1Lcl/ZoAZE8Ksd+iIJNt8ptqspKAkXvKzntmCXowHg04IuhlQwFx7k6ZrryuSGU0w8ih9mMXEmCSfcyNP9E04Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WTaeKwJZ; arc=fail smtp.client-ip=40.107.212.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WTaeKwJZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K9QA3az6d9IzrVd/LWCinFdWoviifZoW32bZXM7apOc0Nch7Edo+wyDn/4Hr19OJg0wvHZYvC3YNAemX1m+X2aUETql6/Ma0K0G6ASjDxThNIjJx52mcGer+adMGm58xPwdNgg4bGYWzlVw00RGqbf94jmIvjZj8pWbCJ7zCg8/C+ulIvBNKFgB1ECKVD3ISB8RHTCA2F8e1b30DwW49MdY2yZpYqKvZOO8QUaDv83l+XaKpfFlBI+RnTP0locsV9YOybML4yIgIlJkYmCxerkudyeSxCZ0CBBybw3lW3sbLnb2kGO1TWcUxmsYY6GzdSdojBPHAVx1ZkvQZ8jRk6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=adSO2vPrnUJVZ+Hsc2Kg395t6RtV3qcTZkSwQ0s1CLQ=;
 b=YmPt0FhHAr0eMM60zfStsTKPHzVI1MW+ZFaVxbWfkInWdYPJ/6q7cLPHd1b/1zeTOROPe7QMtrrlVQBdujtWVcAAAToiyR9iaL96aC3r7CZtIztMBIOkjCwR5AsNhseH3e7MHrKWlHGTv7MSLBEEQ7e09Q4rBtLG/TQIYJzSiVomCG+l+cEu6j+fcgeGb3rjWw4Yq+KBlMoP7beCJ2fs1xRtrp4j3BKCgKtyhV48LA4omAFzfZIrkaofFJ7622ggGjeeG82ZR/1HF/JHAXMKhljqS/cS3PRFRT3GBd5t2eebZeP/jyez//L8igErOVWBwOKH2erIKdRM3NejvaLoSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=adSO2vPrnUJVZ+Hsc2Kg395t6RtV3qcTZkSwQ0s1CLQ=;
 b=WTaeKwJZSnEwBFeAUyrngT+M/X8KroNgC04aWVEwPZWm8ylfScec8vShO3fUdzIaVfGm11lo18fVd35Cj6S/06PhILM5By9XE847Ttu5X4d977Ccf7rX7q0Nb9LrNqPdyvnf/o3QwPNOnj3pTPsL0TO33rVLJHna7upfM6fvVNND14mXDszbjRRd7Dh2sTmatR06J4iZI5SAtL3JdAd+PEvq2YABZj7OVNEPQFkVTKthoH0HAVlHjbsN+n6tcPXpNi+euSpqI21Vl+YzXyvHfeunHno+L6v/epVxA3qRocrzwF+Esudm65Pac2Dba23vtHNY6rODw3zIfARFEezutA==
Received: from MW4PR03CA0058.namprd03.prod.outlook.com (2603:10b6:303:8e::33)
 by IA0PR12MB7751.namprd12.prod.outlook.com (2603:10b6:208:430::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.34; Mon, 21 Apr
 2025 10:08:49 +0000
Received: from SJ1PEPF000023D0.namprd02.prod.outlook.com
 (2603:10b6:303:8e:cafe::49) by MW4PR03CA0058.outlook.office365.com
 (2603:10b6:303:8e::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Mon,
 21 Apr 2025 10:08:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF000023D0.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Mon, 21 Apr 2025 10:08:49 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 21 Apr
 2025 03:08:37 -0700
Received: from robelin-Precision-3660.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 03:08:35 -0700
From: Robert Lin <robelin@nvidia.com>
To: <thierry.reding@gmail.com>, <daniel.lezcano@linaro.org>,
	<jonathanh@nvidia.com>, <tglx@linutronix.de>, <pohsuns@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<sumitg@nvidia.com>, robelin <robelin@nvidia.com>
Subject: [PATCH v5 0/3] clocksource: fix Tegra234 SoC Watchdog Timer.
Date: Mon, 21 Apr 2025 18:08:18 +0800
Message-ID: <20250421100821.2907217-1-robelin@nvidia.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D0:EE_|IA0PR12MB7751:EE_
X-MS-Office365-Filtering-Correlation-Id: 246d5194-a224-44cd-1c27-08dd80bc82b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hvdShvDGDOtYZuew9J6zH0H6Z+7sM1bJ95Wo+KY978qEH1ZKFCYZ2uXEdQda?=
 =?us-ascii?Q?SMlnZ8M6hFuHIZnYEfBPQN20+AG28cXR2Kw4EWRtK2F6VmycRddf58IotsNo?=
 =?us-ascii?Q?kWcqsKVNkOOd/oxw2lzjnl9mezTQmm1a5zi/cZ9xPTKPXNazoCtwHWUm3xMg?=
 =?us-ascii?Q?Us0iaix2i4LEbQo9pFSjB3kbl9Go+ViVpJOHH2C9Vi/pwqfLzjIfgSIYSFFp?=
 =?us-ascii?Q?brS3dKKhZCPDnm4YyUewksqybSY8Lq3UBNETd6BXv5Ihpbi87xPyFVHRVp4W?=
 =?us-ascii?Q?Cq26SvcfEvxkFGdUouitPeysOT8H7wkN+PNIyS3nozOivtez9OB6Li7vMcAw?=
 =?us-ascii?Q?KNpgQUK296P5XD3GM9flNsd4MKzKGOz2klPcyBoiFRiuiHaUYyjjQrLu7q5T?=
 =?us-ascii?Q?zFCLVDmj0Z6CX1yXbe6503dNtKlC1FJZ7tdIFbDpY1ypyCoZkaIALewF+vmm?=
 =?us-ascii?Q?ydDm+GnsFb0hh+/IlKC5+UY0VBddF0WnFzFA0QcLIQQbNecYFIlcG9itvmqY?=
 =?us-ascii?Q?xW0n8f5VdVUM3OUNB2bdv9Qh4ZslDIFoEambuUWlLnsw1Y4cu/KaDTJaXfQP?=
 =?us-ascii?Q?6f0vyK8mt/mLUnrLDP/DaeCyIhA+aC+mqT2y1+BousbICZXSq9ypoXKGddth?=
 =?us-ascii?Q?5XeTO40OSdikx2phQAnBMdAlMYt4oiJtNizmMKEYzUhrFgO4/gmfptEmVZQT?=
 =?us-ascii?Q?sNE7ZofhcmcigrqH6m8sc0nLoVd5gh14HHpiUo6/iyyRnqCads4fVNxE7R1a?=
 =?us-ascii?Q?N1TcyC+2+C7PTONtdaFevtoZSR8pP85NJBU45pX8FdRnzKaWWtT5SQfqWEmv?=
 =?us-ascii?Q?XpnDo0iREZckvL+KeXKq8lkKQ//pVYLggLHd5kiTC+vHQM7J4/hHWZeKRJaq?=
 =?us-ascii?Q?yWq5tOuzFbnDhBmdzbTV3+n09WBMRVPk7jbvq5sUyddvzLcL/iJAT5fOz2YW?=
 =?us-ascii?Q?b9HEl2JlnNNtIhhJ9YTRY5KOYXJFm8aHliMN2iZ5XGp4CXxl6jekeHqh+D2a?=
 =?us-ascii?Q?xI7ZdgOjj3OLY2rUyZ0FaKqeKmkpDt2Bqb8ZEXHiYTA56Qmr6+gueBP0mRd7?=
 =?us-ascii?Q?BrrZ/wjINw9W+c+kAPpUrAV0OfL1TD5RcfEom2/mLQlAzC4sS0tsVlGryi2N?=
 =?us-ascii?Q?Mn5Jbx/c7yoVKaNBUhMroJqUPTTj4Y5MmV+kkgk6rBZlIdsb7WFPaa2kRQaU?=
 =?us-ascii?Q?l/t7Y++F957+syci30VoY6fjTlqcV4l46IGlDNqHwR45tKdVL1UYGjBMw77F?=
 =?us-ascii?Q?Mp8Uw95khvfPJDIKugSPbzb3e9DNgocs5bdBDeHl3ZGtJQUc6FEjPlNJoLrT?=
 =?us-ascii?Q?XPeRY6zkd4l0X+1GNdFXORBCj5ZgcJ7kRbcJZNB+2P8NOEQX9CP04XMJNxGf?=
 =?us-ascii?Q?ayidAsAb3f6olOaYTNzEYTGAR/zKIV/VQbRB3FXjk7nKyXkt8VVNge2YZPkj?=
 =?us-ascii?Q?kh0kL57n9gDc96+Env+ssqs58/JntWJp8ng2TLPepsOlOfFIpbhdOoysKDgS?=
 =?us-ascii?Q?QEGQv8nxuU4aBYrgio7TBEILrjSeHdIBaITr?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 10:08:49.0309
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 246d5194-a224-44cd-1c27-08dd80bc82b1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7751

From: robelin <robelin@nvidia.com>

This set of patches includes a fix for watchdog for it may not bark
due to self-pinging and adds WDIOC_GETTIMELEFT support.

--
V5:
- Print warning message if get unexpected value from the register

V4:
- Improve the precision of timeleft value
- Fix the unused variable warning

V3:
- Improve comment description
- Refactor to fit codeline within 80 columns
- Remove unused if(0) blocks


V2:
- Fix a compilation error, a warning and updates copyright
--

Pohsun Su (2):
  clocksource/drivers/timer-tegra186: add WDIOC_GETTIMELEFT support
  clocksource/drivers/timer-tegra186: fix watchdog self-pinging

robelin (1):
  clocksource/drivers/timer-tegra186: Remove unused bits

 drivers/clocksource/timer-tegra186.c | 94 +++++++++++++++++-----------
 1 file changed, 57 insertions(+), 37 deletions(-)

-- 
2.34.1

