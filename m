Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2082.outbound.protection.outlook.com [40.107.237.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC8D22A4D2;
	Thu, 17 Apr 2025 09:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744882147; cv=fail; b=To4zm+eLVMZR3Q30AdVjS67ghoqIzhtlx57iq0nnuZj6Vjm2E9MWvn2GYHR/FMyzAg1KjIx/kkziOW7ryvSkZ7xhF8VaBnjdlPEZOuI/g30jdOOVmMkNk1QcHo8hRvvYdl0gnlunVyzHGRy81qTCJG99LMOM41vlKzoRAI0/1RI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744882147; c=relaxed/simple;
	bh=Hg5mX1Mfc8pUKJseHs/DelTWz1M9/Cb8KNc4fH2cWrE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B/WDgck0maTzVFQEWXNlujY1OmHFM6ATH07GMpOuPC58aex/QZukpr5AHok6OEAkRZZEoMIBEvuiqvL73wiDRRDL5G0udGNR9+56yqudiLhNaD6BVcjBagipubiQi0+CRPZ8uvjrVkrPaEQemPrQ/NBoj74CxoTPUwnDJHhfzBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=StFnXSNP; arc=fail smtp.client-ip=40.107.237.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="StFnXSNP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g/AzQAbJL3dDBVaELDR0v3oY6miJKERNEHt6oTpaRfZrAK0tkQGz6F2yBR3O5IKhAlVZA7tE3RNEn7DsN9KTtnktELNOTCO79IO7LS4//1nc+qLM2jGOJDgH5ZpJZYL090ObepRnLOYpMkI+DNcJewUztJY2WdtrqYm/AVSUHbPZisJdWFB28W1XyY9div0aPKA+t2R5MZ6i+bS8p++XSstSlA/SMshrf36ZNsJGkW8GGIF0rK7M9I+zEp1YdCDh5iBE6Vu5Wc09XaViwbhHdLycj9CbmWDeKCxAz11ZgBQztEx/9/nzt63dr0OpgZ19MKIK15uJeYRXWsfpbZ8s/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bGYIAuYf8cwucunD4WR4QKxbMawn+TBHJUodBy+ABjw=;
 b=fH7TauZSo/atHPPnWbNK3dKQy+Udx71qli0IHeZCbEAU9engyaesmaXVFlgxbykwt33RuN2Ia25PIGyjRoJzFbFiCtwG6AL3uMUAtzAzH6AS0aa66u1azHLAKmUDN3dcFvcbNPIfnwVSd7Yg6EEUo/v7W9qfSm0KvIh3nrP7ykKfKVWRcze7cdvNruj6L+6LQF3gzyJLOBmqBH9KvSuOxGYvoejFstd3ff+0IkdXgwgC3HhrQuwBdIs+d9HooxaFHerbP7wDLzRPwYMQ9hrOHN9usWQdSw5guCpJ9Pn4i6GhSZ8VIWA9Bswg5oYMzUGlU/IUOrbBTkZZKQnMQvMlfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bGYIAuYf8cwucunD4WR4QKxbMawn+TBHJUodBy+ABjw=;
 b=StFnXSNPWdptiqP9KJXEdMiFakhtmwG4RC9oCmDS2saQKo8iAF/HPnLBA48P4kyNC3hEfK2UlOA9is0YZfw9w0lY8Fz3Xez/oxVSx06w0cCadlWdPUmIMq7/O3kA7ct5fD+fsjsJPQl74RC+cUs2XpDyu4S9MEaOc4DGpfS617Zub4gyP8ZmFx2hYuY79xO1VoatYQL8oK0sCM00ZSSgncCwLo++gV5bn4tNC2zj35hHE7m72YvNtqapz5srnnVu82dQMY7u8j2nH1u023gxx2h/xaG8LP8bkn5f3iPYItKr201EVAp/ZCCAtBRktc+2dSK+J2kKLJ84jw9xrOB9iA==
Received: from PH8P221CA0031.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:346::7)
 by BL3PR12MB6378.namprd12.prod.outlook.com (2603:10b6:208:3b1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 09:29:02 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:510:346:cafe::8d) by PH8P221CA0031.outlook.office365.com
 (2603:10b6:510:346::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.22 via Frontend Transport; Thu,
 17 Apr 2025 09:29:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 09:29:01 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 17 Apr
 2025 02:28:46 -0700
Received: from robelin-Precision-3660.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 02:28:44 -0700
From: Robert Lin <robelin@nvidia.com>
To: <thierry.reding@gmail.com>, <daniel.lezcano@linaro.org>,
	<jonathanh@nvidia.com>, <tglx@linutronix.de>, <pohsuns@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<sumitg@nvidia.com>, robelin <robelin@nvidia.com>
Subject: [PATCH v4 0/3] clocksource: fix Tegra234 SoC Watchdog Timer.
Date: Thu, 17 Apr 2025 17:28:14 +0800
Message-ID: <20250417092817.2751534-4-robelin@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|BL3PR12MB6378:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b5a186a-ab75-490d-53f3-08dd7d924a03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CXEvapsd3WQO96FFOGrIou8v2UZFJNQPki8W/P8xqezVg/cwqds4zLPE8x2c?=
 =?us-ascii?Q?CkkM+/GbDzxTGi8wIpib270l/jYyZHQSnykGWULNleN7bnspopQ8bHEwkhep?=
 =?us-ascii?Q?SrmZxqFaO9aBvZoVhluKRro17wCYMPOsQwLnFxNdanJQDPC2bQKd7KgUZnAN?=
 =?us-ascii?Q?7l3jeYT+gCSRZJh44oAJ+lvi3Zje81pjn4ZonCVgO8P3eKnq8aAiyEcU7ZWn?=
 =?us-ascii?Q?h5eRmC5ZrR84BH3bLnLRLSkZ4nlyOau4GoVkPbNuQsxEEClUth2DMLz2+ukl?=
 =?us-ascii?Q?2u4gzwpDWZC68H5S0jdvkFTNRrYjI2wwUueraCMxFMBZTzpgs/wBLo4ek4ap?=
 =?us-ascii?Q?4xlBWmV7nG2EwZIvzmIypYwCHP5gmYVa2HYTqJ9fWj45Iq+oBwwdc0Qm2tyi?=
 =?us-ascii?Q?Xdtl3y8bugQThNG1o6YtnjjMTqFrUKNcRipyrg6QVUn5vCpJNPzHV0vETJu0?=
 =?us-ascii?Q?TXTTTF5Sru6yaLAlsahE0rC4KhfhInxDwx6B4YW1/NpiUjRjtq1SIfS0d0TA?=
 =?us-ascii?Q?69RC85YomolRT1q6QXek360hv6O3ZL120z7mF5cyHSueGuBjMOPNp3tgTv/L?=
 =?us-ascii?Q?CnWeRHmMxhQ7CshvA8vB/a+3uEK0w8lIoA0zQZ1kCjzZFXYMX3Iug5G9HFu7?=
 =?us-ascii?Q?qw/N+u4UA8J/pa04auKt5qWeKewoMMVJUxRa59IDfeqlGEmgMErsoGkkNoTf?=
 =?us-ascii?Q?ezfAdncAnNbYMbweEIAhWXMBaY30YsV/lX7Mq92MmrJgLExbKEcmnvi2KVRV?=
 =?us-ascii?Q?m+3hPMnliiJtCOX0gUOzBn7UhMlr9sRhOQlPBBYrbE+rcXe+WyhN6ppPKh/k?=
 =?us-ascii?Q?n7HXVRk3hDC3V98ao11HN49HpWOMa8jFH0pP+EEc4aNoYhAy40IRndTuf3w8?=
 =?us-ascii?Q?Ne9PuNxsc5ZEU3q5ydWKphFdcp7ezml4/Qj77u3NafCpqysNXbLDTmeAbTdm?=
 =?us-ascii?Q?zLgQzrG9euahhp7TxL5jd5kfLHmtbE4hiJ7kC2/v2oiG1sn/XC7rTBKmGmTP?=
 =?us-ascii?Q?72mIjKoyq+J2bdXY9jYMkgSpuihMkvdxMfyK9KVFYaEqwLPQXQVoEOb4dxUN?=
 =?us-ascii?Q?kKM08KRe6UyWNt9+EKYYq58JztL4vwKPrKX6VMXxrjXNi/XVLXLSKSrYDagP?=
 =?us-ascii?Q?dYaYGE+Y+FNhn/Oop6AEkMugjiauhNiVrQDMhKmO7gdEHDgxqAbW7rvJ6QtF?=
 =?us-ascii?Q?mieqqvtdqcW8rRLT/x+lzprXmwv2bvb5DzGAjB3E1KHKuEfhmKxvSfWmRzqW?=
 =?us-ascii?Q?KRFZec3Bj5v38UPPUSHYGs6yCmZVdI16RSYu6lMNFSmcwnRM7uR0UIvZ/pTO?=
 =?us-ascii?Q?KYcJdB2iGthOp/hiOlTTdrvS4IKPVkVJnbsXQ2X+yoA8n/E9+p6oBeHzQ9Zf?=
 =?us-ascii?Q?JbVURr/yRY89IO4kfEcGL3h7+UNzW+Fd/PHwD+QFuNWsFppreaWmwc9Qs4HW?=
 =?us-ascii?Q?gBDPnWW8pBMZlCn2ZjltwVr15PbLKLWnvqBLoDyCozLiwe19kXmhUUDauBjU?=
 =?us-ascii?Q?CN3foVB5qsdbDGF844dhoxMKnKhTnOdb6Vcg?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 09:29:01.5501
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b5a186a-ab75-490d-53f3-08dd7d924a03
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6378

From: robelin <robelin@nvidia.com>

This set of patches includes a fix for watchdog for it may not bark
due to self-pinging and adds WDIOC_GETTIMELEFT support.

--
V4:
- Improve the precision of timeleft value

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

 drivers/clocksource/timer-tegra186.c | 92 +++++++++++++++++-----------
 1 file changed, 55 insertions(+), 37 deletions(-)

-- 
2.34.1

