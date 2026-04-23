Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013065.outbound.protection.outlook.com [40.93.201.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785783E023E;
	Thu, 23 Apr 2026 09:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776934855; cv=fail; b=ER2KwLbLOK9lFllU4ubIECXrqZro6FGoa60sz+gzyiFwUiIEu+NQjsDVDp44lCZaJQLAbmFZlDhSCi5krPuEFnxsWtL9OI59tElY4ogBh+HTqN6rh2splNFzlwWxkhplCSe1jee67JOdRdyDrz8V/UeejXNKrJAQFkCvpuKDybM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776934855; c=relaxed/simple;
	bh=8X5fiZ4iTBUN72Hld2YNXk8vTOGm5BhsU+AY5Jj0wqY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HPDelndK814TK2vu8nt5C46J0yzTPc/itSeU5+tXWdT4y/QH7Z3w4XVJ91KkxmZTN22Bpaqkns/WYUK6sBiihfnnUWoy9+BFcMDekxnA+Uk/3n3EETAXU6dV20QNEjg/YVZx9g+UP/tvlW+OOiDh+/vSSEhbM6qa+X2JVn+oQ+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SXPfJB+Y; arc=fail smtp.client-ip=40.93.201.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SXPfJB+Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=btU4/sGiH0J+bKyPRF7+MecY5P8BdCbHkMO8aF7GJnyvoLn99J/LED+U1ESg3W0HjZyL91zTQDgjPJ7Uvns7DgIKSWCQWd2LLiiUB8zn5FVsy69gcNhPZxWlVxIpkcUbSHSjIA+XXJ4VFNYsUCXiQnFE5WIdn6JlJwFbVPVP0k69jfaTiWjASHHeWW+9OCXL6rjLTAaITZmmQx6EE6vc0K8SK1VU+8tipGbN2SD+9HAQKCosauf2MhxJYG5FhmYW3w9RcZBircCe9yGBDqzI/2efkLuPrj3C8otDGEWmVLAAznXDBKCVjmBS3a4n32KVPFpb3+4Pk3PKNOeF9FxxnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CZBgN4uhzoTTgsILiIPmszUJ0nSluvCdQlqODzu5fCE=;
 b=KV8H8iZohz2KqQvCLFQuz72evG6bJy2Bq4tHde3oJiBRXjUEU8H54x2ZCeGcgmEW8JaOiR6ZCcH80tGQu2bDxToP+ldKqS/SdrwnzqtphYQ4juLaSXP3SpZKqnuxktim+fCqzwh/iMWh6iS2/URTOPG+ykrbkKIBryeoS+eRW7RPSOgRkaJUApsIultkJ3F02TmdQKUlVYxQjs53gYQ2rL/B9PiMt1ulJvt9SDCxuHMKtusF8eE2htcLRQGGhzn+gDaji1Tf+HeOM2XQ22TDytK69uTa9rLgehpV+07jA5234aqWJeU8Y3ozQMZ15RdK0Tjk9vih2U71VU8uHACenA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZBgN4uhzoTTgsILiIPmszUJ0nSluvCdQlqODzu5fCE=;
 b=SXPfJB+Y2+/OQKEtx+dkxn233uL/0raeZv9IrtlhBcTmp058h40bqRwczxvwfUCtrZ93E5vRE8gyNXBe8GzqbzI014CC5w99n4rAgUCTjn+dB8+rdjSHo7ZI089MoID1+6jex7k+xonFViRhOwXvawiH5n3YW3zLSQ1yPJm0rJSEeAYES4DGOTfZhgUl9lqmmRHHLrzlWVFMhjMrsMZ47bkV4BVDnpKhbeo9Zsg4B5LT4bk+RgxBg6+/Ol8Jcf2Jz3MFpXCe6cozPZi1G25Ao6Sdt2o36aUJCzQopwMYnao42JZV2+3qE21vUzTWdw1iWubgH0sfe0k+f5NB9A4dog==
Received: from DS7PR05CA0039.namprd05.prod.outlook.com (2603:10b6:8:2f::16) by
 DM4PR12MB7741.namprd12.prod.outlook.com (2603:10b6:8:103::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.16; Thu, 23 Apr 2026 09:00:44 +0000
Received: from DM2PEPF00003FC3.namprd04.prod.outlook.com
 (2603:10b6:8:2f:cafe::a7) by DS7PR05CA0039.outlook.office365.com
 (2603:10b6:8:2f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.20 via Frontend Transport; Thu,
 23 Apr 2026 09:00:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM2PEPF00003FC3.mail.protection.outlook.com (10.167.23.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 23 Apr 2026 09:00:42 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 02:00:21 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Apr
 2026 02:00:21 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Apr 2026 02:00:12 -0700
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
Subject: [PATCH v3 11/13] hwmon: spd5118: Remove 16-bit addressing
Date: Thu, 23 Apr 2026 14:27:10 +0530
Message-ID: <20260423085718.70762-12-akhilrajeev@nvidia.com>
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
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC3:EE_|DM4PR12MB7741:EE_
X-MS-Office365-Filtering-Correlation-Id: 5147b167-c63c-49d3-40c7-08dea116cc50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|7416014|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	pJnu2zWedIO80mJbPWwR40Q9/3UJSD0pgCX81wYoJ6w7lpkOVR9aV9RxzH8MtxbX3MuyWa8pUJTLe9ZKKxxcbUaWZsC/UBztTdx8ZcEoOEeLoU9yDliV4cuPbQXfBd8lRteWuPU90OHnHGRZD8XB+UKPpffy0wBtQT2yXpvnSaqSFLTiGCwAp5sv5j9Qjhg5dSF9hjVBuPm/Xo6xRFGe3nZ4bj/AMkJ3aQ56D//CKC3JD/IcpbBvAiMq+jkhvGGUAKT4gmqXG4N0cce8zgrpoaCw01kjIJN/SvhL/O0DNUr/1ItyolfXRQfxgTyv/sfKSUtcGEiRP/i00bpUxHw9rf5NjPQ6i9XEi4WCaZAiXIIcS/uMzl7tt6YlzIunZx8wOjUA27mxf3AvmhiOBzPX77cmblKDkTvvX7jrE6CTt9Fe1FvvBsydclL+Aiuzb7KnhrA7CZd11rz+hqLaFhaMeSwdzhsmHigvuTh0+9/U49C2u6UHMKwGenONdZvCNF68p9WnK90PBN2L3jlN46D11KcOyh5Cpx7SE4u0ZXxBUG/+BWwJNSCAIaq5cT610zIxF3miHqn2YtGez67mv1WtdgHpKTbiRscX7JsJ7CVSBG8Pb0HxsZ+exyKUyYD3EuegYM2B2+GYhEC1f5x/HCphL1NBYNSjWL7ckriwUiST1plfC12BkoCmqkAzSL6YZ+oWm9+Ck0u6yjfWwgYOE9eZOyqSiz509MKgrjG4xHOCywXFd4oQvbFpjaJKesIkkgHF/qYPKnpOZW2MPGuQyxe8g1Meevhf7zWbOf2Mqse2OTIaiLLhjiXhNbqplvdrpNsO
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(7416014)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Qs5K0ZiwQ+97gekp2NrYIpEKqLRxRgF/JSoEgKL82WpOB3SxshrEde0Yt7aaHqoyJ42VP5C1s6HAtLtCoWdu4wtPCandRoqBz1YZwDxV3UdDLhL4jUu7atSfb9UiWY9o26OqEiv2JagPoP7jc55zbGB7+0ObAu/Dd7R4H5+LLqfLnSkeZX7sCOSuQKmQzdBj8IP/Bd+sKVx8u93P7FK1OS2vpl7BPG87PFixe4AJUJk9ghm75uEfZr0rqTguI1nQRrJSlFHJwM1XPyfr9tvLGpK33/scj34uGDlHxt5aK+dDMTE9303mgkQn6NzQ7nvWhA70nYz6Mi8+glTrW+m4Vr5gs0h40RHMOQBRoek0FS0g5Z8cTA3Ow+atTX9YKKljpXHofsiyHuXunKkTsMse+dRcPS3QZxwYWzj2nrLFc3Jff2UXewZZruHig1BqD4+Y
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 09:00:42.1263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5147b167-c63c-49d3-40c7-08dea116cc50
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM2PEPF00003FC3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7741

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
index 5da44571b6a0..8fdde35e68cd 100644
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
2.50.1

