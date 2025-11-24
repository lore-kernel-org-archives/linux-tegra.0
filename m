Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010012.outbound.protection.outlook.com [52.101.193.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F16E23C516;
	Mon, 24 Nov 2025 17:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764005751; cv=fail; b=bEtIdPkPPOvrQil09/fUGikIzLnkCMqvvJxkSQ7EFKD8wcjaU4hv3Fg6xdTUSo8uAthbhuDS/gssh0y0UCrO9ZqfoLXw8Nlf0ED1LSYyEOjXrTnyxVMIRDcryb3d2h2II/WypSvRvUh4L05MNqZ93mUiSRG3cwZmFOWeEL+TTVE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764005751; c=relaxed/simple;
	bh=KU+FNdGNG9LOtWwTzxkESlJYxOQ4EMpn+V2trhYatc4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qI3JPoL6u2dkvgA87y2JcO2mBn1GSoKvw1iBRAHkvYKA+Eas4zWGt0YX7+i8XtMUOcz+JBRT6xYh+tYd8kJPRGB9QTMWlK8llfN0CN3+fV6YhitwlzC+oMrG+rRXTO+/Esi3bz97m4Aq4kXIypx9ibMZmrP3qpKkMqerymo+c5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=N0SYqzby; arc=fail smtp.client-ip=52.101.193.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="N0SYqzby"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QEsctIRxml7GN/wDd1aW4bVM5yUkHNMAbkDvSGgTA0oU9RpEbL4EfQF7Eek9Tld9louZB7tFVYVo7YwwXggxGLczUF/WakZlpnZCH4LZtJBAy31YM7WYI+B3JVWsj8TdJM24PQ4+rMzBVEYR3pNF/heuvC815znZbHhwSoVKdNy3E6Pm1ZhFb/tRmnHc8VdlQbUhCBwk/PQBey+hS2mdgtxK4+s2IaySvUBtsd7wxAXCRttR2ZlsQmcPGyMJZ3NzovAG9E5PtBdZr7qWjz58rVqwtWIy21cS7Q5NeD6HfrmZIVlLJ0r4+KA8WALB/eF7NUWSPSiCtSAiRuups7v9ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ruYozXCoq1JZqE2Ra4AcgAtDDWd5CTR+ZaBTWy8RcsM=;
 b=OfsRip7fjWEK8u7mL8qt0BBKGlZIIDkEoYj6y8OcJiWM+gpFnltckfCi1T4lIbpOBdCDAg2vps/N9UeDNzM16gHd9GZMGdvY+5MhDnBNrlmbAkTvLrP306yG9BD9INydJ8tWhZAXz2rWWcchRspHbNdkzX7FbGtuJGYnKbog5DPPYUGjyA9MtfEXXjVvguQf0rEvz8H1TUHiaRLhqWlxfjJCpDGcLFil43qnMSGE9LcYpX7+Vcv698wA525X2QLbW5ptKaFCx1bAfKNxKObALBbus6rDpzxYIA/zCiH680cXVuuqwxYTCCoVU5ia7pw7ZW11D8+oBOzv8F1G/h+Myw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ruYozXCoq1JZqE2Ra4AcgAtDDWd5CTR+ZaBTWy8RcsM=;
 b=N0SYqzbyySAxpl2QJkIZG0ztaKf9iXKf9YWk2LO0Lgy9OSd5NfzSren6a2+HfPPdWsql3PPjDuJCHGjHb+QlNxnPrt6EScpMmqTmU0Ju5laJ7kDxDAy7lYMDgeMIniLAqQWJ487DC+5hPM1gxyrkOpWl0T1b/0tdGGeiewt+hv8pOQyeb8IUfSJTwzRVhgLlMg8MF27cqGCEvRAfIqK510+WYQmKUxJTEAzakT6h69tSzfnAtJY8WXgqlzAcK25Wyg9WAM16KhOBBJJJQpd5J839GHi0X48a3gXHWg+0j/r4Wli3LtW+Y7smcETM1wvbUA8bkF2N167pki7gC85/3A==
Received: from CH0PR08CA0026.namprd08.prod.outlook.com (2603:10b6:610:33::31)
 by DM3PR12MB9286.namprd12.prod.outlook.com (2603:10b6:8:1ae::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 17:35:42 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:33:cafe::53) by CH0PR08CA0026.outlook.office365.com
 (2603:10b6:610:33::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.18 via Frontend Transport; Mon,
 24 Nov 2025 17:35:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.7 via Frontend Transport; Mon, 24 Nov 2025 17:35:41 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 24 Nov
 2025 09:35:16 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 24 Nov
 2025 09:35:16 -0800
Received: from build-ketanp-bionic-20250813.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 24 Nov 2025 09:35:15 -0800
From: Ketan Patil <ketanp@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ketan Patil
	<ketanp@nvidia.com>
Subject: [PATCH v4 0/4] memory: tegra: Add MC error logging support for Tegra264 SoC
Date: Mon, 24 Nov 2025 17:35:06 +0000
Message-ID: <20251124173510.2602663-1-ketanp@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|DM3PR12MB9286:EE_
X-MS-Office365-Filtering-Correlation-Id: 229eb7e4-6458-4dd6-57f9-08de2b7fe406
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W9M/Z3PcKaIsa0ZS+Y6opwuNma0Fh5EwK1oWUK7omSbomE14LlADrXrvcUEI?=
 =?us-ascii?Q?sV/2bezxYu/i9W/YDF8jKGHmLYvQbJo/xhOO2gg1lSqmBxX7VAwh7HKbbxMN?=
 =?us-ascii?Q?XEf1nF1S19D13rke5xgxhHYjlzGehpZNGkAmM5SQ6PNpI3Fx9Dgpjjdeo2CY?=
 =?us-ascii?Q?ZQdRUKzRX2WRZkrNynUK7dx28Ze8S7L5ov/qeEjPjeXENGISqLuYraepystK?=
 =?us-ascii?Q?ZZxJgegije1IhljQV9pPW1s+P/jiPQcdunnPKNtsk3r06z0aa6UZX1EwHFJ7?=
 =?us-ascii?Q?jjNKozSs4liMtR1Xc+yvGkG1GBku3Oe5lhdt/S6rAc0B8o8QMkNBvp65RKNM?=
 =?us-ascii?Q?1f3HwmXX43aFCnYM2ngFqHm/CfPvQLNo/mg/NS176Vp+L2O46Wjri/QJzhId?=
 =?us-ascii?Q?KNlQFvckRXnTBgM0EkiHlonHpaJ+IWa4UMc9SxvCX3D7XADDmB/FVPQNPf/a?=
 =?us-ascii?Q?BNY+ru0hrs/6w7XwyPDcsR62+2Ha+m8DRqtFrxFGUCSMCYKrXj0buULBaUvu?=
 =?us-ascii?Q?CBZmV37XEhl4CbAlaM6GHaEp0GPNd1K0M9r3aavce7k4dnG1QRH8aLZMKjcR?=
 =?us-ascii?Q?wPS5v4U4PRze6OzXemvUlApk7jhcwa/mV6MN8K43agrLmxa2Omnki3onPZOx?=
 =?us-ascii?Q?HSg6fTnZ4TKbLaHzpUgeJb/e6g6htnztLVbOwgOJu4w1wLzT9IC4ldM/gmTL?=
 =?us-ascii?Q?1POAW4jdf3e6PGop7O+x1A9/qKVSs+LcSttRcd5LyN3O4flkmNuqFYGMd/ut?=
 =?us-ascii?Q?mhnN1tHdRrHGvGOqttuAknH5g6CNPGFRnG1tpDYu5kTYHT2QyP3VPDjWrswY?=
 =?us-ascii?Q?EPeCb9zRLPDmv5drx+FCgKirhYi0npy4Xvst49Z4cVnMCIVeEX8Bk4avt40N?=
 =?us-ascii?Q?eLQuoR93wgsDHTJEaewrMT8FN18XlicCHGMPYNy1Ak7wjVW7cRrCaA6exqdV?=
 =?us-ascii?Q?GnnP9W/+Iz1W6CJ9AE6t2zO2omWKPiVHNrFyRkbc4n4IJtRNiHwXJWAK4Xxd?=
 =?us-ascii?Q?9alfCXrE0lyqbp63i2kUZFOqvYw3Q7ODs0VNFYCJm8DVzSZmNetU6MkC4DV8?=
 =?us-ascii?Q?IQJP3cYrQYvY/xoMFkvGXAABN742sn7gya4gmjJou0xQHGS/F8H/WUdvveRA?=
 =?us-ascii?Q?rUIbd5joCFdldKTXEKIyWp4kLbJbAr4AE9w1upfeU0NynJ1aPb1UFnW6YcbM?=
 =?us-ascii?Q?+TJ6aPB4EY8u3kvEgFwEjkLkUgcL+UUSIMk8QIwic2f2nN9MJumS4f8vszU3?=
 =?us-ascii?Q?fuyTOHcQ/azjiL+UZMuk05QIwoMRlHWeppiQ8HYKCHtXYqZIA2d724H+NmPy?=
 =?us-ascii?Q?W2IIF+DaWwBDkfOgeNopcSInLEOJvJ2FpvAQCcGTf6LdfVl5WvJl83OZ+1np?=
 =?us-ascii?Q?6I+p4Ke/yknIjtAUoLTPI4XlWtOStBaJHdo2Z+G5XsMTY6uKdVRBWJWwEGiI?=
 =?us-ascii?Q?XJmhn2u6ro1POZzUEeqK4OGYOtGeV+a5IP/MjQSO3796hAtrH2DHUS9YQiuW?=
 =?us-ascii?Q?8M6sMzyjcnzQcXNDFhMveB24OnLok/amdqMsF+jUSBCq3UxBhp+mIQg+oGlp?=
 =?us-ascii?Q?LVchO5kDF/rvxBaiV28=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 17:35:41.8002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 229eb7e4-6458-4dd6-57f9-08de2b7fe406
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9286

In Tegra264, different components from memory subsystems like Memory
Controller Fabric (MCF), HUB, HUB Common (HUBC), Side Band Shim (SBS)
and MC Channels have different interrupt lines for receiving memory
controller error interrupts. This patch set includes changes to add
support and enable Memory Controller error logging for Tegra264.

Ketan Patil (4):
  memory: tegra: Group mc-err related registers
  memory: tegra: Group register and fields
  memory: tegra: Add support for multiple irqs
  memory: tegra: Add MC error logging support for Tegra264

---
Changes in v4:
- Fixed typo in variable name
- Added MC instance aperture mapping for hubc registers and corrected
irq handler function to read from respective mc aperture.

Changes in v3:
- Fixed compilation error with W=1 build

Changes in v2:
- Fixed warning due to use of uninitialized variable by returning back
from the function
- Removed unnecessary extern declaration of tegra264_mc_ops
- Updated tegra20_mc_irq_handlers, tegra264_mc_irq_handlers and
tegra264_mc_ops to static

 drivers/memory/tegra/mc.c       | 125 ++++++---
 drivers/memory/tegra/mc.h       | 140 +++++++---
 drivers/memory/tegra/tegra114.c |   3 +-
 drivers/memory/tegra/tegra124.c |   4 +-
 drivers/memory/tegra/tegra186.c |  14 +-
 drivers/memory/tegra/tegra194.c |   5 +-
 drivers/memory/tegra/tegra20.c  |  20 +-
 drivers/memory/tegra/tegra210.c |   3 +-
 drivers/memory/tegra/tegra234.c |   5 +-
 drivers/memory/tegra/tegra264.c | 439 +++++++++++++++++++++++++++++++-
 drivers/memory/tegra/tegra30.c  |   5 +-
 include/soc/tegra/mc.h          |  32 ++-
 12 files changed, 694 insertions(+), 101 deletions(-)

-- 
2.17.1

