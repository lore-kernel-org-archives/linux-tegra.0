Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011028.outbound.protection.outlook.com [52.101.62.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A85382391;
	Mon, 30 Mar 2026 18:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774895734; cv=fail; b=SkTTwRzA17jNhV7mh1T74gyhiozNykeGbQ2lakWN8C956hYXmrpcpY69ge5MtIZjrGtVpCG/OwpOzc2mwHaNtziZjR6U61HzYcD8PRLpyPhOz94HdZEahvRfzHr1hk3o2n68pvtv1ArwM5nArvJ7TtJvJhwpQCf+OOEwg9L6Tnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774895734; c=relaxed/simple;
	bh=tNzWJLgS80BUPdf6nuUChyttsHdiaPE3uW2F+5WWdXU=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LV/Od6CXY+P/FEiS3OJ407tDYYZB66CD/p4uRf22M0/nNCgAcpElR38qesmNc+szs4+O3RDq0sH1tP43yyp7vRogT21QnreqNptawvHpCXvfjTZ2IGDstnjlQNWwN4U7zEk7QDYXERL7afdS6wsvP6yh31j9RtndFxHxoksi+SM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=E4XtPE5z; arc=fail smtp.client-ip=52.101.62.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="E4XtPE5z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uiZbRr8ctxCkEhATrM3TY2uay7WYzao6Ws3Fe38QYm7mf2fcnRBlEYiwj4BhXaQ8btHBaGMZrk8hduTtoFdTwmZEtPzzhjVR4myA9qbVUUcIDx4DdTikgcSQtdCBQAQLh3b7yOElIGU+E+GfijG2SGSVohOA7u1sl/txezI2OO/8m2olGbU2c9D/KbVYiZI4wwJTO07L43Jt8pMKI8EnzLxN0tr/jqqw2mG0gdV9/okwc+fRtbZ4uV57602CZUlvpbwNgAltFa+XidqGAwZt0pRiNIQ0Cg7jY4dEFuqlBW8rWPJWpGFL7Q5yfJsCKgJo84qyZTPTtXegulmef6fGyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cjqbGjNB1xNI0hF1jKykybUV2Vwu9y/Zf11iOhZZ3Rw=;
 b=hmUxVlFi4aePd0o1jQAiYl0bhZWu3ZYQJ/U/MPHR1CkEf8EC+uMHDM2iA2Q4ZsOg04kO0uOVB6aQ1j+3RQwdLbK5aMWk/aKWgX7RDTQ5+995WfanNGFgmidNhmPdBfZwATuMM/+eGWUmGp52pIhlcVGGTfyfePK3oRvdwL7XJB3MGZ0kgjfQBRFl9YA2W44DAXMD4iqltFbb1LB9yyKXlP7PXN9Yb/8SmxeGUx62wvervkrJ4mW8kv7MlXb9IfbNB1pN7dm6zyG1WmXv8Rrwks3svQv58vNJkZ4fkK3Ae/mph5TM96j/K4bKOMK9uHKMoUJUB4DUTer1jjel21l9EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cjqbGjNB1xNI0hF1jKykybUV2Vwu9y/Zf11iOhZZ3Rw=;
 b=E4XtPE5z4e0TbHIRHHd8y7gL0z9hAwF7+AW9v33zlt4oE6j7MGGVhzh9FyrK81MqRQWD/96Q6B6HBks6Beoaz9vDexw9rcmTyhdpzKvDttgD9tLoVlY3DWz4pFs1+H2qF6cnyw9QWoPBcKovyZWvAwCeu6AiJNGeCmgoobPWYMhl7fzjDP4XCNgU69Pv//xrZ7LnZwKJOplg9obthP5zVivLOjU0xeER+3X3/puj0wprd29GsAscshu8nZ90YxJm08ZyoCZNF1SH5+FGToT1bxfuaXqBuCHzpt6/hVXQ9IRFdIEeEpz2oAv7v5nFZWVdt0Q5EiN3jeX5WGOxSkY+5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB6329.namprd12.prod.outlook.com (2603:10b6:208:3e5::19)
 by BN7PPFCE25C719B.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 18:35:24 +0000
Received: from IA1PR12MB6329.namprd12.prod.outlook.com
 ([fe80::eadc:c846:73e9:8ccc]) by IA1PR12MB6329.namprd12.prod.outlook.com
 ([fe80::eadc:c846:73e9:8ccc%6]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 18:35:24 +0000
Message-ID: <6bbff5d0-c75d-42ef-8877-de60e7113db4@nvidia.com>
Date: Mon, 30 Mar 2026 11:35:20 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] hte: tegra194: Add Tegra264 GTE support
To: Suneel Garapati <suneelg@nvidia.com>, jonathanh@nvidia.com,
 thierry.reding@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org,
 amhetre@nvidia.com, sheetal@nvidia.com, kkarthik@nvidia.com,
 timestamp@list.linux.dev, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org
References: <20260330170657.185854-1-suneelg@nvidia.com>
 <20260330170657.185854-3-suneelg@nvidia.com>
Content-Language: en-US
X-Nvconfidentiality: public
From: Dipen Patel <dipenp@nvidia.com>
In-Reply-To: <20260330170657.185854-3-suneelg@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::9) To IA1PR12MB6329.namprd12.prod.outlook.com
 (2603:10b6:208:3e5::19)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6329:EE_|BN7PPFCE25C719B:EE_
X-MS-Office365-Filtering-Correlation-Id: f8edb1fa-8d18-4dae-7236-08de8e8b1b15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	9ipyktZrU8GbG/CZVlsoXcRS88wYVzJKSIJb7EDkbeHiSUbhGglWx01Wl7rgNzmMEB+tbjY/VxEMdnR+fLGHH/IPUFevkN9HFaUo9BXzgvDw33oXd9EEtHgXwG1dMUlJFBCSObkLy1teh0t2ANTV2niH3hDyOHABSpV7g/ILqwPIyKHzATnD0esFk8kvOi2Zpa4hHaYtmTyi/y46IrvY2KW1RGBSDZk2UJAQJTYJZvNmGO07WKEikHeAOZ8NY1aF7ULkT4YIQzVe77q7RAdMCXsGjUgXV7KEWJwZG1MHgcOqywipgtK/rJCaT4iLWe3c65YdaSxN/AuxGBdZ0uvHqJ1j9zGPylXCB7kDikKPbC2EvwIhGLB7Kfs1lEOg2Naocnhn4WJe89f4sGph/QzIZD9Z/Ip+GQsIffGl1ND+Xepd+K8Yh8+gJefapjKmorF2d3Ue9IOR4AJbvc92qhbMwDAX4qCyb39ZF2DEN5sVyz5psDL8/YeczT5UCWnuiwmGYzP1CrUVYRvR+1eGABWqZF2bWKOmsq7AFs4MOZvky9G/kYGstE04kLKr6Cdg6fCihTY8gH8BWrAvblpv5RCW3GLm9zEVoFlI3BPb2eZVBzJLpso2Ro9Wqb+gE2sInXWN9P064lHxNBPlJ7IAK/VZS1KqDkeY3++H8ylsDiaUykNsNS0GP8lAZSUR+JtkZhrvjc3X8MThMvrTMhMLV8FK3dce1J9AHLcg/9WLZlcM+07iZgtZgDqSokehSMVHz3GSB7uZIVkxZFYdBISFFn2SDg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6329.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2EycU9uZnpWd2l5dzdUL2Z4SkxwbVBlYkxSOFdNS2NlVW1TL1grRktLWjJi?=
 =?utf-8?B?QUF3K3dPMno2ZG9IR1pSTE9wMCtrWXFadC96UC9nZG5zaEZmNkRvTmxJODdF?=
 =?utf-8?B?K0dnN1lOZnZWcDU5dEYvSEFQWm9hbFpzL1hFejBJYWEzNHdIM2RaQ1lncWhO?=
 =?utf-8?B?MEZ1dnpRMUo1WmNPZWdCdXlkeXpuZTZyM2JsOFRZUnNteS91L1lMa3BvZUZM?=
 =?utf-8?B?VDZLWlo3NUplcnpIU09XclFYam5uM2FPK01UQXpGUCtTTURVYWFzeE04aDZ1?=
 =?utf-8?B?ZFZrZVg3eDZRM2FtbW5yYlhVL1cxdlVuNmZqRCthblMweTh5ZFRwQkJJdXJq?=
 =?utf-8?B?NHFYanBaT2k0SmZtMllUQjZneWVpankxN043RUhHM3NOaDAzeTlIL011TUFC?=
 =?utf-8?B?M1ZKNVpHREhiai9oalEwTU43ZE9PRDRFdDFYUlllMWlRVXZTSTlhMnZqTVhk?=
 =?utf-8?B?NGNpeHFjdnlTT1BvQnBJWUhoeEg0U3dVSmRqNS9xUnRlYXBkRU5WODhUZ3F2?=
 =?utf-8?B?Y1gwL3RWTFczNlp6TkRUZzE0M1dnYzV1ZGluay8rb2tTRWh2cW9hd0ZDemdU?=
 =?utf-8?B?aVBIcjhjOHMzNFhBUjdtS0tjaVdibDAvb21kd1ozZlp2dHB2a0NqWkxVNXky?=
 =?utf-8?B?WnFpM3ltcU1IdW01L0dHcE04MnlhbG5KcUlDbzNWdm96WWxFa3ovNzNKcUdr?=
 =?utf-8?B?R2VGUzVhSC9iaFpvMmF3ZHNyZXo5U1VBUHJPSG1GQzNQeFg1S01tRnpkMmc1?=
 =?utf-8?B?Mm5udFJsUDFVUWdGaTdSYXIrdGNnUUliT3JmdHR0ZkVDZFNZbE54UnpkemdH?=
 =?utf-8?B?Y1BQQUorbXBzU041SVhmZE5WYWp0VFNhMGlZQlpiMWhMY1d6Q3F1UG1lQkFp?=
 =?utf-8?B?dTNoNWZUb2FISlBlc0Z3bFNoRjh2NkQ0ZjFhTk5yT1VUdURFNFdOWXVLY0dY?=
 =?utf-8?B?YnRYeEJGV3NWcFJoRkFWMFo0azQ1VVNla3daQ0wwVy9XbFdobVU0MEVTd0pH?=
 =?utf-8?B?N3dlQ0hacU5CbSszcTEwczR3ZTVmMG9Nc1pxQzZRNFcwYWlnT096SlM2M2F1?=
 =?utf-8?B?bk8za2JXeDhWT2F4Q0d4UncrWHMrcDQ4NURvbmxuZ2tkcVMwajNlVWx4RW9o?=
 =?utf-8?B?NDVvZ0gvazZrOUhKcVlsOFMzb2w3WXBTZHF0MlVlRnBmdU1WSlkzbGRRSlRK?=
 =?utf-8?B?aG1Id2hKY3RRdURMSU0xM0xLaGlrTUJlTGhzdWNidHg4ZFZFZ0h1Z2RnN3FR?=
 =?utf-8?B?cXVEOGUwN2VCaFVOZnhDOWJYOEpHYXVVcUtUenlSdDFuSmFEdzZ0ZzFyOU9q?=
 =?utf-8?B?UnI5QnJDUkh5L21XN2RpdnpYck1iZTlkc1g0TlRhZkJZYUZac21PWkpRWmtW?=
 =?utf-8?B?eHAxaTJYeVMvOUdZaEkwR2tHaS9JRGlnMmxhTmx6ejk0Ylh5UjJoWENOeDBL?=
 =?utf-8?B?bGliUTVWc0xmbzB0YjlML09qQ0pWOGsyVzEwWmNVQnlKanpFa0RnRFIwTEhH?=
 =?utf-8?B?L3hEcStiSUwwUktOYTZKcnE1czc1TUpyRCtoR0RpYjJNYTZsajFOeTZpdTFO?=
 =?utf-8?B?NzVpcDdBaC91azlMVlpYTjNTbVZDKy9XVkR3ZEJnY0dwSTdWc0h6d2pKMlhB?=
 =?utf-8?B?Tk12T3hyWlJoMzBiZHlzcnRkYTJCQy93bld3WDU4WG84S25BdU13U2FnWG9p?=
 =?utf-8?B?cStiYm1oS1FKREgzVVRWamJ1T0NtdmxtOEFtUEloQTRBVzZsU1hYQkUvWEIv?=
 =?utf-8?B?V2F6ZTZadlhKc2pGd0h0WmhYb2x0RmZ3Y1A2TkRRK2VWZHRvZkdMZ01DRnJs?=
 =?utf-8?B?SFFNOGJoYUN3MHArWlNDM2haRFFJaVRmbGN6eTB0N2RZVHV6NUt4Z3Jrb2xV?=
 =?utf-8?B?M2ZCYWE3Mnp0dzh6bUpqSzA0ZXRwM3hzZ0xEdUtoT2ZlcHk0ZFJkcFhxNDZW?=
 =?utf-8?B?cjhzUTlVMlMvWUZDTjk5enBIejA1TzBCcWg0TVFvM0NEdHZEYkN2Vnk1SURq?=
 =?utf-8?B?cEZKOGhLczAyZVFySXFhMU5vUGhUSjMvdWMyWGJaSGFzNHQweCtGY2pOOXFk?=
 =?utf-8?B?Z2tpNmNYSVZQSlBKWHlHZWdLbmJIM2NvVnY4RndETVoxeEU3MStrYSthdVdV?=
 =?utf-8?B?U0pxSFNPQmNia0FBRE5DLzZmdjNjVHM4ajRIUzdob3FDcXg3QVlJTXh2SXFI?=
 =?utf-8?B?cWZ5MytOM0hQYzhhVlcwNkhYNEJmZit6VmhvNFR6eFVjQVZBRy9sMWFvTGtq?=
 =?utf-8?B?dERaVURmNmkySGY3R08ybnpCV2RXWUkydzlnQnRUaFlmbkUrYjF1emt2eDMz?=
 =?utf-8?B?aGxTQWVmbEpwZnZydWRWZmZHcTZ4SHJTQm5ocG1sZE1OQjhrcjdyUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8edb1fa-8d18-4dae-7236-08de8e8b1b15
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6329.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 18:35:24.1390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l6P4jhYfz1sAvfeh/fko/EgL2yXa8CElbFy04VyhPaABsww0MC4r0GszNH4IJqiUAKv7wOxj8BFWNzMwycINaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFCE25C719B

On 3/30/26 10:06 AM, Suneel Garapati wrote:
> Add AON-GTE mapping and LIC GTE instance support for the Tegra264.
> Move TSC clock parameters from macros to members of SoC data
> as values differ for Tegra264 chip.
> 
> Signed-off-by: Suneel Garapati <suneelg@nvidia.com>
> ---
>  drivers/hte/hte-tegra194.c | 133 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 128 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hte/hte-tegra194.c b/drivers/hte/hte-tegra194.c
> index 690eb9be30fb..4a7702b32b24 100644
> --- a/drivers/hte/hte-tegra194.c
> +++ b/drivers/hte/hte-tegra194.c
> @@ -20,10 +20,11 @@
>  
>  #define HTE_SUSPEND	0
>  
> -/* HTE source clock TSC is 31.25MHz */
> +/* HTE source clock TSC is 1GHz for T264 and 31.25MHz for others */
>  #define HTE_TS_CLK_RATE_HZ	31250000ULL
> +#define HTE_TS_CLK_RATE_1G	1000000000ULL
>  #define HTE_CLK_RATE_NS		32
> -#define HTE_TS_NS_SHIFT	__builtin_ctz(HTE_CLK_RATE_NS)
> +#define HTE_CLK_RATE_NS_1G	1
>  
>  #define NV_AON_SLICE_INVALID	-1
>  #define NV_LINES_IN_SLICE	32
> @@ -120,6 +121,8 @@ struct tegra_hte_data {
>  	u32 slices;
>  	u32 map_sz;
>  	u32 sec_map_sz;
> +	u64 tsc_clkrate_hz;
> +	u32 tsc_clkrate_ns;
>  	const struct tegra_hte_line_mapped *map;
>  	const struct tegra_hte_line_mapped *sec_map;
>  };
> @@ -317,6 +320,94 @@ static const struct tegra_hte_line_mapped tegra234_aon_gpio_sec_map[] = {
>  	[40] = {2, NV_AON_HTE_SLICE2_IRQ_GPIO_23},
>  };
>  
> +static const struct tegra_hte_line_mapped tegra264_aon_gpio_map[] = {
> +	/* gpio, slice, bit_index */
> +	/* AA port */
> +	[0]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_29},
> +	[1]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_28},
> +	[2]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_27},
> +	[3]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_26},
> +	[4]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_25},
> +	[5]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_24},
> +	[6]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_23},
> +	[7]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_22},
> +	/* BB port */
> +	[8]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_21},
> +	[9]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_20},
> +	/* CC port */
> +	[10] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_19},
> +	[11] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_18},
> +	[12] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_17},
> +	[13] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_16},
> +	[14] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_15},
> +	[15] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_14},
> +	[16] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_13},
> +	[17] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_12},
> +	/* DD port */
> +	[18] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_11},
> +	[19] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_10},
> +	[20] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_9},
> +	[21] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_8},
> +	[22] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_7},
> +	[23] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_6},
> +	[24] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_5},
> +	[25] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_4},
> +	/* EE port */
> +	[26] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_3},
> +	[27] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_2},
> +	[28] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_1},
> +	[29] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_0},
> +};
> +
> +static const struct tegra_hte_line_mapped tegra264_aon_gpio_sec_map[] = {
> +	/* gpio, slice, bit_index */
> +	/* AA port */
> +	[0]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_29},
> +	[1]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_28},
> +	[2]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_27},
> +	[3]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_26},
> +	[4]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_25},
> +	[5]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_24},
> +	[6]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_23},
> +	[7]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_22},
> +	/* BB port */
> +	[8]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_21},
> +	[9]  = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_20},
> +	[10] = {NV_AON_SLICE_INVALID, 0},
> +	[11] = {NV_AON_SLICE_INVALID, 0},
> +	[12] = {NV_AON_SLICE_INVALID, 0},
> +	[13] = {NV_AON_SLICE_INVALID, 0},
> +	[14] = {NV_AON_SLICE_INVALID, 0},
> +	[15] = {NV_AON_SLICE_INVALID, 0},
> +	/* CC port */
> +	[16] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_19},
> +	[17] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_18},
> +	[18] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_17},
> +	[19] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_16},
> +	[20] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_15},
> +	[21] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_14},
> +	[22] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_13},
> +	[23] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_12},
> +	/* DD port */
> +	[24] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_11},
> +	[25] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_10},
> +	[26] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_9},
> +	[27] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_8},
> +	[28] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_7},
> +	[29] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_6},
> +	[30] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_5},
> +	[31] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_4},
> +	/* EE port */
> +	[32] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_3},
> +	[33] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_2},
> +	[34] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_1},
> +	[35] = {3, NV_AON_HTE_SLICE2_IRQ_GPIO_0},
> +	[36] = {NV_AON_SLICE_INVALID, 0},
> +	[37] = {NV_AON_SLICE_INVALID, 0},
> +	[38] = {NV_AON_SLICE_INVALID, 0},
> +	[39] = {NV_AON_SLICE_INVALID, 0},
> +};
> +
>  static const struct tegra_hte_data t194_aon_hte = {
>  	.map_sz = ARRAY_SIZE(tegra194_aon_gpio_map),
>  	.map = tegra194_aon_gpio_map,
> @@ -324,6 +415,8 @@ static const struct tegra_hte_data t194_aon_hte = {
>  	.sec_map = tegra194_aon_gpio_sec_map,
>  	.type = HTE_TEGRA_TYPE_GPIO,
>  	.slices = 3,
> +	.tsc_clkrate_hz = HTE_TS_CLK_RATE_HZ,
> +	.tsc_clkrate_ns = HTE_CLK_RATE_NS,
>  };
>  
>  static const struct tegra_hte_data t234_aon_hte = {
> @@ -333,6 +426,19 @@ static const struct tegra_hte_data t234_aon_hte = {
>  	.sec_map = tegra234_aon_gpio_sec_map,
>  	.type = HTE_TEGRA_TYPE_GPIO,
>  	.slices = 3,
> +	.tsc_clkrate_hz = HTE_TS_CLK_RATE_HZ,
> +	.tsc_clkrate_ns = HTE_CLK_RATE_NS,
> +};
> +
> +static const struct tegra_hte_data t264_aon_hte = {
> +	.map_sz = ARRAY_SIZE(tegra264_aon_gpio_map),
> +	.map = tegra264_aon_gpio_map,
> +	.sec_map_sz = ARRAY_SIZE(tegra264_aon_gpio_sec_map),
> +	.sec_map = tegra264_aon_gpio_sec_map,
> +	.type = HTE_TEGRA_TYPE_GPIO,
> +	.slices = 4,
> +	.tsc_clkrate_hz = HTE_TS_CLK_RATE_1G,
> +	.tsc_clkrate_ns = HTE_CLK_RATE_NS_1G,
>  };
>  
>  static const struct tegra_hte_data t194_lic_hte = {
> @@ -340,6 +446,8 @@ static const struct tegra_hte_data t194_lic_hte = {
>  	.map = NULL,
>  	.type = HTE_TEGRA_TYPE_LIC,
>  	.slices = 11,
> +	.tsc_clkrate_hz = HTE_TS_CLK_RATE_HZ,
> +	.tsc_clkrate_ns = HTE_CLK_RATE_NS,
>  };
>  
>  static const struct tegra_hte_data t234_lic_hte = {
> @@ -347,6 +455,17 @@ static const struct tegra_hte_data t234_lic_hte = {
>  	.map = NULL,
>  	.type = HTE_TEGRA_TYPE_LIC,
>  	.slices = 17,
> +	.tsc_clkrate_hz = HTE_TS_CLK_RATE_HZ,
> +	.tsc_clkrate_ns = HTE_CLK_RATE_NS,
> +};
> +
> +static const struct tegra_hte_data t264_lic_hte = {
> +	.map_sz = 0,
> +	.map = NULL,
> +	.type = HTE_TEGRA_TYPE_LIC,
> +	.slices = 10,
> +	.tsc_clkrate_hz = HTE_TS_CLK_RATE_1G,
> +	.tsc_clkrate_ns = HTE_CLK_RATE_NS_1G,
>  };
>  
>  static inline u32 tegra_hte_readl(struct tegra_hte_soc *hte, u32 reg)
> @@ -574,12 +693,12 @@ static int tegra_hte_release(struct hte_chip *chip, struct hte_ts_desc *desc,
>  static int tegra_hte_clk_src_info(struct hte_chip *chip,
>  				  struct hte_clk_info *ci)
>  {
> -	(void)chip;
> +	struct tegra_hte_soc *hte_dev = chip->data;
>  
>  	if (!ci)
>  		return -EINVAL;
>  
> -	ci->hz = HTE_TS_CLK_RATE_HZ;
> +	ci->hz = hte_dev->prov_data->tsc_clkrate_hz;
>  	ci->type = CLOCK_MONOTONIC;
>  
>  	return 0;
> @@ -602,8 +721,10 @@ static void tegra_hte_read_fifo(struct tegra_hte_soc *gs)
>  {
>  	u32 tsh, tsl, src, pv, cv, acv, slice, bit_index, line_id;
>  	u64 tsc;
> +	u8 tsc_ns_shift;
>  	struct hte_ts_data el;
>  
> +	tsc_ns_shift = __builtin_ctz(gs->prov_data->tsc_clkrate_ns);
>  	while ((tegra_hte_readl(gs, HTE_TESTATUS) >>
>  		HTE_TESTATUS_OCCUPANCY_SHIFT) &
>  		HTE_TESTATUS_OCCUPANCY_MASK) {
> @@ -621,7 +742,7 @@ static void tegra_hte_read_fifo(struct tegra_hte_soc *gs)
>  		while (acv) {
>  			bit_index = __builtin_ctz(acv);
>  			line_id = bit_index + (slice << 5);
> -			el.tsc = tsc << HTE_TS_NS_SHIFT;
> +			el.tsc = tsc << tsc_ns_shift;
>  			el.raw_level = tegra_hte_get_level(gs, line_id);
>  			hte_push_ts_ns(gs->chip, line_id, &el);
>  			acv &= ~BIT(bit_index);
> @@ -656,6 +777,8 @@ static const struct of_device_id tegra_hte_of_match[] = {
>  	{ .compatible = "nvidia,tegra194-gte-aon", .data = &t194_aon_hte},
>  	{ .compatible = "nvidia,tegra234-gte-lic", .data = &t234_lic_hte},
>  	{ .compatible = "nvidia,tegra234-gte-aon", .data = &t234_aon_hte},
> +	{ .compatible = "nvidia,tegra264-gte-lic", .data = &t264_lic_hte},
> +	{ .compatible = "nvidia,tegra264-gte-aon", .data = &t264_aon_hte},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, tegra_hte_of_match);
Acked-by: Dipen Patel <dipenp@nvidia.com>
Signed-off-by: Dipen Patel <dipenp@nvidia.com>
