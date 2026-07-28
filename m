Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010043.outbound.protection.outlook.com [52.101.85.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCFB3C3450;
	Tue, 28 Jul 2026 07:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785222176; cv=fail; b=lETGWSwobM0kO/lxcl+Aylu+uuvpMORGmPUkCL7RTv9oIixJFNDx/rL9NzuSjPuI4gETRBtuHyaW8yXhwIeEmyyl0Q26n8/J61rVAGDxU5Y9r5SmlpSyN4JF2/MZnNEwau8Z+2yeDEqAGXJ85lo6BFuWfngMhqCuT9zKM0SCMPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785222176; c=relaxed/simple;
	bh=cD9GtWbmyjTAeDl0835o/YmYxeOO3qdn37NBB3MlNp4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ScCRaO7/ud4PzH/RwofeHPbz+t0TMll3ZeQVstEfSfd/82tKqX1tsZAPWbE5cSmwI7HbpRcJ2oW9lu9rxjDuI7JMtLOJnE1CJzdCV8jrWJ4zVuVp2OtZFID+aA2YFq6xYTVMl2l9BUwazJzW//8RKT+u+K1eSLWo9giIodxHq+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=epphlQnF; arc=fail smtp.client-ip=52.101.85.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="epphlQnF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CHA1dNwQOIr2eo/OzDnMPnlbzRylhL4Vux25vjdQZEQbydjM+5MnySbDzkrMHNHWYgY3W4F/uaijYMNQnSttkcH/Vq4b2Fj1WzmouSC+fDpjtXH9imeBWiAf5rNAomSRr2+dFepmLa2KRSnoLE7H+NqwnPsx6G16EW3xuG8JoKdZTHl283NplhNSJ/NMZrb8FGNYFWod7XF2k5Q9TWu06oPagjBliot1l1ekHlydMu+R7I3jKjTcpHdXOzw42Foq4Otym3XyjtwQIe48P6KW//Qd09+jPzIce6cN5bvImEayIEZ8XrdhuOiLABjOTXnM2tU2eOZJazOrlUbdvPSsgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uiQz1AwaYoTlL/V3YQ5qUQZDkSt/CeAD3nwFcrAf5Yg=;
 b=CTbtrbfuWjpnnrfotn7i+5QAVAompWjrHXzPCDX6rSXjrnGGjgxSq1xpRR/OLIYG0vMq954o9Xt2pWKexfdqxJ+KAOppUtXzq/XOMlsXRPIQB/HdjO+t1xnIDM7M3z7tIz3uIzFkpQ90FwWbOQLnCzoRM5m8sR5XRjuCmBK3ARqmIVM896EiQk2sSQTlsP8J4bsphu5oTx7++izJ+iyJvVtGPDDXdMTbvFG45jxO6jYZVSE0NjPmce1dFWgC10apWxgejz9J+G2bS+HRdbT93JTThWPjGoKxRj1Qp4dIGQuUiUF4J8JgrR2Tg/Nai7wBQKf6DxfbaDzZoDu5qq+u7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uiQz1AwaYoTlL/V3YQ5qUQZDkSt/CeAD3nwFcrAf5Yg=;
 b=epphlQnFRPNoR01cohr0OfuN/b7FV1AM4j/vlbzwqL//Yk7aExtDujtaFI+x/u3xRAu5Y30nQU/WPIh4lxAK+LzqXJHcCyxWwyxzk83Q0YsI7HdrWCtcWyP3zs/Tyw8tgaRLJJ5/mntMqI3hoA9qIIt7atEDX6rRBHbcmq05Lz+7WkgTSyoO2F4GB7stM1emqOIBYaIPiZ/8/Wi/E1MKyXcvHOmsCIu63lSnOQVcYgaVg25bU4cByQA5sxod3tGfLyoNmyYitJAhxLQO2h+KEcReefmBcBjOLvdXhdXL+bUTqng2/HVO+Qi+k5OpufTy3Ijd3Sgef05wyNgxNYKeSA==
Received: from BN0PR02CA0001.namprd02.prod.outlook.com (2603:10b6:408:e4::6)
 by SJ0PR12MB5610.namprd12.prod.outlook.com (2603:10b6:a03:423::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 07:02:49 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:e4:cafe::52) by BN0PR02CA0001.outlook.office365.com
 (2603:10b6:408:e4::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.13 via Frontend Transport; Tue,
 28 Jul 2026 07:02:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Tue, 28 Jul 2026 07:02:48 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 28 Jul
 2026 00:02:34 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Jul
 2026 00:02:33 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Tue, 28 Jul 2026 00:02:28 -0700
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
Subject: [PATCH v7 10/12] hwmon: spd5118: Remove 16-bit addressing
Date: Tue, 28 Jul 2026 06:59:52 +0000
Message-ID: <20260728065955.809445-11-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728065955.809445-1-akhilrajeev@nvidia.com>
References: <20260728065955.809445-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|SJ0PR12MB5610:EE_
X-MS-Office365-Filtering-Correlation-Id: 431d5b63-69e5-4a0b-3c84-08deec763bcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|7416014|1800799024|6133799003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	i/s0ip7d/V3+BmjqQRKgGiycy7I2GNNaNwp9sqC1a9fsk4WfUFK8Eh/Yp/zhdWU+bxDGe2irNvxD8jvaT6uMGnSDAq/tzYMpaoKgUxvYRO6E+8AM1B94GIQgkedw5nhhzst8sAJpHakGLY+7VRfb5egDg6xOKxF6sTmRhY4M2+IMRLVM4t/jLJv5Hxk8MLgZqHYVZZuJc2Hc8EIxd8Vvd0CCZ34o0/sIGK57Twg/xorgMx/CTQBwFyhxz75mn0iflYa2i8p0ZMIlcvCt52HtFqrI/SdmEUhwrEVFi7heiweTF55GXzftSdg3t+gCN29Gx4bsSwszwFeb4sPRPlBpDf1hVpluRl79YikFOa+iiy9WPj7B+/S3IpTH5YCRV186VnyI9Lx30suerHaEcoqLAhYAmWNbracj4vW8caw9t0BeDUJhLq+QYyFchH0bt1ULjzG0RBK3vrVHJ0dgllqWMW62w8VB45ILetZk4wju1Z3iJjDTwktVnwgcW83oaJi9TUCCi1oDkXdK+LbVEXKR8FG7tDPB8xaKGKAjUTclA2KQsAjTQK4qq8zNcQgnem2NHwqzKcLrUT7MZt25sMjZM/UwsP6SqirKxYY2cP5JUsnjqNPm3eJE1HD2n1xlGq5YI10t1UNNe3ib7IF9dYhHoaSdRHRDTTZ6wJdG/WVOZTJAgqKFt0kpJXx+M2IHWt/G3EfGHPCeH172miEBimIgWw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(7416014)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	84y7JMT1GLsk/T5eNpNG6RLI3SmU4Ms0XVr7y19a8odYfqm7niD0kDRhdUTX1ALwYaJmPVzT7zANSiOLZW/0AUhrpPDiMjRwA/C5y3Jatw9ANwxLuo/U5FO16moBKZQwNrnq/Jfk+jQtnSBUG/PIdcJBI5mcD7O4DUgCsUhStucan3NJSUj/nURQSCvU1xG1BHuDLuxLjweM9EKEfGtJwKO03FVcHddIp55nrjuCpjTVrCfdnA2Qbw4OC5yn1jQmas/iNdW+0oASsI085dNnQHKsZyhV18JDcvd4qXxu+VBAj4ARzd7JB4U4Cx87Tmotbbl2mDI44Ae9MN/D/1daQh9dDDEKiwPgqWkYzC6Pa77TH/pyd063TZbFdsc7/2EQRSLCUhv+8M9KgVMIgvD4hLFO5FYyOaCXP8zERw8gl8bzQ1BIjpJSCeCY37pCZIx+
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 07:02:48.5053
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 431d5b63-69e5-4a0b-3c84-08deec763bcf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5610

The intent of introducing 16-bit addressing was to support I3C, but it
turns out that I3C does not require reading the Legacy Mode register,
nor any specific encoding for page translation. The testing of 16-bit
code was limited and there are no known users for this feature. Remove
the sections that support 16-bit addressing and prepare the driver to
support I3C appropriately.

Suggested-by: Guenter Roeck <linux@roeck-us.net>
Acked-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/hwmon/spd5118.c | 79 +++--------------------------------------
 1 file changed, 5 insertions(+), 74 deletions(-)

diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
index cc40661cab21..6ba37a719300 100644
--- a/drivers/hwmon/spd5118.c
+++ b/drivers/hwmon/spd5118.c
@@ -66,9 +66,6 @@ static const unsigned short normal_i2c[] = {
 #define SPD5118_EEPROM_BASE		0x80
 #define SPD5118_EEPROM_SIZE		(SPD5118_PAGE_SIZE * SPD5118_NUM_PAGES)
 
-#define PAGE_ADDR0(page)		(((page) & BIT(0)) << 6)
-#define PAGE_ADDR1_4(page)		(((page) & GENMASK(4, 1)) >> 1)
-
 /* Temperature unit in millicelsius */
 #define SPD5118_TEMP_UNIT		(MILLIDEGREE_PER_DEGREE / 4)
 /* Representable temperature range in millicelsius */
@@ -78,7 +75,6 @@ static const unsigned short normal_i2c[] = {
 struct spd5118_data {
 	struct regmap *regmap;
 	struct mutex nvmem_lock;
-	bool is_16bit;
 };
 
 /* hwmon */
@@ -348,12 +344,7 @@ static ssize_t spd5118_nvmem_read_page(struct spd5118_data *data, char *buf,
 	if (offset + count > SPD5118_PAGE_SIZE)
 		count = SPD5118_PAGE_SIZE - offset;
 
-	if (data->is_16bit) {
-		addr = SPD5118_EEPROM_BASE | PAGE_ADDR0(page) |
-		  (PAGE_ADDR1_4(page) << 8);
-	} else {
-		addr = page * 0x100 + SPD5118_EEPROM_BASE;
-	}
+	addr = page * 0x100 + SPD5118_EEPROM_BASE;
 	err = regmap_bulk_read(regmap, addr + offset, buf, count);
 	if (err)
 		return err;
@@ -473,15 +464,6 @@ static const struct regmap_config spd5118_regmap8_config = {
 	.num_ranges = ARRAY_SIZE(spd5118_i2c_regmap_range_cfg),
 };
 
-static const struct regmap_config spd5118_regmap16_config = {
-	.reg_bits = 16,
-	.val_bits = 8,
-	.max_register = 0x7ff,
-	.writeable_reg = spd5118_writeable_reg,
-	.volatile_reg = spd5118_volatile_reg,
-	.cache_type = REGCACHE_MAPLE,
-};
-
 static int spd5118_suspend(struct device *dev)
 {
 	struct spd5118_data *data = dev_get_drvdata(dev);
@@ -519,8 +501,7 @@ static int spd5118_resume(struct device *dev)
 
 static DEFINE_SIMPLE_DEV_PM_OPS(spd5118_pm_ops, spd5118_suspend, spd5118_resume);
 
-static int spd5118_common_probe(struct device *dev, struct regmap *regmap,
-				bool is_16bit)
+static int spd5118_common_probe(struct device *dev, struct regmap *regmap)
 {
 	unsigned int capability, revision, vendor, bank;
 	struct spd5118_data *data;
@@ -537,8 +518,6 @@ static int spd5118_common_probe(struct device *dev, struct regmap *regmap,
 	if (!(capability & SPD5118_CAP_TS_SUPPORT))
 		return -ENODEV;
 
-	data->is_16bit = is_16bit;
-
 	err = regmap_read(regmap, SPD5118_REG_REVISION, &revision);
 	if (err)
 		return err;
@@ -680,69 +659,21 @@ static int spd5118_i2c_init(struct i2c_client *client)
 	return 0;
 }
 
-/*
- * 16-bit addressing note:
- *
- * If I2C_FUNC_I2C is not supported by an I2C adapter driver, regmap uses
- * SMBus operations as alternative. To simulate a read operation with a 16-bit
- * address, it writes the address using i2c_smbus_write_byte_data(), followed
- * by one or more calls to i2c_smbus_read_byte() to read the data.
- * Per spd5118 standard, a read operation after writing the address must start
- * with <Sr> (Repeat Start). However, a SMBus read byte operation starts with
- * <S> (Start). This resets the register address in the spd5118 chip. As result,
- * i2c_smbus_read_byte() always returns data from register address 0x00.
- *
- * A working alternative to access chips with 16-bit register addresses in the
- * absence of I2C_FUNC_I2C support is not known.
- *
- * For this reason, 16-bit addressing can only be supported with I2C if the
- * adapter supports I2C_FUNC_I2C.
- *
- * For I2C, the addressing mode selected by the BIOS must not be changed.
- * Experiments show that at least some PC BIOS versions will not change the
- * addressing mode on a soft reboot and end up in setup, claiming that some
- * configuration change happened. This will happen again after a power cycle,
- * which does reset the addressing mode. To prevent this from happening,
- * detect if 16-bit addressing is enabled and always use the currently
- * configured addressing mode.
- */
-
 static int spd5118_i2c_probe(struct i2c_client *client)
 {
-	const struct regmap_config *config;
 	struct device *dev = &client->dev;
 	struct regmap *regmap;
-	int err, mode;
-	bool is_16bit;
+	int err;
 
 	err = spd5118_i2c_init(client);
 	if (err)
 		return err;
 
-	mode = i2c_smbus_read_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE);
-	if (mode < 0)
-		return mode;
-
-	is_16bit = mode & SPD5118_LEGACY_MODE_ADDR;
-	if (is_16bit) {
-		/*
-		 * See 16-bit addressing note above explaining why it is
-		 * necessary to check for I2C_FUNC_I2C support here.
-		 */
-		if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
-			dev_err(dev, "Adapter does not support 16-bit register addresses\n");
-			return -ENODEV;
-		}
-		config = &spd5118_regmap16_config;
-	} else {
-		config = &spd5118_regmap8_config;
-	}
-
-	regmap = devm_regmap_init_i2c(client, config);
+	regmap = devm_regmap_init_i2c(client, &spd5118_regmap8_config);
 	if (IS_ERR(regmap))
 		return dev_err_probe(dev, PTR_ERR(regmap), "regmap init failed\n");
 
-	return spd5118_common_probe(dev, regmap, is_16bit);
+	return spd5118_common_probe(dev, regmap);
 }
 
 static const struct i2c_device_id spd5118_i2c_id[] = {
-- 
2.43.0

