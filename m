Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010067.outbound.protection.outlook.com [40.93.198.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1512264B0;
	Thu, 30 Apr 2026 09:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777542144; cv=fail; b=pQjBAMS1EPYe/toWxFKpAZ5cCGnjunc3NCWOkEejQewNsk6sue7EgyVAW+DtrU9NkvrEXvFmy0Qzo2NNt/AY8ORxHUOjfMOtizuJMb6krhizNDPf3GygPHttNEZn+rgXOOsj8SlVYIHbsYA+PCeR6uJibNvrKOtV444Kt4FWjac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777542144; c=relaxed/simple;
	bh=0rltcw+eXjGSXlnn/UiErj71LZ3vX15NW8eWkfCWz+4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Ihveyp+JTav00MkJzlrsQdkmwkgxQfj/R/BRx2a6iaaJgaBn1rKifnQLVkilBEwSIAyNVW47nbslxS9M3esKwkD9XygUZclTkm2SZVIp58dwyFe24SUCuGotlJffpuigP1mTV0c1xi9hc4InMMTfeqJvwFrEQzyvZgSAKO88u0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=M8tLyXGS; arc=fail smtp.client-ip=40.93.198.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="M8tLyXGS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jYpA4UKhuifOIRh98qAHKugOGu6psPH9SbWHUXqk5FRPuO4+CRH4MGdO9c/oWuofYTp1n1jVL9KtZ5KSxatK0dl+C6G+Jb6OddTBscB+TvKNhl+V8Gusn+lJhudTR34SCr68R2yqN7DB8iuJVxI9CV7g5zk7Hy8T6f2nxKGjFEmazZLF4UnKm/hsiDU/Ekh7Y/L1NI78oFM9tcAb0l4PE75lS7s31ZtxZ3Pan9fH89XEMdxMFD1al/HLH8swVQr1UQP7c298/bR1UveDTnqMqG1NzHrfycYfR0hbHCnHbx8SxbC9AMN90A3u55PFtsWF2Lb80MHPiMEe9EaqOuMKdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+pxY7CElGsrjS5BgDkpFBV9Ls547EcboMXNUGuOrTR0=;
 b=eKy9Re+XdFahgwj43w+prPWTyItdcrWhhwZZ84dgq6/lbJ0lLjk0GTQQrAyFzSJYHe80Ds0kP38oECdwj39Y+XqgyJWr5NlRCycZtuGP7ycSUltvmSamoqPMXh/7KYhUbN93Vdi1saazRB4UTgkzHGaR6NBsT789F6ZHVXXUTgav4WfuKq+xKVUXRe2h89kR8wWBXIsCoKa36RpZHyQTXIWo3FF0wRKl8zRNajCyM6Lsag3pC2uMup4q2MVVDsBg02Nr0RbBLsYdAchKaEEYd0P/SRfJgefTq7Hl0Q/rf8zywvv0rVCOrb7ZT8/A1FR55SAC7kow/BSn5pqIqJcBPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+pxY7CElGsrjS5BgDkpFBV9Ls547EcboMXNUGuOrTR0=;
 b=M8tLyXGS1UjkEoA0MXxoI+FAoIpCbrYgRt3mdWuAA3kbXy1egnp5H2p6aKdxuUF+kfFHXvBZR2Wv8Lx7j0pNXap4+Bge3N0u6rxMHgIeWysNVsxqB83YGGVWKwYCJJfBaPVTcoHi/XPmLQ0dp3JKzPIe5ngLPwB5Z7wyz+VJ82b1P4efKBIAS9GsQ3tjB2gsioC/TPmNautEvxa9Q4UlADKUTwKW7wJ6nm6YzY5vmM5NITaF2Cvxc2f+XarSX9eT6fSSni/zRdKq1HyG0+aAkV8n544hqbjE3CpNFiXrL5f/lGwlaY6JhzVcJbLHeIjv4Nk33i7x+lX05tIMsRnlcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DSSPR12MB999212.namprd12.prod.outlook.com (2603:10b6:8:376::11)
 by PH0PR12MB7932.namprd12.prod.outlook.com (2603:10b6:510:280::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.21; Thu, 30 Apr
 2026 09:42:18 +0000
Received: from DSSPR12MB999212.namprd12.prod.outlook.com
 ([fe80::5e39:8f96:935a:87ba]) by DSSPR12MB999212.namprd12.prod.outlook.com
 ([fe80::5e39:8f96:935a:87ba%3]) with mapi id 15.20.9870.013; Thu, 30 Apr 2026
 09:42:18 +0000
Message-ID: <f6200923-d796-4ac1-85d8-3ed7383b90a0@nvidia.com>
Date: Thu, 30 Apr 2026 15:12:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: tegra: Add per-stream Mixer Fade controls
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
 Mohan Kumar <mkumard@nvidia.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260429070603.2791011-1-sheetal@nvidia.com>
 <afLv3S6kWnt0D6PW@sirena.co.uk>
Content-Language: en-US
From: "Sheetal ." <sheetal@nvidia.com>
In-Reply-To: <afLv3S6kWnt0D6PW@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN5PR01CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:264::14) To DSSPR12MB999212.namprd12.prod.outlook.com
 (2603:10b6:8:376::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DSSPR12MB999212:EE_|PH0PR12MB7932:EE_
X-MS-Office365-Filtering-Correlation-Id: 788c7578-6de6-4ca8-9b48-08dea69cc4bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	pu0UvfXiMzWG2B+v3QVmC+Za3/u7RYCImQsrKmx+YEupEz74vFlS43Xx0NTmyDT2oZhaMG8RqHeBlRl/lwgT79lR3wsSmF5jAvZ+XdJ/NGUjwd0libX4CXtJbjNaBGDNFfe+e61xgehK8r/J/PsYaPxwbIV1a2ZoLD21RuBclLzhmIwF7uHO+KIV/rTURD4APL+3CHrimCrzWr7jTZZSnvkYYLzvoy8J2sb1iQaS5pTy4NM2DenfhuvDWtmNkewz58nkrD+FcfL17Xts8yZHc6VR3w3uefTqHgPvfyoqhLk26LWyvWMkLZGCOD4GFtBORWsL1Q1qpXKrzn4o56ceylsJ1qyTkbYPoD0bakyvob+h11rlmhdfN6vbI/TqrzTvBLeFS0Wy0qYPIXvCBLsnESL7di7gZcjPVkY6qSzMY/5Ofk2L4aLqSnaA8o3KlxbjdxbvUwvbYScVqNe0WC3xP3rUNNeTo97qr5fQfWbvaCDdYyhfOvBNBkCcXCUZD3dROUxPnoUb9YGBhTWA3vA31bRhoh2OdQJAKa/0PYLfHmgUCG9lfT4beeIbNFlPovoCdtMIRff6oAtf7UnPiabC8U7hq+C4q7s4j5Fsz8RLxf/Xvc5xUv6cG3FhmtInFEk5cz5pZ/uqAJfTcVl/X3LcUvV/vtTKSeeMagHbObu7mOCXdaZ1PTBAGWfU40VUFvz4jhKJFTGuDJtNjJ8oNaZzODGP87om64TSboCt3rCKK3U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DSSPR12MB999212.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3NMRHRmSGozV1pFY0VpaHo0R3VHQUNMU2V2Z01EYUZBaEs1OG01WlFYN0wv?=
 =?utf-8?B?ZzlFQ3I5OTFUUE1BenpuYjZjVTEycG52ZHcrREdtSXU0ZUg1TVROSVZGeVNJ?=
 =?utf-8?B?bnN2Z1VwVVlyajlkbVRBWElRUlNLd2pJelVIaFZDTjc0Yjl6RmtLQm8zdnpE?=
 =?utf-8?B?L1FZMXRXM2xlK1U4RElJbzFQYlF6VWJNcWZ0eFJaaW1vZThWSXF5S3dWYXIy?=
 =?utf-8?B?dnZiZG81dXVQVTUyRHdJb2RHZURpMnh1V3diTzRqMFJkc0ZiRzkySG95NjJM?=
 =?utf-8?B?MkZocG5Qd3k5NWRTN0VwcVJNUEZIdzJicVZaTWZDSFZPczZtbERkWlNKbTF3?=
 =?utf-8?B?V2ZndDVsRStqb2FjV2k4cUZmMzVoL1Z5b3B0OGkyM25yYzIvUVo4VFZQaUJW?=
 =?utf-8?B?YnVhQmUrbUhLNkltSGlVcCtXYzNnVGxVcDNkZXJPYTM2QUJvRWtFNUowWHN5?=
 =?utf-8?B?YWRWVGh3czVOUzlPS0VjdTgreE9mZXczaXNsbEE0dUVCU3NiUzlaS24rNDVk?=
 =?utf-8?B?MWJFN0hUaUZZTXVmeXhSdGhpSDJrTGZ4K0hCeGRPWVhYSHkwd1JSMTBvcTVD?=
 =?utf-8?B?aDFGQjZiM3pJTVVKWFBFMEh4MERZODg4d24zb1d5akZOdzRoQW5Fc0JPbyta?=
 =?utf-8?B?NUZmL3FTQ2FFcjNwcU4wUnRJUCtzSUMyRi9wdkJSVTEvcElHL1FuMUJnTGov?=
 =?utf-8?B?T05OVjA2M0Q4N202YVNmZTNTeWFIREhMdjRxZUZFSmNYR0lja0NBeTlvNS9L?=
 =?utf-8?B?OThpVDZYUTFwMnRSeXpJRzF6RnZmRTFtYU9oWXc4ckUzRkRwbVN6WXdMNHJw?=
 =?utf-8?B?LzlSaEE5Mkx3Ykp4OUM2bkpYTXI4cW9uZnZXZ3VDZHQ4Z1YyRU5BeFBxWDZF?=
 =?utf-8?B?SXQ4UjBWK2UxMi8vYTFXcENLQUN0cDdqRWZUQzc4KzZXL25jdmJNakg5MTI0?=
 =?utf-8?B?T1B4azdBMFRWVlBDQUdZbnY5a0lGazVHYnJPOU50ZHI5bStpTUhsdWY0aEJt?=
 =?utf-8?B?cEtTTDdUR0xGbzhrNE1kYUJ0UUhUT2dTd1Y5RTQrTXREWCt0VFBDU3dPZ0xl?=
 =?utf-8?B?SG53ODd5OXc5MlB3cEYvOW1RU01aQTlZeUNUN0N4VHdmdWVWc0wwUW9sVWhV?=
 =?utf-8?B?OU1vWjdLMWhjampSenNIa1hscnp1SzRaenRFcDhxSEJLQnNLN1ZVNUpEd2ZW?=
 =?utf-8?B?SWpFSDBLN1p4Q0lmTmZESHFPR2wvbDRWeU9HR2pGd2ZsMHd5QnBzVEhDR3Jy?=
 =?utf-8?B?bWdUZEdtTFRlN2lrVklvbnc5a2hOMzZUejk1MVUzVURUdVhzNC9rMEFsUlpO?=
 =?utf-8?B?L0hGU21qNyttWkhXNDFydVNEZE94MXVGVUVpeU8rQmgyNHpId0NreHI2OGln?=
 =?utf-8?B?S083R1l0cEJkSDRFNjFwdk1Edm9RcHdQMkxXVlRNNnJSalJnK3l5QjNRZEds?=
 =?utf-8?B?S1pRN0FnRjJvdEs0YlRmbjlqTGZzYTFDUkRmbExMTTQva0NQd2J4M0tOVE8x?=
 =?utf-8?B?R3hGKzduOXpvdnFhTXVCc0ZSYXR5bFRYd1FhTjY4NWVzeVRVR3Y3SE9tR1dm?=
 =?utf-8?B?UStpTTdiYnpQWVJEU1FSOGl6K25WWjQ4TmpkK01GSFpjdnA3Wk9DZTYwQU5C?=
 =?utf-8?B?WGlGUVZWellUTHF6ZVBZSWxWYm1lZW9mZUNpYmI2Q2ZZNjEraEhOSWM1TDgv?=
 =?utf-8?B?a3BBNDduNDRlM1Jqb2FTejUwYmFiZ01nQzB6RlQ5RWVIZ3hnNUsvTFZEZEdX?=
 =?utf-8?B?K2xZdEs4NGR1THRHcmNCbDdVL0ZJZFA5WE5lSk9xUjlLWWpFa2FhekxuZ2Fi?=
 =?utf-8?B?a0crdmhGdWJjaWF4VGNUS29qRm9pWlVjTHowUGJNc09yMWwxZFo0V3pOdThH?=
 =?utf-8?B?aEcwc0JNeWNIOGgxV1lRa1hiRnpud0lCOVd1RHgvRzBPbGxzSGlzQjZ2SXNn?=
 =?utf-8?B?ckJTb2lrRkdSb21FcDN2dFE4YjNDWnpZTDdCelJZeWJLU2U2dnVpWlRtWFdo?=
 =?utf-8?B?eWtacDJQNHNmdFJJMTB2RUFscldYUGF1Rk9LZnBwbm9TWkxFc2pycSt3S0J1?=
 =?utf-8?B?K0J1dGkxZzRYVkRhUURNRkM1U3l0SmpEMzQ0a3Y5TjNYenR3UklBSVNHRkR1?=
 =?utf-8?B?N0x1VFBoTUd2dUhHeWNvK2ptS0RDNUg2M1VpTTJSTlF0VGRLME9YSnJhQzRT?=
 =?utf-8?B?Ry9Sd0xkNEoxckVUcS91dnMrNU9pUE5KTEZJNmdKNWp1UE5XM1ZkRWZiSHU2?=
 =?utf-8?B?dklMNWx2YXpZS3hLN2Zwai9EeHU2TVY0ZmxaenM0bzJ1cGRRTXQvdFZHMnFG?=
 =?utf-8?B?NGFUUVUrWEVZR0x6U1V5dzdXdkxCWG1CaUdwaldoMDBYSkJsVGREQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 788c7578-6de6-4ca8-9b48-08dea69cc4bc
X-MS-Exchange-CrossTenant-AuthSource: DSSPR12MB999212.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 09:42:17.9943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O9o//6wCdQWGBQmGTVNcvFC6pimtzEm/mTbOz0rTB5y92tMI8/XCKS4zDOsRbq69qQnnxiT9UQywGee9VNAP/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7932



On 30-04-2026 11:29, Mark Brown wrote:
> On Wed, Apr 29, 2026 at 07:06:03AM +0000, Sheetal wrote:
>> Add per-stream fade controls for the Tegra mixer to allow
>> independently configuring target gain and fade duration for each of
>> the 10 input streams (RX1 through RX10).
> 
>> +static int tegra210_mixer_get_fade_status(struct snd_kcontrol *kcontrol,
>> +					  struct snd_ctl_elem_value *ucontrol)
>> +{
> 
>> +		if (count >= mixer->duration[id]) {
>> +			ucontrol->value.integer.value[id] = TEGRA210_MIXER_FADE_COMPLETE;
>> +			regmap_update_bits(mixer->regmap,
>> +					   MIXER_REG(TEGRA210_MIXER_RX1_CTRL, id),
>> +					   TEGRA210_MIXER_SAMPLE_COUNT_ENABLE, 0);
>> +			mixer->in_fade[id] = false;
>> +		} else {
>> +			ucontrol->value.integer.value[id] = TEGRA210_MIXER_FADE_ACTIVE;
>> +		}
> 
> Is the _FADE_COMPLETE state a good idea here?  Only the first read after
> a fade will show it, and functionally it's the same as _IDLE - there's
> no current fade running.
> 

Yes makes sense, will keep IDLE(0) and ACTIVE(1)

> Also is there any overhead to having the sample counting enabled?  This
> is the only thing that turns it off AFAICT so if userspace doesn't look
> at the control we'll just leave it running indefinitely.  Perhaps a
> timer to disable might be useful?  It's generally a bit odd that we have
> a write to the hardware in a get().
> 


Rather than a timer (which would require sample rate tracking to convert 
the sample-based duration to wall-clock time), sample count will be 
disabled before re-enabling it in the put callback, ensuring the counter 
restarts from zero for each new fade. Does that sound reasonable, or 
would you prefer a different approach?


>> +	SOC_SINGLE_EXT("Fade Enable", SND_SOC_NOPM, 0, 1, 0,
>> +		       tegra210_mixer_get_fade_enable,
>> +		       tegra210_mixer_put_fade_enable),
> 
> Fade Switch.
> 

Ack

>>   struct tegra210_mixer {
>>   	int gain_value[TEGRA210_MIXER_RX_MAX];
>> +	u32 duration[TEGRA210_MIXER_RX_MAX];
>> +	bool in_fade[TEGRA210_MIXER_RX_MAX];
>> +	bool fade_pending[TEGRA210_MIXER_RX_MAX];
>>   	struct regmap *regmap;
>>   };
> 
> gain_value is used by the existing RX n Gain Volume controls, don't we
> need separate data for the fade controls here, or should we just have
> the new Fade Gain controls?  Having the separate controls is more
> complicated.


The existing "RXn Gain Volume" applies gain immediately on each put 
call, while Fade Gain needs to be staged until the Fade Switch strobe is 
triggered. Sharing gain_value would break this staged semantics, so a 
separate fade_gain[] field keeps the two independent.


