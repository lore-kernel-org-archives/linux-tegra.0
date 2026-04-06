Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012048.outbound.protection.outlook.com [52.101.48.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82417217F27;
	Mon,  6 Apr 2026 07:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775460064; cv=fail; b=fiqNKOYXo6cPM2mTbErpgfASJvaimC5sXHsFTpFHz6LOd8+v6MZDLYaJ6gjbGUhApgJZAlgij6Ib2TLYxSlvu6MFVRjnYSvuNW7Y86hpIn7p2DZpRX4EdfACtvwNA3nlaycp/RWsV3hQ7cKaDVjJatakfYR27z4s5SEcr2nzL30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775460064; c=relaxed/simple;
	bh=on2UMFcyTNpkdkD/ekV54/gksQXwJinMMIxFpx0SuoA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Nrg/CCdiAKhgd//HRNuACaMZeOIDzEmIlNvj2HbIVGlRgiJX9A8MZPGw8HBTpnjqbfZ4q+3VKeFhrPIwRPQ4k4FzKoV0kJbEmViXAujYbfmuC8c5AvOPYFscwxv6YxCem2wX7j/SOOwnFUFEGp3YcWwNcZMwqXhjpD6tLyLyQGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Y+NAF58o; arc=fail smtp.client-ip=52.101.48.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y+NAF58o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ej7KROzp5occIc3u3XoMtDl9XZHBxgLhewrJ5GYxZnEJDb9L2HwUdz0Wt1WspG8qzFdyJn1ajSdC+nI1E0wOwAdjx+nf06ohTicqB+XQVgG0mOhOtYoGx4akdBI8OAhF9cIWTnmqbIBH5mdhaysxRR3348m4sQcvQN8dc/zJGd1jaLOm5O4dGz1OaA/HwchHvol/TOGuzq2gZYGhb+IHF1unUZ8gVnUs967C7EpfOxOKCHi0tlD2s1/BVIMntb6iaqj9Ei8wkkRnHsiH4QHgpDgN84Wj1aOyHTwLrV8rUIIpRn7WxewWPqhZsNItlRIs3WNr0TPFo/BUPrC2cLWUOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LWPwHWQqNUnxkoMco2rP1VC4sq2MNepMZX6/V40A1JU=;
 b=nvH8g+W3Xd1LijaiYskjlXCH4dkdufub31ikaNyQWlUa3EX48DCtB9gI6j3x53TbN/2tl0GX49PA7b5i9Be3jbMA7omkLeH/f0I/9Wv8Lv87UNlhNtt4MWdpyE/JOn+VkbjRCyHHN/ds5pqB2cP+WcgThpQI9c5eZkeTWTZt3ppmfL6WpMQ1JVb0HX2r3JSNHq1HskP/N6yWRR7E1GnY5l+Qno05ST2CPFU7cJTYPVmarAWlzhetqxIa2hb+NY+0QyfCdhXxqHRNEfEnr5EOaHS36Xo6Nz4QzUIjDHvaE+QjAAnXAYVtLlNbSQHaUODALyUgPwTr+Euz9W/Y1Zx+XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LWPwHWQqNUnxkoMco2rP1VC4sq2MNepMZX6/V40A1JU=;
 b=Y+NAF58ob30Vw1QALqYT6ynJ010rP7jpExd0fDG3JO/wRUzMRdjSz7LiRHcXZ4Db+ZMbCyaYmB+QXzYHM3lJMONyKpVbU0bpBuxwhSSNnJB310D1WPvNbPaygZ94Vlrc2UR3YJS7AuJ4x2lrhd60Luh7//Ty33JNIUiuWQVeYpeAtLoaabyZq5qhvKA5cCTAf9kdCpGknN6kBxUfYojFzQzsw+y/Uq6410Ri0BXB2vuf53idlBGTcme/ulisLQvRVQjOJmJ1Kde7skFlvgjKJHmszMwqdZRq5P/SgH9HWHmmSApr1a14bHgwss3Qo1JucH8b0riATrL8c5NAx1qlDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BN5PR12MB9511.namprd12.prod.outlook.com (2603:10b6:408:2a9::14)
 by PH8PR12MB6867.namprd12.prod.outlook.com (2603:10b6:510:1ca::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 6 Apr
 2026 07:21:00 +0000
Received: from BN5PR12MB9511.namprd12.prod.outlook.com
 ([fe80::4d8d:5f91:6c3c:dc8c]) by BN5PR12MB9511.namprd12.prod.outlook.com
 ([fe80::4d8d:5f91:6c3c:dc8c%4]) with mapi id 15.20.9769.018; Mon, 6 Apr 2026
 07:21:00 +0000
Message-ID: <5e1d8c14-d5bc-47f1-83a1-969170adb0be@nvidia.com>
Date: Mon, 6 Apr 2026 12:50:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] memory: tegra: Add T238 MC support
To: Jon Hunter <jonathanh@nvidia.com>, krzk@kernel.org, robh@kernel.org,
 conor+dt@kernel.org, =thierry.reding@kernel.org, sumitg@nvidia.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20260331112347.3897841-1-amhetre@nvidia.com>
 <20260331112347.3897841-2-amhetre@nvidia.com>
 <1ec86de6-9282-46fb-bdba-521ac25b5fc8@nvidia.com>
Content-Language: en-US
From: Ashish Mhetre <amhetre@nvidia.com>
In-Reply-To: <1ec86de6-9282-46fb-bdba-521ac25b5fc8@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BMXP287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::21) To BN5PR12MB9511.namprd12.prod.outlook.com
 (2603:10b6:408:2a9::14)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PR12MB9511:EE_|PH8PR12MB6867:EE_
X-MS-Office365-Filtering-Correlation-Id: 9812257e-cac6-454a-8b86-08de93ad0de2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Pxcw64xcIv+9lDsqxX+kdeLn4rrdlqLgMuhNJsNEkrSYA2t0RwBbQdB7Un5Zv3WxDMmHp0kwSTLs99LEG+RKt0GGL29aZonTmUsHWqK5eigI9EIKYzA2RGPgwlck0IhsgQlBxb/WLGzzuER46PlcwJmQVVHbhKYfDgwNwWAYMA87hSCk/lETZzo+ZSpnQDtUgfljv6c2PWdPyw57IQGf0ZGPLhGJ/WtKB1VmbLoNeb3HFu7LJ1EdFGNn2ZHMEZPDnCS61aD5tUB6A2xigd/BoXSYUWZ6s0gtndovePncP/Zqd/uZdEgo1LT6+dyK+zck29+VDQnesmwr2L7xce4ZFBWNO1+Ce1ELVOxlsDG/9KPdGZrR53PP8HTJcU1p5PLOv9l5rIL9Msmecd/QvYgFR1jVU14ejdylWfnzuEeo1tuw19H0e92J2YIbgavxKN1wJpGXR2l0H4SLsZP7+JhegVy2bpkntaodtTuJDPQEkFZwt/OUx+8iUxBhEaSKAMFTwt/+9E8g422QeOjTnghq9ZNq/n4M73mAbIzRMWaUgIETq8HgKP16PSEqhcfBNqIJgEz4RQnJW7gk6tKpril9HZzZTLFKksIb6BU2YfnV+zAt3pQGToBrbHFgiwV9Uvbp+WXW6z70yQsrMCeWBhFdmZRE3jaJ337rHmcgKfsDwwIWFgn56Rtktj784DG+7MAR3Tgbzf0VpR5SGC1d0ONo266HQY9qik7JRzJCYrPf4eE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN5PR12MB9511.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGNqUkIwcTJpSE8xUmxRaHZBRHN2RVdsLzh6ZkpjVDlqQ2JGbCtmTU1BSXlW?=
 =?utf-8?B?MCtpU0o1Vm5jZ1dCcEZDelRSWkRLLzMyVVp2Qkk3MTArZHViRnRvaE85MCth?=
 =?utf-8?B?OW05RG84M3pvQzlZMGlPRll4RXFRWmRubVRzK2tjWnFtUVF5Q0Z1Rit5QXVV?=
 =?utf-8?B?OURVWjUzRndBa0FwMTgyWXMvVkw0VElUbThOL0Y5QmZUelhyb2dIRExja0ln?=
 =?utf-8?B?S1A3NGVGUWhFYkdMYXl1bmQ0SUx1ay9zRnJBZDZkTEZ1eVZ1cGhpNW01c2wv?=
 =?utf-8?B?MDV2L3FlZmlwNjJCRFhlZUx1RTZSQytWc2ROeVBid0ozRVhEQUtLdGdqRlBL?=
 =?utf-8?B?TjVKWVh0aWxmT0tYc3FwakFnZkRCL0JkcWJURTdaLzJSQUhlRCsrdUludGFE?=
 =?utf-8?B?ZVNod0Q1aktSRWtmcWNtRS9zalJ2MHJ5MTQvQ2hBZTkzTklWV3NBVXE0T2Er?=
 =?utf-8?B?S2xORHU3bi95dnMxczNlS0UyZ3M1SUlvS29LUENILzJXTHByVk5JQTVlM1J2?=
 =?utf-8?B?NzJGOGJOemxaelBtRGloWVpGOUYvLzJVYlk2TEhQRXczaWtqR0luZW5USmNl?=
 =?utf-8?B?UjhXd3RjcHM1M0paUGJqZ0dreEFnUEpiRldPUjZFODI3QldrdHVHM0NYMmNl?=
 =?utf-8?B?N3hKTjNENXlkQ29XeU40bW42K3FEc2ZkckFUbHNpVXVkM0sycDl1cjE1cEVi?=
 =?utf-8?B?SEtzcElRbjdLV0R4OE96UXpCTi9JelVXbDFDQk43RHgzUG1YbzhXaFp2SFJI?=
 =?utf-8?B?Z1c0N280WFNsczFyeWEvbGZ1UCtXRDVXYnczbXR4NUwxUE15Z3dIRFBjZnFO?=
 =?utf-8?B?cExxY2NYaUJZUjJ4RW5RUzhMU0VwTmVSZ3Q1SHhkZEExSlFacnBUOHVwYUZp?=
 =?utf-8?B?M0tyTUFJTEs2L2NRZlJPcWR5Y283K3VHdFFlc0hsdmxWV09YSjZLeU5yWDZx?=
 =?utf-8?B?TDlpMmx5dnY0L1R6bWJ4aTRYaVkvSTF6czNpeG9RaHlGdkpPcks1NnBhS1l0?=
 =?utf-8?B?REV0RTAxNFpaOTN3ZGxmSDdHYVlyRkxiVHNMVzdFUmZZYkxNTWFmdjFwbjN2?=
 =?utf-8?B?aUZLbjVMV2U2dkpIOTBpd05GSjcxeTlZRVBLQVhodkRoS0o0NHhQWkU5M3E1?=
 =?utf-8?B?TnpVd3JIUVkyeDdwL3ZyRy9CdWxGVC9wNXBFR09xTUFuNmlnLzJ3TFA2SjFH?=
 =?utf-8?B?elc0ay9nZlZLbW5aYmNFNS9yRUpwbVAyRE5oaG1aREJuVU9PY1g2NWY4cG5k?=
 =?utf-8?B?ZXd4NGQ0WW9NTm5CNTQ5dHROeFExcmxrNmtSYjBVME85Y0tud01DVWRQWkpt?=
 =?utf-8?B?SmZvZ0w2bTE0N2w5eEszcTJSWU5uOUZyTG9IMU9NU0Y5d081NXN0dWc5MXBl?=
 =?utf-8?B?Sm0rdGJ6T1R2cDRZZVkyNUV2Z2RMN1c4ejZxTXFtWE5FSmNiYmRPdlFJUlQr?=
 =?utf-8?B?R0U1UjFMZ1ZPTDgxbDZ1b3cxVUc2dzdNZitaVEFHQTdDVzMyMTlhNk94ZGx4?=
 =?utf-8?B?dGxZNVRTZmI4UnBqVjZ1bCtRTzNpNlBaUExYVEZoRGJLS3IxMGMva29Ba2ZV?=
 =?utf-8?B?M0VFTXhNZ3daYU5SOWhBMS9mYy9mRVRlTkIyK0lzdUZoaHdpclVjVnpVVTMw?=
 =?utf-8?B?b21HUDljZm5XT2hNam1iUE4rd3FYU0FwSTNsRzd0dW5zSjB0aGdPZUw1THNS?=
 =?utf-8?B?aUd5UjV1dXdmUTZaM2NjZXBiKzZFZTM4cWdYblB4Wnl5bEZya2JqQ284T2dn?=
 =?utf-8?B?N01nODZGQ0NvSU91ZUdza3QycU44Qk1TSTUvRUc4dGo5TjFRbFljYXdQY3RY?=
 =?utf-8?B?SWhEbFZneDRrWmZFNW1JeDR5Zm54c3NWa0RQUDNPV1Vpb2lFQitsMjdmZHNR?=
 =?utf-8?B?MkhiRFJzeDVRbU9jakFiY3VGTlJySlR0ck9VUzdRd1ZYeHZSWDlqSTFqQTZI?=
 =?utf-8?B?MUM0L2NGN3UzcTUxYVNqcW9HNGNubEhXaEx0NXZEMWpuWlZRMXdwTGRYM1dr?=
 =?utf-8?B?QUQzSi9jRVNpV3N3Zjd5WnM5bU03TnF4Z2xpSFcvb1FUdXR1NVJwUXorN3RE?=
 =?utf-8?B?YktLU2VNbXhpOHd1ZS9MR1FOK3VsYUlYOFVzUXl5ditQWTFSTG9Wd1gxcUxa?=
 =?utf-8?B?d0VFNUtkeW1vbW5jeWgrL1JqcUc3N0s4QXBsMVAvSG9rcWljeHk0cXZ3cFg4?=
 =?utf-8?B?dk5QeHNJQ0Rtdm81UkJ0S05sTmptNkFTUkEyUVd0bGZOb2daQzVqbU53bFlh?=
 =?utf-8?B?Y2xUdnoxS3RYY2lQSzJwNnBsUDlvVFJudW5XVHhyNWQ2a2NkWk15ODlDYlNp?=
 =?utf-8?B?a0NMdytuMng3QWNteUlxM0thN0lJOXc1TGxUUDlXNmlaNTNvSHJ1UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9812257e-cac6-454a-8b86-08de93ad0de2
X-MS-Exchange-CrossTenant-AuthSource: BN5PR12MB9511.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 07:21:00.7781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6aKAku6brYjKrtCNnjn5HU4DiJi2Sc8b+oZwLOrgmrED96eZZkEd+s+/UVVJ+QAQtW1sSDGdEdJ68xJ53oQXvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6867



On 3/31/2026 5:08 PM, Jon Hunter wrote:
>
>
> On 31/03/2026 12:23, Ashish Mhetre wrote:
>> Add Memory Controller driver support for Tegra238 SOC, including:
>> - MC client definitions with Tegra238-specific stream IDs
>> - Reuse of Tegra234 ICC operations for bandwidth management via BPMP-FW
>> - Device tree compatible string "nvidia,tegra238-mc"
>>
>> Export tegra234_mc_icc_ops so it can be shared with the Tegra238 MC
>> driver, as both SoCs use the same ICC aggregation and bandwidth
>> management logic.
>>
>> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
>> ---
>>   drivers/memory/tegra/Makefile   |   1 +
>>   drivers/memory/tegra/mc.c       |   3 +
>>   drivers/memory/tegra/mc.h       |   6 +
>>   drivers/memory/tegra/tegra234.c |   2 +-
>>   drivers/memory/tegra/tegra238.c | 395 ++++++++++++++++++++++++++++++++
>>   5 files changed, 406 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/memory/tegra/tegra238.c
>>
>> diff --git a/drivers/memory/tegra/Makefile 
>> b/drivers/memory/tegra/Makefile
>> index 6334601e6120..0d50e37d43af 100644
>> --- a/drivers/memory/tegra/Makefile
>> +++ b/drivers/memory/tegra/Makefile
>> @@ -10,6 +10,7 @@ tegra-mc-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210.o
>>   tegra-mc-$(CONFIG_ARCH_TEGRA_186_SOC) += tegra186.o
>>   tegra-mc-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra186.o tegra194.o
>>   tegra-mc-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra186.o tegra234.o
>> +tegra-mc-$(CONFIG_ARCH_TEGRA_238_SOC) += tegra186.o tegra238.o
>>   tegra-mc-$(CONFIG_ARCH_TEGRA_264_SOC) += tegra186.o tegra264.o
>>     obj-$(CONFIG_TEGRA_MC) += tegra-mc.o
>> diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
>> index d620660da331..10ef3c323e22 100644
>> --- a/drivers/memory/tegra/mc.c
>> +++ b/drivers/memory/tegra/mc.c
>> @@ -49,6 +49,9 @@ static const struct of_device_id 
>> tegra_mc_of_match[] = {
>>   #ifdef CONFIG_ARCH_TEGRA_234_SOC
>>       { .compatible = "nvidia,tegra234-mc", .data = &tegra234_mc_soc },
>>   #endif
>> +#ifdef CONFIG_ARCH_TEGRA_238_SOC
>> +    { .compatible = "nvidia,tegra238-mc", .data = &tegra238_mc_soc },
>> +#endif
>
> It is always better/preferred for the dt-binding patch to be 1st in 
> the series. The above does not exist until after patch 2 is applied.
>

Ack, I will resend with correct ordering.

>>   #ifdef CONFIG_ARCH_TEGRA_264_SOC
>>       { .compatible = "nvidia,tegra264-mc", .data = &tegra264_mc_soc },
>>   #endif
>> diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
>> index 649b54369263..d0da4a5f192d 100644
>> --- a/drivers/memory/tegra/mc.h
>> +++ b/drivers/memory/tegra/mc.h
>> @@ -238,6 +238,11 @@ extern const struct tegra_mc_soc tegra194_mc_soc;
>>     #ifdef CONFIG_ARCH_TEGRA_234_SOC
>>   extern const struct tegra_mc_soc tegra234_mc_soc;
>> +extern const struct tegra_mc_icc_ops tegra234_mc_icc_ops;
>> +#endif
>> +
>> +#ifdef CONFIG_ARCH_TEGRA_238_SOC
>> +extern const struct tegra_mc_soc tegra238_mc_soc;
>>   #endif
>
> Does this work? Tegra238 is dependent upon stuff in Tegra234, but 
> there is no guarantee that both of these CONFIG options are always 
> enabled?
>

Good point, thanks for catching this Jon. If CONFIG_ARCH_TEGRA_238_SOC
is enabled without CONFIG_ARCH_TEGRA_234_SOC, the build would fail
since tegra234_mc_icc_ops wouldn't be compiled or declared.
I'll fix this in V2 with combined Tegra234 and Tegra238 SOC guard for 
struct.

>>     #ifdef CONFIG_ARCH_TEGRA_264_SOC
>> @@ -256,6 +261,7 @@ extern const struct tegra_mc_ops tegra30_mc_ops;
>>   #if defined(CONFIG_ARCH_TEGRA_186_SOC) || \
>>       defined(CONFIG_ARCH_TEGRA_194_SOC) || \
>>       defined(CONFIG_ARCH_TEGRA_234_SOC) || \
>> +    defined(CONFIG_ARCH_TEGRA_238_SOC) || \
>>       defined(CONFIG_ARCH_TEGRA_264_SOC)
>>   extern const struct tegra_mc_ops tegra186_mc_ops;
>>   #endif
>> diff --git a/drivers/memory/tegra/tegra234.c 
>> b/drivers/memory/tegra/tegra234.c
>> index 87b22038a5fb..9fbd34d4abe0 100644
>> --- a/drivers/memory/tegra/tegra234.c
>> +++ b/drivers/memory/tegra/tegra234.c
>> @@ -1125,7 +1125,7 @@ static int tegra234_mc_icc_get_init_bw(struct 
>> icc_node *node, u32 *avg, u32 *pea
>>       return 0;
>>   }
>>   -static const struct tegra_mc_icc_ops tegra234_mc_icc_ops = {
>> +const struct tegra_mc_icc_ops tegra234_mc_icc_ops = {
>>       .xlate = tegra_mc_icc_xlate,
>>       .aggregate = tegra234_mc_icc_aggregate,
>>       .get_bw = tegra234_mc_icc_get_init_bw,
>> diff --git a/drivers/memory/tegra/tegra238.c 
>> b/drivers/memory/tegra/tegra238.c
>> new file mode 100644
>> index 000000000000..5abdca16a275
>> --- /dev/null
>> +++ b/drivers/memory/tegra/tegra238.c
>> @@ -0,0 +1,395 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2026, NVIDIA CORPORATION.  All rights reserved.
>> + */
>
> ...
>
>> +const struct tegra_mc_soc tegra238_mc_soc = {
>> +    .num_clients = ARRAY_SIZE(tegra238_mc_clients),
>> +    .clients = tegra238_mc_clients,
>> +    .num_address_bits = 40,
>> +    .num_channels = 8,
>> +    .client_id_mask = 0x1ff,
>> +    .intmasks = tegra238_mc_intmasks,
>> +    .num_intmasks = ARRAY_SIZE(tegra238_mc_intmasks),
>> +    .has_addr_hi_reg = true,
>> +    .ops = &tegra186_mc_ops,
>> +    .icc_ops = &tegra234_mc_icc_ops,
>> +    .ch_intmask = 0x0000ff00,
>> +    .global_intstatus_channel_shift = 8,
>> +    /*
>> +     * Additionally, there are lite carveouts but those are not 
>> currently
>> +     * supported.
>> +     */
>
> I don't know what this means?
>

I have kept this comment similar to Tegra234. tegra_mc_get_carveout_info()
function uses num_carveouts variable as upper limit for supported carveouts.
On top of it, there are few lite carveouts which are supported by SOC 
but are
not used by the driver.
It's redundant info IMO and can be removed from both Tegra234 and Tegra238.
Jon, Can you please share your thoughts on this?

Thanks,
Ashish Mhetre

>> +    .num_carveouts = 32,
>> +    .regs = &tegra20_mc_regs,
>> +    .handle_irq = tegra30_mc_irq_handlers,
>> +    .num_interrupts = ARRAY_SIZE(tegra30_mc_irq_handlers),
>> +    .mc_addr_hi_mask = 0x3,
>> +    .mc_err_status_type_mask = (0x7 << 28),
>> +};
>
> Jon
>

