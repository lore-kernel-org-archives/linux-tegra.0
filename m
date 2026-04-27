Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010016.outbound.protection.outlook.com [52.101.56.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85A937DEAF;
	Mon, 27 Apr 2026 07:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777275288; cv=fail; b=twRFr3JWAVsi3jUwVnIAQ9jgnvnuoNvFGLsEtdNTgvVH7PL1hDyaLNItbybdkmVYmrBBVV0/GH4ZXnh+bLHoxQHJ8yNxB/rvtzW1390QuZXUjkzFdZYMDI5qXBkWlkwyWkHKHDrU+0e1wErJIfc2V8NRybz2QdYvOkMPqnDaJbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777275288; c=relaxed/simple;
	bh=edv3ckUL8tzUNRqQdFTGAzgsRV+9Jw14hoOmo8d+SSk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FMWuMiHXIkWORwFTTJ9PN/shA/2UTPguLJlyzJcRKPG56GvkWB8+bNBW6nCeoLi0dPLLPkgX5uQoGF7RwEKhzYmjj1e3jO7p4AK+m4xaLPKjajSdvfeEHaY7h7O3oOEND7xhu9GZ7NW6BTiEq0ajQKna6pfQWdUToUwZisWSdLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=b6E/j7Rx; arc=fail smtp.client-ip=52.101.56.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="b6E/j7Rx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZeSR56R3CioxZxCUFkN6fzVqF0oONPwltCi9ORxInlw5ZdvGqKBcLWu++b0/l2qGIk8nneUS5fdsFH6jDO060lB1ZWb0Mw6BD44WJCZwRAauq0DqThaqyTXlhLtCHqp3EYr8BAwZtdReT7yWAHPcKDK4FrM/758xInruwjdNqHJMnkyH2C0tbKZgBqdRpXUbjwiUvYwYVTHakh87Xxj0vd5meXPef0biBVuCAXv+leP2PlDNFaHuJb+3u2ieVl+5hk3Oc4D2bAkFlB6BI0Lqc6ZB21359DvHREEKgO+9Wai2N/7nbxKUJ87awBnLYIaUej99YNIvjeV8uCMazLYexg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+q7IYLpaxzxj8Slac4vYCcUnab7W/GohFGTeDkD9O/s=;
 b=QkkQvHDE1yhut9aCSTVIJcDTIPbeSdJ0rg9OFHTeebzxC/epoEr1eLHJf6HIhM0ENfuPWpY35Omzss+DhdS8ruWynPc3TSVsWH6jmXcByk/UM3ctpGI9WJbFm69GF7NzjRn/pfp/cCHuUZ9VN4qVkjS6WNd9JWMERfVp4hwEt7fr3/CJKA0uy2UhUzDKER/hYyPHSw2hzMLCByRhs7925DrNa/T0mJbqZdL3KfGjaAsX5b4kEbiYmWJtX/Qhv9mqwo6pnz+uiSwsdFjYEFgAtlIPw/iXGSEeI4BVBkeMT9o9DgxQ/xDoxI6PD6c9t798EhCreRBsUMFc+iEGppJF6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+q7IYLpaxzxj8Slac4vYCcUnab7W/GohFGTeDkD9O/s=;
 b=b6E/j7Rxtzk44C4tHMBeEsb8AIDgLlyxqp5PedaL/GaSWe/oYNNqr+c6ZpWktk+eLtKpEZJ7xXzeOMG2MBq8rJxMvh8uaVMMiiMWzogN5KakE3zDuBS/mTQaFcJNoKScnMjqTgmJNU7EFKW7v0TY1M97RR4wxu3CDND7I99p1q+Uy31gS4N5Qbev771LDd0fgVgQXPdbpnF7z1lwuGHEh6/942Vv+VjXKgsrghwAkBEe/wpaDDYkfOoo2nvId9o5LeJFvVZ8YcRSPY3Yki/QmWUXVhkXx5TLnKNIxzfvk2ISWvVmJo1z5KAtNppQTxoom6+2rwMxO4Y2ggGONSvM/w==
Received: from BL1PR13CA0439.namprd13.prod.outlook.com (2603:10b6:208:2c3::24)
 by CH1PPF12253E83C.namprd12.prod.outlook.com (2603:10b6:61f:fc00::606) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Mon, 27 Apr
 2026 07:34:39 +0000
Received: from BL02EPF0001A0FC.namprd03.prod.outlook.com
 (2603:10b6:208:2c3:cafe::a9) by BL1PR13CA0439.outlook.office365.com
 (2603:10b6:208:2c3::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 07:34:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL02EPF0001A0FC.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Mon, 27 Apr 2026 07:34:38 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Apr
 2026 00:34:27 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 27 Apr 2026 00:34:26 -0700
Received: from build-amhetre-focal-20250829.internal (10.127.8.12) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Mon, 27 Apr 2026 00:34:26 -0700
From: Ashish Mhetre <amhetre@nvidia.com>
To: <krzk@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<=thierry.reding@kernel.org>, <jonathanh@nvidia.com>, <sumitg@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, Ashish Mhetre <amhetre@nvidia.com>
Subject: [PATCH V2 0/2] memory: tegra: Add Tegra238 memory controller support
Date: Mon, 27 Apr 2026 07:34:17 +0000
Message-ID: <20260427073419.567360-1-amhetre@nvidia.com>
X-Mailer: git-send-email 2.50.1
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FC:EE_|CH1PPF12253E83C:EE_
X-MS-Office365-Filtering-Correlation-Id: c2c5e957-f5b0-4787-dfe1-08dea42f7000
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	GvRLgnlMbpbmejSEzIQOZIm4qqkamoOG3T2eMDQJqdOE6Pjgamgaf3Q06WU+CCMVkcHW4mLFSpibMpqJ0KQcxQ2J/1CLDOZ8Q4Hta209PPoVgFNAgd3mk2o0GjoWcMSbQMb0HDhMGyfVA7HpUeU3khkVcNRgKCjjjDPBBJoMgWmz6Eu4/ixCtwTRE+oHqEKt4jPWJpp1TLzbFlTaxW6Xxx+wKUDI2MinKgjZcRK3nrNhopTnQmfjRNL7NkP1RwxIHNbDpFOdhfCoQAtcBBtcb+URe8CU5R2IuHfhLpN61aI4gI5+hzRsmdEdoLckcD/pb0ltgfSfjIpNkKdnUtagK2SknRB/tbjv2iwVwnYtGJpNuLhL1EPcxQEjpIPypzYXJizCRJNj0aOc3Y7lI1nPpwX/dJyJpPKkMjBXrb2S2LPdcDTdoZK/uVAKevy4ih2NYxZ6qqWQTpG6zPaJ+FYq4Hz6GYsywZ8luW2u0QXL2LpQlPlVpBf7P2j4C87HUH3AY9kQv+9lkXJw6tsstjzBNwpibvFIhP3/4nF8Mi9c7Q2C33Ix3+jVGVBudqUGx1Xm1pzRa17FG27c9DmscE7StM68sCaUDgm+KMG/XNP8Cked0zVieOze49Uh8KvaGjCruKyKMNi++WIBTOO7wCTGkmwilPoxynn3Mdhwg+xOm1bI+HYRfB2hNjCwgrDgMD8hVuUyxm47QHh3TDC+Mn1JW1eYYQ575RWhTaORnV9jWYiIxUmZMQHgGa8B/J10BkLIBX5KoBKUvtXRLeUr7TfqHg==
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9oZLoia/QBpRt53yyylI7Y5AL/V68anOSU21pdEiRSVlljR/acw/ZcGgg1cGILRNPTVV6NZvRsRJf3TzvHFeofZ1U+zwzGxsUsMluiobYB8wDdvX3KpO+xxwySsRtC/1nVCe6dSSMfWAYeYQzYqEDknfl3+YCqYHsHvGGjp2RoZ/9zsJ6Les5OcKe0fbA5NrLa0e1X9CcdleUGbEDTffpQq3hA0on4Rj7M/UKlcL7IhM/B1tghS6EMeEnzsJ1mFVV8gaItr7Ua2lTTxfo+iL5AEh4hQLzDEKDYyd/7PqcDAl60Lfv+mndfsnHaVSlUoQcYL08BqFJnmjmdlKe/al5oN4LZEl075rCKqpkt86M61GbMRyE0dcNN4ojtEdwPvOOxSP6qlbRuaHkr0uFUn1yYdkMK4K8ZFPBuXvLA3wDrNXY4P/dgeESXX8kjDwXqQl
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 07:34:38.0646
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2c5e957-f5b0-4787-dfe1-08dea42f7000
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF12253E83C

This series adds Memory Controller driver support for the Tegra238 SoC.

Tegra238 is similar to Tegra234 but with a reduced memory controller
configuration featuring 8 channels instead of 16. The driver reuses
Tegra234 memory client IDs and ICC operations, with Tegra238-specific
stream IDs for SMMU configuration.

Changes in V2:
- Reorder patches: dt-bindings patch first, driver patch second
- Resolve tegra238 build dependency on CONFIG_ARCH_TEGRA_234_SOC
- Remove lite carveouts comment from tegra238_mc_soc

Ashish Mhetre (2):
  dt-bindings: memory: tegra: Add nvidia,tegra238-mc compatible
  memory: tegra: Add T238 MC support

 .../nvidia,tegra186-mc.yaml                   |  31 ++
 drivers/memory/tegra/Makefile                 |   1 +
 drivers/memory/tegra/mc.c                     |   3 +
 drivers/memory/tegra/mc.h                     |   9 +
 drivers/memory/tegra/tegra234.c               |   2 +-
 drivers/memory/tegra/tegra238.c               | 391 ++++++++++++++++++
 .../dt-bindings/memory/nvidia,tegra238-mc.h   |  74 ++++
 7 files changed, 510 insertions(+), 1 deletion(-)
 create mode 100644 drivers/memory/tegra/tegra238.c
 create mode 100644 include/dt-bindings/memory/nvidia,tegra238-mc.h


-- 
2.50.1

