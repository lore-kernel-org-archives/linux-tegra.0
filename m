Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2047.outbound.protection.outlook.com [40.107.223.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E355C267B74;
	Tue, 20 May 2025 09:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747732142; cv=fail; b=iJ9GQ6Jt45l8K0SzALdi1tXumXGqOTOFdY7b1Z8ywh6n6HdBykTASYsFfUJCZ95LNAg2aADCevANKa4qlC6iKLvgxhxt2sxPLXz3gku5ah0Wv4frfgA3amt9ZrcknbBmb4EFNk3dFzhHJ7D+1segcVNTSvmTwlNhb1dcG4OHKFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747732142; c=relaxed/simple;
	bh=cO1D9UqX3ZV6L3ImGp4g9YrDSriaVcfTZ4Cl6eRQP5E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l+uXk8wx2bMsApsTfLE588A1LHmPmUADiYPh3oi5x4vVbWuQ91l7LvTVkhABncyeBlFLx5EXxDi2whMbF4XXEaYH42wAyF6C97efPnqwG80kJW1PKN4JAfPSxw5RH5rdmvptmOO7DzYVRMkut9qXg1j/H8iJXJKz5h63qwoUZtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jp2gL5XJ; arc=fail smtp.client-ip=40.107.223.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jp2gL5XJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mj0Yb6QicnkXYRlkYB16KexaTEfPeAuzccrc3g1Qn3Z/5fFhXird7++Wj7jlnHeErcvbutUs2pHkN5EmkmZjYHwASbKb0dRjaoqIeE0pmHXbSdtzZU3yrYXdHgyyBkyf897t3yVgNR8XRpkrjpFnLuUtZSS5AN0CDedCtgM05070wOhAR/3ejkv2my8DQ1jj63qOTOie116qpicHuu8FD4GDM/c1M5j7W5eEIJwYTVIPBMhOeHtH5Ftcd1gTFxI0tcqiFvjGVISbG75IA0NhIiYrKKQSO2v+FkEKyAmkJyZudtHPmGPwU1AYftrYmGfAJ8d7G0z2QuMbJA7mMtEFTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WVwcBjzFY7+/sc4cWK3lUVzt+gq/jKnIMMdSChix7uA=;
 b=H2FJS3f/NjZ61pu6p3MFN0SqOcIIlT3LrlXnrjZfzS5L0IaX7Q+8vaSwi0CHvwPbStbkjHQSj6K+DQjjubP5xZAYpZnEXTXcCrtH7+ZOAPrPPaJp1sMYIVP9KqLn9df7PGpPeZ+TOciQQZlNE5uHsFO8C5dRMeVPPAOmnqy3n/+xpBiNzo+9trtJUI4aVuPuRpgNNllnsXN2n8dzNHKEZLtRTL1Y/6bysR1QHG3XjY2TZyLEoS6J0ETq1c1Uan0f1RONQV4pnfe8nJT99xKl7bIcuVHpjCjO7ps3lHN+Pbk/Rqo8rSdjoWWErn2O0AVEk0TeoGnf3IENmJLIN5xDZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WVwcBjzFY7+/sc4cWK3lUVzt+gq/jKnIMMdSChix7uA=;
 b=jp2gL5XJr5Dyi/SRi0HxrpULLIlujARNKU4osYSN0ze+uOVmMpWrR4wMxL6l4wuXyHFudFEjQ5crqZ66R7OJ4O/WVhQjrYe75a+dxKWhd73MfaN4HdHYHxNcqekQ2vB3jnPCa5y1G8JOQZ4JV/jb4JH7LTd9BsueDzNLmjK+L5om7P8g/hgw75H+QwAU/vZVDPxpUdiILlLsBeUKfi6aw8FxCf9std/MrMMpHgckKKtUPjA+KrlDCIxCQxJWFwnD92vGvl9CbisIS2tBGsxe7KmFuZgYAUkznRHc++9g+IUHqUewWsrD9sdoCytJ7da1h9i9tacAiHI7i0jg4r7uOw==
Received: from CH0PR03CA0187.namprd03.prod.outlook.com (2603:10b6:610:e4::12)
 by DM4PR12MB6012.namprd12.prod.outlook.com (2603:10b6:8:6c::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.30; Tue, 20 May 2025 09:08:51 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:e4:cafe::69) by CH0PR03CA0187.outlook.office365.com
 (2603:10b6:610:e4::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Tue,
 20 May 2025 09:08:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Tue, 20 May 2025 09:08:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 20 May
 2025 02:08:39 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 20 May
 2025 02:08:39 -0700
Received: from build-shgarg-noble-20250422.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Tue, 20 May 2025 02:08:38 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: <jonathanh@nvidia.com>, <lee@kernel.org>, <robh@kernel.org>,
	<krzk@kernel.org>, <alexandre.belloni@bootlin.com>,
	<thierry.reding@gmail.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Shubhi Garg <shgarg@nvidia.com>
Subject: [PATCH V2 3/6] mfd: nvvrs: add NVVRS PSEQ MFD driver
Date: Tue, 20 May 2025 09:08:29 +0000
Message-ID: <20250520090832.3564104-4-shgarg@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520090832.3564104-1-shgarg@nvidia.com>
References: <20250520090832.3564104-1-shgarg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|DM4PR12MB6012:EE_
X-MS-Office365-Filtering-Correlation-Id: 444bb541-685b-41c5-78d3-08dd977df054
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MHF4EZUmGVRQZ+h68rJxytG658NojRcvKQHjnhwCAW++38IVrXGFEzRemDl/?=
 =?us-ascii?Q?OlxxdwbAe0xCJOEKoZSjiN3sLM9Kgdtzy5cXqLSQ93g25WX4rPjXlXnEO3tk?=
 =?us-ascii?Q?fj1A0k1ufngmU4MTdO+oBbOD8rD03NALdjYGrs4QQZih68POEmFzsv3UrXi4?=
 =?us-ascii?Q?BU6i/pYF0X6EHuxDLJdrtiSV7qSaqpA7h3K27XwU9YG4bBRkXepMMLnqBF37?=
 =?us-ascii?Q?aCQVQdG6UoyMBYoEedK8eJcpMfMvovTjM9w8DctzwZI3xMuiFfER9YYkk+5w?=
 =?us-ascii?Q?S8XfHxFrdKw7UieGStr4t5C0exdjocH2cPzCPT+v/EIUoJ2sxHkOPcWpO+fG?=
 =?us-ascii?Q?5J/NAVQhLHxAkpcYeZAaIeslee9ChJ/JDKzJYnqIxrjCtnQ/Y3uzr7eWorFW?=
 =?us-ascii?Q?cJwikRyotTLXxMm+VfcqHz9IA1PHrr+eA4V0edS+CnEkkNCLtd4EzsOv9+KM?=
 =?us-ascii?Q?S2lE6bkqjb027kxLUP5rcap7G7TT0eQwl5rUrF9bdfcoLqz9fYqDNo8HbUue?=
 =?us-ascii?Q?H1fM7pECTm0eotrESSTLeyWFJk0+Aq5eeZUBojNQxIliHrCelpucjEmQZShx?=
 =?us-ascii?Q?5kqsbZ0mKzpJ+YeoYRlxdPnsUQ8Erw+3yJTlKZbUs7Ajs85Wh5zyEbDFfc4+?=
 =?us-ascii?Q?PVMytQysTBwYk7EBK9nUsiWxgeH7CU5rhhCeovBNSQD16CDTqAjvJMfILfzM?=
 =?us-ascii?Q?4QtVYUzWKQZXOPR3f2N3WZeU3EDf6wGpGiwzfv7+TxXxDRx4sy7HVtr6ppJr?=
 =?us-ascii?Q?xihJRMdXCkXpCJDFFFn4Nuh9uVvctJBnMJaaD0o5Z5QjdvVD3xKhASROI3TV?=
 =?us-ascii?Q?EyE6zK0iqOvrcBJPaRl9w0w6I+0jXnbrFuwO8ej06HcmFjq+P9XuttWIBaPZ?=
 =?us-ascii?Q?+xOYOKLw47NfvJi+3KPx6cWJskTYLbQ9TNlwt/Rfa2ls+rImJa7w2my2gblc?=
 =?us-ascii?Q?LjXY7yVjP3V3HK4t5zrXmxkVxr6gmkwMU8lviilbe7iIpN3kBdKGhFM/Bk0l?=
 =?us-ascii?Q?3jZ8u5z5lWA9ZWTNb3JUnTU9vYZVHLbUznYSDwDKEu6HBRncMYBVcpr6cXk6?=
 =?us-ascii?Q?zPCDJF+efI/FrjVHSY16JY1SZO73LToa315UTIpjFlTLbRpv3f72qI5fH+Er?=
 =?us-ascii?Q?iGNmF0+izmapqN1rQ8XUkKpjeXqIjsmDAnOJ82B+ek4pjmXO6LMFQdUPpfFU?=
 =?us-ascii?Q?zI/0KiHZ9yx7utUEJ6Y+XmjBE62saq/CRFiZXWO929hj1jxz1HRIH7ssP2FZ?=
 =?us-ascii?Q?5q0C1NMULPTTl8JDAB5va7hCoqG1RNN99qtvK6q2C0KxzvyOWbdrbb/CVWeF?=
 =?us-ascii?Q?vhiB65JDspAez9eEV48SSnIQ0cj959by7R1xLR2DViOtpqOYquvnWgLzIMvI?=
 =?us-ascii?Q?f/gG06X8NjeV+/vO84ZeCWk0Fh8ZUG4yZ6n4Mc+g7fpwz57XJgDZ2X6kj7pC?=
 =?us-ascii?Q?Lm8oPqhDwgioReOQz/LKAoI7Ip0Fgmt0PUw0srWVOYSMcVmXzVDPK0kMHQxh?=
 =?us-ascii?Q?orq397b5iz452xjD67rjPUhVLx12rz8bACZK?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 09:08:51.3722
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 444bb541-685b-41c5-78d3-08dd977df054
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6012

Add support for NVIDIA VRS (Voltage Regulator Specification) power
sequencer device driver. This driver manages ON/OFF and suspend/resume
power sequencing of system power rails for NVIDIA Tegra234 SoC. It also
provides 32kHz RTC clock support with backup battery for system timing.

Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
---

v2:
- removed unnecessary error logs
- changed dev_info to dev_dbg
- changed dev_err to dev_err_probe
- fixed "of_match_table" assignment

 drivers/mfd/Kconfig                 |  12 ++
 drivers/mfd/Makefile                |   1 +
 drivers/mfd/nvidia-vrs-pseq.c       | 270 ++++++++++++++++++++++++++++
 include/linux/mfd/nvidia-vrs-pseq.h | 127 +++++++++++++
 4 files changed, 410 insertions(+)
 create mode 100644 drivers/mfd/nvidia-vrs-pseq.c
 create mode 100644 include/linux/mfd/nvidia-vrs-pseq.h

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6fb3768e3d71..3144b8f3eb9b 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1437,6 +1437,18 @@ config MFD_SC27XX_PMIC
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
index 79495f9f3457..9b07289985b5 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -183,6 +183,7 @@ obj-$(CONFIG_MFD_MT6360)	+= mt6360-core.o
 obj-$(CONFIG_MFD_MT6370)	+= mt6370.o
 mt6397-objs			:= mt6397-core.o mt6397-irq.o mt6358-irq.o
 obj-$(CONFIG_MFD_MT6397)	+= mt6397.o
+obj-$(CONFIG_MFD_NVVRS_PSEQ)    += nvidia-vrs-pseq.o
 
 obj-$(CONFIG_RZ_MTU3)		+= rz-mtu3.o
 obj-$(CONFIG_ABX500_CORE)	+= abx500-core.o
diff --git a/drivers/mfd/nvidia-vrs-pseq.c b/drivers/mfd/nvidia-vrs-pseq.c
new file mode 100644
index 000000000000..e81c84b7811e
--- /dev/null
+++ b/drivers/mfd/nvidia-vrs-pseq.c
@@ -0,0 +1,270 @@
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
+		if (ret) {
+			val = (u8)ret;
+			dev_dbg(chip->dev, "Clearing interrupts! Interrupt status reg 0x%02x = 0x%02x\n",
+				reg, val);
+
+			ret = i2c_smbus_write_byte_data(client, reg, val);
+			if (ret < 0)
+				return ret;
+		}
+	}
+
+	return ret;
+}
+
+static struct regmap_irq_chip nvvrs_pseq_irq_chip = {
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
+		return dev_err_probe(chip->dev, ret,
+				     "Failed to read Vendor ID\n");
+	}
+
+	vendor_id = (u8)ret;
+
+	ret = i2c_smbus_read_byte_data(client, NVVRS_PSEQ_REG_MODEL_REV);
+	if (ret < 0) {
+		return dev_err_probe(chip->dev, ret,
+				     "Failed to read Model Rev\n");
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
+	dev_dbg(chip->dev, "NVVRS Vendor ID: 0x%02x, Model Rev: 0x%02x\n",
+		vendor_id, model_rev);
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
+		return dev_err_probe(nvvrs_chip->dev, ret,
+				     "Failed to initialise regmap\n");
+	}
+
+	ret = nvvrs_pseq_vendor_info(nvvrs_chip);
+	if (ret < 0)
+		return ret;
+
+	nvvrs_pseq_irq_chip.irq_drv_data = nvvrs_chip;
+	ret = devm_regmap_add_irq_chip(nvvrs_chip->dev, nvvrs_chip->rmap, client->irq,
+				       IRQF_ONESHOT | IRQF_SHARED, 0,
+				       &nvvrs_pseq_irq_chip,
+				       &nvvrs_chip->irq_data);
+	if (ret < 0) {
+		return dev_err_probe(nvvrs_chip->dev, ret,
+				     "Failed to add regmap irq\n");
+	}
+
+	ret = devm_mfd_add_devices(nvvrs_chip->dev, PLATFORM_DEVID_NONE,
+				   mfd_cells, n_mfd_cells, NULL, 0,
+				   regmap_irq_get_domain(nvvrs_chip->irq_data));
+	if (ret < 0) {
+		return dev_err_probe(nvvrs_chip->dev, ret,
+				     "Failed to add MFD children\n");
+	}
+
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
+	{},
+};
+MODULE_DEVICE_TABLE(of, nvvrs_dt_match);
+
+static struct i2c_driver nvvrs_pseq_driver = {
+	.driver = {
+		.name = "nvvrs_pseq",
+		.pm = &nvvrs_pseq_pm_ops,
+		.of_match_table = nvvrs_dt_match,
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
2.43.0

