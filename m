Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010043.outbound.protection.outlook.com [40.93.198.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FF2377ABE;
	Thu,  3 Sep 2026 07:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788420001; cv=fail; b=l9RoW/yWVjGLJ/xb6VvKNf667QnjizrKvwldWDAigIyBJrWjawip/9YB/WCyEZlP1G8Z7ulnq7ZGDOnV5Zk88hSB7sVY/Dlrr+8ky4sLSQsYK5WbBtW5PblqymloDKSCQRQUB1PLlufZzF97B5PvpgblSJ/HYZ4FQZnWtvTfDsw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788420001; c=relaxed/simple;
	bh=pGJYnU1Q0CZgwBpwQVutt2RXZv7moyvE5uDLVXdmA8Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iPHIKxoryWreIBmm8rUO5P/fEqddMqAeJ5EJQDt+rsKi5fPKKcsmNMyJxTGk/BqgiU2gEpzp1SUL4nJW4J3f2LRzPdXNJkCUjWU/+SuDDDMQf1ySQFsw2dLOjYuEou7gz1fW9CQUHxMQFanrRaucyRPjBwUynr1AkAHIIGXANv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=srGT4TO+; arc=fail smtp.client-ip=40.93.198.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="srGT4TO+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ys88x8VxVzUbInFhFfx+DmE6BtLatQdYf0FPcBB+M+tCQAc6YX/Wnn5nM0otI0BRgF9fjRNFpY6YaJVmLtUUbzE6P0v88yeLed2OqCmqQSeOKJaU3waB23wkWJS6A9VmK9LpnY/hJYhBdFsvgP19MvcPL2+qj8H0EKeqEaoBF+7N3Q9epP7NTaVJOUnnA2MzqKTA+jCyltHofMi9sfnez0igvIQakdM5s/9sPu/xtRjpX2XwSVouEwi+rsGSHaSf8lK2fVsd9imp6/l8xd1x2d86on+lKd8JuauWSfZFUwOVOj8M1IJFVy8zD4bHoMPefNKJ0CaynPQdFy7Sjvf0Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/IA+1IJqgy8SIcM3avLaC6j48GeDROePxg5oLiPkbjA=;
 b=qP8y+g+ZQ68unV4G4Cm6WWTtV1+Tb/Gu6VdMfUB2/Mnil8Co9j2S4Xw5CeLsIZcYlAXnmyYITkjdhAJj2kempL7evUQmdusvKQxcPdkwsy1/8kmdvC4ad/N+whBP4QSLSF75gS/UYr0rg7chCpTIx6nHeREJZrmFswGy4qgsk24Zff2Kr7ZmHS0TjHFY4vJ7T/1rI+4WGvhaYao5HfpXdt2imA2XVwvGLswuFEnGK2MOsC/5Y55GD3t7vYqxKXffpELLuhPUcx/iELb3HMP2qiudxEe04IgMRfy10gdLaMBe+ns4NIkS5TpvfvHaYJvXGCSO1yR+xGxXTl5e1xXOFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/IA+1IJqgy8SIcM3avLaC6j48GeDROePxg5oLiPkbjA=;
 b=srGT4TO+hkg69VHTdF0TeFrRh0FXunn8Bij5PKxVRWHSDi0fdaYoytDk2wHPnndom3HrXujZKDGUU7VaQM9PbFGXWy3RkvMGMun69gtm/TPvfq1LH+UCPksfgASbOmI3M4i1hfD1h0eyRLXrYgMbaIqyDA+IPlstbSh9+/CWWyaa9NQabZ44ncNuiPB+sJ5fvg77gY+QAytlSZxg1ELAt4dCe+ZkVOXFLYP4TNBnXGieG5wb6oqKD4j9unV2T5Nlx9jT9lxwoYTjpVK+WcB8KOI5U490osFLQZzucTdUsK80gtjhWdZYZyHm8XmKJYdUHKSIX4U/kaHygmmOJJslOQ==
Received: from CH0PR03CA0039.namprd03.prod.outlook.com (2603:10b6:610:b3::14)
 by SJ2PR12MB7821.namprd12.prod.outlook.com (2603:10b6:a03:4d2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 07:19:53 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:610:b3:cafe::d) by CH0PR03CA0039.outlook.office365.com
 (2603:10b6:610:b3::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Thu, 3
 Sep 2026 07:19:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 07:19:53 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 3 Sep
 2026 00:19:42 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 00:19:41 -0700
Received: from waynec-Precision-5760.nvidia.com (10.127.8.13) by
 mail.nvidia.com (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.46
 via Frontend Transport; Thu, 3 Sep 2026 00:19:39 -0700
From: Wayne Chang <waynec@nvidia.com>
To: Vinod Koul <vkoul@kernel.org>, JC Kuo <jckuo@nvidia.com>, Thierry Reding
	<thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, Manivannan Sadhasivam
	<mani@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Wayne Chang
	<waynec@nvidia.com>
Subject: [PATCH V3 0/4] phy: tegra: xusb: Add Tegra264 support
Date: Thu, 3 Sep 2026 15:19:33 +0800
Message-ID: <20260903071937.533646-1-waynec@nvidia.com>
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
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|SJ2PR12MB7821:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ca342ff-5220-4940-a254-08df098bbfe3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|7416014|376014|6133799003|18002099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	lbtx72EK1WkFfkgLjGCevjP2SPsIgllBVOjcWbv9xvKGUHaEfPDxVd1f9YTYMQxRtEjGq+oJU6i0u1PyGvaa0JsG6MinQe2+Grgs4ZAI9hT19eD6IFCeUM5WC7BOpFho79Xt2URtl65cMyOl8vUczGAKY7dYFnkA1IyiSoKvgAPzTiEHKdJyrvVOcl4Q7PSnAp0D2VfHyRmUbAWQ5DMDprpK80aEb4M+bccZ9HOOmdzhDDyzTusH+1vhWDjyXU5qozERn8Cwk4AuBBjLDQBIlTV5i1mRZvH3+inOP7pO/SEi9+O7vRD+hcx23e8FU5bNLeeA439NEvG9y6Ir5jIa/LtYu3PFCkWH1It+pFZv5wD8Marky+/s1SDHK0fLBTJ9eCWSjXopGRaQCPMetpwDL9362zSHCSZ6PusyLL4pSA4vpFgXDVDnRVTtYfON1G/fFVPCjzeduTJP4PqIwMZ7cjc+vUgwH27CpbVcnDuSkm2FvYqFc8gwrOEeVQaO2XW0f5jSfuqP1lFi105P0b/1Ie3hZ3WpD1Wjfvb6gquX5G9I9svsHYlXVaWbEKnQTnqVD7ywhc8xa4EJ+iz+jxGtGSXlVTRWoHIGuvdzF8A9FA516v7d2fdlYoDYZEkJ6geU6ZGDE+A7DjPi5qjoHhMhXGX5EOPkYVIBDfD2C+4f0/2fiZUYXV6UNiE7EIKBYFmTo/WSbPZYNltJ2cKEx4mlLw==
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(7416014)(376014)(6133799003)(18002099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HJyJXDPa5C55oQWyvVFluQujNkS5pwCYGRnqV0lgng5Q5TAqVo62aV6UanwLqbfknfvcPe7wB4cqtXtwCbIrONRbYOJHr8dzRvVCJTwSxUYkiF3NPCssvQ4Jw7PUbHMBbdZuR5soZn67zqsj9UxvQlt2iqKjmMRcfqJYmoWpr6zTcvFMQu2gXKJYVWs6bBBg/B33yI74HAsSYtgZdNsFuFI0RSxuKZODzjalN5vgnQYni/IAnjs0aD3HpBEpnmaCf2esKrHk6uY6KHYLXNrUBRpfZspmz2b8p/GesVw6ErXixrNm/6A8dXCV12AcBZrggnTm4sjSJHHesdziwAg3zT+dmCJrQ5gABzfyS0u0whlNNOrC6/Ewzy8rCQHPIUxUlDoVYwxwCcrtwqX/RpiHsxL2Md5ms6HOk/1tG6IWA+5nNpoxRQyS+q3YH11BYjmf
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 07:19:53.2818
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ca342ff-5220-4940-a254-08df098bbfe3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7821

Add Tegra264 support to the Tegra XUSB PHY driver and its binding, as
part of enabling USB host functions on the Tegra264 Jetson AGX Thor
platform.

This series was previously posted as part of a single 8-patch series
covering phy, USB host and arm64 DTS changes together [1]. Per review
feedback, it has been split by subsystem so each maintainer can pick
up only what belongs to their tree:

- phy: tegra: xusb: this series (dt-bindings/phy + drivers/phy/tegra)
- usb: host: xhci-tegra + its dt-bindings/usb: separate series, to
  follow shortly (will reference this series once posted)
- arm64: tegra DTS enablement: separate series, to be sent once both
  of the above have landed, since it depends on both

Patch 1/4 (dt-bindings: phy) now spells out in the commit message why
Tegra264 needs its own compatible string instead of falling back to
nvidia,tegra234-xusb-padctl, per Conor's and Krzysztof's repeated
question on v1/v2.

[1] https://lore.kernel.org/linux-tegra/20260831185835.3732707-1-waynec@nvidia.com/

Sing-Han Chen (1):
  phy: tegra: xusb: Use devm_clk_get_optional to fetch USB2 tracking
    clock

Wayne Chang (3):
  dt-bindings: phy: tegra-xusb: Add support for Tegra264
  phy: tegra: xusb: Increase timeout for USB2_TRK_COMPLETED polling
  phy: tegra: xusb: Add Tegra264 support

 .../bindings/phy/nvidia,tegra194-xusb-padctl.yaml |  1 +
 drivers/phy/tegra/Makefile                        |  1 +
 drivers/phy/tegra/xusb-tegra186.c                 | 31 +++++++++++++++++++---
 drivers/phy/tegra/xusb.c                          |  6 +++++
 drivers/phy/tegra/xusb.h                          |  3 +++
 5 files changed, 39 insertions(+), 3 deletions(-)


base-commit: 940de590b839f71d6dc846160534bf202401b8b7
--
2.25.1

