Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010050.outbound.protection.outlook.com [52.101.61.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A954386C27;
	Mon, 13 Apr 2026 06:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776061402; cv=fail; b=YbdqChmBkbeMfkSpTWS2yK66H/lZ7OUzTkfYlbbSRVvOmqdkrtBhza5okkqh/R1WmN0Qp5q2Dtgi6agbA36S/AuWw3XIaWqvTuU+hj/zgo2nvuZTFmeDpFHgapkcnSfzNnaqh2A7EenyxuuxqhldnJLOBq7tNbsbxzqh/CWiZuI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776061402; c=relaxed/simple;
	bh=5LUP0lhrJDHDoz8Rsyc1E20fcn7fXgl7XFfsL6oOe7c=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KCT/iJOCe3Hj8SARFievnwcAf6YCoi338yrXmvpymKEBM5aW6nTJMySvujhxHlR8BAt7r+dm+TKnpKsFiNquYV3hRz3XBlCaMzpS75I/Sie2sO0TxMgfNAD3R/Om1hukZHj8zINfFGMh81meOOxhqbhu9eIUw4cIiMMe5g88PNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YPrAX9Dt; arc=fail smtp.client-ip=52.101.61.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YPrAX9Dt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ju9Sd423K84r0Tns1Xj7x+h8aW/XFWwtO2p0QarKr224Wlj34ZV94851sQmDqrY+kNT0e02j51aGucRNHAGR2Cq4waWHMsZUqWlYbwsmkOEYoYDbdFFNiHkY8khKt6Z0tcdBRbmxxq8jhjURwtHS3/JC4hhLIhDouDbJ4nB9FQRDwWJlqyjMUrESnW7eerfkSSJSWZ5UE6iNIxnAGfIhSOkoz6+QWtRenGJR4BXk9H4VFfxPcA9JNrjA2aXLWjU/SsD0kW5tEkrnjB8adGMmvfT+q43IU7ckVahNSzqzoXuLZgeiFTRpLUllWYnPkXr1gPYUK81EX6i+H02Y7g0ScQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SzAAYis3jzaSMEnvpuf/YrLXnXBFoP9W0V9+m2eFke8=;
 b=tr5MAfgCjEQ0sPBufQs/aIgPZb6sZRlTSGRxnUZk3E8z/t2FRFeqnGQWDYWE+gkh24F6MybdBvfZ1E7Zwb4VBOGkRKtK4sYvql7lu6BA341u6fEeKTnq0xx4q4Cf6vwdpq6NYwsLVeb/OJXU65h6/lxJshHnU5cNeqMNU8G0xs2oE+6wY2CNbzIP8ofPWJnw49i30h/AQpRRcsx8imH8Z3NcEGIMyYfqN7lU+L43jSDZ7hcmfz1PPXUiSMG9z/Uyjopkg7LUKZLk/IXzmGvSElDrrttLnKvu8FfN7cu+LGw2r3gy6rNI58XmoOfBUlUNUyfTV1Lf5l2JwTSa2QPvBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SzAAYis3jzaSMEnvpuf/YrLXnXBFoP9W0V9+m2eFke8=;
 b=YPrAX9DtDyoqs7O1MJdLwm2ZkuLa8GfKc+se3JJ+CekCCaAMxBzJMV6X7A9JWxDaK836Q8Nxo7Tj8ZkFJhXAZeylWZSori4J6eivZr/w7s5JphJOxSROro0vIzgqkGDevE8qBbNA2+ZeIzpMbjdm5xc7DQMT5PDucqUtR7P6ACo2MJ3vCX3EZfal2xdTZU29pe8I1gVlZ6HXVaVWLHWSfA2YcqBQvRB8UKqNQ+CBN+Vpwy0XsvCJCB40okGz/niZVhXLTfvKxlznlTsyfbVKx5R45EtU7QRUt1JHwq3AnuVB2tZNNho3HeOT81Rpze8XTX4rZLCgFztB0a9XTLBzqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB6329.namprd12.prod.outlook.com (2603:10b6:208:3e5::19)
 by CYYPR12MB9015.namprd12.prod.outlook.com (2603:10b6:930:c8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 06:23:14 +0000
Received: from IA1PR12MB6329.namprd12.prod.outlook.com
 ([fe80::eadc:c846:73e9:8ccc]) by IA1PR12MB6329.namprd12.prod.outlook.com
 ([fe80::eadc:c846:73e9:8ccc%6]) with mapi id 15.20.9818.017; Mon, 13 Apr 2026
 06:23:13 +0000
Message-ID: <ad9d57ef-033d-476e-8c77-08d324f94315@nvidia.com>
Date: Sun, 12 Apr 2026 23:23:09 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] hte: tegra194: Add Tegra264 GTE support
To: Suneel Garapati <suneelg@nvidia.com>, jonathanh@nvidia.com,
 thierry.reding@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org,
 amhetre@nvidia.com, sheetal@nvidia.com, kkartik@nvidia.com, robh@kernel.org,
 pshete@nvidia.com, timestamp@lists.linux.dev, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260408212413.217692-1-suneelg@nvidia.com>
 <20260408212413.217692-3-suneelg@nvidia.com>
Content-Language: en-US
X-Nvconfidentiality: public
From: Dipen Patel <dipenp@nvidia.com>
In-Reply-To: <20260408212413.217692-3-suneelg@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0092.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::33) To IA1PR12MB6329.namprd12.prod.outlook.com
 (2603:10b6:208:3e5::19)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6329:EE_|CYYPR12MB9015:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a2169dc-7f13-468e-deeb-08de99252466
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	maNnvz+deH9oHY4xXv42FX9DCadGtiweBH0dmFWpz55nFJ4KyOFNhb7Brz5JQdB5e0BjPFDo4/cr8q3ITQ2Mvta4ufN9yeQqSGMQ9bIc7V4JX472A27nCMDC80d3IWh3zEaxE4M2HDGXZjIwA3GXK+UF///47+dhn/YhIjhLuAWJpwqFowwCvhap1RCCikqVTyOqdMi2rP7z4Tmwhh4yFfCeE7DUKmDhKdqgbGjjdvEOKkg/1iB8NX8rPw0eYAPM/JJhyY0SlW+kYOEn3nyDMmW/zyCkGANFS2z4qHrJ9H+3q1rysjgDnZrUikTedgyWFyIsANnLtD0UTO+1t5H1ePdGOKCTPzisWVSBF5enBCgiaPu6cIUjzdtuixeHlBtUfiVSj24y1TDW/2sBkD5VAzlREl0Qg2ZPSEYbFY+/A4ERc+BFyseKHBlFS8niU0PDJKtybmIL4d5FusipB2ggeLfnSAstmA3HqUAeZgd3T8URKViE5OvjAp22B7A4bGeeW+xKWCzlDfEe4LvwOikEs8k83Ql3YfhRsLVHWUMtNGDsSyRS+vVhO04YdILu8IiZn/dTz32xoop1ITznlyh/OMgGmjPWGxytQOZgM67oY3CEcEM+Knoy9AUFq1s4ecTpGufpLSxWzQtmKfanc4/xYlhZgW2Hv+IvTphX5WSxREtIyqTBiw0svnbSyFfaZ+HA1jxnRtvoRRK+fZXPnXbOKIyaiaVqSI3uMrHo/taE/HtpfOeCQ4O/18Wmzbd+kCzK+OuGsjTPp4HyQxRq1tm5og==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6329.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yld2VXBFTmp2NGkzcno5dlVHZXJKYlFGMUh6YVpLZTZEenVoL0JqTE5HZUZE?=
 =?utf-8?B?UlVTMmRVWHArQnpxT1hFNWtqRGJNSTMwc25HaUc1MmNBYllneHM1NjFEU2dH?=
 =?utf-8?B?OXJkbTFMUEEvMVVlQUFOL0pNWUtuL2I3b2VVQ2tRbW9JUDEzUXBEa2UybGlL?=
 =?utf-8?B?bGVFWlNVNlIyd25ha3A5a0hWNnU0TFhLQWFEOFArM1cxNG1QNittclpyZU5u?=
 =?utf-8?B?WFpVUWFPd1EvK254MStGWFJDbEZ5UDNOZ3QwNWpiTUhGSWZPbHgvRzB3cHdF?=
 =?utf-8?B?bUR0dGlLRkc3WFZUT0xLQ01VU3BmVUVFYmNIWUNyR0xaNXd3L3hpNExBbmpT?=
 =?utf-8?B?YjY3OUxHSEI5N0FJSitqblRxV3NvTUoxOGdqV2tRM01seUI2TzI2RE9SYXhW?=
 =?utf-8?B?ZjQyN2h6REN1UCtyZDl2cDZEbEdSc0FHSEdQdDVZOVVtRmVTRTR6R0w3MlNV?=
 =?utf-8?B?ZXRjQTJDVDhKRGwrQWhiU2hmK2l6Q2FjcHlEcU51Uys4bkxLdkpRTkdqYWZ2?=
 =?utf-8?B?WFZCMUVtVGhlb0c3eUZVV09ESWxKUWpSR2tBZmZhKzBjUFhCNVdGN0RmdGJn?=
 =?utf-8?B?Z1pxWjdwTmNEQjY0UjE4eUp1M0lsVW5HUVFsWkFRT2NvSGFSNWt3djlvRjJ2?=
 =?utf-8?B?elhBYjZZODhYUFpNYWNPY0NQN2MzN1ZRYzlFWjFvU05FcUJIcUIrN2k3ZlRt?=
 =?utf-8?B?anZuVTZtUlM1L2lwVUxWSjRlRm1VajZWcUlFalROcUFxUlVscHZzT283MTZz?=
 =?utf-8?B?Y2hOTVJya0xNYXN6d0w5V0wvdDM1YlZNeHNSU3RjeEU1dmVGbUp3aGVlOVRJ?=
 =?utf-8?B?cVF3Y20zOEZ5d0hqM1NablpZOTVTSUFGTThuN1lTODdLVmsvV3NHTE5kL3Qz?=
 =?utf-8?B?VEhXWGVKTUlodHJVc0srV29jcVpoUzVrNzFQMVRzN1VHNStKOEhUcWVkZ3Y3?=
 =?utf-8?B?ZjBIbjVOd2xHYktjODhjUGE3L0VZMzFWbWMzSWZSckpJdC85WEpMZGxzWXN2?=
 =?utf-8?B?QmhwSjhySVBVODkxN0dLRmF5THFZbE16S0ZtcWpmK2JFSHcvM1VxeEp3MkMx?=
 =?utf-8?B?RkVmL0pld1BDODUvdEt3L1ozSVczMC9pQk1MR1U2a216SFR5M2FqZVYvckw2?=
 =?utf-8?B?UE4vQ3VTSVJhQUtDbkFJVi9qNmVNbUlFNlBrNDd2NUlpUTYvcEdPU3gxZk5X?=
 =?utf-8?B?aWZwVEMxZFVERlh0dnJweUhWcUVqMC9RMFJoYUk1SCt4N2dXa2Q4STZibXVR?=
 =?utf-8?B?MGY0TVNOc3BUb0NKQVIybFcyQ2RGb2UxL1NkckUwMTJlSHJkRHFtWXBJaUp6?=
 =?utf-8?B?andaQTFvM0lHdU1FQWNBRENMSS9yL29RalpaVzRqalpwaXZBcmJwd2dlQ25i?=
 =?utf-8?B?QzJQL0J0c09XUmZqZnNjSzRHQmZWM2Zvd0tycHNDU3dyYlVYVkRsMG00dmk0?=
 =?utf-8?B?ZGJsU3k4WlNTUlVOSTlRYVFmeHpweTF1Wml1MlJrcXpJdHBTaDBZV3pMQzMy?=
 =?utf-8?B?bVV3ai9PRmxZU3RPZmxkd0ZkYnFOSzl5cVdpa3J1VFRiSmpJMFhnc2hsNnpz?=
 =?utf-8?B?bHVBWExRdXVPM2p0bXZ1ajVkYms0alRHSHVUbCtXVDVvYldrWERQTDI1RmJU?=
 =?utf-8?B?MzRHUGNXQ0ZzQ0JuZ2RDNDFmakwzL2M1RUt3WVU3cHpHazk3cDdRT1pCUnF6?=
 =?utf-8?B?SDE3MDFGcW5mbkprdnNzVzV6R1NkTkxqeGZJMGsyYkkwNVE5Y3M4NE8xN3RK?=
 =?utf-8?B?NkV0bXA3Wjd4a3VrL1d1RzJCQ1FKNGU5V0dNV1FJMkppaHBNZ1NzMDdFZVFN?=
 =?utf-8?B?L2l5N1VNWnU1T1VmZW96czlPS25LaUtFb3JGMDdSaVcrMHNUNnpFdExyL0tx?=
 =?utf-8?B?NEZFZG8yKzh1VHU3a2hkS2poSnN1R0J1ME1iWTJ5UExZTUZ5NTJNQWs0WTFW?=
 =?utf-8?B?UW1TRUp4VWYwRHg4R29BaXdhTy8wS2c3MGpKSUJiQnJaZDBzb05NWHZ1ZzRi?=
 =?utf-8?B?U3F3NWNLekJtUGxSZ09vK1ZZQlhocS9ZZmEwRlVuVHRBQ1lMcUdOYmN0V2JR?=
 =?utf-8?B?WG5qWE9XQ3YrUU9TMThuSnhNSERwL1JGMnhRSGoyTHg0emMxR1NYaGN6MGFW?=
 =?utf-8?B?ZmVveE1kZFkvOHZqVVZMSnhRVUc0MTlyZ3RuazhYNU8vWlBTd3hZTXFuRmlX?=
 =?utf-8?B?NGl6dlRWQUg1a041UDQvUktGd3F4aHNyQUhQQ1dRcWMrWCtGanZWckRMeVhP?=
 =?utf-8?B?Sk9SZVRmaTd4aENjdjhxQlFEQzVBb2hCcGVXdXJBSVNpL3BxSVJ3bi9BbXRU?=
 =?utf-8?B?ZHFVQzBod2VvM3JBUCtJZmxlM3RHUHBDVVNoT1QxWG1kT3ZsTUZ3QT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a2169dc-7f13-468e-deeb-08de99252466
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6329.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 06:23:13.8052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bQs0t6JkIoGymAny9dY0Mauq8wgo04IgMUXh2I/+1ECTJt/j8H+s9r3gXBlnuXImaYNURgozZ6EhYjn95NYPhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB9015

On 4/8/26 2:24 PM, Suneel Garapati wrote:
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
Reviewed-by: Dipen Patel <dipenp@nvidia.com>
