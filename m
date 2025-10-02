Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012032.outbound.protection.outlook.com [40.107.200.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918612F1FE3;
	Thu,  2 Oct 2025 09:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759395700; cv=fail; b=dSrX5SapCwUc44wQFlksTKiA17osSaCmcNRufDvJqMr+eiJZIu694pscE0zd4n9LDtN3jeAeN68s5xF3zmt4r4WtIEWzRTna1+J2KvwcFmQ/DFbt6nD6220B0RvMWsRP+0aYMYi/MbJfKWR0P62DOUPCDHHV/5Et3r6wJ5Emdak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759395700; c=relaxed/simple;
	bh=p94hyp3XfWEyLvSu4XAZ8TnVLJVX2HHbWVc7Dsm+UXw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Qcj+fXzJf5W7dq7ScMRosGDEgrGPDGBU794ehqwsvSd80taw/qFWnkcHHLLkf05OUmoPnY79RdmgdA0q6TUWeymBjgpuqA3TBABXkO4xI600NdHizZ5WJv905uvk+OabGcweiEEIyvf36vDTOAovkKkTqZERf1qO+ukN541J518=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=t2DwO73D; arc=fail smtp.client-ip=40.107.200.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="t2DwO73D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oLk+qgzQoep2FxYsOEruIeuwIzR6rvMBok+gjB9WO6lS3r2ZI2PGhvwilTIXy1sY2Pa7xw56l1qrsSGE09W/kMDwOy3ZMOMbf+HidtIaHWOJMg1F9/QWQdaWDEgxSRncw+I68xP/Z9OUrk4eZKeYUA1TxZ5P1UuS9DM/nVo9jPPt3yjPQVMn1SsKtduGSrJNR1oTJbXchzDQd2Qqt+7hCqPQj/na1qvfe4NT1aqgZBon9na71YDQ7kiUmgUczCFZspYARbAJgF97hR4glA2iPha1E/IMT1iXXTRh4M5xHndjC1SdzIYjsTQ9/wsnZ0z2svDT06EQc+F5NUtO94ZLjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uub1DoONmhJl2Ec+vGUjok6Zxwhpv525+g0UIZfwppQ=;
 b=O3txpCgA52blqFsPeWrE3Lpy+bFQFM7Ak+VBABjewoInDN8DW7hg6QkuVHsxUtljw1LXyalp933LM46srKHXCrp9FlE/yQe171zZTTiiufNEtvOlXwL5KWHzmonHCF18KMnohWU8vWAb1Omh1WWIUmxo/ekxKXlLT1YtFZbq+Zv7k6+TsnWXaNVZm/wrNBNRpZqhxza71ptswFPA0HcxzKPs76q89jYsJlLb6yv75w7u+O2dAE61llN90WBbEI/CytzJ/wCBeC2WtFooc2mZq9lBJeUgiKH42TKIQ6K3xg8r2M6N0QBqlJcO53FHNL3Duk7QUg/HzEvMZkIz4LcoPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uub1DoONmhJl2Ec+vGUjok6Zxwhpv525+g0UIZfwppQ=;
 b=t2DwO73DnIipz4Nq4YPEX0W52SxGEEQc3QqG5BM0Ze5tNfLRU2hJJQqylYhc2uaRC6chEo71EwWLJcMKRmqBM7V+opaGgIiDxdWAxmj33zC8f9y9gMFaEmtT8qvMA2R1Cmakw0SQvsBJ8B66rOOqOsftXZqXb1u8iZvDBRUJlhCkFi8tcms25By7xbBqoksyVNKEeQpOJvpXHwAUrxsHv7pE76T17Oy6XRNcoOAoySLCDijQStgcNScNq5+f+cvVHlsBd+FrANWoyS6XUEAaVRF60aCyQlyEDAXLXiebbnB7XwGU69La1E5smNp2hkZF8NfxHRLBvUPQXzkjn9t+xg==
Received: from CH5P220CA0021.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1ef::19)
 by MW3PR12MB4380.namprd12.prod.outlook.com (2603:10b6:303:5a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Thu, 2 Oct
 2025 09:01:33 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:1ef:cafe::7f) by CH5P220CA0021.outlook.office365.com
 (2603:10b6:610:1ef::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.16 via Frontend Transport; Thu,
 2 Oct 2025 09:01:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Thu, 2 Oct 2025 09:01:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Thu, 2 Oct
 2025 02:01:14 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Oct
 2025 02:01:14 -0700
Received: from build-ketanp-bionic-20250813.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Thu, 2 Oct 2025 02:01:14 -0700
From: Ketan Patil <ketanp@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ketan Patil
	<ketanp@nvidia.com>
Subject: [PATCH v2 0/4] memory: tegra: Add MC error logging support for Tegra264 SoC
Date: Thu, 2 Oct 2025 09:00:50 +0000
Message-ID: <20251002090054.1837481-1-ketanp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|MW3PR12MB4380:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cc18eff-6634-418d-aba5-08de01924825
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HxqYsVlcxJneZKrA1F0VljgHyNhPD1tAis3a5ZL2obWhpFvDA3ddAWO+wJNH?=
 =?us-ascii?Q?yQ0fZM6J+K/+8ZmUku0BpAUdCOB+l5wC8dVVCZ184dwEkClu6PxAMhjjLcVt?=
 =?us-ascii?Q?5k+x/LbE3nmoBn3QrAEf5f38HPCK7GiFJvpJW253RtuPO3z2Pp2+LSHm0Cqi?=
 =?us-ascii?Q?RkrndGhwPSxOJ6ktMtpg4n8t45IXZKYXYEBU5+GTQci5gXGe/86EzuWTeS2P?=
 =?us-ascii?Q?XCfltVvyVTcZH313Knm2um0r+3PMehhcirlnzDRIx4P9gAggMige4a8NVliN?=
 =?us-ascii?Q?+je6w8p8B6dbibqMkNWaHrEqlxGvDjR4swlm5QrefKZUUumybJlaxvYDsqqC?=
 =?us-ascii?Q?xQiJqv4LC0h3jEIT/TZ+gJqHZuIPHwPFF3CJzkiKHgLUh/rBeYmJi2aR2CVn?=
 =?us-ascii?Q?PWmNt5/QL+wd5KURglcr54P5FNoYk9WSxXEYKf+ZsLJtUMHsX2/TM3HGZa3F?=
 =?us-ascii?Q?meKJzxEAtKi35QYz7EuekyWwiGDL08CeIygnR7YMeoT6V78TrBy5DYM0qsAJ?=
 =?us-ascii?Q?mQYlpwVFv8RF+2AQZQzg/tfoxg7+InHTQYFX3O26YEXWmVH9LHmQJh8E0hBZ?=
 =?us-ascii?Q?wDkkrGvBtMTOqEJomXwsek/J3KjgAdkTCGeRihlTMPanCZyTs2HHANydla2C?=
 =?us-ascii?Q?q9lF/oznmAKsBspfP2ekEXU1PqO4EhepW7UWJ/IqXpg6srE+UGV3c29CGS0a?=
 =?us-ascii?Q?UsA0Kd8pbN4oBq+OY5P+dEPZVL0PTlu1Pa4lp5j7CgrRu7C1k+4/aX941zRW?=
 =?us-ascii?Q?cx7VLaNSdHeW0lbygHwqrYs+eFZGe5ZulGBjbULEXqAorAddtdvZGs1/310t?=
 =?us-ascii?Q?/Cx7LhtjJFvX9yeiwRQxmn52AviiBhSRu58hXvqS+xfJYlmaE9QKtAJmX0dL?=
 =?us-ascii?Q?nrYMTPMKpG2LC9p9kU3M5PZyuZLSWnXhdzZSdo+NFGRkc6qpwTertEsnw6ys?=
 =?us-ascii?Q?F8hrDsAcvT4jtvnKXX520WrnTaPnbHyzxWTqy6x8wE7zj8rKcTgqm5n5/wsL?=
 =?us-ascii?Q?HQg66AEZ2u9pIV93RN+rJujxqpQj36vLXqVUDPjwS3sVt68HoWeHYlGmksqY?=
 =?us-ascii?Q?bOrwBihrqYVvnhwV5+UI/BWXyQfH27cZToFbj3lYflBJsu4QAswYTBhoSXKJ?=
 =?us-ascii?Q?iMbePO5JEea1S2YNgOnw0i0v18AJtyuLlG1+o5CW4zMHlcqhiV4z+ip866nT?=
 =?us-ascii?Q?7TfJM6Uji3BD3xePLBROZN77HDwnXDmVojnRoQc1BgT9ELsbM6q7DgD74Z5R?=
 =?us-ascii?Q?M1N7bvVANpZD7RsazisTLV7kRhlidc53MDnRH3VwgXh6+nSmIWVLaQHHdkM9?=
 =?us-ascii?Q?Q1ee9wKMduTqXX3BkjdUO6CIRet0ul6Kx1O1jD4NsMr+GkBEQt5WpcVPQRK5?=
 =?us-ascii?Q?4J5FaW8W7hkym2gYiZJ/sDyg++eKGft+m4+5zTCoQeZdk7HdPlk+UqZn2yBS?=
 =?us-ascii?Q?eHLnaj5fVJWC064yvEif7yKG/KO5sgMncMKguZY9QgrXLvTG6Q7x31Vtu3wZ?=
 =?us-ascii?Q?UrRZkkawpiT6JZNiohfZACHcsgLN77Ba102HwU8NSNx4VmNbFNihJjPONqFQ?=
 =?us-ascii?Q?Iu0VAxn49Gh1IaN6jHQ=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 09:01:31.8890
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cc18eff-6634-418d-aba5-08de01924825
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4380

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

