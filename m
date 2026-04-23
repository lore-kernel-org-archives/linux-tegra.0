Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010018.outbound.protection.outlook.com [52.101.85.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DA43D47CE;
	Thu, 23 Apr 2026 09:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776934866; cv=fail; b=OqE5XQJO+kKnFr15RIhGXI37AGEGR7R43tKrFg2Y8N/Lm/yBbcawg0VRKSTrQZvyTNfhaRH4Fpqf8mqvl0W+0LS9xY1ocUimpLYgfWTipqNt0bHyi7GrD+qIHY22BzBfaitww+mo0YI3KwID7KBK8pYCPZVy6WGKtXttX/8vXI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776934866; c=relaxed/simple;
	bh=pC0Eh0NyxE/kcrGpPokepCA17o79hx0yx7ICIrn/CAM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eLGbr0WXQJRQUmaFABrYrSIMV58vvqw72W7spmSw9h/UX2fIZZRvROhDQbROXGfvAiZvRqt0XO24mXud6IN5L7//uxRJ8S7jXPWfnxT/qHp2FgYIgy4G+6OznI8ERwcfzcPNVFc2WKGBFCHEKoAo+YaxCa2zVDs25N4fd33VzmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XhQNzyK9; arc=fail smtp.client-ip=52.101.85.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XhQNzyK9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PCsvtuqpossJgCvatILOjVXgnA8U7vXt5M2BbRahmWhAZjnPcNGlb/5dHsnf8chogW/fAd4H2lvJcVATfIF1dPOhQm3HNSUuShMCYKl/6x8O4xsZHvJpUZTxpo4TQxYvnytYuH3EYTWOr/ni+E0hq3uCIGmtpoj/8M3bAnHsv+HDyt8jaEycIQ55JvNeXSsgH8DKlWRo19nvASLk6EgS4cDGfOWQks40ukCvyxqQ6+rWEYbQSBYTmpJgnm9Qn9bPh7jiz0Iog/W3yxKV/Mmrwmozf3WeH1XdR/KDQGh8aS4BUWTxAnohhOOCGXgN89q5YeUtmlhmLlQHAmC50lXjFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0hZdO80FZ9vJCMzl2JOQ+kUQKQSDRmMqGLUDxkR4vE=;
 b=trJDfIibLM7igoW/Srys313bq/yCp13gXXW6Osv6G1bWwvMKQ+kMN8LxJExkVa83jwG4G5UKzl86qVCd+IEurQqi+XHystUehhm/XFCpPEWdTHlkznx8iMiHSla7Wj+/z0JKrgy/VziCEzYixAykw2lMS4xfCjjABA2k7BUywj0SME1uReQXvxbs2Yea3t6/K4pT+iFTqZj1l/e8usnSnzsIBiFCvDj6y11ftv9/fZd8ej68SwuEdnL7bet1Lg+75ebI7exsWRywS+uIn7Ziu3P1avCNH9mb4oOu9WvB3PgPMJtz3h0xne1H0Qc5pC73oUZ+LK20sQDjy2WXz8blTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0hZdO80FZ9vJCMzl2JOQ+kUQKQSDRmMqGLUDxkR4vE=;
 b=XhQNzyK9QV1VEsra8t+O6lYmGAxQTjnCAai9Gjh6f4ROwJTf+8ihIJwBZWmh6KCcuQK8l1pipppuRDePSkmRgtezEfEv1fRfzIBXyu0By3NsGJkmkI8h4tZL+hLWhfmtyxh5S7l2Zmq5sdjhQW+XSWxWVBh5DfO9SVjR4aJxWGlUL1sQN1RLGs9FCcF9mTGjU+e8He2YCTWT8jV73cCBlGQkSscXnt/kZa8CxYMbBMyTTnPcWkbo4//DwHeLVbYARXkQo/7DCB1DSzp40wLAlgMqhgbkHb3JPc6X8K4wzmgOCoGOjaMxfEbcuVCi8+t//dy+nlcHIG8pAm51/x2qGA==
Received: from DS7PR03CA0030.namprd03.prod.outlook.com (2603:10b6:5:3b8::35)
 by MN0PR12MB6152.namprd12.prod.outlook.com (2603:10b6:208:3c4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Thu, 23 Apr
 2026 09:00:56 +0000
Received: from DM2PEPF00003FC2.namprd04.prod.outlook.com
 (2603:10b6:5:3b8:cafe::26) by DS7PR03CA0030.outlook.office365.com
 (2603:10b6:5:3b8::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Thu,
 23 Apr 2026 09:00:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM2PEPF00003FC2.mail.protection.outlook.com (10.167.23.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 23 Apr 2026 09:00:55 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 02:00:32 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 02:00:32 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Apr 2026 02:00:23 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Saket Dumbre <saket.dumbre@intel.com>, "Len
 Brown" <lenb@kernel.org>, Guenter Roeck <linux@roeck-us.net>, Philipp Zabel
	<p.zabel@pengutronix.de>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, "Eric
 Biggers" <ebiggers@kernel.org>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Jon Hunter <jonathanh@nvidia.com>, "Thierry
 Reding" <treding@nvidia.com>, <linux-tegra@vger.kernel.org>,
	<linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-acpi@vger.kernel.org>,
	<acpica-devel@lists.linux.dev>, <linux-hwmon@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH v3 12/13] hwmon: spd5118: Add I3C support
Date: Thu, 23 Apr 2026 14:27:11 +0530
Message-ID: <20260423085718.70762-13-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260423085718.70762-1-akhilrajeev@nvidia.com>
References: <20260423085718.70762-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC2:EE_|MN0PR12MB6152:EE_
X-MS-Office365-Filtering-Correlation-Id: cccbf4d6-3bb3-4b54-11d9-08dea116d40c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|7416014|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	6Xl9A36w0lrwG2FlPTk55H3dDcEIrzKD5BcTJzdIT4Tu5s7LAhnTAUjpoExzIKFVq/ieqUZY/ByZDimzIN/U6i2nb59qYWPxQohwzSEzqKmwytGSfUWNh/4xPD/pi8q+vCF0bL07Xz88uNIyuWxk8KNBiPkMRkUi/Bw/Zr8wgigZerasLQIBU07UaGRGBHUOa0V/UUBziswzwUJzoiqRVQD8yxq20ueSt3CNhR1vnA0gHXQx/pwKJn7zma2FIzChLgr7OPjK3GuAAXIY/kUOH54YSfdBEx+ZZziCQkWl1VcS3LsQ+ewaIUbqXqVBc7TifBSBboBnINhlwjSp0zcOdBwQB1XFwbOio0jvVTHdl/GoXZNGMT9p7KTBxhMsd501hrWtf7XPkiXBaqM6tgeplJwYIrI0h4BdbqkhYrpZm5QtbCrporQkI+Y9ISejE8xnTQQBMz0OfDgch7B3/maFy5s4AijygJqVI62O0aOh84mc+ATYm46fvbw0o5olAmYmpJXwu9bAjxnK/leOHbj9PLbwlE5Fy3ifEL5bKQyL7Qj6X9WIceyosAWeLr3I/9r+OsM84iQuqK2rtDDL1h4rXlSmTG4owP+VhYxKOswvBfur5SDp8ywOhz+W96EjUDkDaND7uQ6Qf66VLOLSi+5uG+/irfteCGkqNr0W4ISBDATLLd9s+Jtg1Jztg3oHbtek59dREb5G0l55Bvdnbhm1I7oI0YHdnON0wRcsgWa3oTtdujlthDbjIXIXPsADK1cyWMNEhtFScZsJ7oT9R6ziBZQb3HAer7x+QXfYUiyKsvbasJl9m0MhZYozyUf70OKp
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(7416014)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	G2z1BSe9lAleT0te6ap2sBoyCYvnpbeFQa6d8/Qd26eeJyEI4i0Q3f0sFnp+rEVcrJ8d/sxN0iZ231xzyvnSjNtlwD8HqMLlVFDPaotEhQfTbKxzcuFxpaO/EOZVoWHevVSqmmXznhqzvVUcosf9bE8LxjKsGJm2x8IguwLXQLemlxFKmnu1bOwLOJgGe6cuBP6FwgrdJcpVp9HzTopugpHZZ29mxnCPk2WsOtkFahEJSYG3VNpmxrYS7PeNbjZ4/dP3+Xt1H3ph3UAnCpHTS9aMB3vMdzAM7o51L/3J4KkBhBggXVxcrsveittPeGjPZGb1WAtkyWutvD45AGglY/OhmF9PVvfkiVw34d1jni742okKnXEid81QGhzzN6QBYw+m2BEQJImd7quR1EbuCj0Euc6QWjQCwzXgzSs1a7YzTSjGMPDAU5lAzgsx147h
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 09:00:55.0689
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cccbf4d6-3bb3-4b54-11d9-08dea116d40c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6152

Add a regmap config and a probe function to support I3C-based
communication with SPD5118 devices.

On an I3C bus, SPD5118 devices are enumerated via SETAASA and always
require an ACPI or device tree entry. The device matching is hence
through the OF match tables only and do not need an I3C class match
table. The device identity is verified in the type registers before
proceeding to the common probe function.

Acked-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/hwmon/Kconfig   |  9 ++++---
 drivers/hwmon/spd5118.c | 56 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 61 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 14e4cea48acc..a7f60f8868eb 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2309,12 +2309,15 @@ config SENSORS_INA3221
 
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
index 8fdde35e68cd..db66028d2f59 100644
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
+		return err;
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
2.50.1

