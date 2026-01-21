Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013065.outbound.protection.outlook.com [40.93.201.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D17338F5B;
	Wed, 21 Jan 2026 15:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769009453; cv=fail; b=PHBEUaKjDyg6P7MTxJtMa5JiXXzwOqGSPBh2CVnpY5CKjiQgW4C0W+XVSrFUmfasvXOXXVuTjYLf592E4FWtAfjX3gg13rwfD/Fw5WJOQLwsJ0noG3jOXcATlGKyai/w95vymn6WE5zy1sZAjpsq+7CtYS5A0BsG5L8ZDdSoHvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769009453; c=relaxed/simple;
	bh=NkSaGpoupp9Qzc20fG2GLtsjDHY3Nc2PvxhQilG35Gk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gx0fvapyuCgfsdWSO4Rs270fCLE/1Eg4AMAGnvdiFzWANEcIcUoc/RIb4YtQtdLc6CCz4Ex9N/VRWG5q1IujTX+g1FP2hq3hPpsJGr6EmzsNN9K7jVH4OYDOklc6u+O0Kl3ArDmFTqHQmp3UsT1bctTlQHIiKI8mKdLuDKTiwJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qZ0cJAah; arc=fail smtp.client-ip=40.93.201.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qZ0cJAah"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sx/g6zgJkEfWhGq6PEky6aawyMOknqdWaHA3tjylF/yZH6OIIjwPxwq7tOc4IhKru6ebbfQhYE+Y7Ur9UprURsjWKB6o2qRrRdwiOFmFmn4tgJ4NDvwMY3XmQr1bJwvNyzaxAeUHewNroR6dUUq+7QiAM3QPPEwJlcpWOZ24ZMK+ILmqxayg2gUIzWBRhkkUeMszgL9YvmhU2DeDlfG3/A4anF1BFEXkiSXht8dZQgmV1qrUDQkVNcXsRWS8T35KEWiIlckJVgLjrT2I6hjTH35nI/F/CtbACIBhdAYgtn+7ZIuEVWq7Yzbr4gw52v9MN0/aj8UtTy3svO1/EeTH2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MgNqVLxsPAW4hgq5W+aZBnenZny6k2aQQhliqv6pNhU=;
 b=R13RH6wvs9KZm0zh2NKtnkl4vvAUxo05EZrtNU9DqGqSF61tn8mIMtmyfDTcder/c+Fk5c7LEPk8dICAEsfoUS07dZ6S7562lQv2ufgyk5aPjXOhKc6VsRjuMpOV0ncpmTVwlPCXS+ESquwg4PQJkoEit2niGlasD31XaSYmEK9R9CcnKqMZQCTfw1duZsjMyRG08jsuFprvHmTENvd7jJ1EOMkHBRusCO/w374oltSpdXwMfRz2bAjacdT5clp+QjSgevxhZQfz/UrjFf5fx/xYF3PHC9cLqlVUNaKYVkKvXO0qMIlMRdqllH5P1uBpZso02Z2mKhCsVAOo4dtmJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MgNqVLxsPAW4hgq5W+aZBnenZny6k2aQQhliqv6pNhU=;
 b=qZ0cJAahqzWm72Yw6IALgC17I//9rpAohT0cWxkNtYVbeFYpmFf2dVi/I6+LfNk8Py7j/hYYPXx9pJaVptDLuEUbujZn+y9IliM9nXf0o8uUImUUggAQyq5Ris6uMK6sDcjA/C0nMBPzmKPxD7HGToEI2RE2Lg9vQgYpiS4RznsQTGQAu3mixii4LJ202uL1OhJcqqlFWeoBGMgBdEbo5Tc7FesLMVzaEwKo723s6KlrgDSiQfhgHw/XRGaG6bM1d6FlkKQKCD4uc/KMhqcG5HB/d/o7eeI6FRzch2A6nFbgxHG5WcS2SQV96eLRjDzRBMZX3UueX95BD2HYehQRng==
Received: from BN9PR03CA0056.namprd03.prod.outlook.com (2603:10b6:408:fb::31)
 by DS0PR12MB8069.namprd12.prod.outlook.com (2603:10b6:8:f0::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.9; Wed, 21 Jan 2026 15:30:45 +0000
Received: from BN2PEPF000044A3.namprd02.prod.outlook.com
 (2603:10b6:408:fb:cafe::9d) by BN9PR03CA0056.outlook.office365.com
 (2603:10b6:408:fb::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 15:30:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A3.mail.protection.outlook.com (10.167.243.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 15:30:44 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:30:18 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 07:30:17 -0800
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 07:30:14 -0800
From: Kartik Rajput <kkartik@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <akhilrajeev@nvidia.com>,
	<smangipudi@nvidia.com>, <linux-i2c@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH v9 0/4] Add I2C support for Tegra410
Date: Wed, 21 Jan 2026 21:00:07 +0530
Message-ID: <20260121153012.92243-1-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A3:EE_|DS0PR12MB8069:EE_
X-MS-Office365-Filtering-Correlation-Id: b141f360-40eb-4a3d-1c80-08de59020b7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1Pgt1Uz460i48pkcBvTO7eFMyuzhO85Hkv49Ko3WLKoNdaIoLUBPvYgNRjtq?=
 =?us-ascii?Q?zWygoCJNwFmXVMF0K9OmhU0bhEwHbkP6Rj5an7RkDIPH/QIbdDcBK2x6MrMP?=
 =?us-ascii?Q?REx5Q5xUoBtsdiZhXEiOrJkAyGMfWWnwtKrAt3j4BH8fR0qMjppyaqoTp2kL?=
 =?us-ascii?Q?QBqLYivlXZnWomN3K/qu0pah2VI7diqMPvuWxzmjt/vrGBEPOlQKrgiWlQrv?=
 =?us-ascii?Q?v+bT5eyyXUNw0Dtg6cpKwujQ4LGs0O/oXhSKJe17hUjSIYX38biLLUUH0JjO?=
 =?us-ascii?Q?0JqiwpR/NygE1SeNO9Mfan8DjcuqNYfs4gtFPe6pBRrilbb4nRk2OjQmg3ma?=
 =?us-ascii?Q?Ff4YXnigeBZcjAiak20Hy0+ae4Jvd9agdqu8sAoKS14pyr4FWPtR/3g4Jaui?=
 =?us-ascii?Q?RWtDMAQVSJgHUxB1Nxx+Nzr5OG4MIVSP1nkZcS8oqxVX2jAqgCjSBXAbOJQU?=
 =?us-ascii?Q?lhZVDBbaiEEwf5XJ5NCcjmQ2m8IzZACEjxBYKCDjDDohNutoWaC+Qm6cBv9C?=
 =?us-ascii?Q?zWZ4OCPGmJ2Yo1HqG1XHTMRjJtEuiPwUvtfhLflCr3ErmSF1uwPVcr3vmIEV?=
 =?us-ascii?Q?JfgdpJpN7W20o7zpewcWfZgYM1IPsDsfJfus3Z5UylQB24i7Gmq+OVTmidkH?=
 =?us-ascii?Q?m1fRe3pKU6dqmMLvwTsMPy3lXVt4houShxF8rpMG0W9gW3JuHSlr+4EXtV6U?=
 =?us-ascii?Q?7pM2A17w4uGnPsiWdPZxRXbn8s3SHXP49ns+E0doKnbTMYZOX1TjjJ7IxT5r?=
 =?us-ascii?Q?1qdBa0HsZ8CHhUwOrjTKsTeVihCU1eFar8qgTqsps4y/JkKqg7mL+2qc5XAL?=
 =?us-ascii?Q?APfmQeAm72l7RCGKF13KcJEfEYx1L/G81wO+cL0cXHZsa+m/m+PWFkSy5DsF?=
 =?us-ascii?Q?w4yiNZd0rA8WYWhHxzH9BhGqjunkUkAZSC5PG7FiIIP6HCSW/bZhM25CUSjc?=
 =?us-ascii?Q?t7iG0pU5aYb5dcLnFaffWANuyIuS7DjkucHCJ39Af62SjYtZykFKshbJYguf?=
 =?us-ascii?Q?ttVSaxGM5BMWvgVjAS3fqaeUYVyf23Nesm75FUi35WUrholT9vgW6CYUbY0j?=
 =?us-ascii?Q?u1t1ZR16ANl1BcepUJNAj9gMzEzpZTjtjnhvtpxGkAy6fmi+kr4Nh531xngH?=
 =?us-ascii?Q?CMDucb2ba6sdSDOKyjfftJaAyRMmlnR39+cRqzw7Zai6Lgm1zHvf4z2eVfeS?=
 =?us-ascii?Q?WetbyaDw2mEiXPLbB0QuOQwyC/LAdTezzBWOa/ItXTfx+SXcwlD3JJ437AXw?=
 =?us-ascii?Q?ACeOlkQu1RnW0JP2ShPXkBb8soMmTDuhKZ7nstcRy62x9qbWeAW2v74+KGAV?=
 =?us-ascii?Q?U8hkOyPZJSTsPXhYlCxwE0Je9JcJpmz3TKelabKF+W+Lafs7NnW7IC/B5zwX?=
 =?us-ascii?Q?23R8e0/U/Fi0C1vS/OLFii4Po1SChB69UdArpS1MDqOYPYNPWzAExssuWVOb?=
 =?us-ascii?Q?MV/X5Rxh5ZjyktA/6Z9toOUartQYOJ/gCpmRfYkCfJmkxz7KnFkrT/V4xGX7?=
 =?us-ascii?Q?1G8E6DI62xdfAcRRgSPSCm1oAuv/CfYLJKTfPWGfEor0xcYwOBXNbm9hc7s4?=
 =?us-ascii?Q?tTDVWn0kGuDRStBaIjk6m6Y/aci5E//H15uwcRQLAGtGRW874uSk/1EAfFs1?=
 =?us-ascii?Q?8NA5JlW3yRIgHdOIwks3TRJcvpgGgTyMQ1JJLfuLdjMOKjG6Dz8XobnR5XYN?=
 =?us-ascii?Q?b4CtT31l0YdTGuYPnVQjfRP7fFw=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 15:30:44.8825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b141f360-40eb-4a3d-1c80-08de59020b7b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8069

Add support for the Tegra410 SoC, which has 4 I2C controllers. The
controllers are feature-equivalent to Tegra264; only the register
offsets differ.

Kartik Rajput (4):
  i2c: tegra: Introduce tegra_i2c_variant to identify DVC and VI
  i2c: tegra: Move variant to tegra_i2c_hw_feature
  i2c: tegra: Add logic to support different register offsets
  i2c: tegra: Add support for Tegra410

 drivers/i2c/busses/i2c-tegra.c | 534 ++++++++++++++++++++++++---------
 1 file changed, 395 insertions(+), 139 deletions(-)

-- 
2.43.0

