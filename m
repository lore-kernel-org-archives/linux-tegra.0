Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012024.outbound.protection.outlook.com [52.101.48.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BF343E492;
	Thu, 26 Feb 2026 16:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772123525; cv=fail; b=gPTYXGG17VfQ8TonqdAUy1iFsCrbA4yB7ax4HyxC4oTKwD8gymgF6YNV8JxPtrQ+kMP4lqg7S2njQunV/RiZMxX4frXpXR4xsATrMT3TtLerc9c0WeaK+4rOLG3i79AkKQr02XsGytBa05pXAK9TvxlkbzoRxYRsnuuEaKIelvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772123525; c=relaxed/simple;
	bh=S5k2pxSusZLYCel4lCA/SClxzlHRONsaVqj4T2BGGjs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PBxLFhq65p+olWPIw+VozN8oOmv9yR6QQ8reAxqeFjxKt05da/fMy0mLC6JwMjFcHu/eFpSaMgexerYRG58epMXQDvWY1Jk8zZaLKupspq9cHDCUBxvxrBK4otstAVRZwAz3DddqBt0HaKRYN0Iac7r59MEkLnCIU7CecT2nCcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GPMWKqFm; arc=fail smtp.client-ip=52.101.48.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GPMWKqFm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uj63qDWm6mQS3wcx5NUPlCPqjW+KDRFal3Se9XU0iaOAfjqwEr1EDmrA6FWHy5lTrefmWEiEhyG+mwuOX6liC509hd0AMbhK6sTEfq14gPQF68pIe3O7R8mcxDOZuFe3/1oo4LexKifGurEyCBYuo8sdfn8+HjYQ1awshotAZafC26u+m3AdYHcCWAw+N5fiI460Ypnyf1keM6+HxUQky9eiV08FIO2aqNPgi2EGkmfp/sQDkYMmMKzh7eVZI+tYZTNDdoGvWLGQaHyDbjj6twWkzFbCRaUM0lFUpGCYYYJxrfMYhtbH2kowEffRpux4pvEedRij4MZ3meLXd7ya6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RI9XEIA4+ieJHO91+r9TRTVoTLcI8CVph4lbvZprrUc=;
 b=cHrtpmd80z9ae3kQ43IJltvRMtWzHXtLSI1rCfzJOzZyB9Su8deHMX7lwJXTKjgL4xI/8X0wQ5pTjwWRzrUo4o+/VHTE1wkGo219vUl1wUnx0pc5EGWsofISuNypWSfHaPwbbJMW+lSRiwqwFfFuo2vZQJ2iTI2HlGogEqF93MeWZCN0GU02kg+iKFTn1JU/xmuOvY2MoWuzI8777tas9z+ZgfV8sT9Z5k40Ujg+s7XPZbC9FvyVAMxs9rpGyEqMPLZSyoRnEbDVaBIZ/dJgpX47UiKUH/3TkJrPQtMCEeZbFD8LxMfG+gVaOfEtMOgtKJwvMDFBpN+IMF5Xl0PevQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RI9XEIA4+ieJHO91+r9TRTVoTLcI8CVph4lbvZprrUc=;
 b=GPMWKqFmAOC0BiImDe6nnAjVV5F3ewyyXHz/7qIoEGIKsklLHhPeIgjZfkoHmYaYTLkjGAtMGrdhx0dtbylhlZkwWYBPnaL8YKI2jkYaP4ZKjnHMktdjmj1qiNrmVA325ZiLEkKtj2cSN9ZKGgOOxoUC7TQFqTovTbyfQQLnE4/OKyj5NJ7kd2oPJSbcdneoPINibGv3gv8c8Et0ILETjjZbZ5URISCLndPJcFPH7mNnisfojcqZiF1e4U7nvdUHpLVkdrS/O3+ktQyxnpixpVphSJmUlzbvyj/gateLkY9U/FmF6OkasKV1vN0ydfiXuISkEdk41PJGH23My5dJtA==
Received: from BN9PR03CA0502.namprd03.prod.outlook.com (2603:10b6:408:130::27)
 by SJ2PR12MB7867.namprd12.prod.outlook.com (2603:10b6:a03:4cd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Thu, 26 Feb
 2026 16:31:59 +0000
Received: from BN1PEPF00004687.namprd05.prod.outlook.com
 (2603:10b6:408:130:cafe::ac) by BN9PR03CA0502.outlook.office365.com
 (2603:10b6:408:130::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 16:31:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00004687.mail.protection.outlook.com (10.167.243.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 16:31:55 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 08:31:30 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 08:31:30 -0800
Received: from build-ketanp-bionic-20250813.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Thu, 26 Feb 2026 08:31:29 -0800
From: Ketan Patil <ketanp@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ketan Patil
	<ketanp@nvidia.com>
Subject: [PATCH v7 0/6] memory: tegra: Add MC error logging support for Tegra264 SoC
Date: Thu, 26 Feb 2026 16:31:09 +0000
Message-ID: <20260226163115.1152181-1-ketanp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004687:EE_|SJ2PR12MB7867:EE_
X-MS-Office365-Filtering-Correlation-Id: a5ccade6-c4f2-40f8-e164-08de75548e41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	KlJ7nx+vGDYDYUNN+3GZpKXkSUEQ5hrKZqvlOEu8LCbGwN4hV9QBeGVgbSnVRRGuo1+eTag6zVH5xvrrO9XXLI6PsE5iJpr/tF4d+PMTklDUWyqBbojOky07R6TsQibR5vIqaRuDIQ16lpyTYmVjSlEZVQwmqFElveCYMiPdI0TeJfhuab3qETVbhLxWPhYMIhgaJsOjZ0Bj9zhepkkSlmuXX6AEe5a0QLbFYh1WSWWfIIDBdl0CZyHwQSTajYyFdgsyKWzSC1pLmuKJCJC8QXVPgCxoPIMSKgcaxXjYr/P3a65WxC9XlQY6hvKImLHw7snbomfk/ZKkqi0YBIFn09Nf9WDFifuHksPwMLT+UfOERoCjJ+W/dK6oidoyWyGXiFt5aghG4+UJiFOwATXwwk3hmV5B8VHqAU++UMZVBJ25YVIMrqVqvqCgYQeGJyaoz3VxzO2AgHnK5IDxO0UL+z3EY6C23hWHZx0YnbLqxbceRAQWN1XrPCcbccQYknnRmS5EX+buMVXm1G0Ee8fRjjq/qZLCBAKCIo6zJBqmh+RA90y2lnbEDvLa4KHFSBloINvDyBxxndWn2UAdFQLL0M4J1UR5KPgAKDcRqADYLnJE5jkicFFvwlSC92Xg9wzlBcPII5c0JH+l6uvSA3ZnfLLgZafUj9AqazjDgvSuguMqoqKwUoRC755JWorylk8qbVJV+EZdNiOS11hoRrzvkbRpVFKIXVIa+SJzr1BXcz4+B8+bCRk3I7rEzoC3eSGuIctH5f2r2KQBejT+qCSzp5KB+dqgGbjUDZZZiA5aSYRYcdllZk+T2Mm2jE0UzWgmdDRKN191S7+I5vHj7Hceew==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wyCd2ipaT3mzWJJ3n5mx3nFm7dSHlXVRmUBw7wLHkewEMhjr6sgjgG8+3FHy5NHu0EuUkcr4WzW/zXM8Y9zxeKM8JWVOoTWuwW2+nukES/9af+8OkTVOspkVhu+CZFwM3HJcq7kGDEOsDbgewashL1fK291em5rBSom4VluYwhTi+meC2c3L4bzjMF0InMpPmW+vcpUSHbjfbok3K1aZTcyfJPSTMmB/8xh2RtlWNwN7vi7kJQpuQiEBL6Vh18h0K6V/ZOklDCBXyBn3ApwKdc0awkmIEaLK+VeRSBq4v7Jb//LHRmVhYDAnUkk6HRC8qbCShxEKAtKiZ/NDUruZnSbFdd/svx1d7EDao3dlb0VZ0HDS0kNdV6j+wdUPN2UMP9VTGSqchjsEG2L0PCKTKNBMLrNtdss5UZ+HIWixBpJcK6/OEC+hcKpSYg2heYSk
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 16:31:55.5745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5ccade6-c4f2-40f8-e164-08de75548e41
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004687.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7867

In Tegra264, different components from memory subsystems like Memory
Controller Fabric (MCF), HUB, HUB Common (HUBC), Side Band Shim (SBS)
and MC Channels have different interrupt lines for receiving memory
controller error interrupts. This patch set includes changes to add
support and enable Memory Controller error logging for Tegra264.

Ketan Patil (6):
  memory: tegra: Group error handling related registers
  memory: tegra: Group register and fields
  memory: tegra: Add support for multiple IRQs
  memory: tegra: Group SoC specific fields
  memory: tegra: Prepare for supporting multiple intmask registers
  memory: tegra: Add MC error logging support for Tegra264

---
Changes in v7:
- Removed WARN_ON from tegra30_mc_handle_irq function and handled
error path by returning error value.
- Moved IRQ handler from tegra_mc_ops struct to tegra_mc_soc as it
is a SoC specific entity.
- Splitted the 4th patch from v6 into 3 patches for easier review,
improved commit message.

Changes in v6:
- Updated copyright year and commit message.
- Removed redundant mc_ prefix from few structs.
- Grouped the masks and bits next to the associated registers which
were missed in previous revision.
- Separated out Tegra264 specific registers from previous SoC
registers.
- Reduced variables in mcf_log_fault, hub_log_fault functions.

Changes in v5:
- Updated commit message to clarify the need of grouping of mc-err
registers and support for multiple interrupts, so that it can support
Tegra264.

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

 drivers/memory/tegra/mc.c       | 110 ++++++---
 drivers/memory/tegra/mc.h       | 153 ++++++++----
 drivers/memory/tegra/tegra114.c |  18 +-
 drivers/memory/tegra/tegra124.c |  40 ++-
 drivers/memory/tegra/tegra186.c |  22 +-
 drivers/memory/tegra/tegra194.c |  22 +-
 drivers/memory/tegra/tegra20.c  |  31 ++-
 drivers/memory/tegra/tegra210.c |  21 +-
 drivers/memory/tegra/tegra234.c |  22 +-
 drivers/memory/tegra/tegra264.c | 420 +++++++++++++++++++++++++++++++-
 drivers/memory/tegra/tegra30.c  |  18 +-
 include/soc/tegra/mc.h          |  40 ++-
 12 files changed, 781 insertions(+), 136 deletions(-)

-- 
2.17.1

