Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011006.outbound.protection.outlook.com [52.101.57.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B26739B4A0;
	Thu, 30 Apr 2026 09:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777542753; cv=fail; b=OTbBWnD+v73QJ2ik+g/Vdq0XtDOfSnpujwhWcK1QdjnRgSmKYPq0oTLY7K8Xe6Fq7nkUacjP3r8zRwUbTlvX6Wmd2Xj86+Uhhc3zzCurAeKkOIFxpuzwDzJUo4i7w5vIcC3XeUMurEjqbRgGdB7kstupCEGfsk+bc6fKwwVWE5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777542753; c=relaxed/simple;
	bh=0PkiXqnY1P8WjInxDa4R0pujDTZBwkNi2Pz6c7tZgyw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aMHxlmiM3C4KtNX2gp7OcCIemBF6Ctxd3z88YdjgNPLU6d/P3+nx2xhY27HPYeC64en3/R2nE5WPaXuuuGi9yuPQOf1neMrYfnkqqlnnS62H7mcnuF5WsVmCqBB25PJEGEqLXeb0x2QiS/HwnVTlR/1B2+FIsApWKLd3Z64BL+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qyrCar/H; arc=fail smtp.client-ip=52.101.57.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qyrCar/H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GBPjHY9kxrpi8+iujtHThSo3d90ubkcyOg18QStF/IIfmdkPlp2UdGzO8oWp81DAS8spKseV2lAyuT3Sa9JdffUZ6Z7rUqgKh9T2jY2hB8kkJsqCfuWE6vqQ3BzcNsreRF9FwEMr2BUwyaM5o8V0GtmJTLTCE5703doXi55vuvhdQOKiEugY/JECrSHaTeZ5WppPu6IKM7VmxqHkAK7t1uzSM4uCfDddB8O41aFiJzqGUwUVsBgxRfnJmEg5ax5rxLdu/1UsJCvcWjRoyqRh7uE+IM9V8XqkP/3XsXbvZ/VQLJpEfMqRBntjXAqWFutJ9w40RFEihCGGpSqRpD1wBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+/U0dPxJO1u4i9dHGFcvkcssz83YThUNqdJoCUvmL4=;
 b=n7m2YYoujcjxeBX6d7z3ViH8bote5im5VTogtHNojN21xWNHBAt3DHh896bxcFnmcyTUZwGvXr4awrpU6EIsP++3xYeF3g6hsK8tZ8y3LFGNwywvBwzHU2GARVMx7uMHZrLrb+3dMtzg//u/Bsg5I7x6QU2fuc2UNzD4K4Q55Fk/LYpwFpfGSG/2wKob6AVbRAWK/qeO2Gm1oZMxcfiuE3fcdLbOEdUIM2HeiqleP8Fcrt504tl52MBf8lMvsRYZpFwmAs7pEDF5Ur0DLaRBopuFAooCfbchP03KC9jPPqP/rbdwz+bC3dOzXVKlPgQ0gSAVCiBOp2Lnkxk9JrS1WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+/U0dPxJO1u4i9dHGFcvkcssz83YThUNqdJoCUvmL4=;
 b=qyrCar/Hw/pxmF0hYkczsI4/IAgrRSvX98MrY7+2n7M9qm1iyKC2F/1ngp0sRa+TYJK7OBV9nJpgjddi70tJnQCP/MjwKSuuXZWbwc6b921zoza6YqFPWFgV/+92/wKnNNqHh+PJJM/mKHyG1rcYWlkTuUj59il+nNeAlpWmLIUtZomN+2/cscRmJmSxi0awRjSOZOS5r2viQhly5uSz7V0MarT0B7Ac4NKMeU5dSlNN7QV7wT58Ii6yR7/IfjdKRDtdIwTXqxG+d1c3iA828OcKyRiKmN9ANR0nNyfGto4UPrpn/Z0x5zSHkrnK6BftPQnYAGsDLNcMxphdIKMFgw==
Received: from CH2PR07CA0005.namprd07.prod.outlook.com (2603:10b6:610:20::18)
 by IA1PR12MB6531.namprd12.prod.outlook.com (2603:10b6:208:3a4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.22; Thu, 30 Apr
 2026 09:52:28 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:20:cafe::5a) by CH2PR07CA0005.outlook.office365.com
 (2603:10b6:610:20::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 09:52:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 30 Apr 2026 09:52:28 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 02:52:05 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 02:52:04 -0700
Received: from build-amhetre-focal-20250829.internal (10.127.8.12) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Thu, 30 Apr 2026 02:52:04 -0700
From: Ashish Mhetre <amhetre@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <ketanp@nvidia.com>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, Ashish Mhetre <amhetre@nvidia.com>
Subject: [PATCH V3 0/3] memory: tegra: Restore MC state on system resume
Date: Thu, 30 Apr 2026 09:51:59 +0000
Message-ID: <20260430095202.1167651-1-amhetre@nvidia.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|IA1PR12MB6531:EE_
X-MS-Office365-Filtering-Correlation-Id: 5babe2b6-b852-4b27-370f-08dea69e30aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Uc1H1B7C86KXeB/9s1+OzCP95HmwwGb4LJCOIBZWPY4V/6Lu2kVICzVvjdWiDV7W6KdlK2vIDPrWWqbCOoOTXeslXXtQXpTJl6CMuqsbUmqXqnr6Q89RVoPSs3an4s5Zjgpu+QsTgknfz5Iii5taOhAW5Y/hnqOn1/+kK/N2BPzs2EMKtGKEdnml6Op1mgipcMViXZYhOrg8lcE7TFi547+sgJJUMG4x0v7Zdq+lq0kRqHWEMTb/TjkKWZoX/tXZ7kJigUdP5WxgmeDAnXfycBZrErERRXXhVDhf4+ACCiWVPoNj7/y/TBHc0d9s208Uf/xdpIG0/fifAgcUdpSEHnI72NDMPc/6IGa1BdJbGcYQ6kXQs6yYHUcB98W+mxxxi8+tBvb+CBiMm5sts+O7UpoP5l14zoRV+1YcymWD44b5igzFyhcJz9wJVNlhEEFF5/qHlZa2e6kD6bCINvaf/iZGH8Gv5xMRNL1DKu13aJK26RdxxoQDkFmWQ2qv3UPhAwGv3SzWFpKKV1RsQ/u/7wXqlIH6w5xaAmBwa7vnDjW85SafTddS1Iv2DCL+6Gz1ALkGUzhrgNsIp2+Q3SrokE7w6G7X6/lHhZBBd4M0zwZ0FPW6SqL25aY6FEfJ3GVXVc/XQCa8vbgLYwnNutuc96A8+pdnJ/B8uiQQRFCSNqgmY7i6qx4NMJMI4lnXQrdEGzb3mYtSL1jdRM/t9k20LmcUg0SFtU7LsRO4C9U61eUmyt+W+aMYmX4cEi/dxm2FPLx4QK3TKqgc9TPwBD3luA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DP3B6K9i4/Brc5MpSF+BzSGKHmuMiDf2c0YzCNCF2yCWUncTEendCIsF5z3TOAu36QPKG0TJIF7A+PjvlchP1I1HM2bfqCCxS2avnQmvVh+g8uxxhZm1qO28DT/+q9scJcNQ6PHcd3mLP9/6TqpQOSRjpOSwcFEUdNUioiqFo9vTGkFK/Z1hHuGpL7+PM7AB1RR095mr114l/2iKanlf5b9xj0A59KcZeNhYjpvh65IHPvkkyPgWKiCp4KdhPrgQX8S+tWfC44Owq38xdGQ1aeTRkkdlhAyT68ikU2NYVWGYlvdo9IjVNoIu9qA/vhjv+L+6v6x5oWf+c677LoE/1jlk7txj4NMzGRDEfxEmRRTLqCeNenlouFr0q78B0QbEOSDmYa3gAVq4gX78kfUQU1z6m2vn0F61/CeXIhFNFtrWiNp17MceyMJNRexiOI4k
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 09:52:28.2972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5babe2b6-b852-4b27-370f-08dea69e30aa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6531

The tegra-mc platform driver does not register any dev_pm_ops, so the
SoC-specific ->resume() is never invoked (e.g. tegra186_mc_resume) on
system wake. On Tegra186 and later this means MC client Stream-ID
override registers are not reprogrammed, and clients behind the ARM
SMMU fault on the first DMA after resume.

Patch 1 makes the SoC-level ->resume() callback return void, since the
sole implementation never fails. This simplifies the wrapper added in
the next patch.

Patch 2 registers a dev_pm_ops on the tegra-mc driver and routes the
system resume callback into mc->soc->ops->resume() so the existing SID
restore path runs again on wake.

Patch 3 factors the existing intmask programming out of
tegra_mc_probe() into a helper and reuses it from the resume path so
the MC interrupt mask state, which is also lost across SC7, is
restored on wake too.

Changes in V3:
- New patch 1 to change the SoC ->resume() callback return type from
  int to void, so the wrapper in patch 2 does not need to deal with
  an err value that is always 0. (Jon Hunter)
- Patches 2 and 3 simplified accordingly, no other functional change.

Changes in V2:
- Split the original single patch into two - register the PM ops and
  reprogram the MC interrupt masks on resume.

Ashish Mhetre (3):
  memory: tegra: Make ->resume() callback return void
  memory: tegra: Wire up system sleep PM ops
  memory: tegra: Restore MC interrupt masks on resume

 drivers/memory/tegra/mc.c       | 37 ++++++++++++++++++++++++++-------
 drivers/memory/tegra/tegra186.c |  4 +---
 include/soc/tegra/mc.h          |  2 +-
 3 files changed, 32 insertions(+), 11 deletions(-)

-- 
2.50.1

