Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012016.outbound.protection.outlook.com [52.101.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBB5379ED4;
	Tue,  7 Jul 2026 15:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783438001; cv=fail; b=AUhi7ju7ILLHtnwCFcne4I/ticpKqpBYzptFWv5pF+3gSBMx7reRX1t3fBG0Vcn5MRQhdHjo31FLPTf4uRk2JAi4EQ/pqCrQKLg0yuH+5w6nAHP1jNK0tysFaB1RcSk0M8NJtonK1PdrNLqwWjG5p8xMLZNGmt0Lg0JhZE8dJKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783438001; c=relaxed/simple;
	bh=Z3pRmneITJVybIP6VGd1d/WZLylqyJelyJkRj4O/LIU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=H9jyaS+v6pgx39KCJ6FYGqxyuF5DiRY35/pMJUuI9ESONwINJAi3i9VtZX9IgQLKLOPi3sqjyK/yIWOp8iRmH3Lg5h1l2RiU78lJiluNXWuC+0+S4nx1jY0WCpSXLp0dYQ0ARMkQSgIQQOFasOkACUJ21oG2ez/eFmMglP9G8WE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TanTCZtH; arc=fail smtp.client-ip=52.101.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TanTCZtH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tEfnEFUiqrkf2Ij1av0HvYArRlwXXZbv5odLuXyw2LgVztipvQLEa+xzbUHcIXc+WqT3X1jZxzmfWrdNPyIWl7o4110wpUwsNXeHGixlthNic0hVo49IEgeOWLaqtSc2/23r06fp/XvSKtaypgeSpMYEATJD/HKl9M70R8uhvVotIrDM4b8hSn4h+JwSUI8m0FvrC2gAWwdEvpiVnSI3yfajee3VzJ9N5+Plq86BEltHoQJqnCwLqnken7WvpWE7hOjIeJAilAuSHpdLPZdbyJrQ9xCTl4JcZgPlWmTuK2/tGJhoIF7sx1ltL97UVQ5JYdk4kZJfo2sRbV+u4FqlTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CPM0TWEJ0L8f3qYoxDbqsf2HzVpQiIGQ3M6+VQ+5UnY=;
 b=MvDbqzkiBEuKQlR2kIMRJ7MBmlci/4C01NHVIxTKagiYyr6iPfMJPyiI6GImfktBpfIknOjhplUYdkOiocd5dM5SPZb58s4pjhsJOfDoj2aV/abzkuQ/uMXnoWF5HcwxQ0ycx6iN7ZN98GBV9gItFBSpmRfZQwQm/dqa9rKPd34wmKy2iMXhYOJEg9nZMx39qmRDxvKHuGZK7ZO1xqKhXb5dkvoTYS8GZGZM6o/kvsaLEeo6q2qFx3YV4NRfbcH5x8OcVOl4hxGay5Mvpuct9YKqgNkNrEQqSH55fwh7vwLq2OFBatIyUy69ro4y8doR5FEC4fLt9k71MAcc5lcHkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CPM0TWEJ0L8f3qYoxDbqsf2HzVpQiIGQ3M6+VQ+5UnY=;
 b=TanTCZtHStf5nFbMo4cVp0uZZ71JGSJ9IyVU5BB65G5z5pyk8ViES2+iZ1LCWaXgJcfRxQubJvQC48UrDvGuv7jg4rh5okBUhLN5pz7lh2AOivhbDC49WUxfpl2WKVM4NKLN96AC3NOdpf6U6XZtJaAcHp0pc0tqWdiW81fP8iv5s/iuXFtFEMVBG+JovlntQ0fAPilVz8k+SW1MU3Ztr961/jRtZ2cyln9CmZ6i6Q04h18I6Z00VittRwMYY5Ez5f3de9q/etuUijVF3ckFwrcU8NRcOBVrjtTW72clAh8/pg0XjowJPUzOf04fMBDn+Trad8zFzk1+q7pa6vjkIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18)
 by SA1PR12MB5616.namprd12.prod.outlook.com (2603:10b6:806:22a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 15:26:32 +0000
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9]) by SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9%4]) with mapi id 15.21.0181.012; Tue, 7 Jul 2026
 15:26:32 +0000
Message-ID: <a3ee12e9-2173-4386-9426-4752dd84c504@nvidia.com>
Date: Tue, 7 Jul 2026 16:26:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] clk: tegra: Support unique names for multi-socket
 platforms
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-tegra@vger.kernel.org,
 Timo Alho <talho@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>,
 linux-clk@vger.kernel.org
References: <20260602084334.350895-1-jonathanh@nvidia.com>
 <ah7F_QDw5hT2KdWB@orome> <f1be738e-25fd-4d4b-9854-cdf34412bcd0@nvidia.com>
 <ak0U0HQG-jLlNF5J@redhat.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <ak0U0HQG-jLlNF5J@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0624.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::8) To SJ1PR12MB6051.namprd12.prod.outlook.com
 (2603:10b6:a03:48a::18)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6051:EE_|SA1PR12MB5616:EE_
X-MS-Office365-Filtering-Correlation-Id: d0b82abe-3d08-4367-9783-08dedc3c1f26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|6133799003|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	OQ4Bd1RxetBNgYEwGhoUGyLLlhBteyWp0oQnERB0UEXFJoy/ETef8K76xY58mzcJQjMyLYlpWkTOP5tEnH42txD6lnjcsCexgqFtYMsJSmVjZWewIVoBxu8cwyYxLimS6hm64d/596i+H893BMVFhPs+XpPqyc5Xegd4WxxD+K686umsbTZS2Yo4mvebxix3aSisxow77UpVfPMxBn9VzgJH7ei4MIh3nbwLuVpzY7suT8uAYfaRfQb0F141DMg87aFB4SHFbL34fK423+zXmsuvzoKLCJOyqMNlbOQJOFaiMU0MYbXSaPELju+ykPOEln6JsuJ47sYnTDwx5CxCfyeSHVsOtU2geC2xTcgLjF9mjhHS95niPE/BvUZUptza8PfioIpm/E9+uQbKH7PYb6Zrjicc6IcW/g64+BReQIaZV4uVsbztDj6Dwa5ggOUh3F7oGkGOa2X3EqqSjwC1ErZx9shQh93preIQ83k1M0mimd1oP26hl+WCSKB5Plpet5R7vV65zIHyeZh9UmrOhwdNJ5/pDD36x7Xn++3avxac6waekdbr8z7NmPYX0heyHZw2yThxDuCcuhLC1gMe1RA11WI/71CQOOKAmVmh5Nwiebt9tPZelsogjD50x9ysa+dRUeyrwJVQx6UVfnJndxCpwHi90Y/IpSL0qBeR41g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6051.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bURvQkxqZ3pGUDRsTnlTWjhpbkljc2U1cEpMbE5lZlVGT3RVQzlBaWNKS2t5?=
 =?utf-8?B?TVBINW1Od0FFTnNNKzFmWGlFN1NhRy9Mc2xFT0oxcUtzWTZPSzU5dVhzcHJs?=
 =?utf-8?B?MjhDNTlUb3RLVUNzbjlsblVCZkZ5V0R4OHhlcnN5ZHRNaEl5VWJScGp4dDIr?=
 =?utf-8?B?emtnSnpWQTRyUm0rMzgrZi9FaEg4NW1SU0hJTlJJN0pDK0hmNUtkSDRGcDdC?=
 =?utf-8?B?UWNDaE9uVS95elFXek5hTG9CU2lpSjI5VWV0WUx4TFlyVVJXVTVadS94TXN5?=
 =?utf-8?B?UXVwdGRJc2N5aWZKbkFsL3hFalJlVmFVUHljRHFUTFV2ZGd5clBlQ1JIeXJJ?=
 =?utf-8?B?OEloWDQyN25aNnlZZnNXeW1XUXlDOU1yM1ptbWlCUmRLaFRkM3FhRmozeG1X?=
 =?utf-8?B?TFlGS2tOREh4VlZkR2lRMGpGaHhnYXRsYUFxZ0xZU0FiaGZHdXJNeFBFd0pY?=
 =?utf-8?B?eFpKSW1aOGU4WGZFd2x5dW93bDA4VG9EYStYUlovSXV6UmdlWEk0QSs1MVNw?=
 =?utf-8?B?WjNqT3BVL2QwUjRCT0RXSTQxcFg1dUd5RkZ3MXdSY2YvM0x1NG5Zb29aa1lr?=
 =?utf-8?B?K1ZqY21SWGJYRWZSNGFqdVA5VUw0eGFoMzVuQ3RGdWNyeGFZYzlaLzdGdnhV?=
 =?utf-8?B?djVoaE5Eem5tL1V5R0FBRFRiRnhoK2xQRVp0WXYydDRDdEhTVHpSYVFHV0Zn?=
 =?utf-8?B?WUtpcW15bXUwRGxDajZxRjdLWlNHYjF6bHUyT3VjcDZLZ2Y5S3BMZm94RFRE?=
 =?utf-8?B?RDZpQzc4ZkcvclR6YkNmWWtyaVNwaXhFa2FOeG1tM1pPcDY2SDBnSmFmYjJy?=
 =?utf-8?B?QkJ2NnU2VGY1Z2NKdXBFVmQ3U0lNeitJTGZQYUlvYlBhdncwZjlsdE1kbjJ3?=
 =?utf-8?B?VXVwWFl1YjVUcmo3aUNCNytFRjFSejh6ZjU0emhTdEdpUTF0UnZmczN6V24z?=
 =?utf-8?B?Q2hPOXVTYVVIYjNmLzhRTnB1MWlTRUgvRk9pTEgvdEpLaDY4bEFWcWlQdktB?=
 =?utf-8?B?SXYzeHppZUw2SHhWRVIrNHdJNDVsMUxieU5NRTc5Vy9FUGtYb1RqemJ1Vjh5?=
 =?utf-8?B?RUhvTDFNYWU3UzZwQ1ZDbnd3T0YwTVBPRXRoSmlGdnNnTFFVdkxZZFVlcnVN?=
 =?utf-8?B?VDFrSUt0WDZ0YS9QOTVUYnhzcDZIc2dNc1VuSVRPSmlrS3o4RkdyT1hERlNv?=
 =?utf-8?B?SDhVSFNvKzhKNnlIQzUxVExlQnBSejJweGNFMmJDcVhmQldESjh3RFdUTHZX?=
 =?utf-8?B?NmEyZ21VdXl2dEg1TU12aWF2YXdzNC9PNnoxSGJSUllCc3ZSVkJQNHVicGV0?=
 =?utf-8?B?NitLYjNTNERsTGlnQkxpdU5KdTlrbnlScTNIQm5hbVAxVFd6OXduTkhqbHZV?=
 =?utf-8?B?M05OTkxKMlFYTTZ0eVpqZmw1dGN6MXdISWZBOXJMTW9uS0hJZHVZUHdhOEhM?=
 =?utf-8?B?VkdxaE1oRnNVeHo0dkUwTzRXa2JTRHlOWmJQNFQwcGtTL3JIUE8ydFpDNVNS?=
 =?utf-8?B?RDRwYkhLSUVGOGJBWUcrOWVzUFF1SzBHVjJBd0sxQWkrSFFac2ZlYXdFRWts?=
 =?utf-8?B?UERzc0kvMUthTU9OWkZLWjlha3pOK0tRaStwOGFlWGhLL1JMV1YzRXRRbGpL?=
 =?utf-8?B?WDR3NGVINFVxTk55VVh4RFBlVjhGcE0wVzk0RklFeEJCMDVZdkFwaVVjSHBI?=
 =?utf-8?B?RFBZM1NGUndTMTdyd3lUYm1KY0dNT1JnZWNSdXFsWHpJVzI5SU9RWXMvWFJq?=
 =?utf-8?B?ZERreFdDQmhMenlCMnoyb3NYN2FGazR6aGtPVWkxUW1EM2tBSTYyaG9GMGg1?=
 =?utf-8?B?TTh1R3NuUkQvSGk1eWJ4bGxNenVhYlhBT0prNFhVN0hENG9Ob3lHZENEYUdX?=
 =?utf-8?B?UVpuOXBoejc1ek1PUEtoRkFmdXFSczhtZmFpd0VRcGw3REpGS0U3MXZtWFJ1?=
 =?utf-8?B?eHdYeHNadk1uSDB0ekdLRlZOeFF4SDNVWEdQeVk0WnUrRjB3N3VRNXdhVmdk?=
 =?utf-8?B?UHhUNWhjYjJvQSt2ZHhxMmJWQTZ3Q1RuWHMzZjFjdXk0RjVBV1Bld3hJQTI1?=
 =?utf-8?B?eDhPdHVTekxhOHp3V2g1VkYxWnpqbCt4cldwSFhSSnA4T1YvaG5QZkpTRmFw?=
 =?utf-8?B?OGRQOTZlYWRuaVlkNElZcW5KZDc2Q1dHVTBySHBocjBJUWZ3VEpJWmFLcExD?=
 =?utf-8?B?M2F0eHZTU2hSWlBmY3lRQUlVSVAzb2UrZHFnN29KSnNRaE9PUzhRQkpiUTUv?=
 =?utf-8?B?OE14SzN3S1ppOVRBbGU4K2cxMlA0TFNwM2xDRHZnb0E2dTl4Y0lOT2YzZ2lo?=
 =?utf-8?B?a0JDM2dRRk9nS29xZEZZYzBDM3JzNi9CbjhUS3lvMVBHeU1Lc05SQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b82abe-3d08-4367-9783-08dedc3c1f26
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6051.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 15:26:31.8642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o/kzwshSrLoYm8rvv0SUtDV4pxRtC8uhxLQ98S4pju+MKnepFkyGn45K5xYW15mbzqmfPiTc6WMjJV/yP01yDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5616

Hi Brian,

On 07/07/2026 16:01, Brian Masney wrote:
> Hi Jon,
> 
> On Tue, Jul 07, 2026 at 07:28:38AM +0100, Jon Hunter wrote:
>> On 02/06/2026 13:01, Thierry Reding wrote:
>>> On Tue, Jun 02, 2026 at 09:43:34AM +0100, Jon Hunter wrote:
>>>> On multi-socket platforms each socket has its own BPMP which exposes the
>>>> same clock names. Fix this by using the NUMA ID as a prefix for the
>>>> clock names on multi-socket platforms.
>>>>
>>>> Use 'sizeof(info->name)' in the strscpy() and snprintf() functions to
>>>> future proof against anyone changing the size of the 'name' array.
>>>>
>>>> Co-developed-by: Timo Alho <talho@nvidia.com>
>>>> Signed-off-by: Timo Alho <talho@nvidia.com>
>>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>>>> ---
>>>> Changes since V1:
>>>> - Use NUMA ID as a prefix and not a suffix for the clock name.
>>>>
>>>>    drivers/clk/tegra/clk-bpmp.c | 10 +++++++++-
>>>>    1 file changed, 9 insertions(+), 1 deletion(-)
>>>
>>> Reviewed-by: Thierry Reding <treding@nvidia.com>
>>
>>
>> Please let me know if you have any comments on this or if this is OK to be
>> picked up now?
> 
> I made a pull for Stephen last week for various clk patches that were
> missed during the last merge window. I included your patch.
> 
> https://lore.kernel.org/linux-clk/akLzCVzbMbUsgDda@redhat.com/
> 
> I'm going to collect up stuff at rc6 this development cycle and assemble
> another pull then.

OK great! Thanks!

Jon

-- 
nvpublic

