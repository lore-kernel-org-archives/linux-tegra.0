Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8D11A38F4;
	Tue, 10 Sep 2024 19:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725995141; cv=fail; b=Qlhmjpp5gkh7TQxLNRmee3WdgwKn5B/vgl50Ea7GJXPOur5mAL9erGSCLoxDR8rCid7In/11X8b9sYAMydzh6Uv0daCYEGNAtDCidVhu0Tc4RKshu1sdi9/jAOosUuRC6WESXTSPbM17T2Nar1sD1tDK5C7RuMHfLABAvmQLyFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725995141; c=relaxed/simple;
	bh=anTYvnkUtOgEeawcLbSWlLYhBfN7owT51AJ1yFvK/C4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SLOMMQiI1Lmrtw3wBQG069yVu+Ye9fFzKEWjgIclJpRy7YckdHOFynPFamIzRHqQ6KxlBVCsgByz2z/bnIVnBUVbg62eZET24Mo7DoKkkWXFS31M+IXDlmDlsukoQQlOQAAaMuKDMmeVsGAYmiN3TL0ufsUK4q4GaPK4hJHqb2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=J4n1YwqU; arc=fail smtp.client-ip=40.107.94.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="J4n1YwqU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bGLbAfWPjnGx72Pk9RA1hK7w2VOpuqkkJLG4vKjs30ALFxTXeSWy/Y9g7V6c6Xi/N6e9TlLlxl7q1VeXVgwTFmU+NNWMSOqPchrhN8ytJroE/eZo+UMg4ULCPGL8mY2ifoETfTr0A/drXDNbrGoCpgi2agY8Fkb/fGh0T8Yb2jAvmVIqVBxrY9fWqDoujhJLTGblOzS/uGwBJ9DcsMsE0C7P1ntP6L07wiuulvhj8k0/cYSrZlgYWjYecdB2u3OpVa7IkyeyBY3+ON4nAscqw/QqqB66DWDATWRYlnTeFiyfrAgcQDKHS+kLAAkZ8fYTIwMYshLwkYOqJSzmP/EYQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=virTzdIbhK74NYDRqcT6DQJYNIRaSAgN8ukf2MqExlw=;
 b=lvWrNwmQeluC9V9raDLEsUcC77MEblLvTftaByznr9M16yrLaHdYfbwU/1m0G/Mvnr25ZjZDWFEgtPJnUUbKup9ITmxOlUrB2tHTl4f8T37mGldX0bXGsilHmQ9zxdJbLaoh8kcRNnt5dOEY+/tftwwcsYkId0iSSRGVcKGeO74zV/ku3+WKaWwYvyfHbmfiN8glbTZRBO6pRs/HEQsmmz2qqMMfgjW17/OhgixUyQNKCUNpXO2RYBttlmqqsVQ09+K61B/9f4DizUzgzLP95nCgl2aJT8ovhz/4FL5nfqUG6Stw0MEfCCCX+itRr7HxiFV6r2SHgdKJbioVH9PB+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=virTzdIbhK74NYDRqcT6DQJYNIRaSAgN8ukf2MqExlw=;
 b=J4n1YwqUB82+72GhnhkpWgaABx/0ViKxSw5yBv/iO5z8wZNKofcCKHaIIRhKHOsadJALGk5VBazf8+KBOnFq6FrJeipK/QboHaA9ewSYhIZVclNOUmKo0wsF2EZhzdZZzH0vlOBs6diDeDHNFE/0VhTuyv5hMIuoTri6dMsmrAnlmPJPyq+BzWvV8OlhLtwGJ76UTgZ883IotJH53sjQH53sfDo+VMXpxVW014/KFDAzVmAWofS0Fkm8vvsxb2092SQDNqmAYzoOou2bNBu6yybpG9MIG9h6Xkdf5KurT3f3kR+HNUVbYWMIDDgkfpE7FlAGVS8JFRD/ybRU3EvKLA==
Received: from CH0PR03CA0438.namprd03.prod.outlook.com (2603:10b6:610:10e::14)
 by DM4PR12MB6253.namprd12.prod.outlook.com (2603:10b6:8:a6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Tue, 10 Sep
 2024 19:05:37 +0000
Received: from CH3PEPF0000000E.namprd04.prod.outlook.com
 (2603:10b6:610:10e:cafe::52) by CH0PR03CA0438.outlook.office365.com
 (2603:10b6:610:10e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Tue, 10 Sep 2024 19:05:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH3PEPF0000000E.mail.protection.outlook.com (10.167.244.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Tue, 10 Sep 2024 19:05:36 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 10 Sep
 2024 12:05:22 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 10 Sep
 2024 12:05:22 -0700
Received: from build-dstotland-20240703T000904114.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.4 via
 Frontend Transport; Tue, 10 Sep 2024 12:05:22 -0700
From: Dara Stotland <dstotland@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
	<jonathanh@nvidia.com>, Brad Griffis <bgriffis@nvidia.com>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>
CC: Dara Stotland <dstotland@nvidia.com>
Subject: [PATCH 0/2] Tegra234: Add AGX Orin SKU8 support
Date: Tue, 10 Sep 2024 19:04:55 +0000
Message-ID: <20240910190457.2154367-1-dstotland@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000E:EE_|DM4PR12MB6253:EE_
X-MS-Office365-Filtering-Correlation-Id: 12593f66-8891-40c2-a640-08dcd1cb8de8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+mZGi7CiWIOlMJKcobo0CQGkgn5cWRIaFf4PQK44QfuTPAua/xu1XaDxyf8i?=
 =?us-ascii?Q?KAwqxcZXyTa6FeMfkRb6JqJhLejphC4XedsOnsL/JEJBzM9wvja9QtHi3MdD?=
 =?us-ascii?Q?WIqsRTmMTfg9C466ZZTArRxV9i/8680dfwSIUGwKxGhYIyu2WtlE9zlfGxjZ?=
 =?us-ascii?Q?1JdvRl6D7pbVvMLH5Wf/Z0nkLykIX0N8xduP5C7YyupxjLZn2144lq1XbmDm?=
 =?us-ascii?Q?CMmJ/PQPmN285ctUSfdGt1IK/EROrlyDXvkFLcIkDeqmqeonfL23me2zbR6Z?=
 =?us-ascii?Q?awxxd0u97OPqdQCLbjuUqAibepcAFo2fJceCIXGRRqYcMFUoBWsFbtIojRge?=
 =?us-ascii?Q?sc1fdSYsoT4mgAjbmXoYKhLQJHRCCdckOl3s5xQ4A7BFr5MIz5RKTho3lvgy?=
 =?us-ascii?Q?jcxu5osf4VgE/QdVPiDDlaQZIqNcokoX5bpvtMXVjuRUBpJy5uw5i89gRkzF?=
 =?us-ascii?Q?fgk0xAEMd+BBp47Gof/dYtNQWPy8camPIRNHs+udf10zZ8EatVlcu+XDp8sI?=
 =?us-ascii?Q?p0s0iyYGS85eGMWScw8BoITRq41cjDrUW4x8Qz4+EHt/lbBp0uC/QIe4H0zi?=
 =?us-ascii?Q?DnO7l9XOMURpUCzDq4OI5cjmCWszNfgyq3txkYMK1pZw1uWRjebMIzgNx+sn?=
 =?us-ascii?Q?hFgYRUwIkLhayjgpxIyprfHVhbYzd8Sbapt7s8TmcDSa8CKx8XCIVR0lITUA?=
 =?us-ascii?Q?ZlP6mZHhfw0jQ4UKKDy2PnHUMXyrY/tPa5yzrgkwoFlznDz1zvM5+zAp7d9w?=
 =?us-ascii?Q?elZ3uBdz5E99TbZgfbFITboJ50fx0gNvnepP+a9h7zZ01QfLlAG4TG61NZvV?=
 =?us-ascii?Q?r71KJ4MtlUCJnVJpS4w3zOUKAmR74kyo0xj+bWw/bbQfRAdL3Q3SwHXZiBUo?=
 =?us-ascii?Q?6J+E74G2050V8r9t/B6PD6Mm+pDX+88V5Ig2xm3EDualLVPhBIdMdGGt/skF?=
 =?us-ascii?Q?WJTwF9F5gStNaKe5zefmVzx2oJDT3t0Vh7ehWt1GKqg1w3IPWc5gqDnPqRqx?=
 =?us-ascii?Q?M3YGiqfrgkQQ4ImvOQYLFA5lGfBKgMySdBpAifldzRHotAB74X9aj6bj1oDL?=
 =?us-ascii?Q?iPnRQLdLAUtp24Wr99dVeF3bU8PTOMKVY8OIt5r12Sb6HRYsVF+xV1hhyTE3?=
 =?us-ascii?Q?9B/3qo589xK6aq0AA8R4l6GOwIWhTuKl22YXOg895b6R7otfGfq26CCpp0nj?=
 =?us-ascii?Q?yvLtNJwkXxS/HB1sd50VnKnPzvPxDn8lOUUCWJSKpf3A+kVkhzwKf3pnp0R5?=
 =?us-ascii?Q?TkbGtIN3rlNl/y4LchGiDEWrlMplpV7AqKpT9ZuofzdSnrKDIIKShz7Kg4E9?=
 =?us-ascii?Q?yMfII6JfB2FEgY1ptJFupUC6i87PEFg33BqMXz1ZERQU3ZtmiEZgzQaYH+72?=
 =?us-ascii?Q?Q7ErsE57t9nCCUv2CWOI3lJOudyfxvD3OiHKwHMuyhh8i1pxmkOEtLPZr2Pl?=
 =?us-ascii?Q?M73EdKNi48CNjwkHKGcnmKd9Bfs6oSN+?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 19:05:36.7605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12593f66-8891-40c2-a640-08dcd1cb8de8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6253

This patchset adds support for the AGX Orin Industrial Module (SKU8)
in the AGX Orin Developer Kit.

Dara Stotland (2):
  dt-bindings: arm: Tegra234 Industrial Module
  arm64: tegra: Create SKU8 AGX Orin board file

 .../devicetree/bindings/arm/tegra.yaml        |   5 +
 arch/arm64/boot/dts/nvidia/Makefile           |   1 +
 .../nvidia/tegra234-p3737-0000+p3701-0000.dts | 544 +----------------
 .../nvidia/tegra234-p3737-0000+p3701-0008.dts |  11 +
 .../dts/nvidia/tegra234-p3737-0000+p3701.dtsi | 547 ++++++++++++++++++
 5 files changed, 566 insertions(+), 542 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0008.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701.dtsi

-- 
2.17.1

