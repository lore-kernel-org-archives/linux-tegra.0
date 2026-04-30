Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013026.outbound.protection.outlook.com [40.93.196.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E663FE350;
	Thu, 30 Apr 2026 08:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777538395; cv=fail; b=Ml/XaqlLAcBVGa07CJJ7LAqk+9VL+3vouFF3q+aC/OCx5EsvYqgznuziV4AcXk6V6yhHGbvAck2Zpx7taFPjEcDmsNXCsFsQ0EyS+tCoNMzMNHgUnF1tglCKNIlhPJqMY9iQXRkUGpy05QSWrTJa6dHWmmwURutcrhvuNyTY354=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777538395; c=relaxed/simple;
	bh=64AIAAjVfPqrFa4LIklzpn1ZaeVX4RJ8q7Hb+NhUzk4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WIsCN67xSQCQXRnHoabl4cvEitfNjUg28WAM3mHzA17qe5UsGtnip3Ck+fLZhMWcBTQg6pGQ83vDdv9Eq6OobbZMOV3ycduPh3Y+4S3It3pbXUYnBqKm3mo6Zv1HWeFP9NlgdHay7IvyLH9poeg1bpyHDHgpUiFLscfEIX3hz0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WoLtSlZZ; arc=fail smtp.client-ip=40.93.196.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WoLtSlZZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uhZ/AT9dUgndUCktqQHuvPt2UesIXwiTVl4z3zjVG1TvinT+vPLgfZE+JGZp+6tKWDkSFWfOVxReFPpwnOGi8xfAHDuGS2R+HyDbJv/kHA/Ze3MdtKbvpYIbkDTF8tVB15XR4jtnv63W3MbeoBfGctmNiYGqPAUieRIY5wgisMFS614U1xw5R4m/5pSJ4UI13EDZ4WgsPZr/hKlOfj6c1UYkW3Ubh5MazuEdISNigkVQm5PuPq86QoY7sHrBusBz590dx9PHRYhvJdnkwlIZBLR8EpGPWqDh5GWYEqZObEQeSns61pmYnZNxTk8V7qtxWNserviMA2mqIEgoS80Pxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ww2SYTZlCWzHVW7Z6m/yKjZtfYXvmcpui37WagX/61k=;
 b=GonEwBpSbClJ5lQokUZ30bqhTAEoqKIYYzhji7dUzq3xqzB/aotLjbc7nXnrWDgIbm9GYy+/fK1iklDQF3DPuLK3vgTdiyNE3ycbGBp5UVAvNIIpWQ+x+3fRQjPJaUCTCkhTHLKOANF45EaI5xv6ishxOOnq9FAudkCMrmuqT9uu31hVTSYJRvOGvF0ArBoSOljqA/5FxX2rYVEYHZDpx426RmoQEOnGhsboWyZnvfuIyZzmNwGMvnJOPKP1089CeChbPYfdM540ccbkF7zuCDD9WoWtDD4ZjMbYaTBblyXcKyYPc9H3DuBeJXj1vew5x02INjFeopQxRw3ZZRnEaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ww2SYTZlCWzHVW7Z6m/yKjZtfYXvmcpui37WagX/61k=;
 b=WoLtSlZZ4TmdW7w1fxcBrsbU+ySaOVa2JSO+R+2V/IQ3oiOUMIKCv3mBHrFFmL2fI3AFqYq6vaEU5Mug6aNODPVa10XoNLDHwloC9lQ34tv0xzH1JXKIE5wJiucV0naqa+P2nsGHBbQQuoOIUgi8WMzX6rDt2yiM1juyCnwz6c+qDXXiX0TNFSzNgDOOv73BFQIcSmIhbeg9ae2I5jm8q1RwBBT/ebxQrEwQ8Tki/oJ76W03c7fI0JK2YLyRNId8oQJAqMrP/TWObIyu16M/d5f+Zgz6p/m0KOalfriK76DKGJO/ClJ8BujguSuYyPvGt19CtWqi/zF5xSKffmpg1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by DS0PR12MB8366.namprd12.prod.outlook.com (2603:10b6:8:f9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.21; Thu, 30 Apr
 2026 08:39:51 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 08:39:50 +0000
Message-ID: <536e3912-9351-4825-b25b-776e4cd4c748@nvidia.com>
Date: Thu, 30 Apr 2026 09:39:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/2] memory: tegra: Wire up system sleep PM ops
To: Ashish Mhetre <amhetre@nvidia.com>, krzk@kernel.org,
 thierry.reding@kernel.org
Cc: ketanp@nvidia.com, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20260430070954.1005564-1-amhetre@nvidia.com>
 <20260430070954.1005564-2-amhetre@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260430070954.1005564-2-amhetre@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0356.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::19) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|DS0PR12MB8366:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ff7fbe9-18cb-4688-dd45-08dea6940b36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	SeC04pqgrpNZvgGo9QEL4HHvgiA2si4qTcjsBHW6CTBva4NQmit6Oq3sbaNkTMYyY79M8kj3T/eDI1eCd6cQwkSW7m2YGODQC0fRvG0aM5eAgGS04TQRKtq5i64tuAS+DjpzKeHjljV0nGJJiwzhOynZ6ydK2teT4NnxWJHwxSuxNao4/0p9Sa5dI2nkmeTk89jsXWobBZchwuTs62/U0zxEslMkEFdItX+hzh6AZrIewFaLJmZYe+BMpt5yC5xcVxsrOke5mmETHnEZ8hvArWr9x+kZW2yWEiyQwMLxYuA9eqgtH2pts4HfPc/nNpSL2E/nwsKbtdEW6093dNmIp/RrtKnmg2htgOPfPs2qtnGBksmZA2uvrc6am7SfkQzomNhVFeK+L06YHBCH1XPc0cyYeF0bUionsSbcBZRt4rsh9lhqRBSKK+GLbx0sZucBLISTfyJDQS0BTkEEoljbWaQ9uHkB0DAptZvxU4M2dR3S0dwSnkuOIicUQxhvo431T7z/+uBz3+3e6Is1+jBU3Z+/Q5w0n+G4zcvGI4uRHLfYWLI8bLVzMvfgJ8h7Qc0snnYHYZyE/pcG/AnpAwNkJtMAXxdcDZB1s3UCi4oYrS8SNE7l8zSyyP1f1MW+q42blUDPHUHDDO50pn2JxvN8TD17Mg4vVH6ZCOjZAfS+xwczzL/kNsy/6AAJUwHyKY9ndlNsQAPwet8la8tdC/geukUE/6Iwq0PEQ3Ndbs2FieA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UG9LOVhNTkYxVGw2ZldIRnFzczhWdlZCTmorUEJSbVVqVlRsTHEySUZkTVNi?=
 =?utf-8?B?dkd6RDk3RHpHcUkvTVdTd3B0cXdHcEFDeklyVmtSWFpTall6clVjWkFpVDFt?=
 =?utf-8?B?eXk3U2swbDdZb3hlNVdzSWY4Z0c1SzhlUXZxRWFNR1NWTlhRUkZIdzdXL1hB?=
 =?utf-8?B?RkwrejN6eitnODRqMFhRb3V2ZlovQmxRODFiL2lTNzFYcWhXSk1LSHNYL1Bh?=
 =?utf-8?B?SWRWeGpWWTVuUk94TmlSV3UrUkF5a24yNEo2NmF3L012TUtUR3cxNmZOTDh5?=
 =?utf-8?B?RC9kSHFJUnoyeEdaYS9wTnZDLzM3UjNGNW5hVW40bkZkMkt3NUpNZ2hYeGky?=
 =?utf-8?B?cmo2MlBzMjgvTE5GU1lpTytqbGpxdXF0OE10T2xEOG9NcFYza2dZOEtqZXVv?=
 =?utf-8?B?dzdhOU5NTE1Jei94MFBXRHYrZnNmYlA3NGF4end3Zy9RNlgxRUJnbFhNNWw1?=
 =?utf-8?B?RWR3dkVESXVqcGY1anV1L0Njb2hlYktSWmxyOWFSeWI2ZlhpYjhhUmNwU2kz?=
 =?utf-8?B?Q010YlU1UWNuMThRQW5rWElBbkIyMVFtRW1jNk9uNzVRWGE3cG1YTVdsd0Ni?=
 =?utf-8?B?czBsTXl1VFdGVzdnYmp2TEpwT25zMWxFU3NPYmRyM1NsQ01kWHJTdFc3T0ds?=
 =?utf-8?B?TVBGRmxEcVFCbmkwWExNRVJEOGpEbU9SQ1hTNWhNNlVVWkdQYlIrN3puTXM4?=
 =?utf-8?B?SHYydnRTRFRsTHN3dGUzcnJDbytaR09CbUYrTTdsSVQ0Sk1ROUJJVU40NGI3?=
 =?utf-8?B?YUVwNGJWNmZ4blJMWW8wV2dHR1BkUTZheENYY0ZsN2dhTXRtRFpXa2NSa3Ju?=
 =?utf-8?B?NjRtTXg0MTZyOTY5UmpkeHI2bDMzSlRpaE9LNWYyRndtUklVVU12QUlzSThT?=
 =?utf-8?B?SXJqTmd6cms2R1FCSVNpQkN5djZlNkNKbzZUZTQ0MVo0ekZCNFlpWDlKUEt5?=
 =?utf-8?B?c3RFYW9Lcy9KSXFwM1JDbVcwdnFJVnFxVGhnWTA3Njd1NTJMKzk2d0tSOXVu?=
 =?utf-8?B?c2s3Y0diMU80TXFhckN5U1pTaFRCT09GbGpPbnZma1dCcldpMWVjZ0NQY3Fv?=
 =?utf-8?B?Y3BiK1hMTEpyZjRCNGFSUlVsemxmR1ZhMnlFMVBzQ0g5MytVS3BESEhVY2J5?=
 =?utf-8?B?eDRtUk5TRHJMaVMvL3J3aThkQkJGbjd4OTh0Z3RqWmVLRFRmQzZtTjFqM0VW?=
 =?utf-8?B?RDlpWndUUFdvUDBTb0tnUW85Y1VEZVRZZER6VjZQejdXYWZFN0ZWK3lRTHZv?=
 =?utf-8?B?QlNwdG0yVkN4S3FEK2dqY2gxVXh6anhPYVJaSXhiVE1xMW9xcmhwaVY5elBt?=
 =?utf-8?B?M3h2bi9xa1VSKzlzUWo4S0lEMFRuK0lxdnNPdXFhb3l4Wk54dzlOVWRHS1Ey?=
 =?utf-8?B?OTMvczJaSmt5bXdhM2dZMzFlWUFySGpEQzRnSE1wdk5nYVJqS3ZUVWlpaEtk?=
 =?utf-8?B?Y0ltcmhjd2pYQjhONzVNc0FaKzJUNkNydVlMQzN4WTV4dHo4aDZMMlhDdnZu?=
 =?utf-8?B?NURZYnFKbXF4M08zUHk0Qlp0a3VCSFRCOHBOdVVSYzc3d1BySEI0OVRQNXpp?=
 =?utf-8?B?ZXdVYXFWR0VwZ0Y5THdQZXQxQi9hNk1jc2V4eE9VYnVHZ3hoZ1JYRWlxdmkx?=
 =?utf-8?B?VDBSbFhsU2NWMm1BdXlwN0N1QnpTSmszVXk5RURkSG55QzRPQkxUM1ovbE11?=
 =?utf-8?B?TXh6QTZFUWMzUThKSjRUVlhTNmpzUGNOZExkS0ZzTDdIR3JqRjk1TEQ5QVg0?=
 =?utf-8?B?UHNSWmU2QldLMHBCZVpOZkFwRk1aMVdDWVptU0x2WERKMkgvYzZ2SHAzb3NR?=
 =?utf-8?B?YVBjbzRpVzZwVEYwNHYyMVNMKzZFKy94V1cwTUtNR1diYkdualZ4UTJGM09I?=
 =?utf-8?B?ZTArcDhUTFZSZEtmUmxDaUJvUEdXS2t6SWZRd3NvRVdyMHJTc2UxZ3Nacm11?=
 =?utf-8?B?d203dHBsaUVXdUtDQW1ZZURLeEVlWEdqZWtkU1UvT1BuN1FqVUxyQW53b2wx?=
 =?utf-8?B?OE9UR25CV0Y2T2pzWUo1REVYaWE2azNCVUY2REEzZG5MRTI4SjN2VWN6U1Yz?=
 =?utf-8?B?S2RtNnFhYVo3dTN4V05TSnBJM1JLakQ0VDFmRThmTUpjUVczVmc5ZmtpVHFl?=
 =?utf-8?B?N2NQQ2hhTkVtOWY4Q2JlcGNFcGNpVXIwVWF2YWNjNjZEZ2QzN2NYZXIxNUZB?=
 =?utf-8?B?bHhBbko1NEI3WTRzUzlHNVFuV2JOQVR1S2xLRlpWVCtaSGY4L3N1bHppS2l1?=
 =?utf-8?B?eUVpZEJmYytQaGJUN1pZdUduY3ExbWFvOGFNQTJlTlBEWFFORlozbzltMnRu?=
 =?utf-8?B?QjVubHpwS1N1UlhuNEY3WHpFKzgrUXg2bWxBa0xSSDdkY1ZGN2ovUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ff7fbe9-18cb-4688-dd45-08dea6940b36
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 08:39:50.7617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MKnbRM1NedBNPn9kBuu4IKGSaVOHLboavg/2w7wT6BIObgQh/eUv9wiJfoIt1C4N+hJRLmDRD7vFPN0baRtuUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8366



On 30/04/2026 08:09, Ashish Mhetre wrote:
> The tegra-mc platform driver does not register any dev_pm_ops, so the
> the SoC-specific ->resume() is never invoked (e.g. tegra186_mc_resume)
> on system wake. On Tegra186 and later this means MC client Stream-ID
> override registers are not reprogrammed.
> 
> Register a dev_pm_ops on the tegra-mc driver and route the system
> resume callback into mc->soc->ops->resume() so the existing SID
> restore path runs again on wake.
> 
> No suspend callback is needed as the resume path reprograms all MC
> state from the static SoC tables, so there is nothing to save.
> 
> Fixes: fe3b082a6eb8 ("memory: tegra: Add SID override programming for MC clients")
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> ---
>   drivers/memory/tegra/mc.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
> index d620660da331..343ac0018eba 100644
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
> @@ -1010,10 +1011,23 @@ static void tegra_mc_sync_state(struct device *dev)
>   		icc_sync_state(dev);
>   }
>   
> +static int tegra_mc_resume(struct device *dev)
> +{
> +	struct tegra_mc *mc = dev_get_drvdata(dev);
> +
> +	if (mc->soc->ops && mc->soc->ops->resume)
> +		return mc->soc->ops->resume(mc);

I noticed that the tegra186_mc_resume never fails and always returns 0. 
Given that this is the only resume handler, it seem that we should 
change this to a void return type and then we can avoid the extra return 
here. This also simplifies the next patch. So may be we should add one 
more patch to change the return type for this resume callback.

If we ever need to return a error code in the future we can add back, 
but if we don't need it now, then I don't see why we should keep this.

Jon

-- 
nvpublic

