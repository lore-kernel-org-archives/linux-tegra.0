Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0BE23FC42;
	Wed, 16 Apr 2025 12:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805224; cv=fail; b=CB4BH+6xeUSHssFafq5Yv1yry960P3JMyl2vM6+fBTULiBckrWIQ06P4aT3USOZNPxnYWvZ+7E+LqsxQyRxiysuTAUpDK4vuoU4ATD3VLnxIGUcJXCnKTZg/2mD0L6un8EVDKsVlapEUfo/GeOk3y8CokJ2eb+oX6CilVKB0r2A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805224; c=relaxed/simple;
	bh=bISWoKMwKGmjKiPgKZH7yUcpLlCN4niwhFsQg0amCpk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OXVa6ltuwHch6Xr00y3W1lmbC/lc/ssrnVnaGvWeB9xKaDLuE0Z94gG93Cnj+dhvCPSLQJ19LGPpF4hiUCFN0FL7+iohUz2q1ztxo/2DnNUqXq2yuBhqBKgK9aadLpkzQ1bQbllPPJ937tfmZemuTsnaYv3PzH4cH0pudSNOph4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Yr3b4Zsc; arc=fail smtp.client-ip=40.107.93.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Yr3b4Zsc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LtXjSeqM3hucWIMNT3gTVoNU+tQjNQCv5HNGlwxf0ImgE6sgD2V9VR+wfApgWidW6jX1s8wc5w5gbMMVIaIkaHIynn5x79s3M5UaNBdDAb3PuJ15QzG5cHDwp1YkTioGA7dPIHlwZKj61uCn2WrmIeq1PT/TBcUOQ0HqR+4ySPpnoyQw26rbzOnt166t1O7tPxHMP1FHkio48KnUq6ZykOLL+qwHCIcVfSiVY1QKGWf/DULgt65AiPmI5TMVTWbQpipShBJnHGDPZtKeH6cP17ihysyK94bEK9B7liWc6Te6tBdL1wtyDaMTVizcOvGDRBMyGmlPn3TGCVCnF00UbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/x8Jy99AfVXYtFUR2l5irowyZWG22V9hvAeO8/sonZY=;
 b=b+zQXFh93P/sw7r7ir8SfoKkwp6iXhixj+z4n5TsUE2xSc34bBtR3ObF0PWxliHiywzDzCHZ4yEDQHlVrDCldMUfWyMhf5uaCtzxWi1kKCNPVDl2hj3p8G7m0tX+mMwRPCt/Vm54jwvQ2Kf4lPJ0InRMudv+cpx5Fqe7WfciQ2AT9zrdz+VY66AI9sziy248tfaW8ipKGxI0zifsEfacTQBw4eX6lj0EMnucIORYxeqnGNUOhRcJ1O2umt+aUYn1uTAfpnFXMQVb/dXnluSl0GqFF7UZoyOQ2ceg9EbdDjfQNFk+50/wmzhmFeDyDIHTb+GberqJ7APUb+34I1aKew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/x8Jy99AfVXYtFUR2l5irowyZWG22V9hvAeO8/sonZY=;
 b=Yr3b4ZscPBPcZT9pwgl0k4QU5ZhUsbZRYs8KNwCdw/AOqW8wt1LHbDTq6FSEIY4NAQ69M0WWTZ9MV018gb8bxbyEzL5v94NZnFJyB/HdBvpKnvkpnJ9l15IMU6pn8BdSsfy8pzbn5YJ9SigSuIVWJ42lhRJuiFLA91hXbTg+cQZDaUghohhIBtYJ0mrhbp8r2R+8UidK79MQZZTxxTrT66Q2zrLczWVEcL1gbCLEgAPWsNQhxRXxrhkZQ9iPz1aBZaze4tFpHLVZfU+ozxhLbsR4DnoWcXJoygua9S9s3XQ4Exhny1fdEAJDnI5OPz9xVfH2ygaBp5wExBMDcNt6rA==
Received: from BN8PR15CA0017.namprd15.prod.outlook.com (2603:10b6:408:c0::30)
 by DS5PPFC9877909A.namprd12.prod.outlook.com (2603:10b6:f:fc00::661) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Wed, 16 Apr
 2025 12:06:57 +0000
Received: from BN2PEPF000044A1.namprd02.prod.outlook.com
 (2603:10b6:408:c0:cafe::dd) by BN8PR15CA0017.outlook.office365.com
 (2603:10b6:408:c0::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Wed,
 16 Apr 2025 12:06:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A1.mail.protection.outlook.com (10.167.243.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Wed, 16 Apr 2025 12:06:57 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 16 Apr
 2025 05:06:32 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 16 Apr
 2025 05:06:32 -0700
Received: from build-shgarg-focal-20241118.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Wed, 16 Apr 2025 05:06:32 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: <lee@kernel.org>, <alexandre.belloni@bootlin.com>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>
CC: <shgarg@nvidia.com>
Subject: [PATCH 4/5] rtc: nvvrs: add NVIDIA VRS PSEQ RTC device driver
Date: Wed, 16 Apr 2025 12:06:18 +0000
Message-ID: <20250416120619.483793-5-shgarg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A1:EE_|DS5PPFC9877909A:EE_
X-MS-Office365-Filtering-Correlation-Id: 5838f0e9-6a9c-4585-8622-08dd7cdf2f82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?R+NTdpHbugsNkarL1cJz+7qIo8vDnVvjBE6wtD1LO43TdbLN84sNNPod/QLn?=
 =?us-ascii?Q?oJ/R/fjjUsW7YbekEXGbaULJfziabatWNDEVmWhv+aj86kiJbROf4UvvARs2?=
 =?us-ascii?Q?GrjttVvM623P2rsisQdk8JdPrhZXKADRjBXN8oGkfShtfBpUkjl9S8vFYnhG?=
 =?us-ascii?Q?V9VejwfuO/FoqxBiCDeZIxKsK05BaITTb8O6gFSpUPoZarTjwhCGpNa8xXyJ?=
 =?us-ascii?Q?AuIgFuQuusQEtvIeTzSuhndvZMEHGYIW2A1CpleVvY7JVmSHiT+Yfs/tnzY0?=
 =?us-ascii?Q?7ldmlPeapsO1V05qgiOQalrAHtbuV399sZnbYAc1vS+HKok7Q16Drf8iNp0j?=
 =?us-ascii?Q?QkREINJyBInTG4yLD7LNE/LBiznhVMFobOYF+ngNnQ67+vHo8QQrvxxiWoZx?=
 =?us-ascii?Q?FyH9JhkRVoo+D7KMVwhMGkQk5Sk7H/DmsfTEcMG4z1r1DGom+iSrkA7SBFZm?=
 =?us-ascii?Q?U3qcKUOU/qsFK+YWrLRr/jpgNqUCAAJAx9lv9jVirUQUIPbRFboXqnqLbyym?=
 =?us-ascii?Q?IcPMy1pa6yGcb0ouTrA5bb4mdRawgA5Sd7nkOdqFDWF7MrAMxGJW/C9ZBm/z?=
 =?us-ascii?Q?3MEb+29DQvyqqg4bflF5Z6UsZLuiAdPX3wsDEIWgnPc5bRr/0uLrOs4QuBle?=
 =?us-ascii?Q?FZN44/D7ASmA6gsUSb2p2gpSOjKomxlg9BSpHKuVUABZiCKUT+SLSiz9b95Z?=
 =?us-ascii?Q?pwLqPRUaH0QDQddBwnhuHaGwK7PE3eie0yykjMx+SqpuPrT3MNOCG0F8OJXh?=
 =?us-ascii?Q?Nqz/P7asnl9F+54b+WdYgWMvQaj8MMCLHzMkAMeVgNZjTJ+CqBVB69yszZNI?=
 =?us-ascii?Q?17dZlT4C4NhQ0Xnqz79FLCufY7LRLQtUHro8kVDWye2nT/muVEY6iRrjU2qm?=
 =?us-ascii?Q?ig7iPDpjrenNSlopVjK5Zw7uxgMD3htn0NKXKNeF96coD2xIN/JL6cUkw/EJ?=
 =?us-ascii?Q?vvEZdORLJHxkvj7tYqKJ1BlGI8v8GEN6Re7vkrLOxtHAU6YG5CnyyU9pmH+S?=
 =?us-ascii?Q?HysPdI/dqRGg5yV14UPxlyFaALt4+YPBblrhHfC9eMFaoW3mOriFiaqy/e+9?=
 =?us-ascii?Q?Z7uMmfVCDsHENRYcifXX/Zv/rRK5zRY1oVmPaiTEVc8cgQn64ZDCIt6DIAni?=
 =?us-ascii?Q?WjkwGW5Yab71IwxIi0Q2HvcSCWhRC7OftpryRLerrkf829f4aNsbgt1Mu6ws?=
 =?us-ascii?Q?jqZ4pYtIgdXxW8DfKDr/POMl1fQ20ixW7DXRaUK2F3oFf6b1N4O8147ioI0G?=
 =?us-ascii?Q?wYDent2bmXOsgVknhbPAd7S2rXk+xXV4IgYWcEutMuMx/m3NVb85RLeFpzCk?=
 =?us-ascii?Q?MBB1mKbV2C/HeHsLGPsgOXqDwHIkK7a6RV/LlXstmTG2e0bXwHG3hjkUrdlx?=
 =?us-ascii?Q?IAy3QAv2vgBplcgFjQaAVVYi+4FRAxMzVQ25W8BQXZEH31zJkQFah24+gliC?=
 =?us-ascii?Q?lj0V6a8smowgY+RN7N66xQDluYPMfVxuSJFl7bFvIjQ4nVpsVhG5EvrnYxBY?=
 =?us-ascii?Q?qTQdXCQPeipA9l3BKBAoa1oCI9LWaubkGTQC?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 12:06:57.1394
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5838f0e9-6a9c-4585-8622-08dd7cdf2f82
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFC9877909A

Add support for NVIDIA VRS (Voltage Regulator Specification) Power
Sequencer RTC device driver. This RTC can be used to get/set system
time, retain system time across boot, wake system from suspend and
shutdown state.

Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
---
 drivers/rtc/Kconfig               |  10 +
 drivers/rtc/Makefile              |   1 +
 drivers/rtc/rtc-nvidia-vrs-pseq.c | 559 ++++++++++++++++++++++++++++++
 3 files changed, 570 insertions(+)
 create mode 100644 drivers/rtc/rtc-nvidia-vrs-pseq.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 838bdc138ffe..3b6dc27a50af 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -406,6 +406,16 @@ config RTC_DRV_MAX77686
 	  This driver can also be built as a module. If so, the module
 	  will be called rtc-max77686.
 
+config RTC_DRV_NVVRS_PSEQ
+	tristate "NVIDIA VRS Power Sequencer RTC device"
+	depends on MFD_NVVRS_PSEQ
+	help
+	  If you say yes here you will get support for the battery backed RTC device
+	  of NVIDIA VRS Power Sequencer. The RTC is connected via I2C interface and
+	  supports alarm functionality.
+	  This driver can also be built as a module. If so, the module will be called
+	  rtc-nvidia-vrs-pseq.
+
 config RTC_DRV_NCT3018Y
 	tristate "Nuvoton NCT3018Y"
 	depends on OF
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 31473b3276d9..543c5a9fe851 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -119,6 +119,7 @@ obj-$(CONFIG_RTC_DRV_MXC_V2)	+= rtc-mxc_v2.o
 obj-$(CONFIG_RTC_DRV_GAMECUBE)	+= rtc-gamecube.o
 obj-$(CONFIG_RTC_DRV_NCT3018Y)	+= rtc-nct3018y.o
 obj-$(CONFIG_RTC_DRV_NTXEC)	+= rtc-ntxec.o
+obj-$(CONFIG_RTC_DRV_NVVRS_PSEQ)+= rtc-nvidia-vrs-pseq.o
 obj-$(CONFIG_RTC_DRV_OMAP)	+= rtc-omap.o
 obj-$(CONFIG_RTC_DRV_OPAL)	+= rtc-opal.o
 obj-$(CONFIG_RTC_DRV_OPTEE)	+= rtc-optee.o
diff --git a/drivers/rtc/rtc-nvidia-vrs-pseq.c b/drivers/rtc/rtc-nvidia-vrs-pseq.c
new file mode 100644
index 000000000000..1a4194e4edf4
--- /dev/null
+++ b/drivers/rtc/rtc-nvidia-vrs-pseq.c
@@ -0,0 +1,559 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2025 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ *
+ * RTC driver for NVIDIA Voltage Regulator Power Sequencer
+ *
+ */
+
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/rtc.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/of_device.h>
+#include <linux/mfd/nvidia-vrs-pseq.h>
+#include <linux/irqdomain.h>
+#include <linux/regmap.h>
+#include <linux/bits.h>
+
+#define ALARM_RESET_VAL		0xFFFFFFFF /* Alarm reset/disable value */
+#define NVVRS_INT_RTC_INDEX	0	   /* Only one RTC interrupt register */
+#define	REG_LEN_IN_BYTES	4
+
+struct nvvrs_rtc_info {
+	struct device          *dev;
+	struct i2c_client      *client;
+	struct rtc_device      *rtc_dev;
+	struct regmap          *regmap;
+	struct regmap_irq_chip_data *rtc_irq_data;
+	/* Mutex to protect RTC operations */
+	struct mutex           lock;
+	unsigned int           rtc_irq;
+	/* Registers offset to I2C addresses map */
+	const u8               *map;
+	/* RTC IRQ CHIP */
+	const struct regmap_irq_chip *rtc_irq_chip;
+};
+
+/* RTC Registers offsets */
+enum nvvrs_rtc_reg_offset {
+	RTC_T3 = 0,
+	RTC_T2,
+	RTC_T1,
+	RTC_T0,
+	RTC_A3,
+	RTC_A2,
+	RTC_A1,
+	RTC_A0,
+	CTL1_REG,
+	CTL2_REG,
+	RTC_END,
+};
+
+static const struct regmap_irq nvvrs_rtc_irq[] = {
+	REGMAP_IRQ_REG(NVVRS_INT_RTC_INDEX, 0, NVVRS_PSEQ_INT_SRC1_RTC_MASK),
+};
+
+static const struct regmap_irq_chip nvvrs_rtc_irq_chip = {
+	.name	   = "nvvrs-rtc",
+	.status_base    = NVVRS_PSEQ_REG_INT_SRC1,
+	.num_regs       = 1,
+	.irqs	   = nvvrs_rtc_irq,
+	.num_irqs       = ARRAY_SIZE(nvvrs_rtc_irq),
+};
+
+static const u8 rtc_map[RTC_END] = {
+	[RTC_T3] = NVVRS_PSEQ_REG_RTC_T3,
+	[RTC_T2] = NVVRS_PSEQ_REG_RTC_T2,
+	[RTC_T1] = NVVRS_PSEQ_REG_RTC_T1,
+	[RTC_T0] = NVVRS_PSEQ_REG_RTC_T0,
+	[RTC_A3] = NVVRS_PSEQ_REG_RTC_A3,
+	[RTC_A2] = NVVRS_PSEQ_REG_RTC_A2,
+	[RTC_A1] = NVVRS_PSEQ_REG_RTC_A1,
+	[RTC_A0] = NVVRS_PSEQ_REG_RTC_A0,
+	[CTL1_REG]  = NVVRS_PSEQ_REG_CTL_1,
+	[CTL2_REG]  = NVVRS_PSEQ_REG_CTL_2,
+};
+
+static int nvvrs_update_bits(struct nvvrs_rtc_info *info, u8 reg,
+			     u8 mask, u8 value)
+{
+	int ret;
+	u8 val;
+
+	ret = i2c_smbus_read_byte_data(info->client, reg);
+	if (ret < 0) {
+		dev_err(info->dev, "Failed to read reg:0x%02x ret:(%d)\n",
+			reg, ret);
+		return ret;
+	}
+	val = (u8)ret;
+	val &= ~mask;
+	val |= (value & mask);
+
+	ret = i2c_smbus_write_byte_data(info->client, reg, val);
+	if (ret < 0)
+		dev_err(info->dev, "Failed to write reg:0x%02x val:0x%02x ret:(%d)\n",
+			reg, val, ret);
+
+	return ret;
+}
+
+static int nvvrs_rtc_update_alarm_reg(struct i2c_client *client,
+				      struct nvvrs_rtc_info *info, u8 *time)
+{
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, info->map[RTC_A3], time[3]);
+	if (ret < 0) {
+		dev_err(info->dev, "Failed to write alarm reg: 0x%02x ret:(%d)\n",
+			info->map[RTC_A3], ret);
+		goto out;
+	}
+
+	ret = i2c_smbus_write_byte_data(client, info->map[RTC_A2], time[2]);
+	if (ret < 0) {
+		dev_err(info->dev, "Failed to write alarm reg: 0x%02x ret:(%d)\n",
+			info->map[RTC_A2], ret);
+		goto out;
+	}
+
+	ret = i2c_smbus_write_byte_data(client, info->map[RTC_A1], time[1]);
+	if (ret < 0) {
+		dev_err(info->dev, "Failed to write alarm reg: 0x%02x ret:(%d)\n",
+			info->map[RTC_A1], ret);
+		goto out;
+	}
+
+	ret = i2c_smbus_write_byte_data(client, info->map[RTC_A0], time[0]);
+	if (ret < 0) {
+		dev_err(info->dev, "Failed to write alarm reg: 0x%02x ret:(%d)\n",
+			info->map[RTC_A0], ret);
+		goto out;
+	}
+
+out:
+	return ret;
+}
+
+static int nvvrs_rtc_enable_alarm(struct nvvrs_rtc_info *info)
+{
+	int ret;
+
+	/* Set RTC_WAKE bit for autonomous wake from sleep */
+	ret = nvvrs_update_bits(info, info->map[CTL2_REG],
+				NVVRS_PSEQ_REG_CTL_2_RTC_WAKE,
+				NVVRS_PSEQ_REG_CTL_2_RTC_WAKE);
+	if (ret < 0) {
+		dev_err(info->dev, "Failed to set RTC_WAKE bit (%d)\n", ret);
+		return ret;
+	}
+
+	/* Set RTC_PU bit for autonomous wake from shutdown */
+	ret = nvvrs_update_bits(info, info->map[CTL2_REG],
+				NVVRS_PSEQ_REG_CTL_2_RTC_PU,
+				NVVRS_PSEQ_REG_CTL_2_RTC_PU);
+	if (ret < 0) {
+		dev_err(info->dev, "Failed to set RTC_PU bit (%d)\n", ret);
+		return ret;
+	}
+
+	return ret;
+}
+
+static int nvvrs_rtc_disable_alarm(struct nvvrs_rtc_info *info)
+{
+	struct i2c_client *client = info->client;
+	u8 val[REG_LEN_IN_BYTES];
+	int ret;
+
+	/* Clear RTC_WAKE bit */
+	ret = nvvrs_update_bits(info, info->map[CTL2_REG],
+				NVVRS_PSEQ_REG_CTL_2_RTC_WAKE, 0);
+	if (ret < 0) {
+		dev_err(info->dev, "Failed to clear RTC_WAKE bit (%d)\n", ret);
+		goto out;
+	}
+
+	/* Clear RTC_PU bit */
+	ret = nvvrs_update_bits(info, info->map[CTL2_REG],
+				NVVRS_PSEQ_REG_CTL_2_RTC_PU, 0);
+	if (ret < 0) {
+		dev_err(info->dev, "Failed to clear RTC_PU bit (%d)\n", ret);
+		goto out;
+	}
+
+	/* Write ALARM_RESET_VAL in RTC Alarm register to disable alarm */
+	val[0] = 0xff;
+	val[1] = 0xff;
+	val[2] = 0xff;
+	val[3] = 0xff;
+
+	ret = nvvrs_rtc_update_alarm_reg(client, info, val);
+	if (ret < 0) {
+		dev_err(info->dev, "Failed to disable Alarm (%d)\n", ret);
+		goto out;
+	}
+out:
+	return ret;
+}
+
+static irqreturn_t nvvrs_rtc_irq_handler(int irq, void *data)
+{
+	struct nvvrs_rtc_info *info = data;
+
+	dev_dbg(info->dev, "RTC alarm IRQ: %d\n", irq);
+
+	rtc_update_irq(info->rtc_dev, 1, RTC_IRQF | RTC_AF);
+
+	return IRQ_HANDLED;
+}
+
+static int nvvrs_rtc_read_time(struct device *dev, struct rtc_time *tm)
+{
+	struct nvvrs_rtc_info *info = dev_get_drvdata(dev);
+	struct i2c_client *client = info->client;
+	time64_t secs = 0;
+	int ret;
+	u8 val;
+
+	mutex_lock(&info->lock);
+
+	/* Multi-byte transfers are not supported with PEC enabled */
+	/* Read MSB first to avoid coherency issues */
+	ret = i2c_smbus_read_byte_data(client, info->map[RTC_T3]);
+	if (ret < 0) {
+		dev_err(info->dev, "Failed to read time reg:0x%02x ret:(%d)\n",
+			info->map[RTC_T3], ret);
+		goto out;
+	}
+	val = (u8)ret;
+	secs |= (time64_t)val << 24;
+
+	ret = i2c_smbus_read_byte_data(client, info->map[RTC_T2]);
+	if (ret < 0) {
+		dev_err(info->dev, "Failed to read time reg:0x%02x ret:(%d)\n",
+			info->map[RTC_T2], ret);
+		goto out;
+	}
+	val = (u8)ret;
+	secs |= (time64_t)val << 16;
+
+	ret = i2c_smbus_read_byte_data(client, info->map[RTC_T1]);
+	if (ret < 0) {
+		dev_err(info->dev, "Failed to read time reg:0x%02x ret:(%d)\n",
+			info->map[RTC_T1], ret);
+		goto out;
+	}
+	val = (u8)ret;
+	secs |= (time64_t)val << 8;
+
+	ret = i2c_smbus_read_byte_data(client, info->map[RTC_T0]);
+	if (ret < 0) {
+		dev_err(info->dev, "Failed to read time reg:0x%02x ret:(%d)\n",
+			info->map[RTC_T0], ret);
+		goto out;
+	}
+	val = (u8)ret;
+	secs |= val;
+
+	rtc_time64_to_tm(secs, tm);
+out:
+	mutex_unlock(&info->lock);
+	return ret;
+}
+
+static int nvvrs_rtc_set_time(struct device *dev, struct rtc_time *tm)
+{
+	struct nvvrs_rtc_info *info = dev_get_drvdata(dev);
+	struct i2c_client *client = info->client;
+	u8 time[REG_LEN_IN_BYTES];
+	time64_t secs;
+	int ret;
+
+	mutex_lock(&info->lock);
+
+	secs = rtc_tm_to_time64(tm);
+	time[0] = secs & 0xff;
+	time[1] = (secs >> 8) & 0xff;
+	time[2] = (secs >> 16) & 0xff;
+	time[3] = (secs >> 24) & 0xff;
+
+	ret = i2c_smbus_write_byte_data(client, info->map[RTC_T3], time[3]);
+	if (ret < 0) {
+		dev_err(info->dev, "Failed to write time reg: 0x%02x ret:(%d)\n",
+			info->map[RTC_T3], ret);
+		goto out;
+	}
+
+	ret = i2c_smbus_write_byte_data(client, info->map[RTC_T2], time[2]);
+	if (ret < 0) {
+		dev_err(info->dev, "Failed to write time reg: 0x%02x ret:(%d)\n",
+			info->map[RTC_T2], ret);
+		goto out;
+	}
+
+	ret = i2c_smbus_write_byte_data(client, info->map[RTC_T1], time[1]);
+	if (ret < 0) {
+		dev_err(info->dev, "Failed to write time reg: 0x%02x ret:(%d)\n",
+			info->map[RTC_T1], ret);
+		goto out;
+	}
+
+	ret = i2c_smbus_write_byte_data(client, info->map[RTC_T0], time[0]);
+	if (ret < 0) {
+		dev_err(info->dev, "Failed to write time reg: 0x%02x ret:(%d)\n",
+			info->map[RTC_T0], ret);
+		goto out;
+	}
+
+out:
+	mutex_unlock(&info->lock);
+	return ret;
+}
+
+static int nvvrs_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct nvvrs_rtc_info *info = dev_get_drvdata(dev);
+	struct i2c_client *client = info->client;
+	time64_t alarm_val = 0;
+	int ret;
+	u8 val;
+
+	mutex_lock(&info->lock);
+
+	/* Multi-byte transfers are not supported with PEC enabled */
+	ret = i2c_smbus_read_byte_data(client, info->map[RTC_A3]);
+	if (ret < 0) {
+		dev_err(info->dev, "Failed to read alarm reg:0x%02x ret:(%d)\n",
+			info->map[RTC_A3], ret);
+		goto out;
+	}
+	val = (u8)ret;
+	alarm_val |= (time64_t)val << 24;
+
+	ret = i2c_smbus_read_byte_data(client, info->map[RTC_A2]);
+	if (ret < 0) {
+		dev_err(info->dev, "Failed to read alarm reg:0x%02x ret:(%d)\n",
+			info->map[RTC_A2], ret);
+		goto out;
+	}
+	val = (u8)ret;
+	alarm_val |= (time64_t)val << 16;
+
+	ret = i2c_smbus_read_byte_data(client, info->map[RTC_A1]);
+	if (ret < 0) {
+		dev_err(info->dev, "Failed to read alarm reg:0x%02x ret:(%d)\n",
+			info->map[RTC_A1], ret);
+		goto out;
+	}
+	val = (u8)ret;
+	alarm_val |= (time64_t)val << 8;
+
+	ret = i2c_smbus_read_byte_data(client, info->map[RTC_A0]);
+	if (ret < 0) {
+		dev_err(info->dev, "Failed to read alarm reg:0x%02x ret:(%d)\n",
+			info->map[RTC_A0], ret);
+		goto out;
+	}
+	val = (u8)ret;
+	alarm_val |= val;
+
+	if (alarm_val == ALARM_RESET_VAL)
+		alrm->enabled = 0;
+	else
+		alrm->enabled = 1;
+
+	rtc_time64_to_tm(alarm_val, &alrm->time);
+out:
+	mutex_unlock(&info->lock);
+	return ret;
+}
+
+static int nvvrs_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct nvvrs_rtc_info *info = dev_get_drvdata(dev);
+	struct i2c_client *client = info->client;
+	u8 time[REG_LEN_IN_BYTES];
+	time64_t secs;
+	int ret;
+
+	mutex_lock(&info->lock);
+
+	ret = nvvrs_rtc_enable_alarm(info);
+	if (ret < 0) {
+		dev_err(info->dev, "Failed to enable alarm! (%d)\n", ret);
+		goto out;
+	}
+
+	secs = rtc_tm_to_time64(&alrm->time);
+	time[0] = secs & 0xff;
+	time[1] = (secs >> 8) & 0xff;
+	time[2] = (secs >> 16) & 0xff;
+	time[3] = (secs >> 24) & 0xff;
+
+	ret = nvvrs_rtc_update_alarm_reg(client, info, time);
+
+	alrm->enabled = 1;
+out:
+	mutex_unlock(&info->lock);
+	return ret;
+}
+
+static int nvvrs_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
+{
+	struct nvvrs_rtc_info *info = dev_get_drvdata(dev);
+	int ret = 0;
+
+	mutex_lock(&info->lock);
+	if (enabled)
+		ret = nvvrs_rtc_enable_alarm(info);
+	else
+		ret = nvvrs_rtc_disable_alarm(info);
+
+	mutex_unlock(&info->lock);
+	return ret;
+}
+
+static const struct rtc_class_ops nvvrs_rtc_ops = {
+	.read_time = nvvrs_rtc_read_time,
+	.set_time = nvvrs_rtc_set_time,
+	.read_alarm = nvvrs_rtc_read_alarm,
+	.set_alarm = nvvrs_rtc_set_alarm,
+	.alarm_irq_enable = nvvrs_rtc_alarm_irq_enable,
+};
+
+static int nvvrs_rtc_probe(struct platform_device *pdev)
+{
+	struct nvvrs_rtc_info *info;
+	struct device *parent;
+	struct i2c_client *client;
+	int ret;
+
+	info = devm_kzalloc(&pdev->dev, sizeof(struct nvvrs_rtc_info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to get irq\n");
+		return ret;
+	}
+	info->rtc_irq = ret;
+
+	mutex_init(&info->lock);
+	info->dev = &pdev->dev;
+	parent = info->dev->parent;
+	client = to_i2c_client(parent);
+	client->flags |= I2C_CLIENT_PEC;
+	i2c_set_clientdata(client, info);
+	info->client = client;
+	info->map = rtc_map;
+	info->rtc_irq_chip = &nvvrs_rtc_irq_chip;
+	platform_set_drvdata(pdev, info);
+
+	/* Initialize regmap */
+	info->regmap = dev_get_regmap(parent, NULL);
+	if (!info->regmap) {
+		dev_err(info->dev, "Failed to get RTC regmap\n");
+		return -ENODEV;
+	}
+
+	/* RTC as a wakeup source */
+	device_init_wakeup(info->dev, 1);
+
+	/* Register RTC device */
+	info->rtc_dev = devm_rtc_device_register(info->dev, "nvvrs-rtc",
+						 &nvvrs_rtc_ops, THIS_MODULE);
+
+	if (IS_ERR(info->rtc_dev)) {
+		ret = PTR_ERR(info->rtc_dev);
+		dev_err(&pdev->dev, "Failed to register RTC device: %d\n", ret);
+		return ret;
+	}
+
+	ret = request_threaded_irq(info->rtc_irq, NULL, nvvrs_rtc_irq_handler, 0,
+				   "rtc-alarm", info);
+	if (ret < 0)
+		dev_err(&pdev->dev, "Failed to request alarm IRQ: %d: %d\n",
+			info->rtc_irq, ret);
+
+	return ret;
+}
+
+static void nvvrs_rtc_remove(struct platform_device *pdev)
+{
+	struct nvvrs_rtc_info *info = platform_get_drvdata(pdev);
+
+	free_irq(info->rtc_irq, info);
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int nvvrs_rtc_suspend(struct device *dev)
+{
+	struct nvvrs_rtc_info *info = dev_get_drvdata(dev);
+	int ret = 0;
+
+	if (device_may_wakeup(dev)) {
+		/* Set RTC_WAKE bit for auto wake system from suspend state */
+		ret = nvvrs_update_bits(info, info->map[CTL2_REG],
+					NVVRS_PSEQ_REG_CTL_2_RTC_WAKE,
+					NVVRS_PSEQ_REG_CTL_2_RTC_WAKE);
+		if (ret < 0) {
+			dev_err(info->dev, "Failed to set RTC_WAKE bit (%d)\n", ret);
+			return ret;
+		}
+
+		ret = enable_irq_wake(info->rtc_irq);
+	}
+
+	return ret;
+}
+
+static int nvvrs_rtc_resume(struct device *dev)
+{
+	struct nvvrs_rtc_info *info = dev_get_drvdata(dev);
+	int ret;
+
+	if (device_may_wakeup(dev)) {
+		/* Clear FORCE_ACT bit */
+		ret = nvvrs_update_bits(info, info->map[CTL1_REG],
+					NVVRS_PSEQ_REG_CTL_1_FORCE_ACT, 0);
+		if (ret < 0) {
+			dev_err(info->dev, "Failed to clear FORCE_ACT bit (%d)\n", ret);
+			return ret;
+		}
+
+		return disable_irq_wake(info->rtc_irq);
+	}
+
+	return 0;
+}
+
+#endif
+static SIMPLE_DEV_PM_OPS(nvvrs_rtc_pm_ops, nvvrs_rtc_suspend, nvvrs_rtc_resume);
+
+static const struct platform_device_id nvvrs_rtc_id[] = {
+	{ "nvvrs-pseq-rtc", },
+	{ },
+};
+MODULE_DEVICE_TABLE(platform, nvvrs_rtc_id);
+
+static struct platform_driver nvvrs_rtc_driver = {
+	.driver		= {
+		.name   = "nvvrs-pseq-rtc",
+		.pm     = &nvvrs_rtc_pm_ops,
+	},
+	.probe		= nvvrs_rtc_probe,
+	.remove	        = nvvrs_rtc_remove,
+	.id_table       = nvvrs_rtc_id,
+};
+
+module_platform_driver(nvvrs_rtc_driver);
+
+MODULE_AUTHOR("Shubhi Garg <shgarg@nvidia.com>");
+MODULE_DESCRIPTION("NVVRS PSEQ RTC driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1

