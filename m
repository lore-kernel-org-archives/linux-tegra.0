Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012053.outbound.protection.outlook.com [40.93.195.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08821CBEB9;
	Thu, 16 Apr 2026 21:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776373589; cv=fail; b=cL1zC4eJmQww+2mlHODjvGDeVuq+oDjy70yAFGxSRDYciG89ahUmaK1wpdeaOkUIT5zTCyTaRqzymmbPJvUHpIzyb3xCeRaBgmSUPzyko7tChYwItTtWslGe9lAErvtfIjiXTPUmtlHYv30XfqkxfbzshwOshBMFc1tKemcTprU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776373589; c=relaxed/simple;
	bh=6Z9rdsuy3sUUA0dImyryrcIRj+KF8KF2aT8AYftfLoc=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Va5WLWDzX1CCIb5FfSGWKWQ+GXZSj7VPgT4KFLU/lNfw3p00YidImma8bukezwdbPQ8uug882/xcyrQvbUKmtO3ppbmtbD93+cRgrBe8pNus2zlzWF3JBYbqIX4CEC8bzz7w9MWtR+8y7mPq9ZnBxOlsCEr+GyZCVjPYVmHoF4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=g7P47mV+; arc=fail smtp.client-ip=40.93.195.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="g7P47mV+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TRebixaQtuiQ9DKyJHyotgLYdjo0p3qQpjOTr3ZS1eSEOhxGJidwDPtLY25RUZRMV1ag4m/apnj8fBs3tdT9pxl0u4s31j2PfVvbePhgV6uJ6MaiRLmiDsEIvgEEA13P2gC07bL+D3wnVckYsyZWzu5hPFv5w6Xm81E9q17GOu+FxDvHx++I7liE75f3IOIkBxCVfur0TFq6q19tck6hbMlyJ9Hbwre+/3uuRsba2vwTy47JoWnC2u/xuyHIqrvyWrXMbITGQGTAhTkFBuPxbs6c2AdjbYa25HnsyTxZK8FzryKH71OUbK0m0YV0H4UGL9OEAc+vCZlPlTegCeoCUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6na8/DOhINk9YxYSbI3GJfGuv7sy2fxCgNKdsBeCsE=;
 b=he841s/bjYV7706FwUVv7CoLSyz8lyi7Hd8hbkW3WwvOEYDTvMClOSKJmO0OSWRkYm8sRZe74SwWpqT2foIqdKyP9SjpSzMPbT17WCr6uAgUK1Y2yZBD0aMnYCFER6/vLf7JW/Cwof8jAY+VZODEpeD7hv5iFZ3nGKdSx0aldxakRt9JdOS5JTvngUZRUTfwuiVnPe5ZSStawsiGoy/2I5aHZ/Ypd1MMB9qttzCUtGT7s9kvAeuutKsDCwUdefI/llw092T6q2GmibgTk2RAnyMX0GSpwvDuVsXZSF90oDZmtoFAgLOzaL1nS5ObjIS6MKGNZE2bdmFhelIBnwKuDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G6na8/DOhINk9YxYSbI3GJfGuv7sy2fxCgNKdsBeCsE=;
 b=g7P47mV+/vg8mvWinvt+DAVACTh43xos6f8ihnA8dymLi+Lx74fPQW5B7YsEQ6R9+bSpDHrY8nsSM/2YTodBnrXwZN4kSjZC0hro1dDDZAG/NYH098/DfpLbgF+OPu4u7z49Wl6qAJglYCoqO36LWIhW8jQOQJBNY+1a8IvFthMZGpHPP4Mjr80vgef7W5bTRi4U8L4YldUnx7VSdhwT/6ihBh3j24XaBDUfz1mBIts7bleGYID9LKPq0zPi/HTHcc4wjuLMJZO3/w9lD7rb64Z3vudAd3kNrzmWIePhp35/hRYqL0giyxxwYcG3lyXtR3IEMY4oSo8JCTxvenJ2vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB6329.namprd12.prod.outlook.com (2603:10b6:208:3e5::19)
 by CH2PR12MB9541.namprd12.prod.outlook.com (2603:10b6:610:27e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Thu, 16 Apr
 2026 21:06:18 +0000
Received: from IA1PR12MB6329.namprd12.prod.outlook.com
 ([fe80::eadc:c846:73e9:8ccc]) by IA1PR12MB6329.namprd12.prod.outlook.com
 ([fe80::eadc:c846:73e9:8ccc%6]) with mapi id 15.20.9818.017; Thu, 16 Apr 2026
 21:06:18 +0000
Message-ID: <a5b85910-4c63-42c2-9bf4-73a441b0b296@nvidia.com>
Date: Thu, 16 Apr 2026 14:06:14 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: tegra: Add GTE nodes for Tegra264
To: Suneel Garapati <suneelg@nvidia.com>, jonathanh@nvidia.com,
 thierry.reding@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org,
 amhetre@nvidia.com, sheetal@nvidia.com, kkartik@nvidia.com, robh@kernel.org,
 pshete@nvidia.com, timestamp@lists.linux.dev, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260408212413.217692-1-suneelg@nvidia.com>
 <20260408212413.217692-4-suneelg@nvidia.com>
Content-Language: en-US
X-Nvconfidentiality: public
From: Dipen Patel <dipenp@nvidia.com>
In-Reply-To: <20260408212413.217692-4-suneelg@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR04CA0010.namprd04.prod.outlook.com
 (2603:10b6:a03:217::15) To IA1PR12MB6329.namprd12.prod.outlook.com
 (2603:10b6:208:3e5::19)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6329:EE_|CH2PR12MB9541:EE_
X-MS-Office365-Filtering-Correlation-Id: 08d72d72-1cc0-46bd-fa10-08de9bfc00bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	KTD2rlxbiH1QEdrjXbuIA99egF2Wo9pYtJNostdtFkFPgTzsxg72WYiXbn3kbMcTVhfqmeSqbxBO+LL1efN0b2iSflBAgqP+ncPfeRFYvt/rwcdOH49KFxcdn6PRWNLuzSRbdF/h0tfCKbAgXtY8XRQ6d8XXYGdT1ynswazzg7uZL7TKqlcxrKQ4LESci9qeqHIM2TZ7AWuxOfdTyZ0p89f7UBaDYN3wWr7GK1lwC37VBW66c0/GhpY546XQlmvf5YmBR6GqCfalSwup6PfDqOgxzxBnyBW09pxLMlMIec2Rwqd8+cQBXviRysEPriw72Z1y0aOZo1pC5KntV4ENlxT1baFrxz++HCUsWIwmsOdxd4aXkKS3CgiNlZ9Y50gYfVDE6UvKfz8X0b0LEx+abdhoszVfgY5EGL04+nM6WurGTXmPjFRHWRdgTo3iWfvSjcBaSnwLh2ijDafp7q6o0+7oeBp5zed1bTVrgRHg57mD77Ks9kITgWwDnyi5E17y4TBL+CyDEbVhC4Supw2zeeeIbWMBFR4Y61GLyAxwvfbHoQqxW7gPKgNRMzxFboKuw/ry6Tv8O+XH9syScraWXd8jgxuQyu0JZKieJPEfEITL07kKVXFSkVcxsAXWCwRAIYyepboL3nhKmLtovfRjdwu6x8kdASBYno3dL/InpDlxSc7tGlRE/vCVkaxTimceoTfReRN9I0DPxGdH+m2bkNPNm4OMGgIRJufo+q9KIBmBd7XDCcugDevivs6p0xqBEP001a/0xmgkEYAbdDnBCw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6329.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2tLRjVJRXZram9kME5KeE03cDdOTEs0NU54Y0ZTMXN2d1FTOVRpL1Z5cVI4?=
 =?utf-8?B?RXptS21XakZNZ1d2S3g5QysxbzQ0UEZLR284Snl1azlqZEtwY29pbHh1Wldi?=
 =?utf-8?B?OFo2Q3BtcnhWSndyUkFtek9KSDdYd3R3emFjV0wrRkwxazNmOWo5U0FhZ2FW?=
 =?utf-8?B?KzM2dHA2SmFyRU9KNFFqbTJwSjhodmlYRGcyTmYwYW1ZQXhJSU03SHdORi9Q?=
 =?utf-8?B?Z0p1aytrTXpjS0p1VTFVU3k5NVk4T25pbGJLVDhTcXJwY2lmUTlzbU4rVkda?=
 =?utf-8?B?R0JZN1locFZTRlBtbVZSV1BPQjFXYkR5UHFPVDFUNVppemo1Rms5ODhSSGtj?=
 =?utf-8?B?a0lQeWZXd2syb01XaUorNXlEM0xLUlFyUG43YzhWWmNRaWN0SEdaa3ZnalVa?=
 =?utf-8?B?TDh0STlTN2RvKzFmMzBCaHFtOWNRN3ptNHNtZnUwbGNtcGZDVlhVOGhlb3dH?=
 =?utf-8?B?citVcTU1eVB2d1hESDhlYmhRNWQxdk40L0xyc1QzczRBYURPbHlOVnlUWDAr?=
 =?utf-8?B?NmFBRXRpeDZ1cGNTOGpIV3JxdmJDZ2lYQS8vbWVFV2tUUGRscTc0TngweHRt?=
 =?utf-8?B?RzE2OXV1U3haMlQ2NkFqTHliSjJ5TGphM3Y2MmMxRDA3ZWFFWGtGVjBhZHJT?=
 =?utf-8?B?T002TTk1N01aV2xTb0x0R2lya3hUWXJtdW1wTXZNcEltR3hEVCtLa1ZmR3BV?=
 =?utf-8?B?SEk3NFppUytOaHJ5UGJZSndYNWZYUmlIQVl1S1kwTmxWcWtRUGpycGpqK2ox?=
 =?utf-8?B?bll4NjA0NWM1NGdCZUV4UjZPS0QzV1UvV1dGVXEwZWFaOVNOL3YwWWJoRlhT?=
 =?utf-8?B?QnVwQTczWUpST04yNmMya2J6b21QRmhNdVg1MXVBVmduR2xxUVpYK1ptUnY3?=
 =?utf-8?B?VXhaRUZ3YXZIZlpvd0pVOWtuUXZNVHJwVVdaZEdYVzkwWm5sbHFmcHZYQlpw?=
 =?utf-8?B?ZnMwVVhUNWVQb0xMS0RYaTIyYWlRZ2FQQWh2NGpDZ1Y2c3ZoT1Z3Ym1KQ3FJ?=
 =?utf-8?B?VG05RGpRbFAvYkhPZzdjNzlvajFpUjlqb2p2bE5NalpwaXB3MlFtbnBGM3Jn?=
 =?utf-8?B?QW9UcktKcG9HRHlQWEFQT055ZFNaUE9YaW1jS2xlSDRoSnFHaGpDS1V1cXoy?=
 =?utf-8?B?K3Y4VXVCK0kwS2o1cmZLUEtKdmlvNWZMc1lGVDQ5L2g0VldSQlphY25qdVdN?=
 =?utf-8?B?U1Y0ZGFFMUNOTkFRZFlJWVVQaERKRGFPVUlUbTBnb0tURzNzMS8zLy9VeUYx?=
 =?utf-8?B?eWFrVmJaRHRDZmh4V1o3TWtiUnl2TkJlanI1MXRFUldhbHpWVXpKd29IMzkz?=
 =?utf-8?B?MnBHTEVJeXZjYk9PUlB1S041bGt4cEU1YjJ0cDFHSTh4YlNxRmZhanRoYlNi?=
 =?utf-8?B?S3N3a0UyQzBpaGdIUGp0aHQ3RUtOY0tCOHdtbWFOeXpQT0VzT0dRT0pvQUJO?=
 =?utf-8?B?MmFFL2UvMG9YajI0V1YrZkJJOThMajNKR29LR1crM00rUlgydHVYY3VMckxj?=
 =?utf-8?B?TTM5VWVUUUtnMlNKU2FUOFRKWDRvTnFKcHZzWjRuL1VLeks4bFFtYmpJbHhm?=
 =?utf-8?B?NWJHTTNWejZDY29MRWNPWDQ1TFY0dTJBRU5kcGFaRnpSd2R5c1ozTi80c24y?=
 =?utf-8?B?TGluQ0RqcU1NYVdjR0lXU0xnQng4UTZnOHU1KzZYdU9oa2RZSVdhN1JQQTBn?=
 =?utf-8?B?ZnMxSHVXbEgrUlZMeFkyaC9xVE12MGM4b0pLeDA2dzNJNklzYy9IZGljdThG?=
 =?utf-8?B?WUZBZW9iNnEzT1Q3U01TSHRSOHBueUtHTkEwY2YzY3gyVm1qYVIwVzNwR1ZG?=
 =?utf-8?B?ajRaS3YyVTBOak5VbXI1MDFBQ1c1eWJrVE16MFhMSUJDTUgraTAyRHRjbXpr?=
 =?utf-8?B?UTk1ZVd6UjFLcUVXNjRKTk8rckNjRnRnOFpCQWNBbjNlUGsxdVgrR2cycVNX?=
 =?utf-8?B?VWF1YXhETnFsejRYTm5CUXNkZVhHcGlrZmNYT0lsbERxZ1VkNWdVYUhYRGFk?=
 =?utf-8?B?cG94MHhWMUM5cFlXaTVaTXBlODdRZ0FydGxjZkw5dW4wNEZCRUJidFhPZjZO?=
 =?utf-8?B?S0Rkei9PVjFndzZTT05vREE1QmNwbkdoNjA4K2xGYUcxU0NlbTJEWHRYeEEw?=
 =?utf-8?B?VnAxNUVvdUxjRHdDSE5CeEpSQmtIZ0J3RlNtVVlnaEJSSGNqZFJKazVCUVlm?=
 =?utf-8?B?MjVzUUtqVHkrUUNCcjQ5Tm4rM2g0aSt1cHNaRVl5TGlFNDJyTmlmdlUxVFJi?=
 =?utf-8?B?VXdKaVNiTjdFeXRjVlBYUmJ1Z0gwZExkdWxTRDJVemc4Yy9BZmVzdWFSV2Nr?=
 =?utf-8?B?eWdQNXl1ZmZHNTc3UUNGSzZKNFpTRWFSYXVTMXZlWllKbXlkTjM4UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d72d72-1cc0-46bd-fa10-08de9bfc00bf
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6329.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 21:06:18.1180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dh1a5iwy0QuRQ+2uBZdlL+6eDr/j0kn8xWM3pj2TkmeO5KipmcStmBB+UfJUKFyMzGq9gKBd+aWT09+P0okbYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9541

On 4/8/26 2:24 PM, Suneel Garapati wrote:
> Add AON GPIO and system LIC GTE instances for Tegra264.
> 
> Signed-off-by: Suneel Garapati <suneelg@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra264.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
> index 06d8357bdf52..c6630733d5e3 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
> @@ -3207,6 +3207,15 @@ agic_page5: interrupt-controller@99b0000 {
>  			};
>  		};
>  
> +		hte_lic: hardware-timestamp@8380000 {
> +			compatible = "nvidia,tegra264-gte-lic";
> +			reg = <0x0 0x08380000 0x0 0x10000>;
> +			interrupts = <GIC_SPI 0x00000268 IRQ_TYPE_LEVEL_HIGH>;
> +			nvidia,int-threshold = <1>;
> +			#timestamp-cells = <1>;
> +			status = "disabled";
> +		};
> +
>  		gpcdma: dma-controller@8400000 {
>  			compatible = "nvidia,tegra264-gpcdma", "nvidia,tegra186-gpcdma";
>  			reg = <0x0 0x08400000 0x0 0x210000>;
> @@ -3267,6 +3276,16 @@ hsp_top: hsp@8800000 {
>  			#mbox-cells = <2>;
>  		};
>  
> +		hte_aon: hardware-timestamp@c2b0000 {
> +			compatible = "nvidia,tegra264-gte-aon";
> +			reg = <0x0 0x0c2b0000 0x0 0x10000>;
> +			interrupts = <GIC_SPI 0x00000226 IRQ_TYPE_LEVEL_HIGH>;
> +			nvidia,int-threshold = <1>;
> +			#timestamp-cells = <1>;
> +			nvidia,gpio-controller = <&gpio_aon>;
> +			status = "disabled";
> +		};
> +
>  		rtc: rtc@c2c0000 {
>  			compatible = "nvidia,tegra264-rtc", "nvidia,tegra20-rtc";
>  			reg = <0x0 0x0c2c0000 0x0 0x10000>;
Acked-by: Dipen Patel <dipenp@nvidia.com>
