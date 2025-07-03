Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D229F293C52;
	Thu,  3 Jul 2025 10:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751539139; cv=fail; b=CWDdI0l2y0S0pNojMgmDR3sRbNVLzuno0C+lCA/g7n7zeIdV8vKmut5BWpIMAV69zPIB71hSVWB+pBHV+8avoJvZOQ1p0PJRBH8MfiizKEhHMfnuzN5MbmLhERBczG9q8vd/3RIDLfh1I8ZeAoIebrSQGVUNhiVegKu5J4emU5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751539139; c=relaxed/simple;
	bh=4fDaNbGW9N5aDuDDRfuhvODskWe3XjVwpCJQTb8p1k4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ovQ8BIhH8HmZrR5h1t21SmFcXBI0ZnwLm9q0LuhoJKyNiAuYSTEYAlNWvPHwKNko6Y4ugQQiRKDL2Wvz8HXBTyery9Xyx+By5yPYhTVSwrHHNgeIJfPClhZvGgvEEhNxcgYt6gh0DW+agVdS1wY8TFXByZc9Rjf6AB2LZyWfEu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=r2PZF69X; arc=fail smtp.client-ip=40.107.94.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="r2PZF69X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pB33YgDdIEx7QrWz9BL5a87broYB8THt7sMSaAdWE5aadHDRzmPWwBwGEeWFa/c+36MaTqKhOtFcnYnj//ZOM1viOyrdQXKWU6k3t8+xLjKX05PucB/W2vT/bSrAHdfkU+sb3usLEtMAoXwtMy8pCdMHLrq6jXrRElhmWIhXnmMb2UepH8/7lDNl6mwBIdRQ81VW8pr9HSzEJcSuOS8PJS/QvUM/WFMS+3fzUH8bn96pTiseUN0Mo1xYfw9U8oLRJTc5X4LMj1jV3lyBdAtAT9Jt+OZi5pcOaQ5xrUyiJwSmBrVUmxv6H2+XkVUgJdtZMPWkbrIUNOqjupE4toJB6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=So850jWhEnPCOPDO8yoQ0O6xWkBxXhVUb9yqnM5etls=;
 b=t4CwjlxBIxEt4zY7RptpawzWIpIKzJ9br+0u09o+vE8Ee4CGQJTZ1Rg1BV71pVYIwOt8yjjLzqQ0TIORPPXCcfZUhgE4HCXTplf4opzcFB40+gZPxqSkMgfHe5RD9KjW6dvqWlLjIweGuk8JHLnf5ismK3+rOadNq6WPAEUBx4rZeZ1e3D0kB6wfnxsKFBPeyZdbrZk60/tlkujGU2uAIenD0zr8zSjM0KRQFxwQUdsLhtZRz9T2rkC/0Hv1BDOl9g3onbU55Y5+xLeH9v/KOEFQ2jC7LLsPfXAgK+FkV+VYkDG3pPCk8Jn6uUUZsWMcp3dOKZNmAPjSFyGgWVcx7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=So850jWhEnPCOPDO8yoQ0O6xWkBxXhVUb9yqnM5etls=;
 b=r2PZF69X+5Kxl4vpVVs9KNFibyELPeST+fa/UdaN04eKoHRtRfHhwpacoxshckb4YI5q41LY00Urm1rYxn+E6Yi/Hu7+WW+X8N5wOsEP6nt/pZNJC6UCETupeN5pM7uslVarwDi2OSqh5rTTbuezytfoUTBwIf7tjr3g5MhKjyg/UhK9FK//6VbUokqYLbHHFM0Mv1ng9wTe/I6yPHCHH7zur2WGKjlXQG+FI+Z87y6ciM5/N3SdVqaY2myChVV+PM8UL+371N2ViafaoUIH+MM2uZ44DzERJWVJ8Hgzx0n+zyvBi0XjoMNiwniRiTGkj0jj9Kv35dg5iYIeigrBgw==
Received: from CH0PR04CA0119.namprd04.prod.outlook.com (2603:10b6:610:75::34)
 by SN7PR12MB8435.namprd12.prod.outlook.com (2603:10b6:806:2e2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.34; Thu, 3 Jul
 2025 10:38:55 +0000
Received: from CH2PEPF00000141.namprd02.prod.outlook.com
 (2603:10b6:610:75:cafe::2c) by CH0PR04CA0119.outlook.office365.com
 (2603:10b6:610:75::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Thu,
 3 Jul 2025 10:38:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000141.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Thu, 3 Jul 2025 10:38:55 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 3 Jul 2025
 03:38:45 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 3 Jul
 2025 03:38:45 -0700
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Thu, 3 Jul 2025 03:38:42 -0700
From: Sumit Gupta <sumitg@nvidia.com>
To: <treding@nvidia.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <tbergstrom@nvidia.com>, <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [PATCH v2 1/8] soc: tegra: cbb: clear err force register with err status
Date: Thu, 3 Jul 2025 16:08:22 +0530
Message-ID: <20250703103829.1721024-2-sumitg@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250703103829.1721024-1-sumitg@nvidia.com>
References: <20250703103829.1721024-1-sumitg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000141:EE_|SN7PR12MB8435:EE_
X-MS-Office365-Filtering-Correlation-Id: f200d268-18d2-4979-dd30-08ddba1dcfb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VLeqkLV7MCZe0f8WLThdBXenzGYKJ8A1glQGE6WYwwU/S+1VThrKP9BbWQv5?=
 =?us-ascii?Q?fME/1khZaL31y0/1W7JfWjUo5PzX1XrJWToj1lvTRdz9qD+XLjhbl+9MBiVD?=
 =?us-ascii?Q?0yMLkiayyu+/hqlx3a6/mBTaoGtwKN/M/WY5YpUOkC/NCtD9z2YS6nNgP2v3?=
 =?us-ascii?Q?ymDfOb4rmCWmXx144meXrqzOIBrPZbIr9FqL63jjGRLCp37aaJof3NHDtkv1?=
 =?us-ascii?Q?pfOSemvKbv7JQU/Bz7qiGeZ74PUfdgnonnQx1X3Cs7If+iJCbX88tgNB92vH?=
 =?us-ascii?Q?97oiNy4qjq2NeaICinia3PW/dsIBApQDAvgyW9nlvLD6yPHh6O845R77B2GC?=
 =?us-ascii?Q?4kWa5tFJBF1WSM16ukwfNbyycS32dS06IOG7MiFXHERI6ZZwitJGjoobiY4W?=
 =?us-ascii?Q?ENiITj45ZW+wW6jWNk9XFFcoZsim2tPvGWenHbvfjvXucU7/fTWZ0f5RDyRX?=
 =?us-ascii?Q?ud81+7fcGN9Er9t3QDvFDakRCzjOr7YgtE/GUR2TqJNdi0ng2d2g0L6vI7U5?=
 =?us-ascii?Q?j72tVHu4JWYd+N09u88S9IOJ3+epRViYHa7xDlO5uH21j4+Bwa6aOaw38AEd?=
 =?us-ascii?Q?A1tbxceAynTSNvJQtxhr3GGlVzD33/DcnEDDSbTm5Qq5v1NQEhpbNeKb3YHq?=
 =?us-ascii?Q?F/ycQaBynAwNilLtSCa3/gT7yjF39D+HebVLT82hB6ZAxujmKgOqIwro9gAn?=
 =?us-ascii?Q?RjRZ4vw/GszCQE5c1B8DWvXOoGpvAhK6ynEKKDT0/PGpnhfKp+zgbDInKiCq?=
 =?us-ascii?Q?XmhmE9yT1c5TRUv3yYo/P0kP98ZLa7aCyczHqTanabkwRMmhz7AQriGFDBLq?=
 =?us-ascii?Q?Q0ZgvMvN66y8EW3j76kZjCR0GRnjzHdd49hXuRbjhX9tZJm8xZkoFia9IeVx?=
 =?us-ascii?Q?0G/qOcXHtk2zhglXQnimuxcNWLAz7aTzc5EP2McW66inydy29o+xtRrOU3gV?=
 =?us-ascii?Q?OaMOhFFYOLoKEVcMkl2BIT7MeOgrQdzG7BnCdmCpVuRThRWWZBp0BLbAMPIQ?=
 =?us-ascii?Q?nI5wiFstazsc+ci7fi6krZDgmsMl5I8WZxhUPM/TTFTE/we/ddqtcelbw6R4?=
 =?us-ascii?Q?HjWmBRgFvywQc2LKtdFZTQcXVKWJArwcjr6irkhRy2BzBj2CWOgHW2V6UL4+?=
 =?us-ascii?Q?nHPXLw3Ql6LPuBYFFvnZZBKcMZMtr2UfWDDfyyOTaw8s2kEbH8L9y+wh+2gf?=
 =?us-ascii?Q?2Lv/eguJET7c9DjOO6AwRdVbUznqrMFMKXiz17LndCe9V+BOTS5UC/i4sNpK?=
 =?us-ascii?Q?r/lMdyH9z+OSKIU8DQWpt+xIUULwqbQW11UsvrzU5aIuaCUQduSSW4tFaPn8?=
 =?us-ascii?Q?USjZThTSqjc+0Xqoljj65xEvB4R3fC5pTC5RYy88hMq9AscLkmnURtWxeaID?=
 =?us-ascii?Q?b9tuge9axf/Ub4eJUJxsTBx/slyiA2hVzc4Uwhns+hoU7w5whbEtlY6grmb4?=
 =?us-ascii?Q?ZU39T51SNGkQTLETC2rPtNaYwrpGeE6KLm/LfANAKM4KQqjwQep4HL6hExpA?=
 =?us-ascii?Q?k/1kCIQHpJNNJlCgWkbyn9w0qLgJ+qAUItYC?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 10:38:55.6305
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f200d268-18d2-4979-dd30-08ddba1dcfb1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000141.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8435

When error is injected with the ERR_FORCE register, then this
register is not auto cleared on clearing the ERR_STATUS register.
This causes repeated interrupts on error injection. To fix, set
the ERR_FORCE to zero along with clearing the ERR_STATUS register
after handling error.

Fixes: fc2f151d2314 ("soc/tegra: cbb: Add driver for Tegra234 CBB 2.0")
Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
---
 drivers/soc/tegra/cbb/tegra234-cbb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/tegra/cbb/tegra234-cbb.c b/drivers/soc/tegra/cbb/tegra234-cbb.c
index c74629af9bb5d..1da31ead2b5eb 100644
--- a/drivers/soc/tegra/cbb/tegra234-cbb.c
+++ b/drivers/soc/tegra/cbb/tegra234-cbb.c
@@ -185,6 +185,8 @@ static void tegra234_cbb_error_clear(struct tegra_cbb *cbb)
 {
 	struct tegra234_cbb *priv = to_tegra234_cbb(cbb);
 
+	writel(0, priv->mon + FABRIC_MN_MASTER_ERR_FORCE_0);
+
 	writel(0x3f, priv->mon + FABRIC_MN_MASTER_ERR_STATUS_0);
 	dsb(sy);
 }
-- 
2.34.1

