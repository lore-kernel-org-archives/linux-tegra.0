Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B3624FC03;
	Wed, 16 Apr 2025 12:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805220; cv=fail; b=X3ztPqKfg4yaz+pt7LqLg+TnpEu471YUGZNrmYg+/EssxKxi2kW8mGcXSFVYmHIMsePbhS3NrB/X+jwqAvVGjzpwIu91/IcCh3qBZnsUsQ8LuvjtTVgOrSWluLcTmJBkHmHuxJ0zNtzdr6AJn7ZIdGD3uF5W3yOwR9UKq1H1Zbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805220; c=relaxed/simple;
	bh=bs/rsaXr4l1N0n4gY1pIQYq1fuWfaBHrJp+8R+FM+fo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XM2B2cMMogNcLUGvC+wPAVgO3iysIg0E/38h0jN4J4/28LRnwl2oX1REx25dj+KB1GqG0+krO5j1WrGkfH8z4o70VUskVkGfgkG22y635479fKHrtqtHKQ6WLvl88fRLtbIkmGeU6PhB+AQlnzW/ID9Dmjz56iO6hzRUmhasKSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Bh9mN4fN; arc=fail smtp.client-ip=40.107.223.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Bh9mN4fN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AeQsTUhcKP36OtpDaZLwYIfLUeMwICL3l7p9IcbesVLuwMmvqOTvETg48CvhOOp72rB7+Zlt9KXN8yr2bS8BNOe06oHrwSVmdHBlIOQdmPLwSs8Ac4LCoGf+FWNhojIHNCLOSgqr3XcrDDpQHPdis75/5D50URkx/vaSCwcypxJ/NKf0BCmZx2Z2cTzqt4ri1O5v2qfytTSFBqM8xU0xTgUHkAVL1i2a0pIceDyvFRtXFxCr94H9/u/NSl9gKIS3Vm8IWwzzQcb6NYHSe2esNyDXzpKsoIMqTCVCX1i3X2GMArCpB2Do2WfU42mg4Ta+lfeBvGk2R/1zdckuwfol5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oi0gcg6u7ktlg5BRWYsbcTfEZkEdDsMnNh8+hHM3s+4=;
 b=y8MgNERAwez8Q7sK26TjzQJH6MMv57okt9kEP5dYq0TIpDQXr+6ANbtVMsgCWnSbpab1dWXY0y2gX7h8x4n5K3JkeyNsbOPJgMk6DYUUanGuWtqGglTpfJ0Wsv2mo0zdcuU0mq+Z+2nhk+cngaAuT5CVcwtNv+cKvsPdO0rYvSuoN5iNisJYcZ2igWeaeO+4E3iVj1J8fOowVK39ROjiURZkr/5f+TjfSK/PbkiHFp5ttZrcZd/FsOexK2Sp2fHdR54butVV5xuagQqDrwUNzv0UUG5PefYNCHwxUylt9xpdC44SS7fr7RPd+58FJKq8on8uZt+I9+EltpwkV0FwwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oi0gcg6u7ktlg5BRWYsbcTfEZkEdDsMnNh8+hHM3s+4=;
 b=Bh9mN4fN+B9QmC14sXuz/jtcYIfzxDAQFMyjKCJuXHlVpPefgxf0A9XcFopSuasdChXaWHJTBqqHtaGqRJdAZti+PVvmzvnNe5uvXcLn421GPi3xmkVyt846xuXKLEidwx8lYvungi+I3BwH3FgEOIGe3ZlvJSMGXBfBPck12+E28ZCevbFPA5CxUobXDasNvsPTzPhp+MXWEkNHv6lL5rTRfI8IpqW+gtdnftz4uMzXJyS/9OCQ7Pmj+FyKnPy+e53E5kJgikdW7ofUPuSFFi/et0DcP/FASYM31kJfmqvEo9rgMfpBnIbLz0zkVcu1AewqTFhMG6vQFcB+bX+QIA==
Received: from BN9P223CA0019.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::24)
 by IA0PR12MB8226.namprd12.prod.outlook.com (2603:10b6:208:403::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Wed, 16 Apr
 2025 12:06:48 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:408:10b:cafe::8f) by BN9P223CA0019.outlook.office365.com
 (2603:10b6:408:10b::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.36 via Frontend Transport; Wed,
 16 Apr 2025 12:06:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Wed, 16 Apr 2025 12:06:48 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 16 Apr
 2025 05:06:31 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 16 Apr
 2025 05:06:30 -0700
Received: from build-shgarg-focal-20241118.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Wed, 16 Apr 2025 05:06:30 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: <lee@kernel.org>, <alexandre.belloni@bootlin.com>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>
CC: <shgarg@nvidia.com>
Subject: [PATCH 3/5] mfd: nvvrs: add NVVRS PSEQ MFD driver
Date: Wed, 16 Apr 2025 12:06:17 +0000
Message-ID: <20250416120619.483793-4-shgarg@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250416120619.483793-1-shgarg@nvidia.com>
References: <20250416120619.483793-1-shgarg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|IA0PR12MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ebf51c9-672b-489c-13c6-08dd7cdf2a30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gZ7yHJRyOJDkQkczubSHRNM5hDPFeIsm6YOyngZ2mF/L7a9sLbTlPxM7QrfR?=
 =?us-ascii?Q?5g0R1wSdyXV7EDNetsjMdS07QBtI98xjd5oMQ+Xi0M1EUo3ZVROB16a7ClqZ?=
 =?us-ascii?Q?x0Fmre1Pcnrk5J3+8kepLb1TT9CKCVqYCpVDW+9GRQUz9FqrOA7Tkvqj8Pn0?=
 =?us-ascii?Q?RMPoyWPZf1bh4j2DxJR1bRUfKk4nMYFBCc1ugD8TIXQPJ5gRyce0TBcGHf37?=
 =?us-ascii?Q?I9y8mrIv7Giww4a9aopFojVokrcMPTfs1O/QuN3TY+AVJgabXibElnxUo/6e?=
 =?us-ascii?Q?z/4MjRz+xv9sKyplKW021m4zu0qnkl9d8ai0iHH3oHPUdbagTP30gBEawny+?=
 =?us-ascii?Q?rIIvHJIYF2CXySIRGBnFnLSHutmdNxS8ftdHhfkO5jYGQvnjAl3jHjHxe7cb?=
 =?us-ascii?Q?cC0UneYZmy1udl+1eBUiHrSPZ1G3ynwpDPbJwFFaMgvezg+voT4QnLHALBVk?=
 =?us-ascii?Q?iIQwlIM0ICNuv7PqvIbWz2Ja1zJGvA1w0sUoIK+nvbdpKRMr6vGG5P+14J6f?=
 =?us-ascii?Q?PU5xHbWKEq9V4Htq5zHYtjhyncn9pxeyPmojt/R0UeHMan/UeQ43wMH/3My0?=
 =?us-ascii?Q?M1imorBLSdqi+N1IuKg3NzWrfMvcYw2XD+A+KTYdbVjozklBilRzHUHg4RXp?=
 =?us-ascii?Q?mzd9Cr5Dm8VkHrEQ8Utm8bPd5gIof1DVWLyGHsfD0NQqEFC/py4ulf5byHFP?=
 =?us-ascii?Q?oCrxrewVewHmKwnVGV7O8n1nd/EFaM1Uyu6+OATV7+WYmuSFuKIXg7hc9MpT?=
 =?us-ascii?Q?gqhiDXcGV/2LPrPepsFQ0pjGwi3nWEF2xG+FoBVzvbVLCtnTFFvgzs5Is1EY?=
 =?us-ascii?Q?nfjlbMFx4BdABRxsaqZ4vwuElltEWDbh7MUX7HGvLtbK+FbugcRYq4kiYPOr?=
 =?us-ascii?Q?4GE6V8TbBCwVqf85KRG7AqVdec8P1mr9DDL6R1ITG2gf5pC0p/1zEsY6Zooy?=
 =?us-ascii?Q?8sfGo6ed8h7PzRSkaOUPwGlvZ1byrZJl5Pz6jlqZUe57Dy+h7dkbkz85a7Y8?=
 =?us-ascii?Q?22ASRaxwJ8DNBQiydwJuoMXh29dU9F5BWl4vrElZKu/0KB6gtAzdz3XwniP1?=
 =?us-ascii?Q?qTQ5gQZ3Yv3McpaBXaWNhh0vtbJk4SO5YPFtAV/xNmfBma5E5coJ2op50dmz?=
 =?us-ascii?Q?lIchQs3kSmODkFwZXEk/Y4n51Y7yvWIW50nTqXiExY58erKrDBqAX6QHzcHO?=
 =?us-ascii?Q?lDpkfayJBJwEKxyJpuXoZWvvRbxRQUJjjd08pZKRa3lTVZ7sdX1FKxpWjfMA?=
 =?us-ascii?Q?HhGHnbli3GqcumWUgva3Tmf52s/1cLTzYehZRWTeD+X8XwFLkB+oAE2td/jb?=
 =?us-ascii?Q?EAK+MfuaQ1UHbTzFj5whHelIMmzxloEjkrPdIT4mcvFMla7gTbdqWEzuz7sn?=
 =?us-ascii?Q?3HzLhtex6PEAx+uW6uXGXdAMRjb9eD3x4loPbbTXrNxqJHAealQYaIBrzjR+?=
 =?us-ascii?Q?gnrV9b0OAApcJb6Ad0uckNEWaR1/wrD2NbptkdAZYLAATOvGD39XLCO2jlo4?=
 =?us-ascii?Q?JDPwmvzQO05c3vEBxC9ewFHj/H7vcNrR+Cmp?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 12:06:48.1948
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ebf51c9-672b-489c-13c6-08dd7cdf2a30
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8226

Add support for NVIDIA VRS (Voltage Regulator Specification) power
sequencer device driver. This driver manages ON/OFF and suspend/resume
power sequencing of system power rails for NVIDIA Tegra234 SoC. It also
provides 32kHz RTC clock support with backup battery for system timing.

Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
---
 drivers/mfd/Kconfig                 |  12 ++
 drivers/mfd/Makefile                |   1 +
 drivers/mfd/nvidia-vrs-pseq.c       | 279 ++++++++++++++++++++++++++++
 include/linux/mfd/nvidia-vrs-pseq.h | 127 +++++++++++++
 4 files changed, 419 insertions(+)
 create mode 100644 drivers/mfd/nvidia-vrs-pseq.c
 create mode 100644 include/linux/mfd/nvidia-vrs-pseq.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 22b936310039..b7357ff398f2 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1396,6 +1396,18 @@ config MFD_SC27XX_PMIC
 	  This driver provides common support for accessing the SC27xx PMICs,
 	  and it also adds the irq_chip parts for handling the PMIC chip events.
 
+config MFD_NVVRS_PSEQ
+	tristate "NVIDIA Voltage Regulator Specification Power Sequencer"
+	depends on I2C=y
+	select MFD_CORE
+	select REGMAP_I2C
+	select REGMAP_IRQ
+	help
+	  Say Y here to add support for NVIDIA Voltage Regulator Specification
+	  Power Sequencer. NVVRS_PSEQ supports ON/OFF, suspend/resume sequence of
+	  system power rails. It provides 32kHz RTC clock support with backup
+	  battery for system timing.
+
 config RZ_MTU3
 	tristate "Renesas RZ/G2L MTU3a core driver"
 	depends on (ARCH_RZG2L && OF) || COMPILE_TEST
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 948cbdf42a18..93bb2c34e341 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -182,6 +182,7 @@ obj-$(CONFIG_MFD_MT6360)	+= mt6360-core.o
 obj-$(CONFIG_MFD_MT6370)	+= mt6370.o
 mt6397-objs			:= mt6397-core.o mt6397-irq.o mt6358-irq.o
 obj-$(CONFIG_MFD_MT6397)	+= mt6397.o
+obj-$(CONFIG_MFD_NVVRS_PSEQ)    += nvidia-vrs-pseq.o
 
 obj-$(CONFIG_RZ_MTU3)		+= rz-mtu3.o
 obj-$(CONFIG_ABX500_CORE)	+= abx500-core.o
diff --git a/drivers/mfd/nvidia-vrs-pseq.c b/drivers/mfd/nvidia-vrs-pseq.c
new file mode 100644
index 000000000000..c93730168dcb
--- /dev/null
+++ b/drivers/mfd/nvidia-vrs-pseq.c
@@ -0,0 +1,279 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// SPDX-FileCopyrightText: Copyright (c) 2025 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+// NVIDIA VRS Power Sequencer driver.
+
+#include <linux/i2c.h>
+#include <linux/interrupt.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/nvidia-vrs-pseq.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/err.h>
+
+static const struct resource rtc_resources[] = {
+	DEFINE_RES_IRQ(NVVRS_PSEQ_INT_SRC1_RTC),
+};
+
+static const struct regmap_irq nvvrs_pseq_irqs[] = {
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC1_RSTIRQ, 0, NVVRS_PSEQ_INT_SRC1_RSTIRQ_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC1_OSC, 0, NVVRS_PSEQ_INT_SRC1_OSC_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC1_EN, 0, NVVRS_PSEQ_INT_SRC1_EN_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC1_RTC, 0, NVVRS_PSEQ_INT_SRC1_RTC_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC1_PEC, 0, NVVRS_PSEQ_INT_SRC1_PEC_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC1_WDT, 0, NVVRS_PSEQ_INT_SRC1_WDT_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC1_EM_PD, 0, NVVRS_PSEQ_INT_SRC1_EM_PD_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC1_INTERNAL, 0, NVVRS_PSEQ_INT_SRC1_INTERNAL_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC2_PBSP, 1, NVVRS_PSEQ_INT_SRC2_PBSP_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC2_ECC_DED, 1, NVVRS_PSEQ_INT_SRC2_ECC_DED_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC2_TSD, 1, NVVRS_PSEQ_INT_SRC2_TSD_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC2_LDO, 1, NVVRS_PSEQ_INT_SRC2_LDO_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC2_BIST, 1, NVVRS_PSEQ_INT_SRC2_BIST_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC2_RT_CRC, 1, NVVRS_PSEQ_INT_SRC2_RT_CRC_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_SRC2_VENDOR, 1, NVVRS_PSEQ_INT_SRC2_VENDOR_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_VENDOR0, 2, NVVRS_PSEQ_INT_VENDOR0_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_VENDOR1, 2, NVVRS_PSEQ_INT_VENDOR1_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_VENDOR2, 2, NVVRS_PSEQ_INT_VENDOR2_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_VENDOR3, 2, NVVRS_PSEQ_INT_VENDOR3_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_VENDOR4, 2, NVVRS_PSEQ_INT_VENDOR4_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_VENDOR5, 2, NVVRS_PSEQ_INT_VENDOR5_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_VENDOR6, 2, NVVRS_PSEQ_INT_VENDOR6_MASK),
+	REGMAP_IRQ_REG(NVVRS_PSEQ_INT_VENDOR7, 2, NVVRS_PSEQ_INT_VENDOR7_MASK),
+};
+
+static const struct mfd_cell nvvrs_pseq_children[] = {
+	{
+		.name = "nvvrs-pseq-rtc",
+		.resources = rtc_resources,
+		.num_resources = ARRAY_SIZE(rtc_resources),
+	},
+};
+
+static const struct regmap_range nvvrs_pseq_readable_ranges[] = {
+	regmap_reg_range(NVVRS_PSEQ_REG_VENDOR_ID, NVVRS_PSEQ_REG_MODEL_REV),
+	regmap_reg_range(NVVRS_PSEQ_REG_INT_SRC1, NVVRS_PSEQ_REG_LAST_RST),
+	regmap_reg_range(NVVRS_PSEQ_REG_EN_ALT_F, NVVRS_PSEQ_REG_IEN_VENDOR),
+	regmap_reg_range(NVVRS_PSEQ_REG_RTC_T3, NVVRS_PSEQ_REG_RTC_A0),
+	regmap_reg_range(NVVRS_PSEQ_REG_WDT_CFG, NVVRS_PSEQ_REG_WDTKEY),
+};
+
+static const struct regmap_access_table nvvrs_pseq_readable_table = {
+	.yes_ranges = nvvrs_pseq_readable_ranges,
+	.n_yes_ranges = ARRAY_SIZE(nvvrs_pseq_readable_ranges),
+};
+
+static const struct regmap_range nvvrs_pseq_writable_ranges[] = {
+	regmap_reg_range(NVVRS_PSEQ_REG_INT_SRC1, NVVRS_PSEQ_REG_INT_VENDOR),
+	regmap_reg_range(NVVRS_PSEQ_REG_GP_OUT, NVVRS_PSEQ_REG_IEN_VENDOR),
+	regmap_reg_range(NVVRS_PSEQ_REG_RTC_T3, NVVRS_PSEQ_REG_RTC_A0),
+	regmap_reg_range(NVVRS_PSEQ_REG_WDT_CFG, NVVRS_PSEQ_REG_WDTKEY),
+};
+
+static const struct regmap_access_table nvvrs_pseq_writable_table = {
+	.yes_ranges = nvvrs_pseq_writable_ranges,
+	.n_yes_ranges = ARRAY_SIZE(nvvrs_pseq_writable_ranges),
+};
+
+static const struct regmap_config nvvrs_pseq_regmap_config = {
+	.name = "nvvrs-pseq",
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = NVVRS_PSEQ_REG_WDTKEY + 1,
+	.cache_type = REGCACHE_RBTREE,
+	.rd_table = &nvvrs_pseq_readable_table,
+	.wr_table = &nvvrs_pseq_writable_table,
+};
+
+static int nvvrs_pseq_irq_clear(void *irq_drv_data)
+{
+	struct nvvrs_pseq_chip *chip = (struct nvvrs_pseq_chip *)irq_drv_data;
+	struct i2c_client *client = chip->client;
+	u8 reg, val;
+	unsigned int i;
+	int ret = 0;
+
+	/* Write 1 to clear the interrupt bit in the Interrupt
+	 * Source Register, writing 0 has no effect, writing 1 to a bit
+	 * which is already at 0 has no effect
+	 */
+
+	for (i = 0; i < chip->irq_chip->num_regs; i++) {
+		reg = (u8)(chip->irq_chip->status_base + i);
+		ret = i2c_smbus_read_byte_data(client, reg);
+		if (ret < 0) {
+			dev_err(chip->dev, "Failed to read interrupt register: 0x%02x, ret=%d\n",
+				reg, ret);
+			return ret;
+		} else if (ret > 0) {
+			val = (u8)ret;
+			dev_dbg(chip->dev, "Clearing interrupts! Interrupt status reg 0x%02x = 0x%02x\n",
+				reg, val);
+
+			/* Clear interrupt */
+			ret = i2c_smbus_write_byte_data(client, reg, val);
+			if (ret < 0) {
+				dev_err(chip->dev, "Failed to write interrupt register: 0x%02x, ret= %d\n",
+					reg, ret);
+				return ret;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static const struct regmap_irq_chip nvvrs_pseq_irq_chip = {
+	.name = "nvvrs-pseq-irq",
+	.irqs = nvvrs_pseq_irqs,
+	.num_irqs = ARRAY_SIZE(nvvrs_pseq_irqs),
+	.num_regs = 3,
+	.status_base = NVVRS_PSEQ_REG_INT_SRC1,
+	.handle_post_irq = nvvrs_pseq_irq_clear,
+};
+
+static int nvvrs_pseq_vendor_info(struct nvvrs_pseq_chip *chip)
+{
+	struct i2c_client *client = chip->client;
+	u8 vendor_id, model_rev;
+	int ret;
+
+	ret = i2c_smbus_read_byte_data(client, NVVRS_PSEQ_REG_VENDOR_ID);
+	if (ret < 0) {
+		dev_err(chip->dev, "Failed to read Vendor ID: %d\n", ret);
+		return ret;
+	}
+
+	vendor_id = (u8)ret;
+
+	ret = i2c_smbus_read_byte_data(client, NVVRS_PSEQ_REG_MODEL_REV);
+	if (ret < 0) {
+		dev_err(chip->dev, "Failed to read Model Rev: %d\n", ret);
+		return ret;
+	}
+
+	model_rev = (u8)ret;
+
+	if (model_rev < 0x40) {
+		dev_err(chip->dev, "Chip revision 0x%02x is not supported!\n",
+			model_rev);
+		return -ENODEV;
+	}
+
+	dev_info(chip->dev, "NVVRS Vendor ID: 0x%02x, Model Rev: 0x%02x\n",
+		 vendor_id, model_rev);
+
+	return 0;
+}
+
+static int nvvrs_pseq_probe(struct i2c_client *client)
+{
+	const struct regmap_config *rmap_config;
+	struct nvvrs_pseq_chip *nvvrs_chip;
+	const struct mfd_cell *mfd_cells;
+	int n_mfd_cells;
+	int ret;
+
+	nvvrs_chip = devm_kzalloc(&client->dev, sizeof(*nvvrs_chip), GFP_KERNEL);
+	if (!nvvrs_chip)
+		return -ENOMEM;
+
+	/* Set PEC flag for SMBUS transfer with PEC enabled */
+	client->flags |= I2C_CLIENT_PEC;
+
+	i2c_set_clientdata(client, nvvrs_chip);
+	nvvrs_chip->client = client;
+	nvvrs_chip->dev = &client->dev;
+	nvvrs_chip->chip_irq = client->irq;
+	mfd_cells = nvvrs_pseq_children;
+	n_mfd_cells = ARRAY_SIZE(nvvrs_pseq_children);
+	rmap_config = &nvvrs_pseq_regmap_config;
+	nvvrs_chip->irq_chip = &nvvrs_pseq_irq_chip;
+
+	nvvrs_chip->rmap = devm_regmap_init_i2c(client, rmap_config);
+	if (IS_ERR(nvvrs_chip->rmap)) {
+		ret = PTR_ERR(nvvrs_chip->rmap);
+		dev_err(nvvrs_chip->dev, "Failed to initialise regmap: %d\n", ret);
+		return ret;
+	}
+
+	ret = nvvrs_pseq_vendor_info(nvvrs_chip);
+	if (ret < 0)
+		return ret;
+
+	nvvrs_chip->irq_drv_data = nvvrs_chip;
+	ret = devm_regmap_add_irq_chip(nvvrs_chip->dev, nvvrs_chip->rmap, client->irq,
+				       IRQF_ONESHOT | IRQF_SHARED, 0,
+				       &nvvrs_pseq_irq_chip,
+				       &nvvrs_chip->irq_data);
+	if (ret < 0) {
+		dev_err(nvvrs_chip->dev, "Failed to add regmap irq: %d\n", ret);
+		return ret;
+	}
+
+	ret =  devm_mfd_add_devices(nvvrs_chip->dev, PLATFORM_DEVID_NONE,
+				    mfd_cells, n_mfd_cells, NULL, 0,
+				    regmap_irq_get_domain(nvvrs_chip->irq_data));
+	if (ret < 0) {
+		dev_err(nvvrs_chip->dev, "Failed to add MFD children: %d\n", ret);
+		return ret;
+	}
+
+	dev_info(nvvrs_chip->dev, "NVVRS PSEQ probe successful");
+	return 0;
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int nvvrs_pseq_i2c_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+
+	/*
+	 * IRQ must be disabled during suspend because if it happens
+	 * while suspended it will be handled before resuming I2C.
+	 *
+	 * When device is woken up from suspend (e.g. by RTC wake alarm),
+	 * an interrupt occurs before resuming I2C bus controller.
+	 * Interrupt handler tries to read registers but this read
+	 * will fail because I2C is still suspended.
+	 */
+	disable_irq(client->irq);
+
+	return 0;
+}
+
+static int nvvrs_pseq_i2c_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+
+	enable_irq(client->irq);
+	return 0;
+}
+#endif
+
+static const struct dev_pm_ops nvvrs_pseq_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(nvvrs_pseq_i2c_suspend, nvvrs_pseq_i2c_resume)
+};
+
+static const struct of_device_id nvvrs_dt_match[] = {
+	{ .compatible = "nvidia,vrs-pseq" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, nvvrs_dt_match);
+
+static struct i2c_driver nvvrs_pseq_driver = {
+	.driver = {
+		.name = "nvvrs_pseq",
+		.pm = &nvvrs_pseq_pm_ops,
+		.of_match_table = of_match_ptr(nvvrs_dt_match),
+	},
+	.probe = nvvrs_pseq_probe,
+};
+
+module_i2c_driver(nvvrs_pseq_driver);
+
+MODULE_AUTHOR("Shubhi Garg <shgarg@nvidia.com>");
+MODULE_DESCRIPTION("NVIDIA Voltage Regulator Specification Power Sequencer Driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/nvidia-vrs-pseq.h b/include/linux/mfd/nvidia-vrs-pseq.h
new file mode 100644
index 000000000000..7e6f3aa940e7
--- /dev/null
+++ b/include/linux/mfd/nvidia-vrs-pseq.h
@@ -0,0 +1,127 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+// SPDX-FileCopyrightText: Copyright (c) 2025 NVIDIA CORPORATION & AFFILIATES. All rights reserved
+
+#ifndef _MFD_NVIDIA_VRS_PSEQ_H_
+#define _MFD_NVIDIA_VRS_PSEQ_H_
+
+#include <linux/types.h>
+
+/* Vendor ID */
+#define NVVRS_PSEQ_REG_VENDOR_ID		0x00
+#define NVVRS_PSEQ_REG_MODEL_REV		0x01
+
+/*  Interrupts and Status registers */
+#define NVVRS_PSEQ_REG_INT_SRC1			0x10
+#define NVVRS_PSEQ_REG_INT_SRC2			0x11
+#define NVVRS_PSEQ_REG_INT_VENDOR		0x12
+#define NVVRS_PSEQ_REG_CTL_STAT			0x13
+#define NVVRS_PSEQ_REG_EN_STDR1			0x14
+#define NVVRS_PSEQ_REG_EN_STDR2			0x15
+#define NVVRS_PSEQ_REG_EN_STRD1			0x16
+#define NVVRS_PSEQ_REG_EN_STRD2			0x17
+#define NVVRS_PSEQ_REG_WDT_STAT			0x18
+#define NVVRS_PSEQ_REG_TEST_STAT		0x19
+#define NVVRS_PSEQ_REG_LAST_RST			0x1A
+
+/* Configuration Registers */
+#define NVVRS_PSEQ_REG_EN_ALT_F			0x20
+#define NVVRS_PSEQ_REG_AF_IN_OUT		0x21
+#define NVVRS_PSEQ_REG_EN_CFG1			0x22
+#define NVVRS_PSEQ_REG_EN_CFG2			0x23
+#define NVVRS_PSEQ_REG_CLK_CFG			0x24
+#define NVVRS_PSEQ_REG_GP_OUT			0x25
+#define NVVRS_PSEQ_REG_DEB_IN			0x26
+#define NVVRS_PSEQ_REG_LP_TTSHLD		0x27
+#define NVVRS_PSEQ_REG_CTL_1			0x28
+#define NVVRS_PSEQ_REG_CTL_2			0x29
+#define NVVRS_PSEQ_REG_TEST_CFG			0x2A
+#define NVVRS_PSEQ_REG_IEN_VENDOR		0x2B
+
+/* RTC */
+#define NVVRS_PSEQ_REG_RTC_T3			0x70
+#define NVVRS_PSEQ_REG_RTC_T2			0x71
+#define NVVRS_PSEQ_REG_RTC_T1			0x72
+#define NVVRS_PSEQ_REG_RTC_T0			0x73
+#define NVVRS_PSEQ_REG_RTC_A3			0x74
+#define NVVRS_PSEQ_REG_RTC_A2			0x75
+#define NVVRS_PSEQ_REG_RTC_A1			0x76
+#define NVVRS_PSEQ_REG_RTC_A0			0x77
+
+/* WDT */
+#define NVVRS_PSEQ_REG_WDT_CFG			0x80
+#define NVVRS_PSEQ_REG_WDT_CLOSE		0x81
+#define NVVRS_PSEQ_REG_WDT_OPEN			0x82
+#define NVVRS_PSEQ_REG_WDTKEY			0x83
+
+/* Interrupt Mask */
+#define NVVRS_PSEQ_INT_SRC1_RSTIRQ_MASK		BIT(0)
+#define NVVRS_PSEQ_INT_SRC1_OSC_MASK		BIT(1)
+#define NVVRS_PSEQ_INT_SRC1_EN_MASK		BIT(2)
+#define NVVRS_PSEQ_INT_SRC1_RTC_MASK		BIT(3)
+#define NVVRS_PSEQ_INT_SRC1_PEC_MASK		BIT(4)
+#define NVVRS_PSEQ_INT_SRC1_WDT_MASK		BIT(5)
+#define NVVRS_PSEQ_INT_SRC1_EM_PD_MASK		BIT(6)
+#define NVVRS_PSEQ_INT_SRC1_INTERNAL_MASK	BIT(7)
+#define NVVRS_PSEQ_INT_SRC2_PBSP_MASK		BIT(0)
+#define NVVRS_PSEQ_INT_SRC2_ECC_DED_MASK	BIT(1)
+#define NVVRS_PSEQ_INT_SRC2_TSD_MASK		BIT(2)
+#define NVVRS_PSEQ_INT_SRC2_LDO_MASK		BIT(3)
+#define NVVRS_PSEQ_INT_SRC2_BIST_MASK		BIT(4)
+#define NVVRS_PSEQ_INT_SRC2_RT_CRC_MASK		BIT(5)
+#define NVVRS_PSEQ_INT_SRC2_VENDOR_MASK		BIT(7)
+#define NVVRS_PSEQ_INT_VENDOR0_MASK		BIT(0)
+#define NVVRS_PSEQ_INT_VENDOR1_MASK		BIT(1)
+#define NVVRS_PSEQ_INT_VENDOR2_MASK		BIT(2)
+#define NVVRS_PSEQ_INT_VENDOR3_MASK		BIT(3)
+#define NVVRS_PSEQ_INT_VENDOR4_MASK		BIT(4)
+#define NVVRS_PSEQ_INT_VENDOR5_MASK		BIT(5)
+#define NVVRS_PSEQ_INT_VENDOR6_MASK		BIT(6)
+#define NVVRS_PSEQ_INT_VENDOR7_MASK		BIT(7)
+
+/* Controller Register Mask */
+#define NVVRS_PSEQ_REG_CTL_1_FORCE_SHDN		(BIT(0) | BIT(1))
+#define NVVRS_PSEQ_REG_CTL_1_FORCE_ACT		BIT(2)
+#define NVVRS_PSEQ_REG_CTL_1_FORCE_INT		BIT(3)
+#define NVVRS_PSEQ_REG_CTL_2_EN_PEC		BIT(0)
+#define NVVRS_PSEQ_REG_CTL_2_REQ_PEC		BIT(1)
+#define NVVRS_PSEQ_REG_CTL_2_RTC_PU		BIT(2)
+#define NVVRS_PSEQ_REG_CTL_2_RTC_WAKE		BIT(3)
+#define NVVRS_PSEQ_REG_CTL_2_RST_DLY		0xF0
+
+enum {
+	NVVRS_PSEQ_INT_SRC1_RSTIRQ,		/* Reset or Interrupt Pin Fault */
+	NVVRS_PSEQ_INT_SRC1_OSC,		/* Crystal Oscillator Fault */
+	NVVRS_PSEQ_INT_SRC1_EN,			/* Enable Output Pin Fault */
+	NVVRS_PSEQ_INT_SRC1_RTC,		/* RTC Alarm */
+	NVVRS_PSEQ_INT_SRC1_PEC,		/* Packet Error Checking */
+	NVVRS_PSEQ_INT_SRC1_WDT,		/* Watchdog Violation */
+	NVVRS_PSEQ_INT_SRC1_EM_PD,		/* Emergency Power Down */
+	NVVRS_PSEQ_INT_SRC1_INTERNAL,		/* Internal Fault*/
+	NVVRS_PSEQ_INT_SRC2_PBSP,		/* PWR_BTN Short Pulse Detection */
+	NVVRS_PSEQ_INT_SRC2_ECC_DED,		/* ECC Double-Error Detection */
+	NVVRS_PSEQ_INT_SRC2_TSD,		/* Thermal Shutdown */
+	NVVRS_PSEQ_INT_SRC2_LDO,		/* LDO Fault */
+	NVVRS_PSEQ_INT_SRC2_BIST,		/* Built-In Self Test Fault */
+	NVVRS_PSEQ_INT_SRC2_RT_CRC,		/* Runtime Register CRC Fault */
+	NVVRS_PSEQ_INT_SRC2_VENDOR,		/* Vendor Specific Internal Fault */
+	NVVRS_PSEQ_INT_VENDOR0,			/* Vendor Internal Fault Bit 0 */
+	NVVRS_PSEQ_INT_VENDOR1,			/* Vendor Internal Fault Bit 1 */
+	NVVRS_PSEQ_INT_VENDOR2,			/* Vendor Internal Fault Bit 2 */
+	NVVRS_PSEQ_INT_VENDOR3,			/* Vendor Internal Fault Bit 3 */
+	NVVRS_PSEQ_INT_VENDOR4,			/* Vendor Internal Fault Bit 4 */
+	NVVRS_PSEQ_INT_VENDOR5,			/* Vendor Internal Fault Bit 5 */
+	NVVRS_PSEQ_INT_VENDOR6,			/* Vendor Internal Fault Bit 6 */
+	NVVRS_PSEQ_INT_VENDOR7,			/* Vendor Internal Fault Bit 7 */
+};
+
+struct nvvrs_pseq_chip {
+	struct device *dev;
+	struct regmap *rmap;
+	int chip_irq;
+	struct i2c_client *client;
+	struct regmap_irq_chip_data *irq_data;
+	const struct regmap_irq_chip *irq_chip;
+	void *irq_drv_data;
+};
+
+#endif /* _MFD_NVIDIA_VRS_PSEQ_H_ */
-- 
2.25.1

