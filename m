Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012049.outbound.protection.outlook.com [52.101.48.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F3A3C13E3;
	Wed, 29 Apr 2026 09:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777454979; cv=fail; b=mMgG1MO7dn6pYCUOCJFjFKQnCxveRbdvFFhgobkvp0OlBOcCOPr2PYywQhcKQQvVpW0nPP4UBXfzRjluKg592YKlHJNUOzsJAG2l8c6nqfaDNUCCkwv6cwaksjL5Lh2049CdN8ltJ066hSDAk4BaTSJfe4KXPaF+zRlYVggelMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777454979; c=relaxed/simple;
	bh=3NqQbgXYvg+/TgaqK4nvH1xt9ZYxV2DC+s9QpXkHuhk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=d3NW49UTXD9yTUaKdYEWVnQvahKmwZ+E8SdF4i+KmyhlnVfFsb6ZW/bWNN1QbYVbz14wwwkZt6bmQAwSR649b78FaSTXVFuZ3Hmos2iuUZWJFgUARQGbucy/JAoFH8Q1vcLa9jMv/EjUhCic1H3aiX7oMxO2kBY1p4kTTZxubh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GBONFiVQ; arc=fail smtp.client-ip=52.101.48.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GBONFiVQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IVaH0eM/ZEXOfsI+bl6uumhaI7B8ITsrn4gj1SfDj3MOWgenP8GOOrEQIwYOCuOi0/AMkiQXl/6JExJpaedgwpQDyyDU52fyy1HYgYlCDj+QII97mkPDGHLl6OaUVNpw8PVFn390nh0HiSTghVRYgZIWNUzUyTcC4zdTozhOgM2Fxepmgd6QwbDj1y4V5Iu02GGFAyYbB1VlF2JhsRFsTY79i/4R4mnrA0Ijiq+hJbfGICLIc1n66Q8ycNgaMh7Sly3FayK1sXppxq10A27SRCw/tACXu38Xf58MSuGaHLqwzRVIVtqB598ZQY9I5FDwTxnWqErOjfvzqHFORba2Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1UvwYSTHkOALZQkputzdiasBggyWROw0dkQ01FmHmwY=;
 b=yVPAzaa1tBgisVBlah2D19vsA1MRDAFrGLYHVRra3FxgYrc6BjbJlJnk/oOg2tsiuL0lJ1YUyLW4q5TXoHNVAOR2YsEFk7ZIJg7NejB4HKvKnsBYAqEenI2Tl0oC+HPkHXgsY/lpkQzDHeiabHJomPe7dS51guixgtrwTirhqJbK+/7SvctHPLswD1TFEnipiTr/wJVlSi9Qvuzo/6Zej0a/XVLX2v8iuDQ7YyP7MzTblXaIS3ejZf82OJfRuZY7YSj6pNpJ+S0oWt7w8MdPm+Xx0GEz6aaJrPGixgO5O3+dvXQz0/nFi2GwDzSK5u9k9TOu7ZwPbbgnLyjpHVgQwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1UvwYSTHkOALZQkputzdiasBggyWROw0dkQ01FmHmwY=;
 b=GBONFiVQNOCKpFAC0KgCMUd4eX8Gh/fPtK4wywL28gXt3qgVjHNE9iUFzwTxO0NaXcuWkLLFIwJrqOr8MC1dDiHJA/s2SGVnHtlXkLg4Erw1/3tvc8P67DSURqBP5o30NwZoJpOD4pSX3oNt9DqNk0vwPa0gGjejXjuGxC6nE1dzpJIk5iSyTfFk46f6xiWMv84Ua6TN1qX2II/8ThqhHz59nuGBSvgO84SUFPt/kz1gIxC/YMmvvSORoQXju14uTj9F1TOUzsfD6hhoe/0T8fQKEZfzobrz8qfHQiK2Ge0Li8U0aCKcij5Q7zo2qLmreq22AYJw5BdNKAC86oZ0Jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV5PR12MB9754.namprd12.prod.outlook.com (2603:10b6:408:305::12)
 by CY3PR12MB9654.namprd12.prod.outlook.com (2603:10b6:930:ff::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.12; Wed, 29 Apr
 2026 09:29:33 +0000
Received: from LV5PR12MB9754.namprd12.prod.outlook.com
 ([fe80::9667:3c95:27d2:73da]) by LV5PR12MB9754.namprd12.prod.outlook.com
 ([fe80::9667:3c95:27d2:73da%7]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 09:29:33 +0000
Message-ID: <acde30a6-23b1-4f1e-8f09-ddfe20f22390@nvidia.com>
Date: Wed, 29 Apr 2026 10:29:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] memory: tegra: Add T238 MC support
To: Ashish Mhetre <amhetre@nvidia.com>, krzk@kernel.org, robh@kernel.org,
 conor+dt@kernel.org, =thierry.reding@kernel.org, sumitg@nvidia.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20260427073419.567360-1-amhetre@nvidia.com>
 <20260427073419.567360-3-amhetre@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260427073419.567360-3-amhetre@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0002.namprd07.prod.outlook.com
 (2603:10b6:a03:505::25) To LV5PR12MB9754.namprd12.prod.outlook.com
 (2603:10b6:408:305::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9754:EE_|CY3PR12MB9654:EE_
X-MS-Office365-Filtering-Correlation-Id: e3d0c642-9230-449f-2e19-08dea5d1d26e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|10070799003|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+xRVzBGhFFSvHbQ3CxQhCrOjORrejkSFGb37Nl0tmrKPUJ2n8xjSVwi9UkjeRNOuoixvv/NrE976AU+7eayE1LcOIR70kQmjDcfRJm8Wc77nm1Qd0P4cCXmIYlWhf7MmDpxsajUy53fTWUZt4KhWCoAjRLxWvv0qZulbCBBiw4sJdJbXUdQutV0SP48OI+YJkKsxJSiKdVS3x9QbbBYSrsylCu2un7hPFo29r57yxNOhgwq2dbFt5MU0jFu0XIhiPElnDFfTiZU0DAdWABo/k2Y0/LsqnyF3K94SPmvpC94iGTCYk19Uk4XdvFDl38tiMV2hmOTjfKc9TjIjhmMj9+nPk5VeT0ohdNYmkcVrNic1RMKnETKmXhjG6ChUePZCY63MNJq3F9BjNnouXxj4ZEbWrNlHQZse4cXxEsHEopjVqnszwuRuDR/Rw3Ps0lWg5vko6t87fRZtIHLcIZjhzm2UJTlSNiUl6NhBwL7y13scXNB+35b+KJM2Kz9FfE60ZnMN7URbzGbcFixaks+E8h/dbklEIJV+eqN47cjbgvW7mhxHhe643NyOlVoh3kbF+2QPVVbg3Vewy9EpSm20e+Ey9LcVkxlwEI5taOOxeQvOBfqEQKiP1hDN5jIX/xysMbfdC1JpCXkwtoCgUab+pJ7RD+OCUTU1a2/+m6108BfUWOOmkbfTdMXDNxwHppRT7msviBYrwnjyKg3vxbiwmstbktcWX/UZgmXRl3xste0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9754.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qko3SlJMMncySjR6MVhVcVY0YTRYY0QxSjJPZWtrOS9wa0VLeHJ6cjRlNFc4?=
 =?utf-8?B?TjBqV1cxd1hXY2prQUdXKzRHTmwzYmZMajRGQm50T3paS0p4RUh4eVgwbDBK?=
 =?utf-8?B?UjZQdXBicnRNL1V4L3diWkRsYVFBWnlHUXp3MDBGNHc4eXNoUXpMeFJtMzNI?=
 =?utf-8?B?alZyb21iMk9ySFlESTZXM09KWjFGbnlORUJIZm54VE9IM1JUelZTRlZUOUxS?=
 =?utf-8?B?cC9ZVmRQSS94cGZpN0RhVlk0VSszdkVwTVgyRXVoMnJwQjhrKzF0N1lveGpE?=
 =?utf-8?B?UmN0Z1FRTE12S1l1WDM4L3ArKzFjNGhTOGx0Q21iZUtocjZjeHl4MU43cDNI?=
 =?utf-8?B?VGprTjFGOUQyN0Z0Vk95S2pqc3YwZlFWeFhVMmpuc0RvS0owcUI3dFM0MGQ1?=
 =?utf-8?B?WEJVU3c3Y2E1SWRnQW1mTjdtVkUyckd1b2pnOTV0alVmcitmakVyUjE5SThs?=
 =?utf-8?B?ZnhsQngxZlVteUthNkNsN2gvaFpYYlJrN2JRN2I2VWI4VSs0cDBPS1hiT1da?=
 =?utf-8?B?VFZUUFl2eGV1clk2OVZ4SXc2TSt5WFg3NUEvRGU3Vmh0aUY4dENJekVWeU8x?=
 =?utf-8?B?VkhOVlVYNVloNlFoK0VZSWhsNUZZb3RONHk2T2dyUFR1UE1NcHJ6OTdVVnBk?=
 =?utf-8?B?WTUzajJ5T0IrZlozbFRsRFZQM0RBZnJhdnQ0dE02cG1Yc1RaQmp4ZUZBS3po?=
 =?utf-8?B?RTVyTHhPYUJHM2Qvem1QUTk3eGE4bHdnalg0cG1acmFSQzIyOFFCV1BnaUlx?=
 =?utf-8?B?YkxXcHVFdEE3OVhvZUNVTndwR0FVbFBobmZKNFFIR2owRlVwajM1R0x3MEhx?=
 =?utf-8?B?T2VraFNzWnZPMXRWMEJlVThFMC9VeWVPendlWkZBZ3E1UjM0eXQ4eDlnVUNC?=
 =?utf-8?B?UjZrSm5LTkx2WlVnRGYvenlZb2ExSGJoZmJobVJhcmcxQUYwbUhNb2ZqM2c3?=
 =?utf-8?B?QkpqZEtRYkdHWDdIWmIvakJ6c1FBWW56K2NvYzJ3cmpxZHVtN1kxVDRGYnZw?=
 =?utf-8?B?VzBPMlp3bitoSnpHTS9oaWhoRmZ1N3J2dm9xRGQwdHUvVW8yNjFmcEUveTEz?=
 =?utf-8?B?TlNJWTNJU251L1Z2UUMwRkdHa0xzS0pDYjZsd1g2V0gzWDlRYlhQNFA0d01i?=
 =?utf-8?B?QkoveFA0RzNYR1FpeEU2K3VWQU1lNjAxUVdQYmpaZnVsVVZzOHJ3OXlhSTRv?=
 =?utf-8?B?TFA5VGE4K1NTMlh3UnRRakxtTFcwc0pKcHJjdjhUYnZaQ2xLOU04MnAzbG9D?=
 =?utf-8?B?ZGM5c25qa3JnUW9ZSG5jRnFtWkxzM2dORTU4cUF6MXdKK0RlVXBCbnJhUHBr?=
 =?utf-8?B?QWl5K2pzTDNORGtZM3VHdWFoY3pBY216RXRpRlZqeEVEYjFIWlo2SWpRYjJq?=
 =?utf-8?B?VnJMRE1meEhxMlFiL2pKSWVrNjJ2amtuU3ZGMTBSeDN6b0dZZ0tDblVmV2Nl?=
 =?utf-8?B?bEdNTTBvRUc4OVVJTFVnTnRnWFBYdnRXQWZwaWpuWkRCV3M1T2hvY0RsWDNO?=
 =?utf-8?B?OVl1UGpkd2NDNlRZbSttc2taRmFMTW9IelBoQ0tVcHZPdmh0T2hNRWZ4OC9O?=
 =?utf-8?B?MzdXQk1FeGNSQ1BhQ1hzbUtSbWpmTkJCemw3OTJUSkdhRW9jaWVwVlZMZUl2?=
 =?utf-8?B?Uit5M2RkM0dETW1rM0tQVDRFQ2FCaDZ3YkcxWHltVEU3eHR5dEhjWEttYWVP?=
 =?utf-8?B?OEJsVVZDV1k4OGVHMjg1QUwxWENra1hFTm8vU0t0bk40cVRWRHQybEFiR2ZB?=
 =?utf-8?B?bW1tUTZvaDI3NjlaLzZySEhrMVFMTDNXNUYzVUVHOFVrM0xZaFNBVGtTUnBB?=
 =?utf-8?B?ZGZmRFlDb0QzTlJJWTFhdHVwTEZKYzVPclZCVG1iMGhoYUl3alhQcjF6UmtB?=
 =?utf-8?B?b3hMRkVla2dBVmFEQm95MHhCdC80U2N3dmRlN0RDNnYxekhSMWJ6b3I5M21i?=
 =?utf-8?B?eEpiUDRYZGdNN1lhMGd2eHNSMlZhVGdVSG9Id3JwNGRybFFXdlRtMGJWMEFp?=
 =?utf-8?B?ZzlPQktkYVU3TGZMMlRBcVZFaW01YjN6cW5CS203Qm9XMHc0NW9tVGpnWnhK?=
 =?utf-8?B?QjVRSXpkQ0JlSnVwS1JScDZ6VnczWlFqUk9PbGQ2MnUraGFFdDRpU2xGTm1h?=
 =?utf-8?B?UldaSkIzUFltTnNHMFozelNPeHZCendqNHlIM0tIZXV0UEJaOU9acnJON0sx?=
 =?utf-8?B?ZVZzUFkyYTlKaEZZemNGUFhIL2U3NXVnRGFWcXk1RjRxQ2RPV2ZVdTNpc1dx?=
 =?utf-8?B?Yk54cGdmU1pkWkpYV3oxeGJCTHZCOVo5bWdrdnFmRmdCMGJhL0pWMVhRcStE?=
 =?utf-8?B?NVJjWWlUQUw5NVVJV0duZmlwcG1hZTlDVkNUSXpMSXc4ODVGSWVVdnNqc3h3?=
 =?utf-8?Q?dCDx+fa5C3VU1SFxhlHLW2kXKJTZxHzxuDTDwqRo+rgiq?=
X-MS-Exchange-AntiSpam-MessageData-1: ceDlveBRK2b0mw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3d0c642-9230-449f-2e19-08dea5d1d26e
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9754.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 09:29:33.1100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sl2GRYpW112LSFvfWv29DpDCoDuwvUXdDW6LbwTenBUitZ1yAjuqngajv/Hc+BO60hsB6Ts5xZTmd7CycUw3IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9654


On 27/04/2026 08:34, Ashish Mhetre wrote:

We prefer to use 'Tegra238' and not T238. However, don't worry too much 
about that unless there are other comments.

> Add Memory Controller driver support for Tegra238 SOC, including:
> - MC client definitions with Tegra238-specific stream IDs
> - Reuse of Tegra234 ICC operations for bandwidth management via BPMP-FW
> - Device tree compatible string "nvidia,tegra238-mc"
> 
> Export tegra234_mc_icc_ops so it can be shared with the Tegra238 MC
> driver, as both SoCs use the same ICC aggregation and bandwidth
> management logic.
> 
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> ---
>   drivers/memory/tegra/Makefile   |   1 +
>   drivers/memory/tegra/mc.c       |   3 +
>   drivers/memory/tegra/mc.h       |   9 +
>   drivers/memory/tegra/tegra234.c |   2 +-
>   drivers/memory/tegra/tegra238.c | 391 ++++++++++++++++++++++++++++++++
>   5 files changed, 405 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/memory/tegra/tegra238.c
> 
> diff --git a/drivers/memory/tegra/Makefile b/drivers/memory/tegra/Makefile
> index 6334601e6120..7c2fca12076b 100644
> --- a/drivers/memory/tegra/Makefile
> +++ b/drivers/memory/tegra/Makefile
> @@ -10,6 +10,7 @@ tegra-mc-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210.o
>   tegra-mc-$(CONFIG_ARCH_TEGRA_186_SOC) += tegra186.o
>   tegra-mc-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra186.o tegra194.o
>   tegra-mc-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra186.o tegra234.o
> +tegra-mc-$(CONFIG_ARCH_TEGRA_238_SOC) += tegra186.o tegra234.o tegra238.o
>   tegra-mc-$(CONFIG_ARCH_TEGRA_264_SOC) += tegra186.o tegra264.o
>   
>   obj-$(CONFIG_TEGRA_MC) += tegra-mc.o
> diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
> index d620660da331..10ef3c323e22 100644
> --- a/drivers/memory/tegra/mc.c
> +++ b/drivers/memory/tegra/mc.c
> @@ -49,6 +49,9 @@ static const struct of_device_id tegra_mc_of_match[] = {
>   #ifdef CONFIG_ARCH_TEGRA_234_SOC
>   	{ .compatible = "nvidia,tegra234-mc", .data = &tegra234_mc_soc },
>   #endif
> +#ifdef CONFIG_ARCH_TEGRA_238_SOC
> +	{ .compatible = "nvidia,tegra238-mc", .data = &tegra238_mc_soc },
> +#endif
>   #ifdef CONFIG_ARCH_TEGRA_264_SOC
>   	{ .compatible = "nvidia,tegra264-mc", .data = &tegra264_mc_soc },
>   #endif
> diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
> index 649b54369263..e94d265d7b67 100644
> --- a/drivers/memory/tegra/mc.h
> +++ b/drivers/memory/tegra/mc.h
> @@ -240,6 +240,14 @@ extern const struct tegra_mc_soc tegra194_mc_soc;
>   extern const struct tegra_mc_soc tegra234_mc_soc;
>   #endif
>   
> +#if defined(CONFIG_ARCH_TEGRA_234_SOC) || defined(CONFIG_ARCH_TEGRA_238_SOC)
> +extern const struct tegra_mc_icc_ops tegra234_mc_icc_ops;
> +#endif
> +
> +#ifdef CONFIG_ARCH_TEGRA_238_SOC
> +extern const struct tegra_mc_soc tegra238_mc_soc;
> +#endif
> +
>   #ifdef CONFIG_ARCH_TEGRA_264_SOC
>   extern const struct tegra_mc_soc tegra264_mc_soc;
>   #endif
> @@ -256,6 +264,7 @@ extern const struct tegra_mc_ops tegra30_mc_ops;
>   #if defined(CONFIG_ARCH_TEGRA_186_SOC) || \
>       defined(CONFIG_ARCH_TEGRA_194_SOC) || \
>       defined(CONFIG_ARCH_TEGRA_234_SOC) || \
> +    defined(CONFIG_ARCH_TEGRA_238_SOC) || \
>       defined(CONFIG_ARCH_TEGRA_264_SOC)
>   extern const struct tegra_mc_ops tegra186_mc_ops;
>   #endif
> diff --git a/drivers/memory/tegra/tegra234.c b/drivers/memory/tegra/tegra234.c
> index 87b22038a5fb..9fbd34d4abe0 100644
> --- a/drivers/memory/tegra/tegra234.c
> +++ b/drivers/memory/tegra/tegra234.c
> @@ -1125,7 +1125,7 @@ static int tegra234_mc_icc_get_init_bw(struct icc_node *node, u32 *avg, u32 *pea
>   	return 0;
>   }
>   
> -static const struct tegra_mc_icc_ops tegra234_mc_icc_ops = {
> +const struct tegra_mc_icc_ops tegra234_mc_icc_ops = {
>   	.xlate = tegra_mc_icc_xlate,
>   	.aggregate = tegra234_mc_icc_aggregate,
>   	.get_bw = tegra234_mc_icc_get_init_bw,
> diff --git a/drivers/memory/tegra/tegra238.c b/drivers/memory/tegra/tegra238.c
> new file mode 100644
> index 000000000000..938c8985600e
> --- /dev/null
> +++ b/drivers/memory/tegra/tegra238.c
> @@ -0,0 +1,391 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026, NVIDIA CORPORATION.  All rights reserved.
> + */
> +
> +#include <soc/tegra/mc.h>
> +
> +#include <dt-bindings/memory/tegra234-mc.h>
> +#include <dt-bindings/memory/nvidia,tegra238-mc.h>
> +#include <linux/interconnect.h>
> +#include <linux/tegra-icc.h>
> +
> +#include <soc/tegra/bpmp.h>
> +#include "mc.h"
> +
> +static const struct tegra_mc_client tegra238_mc_clients[] = {
> +	{
> +		.id = TEGRA234_MEMORY_CLIENT_HDAR,
> +		.name = "hdar",
> +		.bpmp_id = TEGRA_ICC_BPMP_HDA,
> +		.type = TEGRA_ICC_ISO_AUDIO,
> +		.sid = TEGRA238_SID_HDA,
> +		.regs = {
> +			.sid = {
> +				.override = 0xa8,
> +				.security = 0xac,
> +			},
> +		},
> +	}, {
> +		.id = TEGRA234_MEMORY_CLIENT_HDAW,
> +		.name = "hdaw",
> +		.bpmp_id = TEGRA_ICC_BPMP_HDA,
> +		.type = TEGRA_ICC_ISO_AUDIO,
> +		.sid = TEGRA238_SID_HDA,
> +		.regs = {
> +			.sid = {
> +				.override = 0x1a8,
> +				.security = 0x1ac,
> +			},
> +		},
> +	}, {
> +		.id = TEGRA234_MEMORY_CLIENT_SDMMCRAB,
> +		.name = "sdmmcrab",
> +		.bpmp_id = TEGRA_ICC_BPMP_SDMMC_4,
> +		.type = TEGRA_ICC_NISO,
> +		.sid = TEGRA238_SID_SDMMC4A,
> +		.regs = {
> +			.sid = {
> +				.override = 0x318,
> +				.security = 0x31c,
> +			},
> +		},
> +	}, {
> +		.id = TEGRA234_MEMORY_CLIENT_SDMMCWAB,
> +		.name = "sdmmcwab",
> +		.bpmp_id = TEGRA_ICC_BPMP_SDMMC_4,
> +		.type = TEGRA_ICC_NISO,
> +		.sid = TEGRA238_SID_SDMMC4A,
> +		.regs = {
> +			.sid = {
> +				.override = 0x338,
> +				.security = 0x33c,
> +			},
> +		},
> +	}, {
> +		.id = TEGRA234_MEMORY_CLIENT_APER,
> +		.name = "aper",
> +		.bpmp_id = TEGRA_ICC_BPMP_APE,
> +		.type = TEGRA_ICC_ISO_AUDIO,
> +		.sid = TEGRA238_SID_ISO_APE0,
> +		.regs = {
> +			.sid = {
> +				.override = 0x3d0,
> +				.security = 0x3d4,
> +			},
> +		},
> +	}, {
> +		.id = TEGRA234_MEMORY_CLIENT_APEW,
> +		.name = "apew",
> +		.bpmp_id = TEGRA_ICC_BPMP_APE,
> +		.type = TEGRA_ICC_ISO_AUDIO,
> +		.sid = TEGRA238_SID_ISO_APE0,
> +		.regs = {
> +			.sid = {
> +				.override = 0x3d8,
> +				.security = 0x3dc,
> +			},
> +		},
> +	}, {
> +		.id = TEGRA234_MEMORY_CLIENT_NVDISPLAYR,
> +		.name = "nvdisplayr",
> +		.bpmp_id = TEGRA_ICC_BPMP_DISPLAY,
> +		.type = TEGRA_ICC_ISO_DISPLAY,
> +		.sid = TEGRA238_SID_ISO_NVDISPLAY,
> +		.regs = {
> +			.sid = {
> +				.override = 0x490,
> +				.security = 0x494,
> +			},
> +		},
> +	}, {
> +		.id = TEGRA234_MEMORY_CLIENT_NVDISPLAYR1,
> +		.name = "nvdisplayr1",
> +		.bpmp_id = TEGRA_ICC_BPMP_DISPLAY,
> +		.type = TEGRA_ICC_ISO_DISPLAY,
> +		.sid = TEGRA238_SID_ISO_NVDISPLAY,
> +		.regs = {
> +			.sid = {
> +				.override = 0x508,
> +				.security = 0x50c,
> +			},
> +		},
> +	}, {
> +		.id = TEGRA234_MEMORY_CLIENT_BPMPR,
> +		.name = "bpmpr",
> +		.sid = TEGRA238_SID_BPMP,
> +		.regs = {
> +			.sid = {
> +				.override = 0x498,
> +				.security = 0x49c,
> +			},
> +		},
> +	}, {
> +		.id = TEGRA234_MEMORY_CLIENT_BPMPW,
> +		.name = "bpmpw",
> +		.sid = TEGRA238_SID_BPMP,
> +		.regs = {
> +			.sid = {
> +				.override = 0x4a0,
> +				.security = 0x4a4,
> +			},
> +		},
> +	}, {
> +		.id = TEGRA234_MEMORY_CLIENT_BPMPDMAR,
> +		.name = "bpmpdmar",
> +		.sid = TEGRA238_SID_BPMP,
> +		.regs = {
> +			.sid = {
> +				.override = 0x4a8,
> +				.security = 0x4ac,
> +			},
> +		},
> +	}, {
> +		.id = TEGRA234_MEMORY_CLIENT_BPMPDMAW,
> +		.name = "bpmpdmaw",
> +		.sid = TEGRA238_SID_BPMP,
> +		.regs = {
> +			.sid = {
> +				.override = 0x4b0,
> +				.security = 0x4b4,
> +			},
> +		},
> +	}, {
> +		.id = TEGRA234_MEMORY_CLIENT_APEDMAR,
> +		.name = "apedmar",
> +		.bpmp_id = TEGRA_ICC_BPMP_APEDMA,
> +		.type = TEGRA_ICC_ISO_AUDIO,
> +		.sid = TEGRA238_SID_ISO_APE1,
> +		.regs = {
> +			.sid = {
> +				.override = 0x4f8,
> +				.security = 0x4fc,
> +			},
> +		},
> +	}, {
> +		.id = TEGRA234_MEMORY_CLIENT_APEDMAW,
> +		.name = "apedmaw",
> +		.bpmp_id = TEGRA_ICC_BPMP_APEDMA,
> +		.type = TEGRA_ICC_ISO_AUDIO,
> +		.sid = TEGRA238_SID_ISO_APE1,
> +		.regs = {
> +			.sid = {
> +				.override = 0x500,
> +				.security = 0x504,
> +			},
> +		},
> +	}, {
> +		.id = TEGRA234_MEMORY_CLIENT_VICSRD,
> +		.name = "vicsrd",
> +		.bpmp_id = TEGRA_ICC_BPMP_VIC,
> +		.type = TEGRA_ICC_NISO,
> +		.sid = TEGRA238_SID_VIC,
> +		.regs = {
> +			.sid = {
> +				.override = 0x360,
> +				.security = 0x364,
> +			},
> +		},
> +	}, {
> +		.id = TEGRA234_MEMORY_CLIENT_VICSWR,
> +		.name = "vicswr",
> +		.bpmp_id = TEGRA_ICC_BPMP_VIC,
> +		.type = TEGRA_ICC_NISO,
> +		.sid = TEGRA238_SID_VIC,
> +		.regs = {
> +			.sid = {
> +				.override = 0x368,
> +				.security = 0x36c,
> +			},
> +		},
> +	}, {
> +		.id = TEGRA234_MEMORY_CLIENT_NVDECSRD,
> +		.name = "nvdecsrd",
> +		.bpmp_id = TEGRA_ICC_BPMP_NVDEC,
> +		.type = TEGRA_ICC_NISO,
> +		.sid = TEGRA238_SID_NVDEC,
> +		.regs = {
> +			.sid = {
> +				.override = 0x3c0,
> +				.security = 0x3c4,
> +			},
> +		},
> +	}, {
> +		.id = TEGRA234_MEMORY_CLIENT_NVDECSWR,
> +		.name = "nvdecswr",
> +		.bpmp_id = TEGRA_ICC_BPMP_NVDEC,
> +		.type = TEGRA_ICC_NISO,
> +		.sid = TEGRA238_SID_NVDEC,
> +		.regs = {
> +			.sid = {
> +				.override = 0x3c8,
> +				.security = 0x3cc,
> +			},
> +		},
> +	}, {
> +		.id = TEGRA234_MEMORY_CLIENT_NVENCSRD,
> +		.name = "nvencsrd",
> +		.bpmp_id = TEGRA_ICC_BPMP_NVENC,
> +		.type = TEGRA_ICC_NISO,
> +		.sid = TEGRA238_SID_NVENC,
> +		.regs = {
> +			.sid = {
> +				.override = 0xe0,
> +				.security = 0xe4,
> +			},
> +		},
> +	}, {
> +		.id = TEGRA234_MEMORY_CLIENT_NVENCSWR,
> +		.name = "nvencswr",
> +		.bpmp_id = TEGRA_ICC_BPMP_NVENC,
> +		.type = TEGRA_ICC_NISO,
> +		.sid = TEGRA238_SID_NVENC,
> +		.regs = {
> +			.sid = {
> +				.override = 0x158,
> +				.security = 0x15c,
> +			},
> +		},
> +	}, {
> +		.id = TEGRA234_MEMORY_CLIENT_PCIE0R,
> +		.name = "pcie0r",
> +		.bpmp_id = TEGRA_ICC_BPMP_PCIE_0,
> +		.type = TEGRA_ICC_NISO,
> +		.sid = TEGRA238_SID_PCIE0,
> +		.regs = {
> +			.sid = {
> +				.override = 0x6c0,
> +				.security = 0x6c4,
> +			},
> +		},
> +	}, {
> +		.id = TEGRA234_MEMORY_CLIENT_PCIE0W,
> +		.name = "pcie0w",
> +		.bpmp_id = TEGRA_ICC_BPMP_PCIE_0,
> +		.type = TEGRA_ICC_NISO,
> +		.sid = TEGRA238_SID_PCIE0,
> +		.regs = {
> +			.sid = {
> +				.override = 0x6c8,
> +				.security = 0x6cc,
> +			},
> +		},
> +	}, {
> +		.id = TEGRA234_MEMORY_CLIENT_PCIE1R,
> +		.name = "pcie1r",
> +		.bpmp_id = TEGRA_ICC_BPMP_PCIE_1,
> +		.type = TEGRA_ICC_NISO,
> +		.sid = TEGRA238_SID_PCIE1,
> +		.regs = {
> +			.sid = {
> +				.override = 0x6d0,
> +				.security = 0x6d4,
> +			},
> +		},
> +	}, {
> +		.id = TEGRA234_MEMORY_CLIENT_PCIE1W,
> +		.name = "pcie1w",
> +		.bpmp_id = TEGRA_ICC_BPMP_PCIE_1,
> +		.type = TEGRA_ICC_NISO,
> +		.sid = TEGRA238_SID_PCIE1,
> +		.regs = {
> +			.sid = {
> +				.override = 0x6d8,
> +				.security = 0x6dc,
> +			},
> +		},
> +	}, {
> +		.id = TEGRA234_MEMORY_CLIENT_PCIE2AR,
> +		.name = "pcie2ar",
> +		.bpmp_id = TEGRA_ICC_BPMP_PCIE_2,
> +		.type = TEGRA_ICC_NISO,
> +		.sid = TEGRA238_SID_PCIE2,
> +		.regs = {
> +			.sid = {
> +				.override = 0x6e0,
> +				.security = 0x6e4,
> +			},
> +		},
> +	}, {
> +		.id = TEGRA234_MEMORY_CLIENT_PCIE2AW,
> +		.name = "pcie2aw",
> +		.bpmp_id = TEGRA_ICC_BPMP_PCIE_2,
> +		.type = TEGRA_ICC_NISO,
> +		.sid = TEGRA238_SID_PCIE2,
> +		.regs = {
> +			.sid = {
> +				.override = 0x6e8,
> +				.security = 0x6ec,
> +			},
> +		},
> +	}, {
> +		.id = TEGRA234_MEMORY_CLIENT_PCIE3R,
> +		.name = "pcie3r",
> +		.bpmp_id = TEGRA_ICC_BPMP_PCIE_3,
> +		.type = TEGRA_ICC_NISO,
> +		.sid = TEGRA238_SID_PCIE3,
> +		.regs = {
> +			.sid = {
> +				.override = 0x6f0,
> +				.security = 0x6f4,
> +			},
> +		},
> +	}, {
> +		.id = TEGRA234_MEMORY_CLIENT_PCIE3W,
> +		.name = "pcie3w",
> +		.bpmp_id = TEGRA_ICC_BPMP_PCIE_3,
> +		.type = TEGRA_ICC_NISO,
> +		.sid = TEGRA238_SID_PCIE3,
> +		.regs = {
> +			.sid = {
> +				.override = 0x6f8,
> +				.security = 0x6fc,
> +			},
> +		},
> +	}, {
> +		.id = TEGRA_ICC_MC_CPU_CLUSTER0,
> +		.name = "sw_cluster0",
> +		.bpmp_id = TEGRA_ICC_BPMP_CPU_CLUSTER0,
> +		.type = TEGRA_ICC_NISO,
> +	}, {
> +		.id = TEGRA234_MEMORY_CLIENT_NVL1R,
> +		.name = "nvl1r",
> +		.bpmp_id = TEGRA_ICC_BPMP_GPU,
> +		.type = TEGRA_ICC_NISO,
> +	}, {
> +		.id = TEGRA234_MEMORY_CLIENT_NVL1W,
> +		.name = "nvl1w",
> +		.bpmp_id = TEGRA_ICC_BPMP_GPU,
> +		.type = TEGRA_ICC_NISO,
> +	}
> +};
> +
> +static const struct tegra_mc_intmask tegra238_mc_intmasks[] = {
> +	{
> +		.reg = MC_INTMASK,
> +		.mask = MC_INT_DECERR_ROUTE_SANITY | MC_INT_DECERR_GENERALIZED_CARVEOUT |
> +			MC_INT_DECERR_MTS | MC_INT_SECERR_SEC | MC_INT_DECERR_VPR |
> +			MC_INT_SECURITY_VIOLATION | MC_INT_DECERR_EMEM,
> +	},
> +};
> +
> +const struct tegra_mc_soc tegra238_mc_soc = {
> +	.num_clients = ARRAY_SIZE(tegra238_mc_clients),
> +	.clients = tegra238_mc_clients,
> +	.num_address_bits = 40,
> +	.num_channels = 8,
> +	.client_id_mask = 0x1ff,
> +	.intmasks = tegra238_mc_intmasks,
> +	.num_intmasks = ARRAY_SIZE(tegra238_mc_intmasks),
> +	.has_addr_hi_reg = true,
> +	.ops = &tegra186_mc_ops,
> +	.icc_ops = &tegra234_mc_icc_ops,
> +	.ch_intmask = 0x0000ff00,
> +	.global_intstatus_channel_shift = 8,
> +	.num_carveouts = 32,
> +	.regs = &tegra20_mc_regs,
> +	.handle_irq = tegra30_mc_irq_handlers,
> +	.num_interrupts = ARRAY_SIZE(tegra30_mc_irq_handlers),
> +	.mc_addr_hi_mask = 0x3,
> +	.mc_err_status_type_mask = (0x7 << 28),
> +};

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic

