Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013067.outbound.protection.outlook.com [40.93.196.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED402765E2;
	Wed, 24 Jun 2026 10:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782296697; cv=fail; b=MTIjgNAY9QM5804TnI5HdGTD5b+vxqMmQvck3lOZdLtKAEUqIzE7pzLQXbxk/5sqNFxW3278sNH0EFCoZGbXkR53cyipxSFnjSrwJCIZ127fpAaLwejEwqtWlEJ4Htvmj8MtXxHoJFS64h3Y6sotSWtXPnc3RsHwBwteU0zcDs0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782296697; c=relaxed/simple;
	bh=C8bE6LkDa96nmQG1LUop5JFyHY9X1BfyCA8ArkhCPL8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gkfvgkpltc2G0Ty7skFuhOT84tDXJqjz1hwyzFEM2qlD/PGL8nC0gSnIYKVyqhqm7DWY/UxbO1088UB7iH5dRan37oKx16Q8DWBBJoAcLrxGOSw4NFl/yQsN7qwRSueQUYMkYotkWp+3urB460yoW4i3OiSUuua/g9NM9isvHRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gv31o2xL; arc=fail smtp.client-ip=40.93.196.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gv31o2xL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=abIdeF/omW8HBevMLLMf3gmSXh8U+VK1sL3qhlEDiXB+wwSzw59Y1sgqaNvNPemgwMVUh09dHef5h7rkHpd9SdxdxBDbG4TR9WyFbu/rde9AYu/Le+ngivpIRKAT2trh6OReO2M8ZBOoW9Js7mslz0g5asz112WQGv+wmJUYbje2pevbirzwNNTF8PZodfmcbAwq/S6TYMTYMl0QJfl0igrZa4rmdPoYSyKN0C1lqFS+fjTLRywJK/Fj0QhDdOASTb/yJx+vwJOccq7hNDHxxSVP6jnYXVUNtnKqlq733KNm0O4u/qK+MmYcx37+1GV0atkoistB+TIT7FCcvgJSQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ya0juJ0y6/8op5CKi85AdUV8HmWe8onjEhiIMIK41sg=;
 b=W4AO00U3cEWkjaSF1r9JTv5B4PZQ+wOrL/YxQygaBJn7ICcTtHftULqgAKzdqND88pinT5fIN54CEYsX9T+KM9KxxW+mmCe395fuBLcDxnFw7rdWMMHI2ujKr9bC0QRXCAlQITKqfcCwCyR+WG7CJqvWFTcVcKoFxBUd2J2fKl0tSktHlblkPnohvx/hs9n0g4Tl4Sv9NGcn2B1d69G4aMcXSOLLxaqiPKh9IfBHOMFPe4PajydsAkwfb4HxIwqZnHb7MoyNiFkKeT2HhibK/KfQ8p6Zuj4IbLLqnOoV1+cZcfCTW3FOmDp1P/pDD5RXweYsminqM7htyHEJX8BKbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ya0juJ0y6/8op5CKi85AdUV8HmWe8onjEhiIMIK41sg=;
 b=gv31o2xLxs8T88xks9bn6dUY37VzsB0BrbS75qWSz7+S/RU0a41MmSZJDOXTF3sm82oVCU1Mg+R1LARduXaNpeHFNbtKUOzBZnPeAEpjsxKfj218HGCSsUmG1V8oBuGEcqo9Mtn71JCW1jneVZWRChQAv3vKkU69WCheAz9kEFuB8wbxAXQ15qUcnu6YdTSDAJjAxf4I44Hz7gfGwqtVrOEW50MPDqP8DbaVEgxdk/2C9W2CCxibrs3UtBGxgIFxtwBWaLWVDDCx8sMK8DKdnLar864bhymt+YPQs0p/wNGnHr+0y3Je0MC4WQ54IPddLuol7d6wGz5rzTr5pF06cw==
Received: from BL1PR13CA0348.namprd13.prod.outlook.com (2603:10b6:208:2c6::23)
 by IA1PR12MB7759.namprd12.prod.outlook.com (2603:10b6:208:420::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 10:24:50 +0000
Received: from BN1PEPF0000468E.namprd05.prod.outlook.com
 (2603:10b6:208:2c6:cafe::31) by BL1PR13CA0348.outlook.office365.com
 (2603:10b6:208:2c6::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.13 via Frontend Transport; Wed,
 24 Jun 2026 10:24:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF0000468E.mail.protection.outlook.com (10.167.243.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 10:24:49 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Jun
 2026 03:24:35 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Jun
 2026 03:24:33 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Wed, 24 Jun 2026 03:24:28 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Frank Li <Frank.Li@nxp.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
	Philipp Zabel <p.zabel@pengutronix.de>, Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Akhil R
	<akhilrajeev@nvidia.com>
Subject: [PATCH v5 11/12] hwmon: spd5118: Add I3C support
Date: Wed, 24 Jun 2026 10:21:05 +0000
Message-ID: <20260624102153.1770072-12-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
References: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468E:EE_|IA1PR12MB7759:EE_
X-MS-Office365-Filtering-Correlation-Id: c1929e99-f483-491c-67ef-08ded1dad279
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|23010399003|36860700016|1800799024|3023799007|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3MwPGSesFHPHWTsy+O3UjsldKD9rDB/RxwSmGtex3KOOBB5tCZY8BkyAm8pzaaa+sn+1Ob9KbQBLjstdbVdjKMGwWRRtAzb6fTaA2mXU6J6h7WT1R/P13qhuzVuUzZynbQRvvA2w1lDigeBjGTIRu4x6L8KySJQhpPjtuH/01Oasl+EB3v27a+FlCWCLg1k0/iptjdrdXFGDSlqr4LcgqG+hYP4nebYHCp4GVUGOvZoyehLzbElC0VhdshEbspKKRX+BYVbTBU/t7gUW7R90s1tjwnUbHvwHA9wacWQFunPQGc5rfvu0YER1mGHiyzJRx2UueqfrqoDE2a7FU47URa+XDtxahQeEv1rCYg4J5Oywrt0wL6fphwWTSZQZ1eCWMr69e8KvVo9VVWwLwANuPS19T9vnN1TSON3oFKLyAkwdiZcGZlZbTRN54OBrXdx7N8MR8gAWESwPua+F7nrdmapwjvArq2Sw5yDywYHYQoMhW5ZNNDY49JdoY8SvrIA4xZxuqz/uEhtWD7jVLOHJ+Ee3G/PrfMI3Yg4jO2jTJj9LvxYl1z2LQMQoeGdR54l0QYJqylf1YZhLrmzozCEAuGe4MbhF5cbZRvbUbTSKpUhLxPcUgqtiWhP1u4K1m1ltUZ3RaSSKNkXDncISStI6h0FmZy+XdQDjR/80DTMDWViz9gqAfL3sWEkg8omIdpQL489XwKlDsJ0RMUKztzxG8w==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(23010399003)(36860700016)(1800799024)(3023799007)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yKSKVSp/3XmbBJsqvF4jE7DfpXTiTL8M1eWwJSJJMgCSapDmjoGk70T0XjQiJ71O3X7B3ot+m7JSiKaQfpPIU9K4fuV5OdpjRFPXaLTtMPYLfwBAvHc7xeNyB/8FSuq5o1drgi3+Jnv5eyWRr0HP8URuRz0IyI5VQ0M6OFfkOBA3zf7PcgnqgA+4iaGkjOVZYdro8vGQSDax6ojhNbWOkEP2vp/xjbbfxRXbdeUhmLY5b7xtlzde+Q7t5mPOFvfrUc5+4r6bzb+MzZdJaftdVHNbZlCGFmpURAX9aXfAhhemmAlWuBgKFfvCt+GO0/m/fB4yfKdvw33mTd3CESG8LL9qoUtgJgOI3uXCmQrjdV0aiTil/dj+WQuID+qsZPsDWUeJNTELXABDw3ubmwlFOFTc1j1y6JP1IZ4djMwl8l2KYRSZ3zmCDg61hQ/ua9cS
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 10:24:49.5632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1929e99-f483-491c-67ef-08ded1dad279
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7759

Add a regmap config and a probe function to support I3C-based
communication with SPD5118 devices.

On an I3C bus, SPD5118 devices are enumerated via SETAASA and always
require an ACPI or device tree entry. Device matching is hence through
the OF match tables only and does not need an I3C class match table. The
device identity is verified in the type registers before proceeding to
the common probe function.

Acked-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/hwmon/Kconfig   |  9 ++++---
 drivers/hwmon/spd5118.c | 56 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 61 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 5c2d3ff5fce8..c4bf5475fcb3 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2354,12 +2354,15 @@ config SENSORS_INA3221
 
 config SENSORS_SPD5118
 	tristate "SPD5118 Compliant Temperature Sensors"
-	depends on I2C
+	depends on I3C_OR_I2C
 	select REGMAP_I2C
+	select REGMAP_I3C if I3C
 	help
 	  If you say yes here you get support for SPD5118 (JEDEC JESD300)
-	  compliant temperature sensors. Such sensors are found on DDR5 memory
-	  modules.
+	  compliant temperature sensors using I2C or I3C bus interface.
+	  Such sensors are found on DDR5 memory modules.
+
+	  This driver supports both I2C and I3C interfaces.
 
 	  This driver can also be built as a module. If so, the module
 	  will be called spd5118.
diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
index 6ba37a719300..9724cf70b61d 100644
--- a/drivers/hwmon/spd5118.c
+++ b/drivers/hwmon/spd5118.c
@@ -18,6 +18,7 @@
 #include <linux/bits.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
+#include <linux/i3c/device.h>
 #include <linux/hwmon.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -464,6 +465,27 @@ static const struct regmap_config spd5118_regmap8_config = {
 	.num_ranges = ARRAY_SIZE(spd5118_i2c_regmap_range_cfg),
 };
 
+/*
+ * SPD5118 2-byte register address format (JESD300-5, Tables 7 & 20):
+ *   Byte 1 (on wire first):  MemReg | BlkAddr[0] | Address[5:0]
+ *   Byte 2 (on wire second): 0000   | BlkAddr[4:1]
+ *
+ * The address byte (with MemReg and lower address bits) must be sent first,
+ * followed by the upper block address byte. With regmap 16-bit register
+ * format, this maps to little-endian: the low byte of the 16-bit value is
+ * transmitted first. No range config is needed since I3C does not use MR11
+ * page switching.
+ */
+static const struct regmap_config spd5118_regmap_i3c_config = {
+	.reg_bits = 16,
+	.val_bits = 8,
+	.max_register = 0x7ff,
+	.reg_format_endian = REGMAP_ENDIAN_LITTLE,
+	.writeable_reg = spd5118_writeable_reg,
+	.volatile_reg = spd5118_volatile_reg,
+	.cache_type = REGCACHE_MAPLE,
+};
+
 static int spd5118_suspend(struct device *dev)
 {
 	struct spd5118_data *data = dev_get_drvdata(dev);
@@ -701,7 +723,39 @@ static struct i2c_driver spd5118_i2c_driver = {
 	.address_list	= IS_ENABLED(CONFIG_SENSORS_SPD5118_DETECT) ? normal_i2c : NULL,
 };
 
-module_i2c_driver(spd5118_i2c_driver);
+/* I3C */
+
+static int spd5118_i3c_probe(struct i3c_device *i3cdev)
+{
+	struct device *dev = i3cdev_to_dev(i3cdev);
+	struct regmap *regmap;
+	u8 regval[2];
+	int err;
+
+	regmap = devm_regmap_init_i3c(i3cdev, &spd5118_regmap_i3c_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap), "regmap init failed\n");
+
+	err = regmap_bulk_read(regmap, SPD5118_REG_TYPE, regval, 2);
+	if (err)
+		return dev_err_probe(dev, err, "failed to read device type\n");
+
+	if (regval[0] != 0x51 || regval[1] != 0x18)
+		return -ENODEV;
+
+	return spd5118_common_probe(dev, regmap);
+}
+
+static struct i3c_driver spd5118_i3c_driver = {
+	.driver = {
+		.name	= "spd5118_i3c",
+		.of_match_table = spd5118_of_ids,
+		.pm = pm_sleep_ptr(&spd5118_pm_ops),
+	},
+	.probe		= spd5118_i3c_probe,
+};
+
+module_i3c_i2c_driver(spd5118_i3c_driver, &spd5118_i2c_driver);
 
 MODULE_AUTHOR("René Rebe <rene@exactcode.de>");
 MODULE_AUTHOR("Guenter Roeck <linux@roeck-us.net>");
-- 
2.43.0

