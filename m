Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012012.outbound.protection.outlook.com [52.101.53.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFF63B4E8A;
	Tue, 31 Mar 2026 11:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774957106; cv=fail; b=FFZEjX0lqck7OJzBFeXLDFAKkYutTdIxnnd8xn0KMyR7+U0aAkyPH2oz+CwWmjC3NNaM5T6Qa+hPkBvUwTTU+ItJoxBMkrujwQUXUsQHtdeaQbH3Z/SNEYMzShlt6l53P08kwNO9HaX/9YdGAH2XC8uJyOV4cmchv3YV21hHHU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774957106; c=relaxed/simple;
	bh=Z+tpWKUEvVwQdhQbT+VltPgcNHgs7ZqrHgBCSYCUWkg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CaDH4r1zxCZuWcmS06HA5dSsW+OqDyuwB1fO2GKgbWXvwwdF/twqhH109QvNkIi1/yKzoAZqCjTqK9q01OAlf6nYSUmkqSYmZUHcbmju2Ww/enxSiCWhQUkE+YA5OVt5escbMD3OJ5vPDpjSO8cNeoQNJ/K7lkNsHPu+AdroVo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WlCAJfpH; arc=fail smtp.client-ip=52.101.53.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WlCAJfpH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J/2Xsflr2MhidPjXP6R5FdXQqyw7EleOXV9JgSPxyh+TKWsTFpxgI+GzT06SCZjXM6ouw4x7xysKYoAPlz2P5hdWY5oOBms5u2llsav+LShQscZGcw3Oftn3pJ8VtE4RKvwXDg5GO0bPw8CCso67mwhAuNfHHL0CodoOFm8kosodOcgCva2g09GlS0ZXiWXKBXWpAniu89sf3WV3cgmveNPsByaiKcMevutVaw9AB0b2pwdHP8LQnAAmBaYOEl3Zlhy/dZKpQU+okPe53cMwEgMbI2d+bOcKvUoUbd6sjW/76ppim4rfAHZfWmDgWa1i+YY7gXPX70+cYTn2MPDyyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5YqkowhX+L9gB+5zwRy8cq0pQZ3/EBumrHzvPU0I3kY=;
 b=iLDit8o4OgKbm1HnRDxOQOJg2TvN1J1xu2eZw7WXWibVNjIpdopte6jTPxuHOwvpwxlm+O2Kvh856BIDCuIlcX6Z8RtkegRXxH+t8GM39wfHGFtlWHSLe8VQPhRrzupIbsJzqXLyp8H05qHxTjDnzxlVql+w/LzQRuvkPUHolt5+hJZeMJcu9R4XNrvKSyPC//YxFChGNCZm4QalMkCjfbmq1AXxlLZNKgsLQiZ7R+PWGl/NG8piIeM75UVxEC5CykfuTxiIyZaKI/XvjLj/D2yBHZoXzJqx9JjGEw9XQJ3WcSnjUxcd7mHRCusQwJEgD6izzXq/Si0Dp7xkbMRH4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5YqkowhX+L9gB+5zwRy8cq0pQZ3/EBumrHzvPU0I3kY=;
 b=WlCAJfpH9Bmo4VaX0r2tdcAJuFRb5X45rlYzmebTfQ71G9No5A93DegjpOVPEi38Ub74Epxj2Z8nrU5LXyUTvO6B8o8vDyE9owMgZ2Q4tYQRtCgEX1Gs0u77+f2mA+UqG/dgHtmpy7JfxBRBEpTfq6e2w+SSwb6TWNkcAVTNdkHEFBj4S6jikg6QosM65CmQg6KOEcRMPtmBtw/wB/NP6MvCxThM38VFZQrmQHitahAvpc3JB3d51or8IGPo7twNcOqyqhBwVNKDBXDhqArKHbq6LubD80J+P6hXneceTTv1gtllujTDIR2w8qvKvlhKkJ7zCA3VasRwoHXjC39atg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by SJ1PR12MB6148.namprd12.prod.outlook.com (2603:10b6:a03:459::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 11:38:20 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 11:38:20 +0000
Message-ID: <1ec86de6-9282-46fb-bdba-521ac25b5fc8@nvidia.com>
Date: Tue, 31 Mar 2026 12:38:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] memory: tegra: Add T238 MC support
To: Ashish Mhetre <amhetre@nvidia.com>, krzk@kernel.org, robh@kernel.org,
 conor+dt@kernel.org, =thierry.reding@kernel.org, sumitg@nvidia.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20260331112347.3897841-1-amhetre@nvidia.com>
 <20260331112347.3897841-2-amhetre@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260331112347.3897841-2-amhetre@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0309.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::13) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|SJ1PR12MB6148:EE_
X-MS-Office365-Filtering-Correlation-Id: 58980256-614f-40f0-a345-08de8f1a01e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4rSM+0aAFQ+W+I5MoRb0ujA9OmUUT3FVyz2x9BYGVETXjBgpwnocWZq7c4Q3FZ9/V1v+SBxJdLceb8YG/gv1wiEehmNRThtQJyt31a7Ns2YMuBjiXEfAVTQZzcrLrbI/4mGdPsawLNpOdcyflYfIx0bV9DHbNC8FRmreOPWHiPLXtUDlrfMv4+iVgye2i/gyUfufYVcUCqD7pHBmHIkvgVM7/qiK+JbM38UQPlTwajtnC18U+g/08t4IcJ/+uO9rK91xCVts9kHqBNfnvFdHAMrnkxZVEziPzBaduE1NBuFeJe6/JK9s+BYwxeVEY41dviIIogDnY8KXliyBKGccOBVgjSbHPmH9QKR4IRlhLcPBTDmjDWWiLuR9akEThZHBW2rfqvI2E7gY1gnLrgeTRExrzVuHJdiWe7/mX7z5Cagd13oNWMQURQyszio8GVsOUhfYhTq4V6XWysnsfg8zUnLmHc+dnHvm6lT74WvbqLjkisLJQJDVYGwapWbIVYShHReMY4SLA/xVbiDCaqyTpXfbFdF4AB5roIPs+gHX8XmvnGvtWxrCPcmQtVZOtTprMxS8RGTxPQMjy8U0ngaOzhch/N4h55uXZhptgDCSvvrFAdmr+/9HtSMWdSFy1w13tMx4YoHKUTiPx/Qom4ewqeGOu2Wt7UNB8goX3gmln9qRv+/FBKtAn1p7XxW3GJsUAa1AWAlIeOOCs9bKvB7pLzVemwl+HkmLwgXrcjnZ+7w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWRLaEc2Skg1M09QcGxISEdqVVE2d09lUVArVEdybmd6azhXaGhZT0c3R05P?=
 =?utf-8?B?OWhXbFJzUC9OR0tNNjRra3QvWWIvZ3ZZRWxjdXlyN1pPMXlUaU0vaTloN0N5?=
 =?utf-8?B?R0V0ZVVMS3FhSWN6Rm5kNkdOUlJjVm1PZkd4MmhmWXZQZkI2a012Tkg0VElO?=
 =?utf-8?B?UG0rZTRoQmY4MGpRM0o5ZTcvVExyL2ZiK0E5dnROdWphaWI1a2ROdTZDYkNo?=
 =?utf-8?B?cHNEYkZ6M1V4ekJzdHQ4b0xIaVNJS3hQdGNNZThNZ1VpSTJqRlhzM3BDSzE3?=
 =?utf-8?B?T1huK0M4WEp0MVhBeTVkdW4wTEZuZmhPTi9GMUlGMWk4QnU0V3VJUFpTVFNa?=
 =?utf-8?B?bmFCTGl4b0krTnBNLzIyeDJlVzdCTmRlSGtSbjNISUJLT28xbWtCQzl3dUha?=
 =?utf-8?B?WXlJZGNvbU9ZY3lrQUZaMHg5ODNkMkhtQTBxN0xSd2MrekdiZ3Rld3dGNnIw?=
 =?utf-8?B?TkljUjJyV09idHBWOEZJbUFxRm91emt4QUpoa1VuRHUxRjluaHpONmY1aSs0?=
 =?utf-8?B?NzBkKy8wQlhvSTJtcWpRMVZ6aFVzUVM4clR1bDBMTWpFVjh2QUdtR3BwT2NW?=
 =?utf-8?B?b2o0dS9XblMxcGhtQy8wYjVtZ2x5aU5ia29CMno5ekw3WGlrUjZZc0JDUEoy?=
 =?utf-8?B?U0tCZ2hwZElxWUlpcWtld3pLamU1VHJBUUI1QTVzNDl0Uys1UGI2UHdKR2xM?=
 =?utf-8?B?RGplZG5qQmJsczEyRWJFSXF3YlJrOTFrcW0wY09EUFAxS0RmRTNSSzlVQWtP?=
 =?utf-8?B?SUs4b0NTN1VCY1Rhd05FMHdRc0xWK25LVnp3R0dyQ2Y0SlBOY1d5YWROQ2ht?=
 =?utf-8?B?T2JDemJtSlNvNllMaWRZdm55OHhSazN0R0F1OHJ5WlgzRmU4Wjg1eWd3Z2V4?=
 =?utf-8?B?WHZJeE5XWExDTEFvSjdOV2dXNEpQdlRES1JEM3hya0M5UU1Bemc2MW1lQzNm?=
 =?utf-8?B?UEJFV2FSbnd1QVJBbHpkYnk2UmdwN2g0dm1kMFVjRFFnTGhUTFU2Vm55S0gz?=
 =?utf-8?B?cC96eGF2TFJleHVZZjArdDRBSjlDajhEK3lhdmFUKzBpK2JpblJaYTlxS2Vm?=
 =?utf-8?B?QzRrNmJ1dnArUHFZaCtzWWxPa08yR2pXSFNMMURCR0REMTdKbmJWNCtNVWtH?=
 =?utf-8?B?cE14VGZGcjY1STZpWGhiQ1NjU29mWEVDZ0dkREFzT0tIYndDMXVaZ3RHbDlY?=
 =?utf-8?B?WGFCbXBLbld4VXV5a1RSUktMQmcyZTh3SFZQRHIzM2diWW5pT3F5aS9MTm83?=
 =?utf-8?B?cUErd0ZLcXoxbTNjdlNGU0xrZ2JUQXhtb0l1RXZpeS96V0Q3N25TbWR6akxT?=
 =?utf-8?B?cDN5WE5KdnNFcHdQby9oc09FcHRvVUczMEtZOHBtbktubCt4Y09aZnB1SXda?=
 =?utf-8?B?YUdZTTNRYUFQTkFsMXd3SmdGUDZhV1pCY0RzMjZqWUtJOWhxeHlndk9MR29G?=
 =?utf-8?B?Tmt5SXE4YTZYY294RE0vR1N0SGRmeFhXbE05VDV5ZzVDTTlQSEpWSDlhMTlT?=
 =?utf-8?B?V3FmaGZJVWU5T0FpNEFxZG1URFJJNU9zWFpRYlpiS3VvT1Uxc01PcGZ5WTRm?=
 =?utf-8?B?VXcvQTZ4aUNRY2ZTVTdJRWJDdG4wdEpHc0NIUnI1K09IYjh6czFyc0V0VU5j?=
 =?utf-8?B?YUxJaW9aYWtuMVZ4N1kzN29KUXMxUVJRakRYclhyLzlFVEpEaHIxREMrQm1P?=
 =?utf-8?B?Y01nVytMYXNnMndLZzNQN3d4QndBZEtRNy9kZE9mOFpScHVCUmJFa0tUK2FU?=
 =?utf-8?B?SHVMS1gyaUhHS3dLYzNhcFpxQWY0MWJuL21uT0hRLzBVRjk0Mk1uNVpBd3Jh?=
 =?utf-8?B?SG9JRGdsNkNOa1JvY1BQcGdGZllUZXpmSmhycEhHcFNEaDhrMUg5N1BjcWZ6?=
 =?utf-8?B?M2pQR0NvNmNHb21KUmQrNVNObVBycTZuVlpjN3VONzdSY0tNU2x5QWxZYS9E?=
 =?utf-8?B?dDhkNWtRVlhSNUU1S3JNMUtwQTgyZ1lMUFJ5RHg3WWVuYm13elhqTTFaQ0Iw?=
 =?utf-8?B?RWVxRFI0TXkwMGtJd2JTMU9PNmRqdERNTXd0cGtKYlhoQkQyM2RhT0JQQ1g4?=
 =?utf-8?B?aU1xV0xhdUEzTDI2Y25EZUE5ODZLbnUyVXFxSnJOWkROV0Y1ZGc2T0R1bjJX?=
 =?utf-8?B?TkJwQ3lYcWh0Tm51R2dDQlVoako2UVllUVlwRFNaL3graE9xUjk0eWFzUFVl?=
 =?utf-8?B?WmEzcEJaa2N4aXRnLzVoVU9sbHJYaDVtZzZOZUFKQUdJYmJLY1NCOVNSNm9C?=
 =?utf-8?B?TnE0L2ZwSFVac2d2ZFdzdlJhSnBDeVgydloyd3pBdGJhcWJrTGcyL0VveERF?=
 =?utf-8?B?WWN2dmRIaExtNjJUNWNaTk51TU5teHdFaXp0Z2Q0Z1Ywb0xYYXRVUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58980256-614f-40f0-a345-08de8f1a01e7
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 11:38:19.9171
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rWAIP2Fmdi85RuBjImf7uLve7taxn6OQtAuO+SPlV2XSnSy+jrujfl6gZttjlvugezrmur5kwEr7eE47VITMFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6148



On 31/03/2026 12:23, Ashish Mhetre wrote:
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
>   drivers/memory/tegra/mc.h       |   6 +
>   drivers/memory/tegra/tegra234.c |   2 +-
>   drivers/memory/tegra/tegra238.c | 395 ++++++++++++++++++++++++++++++++
>   5 files changed, 406 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/memory/tegra/tegra238.c
> 
> diff --git a/drivers/memory/tegra/Makefile b/drivers/memory/tegra/Makefile
> index 6334601e6120..0d50e37d43af 100644
> --- a/drivers/memory/tegra/Makefile
> +++ b/drivers/memory/tegra/Makefile
> @@ -10,6 +10,7 @@ tegra-mc-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210.o
>   tegra-mc-$(CONFIG_ARCH_TEGRA_186_SOC) += tegra186.o
>   tegra-mc-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra186.o tegra194.o
>   tegra-mc-$(CONFIG_ARCH_TEGRA_234_SOC) += tegra186.o tegra234.o
> +tegra-mc-$(CONFIG_ARCH_TEGRA_238_SOC) += tegra186.o tegra238.o
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

It is always better/preferred for the dt-binding patch to be 1st in the 
series. The above does not exist until after patch 2 is applied.

>   #ifdef CONFIG_ARCH_TEGRA_264_SOC
>   	{ .compatible = "nvidia,tegra264-mc", .data = &tegra264_mc_soc },
>   #endif
> diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
> index 649b54369263..d0da4a5f192d 100644
> --- a/drivers/memory/tegra/mc.h
> +++ b/drivers/memory/tegra/mc.h
> @@ -238,6 +238,11 @@ extern const struct tegra_mc_soc tegra194_mc_soc;
>   
>   #ifdef CONFIG_ARCH_TEGRA_234_SOC
>   extern const struct tegra_mc_soc tegra234_mc_soc;
> +extern const struct tegra_mc_icc_ops tegra234_mc_icc_ops;
> +#endif
> +
> +#ifdef CONFIG_ARCH_TEGRA_238_SOC
> +extern const struct tegra_mc_soc tegra238_mc_soc;
>   #endif

Does this work? Tegra238 is dependent upon stuff in Tegra234, but there 
is no guarantee that both of these CONFIG options are always enabled?

>   
>   #ifdef CONFIG_ARCH_TEGRA_264_SOC
> @@ -256,6 +261,7 @@ extern const struct tegra_mc_ops tegra30_mc_ops;
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
> index 000000000000..5abdca16a275
> --- /dev/null
> +++ b/drivers/memory/tegra/tegra238.c
> @@ -0,0 +1,395 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026, NVIDIA CORPORATION.  All rights reserved.
> + */

...

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
> +	/*
> +	 * Additionally, there are lite carveouts but those are not currently
> +	 * supported.
> +	 */

I don't know what this means?

> +	.num_carveouts = 32,
> +	.regs = &tegra20_mc_regs,
> +	.handle_irq = tegra30_mc_irq_handlers,
> +	.num_interrupts = ARRAY_SIZE(tegra30_mc_irq_handlers),
> +	.mc_addr_hi_mask = 0x3,
> +	.mc_err_status_type_mask = (0x7 << 28),
> +};

Jon

-- 
nvpublic

