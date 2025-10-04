Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013063.outbound.protection.outlook.com [40.107.201.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFF91411DE;
	Sat,  4 Oct 2025 19:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759605105; cv=fail; b=DqcfnV8nic+dImOb5V77Yz+8yFeCZg0Vv33PmzyS5fVFU2suzxv44sjqNzueIQbPvcYz9AuMMlZoZAC2ZENZ3rB9MKF7M2EtZPhT+n6j995+jHhlS2CiY7v6rAqV8jE6NhmkqHnBEik2FGe0agO0B1mQJxQmeS7V+qGOD4sRX5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759605105; c=relaxed/simple;
	bh=Y72Y/No/r4xm+ComyKARcU36em/46xb4uCiOmT0f9T4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WyvMHwZR6YRmXPZNKxFBrcy7d65mIjEWB3Rm4H1vXdaiuv3PENCMaug6XvmBqJd4ELdH2VIWwog7sYshQ8W8FiRCrtRV8nzDXbxJ+9QEjK/o+qnwh0wtgdnMXDNZP3oeYpBfVpjJeA/SwASxGq5cSWye3uayU3tzyFt/4+Lz9jc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aKpDzyVf; arc=fail smtp.client-ip=40.107.201.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aKpDzyVf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8c1H/svH85UEMf2iNfOL11oWZmp+p4o67TGsJcX8Q2EuXzEnmu9/6tCoXbRGlUNNpp6FGTV2KLkrkK2EtD2pKlBLj8Kz4KBejb0JIQ9kpeElCp3bGnV3mi4hSgjspDeiUtpVrmhxcO1yKkHznbXMlutcoZg5EeEA/fJ8hZWGmi5GV9XNzr2bhsyAQ8bvL7yU3l5fR8lzpqHTObOpn9BBJCiLEonyIlZ0v8h/a4765fo/4bsZ09wddNCU7mhjrkc/MLhK+muY5vuIC0ug6zEKht8qEvNYuRVjyzBetVyOcVh0fSTfVCLxM9IvEStwtukYtfh5wjICHI5q9UwTB9H7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qI3txMichN1mosqIdKfQkjurEMr4Qd1x0GkHvIfI+gA=;
 b=P8bH9eD7cLd1m70HeAsEbUkFtjIDYxQjjGxvwCBTDTwi17JG4SQ3ZlDRqo5JkUS5vIOYggW53fKpUoypbovr3vAtE8z87s+9kR+mPhXr9juiAp9dZCRMyKaT/75hgDIvlQs64Zxo4n3EFXN4ztcVRvzk1dg7mZVO2ToyAJjNAqY5Ad9FVFQXhV7TCo2xNp87OiORyjWjCs4jKorcsyLrGF2atmVQ6mmwWzP1o+B1JbEk9tmBaon3sEFQEHX0bABx20eYG5T+VFm2EPHZzEbYLZ+K34gvCb8IgTL6kagVT7RS1qYE8DeNJnSy77JIVaAGMwXO/qYgqtL8DWCp6JLoWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qI3txMichN1mosqIdKfQkjurEMr4Qd1x0GkHvIfI+gA=;
 b=aKpDzyVfPEdMSUnvwMfU2d31puXR1uHkv1ToThZwaCxB813U6Mdm6FS0LkRX1/IGU6yJ1J4OEA35Ab+QmU2LizALI5ZwseK5LLyQVn96bx+UbsZBBNK9F4qHk6WjkRh0l/faMJxyHJCvDvupHLlqGMf8EhtVHYy6CzYCCi0Wu3ZzIpZmai2+ld9te868czizH6W4twHuaEP+K1zEJvUcImgxZ+0SjtCzrY1zZo74Qa0aAk4WWm533NBb3M7sqw2mAEQeEjvs2PA0VAUa+CSDMnlYfZKoTt0AIZ0y9QNJc9TnR4LnnUsNfVPgWNmyK2YPsAirAYT8LGojFGUmg+p/GQ==
Received: from BN9PR03CA0953.namprd03.prod.outlook.com (2603:10b6:408:108::28)
 by IA1PR12MB8312.namprd12.prod.outlook.com (2603:10b6:208:3fc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.19; Sat, 4 Oct
 2025 19:11:36 +0000
Received: from BL6PEPF0001AB4F.namprd04.prod.outlook.com
 (2603:10b6:408:108:cafe::d3) by BN9PR03CA0953.outlook.office365.com
 (2603:10b6:408:108::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.17 via Frontend Transport; Sat,
 4 Oct 2025 19:11:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL6PEPF0001AB4F.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Sat, 4 Oct 2025 19:11:36 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Sat, 4 Oct
 2025 12:11:32 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Sat, 4 Oct 2025 12:11:31 -0700
Received: from build-ketanp-bionic-20250813.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Sat, 4 Oct 2025 12:11:31 -0700
From: Ketan Patil <ketanp@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ketan Patil
	<ketanp@nvidia.com>
Subject: [PATCH v3 0/4] memory: tegra: Add MC error logging support for Tegra264 SoC
Date: Sat, 4 Oct 2025 19:11:19 +0000
Message-ID: <20251004191123.2145307-1-ketanp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4F:EE_|IA1PR12MB8312:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b5df9af-0b73-4be6-2661-08de0379d6cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?E0Q3meLej/i/MaFsjvuP4Tgl4d7BR9zMGL1YN8oeAmqdpXXhny+tgTlASilV?=
 =?us-ascii?Q?i7g0WfCi7kMU88r7Mh5ggX47ZwOEZ8KoTqG/9QVLGO4V8I6f+vly1Zksgziq?=
 =?us-ascii?Q?y7sYdzkzYWzDBqx4y5cSSNnDVAA41AyIREjKWk0pCWGTnoXnaorNKV7cjl6f?=
 =?us-ascii?Q?8XG84c/UlCMAPOA9HhoWR0/oLrhcDsyUT+3e2vCJNEUJwtzEeTBzBQoGBrVO?=
 =?us-ascii?Q?tbBLdYwj4KaK8DgJP8JMq8MyU9bVznfoWh0IXi+4UOrAHtBiXRJdjbHH+FRF?=
 =?us-ascii?Q?9jSTcr62BmOAB59DiXGui5rfCFL/ZTUMNHA/x36sTS2v4yN9hBT/HRA3cplf?=
 =?us-ascii?Q?8qdv341yfQyRjX8u94scIJff9ypU4KytbGEcxN3UKwNmRt1VnNN8E95ji7Hu?=
 =?us-ascii?Q?EbRfPjPKAmA055zGAh3tTWgpfBoszhzKfAgSaSDGPwAdnMwXlkTPjzeRb2ja?=
 =?us-ascii?Q?u8/jOIRRlu4wqgBKHNJSHO9rleCvEGByUMjeSfEjjyOxEojz4IQGiBX7UteR?=
 =?us-ascii?Q?q8ySkEcH/YtIjTRGgTVB5XQgCvDqF5ejkK0HRxA87Qh9H9USSWvweoh5QcF3?=
 =?us-ascii?Q?1PrHfa69UOzRRsvXXipTKEcdC+zLmVNn3IFWOO6y8uZt+e9nPfNAiijRO9le?=
 =?us-ascii?Q?POCMpYVp53SzYlUsomNn67befFKsXrTIaTYXzKl1/Hw9bfoOIIr+PF/0tO2Q?=
 =?us-ascii?Q?AdZ1w0bxsVUD4WReTazJ7E5s7HVCkyBzxoJisOCtpYvWqpm+pHKMR+VGoC3s?=
 =?us-ascii?Q?LQNkAzeiQ6P/qVPNLIpLmO/VcTtA5R76s26CJeTBHTHNKUavT/3msc4JQh/n?=
 =?us-ascii?Q?lyP8nrSyMgFcUXj/5KzoM9SJgoJyJLWfLXbD4m6U+FMItRt/EStfMqAoVNq1?=
 =?us-ascii?Q?dP5FfFCOHkspeiO+gqeFPfAdkbn3yklmthnqOfzZOJR1/0BAXCe4zqwOVGjR?=
 =?us-ascii?Q?8s41dr/lKiGluQlO/y9pxeqPZ1LXorN8ALjhsMhnqiQYWWztE7VWIYjPnWyt?=
 =?us-ascii?Q?OXS4bgj0ndSe7TPfieZ7N2DVibQ2g/msNg44ULwv/QE7ydmQeVtYwRmYe9GB?=
 =?us-ascii?Q?mgPFDmR7vZDzS35fQCM8GiCm3cFAIAFVvI89d5XGKOdem4pch3LsA5+ZWjaz?=
 =?us-ascii?Q?ZW41dmk/b2i+Vih6nnGwQ/GFXprpWusYsw7f06JlLvzAa8Bx4edEWTWAE66e?=
 =?us-ascii?Q?m361OZRp++Ud1mviUdct8+CZoit2XU7rp2Lovo+ynnyZ+IprME6OXSp/PgCq?=
 =?us-ascii?Q?DHrTcIKjtvrs7sVJ5hOkx+oWc9GkM5OPsC3KmZJ3uD4QCERipsw98JXZhgI3?=
 =?us-ascii?Q?saIfRkcbd22c+DhJ74V9SMM64pEqAUcInf7wog5Zj+zYTsd9TR/3Gb6bxNnL?=
 =?us-ascii?Q?GNjveKmyhFIFE+SQaWXfciI9soImHeLeuHWxg3bZsN1sBd0K6xgIPLnITaMZ?=
 =?us-ascii?Q?EjnU4sf/Uc0+wOKKopxnncsUIJzDch3ssQF/1scAcH+jO0nzMYPZZECJcLrr?=
 =?us-ascii?Q?s/8o4HUwgQM1qfqxGeeva2+/eaYIibGWS/XtUaBOWLcIgapiKPRg6dB9owop?=
 =?us-ascii?Q?IuATNxHsVMFNXSAm/58=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2025 19:11:36.0464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b5df9af-0b73-4be6-2661-08de0379d6cb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8312

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
Changes in v3:
- Fixed compilation error with W=1 build

Changes in v2:
- Fixed warning due to use of uninitialized variable by returning back
from the function
- Removed unnecessary extern declaration of tegra264_mc_ops
- Updated tegra20_mc_irq_handlers, tegra264_mc_irq_handlers and
tegra264_mc_ops to static

 drivers/memory/tegra/mc.c       | 125 +++++++---
 drivers/memory/tegra/mc.h       | 140 +++++++----
 drivers/memory/tegra/tegra114.c |   3 +-
 drivers/memory/tegra/tegra124.c |   4 +-
 drivers/memory/tegra/tegra186.c |  14 +-
 drivers/memory/tegra/tegra194.c |   5 +-
 drivers/memory/tegra/tegra20.c  |  20 +-
 drivers/memory/tegra/tegra210.c |   3 +-
 drivers/memory/tegra/tegra234.c |   5 +-
 drivers/memory/tegra/tegra264.c | 407 +++++++++++++++++++++++++++++++-
 drivers/memory/tegra/tegra30.c  |   5 +-
 include/soc/tegra/mc.h          |  32 ++-
 12 files changed, 662 insertions(+), 101 deletions(-)

-- 
2.17.1

