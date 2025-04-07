Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908DE233730;
	Mon,  7 Apr 2025 10:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744021450; cv=fail; b=J5CbniIO1BWfGF7oOHk9VHvTuBCXipL5agB0OcZg9EQEIszUAClYKz3VW/zWsCBMZoqSPw34u5wrWWQQ3s30GIt+NqR3zqSzOELj/3UL4pMsBXClRWYaxbWRLilV7I7QQowOAWi1JsUw5gyK2X3Y5tuU6hUKXIQCr+Y5oZjjnfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744021450; c=relaxed/simple;
	bh=EttJqp/e5JurXYTPuFdoQMmvND/9SEJkV21NBttkBa8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=It1y3IqtCoElbeq4Mh3QZnY+37wdJ1nvNOQ+Ylz9K8L1UQhEPspyoUd7qYy2zWVVho64HD7fqY1FqZ0vqkD+N3OpUlAiQeesQtvTD5ItcfcPbZ3ORawwLF1VMPvLsGR5cYfMPvCg8ZQWm0Y3tTbGwwqBFnBCQvVlnI8NCsPY6PY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=P64U1GKw; arc=fail smtp.client-ip=40.107.220.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="P64U1GKw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VOL+Kbezyl+xrElzIE7cy7IJxVXEMQSSo7P9TJtt69ALg3WzMfbhVAVlf4ZVQ4M5jnXm3vaZo9j43ETW6eP/AaBZvH5sZpZLKuUzdr0aG9GFtV2nw/XWSjtmlMlN3MEK9d8PjR1aJBXi1635SL1skZ/eQjx3ls1JtJl5QfZBNLXTRn3a/vCdqZxmifgz7cU+Dzp4E3wd6QUh1DVDHcWGFAtWFZopWZ6UjmQLaPKHika3BVMstVNfK7taM0DrAXqBd0T8GoDUzjEaeVTPUXvUyYjuZW7QEvc553kn7XvWo8yEVPzIkMwe19VGL+fC8HpuOFbLBp9Uba2bDtgDHZO4mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tEXer9qEocgF6pPmTBSmoQdvud/P64iLVVHXAV89238=;
 b=XGKTH/kkw6T/YSMy4rvRLVpKWDTJdaMSEviEC9rEDOaoMHqvUJtH9DBXbgna6VbHUNJgh6soLpKezm1f8+4DA79psrxHJa8lGa+sds3PQshc0iI3pcdWscNCTN4u+NvmnegWfdIdT1TUja9/knXQS1D/KBaZySc4sOnNZ40ryEvz1QbGkR9Z91q2vClEJxYO7xlDh8Utxeg3lx5ZYwf8zcp2WR7envkAp4NJcMycSaXuBTs1wOYNyLfLXSEo870zMGqwagyeZUipENejHzpq20cqQvdgmPcM3XymBGf+Wegksa1tOFdmemAwRQl1Xt1EsGc/7nRoJ10iwmhD/E/jcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tEXer9qEocgF6pPmTBSmoQdvud/P64iLVVHXAV89238=;
 b=P64U1GKwMzb4dfKMgWl2oRI2o7LzMDXHzg8o0fmkN9OjgHTXqQDHq+Zpk+hjc3fsSDZ0T2znzBjrId8vV2QX7UDbW5Qxiffw8K/LMrDbLriM0ZEfBntVOAVfBR1aO6Bam7/N/xN4GrLJKnz1bAXdIyrEE62eVY7qgfSQ4P7XObit/lYuQ5YKLvxxvnYki6loZTUxO/xIfcsnIZc+XVyky0ADe5rIsJZRU4M1dGf7mLDB8BlWl5cqeMtXBRwNi8XC8xY+WvcKOM2D1AN3lOTklPQGA9PDP6Rf9NAlT5BxRmJXeirww0Ew9Xmf6On/Cofe4jCkj7yIb8WEOhIz30e2Lg==
Received: from DS7PR03CA0073.namprd03.prod.outlook.com (2603:10b6:5:3bb::18)
 by CH1PR12MB9599.namprd12.prod.outlook.com (2603:10b6:610:2ae::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 10:24:05 +0000
Received: from DS1PEPF00017091.namprd03.prod.outlook.com
 (2603:10b6:5:3bb:cafe::3f) by DS7PR03CA0073.outlook.office365.com
 (2603:10b6:5:3bb::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.33 via Frontend Transport; Mon,
 7 Apr 2025 10:24:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF00017091.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.22 via Frontend Transport; Mon, 7 Apr 2025 10:24:05 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 7 Apr 2025
 03:23:49 -0700
Received: from robelin-Precision-3660.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 7 Apr 2025 03:23:47 -0700
From: Robert Lin <robelin@nvidia.com>
To: <thierry.reding@gmail.com>, <daniel.lezcano@linaro.org>,
	<jonathanh@nvidia.com>, <tglx@linutronix.de>, <pohsuns@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<sumitg@nvidia.com>, robelin <robelin@nvidia.com>
Subject: [PATCH v3 3/3] clocksource/drivers/timer-tegra186: Remove unused bits
Date: Mon, 7 Apr 2025 18:23:23 +0800
Message-ID: <20250407102323.2690911-4-robelin@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250407102323.2690911-1-robelin@nvidia.com>
References: <20250407102323.2690911-1-robelin@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017091:EE_|CH1PR12MB9599:EE_
X-MS-Office365-Filtering-Correlation-Id: dff6fbb2-d6a8-46cc-c1c8-08dd75be5307
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6KomiLYS4LAuCLb9ighSt4jyK32zqhlRD049lrVuPg8wdBctCjUQOuMXSBSK?=
 =?us-ascii?Q?wJHsfeLdXstiCXcqoPGaXSzQkpxbN+tMUeayquIHbf+j4f4T01frKhnZTPWp?=
 =?us-ascii?Q?6pzZO91QB7IYhN23Jj7FdkgFIgwHkBNEzVkP35H/0qTCgHxmCCkUZH2HY7bl?=
 =?us-ascii?Q?8UF5MZOxTMZ++uAWH/pug3K3DHNiWf79hsAGdgA7mkVnZJ5lSdl347TD50T5?=
 =?us-ascii?Q?ow2aTd0aI4aGw7kN3z+XNG6x2JATqXNKkZGVBzQL+TcBvG75QIx9fNSiJSW2?=
 =?us-ascii?Q?SBWPXB93RINlgTE1WsB1AUVwzqmoTdYhzBU/MvzpPm+UtgAZiD6PEV32G8zr?=
 =?us-ascii?Q?U7XKm8S+OqmWWcZ6o7qk8nO36bj0NkK6cXmsLvynWY6Bt8oORseUcAjOy0pp?=
 =?us-ascii?Q?Utwp7Fc0L6EfZT4WEgHFKV8BG5A8vvT7rvZOqpvTUMcZc1rujzBuBvSAQpel?=
 =?us-ascii?Q?F8QiOnVs6qKMhSVMHbrJJ3jCJYbSPhZW8zBGHiRjxzBhYq5LwDuoL1xtS2z0?=
 =?us-ascii?Q?geXNfnEjcHfYAcH4YXohJcwxKZhzLvkMv9orOHxR+OQnp2E1pglNXUZlZ48K?=
 =?us-ascii?Q?eo0n2NrQ5DF2yUuv/Emhkth6Wb4qBgltfCONSnCyniWwUkBWHW1iC/1JZd4i?=
 =?us-ascii?Q?aVduD74wMI17402WgyYKQfxlV73Qlj8MXUdHFCiiN4lNZ1DJ748jJFH6qv7Z?=
 =?us-ascii?Q?Ebx3OGRQOExF5tPwFljtOsb78VOwZGbd2EFGHJ14wcQjz5WxyqEz9HJSzH+P?=
 =?us-ascii?Q?27uYis6LLXW4MACELcUTIQKYZmzyQ1usdxwtQrKpWBC1uNEePw1ysC9LWgzx?=
 =?us-ascii?Q?LIUgKtCU2T32nENFsw7kTEMfqRe9YxjDFE9y+BGgJvWHi4YyoM/PfRr4z9Eo?=
 =?us-ascii?Q?Bdfz9xdaml3vcyxx7pYfY2tg3WfrnG/ss7u+QV+cxVb4L8kNJx3uw10TBqnC?=
 =?us-ascii?Q?B08ak2uPYY66B4TUvEBh6GgcT1wQ+tlVNR5mJAwFfdiXEe7bBOc5NdMVV9MM?=
 =?us-ascii?Q?2oUeRQ1Qp7727AH+TLMZSrPX0eu+sESIPENeuXCdw/SQOovJSvo5Ai462CsD?=
 =?us-ascii?Q?EtvIbC+91aTW3Zar75hxcdm3i9e0I0tdo7W1rlGoyN1rUneV3d2dXvUgnn8w?=
 =?us-ascii?Q?fvhiBwtGfi1W4FM4M2kUaG565AWO5eGuexYFQEpwBPy7TsjxxkzRboSJU1LE?=
 =?us-ascii?Q?88owTEau5xNuchJQfYwHKifN6kaO4F7Eipiw4FYQbQj3ZST0XCBgiNNG9DOl?=
 =?us-ascii?Q?sML+SmSMcu6HjW7H83vrGPZU4ieedLqvh2HRRNNzVrHrZUAfFSpyiefMNgZg?=
 =?us-ascii?Q?LcOrpEl4JEpYKet5JtM9IC1DgNfltYV+KKdIZRqzFgpzi4fMypMrkg8i9CB/?=
 =?us-ascii?Q?y1/9qWcTqtC4Yb1VMb3UQIg+kcGhX59UBfHk/hmooQ3BclsBmGFKng1G/9mp?=
 =?us-ascii?Q?7kiktu3FamRsEDgiUVyy/soekNRhx+auBEohSf/14AjPUUNJXHzWR45UWJYa?=
 =?us-ascii?Q?7K46ixwwquTpvGI=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 10:24:05.2325
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dff6fbb2-d6a8-46cc-c1c8-08dd75be5307
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9599

From: robelin <robelin@nvidia.com>

The intention to keep the unsed if(0) block is gone now. Remove
them for clean codes.

Signed-off-by: robelin <robelin@nvidia.com>
---
 drivers/clocksource/timer-tegra186.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
index 3967d023781b..2c1a30291226 100644
--- a/drivers/clocksource/timer-tegra186.c
+++ b/drivers/clocksource/timer-tegra186.c
@@ -175,15 +175,6 @@ static void tegra186_wdt_enable(struct tegra186_wdt *wdt)
 		value &= ~WDTCR_PERIOD_MASK;
 		value |= WDTCR_PERIOD(1);
 
-		/* enable local FIQ and remote interrupt for debug dump */
-		if (0)
-			value |= WDTCR_REMOTE_INT_ENABLE |
-				 WDTCR_LOCAL_FIQ_ENABLE;
-
-		/* enable system debug reset (doesn't properly reboot) */
-		if (0)
-			value |= WDTCR_SYSTEM_DEBUG_RESET_ENABLE;
-
 		/* enable system POR reset */
 		value |= WDTCR_SYSTEM_POR_RESET_ENABLE;
 
-- 
2.34.1

