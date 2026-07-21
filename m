Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011011.outbound.protection.outlook.com [52.101.57.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13EE302163;
	Tue, 21 Jul 2026 04:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784607052; cv=fail; b=I+pEFcPMnZgNQc7tyftFMpRQOblsMStyUwG95ksG8ZFlEimMkbNqmHfVMVHEhf9q6agtU0mu2bK6U+2eNxwrFW2KSxqP5QQjcbIgw+VJkPBTAox7/+p4XBF8D4PKqvAfzrHA4sh2x4fHkruqP2xUjhA+i4rRnbciwBPPDSqynx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784607052; c=relaxed/simple;
	bh=cD9GtWbmyjTAeDl0835o/YmYxeOO3qdn37NBB3MlNp4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EZz+FHtJUVcsShl/dmKRfiTGuaoEz9LhvGfFMN6EDfU9pkiujvuZoEFuSkVm2nLSlgxAP/qzD5hrNQtNwt9cTiAmbnlW77TQF9Getwdk6D56oyfgaVvXa8UKBPUYcnO0dhBmQU6466MkedyFx2WhHnf4HitIbya0DW7Hu4PKt8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dSOUhbGm; arc=fail smtp.client-ip=52.101.57.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dSOUhbGm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IUMOqnXDOlPYTactxN5S01b2CKxL0JcWpz4yd4KrRyTPUcha+nyNNCyDsjU2HycnFbXf4u0RHx0nf6gELW6D2HphpykaFrtSx/nxdQ2ex0/ORfqW8oc6y2toZO0g+ske55BfHaO9Dakcyqdnc7WxNr/ZqSnmL4jILGTlTsrq/OQVcwvZbn5GWOfxRsHVSjDiU1R1L+NPQkUUJtZkLUFZW1hg910dZTZdTwyP2TtcQHNsHe4vJKkKTMO6228FwT3GYmw8O2QbE53ZLlGgpCTW5zgryMIt5LyZpwPIoalr/iFeTEAA08G9taDYHRWF3eePScdD8cFVDhYB0ew297hUCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uiQz1AwaYoTlL/V3YQ5qUQZDkSt/CeAD3nwFcrAf5Yg=;
 b=xLQldvlSb1GfMb9XQ/vWxXugCe8IVh+P8FiFQIYi4akZBSD4hMXYP3HKSmaIaQBHApEalQXV8+pGnW7FcG3G4qYDgVAB+HsVx9GySNpNdZcf/vbRBF20LmGR8KJID0/pHwWJHN3rOFyC4RIUMfyklxA1WpT7r4MxLSuEXutptaYe3tFmEA8JMf53Uk0200nA7GcDfp3Xz77ISEwFz7Vh5tkYPxV1AXz6B+OyLiXz9ZGXg+w53WiqphDkaodVBysk01mbYA91JF9cpJ6GzaGutLGYMoLZaaBdn19Egla6r5LNh7r9Q2BRbJvOzqdi5Sfu+Z0nWPo6/MLyl/7EqNtrsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=bootlin.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uiQz1AwaYoTlL/V3YQ5qUQZDkSt/CeAD3nwFcrAf5Yg=;
 b=dSOUhbGmUkf/Jk3Fw8JgZ4rJWDE8dlm3+CbrRy3ce61Y2TqtyCL0Zyir8PQtDBKuKwydLCoAApYEgQpMA+VFzBp/c99A1n0MJUeHV0IHe6H+5JyBJrskiloqrS1zqPlBRONa8w9cvw279zOmmAVuukCaRMgXqrUtnI7d/+QiPlw8pVcl3jzqZ/RhDNFDSI0fjepkno35VBA82Q8lZ/ffwAId0cOJjXb+A7CzImMFEZC/G/K1ROiGyw+wdwnEuA5P43MfqVfu/5dDeiM56wZEQS2+u4b3ZFVf0x2HreSHUlm9g1cWasIuQVmZMNGckdi+qZaMkC5ZsXSdl10nGf503g==
Received: from BL1PR13CA0061.namprd13.prod.outlook.com (2603:10b6:208:2b8::6)
 by LV8PR12MB9358.namprd12.prod.outlook.com (2603:10b6:408:201::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 04:10:37 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:208:2b8:cafe::46) by BL1PR13CA0061.outlook.office365.com
 (2603:10b6:208:2b8::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 04:10:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 04:10:37 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Jul
 2026 21:10:17 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Jul
 2026 21:10:17 -0700
Received: from build-akhilrajeev-noble-20260602.internal (10.127.8.11) by
 mail.nvidia.com (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Mon, 20 Jul 2026 21:10:12 -0700
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
Subject: [PATCH v6 10/12] hwmon: spd5118: Remove 16-bit addressing
Date: Tue, 21 Jul 2026 04:07:58 +0000
Message-ID: <20260721040805.1696503-11-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
References: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|LV8PR12MB9358:EE_
X-MS-Office365-Filtering-Correlation-Id: 102b5b22-1446-4dd1-e3e8-08dee6de04de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|7416014|376014|1800799024|56012099006|11063799006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	skuFhQ92e9xdyZucRy3vdp6t6VjobKqXiQEEBUHU5w3AsATtylBL+O8+iAOSbsnCpciokMoFrl0nCOFgHaf6c8iZ57vqJTdQyCqnDHizVZmQ4s/5Ikkoa72KDHfSVPEj/eCFHNupBUWJ3E0ZM9OIbBi6GSiB763q639ZFu7clWQp5NxrLGRF+kgqYUzLbyktuftt4jr5uoNH2laFQnWGyQf3aEpVJoDIfrpXewC2W7jZdBsjQVrAYuRKRBlqLjKBMc3Ds0hXe8cHvK/0O6yjuCQmTt4CwN7Rfqd6re7V8ompZ/NTMDooiscgS7HDdmnY7JAdIgx4xUc0lXPbmuou8XiWjZlOQKBEvxvFdODNJ8opLkJtDVr409r85RMR7mloOQWAK0yM833zeKep/fdrNXKth/3e32Ue4cqm6EvMFAT7fUoQlhr2Hs23ryO3PLivR7bAWO2gFdI3HiA+P1QKt6MzjNqNrsp2TzalvFKD3XSSvUPkCxw4OKiIlGQL0O/n6gMpM4EcNUpB74kSzRkbSU2KLcRbr2+rWy4QpgJgQJtgzgVE5FatFBVD9KKMPFYNcPTQZsMRQyrjJMNNo+7AuNQLbZ+K0b+0RIFZRQ0W2xnDNEIhKvcaW1GzwI3tGLMSZJd+kXu2exelRlqWxkuu04ScI+VQFhvfSysPuCCBL8+Htusdnik06t+BcBRPqIeaY4mLK65ylFK951dVZ9Wz3g==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(7416014)(376014)(1800799024)(56012099006)(11063799006)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oHYIIB/QoxW1iPgyX+KqvKQgCzaNPzLwfxFHsgyc2JVD/Puc9VjhOb4eob6sN4ZDqNSftirmf/GdheStmRrc3cHXm/Fv+eRF/iuI6CAoz949qGiUiZ9vI/f8Ovr3KGgV9MdHQ7oTa7m4IGRZNEffXCY7Ebpmd11j5PczTOG6B4lNvJ3K+fOu8n3jUqbu2RhqucukCChC03BehcDEJpoBFnTzNuIK3J7CPBjA4XNc9soXiTa1alwfCmubyTvMFdCAj0tmG7wEhMKmODtF81iqG0Rz/odbOV+HZFbf99KRXBIqKmOSAh4ZCgR5FlIOzYCTRSNKuIMNasAdFTHs1cyOQfOHNe/SVwIfAsnhGeMdnoqbTgT60Bg+UWKUv+tnN5Kc2hP1Y4wgZrqj/LtBf04WkW61g3kAZ9q7k/31z8M2v030OPvLzsr+wy5tVjO8e6o7
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 04:10:37.0252
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 102b5b22-1446-4dd1-e3e8-08dee6de04de
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9358

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

