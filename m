Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010071.outbound.protection.outlook.com [52.101.201.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0273446CE;
	Wed,  8 Apr 2026 17:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775669942; cv=fail; b=YKy2ZDd0ZzY4oLQOV2B7fG9SAPryhBD86S6Jkv2YSMqE7DaORJMe1jrMoB+BK1UMq94nTxQ05ytjC6D5Ut8gRiy69FgtMCz6DeiKy+61rXmGGZP4VVpwtYIeZ0stIpSVZkbO7qNtfywgU81J3R/94YK+CdE72fdQXrmLPIf9/y8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775669942; c=relaxed/simple;
	bh=iIPUytMwmu4BY4F8zb9SKiIUytgNaCEf/DCoymZ0F30=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uFGj/f1Pewh3l9DflHnExINaUrJR/tCIWlEC5d8ppeXcMF0Vo3UNnuT/qwtGTYHl1mVYsKQA7zfOBrCrLzwy5mQwMfyazuu1G+1CUUi5YhqbzKMMeHI0urOaQ6wxNaL/BbvFeuF38HvD8qnu2l/tpx2s3ANfTnXTvgOI3t5TaKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mcLwKX9l; arc=fail smtp.client-ip=52.101.201.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mcLwKX9l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u5muvZt5BZMDvBbzr2A8EjofYKj9CkEmQFeWrRhQXdZmwcekzd6XinejOF+ydfsLpZ5LJBnSNq4W1WdfIDFtHhUhvG9PoC1c/XGVkjgs7FW37eOgWnFAK29/gQ4zdtIf4jIyrGRHlGZ2JaOQBS0IJCUDsq+Bv04YmzSAYRf9x5/TSTJAPNAi4gDZFbcgTCEQr4IC5DdlGv7DVeZNHN5QWm1GqZwYztsOE2NM7iWcBZDYBC1Z6iP2XXQWSGLWZ8g7euGFMebfYXVo9Q4A8sCMYLHVckKKcTttNWfH2eez7NJLw3PbrqCydMNWNGEMgAYRkzT0WvLsY9NJGUUAev3NYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqC8fsyMI06BG+isthq57QsJpC3R5UO7DntMtzI+VBI=;
 b=Su2rPEDOCJYRhJ54yGncQ/8Jkn2u29ZH9BDzsUrI7x6WUrH6MUh7jDR/ieB4QjFo/gATI0XBHlhZA1und1oLkeBkmLfnHkrqKp4D+ewiuuQhskYPVAmNP8mve+cc/3cWaP/nXKw5KeIH89XLA/sXq9ufK4depfxHt8hCbLuzDLZp+ydWkZLwEC38yPcr0dhw7bbJZAZ6Rnq5XdJUCAgLtYkGwwXSpZVurEgB70leFhdwTk3N7nx0v+b/gmCVAKRCkt2TJEA6SCE5GOFkEhlNV1vVCpKdPNlzBa+YrINKMbRNG03o9o7dM9Sq5FwX2ZKHtJVaO3GTkO+BJ9mr209GRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqC8fsyMI06BG+isthq57QsJpC3R5UO7DntMtzI+VBI=;
 b=mcLwKX9lv7UN2HxLCfBaeuCqBcgOHP/QXV78Alz/54c9UvIExhITIKnT8CxgEvoFJrB1/81HEmdFFdv8ivLLs0JziLYkKN83GtzPcOJIUb5b+RMeHa3nJpUzNE6Wvl2Hi1pV4Q8S/xlEZaZOPa/Iy/RQyO7KwHB2f/aJ+c3127csa+3TdHS78OAN7X1pFSXMitXHyRcNokehGE4aceLYwzr7lY3tQJGbPPUyqDBwKdISjkGpbpDnGl4K3LZhsiA9ToJw4wCVX3p3kRlOok8Nbdj6X1f6axBF0z4vfqprRYmr0MCmXG4wmVZ+DE057BzBItzUifw4XiNPXdf9b48MWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by BY5PR12MB4305.namprd12.prod.outlook.com (2603:10b6:a03:213::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Wed, 8 Apr
 2026 17:38:54 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9769.016; Wed, 8 Apr 2026
 17:38:54 +0000
Message-ID: <f837da45-2b31-4788-a957-085d3f0570d0@nvidia.com>
Date: Wed, 8 Apr 2026 18:38:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] ASoC: tegra210_adx: simplify byte map get/put
 logic
To: Piyush Patle <piyushpatle228@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Sheetal <sheetal@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260407170308.100238-3-piyushpatle228@gmail.com>
 <20260408170818.70322-1-piyushpatle228@gmail.com>
 <20260408170818.70322-2-piyushpatle228@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260408170818.70322-2-piyushpatle228@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR03CA0156.namprd03.prod.outlook.com
 (2603:10b6:5:3b2::11) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|BY5PR12MB4305:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a9a11c8-df93-471c-b0bd-08de9595b450
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|10070799003|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	j8t8rtW6fM6KMM3uowm1UcGMSLZAcs1UTgUE+zxAYsw93QCncOS/kyFW1xffzw45Eog/L8wDtAr0GdLpz/G16AiEdcckxhcrNuUozoO8lCqiDZ4oT3NCoiyonWIEEzRBhtQCgAicBmcX83FZWsCUSjPFrmQi2vrIY+ec//KIefWxqbj2RFRq/2YuQHQMuKRP+c2XO6l4ub92c/6DLTAhIVbXm+URGKdqJQgRjsyv61b9OQE19oXHnpdLO1BiSWJMjy8foPc/N2xaUVPtkOhIOOkUVXCXRych+FfabwjTpHQeexR918DdDU2sF8tTxL7Xj+dSr868k4m9yf/oEn5U/Us7kQy3xj/ME1AJXasF02JaTm5LMhk6n06Fu0caF0ynmV+2/Uu/lK/OPx4jY3gkfvr9cwVXYfR+KHWufO6kEHiXhoxoKrhJr7btSMlPj/8jPJmiOm31eF1YTQdNpomYMhEWvN2noWyQdGEN2KmH4mEf53P4pRr66XdblLixJ/nK0ZwYvOflZUnlB0djaR0o4UX9sfoy2BoXdcU7h9Hsn/uNZ0N5szKwRY0k5XaKSeyc+3f5gEn0G4wP91MzQDSktZnrbwhUEX9JAoCViNXQ9p1RKFs/FDbkQsM+4YMcjPM3RWP3AwVO8jwm2j+briny1jlwVE04UBlTTkANW3BhXHzD259R/uxAW7kUSzUbKIpCQ5kKbqCdvGHPZkiFgE73963eGprGBHBEP87Rx2AGKR8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3FSL3FDWWxKY0djeFlsbURHRkp3c2NlZktlS21XYllUbThhQTZMekxycnN6?=
 =?utf-8?B?Z1JJQmN5a1hqdWx1VTYzdHBibWlVYllVeGJIblcvOU1vRzBQZVJTWDlQMSty?=
 =?utf-8?B?ZXE2aTRuUjlyQVhDNW9senRISnMwckplQjlmUVY0VUtpMjhFdkNqY0JGN05D?=
 =?utf-8?B?SUQxbFZGQldzdUpZRkxFeU9Db3JYYkhIRC9uYklyMWFzTXF3c2p6c0JUR0pv?=
 =?utf-8?B?YnFxZHlVanVQZlVIeGlwUGVLNjRTdUVoZnowNVBiT1Fjd0d3OUYvVi9Bc0tw?=
 =?utf-8?B?ZERLRjZtejNuOURiYlZuS2RDSHMvUjV6MWZoRnBOd2tGZXBDOUltWFZrajRr?=
 =?utf-8?B?bU5TVXlMYW1aQ2poL3JUbS9FRHJ3OVVrbVBhYlA0S1ZZQnM1Vis1Qkx3UlFy?=
 =?utf-8?B?c2U5WjRkN1RhWElIdm9iRkhmTE1aNWVWdGRaem5jRlpQeTJBRU5GbTY3UUdK?=
 =?utf-8?B?d2YrYW00cVBpcDlkSEhZZi91K2dzUWpDUWZNck85aTBOZ3paOUFra3FjdUJ2?=
 =?utf-8?B?SElqRlRxL054TEpkaCtMV2FudVc1TXZWbUIzWVdLMWFYditTN3o5cjNzbzFh?=
 =?utf-8?B?bTNHcDVsMmFiQzBsbVNIUkhqOTIrUHR5WEZSQTMzR0JZL0pHM2tBWG4zbHpE?=
 =?utf-8?B?djZXOVNPeUc5UEFpZjNmY1A4VVRBZ3FUMHgrK0NwNXlLMVQrbmFZMXFERlU2?=
 =?utf-8?B?T016KzZldWg5YkxwYTA0NVgxOHhqQzhJVFRmcG1tclR4U3h5a2k4NUs5bTQ5?=
 =?utf-8?B?MTBwQVFNV2MzZEJsNC92MDUyaEtiQmhsSHNMK1lXSEJrUER5RXZXOFJRZEFm?=
 =?utf-8?B?aUlkNm90S3ZUSjlDVVQybkExZWRFZzlCaTFtcmxmL3BOaHpzTEdQRk1CQ3ND?=
 =?utf-8?B?VG5JR0pjVU1QcGZFV2VyNHFWRDRmYWtmZTRBdVcweTFPN21YMEV0cFVaeis5?=
 =?utf-8?B?V1c0MU12QncrZ0NaeENBS3YvVFZOeUxyL01adWVTVlVPVFZwZzFQNWVqbm9i?=
 =?utf-8?B?M0dQOHNGbkMrSlZraEdIMWdBNUhkWE50TldWaDAyVkxCOFBVTmZUUUpuL1Jl?=
 =?utf-8?B?cUdJQlZJRU1velVCcTh0U2VtNzEzdm9uYUwvMkpHTURLQWdRVVZSRWFNTFRW?=
 =?utf-8?B?ZXZxUVU5aitKZFMzb2dIM1grYWs0ZGJTeGZUNlpOalhHTEJGbDhPMzNmeUs2?=
 =?utf-8?B?MHpXT0VFMUZtc05PaEEzQ2FwZ1k2ZEQ5ZjcrVktBMzgxSUtwcEJmWE5Pc0ZK?=
 =?utf-8?B?cWtwR2tmUGhvVlNFekFiK05WaHFVaHhZWjZ1SlZXNzZCYWluMVB4TW9oWVQ3?=
 =?utf-8?B?VDFLbU1YNWZ3MzBKdk5tOEhVREtnT2Z4ZC9Uak9LTm9va2pZWFkxUDB2Qytl?=
 =?utf-8?B?bEFKUUsxdVkwcHRSSFc0SFpQR0hXaCtrUU93NXJ0cGlqTnQ2U1JadmZmUity?=
 =?utf-8?B?bnlqVVhtOGVyTHhpNE1ZVndncUtub1dOaVhybmlwdHUzUTlPZ3lIY1NLTk4z?=
 =?utf-8?B?L0FuV3pXeXV5NTloU3RYSWVBVXZYeFA1RmdTcG5yS2MxSmMzNkhwWWFIZkNs?=
 =?utf-8?B?RWJQRmduZCtUM0xjNUdsUy9MSk5QYm00Um1SOGJlY1JpTmFweVNiVXJmcGYr?=
 =?utf-8?B?YUFwTjVRbkY2Umw5R0FXS0lHcnlESUFTQi9jRHRoa0tGQTB3ODY2ZGMzcWpN?=
 =?utf-8?B?TnRJWUUrbHlLZ3VSdnU4SmhqRjJWM0ZhWE5XTGl2YitJeHBoSG5CNGovS045?=
 =?utf-8?B?MkpnM2cxSDFNMUh2Vkd5SW1MeWxSOFpuV2VTNkFlZWY2c0ZZNGlIUEJJWW9Z?=
 =?utf-8?B?QmgycEY3dGp6YkRJQnpLUW1Dc3loRHZXejdRZU9hKzR3d1RMYzF5OXBJcm9s?=
 =?utf-8?B?SUZBbDl4SXZTMWFUNHIyaUE2bUcyTlBNSjhxT1I5cFl1Lzg3azAxK2R2WjEw?=
 =?utf-8?B?OCtDK0xyb2o0OHBnZGdONlp1Qi85aVFmeXpHQkJuUUJlZm95QkNYaGhyS3lV?=
 =?utf-8?B?eEJTYytaU2U3SlZ3UkdJR1pFNXNiQWdMby9tUFUrSlFjbXZXVzJVMm1Sd3hn?=
 =?utf-8?B?bGxtUXpQM1BGWjJnZk5weDRXNjNuS0E5OUpyTmdYZlFCY3F1UjEwNmtSaFVL?=
 =?utf-8?B?K0JvSkttSDdneVdpQk9CM3o3SXlIQ3ZMMmx6SW9aVkw3dmNSY1dpbTFReGtM?=
 =?utf-8?B?ZzlSVkw5djdSdlMza3VQMDQzT1pzZjIvS1pISzhTL1V6V3RFb09HZ3hZQnpS?=
 =?utf-8?B?THA2UFJzbWlpM3BkUDF4a1N6ZkNSRWQvaFZwK0xqSW95eTdJZks3K1pkVGsr?=
 =?utf-8?B?THlSTlFGVjNqS0dscGg3Tjk3MEFrQjA1czNGL1dkNjRtOThRMENyYUxqTkkz?=
 =?utf-8?Q?DU53JvLtwzHQAX4RUTrEeSl3rVB519j2vY1wC0Risfrq7?=
X-MS-Exchange-AntiSpam-MessageData-1: yDyLufoSTNv8Nw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a9a11c8-df93-471c-b0bd-08de9595b450
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 17:38:54.2075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HZK46dX5Z06Y/nJbhat5NaCwlO9344gwvLIS6+uXFHNkv79Rv930qHj1wYMSI5lOD8yrT57DyVpUMI3BRizyuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4305


On 08/04/2026 18:08, Piyush Patle wrote:
> The byte-map controls ("Byte Map N") already expose a value range of
> [0, 256] to userspace via SOC_SINGLE_EXT(), where 256 is the
> "disabled" sentinel. The driver stored this state as a byte-packed
> u32 map[] array plus a separate byte_mask[] bitmap tracking which
> slots were enabled, because 256 does not fit in a byte. As a result
> get_byte_map() had to consult byte_mask[] to decide whether to
> report the stored byte or 256, and put_byte_map() had to keep the
> two arrays in sync on every write.
> 
> Store each slot as a u16 holding the control value directly
> (0..255 enabled, 256 disabled). This is the native representation
> for what userspace already sees, so get_byte_map() becomes a direct
> return and put_byte_map() becomes a compare-and-store. The
> hardware-facing packed RAM word and the IN_BYTE_EN mask are now
> derived on the fly inside tegra210_adx_write_map_ram() from the
> slot array, which is the only place that needs to know about the
> hardware layout.
> 
> The byte_mask scratch buffer is allocated dynamically using
> kcalloc() based on soc_data->byte_mask_size, removing dependency
> on SoC-specific constants. The byte_mask field is dropped from
> struct tegra210_adx.

So this was already the case. However ...


> -static void tegra210_adx_write_map_ram(struct tegra210_adx *adx)
> +static int tegra210_adx_write_map_ram(struct tegra210_adx *adx)
>   {
> +	const unsigned int bits_per_mask = BITS_PER_TYPE(*adx->map) * BITS_PER_BYTE;
> +	unsigned int *byte_mask;
>   	int i;
>   
> +	byte_mask = kcalloc(adx->soc_data->byte_mask_size, sizeof(*byte_mask),
> +			    GFP_KERNEL);
> +	if (!byte_mask)
> +		return -ENOMEM;
> +

Now you are allocating this everytime this function is called (which 
happens on RPM resume) instead of ...

> @@ -700,16 +706,15 @@ static int tegra210_adx_platform_probe(struct platform_device *pdev)
>   
>   	regcache_cache_only(adx->regmap, true);
>   
> -	adx->map = devm_kzalloc(dev, soc_data->ram_depth * sizeof(*adx->map),
> -				GFP_KERNEL);
> +	adx->map = devm_kcalloc(dev,
> +				soc_data->ram_depth * TEGRA_ADX_SLOTS_PER_WORD,
> +				sizeof(*adx->map), GFP_KERNEL);
>   	if (!adx->map)
>   		return -ENOMEM;
>   
> -	adx->byte_mask = devm_kzalloc(dev,
> -				      soc_data->byte_mask_size * sizeof(*adx->byte_mask),
> -				      GFP_KERNEL);
> -	if (!adx->byte_mask)
> -		return -ENOMEM;

... here in the probe function, which makes more sense. IOW I am not 
sure why you have changed this.

Jon

-- 
nvpublic

