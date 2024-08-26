Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FBD193435;
	Mon, 26 Aug 2024 16:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724690870; cv=fail; b=gIeEomu4JTzenyRcWTQEat05SYrOy4aOLU8yBaN5kXJxU0PQpUKLQKBkYL7PyiMtEzeLXK2RteOho4jB+MiVXRxdlThdhsGbbNIJXCpAXVYmTwNjoiiB9ZhMFrRzWVRg2BR1jzo4u2epoFq+Qk/lBPOzdrDxfX8dLTnlmMmVcB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724690870; c=relaxed/simple;
	bh=2Quiydt/8uUOhDthFYU4etnSsCIMEUeAd6zu5O0B6NA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=e/f2mxUXtjQeSNzO1rn+eOdEMZs3rS66cvMK7nwH++QyPQgPSUz5RMazgP4qpYiI1SSOzZSkhy1fvo6KX0dkP0nA3jDoyWqYVySOmqskW0QgMu2a+lc59UTEuO0kjbO4hDynMCNEy4Wji4czjI2eYMCWPa6Q24KyRNeGkDvT7o8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hhcXtxQT; arc=fail smtp.client-ip=40.107.92.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hhcXtxQT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eJzsisRQE8Umal6PRag9iR2lltd2nBoTxEQQGESnJOm6nYb1KHhtiMh4K8xpGa+LEK5XOu26m9iib+4XzXNtCgJhspjkJn/dGm6PIA+MiHMQwi7V8a3MDrAvMCPRtI5Hjesu0nbIuTJNF06EUdub6BOcw1TWcXb0nfhS05dsM2ra8uzMI3slpFNkIbIS9NaR9SRPDA3bk6+r8HdFy2GYpygLE41e0nNr+yLsMQkxAZxL16KWTIpkOO0FVXKhYab6nR0kvjb5QrVaQaw9wZFBy5EUx5Hp0by36MPjoo45Btz5wXLO92RWYHsyw9u+YZmgw7yknsTIEmQlfRQMbgyLyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0uFQvLtZWHdN2EmK3Za9U512DXx+yrc5S5zLSpgN64=;
 b=hdrm68BysRUwhyiR+lsAvTwi0q7ftSeWGtQRJM2CUfxDotaBR6MlTafC4jRdesMJiHFvhTZqRUKYNAh0h1ZW+LJ/WFXTJy/SHU8PQ4i9aFMDxD9jzQ0vRwWXoMQ44/AiOpGFDYzl0f0KoF/mq/kzBPPFTUv4IcC7N9/vu1eJmaOutJpa+fmvPr/g6E7GEREsfQqNs7OhywKTCbMBamuqM296mp+2hhbensfXEqdd2TH2Uv+QlHHRu8lnkXCVUG9Omotu+wrzmsQwfOnTZ4zyDMpuCEjG93yVoPTh0VatZgy1J0468aNqWzgOZ+dK3265l25IBcHqRDo8RHL+wDS1qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0uFQvLtZWHdN2EmK3Za9U512DXx+yrc5S5zLSpgN64=;
 b=hhcXtxQT4u86oaBibnafCeHbWZok+hEATsB2Fk25+l4CZ/quQpRmQOcbtvbIfDS0xUjkmRpF4wj4UO5+D7smTAsqidffZsQXqdmKkcpASSM2WQgM56gr8yDDOed2OWpMv+TDhmYtDzP77xxlnkT7iw+Py3PbrYsZDFI+yDeEfJgTsBghOvZbveYOO9oiV3AUGWD3iImNvMynzrPuLxA6TgPUmMHFufZKVzMuOW8vFSBvkbAHs93zwxxmzqA7W7PGnx2dsuVKssUdEqfC6GiE4v6xAvdJbRaOFNnZIaNuTFXrljpXMyXPbErRCe3qI5VHlS8IHofPfEcTH5HOetCFfQ==
Received: from BN9PR03CA0322.namprd03.prod.outlook.com (2603:10b6:408:112::27)
 by CH2PR12MB4149.namprd12.prod.outlook.com (2603:10b6:610:7c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Mon, 26 Aug
 2024 16:47:45 +0000
Received: from BN1PEPF0000468E.namprd05.prod.outlook.com
 (2603:10b6:408:112:cafe::59) by BN9PR03CA0322.outlook.office365.com
 (2603:10b6:408:112::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25 via Frontend
 Transport; Mon, 26 Aug 2024 16:47:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN1PEPF0000468E.mail.protection.outlook.com (10.167.243.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Mon, 26 Aug 2024 16:47:44 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 26 Aug
 2024 09:47:29 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Mon, 26 Aug 2024 09:47:29 -0700
Received: from build-dstotland-20240703T000904114.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.126.190.180) with Microsoft SMTP Server id 15.2.1544.4
 via Frontend Transport; Mon, 26 Aug 2024 09:47:29 -0700
From: Dara Stotland <dstotland@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
	<jonathanh@nvidia.com>, Brad Griffis <bgriffis@nvidia.com>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC: Dara Stotland <dstotland@nvidia.com>
Subject: [PATCH v2 0/7] Tegra234 AGX Orin DTS Updates
Date: Mon, 26 Aug 2024 16:47:18 +0000
Message-ID: <20240826164725.775199-1-dstotland@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468E:EE_|CH2PR12MB4149:EE_
X-MS-Office365-Filtering-Correlation-Id: 857fc633-8911-4cbc-fde8-08dcc5eecf25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bQBy2kCQN25brVjVrfdOXT2UJE/V/W/WgvCe/ALC2DpVaboRN2+0an1kkkxt?=
 =?us-ascii?Q?fFc+2BFaWiwh8drrDtgacz0RBh5mtc/C8KvPkWR240eNRll7nhLXOUF2zZrW?=
 =?us-ascii?Q?GqWEPVOhB8MjGo0VQ34tSnDhpR59bzqCM2ZPxYYuH6E6Mqy0oqi9dk4A3jrA?=
 =?us-ascii?Q?oi5+g4ilMEHUsBE3KWgbFqJ2LkVup8cTSeND/cEte8Gm+emrE9E5iB47uDbF?=
 =?us-ascii?Q?jyftHHCw6hK05jtSW+i+GS1Bb/UbKOLQFrNNr6YZLEywr106fBgziEEz4fvD?=
 =?us-ascii?Q?an17D6IgJOTcKxGPA9vk98NDFqy7nEkdCG3SdeuQM/CAsO7NZ+o6M/ku1kod?=
 =?us-ascii?Q?3KTvdLciCQYv6blovtpby8zyb2rtc271xWyBGglKyY8cNjG/laDthp9s/CBP?=
 =?us-ascii?Q?uzxfX+lmcCrS+UNksUxZUfeAQPjIWRp9Gq9/uEKDFOrzcOvI9m14vJyfBbA4?=
 =?us-ascii?Q?6r429apjiDr6C0IMsvb4U+Q6Y/8+Rv5MU5z9alxG8Ad14fN58JvvtMTJ1xQt?=
 =?us-ascii?Q?a+Gu33xkPIzw1V1qjIHqnpoua364/umRA5Je1oAdZhsxricNsuwHuH1z9CtH?=
 =?us-ascii?Q?g+OAkYeAIQuGH0AQL3CkLrgjbZPZUbB5URX065thy0uiqErzK1cPBMnNirPF?=
 =?us-ascii?Q?FBTpbTwpUyGk7csTTQWKiMX2keSo55G+Rxw4a+SPW2sfEiNFzw7kgv1n7VjP?=
 =?us-ascii?Q?Isml2X1IPyzaId0pY3X8mChs9Sb6A9glnAoYWLd3gfk4S555Pe4P0Ui1S8dK?=
 =?us-ascii?Q?WpFyJ7Y0tcIfCtjIe6QOhTj7UjyUehQedYBlYrsf3LFejU78NLU/RWUREOpq?=
 =?us-ascii?Q?7/V6gmS7ku2FhrnhQvXLPmS8sF+W4EKyl23c70tQeg4R0204s5kaXYAfjED+?=
 =?us-ascii?Q?QS2CrllYfTRr4epf/++mcYzkhLqAzrlASmj1VAXQpE7l25RpfNEpzy/IyOzh?=
 =?us-ascii?Q?BidhT5SohujPG6bZTJw6C44yuZHtIlGx5ZN2FypEv9poG4IfAgK9qxhRf4nJ?=
 =?us-ascii?Q?nyhaM87aeLgHaH7mex5unw1ezf1WYavStnmsusdVm4+Fgf3+maYDMCCrA20w?=
 =?us-ascii?Q?JIysjqg+NHZU2jgGSCQOEijTApNLS3s56AbVwqb7Esq0d5DNW/FPycjtra69?=
 =?us-ascii?Q?WjVsW/4wbwcO4ozIMb5mBOjqNe5n2p1d731IK18sKav1RtPfPNBfXuCdE0oQ?=
 =?us-ascii?Q?VJP9mIZR0JGMq7Z3kd8s7BjfJbqIuC9R/J+VcNhT4HONe0Ju15NDuzhx7A7V?=
 =?us-ascii?Q?j5E5AHSxNJsmDOt4aYxJDVvEJHPAMdvx9Jtm0DXLsoLo0bo+kDIRsprpAiMs?=
 =?us-ascii?Q?+VTVSduoFK5RfLkgrFyQ/RGpn58Fty8KyHp/X0kDeT9B/cmS5JTi2KR6Uuct?=
 =?us-ascii?Q?Ej1Z7hT2y52qmIZGHws/SN2X5rvZA2XqHBV2CJ7KuSG6rpb9QjCLFmu/g2pI?=
 =?us-ascii?Q?rsFysiYG2X89IyJFI7lHvNnDl2YmrT4k?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 16:47:44.5998
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 857fc633-8911-4cbc-fde8-08dcc5eecf25
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4149

This patchset restructures the AGX Orin device tree for improved
adaptability. It also fixes the placement of several nodes to be
in the proper files.

Changes in v2:
- Added "arm64: tegra: Add common nodes to AGX Orin module"
- Removed "arm64: tegra: Create SKU8 AGX Orin board file"

Dara Stotland (7):
  arm64: tegra: Add common nodes to AGX Orin module
  arm64: tegra: Combine AGX Orin board files
  arm64: tegra: Combine IGX Orin board files
  arm64: tegra: Move AGX Orin nodes to correct location
  arm64: tegra: Move padctl supply nodes to AGX Orin module
  arm64: tegra: Move BPMP nodes to AGX Orin module
  arm64: tegra: Add thermal nodes to AGX Orin SKU8

 .../boot/dts/nvidia/tegra234-p3701-0000.dtsi  | 135 ----------
 .../boot/dts/nvidia/tegra234-p3701-0008.dtsi  | 115 ++------
 .../arm64/boot/dts/nvidia/tegra234-p3701.dtsi | 125 +++++++++
 .../nvidia/tegra234-p3737-0000+p3701-0000.dts | 108 +++++++-
 .../boot/dts/nvidia/tegra234-p3737-0000.dtsi  |  90 -------
 .../nvidia/tegra234-p3740-0002+p3701-0008.dts | 230 +++++++++++++++-
 .../boot/dts/nvidia/tegra234-p3740-0002.dtsi  | 248 ------------------
 7 files changed, 476 insertions(+), 575 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi
 delete mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3740-0002.dtsi

-- 
2.17.1

