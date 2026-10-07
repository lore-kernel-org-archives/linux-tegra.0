Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011065.outbound.protection.outlook.com [52.101.62.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B57E3655FD;
	Wed,  7 Oct 2026 14:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791384357; cv=fail; b=pVeJN6KPO6Fv83Rr/o3mOsaZSSKbEGFB0zvY4LuGGTMAhV0p8Qz2MsmQxQCKEEpy4J4eA0Vif2tYsmsh+1hgPQJXympUpgLYXV5d6LFlmKk4YcNJ3uICqYL8cWzvr8E/93shhwY1WrVu0B3ZbSm5iIsZKjFz7+YUD0zYhtS8vuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791384357; c=relaxed/simple;
	bh=vdOWwX0rlBRVzdFWmS0xLtmndnBMKZfypqWsENInNB8=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=UeZennhcSi6V2BOmEhINgbWwnOghbMGV2oSQvU2dVG9gGruvRm6MGYN8G3E3+F1/X0rFH2vVOin0TA5iJVjfgjnYyhadvP9zCuvx2E5/8l6SwCkJV1A+xYY2BFuvI3o38naMtlP+9EQ5M3oXHWVCl3tFuHF/dkXGVbu6W/6XANI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bYmQXA59; arc=fail smtp.client-ip=52.101.62.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bYmQXA59"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OaeCfxOzeTM6EOYeG1YwC95AURLzxH08Rb9kg7FOSCQBr/lvgmjQ7t6Hh/qts81R4MmLYRtRHpTmfi6tfjmCBZkZjM07kPkJhwnKr/44VKvhei6fQ+SIbwjbpNroUlm3E94yayRqZfMV7kXpobD2Dp6Qe9/+/tclw/j2O6rqgd/uShl4/BaOJlHpqlP/5JCLeOc+kOTFPPU/MEyjQDsv0ed1sbiePyqoo6DMoYoPei3Bem59ITo14gZnidZ6Z0J9SSoOxkOs7cit6jqxKiroFaFjtjK6GJglgmfM03OH52+w8TL3lwPtrJD1IE1gtrhFXUHclBjaAqzkT7QjMLyM+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GNOZ3yepgB2/oHu0qa69Ywclsk37blIYGjuiechT/pU=;
 b=NTMtInV3EmiMtAyMCS74nMZOt0Xev4rYi2mZ7cre18uzBF+ZbtV5xOzSAO+uUTPBBW8iJC6dKK7f5myhJspJvAVJ1EH5gsXfUPRTvPNbqn2x8LJzYtnnnM+Q6THpfExbHlQ8t8Ro97hIFT128ZWUDB67Pai09WSrO+OeVYU8ss8ukNXdkMqEoGRwiVrph2NH6oecleU/pvUHdCyTyy4UlR7a07J2m+wLdHKnsxoz6WRBb2J+9nQUzsslhDgJ1kgc5k/TrT7kTY0RkVuCNLW1GqL+EQSIxgKcLAYFcoayMC4LkrkLQOft5CRnMZHNyVAn07C3ozju2eZwDYfFfpxJZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GNOZ3yepgB2/oHu0qa69Ywclsk37blIYGjuiechT/pU=;
 b=bYmQXA59C1HNOXfYiFAcgm+z3928nav+f7FsPr6uOWz2o5SHUjk5JZ2QdUUn/ZdMVMmUX+Z+O72CXXHsMs7a3kbCktF63hgAGY09VoExOSiuxfa0QlqjxzpMopdUcKUf26qEOxJpO/9B+zA/sx1m5FvyjS/hGNUXCr9gIfThOTxaxhCtaH/NtU230acQU5MRPW9+xvicpN5Kn1vnuLM98z3Ec8rTcqBdj+CQVWq8C3ApmPezAz0X6Vue1kjD3H89TddMaCo2jJnI6mnKQOOlMTXMItrG67ZbKAwcHDBdA5YKUXL3JAJhE6FwWMXZtjk8OJGnhue1/aY9bYwTbfh3xQ==
Received: from PH0PR07CA0024.namprd07.prod.outlook.com (2603:10b6:510:5::29)
 by CH3PR12MB7521.namprd12.prod.outlook.com (2603:10b6:610:143::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Wed, 7 Oct
 2026 14:45:30 +0000
Received: from SJ1PEPF000037B4.namprd05.prod.outlook.com
 (2603:10b6:510:5:cafe::49) by PH0PR07CA0024.outlook.office365.com
 (2603:10b6:510:5::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 7
 Oct 2026 14:45:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF000037B4.mail.protection.outlook.com (10.167.244.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 14:45:30 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 7 Oct
 2026 07:44:57 -0700
Received: from [127.0.1.1] (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 7 Oct
 2026 07:44:53 -0700
From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH v3 0/3] phy: tegra: xusb: Add Tegra238 support
Date: Wed, 7 Oct 2026 15:44:40 +0100
Message-ID: <20261007-tegra-phy-v3-0-d501de414710@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANhaxmoC/1WNQQ6CMBBFr0K6tqbTQgFX3sO4KHQKXQjYYiMh3
 N2CRmX5fua9mYlHZ9GTUzITh8F623cRxCEhdau6BqnVkQlnXLISCjpi4xQd2omCBDCgs1QZReL
 94NDY59a6XN/s8P6IyfE3ttaPvZu2fwHW9ZPm8JcOQBktRCplZUqV1/rcBautOtb9jayZwL8qM
 LZTeVQFppmowFQ8h526LMsLsAcIyfMAAAA=
X-Change-ID: 20260918-tegra-phy-1611f1d54afa
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>, JC Kuo <jckuo@nvidia.com>
CC: Thierry Reding <thierry.reding@gmail.com>, Wayne Chang
	<waynec@nvidia.com>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Jon Hunter
	<jonathanh@nvidia.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037B4:EE_|CH3PR12MB7521:EE_
X-MS-Office365-Filtering-Correlation-Id: 437e6e0f-9b92-4823-7a88-08df2481a252
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|82310400026|376014|1800799024|36860700016|56012099006|10067099003|11063799006|13003099007|18002099003;
X-Microsoft-Antispam-Message-Info:
	bgMDnsLrUJDw9k3pJlj1C77MbzHwxATfcYtPb7Foo134Z86lMmGivv4Ja7+XSYh0d6Nl8nX89nvFpes8NzVJrAC88xDsmck7oQASzH2RjKToBs/QJR44T5WxxDTDgkDvGkW27rK0IF42uPkeeW5XxRNZLEqXpEY5+XqfeqHjJKToyWZsOlgXjJGd1hve2lOZW9x75EsY6nV7rSqbeu3z9SU9cfxy5bf62peRZ6Jlh6BhpPcQDbQ1y5MYfcXDPItaZhisNSBMmt2f27AKZDlZwV8Lx+kegDN6y+6b4+2dXltKxBxwLw/kRLPYAccKDbvu4tgkrXyCAqJczGpWq+Bj8f0bfyTyH11x8SCHQRYWRrJCG/6yBGR5+3M94o4IknpLnYUejNqvVD2P4nJJcn1HM/xgtMq5VD6+zefW/DdVLxYR1IgLJfpTgZLRh9imDu3X8mdPi8Y1qyZp1vsqGDAHcj/Q+67PlU25xmWNRy/F2uXbh8yviIm84aOOgv/jW3w/0xbQDY1oKmB+z/QiX9hL1U0p6ehKTbNBSgqDabKhuiKsD41CWFQHm1s7yd4k1L+pInBd+14cooR8CkYA58VI1HkkNVHuOpTPp5c3o5noM5vsWY5tf+H6Jzb9taYAusWPDuS/A1E6aXN8fQ44nBrawuZ9sIScCzpClP9U980HC8w14XSaPoSd/FV4hFMNWudbzMh0tFxv2NYfYPHq/Fe4lA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(82310400026)(376014)(1800799024)(36860700016)(56012099006)(10067099003)(11063799006)(13003099007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZVU/Xp5mFAaPMWH9WBULiYqPez0czZ07UofRC1rpYX5xX0XyN71dpeib/iOhYEvbqmmYL/IGr6IGf9zyaLvDtGwPfFn2kM0GxcI2UqMu/TsSWA4aiD7ZBi9euW4pmvuRflvkaAm6OVScVb4r0Wm0EUvot8ZcW8JB0XGB5EC8xKolQBdQq4P2L7DE53i+McBQBX6+EclCz2XKB5nzNrBmsIRTmjdmrRdEHG6k7XpycXhENumlyqoBHbMJwN6rbxtVBMGaJzM/+l9/Cs4yu8w3y88Y2NK3NWvelrc8oedLkFbigXUekhGWcx7Zvb3wbSAOsOkC6AFPLwQjH87lzyFDHc/ICRjcMbr7qttp80sE4wdUJd9VfTcDmVgi4NoJ3Bzaz/10aSSytL1bfzlQwNj+ycjD4YUJ22RgujABQsrVR1tmYdWJ5TZXFzPu7BS8HOSU
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 14:45:30.1257
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 437e6e0f-9b92-4823-7a88-08df2481a252
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7521

Add support for the Tegra238 device to the Tegra XUSB PHY driver and
add the necessary device-tree binding documentation for this device.

This series also includes a trivial clean-up patch to use the
dev_err_probe() function in the Tegra XUSB PHY driver instead of open
coding this function.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
Changes in v3:
- Fixed build issue reported by sashiko.
- Rebased on top of next-20261007 which now includes the dependent
  changes [0] and so applies cleanly.
- Link to v2: https://lore.kernel.org/r/20261001-tegra-phy-v2-0-3e453b1fb271@nvidia.com

Changes in v2:
- Dropped extra 'err' variable from patch that migrates to dev_err_probe
- Added Krzysztof's Reviewed-by for device-tree binding.
- Link to v1: https://patch.msgid.link/20260921-tegra-phy-v1-0-83466bf9a7cd@nvidia.com

[0] https://lore.kernel.org/linux-tegra/20260903071937.533646-1-waynec@nvidia.com/

---
Jon Hunter (3):
      dt-bindings: phy: tegra194: Add compatible for Tegra238
      phy: tegra: xusb: Use dev_err_probe()
      phy: tegra: Add support for Tegra238 XUSB pad controller

 .../bindings/phy/nvidia,tegra194-xusb-padctl.yaml  | 38 ++++++++++++++++++++++
 drivers/phy/tegra/Makefile                         |  1 +
 drivers/phy/tegra/xusb-tegra186.c                  | 29 +++++++++++++----
 drivers/phy/tegra/xusb.c                           | 14 ++++----
 drivers/phy/tegra/xusb.h                           |  3 ++
 5 files changed, 72 insertions(+), 13 deletions(-)
---
base-commit: b018686719706a781c45a874ed51374a2dc4b767
change-id: 20260918-tegra-phy-1611f1d54afa

Best regards,
--  
Jon Hunter <jonathanh@nvidia.com>

