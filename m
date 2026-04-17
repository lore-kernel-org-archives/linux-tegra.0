Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011063.outbound.protection.outlook.com [52.101.57.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A5339F18C;
	Fri, 17 Apr 2026 08:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776414206; cv=fail; b=XWUFx/UmsSZwTjuhXZgnxx03D+JWaD8C9UT9NJtgqCcp9+RX9r06uIQ+Jjz72bPu84yUc4WwqKdnp1m8Iv/44Ac4dotbAyHkNjEAc33wKqaXKNp/CrqHbRqqfDm0l40ob1rhKvgm64gBy8FOIwUHgwlG/xRey4mzjbY8oqBO49M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776414206; c=relaxed/simple;
	bh=E3TskZzugi4rRAYE14cqZPqU+K2NRBrXpFHFCPdVTo4=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CjAmORQk3XeD1XUWBwmGoEs6pohYXTxv9wa5OWd3XuLzmfO6mgdkI9WJmrzVkO597E/mnM3Drbnlv6TPbFpl5UDzsjhiLxS60rtqfV03rafAAS6pyfHDHokS20J7bS6LFI6GwDbTXpISVH/zd/EH8emnpoKjkCnQ1OEsmrp0Yq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=d2CaNv1f; arc=fail smtp.client-ip=52.101.57.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="d2CaNv1f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n1fZoW3UavPKt9QcwAFIfyplIpMcpL9InOchoONrw+sBfKI7zw/tKoT7WqBwveKuVlldYU70l/CHolBtYjjjSyVzuGJZsOmlepu20KO1YcS6E79MK8Zfk//IUoi9vah0nq8LX74IFLrYpa0lHDttBRYCN+SSpBpcROt9b3H61T/Whsqk6W0bGqTRJkrt0CLTSkSN1V2BAlqvK5XpYVbflVPl2iWe8KyPLnH+a8fXdbJ4dMdwkoQOGwhC2qRpkIsv9zIYTSSC5kzYmjwvxW0sgwPurBDDwa9cEU8udZZT3ZZeCdHc4z+9E9ibkNz+9/igLyw2iO14OJjg2otkkkuzAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kllfuSE6tec3cR/bjCTzHUCkv8gXlVVtot6kPQVsFLM=;
 b=c1mnGabepIDdVgFFkBqxl1zgA9XknZn1r1tXj6ivBlVjOfB+ncdBB4voaJ+Pmj5pfllhJeuOxMPfUp+5RWmS/60bjzb0QpiUbe+KFHX3hxxKUQjTN39jasWMRcHRFF6dSWnC+kX+j+DfkoTzsjzFJqSJiKiI+U0UBCjx82UYFse88Ghpfx0O0UKCzukXfkSOkt2OLHDQvd3s6dPiDsFVBpkRBI5AtayUmcbE3MvE28A90Cj10nb1VV7FzT4I/TVzNC3ZzNqyb9XyYs2OmLZEi1nkBk7EJmCqPP/Yn83+2Ae7kukN1Dp8Q2+SWsnThu34SS1qW4yoO6qZxlSpYpDjMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kllfuSE6tec3cR/bjCTzHUCkv8gXlVVtot6kPQVsFLM=;
 b=d2CaNv1f9EaXGyjfwb4yC0pt5OcN3S5T5aBqacrCP7wEBfIL85q5QdSa/zMhFmWIFGW9xTgQRcAQurFWB+JAUrwgVLU5vyCdHMIapMAiauu5LorADKEDKcePXlGq84rNpQJaFXooNY+ot31ekFSV+MOOsdcSwZRmIr0wQOqAI7Q0eTp22j3SW+ukePjtMeauu8mGzTOHIlIuy5BYR9+YpeO9eaBdyoMsg3DQs2a6T1lmuJTrrmi9tip6ED0X60sCcY2fuRdnmf9gACCh8vyuyjGbbUkaut41Yd5lXP31YEHy/Kng48d+I1K5koBhd2ACfAT8A9xElt+m0maxZ6wEMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by CYXPR12MB9337.namprd12.prod.outlook.com (2603:10b6:930:d8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 08:23:20 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 08:23:19 +0000
Message-ID: <fde997f6-c0a8-430b-8e45-38a490e683ad@nvidia.com>
Date: Fri, 17 Apr 2026 09:23:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: tegra: xusb: Fix per-pad high-speed termination
 calibration
From: Jon Hunter <jonathanh@nvidia.com>
To: Wei-Cheng Chen <weichengc@nvidia.com>, jckuo@nvidia.com,
 vkoul@kernel.org, neil.armstrong@linaro.org, thierry.reding@gmail.com
Cc: linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, waynec@nvidia.com, wtsai@nvidia.com
References: <20260304102649.3670783-1-weichengc@nvidia.com>
 <82f3ca77-7b8f-41b8-85fb-c502bc343778@nvidia.com>
Content-Language: en-US
In-Reply-To: <82f3ca77-7b8f-41b8-85fb-c502bc343778@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR3P191CA0005.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::10) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|CYXPR12MB9337:EE_
X-MS-Office365-Filtering-Correlation-Id: c5bb74dc-0612-45c8-e51b-08de9c5a9537
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	BiXCWSGyR4xfke+IyXVdQhgom4NY0tWWc7uxpXC+gOGKdHI2w6q1BAF55XGCaVPTAB7wMx0F6bTNBInOo5MJxEjdTeovz6Ee1IOHhTpzF6FeClEXDubx9d7LwCzCZP7qEZ2NuVCq2aopw4S3a6lSb791CzirRXsFR+N9/WHbN8WFzdLs7KLXrki6XWq/LxuwwWPh7Dhb1sk2xzV+lFm1b0E728Ixrz8ULOYY3wX8XDUOMYFUADBPPvUwCj8cHDCeXOGcFpgdMt0dbhLuMQhh+dYyuikfLrCsCrKpxqj1yPKpIRGaEg3B75wIclh0UobQsJeS4EskslCDh8vXdTnvJRIip7rxKRY6OLn7B/XeBji83eKOasRoZ0/Mo9Nn/D+kAV8KIrRqvnjtkAznUKcfW0pZwC17Ly1VUWytlSx2DdMiAm7ecQMAOQxo6Lw0uAVQrGgiXg8WEfiXrJw96upj0kzn1V9TNb2AJ9o5jnsthCmhd8qlI5dmyQbI78Pp3vPBeAt7RZDh08JDpguVgGYkNxejcPMWJWmYC1xxmD6826no718CUiJnj3tAMt6HDzvlRx/cvUJmvORfgxbX6xZ/yEPabcOwhLqdP8Fej3Mtcq5Rfqf9QxrYiECFkuAaZnKtKsjfVHejGTGnOxUvoiH0uM5YsEtM2nlYuXLwnJAKDRYcQodaFEO1Tp2Q0K6qrklvBxntdmGKlxLp4SFLnULD9WfMtTR6XJBqZPi+Bybu2uU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N1BZZnY1TnNjMVJaVGExUCtWdjl1MjlkY2lUU2Y4YWRLZlFsZERqNDBXWnhj?=
 =?utf-8?B?Q1J5bi9xTEhtZGdQR0ZQVUJLK09yMHRIYU15VzJBQ2g3SjdYRmxaTDRlZHQx?=
 =?utf-8?B?OVNRTCtvb1pFQWZvMVpJS3R3UnEyd0p2YTlsKzFzMFJrMk5VRkV5dkdtSUlL?=
 =?utf-8?B?QzBJdmRXWEhmRVV3djdZbG1HM1h4VWhZOXZ3Yy9hQjVmTWFKZVQxY2c5ZVNj?=
 =?utf-8?B?UlRQbjZ2NWZMYTZmUGRtZE5SdFUwcFRhdGVxRjRvejRZTWVNTmVjZHgrZ3RV?=
 =?utf-8?B?d1pPUVlJV2FyNUxrblAzcS9yK2xFOFdnWTgxSHowU3JpMFpNSzlpYjd4c3Mw?=
 =?utf-8?B?Uk9Ca3lneU1COHdzQzhkaitNWFhmT1JNdlV5ODZrbFNackJBNitaUEhuZC9B?=
 =?utf-8?B?Q3pERmJwSjNDVGxyU0FSSXBnNGdQSUc3WjN4TEdxRVgyaExoUlFDZmttcTg0?=
 =?utf-8?B?ZzdwQUlxbWRTMGhyUU1kK0QvaUdpNW5QbGYwZjlaU3VzajFSZHdSWTNPbjA4?=
 =?utf-8?B?RDdxY3JndHZqbndIZzZUZEtEcjU1MEdoS2RaTzMwQzQ0RW1ZZ0I4RzJ4RTFO?=
 =?utf-8?B?OHVpVmkvTUtBSnZHUTlWNitRdjBmaDB5VVFDTlFoUy94RmE2N2RvVzlLNTh3?=
 =?utf-8?B?RG85b2hxb0NEaWU4ZlB2d24zL0ZkY3l5cUFTemhBS1hpbzRmbjIwd0RvNXV6?=
 =?utf-8?B?UkJrZ0VRVUUzN05IT2V4VUlnaHJzZHdzTEoyeTJ4V3JZR3hVTDM2RDhjYnli?=
 =?utf-8?B?SnJLeFZ0ZGVEYVp3b0JKRXk1YkN1eUFtTkVVby9oVC9MWjJac29QSFl0Z1hP?=
 =?utf-8?B?VTAxQjR1OUpUZHZPMGFKYitOQmpxczhqd0dDMXY1cGR1UDh2U3VkeTdKbW1P?=
 =?utf-8?B?bkpDR1ZZM2VsMmJheXdUUWNDN3g2WldPejFuaUw0QjFCZzZKeDR1a0ZQb0hk?=
 =?utf-8?B?anNpMzNZWFN3MVl5OEozT21VRGQ1QkRna1lpNXQ0M2dOYzhkK003RTJLdCtK?=
 =?utf-8?B?dFNEaXRhWm1kR0JRejJhYmxpRmsyb2xEQWptaCtWSkpwL0ZRZ3NSbU9KUjdv?=
 =?utf-8?B?TzNpR1FIU0FKZ0JxMHZpK1BWbTU2R0lDcGlYSk5SYzdGd0pJdmNIdDF1a2N5?=
 =?utf-8?B?V0Z2NkFyMFpDcTdjVHc0c1ZvT2lkZzF0bHdieHg3eTI3TUVDelN2U2YrTm5j?=
 =?utf-8?B?V1Zodk5INGtRcG1OVnJzNW5iRVppSU0wdDMydXQ0SXFObkk1TkZDaldtMW5K?=
 =?utf-8?B?cmNhYVlQSHhvNDhoelNJQzJBM29xOXBZdkFPVzBVWUNsbjBnQVY4dU1ETnJs?=
 =?utf-8?B?bWZZdFc0UkUvdW5uSEp6U2FZY0ovN3M0VGY2Nkk4cVNSRmxPL1JlS29FWk53?=
 =?utf-8?B?NGprOVpudWVWWW9RV2FnSEJORUY3Y2dvOVM0VWpVNHR1VkpKYmlYUTMzV0F4?=
 =?utf-8?B?QlhXck05UkJBSmZyU1Bid2htL29mbytGaGZtQjVWMGI2eFl1eWlGY2t3MmxP?=
 =?utf-8?B?ZEpjZzg1Q0w3UjJHYmtUVU5tT0tPSUlHM2pJdXZ5MUlxeVhMQytLWmxtVmY5?=
 =?utf-8?B?Um5Rbm9jL2UxTjM4WDgwUnM4TWhzeWNKa0E5V0FGK1l5Qk81WVZWOVBqc2pW?=
 =?utf-8?B?MmUxK1JERnJPcUNlZGZ5UzF1QlNJcWxiYXZ4VUNKQU90WTY4U05Xbk1zSHRO?=
 =?utf-8?B?TnBVa3hDYnY0WllMd21jU2FteGdJMEF4Y25jUE9rVDR6NXlUS2V4QkhkU3N5?=
 =?utf-8?B?VlppZUIrQjJMZ2E3OGhTWHg0WjhjZWhVK2dXVFJXam53WnZWNkpUd3NpbjBD?=
 =?utf-8?B?WE9qRkVSaFZaMXk3R2lWL0tGd21UNGczank0emVQYmsyVnJWWVRnWTQwZjhM?=
 =?utf-8?B?NDdwVmI1SG4zOTNvbDZhdTVQcVQ0RFFLR0pDeGxMakoxRnhBNGp5Rm4zR0Zt?=
 =?utf-8?B?blVFUC9ibjYxVFYvdXdmK2xzb3UxZ2FJUmFaRjhXTHVtRGsvU29KdDVFNVFx?=
 =?utf-8?B?MGNZM1ErMFhWRFYzckR0bGhoZ2pZWDBUdExuM2FORkh3Q3ovWXZuQ204OHQr?=
 =?utf-8?B?eitPWDB2WFljRVRuSWFJUjZUdHd3N3JvY041TE1nenZoQTFUSEpKVlFvMHdL?=
 =?utf-8?B?ZzFVRkw0dEYrLzhqMGhRNWNUUXR6blI5ZmlYalNxLzdHZk51MU56NitpMzM0?=
 =?utf-8?B?MFlQQWJmcGF4czZrYjg2dFhUM1U3dWVBOVRMV21BejQrZXE2L1h4THF1T1NR?=
 =?utf-8?B?Q0VQMFFuT2x1M0lDR0laRWpTN0dQSUFoMUFzc2c3b3hXVTZISVkySGxHb0dz?=
 =?utf-8?B?bkdIRmxjbmNWZkJPd29lT2NFRnlsaC9kRjVEbVNZdEpYaXJjeUlQUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5bb74dc-0612-45c8-e51b-08de9c5a9537
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 08:23:19.8989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6jKHRYbcz4xVC1G51dkoW93zxo1gkoNMTcELIELy92W/9SrLxoz23QIlQkvbNlsL/x82V9/wFrKllReBo37Scw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9337

Hi Vinod,

On 24/03/2026 09:11, Jon Hunter wrote:
> 
> On 04/03/2026 10:26, Wei-Cheng Chen wrote:
>> From: Wayne Chang <waynec@nvidia.com>
>>
>> The existing code reads a single hs_term_range_adj value from bit field
>> [10:7] of FUSE_SKU_CALIB_0 and applies it to all USB2 pads uniformly.
>> However, on SoCs that support per-pad termination, each pad has its own
>> hs_term_range_adj field: pad 0 in FUSE_SKU_CALIB_0[10:7], and pads 1-3
>> in FUSE_USB_CALIB_EXT_0 at bit offsets [8:5], [12:9], and [16:13]
>> respectively.
>>
>> Fix the calibration by reading per-pad values from the appropriate fuse
>> registers. For SoCs that do not support per-pad termination, replicate
>> pad 0's value to all pads to maintain existing behavior.
>>
>> Add a has_per_pad_term flag to the SoC data to indicate whether per-pad
>> termination values are available in FUSE_USB_CALIB_EXT_0.
>>
>> Fixes: 1ef535c6ba8e ("phy: tegra: xusb: Add Tegra194 support")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Wayne Chang <waynec@nvidia.com>
>> Signed-off-by: Wei-Cheng Chen <weichengc@nvidia.com>
>> ---
>>   drivers/phy/tegra/xusb-tegra186.c | 33 ++++++++++++++++++++++++-------
>>   drivers/phy/tegra/xusb.h          |  1 +
>>   2 files changed, 27 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/ 
>> xusb-tegra186.c
>> index bec9616c4a2..4452e73fb82 100644
>> --- a/drivers/phy/tegra/xusb-tegra186.c
>> +++ b/drivers/phy/tegra/xusb-tegra186.c
>> @@ -20,8 +20,8 @@
>>   /* FUSE USB_CALIB registers */
>>   #define HS_CURR_LEVEL_PADX_SHIFT(x)    ((x) ? (11 + (x - 1) * 6) : 0)
>>   #define HS_CURR_LEVEL_PAD_MASK        0x3f
>> -#define HS_TERM_RANGE_ADJ_SHIFT        7
>> -#define HS_TERM_RANGE_ADJ_MASK        0xf
>> +#define HS_TERM_RANGE_ADJ_PADX_SHIFT(x)    ((x) ? (5 + (x - 1) * 4) : 7)
>> +#define HS_TERM_RANGE_ADJ_PAD_MASK    0xf
>>   #define HS_SQUELCH_SHIFT        29
>>   #define HS_SQUELCH_MASK            0x7
>> @@ -253,7 +253,7 @@
>>   struct tegra_xusb_fuse_calibration {
>>       u32 *hs_curr_level;
>>       u32 hs_squelch;
>> -    u32 hs_term_range_adj;
>> +    u32 *hs_term_range_adj;
>>       u32 rpd_ctrl;
>>   };
>> @@ -930,7 +930,7 @@ static int tegra186_utmi_phy_power_on(struct phy 
>> *phy)
>>       value = padctl_readl(padctl, 
>> XUSB_PADCTL_USB2_OTG_PADX_CTL1(index));
>>       value &= ~TERM_RANGE_ADJ(~0);
>> -    value |= TERM_RANGE_ADJ(priv->calib.hs_term_range_adj);
>> +    value |= TERM_RANGE_ADJ(priv->calib.hs_term_range_adj[index]);
>>       value &= ~RPD_CTRL(~0);
>>       value |= RPD_CTRL(priv->calib.rpd_ctrl);
>>       padctl_writel(padctl, value, 
>> XUSB_PADCTL_USB2_OTG_PADX_CTL1(index));
>> @@ -1464,17 +1464,23 @@ static const char * const 
>> tegra186_usb3_functions[] = {
>>   static int
>>   tegra186_xusb_read_fuse_calibration(struct tegra186_xusb_padctl 
>> *padctl)
>>   {
>> +    const struct tegra_xusb_padctl_soc *soc = padctl->base.soc;
>>       struct device *dev = padctl->base.dev;
>>       unsigned int i, count;
>>       u32 value, *level;
>> +    u32 *hs_term_range_adj;
>>       int err;
>> -    count = padctl->base.soc->ports.usb2.count;
>> +    count = soc->ports.usb2.count;
>>       level = devm_kcalloc(dev, count, sizeof(u32), GFP_KERNEL);
>>       if (!level)
>>           return -ENOMEM;
>> +    hs_term_range_adj = devm_kcalloc(dev, count, sizeof(u32), 
>> GFP_KERNEL);
>> +    if (!hs_term_range_adj)
>> +        return -ENOMEM;
>> +
>>       err = tegra_fuse_readl(TEGRA_FUSE_SKU_CALIB_0, &value);
>>       if (err)
>>           return dev_err_probe(dev, err,
>> @@ -1490,8 +1496,8 @@ tegra186_xusb_read_fuse_calibration(struct 
>> tegra186_xusb_padctl *padctl)
>>       padctl->calib.hs_squelch = (value >> HS_SQUELCH_SHIFT) &
>>                       HS_SQUELCH_MASK;
>> -    padctl->calib.hs_term_range_adj = (value >> 
>> HS_TERM_RANGE_ADJ_SHIFT) &
>> -                        HS_TERM_RANGE_ADJ_MASK;
>> +    hs_term_range_adj[0] = (value >> HS_TERM_RANGE_ADJ_PADX_SHIFT(0)) &
>> +                HS_TERM_RANGE_ADJ_PAD_MASK;
>>       err = tegra_fuse_readl(TEGRA_FUSE_USB_CALIB_EXT_0, &value);
>>       if (err) {
>> @@ -1503,6 +1509,17 @@ tegra186_xusb_read_fuse_calibration(struct 
>> tegra186_xusb_padctl *padctl)
>>       padctl->calib.rpd_ctrl = (value >> RPD_CTRL_SHIFT) & RPD_CTRL_MASK;
>> +    for (i = 1; i < count; i++) {
>> +        if (soc->has_per_pad_term)
>> +            hs_term_range_adj[i] =
>> +                (value >> HS_TERM_RANGE_ADJ_PADX_SHIFT(i)) &
>> +                HS_TERM_RANGE_ADJ_PAD_MASK;
>> +        else
>> +            hs_term_range_adj[i] = hs_term_range_adj[0];
>> +    }
>> +
>> +    padctl->calib.hs_term_range_adj = hs_term_range_adj;
>> +
>>       return 0;
>>   }
>> @@ -1708,6 +1725,7 @@ const struct tegra_xusb_padctl_soc 
>> tegra194_xusb_padctl_soc = {
>>       .num_supplies = ARRAY_SIZE(tegra194_xusb_padctl_supply_names),
>>       .supports_gen2 = true,
>>       .poll_trk_completed = true,
>> +    .has_per_pad_term = true,
>>   };
>>   EXPORT_SYMBOL_GPL(tegra194_xusb_padctl_soc);
>> @@ -1732,6 +1750,7 @@ const struct tegra_xusb_padctl_soc 
>> tegra234_xusb_padctl_soc = {
>>       .trk_hw_mode = false,
>>       .trk_update_on_idle = true,
>>       .supports_lp_cfg_en = true,
>> +    .has_per_pad_term = true,
>>   };
>>   EXPORT_SYMBOL_GPL(tegra234_xusb_padctl_soc);
>>   #endif
>> diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
>> index d2b5f956513..810b410672f 100644
>> --- a/drivers/phy/tegra/xusb.h
>> +++ b/drivers/phy/tegra/xusb.h
>> @@ -436,6 +436,7 @@ struct tegra_xusb_padctl_soc {
>>       bool trk_hw_mode;
>>       bool trk_update_on_idle;
>>       bool supports_lp_cfg_en;
>> +    bool has_per_pad_term;
>>   };
>>   struct tegra_xusb_padctl {
> 
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> Tested-by: Jon Hunter <jonathanh@nvidia.com>

I guess this was missed for Linux v7.1. If you don't have any concerns 
can you pick this up for v7.2 once v7.1-rc1 is out?

Thanks!
Jon

-- 
nvpublic

