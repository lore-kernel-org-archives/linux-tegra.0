Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0224A218EB8;
	Thu, 17 Apr 2025 09:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744882141; cv=fail; b=et7ZO3zRvnAMhTLyOsITYoydz99JldY+OvuJMAJMuwIB0KvGDRoUm4RlD/6GaKS48GJHNc6DnaiFLqf+B5BnQoUPX69HI1eJide5yNaHx4RdJ5t84oU/a4YC8HFqJCQaYDN2+LiPylErNMOlQnqRow/sBF4Y6QBaHLsvrUW6Bbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744882141; c=relaxed/simple;
	bh=8wODaiLMYPBK6J65EJWHa/0sK9fxUXBZItHBLW+DLV8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PyV3qyc3qz4HVPNfAJBc9Hnfb5ey8YBCDGrOMiC9hpwMcQpDnimpeHVwX4isin/ZNGvBokxsXXVOIEb/cB+DQ+xxEGO9b3DH69O5xtgvaAH2sE0gnqeTtFN5pd3tcE6/y3XJjjl51dXO3raCLfJpwWSYahPbIDHd3iT/odOkn1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Y/9/aW0X; arc=fail smtp.client-ip=40.107.220.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y/9/aW0X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gfaap5G6zHNwnibjHc9cxxCE/AYyYlh00tr+1B5DD4kI9xooSssIbqlprpx787KVb+jYHIxLKl/jnk6tadA9u/7jaWZf7GpT4dptqQ296TB1vDxx6f4NlUvPaAITxoLAd1flHsRGOwrJNvPeuNOVxSA/8PmYijQGAOyt+bZBSp6OQIy13ST1k+eDRBzw6E9l3j/R+PjvzOqrsEh82zle0Z9/WqkQPaHD1bqlYl4DUl2I7laQb1XRir9JCWIhr/WmC8cBLvFLZRvibqSNNRqkNj4n2S74hBaQq3UDrRGNfsDK6Qk/hiDP+pvlnFal+mCKZVBPK0Vsc0P7Sh31GUhAcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZsKDdRv+yPN5oywjRmMj9hbVlV6R0jvxAKmUgubQwGw=;
 b=Snb2irnFEckkfJuuWZ/Hzc4EwjxKnZ9g5KVAMP7nu4Xzs9qVlm8XAO43VLuNg71B0hcewY/wialIpWitz9qiEcZFXpzixL5sDYvnZxz0ywTwXGwMiJV96fhcYkqIjYiqa6XRXLB1AH+1SSWMBckjfNAZDOwJNveUhBylhI1l/sXQNj23t7Q5c6GacgQMGoouGJ/XaVN1HdaJSM7hB3qfDbGjlvFesnOJN6NFqJULpibhG9bI0hj/4NKM6NaDIeMCrBVHUbTkuhkPi8sPZWGGDTQaodNzRsOH1wSTx7VyqDyrlULC3qp1va5yx/ANnurqBCVB0J3jGEtEUQb+CsDCbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZsKDdRv+yPN5oywjRmMj9hbVlV6R0jvxAKmUgubQwGw=;
 b=Y/9/aW0Xgqa28HxBgynnazHRecGVXCweAiu1T0sCJvWN7giUMT6dy1cCLU1ydviyqsdVmNJN0SRQXNT8JDqLftiLw3gV9JZUNigjlSRpCO89u5YY0URadpCIo3NnvRqnPf+KAMthJ0MDNl9Tk3kH6LfkxCq4eI7J7Yn3ZumxyrmkE/TtFfDJDBRUut10N/el+/KrfImDHYfrbkPB4yu7D5qBXAyXwx2NCsFoGFXJBA1jf+4ERkvI+4hfMZmpdqJfwWxZ9qdNoAyfQrd99XG/4+cTvqdWur6G9glN97SFzllOjJLvryVGpy1hr0UNGHgaGMyqcpef0IHLFbRYUobazg==
Received: from DS7PR03CA0188.namprd03.prod.outlook.com (2603:10b6:5:3b6::13)
 by SA0PR12MB7003.namprd12.prod.outlook.com (2603:10b6:806:2c0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Thu, 17 Apr
 2025 09:28:55 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:5:3b6:cafe::68) by DS7PR03CA0188.outlook.office365.com
 (2603:10b6:5:3b6::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.15 via Frontend Transport; Thu,
 17 Apr 2025 09:28:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.4 via Frontend Transport; Thu, 17 Apr 2025 09:28:55 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 17 Apr
 2025 02:28:44 -0700
Received: from robelin-Precision-3660.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 02:28:42 -0700
From: Robert Lin <robelin@nvidia.com>
To: <thierry.reding@gmail.com>, <daniel.lezcano@linaro.org>,
	<jonathanh@nvidia.com>, <tglx@linutronix.de>, <pohsuns@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<sumitg@nvidia.com>, robelin <robelin@nvidia.com>
Subject: [PATCH 3/3] clocksource/drivers/timer-tegra186: Remove unused bits
Date: Thu, 17 Apr 2025 17:28:13 +0800
Message-ID: <20250417092817.2751534-3-robelin@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417092817.2751534-1-robelin@nvidia.com>
References: <20250417092817.2751534-1-robelin@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|SA0PR12MB7003:EE_
X-MS-Office365-Filtering-Correlation-Id: 933a3549-aef9-4858-e8db-08dd7d924634
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VjKm7RHyBh57J6+A4vIh+EVJAejajz/tLMoQ05HFGkMeiQf6UGv9o/drdY4o?=
 =?us-ascii?Q?e/D+O5nlGZlc++L4XmEZqVukEYx7V5v/yPOJ3J6vN2TbVcHqMnZKZEla4H8W?=
 =?us-ascii?Q?fO3sBExKK9Mk2J8TuL70C5iDSj/CkJOzHuRUA5C18bGgBtQHgRm+LAF3BtNA?=
 =?us-ascii?Q?ac0tGTi8COcRc+66XBs0URZpE5NeD20HMNUGZbXrmF12ulW0ZscSyowna6pb?=
 =?us-ascii?Q?HqJTNR5dP+LTPS1rGE3CfHwefHfnOuwIY5WF75cLgHGlAkitL+TmvYLBGvLN?=
 =?us-ascii?Q?8+0NJR6YR5Ix3R+jp6TFpsqZC/kfuIPHLQVEC0hbvo/n0o/79F66T9Z47uup?=
 =?us-ascii?Q?kTusnLZmbAwVFshKH6CCpdG7HLpvO9blm/uErJ/vdWZiJEfiNstCEFzEOH0Q?=
 =?us-ascii?Q?BN+WsBgV6rzs8VDKEDMfhbqeivhivz34VQre1VoiDkCgtWDm0lbxATC/8o5S?=
 =?us-ascii?Q?umlkP6EKINWM8QuZldWEKhHH55p2gWrUvLyGm8sjlutbbsPL4zSEx8ZVn91o?=
 =?us-ascii?Q?l4lVE4j4CLeE+EK4dw0L3j/v1WcxktmPDEB385cr74FIFtFvV7IxLqjht8Ua?=
 =?us-ascii?Q?uZK/0GLPS9JzPvdlJHjX7+LcJnl2rW5MEAD6G1usXNs/EDcTDw5kJ3nJYDHO?=
 =?us-ascii?Q?LAgMB4M5JffkV1Y+EHja81AqadIzFowur/m2BEJxj+ttVCmwvrZjQGXZWAiE?=
 =?us-ascii?Q?udKCP7UKbEeUfWbov2YFZQSvQ7P8R6uESyeqe+D5wIxZqqCUSLz6xgZ96RXf?=
 =?us-ascii?Q?PQcEFQZy67rtDueDVdrVtpsF2gwazALWbfmI04wrbIernHRGqHOGx1/PwRQu?=
 =?us-ascii?Q?NYzfXeb/znz1+tUq22U18cDKlveVkQqhrPuar8USZpkdvmLDtdJGK6qjAFlV?=
 =?us-ascii?Q?2YmWFdxwnaKWNMBtPUnJvCUxnpYvmlVo1yCQ1UnlOLa50JComgFz158KRMMd?=
 =?us-ascii?Q?9sZpeXtyYUdQTpkGdDdFaIZ0j+IawZ2rcJZxdR17YuiODwjZuokB9b4YhdWU?=
 =?us-ascii?Q?4RM9PK+Mc+bInrZHfUBbOpg3pB7IKfl7IprmFN0dgbLDJVnZ/+SBHklQXbNr?=
 =?us-ascii?Q?Y73HOW6xJ4ZepLi8S+dqtZSHZa+2pBkhZ+aP47v4p01DEmqjevzpKEznUBOb?=
 =?us-ascii?Q?20jPSVuFMPrP84JoI0bl+il1HNtKqY+wRuS2olHy9qagw3ZCTGznMbacsf2K?=
 =?us-ascii?Q?EWEp4FOnEXlqYi67hfac9RuulnxaYqyMPnNX+pj3nVqZsPaYmv6Tyll36yR+?=
 =?us-ascii?Q?GbDH4wSv1UaF3wz2bPxUGN4UEM1djDTCIFaPguMqtvvaWm9p5Ih1rT4dSNM0?=
 =?us-ascii?Q?F6p9zyHUACfC+5UiaOxGcF8zPJruxdrpcOYPZWX5pjb/pGJXRc/ynRNNe6EK?=
 =?us-ascii?Q?4ri2q9N7iSkkGUCrVmt1q6zH4kdG1YpkBQWAslQzU/3bBB/ZU6a8b1S4Okah?=
 =?us-ascii?Q?idwP/CMMl6PR/ZHSfTPtxc1i79ZHbU7j6OU937/RZzdY0WXHfRze0VHMpjlw?=
 =?us-ascii?Q?O/B8R1H8mjQCv6BG/IP0yzLuMdo3oZIU9uZi?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 09:28:55.1452
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 933a3549-aef9-4858-e8db-08dd7d924634
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7003

From: robelin <robelin@nvidia.com>

The intention to keep the unsed if(0) block is gone now. Remove
them for clean codes.

Signed-off-by: robelin <robelin@nvidia.com>
---
 drivers/clocksource/timer-tegra186.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
index 708d9f8682ea..a52b11b05934 100644
--- a/drivers/clocksource/timer-tegra186.c
+++ b/drivers/clocksource/timer-tegra186.c
@@ -175,15 +175,6 @@ static void tegra186_wdt_enable(struct tegra186_wdt *wdt)
 		value &= ~WDTCR_PERIOD_MASK;
 		value |= WDTCR_PERIOD(1);
 
-		/* enable local FIQ and remote interrupt for debug dump */
-		if (0)
-			value |= WDTCR_REMOTE_INT_ENABLE |
-				 WDTCR_LOCAL_FIQ_ENABLE;
-
-		/* enable system debug reset (doesn't properly reboot) */
-		if (0)
-			value |= WDTCR_SYSTEM_DEBUG_RESET_ENABLE;
-
 		/* enable system POR reset */
 		value |= WDTCR_SYSTEM_POR_RESET_ENABLE;
 
-- 
2.34.1

