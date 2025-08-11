Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2082.outbound.protection.outlook.com [40.107.236.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968241DDC1B;
	Mon, 11 Aug 2025 07:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754898454; cv=fail; b=Zkzqmk042TywAC80okN70A3zFFMPzS+AL4UDhEdYiuaX2NjnQTTOIHNSqYrgzt97yG8qn1nehYdhHUcolP+KEL4qfvzKepeKJqHx8uySmHU1aQwMfkY0xA7/3/T0WxK6r6KUe/J4jnqMoD7BfbkFP2BljQOt+UkmhaWsgY5CoUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754898454; c=relaxed/simple;
	bh=0JSLnHLRqlTA4IKd2dqtIzkkYjOPSQwDpMmPEM0C+XE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Mc2kpmAD2OKFiEnWPyob5qjUEvUm0B9p/sDIlYvWfaYY0QFxUAA6jCVo9DnBLO+3FEtIzHl1iV4r4b6+9RZ2v4uaYkpyR78pFyKv7zDP35MkUzDSF1flL4AdjUG2u1WFXormaVOWjcBeFHjzTBIJmTj+LPGHf+5bHi6I+3kF35o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=C9I6iLjv; arc=fail smtp.client-ip=40.107.236.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="C9I6iLjv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r5JldcGWZcMsIIqbxvvcCqD9Mo0jBJu8mev8ZS3W9tq30+4U77JmshQ2QqRCNKDETQjnFqt+xOexLt+mBWn4EeAYpy7LCmr7RveZZpq6oFZwgRJSr8jXheyXAkufMaUMVi2e19hY8ryjcfpkm+gOtH0W5TKvxcd5SVAPZhj5eNk9g2r1WIJUUeaoyjolqrkA/Mm4Y/2h5fpigArUFyaTBh/t2s6/Ng5osNZtCox6aB1xjkTNySckCs6Yz+qNfv6ckgEYu95TL2JULEaQkEVsoKaYV97Q/SrC1u4eDH3ybqNkcOV70V5WQ2BRNOYsZC/H6FotsRSyucCr8FiKtj9vbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aR0o3bxJE/EgEN0oor6nUs6zRzGYRlriYqlEZFydyRk=;
 b=P60BKANX+PJJBsvo1rTY5kXEQ9ntJUSHlbe3pVHLb/YT57QROj2F4hXjVL2m0TcDoTPxvuGNgXHs/GIbS3Mx5YQUoOyXXo9F+B1sUaIQLRMIrnPFtREn/As/XOlDdXaxnsxuLbDIdKcDHIjvM9tQdbTs7g0w7GTuaOJUYryZvdQaZ1ZD1v/j5zYAIPd4AOr8iP0H+7xY8W3ArPz+8UVKEYVgQ09FNAodSNhYyLSdmaVkcOmNMJul+uMjBNQosY8n0WJHTeXV6gibYh+ZjNrAOf6fW1Zy8n6kL+KXh3tycfO+KkySxAwmTGG/eUlG5Z+j4YX1FH4Dt+UvP7/Kyj3tlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aR0o3bxJE/EgEN0oor6nUs6zRzGYRlriYqlEZFydyRk=;
 b=C9I6iLjv7hjSzWzCbLMMwUGYhr58DPAXMMqM9pAOVZIUkRIWgx13Sl9JB/JQqFm8jjnIgxSHULzMadAB7PyEFcyf8Jx46DIng3S8i5wLVtxuyHCOqvKF9fJR8refzOfwKG8/cO4sdSLEXvciTC0hblDG9Nved+UMMmsXCb/KJEe0vMgDlJ2RyzYyFD+ZPUazoKY2+I0sK2F45vRujRP3xWBNFishyquHmO72bvgW8UhGx+ZUMkphKFYcMF18QkDlFIS++THTKb+hE/ymOC87E0S9Hy5/naYYieEdx1YzHFNyITfIbtfwublSDQW2FZwDlN4LzHJ0PaUEFtYPNyekqA==
Received: from SN1PR12CA0052.namprd12.prod.outlook.com (2603:10b6:802:20::23)
 by SN7PR12MB8025.namprd12.prod.outlook.com (2603:10b6:806:340::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 07:47:28 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:802:20:cafe::1b) by SN1PR12CA0052.outlook.office365.com
 (2603:10b6:802:20::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.22 via Frontend Transport; Mon,
 11 Aug 2025 07:47:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9031.11 via Frontend Transport; Mon, 11 Aug 2025 07:47:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 11 Aug
 2025 00:47:09 -0700
Received: from 553356c-lcelt.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 11 Aug 2025 00:47:05 -0700
From: Haotien Hsu <haotienh@nvidia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, "Jonathan
 Hunter" <jonathanh@nvidia.com>, Mathias Nyman <mathias.nyman@intel.com>,
	"Brad Griffis" <bgriffis@nvidia.com>, Sumit Gupta <sumitg@nvidia.com>,
	"Vedant Deshpande" <vedantd@nvidia.com>, Akhil R <akhilrajeev@nvidia.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>, <linux-usb@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Haotien Hsu <haotienh@nvidia.com>, Henry Lin <henryl@nvidia.com>, "Jui
 Chang Kuo" <jckuo@nvidia.com>, Wayne Chang <waynec@nvidia.com>, WK Tsai
	<wtsai@nvidia.com>
Subject: [PATCH v3 0/4] Support USB wakeup function for Tegra234
Date: Mon, 11 Aug 2025 15:45:54 +0800
Message-ID: <20250811074558.1062048-1-haotienh@nvidia.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|SN7PR12MB8025:EE_
X-MS-Office365-Filtering-Correlation-Id: a132af42-1a5f-4ad3-6b2d-08ddd8ab5182
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xzbNT2LxfqM9+yyTEBOA+edY9cZpoKK0dLL3pwQCIYMX8vSD5aSBloHLmYxn?=
 =?us-ascii?Q?wjOsFHkez5/HsllUrQJPuhaxcYrW+46EDzuKLA2+TiwkkhYrDo3lwk0qfJ1E?=
 =?us-ascii?Q?36hQzSXxJVrYZPlqaTjL92suFF/J1jun6pmTYnox1XgnBZ7wy37IkaF6KSMq?=
 =?us-ascii?Q?WNnUlLTXXInaUu47mD3Ksm4V1zVlvF36h2Cgt0DPzyLR88/7uriuNYxdNqAr?=
 =?us-ascii?Q?IP29WGddanpiCdxeWzZMpohCEHkvoH5ZSVMnR+rb3Z4nMENL+YFpDa6hVrkg?=
 =?us-ascii?Q?A57bf9JdUYeqlxl6iE1nf61LzOFG3jCYFU0FDC5TLK2OwDlNr75FNK9EG1Qf?=
 =?us-ascii?Q?mGcsO+OoxddRCHbF9DMNy6IiKz7oyXA2pSjkDhv3E18Ogu5eVm8e4LERVSSX?=
 =?us-ascii?Q?idXbVeWruZltG9WqwULV8pBwbzqRMmLXMPmk9PVPMbMcyAryBtGzuS78E582?=
 =?us-ascii?Q?sSTx+j6bzkFDENqaYel0CDxfvGTazmEFjaWViRC0ciWThL5X5CcVF+kER0dL?=
 =?us-ascii?Q?Wmupnbsm8D3lDyjJpfrOguUB+StcaZ4xlHEZ9Ih7WMo6GN84NTGqOTOtZzzW?=
 =?us-ascii?Q?b5OgMlXaNU7mM54vlRB1jbJmr+PoyRsOY0PwZi/ycq11abmTWIKpnh66gF37?=
 =?us-ascii?Q?q6cq1quFYRXlNAS9bmi2tOm5jFhemdSc68RhET0sPTTgqrihtXRycB2iSHBz?=
 =?us-ascii?Q?l7Cw3bZqmsojvdAql+I2D3OMjWUPjNbLPAwgmzY2+m3AGI9ynP7q9O2H8uIY?=
 =?us-ascii?Q?krJw8mzVqBv/erRLrK/iDsWzRHnA8bXwWAud4GoI4IFzyqOtuavNQOFQTiP9?=
 =?us-ascii?Q?hJKiAsA8gPkB8/9t0v+ltzLc5MRyEz85NaYb87a4B8nXQdMnZmmEU/MAqug/?=
 =?us-ascii?Q?sm0aKu7yMtLb1ZdA6wWCQR35cirwTUS1/QtMChr0pbgyRpiGxfpnQOE7LfkU?=
 =?us-ascii?Q?dNkqvynX/X0iDr62IpwokfvQPwhU7YxCKIPxU8KTlQI0+IJT2LaKJKUZTB2I?=
 =?us-ascii?Q?VTmeSivk5AiajVVFpSaenzrU5aC7kvSMEPErURiaJrAYWwCSP4MSfb38JMTE?=
 =?us-ascii?Q?xoHosH674e4Gcs8V0Jvr8/R/kJT2w63g8AdQdBpWWmHQ15AKS6bvKWICn1/S?=
 =?us-ascii?Q?HD6A56RPvoahrMlAhaWd12CpraSc/lnFKjtgWfcSTKc6eM8u+79NjEB9T9qH?=
 =?us-ascii?Q?hgKiqj5zMQcqMPHDs/PhOgoB+4lMVKxcq+YqAIuws7g5kGcTEYBFgX+vlJAK?=
 =?us-ascii?Q?6GbR+b8MHZQwco7R25q7m70OCDuDSTAA+uNDwkPN9HjbCeFurrD+IaU/dYQL?=
 =?us-ascii?Q?03XITbnUaAlupIoYJUoYuZ9AzBkHD3UmeQE5YcvorTJCg+WetaOJnKKzj7KH?=
 =?us-ascii?Q?dVVYZj6hIvlda2fSyg8BlHbZLEH4ch/yo3xqTRQSQ0pBm9PcPS24sNhSMUMq?=
 =?us-ascii?Q?H85PAwMzK8gHFSDAEi++chNC8ZGHRcxWE3o7gxE/PUmwKtSjTOYZZkQmslek?=
 =?us-ascii?Q?Led9yADi3sFRky+3pC1uXpTTAk8bF9inmIN9bo17znI4HOPOgM3V7F2t1Q?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2025 07:47:27.3775
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a132af42-1a5f-4ad3-6b2d-08ddd8ab5182
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8025

This patch series enables USB wakeup for Tegra234.

Haotien Hsu (4):
  dt-bindings: usb: Add wake-up support for Tegra234 XUSB host
    controller
  arm64: tegra: Add interrupts for Tegra234 USB wake events
  soc/tegra: pmc: Add USB wake events for Tegra234
  usb: xhci: tegra: Support USB wakeup function for Tegra234

 .../bindings/usb/nvidia,tegra234-xusb.yaml    | 31 ++++++-
 arch/arm64/boot/dts/nvidia/tegra234.dtsi      | 11 ++-
 drivers/soc/tegra/pmc.c                       |  7 ++
 drivers/usb/host/xhci-tegra.c                 | 82 ++++++++++++++++++-
 4 files changed, 125 insertions(+), 6 deletions(-)

---
V1->V2
- Add the Acked-by tag to the commit message for patch 1.
- Fix the -Wunused-variable warning in xhci-tegra.c.
V2->V3
- Update nvidia,tegra234-xusb.yaml coding style
-- 
2.34.1

