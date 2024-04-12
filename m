Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2059.outbound.protection.outlook.com [40.107.101.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A501F14C596
	for <linux-tegra@vger.kernel.org>; Fri, 12 Apr 2024 17:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712944163; cv=fail; b=Hu+q14WTC0Syr4yJ5UauVNVtApQ+za/tb41FDLZKzxO+8AYY89qMocpGApeUyu1YrUrJHbnHPvZX+/Ez8FirSls6lKiJkev/4vEiH88xo5EnSuJhOK9TpaQ4QXxepFbBrN6bMr3jQ/83oyGh6g6ZnhiZb4S0moaeP+5vw6HdoKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712944163; c=relaxed/simple;
	bh=vBDdaAYMQjn6mKshlHZ2QwDylx0VGTjnTcyl3rjvhzY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AvQmaWNYwSjsTvc//nfdQRaCpDfXfqbSqb/C/KU3kRA9Oqvigp6RsTS0HvX48tpSsa07O++Y4CBmzqK/heED140rw3MmouPCGn+hAuQT6/p+Vi1xIVkYVWkDXUV+COetLji//Z3Rq9NiVYuNLirv8S/LAmsaNr74iTXU4xNM/BE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=hcPs9qnp; arc=fail smtp.client-ip=40.107.101.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="hcPs9qnp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O1SKFoAR/MnwntSqW3DTbRbQ6S2GOYgYLKYSihMFO2JzhqfIMkrxhe6GkZw1lPlOxLPSCrp8xP6E/xsi36bNEgjwPyips58Xdutiame925JLpsoIlEyV/geGvdSDbxVi0Wj5vYW4zQ3TEfdnGSnU3ufvNQgku5Mbj0th1sp8rCZAY9CCZtWTJ3dBoDBB0HSIcCfxK1WFYi2iWSwzsXpKd+kNSGDf2qi/s2tPdEEYwInT85laLLfzpKzT1v2TpoyeMmWB/CXwKKMNhTDbNrN2NBVvSa4r2ZdaQDeXiNbPpZcplSv0aU1Na2RpS/nsY3YlSiohyMlDbwbcJXUkgTGyZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jSAZvf+WjWJtN+WKVFaZX6EyA3Vf37SxvBWuSvab5Cw=;
 b=ZLPNWzNIwmAusTmuFyfUiNuipj7nSMyW/or653Y42orEFYHvdBlbIlWpEWUEgLAYh/NDnxZHR+5JGcr1dwYwR+VJbBK4l/y71gcy8A6Z+bXrxesYrrfQObqmXrF44Mr5Fo1EToWW33NUsyZSfP2SXkokpXbE7i82xx4Lo8JHlYIN9DNUHMI8z6Jc8MkbhMLGnGhO0/80Mb/7KfeyqMUo9oT96B0VGCSrPs55IjmkcGLX+XNqXzoUiFfTSIlH+L6tnOeXp+g1gR140bwzArQz/LSUnc/CAL62hG1HJzIGtcD6P0b46d3Qi3aDCrVvm+N134Mfcm+jNHW7celfzcVq0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jSAZvf+WjWJtN+WKVFaZX6EyA3Vf37SxvBWuSvab5Cw=;
 b=hcPs9qnpbxagxVTWgjG3KGsgzKh/iLC+Ah/2DwC7mHdUWV2KxViWlIE+06IQMbggrNT6XTSIVn5Od2mXqLukszKBsLTQ2O5U7xBZg/EZoe/hkdBhKK00gf/6FGF+0EszOxFEi7nwZqo9p9zCLrP20Xa/gqcY/6DRQiLLQTFRK+vbinf20+8n7ox1W26cfkuSmvzCOG+5cxv3f/jcU2iRjGsBMaXg8GwHIZcU3foqrS45TPri7IxBjG09mTTQ0Qa3WP8Fu4T2vTgpzz5wwzj731diW2NT1USxUpde/nI42RwdxJMLFUUBHWis20P98vfu7/eGBHhv491CfADx4sjEHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB6604.namprd12.prod.outlook.com (2603:10b6:208:3a0::7)
 by DS7PR12MB8292.namprd12.prod.outlook.com (2603:10b6:8:e2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Fri, 12 Apr
 2024 17:49:17 +0000
Received: from IA1PR12MB6604.namprd12.prod.outlook.com
 ([fe80::9f48:9a75:e1c5:b9c0]) by IA1PR12MB6604.namprd12.prod.outlook.com
 ([fe80::9f48:9a75:e1c5:b9c0%7]) with mapi id 15.20.7409.042; Fri, 12 Apr 2024
 17:49:17 +0000
Message-ID: <0c55102c-f8a2-4f08-ade6-b4026c3314b8@nvidia.com>
Date: Fri, 12 Apr 2024 10:49:14 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hte: tegra-194: Convert to platform remove callback
 returning void
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-tegra@vger.kernel.org, timestamp@lists.linux.dev,
 Thierry Reding <thierry.reding@gmail.com>, kernel@pengutronix.de,
 Jonathan Hunter <jonathanh@nvidia.com>
References: <0b0a5d3816973ee88d4be9fe9f2349065a42cbff.1709886922.git.u.kleine-koenig@pengutronix.de>
 <CZR1QZ6F6QA4.2YFL58PNYHE0P@gmail.com>
 <a698710b-083a-4873-b054-b1426c1237f4@nvidia.com>
 <vij2jpf2arf34xxcrel5dxcnlrp6idsystmkj276ossk6bpfba@x3opk65vaui3>
 <x3cs6kbixp5lro5adn62ljxxrxhmkdymli4xk744hahx6nzdgx@a24jk2hjito7>
Content-Language: en-US
X-Nvconfidentiality: public
From: Dipen Patel <dipenp@nvidia.com>
In-Reply-To: <x3cs6kbixp5lro5adn62ljxxrxhmkdymli4xk744hahx6nzdgx@a24jk2hjito7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::26) To IA1PR12MB6604.namprd12.prod.outlook.com
 (2603:10b6:208:3a0::7)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6604:EE_|DS7PR12MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: a4ad025c-4c3b-4eb9-4672-08dc5b18df93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XL+uIShbemlYkDi7/Tk5NhIGPEYX4hlYRIcEhvEKhpV9yqSrytwZGZsZsnTcx/zdig9xMy4tv1u3pPGm27lFDcf+nx/9fxYzyq71sSSjf0LsnEP9H4k5bd2DYip0mZwc2bBhkXBKvmMS6e1tfSuXwtms4n76hftgZGwY6GjkBz01awlIL8r4BiTtr9MTDEPrftexZcXcnXwcR80F1F3wPpwVCY/ospnGjDtyzH0tJrMx2pFVdUNAEsEgoy3UXF32znDwe9WpuC3Xktoux6ZbkWxSU0/5zz2oXOTZRutnAhpwFPAQEgXDCBz/AMEsIMnKs6WDFBfrrwF4tbyhuBLycmHTy0sl65U7SlgL/UYFNlNM0myOMhChrlagPRkUG7B33CPdMSUu9lNgw/lRFw4kg/nJI0PzWi/apnGwRg2j8MLm8RmW/GtmoSpP5AHglwQLnB1G5ebVGhX+8v5ZkNpBHHECR9yIInU/kHmqMdEiD76F3VwQnAa5Xt6bviuowtcX6kQl1fZPDE73227XY1LqKMTHHtkp/2n56FRbaqd90j63VbYsl69VyxxukiBCtJThu6IUjm+FGZ+vgNC1R71CpGih5nnIif1XeYWD3eQUAmSYSXn0PjY+g9F663BE2KHRYaDClO9TZ0xuz0kCMR8gviO7sjf9oUvH5CyTgzQazh0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6604.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFhaeVhzVGtPQjFiWnNQZncyQjlMUlM0akVGSEFnMklBUWNCMUFZN2FGcFpp?=
 =?utf-8?B?OVJtS0JxTDVBNlNBcThzdkZKK2dLTGlxby9Fb1gzUmg5T1FtRnBEL3dKMXpE?=
 =?utf-8?B?U3JtSk04enl4eG9PQWFHOThIOEVTZG85cDZXLzhOcld4ZndaR3FQc1Mvd0Jy?=
 =?utf-8?B?aE41WXQ4Zk16QlRsQ2JLdFBmTC9DRDBiTGJXU0w4Ym16TTJUMXZac0x1Rmp1?=
 =?utf-8?B?d25CSXl4NnRlSFpPT2JDSGFVR3B6R3pYMXNSeVRJdlF1Yit0N2phVXZMWU5w?=
 =?utf-8?B?amQrV1FCRUtvcEVOLy83dDAzc0hxcDRuS292eGFYR05PdnhLQ2R5RnAvSEdE?=
 =?utf-8?B?UmxyelFHNnR2LzFCSlBBUXAyV0k2akdlS1JuaENZMkZSL244U2YrY1YrSXJJ?=
 =?utf-8?B?VHQ5amNIUExlc3Fta2dpUllrNU96SFhTS0VidStVV3BFcTcrOHNHcHY0bnhG?=
 =?utf-8?B?YWVMUnQ5d3NLdjhVNEsxMTdMY1BsRXZBNWJzOUV0TmpMQm5OdHkrelpnWVh4?=
 =?utf-8?B?cFJOUWQ0bkFqaEJBTk5NZWJkdUkzcDhzQ0dRZFc4OW5ZcE1sQjRMS0o3cG1P?=
 =?utf-8?B?VHE3YXVVT0J4eEIrUFZ5eVVneGwxV0NkWUF4a2ZuUmFvekZ6SDFBM0ZhUWU1?=
 =?utf-8?B?TXEyNitUNkpIK1M1RmVOVXRMcVJtZXlNMUNwMlpXMitPZSs2TUZlRGQ4TmpE?=
 =?utf-8?B?aXRqMm9xL3lSTXNxK2dtVnlNY1FUYlBqS3loaUhkOG9lWms0ZnRCYjlpdWxy?=
 =?utf-8?B?UWVZc3o0QzlhTUpRYVZ2Ym1qeExjYnZOZ2hjSTV3dVI4a0RiUUFrNkRCa214?=
 =?utf-8?B?b0RSUDUvaktkYVpxUVB6Nld6V2cyWWU5RXkwMzVlZUw0djZ0KzBXVkUyWEV3?=
 =?utf-8?B?aXNaNkpIdzFzT1hiSmNUQ1BjdkJDZHRtTXVHcUdzYmxibFNsU0hXNkpPcGVt?=
 =?utf-8?B?cGZSZ3BlZUovT21LSVl1R0NuMnRPZVVaV0M4Y0drd3AyWlBPWW9ldTBTai96?=
 =?utf-8?B?Yk9yclJubFpVMThHWWJ0ckxMeU9PVzJnOEUwOUFpWUdjN3c2YlNqbnQ0R1Ax?=
 =?utf-8?B?eU1vN2xBckxMV0M5N2JiM2NyZUw4VGNFWnk1T1lKZ3RiTHRTYjVmV2tObWM4?=
 =?utf-8?B?cjczY0E1aHVmQ3RKSWFOSGNsZFUrRVVoNUxyUnVuVFJCbjJ1NGhrRGNXSHNC?=
 =?utf-8?B?TEhvVFB1S1RUbVBweTNFbzZUMk9tbm02RldWNVA0VlFKa0d1VHZmVmdQS0VR?=
 =?utf-8?B?aHd0UHdHbldtdForWU5ndGJFcmthNUUrajRZQVFDRmpRRDlISDMyd2o5UlVY?=
 =?utf-8?B?TVRGZWtHb2U1VTNlT2dsTzdIM215TDVuM2FhcmNZWjcwRmx0UVBndjZhZnFv?=
 =?utf-8?B?eTdHWjM3UnBlcXJqRnZ4MjVZbG96TjJDQ3dyM3RaTkxRdXlTMmQ2UEhvNUFu?=
 =?utf-8?B?RkNKQ1g3RngzYkwySEhqcmk3SGkxNU5UamJCSHFKdGlXaE5WaVc5aDFJVW1z?=
 =?utf-8?B?eHlVeUh0MHRkSytmTG81ZHRWOW1RVGFNZ0tXSU5jcEZ1ZHdlbnM5U3lIMTZI?=
 =?utf-8?B?WGh6WHBzaHdZSmhJQWhFVzUwY2FDR1U5MXFFTmV4NEVlY2w2bkRCSlAzbHYw?=
 =?utf-8?B?RExJbklWZjh0S1gvMEtsSEY1WGdzUnYzV1dFVXZyL1BvYlQxdloxS0xscnh6?=
 =?utf-8?B?NG4za0JGZE5QSS91VWRFcHBKVlB1cGtOYlliK1JmVE9JdzczSm16Z0FZdENl?=
 =?utf-8?B?ZGI5TDVvZ29zSkZ3SXcrRTR4blk3NVlBKy9ObHFqMmkwaDFXa1hzRWdZc24x?=
 =?utf-8?B?dGV1cU45eHJ5ZnFrRXYxQ1FqRjZKNTZsMUFLT2dwdlRqelhPb2g0a2cvTWtT?=
 =?utf-8?B?QnBBQndLU201MndKbW5HUno4dVgyekZ0c0tXcnBwUzc0QnhzSXAvZE9sWTRE?=
 =?utf-8?B?c0pFNHFua1lhWmpYL0E0NUQvaWI3OUNPemRxb3orclBQc3ZpWkI0a0V6TDVF?=
 =?utf-8?B?YzhFalhMcFBqUS9oZjlPM2lKZE9vZ05DVmRIWENCL3g0TjBjeDRrcWViSXVY?=
 =?utf-8?B?b3NjcGFGZXM4NDdiZTJEOEc3ZnN5bW43enk1aVh1Y2RVdmVHdDdCVFJlU3FE?=
 =?utf-8?Q?BkjvzZbElqRNW3kz86tAbJjTC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4ad025c-4c3b-4eb9-4672-08dc5b18df93
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6604.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 17:49:17.0247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aeu8Wv14klna5lAMq6sZeEUb84Jqj1CBSunCaTYbfWRtpw0kjegsWvAtgaUZHexjQlbOackQlZiFxVWAuVijuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8292

On 4/12/24 5:35 AM, Uwe Kleine-König wrote:
> Hello Dipen,
> 
> On Mon, Mar 11, 2024 at 09:36:06PM +0100, Uwe Kleine-König wrote:
>> On Mon, Mar 11, 2024 at 10:13:15AM -0700, Dipen Patel wrote:
>>> On 3/11/24 9:04 AM, Thierry Reding wrote:
>>>> On Fri Mar 8, 2024 at 9:51 AM CET, Uwe Kleine-König wrote:
>>>>> The .remove() callback for a platform driver returns an int which makes
>>>>> many driver authors wrongly assume it's possible to do error handling by
>>>>> returning an error code. However the value returned is ignored (apart
>>>>> from emitting a warning) and this typically results in resource leaks.
>>>>>
>>>>> To improve here there is a quest to make the remove callback return
>>>>> void. In the first step of this quest all drivers are converted to
>>>>> .remove_new(), which already returns void. Eventually after all drivers
>>>>> are converted, .remove_new() will be renamed to .remove().
>>>>>
>>>>> Trivially convert this driver from always returning zero in the remove
>>>>> callback to the void returning variant.
>>>>>
>>>>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>>>>> ---
>>>>>  drivers/hte/hte-tegra194-test.c | 6 ++----
>>>>>  1 file changed, 2 insertions(+), 4 deletions(-)
>>>>
>>>> Acked-by: Thierry Reding <treding@nvidia.com>
>>> Do you want me to take this patch or want to add in your patch series
>>> for the drivers with similar changes?
>>>
>>> Acked-by: Dipen Patel <dipenp@nvidia.com>
>>
>> I don't plan (yet) to care for applying these changes myself. So if you
>> could pick it up that would be great.
> 
> Either you didn't pick it up or your tree isn't included in next. Both
> options are not optimal in my eyes.
> 
> Given that I want to change struct platform_driver::remove in the merge
> window after v6.10, it would be great if this patch made it into
> v6.10-rc1.
> 
> Thanks for considering
> Uwe
> 
Sorry for the miss, I will pick it up for 6.10.

Best Regards,
Dipen Patel
