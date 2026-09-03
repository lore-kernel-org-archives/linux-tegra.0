Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012064.outbound.protection.outlook.com [52.101.48.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE33D395ADD;
	Thu,  3 Sep 2026 18:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788459984; cv=fail; b=ufBL6cAKLtWZtvdTNOpcVnWVy+z+9PnrOTeTi3PWNlfwdK09rZOTig+flazsT10JyQCXh7aqK3BqOCQxIf04OtYzkqHBSNF5s8vh1M4tk1CskXG7AtPyXsCAipjeo76/Kv45i8fvx1vRxyH+SIl4w4jWeLrzk7TUpUC0f12X1lc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788459984; c=relaxed/simple;
	bh=9t4ytXHyXN/rLCl5FtgLnl97pIM0c9fb2NbXMgmYAsM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MZLxW1yV0PBlp0Ckhhs+layMawziAdMTvimLZ2CqkPUyS1cFIOuv8VmXa4ghw4jLcko1/gtjgFrl5j8WTbEZyCHq6M+wmAcKvOVRkCKVrkKcOt0IQENSuzZ9jAgq06ggEWlFlq14xfQhuXqQTQaLK+9x+DkCcMIvraB9jM4Crq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=F4CutJx8; arc=fail smtp.client-ip=52.101.48.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="F4CutJx8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=diVbrMUI/PlusARR9vcOvb/xd/im1O0WoV0t+K/NSBCo7ygaMPu7t+Mh3yoWPpl6W6P5uzZRxjdShmT4gUnWmdDrJvHpiSEEUJIi4pd0ZPp1qQo4ikGxlwsGLn5pCCHsN8vO0UxxfN4xbxPL7IKIkX63ZtmsKnqv9qoK6stDO4DmPtCO49NHEQ/W/M3eT0PQid7Dsq+sQyH62MgWU9L8G0QmQ6bzUbJCQsK/LT9imwwNjUE54xjVltrgqxioATZGVSc7SlVvKngkB+zEpkIoNy5+aGoTWLXRVO9lkPUYMcwZ3RRPaWHK6WRyBkJ63GrjC8/x5vgH3Ycs1dO8DPVupg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jxfUJyEMS2sCozaBt6TtnyLdKH4OsgXw3/9Ve48u7KU=;
 b=oiIjvPhCcnSSExa/taEVw72CQkdDErPNKm49Te+QHZJuQXZ2ayrG8hSrZUdjcuqVjRSu7F2p+O//J3fWViuyREPzTXjYLZoCEgaFefUXy5vX3yWPdmj06LLvdly+hHh8Ni2wK1Zq3roIaOiGkSMQN9M50xopCKzedlo1Ds24znCzqURlXAbZmWxkNjizwI0r0a8Q3hkKoNwqDOAfC7T12B8HGQ29Qo+bzDTxfYfkRHsqqk8wIK89wDz9OTqEOl/iKBd5pGoWLYPu3/zWe0N17OFvm85+6aeEj3zwc5tAucqCKz6NlGoZcaudsDgQ/7c2k0qVcn8EbbebUC9kC3zi2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxfUJyEMS2sCozaBt6TtnyLdKH4OsgXw3/9Ve48u7KU=;
 b=F4CutJx8X6KFOdUuvxh5sBryIK8Y4piFjruZFRPzTdw1Z7aY7wvni5mZFOF2mwcesQUKtUeu27/nDW3C7zNJfaU14ItMNYzG8Vg6ICvhceXuAfLYxwwkL3CsfVU3/JsbSEocW/M982X4xMLZKCTL8OZpdwt02Db3MicbrDsHBAmQ8h/FDAQYrDembO1aWKwFzco4Pq+UjL0bwPTH6wu2wlLhnwA7wiZZTEL3QVMloKxTEHm77ZI+4BFzA1VKY2JzjDD+hpv0UuPC7TXWOjv8LEojg8+xVJbJT/lyJ2X5HuwY06wjAFdJjlDJLG80sWl1Ll50bcV/rFR9qYvxtbhRkA==
Received: from PH8P222CA0006.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:2d7::22)
 by PH0PR12MB5648.namprd12.prod.outlook.com (2603:10b6:510:14b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 18:26:16 +0000
Received: from SA2PEPF00003AE6.namprd02.prod.outlook.com
 (2603:10b6:510:2d7:cafe::a5) by PH8P222CA0006.outlook.office365.com
 (2603:10b6:510:2d7::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Thu, 3
 Sep 2026 18:26:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00003AE6.mail.protection.outlook.com (10.167.248.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 18:26:15 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 3 Sep
 2026 11:25:51 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 3 Sep
 2026 11:25:50 -0700
Received: from build-ketanp-noble-20260630.internal (10.127.8.10) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.46 via
 Frontend Transport; Thu, 3 Sep 2026 11:25:50 -0700
From: Ketan Patil <ketanp@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ketan Patil
	<ketanp@nvidia.com>
Subject: [PATCH 0/3] memory: tegra: Refactor Tegra264 mc-err code
Date: Thu, 3 Sep 2026 18:25:17 +0000
Message-ID: <20260903182520.950555-1-ketanp@nvidia.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE6:EE_|PH0PR12MB5648:EE_
X-MS-Office365-Filtering-Correlation-Id: e820b904-bd55-403c-2f09-08df09e8d76f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|56012099006|10067099003|11063799006|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	f7LWEeiwq8pIUnqovy2ICl/2tlUvmJtYutZvyXDxutAPSv9pMVMLFiWn7lqjjkSzS6yvnZcCYZnHGIqeJ2Mui0spiKr/j5u7avN9Bq4Tu0dA40aJRKxjDF9yvX+nKMBNyBcDmwg+oQLqolULfIUn1q7o4coo4i2TaxiK7cxTtAkYdi8IuALaskKZGrnveBWOlwnZA84Azt6iND4nkC0n445RVX6U9WNYVoT+Ows0huALd/9lA4+H4BRcCl7/AoGjCfb+W2IcyRXlBofky/SYAgD3AmHCiJwDegR7YaqsBCi4Q3NpiVxPia14HYDsmWNdRNz482xHhLbpyAfuBY+/mUuC7tW5xk4gZPVSbT6fE9CcW54E4tsXRD2g0Ss4YCMkcB0HlbHfMfBJR5nZ1B1s9mesxSuTv1VpBuWpHncGghp1WmFM+F/gIXs4KjgHnJENX3OH3sn8isnVvHxowW7GKfSXYRzXWxpTw6AYE/5cdkE6wd4nusEYZ1L9RC9RiKJqPDXiZUFIiIimNsD1IKkp8M9pbieorRGtnBA7EBO1+m3alAFAkqWScupj0JGvwRrJNGrd8dYkMNY5wpUCAYsLDg3jukgzR+vvHekqd8xhkMnGYRbydOzlvmpp4e7piv8+jq2ycaw++x5c58sN8AQoNCnFYL8EbhLryeSTSu/TIUNT1OdkNVB34VXoV3WtuMbmYDWH7N6ycVndjg2jSwLMug==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(56012099006)(10067099003)(11063799006)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xtP8MfxaoZvuoReGV2islIHivE43JSah+g+xhK94Lwdlq+JkCCyjNETMHbyPk54mJ3nZUnj1azH9PV+nvd9gy8wEBKqmYoBku8QAdn9Ga6BJ14P/lE1ckU5sWYhufOj7pVWI4JlPPzG1mWLfczamn4W3DqFY8GN++D/II3ZFiSOtt57O3CAWTHtXvfuvo5zDnV3+So6rjp0KsdySVVJHQJBu7G7v+1k2VoY6kkTmyst/OYwklUvHy7vyFw16d09AkSbvRjWlciKMzw/5aFaUboMAOn8omv9cN9JPVO9Ed3j4TCgDQXyEKh7LwylHrLgsBxGGD71DId6UbGsmbhhvVl5voW0JiGan+G/2mjM8uk8a/JilXCNIbaPJO1TJQXPXdQpeAh8kTnIZqrVkUFVG3WqEKDSDEjHqi5ROea8ihkXTqtSqOhr/FJ+yi3iXrMdE
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 18:26:15.9975
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e820b904-bd55-403c-2f09-08df09e8d76f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AE6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5648

The MC and HUB error-logging paths on Tegra264 used large switch
statements that interleaved register offsets, bit positions and
decoding parameters for each error type, which made them hard to read
and review. This patchset refactors these paths without intending any
functional change to error decoding behavior.

Ketan Patil (3):
  memory: tegra: Use named defines for Tegra264 MC apertures
  memory: tegra: Parameterise Tegra264 MCF slice bound
  memory: tegra: Refactor Tegra264 mc-err code

 drivers/memory/tegra/tegra264.c | 376 ++++++++++++++++++++------------
 1 file changed, 237 insertions(+), 139 deletions(-)

-- 
2.43.0

