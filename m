Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011019.outbound.protection.outlook.com [52.101.62.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61800382385;
	Tue, 21 Jul 2026 04:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784607050; cv=fail; b=JJRWWkwENZjHeTM/GyL1bCpeZMtZp1AOm9FRUPs6ZC7LjiaD3bFLW37eebVOjFkoiiQFswRyH3VPUI5ujx1CYMF8B+UgekinXVQ7OM8kCf0wOTWMpekku8YH8iAF35OLjTStMD06wLojopYwuMx3DVJRX+MKpl5UvLfJH4TZ7uY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784607050; c=relaxed/simple;
	bh=vVsb/Q8y6JLjXFAuJgpDFUaQI81ismeyqQBz1UuHI3E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VLJUKRQhkfR4ZEanhOuDZSOg/5rP0WIxMTx/N+iANs7Mt6PC7DU9toAsMFfHOhzHSNoN3Wg4kMfGNJBXkK5W4OEDDIhSE4Gw+98Iz83zxtzxgERx5reW8Wv6yw73BrdiyavxhmRa8xJawQWPdtxIzyByiqyreTLs4LoRa1/9bVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RKtaVWfj; arc=fail smtp.client-ip=52.101.62.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RKtaVWfj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EpzprrIcrSplbpd/rONGGY/kJIQsDlEcNbpCN1/5CcSi1OK0QLRFBzxIpgfx4qrP2zc+O4ATYvxgf01W7UI62+5BsyAF7mfuDJIUmk1dFwZItE0K7wIQNdQeg1v2+rzPFyab1pbSH7daLpuL5QyAEUd+ykOF1kQ0UK4sJF/hKbg8TD7ZTE/aoTCixp+GZBW253REIGyzlvVpSMp6pp1R+GOnS1lVHD1mNXakIv3m2Gt8kSFi74F3SDXBxpkGxA6EyjTq5k6t2MHjSoK8loKQauxNeGNKb+xrdB5w6pvBWLqeGCoAG/JNLZsnTRfspPvWtG2X+tYz/yt+3TdRaT5mSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hI+9mD6ce5H56r8WezXH6f5ENrHyw6qsoIIswBxLKAk=;
 b=Be7XZv5UE+mX9VUVkaP0kPGqXsvcncYuuoBysuek//YcLyeB0+YLRyzAqdx/cQOlE52LrHqYrQkJvb8wfuq+YmGgBisjpRORlHM+gXNqLe9JLcsX1A6IKDyI78MqYYqgOv+9Gq2iKjZgOT/BLYH7pwiArV0rJIxDGrGVIxpm3oxXBReWE+F+Xh1zRzDz9sRptOOfaD3M4f856WEtGVTtoZsQRd0FBGsWxd8n5FQ8RW5VOF9W5/a2OmOlKQO5MlwUex2jf07xZrD2P21EsDxLc/Y0V48iEE2a+bBEWeOnCdTf3IFgUbU14qSuSezrtaDIKw27WDYnn6CUx0bL0uuqNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hI+9mD6ce5H56r8WezXH6f5ENrHyw6qsoIIswBxLKAk=;
 b=RKtaVWfjsVB6kvkG1cyE9ZA87LMglN4H+ccYBHCJzGxdT8js4Y0PYcEqW0e3vpm9odg9/PdA6rpmwVRBX9ZdZmz8+NvOnT6YRHlPAVc/TgOOO9LmOe9JPc8rYH9scw9J3pPM6hwycsMWqpv9GpVg0pFjKU6l7p+D2O295x7D4eQPeYct/rJtpnHYQl2AjgwiaUZbiPLWd9SbGstHs1n2BoY6O005cOixdKKztmTRk/ANCE9NTBo7wGvLTdujDQRW7cEtCS7mHdKTe7q0Esw2ru0ab2CHqdx3uax6dPUsTuoMeXeiVMn73jnMwAeoMMWaJAF0ilxpu4S8Y2M6aruEhQ==
Received: from CH0PR03CA0117.namprd03.prod.outlook.com (2603:10b6:610:cd::32)
 by IA5PR12MB999277.namprd12.prod.outlook.com (2603:10b6:208:608::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 04:10:41 +0000
Received: from CH3PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:610:cd:cafe::ab) by CH0PR03CA0117.outlook.office365.com
 (2603:10b6:610:cd::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 04:10:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH3PEPF00000009.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 04:10:40 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 20 Jul
 2026 21:10:25 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Jul
 2026 21:10:24 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 20 Jul 2026 21:10:20 -0700
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
Subject: [PATCH v6 11/12] hwmon: spd5118: Add I3C support
Date: Tue, 21 Jul 2026 04:07:59 +0000
Message-ID: <20260721040805.1696503-12-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
References: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000009:EE_|IA5PR12MB999277:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e8667e0-b08a-491f-89ea-08dee6de06ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|36860700016|82310400026|1800799024|10067099003|56012099006|11063799006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	K2lWWSGSsXsFQ+yGsFx7fQes7oXg67u9GXDGKgNs6vyPksDAjJ1Jgei+ou9CkjinhJDmgHOA+KHS7NWcWvgN1ERXx/JAIvHBwt3AmF4bLyLE7STrDl3p7VMS/9FY8x6l44+EieVlyc35c/fhtuHrx4WXul0QXqYGwzVCU0tMDMtHE0C64rsQad2E2+nBgggtcGYOjfF2YQSKAMtjhY7dTjURdeOZuw1zNuonmRRKwwRWKukhz3xT76lty//ddjEffMs6XUb+D6VlbRZBiMiDFPw3RY/BawpttVIV3s5WNTSxYiBsbAUU34WPGObw6WoDB0dgdwCul+h6R+/ImRCRBmJmpgKD2AUSyJriFq8w/dWceJYnRG5xSWw4W12qT20O5iHXvxyZ5ZUOtQTFmEw38QdKp9+5U1Sx1PJzmcBHYNtHOT3JJ+2AOFm93UPC18cI6Wk9dRyRo0pdbepWr56J8QsSR8aj+8x2Q2PfW0Eev8bEwki92gwy/uHln6Ci7ssVpxHic+eyKFeE//8559d8ONCDnegzAlfKOkrBu8xGb4sPf/UIxSwIodp/DZLMU1TnGBgh++XC6ziOxfWwjV+dhoWhqY0Cq7YBz6M9aTbbVomf/l9852sex2Wb+24Bk3R9f3X1pHzXpjyMDESPSx1l3JscBQt+WnmA0mKSfGS9uip17bgOYpwFtW4u7P0SxR+7yHimZQN3TcjOJBpypc5lCQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(36860700016)(82310400026)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WI8DwkUkid8OFMeD9wlECyqqezAHX37Z/UHuEebPElgpHcul7aQqgJui9ojw3RbJYt+qOmClo46FJ1ypfoqKdC6PwHnMzKiU87zAmmvNbGMD2C7FSjPHOnRv9508rot6CTcze9W65D5hyJEkTMxvVNlh2eV2WxZn0/3WBQVojcfheRpzGrcpgS5T25U+FZpnBtZsfXxiBF6nZNgtXcz1Yo3DZeWurizFLNRby1ND+TNACzIh85aZqZSm6ofXwVKhS4FOndL+Bx8uuk90YrxJ1EW6d4VPhXebbQ+DHshGNpyC2BSBhc5UxXNl9JO69TeWaS58Bf7MiSVEk9jW5L5GPRlMNt4KhBGFaE6FFRSxg7ulF4ummSR3+FfxZoKyY5S7kPBgGxk+xI4fCk7YooJnneGcQUKbMPpIZWsQAO6llgLBpwzx8BmV+jVAGk3lRWk3
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 04:10:40.2736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e8667e0-b08a-491f-89ea-08dee6de06ca
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA5PR12MB999277

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

