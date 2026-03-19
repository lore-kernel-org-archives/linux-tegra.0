Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012031.outbound.protection.outlook.com [52.101.48.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C889E3126B9;
	Thu, 19 Mar 2026 04:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773894968; cv=fail; b=VHQXVqhRMnMiyS4ewcNB0PmYczlOGEsp2Z4sqQJbCN231F88pqNNsPALZtJ/3ZKNBvY98HLAMBGoSWWtr42IlweRh6pFMm8MeoEnPXr90LzEqnt8ledz6mO8EkUWqUhLybqwtccUh5H9uhh6XLzYEyqgPMbrDA3fOFP8XhTm3tY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773894968; c=relaxed/simple;
	bh=6J9pCKWQHkKJweLzEa6FrciVOabUaMLnCn1JicctWAA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hfMN19EixKgr/E2Qcldyxlt9JDrXb6ai/sa/HwzYee5QE0ZoegTc1gBnxcNlmU/ggVclVtC+Svdb4vmOuESOZ0Fzdxsy5TdfmPBO9nsaiIORt1mFfN3tLL7XIIq6qmtwSrfv5jB8XhyU7yh0dqKzhWp4WqMNEVYjEwZm3Dox8mo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=biYa/zaP; arc=fail smtp.client-ip=52.101.48.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="biYa/zaP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xvo3zMbw/bWZ2LIs4iV+CEtkGBmnd4B1hTixhRdzZO8Zcl89R8AQgAwf+PmdjSCCru/upXsRWsh1pA72+f0QlbeorXj6aLJhgshQuIPUXmhlm3zXOfVLfUHdiLuqHNMEKLP9WhCJc7dUY5FOM1Ni/83u6Pdv3Xfq22qt5k7mT6Mmfe8jZtB8vl5Z5q+ntN/BWnxbq1KrODi4zkj4mJCzh7LOGEsQL4mN4lXoLj4WzMgsf2W5SIJ30LQW17RaU2jBwXAJbd67hgv7XNTI9ABWBClkfWOPac0JGlB4wHoUeWjZR2pAOQ7RgKY0Y15Nxo94az1aUi9evFZ/tjHNgyBuAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNE6NY5Xhus889svthFz8/HqstUbR3i4p9lK6t1F6N8=;
 b=ZAHeYNEu1K0vibmpKMYciXF6/qM7kixmFNxrt6wu96UYSYL0Iz0FfKfMQvCuz+l0KWz4jTqtAYlLp1Z3CKVwDotxf8cd08uqbAaPUKG/rGuHauKHv6XhFI+PGORBlgmDEdQsyuyiRSyI4R7lDwXDVfNPSHNckvZZbbPoY+vY1S+Ew1y91NNkKc1LhvMFXCCgWX4iC02fr3EeaeOrb+6/oZVpr2UeYolaI/AeuHN5fTwi2rSyKeBu8l0I7XX1HHUhlsbONf56jxWb7oYsPcpge2LJ++OxApkPqL6b/JQJXr2rqps7jJxq6WMvMEgg6LnQqkc2qALZGmMDGH//KTVcoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XNE6NY5Xhus889svthFz8/HqstUbR3i4p9lK6t1F6N8=;
 b=biYa/zaPivADa91/EGN36m4o9qk7aDKiNeg5AIc59mU5Oyqw/auEnn3H+u5cB3fcoVRq4blVNxCfVI6wbY00Jp+4Vx/yTjjDzOdcjZiWqyt+rM3SnC540zth4TH/VLk5A95iXSE7qIwmoEoar07g9nUBooSIZgM1wt++2gXfEFZQrehocLDtulfP+jyqg+QyaZJttHM5xmTfMwIiocmQQ3yIsJItmcMnKNucne1wWIaIiod5YzSPPe2skdGKED155my0wbGQ/3by8G3TWOzlCSTg0lBX7LDTMlF/f+Zow259/ImBzn274b56VksXqLg6+0FAcsUqjf0J/wueir+viw==
Received: from BN9PR03CA0515.namprd03.prod.outlook.com (2603:10b6:408:131::10)
 by DM4PR12MB7597.namprd12.prod.outlook.com (2603:10b6:8:10b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 19 Mar
 2026 04:35:59 +0000
Received: from BN1PEPF00005FFD.namprd05.prod.outlook.com
 (2603:10b6:408:131:cafe::82) by BN9PR03CA0515.outlook.office365.com
 (2603:10b6:408:131::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Thu,
 19 Mar 2026 04:35:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00005FFD.mail.protection.outlook.com (10.167.243.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 04:35:59 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 21:35:48 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 21:35:48 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 21:35:41 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <linux@roeck-us.net>
CC: <Frank.Li@nxp.com>, <acpica-devel@lists.linux.dev>,
	<akhilrajeev@nvidia.com>, <alexandre.belloni@bootlin.com>,
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <ebiggers@kernel.org>,
	<fredrik.markstrom@est.tech>, <jonathanh@nvidia.com>, <krzk+dt@kernel.org>,
	<lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<miquel.raynal@bootlin.com>, <p.zabel@pengutronix.de>, <rafael@kernel.org>,
	<robert.moore@intel.com>, <robh@kernel.org>, <smangipudi@nvidia.com>,
	<thierry.reding@kernel.org>
Subject: Re: [PATCH 11/12] hwmon: spd5118: Add I3C support
Date: Thu, 19 Mar 2026 10:05:27 +0530
Message-ID: <20260319043541.39291-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <df8086b1-8834-4bf2-ac4b-cb921beb8471@roeck-us.net>
References: <df8086b1-8834-4bf2-ac4b-cb921beb8471@roeck-us.net>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFD:EE_|DM4PR12MB7597:EE_
X-MS-Office365-Filtering-Correlation-Id: a20db97d-8e90-4193-26bc-08de85710500
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|82310400026|13003099007|7053199007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	O2miK5d4BXvnZnO+WFdUieFdOlcwPJlkGfkrdEbY8qVw7HCCJ07yqFABWX3Rl6s8j/8gbsSZFGt74k9Yrg70FP4UNB4ZppE9qns5Q55zcTe3nM/I89EHT+qcDB/yLe5dt/9PMzb2ZZBuOxzy5idDIQlIIstbkrxObDTgFw2Esxik5ipNoboLeCB4TSbZVcu4JjxuvnAJCAJ2fJl4U8POnrA8o4WP01ZquikO6tsF6d40BtJgkQINyowfEzYGNjg70dz7jVmHpUKTKGYP0eIEUljDRW90t6TEIAv2DJHJz8Dr2QmUhhKYVzckrOQQiFwWBJN53FRJw5f8f8S/k5rikHi/5VwCoyZkXzObMYVkxj2WcvRn8BuPV3kIG2D72oLuINpvOC12pa74+C5r12npErHDHZlqa4E+VUHCK79X3szyP0i7J/k42MsreJHG57GX1fyhaPmktMLyHqfcr9RYqtAlIGMcuSwvkAT4YdBF0grQB1BQxL5Uhm9atvjuXRclZKEdD+Fe+ghkoSYBHuLsxgdUS5NCG0yr03uMToDfB+gKLwWajYqC0Jf7nHicRrx2RQ8pe+VAU6vwbgFbQGoYVXeFhcJIP08Tr2EHqJfCUpEC9Oea0WNrgiP9A/Lcz3QAPwNr823QzMFH6LB47+8QjQYciCCqYjTWF4I99in8giFrqzOACLPcGXNyYw/xP5Q0IZz7kjp7cXA0VgcJzxChNVjvFqoVI9nm8ozCVfz/u1oUmx0zF22nNQ9KH7mCRAhxpU2psSL4XKMYcEo6vdrdBw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(82310400026)(13003099007)(7053199007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wNVoqq8FTK406k2TomdP2svlmuWYNAN+YBfmOfG/WvOfN+kDTJiILlCYjqWe0aZOH1uvWq49Et+iNpGKVWgR0RT6UUiWFUfiUDZseBjwH+voZ3x3bIjBRQ9fVMjCmjE4IC22u4HFMRsF6ZnJYmvwvyJsrRBIIlo9xOX1s/g2VljHtKJJ/hCKDc4i6Co8jar1vyQsexjEUnwd3nwg+WDd73WhzFkQC2ctnPzcyxinu5X8bBHNyKRsCMw7uSJbKAkWL6JIueBxNJwxFsdLaAFa+m2V9XgNhQiUyN7LuaX610CqXkrt/UdHtrVfdoZzu8ppSf3rUMurAuSOBF/3p2vMhszJwcaE/Ky4L57hAuRvyjuWlgCexhTQmgVnC2EUnxm5RNN3a4yvZk9wb0LjqyjIRSIWjGYrR47TluK8K1gvhnyboVUoHDX5sUyF97625USp
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 04:35:59.2993
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a20db97d-8e90-4193-26bc-08de85710500
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7597

On Wed, 18 Mar 2026 11:53:49 -0700, Guenter Roeck wrote:
> On 3/18/26 10:27, Akhil R wrote:
>> Add a regmap config and a probe function to support for I3C based
>> communication to SPD5118 devices.
>> 
>> On an I3C bus, SPD5118 are enumerated via SETAASA and always require an
>> ACPI or device tree entry. The device matching is hence through the OF
>> match tables only and do not need an I3C class match table. The device
>> identity is verified in the type registers before proceeding to the
>> common probe function.
>> 
>> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
>> ---
>>   drivers/hwmon/Kconfig   |  7 +++--
>>   drivers/hwmon/spd5118.c | 66 ++++++++++++++++++++++++++++++++++++++++-
>>   2 files changed, 70 insertions(+), 3 deletions(-)
>> 
>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>> index 8af80e17d25e..23604c05ad22 100644
>> --- a/drivers/hwmon/Kconfig
>> +++ b/drivers/hwmon/Kconfig
>> @@ -2300,10 +2300,13 @@ config SENSORS_SPD5118
>>   	tristate "SPD5118 Compliant Temperature Sensors"
>>   	depends on I2C
>>   	select REGMAP_I2C
> 
> I also had
> 	depends on I3C || I3C=n
> in my version at
> 
> https://patchwork.kernel.org/project/linux-hwmon/patch/20250419161356.2528986-6-linux@roeck-us.net/
> 
> which I guess matches the more recent "depends on I3C_OR_I2C".

Ack. Will update.

> 
>> +	select REGMAP_I3C if I3C
>>   	help
>>   	  If you say yes here you get support for SPD5118 (JEDEC JESD300)
>> -	  compliant temperature sensors. Such sensors are found on DDR5 memory
>> -	  modules.
>> +	  compliant temperature sensors using I2C or I3C bus interface.
>> +	  Such sensors are found on DDR5 memory modules.
>> +
>> +	  This driver supports both I2C and I3C interfaces.
>>   
>>   	  This driver can also be built as a module. If so, the module
>>   	  will be called spd5118.
>> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
>> index 5da44571b6a0..d70123e10616 100644
>> --- a/drivers/hwmon/spd5118.c
>> +++ b/drivers/hwmon/spd5118.c
>> @@ -18,6 +18,7 @@
>>   #include <linux/bits.h>
>>   #include <linux/err.h>
>>   #include <linux/i2c.h>
>> +#include <linux/i3c/device.h>
>>   #include <linux/hwmon.h>
>>   #include <linux/module.h>
>>   #include <linux/mutex.h>
>> @@ -482,6 +483,25 @@ static const struct regmap_config spd5118_regmap16_config = {
>>   	.cache_type = REGCACHE_MAPLE,
>>   };
>>   
>> +/*
>> + * I3C uses 2-byte register addressing -
>> + *   Byte 1: MemReg | BlkAddr[0] | Address[5:0]
>> + *   Byte 2: 0000   | BlkAddr[4:1]
>> + *
>> + * The low byte carries the register/NVM address and the high byte carries the
>> + * upper block address bits, so little-endian format is required. No range
>> + * config is needed since I3C does not use MR11 page switching.
>> + */
>> +static const struct regmap_config spd5118_regmap_i3c_config = {
>> +	.reg_bits = 16,
>> +	.val_bits = 8,
>> +	.max_register = 0x7ff,
>> +	.reg_format_endian = REGMAP_ENDIAN_LITTLE,
> 
> Should this be added to spd5118_regmap16_config instead, or is there reason
> to assume that I2C 16-bit addressing differs from I3C addressing ?

I did not see any difference for I2C in the specification, but I assumed the
existing format would have been working and I thought not to change them.
Changing the I2C format would also require a change in the is_16bit nvmem_read
formula.

> 
>> +	.writeable_reg = spd5118_writeable_reg,
>> +	.volatile_reg = spd5118_volatile_reg,
>> +	.cache_type = REGCACHE_MAPLE,
>> +};
>> +
>>   static int spd5118_suspend(struct device *dev)
>>   {
>>   	struct spd5118_data *data = dev_get_drvdata(dev);
>> @@ -770,7 +790,51 @@ static struct i2c_driver spd5118_i2c_driver = {
>>   	.address_list	= IS_ENABLED(CONFIG_SENSORS_SPD5118_DETECT) ? normal_i2c : NULL,
>>   };
>>   
>> -module_i2c_driver(spd5118_i2c_driver);
>> +/* I3C */
>> +
>> +static int spd5118_i3c_probe(struct i3c_device *i3cdev)
>> +{
>> +	struct device *dev = i3cdev_to_dev(i3cdev);
>> +	struct regmap *regmap;
>> +	unsigned int regval;
>> +	int err;
>> +
>> +	regmap = devm_regmap_init_i3c(i3cdev, &spd5118_regmap_i3c_config);
>> +	if (IS_ERR(regmap))
>> +		return dev_err_probe(dev, PTR_ERR(regmap), "regmap init failed\n");
>> +
>> +	/* Verify this is a SPD5118 device */
>> +	err = regmap_read(regmap, SPD5118_REG_TYPE, &regval);
>> +	if (err)
>> +		return err;
>> +
>> +	if (regval != 0x51) {
>> +		dev_err(dev, "unexpected device type 0x%02x, expected 0x51\n", regval);
>> +		return -ENODEV;
>> +	}
>> +
>> +	err = regmap_read(regmap, SPD5118_REG_TYPE + 1, &regval);
>> +	if (err)
>> +		return err;
>> +
>> +	if (regval != 0x18) {
>> +		dev_err(dev, "unexpected device type 0x%02x, expected 0x18\n", regval);
>> +		return -ENODEV;
>> +	}
>> +
> 
> I don't think this should dump error messages. Also, it might be desirable
> to use a single regmap operation to read both values.

Ack. Will use regmap_bulk_read() and will remove the error dump.

> 
>> +	return spd5118_common_probe(dev, regmap, false);
> 
> Why is_16bit=false ?

We don't need the encoding formula for the nvmem address with I3C. Since it
uses little-endian, (page * 0x100 + SPD5118_EEPROM_BASE) translates to the
correct address. Or did I overlook something?

> 
>> +}
>> +
>> +static struct i3c_driver spd5118_i3c_driver = {
>> +	.driver = {
>> +		.name	= "spd5118_i3c",
>> +		.of_match_table = spd5118_of_ids,
>> +		.pm = pm_sleep_ptr(&spd5118_pm_ops),
>> +	},
>> +	.probe		= spd5118_i3c_probe,
>> +};
>> +
>> +module_i3c_i2c_driver(spd5118_i3c_driver, &spd5118_i2c_driver);
>>   
>>   MODULE_AUTHOR("René Rebe <rene@exactcode.de>");
>>   MODULE_AUTHOR("Guenter Roeck <linux@roeck-us.net>");

Best Regards,
Akhil
