Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010019.outbound.protection.outlook.com [52.101.193.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3482F12AE;
	Wed, 18 Mar 2026 17:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773855082; cv=fail; b=mFJzghJHGxiM0UpbIlO1H/rf1LZcWngnxdcsMnxy+AHMdexUVJq6EkueyiKi1N4wq2zTYmEhOmsgUt64PLRzTYha4v2Kw6PJLTi3Jop/keSMDl7h9obIIUYbRigdH+IyRKncaB1roHJSzUbNhhOAGTPHXnHJ+SqdU2/84OIGeRk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773855082; c=relaxed/simple;
	bh=lf5yrmkXpYrUZnOOkGnOcLk+MiuFFrBqZjH+bWXTxhk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R2V4Tjq1817VA7I8l6oSSaMLjT+cSNIi8WFElD1d1xuQwETRQGrYrrOcSRaa/Wy6KnSzv8n3HVwevSpJl0JGplQoJkD9X7BMFvtu1CxjQRjG1hKjUmq8mDfAKZPH1MwjPHSwZFofBHC33gaZ7S+t/UZJJFydhz54mxXTF31nFOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fKDp+Q3E; arc=fail smtp.client-ip=52.101.193.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fKDp+Q3E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SA3UZlQSGr6E6J/sW/yBCpwL4pZrUkT6S1coms353WTneuLrf5xL7XERjY/Tupw6GyJbqTEUsJD9ZDmjWTxyk3VU9XLX1ailwCoyEcVBCd1VzvddKsH79Hyz7l6dIBVDMUk7N88IwQ/ROx9VuU1ORBOFNoja2NkvbyF29B4PZbUUtEjCLZyx4y0Mnpp07Jvxqz0IYku81cIgy9FLiUhzA/wSSymXLMDuiQR1GNuyaQpne7R+81P3aYVIotw+MGNLtiaguZ15g8IZNsz0YDKMI/POBWAmtWWaYxXiDnoImNG0TMu/coi0TEOiz+iZBNiJXw9ShoI8AKwAOp5OTCVZ1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhG0ng9PwlZjjCFVh2kf5nfzoaEc0/LbhQh/eXp+Wvk=;
 b=trwk6PMbBKZ3qi6w+4DfWaT089FOW0zD/vhwroISNMZoWVcP5TFagpQuO4PoG4y5PvbJHfXXq6oUz4/F5UrsyzOn3W+wgD50AdANUzkTxTIlAxJo6F0gNEd4Q3e1t7dsGW2hYT2luybJwtGznwV2Ug4PFqNSGal74GF8GL+hWICQNfFDpTbpyo0W3/Tj03awWNBRQROmx3rEZjzvQv5eIkrBF4VresJ6gmAqdmjrAiX6hp6OL3gOo+83NxEOXn7l1Wnp358b3TVBxQdcXH75qp7GP1J9TOu1qXnLi0FMeuKc2LIcDfFJSlUNtO0Lnqhw0Z5CJsHSupmoJa5CGNXagg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhG0ng9PwlZjjCFVh2kf5nfzoaEc0/LbhQh/eXp+Wvk=;
 b=fKDp+Q3ENxQz+GkPbKtoSeNFfUN59deT1qt27biyxqxG0ZXIMDtdQdIRIM3Pxx3l4w+XpggcNmNkbFeR8E3elOqMzL9AJdT9umQAGE4h+krKZqjJoi4dvEDQ+xMjyCJSWtUJpkD6DXh/MFAS8tXT8Y2nldMzGQxvuCT2pdcNC086oWQAJAmm4epIFfhhaBxUd+xmdVnKa/dpnkdiL/bkJ/3P9ssFEIpDU61rq3BnKpRWBKFbpnz4RGtwHyI7peZDo9w0ZRWm9Ir8SLy0T2neMLs8HxZJs+iYr+EkiVzLzc8p1tV1oQVlEYYrQipkHbuckSUXOtM0aqpT9LibAAakbQ==
Received: from DM6PR03CA0015.namprd03.prod.outlook.com (2603:10b6:5:40::28) by
 SJ0PR12MB7065.namprd12.prod.outlook.com (2603:10b6:a03:4ae::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Wed, 18 Mar
 2026 17:31:15 +0000
Received: from DM2PEPF00003FC2.namprd04.prod.outlook.com
 (2603:10b6:5:40:cafe::cf) by DM6PR03CA0015.outlook.office365.com
 (2603:10b6:5:40::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 17:31:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM2PEPF00003FC2.mail.protection.outlook.com (10.167.23.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Wed, 18 Mar 2026 17:31:14 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 10:30:48 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 10:30:47 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 10:30:41 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Robert Moore <robert.moore@intel.com>, "Len
 Brown" <lenb@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Philipp Zabel
	<p.zabel@pengutronix.de>, Eric Biggers <ebiggers@kernel.org>, "Fredrik
 Markstrom" <fredrik.markstrom@est.tech>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Thierry Reding <thierry.reding@kernel.org>, "Jon
 Hunter" <jonathanh@nvidia.com>, Suresh Mangipudi <smangipudi@nvidia.com>,
	<linux-tegra@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <acpica-devel@lists.linux.dev>,
	<linux-hwmon@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH 11/12] hwmon: spd5118: Add I3C support
Date: Wed, 18 Mar 2026 22:57:24 +0530
Message-ID: <20260318172820.13771-12-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260318172820.13771-1-akhilrajeev@nvidia.com>
References: <20260318172820.13771-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC2:EE_|SJ0PR12MB7065:EE_
X-MS-Office365-Filtering-Correlation-Id: e42a1def-1e8b-4349-3e75-08de8514278d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|36860700016|1800799024|56012099003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	NunfodOLx3bFHF5dBR9JbioaSlvqxddrnb91llFFwfi+ZhD3+CmbKoRrZqzXKtlYKD8wwg+hiqZMulAg3uXN+d45Tgmmf3+nECfy5jDtl6KzW9KhtTlX8VjRGLGP+BORxQS0cmM1LoL6NZFm85ey9Cik+L1ccWlLV2QVYxRZfHQvoz2Trb3AQ9LxXj2RU9NhIUT7UdATSSPfuMNIxrgV9MQJKM3rK9bhBhQSKRhploCrpxIkc9gw4RPyoKodx7PkISU1tXnqX8UrhrDJaVESrIKxyD5BH7lRppUy+tuGNnkAtZDiJ8sLvzbr7tBIBzEErWG9DemQ71lCsI1bBdt0RVTbMoOL3slBSaZNVd2aPY0mcsbHtlKsV9HwJJ/xePap6nzxBEGQw6EVxufG4zE856leUulsRgAHiQA71SPjXLy1PYT7Jcyhqeely6wP3S+JvXYzdqXYWCK0vDdcQLmxXa/UEiYkEPO77DYG0dUMJraCaMPTPbMXAZcbUNSFmge2xSPHl5SVwswy1JVFM0rvyWcYrr74CUl3G/eWsy0gxgCZwN5L0LsAkHDRbafphz/YSUIsnrA8D9AG2TCiKquOWJBgn349prKr5arHDiVg4AVzggiR7K+YhvNFFeUXlcYNZ3UES/v0ZpfNqvYXZrVD9DFDK8yf/VbSYJ7BBuxsoLror7pKtUGrfiQ2rbYhefr+5fpMNT0BC9nYUztr9XDAC3yiuc+R6O6yjBLB8juru8ZlABL0AyhhzDcVODeyPMvev8ucWu74UTi3D0mFU1f6nAGzDK8MCXz6ejskJyKvUn+8UAJ+EJX97DwZeD1Mw3uW
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700016)(1800799024)(56012099003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	n6jvyDjR2rCdiPNcZrjxzPiViE4q6+DN+6niIfjcQnuom66IaFG65SeIYAd37ADpf26uZhLkE9IbCoK9W+nyG4e3p4IFCKjqmrQ+Pmc9xu1IMZC/yGdJpWhywLmLyygkSsWg9+cs9xxyojaVG7LJbaFsFRQbCSrZSSQ4p+Wv4rHQv2sTrxlkTVw6UUFDuoFMjuhBb3p7opXbKl49lj8ibYmX2rKY6HZ81+NVs2HwbgAo3AEYKHPC/a8RlPcC/+PTlaQoZQIe5nBXX/QOoXQL+POPl7FJr6HjyGrA1jDE9Ag8k87d3BukYuVt9WqtHvZ6GLnVmEZuE4bE5gMao3u90XGCvlT3p2c6OgUx1pPU/QIzfGGe4IdOyp88tj7uIH/GTAyMdMI3cCnrBicJUoRH16UjCglB4v+zsxmu8uiH+jZdKOyWEU6RQmBPz/0VXMOI
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 17:31:14.1167
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e42a1def-1e8b-4349-3e75-08de8514278d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7065

Add a regmap config and a probe function to support for I3C based
communication to SPD5118 devices.

On an I3C bus, SPD5118 are enumerated via SETAASA and always require an
ACPI or device tree entry. The device matching is hence through the OF
match tables only and do not need an I3C class match table. The device
identity is verified in the type registers before proceeding to the
common probe function.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/hwmon/Kconfig   |  7 +++--
 drivers/hwmon/spd5118.c | 66 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 70 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 8af80e17d25e..23604c05ad22 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2300,10 +2300,13 @@ config SENSORS_SPD5118
 	tristate "SPD5118 Compliant Temperature Sensors"
 	depends on I2C
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
index 5da44571b6a0..d70123e10616 100644
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
@@ -482,6 +483,25 @@ static const struct regmap_config spd5118_regmap16_config = {
 	.cache_type = REGCACHE_MAPLE,
 };
 
+/*
+ * I3C uses 2-byte register addressing -
+ *   Byte 1: MemReg | BlkAddr[0] | Address[5:0]
+ *   Byte 2: 0000   | BlkAddr[4:1]
+ *
+ * The low byte carries the register/NVM address and the high byte carries the
+ * upper block address bits, so little-endian format is required. No range
+ * config is needed since I3C does not use MR11 page switching.
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
@@ -770,7 +790,51 @@ static struct i2c_driver spd5118_i2c_driver = {
 	.address_list	= IS_ENABLED(CONFIG_SENSORS_SPD5118_DETECT) ? normal_i2c : NULL,
 };
 
-module_i2c_driver(spd5118_i2c_driver);
+/* I3C */
+
+static int spd5118_i3c_probe(struct i3c_device *i3cdev)
+{
+	struct device *dev = i3cdev_to_dev(i3cdev);
+	struct regmap *regmap;
+	unsigned int regval;
+	int err;
+
+	regmap = devm_regmap_init_i3c(i3cdev, &spd5118_regmap_i3c_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap), "regmap init failed\n");
+
+	/* Verify this is a SPD5118 device */
+	err = regmap_read(regmap, SPD5118_REG_TYPE, &regval);
+	if (err)
+		return err;
+
+	if (regval != 0x51) {
+		dev_err(dev, "unexpected device type 0x%02x, expected 0x51\n", regval);
+		return -ENODEV;
+	}
+
+	err = regmap_read(regmap, SPD5118_REG_TYPE + 1, &regval);
+	if (err)
+		return err;
+
+	if (regval != 0x18) {
+		dev_err(dev, "unexpected device type 0x%02x, expected 0x18\n", regval);
+		return -ENODEV;
+	}
+
+	return spd5118_common_probe(dev, regmap, false);
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
2.50.1

