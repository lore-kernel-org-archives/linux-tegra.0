Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2063.outbound.protection.outlook.com [40.107.102.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC864A3E;
	Fri, 30 May 2025 13:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748612075; cv=fail; b=FwGqdR8miREIsJJ0YjJ6js7C55XZWqy5OgyTnqUkK72XTTknCFp7MwO77FLPq27QCQ2LJgO0Ht/aQkIizsg+712Sh/qP6+eG1USSQ9FRPKA4y2v82uvbFw7UyrmNaYoUrNixwhF85kRDcPDfy4l8Ev7BaEnmam3I/4N2QMyBH8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748612075; c=relaxed/simple;
	bh=FOEz+JmGgIU8KbxSgfgfpd353Sjh4aICDLbxJb3ENVE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EM+/l5UujZrRksQdYQBacW2Mp53ejyL+KzCEl93Uhq6LLqIU8dulnUXFCHE2VQA4fG5ikPADOjiP7K0M0S4ONU5ojLfiCJBZ2/UCj7kAo8aaP/iIL9oqisiIIthe1DpI4ZLfOhf0IT1RtK/1kAaPMhXA3tvHszE6QsvLjJADlkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WGjpURN6; arc=fail smtp.client-ip=40.107.102.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WGjpURN6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F7tFzjbb6wXn7ylY2jkQzSeKGw8miOp2zQIj4aYPb0OFyt3XEPWlGG2CQKz9a8onbIpjlZq7Qbq/lmjOQmWKkK6Evw7tZTHObjv7AAq8iKW2IfLh1LXox7bUY1yVJkNTRYm4+sbuDj5jBeeGxxjyIYkI5xyRhGyRHu0+L1ogRHBQuXIQbMKfVG6vN5EgRACnTt5zLZtJPQ9+GmAw2x9Yli6qgGLDhK0SK6sX5jvtMN3qN923A0zaO9vpJu3fIjWDBk9n5HFgVY+DopXglSoVvj5NR1OIG/3l2fXA7792ua2fuUj6/svYUdCclEGFqVM8klJPMjHX1raDR4/Rti2L0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ilOZJZT7S7lJJUWZn7i4qJT0V7CL8j2t0gUv8Ii24No=;
 b=jwGitgwNA1G6xKcI//6HXYoxp3UEOO5M3e454MUrLn3oOlFemJ4c7dwLBZZFx+sY1qYq+2hybfTRtE/H7pFCpI4HpxIbeovaGDDsL3WV01ejFYvN21oDUMwHp10vEzs9wpMm7SlWq/BcfFQut24uhkeDjpffOugq96hdjHLSdRfvJxoyjUhKegqUynaRr+yqzdhWsKCEhUEdVNLPxvmJp8RvWjKxV7LZNrrVjDDYVtPnE/MmNhp5qVgq5FHVIb6/DXWEGzFWnIp1eA4GRrO6+xIBw+ZbbSNEfgnWM0QmbKNB08hSi/xN1gaBi0JWvf8DF+PRUSMbYSqTMm9tQjoFNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilOZJZT7S7lJJUWZn7i4qJT0V7CL8j2t0gUv8Ii24No=;
 b=WGjpURN6+sgm1g/uiqLqm0PoAwgBi+AVNYioibKm+ieS9CQOURL4l5csHiW7Nm2Fz2MvZuMyoGhNpYc/jTcZaf9LOhkGfvTX5VMNPI2dOGtM1hQNbZMXxOVXlO2Z9SMi5JaKrThTfwMwWJa880hmNKAqsbolrc2cNQ5z2Pt0tFs8AyWQ/mF0797OQx7n7b1TqNhDDrSQhySUOMrFjMYu4bHH/ji6Nexs8ljZ8n4M75vYLLVl/B8a51J23uJgu8l2HlEEPqZtyorf/Q3sJqVzZn7wQl8p8e4BkpWdS1CMB7s8A9XJgn3U82ErKDJBZN5c3VteD8mDqIS/Hoc/HCeGxQ==
Received: from DM6PR18CA0017.namprd18.prod.outlook.com (2603:10b6:5:15b::30)
 by CH2PR12MB4136.namprd12.prod.outlook.com (2603:10b6:610:a4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Fri, 30 May
 2025 13:34:30 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:5:15b:cafe::61) by DM6PR18CA0017.outlook.office365.com
 (2603:10b6:5:15b::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.32 via Frontend Transport; Fri,
 30 May 2025 13:34:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF0001709C.mail.protection.outlook.com (10.167.18.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.18 via Frontend Transport; Fri, 30 May 2025 13:34:30 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 30 May
 2025 06:34:12 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 30 May
 2025 06:34:11 -0700
Received: from sumitg-l4t.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Fri, 30 May 2025 06:34:08 -0700
From: Sumit Gupta <sumitg@nvidia.com>
To: <treding@nvidia.com>, <jonathanh@nvidia.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <--to=tbergstrom@nvidia.com>, <bbasu@nvidia.com>, <sumitg@nvidia.com>
Subject: [Patch 0/8] Support for Tegra264 and GB10 in CBB driver
Date: Fri, 30 May 2025 19:03:28 +0530
Message-ID: <20250530133336.1419971-1-sumitg@nvidia.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|CH2PR12MB4136:EE_
X-MS-Office365-Filtering-Correlation-Id: b4de6287-0a0d-431e-21b2-08dd9f7eb4f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CPRprjA93XPMywPvdc0RYygHj9XeitKECYK5mXyIEWRz6/b1M+7sD5tHlxni?=
 =?us-ascii?Q?ESSeMnXnKHFu0/S52/zTp2UQ9X/22WdogRNXsiMrKpC4YPmVkxMvMaSL3vsM?=
 =?us-ascii?Q?P/ondDJRpTHdUDtqXTmDv1QvfHRflevfo7+mFwKSC0ZW/H0FKH4BVigoAjVT?=
 =?us-ascii?Q?q4xaq0pPQgeM3ShbmEIa2m/W9UBiyC/BZHdQ63ir9YOd5p2TCWzkjFPhGanq?=
 =?us-ascii?Q?S1OOnxEr0Gfu5+JkesxJu9NM0FCHsO8Up+DZGCxb+kwkpglF3EEAOLzowJTu?=
 =?us-ascii?Q?C7H8JfLF/DTVy78y0ZSFh0QM+cOei8czoQ5wTStpjIyv4Dnzdp4rxZdE24pZ?=
 =?us-ascii?Q?KrgawiO07lVQdqHIyjHyao2H/n90B1+Anq8xG5K7+P+5VM/OirgYNNokUldk?=
 =?us-ascii?Q?fNfJg07hHy2CWhKujscpoxpSwY6oKX2NUqjrN3OTafruD8Z8LPqumn54/37I?=
 =?us-ascii?Q?IesVzMB9ySZGfTxdgdmCshynQgqEjFMaLVaZkQmcgtkIkj/Kn0osz/f7wJAU?=
 =?us-ascii?Q?wHm/vcKwVjW0tY+8RhdcHEPD6mPYWSi6tWihW26Cu+MrxBRlUxoZNRmOcvjP?=
 =?us-ascii?Q?0gp0WiVIB7ud8tIYptXRY8LrykuZhRWGa1VAql0r5Z421UgFWAsJfZteyMyY?=
 =?us-ascii?Q?SigdpGPNJ/+Dlte8jpa9AIxXYo0YtqgZ8KmiD7AYilPPhR8ucM/LGGZQo0XZ?=
 =?us-ascii?Q?ETyE5o6jdGuZ4/IC5F3MbukZ4BOn0rTe5kop43fbHYQ6nekD9wkelV1b28Mv?=
 =?us-ascii?Q?PoAQibHBwl7qjTAZkchu0flEKNHYflf6lYapzY3awfuOO1i6QPmWn+jqixTa?=
 =?us-ascii?Q?aFy1YmQd6MjRWLhFKWswev3C8VkRvRknaDU78nKnhao/9NsxgcQrNFhF1SbH?=
 =?us-ascii?Q?gFgzcoSrVL2Xz77DeEGTC6I8Vwa5Qky73AteBu8bSpJ7lBMQtAF0Rl65fdrr?=
 =?us-ascii?Q?06W3b6rwbSBlSl4SqnDf7nGLZ1ujiBVo9sRc7vQmVDfbbUDN9lNt4N9EOWBJ?=
 =?us-ascii?Q?4rHh5fPovFFY8zudK1DYrhASpwXp/av18MkT9W9ObCCJLU9MvucWshmjDpuv?=
 =?us-ascii?Q?voLuWsdsW+liIJpvlTWliyfHn5MlYKqAbIw2Z12up0HurMIxwWWD0mVgqzYy?=
 =?us-ascii?Q?Z26biJGj6AYw5EMLy3Krb3Bl1+HC5OIAZqzDcTlOu16iH16i/Hq0VdLGaiT/?=
 =?us-ascii?Q?z83c96Sdb4bWjI6mZIK2Ld0A15n4kIx5XsWOIV2KsF8EFimLGah2uzIYJG1R?=
 =?us-ascii?Q?IMTv9OEcG5KM+R28am/teXj9OUniUa3vzhjLvZ10cj0/CqZRyn4Vyc6PSM+Y?=
 =?us-ascii?Q?uRL+SVyDdXN/z76mC6aJOV7iljY3x9XirVBxZw9clVqMWitSZy7UNN5xm+k1?=
 =?us-ascii?Q?BLpOgDqLvaToYDgWXrA5Mvo8w2RW+OuG5gMqhNSdry8HILEmMYyGi8zx1+iS?=
 =?us-ascii?Q?j+64I5g6J2KmsZkqGb9uLb45MLsaQTB9SsWUuklQJ9qFASA/YD6wIaG6o3nS?=
 =?us-ascii?Q?JdWGHuyOH/nnn3Gr/MxSBa7Ay0ZrE16il37p?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 13:34:30.5810
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4de6287-0a0d-431e-21b2-08dd9f7eb4f7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4136

This patch series adds support for Tegar264 and GB10 SoCs in the
Tegra CBB driver. It also includes a fix and some improvements to
make the driver more generic to add new SoC support.

The patches can be applied in sequence. Patch info:
- Patch 1: Fix.
- Patch 2: Change lingo from 'Master/Slave' to 'Initiator/Target'.
- Patch 3 & 4: Improvements.
- Patch 5: New feature for HW lookup.
- Patch 6 & 7: Tegra264 SoC support.
- Patch 8: GB10 SoC support.

Sumit Gupta (8):
  soc: tegra: cbb: clear err force register with err status
  soc: tegra: cbb: change master-slave to initiator-target
  soc: tegra: cbb: make error interrupt enable and status per SoC
  soc: tegra: cbb: improve handling for per SoC fabric data
  soc: tegra: cbb: support hw lookup to get timed out target address
  dt-bindings: arm: tegra: Add NVIDIA Tegra264 CBB 2.0 binding
  soc: tegra: cbb: add support for cbb fabrics in Tegra264
  soc: tegra: cbb: add support for cbb fabrics in GB10

 .../arm/tegra/nvidia,tegra234-cbb.yaml        |   4 +
 drivers/soc/tegra/cbb/tegra194-cbb.c          |  34 +-
 drivers/soc/tegra/cbb/tegra234-cbb.c          | 758 ++++++++++++++----
 3 files changed, 606 insertions(+), 190 deletions(-)

-- 
2.25.1

