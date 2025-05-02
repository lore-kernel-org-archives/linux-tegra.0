Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1DD18A92D;
	Fri,  2 May 2025 04:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746160678; cv=fail; b=LMyBLE6iPFLDnB0FESC+o/+8GMhMzQaZ4L4/ebPnmejMtsJINh9fsbYhhldyEWtvczEtOxRqy8Fkttm9yAHlevOM36ecw5QUKlB7Ws3GJceXaLty8YTIVm4o4bwYs4zUWh0m5UiXzvNAmajW3u1NFaflQF8KbBucs8a8ecE+Zgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746160678; c=relaxed/simple;
	bh=2S/JnY0zdFaqgRQeOpX2iMZA6XU8Vas+H/gtyMMNnM8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=krHUESpLARHjlO25TAJUJLF1pUpOkYp0qTjTBkRpGuVzjrnB+gR/wDsnJDwf0GXMDiGx/whJAvQ6ygPj8HMeNTsLrYY30B+jYCzMCiokPz0ROd9b7R333A1kAsJ0ge4zUj4kszjYYcW7Z+l1siM2+grOn41+szxEfXF57hOfc0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=i8z8HMVZ; arc=fail smtp.client-ip=40.107.244.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="i8z8HMVZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VGHEfMJdBv1bjuSqDzA0JwXSfqVWrmCy8CsXOw1It78cpiIgY9QGlK00xzO3z3/puaOcmBkV950y9vTiVFYAyKv/VvxLijBjyCfpJfAEwdm60XA9T7aY4/wOvI5bXLFeEj4nIQALs3xbzrSmzC+DS/wYIkbji++xcuqWuwCPg5n5ZMlfD5hMVmZwuM0/3nz+QdJBakNf/Whx/mcgc72MuOA2SUCOfe5tFoePx1dxm14pxXKSOK9UW3XcxZVZ5wv+qDsPXvImq6EdGYpZu7tKn2ywsuXYK3xUOJ6k6aVbHpFCcBldWUEpM9gGXjN05ZZA9rDVeAYNXsV/p055obvbUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Zbxlmj5IL0OzsHqf3icJRMzDsH6f12TkTWuQmX00wc=;
 b=b3lpsG+luKy3ZDeMVYjcZVH0wYIdOUKvXNqL0ZVbN5qEindMeCm2DfkwAsnhMl2H1syuri1sgmV6QQLDY7klzkaCESW3qEPcTwCRUFEccpTqmvYCMzIqt7g72452TeU3dpanSNKN5GBWVhXkBrrRn6eCtm4nWeHuoZWM+GQRLvRqPkQGqFf/H/9ASGqMwxMki1o73TLXbMaUXThsNiLi6+Sa1ftNW2ic5lLgLC4hwg8M/peM0n03iC1GAyZjqeRM4Qsp3gPYft0ave7UZZBQH+kl9IJ3G3Lo1Z0nWCZW989h1gwHaxZjoL1GMX1I4qefQLqWfxyiyEgTbEjCePz4IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Zbxlmj5IL0OzsHqf3icJRMzDsH6f12TkTWuQmX00wc=;
 b=i8z8HMVZPq2UMVdzXNtWkDHnBELYzq35fFflmkcz2U6CV+G6lrCZmZfCfoK/NzL0cWhw/5UyqrXceiGUR+Q+EwZAFnMG9ARNzJXnZ6qw8LUGo4hdE+LKSPrw0nm14IiK5UFG6CDuSu8N7Iq4vhvNxinKBNRMnTjhk/rcAUMa7lwJbUGPvdfIaSo090ctNe//xSKqRSJyzfpeFvUR65IyCxjV2sJX8unamkltC9vJXhS0IBnPH/6gbNobx8e4o3p/u49p9cyK9w7BpO1w6L54TeRblKTUxvUcKYdCCRWvWZJWggSsWZCr5xON86UhvLUQZ0zzcvpFe2dGy7ZTN+exLw==
Received: from CH3P220CA0021.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::31)
 by MW6PR12MB7069.namprd12.prod.outlook.com (2603:10b6:303:238::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Fri, 2 May
 2025 04:37:52 +0000
Received: from CH1PEPF0000A345.namprd04.prod.outlook.com
 (2603:10b6:610:1e8:cafe::33) by CH3P220CA0021.outlook.office365.com
 (2603:10b6:610:1e8::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.42 via Frontend Transport; Fri,
 2 May 2025 04:37:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000A345.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Fri, 2 May 2025 04:37:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 1 May 2025
 21:37:43 -0700
Received: from robelin-Precision-3660.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 21:37:41 -0700
From: Robert Lin <robelin@nvidia.com>
To: <thierry.reding@gmail.com>, <daniel.lezcano@linaro.org>,
	<jonathanh@nvidia.com>, <tglx@linutronix.de>, <pohsuns@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<sumitg@nvidia.com>, robelin <robelin@nvidia.com>
Subject: [PATCH v7 0/3] clocksource: fix Tegra234 SoC Watchdog Timer.
Date: Fri, 2 May 2025 12:37:24 +0800
Message-ID: <20250502043727.396896-1-robelin@nvidia.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A345:EE_|MW6PR12MB7069:EE_
X-MS-Office365-Filtering-Correlation-Id: a54f7ac3-7254-4394-091d-08dd89331986
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pf613+nigHZBvHpRGBWlKQ7I8g/zUM9nz1Z0JqtMN8Y6O/lZ/HVSfL3iWLC6?=
 =?us-ascii?Q?hZOddcKj8PbwPbba6Slu3gKs38R2SjdAa14g9oqHFJMIo+R5gP/0Hcf1Oy8j?=
 =?us-ascii?Q?vWWFInAd0z7ptqlZqtHb8YPCKzYyjXprFO2gab0krOaIAU6cfveczDcJhJ9R?=
 =?us-ascii?Q?MIJ7ELIvJlXSuHeZnCGxd5vuHDbDfWtQy3G/lzw65USJhyLnYpHM/oVkbLRp?=
 =?us-ascii?Q?zlJM2szQJct6Oow69uKzYrg/CjFEXVbXbV+JpX1r44LmtHd6bMWa6j4ZQLbK?=
 =?us-ascii?Q?YW17PUY/b2DnemMcxy1MaBGzYT4KS6wADmOeylYfE2tJ4uV9pLlBNBVpHkpp?=
 =?us-ascii?Q?VraBe3R/NFRfedCle6+i1Lr2S/SgPJDkjkpLGJiDNuONswKrTvMNrkDO3i39?=
 =?us-ascii?Q?0FIY6G8M+PFpD4PTKjjh+fky3Xz8SZ8EM5W0G2wGDl8Y/rQBC2OCZfuwA3Lb?=
 =?us-ascii?Q?oHBuPjQjO5Xe/+HdYkVgYlPsG6TYfZ2a6R6ezKfquALkeuGVIw5rg7+DFGeU?=
 =?us-ascii?Q?KW4AOo8N/a0x4Z9ij9uWMNT6L5Pgk8Q0t8JYaOVHP+cwZOONleWJpOUt7QVF?=
 =?us-ascii?Q?Cdbs4sEueQkDyeT+DbhqzOSw/m4mnE8wyWvYZbIdjCAu1uEhaPUW7V1WhtxJ?=
 =?us-ascii?Q?UnPxWz3CmhHmnl7z+dTqqQjUoZIPH+nGZQ3VLnkuR4JdhX10GlznuYfZAUZU?=
 =?us-ascii?Q?3L4gHThArBzqEMAhEz00XFhwVL6Av7kG00f/aaWzF3X3EXSgVBWCc8fCjxqP?=
 =?us-ascii?Q?0gTzynud6o8ieY+B0oXc8g5L7eV1pFZWuzME/OqFcasz2kcpvD3Mrukdh4Yj?=
 =?us-ascii?Q?9rN+yOYn9ydW5sjRjZcOhlD2UbkmwfrtzRKJkmsYshfcmSiws5BkzaqGQhfO?=
 =?us-ascii?Q?/5YOj+1JStwNahqTMzq1XEh1STk2WhCcJwa/wE2VdarTVh071eHDORwvZ5Z8?=
 =?us-ascii?Q?tAgjLfc23+Zt9wKFr8F/rUQyqoBZowqCHHTpTSP0QzpCz4sSM0Pgk7HuoiiR?=
 =?us-ascii?Q?xWYBwBuA7N9FdFOVV9ExYYFyzhWVTCBjo+B4yKSXtOGDTFMZz4lFxkbFLW1K?=
 =?us-ascii?Q?LL07ckIsLVz9rokLVgkYmdex5J+aXNvuiWuawF/x8B/bYaxoGJIRpajjqd/Q?=
 =?us-ascii?Q?k8jy0D98aHIght7GjFL0sHugnHR101Xx8lmitdHL6FKFx2dGiUVbVpqsRpW7?=
 =?us-ascii?Q?ypJpcPZzl3JHdOSvKN0uG8wL4vTIJ0HOZUqORPnGXgEyH42IdQ2pYM+8SsiK?=
 =?us-ascii?Q?XKxGyceJ9eSv4LKa7r4AI1YDnkXtBf+XHAspplespwn/kFtpStzh/YPuoqU7?=
 =?us-ascii?Q?ufO3X5Adt3TyFjDXxOrRn4PNBCuYTvid86ilQHXXsq8eyi3MIfXUCCx1DlSD?=
 =?us-ascii?Q?0cDSDiXfPKXgoF22YuJNPxSaB1GU4j1R33vhFiqTDKPg98F/JO4dvzDTJkrP?=
 =?us-ascii?Q?9R8WinB52UIHtagk2c3uSsfDUNPCeiQ6nBgXCNzaztDDsndSTOHOWybKFCt7?=
 =?us-ascii?Q?rzBxNzJsrpJ4wTvg0vWszgGwS5eH5q0KS9lT?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 04:37:51.9454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a54f7ac3-7254-4394-091d-08dd89331986
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A345.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7069

From: robelin <robelin@nvidia.com>

This set of patches includes a fix for watchdog for it may not bark
due to self-pinging and adds WDIOC_GETTIMELEFT support.

--
V7:
- Fix formatting
- Consider overflow and warn if happens

V6:
- Fix timeleft value addition using unmatched time unit
- Use u64 type to maintain the microseconds value in case of overflow

V5:
- Print warning message if get unexpected value from the register

V4:
- Improve the precision of timeleft value
- Fix the unused variable warning

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

 drivers/clocksource/timer-tegra186.c | 100 +++++++++++++++++----------
 1 file changed, 63 insertions(+), 37 deletions(-)

-- 
2.34.1

