Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012063.outbound.protection.outlook.com [40.107.209.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC632798E6;
	Tue, 16 Sep 2025 05:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757999929; cv=fail; b=ZHFwXFQLYsEAsIy14RUPiuzjPAB2KJclrfuyKQ8zjvOdQWDRyVMCwsfaIgZaaz78FAE8DQOGmpSCmmZ9trL6JiBewIF+7CVpIDHxP+ZNvDf0cH6bPpnSVCQBnju8ctx39PUFbI4rcEnp14m4H+e4JjYjbpe3QEqUnn2Ni95gb48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757999929; c=relaxed/simple;
	bh=NWRlUevw3iQctoplKd9OzYJIwzPZdluTEVDH9HJWpB4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DlHBLoNHZlh7egu55GYXs2bW8JWbO7VRnxAaHcoLTPWL+R3AUDTX07Mjz5apDln5NRTX+PMOFIHtNTA5/unzfm1zFa5HvlKHkFX8mYMB3LGVjd3O3R2ZIfTUqiG6SEPDjZNlgwCW83VTR8CMNRAQ9VK9piKY/57+rYZGox/G26k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DhHfK02f; arc=fail smtp.client-ip=40.107.209.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DhHfK02f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uVdSeD+QVfcUkvP8Y8jgFP32b38uC9LGzOghHg0hRod+iziFk45KgMgKT6cY3tLaVBruydUTqjJFD7gBm5NyOMGfbh8uyaDbjAhzMgCJ0iFiNqXDTYV1BpEZljP7kdn+ehWXzumPVc3/iF0nKWAnZj+D7937GvS4dXLAd7lbucvwYdwLgeSGn79Xch3fMra+3ioXWLA0cxlnPblrVSbI97aqLveGRgaqgi+1h57CtQcR4Q07nu5W+eMzggekk8yc18bfDKApZjmFhQuqI7srrjyqO+4AkaSTf+aijdgkxxPxzvIhTyhhEKFEam2w95N5vQaWxRIuhL28uRhFbElqfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h90F1j7yvmCAdHwWPSMIfRbcpeZ+wB9i3Hoi0CLt0GY=;
 b=t01Ua2HfXECPmu1htoBvTjy6F8nQLrItufuKz4du5fUrhCizrInr/YBWIl7gwHsbss61xcC1d/KX4/1K4snuTfeS6CkRlqsOb/rj7tbST0hJcgnPL0BRBB4vICfBHkZF0UB35NP3ZHwL4kVbwgu5EP4cICD+N9bkWAgtUHHwfqk64dojTlID+xRmVEskJ6W7xdzZOqzv7VEtMCkwdW1fD+PvDoHskcpEUVJQOyTWUWFx8Lm75oXIMV2ERe4erU6T3hrTurxeDmg0NRkABbGc0424GHCj5JUcbuQYm9AsV6+YLjBV5G0bSKKQW1ADg9Rdyb9lcfBfn9TCDqOlZQJHHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h90F1j7yvmCAdHwWPSMIfRbcpeZ+wB9i3Hoi0CLt0GY=;
 b=DhHfK02fP+5Mm5/L2JnOGJsxAmR9dnEAyGqidYzqZzohV6Ti0BWCZRSgZTzNFoXhp+3OkuBqPT7ZI7p9+HFCpdJw1+ggPZlpf92HHjXwQSebv9jfA0ttLwBCOYgwLJwzFi7NzcrZsb06Vom+Kv9OuN7xDO5dIe9CNgsghCUttw/B7D4TUbuZhci4CzoiyPTbrZ0OJQR5b/GKLAA2qyiffCzdYpuxIN8GfvdMhK0U+dW6yXb+w1haF6AvYbB1f9/zIslX04AhdnvJ6L32PGucm+AEFtBP+hBWq5TAjbIyl/MzHyPvLA1tHlWJdNLhEPY+0KX6ZZVUdooDvP5SoU84VA==
Received: from MN0PR04CA0011.namprd04.prod.outlook.com (2603:10b6:208:52d::7)
 by MW5PR12MB5684.namprd12.prod.outlook.com (2603:10b6:303:1a1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 05:18:43 +0000
Received: from BN1PEPF00005FFD.namprd05.prod.outlook.com
 (2603:10b6:208:52d:cafe::10) by MN0PR04CA0011.outlook.office365.com
 (2603:10b6:208:52d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.21 via Frontend Transport; Tue,
 16 Sep 2025 05:18:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN1PEPF00005FFD.mail.protection.outlook.com (10.167.243.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 16 Sep 2025 05:18:42 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 15 Sep
 2025 22:18:27 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 15 Sep 2025 22:18:27 -0700
Received: from build-ketanp-bionic-20250813.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.14
 via Frontend Transport; Mon, 15 Sep 2025 22:18:27 -0700
From: Ketan Patil <ketanp@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ketan Patil
	<ketanp@nvidia.com>
Subject: [PATCH 0/4] memory: tegra: Add MC error logging support for Tegra264 SoC
Date: Tue, 16 Sep 2025 05:17:50 +0000
Message-ID: <20250916051754.39250-1-ketanp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFD:EE_|MW5PR12MB5684:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f1ed090-46c7-4b92-ff23-08ddf4e080ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?E0+Km2wAFeL4AgLmFAHVIoa4IP1oPkQ3dnNzTRPrzBfY8QvI9Q95UdSGka1f?=
 =?us-ascii?Q?0TXyYtyZGrdhPs4I89XPGxCf9dnFjUM1XzOfbWDMnFOCK2u9KYnBfWUGGZ3p?=
 =?us-ascii?Q?JRyoKQ+o5+6Hnhwuu8tjUs0GEc+AmLgtiu0I6mMPjDhStuwk2F5mdb13Vx+4?=
 =?us-ascii?Q?OAMi+xwFRsRjbMO+BVaohKEjd9dZ4ePRvKc7kwBHnJhP2gEkR991u5Y5IHN9?=
 =?us-ascii?Q?6RRAYmi/0Rl/smsu1NVnbT8anH3ZcpzKMxP/zpyuNWxheMKIq4kF3ctHNbqq?=
 =?us-ascii?Q?zXXRDiYoB+lCojvJxIZbPdToJBCXEDcABNEczwNu1xdLne6pyMXOgQ9KpCxV?=
 =?us-ascii?Q?93tXzzoPnTwNxlatZGNTLmc4pYOzv74x+53SpxeqtI0WI1UjkHDeIJKbvsYf?=
 =?us-ascii?Q?SR82fMktl1MiFyL3uSMCzkaMck76PM6BzSrGQnIuql0dwno4q8fQB5ntV+E/?=
 =?us-ascii?Q?yWsHcNHFHtsoxfSI/MoI4hwOY5fUJD/9uqH8NjL7KsuyrUwUbIUNmLXJ8nEt?=
 =?us-ascii?Q?g/l5mlwDfXXHsOjjdyz19a+GKgAkj+BNaueXhBL3H2iaS/dv3u3YUQlnnCSl?=
 =?us-ascii?Q?3Lvv7dGSDiPHGGO039sXKgSnSsgXrYgA8aPubaVuzKFX8YgpRymdZtUylJtv?=
 =?us-ascii?Q?WwVud8cBiCEqTwXbW25C718SDXEh+k5VRQp4WSIQrOtYmmJreVQLqh6tt6fu?=
 =?us-ascii?Q?PY7hab41vu+mlu78Fsu3UgLfXiOhg6/fTke7qhTkh6CfgNvV8vtan4QDYJYY?=
 =?us-ascii?Q?eb7dbMYOB9M3IXPFVt5Mmlws4MibXiKyIrfO1/zWiKCHyH2GP37sNhB0LZdz?=
 =?us-ascii?Q?VKZHmRnIwwyIihcXwS+NqkW6D0jBUi/2ceeXSAXylaD2lJxJhi1H2W2ENcCC?=
 =?us-ascii?Q?X5EQ4uTrLiwZlQow1HQPLToYZ/bwHHnbDYyWh862zculqs4/SPoOezY0xJjL?=
 =?us-ascii?Q?niJSWBHdyK9hdKKKK7p/gXc++k5zYOOGW+1DDMAZXo2hWkugF6f4oUriBtjl?=
 =?us-ascii?Q?+GBJgRR2t25ayEQtop4BdZbc7SIt/hASDYallXuGQbWJ3sItm6UJDm4ApzU5?=
 =?us-ascii?Q?MrvtN35RwmYDzcXs/7f5bWv6hbMa/SM/SgHiBCVXTKswxA41C/10iSegpkSM?=
 =?us-ascii?Q?jIOdAmzP7rkNMWwvOFNzJgVVQYOKHY5MRcwKkk/jVyt5PYwinp69YTwok/Yo?=
 =?us-ascii?Q?onASOkx1ARg2ZI8C6hXIuzL/GQjwrkmwOXYDNEndcTV0aPcvWWU0ecdBFAmj?=
 =?us-ascii?Q?YkwSbgAhcFhxLYbzggglMc3N2Ie0W3PdotmocoExFXvETNQpNT06knZjZ1qm?=
 =?us-ascii?Q?/SBCDZMnWdyB6sT9oCPuIfIUVGzYU9lIQJA7p8Z5UA4zu6snzfvnRaITfnf5?=
 =?us-ascii?Q?EciurMi5+iUk43GtUv1W4fnBE0fhuKcBC+emQiUyx7m8u2lR0UEZ1fnENWhw?=
 =?us-ascii?Q?P7WgSV3yD2dgquxqfmYR37JXj+hdV+CJ2BggqWNzhyxmMEQ2kNuR9uzaBV3F?=
 =?us-ascii?Q?pExVwf7jntJPYIVLBdJmZdubVYsDnPVOPISW?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 05:18:42.4256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f1ed090-46c7-4b92-ff23-08ddf4e080ba
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5684

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

 drivers/memory/tegra/mc.c       | 125 +++++++---
 drivers/memory/tegra/mc.h       | 144 +++++++----
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
 12 files changed, 666 insertions(+), 101 deletions(-)

-- 
2.17.1

