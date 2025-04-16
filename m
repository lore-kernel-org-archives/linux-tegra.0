Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2054.outbound.protection.outlook.com [40.107.244.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34F624EA85;
	Wed, 16 Apr 2025 12:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805200; cv=fail; b=SVKnpsLS2OFuJKAy2GjfatG4/FlIbZrw3l1Cmqurpss86JVo9kdkl4NSxg5q0vi2yUwsxEimT15d5chkXPjOb9jPNSbimPxyh3DpfY1hdhrQaHPuUNSRmFLGaZqyUf4JmO1B4MNVx2TJ7vCW44T+587ov96RB1QN9v4DskariNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805200; c=relaxed/simple;
	bh=DzVgUQkHwmkilIqneQuH2avK65TrXIMYz2FYCfHesOQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ep1XWgvs6nvEe0WlE1D9rPFHK02SLwkh7OiNoD8ctGQRaIQDrdr8jXPTyH4908+yYByGSrwe40ghyh66tsk4SzS0vmewARqNwGAx0kNKuHAvgl1au5/kO/ar7fY1poBSgCi7xMaM0/tyiKgvyCScWTi+YNWyMxc7nmSbsXZchzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=l+kio0Xd; arc=fail smtp.client-ip=40.107.244.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="l+kio0Xd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nCfwUGSbMweQBLqvu5BZffzd6M7YizOApCoqbSufVB6Nyo67skzf3AKE4Eh73gR6Ezpz9CkUhcgpjAqtPvwZBZhsfLnGo5wnpD/lWVKpNgaTQwk5pXkxgtO9GFrl7aMOwZMjPuyirglzao5XYWUHphsrCRsi/Httb+Q6ZEYseAYhVJOrnG6Snh8fqB+PRiUjM2AsgOj9dZ8gP/ftlVyvHYRavYT3g+Ux9hd5/Zu+I3OZskDKHdnfbb+1ZyPOlYxdA8/PfLvAeQLof6q1wIZHCa3WIAi9gATuEynPhAvuIiv8t7rM1KhzhBF5N1BK9uBuVdQ4oUus6NtWdCIFZzZP6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nboUpHQADsVkYP6Yc+ILU63CARbrFLl+deONFhBcHdQ=;
 b=MoZciMOnLqO+YoQ+H8ypDKzzRd5rsUvwcjmDxNN9rx7LfkLX8LbtXqhHbi64tHOFo8pJBKPZmjld9pe+5w2xy57WmL6sLKp4dY7z+VU8GLHIbjN2C2w0o3+/JGYu7VjjLBR27rVhLxg/aHhXywKXDTy0NsRxr8OHFd/OJcdXOerv8GFnZWhk/9kDC5BzESIFrpHJMhTSe1nua/Jxrop8TfxKxT+whrcvay6CXTN+OaHnzJE59AULbmoCK9+/wFyTJg2PjZaJQaj3uOY2urRGPuymU1xBomxQwr6rYcMVEVGcQj49abnvzuDh8obgXsbvW0nO6C6lr4nHBk8tmYRAfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nboUpHQADsVkYP6Yc+ILU63CARbrFLl+deONFhBcHdQ=;
 b=l+kio0XdeeRGN9xPQkR5W35BXyNyHBnjtPvJBwkcaTrtrFyxBZH1Hm0mYno4slCOT46xbFoPWoSCoK+Gme5+zdiQMXWTG/UWNOMnrftIZrrvtybnB3tJafiP8/BQnTG/E8qzjtgyh2gQXPawJMHESq5UNHUoy02TgVXA3l9msLM1ReF/FwovMG6qs5HyqKe46rnU60DJtfbi4t0h2aFyhVq/ecvg9DoZoq9/0CdiooyZ1r/taSF+v4tsD7cxjILyygjPtWE8r9Sc/dBnXjXihcBrwOswSNEbqbkBNTqOfKc96WMpLXph6SZsx6DQnJ9I28FFiRU9HvjFC744JZqeeA==
Received: from BN0PR04CA0059.namprd04.prod.outlook.com (2603:10b6:408:e8::34)
 by SA1PR12MB8947.namprd12.prod.outlook.com (2603:10b6:806:386::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Wed, 16 Apr
 2025 12:06:35 +0000
Received: from MN1PEPF0000F0E1.namprd04.prod.outlook.com
 (2603:10b6:408:e8:cafe::53) by BN0PR04CA0059.outlook.office365.com
 (2603:10b6:408:e8::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.15 via Frontend Transport; Wed,
 16 Apr 2025 12:06:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MN1PEPF0000F0E1.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Wed, 16 Apr 2025 12:06:35 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 16 Apr
 2025 05:06:21 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 16 Apr
 2025 05:06:21 -0700
Received: from build-shgarg-focal-20241118.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Wed, 16 Apr 2025 05:06:21 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: <lee@kernel.org>, <alexandre.belloni@bootlin.com>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>
CC: <shgarg@nvidia.com>
Subject: [PATCH 0/5] Add NVIDIA VRS PSEQ support
Date: Wed, 16 Apr 2025 12:06:14 +0000
Message-ID: <20250416120619.483793-1-shgarg@nvidia.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E1:EE_|SA1PR12MB8947:EE_
X-MS-Office365-Filtering-Correlation-Id: 02c1ea57-0d67-4ae4-8277-08dd7cdf2286
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6EP9Jaq0W3/jkulIuAmP5e1rrwoJskME3eYM2I+h5RvfhmxjjwQYKh7olg1f?=
 =?us-ascii?Q?GAbA29aiub/LyaF1xkQWbfe8L6af4aFiPn3hZS2Dqx4wJCBDTKrGfvIkV4pF?=
 =?us-ascii?Q?RwjuhDKXVJWxe3d2gZioR5AI3m+ABNiUg0VhH8yJkrLf0dEXTXj7Vlkgglwg?=
 =?us-ascii?Q?7ydLOfrYlmSKN2oSo6jpk1mqQ4usOitkuMtKT0WdR9XPnlbueG9OG/P45dwD?=
 =?us-ascii?Q?41axUD/pM0TLCjFEVs2tAjBIheODi9aebEDrlz8WArkIhLKKmsXfA4xo9u/T?=
 =?us-ascii?Q?BZ9TXO+giVjWA1QeL7JnktnypBHVZnVCuoLfIeHIZss+mgm7lJCO47YEwTeh?=
 =?us-ascii?Q?Kn7enjPJzE3hVbivgXhpCvm0DjNSpeszLZC0wgrePylk0xWBqbDO3ciUU5e+?=
 =?us-ascii?Q?0nxZNs/Xxvc5B4q1CLNkz2KTdW+JYWj4gO7GRW81dj3YjR0XKbXILElZUFBB?=
 =?us-ascii?Q?pN984H+tuX3QdaMCfurj5Onq6nZgPBHRGww3I0/MMVhWzfnb1ZWvwNOHGDXD?=
 =?us-ascii?Q?5GstgosY/2eRnKeLb2C+mgK6agjWRdQUeewPVX3hFB9dSjgQWiekOej9lth1?=
 =?us-ascii?Q?IlVMs0w/a/pPM8Tnu8TT+eLjwqRQyKDpAwYh7WY/kv1fx988mhIkA1UcFyle?=
 =?us-ascii?Q?fqSwSn57cjzaSULBso15nweYdwV6FyxI2HKoCLr+255Yjizj5ugky3uxWmfS?=
 =?us-ascii?Q?MupXPObK+mNpKImLJgtLPTaZgAFyXBm6s/Xji+brlPnsVhDrfhFMI40ZQ3I/?=
 =?us-ascii?Q?FUakaRYBp65W3cLFhz2XCmKs2X5yADAi6ULGwIiZQmQYgTHpccJAnxSl+V7V?=
 =?us-ascii?Q?d2KVLAG30JNO5M89rvPwuQIgUQd6cy93J6j2Wrrv0WGuPI+KkCCwdCeHAE4/?=
 =?us-ascii?Q?/i1dwFJYGg2VImyU8qLC7fX6n3WQy2DohEjX4AB9HCZ3IdIrHQq8zdegfN7g?=
 =?us-ascii?Q?kwnxcldH95cW78uW9ASxcRnJlPXV8w0ft3zakzQSa9brf3U4r/epjvqb8PaN?=
 =?us-ascii?Q?bQkU/E3DqpZNFMxEUrchqAL/zEHEu7wEeapqNwL8UpqHPNBr1/oqy1DkTu4Q?=
 =?us-ascii?Q?VASjCGh5ThQE+hqjNLD1iB/Ehfvxhb1tKshM2E8N9u6Dg8qYPUOYeT2pYKC1?=
 =?us-ascii?Q?g2pILpmjdSS4n88kdArQxk3shKVvCpmQNbfcamcT2spFyjeTB6n5Sj49T7WF?=
 =?us-ascii?Q?zdtjESwvnWI7yPliWU09uzGUZFrqtra/jDaCNbZhPywKzXN1/70OK6k2TdE0?=
 =?us-ascii?Q?Pw1eHKXbi+b0B96PtxRF1RGkgJAeUGgcTDSDdWTT+zeHs8mPPXeTE1plNjq3?=
 =?us-ascii?Q?SwVnW5qbYg1yTUXZEKOAa8+U59+JVcQvvA2CMbqiTEj5trCsdvDejb1R0u2V?=
 =?us-ascii?Q?ArFuu8P6IZsNsKOa25LdV2rDvRxwZjBlLEP9HldHYttIdXtu6s4TGZpeDf4+?=
 =?us-ascii?Q?g+JwfMByItlqQbiwsg13npO0F8M+BTYkkrllkz13A6kN+j5M9RoF8NPyOzkn?=
 =?us-ascii?Q?MN0tBeqEwxR2rGJhgF2RPykJ2MdT63RFQlqH?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 12:06:35.3395
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02c1ea57-0d67-4ae4-8277-08dd7cdf2286
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8947

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

Shubhi Garg (5):
  dt-bindings: mfd: add bindings for NVIDIA VRS PSEQ
  arm64: tegra: Add device-tree node for NVVRS PSEQ
  mfd: nvvrs: add NVVRS PSEQ MFD driver
  rtc: nvvrs: add NVIDIA VRS PSEQ RTC device driver
  arm64: defconfig: enable NVIDIA VRS PSEQ

 .../bindings/mfd/nvidia,vrs-pseq.yaml         |  61 ++
 .../arm64/boot/dts/nvidia/tegra234-p3701.dtsi |  11 +
 .../arm64/boot/dts/nvidia/tegra234-p3767.dtsi |  17 +
 arch/arm64/configs/defconfig                  |   2 +
 drivers/mfd/Kconfig                           |  12 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/nvidia-vrs-pseq.c                 | 279 +++++++++
 drivers/rtc/Kconfig                           |  10 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-nvidia-vrs-pseq.c             | 559 ++++++++++++++++++
 include/linux/mfd/nvidia-vrs-pseq.h           | 127 ++++
 11 files changed, 1080 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/nvidia,vrs-pseq.yaml
 create mode 100644 drivers/mfd/nvidia-vrs-pseq.c
 create mode 100644 drivers/rtc/rtc-nvidia-vrs-pseq.c
 create mode 100644 include/linux/mfd/nvidia-vrs-pseq.h

-- 
2.25.1

