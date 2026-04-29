Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012048.outbound.protection.outlook.com [52.101.48.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06823B47E2;
	Wed, 29 Apr 2026 09:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777456430; cv=fail; b=WxXNzsnFptE7B8BJvZw1NsHTuYj/TSksjPlkDbIM1bVbvExya2apihcF1nxODKcxfXF6hB/NGvasEp0KeWd8M6SSYpK6/R1y9YKEYRg1YQPkN9fmb+47WA7zZaWpJpgxOehaqlLVSrnuk3Rk8uMoGSy/OTyD3LMQsmPv4hRYlMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777456430; c=relaxed/simple;
	bh=1hsap66yfE/VpEYoC3WPpEdTnjmpI+7qhmAcm/pbxgI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mdGacgYE+JtRWRMLVFw96pKLvUu3yi0ISWlQ5MnT7spNZhS/wCFl78cf6UMRNI1mK/fLkKmCKaPzRHRUw9TvJ9A6j2YaSkdmKoIb7oOjCJwtHx0gI0+3tbU6L61LtCQdrYrpM8jp+oCu1B+K7xaKxE4/upOPJvMbKQknQLPtMI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rZLFFydU; arc=fail smtp.client-ip=52.101.48.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rZLFFydU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rynj4KLEhKMNvr5LLUyYrVLjmV3WtYz77n1uZ3F5+B0VKPPbbunNxqFxH24SUg5DPRbVopNOehU2Nyk88/TneqPSbX4hyVSSMkI4/pEVZsgxJL+v9vwU5nxGkmRWPy5RUsi1ORudHub8IANktriTUJVq6BPgzpCgjJP+vO095ziJ4HuLRQwpxfqSXNZMsm7YMs0huxIv3d+zYRXSrOB9U0kyMA1ETGMIbeogvb7PAdILrDVT4Lc538hrwv+VRWkqDgrgq3/r9F6ZlE4LhII8xBgWuoFx8+0oP6rWcLNr1gPHvAojzMygKocZy/pPhxn2eRonPRUbm0DwQ3A/nScEcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8WPM4xfGV0RmONVnPqSV/9f04VRzFE6awkJaeblcTGM=;
 b=ZB6PP3SryxJkD7AsruC4p11inuCd4Gd4PcvLaED/aDPtAp3j4hZ1cQxK3fyAJv5WeH++DTAKy367aNODuTuHAmKo9aWd7q8duKUIlZpOlVQ5XKbqwS8HE60UsTyrQrgQmYe3SMnOBv1ZtKL2toaztL3nJVrkezawB7vQOkgCTGYloog3+H0Xu1ohUlhzNA/OVBxeL70fFhp8GON8WhdXXei/Z3ravVsiVIvf/r0UtbvYv39a+4FjDKhtSi/VnTRDawqi/1YOxbe7mJ0c29DY7rGUBlB45NHXMnuk17aMX3kQh82A4J56fafwgJM2gMN8JS/0ftRF99EDAXT0R7PqHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WPM4xfGV0RmONVnPqSV/9f04VRzFE6awkJaeblcTGM=;
 b=rZLFFydUzqu7cQlK2GDhKCHlpdV/EKHofIhPLiaZEYJswEy8WIFjkk7rWRsECyzk5kaLn4yitqDQIoA86rSADZ2sGyW3EIvf3TS+iIXYYYVPqZOZdnrB7kklhqWoyHl0wdU5okzVyRBQQs+LRy+8RBrj/bLeM52OfslQEWorV/N9l6wQR94DCwi70Opeexs86hfYg1qGR3IVDMuunjNpOGExu+JDwkIhAbd6U8mEznkDXrw1FG+4w7yEzdxMCQZBuWDf25oDf6uwbssgQJH0+o7gRtHOXfU80LpPYqKNciSJcuTU1Oe15Ghvowp6GEPno8t/i8ex/09McT+Vc1xVzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV5PR12MB9754.namprd12.prod.outlook.com (2603:10b6:408:305::12)
 by DS0PR12MB7584.namprd12.prod.outlook.com (2603:10b6:8:13b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Wed, 29 Apr
 2026 09:53:44 +0000
Received: from LV5PR12MB9754.namprd12.prod.outlook.com
 ([fe80::9667:3c95:27d2:73da]) by LV5PR12MB9754.namprd12.prod.outlook.com
 ([fe80::9667:3c95:27d2:73da%7]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 09:53:44 +0000
Message-ID: <7b8dde16-83e4-4a66-9ea7-6427b37ced78@nvidia.com>
Date: Wed, 29 Apr 2026 10:53:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] memory: tegra: Wire up system sleep PM ops
To: Ashish Mhetre <amhetre@nvidia.com>, krzk@kernel.org,
 thierry.reding@kernel.org
Cc: ketanp@nvidia.com, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20260429061122.807346-1-amhetre@nvidia.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20260429061122.807346-1-amhetre@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::26) To LV5PR12MB9754.namprd12.prod.outlook.com
 (2603:10b6:408:305::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9754:EE_|DS0PR12MB7584:EE_
X-MS-Office365-Filtering-Correlation-Id: 095ae90f-71ce-4ec9-3e32-08dea5d533a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1dya1svaVoxQuvvGgruazY38KkbcrhVcGkcsddzCX30K4Cf8i87DV6jJ/w2xsGiqx0AbYOBJLwSOr4t1TudXpz7y2ibpSGsE8KgxlmlFWZSEnt+c8/AAksI1G6RQQvSSytcdgjJO3YA2/zg37ZMT78iN4HcmHiqx52U3GINx3u6GMPUPv9hy8TIto8+81rAl97dDmTkzTdQ8MxIQrC54mSDupDWNTQgo3lRg5oDIG5eAJSLPGvOlQFXAW9sOQKp6Xz7W0zz+VS1nUDUx9OyJ98IfubpfuznE0abwdbHDME1yH00lPeGqeo1+f5Iijf/Z9xtfKbJYzLeu/9RnONTkUNoMA1164VOp9LjWIbVwCRM6qsz4QYVk1Hp8cv/OF1HmCMRj6w0r6XOhJ4aWuJhr0pO5GAvaTDIGwi5q6TMt6WNY8k7o/SEXn5vPCWlnPMp5jNR94jnriGk34PM1rUpTmds6E9rbb6KQoDs+uzoUUYd3s5eMwiSHiuxq/BUAbM+fA/GQUe+yPCUfjMjI1UbyxhQKjhSN5a5nwe73Fn5BQlF6Sh9VOk2aIOEuuL8Aw6cOv9wCe0zDh0TA/2xkJ87c9n7DPNm2HZ6m5iBWi5lnmoJLrR+yciJE/+71pH98bFqwM7rvv5evx7hB1Q9w2Y3irmiEy9pq10AsG2M/UiPdZHiDhu/cnd91UmI/cYSpCf7WB/Lr3Nmw/teGJvz1R4YF7DOiz+EdKDQ2s6PJx6IYzBM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9754.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2w5SGRGQXo3WnNNZEYycERaYWk2TlkxUko0aW5oU0MydlpRa2xaVHdDcjVz?=
 =?utf-8?B?a2hPdFBHSHdXQTM4dFEvc1dsS1R3aVR1VHVXRG5YQnF1UXVEV1dLTE50ZWhr?=
 =?utf-8?B?bzVMdjNlNmxIV05zZ1ZGUkFvMUVvZCtEbThuZUxqeW5hYi81UnUxWTVlMHhC?=
 =?utf-8?B?SEtnWUo3MFd3UVVCS0ZUbGhPWlNLeDZvMDV0ZlJScUIvTThHWFBqMDYvbUFo?=
 =?utf-8?B?bHdNT2NWeUg5YVp6T1lGVVp1Mm83bVkxL0dlays5SDg1RTlldnRPMzBpckVh?=
 =?utf-8?B?WndzNk9tOS9uaWtxUlRKckwrQ3VWQUlXdDEvcTJ4bGkzcWV4bENMVnB1ejVN?=
 =?utf-8?B?Wjc1dUJvUjE4NldqZ0UvRUxNK3U4SndRTnhuUXRxWks4OU9UZmdlS3V0azJJ?=
 =?utf-8?B?RGZ2aE01TG1YUE9mL2Mwakk2RjNRUUJLK3c1RjVTcmEzcmpDKzNka0YzSHVB?=
 =?utf-8?B?UmVXY3dwTUJnZ2phRElCeUpFSmVrOXJtRmd0VjYvNysxR240L0RVS0VzRzRt?=
 =?utf-8?B?TE9xL1JlQjJ0VVpNbEN6Q3h6N3RydmNmTTUyMWJNeG1IbFlDTHFzMExYQVps?=
 =?utf-8?B?SGFEcXo5OU9WTFpOVGhBYlNqTWZMcStjTG5QK082UXdjTHFPTXdEMWNTelMv?=
 =?utf-8?B?dWxCTFNoWWJ4Sis4SVlONlA1OTNFZVVPaFJoWlVNbWNBL2tETC9VVmpUU2Vi?=
 =?utf-8?B?REtybGhnbm5RN0t0NHFQWDJqYTZsWUJCT091cWdQOC9MZnpVTEx1SWhtbHFU?=
 =?utf-8?B?QmVGSE42Z2IyNEl4ckdiVDRlTVp2cGtwNG9PaEpVRmh4SnZZalVCSWxuZHp6?=
 =?utf-8?B?cEVYdHdwbWw2dmJwOW5GTEtyUUxEV3M0UGNjSXNLZ083WDVWTC91K1E4WW5S?=
 =?utf-8?B?SForaW9IMXhrSmE1QW5BTXVMSzBtYzd3akgwQ0pabmtHanUxU0pibG1NNEVm?=
 =?utf-8?B?U05GWG9tZFphQnErSlEyVEZKbWd4TCtubU1GTndKL2RqajBCV2ZwR21Xbk1O?=
 =?utf-8?B?ZldBclFKbUVzT1NGQzZTdTAwTllSdzhQRDNuNXJLT2UreXRKYkRXMDA2Tmlo?=
 =?utf-8?B?dEQ3QWdKNThsQTA3OUJMd3lEOU1ZNmNFQzJoZm1sbHRpOHZUSzdiZFlzeDNV?=
 =?utf-8?B?eElIdUwyRVdPOEp1aTFsV3Z6ZGZnU1UvVmlmMzllSUxoM1JnektaYkp0a2Np?=
 =?utf-8?B?RjgxWkpVVGZSUWw3VDBkV0dKR1JHWnBWbWRaZzZNeEdDOGFtdzJHa242QkZV?=
 =?utf-8?B?Zm42VDJMT0lTY3pNdVNTb0d5L1NRRHdWeVh4UU5TeVhvN3NzS3dYQ1BkYTd6?=
 =?utf-8?B?aVFYZFc4L3FLdjdPRVRzRnh1ZmlxMDNDeXozRit4WUsrVW96bzZ4eC8vUklS?=
 =?utf-8?B?SENQeWNaeDhrKzNIY3MzTXFUYkZCK04yemlRT3c3eE8wb1lOYTA0SGNCb015?=
 =?utf-8?B?QTZ3QXhQWEg2RlpRUXFWTG9QUFYzNENsRUNGTC9vb3JFWjJHb050VDV5K0tx?=
 =?utf-8?B?Y1BxUGo2dHdRUnFqb1k0SktBM3pPQzFMb2xuVWE1NnJGSVVhSEtWRjUwNHJs?=
 =?utf-8?B?dkFFa2tmb3BWL2VZb21XQnN0QkZlRVJxQTc3NVJ5N1ZLYVZIc0h1K20zTzRr?=
 =?utf-8?B?V1V6NWh1ZkRFR0pqdEh4QzUwM2czOGp0TUk5YmZQSU5PZVJjbmpCdk1qWWlo?=
 =?utf-8?B?TENEaGZJbk1RRzlkVHpwaGlxRTVLZ3N3RGRIMHh0eTk4emwvc3RadWxzbG1R?=
 =?utf-8?B?RFlscEp6Ymduc3lkYVRBMzh5VzkrSXl3YUJTRHdNMVVXdUZKZGFDdnRHN2h3?=
 =?utf-8?B?UVBaMUI0aWxxQWlLRWVma2N1ZEM0VjhETEo1bmR6UGhxVjZESHg1NE5FaVNq?=
 =?utf-8?B?VVdTdWNLM2pjbm4yaGJhZ2RFUDNkMG9nRSt1OC9Ra1lLM29ubWR5ejB5TUVa?=
 =?utf-8?B?OVdNMjlQU1dpbDlndHY4KzYzbTl6citVOFFjTnVRVTJFYkhnbmdlQmlDZWNM?=
 =?utf-8?B?THZOaVE3MlJycHBOMFZaWWIxNCs0ek5mMDF5dlhEOTlFMmF0MWxob05IMU1K?=
 =?utf-8?B?Q2kwVER3MG1wcFhLcnQvcmRkVkZmQXVzUWpscG5Zd0xwampXUXZYaU9iMnNC?=
 =?utf-8?B?VGlyVlR6M3l2UGJ5RlZOcTZEV2Zsc3kvdGh4ZXhXRzQ0eWE1Z0M1N05wVkE0?=
 =?utf-8?B?MUl6NSt0bWJPNDM2VFBHZXJjaUpUM0dYR3FzWS9ETTNVVGhER3lFVUphZFll?=
 =?utf-8?B?ZncrdmJQL05jVmNsU0JXZElVR1Rad0hReEhuUjVEQU1MYi9FcFZWUi9PVDVY?=
 =?utf-8?B?VFBaZXZpd0JURExZRllTczdManJ6SXZMUWRVOEJJSEQ1L3Zac0JsZnlmcmdk?=
 =?utf-8?Q?Qw6RVgaiYt/FNNgqRuzhmiCvnCEXN88ZFyJEjv9e7nUzM?=
X-MS-Exchange-AntiSpam-MessageData-1: TS7J95t39l5Hjg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 095ae90f-71ce-4ec9-3e32-08dea5d533a3
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9754.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 09:53:44.6831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5SZn+TxoBTaDMTwCvXbYhrdW1p0eIkWV6nTaczlfXJuORlWgLpR6Lw/x9P6WDKK9PyWUgEEiqvroBQBEeUEGSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7584


On 29/04/2026 07:11, Ashish Mhetre wrote:
> The tegra-mc platform driver does not register any dev_pm_ops, so the
> the SoC-specific ->resume() is never invoked (e.g. tegra186_mc_resume)
> on system wake. On Tegra186 and later this means MC client Stream-ID
> override registers are not reprogrammed.
> 
> Register a dev_pm_ops on the tegra-mc driver and route the system
> resume callback into mc->soc->ops->resume() so the existing SID
> restore path runs again on wake.
> 
> The MC interrupt mask registers also lose state across SC7, so
> re-apply them on resume. Factor the existing intmask programming
> out of tegra_mc_probe() into tegra_mc_setup_intmask() and reuse it
> from both probe and resume to avoid duplicating the loop.
> 
> No suspend callback is needed as the resume path reprograms all MC
> state from the static SoC tables, so there is nothing to save.

Technically, this appears to be two fixes ...

1. Register the PM ops so that the existing SoC specific resume is
    called.
2. Reprogram the MC interrupt masks for all SoCs on resume.

So ideally this should be split. The first part appears to be a fix for 
fe3b082a6eb8 ("memory: tegra: Add SID override programming for MC 
clients"). Although the 2nd part is a fix too, it is only applicable 
after 9f2614510960 ("memory: tegra: Prepare for supporting multiple 
intmask registers") so may be a fixes tag is not appropriate here.


> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> ---
>   drivers/memory/tegra/mc.c | 46 +++++++++++++++++++++++++++++++++------
>   1 file changed, 39 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
> index d620660da331..cddcefdd16c5 100644
> --- a/drivers/memory/tegra/mc.c
> +++ b/drivers/memory/tegra/mc.c
> @@ -13,6 +13,7 @@
>   #include <linux/of.h>
>   #include <linux/of_platform.h>
>   #include <linux/platform_device.h>
> +#include <linux/pm.h>
>   #include <linux/slab.h>
>   #include <linux/sort.h>
>   #include <linux/tegra-icc.h>
> @@ -910,6 +911,19 @@ static void tegra_mc_num_channel_enabled(struct tegra_mc *mc)
>   	}
>   }
>   
> +static void tegra_mc_setup_intmask(struct tegra_mc *mc)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < mc->soc->num_intmasks; i++) {
> +		if (mc->soc->num_channels)
> +			mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->intmasks[i].mask,
> +				     mc->soc->intmasks[i].reg);
> +		else
> +			mc_writel(mc, mc->soc->intmasks[i].mask, mc->soc->intmasks[i].reg);
> +	}
> +}
> +
>   static int tegra_mc_probe(struct platform_device *pdev)
>   {
>   	struct tegra_mc *mc;
> @@ -970,13 +984,7 @@ static int tegra_mc_probe(struct platform_device *pdev)
>   			}
>   		}
>   
> -		for (i = 0; i < mc->soc->num_intmasks; i++) {
> -			if (mc->soc->num_channels)
> -				mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->intmasks[i].mask,
> -					     mc->soc->intmasks[i].reg);
> -			else
> -				mc_writel(mc, mc->soc->intmasks[i].mask, mc->soc->intmasks[i].reg);
> -		}
> +		tegra_mc_setup_intmask(mc);
>   	}
>   
>   	if (mc->soc->reset_ops) {
> @@ -1010,10 +1018,34 @@ static void tegra_mc_sync_state(struct device *dev)
>   		icc_sync_state(dev);
>   }
>   
> +static int tegra_mc_resume(struct device *dev)
> +{
> +	struct tegra_mc *mc = dev_get_drvdata(dev);
> +	int err;
> +
> +	if (mc->soc->ops && mc->soc->ops->resume) {
> +		err = mc->soc->ops->resume(mc);
> +		if (err)
> +			return err;
> +	}
> +
> +	tegra_mc_setup_intmask(mc);
> +
> +	return 0;
> +}
> +
> +/*
> + * No suspend callback is needed because the resume path reinitializes all
> + * necessary MC register state (SID overrides, interrupt masks) from static
> + * SoC data tables rather than from saved runtime state.
> + */
> +static DEFINE_SIMPLE_DEV_PM_OPS(tegra_mc_pm_ops, NULL, tegra_mc_resume);
> +
>   static struct platform_driver tegra_mc_driver = {
>   	.driver = {
>   		.name = "tegra-mc",
>   		.of_match_table = tegra_mc_of_match,
> +		.pm = pm_sleep_ptr(&tegra_mc_pm_ops),
>   		.suppress_bind_attrs = true,
>   		.sync_state = tegra_mc_sync_state,
>   	},

Otherwise, the change looks fine.

Jon
-- 
nvpublic

