Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012049.outbound.protection.outlook.com [40.107.200.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042D739BFFE;
	Wed,  8 Apr 2026 21:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775683519; cv=fail; b=az4IpdyqjT+z1vdtEl6YF+9aaOOWh5z8cdVwOCo1nlq1Kjfxlq1oEPfWPsYmNUq5+OC6sEYDqME2rLOAFJCRcdf0LbxCXCkkKAnU3EndudKcMjg+zv4zfi7mpVyZxHnK5ImOy2YnrVSX2DB9QG7Tv8EXHWjei0T17D59zu6nnFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775683519; c=relaxed/simple;
	bh=mIL6obZg+GSI4HU/Vqp/ZiWifBpbbsB/eLSh66XeT2U=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pHxopkHBEDrm7DH5CZRAGhGXdTGE03y5D0DRBilsehQl2EtImS8+b1GP6X/dJv8EVxtJHY46Gu54gjd9kvjkAV/2ZdhXO1l8WbYM1KI1/pAol3R6d8fiuDIWiDYK3waXodSkBp9VIY1GetqjKcsnfE9UD8I1lZpAsEBkMDFm8pA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Cb6LsmRQ; arc=fail smtp.client-ip=40.107.200.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Cb6LsmRQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iFW1gSnsj1kqi3v1d3AzGtIixgwUpPury6VleiBy3tasc7XyDWQfsI8Pk3KdKl+i5EWaXGNm///VrIxE90Yl4LsAUM5fy0L7CsL5UbThYwhN4c1f2YAnCwv6y5gEGZ0v1ScKcUmFlMpGQfhcyEUpGmPhKVxWKlJmPKWv/Y3zZ56x5uQafJJRhqbC11N9rfJH1GqhP8eZBbT1GH+utt+mX57a1ZsogrdACxTY3j88jRxMRgg8phYICcZt5oi7G8wM00VEs8fTvk5tNLXtp4UP2GWPmyfildji+8DThmTfxETXHcyI9cYlD26JRJjOs1usCDsIhK5Fz4VqBlLRbEuQeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RYHU7T86Z6Qj+89SXElA7/lPQ9gbxOmy9JDs1m1Gqc4=;
 b=fyLjRlbfPUJxy4hRwnhldlmDq47R0oiAtISWC5469oNWRD1/smykgZaqVXnW1H7/BmXxx3+RGTC4a6Rhej+P9Usk4af+nrPylYcTYeYxEluZgd3sfMqOmiJfyVpw7MvrW/Rr3yyT6ylczoGtAh+622nckl7mFvOuOcweWmQfoKL2jFEO/igQn7bhhxlm3C5GFgwXAnl0ZK/9hLpBhSz5y2iL6InDobNMMl+KHcJu/g3n4fux9jqiWMQ0LgU2CQ8/g/un7GxWPupt/to2RYiBKSSytJAyQhZkHASqq6Bxk6NpHXZkN+3kG5kRCXyWWPVGlX7+5XIicsE13h7VZVAfTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RYHU7T86Z6Qj+89SXElA7/lPQ9gbxOmy9JDs1m1Gqc4=;
 b=Cb6LsmRQ2SJIIYbkB9dImUYQbm/cuxpLZgNOJK/MLGCjt1yKLb2IWmxPBoBwCj6AX5i4W5j8e1+F1awQ77FKcMiGbV7XZxSgRjfoZjrvZ+wCPlO4vj9YMZjc5rOHUYn7nSSEOkn5um2kjZxU3QuRB2Q51Px5knhsgDuAn9QHc1LXjyfeOU1ABAdMDaDIFiYXuMUjOmrtihMDUsJU84mMu1Gy7F72/r9kzBlQHHdHZEG1HDNdv0A3qDTI0pS3CtLYUxdlrVj+f9rA4prW1meNJ2CbLRnEJUrb3PXYm3cmWYPE+GnxeFcSa8II3h9oWHm5//ZGzDrbdKVLmWh5gFG9Cg==
Received: from BN9PR03CA0636.namprd03.prod.outlook.com (2603:10b6:408:13b::11)
 by SJ2PR12MB9140.namprd12.prod.outlook.com (2603:10b6:a03:55f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 21:25:11 +0000
Received: from BN3PEPF0000B372.namprd21.prod.outlook.com
 (2603:10b6:408:13b:cafe::b8) by BN9PR03CA0636.outlook.office365.com
 (2603:10b6:408:13b::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.37 via Frontend Transport; Wed,
 8 Apr 2026 21:25:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF0000B372.mail.protection.outlook.com (10.167.243.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9818.0 via Frontend Transport; Wed, 8 Apr 2026 21:25:10 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 8 Apr
 2026 14:24:49 -0700
Received: from build-suneelg-jammy-20260204.internal (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 8 Apr 2026 14:24:47 -0700
From: Suneel Garapati <suneelg@nvidia.com>
To: <dipenp@nvidia.com>, <jonathanh@nvidia.com>, <thierry.reding@gmail.com>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <amhetre@nvidia.com>,
	<sheetal@nvidia.com>, <kkartik@nvidia.com>, <robh@kernel.org>,
	<pshete@nvidia.com>, <timestamp@lists.linux.dev>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Suneel Garapati <suneelg@nvidia.com>
Subject: [PATCH v2 0/3] Add Tegra264 HTE provider
Date: Wed, 8 Apr 2026 21:24:10 +0000
Message-ID: <20260408212413.217692-1-suneelg@nvidia.com>
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
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B372:EE_|SJ2PR12MB9140:EE_
X-MS-Office365-Filtering-Correlation-Id: 87034d80-7e8c-4210-4cb4-08de95b550cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|921020|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2VDJbeH2WDOT5DjC+cy9Uelm5WPviSC8rqyePIoh0vOBphCl6Y/vWJ2VUZfyzDo3Isjt63rcti9/EHGocNSUKHRFwHibgN3zSgne363UwQeomOWE7oH8lPT2+udHOATAfMRhJUjxn0WedWhACSDUg9C8vtxoz/SMVMplB4RM7J+M+nP05j+/pgILZtxESuFW2AWDlowuZk0DKE4ZdjjK3QUSvt0sXURGR9Jh/r5kNIkgzyaOYG+P4QgRniVWm4QAT6nAexrTWzcpd5hF83dUnrlOv7nTOzvVRbY675yLOE6Ojf9Mggx+O1CWLPBqJrQvpx9fGyvJN+55EUlT75jZ4RXEcRC+iHprkqcrVc8CzUhgPjpPwKTI4H2VSOEBFoYbbgaVMmdKZlVLb8K0cPE6au3o0VeZzypmDwUo9TTGJ9iSSAeDWR1+RQn7o8lAP5dJMOR2abknslpsMDxvc4Ks+uvIP9FR+0iTS8SNLT/ERlMcwSSCso68aCFqBkD45DK5Lfw3oiGR4yCt6b2dWvonY9sXJzS57n+kUR8lJue0TpmzT7Sh+0EGqvdIfJiEQjeh8o9T77NFIbsGzh5RzcBneuINFacvdYWyQgU6L6grDdSAHY+cSWbWbaH2apKLdLElhtqH+cnQMNfmcax1A7FM3xaHPsOeTfWUI45Ys8kIU5fE4c9XZ09l0u47ljerQys5GBGejN0fZ6SAka8J5ZI+B74HDNbK9VHMLOlox0ohVtxLxwN89pm2ovSIIJmXroVeyPI+nMbLG9cVs79BArw757TQKbJbURAMa3idTFvS8KI8BYr+2LaSeFHR5tBiefEmkDvOxQMy96YeiDjkyyFIfw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(921020)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Xsp/on7+gSZS9oxKuiT0w0U8aQT+/qD5FM/54YNx+XvkJLl/eJJ3/bNABgs684w1GWJW+k6MswnsZiMAQ2qTOyhp1JInsy6EMjVznvqldqnm/DHefHojtiK1GA/upJzMht05+QoBnupdDTYRCdCvbrINaw80+ZqmLi/OUPqaC0AGwX/7xJGPR3hkBekO2blCRJN+dXzWH0dZPf47vjtEQXW825m1rBxCRH/JY3Qwu4Pka8W1uauQfFNUf0HXYcGFXZ8DLz5ZV5/TbIf2aY2YjXg2qiFv7i3yelUnzyxAJR8SeuCucM4aPbQ00MFYn4g6tDJvi5FTqZ1kXYHyx/P4WV4vuyrQpUgG8faTUU7i11C6PJIlCZK0SlPQO40x4gZAP6F1xOHndVKyq/CIfAyUaDVrEux8rUBfW8uAaRbxkwF6jtxOzuffQ3iaICYzB67V
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 21:25:10.8753
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87034d80-7e8c-4210-4cb4-08de95b550cf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B372.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9140

This patch series mainly adds support for the Tegra264 HTE provider.
  - Update devicetree bindings to add Tegra264 support
  - Add support in driver for Tegra264 chip including new tsc clock
    parameters setup per SoC as values differ for Tegra264
  - Populate device-tree nodes for Tegra264 GTE instances
  - One of devicetree nodes has reference to gpio_aon node that is
    dependent on this series [1]

1 - https://patchwork.ozlabs.org/project/linux-gpio/patch/20260128085114.1137725-3-pshete@nvidia.com/

---
Changes in v2:
 - Devicetree bindings has nvidia,slices property deprecated for Tegra264

Suneel Garapati (3):
  dt-bindings: timestamp: Add Tegra264 support
  hte: tegra194: Add Tegra264 GTE support
  arm64: tegra: Add GTE nodes for Tegra264

 .../timestamp/nvidia,tegra194-hte.yaml        |  14 ++
 arch/arm64/boot/dts/nvidia/tegra264.dtsi      |  19 +++
 drivers/hte/hte-tegra194.c                    | 133 +++++++++++++++++-
 3 files changed, 161 insertions(+), 5 deletions(-)

-- 
2.34.1

