Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2070.outbound.protection.outlook.com [40.107.237.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BDC263898;
	Tue, 20 May 2025 09:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747732132; cv=fail; b=iGR/K0e9WixcML7/IzL6m8bTtIdxyVhcxvHA7Udl8gcz6bUXosnYDiTX1MT2Ymyvo6qCeCx6DFNCWzravjQCeedcrzAGRIGs3U07z7qosLLqltvVWBbJE+5VvBtwczsiyUjkOh1FSqnh0HpOtD2baV3w31ULCWuZdyf8477VgZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747732132; c=relaxed/simple;
	bh=oDXzUXN9wtsOpIrqEZ/BC5aeUt0qqJkG/gue3dNDDhc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hVfWVIl2dYnMAUF3ySBfLSmZsXTUabecu7QtqzueHQlXuus3r2arv9/d3xv9Z10TVywxmDqdcLrPoZgD8xe39Sna6byUEOzL9Yl8E1xy3TfIrVtRtK5O+2MrASEXlSIceqxW0lhD928M3qQAnpW7w6zzJ5mdM5jBbvdApchFW6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DWU/7BTm; arc=fail smtp.client-ip=40.107.237.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DWU/7BTm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0JzPAfw3s9uZ6vvzL29V/I8Q6oU6QeJnrHLC1O4Qi2uqP3V1VSr6jXgemn42YFQ/Ucb0SnxHWTr6Ft+6NYsfiQGovxdhRZSQibkj/62LYSr1wAKrzrGZk6FTvoLcjS2hxqVfwVS1wl9YdcQx1zcejl7uHzfx2nMIqX/DzrzYJocbyufaYeTzyIscrw2Y7jo4cBWR23fLaBhwIVtd68m/gS4tiuxz0zYKvuHdI4ym3xwgmECYxQynrAvLgOY4QEIoqp9zqIIYAsa6yyuncNf2D/T7HdXebpI/66Ks2ghjBKiYCiPhGUQI+C1/wB92BV75KAp+QIWhmp6rAYwwIgV2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4FwoIVpG8yq3P2IjeiZLktWibkgNPIiF15+ZPmBa8xE=;
 b=cw3V5e9e4RU2wixGaKb0VTA8BueK+bxxGuNP2LUgvSzlWW6frZSbOBC1zAM8oZD+lQpvm9Wcye/T4lTJT9Icx8wxouJwsESTFRh2cgc+WKNA9lWIaJ9/sAH/CV68ICy+OrTwfNvtmCRlybBsZgPOkr9XJiKAHlT1Iue5TgBZcQduzA2rBiyO6Ir4im1J3L8AU6Db7lmBQ02FC75RDkNN9lbUcJc9Ortyhki4X9K1yitYAT7OKCseZyUFUQyKzfCUXkdLFvAPrw0rBWDOjmMPnE3nInbTuO7fZnQnpMAwugI/Si2OIKumxtxsWw/ByD7V63n4ylLC5qdTmPMK3dAClQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4FwoIVpG8yq3P2IjeiZLktWibkgNPIiF15+ZPmBa8xE=;
 b=DWU/7BTmP1AY49JwZvnpYLfXlPYN75faD6+cbCPdtNJwtkycSRMYXzzaPBZ+hZcGmFG8HAwB/39oP7SVRscT/DZZJilUgwR/dtz3zT4IHGb9GhTv0I5+M8caXgar7zvCURoQcdiIY8W1LBhrZYv2lKr99YSM0Nqho++tMe5pRDW5cvR1piWofWZbyFYh+zC3D05qh9G+CBL9Ik4rkyQd6CFtJy/sx1PdIDj5cL2MewZuGHqpJeVehVKfl4IOpjjRtrXOAKdRwtBQFz4Femg++xsgXtpNy7aaryDxmZZe+2lXHQQafysh7t6sZrvfd2bavq7C2RfKxh7PwJG41uHEtQ==
Received: from CH2PR11CA0003.namprd11.prod.outlook.com (2603:10b6:610:54::13)
 by LV3PR12MB9094.namprd12.prod.outlook.com (2603:10b6:408:19e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Tue, 20 May
 2025 09:08:46 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::4) by CH2PR11CA0003.outlook.office365.com
 (2603:10b6:610:54::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Tue,
 20 May 2025 09:08:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Tue, 20 May 2025 09:08:46 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 20 May
 2025 02:08:34 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 20 May
 2025 02:08:34 -0700
Received: from build-shgarg-noble-20250422.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Tue, 20 May 2025 02:08:34 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: <jonathanh@nvidia.com>, <lee@kernel.org>, <robh@kernel.org>,
	<krzk@kernel.org>, <alexandre.belloni@bootlin.com>,
	<thierry.reding@gmail.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Shubhi Garg <shgarg@nvidia.com>
Subject: [PATCH V2 0/6] Add NVIDIA VRS PSEQ support
Date: Tue, 20 May 2025 09:08:26 +0000
Message-ID: <20250520090832.3564104-1-shgarg@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|LV3PR12MB9094:EE_
X-MS-Office365-Filtering-Correlation-Id: 96f54c8d-4e5c-4177-9a4c-08dd977ded5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VAGm7c6Uqqcn8zENPO7SlA0bO9pBck9s5BFwRCK+ZspxEA8Gujv9rx8BUUKG?=
 =?us-ascii?Q?5/L1PXj6WBVT1GVzbdxlQnS5X+vtSqEQS/HTuATVVbhg6sgif/F2nb397w1c?=
 =?us-ascii?Q?5tnxpRSB/yA77aQHsS+A6E5rytjyv4ytS+zLGS5YGSpPNIfzj30Ukyt+A8uu?=
 =?us-ascii?Q?zeIryDSaMJG1VXsHrivLSZ3eoA3d8kxA45U/4CYsSnsOtlfMpVxxdYX3BNCZ?=
 =?us-ascii?Q?a5A2TBERvF4ICO+Ks+BZPi0ZmrbJQ/+4mfr4oYDSfq8ByCEe26qWqV8CE3j7?=
 =?us-ascii?Q?FiYvnc8ZlZqlPqISoigJb2g1Y64VTvN1IqPB2/937kmTWzfcfo56OdoVAfjE?=
 =?us-ascii?Q?y3jYq3huTb0kVu73zN4zdgnMLW6dSxGa4xNFsp/JBPoKcQb1K6TyIdae7r/D?=
 =?us-ascii?Q?OpLJOg7aOhNXCsmuiDxcn9qqkkb2bbfGbtk2ST7Fk54dcaZ39QX5qqcSOsUh?=
 =?us-ascii?Q?XIZcI2ELferZkNyftHn0/KjcP1TETsiHRuqkZ2NCVpQepX7uyD+0IJHkyZuD?=
 =?us-ascii?Q?b6NqBsJeQ8wXCmO4jVsMHwzjZLG/Uv8zNLtQG/VyBAbGBERXIIaQTRb5lhx+?=
 =?us-ascii?Q?mYbKRrfIvSHtLPWmSQnmXcjOYUQA99VgKFeRsHA+VNVDroOfhqquzF7A9Ft2?=
 =?us-ascii?Q?IDzm2LX9YHyUQ7ml4+f9vYx2e0HZF/53t2QOu9eFu+cZfm+x6Dw6USQc3YHD?=
 =?us-ascii?Q?VvGuQcsmttFsqh8v4FAlnMORxARqdwvY94H7kHHxA18Wvgfae7c1w9nZq+QX?=
 =?us-ascii?Q?u84iIFazAsYH0WjAAS7v3QEdMx9AxfnKl7VjcHwgkD8cW/2GLKNDp0tPr6Sn?=
 =?us-ascii?Q?SsgnDP8M6KdkiwK6Cn8E6H0e8BWfz/tphfAuc7MGvMzuzl+dDOwB1aYO8+I7?=
 =?us-ascii?Q?o7gneliQ5U8yXdQJwfjGruYYKRBrrtYX//Vu5Im3LgbcFLwJDRsVAzNqMpLK?=
 =?us-ascii?Q?jm5NRMMWuvwT2odkq9swISkhstuhycHU9ViVDOhxSsH9qYUTLxypan4E5Fxz?=
 =?us-ascii?Q?2duKJ1BK1GCfTF/NCJst+y/MUhqORwzjE/VWEWj8Vmu9TOIdP04nwIz7GMnA?=
 =?us-ascii?Q?9gu4kuzbnrP9nUXWpQr3YQJd1LKqqLAYpYvuRK67ZMERwH/ADlnQE0dP0mgG?=
 =?us-ascii?Q?uzre21NK4z2g4NFDG8ayDjytdaSriEeyRMFI2BXK+s/K4OlMwvVkaQGfd15a?=
 =?us-ascii?Q?cdHsHBBWpB7Pd3VcRaOaJzhXuv0M9YxFQyga4DK90o/grv8TOIxFBu632no3?=
 =?us-ascii?Q?tx+olw1RPw+QAkUeL4kUibFXqJxUNDwmJb/rjtQiodLXZRB7hPGRON0ZBbLQ?=
 =?us-ascii?Q?o+ia/KpTmjRbdiWMmqosAgukZDK7erOzTMFAVLDrjZHLWmjCHt6SCjeRKisl?=
 =?us-ascii?Q?dK+gaV33CZ3ZRhHOHVwdxXgjdmx6Ck7DYAja05vLu5wr18VTMUL0HgTj5tlW?=
 =?us-ascii?Q?ZypNirSRUGb/nIlTTGKw+BezJ9CDzzXTTYDsUrdkJDxXhlFchfk2KvgE47i+?=
 =?us-ascii?Q?k4TfAhtxZ0QaAqA3hqkXjn57df+GpCUneTtM?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 09:08:46.3978
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96f54c8d-4e5c-4177-9a4c-08dd977ded5d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9094

This patch series adds support for NVIDIA's Voltage Regulator Specification
(VRS) Power Sequencer (PSEQ) controller. This controller includes a PSEQ
hardware block, that manages power sequencing and voltage regulation for
various components in the system. This controller also provides 32kHz RTC
support with backup battery for system timing.

The series includes:
- Device tree bindings for the VRS PSEQ controller
- MFD driver to handle the core functionality
- RTC driver for the PSEQ's real-time clock functionality
- Device tree nodes for Tegra234 platforms
- Configuration updates to enable the driver
- driver entry in MAINTAINERS

Changes since V1:
- fixed, copyrights, definitions and dtb node in dt-bindings
- removed unnecessary logs from MFD and RTC driver
- fixed RTC allocation and registration APIs
- removed unnecessary functions in RTC driver
- used rtc_lock/unlock in RTC irq handler
- added alias to assign VRS RTC as RTC0
- added driver entry in MAINTAINERS
- few other miinor changes done in driver

Shubhi Garg (6):
  dt-bindings: mfd: add bindings for NVIDIA VRS PSEQ
  arm64: tegra: Add device-tree node for NVVRS PSEQ
  mfd: nvvrs: add NVVRS PSEQ MFD driver
  rtc: nvvrs: add NVIDIA VRS PSEQ RTC device driver
  arm64: defconfig: enable NVIDIA VRS PSEQ
  MAINTAINERS: Add NVIDIA VRS PSEQ driver entry

 .../bindings/mfd/nvidia,vrs-pseq.yaml         |  60 +++
 MAINTAINERS                                   |   9 +
 .../arm64/boot/dts/nvidia/tegra234-p3701.dtsi |  11 +
 .../arm64/boot/dts/nvidia/tegra234-p3767.dtsi |  15 +
 arch/arm64/configs/defconfig                  |   2 +
 drivers/mfd/Kconfig                           |  12 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/nvidia-vrs-pseq.c                 | 270 +++++++++++
 drivers/rtc/Kconfig                           |  10 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-nvidia-vrs-pseq.c             | 456 ++++++++++++++++++
 include/linux/mfd/nvidia-vrs-pseq.h           | 127 +++++
 12 files changed, 974 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/nvidia,vrs-pseq.yaml
 create mode 100644 drivers/mfd/nvidia-vrs-pseq.c
 create mode 100644 drivers/rtc/rtc-nvidia-vrs-pseq.c
 create mode 100644 include/linux/mfd/nvidia-vrs-pseq.h

-- 
2.43.0

