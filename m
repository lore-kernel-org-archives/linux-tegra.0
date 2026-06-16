Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010051.outbound.protection.outlook.com [52.101.61.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356003AA1B5;
	Tue, 16 Jun 2026 09:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781603846; cv=fail; b=dO0oe7sUo13CH+lLf/vrdM2xU4yf65TO+cfbTqpSilZdKV1LIuvMLLGw6R6Zf4SYtWsPhwgYV/Z9WQDmLUYFYcgwawl4kfTG2+A5umMoA7xMFtFPumGjduEWBS9kaWn0HfMV6MdhylaAHVxXR4zBAwVraPASsYExU+1na4e/0vg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781603846; c=relaxed/simple;
	bh=cD9GtWbmyjTAeDl0835o/YmYxeOO3qdn37NBB3MlNp4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gncpqNyicCwuCB9MDCn81Zl6vlltBI3dp8fPiwZDJjQeraR7JudGxornNHpnE569iV0/MG3ST5mE9kExwMpezS05SrgNb2XuvUl22KqT5s8L9zftNGWcL4f8vIVCAo6Ao43ZT6wrEv8nMHThnnnGol1VL5hECKQ5uz90M12Srcg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gVQcYR7Y; arc=fail smtp.client-ip=52.101.61.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gVQcYR7Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=frCiXf2YSthcowIQfEQURMXkXsdGgMLKexy5Lv8sawtbnaXGBSJBhIGv8PNZXx7I/4NTgfZzFFBcnStgcM9b/nzWQcrqsmYOS9m2oN6y3kcngBdCgMxiMeNNvp6xC/igqFlpJloxmCO8rQEjkGon3XOll5b/EfjbVwipbqHWpYrgxBaawqxXWNeNM2xbV6E4mgZ6YW9Uemzz76CGYulAcM67QuJu1y/zBrZfqshaDbdfjdViUFMykK4qvaAuYygd7HWsWCpPebXwkxAb/+CyDkUXOyLMaL7TM/Cae/ZVDbCLw0+k+5maLlGUYsN+9WQdoCqpdjBGXCX5p4h72qPAJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uiQz1AwaYoTlL/V3YQ5qUQZDkSt/CeAD3nwFcrAf5Yg=;
 b=dzE+iiL5ZE1Fnv4d9XfPFjwDRU1gO2fw9YJ+gS/zM17GEO88nCj0M5Fvgqo2BZKVlyktUJkA4eJE0o7hjyC4HfhhYoYQBeP0Vz/PaFjo67m6ZynyU2kibFkgtzpjkrIXt8/PXRpHTfG12ps/21186EUpxk0BLdoy3rSGIRyrUS+9VgzIA3U5trsswSrQS6E5EvSe9fKIxhmQkac54SYHWU2Gr/x+3e0DzNXX7YvtOmmCaENn4Vwzt9uNzePccXrkL8pSo6h9ulY9nW3mNWmWQP0hfh1lJJwL1s6g6B3e+99ho3lQr82iij74WjN01dkiaR4VREJCm4cZihLxbw1j0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uiQz1AwaYoTlL/V3YQ5qUQZDkSt/CeAD3nwFcrAf5Yg=;
 b=gVQcYR7Yk5x2/zMV0Jk4u0lXLITJiddet+ArBte1T2YYi1oua7WIFZJyeCDB1PajN/qJvO4cmCrz6UudyZnGwXC3h0LuZoZGs2o44TcUu1HZKQLnHWBBRDz7QA48T/i4I8HtRPc06GADIc5Qf6TUxkV6UJdkPjqi+ENp0KYjUu5cUNgr9uPlNGCzJGuDxeFBe/HS+ZEn51LlcqJXKbwcj4usbFb+f7WzIAqhdaqmnDz8JGLRz/gij5I0h3Hwq7ieHCs4qQIfyNKtesEcdW5zvCnnGrEmeEKtfiOZbZ9CyZ6D8IIQk8fez6i7pShz1v0X1lfWvJ9OnqgAD3qntCho2A==
Received: from SN7PR04CA0194.namprd04.prod.outlook.com (2603:10b6:806:126::19)
 by MW6PR12MB8898.namprd12.prod.outlook.com (2603:10b6:303:246::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 09:57:18 +0000
Received: from SN1PEPF00026369.namprd02.prod.outlook.com
 (2603:10b6:806:126:cafe::58) by SN7PR04CA0194.outlook.office365.com
 (2603:10b6:806:126::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.18 via Frontend Transport; Tue,
 16 Jun 2026 09:57:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SN1PEPF00026369.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Tue, 16 Jun 2026 09:57:17 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Jun
 2026 02:57:06 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Tue, 16 Jun 2026 02:57:05 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Tue, 16 Jun 2026 02:57:01 -0700
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
Subject: [PATCH v4 10/12] hwmon: spd5118: Remove 16-bit addressing
Date: Tue, 16 Jun 2026 09:54:24 +0000
Message-ID: <20260616095429.3947205-11-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616095429.3947205-1-akhilrajeev@nvidia.com>
References: <20260616095429.3947205-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00026369:EE_|MW6PR12MB8898:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e5572fc-7c12-4356-e6e1-08decb8da6b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|376014|82310400026|23010399003|1800799024|11063799006|56012099006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	MvEq3+K4kMXc+vgObNRgI1Z5rlCpcZ+K66ZQ9k04zvLiM3XEPz6R7HTKmqh4/T0GXakZAP8i2lneJKuf/G/inLuS/iSbNdQ7CGbiYDH1nO/1nkQ3IkznlMlsmmf77qyv3DPPcJTLvR1Hm/HbUKmXt+XPXYziQufIBQqoPQTCRRZO8ya1b/9kx67BKTKZD/IM4aEOm1v7qbBDULJYrGAuh1tKwpRtOjiFEoJbuyLSvaMCM4BatQqg24/EMASHnCoGKmFFz0KVoq98fhprpJYAAzkFEXMsL6UK4hLtw6T/u2y2nU8zZgqvfdMwZJmEvZOCY1Px/wW75kSs9ADFqoAuwxT/9rT6HETqwZMOkgH+WU43ILb08biPzEuPcIp2R7367e28MDqudFngxQF8WwvP/TPOgk4ZJ7rqYQ30KrcyJzSXMJXVBHk+rg2rM4Y90hp0a9QRz2RzuhA5IlKUFJqkiy2x+ra1xPwKVifw+gnAI1WPzcfi94xBby+/IojBHDNNnlxWgd1k7WDJ22Oq/rJKHA9S8q80UDbUMF70d7ABUaATVbtw+qzNjJ9sZkyGrDoxHUJBX31iK029Ic5b6gAuK7+n0O815Kjew7ATQTeJFFtEq/K+HPeinKLwxndT8DFPVaV9OYZE1tvC8kwTWkhqJPr3f1JbEujkAyHXERLknsJvn9hcoGbjvEmkmJgAPsVt3eSmzDRXgXCKK6yY+EsNGQshXKmPqlGHe1oxU7Hct3Y=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(11063799006)(56012099006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xzR7bRZriIV0xR0Rjn3sX8buACkZG+z4OmB9jIqDL3cmWsK/mds8AVp2rNlgl+Fv4Cr88gvcEdaZKHjvEF0ZKO1kAHnLyxtNDuA19YBDysHHPG8N1c7gze3LKOQWgiY7ZhwhEeIHawJVoSa5ONYZuUKBMVdxMfK0cORUeipweSb/mY7q/UE7lcXqg4GpPBtgX0S0QYLG9SqmteGhpfEvfCEbAE/rxZsABodV7nYGjykE3m+oZt9zkFpp7sYnQVldXWW6DBbMaYSwAPng+4JDAZ4oB/ruPZEy/weGKNWfjEB/sUkT0HfWMwaPykclzbUa3DJ3nZNwbZiL91GowFZ6trkRcpx4xQpUvVqhei8SyAEARoPiK3jG+x7yXx/RJMxuab7tglmM+2fGLAKBKnkPin21uaA/lnGFSnK2Stc+X9bzq4vNOVnkjPY9XgM5FQk0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 09:57:17.9558
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e5572fc-7c12-4356-e6e1-08decb8da6b5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026369.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8898

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

