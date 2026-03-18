Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013043.outbound.protection.outlook.com [40.93.196.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE4C3806D9;
	Wed, 18 Mar 2026 09:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773824819; cv=fail; b=R8Sz73UBEGw0nZQ+sTh3RtyI2szsCFy4tEAsn35p9MgLBWxLYhNkOHNS4Z/Dq2ubcM+uZqh4AzJftjX1wi57RcxPq3B9GvddDVvjUnfsH12/5D52bAaIEECjww64amKdkmNQAO+vrvdyTrnLVsYsFsbMLJ3pfUmzZil/2E2a9OM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773824819; c=relaxed/simple;
	bh=9eAhuvpsQxoMRf3jugVHzcTguQnzJPQoHCWBI7wWq98=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=B3p2l2wgqbETOFx/KKHfwsqbyYRN0c/D6oCDuhJ3cZa1Hff3fuHhfu0uBB+UhDVbspBNnQ1VCj0omBWOPr8/Clzd693XJ2VLZErzgvulAhPiK0CHEod6tYSgqR0LctETEchVpc/AIn+TgdnGVTn/xJgJSISnETRaALOdI0a2wN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JD2v43LL; arc=fail smtp.client-ip=40.93.196.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JD2v43LL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YrbhUfUHrv49w3cPMSO/QGcOKEklwAoG7fpXhGKiBo678DHAaiHqeZgmAMj6v3HnIUxXV033qSspv3brUo/HO73aBF7dHWUKhzjqXpMobENVjs8AQ/wdYwrJDvAJx5fwn1XTlHvZKEZKwGtolCHlM2JSN8FqfJgbtsmtQ/WbUc9qP6mC6yVlAKDrsgUJCoCuZuU8UyNo8SjnJmxDe3r452XDrngkXSC5fhD7WtxmZoXTy8NUs4zIQJFTWzsSZ1fgmr4rCQZoOpA4tlONuiSZU80gVZUQDY8cl8sFhuYYlhGxXsABziBFbOCOpvShmeeFU1Iq4KmdHO2OCsnNJ0pIfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IJVdLgN8LEPRbo1bFyWSH0vpa5wDOdPtO++HZWJtdek=;
 b=ADdB+5PNM+DUKWmBDgNDCfFtPuCZIw6d60p9dI8BdQZlCNdC6gNKXek+djwH9xGndf0dipoKEkVT9iLm9scVGINggMqg5khbsLJaGu3VG0YYNix1eKuyhwHBQmoa96mkI2+Lbf8CJn1IVnIdDQAQwvXm5LTZJUtBoRMBXkYsdBco3XbbOVbiFvKzlHSb4Flhzx9KvA0VtnGfLo8lul3gUuQ80sRQG+jTEFOO0veiD73zsB6BQonW3Gm9CNWzXQ7TE/LYG/HQQFKFAht78bMwQnG0qTyxtm+fQw32VithD2fLieYRMaX0hLgwvaL9XPP+BG0bvrQwSc9fB21y+NGxeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJVdLgN8LEPRbo1bFyWSH0vpa5wDOdPtO++HZWJtdek=;
 b=JD2v43LLbJfAHupud0+49jOuQeRwdvGCgg0x8sy+z8k43H0Uw77jMFEdjliMZcYP6MRKYcASUVfm3e75pf4UKVPqogU6D3X+rFCRV+X5clpqy7JiZWudMz/ADIm65HKBZ6q4Ia1GNClRHfhw/sDncJdjGn+hO3BsS1B/Nv1+gC5sonB2+bE1G/RklbBjN2ujq4zPHSrRxYq5aDqJifvVI8CbGwyFTR5NeYoGjQ4DnqIOWB+8TjZ26VTVkKXruta+m+0R1pG55icR+a0Njz68x2t2tX99RJA1ag3FvWZx4mNdwbfCNJUgc3iJavFPvkt5dTIBp8cQk/aVQPliJ/k6Lg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB7697.namprd12.prod.outlook.com (2603:10b6:208:433::19)
 by DS0PR12MB7745.namprd12.prod.outlook.com (2603:10b6:8:13c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 09:06:53 +0000
Received: from IA0PR12MB7697.namprd12.prod.outlook.com
 ([fe80::1c95:36b:ded6:1f3f]) by IA0PR12MB7697.namprd12.prod.outlook.com
 ([fe80::1c95:36b:ded6:1f3f%4]) with mapi id 15.20.9723.008; Wed, 18 Mar 2026
 09:06:53 +0000
Message-ID: <9246afe1-4ad2-4224-9b1a-cff07ecfa8d4@nvidia.com>
Date: Wed, 18 Mar 2026 14:36:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: simple-card-utils: add ignore_zero_sysclk flag
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>, katsuhiro@katsuster.net
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mohan Kumar <mkumard@nvidia.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20260317094910.1582011-1-sheetal@nvidia.com>
 <20260317094910.1582011-2-sheetal@nvidia.com>
 <ac95d92e-7304-49e7-9582-666eac386102@sirena.org.uk>
 <87cy12hxeu.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: "Sheetal ." <sheetal@nvidia.com>
In-Reply-To: <87cy12hxeu.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0167.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::8) To IA0PR12MB7697.namprd12.prod.outlook.com
 (2603:10b6:208:433::19)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB7697:EE_|DS0PR12MB7745:EE_
X-MS-Office365-Filtering-Correlation-Id: 76dd53b1-f1ab-4179-1f6b-08de84cdb23d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	meLjo3a7r9zfSCRFrlMCyDig25ok8Vh9Vdf1MY9EWKooHLfsBjrdmPo1/l8k4V86N2lFGe/YxEcE20LjZpfg4XUjvgaHFg3fbuIUOh5PlfxQJ+2E9xt61muusVrl6Mr/ZGsXIarmo6YSpdl5Bj+Tr8DIXUAJPGZMcHOAbfH86OSl0EnIEBqlewNaF+5Ootogh+1IINGrvk0dq2JTj3nH+8jnHcrSIioTLbsN72mi1tPdJgnEwtVceYtkjdZCKACwj0sPupH7QcMPO46yiwSzZqJFT9uH5bvuBJI5+o1YAp6eY5HdA77hu46MvmWVzC3/lATE2oF/D/IvVALc5NC26dqTiBC0Y4yr9mrGw7rs+xKEIsOdqrP1Qqx4luwK1cnMUGYU57Fez/LSK/mUT1IxrtY+dEV9tD+5wq8DQMfqIj/sbwSfU4wEh80VpUh3M8HRYT6fn3J8SECXBUMXURrkcx2HaJBLSvIvoQhKmUbHguLvAfjcNN89EZlP+iRMu8y6YbLUWfDtGLI4JphGSnzxX1OiOaWEhxUoavRVMlZ2YOnXA4lcIvIv/Py/obHpzib4Dlj0MQHy2MyiDprsDhgl8L/qA5/iNlSQdyhSgHJXYoypegj9PMoAwuwYMFAb6qnxzvRZZVAUFL4TcaAqZ+d+JK2MXdmCBtA/VjVHjqbXM2jlW7R6GEyy7EYLEnPLb7sOphrq/zu2vMJ8FFt4WHvnBT0CCzaoj8442mKNyuF6+OM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB7697.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnJWVVYvVFRZL1MrU1ZBQlRaSDBtelROWWtFTVZEeWZsRkFleXZBN1JmQ3ZS?=
 =?utf-8?B?bEJoZzNRbER4SCtCTFB6eHEzd2NXaUdteXpTT2tRWmVYVHJIbUZGdjZKUjRr?=
 =?utf-8?B?a2MydVVFUm1OcjFUWVVXOEQwUDFTQVlxV3dDdzFLdjBBZXdPUjFoSGF3K0N4?=
 =?utf-8?B?Sk9wbmxsb25SSzBoNmswdnZ2UWl1WWdIYVI2RENnWVNyWDgzV1RIUTUzKytk?=
 =?utf-8?B?MThqdkhhQTYvUjEyL2ZrTUpLL0VQOHJHVWpQcnZyRzUvdk55TStCU0lqUW93?=
 =?utf-8?B?cVM3cXU3VFdIMGE0Z2UxK0sxZ0RlTTc0MGYxNCsrRHIzS3ZDbUZiNC9yZm92?=
 =?utf-8?B?RnhUZzhoMXR1a241Ly9PUlY2Q29aUnB6NzJhWHlMeW9oc3BkMWFLVTJGdXAr?=
 =?utf-8?B?Y2pnUm9yMDZsQVVNNzhaNlovMGRBS0M2Wks4V0IrMFk4N0V0MG9zdEF0MU55?=
 =?utf-8?B?bWpPRytUZVpaRHhuSFI1cGVNcEllZlNSdDJaVHJ6QWVaK2RLR3IzL3BPTXo0?=
 =?utf-8?B?Y2t4ckxLNCtaZDNMc2NsRFBOQlZGK3pRWWdSeFdxa2ZwN3NkRllaSlFLb1BJ?=
 =?utf-8?B?blRpc1dHZy9rN3U5ZWhqWUlpeG8wNHFOb0NsMHE4RmlINkFFdVJ2ZXpUb1JB?=
 =?utf-8?B?dEovd1UwNXBXMElyZWsyUDd5NUllS2JNRFdJSGpIL0FxVW1mN29namo2cDYr?=
 =?utf-8?B?UUtsUVhac1FMaHFpQk1Ud3ROSlBheFhaK3U2U0c5aW8zcXRyS0hkcVE4M1Aw?=
 =?utf-8?B?RXhrTXdac2VzZm5KdDBiM3dWRndGcGlzeXhWaW1wY0tuM1hkT0lSb2lNTmpU?=
 =?utf-8?B?Sjc2ODBLQU0rY2pqdWpubEZscUM1eUdMTCtXTTVpZDlubkNhcXN2MndqaEtj?=
 =?utf-8?B?UHpYUzN0WWtWVmZVeUVaREVSTmhzN0FhUHp0djVjTEtuSWxzVUlnYmNKK1My?=
 =?utf-8?B?cnN4M21IQVpXSnhCOW1ZbjJ4YTVHRlBMaXNLRVR1ellFU3JNdEZhUkpaRWhX?=
 =?utf-8?B?cDlFakhuaDVTMHlpV2taNmFrUTIrdkdpZlorNnpzclQzTlppU3V5UWdxcTc0?=
 =?utf-8?B?eXRZbDhCMVVwTHk2VW1OaFVkdXA3QStqZjRVZzIxRXFFTktjVG9jT1h5SnhB?=
 =?utf-8?B?aFczUzd4eWRFQnJTbFFZeW5WNWtMVHBvWlY5eUpCZVo1ODFMWlBudTdEZ0h1?=
 =?utf-8?B?TDVkZGU0QkRydENoaUdZblpDc0ZNRjFzb2UxeklQVWxWR2ZjVCtDWUxuZmdq?=
 =?utf-8?B?Sndobm00WHZOMUtTN0ZhdlBlODUwdHpPdnkwWCttSGJobmREUDJGanRMbFZK?=
 =?utf-8?B?UXhCVW43R2RJY3ExSk14aFVNbTNnTm1WV1RCc1lBZDhUQnB4aTdBOVVzU0NH?=
 =?utf-8?B?U2NmdUZpanRScGxRc3FGOWZHNHF6cEE4M1NDNFhhOGZWWFRxWGR1dHdDb1lw?=
 =?utf-8?B?ZFJMNWdDVk8xajNQVDJBMFNDNGtiV2d5UVNjbWVYV0MzVU5KUDl4YlQreFZj?=
 =?utf-8?B?WEtvQ0JpYzk1dGlnSGh0NW9Xc2lTYWJ1YXU2dVIwTlI3OUZNR3lXMG1YV0p3?=
 =?utf-8?B?NlhIV3NZWURxNXlJMllXTk1yMUtoRGlBdFYvaWl6eDhURU1LTElVR1dic05C?=
 =?utf-8?B?NVMrSGpVWUJ1a2RpWTFUek5MU3BHblgvamZCVzFVVjNNWVpmSjRiVVV3ODZK?=
 =?utf-8?B?eG9Rb29Odmkzd2FSNDhWK3VhdzNBRmV2VldTYVpWY1p0d1pkbmlVYW5DU1Js?=
 =?utf-8?B?NTR0ZFd0UkFoSTM2Tk1hQmtlWEsxUHBHSkNqMWZnY2pVTXdSZ3R0RkhRRE5K?=
 =?utf-8?B?VWtWSmhnREYza1hzWEtUb1AveURXM1NjeHdNTWNMbGVncW9uaHdxaFhmK21B?=
 =?utf-8?B?RGJDVlpESllaRzhqRVN3REltSldPQktyazVrNlJLb1oxN2M3QUxGMDREb0Ex?=
 =?utf-8?B?QXJkU0wyRy9zUklHU3NxQUlOZUNLUmFCeERHNzVTN2JURWpDUlVXSEcyb2Jp?=
 =?utf-8?B?Ri9aeHJnYlBtL0pKOUY1R0tGSTJGRWtIRVFWODJKeGFIQzUwTXJMbHhMcnM2?=
 =?utf-8?B?ODR6ZXRHNDJMTU55dFJrZVQxOWdGVmV0ZlNJL2grZEoxZEt6YndWV1JYRk1J?=
 =?utf-8?B?RjZuWWRmem04dlBMVVh6UDE5TEFnWWRSWHVkVlRoeUdsMTQrRWNHSzRjUEpX?=
 =?utf-8?B?c2YyK2cydU9QVHpLMHNTczhDZDJaMERnTS9zM0d4SXFieWNkMWQzNlZKY3hH?=
 =?utf-8?B?NTZ0MWJXM1lZZDIxdWVzTFU5c05rMGhCcXJ6OUxVL0wwZmlSMXZsWGt2MU1M?=
 =?utf-8?B?djU5MjY0Ym4wU1JqdFhINzhiVytwM2lJNnVMWnZOb2lVcTRxZHRWUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76dd53b1-f1ab-4179-1f6b-08de84cdb23d
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB7697.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 09:06:53.0404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fH+icvf05xOu287q3AgY2VUWyWM6kSc0P5Gl7y4sTCDJDuS2LbqQ0gQHa2MT2dK1CPVsxG1IuBImUx5BLRf+bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7745



On 18-03-2026 04:32, Kuninori Morimoto wrote:
> External email: Use caution opening links or attachments
> 
> 
> Hi
> 
>>> Commit 2458adb8f92a ("SoC: simple-card-utils: set 0Hz to
>>> sysclk when shutdown") updated the simple-card-util driver to
>>> send 0Hz frequency requests during stream shutdown, which can
>>> request frequencies lower than a platform may support.
>>
>>> Add ignore_zero_sysclk flag to struct simple_util_priv to allow drivers
>>> to ignore these 0Hz sysclk requests when they would result in a clock
>>> frequency below the hardware's minimum allowed rate.
>>
>> If the driver simply can't tolerate disabling the sysclk it seems like
>> it would be easier to just have the driver directly ignore attempts to
>> do so rather than adding this flag which the driver has to set only to
>> get it passed in?
> 
> Agree.
> I think this commit can help you ?
> 
>          1e1a2ef95b571825ca9c0113f6bef51e9cec98b0
>          ("ASoC: da7213: Avoid setting PLL when closing audio stream")
> 
> Thank you for your help !!


Thank you for the feedback and the da7213 reference.

The concern with the per-codec approach is that this affects any codec 
with a set_dai_sysclk that forwards the frequency to clk_set_rate(). 
Since any codec can be connected to Tegra platforms, and MCLK is 
provided by the SoC to external codecs, when clk_set_rate(..., 0) 
reaches the BPMP firmware, it raises a fault for rates below the 
hardware minimum. Fixing this per-codec would require individual patches 
for each.


> 
> Best regards
> ---
> Kuninori Morimoto

