Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2088.outbound.protection.outlook.com [40.107.95.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315225C8E0
	for <linux-tegra@vger.kernel.org>; Fri, 12 Jan 2024 06:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OwmFTarO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I2HEdFS1As6EMTXD3bM+CH9IZWkpCb1jX6VGeTNkCNy173uvJq7e5iFnsnZC8UUclwOyyv06BzHcjG9m3xjexWRoQxfRW/SBX739BY0xwB/SuZwwqpJckAqt4eKVKETnuR/tiJVkBp0Ae4V5YOZ4adgb38Iob7B5AWaLn2OSctSJtCFwi1LF+DU+/pbzHrfZUO7amkL2hkQ6oi2Mk374tJhq9W4WlmSOWIy+EJT5XoM9EoG75ko7BEVmc2SggZTCjp9GfFpu+U/tov6Bb2xJvcZw9yvqL4sZ2xJiTl+LTez6XSrDpVLD61cw3F74mVaecrVMEG95v99HbIC9caPSkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wgLvw/46lzE8BGzptxMpiHRUYQieIEXG1EnJGdjb/k0=;
 b=dX8RHuUsRw+y0MzWEemv9hh2SDOcV0aYFbsAQcgN9zrZPdAnyvy9n/nehk0nUZgotQZlbUKGTo0gEIG23fLsdcFe/n8SAAeuiX0jm4HKGsK00p1EtUawxo1yxLiZyLYxDg15rx0WYzLWF7WeWIiAcBMGS53JEKWR3zik2XMczp+TWuHY0idh58j51l3LyXaOL9nl+T0/NpuhONDbpWNQ0QXnRlRslvGb1YXOMdslGTBAp4s/9yqnK0GckagCwsECelrzoBrYAkSNt5l6k4xFHB5YWAPaWiyAjQvgDH8jdUWoA9INORXnUG1lWee3ppD49xKBg9wFM77Alqb9g9adUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgLvw/46lzE8BGzptxMpiHRUYQieIEXG1EnJGdjb/k0=;
 b=OwmFTarOlP8kz1WEb5kkpa9I+795pgRYyLeVnbYGeQcarFwJR6/Yez5zN/4Rv7o7zBlBUiEQMrVs2T4gTlkxhRctYLP+G6Xu7Y/gu5UfrMP343dbBAfxE2lKUOeRu4Lgu4+E6Z5ZNaXaxBF9CHv4qLkrL/ppBlhbXJepQPrEVEKtvC02TStuyxC30/dHwgGoIeSxwAQVB2v92ONiOSIcCojRFiENCCwWPrXPy2AEztpcVTk8nU6dA/W8j37wxuoZonFPkZIolFPWEeJw9lGiwJGtW04mOM97uuPw+JNlXflwxrwIVOGsAzVfurUSVYF3i+meAYoGSeGGTVh8C6Gm9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 MN0PR12MB5977.namprd12.prod.outlook.com (2603:10b6:208:37c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18; Fri, 12 Jan
 2024 06:53:15 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::fb84:50ef:dbb8:1ebb]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::fb84:50ef:dbb8:1ebb%4]) with mapi id 15.20.7181.020; Fri, 12 Jan 2024
 06:53:15 +0000
Message-ID: <e7cf5ce1-c7e9-443b-a005-fed550a5bf3f@nvidia.com>
Date: Fri, 12 Jan 2024 06:53:14 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: tegra-aconnect: Update dependency to ARCH_TEGRA
Content-Language: en-US
To: Peter Robinson <pbrobinson@gmail.com>, linux-tegra@vger.kernel.org
Cc: Thierry Reding <treding@nvidia.com>
References: <20240111190327.198794-1-pbrobinson@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20240111190327.198794-1-pbrobinson@gmail.com>
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
X-MS-Office365-Filtering-Correlation-Id: 58481007-e7e7-40a2-2295-08dc133b26a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HmFdgMI/QzLPz0m1gL7YCNRyp/2c7mRCEcyytVVgOAHWe+pFXBxgE6/KUjKF0iKrBfWP0JxKmFwAzrt69p31Ki0cUrcdtVdoF/qtWOUDfaTlobhTWbmmGM5p3Mzs9aR979RqJBmpyg0fQkOtHvjgXKyzHG/INnI7bAIEf1wyB2WRFyIjYPQE4zyWcMQWCLVb1u7RbCb9iRbixtamVAeM1speCGhBoA2lyI1JixfW3afCnnAqlQjSYjYo2uP8ePP8wxwlo1ZYZwVV3yLUxD6fJjeR8tyOb3TAf63Fn9VOqCrwm0SkhLTjUASdpKg+m+K4WFz+xFlDJn+8O2ZsloNpN27RXUNDOLoO2bDnRxoVs4/B7jQrRFksF/fOX3H25KRT+kqmLqVq4gY3FH1JiVCOcNsa1pbwMDmjJWvU4Y8CEPLPvTeQ2qjwpL/Phxb1SiSkuke2AESd91m3CWyjp5MkMeCEiFS7hLwYq5Wh8sQcQ/VF9ttIzutSN0TLZV4PORy0lLK770WG1mXA1U6sAJiQXSbMwkRZbANnULSVGkeapObDf1lm/hW0/0LrI6TT/Xtr1qmCSOxuYJB0JxZfTogGMtPXe7PE+UBgIqaKxHlIjtBVYpF2mFerhPqWcrSgge5DCUBZJscm0Vz9SVoChoI6z5Y+rwERBMHveWi6S8IVhm0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(136003)(346002)(376002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(31686004)(6506007)(66946007)(53546011)(6486002)(66476007)(478600001)(2616005)(31696002)(83380400001)(86362001)(19627235002)(66556008)(316002)(15650500001)(107886003)(5660300002)(8676002)(36756003)(6512007)(41300700001)(2906002)(8936002)(4326008)(38100700002)(21314003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjdjNzl1cWZ4WGNmbktVVXptbmd6VFllU3BNck9yNVdzZy9zcy85YkFOVXN6?=
 =?utf-8?B?VmU0WHlmK09Rb2pVbnRlRkhrZFlKZXFPalF0ZklJQ2tWcGNtUnJlWHlOaklQ?=
 =?utf-8?B?UjdQcWQ5UURDTlVnMTJrSUpiUXQwYlJmOUN4STNsWDJ6a3QyekVnbEVoNUVT?=
 =?utf-8?B?OU9tRzBtbDRGM0tlQWtmWDFCaXJoVTdUaDBNYkVLLzdVajVJYzlCbndxYXhV?=
 =?utf-8?B?anZpRnRzQ2ozbVVONDBRczF6ZUd2bDN3b1c5ZCtnanRVNCt6Yi9TYjl2bmpy?=
 =?utf-8?B?N0JkUzl5WlpqbEtMRDVhUy8rcjBYVlhXWjdsZnVrSTNhaHNyM0dXNWZCMTAr?=
 =?utf-8?B?YjRhREZrSW0rYS9VZnlVemNPZkxyRmFvRXRYblpORlhJK1RoSDRXNTZGS1NZ?=
 =?utf-8?B?SWVPdnZMQXI0YytzTGkvREFUdVUyWTM5anVWOVBRQVM4RWJvUHVuQWF1ekgv?=
 =?utf-8?B?VjB4cllKMldTMnRpQlZvdXovUjdDSWpncFhhb0orS0J2VU9JZTVjZjI0c1FG?=
 =?utf-8?B?ZE9aNk5DdHhDNUhoUjBhRTdRTUFHRURvUHlQblA2UkhNcVpvOG1PUUVZODl4?=
 =?utf-8?B?RGJEU2VkOTlWM0FjMDhuY3YrdWNxczVnbzkwZFBGaDJic3kyOUNvVnNyRUM5?=
 =?utf-8?B?MmxYL3NqeWJQN0JLVlFMWi9odFV3MVV2WEROYkMwYkJCQk9IZ0JwbWVCdmNK?=
 =?utf-8?B?anZuT2RtWUZ2Y29wdk1NeVNudG9VdUMzeHJMMVdrMHJzeFN4WkgzWEQ4cTVO?=
 =?utf-8?B?aDlVOHFhS0ZSTXppTDN3UlFySFI1RVplRGt5UGJzK2V1MlNtNGFrWTl6Q1A2?=
 =?utf-8?B?L3NKN2dwenczTm5YNmpGV2dBakFsbS92dFVKakhUbFJuQy93SjFWVmliTnFu?=
 =?utf-8?B?NU84S2k3SU5xRC9PWHdDVmFBTExmVjJCS212bmo5YzM4NjdHSnNQY1ByNncx?=
 =?utf-8?B?L1prUXJIU2FzQTFKNzZJcDhtN1pvc1F3cnd6VkkwK1hQSmlJS2orb3F6ZDJI?=
 =?utf-8?B?ZnV2dFh3cTAxWXFoMWlEMUhNaGFCTTdwbWtNY29kWlJxaVJ2UkpxRU1zc2Yz?=
 =?utf-8?B?eURucFgvVUpSSG9ySC8yUWEwc202Y2pQc1RaMVFsNi9uaVhWeTIvM3JvaWZk?=
 =?utf-8?B?ZTBGMnA0MUhFNFhyWTFJSlBFMU91bEd1S2RMTGdMWEtoRERXVVc0SnFMblc2?=
 =?utf-8?B?V29oZEEyWjdLV2REeU8zQjk3S04wRllEeUEyWkh1RjRNa1VIQndWVUErOEI4?=
 =?utf-8?B?QVVrTHFFaG9FdmFyZDZzQjYvcVRSMG9HYml5UFA5cmZjY1Mrek45ZXh6Ly9u?=
 =?utf-8?B?L1lwUEw4MjFvVk5kRFhIYTl6aVhTY2NiNmM3YmVXOTdkcWw2VEUvTVN1S3Fn?=
 =?utf-8?B?TkJSSDl0cHphdC91S0MwMFEwYkhhVzQ4b3JZT1p4ZDFXWEY2NWZHVTJvTXdt?=
 =?utf-8?B?TGVIT2dhb1dJZnhweG1JUFhHKzQwMmxLMWZJR25UMUprMit5TU95eFBFaVZl?=
 =?utf-8?B?MHpldUQ5dmJSQTBCU1BBQnpKQUNqanVUMFJhT2FacnVsWHdIR0QzUzVSUm8z?=
 =?utf-8?B?cldxak5hek9JZHVVUkJZY2ZHU1NacmljVXdoaHhDZC94VEtTaitkcjlwWk9P?=
 =?utf-8?B?QWhCbGFLL3IrN0dVdG4yQUhWNFNmT2QvRlJUN1lxWGZjQTNIenVsbkUrb3pM?=
 =?utf-8?B?czJyWDgyODFwNTlKV2k2Y1NWZlU3dUpVTlJGVkdCNkp3QlNWWFJ1K1lSYmFm?=
 =?utf-8?B?bGhYUmVzM2lpSDhnMWxEZ3JRL2RYQUhHRXk2V01aSDUwRUJNeVhVeXd2M2hn?=
 =?utf-8?B?QzBUWGNiUi9nVzFUZ3o3KzdGMGV2TFFnaGtTTGt1ckpqSTQ3aHk4WlhNV2Jw?=
 =?utf-8?B?TWJLVDFHWnJMaHlIK1R6VzJ2U3VVanR1dnViaTNTSnovbFhBZytocnFrT2lZ?=
 =?utf-8?B?dUpvV0FmZ2JhOUdBMm9yYTUwQnhyM0dGWUtJenlRNlh4VjVhTDZqelBwd1VW?=
 =?utf-8?B?RFlHYmYxNlZvNE1RY1lkdHFFbVpDOUw5YnhTNnpXRTdyUlJUclZUMWZ6eERN?=
 =?utf-8?B?T21NYjVYWlRnVG9xWXk0akh2NTdhakV0QnFjQ3FSemNLdTdWa1RFYU92NWFI?=
 =?utf-8?B?U0F3OXhYd2JVdXdSZ3FETXdML3RxNWhaSEwxRzVEeDQ5ckhZMndCTWNGOFZr?=
 =?utf-8?B?ZmJKMW1IeVd1SEM4bldDSDF3Mmt5bndFVzNVM21YbVIyb2RaYmFsU3FOSjgy?=
 =?utf-8?B?dHp1SERza2tuTXZSTnJhaUtkNTFnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58481007-e7e7-40a2-2295-08dc133b26a7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 06:53:15.4448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gdThWsSVAb/aNtJuqtQs4WqUAJHVGQVFQ11TU3CErSZUXNgQn8sBeibNvggXmooRbf4Amyhf8RsP96SaYPS87Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5977


On 11/01/2024 19:03, Peter Robinson wrote:
> Update the architecture dependency to be the generic Tegra
> because the driver works on the four latest Tegra generations
> not just T210, if you build a kernel with a specific
> ARCH_TEGRA_xxx_SOC optioon that excludes 210 you don't get
> this driver.

Same typo for 'optioon'

> Fixes: 46a88534afb59 ("bus: Add support for Tegra ACONNECT")
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> Cc: Jon Hunter <jonathanh@nvidia.com>
> Cc: Thierry Reding <treding@nvidia.com>
> ---
>   drivers/bus/Kconfig | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
> index e6742998f372c..b003dad62d596 100644
> --- a/drivers/bus/Kconfig
> +++ b/drivers/bus/Kconfig
> @@ -186,11 +186,12 @@ config SUNXI_RSB
>   
>   config TEGRA_ACONNECT
>   	tristate "Tegra ACONNECT Bus Driver"
> -	depends on ARCH_TEGRA_210_SOC
> +	depends on ARCH_TEGRA
>   	depends on OF && PM
>   	help
>   	  Driver for the Tegra ACONNECT bus which is used to interface with
> -	  the devices inside the Audio Processing Engine (APE) for Tegra210.
> +	  the devices inside the Audio Processing Engine (APE) for
> +	  Tegra210/Tegra186/Tegra194/Tegra234.
>   
>   config TEGRA_GMI
>   	tristate "Tegra Generic Memory Interface bus driver"

Otherwise  ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Jon

-- 
nvpublic
