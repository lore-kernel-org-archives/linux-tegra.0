Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2081.outbound.protection.outlook.com [40.107.101.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBED1A3172;
	Mon,  7 Apr 2025 10:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744021435; cv=fail; b=F8U4Hj+/GHc0xJzmxVEgrkZqW7gVVgmxC25gPv6BJqd6EDYRj4rpLDk7jVXjrMy8Gce3IHs+WQ3pB+54aOeOGNWVoaAomfHl7V4ZIDFstkFFBwfQgFLvFBL62uRr48a1DC5832KyD6UVsFyoBT0UG1IA1fMprijv6p9vUIDMH98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744021435; c=relaxed/simple;
	bh=A5FSntyy2ycBfN+97RQYnfEpETljXpOkzNegHKef2Zo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WeDVU+ctU+Jo7xPqP9gFYlhMFoIUzkcjMX3wk4pbkKqdDq7iSsREbBgLAGkLJdYrZS4lk35PKX4HoqmxaESIjHvCYnOkjIHMS87Jla9FgjxVkA7wvQMjQFrMRm1FxR17SviOlWa0+oQhWi66CDpD9WemdXIgl2zpMHZrgpd494k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gCw2SI5U; arc=fail smtp.client-ip=40.107.101.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gCw2SI5U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bi3FnxlyVdbqFmL4rPTruLHcsXVa5KxWcsMIU61A8Gnhr9wIPcGTA+xb9yygWq8piwxzymMZ3aiOKZHAoRAMXceEj83p3EVDRabSaxgXkxK/cuLhlB1LQZu+3WR6doKjR7GIeSoC4VEC1xBc4Lju7pEFzOrkcQWtsmxXRRCPwyxphxmYay0NZCw7dyIwli5GcvlM8FQ+U2bvGU9cRoHkh9tloy8/fj3GIMmsldp1ZorcF6vhV/xhkUwpjHvY6kU42Kcv/QBLjadEstjGtqJ0NUK2uB+kfm3dFcrSnqRdTgnYhKaLflPZv1oz7ZxPvIh9e3dth7Wi6kGrJS1+3NoSfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1DHsVckVTvwPZeWJoRfq3TQ/BEl7/yl79LOmdUujHIg=;
 b=qSQFYEeUKp+Qbs2xMH6+/M5JXjucxeYlMI5HYZo6Q+neg2Kw6f1DGiDDUWAekOH0crpSEJBX0qjr9V0hF5z6HCEfVHOJvovZB7w1wBzhPMGYyz2wUgBKD90fzp3dO+3g6anrlG4lVGVVDsFjopjVrDSF3PeWL8tVugoJJGClZXHC9/babdq8/9dPaEvUYGFSkUxCrfqo459riTNxuHvFwqnoBVL9fxEymlIKqap9DgGwXoxXFcgYu1Nf/ymCRSaDb7BQv0HAfTCzP50eZ6LsmbXqCKGkhl15TcRQuMO0Wo5GjOR4VFrIXgW1fcEJPTZJ/UD8U5ZMQX4uA+LjWI2JDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1DHsVckVTvwPZeWJoRfq3TQ/BEl7/yl79LOmdUujHIg=;
 b=gCw2SI5UhIliU6W+vJXT1Gk+DSJjCaI9oUPazPgalqYpP8KXmRPAUxj3f74iAhTzZRIrqk/QnZ11V1diSel1RAyDB44RgSaWplJo2rjxXhZJIcRf+3Pt80j78AIbN6pXabgg48giUiHAih8U4WXgu3spUTJK4gckEFDE3SgqG5MCP0WC9T/UvS0xk+5bWHR6mO962cQCOVzs7yrEW/LzBtWiCJM3JeEfmk4dXpqJHJf4o97wvag93YkqEVsl6d2tVv8vdqjy0BKzEq58Ij7XrOa6HVudlwG2EtoI2vDNuAJ9iBAA0SpnwWDV87bq20KEDCtR9FluFAsPAxiPbx1+Xw==
Received: from CH2PR19CA0004.namprd19.prod.outlook.com (2603:10b6:610:4d::14)
 by DS7PR12MB5766.namprd12.prod.outlook.com (2603:10b6:8:75::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 7 Apr
 2025 10:23:50 +0000
Received: from CH1PEPF0000AD77.namprd04.prod.outlook.com
 (2603:10b6:610:4d:cafe::24) by CH2PR19CA0004.outlook.office365.com
 (2603:10b6:610:4d::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.34 via Frontend Transport; Mon,
 7 Apr 2025 10:23:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD77.mail.protection.outlook.com (10.167.244.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.22 via Frontend Transport; Mon, 7 Apr 2025 10:23:49 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 7 Apr 2025
 03:23:38 -0700
Received: from robelin-Precision-3660.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 7 Apr 2025 03:23:36 -0700
From: Robert Lin <robelin@nvidia.com>
To: <thierry.reding@gmail.com>, <daniel.lezcano@linaro.org>,
	<jonathanh@nvidia.com>, <tglx@linutronix.de>, <pohsuns@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<sumitg@nvidia.com>, robelin <robelin@nvidia.com>
Subject: [PATCH v3 0/3] clocksource: fix Tegra234 SoC Watchdog Timer.
Date: Mon, 7 Apr 2025 18:23:20 +0800
Message-ID: <20250407102323.2690911-1-robelin@nvidia.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD77:EE_|DS7PR12MB5766:EE_
X-MS-Office365-Filtering-Correlation-Id: b3d5530e-1e98-4faa-c521-08dd75be49dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1n1umrqr5uMrTAzEjyiJ0UvJqAjXhEpWNlQPbt0hQTAQQBLbBDZbisrTRv/t?=
 =?us-ascii?Q?JC72l/OMHqvG3yGdJXSkmmxeaI0CiOOCA7su4Lkb/6aDwcmX5nMROK5Jkej8?=
 =?us-ascii?Q?wwAWOrDkahkctDEkAKQ446p/CLG4d4DtlFERMWaA0bZ3AzJrPXK0BA3gSB8B?=
 =?us-ascii?Q?BACny5V6sSa+OsJXyIjK01ij0gS4AMBO3zL5cWeUh6gTpSlKo8w041TFwghA?=
 =?us-ascii?Q?u8kAND4Xq/YvJBB6XtmaxVLAsHAn6F4/3Wx5EJtqTDWa7tNYJV9gVU3afAsS?=
 =?us-ascii?Q?rwluJvLnutG/WExETG5eN+CnWYzrcEDKETPrqFF8YGxAjCEJb8msEe/ZLoE/?=
 =?us-ascii?Q?jZNhH8iqiO3M6qp83SqS0sXPfCVNDMu9dmX8c1KS/B1DVR7hmueVHKH3TIRC?=
 =?us-ascii?Q?9UW9LskCX8ZsrltWfxvkXLcJNXMosmWRXKkzt19CHZ4gPnNYgIzgXlxk49mh?=
 =?us-ascii?Q?6hQoRRng1/B/pNsp/n9+OhzaNEJXOF+cQaWef5MZDUJnpNqS/XKXA7q4TL3O?=
 =?us-ascii?Q?ZynYhGoB4HVOIXQHXsDfC0nLGp0S8bBvk2Wlm3+Z4GT21ByFbba+lJI/QIN+?=
 =?us-ascii?Q?5r3OiN8X4vXxvsNYpaWV0haSk0FbyVuR574nurOaqF6eSl/ZgsZ/8z7Y0lT9?=
 =?us-ascii?Q?RgO4qPFv6df8t6KovQ/2UHHbRWd19/HywC7w+BI5IYikpSuhr03NGbOuu6mp?=
 =?us-ascii?Q?MgNd8xvSZJODnj9hs3UqtHdJkWF5Pg/g7tf8AgI0OHFN6oAGDtdbdh/DvHfU?=
 =?us-ascii?Q?Rgpo1LiVMt6fYLkHJJ8lZCSxIW8nqw8uchCZLm4m6LEGWV2OeQsKLWgPovWg?=
 =?us-ascii?Q?Jxi9PCy/yf4TRwukCm1U/+w2ESDv8uKp1hrldnPi2JksJCDkQuc93yneOzWo?=
 =?us-ascii?Q?jxYLzQmiwGeeJfYtjF3+0LdXbocsUywmliuc3MQ+yHrwPqi1Sjv3gBJTbAuM?=
 =?us-ascii?Q?XnerB0jHfPGglNZsmHaRBYjdAu7D/hpmO/RUovSajuc1AhJfbgSjjOtoWFqP?=
 =?us-ascii?Q?0XH8NB8Y0049oD/6Uz93u3GNHcqnq8ZGzCYSwyFD/JR724Poa1DZZ1DZJIkS?=
 =?us-ascii?Q?u/uGYdUOSnaZ5X73z0hG/47vBtyhhPz90Xe4eciQMh2H4ri/sGvYOYYvRmP3?=
 =?us-ascii?Q?apG4co9GHMM0Ao25+7NYTQ/pbfHBxNmRoG+y+fBv9XI9umATNvXZL+dgZkTC?=
 =?us-ascii?Q?GWqeWlYNNv/qd4yRpN4KrVrtKrTQ4eB/cwuItmIDsD70DqmxCJ9/RSIfpqHz?=
 =?us-ascii?Q?qB/TVxZXQlxHTsk5R6LBXuUrJb9yIKlM88Wtj9fTk0rC1L7ORMUk4dxpsL11?=
 =?us-ascii?Q?86qmoQsMceFQKIgzzsf1BwcQ/imRR0dy0k3DXAIp0bGykwg9pbp+zQkZZnGs?=
 =?us-ascii?Q?5DmGnzR6L+1tCNuTttszl27Js0EjqP+YqUT4aZGYPK2PVoNFOcPrQOllhNJY?=
 =?us-ascii?Q?DPa52huBeTCpQcs1ef2Z5afzcn+ga+qJppUYMSksP0fxz+cL471GkJsIaJT9?=
 =?us-ascii?Q?vnHyB0uVGJnfYEM=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 10:23:49.8422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3d5530e-1e98-4faa-c521-08dd75be49dd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD77.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5766

From: robelin <robelin@nvidia.com>

This set of patches includes a fix for watchdog for it may not bark
due to self-pinging and adds WDIOC_GETTIMELEFT support.

--
V3:
- Improve comment description
- Refactor to fit codeline within 80 columns
- Remove unused if(0) blocks


V2:
- Fix a compilation error, a warning and updates copyright
--

Pohsun Su (2):
  clocksource/drivers/timer-tegra186: add WDIOC_GETTIMELEFT support
  clocksource/drivers/timer-tegra186: fix watchdog self-pinging

robelin (1):
  clocksource/drivers/timer-tegra186: Remove unused bits

 drivers/clocksource/timer-tegra186.c | 86 +++++++++++++++++-----------
 1 file changed, 52 insertions(+), 34 deletions(-)

-- 
2.34.1

