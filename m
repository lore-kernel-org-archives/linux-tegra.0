Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010057.outbound.protection.outlook.com [52.101.193.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA6B39BFFD;
	Thu, 30 Apr 2026 07:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777533026; cv=fail; b=PSPojX3L8DfQ8AxmP63O8I6yNGbeWXTlJR48qKdnNLR1nn9zs4vj0stcpek2svAWTPDMWP9UIzuiwsRSouzdLKwxRqnzlePwb6FuVYPiF4R/dQ+UOXlybfDKy6oXVhvLPhgOOHJMBDU+gE8C9mcfuBZ8POkzlbUIGEWPYymdLXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777533026; c=relaxed/simple;
	bh=mMPDMBmRESFuk45NARgDDwCvH/9JZMq2srJH1cheFLU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NE8v2Lw7dSfxcyPyLfWJqZRCkkL1TfWo0OrmUrdpQZoyX3GZ4P7pbmL453VtyFkVwzOrl/pFiZj0DGjXDtTgygylJPyhU/fCMoFqnH/LQutAuBgar3qoVB20GqC43McgzmYm9CSg+FipVrbMgtdjYDP/zi3QC0ZhVP6X1zNcLPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=W0a1GmQC; arc=fail smtp.client-ip=52.101.193.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="W0a1GmQC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UtRqe9DiMI8s9TlEABABUxU5CLm9gi/9Ib68ruevpl3gSErZ0iCval7hxmvLHCCPKkLo9l1NAN1ZFvXNqT/1tzvjeSrvkUffEUl+UbuoSqdEg8/MDKZsdJ3rIynkpD6ViCzY4PAReOMNxcRsvUR1i9tC2qvyDtmqARSsLhng5zOgMtPzPl4XSZAJv12sffo2l9IqPoObPJj6b8mMIm1XXQ7DtCa0etWaAwBQva8rLueJESpsKtlcugmFNFhH7iaPMu2KgI+GpoFvUNQpRdgBUXZ4ru9uhZpjR0PagjS7Sdp0tHFsiT5ILCXA2PIyVHrP7WEX/rToxptg18dnjhBJHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJo+JzQbB7JFcU01Eww4yUjkdPsfoK8xp7lUro6b+Lk=;
 b=D/XIKHaT2i7KxuEg1+ylwfnfZTSYmTh04VqdIre4aZW90AFz6RqGrNXl2c2AzPeTju7fCPJogpLOYqg5dzDQN2JyYO0LCBI1ARiWjcNeU07VLh4ERBdxmyApWByL18M9fqDFTUzhS72hHdXMf5kr1SQv9NmDtDJ4eRJlhP/ncP87d/tLIvSx0Mmo7nNNz8zzMbDgD3rjoYxXomn5JKDTdFGXMOP0hgnWkW+Asm/TPusgaDpz6vUqK2rFl7adlwLYqpLjEWI9NNT4y7epuQ03uYVz1YOADzrNk/kd+b8keyrvGdrNrOnkIPvCslm29qgKaFhi0beO5GUB/swKHmnuBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WJo+JzQbB7JFcU01Eww4yUjkdPsfoK8xp7lUro6b+Lk=;
 b=W0a1GmQCAMEBn1t/YFk5l4o6zp3wCq2S3ko8v+5+TupQx7waO1b9QK4vKWKav8OOuGPjUnTn0MrDZG/DCjmoRXME9tTxfXjO6V6DfNdFIKz0txRAQGSKwc7B1YRIHA945x1s8caqWFiF/apAXrVMU1g5MSYV5esYhC/miOA2pfPiW8ob9rx2H6BaCbbXSlYgyywdTaozYfQB6Tnz8/JhTcVti/qnog2j17jNe9kY6ebnQJTtvpp/v+8Lf4dcciW1A7BVRbe7YGDOIR6G+BCRZi9jUcBCHfFfpreWo2lY0Sco3xOqQtJf0RuCMWNsCMlEPVB0iWiebOWvy6t+AjMs9A==
Received: from DS7PR03CA0232.namprd03.prod.outlook.com (2603:10b6:5:3ba::27)
 by DS0PR12MB7536.namprd12.prod.outlook.com (2603:10b6:8:11c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 07:10:13 +0000
Received: from DS2PEPF00003448.namprd04.prod.outlook.com
 (2603:10b6:5:3ba:cafe::26) by DS7PR03CA0232.outlook.office365.com
 (2603:10b6:5:3ba::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 07:10:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF00003448.mail.protection.outlook.com (10.167.17.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 30 Apr 2026 07:10:12 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 00:10:02 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 00:10:01 -0700
Received: from build-amhetre-focal-20250829.internal (10.127.8.12) by
 mail.nvidia.com (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Thu, 30 Apr 2026 00:10:01 -0700
From: Ashish Mhetre <amhetre@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <ketanp@nvidia.com>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, Ashish Mhetre <amhetre@nvidia.com>
Subject: [PATCH V2 0/2] memory: tegra: Restore MC state on system resume
Date: Thu, 30 Apr 2026 07:09:52 +0000
Message-ID: <20260430070954.1005564-1-amhetre@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003448:EE_|DS0PR12MB7536:EE_
X-MS-Office365-Filtering-Correlation-Id: bff27071-6a73-49be-eb44-08dea68785b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	f2UzrCA9i5eRP2uPm19OcXlAq5v5JlR8GyT2amkhEIsmX391W1EkQ2eds4nh5KtYvU/yLnktAZGxy/Nv1xXj8uOePeHUhjg/qelwLgdwiVaoHMIQjzY6q7hyiT4v9l+g7quBDG9JxXaWfTLhewnosAT7D7jYlNsC2rY9WXzJMgJGv5uONCUF9/Y8u0MjIWDK0BSPagbZ6O/knsNUeU5cdtwSesbyL2BSU0lOaaObWx1RnvNfYLlVlKdMPdh3NiFKH+XCxlGLVESkquWdatYwv8p0ggZM25LJ6fF7265OkhYcBMdo0fLr6X77aoZjdvFnYIEuwHPkOd7F3H7o18X4MLzqE1gckuxK37Z5ZXo/b8t46MEXrcVK2qrQDmD6Ro70WSTCwI6xhyELaSXTjNANswrfUIe//cBIFILo4TY5OkukjY7a69bsXz5O49a6oVNcPUlQqckH9T8DVLjQJivmp4UqAw2zGDc+K5oWmtn9g3e4wQGQ90KnPyLrKAuBQ5rE7vskko2AJ2EEKVMYH0vDNGJ8/PrElvjuvLxiGdaZ9TcoVd1KV/ypk8ayXEc0qUJvkDxA5/rUor0ccF+xDXrqlj5YhSM0SzGtuqPAAuWNik6xxiQBWF5kix93N54Tzy7sq1bqvmU/TLC7hbfTqDrEhDe/9YE5sQoXA1iz5metjyDHEEn/hW/PGy5dB9/hyqabb1QyJ1e5TVCWCUapLZgTTaspH8lR9ePvbQ23yUVU12NdVobMl2lPx4BL07ZXi198R42dfWpgnOhbTkjtWGgS6A==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JIjsmealATqo7tCALe5BbCENwYc9UwUA/VH3skRXm4o7iAQTMMwhXVTm26dd8tmdJL2rrqMJ4CWrM964jSxs3o5ggJXOP22FsM8wNLVZLrYPO5VV/ibN72z4q63WGH7unBEroUt4+jjYOLIZCTJsz8opnhY4piYiWN9rCu/wPI9rjsjvOI9+TVGM/001fRAnhCV/9kyKzzECamuUa8k4dyFvYzs8RaiwLhfa1czVPAkPnGKzPEFl1vdnLwaD5BEaztX8aeQpDNzwj6OioCqDDbeGawMvuSVCp6TUquDtHxY4OjBlhrAozOH++pteW4I22Aw+rvZzRDfyw2W8YHkTD97VDsU7FSBksfr5vDnohl3/6iRFSvelKvj3vrmul45fnjuhTEu9HUoCn7A85xUUn3C63TtkvEMV/98ELijcAU48W7TO4AP2oK6X0dQ2p+gm
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 07:10:12.5444
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bff27071-6a73-49be-eb44-08dea68785b0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003448.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7536

The tegra-mc platform driver does not register any dev_pm_ops, so the
SoC-specific ->resume() is never invoked (e.g. tegra186_mc_resume) on
system wake. On Tegra186 and later this means MC client Stream-ID
override registers are not reprogrammed.

Register a dev_pm_ops on the tegra-mc driver and route the system
resume callback into mc->soc->ops->resume() so the existing SID
restore path runs again on wake.

The MC interrupt mask registers also lose state across SC7, so
re-apply them on resume. Factor the existing intmask programming
out of tegra_mc_probe() into tegra_mc_setup_intmask() and reuse it
from both probe and resume to avoid duplicating the loop.

No suspend callback is needed as the resume path reprograms all MC
state from the static SoC tables, so there is nothing to save.

Changes in V2:
- Split the original single patch into two - register the PM ops and
  reprogram the MC interrupt masks on resume.

Ashish Mhetre (2):
  memory: tegra: Wire up system sleep PM ops
  memory: tegra: Restore MC interrupt masks on resume

 drivers/memory/tegra/mc.c | 41 ++++++++++++++++++++++++++++++++-------
 1 file changed, 34 insertions(+), 7 deletions(-)

-- 
2.50.1

