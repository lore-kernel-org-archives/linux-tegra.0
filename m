Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012032.outbound.protection.outlook.com [52.101.43.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217093016E3;
	Thu,  2 Apr 2026 08:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117821; cv=fail; b=Mf62kz0QUDwmB9bHODFOd+UR5SAEBxtsbDWDk1LXj0d88daVSVZOy18jn1CNbAUB+lzCSnoofJ2NiV8IbdNNyPW/y0pt3uD+bmhReMzB47aI5TpVza89Ys9qS1/7Ad0jS1NObYw18PkzqwSgtXFxJeFDBy/flz26xpO1rO+2QEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117821; c=relaxed/simple;
	bh=Lrg3LSgaNTtewBBYMgbMr0PuB/ihRnmOzLQ2NbKjZlg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PQOtCQ2C99B25o/Foq1kwBHSIspdjKxHwiekXlx4kFV081CvYOZ7Mbzg/VfGj5MRBFqyYYtVlr0dyxQj35U+RM2QoovNvBt2+flOw/xg9LZLsorK5OtqC4zfcl6cFrNWzP2VOxODQIr6OwALXH07hKZErKs07xJFRHOYby4K6ww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LUBVVBeS; arc=fail smtp.client-ip=52.101.43.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LUBVVBeS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tl8YZ7ZWrbV3DLJIQ4kJ9vd+K7SHWZ3o2sda1vF+4vii2PnBrCVue6D9/cds8E0FVEQyKLcapndNMyl9Cod2P1PWQTMzuywQZsfP2/2X6xywZh3+YDUYXPk29y7SdW/cGn1di/zOgFGzdvNLfLFlpIuDKJVqRi051S4FmTm1OfzjWee1cWfjtC+rSYwpmAEuILRiopAEuVeOakCtS1aI0+U4gUp9mz8AJiNzEguW0LccvZOugvaIO/37IXyfqPblJ3EB60N1F+j1jQFBmibx/T62ZVniUq5dQO60QHvpU831wL0emPfJZHGnx4NhQy5mYvnnVy+g4VSsmDeZAg24xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eBrJXJvqi+qBcTR/t/tBnaD2queqt0hBxSVrf/Izy2Y=;
 b=JUdGZDc9k5xQDLTnJA5L/ujVcBumkpUYtCTN657bw7R0qvl3OTL0sKyoJn3e0JUrVcrPbE6fc+i/T6cjDjBjPacwmuJoM9prT8jQwM6u/cWVcfIgax7iyCii7v5lcnO8lQfsyEyHRQc4gTxFMNAIv6YuQb9PIL/S9jMHMHOBo2jJnlbUuWyQcP9UTuJO1nPbMUvzMyRBOWk0JmXTl2OvapSR5begcb7AhlsQbjCYc79JxmKMItjZdFZi9lKoGz2e339ezE9VwJbMGEMUFfN7dp1MPpMbNm7Yv/dXDeRaHqowLWQB/69nlLdLjLzWAC3tKV42D6OH/4SwbsKktudWtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eBrJXJvqi+qBcTR/t/tBnaD2queqt0hBxSVrf/Izy2Y=;
 b=LUBVVBeSStfPMhloAaldJAEFdLhfBvAjGBNAVXyilen6saYUuzFoUZ7EDcxRTGZqh00cetWMPLmnGh5/lynPUokc45c0Ncgp594uIQdUexKoMGEdDjOsfoCgSuNJ4GYEmNjx+PMYuCncbIUvX4h+bAkVXCVbqtcFRcV1xAvgs2DXEo7A7AQTC3f98jOn+xE3r4MpcGAafhrZtmXbo2eYBorquaddyfbeAM6jYgdFOYAIywfya8dIrlTp7vM9ILPEgYPFLi62S58EsLPObOXVtH2tBruEvq5ZH5Ser4X7Rj6yvGnmBxczi1En1k1TLIn57dILk+l83ZFY0urdQ6lRdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by DS2PR12MB9776.namprd12.prod.outlook.com (2603:10b6:8:2bd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 2 Apr
 2026 08:16:57 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 08:16:57 +0000
Message-ID: <480eb30f-774a-4f1d-bb70-13c1b771561b@nvidia.com>
Date: Thu, 2 Apr 2026 09:16:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: tegra-aconnect: Use dev_err_probe for probe error
 paths
To: Sheetal <sheetal@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>,
 linux-tegra@vger.kernel.org
Cc: Mohan Kumar <mkumard@nvidia.com>, linux-kernel@vger.kernel.org
References: <20260318071129.1758058-1-sheetal@nvidia.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20260318071129.1758058-1-sheetal@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0168.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::11) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|DS2PR12MB9776:EE_
X-MS-Office365-Filtering-Correlation-Id: ada7a8dd-ac4a-461e-1f71-08de90903533
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|10070799003|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	h37JqX8phzILiOV8AqHDgLSpePEh+88kg9qJrXMrKisPAx0B4KRx5FLlmJx3xNFIsxCwIF3ugyIB89tdDG4MVNppFn6njAbImrLX4K0yK0jpJj0/eAV1obfbsTP8QWahmVw8op2HAroRAOzh8jyAJHk5GT1X8e0atl/GwAkI3QgshDSeSTkWVgniwsyUpbCTPbFb+2jSv9JouVbdl4MRwcEm2ws04I75GtmGeD+LhXRlW4lcsYJWFDiTJF95yaxw0RvifXnkD5ChsCZGn2eyK1XfyPbG39aJ2+FRxKlgGi92vvT7RSJY7u9m21H1gNMhFccAzjHtxPL1EAlXp1dvMHhirPa6oOfSoDBgvK1KM+31B7zCqJVgSQzrUiVcIpjkNVY/uolcvUAM2ja7sQOF/qELWmDsiJ0opj6HHdydWdTTc2o3mVsPaOGpp7UkC9IlJV0F43DAvpRwoFZiMTQkMDn0xKdhZkVNpf3npNjrj1sJBJQ8qiKh4k/Vu6CxebwUDQGk36FFnwhxWxbOv7PHtwsNM/xqRIEltv3T0x+j1PGY3CxUB3vAxXvlIaB5q3D/+1gGibIvhqnNRayBz+cZ/gA2HhJOTPgweXQurax3rDXOL97Y7VKQHUjFZkG6z+LAbO69eo2vcZ8/QQTpNFitvSGWWts+v6X6TY7inBmpxcv7V8JqYbEn8v+w0bV2zH8ooj10oveziEvMg1AWRyXBBxd7rSE/yg6/ktIn3KL+Plk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eW03QUNLUmp5eDFMRG82MWNGMjg5NFVwKzdkUWJFczQzTGtRVU5sb0lNbnls?=
 =?utf-8?B?c2R4Zlh1b3lrZVIwQ3lWUjVWajhmR1ZFbTBLWjQzaHdhaUxyM2R2aERHb2hJ?=
 =?utf-8?B?Y2lIM20zQVh1RHF2Y2xQMEN0MW9KWWU2aDJXSzdrZnEzcU5IaGhRZFozU0tu?=
 =?utf-8?B?SDgrbGY5NUVMaGtaTVFNSTJRVFNQampzVG9xcTMvSFNlK1A4dnhybjUwTEFh?=
 =?utf-8?B?RlJlUUxrM3gvTG5CN1hGUWNvTlF1YkVhb250UHpsTWJUVjE3ekU3YVRKajAv?=
 =?utf-8?B?OVFXL2U0eHJlZThta3ppMjB5YU1RNlQyL0pZNGdnWFNRUksvZEViQ3lVUFE1?=
 =?utf-8?B?Y1d4empobW01V0xKR1cvajFhb2I0ZTBTMnEzc2JERHQ0NFFKbUlEa0x6UEYy?=
 =?utf-8?B?ZVRUWm1UNGdSa1Y4aDJoQ1F2ZUJYeXQxSitYbVkwRUszNnpUSytBOUpJN3lr?=
 =?utf-8?B?VjU3RDBtY2NPdkErVVV4bUowRUp5QWdZM1Vmc0hKZVVJZUIzVmpRQlBGc2w1?=
 =?utf-8?B?TjFCR3hQTTdZekY5dzlrSDdreFZUR2kvNzlFQ0d6UmVXN1AxaEd3dG1YN3o0?=
 =?utf-8?B?S2dwZUxRR3lOVXJiY0RSaFIvaXl0bDdnYkhqUkwxdGxjZk54QkNXYWM5TmRI?=
 =?utf-8?B?WWhGb3h5MnhjSnJKR015M0dPc0gwRWpBMGhOOGxXS2gwRXBybit1RmlXTXoy?=
 =?utf-8?B?NHUwVm85dldyek1UcTBuWVFtZXdhVEtoZDZKQ1c0QnY4YXQyc25qanBBZFAz?=
 =?utf-8?B?YlBxQkpuWjBGME5LTHdZZVBtMUtqYStDMHY0Y1poQUxBVVp3bk5LNEQ5ZHFK?=
 =?utf-8?B?aEJNdFBNd2ZPR056cjNkeXZORXBCWUJPcWRzUUgxZ0dGemZjMGRPVDJjM3k4?=
 =?utf-8?B?RkRQblF3OHU2TERWckY5bVdkTVBsbXU0ZUtTTDVrbnR6ZDBEZ3hjaFhiRW13?=
 =?utf-8?B?TUFXZ3NwUlNseGlpTVlIVWoyYWNFYkhHeWhXeGZleHBYT0JnUDZLcVU3ZHR2?=
 =?utf-8?B?MFBjZGdCM2Ribk1kZWNtRkpCTGpYeGlyN3FyWVV3N2xpNm52dUNmRVlLY0w0?=
 =?utf-8?B?WnJrY2k5bC9SRkp5RGE0R0VONXByTE1yVzB3RncrOFpLWnMySXJSNEgwZG5Z?=
 =?utf-8?B?WXYzSlJmZDRPTDhsTjBGaE1iZTg4cEkzRU5YZko3WUF2N0JTVTcxNDVmNVQ3?=
 =?utf-8?B?RGE1QzNwaWJSNXpPTFBUTTAxYVdiZkd5RjkvQ0ZEZnJyTmNXZmN2azlZazho?=
 =?utf-8?B?UFB6WkdGNjJJZk1YUk5ETHFQM2xGNnNqdlhZVzduaXovRnBsQnQxeEwySkNp?=
 =?utf-8?B?dFRGWG84ODRsTWZwNFFvNTcxZGJ5WGJhVVVTakRBUWg3UlpsSE5HZ09ZZnR2?=
 =?utf-8?B?c015RXh6YlBRVU5iMjJkbEFHQzIxMSt6MmlhQXFxT2cvY3F3WHdUWmd1U2wr?=
 =?utf-8?B?ZlVLblZJcGtjZ1BBWmFXWmFLdDlkZ1REZ1R3NGRhakZHNnhCRCtoK1RZdkNp?=
 =?utf-8?B?aDAybEpSNkN4TGxBVnpNeEpadFhxVmFGSjF3TEhXd291WkJ0R3RNaTE4S1Jy?=
 =?utf-8?B?RFgrcW9iTnhzYXNLUHQ5eU50QmVNMTJNSnZwdjZEMHkzZ2ZBSEtQT3IzSDVE?=
 =?utf-8?B?dHg1ZHk0di9IN2Y0RkZDRW44ZHRyTEFTOGhnbUxyNGphWS9WTndaWVg1WU43?=
 =?utf-8?B?K00zMERucTlMdEdKVmFKcEpheWViZ3J6Tm1sclBxZEVtTkVhc1k3UEZaSDlR?=
 =?utf-8?B?NFlaLzRSaERyZ0VINEhYR0F4SWpzSzRVR2FpczdSWm05cy80dHVPR2FmemFm?=
 =?utf-8?B?ZXRIOXYvZWp5MkhBN2FSMzZWdjJsRmx1U1VNRElQeTNEcjVPaGQzSWg4aUNE?=
 =?utf-8?B?QnVsL1Q1WEJjcmVhbjNjWXJvQWhhbnNRVDNGUnRLMjNqemhOZ0NDMkZzbVI2?=
 =?utf-8?B?cFdKT2Iya3VjenRUSTBva1hhTCthN3NyQk5zeFY5ZTdVN3JEdzNTQnJrcVVY?=
 =?utf-8?B?c0h5VllQekUrR0grWlhTTHZub3hHQS9lMnFDR3Q4VFFWUHY2RHRCYU5qL0xu?=
 =?utf-8?B?T0dJSjkvYVNSdTNhcTZJNVF3b3ZEZnJIZkJ0bVNjeUplSU9ZRUl6N0lRWjUr?=
 =?utf-8?B?NVBQUWw3dGlTYlNlc2Y2UjdGa25rZnBObVBUaTcrTjNJMDE4TmhMZFluK01O?=
 =?utf-8?B?aGJUTDQwaEZweVNNSXA1emJtaGU5aGNHRHdTZTlSTncvMWtxVnEvcUlUTk0w?=
 =?utf-8?B?QzlqWERzdEJLU2hSK2ozWnpObFhZelRjNWFDTU5menBPejc5dU12Wk5tY2I2?=
 =?utf-8?B?cjBjN0NiNEMrL3h4NWVrRW1VNWt5eDQxMGJHVWIydTdpS1kvaTEyM0U1QWhl?=
 =?utf-8?Q?hxWFURef7DVfwa0TaQTXkOPijJ9GKjR52NGV3tXqkZKjY?=
X-MS-Exchange-AntiSpam-MessageData-1: LgvVb0nu3Uyl3Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ada7a8dd-ac4a-461e-1f71-08de90903533
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 08:16:57.7359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9sn3Z0lEPGvJbklb+G2SpwFOCvCLIYVD60UJnZoJiYlfojLzgNnESQZCjXyLpwXyUqy9A+dlAT9V1QkwOm4Ncg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9776


On 18/03/2026 07:11, Sheetal wrote:
> Convert probe error handling to use dev_err_probe() which provides
> proper handling of -EPROBE_DEFER.
> 
> Signed-off-by: Sheetal <sheetal@nvidia.com>
> ---
>   drivers/bus/tegra-aconnect.c | 14 ++++++--------
>   1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/bus/tegra-aconnect.c b/drivers/bus/tegra-aconnect.c
> index 90e3b0a10816..9b2b227332b2 100644
> --- a/drivers/bus/tegra-aconnect.c
> +++ b/drivers/bus/tegra-aconnect.c
> @@ -32,16 +32,14 @@ static int tegra_aconnect_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>   
>   	aconnect->ape_clk = devm_clk_get(&pdev->dev, "ape");
> -	if (IS_ERR(aconnect->ape_clk)) {
> -		dev_err(&pdev->dev, "Can't retrieve ape clock\n");
> -		return PTR_ERR(aconnect->ape_clk);
> -	}
> +	if (IS_ERR(aconnect->ape_clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(aconnect->ape_clk),
> +				     "can't retrieve ape clock\n");
>   
>   	aconnect->apb2ape_clk = devm_clk_get(&pdev->dev, "apb2ape");
> -	if (IS_ERR(aconnect->apb2ape_clk)) {
> -		dev_err(&pdev->dev, "Can't retrieve apb2ape clock\n");
> -		return PTR_ERR(aconnect->apb2ape_clk);
> -	}
> +	if (IS_ERR(aconnect->apb2ape_clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(aconnect->apb2ape_clk),
> +				     "can't retrieve apb2ape clock\n");
>   
>   	dev_set_drvdata(&pdev->dev, aconnect);
>   	pm_runtime_enable(&pdev->dev);


Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic

