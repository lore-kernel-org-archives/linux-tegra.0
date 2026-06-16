Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013063.outbound.protection.outlook.com [40.107.201.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F61421EF6;
	Tue, 16 Jun 2026 09:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781603847; cv=fail; b=rbSRo2yEaRdXZMgW2E1VFeW+yeS7X3IhLLfoNZeph9YVsFdVnYm73hTubIivrwipKLr5F64sc4APluAG7Jh/QVqiiLC527kyujCT+pSjwUArq4zb/qcNC0dSCD+qoghX7AWD2M4uEN7G063tOg9J4Aon2izdnSaW19+8uwIBv5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781603847; c=relaxed/simple;
	bh=C8bE6LkDa96nmQG1LUop5JFyHY9X1BfyCA8ArkhCPL8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W+14miULfct8f10OClY970XJLBINhrM86kHDAdsJ2YEigagX7UeUw667EbLrWFDIVPXgD9kjiufa74PGJMlmYZ+NAW1k799eikSwz2gtnnww3EZcyctRbDDgGkq5JPWgkTBvHOK40ma+Kf6koOR/e0yc0UQxrYp5WiBDMwhg6YA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kiHh7pRj; arc=fail smtp.client-ip=40.107.201.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kiHh7pRj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y7PZXshqZXCk5OETx6ITDqLDKS9e5zQOmwv2lyqMVEd9kKBoV/hIxDiN/F+NpY+FJlBLUEBKgNc3KH041lPe6eREZ4/xBMTYidWPkRJj6hbOaAkHdrQPPCeoABcZ5AjzQHXNDZpZuLaja5hDt5d9hCbSHEZshH9PnFNcWJbNVFzLQf7zYU+qXn6Io/EL46kUZfanqGcp+yN7ZZxRpGeR7bT95dnr3CYHYe01YUnefqvSSAv/R2+dDLhifkDj6xarZdcDzUYm0Bo2xPGSgwaWYH4bOrb8xoyIpzZNmCEcYnw40BdH3QajYRmsIapdx9fGVHnxoSdD5gqSnlpoZTZKvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ya0juJ0y6/8op5CKi85AdUV8HmWe8onjEhiIMIK41sg=;
 b=nehj8sJm3/jD9ybl/D8Jkkctxp1YkGogXY5dd+uP4emdJiZYc9FMAc6GhWxEouUxfTrv+KmPA1T7Zh3tKm5j3uVwPKhKSBhroIquTehaHMXduDHrbhXFYHQPK5foPfkVIXU47sfyx/O7gl0ZQHlawxmHfgcj5V6Yi7LQ3h2Tkwj4h9t21W/YCxsdGdJhejLe+MpAsowrYV0bYJuLmCcLexrnRnu7uvl7XKY0vHSuGUFd+t7tuxYL3sGN5AZP4RRat8jAaiss/y09h3z/0R1u3PZZFJpzZTGdHzAfyHqGahvMBdNKLaHS4MHb+V14jjBwSeZIL7hvXNfTq2vN5CCqIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ya0juJ0y6/8op5CKi85AdUV8HmWe8onjEhiIMIK41sg=;
 b=kiHh7pRjSjs2QngUzHxvIx7SGPu61o9N992tQNLNjs7B9XrreOZmcyV+QGVVSnSPqwLjPDXlGgsmDezAeC3Fej3nOnsBCPeEBJWwWIZ5LozUcqKwQzcRt9/shTZzDc266Z1MfIl1NrjIkZPlo9d6kprNlDxtrAdrI8cc91gVNMH7ZYZGOZZx5ZBy/3uMNtDgGBLawBpAkk33UJTPn7aySOz0XnqHYXWrLYTPnhH7xaKO6SPGGxmGCLCbPBrRCMaMEcqeeOYxZfZYqIQxbIKxcHI7xF6OcfqcSz6ePlAYVBszHoxmaH0p+dh9pcfiq0Mjo7/OtmmByzz2sRliEuu4wQ==
Received: from SA9PR13CA0161.namprd13.prod.outlook.com (2603:10b6:806:28::16)
 by SA0PR12MB7477.namprd12.prod.outlook.com (2603:10b6:806:24b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 09:57:21 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:806:28:cafe::3e) by SA9PR13CA0161.outlook.office365.com
 (2603:10b6:806:28::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.8 via Frontend Transport; Tue, 16
 Jun 2026 09:57:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Tue, 16 Jun 2026 09:57:21 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Jun
 2026 02:57:11 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 16 Jun 2026 02:57:11 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Tue, 16 Jun 2026 02:57:07 -0700
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
Subject: [PATCH v4 11/12] hwmon: spd5118: Add I3C support
Date: Tue, 16 Jun 2026 09:54:25 +0000
Message-ID: <20260616095429.3947205-12-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616095429.3947205-1-akhilrajeev@nvidia.com>
References: <20260616095429.3947205-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|SA0PR12MB7477:EE_
X-MS-Office365-Filtering-Correlation-Id: c049d5fc-43c8-4856-ee2d-08decb8da895
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700016|82310400026|23010399003|3023799007|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	N28EwAdyGOTJLgw6M8kyPZ43psvTxBpRn7RiWHr1RES9s/lm/Ye+iA71TuBmWzDvyCUJGouMpo57U14id/2s/LTlcVpsCeGjeYwZF8apezdEZRmKyj2AG38c0KAnLLpbY28f1NxsvCZX5V4m8iVyX2DprhtWunc17GjUPGMqWsfZfZx+duKBj1Wz3FnZfMMFIUGqXnCyyYrnaW4uEw3kUUMf4fpQBHfXNGEdAf59fWl8Y0DeoJuA6x8xUH0dhp0QDpDGvCj/bVEHwjjgnkW43obEjqYUZrltl/4HNRV6jovVLosK2YihsdVcn2WHT5n2cXUTs0laVX5np/RCIuWJFBsAC8I7jv0FCSH8P6cn/tqMmHutsS8G6vqPS+nFSHEDh8IFoZL2hhsQkIbh+sgBrM8EIO5RtaNUG/o9PvtGIdnGg1S93Wdlph390TArEk3/qAH5zoOQfr0z/kMAqjLj0vIgjLrTjUt0k5Q9cxCWBZNdLK83ITszprWlDb4KJHF1mamYKS9hvDiiqhvsNgBuwXw6LtSSq8w8WJceXGEC+vgjOMCuDVXswTMzf4iQjNsiAQehrtF6Kq6z3OUo69QmVmdNSMPlT3X2bWv1prvJHi9JudLyP5SGE+D5mHwtOX+5SYSK8QdHZdYRY0EpfjYcpg3EACOFM+P9zPdstsWHDNcn2TJrBpCw1uWcVs+2RPCG9Q5ZC2KtOi+ytuNo/uI87vthmteQQz/AKFOGU3v3aIk=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700016)(82310400026)(23010399003)(3023799007)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	V18xkn0SrdKdI34Jl8MGSaasaON74gskNI7Lwy9Yni2geli/LXGoSbh+yuvZe4sMdNpDwlxaS4giorrJLVdgsN52vucEWFRenDq3NhQcbS9wIEIC/WYK4hnPyUw1JYWZYhJmpF6jweSw5F781D8JyqhCp72lDViNb2NL7c+oWEOr8Lczove//ubnNRhJmzQ4BUGv4Xf9NPEmKd7CP9cybEIx5vinISYRDVeLnoke0ffwD4gui6/Yx6CkYnm37UBBAPN96SA6BG3h2mEf7AT0v1LJneWU124U0UD9oNyY5et3duLwI9LDPUF5O9XYkiUVm6+o2x/dm3OzHLou6BMrMaTezazfamXo+WOs/2VEkWSLBd9pO2wr5u1UvBwJwaRXOTSiJRSZPmA21VcCxrdE5N8e/C0hqqgr8XsavXHCoqebCDGIejxEuUptLOWCBbwt
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 09:57:21.1365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c049d5fc-43c8-4856-ee2d-08decb8da895
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7477

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

