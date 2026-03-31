Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012002.outbound.protection.outlook.com [40.107.209.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F58C3A4537;
	Tue, 31 Mar 2026 19:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985606; cv=fail; b=oxcxY1zYR6N/87MZKl3K6+g8LXOploRabLBdlKqnSULcC9Lz9zouqfJtFMqFvj5NPoHE3M/87UMqcwQfGA91hAbgbA94JrElDmkNP1aQRSD4PTHiOWqrF0/oCK+gQpCDLZ2NEGxb6OoAwxeeG2Lph0dPuYx6BxRjnnraptnlNEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985606; c=relaxed/simple;
	bh=9jtn6n9IjPDor5abFE2W/65oJtR872saKZG6BJ8R2dQ=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iC2T2mml9i4/kd6VhHo16YkzU7V18ZVtXzuFZkNrpmWlauxECgeBC9GZi8TYscsCNdvoyAIsqv1//yZ+GKZ09vvDSfm3TPShnNd/vmE/us41R3v+H2QHERFNIvZjmU0X3R52+DtgXpYJAB78uQTCAocQwZRG3Eu3cWCwLbWGmAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=C+uL6EEJ; arc=fail smtp.client-ip=40.107.209.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="C+uL6EEJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yJU/TzV7Pl0OZkZwJDPfJ9BZsV3T84Plv89mWvPOIxO2sZtPYoJqUBE3Va5XZuV5NAerA6jauT88MyxxmnbJhEkiQ6sWGbW5jbKgoKYe9NAYVfxQ7NFMXU7C5oPBIukEG3LaTKnoIduitcVqaJDNdZ76FJdigcqosacLS+TgqCDnkDCYrAqR1AEAsZ/4n9PSSdO0n8aI7RUGycZmUcmz9G7Wj866dR+0K1egHJBQZdqz/Jl9bc8teC/heHdEmBFyVip6dD46OMiyJ9vlHgIOgmObbh2UsStAiJc0xz9J/1GldhfjoTHMOgOIs3h/YuHbgIT8BrldMCWOEVThUEK3gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w3zxYA7wFAaoxa7X+cZxnVg8mt+rsHwl0SWZx1mkDGg=;
 b=AKsV73uX1ZfHaf1opEo6D4iG+nV7B6slHua/ZCpgxHgvrc1XfKQpiZHu5feKejkCE7R4re/F5ljAwQum1U7m0xX09YiGcPrUj8ZHEilbDZyUUYVQ4bx6QMzBtOyxolQLhgVfn67ew4YSWebbo64DtQJ9RspL5H3+Q8Q3EgIXXUy5HJ6fRa98uNvQj7ECH0rM7zCkoT1MkF+MpayuQfLp3ZEr+d3T+xsejWC8J7afAIij8Yi8FDBh+kb2xHuxDyvExt9HHcKCS2/bJX21wbx3GX8jTLjXEDP/wHGSiUcWE2mhatS4KfrC+NJvepNs4jgLHLNmjdoCeSH72XIAP41FDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3zxYA7wFAaoxa7X+cZxnVg8mt+rsHwl0SWZx1mkDGg=;
 b=C+uL6EEJ4Z85dnk4+Uu1IFsLngJ5W+Sp+THzzHfDH/tKT+nnyXkPHZoAa1VfHA/rgBWuVKEfj/rSOFlGXVqXx2Kr9IwNJnzfd2Y+kEcKF7cnrssjrqIymbhNWjx9c/ik509O4bhcLl5x7rGavMYE8EvvLqHMfx0fWXG3zkS3OVpHOJ4Ra3pWk0i+z+P9suse22+qSOOoaSFyhurSnmc/iPhgaxLAYGjRo7h7yA7pIsUtK1t6ozeZu4QgcbFLdfAzYj9LKZZE8MARmEzPBTmckSQaOkLJFd5pNLfytmHooVhDmD/6U+a2POSMzXJDnzwF2YM4ipvqCuvajTUuLhdwoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB6329.namprd12.prod.outlook.com (2603:10b6:208:3e5::19)
 by SJ0PR12MB6880.namprd12.prod.outlook.com (2603:10b6:a03:485::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Tue, 31 Mar
 2026 19:33:21 +0000
Received: from IA1PR12MB6329.namprd12.prod.outlook.com
 ([fe80::eadc:c846:73e9:8ccc]) by IA1PR12MB6329.namprd12.prod.outlook.com
 ([fe80::eadc:c846:73e9:8ccc%6]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 19:33:21 +0000
Message-ID: <3cf37905-189a-4591-85eb-473268aea912@nvidia.com>
Date: Tue, 31 Mar 2026 12:33:17 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: tegra: Add GTE nodes for Tegra264
To: Suneel Garapati <suneelg@nvidia.com>, jonathanh@nvidia.com,
 thierry.reding@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org,
 amhetre@nvidia.com, sheetal@nvidia.com, kkarthik@nvidia.com,
 timestamp@list.linux.dev, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, robh@kernel.org
References: <20260330170657.185854-1-suneelg@nvidia.com>
 <20260330170657.185854-4-suneelg@nvidia.com>
Content-Language: en-US
X-Nvconfidentiality: public
From: Dipen Patel <dipenp@nvidia.com>
In-Reply-To: <20260330170657.185854-4-suneelg@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0010.namprd10.prod.outlook.com
 (2603:10b6:a03:255::15) To IA1PR12MB6329.namprd12.prod.outlook.com
 (2603:10b6:208:3e5::19)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6329:EE_|SJ0PR12MB6880:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d4b2eed-b73c-424e-5c4a-08de8f5c5e01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Ho6djujNLyqRy5loLm3O5CSYbS25YUIWnb38uOjAR2y0zqsarss6nQ8KiSoH14pwf0ehNynCVl2D6nrlxlcG13Hd1ac8Ye4EsnOaf4XDLVEHIDyby7WmXYTzGrEvOas/NnX5v6tlF8ewZZZxOrdrHSw78FDW2yv5bsJ4i6XDH+0zIdXrnwUc9UgUuTQhjlo0jaAyTSr0DfREWfBVp/eTLl8ndIN15+RJevtNIzMbnToKmvpULiBdzE+z5Rjp9uMHuv1gB0uHWlJsS33827YwDPUp9rwXVwGPOSTIhnX27J2QgJ1XIkU6p6oO1LZnXIU8ohDDeXryp0IRjfV7QFltvh6omt3LFjwkcG0Wr2MzYFubAdX4GilLAejbX/vQLQyDODDM9zl4Ise9qdotWDN1iVQ0Xc4OE1YMnjCVRmnm/cprbF4KswBQU539d3ztd9G8yk/IEpooYkYAZpUHnw935Ja/UegVC6DtezJ7YPgWoBYTyQ1AJaWWz8XnTj5iRAU+Rk39M7XC8mKuUO60WMfGYCUfAOHhY79p1BHO4LuNC7jm+O6cSzwczj2eaQAJqMAzvoMwe+qVc6QDIoGefx3NOHsRIlDWqsxgKlonE/Q+pzryr8rzUM1/EAGPXrRc81w0kLYjPWHxZa7mAAKLc9VYBOq34QgvBaGWJK3rFB5brO9i5if6bRVAiQWCW2+HYgOjaEvEuy9yiSLkGscMuiC3ejl3OIZEPnHPkDr0NBGISllGUDOBhNNBR8Ec8DgJANTxBX3A/l3/R+CbtqobaVs+3A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6329.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0FBT2RLUzlXSXY0Yi8zQU11d213Mktyb3BnSzc4RmJROUYvMEZXdXhQN1ZT?=
 =?utf-8?B?enZNZHVEWVh4R1FtU0gyUXBoS05wNTV5bExFRlV5TUFiOTJEU1c0WFNVcFlx?=
 =?utf-8?B?VFBiNmMvUVF6N3EwWWExMzduK1dRMXBadTlINUtWNy9sSVpiN0NxSUZFN3M3?=
 =?utf-8?B?U1p0TmFzbDZ6T25xQ3hSQlNBbFoyelF6b2EzOVFicDdqRW9rSlJZU1F2YTJF?=
 =?utf-8?B?ZzZwOStKTGVoS0Y1OWlNc3FSU1ZxVGJVT3ZQeWJQVmFsSG9YK1FqeXd0a04w?=
 =?utf-8?B?UjVndnY3NzVQeFFNYkYxYU5mUEhRU1VOZXJKSWpvODRlby9GT3JYdUdvaEU4?=
 =?utf-8?B?b2dha2pqaWRYNWxEWDZZMkFUTlNhY0hLNjlicGtHdTVuakFaTEwwRjBnVlpM?=
 =?utf-8?B?ZUJaZ2xXWS9NUTNSL3A2YWdpTkJwaHBXTmtzSTdjTXBidXVqd0NGSXpabnZ2?=
 =?utf-8?B?dDJPZmV2YktJUDQ0dVUyNERYbTNzMnQ5OFcyVnNOK1Z0RnVsRUU1L1VFTkNC?=
 =?utf-8?B?OU0vdDYya2RrK0ZMZEZjSEdxbzdFZWlrTjRqT0VucTFsallhNGxNRXhCKzQ0?=
 =?utf-8?B?Tnc2aW11UjZTRE9vZkRkZlBscWQxMGR0ck9iVENpTVFLMk5kWjQ2Zk9TMlVq?=
 =?utf-8?B?NjluUjh6ajJuNmplN2Z2bjdhNUZxUlF1ZHdZRlRBWjhwb2NqTWxsdzhQRTly?=
 =?utf-8?B?aGo0a1hDamNITEhwL2tmV1VsQkhGaVVDTmFCOVJtN25mNHZVK2tQODdlMU1F?=
 =?utf-8?B?QzZYMlJTUDNJZTJXTXhxWERMdzUvL3Z0VjhLM3lIeEhqVzJRdy9ocEVnYjkv?=
 =?utf-8?B?clFkMnhDUW13RStsRENOTktFOHIyZFZ2UGhRY0RGbTRCYXJYblJ0dmtRZkMw?=
 =?utf-8?B?SzdRUjJ2UHhqQ3RXQm1DT0NVS2NPYlJ5aVhOZDZ3VFllNjVRUVRFVXRaWEV5?=
 =?utf-8?B?WGlMVk1NYzBodmZ0K1NObThhaHRVbkJKZk5MY09TcXIzQ3p2RlFRVWc1dmkw?=
 =?utf-8?B?R1pkcU1lWDV5U085ZXpPTERwRk4xdEZFUUxiNTZrM0RhZGp1NHI1cm16WkFv?=
 =?utf-8?B?MEVxYVZ6RUxjbklkY2N3dWFsZnh6MDhtY1Bva2J4dVN6ZW9Jd21uZGw2UlpN?=
 =?utf-8?B?UGw4QnQvL0NQQnlpVW1TR0dIWUFVc1dmVDdnVlN0RHd4ZUQ0RDVLUlA4VlRu?=
 =?utf-8?B?UEN4S0dUMmhkdnVQeTN1ajYweVdBekJWNVE0djhSall6N0ppVm5hT2NIdFQ2?=
 =?utf-8?B?NTBTai9QKzZkQk96d3A3TW9xMXp6R3RNN3ZhQjlySlN1N2k2OUlEL1dWY2pO?=
 =?utf-8?B?Y21nMWlCQUFQY1NhM2l1T0dJV2xIUGtkZ3E5MEhhd3kyNkNXT25mQzdsMWRG?=
 =?utf-8?B?WUxYVjd3VzFjUG9WV3dVbUFTd1RnWVpWU2hRaHZsSVp1bWNweDVFMGNDYVRE?=
 =?utf-8?B?eWNVWlpXaHRJaXBaREMzdGZxMUpzOVJQRktiY2ZpelVHbUs0dytKcXZ5TnlE?=
 =?utf-8?B?Tjl1QmN0NDJSTDFxeXhrZDdCK0x6Z2wyTkJDcTBLMGZDTDJ4R0EyTnBTeE56?=
 =?utf-8?B?VndLZ1E5cGFHZUNZbERic3hFMlJWbFBUWk9GcW8xbXNWeTRYc3QvQXRKclIv?=
 =?utf-8?B?WFAzQURqUFhqRGgwZXpMUGRQN1I5d3EzRWlEeFhVZ214SFRhRVM1c2dDUGJt?=
 =?utf-8?B?dmNyWG0ySWpnY2FYR2l0cHJLVDd6NkFDb1J5bGF3RXkycU5oVG9HN2t4YXFV?=
 =?utf-8?B?SHpJUm9qWVMrVktUMUlNWnc5eE41ejA1R1QyUXVyWUhPK0wzT29teVVXWk1z?=
 =?utf-8?B?bWxTV1RvRngzajdTcHRoelNLNU1HVWNjampIMDhLZWVveFNvMk9HWm9EMTNx?=
 =?utf-8?B?bVZJbGZjNlprWGxPcW1FWGs2TS96SHpnV2UvMGhWQ3B5cnBVR01QR0RxMzVp?=
 =?utf-8?B?ZWN3WW5OcVM1WUVtbVZYbDhlL245WHg4Y05SZFRBRUJhcVA5MXowRjArQW1s?=
 =?utf-8?B?QUMrMVgrRjhwd2krbkg5eU1IZ0tYVDJpY0UrUjJsR2FIdTcxODIwYzFFK3JB?=
 =?utf-8?B?Z2xSRy9EM2VLUzhIVldLQ2lUTTkxaGlUcVp2VlpQeVB4QVBHblV1L285eGNZ?=
 =?utf-8?B?WC9PSk5jQXlPb0tZdy9iZXRqaFpFYlpWem9YYWN2WjEvMkw2dm0yWnlQUlpY?=
 =?utf-8?B?WVkzRi95L1NwYmR0RWZDSS81bUtJRHVvbksyYTNYVG40TE9wdnA2ZTRmSC9U?=
 =?utf-8?B?MGw1dXg1ZE1FUjlWdmRyOVVDaXJLSXFCZmdzcHdPOUtwdE5GRWVCNnpBakxr?=
 =?utf-8?B?QzFGdWMwaGhxcis5NU1vL1RieVB5alpJMFVQMHVVT0JzYnF2MFBMQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d4b2eed-b73c-424e-5c4a-08de8f5c5e01
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6329.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 19:33:21.1648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EoGUM7E9gi5vQCCo54soVhgkDVjx6/1OrzE+k3nuJ1yB5eY0HAGslMkEsb++H7KWS2ygW0V523ITrOjmXBoqhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6880

On 3/30/26 10:06 AM, Suneel Garapati wrote:
> Add AON GPIO and system LIC GTE instances for Tegra264.
> 
> Signed-off-by: Suneel Garapati <suneelg@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra264.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
> index 7644a41d5f72..9b1aa69d4a79 100644
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
Reviewed-by: Dipen Patel <dipenp@nvidia.com>
