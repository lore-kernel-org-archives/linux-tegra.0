Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011015.outbound.protection.outlook.com [40.107.208.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836C33D8100;
	Thu, 19 Mar 2026 17:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773942965; cv=fail; b=GHGK82wchS6GaMj8f/fxDH+J6XyBsv/Wzn3WxDOK4j4HbOiZYFk/8M9KjY8AuAojJu97cSoeeAO3CnkU6zvS4BKA0m1zWzB1aP4STMglbx1613ZJwM11AyhnsGYpwJlfbJLjd2rA60XKpJU0Ti0LWJqUB7hrbKFxSndSyKc3xpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773942965; c=relaxed/simple;
	bh=16WKr6wqmyNzcpFmmUCA9XhAPWj3lrzSFFcRzvnLqNc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s+8NwU3Ni0ydQDbAMWxmF3cFStRzGr2LgWnHyZQeDy+9O9VRqLW+iu1xn9SSVhz082u5ywluI6wh+H125QTb8BAF4o5Wjl0ea0jgEFD4u7t3Qbt1WRmslM0JNnqBSZfdW8b6aMqcvBl3S0n6d31IiBp43hWt/PVYFKuZ1CFgmRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YMTleGTa; arc=fail smtp.client-ip=40.107.208.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YMTleGTa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XogtIhG3LUsCgUbJ/Wecn71IzxV7zfJqHpWzDjWOLlXQZgVQcKZQASUa4Tdy6iNApLU7K0I0XpTb/jRpuE3Q5qZmvo0ythCbStDoKu4GIMLem7RsjS2FmqTTV26hgEH1XrhVcaCs69WpYM0LTrSTXN+rHvOWlbpWvDOuvjtvO+VRW39hZjJ01dFDjjJ/9eOR0FXP0BRqjfVcxtUmYiWw56PZDfJs96WHoE+VuyZsg9bRxbRz1YkxKS0xyVwZVoxUb6ghZ0laJLb2Ypq8xlh0IMRT9ZpYokZL3kgH96LBaGLUTZAbUFlmG4XSbhEEGBYfaJsMf2+vVoC9DBUpP/VCSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YgBYNZNnIeRLCcIof6QIcnp4JSBKog0cRJBqX3NAxlc=;
 b=SSMn50c0xM6/rw3w6576eMXvpKFyFyTneZstYOReqbUoCC8aKlPz/qqdHtDZ5pp6gdvL9I+rr/Yk2Abt3BKi5sQr0m8jR8SJbdpXnydpPamHDyDsmoDET0MeCV5SpnaakRQpsIkzJaH69U/YhNIHI2PIsNhvFrTp+hKLqLGZtgKR0MzLNmlMxql/tULwZTrhqBhNQbUYQeM0dWFI1jtVM/842UsPwg8ko68guncuJOYbq6MGR4uORiCxR+472t/hQ8/7DnqgRvvIIvPtvDEFnkNNTTfmWQANXsfj9tksXy1QBolTtUoFgZCjAjsbhMQFmLsF5kCQr3enHTrnT9GNMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YgBYNZNnIeRLCcIof6QIcnp4JSBKog0cRJBqX3NAxlc=;
 b=YMTleGTaCc/QeM1o40qEOJNKWh4KJ9etxd2HRtOTB54qF3wGGx1QWx8fvN8eancBmbPkVfkRFHH76Fqms2jW6ljl90/Lc4dqd3amY9Cv+uCtTFcHjPDWZtHGXcrO1oT4A39ESavv9WHaJ5tguvSeudDpW9QSHfJplUFjOBDyQu3dxH2U6vsb+QWQ7X0bvlXJSWeuygC+KG7BxGvK5LlinLfCnHJhAEYFrF7mEcpnOfUY/yCoib0pmRlD/RqcGXQZdpMZrcLW+NWVQd5sODSyHlmzDw9wJNB0KBDT80weAEIu1+hzr1OOV6mORl9a47V2FeoxK1X19Hq6OJxmCwPKVw==
Received: from CH0PR08CA0019.namprd08.prod.outlook.com (2603:10b6:610:33::24)
 by CH3PR12MB9249.namprd12.prod.outlook.com (2603:10b6:610:1bc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Thu, 19 Mar
 2026 17:55:57 +0000
Received: from CH3PEPF0000000C.namprd04.prod.outlook.com
 (2603:10b6:610:33:cafe::f6) by CH0PR08CA0019.outlook.office365.com
 (2603:10b6:610:33::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Thu,
 19 Mar 2026 17:55:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH3PEPF0000000C.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Thu, 19 Mar 2026 17:55:56 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 10:55:41 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 10:55:40 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Mar 2026 10:55:34 -0700
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
Date: Thu, 19 Mar 2026 23:25:33 +0530
Message-ID: <20260319175533.19480-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <7cc8ab1f-6c9a-4e3f-a1bc-266e020d8179@roeck-us.net>
References: <7cc8ab1f-6c9a-4e3f-a1bc-266e020d8179@roeck-us.net>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000C:EE_|CH3PR12MB9249:EE_
X-MS-Office365-Filtering-Correlation-Id: a3d2139d-71f3-4ceb-b30b-08de85e0c5cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700016|56012099003|7053199007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1gJ17qNg5WIVBbD9/7YWGGlDxwgF1HibgobBAhdEcNeiFq5NbkW6keolsFuiAgwrnQBoID3olYYlG0ddIlrVTJF25ET1BhPgTUxp4uAKcCQrQCWXfsYlyCiX5QKhn9RJZDMEWjlMnPAek62IV4/2qV+wd2ucnwtxZYuBCQPbNynpE39faudteDR/jQw1oapZZ4arlxap3usMXmmLZjWlJt0gfQmBl5cYtVuKLQnCIndxIaJ+ppkGMdUdEJ+Mpyuass5UFxb2eWqF8VMXr+RcKVlnNp9t0pzQFCt2i2IwObKRw9gF582L3LSlaACyADcELF/fmLaWbsOE32c2I74iNYxBZcCJiKf1JIRWHI4hpVmHxeZPVt9QIzS1erSJs7f2yNaz3kupoykuVcNCguwPPtGK9GPTuXhPh0OBvY46Tcia7i5D4wZHj9wnjBHznV2pOBLHtVPcBRVMAVwAq0XUq2axixRidIxM75sW/yBVma6MuJWX0x0VRMT/lZqGn8LpqAffSpXyk+4Y3XGCKmR1CGu2Lp37ACDx0G7VYTo1+wp+nugxaPmEhAWxEXDMvsmTfiRBqv82o7I0EMZjZrt8pfYkKbt8mDinIRJPaKSZotuyNV3NxldV9He3mSz+ogAiTj0/+dL9P+PDPfllc5WalVhsggMxT2N1fk7FuwoVoShvbl/PDPRTpYL/vleCA1qQviFVmp1oPL4XS7UmslehS7SA1J+/jJnLoRr7sgsotigzQM5LLvFK15cmau2Gg2UhipyNtuLB6EY+YxfDHlz56Q==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700016)(56012099003)(7053199007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WNx2VJRHYfVwGH0VBRL5FXhx9CVarv3eF5wN/QQ6fv6Latid+Qqi8E2m2TUhgBDSpOib1JY2NVMjDDFWOKVAbza8lrHGIy61jiqGF9pbLhWAcwfw9VE5dTSLe+1rAL5oYa4DwHgT+HvH1Isn5Pjz/U8Nl8F6SsMsQONQh94TIixMzQAYMvR/3NMo63T1LLJHrlORzMZYpVv1EV3NOlgLUU0+0dJ72GfrwACdNx6JuVuZ/Ei0I+ym+63hDgBl1NDEw8GMw78++QsnyipXVT5BAtGQEvUz70+A20fZNq6CMEElfUtcegHJLObUqU7ucG1dSNBL/mPz4hjEnbsgWR/t1uSwepyug2wPyKUuekT8Fwvqolia4dYKcyqDS1IQ0E9GMSc6FSCZWmXH5wQKbyYUejk/PD28WXc2ijE6Qs14wnI4ls7C4PL+dEJeCY5oSOgK
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 17:55:56.9102
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3d2139d-71f3-4ceb-b30b-08de85e0c5cb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9249

On Thu, 19 Mar 2026 07:34:18 -0700, Guenter Roeck wrote:
> On 3/18/26 21:35, Akhil R wrote:
>> On Wed, 18 Mar 2026 11:53:49 -0700, Guenter Roeck wrote:
>>> On 3/18/26 10:27, Akhil R wrote:
>>>> Add a regmap config and a probe function to support for I3C based
>>>> communication to SPD5118 devices.
>>>>
>>>> On an I3C bus, SPD5118 are enumerated via SETAASA and always require an
>>>> ACPI or device tree entry. The device matching is hence through the OF
>>>> match tables only and do not need an I3C class match table. The device
>>>> identity is verified in the type registers before proceeding to the
>>>> common probe function.
>>>>
>>>> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
>>>> ---
>>>>    drivers/hwmon/Kconfig   |  7 +++--
>>>>    drivers/hwmon/spd5118.c | 66 ++++++++++++++++++++++++++++++++++++++++-
>>>>    2 files changed, 70 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>>>> index 8af80e17d25e..23604c05ad22 100644
>>>> --- a/drivers/hwmon/Kconfig
>>>> +++ b/drivers/hwmon/Kconfig
>>>> @@ -2300,10 +2300,13 @@ config SENSORS_SPD5118
>>>>    	tristate "SPD5118 Compliant Temperature Sensors"
>>>>    	depends on I2C
>>>>    	select REGMAP_I2C
>>>
>>> I also had
>>> 	depends on I3C || I3C=n
>>> in my version at
>>>
>>> https://patchwork.kernel.org/project/linux-hwmon/patch/20250419161356.2528986-6-linux@roeck-us.net/
>>>
>>> which I guess matches the more recent "depends on I3C_OR_I2C".
>> 
>> Ack. Will update.
>> 
>>>
>>>> +	select REGMAP_I3C if I3C
>>>>    	help
>>>>    	  If you say yes here you get support for SPD5118 (JEDEC JESD300)
>>>> -	  compliant temperature sensors. Such sensors are found on DDR5 memory
>>>> -	  modules.
>>>> +	  compliant temperature sensors using I2C or I3C bus interface.
>>>> +	  Such sensors are found on DDR5 memory modules.
>>>> +
>>>> +	  This driver supports both I2C and I3C interfaces.
>>>>    
>>>>    	  This driver can also be built as a module. If so, the module
>>>>    	  will be called spd5118.
>>>> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
>>>> index 5da44571b6a0..d70123e10616 100644
>>>> --- a/drivers/hwmon/spd5118.c
>>>> +++ b/drivers/hwmon/spd5118.c
>>>> @@ -18,6 +18,7 @@
>>>>    #include <linux/bits.h>
>>>>    #include <linux/err.h>
>>>>    #include <linux/i2c.h>
>>>> +#include <linux/i3c/device.h>
>>>>    #include <linux/hwmon.h>
>>>>    #include <linux/module.h>
>>>>    #include <linux/mutex.h>
>>>> @@ -482,6 +483,25 @@ static const struct regmap_config spd5118_regmap16_config = {
>>>>    	.cache_type = REGCACHE_MAPLE,
>>>>    };
>>>>    
>>>> +/*
>>>> + * I3C uses 2-byte register addressing -
>>>> + *   Byte 1: MemReg | BlkAddr[0] | Address[5:0]
>>>> + *   Byte 2: 0000   | BlkAddr[4:1]
>>>> + *
>>>> + * The low byte carries the register/NVM address and the high byte carries the
>>>> + * upper block address bits, so little-endian format is required. No range
>>>> + * config is needed since I3C does not use MR11 page switching.
>>>> + */
>>>> +static const struct regmap_config spd5118_regmap_i3c_config = {
>>>> +	.reg_bits = 16,
>>>> +	.val_bits = 8,
>>>> +	.max_register = 0x7ff,
>>>> +	.reg_format_endian = REGMAP_ENDIAN_LITTLE,
>>>
>>> Should this be added to spd5118_regmap16_config instead, or is there reason
>>> to assume that I2C 16-bit addressing differs from I3C addressing ?
>> 
>> I did not see any difference for I2C in the specification, but I assumed the
>> existing format would have been working and I thought not to change them.
>> Changing the I2C format would also require a change in the is_16bit nvmem_read
>> formula.
>> 
>>>
>>>> +	.writeable_reg = spd5118_writeable_reg,
>>>> +	.volatile_reg = spd5118_volatile_reg,
>>>> +	.cache_type = REGCACHE_MAPLE,
>>>> +};
>>>> +
>>>>    static int spd5118_suspend(struct device *dev)
>>>>    {
>>>>    	struct spd5118_data *data = dev_get_drvdata(dev);
>>>> @@ -770,7 +790,51 @@ static struct i2c_driver spd5118_i2c_driver = {
>>>>    	.address_list	= IS_ENABLED(CONFIG_SENSORS_SPD5118_DETECT) ? normal_i2c : NULL,
>>>>    };
>>>>    
>>>> -module_i2c_driver(spd5118_i2c_driver);
>>>> +/* I3C */
>>>> +
>>>> +static int spd5118_i3c_probe(struct i3c_device *i3cdev)
>>>> +{
>>>> +	struct device *dev = i3cdev_to_dev(i3cdev);
>>>> +	struct regmap *regmap;
>>>> +	unsigned int regval;
>>>> +	int err;
>>>> +
>>>> +	regmap = devm_regmap_init_i3c(i3cdev, &spd5118_regmap_i3c_config);
>>>> +	if (IS_ERR(regmap))
>>>> +		return dev_err_probe(dev, PTR_ERR(regmap), "regmap init failed\n");
>>>> +
>>>> +	/* Verify this is a SPD5118 device */
>>>> +	err = regmap_read(regmap, SPD5118_REG_TYPE, &regval);
>>>> +	if (err)
>>>> +		return err;
>>>> +
>>>> +	if (regval != 0x51) {
>>>> +		dev_err(dev, "unexpected device type 0x%02x, expected 0x51\n", regval);
>>>> +		return -ENODEV;
>>>> +	}
>>>> +
>>>> +	err = regmap_read(regmap, SPD5118_REG_TYPE + 1, &regval);
>>>> +	if (err)
>>>> +		return err;
>>>> +
>>>> +	if (regval != 0x18) {
>>>> +		dev_err(dev, "unexpected device type 0x%02x, expected 0x18\n", regval);
>>>> +		return -ENODEV;
>>>> +	}
>>>> +
>>>
>>> I don't think this should dump error messages. Also, it might be desirable
>>> to use a single regmap operation to read both values.
>> 
>> Ack. Will use regmap_bulk_read() and will remove the error dump.
>> 
>>>
>>>> +	return spd5118_common_probe(dev, regmap, false);
>>>
>>> Why is_16bit=false ?
>> 
>> We don't need the encoding formula for the nvmem address with I3C. Since it
>> uses little-endian, (page * 0x100 + SPD5118_EEPROM_BASE) translates to the
>> correct address. Or did I overlook something?
>> 
> 
> Testing of the 16-bit code was limited: I had to set the SPD on a system
> manually to 16-bit mode to get it working, and that only worked until the system
> was reset. Its whole point was to prepare for I3C mode. If that fails, the entire
> 16-bit code in the driver is potentially wrong and should be pulled out before
> adding I3C code. It can be added back later if/when a system actually utilizing
> it is found.

Thanks for letting me know. I will add a patch to remove the I2C 16-bit sections in
the next revision as a prerequistie to this patch. Hope that sounds good.

Best Regards,
Akhil
