Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2076.outbound.protection.outlook.com [40.107.220.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C69B14885D;
	Fri,  8 Aug 2025 06:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754636343; cv=fail; b=AZRHfuraIc0QjsjebZg1z7OjMkOOm2G9W1O4gNzHdpwZcO2Rg5VY4BiR8JvkLkXtu8dCkc6SeRiq2GAZwgI4h70UOC1v9ADfKFLewKqcfvO3IWqfwivd0jGYIKNZKZJe3MVmI+biXuFMMY7RXUjjPEYcSo9vXZoBVRMbdBJneXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754636343; c=relaxed/simple;
	bh=x7Q1NH1Z+0cwvulr2jB7F9UMZu0jTfX3xPgj/Vv+aMs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ipzpPMnnDftuuPk9G2rB8mlQiz96lPWagS2zzb1lq4E1YfUSV01tKE1TCKIl8OEUt1Bs0TxlPf7S47SgdXxOIxBYmkadWvJqt09b7kgDlOMZNFyKs/ODl2vrYSUzAqHw2CFs7aZg2at02GGzyTe0Q3f9ObDU7C8PO854XcYVSpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hww0ZkH1; arc=fail smtp.client-ip=40.107.220.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hww0ZkH1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s0u5eqNKnVl+0KgnZtPiUOMlsiJuCxJogl1+1zW9hD+S6r5w8P69fIXi+a7pOqUjGATHo2hePITza5dCf50ArO1wVjQWarBNCoG5xBHNZwg7t9E2sEJwWyFurf0DQ3NakJQM9Cnu2P4FGx1zAKm3Oxq13kvmJslnZNit16rp4seo+fRW8NU0BQlRy9ZNr13cKvDwVtvJ8UXEqNFY6ke5CjmoNbJSpdEC3f2Qs2FR2yLOwjiBYH/PGDOW7aNmnolDiM+F+Gr+FAv3zyI+fGItVvB5T1ETM6H3mMjoz0rHrfgTRiQJ8F1s1pU/Uvdn/tEKuADQ64P7ejEw4Ckh7jseqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AsacZYbPrTA/8JEzozA29vVI2ygdMyPMzX5wlJG8I7c=;
 b=OqoMLAiPabp5nRaWDADyYhkx0p9MPtuJHx01r3S3KD+zlyBfwEl4QcwL4e2u/S3U0NtU89Ppb29+FJzDkuHMgTIIodK0CHFR2+JHVmbstvAa0Drb3JTGAuYTGB5IKkz+TyOa3ebdhuFrNEYoGdtJZ+CcvaWFg/yVGH2bR+T6PW2fZQjc4bEYOdzA36zveLyD/yoVt0QGAC2y1Bpe5AxSdJpKElISCczfZnb1QrubdPR+TdwQornFuWMTanPlS1hkpE2A3OFIyy3DWoZkG1qNPp7si9jSajB0zMKtZG64S62dgP58Yj6f6nThT3WS9PCwICXa7aRrMn1skJ2B+S8Waw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AsacZYbPrTA/8JEzozA29vVI2ygdMyPMzX5wlJG8I7c=;
 b=hww0ZkH1BbE59+UF2kamTlWl63GRbFlKX3mHDUs9nz9fksn29mXNEFkhJBtsgGci3psu/GEFoICBfSFIWjdfkktcLwRjqLCtGAvx8Rcy4dQa3edE1hoJcUY3swJMRU92Rek+QTv2PxsiQlrCPrFGNRf56IeHARyd7ytt+kqfPIkOez7X9yHvgVBfNgs9laHnLGDMpUa1OYtltgua5av+Tqlw9eRfdjHrTccoPS6/S2b378IQlrouel67VY5E8japeFtH+Z9pno+RunbdIraxXhzJ4iI8PJHRN2oYVpzLqroDjXH+91BkWWQubryYqMzRSiPwzhf81qIJk7zRN2QnLw==
Received: from BYAPR07CA0067.namprd07.prod.outlook.com (2603:10b6:a03:60::44)
 by PH7PR12MB9075.namprd12.prod.outlook.com (2603:10b6:510:2f0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 06:58:58 +0000
Received: from CO1PEPF000066EC.namprd05.prod.outlook.com
 (2603:10b6:a03:60:cafe::fb) by BYAPR07CA0067.outlook.office365.com
 (2603:10b6:a03:60::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.16 via Frontend Transport; Fri,
 8 Aug 2025 06:58:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000066EC.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.8 via Frontend Transport; Fri, 8 Aug 2025 06:58:58 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Thu, 7 Aug
 2025 23:58:45 -0700
Received: from 553356c-lcelt.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 7 Aug 2025 23:58:40 -0700
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
Subject: [PATCH v2 0/4] Support USB wakeup function for Tegra234
Date: Fri, 8 Aug 2025 14:57:29 +0800
Message-ID: <20250808065733.347264-1-haotienh@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EC:EE_|PH7PR12MB9075:EE_
X-MS-Office365-Filtering-Correlation-Id: 3efd6fed-3a83-4847-0286-08ddd6490c2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yu2XldUMjcmUz6fQ06kE1zncXwgzB0apVwyPYNSh07Ko3ip6q83D3h7NPTAR?=
 =?us-ascii?Q?IUz07VUvJluC93QMpaWya+CDRZWssy+YvhC2QsYNsUPpJ4fKXm399SVhe2n4?=
 =?us-ascii?Q?JlN32JxZRbt6bk0Mm8PER/Q11IWCSeeSFPAp++e/nJM9Fr0ObI2L+X42gVuF?=
 =?us-ascii?Q?wV6B3I89yF3md5D3aYv2r0qIsEizN7Z3nvUsTD+HZj1oV6Sf9y046yzqHGBh?=
 =?us-ascii?Q?5jWYtK56xiq9kACpzK3hD7YElkfmRC69rGfKuYpDLFTtL8DYu1+ifqOleokJ?=
 =?us-ascii?Q?+SsZYU/agXezHeINjEDvamckvD0IuY4m8KUutjE3S8l9dFoBGP+GgyD+vIxr?=
 =?us-ascii?Q?aMuW79McQ+HAcnd1EoEXir5ZQ5sBErzS3R9R5SerT6swRHYo9dtX0iDDtJqs?=
 =?us-ascii?Q?0jEkNJdyYOrWwq63iEwAxMWnvW/cB+RQgSML6TjnE8xLfltrPiwUs4o/apfi?=
 =?us-ascii?Q?1TM4Zx1YMo6d4kmnh3FcBrDQVvAmj8ZCkMMZVDgAXqdYWRwvnAJilH4KW6ls?=
 =?us-ascii?Q?/HAEensf2PRPJJTVFBV35SssSL7jV9dRe9UpniYHSXKRu5vjJk+mXeV6Iq/W?=
 =?us-ascii?Q?AsSfB0I3NNShcVMhsjGn01GBpR0QHWrWrHVSert0cqBRk2STt/5xFnWVnLtI?=
 =?us-ascii?Q?ehkcZoJhHirbcdKZvKU9vJsrCgMVEA+21Gnpmw4Tl1Ba0YsVGHge2iYh6gs5?=
 =?us-ascii?Q?K824ycvkp/Zsno+51r6xvaLR3PJ55DXSb7Yefku3e3dpJt72dYMTM8AvcmdJ?=
 =?us-ascii?Q?w9QjDxEPx/W7nySE/xAhJXfkfd3p3a6metiNWiLlvTYJz90KWPSXwgzrSgMU?=
 =?us-ascii?Q?h7MKW41rJhm4GfZ000avzpttq0hx4LqTZqzQFyvjFjX/ohd+gEIt2TdPkkzh?=
 =?us-ascii?Q?H6OoX1S/WhBwPHEsQcNyNxvextZB8/ovtjaqAf5cZ3A9yrGjA66q2vAQwhWz?=
 =?us-ascii?Q?R4aiObCZdcxfBWeam3OZ+a8RfPM9stg6OUM/1BBdngdtvrtsAyfSEFaXFyjg?=
 =?us-ascii?Q?8xESYqoNuUlUxELbA5puV08PJcQh9JWD77/+jLuTO93QimBwKINN6vbSNoc+?=
 =?us-ascii?Q?9cS2Iio0oq1vpE2TaGtrg7FHDmJEzwiNVDz3za+kD2dYFcIj0CyCSW2VTwnE?=
 =?us-ascii?Q?zIwhhcbTcS+OOntYR1yFrZoTvJncBSPu6F7X02guSNb5RlXNnzN/iOEHo/xz?=
 =?us-ascii?Q?7VXXVsTso0Ppc+eEFwLIjFuQQUOe/GaIbyPQ8RGb56432rEINGgUJkzfxbBh?=
 =?us-ascii?Q?3n0KNFjJ73l/d4jQfFBdDN0woliutJZXShoJvGhUN/FloGZoU7gPdS3yzQ1y?=
 =?us-ascii?Q?9bwEWNa8Ela4fM1y7h18/pEpNMH/4UfexZ+grnp20mBuVlpu621S3PASR+Ya?=
 =?us-ascii?Q?Z6ibEiVO9pTYOAE0ycTbWLASJ3GixqQslojoySJPhqW84bZcsJI4FnDH7/nK?=
 =?us-ascii?Q?T/D89DVoFmrv4i10kKTxbe5NLTKJdHeN9UYbMpgCoamCP620c8AqTsFNVFxx?=
 =?us-ascii?Q?RTFLtS+wSDLZYufIZGrqneiiD5hNVmGxR1bApi5iYFsVjRTnM//Rxs0QDQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 06:58:58.0508
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3efd6fed-3a83-4847-0286-08ddd6490c2a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9075

This patch series enables USB wakeup for Tegra234.

Haotien Hsu (4):
  dt-bindings: usb: Add wake-up support for Tegra234 XUSB host
    controller
  arm64: tegra: Add interrupts for Tegra234 USB wake events
  soc/tegra: pmc: Add USB wake events for Tegra234
  usb: xhci: tegra: Support USB wakeup function for Tegra234

 .../bindings/usb/nvidia,tegra234-xusb.yaml    | 28 ++++++-
 arch/arm64/boot/dts/nvidia/tegra234.dtsi      | 11 ++-
 drivers/soc/tegra/pmc.c                       |  7 ++
 drivers/usb/host/xhci-tegra.c                 | 82 ++++++++++++++++++-
 4 files changed, 122 insertions(+), 6 deletions(-)

---
V1->V2
- Add the Acked-by tag to the commit message for patch 1.
- Fix the -Wunused-variable warning in xhci-tegra.c.
-- 
2.34.1

