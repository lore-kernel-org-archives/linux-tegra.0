Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012056.outbound.protection.outlook.com [40.93.195.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EFC415F30;
	Wed, 23 Sep 2026 06:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790145430; cv=fail; b=t1OzMV3q7hFYATN5kDUJvXNItq4aFPT0V4+jOPISR5HwE0WNLanG2pkNBtq9NqLvU61pvWTxVgOqnXj7RRwjNjkF17kjVsZB1XAMGJk36MB1LGM9OhIzV5lQAJvztd+m3EYU4zcE6FTQsR1EPc5T11bSfRfyz00O+tcW7MmCsck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790145430; c=relaxed/simple;
	bh=OdIjxEwrTO47dj4cGifS8/7+5ZakvHPLUkkQcXBvDzQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lvQ936yBou+AnSO/3duNibbLk+U0b2KOzqOsoI++nqEli+H4bmtxbQFa8N1gnjaM+0jn69VCjHO9Y8eDWD9J48WPl3+DFJvBpgMtIuzFFHl+MPAINwwpBr7hn44JRW0TEaDR7PvLphy1bW06tUlORtnmbjxPyTvj67GHKnp2Ivo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=e/8Kl1/w; arc=fail smtp.client-ip=40.93.195.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="e/8Kl1/w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GC0ajB0YBcgjS0Nl0kY/hcLtJbLJ+vxA5/S+S1L61legTUniaFQPkTMgn1ia5ht/TDAOSVbMvu9/1F6UYJvyjXxTZlBqMTKJD0DxzMbLiiNTWLTzA6DDcXSA3N9eD64nVsSVrML3vHyoKzcdhCDPNWDMI4pSBP8X/NXJBPdmOIBF7Vr2R8umCqDKBonF/33KAMZU9TgT732ARph9MSNFNM8G410xum8Sj2GpNIZP12oCExsFwgUOi3b5d6UKjqih8FjnC7iSL0QnHxgVVXeoDYbi1EUyj2AMh914AxjpyzxlfAP/aJFX9HBYqpecuREqSQQ4V7/+uPhxq7UAeQFOrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPopnA/y/SJiLkKSTtzUyn7NJ5MvCZBdzAnPXKVokWg=;
 b=iGcxOdl4GnoIR/PtdjMz/KH3c+cHea362JEo8jGMHs4Qq8rgDML4YryS7lXLdYCwG9ju2k5oM1RufTfY+L+yKlJP3Q9qpaC+RNRL1LUAXLAooLckcEQWkxxyOwlF2ACM+PaWG0+8hC0Ar9AWVwuAuUFf00KFHt2DZxKZkKrK2auI7ZY+nuEpSnMTSCTNqtbc4EXb5UJb136Ki1JtjLPalN6l6QVu90Le2x3Z350Fldl3L/Y2AeJAVGIXWnJixY+VPH2O8f92n3XJh1evGc4FduUBEZfPmYYPJFYUFahw6P/59R6lNFBDoR+6DcMY83pQG/AuIe7R4InFNuxdFNi68g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPopnA/y/SJiLkKSTtzUyn7NJ5MvCZBdzAnPXKVokWg=;
 b=e/8Kl1/ww2FEpKEowTnk4CxUQCM1bsyvanK3EJW7ahxHMv/qvO8UhCnI0u1If20mGHCcADehsquoA8ZIWVzBX9EZTBHI7zGoa1iUH0qlZf1DS0RcmVvWZauCFPtyPfAlXvgdb1BgTAtlcN+E3WBJ9HuoQizJU58CVSzSLQgi6SFfOo1d+MradSDZxExMsIQbotubBzdiYALAmY7e2deQ7iSEO59QjsGndrjpq8P9oSkE2QtgprFN6YzF/Wmr2jVDgJrcWufPLEZXmzIgZnBkXXu0tKjki2OxS/qKWLXvjNDNCZf9p/ZRLpzuzvyLR5XIqy6EEFwX1uDJa90KuILD8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7110.namprd12.prod.outlook.com (2603:10b6:510:22e::11)
 by EAYPR12MB999180.namprd12.prod.outlook.com (2603:10b6:303:2c2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 06:37:00 +0000
Received: from PH8PR12MB7110.namprd12.prod.outlook.com
 ([fe80::736a:e1be:ec64:5740]) by PH8PR12MB7110.namprd12.prod.outlook.com
 ([fe80::736a:e1be:ec64:5740%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 06:36:59 +0000
Message-ID: <78798ac4-cfe0-4c0d-a79e-3f49611b7ae6@nvidia.com>
Date: Wed, 23 Sep 2026 07:36:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] phy: tegra: xusb: Use dev_err_probe()
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>, JC Kuo <jckuo@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Wayne Chang
 <waynec@nvidia.com>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20260921-tegra-phy-v1-0-83466bf9a7cd@nvidia.com>
 <20260921-tegra-phy-v1-2-83466bf9a7cd@nvidia.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20260921-tegra-phy-v1-2-83466bf9a7cd@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P195CA0005.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::10) To PH8PR12MB7110.namprd12.prod.outlook.com
 (2603:10b6:510:22e::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7110:EE_|EAYPR12MB999180:EE_
X-MS-Office365-Filtering-Correlation-Id: 15e0e3d6-b494-4f12-82f0-08df193d1208
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	c+MSH+oDX0uFqPOrMXgA9ZR7zE/aIhtrY1Glc0oQNGaeqLFNVZ16R8mpVni+iHf/e9hP2WpsxcmAkMbrfGM88Rp5345pF7KbX9S+9YIymUuo65lkP5lLeAdR2UwHv2iGQcnHOr4Idy3hUt8xBD0RZuqFA39gxoGpWxijsFDpb+rD5PTpUKr5Watd287ollaOwdWmK9uznDE3BI65wovEP3i0VIq2OQS/U3Z8czKhfnY/EhhATwaZYbsYu2BTtLKMGrNU1ndfiZMQN1AvDJkkhS/P1xp0i3RcrwzrNFJx4SLRxy/h6rZKE00beobCfsI+wlGun++HgDSpZkxgUfh+Okg+caMULOnoDV4Ma+w4YNWc7dswFnIcXfSs40j77rAnqLRjxS+V3B/iYHWk1N0vHcTZlEvt4f95QwSwN5iMz2DNZdJNTG2SE6b85b750mRzNBFVnE5Mun3nEGozc3LLMdkj4dEuMqusqv8T/sbpRHFI3+CkiqrJa6Lc/+9lC5S89z4BgXcZFY+A5WXzCfwOSYJi9IygjrYLD0wIdJP3NF9gdq+wy/CFzlBYfzaEkTVHLw1q880b2DTl9my+mMAsARkcX8Wskb6kcbJjjeZ3KgpQYvejOibebwxJ8pizE6qkuyLBcneeGLh4LHJvAFkRtEh06XFX/MfESF90wE4YLzM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7110.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWZtemo0YXprY0RHU2pRcVYvcTFRNGhEV0V4dFF1Q1BJWTNibGxycU5zNmVS?=
 =?utf-8?B?eFdVZ0Zud0YzWEkwa0lnL1pJSG1qMnZ0UmZUZFhZODVya3RBT1lnbjNEZHlj?=
 =?utf-8?B?WDZKZVp5ODYvT2NXL1NwOVMzZ25xR3FSOENOaDJ5cUs0NzFTTldidndzZlZQ?=
 =?utf-8?B?blFXd2FsWkN1UU5FUldOazJnamNOTGVMUzVmNkJkVVJNTjQ5Y0ZRbURncFMr?=
 =?utf-8?B?eUl1MGlDakp0dVJoc2t3cFZUb1YySTFUdW1PdXkvdzZOV2VyWmFsN2V0a3VW?=
 =?utf-8?B?a3BQVWNVbDN3RlRneDlRbWgwdHBMLyt4aDRSNW9wNVJPWk05ZmlZejFXRWlZ?=
 =?utf-8?B?OUc4WmJtaFdVVVAra0F2UlZUOTJUdHNQNkxRbm9SVmF6NVpMN0V1U0lINEFx?=
 =?utf-8?B?Ri84QTV0anFvN2JOZE1USXBhU1JvMUg3b2JZYlA4WGJUMVlsNFJONzdmbW0y?=
 =?utf-8?B?QUk4NTYrUkJKUzBRTkZNRVk3TWY0dVlTL3dPdmE5bk5iM1VUSXhpY1YxYzFZ?=
 =?utf-8?B?NzdpUXhtNG1Dc1UvT3kva1psbVV3WWZiS3dZc0VUUHN3MCs4Q3FTZEJQcWhU?=
 =?utf-8?B?bUJHWjNQQmRuSnJKNGFRL0dFMDk4ekZlbW5aZ016d1lxQ2YyL2hhTGU5TE5a?=
 =?utf-8?B?RmdSV29yTjlsQ2gzTVFVckhOendqVU5SSXZ6dkY2Yzc0RXFMRlM2S1QxTi9q?=
 =?utf-8?B?WmNnMWFIQjBvaWVvbGFrTjZSWFM3Vm1tOUhZaWZxRVhpVWJjcHF5b241eHpW?=
 =?utf-8?B?YzdpYjIyNi8wM3FFazFnTDhxcG5YYmV0Y2pxL2JaaVhsSzUvZXhrS085UnJQ?=
 =?utf-8?B?N2ZSNkU2R0xXdTZ5MmY3Y25XMGZiUDNoNDhjalJ5UTVTcllQQkVBMWRTb1FM?=
 =?utf-8?B?eEU4MXdwbDNaekFZSVdaR0ltcS9Jc3BJcElWZ0JVc1M0K1p1bkhXK0c3NEJn?=
 =?utf-8?B?a2pSNzFUaTQweFJrMVV4S1NWeFM4dEJaRnZTQTUvNzZrWVNKc2xOM1o2QkJo?=
 =?utf-8?B?TnBZdU12TUxXL0pmY3FJdW1DbjZ2cE9ybTg3eURCd2pWM1oyTXFYT3kwRTcv?=
 =?utf-8?B?VUlmSG9aSG03ZXpnb3BlcCtWTE00dkRZVVlKbUlQZDRBL3huclVuWEJSKzg4?=
 =?utf-8?B?eFYvZzJWamZGM3dpcmhKNjJHT2FGVnhYcmdhQ2JnTCtEZXJCVWlZTEE2dkcx?=
 =?utf-8?B?TkRqUkZVZTZKdEZnMFNWOWRIYkQrSitLVkdFMFMwL1RFZ1Q4dE5kRUZXQTlV?=
 =?utf-8?B?bEZ4TkxTT3lUSjI1VXhQR0VlNFUrVGlteEYzTlBpK01mSktLTWdNcUFQbkxR?=
 =?utf-8?B?MXlNTXcwZzB2TzZFV1p1cHV5MDdIU2FMYmh0dW9EcFlxc2pjaUhadGVycnRJ?=
 =?utf-8?B?OEJTVHhkVDhmUnRVNWZqR05YeWpxalBxZ0lUejFNdktZZEFvNDM4cnZMYThG?=
 =?utf-8?B?eE8yUlZTRnBZSmE4NmE3NW54OEF1c0NmejhUME1xZEhVc0R6dHVlZWpZc3N1?=
 =?utf-8?B?cjRsQ2h2RXgzOElac2xKQkhTOHBMR3kvckgyNHlyVksrMjUyNmlKcytUZ28w?=
 =?utf-8?B?cCtWTW5UYXNSaXJTV3VEalNnL2tqc0J4ZFJPbHh2VnNaNlZqK2E3RGZlTUNm?=
 =?utf-8?B?QUJWVkNCdm0ycnJMYVV6eDRxc0drbnNUMG03NVZ6Qzk1aS9IUE05dVlJR21T?=
 =?utf-8?B?K2k2RWMwMWF6S1ZXaHNrMUF3ZGk3NEE1dTNzQ3RteE9JcWloaEh3d0gySldY?=
 =?utf-8?B?R05yUUtrL1hWdWY3WjNxVFozYTRJZTd6d3R3RytJOTdkNVMwQndBTVBUTjhh?=
 =?utf-8?B?S3NZNExPcjc3RGtSNFFzMm15MTRpNFR2TjJsQW5wN0daSnhaU3BwM2kvQU9D?=
 =?utf-8?B?c0RQL0VmVXlCUTlraFFEdHk3eSszN1Q4by9UWk5YWVdseUJFV2laZmVndmFD?=
 =?utf-8?B?b0xtY00zTHAzZm5EdFpsSlQ4RStHTVBvVU5KelViWVFJQ21ZRkJpK3dSdnBC?=
 =?utf-8?B?Z1RSeE1Ka2loU2ZWMGtlSzBwQ0FtTzVrYmNpU0lGOUNsdUx5NW13eWpudUd3?=
 =?utf-8?B?TTBYaDM2S1U2QnhFVy9wL1V5VVpVckNxM2JCT01yc01iY25KaGJEWVhMNjJQ?=
 =?utf-8?B?V1UxSEFwOU9OeVhKdzZSdmlIbG5WWWpUSzFYUEZkaGFaUkk4Y3lDMzB2cGZP?=
 =?utf-8?B?Q2p1TXJpTjZ4dzVIT3lzd0d5d2ppbFdoZUxKNDI2cklmVGlrRlAvdm1maXEw?=
 =?utf-8?B?SkpubnFDbUFVODhDdGxvanFsaExsQ25KQUw5RndhRUNzY3YzZUZqNHQyejdY?=
 =?utf-8?B?eXBNUmt2dW1YS1llUTlubDBtQzVGVGdyZkhZUUwvVC9iNnZ4SWZVZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e0e3d6-b494-4f12-82f0-08df193d1208
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7110.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 06:36:59.8686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DGFHqvS7NFzCc+zy0BqbzIl9Uj3qNPajKeXZOrTMyoSxJIoEmgKgdb7MS3CbhRkUbJ0TOKANWZzlqIzF9Nivjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR12MB999180


On 21/09/2026 13:14, Jon Hunter wrote:
> Use the function dev_err_probe() instead of open coding the same logic.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>   drivers/phy/tegra/xusb.c | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
> index d0d0b252a205..f16c81520a60 100644
> --- a/drivers/phy/tegra/xusb.c
> +++ b/drivers/phy/tegra/xusb.c
> @@ -1257,13 +1257,8 @@ static int tegra_xusb_padctl_probe(struct platform_device *pdev)
>   
>   	err = tegra_xusb_setup_ports(padctl);
>   	if (err) {
> -		const char *level = KERN_ERR;
> -
> -		if (err == -EPROBE_DEFER)
> -			level = KERN_DEBUG;
> -
> -		dev_printk(level, &pdev->dev,
> -			   dev_fmt("failed to setup XUSB ports: %d\n"), err);
> +		dev_err_probe(&pdev->dev, err, "failed to setup XUSB ports\n",
> +			      err);


Looks like I left this extra unneeded 'err' argument. I will fix this in
the next version.

Jon

-- 
nvpublic

