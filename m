Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2089.outbound.protection.outlook.com [40.107.95.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE4E5C8EE
	for <linux-tegra@vger.kernel.org>; Fri, 12 Jan 2024 06:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TaYXxtkd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hn+c0hqx4wjjfAc067gx6+XPiXTqycZ2kkNrVz9hWdjE1TjjJe9gH6+AFqsfD0IXDC3Av5YmjeQjwKOYYQJMRpGDXextN/D6Y59zlP00BqamP4mzpdb2/aKitWXkL7BhYKCU6Zg8FLvjbJkpde7cD2o5epb5AVZYsXSQu/qWWO+KgJ1GYA/6Nsa+ur3F45jIG8RW0lWa6xlWlL9XFM3bvdfJr2+H8V3BeR0RBvYZNUwkHe+R+XlPPCzFIQPuM8vPWqzDnxbIZ6C8QXO+nvxyj0Y5U3+ShUytjAc9m+z3eAUPCNBs9gZr1GG1PV6nzL78CA+gG6OAvRBAJFRH7bmq9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eYOmNJ4RSNOXiuMiTHUyNMvWC6fX8mSzq5+xf0Vgukw=;
 b=CAA3f+a0PLjNC13asbyyuESsEh6v6l4JhaDGIkHdtSVpz3Ds7ImKokVDGdSPVSeLemqj3vnzbjb6/Ag27tQdXem2HK8xhDKM8vbmZ8CGsWLmYl+fbtdLJivtreNC2RVIuIDkSIVv/X7m6chMn/r0iFt+CW7U/sqpwGQg65RC6HvMJHmUXBzQEny2c59yrfbsBJM2utOIttorA9ogc9zFyop6bFFJ+xQr23qTC4q0Uzbu6tra/7WJ9f2L3NmDEzkVRe7Lkha55FZGX0flg+0bleOMKvy4ebfDFQ2hItiz7JBDsjSJceMA0YFna5oy5NA/XBLQ3JaJKpnaCSYjUnW7ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYOmNJ4RSNOXiuMiTHUyNMvWC6fX8mSzq5+xf0Vgukw=;
 b=TaYXxtkdkxcLTfYDd+JfsMnD5R/4LIUxf3LsW+oIZJVxZfH4YQEyM9KwdN+9X/2I+O/xhq5dnr25T5jQF3XfoN4oLU4RyeZoLwx1v1Yo63//UCgzT3Uv0ewOhkVw3w7TrMfMw74mzNT2SPgOGJEu0UCmLde8tPE50HFQZ4W+8t4FN7Efe5sX1KaOAkzXuzzWui0H2wtee/yFckGcyHogiLQIVe/TUgEvzlaL/1zQGRbY46NVVt7R5bb2h9FMNtYx8qprPZzTP4VEL1thh+z8tkZ3Z/2ELzSNRAVv2+U7Zm3dOeBEGleAhOxFKw6iSxrdV0q3RikIpOtZTwtiLy2h9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 MN0PR12MB5977.namprd12.prod.outlook.com (2603:10b6:208:37c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18; Fri, 12 Jan
 2024 06:52:11 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::fb84:50ef:dbb8:1ebb]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::fb84:50ef:dbb8:1ebb%4]) with mapi id 15.20.7181.020; Fri, 12 Jan 2024
 06:52:11 +0000
Message-ID: <5d545ccd-b9b8-4792-8899-8e082500d57b@nvidia.com>
Date: Fri, 12 Jan 2024 06:52:05 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: tegra210-adma: Update dependency to ARCH_TEGRA
To: Peter Robinson <pbrobinson@gmail.com>, linux-tegra@vger.kernel.org
Cc: Thierry Reding <treding@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
 Laxman Dewangan <ldewangan@nvidia.com>
References: <20240111174436.183920-1-pbrobinson@gmail.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20240111174436.183920-1-pbrobinson@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0176.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::19) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|MN0PR12MB5977:EE_
X-MS-Office365-Filtering-Correlation-Id: 516802ae-7a30-4a22-a4b6-08dc133b0073
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zfpSu7BLGqwSGZsn8/b/AEjR1L3fnlkD56zqhSeagJJXARGdEwCWJSNYwpTcKFQBPhmCcejC8+8jl1+O+S9sz4FQiaIP5AJiyrQ/qNrRtPdBUBO2IcUT0XSPOSwGuTrC6w+BwQO0N2gfhN/cMNg0KfWLazgxbFeBiUvydsWqsqKQXpQXXrW40VX4jIGrvSiTaF5gKmRrVCH0G1KICS4Yf8oOkniVCcIGWN2rJYYhnsI5C9va7aTKz3v61o+WWSBXYGAAYdk4F2FysWW1Re2gwxYbIv5CyInz2ptzvXD0Y50zh1eLmgR/1gGHGnie9N4w+Nd+N+af3S9hwmRxbtZ1sIzXWNuwzOV6i66wKCqMmofbDDagME4ZbGianEaWnOKkeCMHT7zd5rkEZvtHWf6SPB0e/zyZvIoBpvavDT59OckkCzcNWxvG8FLv/qxJzPb4jGSYDX+LAaKpYK+qTQH3UnyvHFC/Sju/ZFIGF+HVkcxGuKQ9obP20k+hbI/Z8I1l6KAaiqvLcR6PXwAk6ViXcce1po/Iw6bwH0VusbXTWkKGstRhP4B/6uvfPF8YcHJSihzfIVhMMwFG/5m0vXM2yylOW+CwXMpGcm6LrdjDrAJGljE/nmAKxfmPIqUdBJp27dynYvsdFLsnMRp3cE7SKX8hbP9oTV9N8GZhUYoiEEg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(136003)(346002)(376002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(31686004)(6506007)(66946007)(53546011)(6486002)(66476007)(478600001)(6666004)(2616005)(31696002)(83380400001)(86362001)(19627235002)(66556008)(54906003)(316002)(15650500001)(107886003)(5660300002)(8676002)(36756003)(6512007)(41300700001)(2906002)(8936002)(4326008)(38100700002)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WW85WkZiWkorYWlTak85bFVlYktTSXFNMUN6Mm1vZGVsby9PSzFKQU5XRkdW?=
 =?utf-8?B?QTBpc3pKNnE2UVR3RWVxVXc0Y3Z3K0JmbWFCekF3MWNIc05XQ0lUYVhKRUdW?=
 =?utf-8?B?YnZpWFM0QWRPanltRXI1bm5LOGNFY2VSWjFmcWRBcmlydzdEV1JHWWUyc3JE?=
 =?utf-8?B?a29LUmdJdVNoMER3TGhTd2daRzB4YTh1NnIxWlpKQ2MrbGVOMHhyMnNWUzlJ?=
 =?utf-8?B?amJrWUM4MjZuWkhHMENxL0VrdlBJbUxRYlBSaUxDUGs3b2pCRmtrRWZkK094?=
 =?utf-8?B?TmE5V0tmMzJ2QjFKdXJhOTBPVU8za3ZsMllxbUJUYkFkaHlMdkp2N3ZXQkxm?=
 =?utf-8?B?c3ByZHF4WlpUdkFNOGJWcHZBNzM0YVVvdmlYU3N2ZlppZ0VWci9SalZXRnkr?=
 =?utf-8?B?TDZLeVhBRXhkSE00S3dyNCtGMGl1bVpEZE9MVHllY040SjJuZDdTcmhwWE9J?=
 =?utf-8?B?VmRzY0l4SGh4ZndpRkVrK1BWR3dLbkNXQXRmaU1KM05xOVRTbE54Rm53OHp1?=
 =?utf-8?B?ZW92UUsyYVZsb0tJK3loK2hMbjVRL3RhNk9NbmkxNUt1VGk3ajdsOFY3SFdx?=
 =?utf-8?B?VVhPL0NHdCtCcUlpTTFIZXVpa3VCOFVoakhscE1LY1Q5djJKSTZxUFNoUU5Z?=
 =?utf-8?B?d2ZFNW9EdmFDRzRrZVJHeExRRU9FVFE1NktTdXJxUnV5SGtITEE4Yk4wSWxl?=
 =?utf-8?B?TXdFb1d3azVBM0pnd2tOb1hPUFFxSkRldXc1YlBVUmlQanF6Zyt6TktoOEVQ?=
 =?utf-8?B?ekhSVi9tMVdVVXQraVFTbDE3SDR0aXQvTEFrb2tUWGhYcUZ3SWk1WTVHbXpn?=
 =?utf-8?B?VTh4Ym4zeGVwOUJrQU52VWVybWloak5NWnhiWnNTbEV1QVMrdXh4ZS9sU1U0?=
 =?utf-8?B?QktWOCtJMUo4eHZET0lQMkNsajhUbU5rTVV4SE5vN2x0QXNyaHhxRUYrUGRH?=
 =?utf-8?B?d0ltUnlOMVE1SndoMU9BUmMrY2tPVzQrMVdjVnNmc0dGeXd5RUxoMzAxbnFr?=
 =?utf-8?B?cC80NHJ6eGFIblJ5Zi9QYzE2ckE5SWoxdG8rVk5CT0xjQXdDcjEvYjRVZlp3?=
 =?utf-8?B?Z0crblpFdldiOFV1NGs0ZFhmK3JHMTRnNFAxOGpSdUhoMzNmbXZOemNKdkQ5?=
 =?utf-8?B?bS9tTFc5eGxIVXZvN1l4a1RseVBIeGdMcHN5NlJDN3JzV3MySlN4RXFKVFVr?=
 =?utf-8?B?eE8wYVRHMHFubHNTdklGeTVxM2JyNmQ0YUlEcjFtYW1RV0MvWEQ5NTdVSWM0?=
 =?utf-8?B?S2NxeC84dHpoeUs5NXRCeU9maEJXTmw3QitzUzM1dG9ObkxBMXp6TDIrUUJs?=
 =?utf-8?B?Z1ZSNXRQakN4SDY4MWVxL1BlVjZPWDNGOEp1WmhPaHV3QklGbjBBSWVvZWZv?=
 =?utf-8?B?b3FzaTloYkhHZHlhaWJSc2tnalY1enlUWDFSUWUrR0VzRWM2OG1oRkpadTRM?=
 =?utf-8?B?ZjJqMlpLVmxQc0xmVnBtY3FVdlFpcmFVaTQ4bElTMXVUSysyRUp4TnpLejgy?=
 =?utf-8?B?VExLRjBSSjY5L2M4QUZ2dEU2TWZqT3NKSS9XSitEaUwxZXR3S25SWFNNemIw?=
 =?utf-8?B?SG81aDU1dDlVSzAzNnRObHR0Nndjc2lCY0xGYnBKRjByOEpaUXJ5ZkIwMFhS?=
 =?utf-8?B?YThYQlNVaWlkdnVwUUJyMERtVURZVXhmdUprVFhhdmVraWowOTk5akZXU0Jq?=
 =?utf-8?B?bmY3SUNHOXByUnJTNmlwdGZUdkEzUUViRE43bllhTk9SRmdjWjZMMXNjRGh1?=
 =?utf-8?B?ZjlSYWpBN3ltRWZHRVJDMTBFcmpma2FmOXVvSnl3bk1KMXdIR3J2YXp2WGdm?=
 =?utf-8?B?VHJzRzRYTVpqeTMvYUx1SUNuVnFKOGFkU0E0QktJb3Y0SVVOUEVDSlpCdVht?=
 =?utf-8?B?MVZTQ2lhdFdqOTJNR3k5ZjFmVjFPbTNzOG50NzlOTHJPcDkxek9iRHlWZXg4?=
 =?utf-8?B?RnNxcnErek9Zcno1MmJjL2JUciszWndBMmlqU1pMekZuTnpyZ0pNM2lGcmhT?=
 =?utf-8?B?OXZoajA5VDRjTWJwdm5uODhTaVBuNkUzaGYwMmxMVmpwUGJBK2xYbDRVeS84?=
 =?utf-8?B?L09VbzdwWGI0NVNsWmhackR1VmN4M1BJS1pnRzRvZHVHTGxGTmphRG9Ddjho?=
 =?utf-8?B?ZjhncGFXT2pWQkdsZjRLK3F5N0R4R3Z4WTNYVmgwdXFGZVZSTUhjMTV2Q3Ux?=
 =?utf-8?B?S0RsTzdSUDRkSHI1bURiK3RxRkMraENkelNYMDAzUVlUNjdyUm04cWRZVE0v?=
 =?utf-8?B?cXZHNVRYSEF0Tmg5T3Z0cnU0WmJBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 516802ae-7a30-4a22-a4b6-08dc133b0073
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 06:52:11.3683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oPoj1ckMMpIhBbRVJdg1lj2IZMkX9ZnwuZ98tR03BrtQQndTKzNyyY72d0V9JAyWEYo6C4NqFOh7EB3ySnhIlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5977


On 11/01/2024 17:44, Peter Robinson wrote:
> Update the architecture dependency to be the generic Tegra
> because the driver works on the four latest Tegra generations
> not just T210, if you build a kernel with a specific
> ARCH_TEGRA_xxx_SOC optioon that excludes 210 you don't get

s/optioon/option :-)

> this driver.
> 
> Fixes: 433de642a76c9 ("dmaengine: tegra210-adma: add support for Tegra186/Tegra194")
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> Cc: Jon Hunter <jonathanh@nvidia.com>
> Cc: Thierry Reding <treding@nvidia.com>
> Cc: Sameer Pujar <spujar@nvidia.com>
> Cc: Laxman Dewangan <ldewangan@nvidia.com>
> ---
>   drivers/dma/Kconfig | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> index 70ba506dabab5..de6eb370d485d 100644
> --- a/drivers/dma/Kconfig
> +++ b/drivers/dma/Kconfig
> @@ -629,16 +629,16 @@ config TEGRA20_APB_DMA
>   
>   config TEGRA210_ADMA
>   	tristate "NVIDIA Tegra210 ADMA support"
> -	depends on (ARCH_TEGRA_210_SOC || COMPILE_TEST)
> +	depends on (ARCH_TEGRA || COMPILE_TEST)
>   	select DMA_ENGINE
>   	select DMA_VIRTUAL_CHANNELS
>   	help
> -	  Support for the NVIDIA Tegra210 ADMA controller driver. The
> -	  DMA controller has multiple DMA channels and is used to service
> -	  various audio clients in the Tegra210 audio processing engine
> -	  (APE). This DMA controller transfers data from memory to
> -	  peripheral and vice versa. It does not support memory to
> -	  memory data transfer.
> +	  Support for the NVIDIA Tegra210/Tegra186/Tegra194/Tegra234 ADMA
> +	  controller driver. The DMA controller has multiple DMA channels
> +	  and is used to service various audio clients in the Tegra210
> +	  audio processing engine (APE). This DMA controller transfers
> +	  data from memory to peripheral and vice versa. It does not
> +	  support memory to memory data transfer.
>   
>   config TIMB_DMA
>   	tristate "Timberdale FPGA DMA support"


Looks good to me. Thanks for fixing! Apart from the minor typo ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Jon

-- 
nvpublic
