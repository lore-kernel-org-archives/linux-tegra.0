Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAE422EF5;
	Mon, 20 May 2024 11:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716205793; cv=fail; b=pR6gxkzMyjjAGcB+J+g1nqEa7XaDQEKspNv2O6OrYWH/KpwVWoj0oYlErn08OGz8vHnzj1Kma5z4VMzF6tUkuYvAZe6TVTXhlU1Klj4ZAgBUcMDzUFQruTxfQoplb6Ob/dDhem+s2vUeU2PEMIOSaRlfy+eLb2Z/Ys1Jw07l+Ek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716205793; c=relaxed/simple;
	bh=OSbUi0CqRkOiAAOt+6CkJX69uH1On0RfyPvCr0fnr4w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DHs/Bido9pctpBKJGoalFMo1GuszL9uzOkZFIN0EsZEFvbN4Zmv0Tw9Sv+TEmtXqiflYIFSIOHkqggtNVarw0iswhtAES/LDg11R/zH8r+KFMIHeeRV2tVMP4xXY7KxoWFoba1tFL7xm6CV1fN1+OWX+St6rJHp6dsM3Gf6AQQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=iJ4ulR6L; arc=fail smtp.client-ip=40.107.92.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="iJ4ulR6L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E9qOk+qeMTSJxUNtA/2Mh6jlfZ9Y8+QGIXD5GHAWWcs+ydjjX90VnoPZfwxUWfxXcBmgb7x0fSGugCCjS0tMYy43u+wAxBhC/ATaUNcfPR/4nTGb0gBcqErVZm5wHqDxZVNuScHcitfIUOs/GjRVYhtq+t1gS0oYCcbev3zWQ52JFWXf1KXyW5NX+aTekV7BCvUVJOHK1II+Te6ug37BZ5WH1GlZWAkfYZ+fg9RA10gqw+uuKmthPioePXFVR4fYQP73OCx+EY6FWR86GV4AYRJvuMnUIYxqWZQXEkxwE/9ZpnPJ6oud0z9FCSIboWT1yOqkYywFucjRZEDjM2ffsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=llchwipB6DD9prWXVe0w/+/p1SJHm2B9OJbbOaD538U=;
 b=SB+tLEoMtw7MzN++jy3MoefGEu52TIPRbxft9Ws/l4Ec0G+mc/WHQ/Nwiuntthzci4SP9jN6OOyzXoxckcoafZZ2NpHGcS4dPitPxp511UU8z0b+7Csq/NeIEuvGuG0JYGlJYJximewYSs18jgORy8WvttY6PHnGReuhMABOwT7BXiIfR/G6Kp7Rab0yZc7ieNqx84ckzrosKkvaBizOCW/NbXVYccuNalOKlP7QDS6tH02jyIc9VWOVgexy1kw+T+LchNhPPAE1QmgQ+vXsxR/pRDOtqOZCZW1XuciG9vjjWsSKvyKb0GWtN5+voFqo5hD3kYbGvFMygYctwgWQ1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=llchwipB6DD9prWXVe0w/+/p1SJHm2B9OJbbOaD538U=;
 b=iJ4ulR6LYoNapMnd/E7uy9jFF5ALhSIFV8ltILSVnRpaKvvcUzL33NGjCAcHzpv/l3bNO16Yq8p2tlz4Z/YlppTqJnDZV7JLmZwE+N/Ou7rpljMUmwTKw90+RGhsxyfO9Ds9M2URsMOK/hFHibw6t9EzOMTfBo7tCn86Fj2i20JRKhzpFIuqeLQZr7JGQkK6FzMKLrxJp9hIt64VCDT2E4EE4LzXLHV3BMVg17c9dRjfUhwWeprAbrffSwn8W8xO0DnVdZdfhEBWHld3/aKlWmPwmKG6AyMgRcfuO5Dm/xMsOyfrg4YAcL4xJEBkGrciB9B1I+l4iXGnl1AbWRvBZA==
Received: from DS7PR03CA0051.namprd03.prod.outlook.com (2603:10b6:5:3b5::26)
 by IA1PR12MB6283.namprd12.prod.outlook.com (2603:10b6:208:3e5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 11:49:48 +0000
Received: from CY4PEPF0000EDD3.namprd03.prod.outlook.com
 (2603:10b6:5:3b5:cafe::8f) by DS7PR03CA0051.outlook.office365.com
 (2603:10b6:5:3b5::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.33 via Frontend
 Transport; Mon, 20 May 2024 11:49:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000EDD3.mail.protection.outlook.com (10.167.241.207) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.14 via Frontend Transport; Mon, 20 May 2024 11:49:47 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 20 May
 2024 04:49:33 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 20 May
 2024 04:49:32 -0700
Received: from build-spujar-20240506T080629452.internal (10.127.8.9) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.4 via
 Frontend Transport; Mon, 20 May 2024 04:49:32 -0700
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <linux-sound@vger.kernel.org>,
	<alsa-devel@alsa-project.org>
CC: <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<lgirdwood@gmail.com>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<mkumard@nvidia.com>, <spujar@nvidia.com>
Subject: [PATCH 0/2] Support Tegra I2S client format conversion
Date: Mon, 20 May 2024 11:49:00 +0000
Message-ID: <20240520114902.1663695-1-spujar@nvidia.com>
X-Mailer: git-send-email 2.45.1
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|IA1PR12MB6283:EE_
X-MS-Office365-Filtering-Correlation-Id: 47b3d90d-1cd1-42f1-2dec-08dc78c2f33e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|1800799015|376005|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YebXEuv+PhmbI6eiWY2laO/0TSIiBHxli5N2ZtB0wmwgkGilzzJVckrKuLKU?=
 =?us-ascii?Q?cHZjsJGmi1XKIbb8OmSLhEI02+xD6lceD+xifSypSZm+bolNtY1FOAnwASS2?=
 =?us-ascii?Q?EjVuNU+OOOPodt9Q1Ky23hOz37nOoRab1Tn1PcT1LaU1CAzc+pOG6OXQwinC?=
 =?us-ascii?Q?mDACyxqpDGPkkNLcusrHIyhtgmKhON+9vu6FfEmxlH0J/krG+mpsbPn7OByG?=
 =?us-ascii?Q?mFGHXur7gN2D+250gilRYCelbSm1D8bQFg/hW/bIA5yScxAvA4IJWDJa2tWX?=
 =?us-ascii?Q?k1pjuAHOXX+lmRXS66TUJjEgVKU/7K356W8PY+uikKPtSkhOSae9m7LrkzRA?=
 =?us-ascii?Q?V3wjhDZ/42yn4HdcVMFk9DRnkGzI9Noqi3tSAOxXUdSPhPfNWoBNFOdouhTa?=
 =?us-ascii?Q?IxhZfSwI34oqe5gmDt5Vlggm2s1WsVxjkuVxCcnIK3+Ut/FDEcG66qwnopJs?=
 =?us-ascii?Q?c6fBSh6L1qPti7ziplURp+gii30XkN8TsbN3HukJPgcqUjzW2FkTzVd5fb65?=
 =?us-ascii?Q?Mulp7EmV4GHTewbxmnKPr6Nh7vtj2OQ3QPs3NGU9KGzbtz9rq5iXTW8YLt3q?=
 =?us-ascii?Q?cvN94uBXqNfZ8Zv1DIz+EI9l32OMoHwMVbnnMwrVSn/YZdkyeKB7MVqkKwoP?=
 =?us-ascii?Q?ARKM0ZxqnnuBeeVX/uEgC5TnuErgSb885nn68AXIZX9RJX4aA/IcVg0LNyK7?=
 =?us-ascii?Q?rhamAz8fHS18uLOlzYLLnv+SDFk8Z/ajNoKFMpAr1VFgO+yIaP4lAAaXPBKh?=
 =?us-ascii?Q?jzHKMRSF1ObEamajUzSnEgE8D/SR4QWsnaRyS50D+rzXwvvKgeCkph7uezlJ?=
 =?us-ascii?Q?9kKFtvAgJuqpDkknkvkQb6grhDaMHC4/WfK3u+Nqine3ye8UdgGxwi5Wozu/?=
 =?us-ascii?Q?vPWcOPUKJPxys699LNiJ3qhSWh4TdlBcf5o47B3jw3pfgNpm6+fboPiJFi3W?=
 =?us-ascii?Q?JWvdi2Q074hsMqHtbkAuPeLviF+2XBNEJEh720lwouCF8q2fS7AetnPN/YAi?=
 =?us-ascii?Q?+2QD3WMr7YugM4zGUDMKPG9XKXxVUrjBcf3N2TUdSJeuNStC0GY0muhKoFP8?=
 =?us-ascii?Q?HjcLttny4oY2Uc3WmUB4SopvfgMJBB+zmsCU0lMgahqDfl+VsYkoh7rm7de0?=
 =?us-ascii?Q?BaTjbpBpfyVj7pCZOYsnqASH01jbPgaXByGJHslYU82gA8HqReSLPnw05+Rq?=
 =?us-ascii?Q?+ggl5drafetEkC7ENvsGYnl7RgPD39H+M8Lxdqjom/1NYZAALuMycyavX7or?=
 =?us-ascii?Q?losrXsCAT6AwesK7OrhRc8+wjMyHkLt08T4yGMkwwymNRn7qb8z6l0Nn0HG6?=
 =?us-ascii?Q?N5xg/ShA5Of8MRC+UXcJewZzmYKxXdXkE+XuGeKRIi+k9aTY5VPmrXd3z+1j?=
 =?us-ascii?Q?tlTScM4=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(376005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 11:49:47.8601
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47b3d90d-1cd1-42f1-2dec-08dc78c2f33e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6283

The AHUB HW modules are interconnected with CIF which are capable of
supporting Channel and Sample bit format conversion. Due to this, the
I2S Client can have different Channel and Sample bit from the hw_params()
and this config is passed from CIF port of I2S DT node which can help to
perform this conversion.

- First change to split simple_fixup_sample_fmt to support returning
  sample format value
- Second patch to support Tegra I2S client channel and sample format
  programming based on CIF port from DT node.

Mohan Kumar (2):
  ASoC: simple-card-utils: Split simple_fixup_sample_fmt func
  ASoC: tegra: I2S client convert formats handling

 include/sound/simple_card_utils.h     |  2 +
 sound/soc/generic/simple-card-utils.c | 26 +++++++---
 sound/soc/tegra/tegra210_i2s.c        | 71 +++++++++++++++++++++++++--
 sound/soc/tegra/tegra210_i2s.h        |  2 +
 4 files changed, 91 insertions(+), 10 deletions(-)

-- 
2.45.1

