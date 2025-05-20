Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B0126772A;
	Tue, 20 May 2025 09:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747732141; cv=fail; b=GTlu6OLj9KFEqfa15vVNS609GiiFCb/MyojWiyaaLxa1DheK0ff29iTMXmlP9pQqBNjTIKyI5cbtR6RNJ9d9N1MwihD+zcnf0UipMqDqhxoepquCbUSaBaYqjvPa10VH0wb37ycWgUCnXYjaktHggu7FJyJQ1TbiAWlUehZA5Ww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747732141; c=relaxed/simple;
	bh=7LT3SdVgY93qs1C+xVO+wsVrJWTo3relUGbBKwQAuCw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PpML/beSCYVJ8x2N6CDdwWx6wAGNY5SUl5ped4k6gSLJm5wRY6bzpoXSlZHgpSWPfWokrxZUALVdorfnm1WDlL6KTEkBJOvOgNUkaROeRBQ9ML2UXCwAkyUQ8BWJIPcvy6DDw7aSkkqm26CoIiPNAvDTguYqnuzgLENvd5Bt6Yo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nwBLH7XO; arc=fail smtp.client-ip=40.107.237.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nwBLH7XO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OLZHwG3l7KyCvJc/oQvWHoQuaQJdD5y2AT+KuPHlAq3dGjf8W/7I0aUXvQoFWDxLa+D4lmkLUl46SYvnTo9nQVOanpZA8xzwaZBY2lRADf7d462UFD0l9+oYcmPoyV1SumalFJCGcS0nmgx2S3La4EdxWPjpxJ6Hwa45HW3CuvKj2S1WFR0bSpD0+GODDB+T7coRuJqprz6npoJq+aW5SsKDrnQQVwS9ojRVtctSSFs1n1d94lNLIVKH5kteEP4b3AfAFLH69NiULqrcQ7XZtMG3R/JHXEwj0PD41OtZPD+zQfp/UbzH31ixtvcMCuwJvTT0lX+24seFaek9je3GVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+EMPZ/kgUVNfmU3zsPVylPaG+6rQNB/PgWEJhnLacE=;
 b=EanVm7omsKmGWH+1CC8HHg8ZTmSnvPlqG6UOU92Q4k9kJok0vZ/nuQOwdmQOh/E2W1EgFRGnGxF3tcaGu2rPScb9gk5cUu3CCUekB6HxDA+y7Ikbq56tPQYUNqb6YbM9Y8Xv0vdrfVSkYj8CnQqNgSr8RW9G9ndmgK5lSTFOdR2KlzmZChMtSBn9sav0bN5+aXxHuzfRKLCmFpenB2x4Djxa3fqLUAcUEiZCcfzvUC52IJ87Wo6EsQfuv4Wi75r5DFopvOlzRSawoBQ9f4Di62mze6sG3nuSS1PaOeIiDVNkJVTri8ZL4yvyApphGyszfzUpGjW5HA041stUZja7qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+EMPZ/kgUVNfmU3zsPVylPaG+6rQNB/PgWEJhnLacE=;
 b=nwBLH7XOLbUFjI7MYKGm9+3IwInL+vQ03yPmZGzemDEgutpgXG7R/i8m/6jUM+dn4QvxeGigPPJ66nymqfT1lIpCc2yG+OPEE1uUDRAyekwNYDhyXd6P8rWAp/WnMDVQlnSJfdCjEnbLe4Zczdw7NbE6qZig7qo5+D/5jE3YYmK0inNiBFAwGzVk1BoWav+Ub8mA8dogsCrVvrTcqm4ksU1QDq34r+W42I31kVHwxmGtauHB3rgiICRdFjHD2iE7Qb8gBbkZVkiuS/uo02GVzgMWCeEm6dBfqNs1/1Pn2ATI52RT3qI5AVUNyZL+rdHfewK+z21hS4zPykGaWRQQkA==
Received: from CH0PR03CA0204.namprd03.prod.outlook.com (2603:10b6:610:e4::29)
 by DM6PR12MB4186.namprd12.prod.outlook.com (2603:10b6:5:21b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 09:08:52 +0000
Received: from CH1PEPF0000AD76.namprd04.prod.outlook.com
 (2603:10b6:610:e4:cafe::8) by CH0PR03CA0204.outlook.office365.com
 (2603:10b6:610:e4::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.30 via Frontend Transport; Tue,
 20 May 2025 09:08:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD76.mail.protection.outlook.com (10.167.244.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Tue, 20 May 2025 09:08:52 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 20 May
 2025 02:08:40 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 20 May
 2025 02:08:40 -0700
Received: from build-shgarg-noble-20250422.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.1544.14 via
 Frontend Transport; Tue, 20 May 2025 02:08:40 -0700
From: Shubhi Garg <shgarg@nvidia.com>
To: <jonathanh@nvidia.com>, <lee@kernel.org>, <robh@kernel.org>,
	<krzk@kernel.org>, <alexandre.belloni@bootlin.com>,
	<thierry.reding@gmail.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Shubhi Garg <shgarg@nvidia.com>
Subject: [PATCH V2 4/6] rtc: nvvrs: add NVIDIA VRS PSEQ RTC device driver
Date: Tue, 20 May 2025 09:08:30 +0000
Message-ID: <20250520090832.3564104-5-shgarg@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD76:EE_|DM6PR12MB4186:EE_
X-MS-Office365-Filtering-Correlation-Id: 95db3c7d-5b7e-4954-ae71-08dd977df0ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?khxCsx4zqpTGtN4+lE045ytRKLrlYjiJXb8FbVdlIexEfWt+XdhUIUDFeZUn?=
 =?us-ascii?Q?gwG3LO+wDENBEUhPz/XWk2bbXSXO26n4gksJWgL3E/t5qmuc3c6knaLU2wI1?=
 =?us-ascii?Q?2EttpjCCD8HpJkqNo6jp+79nAG0rDqrVzHjxtA9BAqsIIG+KoxOrkQzEInzz?=
 =?us-ascii?Q?JJoInV8U1wVJJ8pSNctp3/UwGFtdODpJp+u7FZlOSZHbk9SKv00aBglRBtRU?=
 =?us-ascii?Q?eLSn9dBL6fkxDss5MvALVnnC1NlfpZpIpTWcxc0tJZU4C6tPN8+Qt0fQsLEr?=
 =?us-ascii?Q?zXwZmR2R5nnjFbRdTVkeJkL+/xXyNoz+toDiq7Z3X29nNWCOHTXU4a9um2ET?=
 =?us-ascii?Q?BgXwrhseQ4frAj282PxHTlr9MKPmGU8lfwXaG+ByKAzOzDng2TmLxmbKcVMx?=
 =?us-ascii?Q?+FIBYuMQ4blYOCM2Ec5m4N/cAtK0j6rX0qEQhJnXJNhh2CQvtEuwphmd9585?=
 =?us-ascii?Q?mhxuec78dc4s9qYcZL147/A4GrPA6/0/9hdT9YwH7OMcp1d8W/+MEc9RIP1j?=
 =?us-ascii?Q?fAK1TxATYf7uh2Aj55sxuictu4SwJqZO36wO8sS5PDF7DSCO8E5dGC755Iyb?=
 =?us-ascii?Q?BFJivKjON9mrfxOojcEEB7s6EJyQg9CCmC/3qrhuc0sbgDXgPQm8uReY++0F?=
 =?us-ascii?Q?YXOn+MvE0hbzT2/WGPKZvhrGaAQ3asQPPV+W1X4PvTvBj8qnuZROKDSxHX+1?=
 =?us-ascii?Q?1R3zaQlZDtwXENQTupd+7i+tX67IfL/Eq0PfPneWj3ixs22GhMv1J2//G7h9?=
 =?us-ascii?Q?muHVlB+Q54LyDs74zYlFYIx16s8in9KLWvu/MgsGf5Ki3dkCeYyRmyLnbM9C?=
 =?us-ascii?Q?4jltGo5shPcM2Ncz9ikp9qJYhw+IK7pdshtFBaTwfqnDuYpyeSqZFYAKPFM4?=
 =?us-ascii?Q?586BURZBkzuYq0kxTigfQbGXYqoemGTwj7N9oyO5W+z7ZxogsOmieQCuVEz+?=
 =?us-ascii?Q?HrodkYRziYimYkF8peNCinnDp0GOWfXZvChdJ55k/ekuge07N9twDzBe1cr0?=
 =?us-ascii?Q?QkcdkJMOjEV9aqghcVFDkSdXr3sU7Abv8DttjAJsN/QiRUcVuvF22xGhmNbU?=
 =?us-ascii?Q?7yfEho4Mt+M14prKOJlJSSNRogcGfp0Gl06zciC1VggvUg/a/bw+nTobpMRp?=
 =?us-ascii?Q?bjC7s7gC3hFawVNC+ZqeKCEioDB/nr3uXH0X+3SjQIW8tT1Qo/SbXN0MTndK?=
 =?us-ascii?Q?J1X4Y9MXXinymsp3srIv2S2H4sSsOPYEV/aXtrOpUj2AaHdv0Af8dmjHpKQk?=
 =?us-ascii?Q?dxhtkVo41l6g8NcbVUanl1MjIuSyMaPSo9stle0PpEc75EPkkQ+VLNECaGiQ?=
 =?us-ascii?Q?N9TFhBLGWXmIONwZ3e07XKIGOX3OfOxo6bQgdJORTHMv1yd9Hl6+K7iOKxy3?=
 =?us-ascii?Q?sBYHZCcBeZvKGGC4lHtmZsSOShaUIo/fvJz4vfNAtuJoFNK+OPemZHrHxtjK?=
 =?us-ascii?Q?yeblf5t91cXRcdL01NUh+JZUvZyhikQ51lumuRpd25G2HQfx7DKWtOmvKzoA?=
 =?us-ascii?Q?w/Tq6AAtCFzcDNKqYh7ttTggXzuNNIMAKQl5?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 09:08:52.4209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95db3c7d-5b7e-4954-ae71-08dd977df0ec
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD76.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4186

Add support for NVIDIA VRS (Voltage Regulator Specification) Power
Sequencer RTC device driver. This RTC can be used to get/set system
time, retain system time across boot, wake system from suspend and
shutdown state.

Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
---

v2:
- removed regmap struct since it is not required
- removed rtc_map definition to directly use register definition
- removed unnecessary dev_err logs
- fixed dev_err logs to dev_dbg
- used rtc_lock/unlock in irq handler
- changed RTC allocation and register APIs as per latest kernel
- removed nvvrs_rtc_remove function since it's not required

 drivers/rtc/Kconfig               |  10 +
 drivers/rtc/Makefile              |   1 +
 drivers/rtc/rtc-nvidia-vrs-pseq.c | 456 ++++++++++++++++++++++++++++++
 3 files changed, 467 insertions(+)
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
index 000000000000..1379e8c64e94
--- /dev/null
+++ b/drivers/rtc/rtc-nvidia-vrs-pseq.c
@@ -0,0 +1,456 @@
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
+#define ALARM_RESET_VAL		0xffffffff /* Alarm reset/disable value */
+#define NVVRS_INT_RTC_INDEX	0	   /* Only one RTC interrupt register */
+
+struct nvvrs_rtc_info {
+	struct device          *dev;
+	struct i2c_client      *client;
+	struct rtc_device      *rtc_dev;
+	unsigned int           rtc_irq;
+	const struct regmap_irq_chip *rtc_irq_chip;
+	struct regmap_irq_chip_data *rtc_irq_data;
+	/* Mutex to protect RTC operations */
+	struct mutex           lock;
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
+static int nvvrs_update_bits(struct nvvrs_rtc_info *info, u8 reg,
+			     u8 mask, u8 value)
+{
+	int ret;
+	u8 val;
+
+	ret = i2c_smbus_read_byte_data(info->client, reg);
+	if (ret < 0)
+		return ret;
+
+	val = (u8)ret;
+	val &= ~mask;
+	val |= (value & mask);
+
+	return i2c_smbus_write_byte_data(info->client, reg, val);
+}
+
+static int nvvrs_rtc_update_alarm_reg(struct i2c_client *client,
+				      struct nvvrs_rtc_info *info, u8 *time)
+{
+	int ret;
+
+	ret = i2c_smbus_write_byte_data(client, NVVRS_PSEQ_REG_RTC_A3, time[3]);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_write_byte_data(client, NVVRS_PSEQ_REG_RTC_A2, time[2]);
+	if (ret < 0)
+		return ret;
+
+	ret = i2c_smbus_write_byte_data(client, NVVRS_PSEQ_REG_RTC_A1, time[1]);
+	if (ret < 0)
+		return ret;
+
+	return i2c_smbus_write_byte_data(client, NVVRS_PSEQ_REG_RTC_A0, time[0]);
+}
+
+static int nvvrs_rtc_enable_alarm(struct nvvrs_rtc_info *info)
+{
+	int ret;
+
+	/* Set RTC_WAKE bit for autonomous wake from sleep */
+	ret = nvvrs_update_bits(info, NVVRS_PSEQ_REG_CTL_2,
+				NVVRS_PSEQ_REG_CTL_2_RTC_WAKE,
+				NVVRS_PSEQ_REG_CTL_2_RTC_WAKE);
+	if (ret < 0) {
+		dev_dbg(info->dev, "Failed to set RTC_WAKE bit (%d)\n", ret);
+		return ret;
+	}
+
+	/* Set RTC_PU bit for autonomous wake from shutdown */
+	ret = nvvrs_update_bits(info, NVVRS_PSEQ_REG_CTL_2,
+				NVVRS_PSEQ_REG_CTL_2_RTC_PU,
+				NVVRS_PSEQ_REG_CTL_2_RTC_PU);
+	if (ret < 0) {
+		dev_dbg(info->dev, "Failed to set RTC_PU bit (%d)\n", ret);
+		return ret;
+	}
+
+	return ret;
+}
+
+static int nvvrs_rtc_disable_alarm(struct nvvrs_rtc_info *info)
+{
+	struct i2c_client *client = info->client;
+	u8 val[4];
+	int ret;
+
+	/* Clear RTC_WAKE bit */
+	ret = nvvrs_update_bits(info, NVVRS_PSEQ_REG_CTL_2,
+				NVVRS_PSEQ_REG_CTL_2_RTC_WAKE, 0);
+	if (ret < 0) {
+		dev_dbg(info->dev, "Failed to clear RTC_WAKE bit (%d)\n", ret);
+		return ret;
+	}
+
+	/* Clear RTC_PU bit */
+	ret = nvvrs_update_bits(info, NVVRS_PSEQ_REG_CTL_2,
+				NVVRS_PSEQ_REG_CTL_2_RTC_PU, 0);
+	if (ret < 0) {
+		dev_dbg(info->dev, "Failed to clear RTC_PU bit (%d)\n", ret);
+		return ret;
+	}
+
+	/* Write ALARM_RESET_VAL in RTC Alarm register to disable alarm */
+	val[0] = 0xff;
+	val[1] = 0xff;
+	val[2] = 0xff;
+	val[3] = 0xff;
+
+	ret = nvvrs_rtc_update_alarm_reg(client, info, val);
+	if (ret < 0)
+		dev_dbg(info->dev, "Failed to disable Alarm (%d)\n", ret);
+
+	return ret;
+}
+
+static irqreturn_t nvvrs_rtc_irq_handler(int irq, void *data)
+{
+	struct nvvrs_rtc_info *info = data;
+
+	dev_dbg(info->dev, "RTC alarm IRQ: %d\n", irq);
+
+	rtc_lock(info->rtc_dev);
+	rtc_update_irq(info->rtc_dev, 1, RTC_IRQF | RTC_AF);
+	rtc_unlock(info->rtc_dev);
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
+	ret = i2c_smbus_read_byte_data(client, NVVRS_PSEQ_REG_RTC_T3);
+	if (ret < 0)
+		goto out;
+
+	val = (u8)ret;
+	secs |= (time64_t)val << 24;
+
+	ret = i2c_smbus_read_byte_data(client, NVVRS_PSEQ_REG_RTC_T2);
+	if (ret < 0)
+		goto out;
+
+	val = (u8)ret;
+	secs |= (time64_t)val << 16;
+
+	ret = i2c_smbus_read_byte_data(client, NVVRS_PSEQ_REG_RTC_T1);
+	if (ret < 0)
+		goto out;
+
+	val = (u8)ret;
+	secs |= (time64_t)val << 8;
+
+	ret = i2c_smbus_read_byte_data(client, NVVRS_PSEQ_REG_RTC_T0);
+	if (ret < 0)
+		goto out;
+
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
+	u8 time[4];
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
+	ret = i2c_smbus_write_byte_data(client, NVVRS_PSEQ_REG_RTC_T3, time[3]);
+	if (ret < 0)
+		goto out;
+
+	ret = i2c_smbus_write_byte_data(client, NVVRS_PSEQ_REG_RTC_T2, time[2]);
+	if (ret < 0)
+		goto out;
+
+	ret = i2c_smbus_write_byte_data(client, NVVRS_PSEQ_REG_RTC_T1, time[1]);
+	if (ret < 0)
+		goto out;
+
+	ret = i2c_smbus_write_byte_data(client, NVVRS_PSEQ_REG_RTC_T0, time[0]);
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
+	ret = i2c_smbus_read_byte_data(client, NVVRS_PSEQ_REG_RTC_A3);
+	if (ret < 0)
+		goto out;
+
+	val = (u8)ret;
+	alarm_val |= (time64_t)val << 24;
+
+	ret = i2c_smbus_read_byte_data(client, NVVRS_PSEQ_REG_RTC_A2);
+	if (ret < 0)
+		goto out;
+
+	val = (u8)ret;
+	alarm_val |= (time64_t)val << 16;
+
+	ret = i2c_smbus_read_byte_data(client, NVVRS_PSEQ_REG_RTC_A1);
+	if (ret < 0)
+		goto out;
+
+	val = (u8)ret;
+	alarm_val |= (time64_t)val << 8;
+
+	ret = i2c_smbus_read_byte_data(client, NVVRS_PSEQ_REG_RTC_A0);
+	if (ret < 0)
+		goto out;
+
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
+	u8 time[4];
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
+	mutex_init(&info->lock);
+
+	ret = platform_get_irq(pdev, 0);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "Failed to get irq\n");
+		return ret;
+	}
+	info->rtc_irq = ret;
+
+	info->dev = &pdev->dev;
+	parent = info->dev->parent;
+	client = to_i2c_client(parent);
+	client->flags |= I2C_CLIENT_PEC;
+	i2c_set_clientdata(client, info);
+	info->client = client;
+	info->rtc_irq_chip = &nvvrs_rtc_irq_chip;
+	platform_set_drvdata(pdev, info);
+
+	/* Allocate RTC device */
+	info->rtc_dev = devm_rtc_allocate_device(info->dev);
+	if (IS_ERR(info->rtc_dev))
+		return PTR_ERR(info->rtc_dev);
+
+	info->rtc_dev->ops = &nvvrs_rtc_ops;
+	info->rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	info->rtc_dev->range_max = RTC_TIMESTAMP_END_2099;
+
+	ret = devm_request_threaded_irq(info->dev, info->rtc_irq, NULL,
+					nvvrs_rtc_irq_handler, 0, "rtc-alarm", info);
+	if (ret < 0)
+		dev_err(&pdev->dev, "Failed to request alarm IRQ: %d: %d\n",
+			info->rtc_irq, ret);
+
+	/* RTC as a wakeup source */
+	device_init_wakeup(info->dev, true);
+
+	return devm_rtc_register_device(info->rtc_dev);
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
+		ret = nvvrs_update_bits(info, NVVRS_PSEQ_REG_CTL_2,
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
+		ret = nvvrs_update_bits(info, NVVRS_PSEQ_REG_CTL_1,
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
+	.id_table       = nvvrs_rtc_id,
+};
+
+module_platform_driver(nvvrs_rtc_driver);
+
+MODULE_AUTHOR("Shubhi Garg <shgarg@nvidia.com>");
+MODULE_DESCRIPTION("NVVRS PSEQ RTC driver");
+MODULE_LICENSE("GPL");
\ No newline at end of file
-- 
2.43.0

