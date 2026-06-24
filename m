Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010060.outbound.protection.outlook.com [40.93.198.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F13824676D;
	Wed, 24 Jun 2026 10:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782296690; cv=fail; b=Xq9OC/nMvWIQnHdcJdcM2HdxJLQD6W0m+RpCv/8IIqbhsNHNMZGVIQu9JCSrCzWTLPBRvWlVJZZSNu9na3/Fl8Ho43Ld7hX+7tHRiY0bsrZl68yS1mGrUEOCT8SCdDTzRT/kij8Z+lg/ov69JQyL8CS1t2JO6L8YzS+yKQTM8yk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782296690; c=relaxed/simple;
	bh=cD9GtWbmyjTAeDl0835o/YmYxeOO3qdn37NBB3MlNp4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hqY80HYoY4rHw9JEliqyjlRoDtVdVC00rGek3hrHn7BE3+UT5uxT4raiCHAnt6xcrO8dxzA2Gz20HlXj9GSJ7B+7qda/jcKuovmsu9eX5ykjWhbnrwVHb78adhAXvMO5/BTUqLLLkeSxVxi+HbKjTGdWctJYVGJRUJ83Hh9rGhI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qh5gWAQP; arc=fail smtp.client-ip=40.93.198.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qh5gWAQP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQ2Sw/40ClOoLfViYLgyYnFn1+HDMoxOAVzXFdiGiBL7SH5/agshalE3vknZsH6a8jQa5UhgcLHtxHQs15mHcqoDooVS7afCgdEJdXFAlCo7lUQEwHXnrUFIbbkU6xytErElmjqL2GyrMXhoePfh3dFGaJTLx0cNpK6RSC669FnLaZb7i6z7trpq3wAp0LwFJ4Dst7oJipUWaAKhPo8sEMqRCzED66QH3Glnktrswi2TC+ywZ+xWR5gJ42K3O4xMaJVrN7N2danWKENmiJDB3ucMpboUVx59SVbK/DS+HH9tyBpEPwBhl01fgBJeNuTfA9nWBVyNHL65UWBrVpopeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uiQz1AwaYoTlL/V3YQ5qUQZDkSt/CeAD3nwFcrAf5Yg=;
 b=gBB+RR+fvaq9xNFiPNIlHJg8B5eIxcjdg5aUwKbNCPZhmLMf3W20NdIL5ex00zZs/keWjamAghDef/OB4jPRRpayIwgJTVkYXdf0+DdrMx0XToWzad+g1PpB8cLzKN2X4+z/G5oIz5sDKBmDyqe8h5paLI6KkTgaiDtTCvTKZ4OiVYJfzUA4gGFLYXNeSDukPO5FCdEdccHBcBi8PLuz7o6EWB6TY10uQFp+BdAHNAnuAu1nVIF+WmPihuA4/OS99br8sQSzipgHB10Q1DYJumOCkHQkyCTLyygdWgI6NrSvAsBuJ0NK/Ulil3LFE/1U0kF8uwSAWmk2H4lmwEXEzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uiQz1AwaYoTlL/V3YQ5qUQZDkSt/CeAD3nwFcrAf5Yg=;
 b=qh5gWAQP2DoLQXqQqmjB+AjkqG9WRfj5YGLDtDHAjklIIHmwEM+5Yp0NpgHWShHl9WXQ2jxOA7P996zTlZaTvgrZuuQ84r98MVXsZImWMuptZmNOHAGuDQmNgAxKZWxrSHvUVx5GcIId1QWvySqpR9DMf/LayY/rD+CThGNsxTo+VAYBvP62zlXXhMVXvCR8OzdCgm6FpSktjUaz+yptYcv2FrRNTZ8PBM1DNPqqYQGIokfpIHp9QC1+EWQn9vIoEnWqc4Iurda/cwKmI8N/TsFU+YPJ+8hHPN+sTshlP8xn5fcez077pkfWxLGAPaJj8ukMnYrBHHvdg4JIbWipAw==
Received: from BL1PR13CA0349.namprd13.prod.outlook.com (2603:10b6:208:2c6::24)
 by PH7PR12MB8038.namprd12.prod.outlook.com (2603:10b6:510:27c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Wed, 24 Jun
 2026 10:24:41 +0000
Received: from BN1PEPF0000468E.namprd05.prod.outlook.com
 (2603:10b6:208:2c6:cafe::8e) by BL1PR13CA0349.outlook.office365.com
 (2603:10b6:208:2c6::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.13 via Frontend Transport; Wed,
 24 Jun 2026 10:24:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF0000468E.mail.protection.outlook.com (10.167.243.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 10:24:39 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Jun
 2026 03:24:24 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 24 Jun
 2026 03:24:23 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Wed, 24 Jun 2026 03:24:18 -0700
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
Subject: [PATCH v5 10/12] hwmon: spd5118: Remove 16-bit addressing
Date: Wed, 24 Jun 2026 10:21:04 +0000
Message-ID: <20260624102153.1770072-11-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
References: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468E:EE_|PH7PR12MB8038:EE_
X-MS-Office365-Filtering-Correlation-Id: 77df185f-977e-43ac-91e6-08ded1daccc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|7416014|22082099003|18002099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	X7oLQBuPPPs6ikTaNNjuGir9xeJC0QehTqtQUJmldLvhaQqYCIBq4sheQLdfn8mF2FXQOa3Uyn+7aR+l0YeQBD54F/Ko7qs2MS3CnNjzHIfVgX3F6kj4rVbPwwbRch0XexWPzQv/J0HFfXCtHK+8s5ZZaBRnurmRpNdCl0mxQ3yLemzUsE1VFuKYHAkHGIWjweInAVFrw8aREN5JAvRcLVeGF+Udb1KVrkXM7nlwXevHhNHTkuXhpx1Irp8TflT8bzG7wt2IbpoMMNm1ftJ24RhwNVX7GBKSrrFmrlQyN0nTodwcMVkDPK9koPeqjF6BE506V+7MYjggIU9Xg2tuBMcSxZ2M+oovDXUaVsMDQVwxkxGZh73QlmCh9oIxjvt3ArkdlvK/KiXmNX8fbTUauKU3TVxyEM0o/1VlD84YMgs0iEd5IhdTf1/yF4TIRpEhfiyGM+2Du8kOMwwhMVQUJFJxxZrz9EGyS4G2C+m89BxObV0mp5Z4Z72spESyqCkSxs4BIiAE6GU4rcatgyjxzDb+XSRXWgPSlMHfmuXAg/snfTB5hSEREP6DiJL04w41kbj+1RfuWFejjWHFKNnWqOu8L3F13bvsW6tfhBCJjm6iRTZAyr5WHuDNtEfcooRvHS+hjiKbzcypJnSULTYf0jLjgsX0DT2CiAdJauT/AhlQWfya49EDQFggn6ix47fK2Uo4ziNSMkS7vz0rusLJWQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(7416014)(22082099003)(18002099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iAwnbiUAskeut+8qPY7PoGfW7hlqv0o6A+uivstTbgeuYIlg6fjEPt9SRd8rE/Vc3xUUm1Q39fu8BVlHhGOiVZYgDYjTllMc/GSwgxxe0MAMNNK1usAr+lK+e8zWBJwS3NXJLJJrx3Hl9wy+OAQz///Py81/SIlBn2Hdrf0+k7dLqcwTCGtBD5C14QQVx+iVDPZptNeLiuzqfnq89zGYa3DLDDwSGqySlSCJjGvyHUkCM5iZmDlMXzru4mktnte6c+tNJIGNAHaV0qohfvyEZ7Z74UpuDYwTiQBSaIueHS9+f5vDqBvg7RiNOosTu8KZh6G6qz0ltxrZ0cSpSTJZ1e925PuN3THjkPNqDkh1GnjcQGhrhMUFwzLkEkPgcdWrTxX22fxp42NkSF9b7oQ70iMQjfeAE3EEQWGvHlPB5eIOJBoHSF3ThAmXWzgmGAaq
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 10:24:39.9533
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77df185f-977e-43ac-91e6-08ded1daccc0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8038

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

