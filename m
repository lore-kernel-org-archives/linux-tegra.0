Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010054.outbound.protection.outlook.com [52.101.85.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA1828E0F;
	Tue, 23 Sep 2025 00:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758586852; cv=fail; b=hvj8uYC5pu2M4wMRkrSnI9x0A2NyeTM9ObIaH1LyUIqqZ8+XdlFmsA7Wvebcb/wLOZoinDwidadg6nCzKVSJQ2dEwqmpf8UOo7CPPZtGa0+Ac+2XwEVctUa69kpyab/fsKbbdn7s46kKsYV6C4MS24GVy/FfKDuMhf2TAUbdaac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758586852; c=relaxed/simple;
	bh=/krUCmwPHlbS/rU3Ck5ZVJDVhuRyc6EL84hb/uhHHAA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OlCyt0vuLjaMlZqVKFAcnEurhm2mXxuJwoiZx11hVdFlKNLZA9ibUy5BEMOuX4V/ruMzChTtfaAIbV0eSvhHHbvX7Cqx7yemPVGotOP2mzktWhcR/GGtUioJ4bmNvvcyeZdpiCTz8B3p/beNseXzZt44CCzCuFWt3x+X3fjhMPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LJg9xUh/; arc=fail smtp.client-ip=52.101.85.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LJg9xUh/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ezIM5SPZV8X1bvwyuCLucpucGKDPke1TNeFHqAfovphvsG7TAHLE8qViYz1J82wiEIJKQnhkShPmynCKWoUeCloxzSDGHdyiC8lIsPz+q85cUX/YMMAHIJ81Thzu8OLc+PXA98erEDgf0PVEN/JOA5ZX0ch1vAR40IAl9cLB6xh8XKyDAmvvW7jio+aU3/ZYA4uhTN78N85DVCiXq4siMygTnH8kar70M2y1dwDh46itqd0Ko3wbkdyDq8NOga+rKRBk7PrgQGqE27dIx103wWWE39KXYEY5yisvNRUUKkqsfoOeCj9+RiQxsrvviByrI7+xNklf9p2f51zRfz2qpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ArWe2Cdpb1B9QJDnPPtkWbLn2dmLXjGSTFyr8TwXlwU=;
 b=vT5nU7LKELXkwwBqpOMg2ra9Vf78L5p1LqFGzlR6ZMJ87wJTnsqboG6Tvl9DDoe8ZdgnNchF2TiahUHUTGJJDRIBozq7/FvkxcZKXq7b9Ohls+wkZ1Z11Zhu09v+pSToUGu+Ll3bZHj7t9M6BFtFuC1TTZuoiYtsIqJNXk7AV1M3vFxcwcwZPPG2LwBcesiutlxfIjNBMH2uZ9bVXi0OvOpTLXow2kzDrRvf0cucz6siEgJNUOqxYrTIWzMSxkzSrNG5T+keJZWqxwBhMaep2FA3p3+lZXcdwJVy+FZCy3x47FnOstP+1dXrVTt8rN12J/EX1xh7bJ0YE/O7037qww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ArWe2Cdpb1B9QJDnPPtkWbLn2dmLXjGSTFyr8TwXlwU=;
 b=LJg9xUh/oBXfyLCw1l27kYX9aVuLe9ZYckv+ohJ+AhQjOYJGLbz7sV2CFNAfUn7FcQZDqKn8A9bH0MOaiJkhXL1CUFYYIHfzuhXT+tG4xZDQJ9ZrIWBHwU5R3Mbc756F+sbf5HqKQDFZaX7PtPErg5oRfU8rY+TbrYm80V3/+9vQgdx5G54uOPdD9vjZ8QIevd3WwsunMC+a+8C9voSjw+lFYsN7m34MAgtYg+PQ00tIp1KRVdqAfhPZMMy4IAl7T0oMXCEIdErI57KoKEilNRSWbo+VCJdw4yNcpyvuEpSfgm0ixv9V5WwDobMxiXCV1h55wOT2EfG24znAbpAqIw==
Received: from DS7PR03CA0241.namprd03.prod.outlook.com (2603:10b6:5:3b3::6) by
 LV2PR12MB6013.namprd12.prod.outlook.com (2603:10b6:408:171::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 00:20:46 +0000
Received: from DS1PEPF00017091.namprd03.prod.outlook.com
 (2603:10b6:5:3b3:cafe::24) by DS7PR03CA0241.outlook.office365.com
 (2603:10b6:5:3b3::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.20 via Frontend Transport; Tue,
 23 Sep 2025 00:20:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF00017091.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 23 Sep 2025 00:20:46 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Mon, 22 Sep
 2025 17:20:32 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 22 Sep
 2025 17:20:31 -0700
Received: from build-bwicaksono-focal-20250829.internal (10.127.8.12) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Mon, 22 Sep 2025 17:20:31 -0700
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <ilkka@os.amperecomputing.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <suzuki.poulose@arm.com>,
	<mark.rutland@arm.com>, <treding@nvidia.com>, <jonathanh@nvidia.com>,
	<vsethi@nvidia.com>, <rwiley@nvidia.com>, <sdonthineni@nvidia.com>, "Besar
 Wicaksono" <bwicaksono@nvidia.com>
Subject: [PATCH v2 0/5] perf/arm_cspmu: Preparatory patches for NVIDIA T410 PMU
Date: Tue, 23 Sep 2025 00:18:35 +0000
Message-ID: <20250923001840.1586078-1-bwicaksono@nvidia.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017091:EE_|LV2PR12MB6013:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b9cfac0-6e30-4583-42bf-08ddfa370a81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1UZD+KMBCnXEoCA+yb43Q9fi33pAsHmaeFlW/k/0WjJ4KSMVcONIXhhhTQ98?=
 =?us-ascii?Q?gpF+PNdXzJinpSfvPnNu93Cv18nSgIRrrHJvSiBi61i2A9nxmanZfFbJybZx?=
 =?us-ascii?Q?q8ruef650Ew3/s6+vEv4bfuZQKwuQMJwXUIeDN0accKEwMlgex7ERbmHIN3d?=
 =?us-ascii?Q?KAxjQOakdxpx8zgcqQ1I+i0/tyDPBhnNBnpM1n2CEIkSSFcEtS3TrOajWmZE?=
 =?us-ascii?Q?AQ579D2i83qr2B1b+Ay/nN2P/QYm833Zz5w23ZN1jS/2neOYABjrirHnJu5q?=
 =?us-ascii?Q?Mni5WqdAzYE3vsbVtPW1gyOuf+2RwIWhjrVi4pzNWrR7ntzhMp/YTfFsPtXq?=
 =?us-ascii?Q?B8Sl2Pye7UEPgTV00jsh06Qr+ZCPUq0/K9PlxzyvshSfVW/nTYcvS2i2vtwI?=
 =?us-ascii?Q?cWIw82YXOVEZmc3/h+z5S7fV/PH3l5I2mU79gtRD3pS/ByVVSD9FTNoTFWmF?=
 =?us-ascii?Q?H0HZB1vVMrwkyY5htcr7FD0Gc3o2CEj0T84I+BZgF5Vb3OPZLAkKqwFRDECM?=
 =?us-ascii?Q?bhnHdAVWd+Th2D19BCK4OvvL5uNhSTtyo2xceQW2vSidQxtjKMiSiWaMn4Ar?=
 =?us-ascii?Q?tJcwbVpDdHoRPuEq7cJN3hojYncfbjSRSaJV2KnzipTvSFE3YDkzlE0qmnYv?=
 =?us-ascii?Q?Sa65EAskRJ93/u+zotg09sBrIPQlro1EdqFKynj+fvCe5gGWLfNJmeGxlL/m?=
 =?us-ascii?Q?yZIJNFr8m3XgdE6xD9fo4OGDfixb2cnc9m3gMplD4CaKHL14JJAYyX/jy/7Y?=
 =?us-ascii?Q?o9ScroQexrM3gfEScFvi3zrsysO1KvJ4Pz3+N5xk5W3H6ue14YsfIzYPFsgZ?=
 =?us-ascii?Q?SZqqZkh5iO3sNmGApNDoeTrxyn5/fRQPexoisnNzeCGx+ahRuqjO3iH/mAKi?=
 =?us-ascii?Q?6lywkEeTTturvqKPJduQsBsyCY8cHvUQidh+dfM/Qo+P5jhALFr2NCl4uo3m?=
 =?us-ascii?Q?mcp5dQnTFihZj3o6JwCfHmzcCsh0hglqyWp3AnOxMWhA00/ot0Puguwbl7iO?=
 =?us-ascii?Q?x8V6Y3P7DTnIwylg55g4HHt9YB4QA880UAAGNdOHGyeMHikP0cMRpsUtN1p1?=
 =?us-ascii?Q?O1job4X3MUuyEeiik/ZP9kmCNSeRHqAu+NCsmuGwGqL6O4YLKYsSRuu9r34y?=
 =?us-ascii?Q?OfiN/x5e2nSN/a9Vc5ySz4DjybTAfoMJsrW0Cv1X7dJpr814kfynbvNT9GaU?=
 =?us-ascii?Q?iTXHUwL7ArTSAI9IsJeJHje0EJRt3TH3uBTT8ZnQHQ3VHkKwC8YWTr+YYn3u?=
 =?us-ascii?Q?N+NqQ9lV22YTSKpf2hGQDuF5c8B1WDXfZHoWpZVhN8QL21T7sI7ScSIeF6Sp?=
 =?us-ascii?Q?nGd+CgdTojlD39tx1blvj26QsIqOpGnxe2f4ZHLPx+wHM4M/M7CT/8WufFKk?=
 =?us-ascii?Q?jvxGeVK0tT6PM3Ftkci+SJwH9NrOLV6/Zc3Lggb/nIykBjvBTRpmmcBLMaUI?=
 =?us-ascii?Q?e9RfAkfFsfmnzvuoy7qKoE0nJj8l8bUw4B5SppzRFqnoEEgsal8dxu03WkpB?=
 =?us-ascii?Q?Yix/O+P2bEpjd8+WO0bZ1E0BZu4jMB9rePxDZ1StWW6rJ3BzWfmvDteaSw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 00:20:46.1517
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b9cfac0-6e30-4583-42bf-08ddfa370a81
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB6013

This series contains initial patches before adding support for upcoming
NVIDIA T410 PMUs.

Thanks,
Besar

Changes from v1:
 * Add Reviewed-by from Ilkka for patch #3 and #4
 * Drop change to [1/5] on making arm_cspmu_apmt_node public
   * Replace it with new API arm_cspmu_acpi_dev_get
Thanks to Ilkka and Robin for the review comments.
v1: https://lore.kernel.org/all/20250812233411.1694012-1-bwicaksono@nvidia.com/T/#t


Besar Wicaksono (5):
  perf/arm_cspmu: Add arm_cspmu_acpi_dev_get
  perf/arm_cspmu: Add callback to reset filter config
  perf/arm_cspmu: Add pmpidr support
  perf/arm_cspmu: nvidia: Add revision id matching
  perf/arm_cspmu: nvidia: Add pmevfiltr2 support

 drivers/perf/arm_cspmu/arm_cspmu.c    |  70 +++++++++-
 drivers/perf/arm_cspmu/arm_cspmu.h    |  48 ++++++-
 drivers/perf/arm_cspmu/nvidia_cspmu.c | 194 +++++++++++++++++++-------
 3 files changed, 253 insertions(+), 59 deletions(-)

-- 
2.50.1

