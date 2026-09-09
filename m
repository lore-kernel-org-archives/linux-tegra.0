Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012040.outbound.protection.outlook.com [52.101.48.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02F83A3816;
	Wed,  9 Sep 2026 09:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788947078; cv=fail; b=RD/UirxVQEGpzG+re3r1PzL43u2ppfSVTB93iGTEvjKi+jhmSYoAsxXB49++U7wfhL1qWJum9KKTOOdxQcZei0NA85TgS23NIIDVWz1TJrF2f/qalsVwcONXqipMumN3Kv4lHKCASNPFS7nQKfXhQ2BhbBpe8mr0ESuo+UH5Zt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788947078; c=relaxed/simple;
	bh=wNxcr851kY/Gm/1qejXUgOgsuClCFjTSi0FHeFAi05I=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=EkPW0gUBnVO498oI5DeTUYVeyyB4nYvBtPbkzUEnP18yu+jd6VqeI/tf6pnirZFZi3B3pColtPitfpKNbrAtZm51c3EkriORQe7BYOkmdoXkup3FROlCzL6vpB5oDyJ3vf6sE8tDvF9KgpIvx5dsn7NqB6841RB6+TsP6Y48Kf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=VJ7LGKoB; arc=fail smtp.client-ip=52.101.48.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="VJ7LGKoB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MLkFTTRV4GGZ+umEmqhH47DJVQan9ol9EnVaXaJIBugP2aChQZ0KfOyA7nEUhokSApEui+c546ZpywpAsN6iSUTjtrytIUphk2dJasQUZRWNusZeDr92rTtJegesjD2POHJfnqQKarXL99o7JEHjP1iofD9LIYvIwxiMWZ2fVqnHh3v7s4oQFg4THg7QGNpvHxxXk521TDHZeksfmR75n6wu+8n0iiCAaUZcODWZ86mg1t7i6KvXLEXXU6NWL87wCYhlxcTHnR/+riEW7OxcOiaFmCng1LfxXqyvsIQUfy0FyXLrJPG/MjYqnnsvDQpcID6ufgsQLgP8lYTO7IOzhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OWavlyhl3bRdBX+GzZ5lok6m4s7Vq+Mv6ofJZPkluRs=;
 b=tbfoSPrwBWKChJSzv3mJ1NMePp24G4FL2DOo0FraZwEjxq9op/cbV46bACy5rtpzg/DIqb2RkVCLxmOAFU5DOKAOZkwg1Fqw8pXY3sWp49dOxfmpuqulMl0esiss2RMlTXbldX1HPjvvaopDhOd6IgKu9MEoqg8wO80cWWGDktB39R3KvPrdGHcb4VRR9A1tT+D3QHpNX9Lga8JGC86LEw3UYfzKxLX/MxjDV2z0xoJqAcFcJidwhqmoWoQm89zQoBCzY/sBI3HO8sr0MKCe10WCxXYNHX1nS83MNeQtJP5hZOlVv8nR1PvvayYScB8WkvcpRkGyL+ZIp0gNAbo5yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OWavlyhl3bRdBX+GzZ5lok6m4s7Vq+Mv6ofJZPkluRs=;
 b=VJ7LGKoB0iAe3yP3bnNgrQTVUdld2kVAmhQ3rRnLAfWNdCsFlFK7d56eS/05fLhAYe81N6j/5c3l3dUtQkG2uZnWARfzIXvbyLon+gIZD0v7yTs4VnVzw4STGimJOi/yUceDaJNxeFD2PEhvt7LpjcVAr/UybaeSW/hfmXgl3J7i2xcKw29Tv+m6kxpJoN6helWb7zrWkiulv/Yxn61F3BgCP5no+16e0v5WxsUiZ/jktOgGo4k2KghCuwnOCmHUxdCI3Kgp30uiReHkFGINRHyhuZHQE6FcE1tj/FVcWOkRXvYOGHZ6Gahdu3mC3QFAnosHjm31Q43iAPPhW6kxcQ==
Received: from SJ0PR03CA0076.namprd03.prod.outlook.com (2603:10b6:a03:331::21)
 by SA5PPFCB4F033D6.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8e2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 09:44:31 +0000
Received: from CO1PEPF00012E64.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::24) by SJ0PR03CA0076.outlook.office365.com
 (2603:10b6:a03:331::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Wed, 9
 Sep 2026 09:44:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF00012E64.mail.protection.outlook.com (10.167.249.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 09:44:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 9 Sep
 2026 02:44:13 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 9 Sep
 2026 02:44:12 -0700
Received: from [127.0.1.1] (10.127.8.13) by mail.nvidia.com (10.129.68.7) with
 Microsoft SMTP Server id 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026
 02:44:08 -0700
From: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH 0/2] Add M-PHY support for NVIDIA Tegra264
Date: Wed, 9 Sep 2026 15:13:57 +0530
Message-ID: <20260909-tegra264-mphy-v1-0-ce61a80dc065@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF0qoWoC/yXMQQqAIBBA0avErBPUQqirRAvLsSbIQisK6e5ZL
 d/i/wgBPWGAOovg8aBAi0sQeQb9qN2AjEwySC4Vr3jFNhy8lqpk8zpezBZorLK6LKSA1KweLZ3
 fr2l/h72bsN/eCdz3AzbLdbtxAAAA
X-Change-ID: 20260909-tegra264-mphy-f3edf6fa4321
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter
	<jonathanh@nvidia.com>, Philipp Zabel <p.zabel@pengutronix.de>
CC: Thierry Reding <treding@nvidia.com>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Kartik Rajput <kkartik@nvidia.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788947048; l=858;
 i=kkartik@nvidia.com; s=20260909; h=from:subject:message-id;
 bh=wNxcr851kY/Gm/1qejXUgOgsuClCFjTSi0FHeFAi05I=;
 b=ElDkauiJKm43Eef96RrM8I4rNw+3tIfQMX35NHkdAbhqzbG0NbCu3aY0ZfC23fdSYdEKqPQSs
 4pvoLIPoVy5DX5C5uzDmxVOegy8pg2DRDc5gqw9p5Sf42RmhV12hSrT
X-Developer-Key: i=kkartik@nvidia.com; a=ed25519;
 pk=V+1YkJqxCruxUVxLXtAG3f5k8O5skT0X4/QIB75KZ64=
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E64:EE_|SA5PPFCB4F033D6:EE_
X-MS-Office365-Filtering-Correlation-Id: f3b43c7b-58fa-4f07-3205-08df0e56f2dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|23010399003|7416014|82310400026|1800799024|11063799006|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	IA3yxNvg+cwonmpHSehuc5eOS5jTaO2lSe74x8aCKTut2oydBRun4mUYXPLmmKGkBdf5tdP5SRhHRIUBd7ozXYm9lRfZEcfY7zyj7sO9WN5+0/PwIa9YLSg9qPlJ36vKWli+sPULdI4dTRkeoX81LL9l0p9AyeVS+FpULleivdQEHEvzH66ySg1eTqMrFThURNKMfOBd1VycEcbrQX6zdvG6c97MCr+2pVAi0WAxrQS3hz+DCF4QoeZtPN/0BjooIdxe6/VZk9exbgRVjFzNQBhioU5sc1xe2bi9dbkHZBDtbs6a7MgUI+4OjrlF1WeoOtn+eloo4NDHO8BI5GFhxp2B1eNL4v+lHdgSKxuHTzIW/ibmzhd3IptrpWys9+ItWkXoeHZTaM8f3joXllLUCVxtd647UPc+1qyuTpcc8L+i7cFDKTrFb2D7mWXZR7Gn+RrKT64jFcUMi4PUq1iGxi5QLQkTE2FA5JddpKCi6QxJPLAuNwk98rL6pAITrwcMiIx76iWACvw3d7k+WTIEHWK7zwAytFgK3WouxfCGpnV9bNqrZ6xZWdZqP+DW9rAMOIfkoS6zv1iSDMhR/cLj7BzDv109I0BDdh4Gal1fEvB7M2mnrr6G8wKgMj8Oy4zOuUqBQvkbe8eYVn05QIzIsxlPdNtPV+uYM5Ok2ahrLiDV9tezORMrWdnG5h+H694+CK2iS0XGMWA7nRIck6O9jg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(7416014)(82310400026)(1800799024)(11063799006)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	U2DRN3DJSaN/WLREkDtzByBMImSg8EjwW5hLaseYvPaRKnTWv0UuL0Sj0QYxwQ4zxkyPBu0bRw/BxLIMiT8HxPGU8hDf7/AVLt/ueErCWcfRY4ucFE/3kIik+4btgFGT6qZyAzog11w4GVq37S4BEPhERTxi+B7LP8/Gk5BmaNlF/iFcfCZRY3D4SsWjpqYpB0tj6wMiuN8ZZbj21cseBUmpd7ZeP1+syBR+k1yWH8f/w+nqK02gPx4cysDamWbnpncABejbUwQq0kLBBERx8hcunmyxMjiapOhtuRKHD64ZtWg7TnJzkGgvF0M6BRIeh36yA3pGARnQHs3RzD4WC3P93sefhNO5k05lJjB4btO1hO6MBhPHHMn+H7qfIBrDgBJHIBujDrIHB1FBozpiu2X6YZQsT0HGoMh4lIhqOXNtK5lx6pq6qQxqX8RpKIL/
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 09:44:31.2932
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3b43c7b-58fa-4f07-3205-08df0e56f2dd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E64.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFCB4F033D6

Add MIPI M-PHY support for NVIDIA Tegra264 SoCs. The M-PHY is a hardware
block with two lanes, l0 and l1, used by the Tegra264 UFS host
controller.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
Kartik Rajput (2):
      dt-bindings: phy: Add nvidia,tegra264-mphy
      phy: tegra: Add Tegra264 MPHY driver

 .../bindings/phy/nvidia,tegra264-mphy.yaml         | 108 +++++
 drivers/phy/tegra/Kconfig                          |  11 +
 drivers/phy/tegra/Makefile                         |   1 +
 drivers/phy/tegra/phy-tegra-mphy.c                 | 459 +++++++++++++++++++++
 include/dt-bindings/phy/nvidia,tegra264-mphy.h     |  12 +
 5 files changed, 591 insertions(+)
---
base-commit: a9d7ced84989ec05be09b4b8428759ef60450a0f
change-id: 20260909-tegra264-mphy-f3edf6fa4321

Best regards,
--  
Kartik Rajput <kkartik@nvidia.com>

