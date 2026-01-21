Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010032.outbound.protection.outlook.com [52.101.56.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470BD40FD9D;
	Wed, 21 Jan 2026 10:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768992371; cv=fail; b=WbAnUDFCYZ+Vf7XaeocwBZI1m7BrScw8Uoh7C95q608Lr8JXEO3eZsLh5rZkenay0/lajT8QJHDNibh4lYaCIHuXEt6OpEv1sj/Em12JCww0e5d1o3Kl+kResRHBm/qgAtLzFcHgU09DGrV+JcYMA0NzCIMGunnWTeEWTnmvG+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768992371; c=relaxed/simple;
	bh=hb1BOAbVMaegpkaNtmn7HH7spF5zlhk0yE6rwuMbgCU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kI5FfkwzHcn8Z6y4Xr44EXEgGxGXq2c6osgFNhzUDiheerxpueKvOivKt4FYHRBC6b7rQXh+/2AclWNKvfReypwImnq4TcY+3pycfgf9Zkj6tPGiFQAH8eFC4Ip0A5ZqyR9KTs0aTZ8yj+U8wowIVP6Ic5+gE1G13p2XTyJi+lk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EFOSpQ+t; arc=fail smtp.client-ip=52.101.56.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EFOSpQ+t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=krn2zrFxvrJ6UZrlu1uEtZtGWueEy/plDE7j9EbAgqBNBStdL0V/OfQDXUTzz03pH+uNNYsfuE/BU/OfeI8zoxQw7feGFZdOFM0aZ18RqW3oxy7dAWudoeK/SlLUcgYgqnQWqHrnr+G1NCJ9l294ir3I4bEayszzdwuiKfrV9bI8EU4s7PUIoyxTbO5lp371Wrt3+dzjrCUr2Pg8vmKhz9XjC70i7GneIwtkE0m2APK0HSteWzFUxXVAuxmoOX7U0aTFeA+0RJM10gKN24dsP6Z7IM+0VKMXSvOdWK+nC3Janq4zb6bXIa5+h2kNM3OmEy1nH7c6QsDxQipbCdXkEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h054Vph4mlTq4BneXeMrSLstVnP2Es0XT09V40Tkz0w=;
 b=skTCWrpWhxeiARfpy5i1uhAqml3sTlfnr2gZBbTkMz6JNgTVI7KEg1EH1LGAGtC4t3CTKsVNY73frGJgLSyL6fgJkeac+RNPO0XHCiDgETfhWlbhiwMVbynAPj4K7ohZTJqLSXdD4dhMUNlh2oWEQgVs6OVHjTcfX/VB2+7Mt5u2PH7q/8YMUtIHxJDdrrdAFXOh4E4qJcD1AJEO+/7VBhv9oIMxp0jKmZihPiovUf77iofzz7wnXylcxsLfZjmlLloPK1fMZmtptD1QobVDCIUN/kchwZ8nT5ZAw8RZucgTuYJM6U/DSJ+HfMaMGgIz4AvvJSQMmzlgzoMXblyShQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h054Vph4mlTq4BneXeMrSLstVnP2Es0XT09V40Tkz0w=;
 b=EFOSpQ+tmZjUKMpSz/DKY80DAnElB6vkBPmud1lZ9zAfDw7EdyTYvEkeFnchrO94Rd4JA1LZQOtCoA/+BX+UgRO7vJ1aWdoprNt/nlktJBHf6q6TFWtibJMoA6Q65dJrMXQqq++YZ1/IDNXtc4WY1XyB7sU0eCWgSysKzWYRzS4KckAMa7DYRNxMD6wqz54jzRfG+HpaJDE9XpoPVtxpC3qd2KlT5mk9n8qPut6ieQgQfucdxTefvgRY5mSa2yzx2wFehwXlBuSPDApjYzP6fAQFGAEjBEmjjfhxboQ20AXIUm1s8wuZBfr7b+9foDugECYLgRNi6cWuw/MLHaCq0w==
Received: from SJ0PR05CA0054.namprd05.prod.outlook.com (2603:10b6:a03:33f::29)
 by SA0PR12MB7461.namprd12.prod.outlook.com (2603:10b6:806:24b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 21 Jan
 2026 10:45:57 +0000
Received: from SJ1PEPF00001CE6.namprd03.prod.outlook.com
 (2603:10b6:a03:33f:cafe::cc) by SJ0PR05CA0054.outlook.office365.com
 (2603:10b6:a03:33f::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 10:45:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00001CE6.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 10:45:56 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 02:45:42 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 02:45:41 -0800
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 02:45:39 -0800
From: Sumit Gupta <sumitg@nvidia.com>
To: <treding@nvidia.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [PATCH 0/3] arm64: dts: tegra: CPU and cache node updates
Date: Wed, 21 Jan 2026 16:15:33 +0530
Message-ID: <20260121104536.3214101-1-sumitg@nvidia.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE6:EE_|SA0PR12MB7461:EE_
X-MS-Office365-Filtering-Correlation-Id: aea3626e-e9f2-4500-93ae-08de58da4230
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?a+FSXdXpy21OgYDGH0YVZNmAAtK3BL4iSqytzJqLFz7N//WvvN+avad6t6HN?=
 =?us-ascii?Q?bB+zv0dCAsf3IOmfJ9LuJkfkHQOB2e0c2X5Z/61dkWLLa4onMvRVg4nobdSQ?=
 =?us-ascii?Q?MnoyPgMX1bhBr0R9LupBxYtPDOXgcKqgeQCppmJ0/5YyL8U+ZjknTkeFekuv?=
 =?us-ascii?Q?ULxFLrJRqC8Jot+GrS4vgpiPLp9SaPcsSpmJNLmyxi5mUw8wyjz0SBUmF69d?=
 =?us-ascii?Q?vN7b2nizkUGDWpvImBHoHoGu1JfHVpZUvjJ7wWvJuVuTfUHzl1GwwkOjSvbg?=
 =?us-ascii?Q?mDvt+SxqsR7FaZEIQ3p+iYAdDN66dO8bX6S2FxtVkqzajEiF7cnL94JDYMTB?=
 =?us-ascii?Q?DKVM9LfNOqQ/Vxt3t02WDqt+iwPKNuKM3wRKArvYPWLEkxaKWpQIGynBezHM?=
 =?us-ascii?Q?L4GI02ay514/s0GKxcEHPHrSMlfHu/X+/BgdNE5+Q7gjIxgyYJ5afp0CBVOG?=
 =?us-ascii?Q?dB5CnHE/QV94Mh/iGD+AAPp3L4Og4itVaNc2whWnv4vKcXeJsHhIfZGQx++y?=
 =?us-ascii?Q?DK6Y8pRKTOVlcWRA5ZYE8xywM4Mc+Wlf0NdJXQHOq1uR1rJZAUe2pGjaGWeA?=
 =?us-ascii?Q?18WOPTqqxHdXIKp3wg1SOnCpy6ZyHxh9Iu8YIkc370QZXLg9Ndyg888YmsZq?=
 =?us-ascii?Q?jl3MWIs4+wpcayFDvku49YrDZOYJHR0iwURRV8OGUdMIMX4gPjy7O+B8IkV3?=
 =?us-ascii?Q?R3XYoIh6kMPXCUEuZuAAdSJOxmafHgyFB972dsH/F5zAflLvNlADB5gdhNU7?=
 =?us-ascii?Q?82aKY4eEKpUB1+gelqBlkQgk8NGFCk5Qs5TAqv259hF4m67pz5IGMID4UTYz?=
 =?us-ascii?Q?tm8Z4OWBd62PJ6i6BSpJL1APK96l1zfX/qMyw1XYWK4lCrZy5NFlablMBfHT?=
 =?us-ascii?Q?0M8UUs2HtJ8hm+XCvB31sLN1Y7/Ob0a86hkHWy5RkUOnjClyBrQF66sSaiJH?=
 =?us-ascii?Q?IUxER1Jkl2mUj/ggYuW6ZmgtU58161tkbiQiZ33vskeWbTT/VLOJSqI2OIpY?=
 =?us-ascii?Q?ozkkpKrvJcfOKxZMwezNx+27AOIU7EeO2mJmSfVbiYgieubR+uHllveUQpE5?=
 =?us-ascii?Q?0G2hvvSXYWrYdcIeKEY4jYwbz7dF/gaoLqyTht8th8ixX98IVnm/UAJqFO2v?=
 =?us-ascii?Q?RKUulTDkPiADy2Qu30+nDh/2h1QLENgJ2dKll8PuMbKd/vqDYgW5EzgOCq/H?=
 =?us-ascii?Q?NqADzNPzWlIOqVC/2te1pxnHLBrdj32fp6R+UvQ+9mTC+Qr6L4uiFAUY563F?=
 =?us-ascii?Q?9/GCP92c2subvwbqmW2FHnbMWAenGij20x9lA8yZVTEeAyZNZO4Zv/XDm9rR?=
 =?us-ascii?Q?eqdNZsRMLIeCyQksLrs/3/4lAyKm9CcIfJRevHzzS+TfNBXccFOmkp40EHbI?=
 =?us-ascii?Q?UYgDAJtT1Q+xJptlN+UD3uKkkxBZ5nCidaXnjvU9vU5GZvnLa1U15L5WUY16?=
 =?us-ascii?Q?eUJSbx+9DQ0tMokE9F1YehzLcKyAhGxAFWM41D6tq+L0JC2Wv4cHTfZnf0O9?=
 =?us-ascii?Q?KbYX8yGIqoFMb75O+/X3u+7vFkUgBD8HYzSNWzDgMGX3Sk+VRJa7qn7XmUXw?=
 =?us-ascii?Q?DR5j4dgidwGiaQzXUcT6HalavA2/cOfIIPsjMW2H35ZxqTHMtGqm0P2vVDYd?=
 =?us-ascii?Q?wKY1bsKCnDJV0oWveCMeOe9FtqNu8jHANEsXxs2jNLEjRv6vQV+21DBPJrkh?=
 =?us-ascii?Q?WjvFhA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 10:45:56.8478
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aea3626e-e9f2-4500-93ae-08de58da4230
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7461

- Fixes for Tegra234/264 device tree CPU compatible string.
- Populate CPU and L2 cache nodes for Tegra264.

Sumit Gupta (3):
  arm64: dts: tegra234: Fix CPU compatible string to cortex-a78ae
  arm64: dts: tegra264: Fix CPU1 node unit-address
  arm64: dts: tegra264: Populate CPU and L2 cache nodes

 arch/arm64/boot/dts/nvidia/tegra234.dtsi |  24 +-
 arch/arm64/boot/dts/nvidia/tegra264.dtsi | 323 ++++++++++++++++++++++-
 2 files changed, 334 insertions(+), 13 deletions(-)

-- 
2.34.1

