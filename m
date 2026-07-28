Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011070.outbound.protection.outlook.com [40.107.208.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309B2381EB5;
	Tue, 28 Jul 2026 07:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785222183; cv=fail; b=vD6n/Shm1cRnYjs1wWu5DislwBWngNv/mHT3vr78qjuP8IqczIpYgLU/PGq4HH/S9GX5tUmihj7bt3DLbx1D1KfgsxT5dyiBMtNthY/OjwV4MBxpcdSNVFQsNsDDqDSil7DzW3C+7f7rh0EHtD6s7qEIoASCb5UquOFrWRi0qgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785222183; c=relaxed/simple;
	bh=vVsb/Q8y6JLjXFAuJgpDFUaQI81ismeyqQBz1UuHI3E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fkqSa5jyuLMuiFpqA+tX4+tT9TlZYWE1JsbhCqrt9Vw166OeWWJpdZ1Le0ic4lDyl2s6KfuHGJyDedAoIp3EOo+1BA2ZZp3nqoualJbbtH7OYHIN5OZ8vPDkx8bMQ7HPbkvqmZYg6fB3xW05h5uZp5cx+jrBuizMXChShi5iemY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QhEKmt8i; arc=fail smtp.client-ip=40.107.208.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QhEKmt8i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JnNUq4lGjbKqUXZbBpLHT6iTAXSpI8wLlEfJUNgf1YQG3XSDpNT0xkmtcdUnHVT9tHUo3j9ElECMn8S/zmyUAwEPTBhOMV5RnYHu1DpXIn8cV46GzRCJATnff9W8Cd9mVGJialFCWqJjgO8WWv8TNzSUU8llDT6iIcXFsVhPlYGjzqUYUxDgkfyFGA7j8WdOBS10IRX1d8FC55T29yHDFiF+tjYfr5mHFWZFQsD8ZIUvS12OTJbWrlzxGl8CDccPqrjIspHC9Qw+Myed1qa/lW9M8YzHOc4Q+NW+Yee2rZc5f2kLPemvWZS+SOfoNXSclzv7vUoo/A2CuM8ESmAa4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hI+9mD6ce5H56r8WezXH6f5ENrHyw6qsoIIswBxLKAk=;
 b=w3aCYPA/Dk19f9/gTq6G53Jd34PDVnMHEEVLuIYnGXM05kb6H2/dxlieWCpryg50Py2JSYtoTwwGfI5WMce7yNj9u02fsjooEhiPT2L2XoORwxNiHorzna8huMzX1PNwYOjNjy8BLjKg/jN+84/CCuiOgMarGcV6MDonEeWy5HS0reqac7LgkM3DGkyjfliaSe1w2cnhlOdvV8Y7bEUxl4KOx7wqNFT98MTQpFdr3PZZvZXMhTv99oI0tsLwGNOVfv0BURL7QvrDaRegnYiU/R5KSAxVD9lODyccsd5q2xU7h8/HZCrMUdqNAvof7NTQTt41Rb9pfTCfCjAN3zQEmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hI+9mD6ce5H56r8WezXH6f5ENrHyw6qsoIIswBxLKAk=;
 b=QhEKmt8ih+lQrl/Iu8GTx7SbT5dvTZ2QVPhWBnc9hmm9r1+cNcfKQOapx2jb+YoKROO0NgrbykvLhVa3uh2xTzhZN1ROxmmORQ0AIodvNM9u263JYl4Uek23GcChD2lsdpQyFYTMDgMQW/W7Mol3IEYrQF5LRpH7qSfHobjnTEy1x7BP+QEF6imDpoNH60thEuafTLPlDPAFZvF5y9ZSSt/AOnpspI4oXiHjca3beGwnqecvbBFJDNMV1D0ZvZs/fqE3d70uNNbKUhFnUuioJ3vb4PWiGeA/9a/1gXhfKRJlab8NvVAiOtVeRhPvWXNrPhn1QYo3uOkRn+OIJRWtPw==
Received: from BN9PR03CA0956.namprd03.prod.outlook.com (2603:10b6:408:108::31)
 by DS0PR12MB999263.namprd12.prod.outlook.com (2603:10b6:8:424::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 07:02:56 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2603:10b6:408:108:cafe::87) by BN9PR03CA0956.outlook.office365.com
 (2603:10b6:408:108::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Tue,
 28 Jul 2026 07:02:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 07:02:55 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 28 Jul
 2026 00:02:41 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Jul
 2026 00:02:41 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Tue, 28 Jul 2026 00:02:35 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Frank Li <Frank.Li@nxp.com>, Frank Li <frank.li@oss.nxp.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "Guenter Roeck" <linux@roeck-us.net>, Philipp Zabel
	<p.zabel@pengutronix.de>, "Jon Hunter" <jonathanh@nvidia.com>, Thierry Reding
	<thierry.reding@kernel.org>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Akhil R
	<akhilrajeev@nvidia.com>
Subject: [PATCH v7 11/12] hwmon: spd5118: Add I3C support
Date: Tue, 28 Jul 2026 06:59:53 +0000
Message-ID: <20260728065955.809445-12-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728065955.809445-1-akhilrajeev@nvidia.com>
References: <20260728065955.809445-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBE:EE_|DS0PR12MB999263:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cea4bd6-b92f-4658-2d88-08deec76401b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|23010399003|1800799024|56012099006|11063799006|10067099003|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qhIfeRM8MjWyk8YKROoMcHUXtuK0VFIhjmI7wYzccjLfi8WAdUCJflQRjG8eJtO34WN1NhhmvIWUlLjdVD0Vz4AGKGfPbiVBVvjNxrQBI4uQaGYMb+eEUoZoI+2uvGNdFNi9JxtXPk2JOK90WUWr11454cbkqrY23+x+PayJsn6Pc2OWk7ZfO60K9YigmfYnxNyYPBJTkblbQch+4AX/hg9Jltw5T5UqSJ2UGlInJ1KO3wcz5QmJ/rfj5BmAfkkCxURWik5wdiTkwvBsLNaQrHYVRBY6QK7BFPYx4wMaAPVxNvFEKXgCGy/bv3h7G0DXVp4nsE4Vxi9Uhd9pOJxHFNSZr8FXX2wvhEUSrDv6WdzCVK0IV/2oPNYyPp6qE5311Y1fpRSZ/XAPX78wvvhK452ygFz3QQ1ZsugW33rC44FcmOlsxrh5gyH2jf5BCzPJ3UmPmLHvy0ZFJjajpiw0Oi2DgxJ+yazz78Ze6UkM0qifSun4nlAkvCS4R3fQkD0kuI57YXIYSfh+7ZIg0BmrqGC4XDkUrZ2/rnwHqgVfx4DOT7E/6ii7bi6KyiEICYtxXh1rfeXD3pAy032dFSutI0lahuyxW3uwFYfJD0vG+SP7XjDWGYkGDNS2JRltmHIz2gLFALkqfZtTM8tYemBfpfzcrU2U27+1RRPfY4yg0oyUiPLUhLvtVZe5sESLE7mZ0rLy3/3Lqj2y0qX15XwHhg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(23010399003)(1800799024)(56012099006)(11063799006)(10067099003)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FC1VDaXRg0PC5GN8v89hZQgivw33mS32EAFarNcxvh6dtEH4gFzrMIUIgeCgXXiVnhps7/D7kkGJmSt17/EwvYuY7soN/PHLME92y9aHcfAa447VVEBak98hrvgSQilEjyl9LOc+mFhei2EbVrxpVDH2sDAlspy/naDG9w0Wgqe7bSl5LsZaNZgb85d4p6rWOMdh0phdLgwKxYgM7Hu3dcjgigqXckG5TcSUygwLwxainGMwaN7UUKIAdM9+130agy7KAmWZ3VA1/xmD26yqJYod8c+GL05wTTBjiFNO9g98hC83dB1RM/JfB1PriGNfo6DRSLcnENSlrLkb0iHi/vMVMdNRxCB5vE8e/7JGcHfu1BBmCrr5rRBZRFL5y7/5yPV4uM9MSTozzRbdbPjHhARXU6txDp8QagH8tAQqE6fJzObheDz0Gc3HwFTHGnZ2
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 07:02:55.7213
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cea4bd6-b92f-4658-2d88-08deec76401b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB999263

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
index b2e445b5536e..d9feba036ba4 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2370,12 +2370,15 @@ config SENSORS_INA3221
 
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

