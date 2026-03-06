Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012066.outbound.protection.outlook.com [40.107.200.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19522248A5;
	Fri,  6 Mar 2026 14:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772805866; cv=fail; b=lJKF1cylS+4UPsr8JZfnpJ8qwhpxeEit7cc1pJfiyv73eyobtFDspWaoGfzG0ZBLGYzONOC4CWcCPEC2uSyHPXGxrt/f9q8Ow7Mwn5/kNd0CDUbswfQIhJiqJN9WS94DfEcsFjognYeNfhTZMocu7cElYioF3KcERuApevswssg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772805866; c=relaxed/simple;
	bh=qEAlJHQ8MVpkfUldF6AobiJbZRVI0Y0FDgGFTNJbqcU=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Phsrl10Eh7ngCQFbRLQnBdVIV1PO2IUD5BJZw+3XptweMYnamGPf/74FbuE5NPM+v9UbzX8/ErVFWvNS2yYoe2FSYFcR194TURrk2fjaWR4SDSiiySTwexaBtqpd/jnT1z/fLxWgs6iO3ufxo9bxb7myzjIVcSWns0VMmC2xOZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZYWJ16fO; arc=fail smtp.client-ip=40.107.200.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZYWJ16fO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wmBd4AMZotwTaIO7/bVmZjgrHRqJZF3ZndrhSv0OEhkqT2aArXM/E7iOd4Of9a7CsxW5rkZMTHsZL7gF6iIZRZtsal+wUUtxB1bm2AwDRmP2aWDgVF1dqJibqyzQ8Nok1ldpMiAHDhpnv4rXG+MM8K9rrYZ0+656tS43ev0Y3+3SAw8ZlM8ducN3Ht07NIsImTnUMVzMUYg2/Advm0do36E/DTVZDtnTkHod0JUHeofpygwivWMn0OFVDycHyDG6FGX05Bw9JZhTdl+FyS8rNJrW90REG1qnCeKgWm7ieSKBHAT5REQle33teqnrWn8LS+Im3IhBmzMJFInX7JebPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nlLqXkSLJOh/bujNr4Qpl2f5Wu6t5V+ZBIUhcBO7dsc=;
 b=oonKKmMMWSbRrbyvdXH6p8C0L/xifY7ziZTI+UdrBnDDJH5F/XMIre4SUp96j20k5M9O8rCKcioiawGnIaq7bJyBLwGb7sWH7dUIlO7+k6xMZTJpk3Q8hHSWBlvA0AmffRiR55uhDCpYdFA+tv7MRON3MUiT5W9AG5evbfKTk/37lk2+uL/9nSNgENZqjvTvTKG5i1fExkeNe4tY9YECNTw1WTb1MAEkTc56kq04E6tP1NgmNQ6PFL1fWf8Lr8Q04Qzlmp34ylNi76QvYvmZIVatYuStX4AyZP7vL0sIMCzBwoFDJaaHFVPjbcJrVRuWgQVrUBedBYa/Fj+8G/vAww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlLqXkSLJOh/bujNr4Qpl2f5Wu6t5V+ZBIUhcBO7dsc=;
 b=ZYWJ16fOI3h5H4fk3RS/FesXan8++uxathhkWb8SY9RC8gzZ44qJRWBAX9sdKQgsDc2TgQKv0hPB37CbcOk9R2Idp/G+7EyIlSFuBTmV/Do0hFFEDWY/Do0jcx3BV5dlAp6gfboTQ0qTmqhdyOkku8XuiNhxDHdRje14z5my+c3GPk+6j10Yjl9qwcS3mTperaVhop9Ueu1ouhFilXrrEW8dkyfzhBNJfHxhvZX9il+9Az4JoADMQNEZ89hm/6RQ1TdFEUHb124oJF1ImdCorD6sKNVMdoZWwi1lQZvd4lG4tCCHigHelNnuEoIspHcLHsE73/wAwJoqUXol0xnlUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by IA1PR12MB6627.namprd12.prod.outlook.com (2603:10b6:208:3a1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Fri, 6 Mar
 2026 14:04:19 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 14:04:19 +0000
Message-ID: <38807fcc-82ff-41a5-8c8b-88fd9961df32@nvidia.com>
Date: Fri, 6 Mar 2026 14:04:14 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: i2c-core-base: fix devicetree alias handling
From: Jon Hunter <jonathanh@nvidia.com>
To: Andreas Kemnade <andreas@kemnade.info>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Frank Li
 <Frank.Li@nxp.com>, Linus Walleij <linusw@kernel.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kalle Niemi <kaleposti@gmail.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20260302-i2cfix-v1-1-a95418e9217e@kemnade.info>
 <9b3c0190-7996-40a3-8306-5038f42b2b15@nvidia.com>
Content-Language: en-US
In-Reply-To: <9b3c0190-7996-40a3-8306-5038f42b2b15@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0097.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::12) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|IA1PR12MB6627:EE_
X-MS-Office365-Filtering-Correlation-Id: c6dc9407-f4ef-4c80-5576-08de7b89427c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|10070799003|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	ak9doROktDfjoIgYkq65QJw2li1hwkOd7+fQfVKneNQ14wEtRn0C9XlZdPqHSJdpWOTNVgTMgxcbxEVRXfj5xEKjLal7OMG4sDPI5aHxLkirtZT1aAxF1On3YGiN7RVnNF6tslwgT516il4tQILbDbW5bnLhj4IhosVj+HjxA60tbnDN5QwdCNisdFLzcKogunprPOLAk8s8alk7pvz/1p7n56DLQRbOK7/fXxMWRt8x7xaKyw7X9bNeakMaRZhRCxN2MQw4YExo3doKyI0fNXZq0SfybHe51wdg9e67Xt9k7qgK0plVwoCVb/5LStm+79Gs3Lg2DXj1xfxJEb5Sz+VNB/wxIcpXWZ7IfDqO2n8v7seL1Ys6rhp5WyCdxyphe0+LVwhYlAPyPg1/hxoxzFJ4DP9k8PNqj3D4zJ/menSHmOWZzSUjOShiwp6KfKHCgPDyWXHMTcgbm5gJL+2GMQHFPKxo1Juj2x+QMsRIYaOD4a9S+Js6AubyGTSCZupB2nmgM+sU8kBB/bZfPVPislZVqeN2OvuRMh8vaWaOe7798xBRcInpS806baOHE5wMCzzQvrnsWHTwGLVI51kY1T/+1A/H8YBZuuNFTqzkF4nCYiFTr00WoWzM/YDL7LyQEXLfAPa+8IA2Xv+q0zmw1CQt6BON/3EgKdVNfrp9c8/r6lUV9njVRhDb7wreANBiTPuXBRW5CJMI/0VxNcYqQdF/SJF8M4qV3VcHHzKrm5g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFpWdkVnT2NudFY3YTU0VmZWRXdzTi93R3U0SG5vOGw1NG9FS2YydnlFUi9j?=
 =?utf-8?B?NDQ3M0lGYUc0TjdvT2JzSlRMRktuTGczSTd5T2lNNmVMaE9nQ1RxTDBwRzVj?=
 =?utf-8?B?ZWkxTitNRFZSaGhWZ1I2MW10Y1Vkd2U3OWtCczFiTk1DTXFiUVl4QURFcmJH?=
 =?utf-8?B?Y1RTbVFKcGdyakpxTDU0bDRqUHFpWWNPRy9oNXMzS0JKdHF0T1IxTm1SMnJF?=
 =?utf-8?B?QitOMXhRbUZBUEFWakFuQmY0TG1NUG1RcmVROEs3c0dtRWxnMTRFWmZwbTFN?=
 =?utf-8?B?Z1E0QkgzbFM0QUhjL2hVdGV4anlXUjA0dk12VmNwVzZzTmIzTFVDL3dIVVpS?=
 =?utf-8?B?dnRVdnltNlBUaVEwRUt6Nkt1R0tveXFkN0hNQkZYcXdEVjlqb0Fjb0EyNStJ?=
 =?utf-8?B?Vm8wK1Y4dFIzK1EzemNWTGszZHpmYUx1OGQyenFNQjFzc3VIZ1NmRlJEcU1u?=
 =?utf-8?B?bUwwOTMvdVNoL3ZkMEV1YjlGcWxySVd6NkhXTEF6YzA3cUxTM0IxMHZ3ZEpI?=
 =?utf-8?B?MUVmTDNLU2RHSUh1TUltUXFOdThuSWVtOXZCYmM5ZFJDaEVPRVF1TGdWRGhH?=
 =?utf-8?B?VVJhamdBTjByc3lDUVdjb0V0SXdxSU03VmJoZ2ZCVmxMaE9tOHlNQ3hWcUxh?=
 =?utf-8?B?U3RSNm1UamIydHpzUWlQZ3h2Q1drNHYxeW92UU1BUGZQR3R2cnRKaXNPNmJT?=
 =?utf-8?B?UjB0NkFFaXE3VGUxbXBDcVphRUk2U1dmNW8zYWNmV1NRSERZSEpSKzRRSW1T?=
 =?utf-8?B?UUt2cW5ONnVVNXBRZnJ6dUZLUSt5RThYOFRWd2FXN0JFeHkybFh4SUxqSmUx?=
 =?utf-8?B?RldyNkhIdmU1MGdzWG1Pd0lpc0czc3NoM1hDWXh0c2RBMUhSMVVzTWRyU2ty?=
 =?utf-8?B?YUljeG56a1c1N1R0bzYrMUlQaWxIV05BdkhnWHJEYllCWmpTVVBwQ0hEVEU1?=
 =?utf-8?B?WkI0RFV2WnYrWUFVOXZxQytkaDBUWmJvU0tBNGlDQkg1TUMvUnJLOVNETzdM?=
 =?utf-8?B?a2QzaE4xZUZDYUd2ZDBPMlh2Q2JSTDZiVCsvcnNzUTlXYTdKVmtyMERFQVo2?=
 =?utf-8?B?RGRNbTVjQklvaGNtWVZHTzBYREl5OURzT0JqWFVmdENLVDRGZ21DMXY2bzMw?=
 =?utf-8?B?ME5nWjBEeXQ4Zzh2LzJVa3d4Ly9BaUZLQjJ4ZzM4OUpKZC9VbWdLQUFMOERR?=
 =?utf-8?B?NEswTFg1a0RxdEt4bUJWOGtQOFpPQlZpbEJtZWRuZ1NQRDVsZGdlYjQ4SHdk?=
 =?utf-8?B?SDM3NWtOMXMyUy9VUFhmWFpqbWpMNU1MaUtGSER0YjNBZGhxUmhGMklRc0Y2?=
 =?utf-8?B?SW5rRXFDY3g2MkNyYy9DQTJFbGlrNk82aFQ2MHBBaUVlVUFYWnJxb0M5THAy?=
 =?utf-8?B?UEU1ckpSSjFCT3FMTmswNHlTeGc2QkdBNjRHcVh4dGUxVW95eTRudmEwK0dI?=
 =?utf-8?B?cU9BcUltYzJaNEloM1RTWHRMT2pHaUllWTZJam9UTitPcFloZEczMzB6ZjBv?=
 =?utf-8?B?Q05hN0RvQlpMeFJBVFdnZG40ZE4xNjJKT2NHS3cwU0RwVDNDa29CZDdUc0hq?=
 =?utf-8?B?REQxblFBQzdyRFpOdTVuT25ITTBsYk8wckovK0R2QjdnU1JvQTROd2w2VkUw?=
 =?utf-8?B?bHZDYldGQkpNRDVDK2J5Z0FJRWhKZ3FtdnlpenFFekhFd3VkMGREdHY0WGd6?=
 =?utf-8?B?eXlYR2FaUTV4VWQ0UmtTdnFla3M4aW5RMFVHcVJLN1BLaWE5alI5b2JQL0VG?=
 =?utf-8?B?QytuZGRuQnp3QVN0SElZY05nSXM1T2lOajNyVk5aeEV2NldjNHJNcU9SOUpS?=
 =?utf-8?B?TnpvdmVxSjlNbzVMaHh3SXVrY2RCM1Z6d3ZOSVBiWXgxdDBzWmEvcFlvbWpw?=
 =?utf-8?B?KzM0aEtOTlljSWhCU0lPMXNlQkQzMlp6YTBlVFpjaW5ydzRZZHN5dFc4M2Fp?=
 =?utf-8?B?RENEZ2UvRFkxek5BWkZ5L3hNdDAyS1BSbjFpVDBpVml4aHlkS2JGSHZxdHlY?=
 =?utf-8?B?b2s3WXBJeXp5dDBVTXBsSlFTKzVnL1JjZXZBTzY4Si9QUnFQQjcrbUhEOVF1?=
 =?utf-8?B?SlRGVUNXcHJ5MDRVMGpJYmJOa2RqOWhiOFgyMllRcmg4bk94bU1jNWg0T3Zi?=
 =?utf-8?B?OWQvN1NreG9DazJjQzJ4a0NZOVNwODFJdnFXZEZ3ZGFybkppVjdlZ3pGMEpr?=
 =?utf-8?B?dkF5d09YeCtiVWFwUWxITWpZdEl1enM1UEhDVzQ1Z0tUUlhCSm1oREgwdjMy?=
 =?utf-8?B?YkMvbURDQy81S09uZzdSME00d0IzU2pYTDFMM2g1WWR1Zzd3b2tibHlOdk9C?=
 =?utf-8?B?RHMxY3lNL3VOSWlKaTVyclVLbTBKemhGRWljRndvRG1xRW1UZzlrcHdtSTVk?=
 =?utf-8?Q?4DIrPuBb8FlKrn95wGk77nLsZx8jQ5xuo02d3QvL8QhgC?=
X-MS-Exchange-AntiSpam-MessageData-1: IeO5gsJBWaWw4g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6dc9407-f4ef-4c80-5576-08de7b89427c
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 14:04:19.0525
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CJ81GI7cI3G5W+jeoMu/Co2T/SdlrCjmrcK0m1nU7RF0MQDfXtlffW9LAFBtCl/8qVmX3Mj73C8ze8rjAoPOkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6627


On 06/03/2026 10:18, Jon Hunter wrote:
> Hi Andreas,
> 
> On 02/03/2026 17:04, Andreas Kemnade wrote:
>> Parent device is not set up there, so use the new of_node pointer to
>> handle aliases.
>>
>> Fixes: 0ab80451c70f ("i2c: allow setting the parent device and OF node 
>> through the adapter struct")
>> Reported-by: Kalle Niemi <kaleposti@gmail.com>
>> Closes: https://lore.kernel.org/lkml/ 
>> EDF3FB58-4747-442E-8463-6F1C6E568962@gmail.com/
>> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
>> ---
>>   drivers/i2c/i2c-core-base.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
>> index dd8cec9b04c6..e22d784202b8 100644
>> --- a/drivers/i2c/i2c-core-base.c
>> +++ b/drivers/i2c/i2c-core-base.c
>> @@ -1657,10 +1657,9 @@ static int __i2c_add_numbered_adapter(struct 
>> i2c_adapter *adap)
>>    */
>>   int i2c_add_adapter(struct i2c_adapter *adapter)
>>   {
>> -    struct device *dev = &adapter->dev;
>>       int id;
>> -    id = of_alias_get_id(dev->of_node, "i2c");
>> +    id = of_alias_get_id(adapter->of_node, "i2c");
>>       if (id >= 0) {
>>           adapter->nr = id;
>>           return __i2c_add_numbered_adapter(adapter);
> 
> This change is breaking a test we run to check that I2C devices are 
> populated as expected on a few of our Tegra boards. For example, on the 
> Tegra234 board, the I2C aliases are defined in arch/arm64/boot/dts/ 
> nvidia/tegra234.dtsi. Here we have ...
> 
>          aliases {
>                  i2c0 = &gen1_i2c;
>                  i2c1 = &gen2_i2c;
>                  i2c2 = &cam_i2c;
>                  i2c3 = &dp_aux_ch1_i2c;
>                  i2c4 = &bpmp_i2c;
>                  i2c5 = &dp_aux_ch0_i2c;
>                  i2c6 = &dp_aux_ch2_i2c;
>                  i2c7 = &gen8_i2c;
>                  i2c8 = &dp_aux_ch3_i2c;
>          };

I guess I should add the mapping (from tegra234.dtsi) ...

&gen1_i2c --> i2c@3160000
&gen2_i2c --> i2c@c240000
&bpmp_i2c --> Tegra BPMP I2C adapter
dp_aux_ch3_i2c --> i2c@31e0000

> Before this change, on the Tegra234 Jetson AGX Orin board (tegra234- 
> p3737-0000+p3701-0000.dts) the I2C devices were mapped as above ...
> 
> /sys/class/i2c-dev/i2c-0/name --> 3160000.i2c
> /sys/class/i2c-dev/i2c-1/name --> c240000.i2c
> /sys/class/i2c-dev/i2c-4/name --> Tegra BPMP I2C adapter
> /sys/class/i2c-dev/i2c-8/name --> 31e0000.i2c

Hence this looks correct.

> After this change I now see ...
> 
> /sys/class/i2c-dev/i2c-9/name --> Tegra BPMP I2C adapter
> /sys/class/i2c-dev/i2c-10/name --> 3160000.i2c
> /sys/class/i2c-dev/i2c-11/name --> 31e0000.i2c
> /sys/class/i2c-dev/i2c-12/name --> c240000.i2c

But this does not.

Jon

-- 
nvpublic

