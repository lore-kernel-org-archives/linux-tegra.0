Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012050.outbound.protection.outlook.com [40.107.209.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3253A9017;
	Thu, 10 Sep 2026 16:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789058210; cv=fail; b=jGTb21R6mR6HMCet+4V3HZbwBZgjcFI9ZZlmcWGBniZXmfcJbjNhSXSBOghS8Q4TcaX7vivaH+n4nisaNC5Ul/KQVifxXUq4iszl2/HdHbMCqm+LPi5rFsfKD9SF4vsOTh4FpSXZ6Tdo7rT6OirU308iaf/Z7Gm3C73A47Ae9t8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789058210; c=relaxed/simple;
	bh=9ugAZjCn7Arhe21GeVHVPXgOLWdezHQbeElsc6w3QOM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nvGUe+ur3XW0bTW7sJ4zKF5sQL7fq96tehrGZ0PBRJcFnrrAxC3G/QBqL2mb2Pvu4ajHKisS2XdzrTG4Iv/TB55TEnduo5R+TilHprW4Q6EZHBtq37lugSQllHzjp4/xiprFh+5GDYOtvEE3UsvCwcizI0FQ1sfmZUGgMDXhSOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OXjvUtLy; arc=fail smtp.client-ip=40.107.209.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OXjvUtLy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dDD0bDMipeQ3soHREQKhxVnPTdDS24BuG6IUTgJ0t5JZj/7FRbTP9tnncwTsckGN7wXkjrz5IUMnCBZNxRKJGFDZ8xSWeD56/IvZHhZUePGil2LciMBBQJsMecdByVQ5VYU+Yj+ysyi+1cVycHQ+JaGAsB1b7qnBaQZtftC9RVcJFm/p0jDn7aHLlwiTVsHr7mx+e57/J1lxT2G1TyyWha6aa8BoNSLliW513+orpYbD2g/tQumL+EYRjW28bcGIEVvHLYLD8SS++LDlHUg17H1UQeofNhtbFJkKikF0B6Pnk8FZxPV2MqU71Jwn66qZB+GROhbgtdjOXODhHlFyDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lN8/HAZsF28bDcVnKLYaXSIR9cieJJdrRgfFc47zCjc=;
 b=nJ/v0Zid7l6Jj1Ou9XPAevWKfeSegZfw8eJxsnBHd8uOneo2at+HrHr6Wpb0L0G1+3ZiTT44EMT/nW5udD9QOaH4IDNRu9+Fu/tqEnuw2SRqx8xWf0skJgjL6ACJazavug6j7w3AZDcBeEXBRymnaHvo1jaHRROnRtrW7kZVx1pmRNj1kFfCn7lZr25OTMyKp/1w+xYPJzHmIpDfiuFmPeN7ZIMsb+WMe5+X9V8KaM6Gk20lJERWPkS22egCOZVLmoMdA+JzcsPlQAS3yFKQC3OED7EMdUf9k0ujJlJKYULWpbtf926lw2bf7Qy7vii1eoPMLAgSOukoDTqUoLYKCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lN8/HAZsF28bDcVnKLYaXSIR9cieJJdrRgfFc47zCjc=;
 b=OXjvUtLyTXZm3QxPTRwIbJXbN1d0WXfJDiYNu7ehv0vH1jNCh2XoBAFhOxPA84Nw3ZYmQ1MT1KZMeujqaWQNOawqaauW0MZARf5dCxuw31V2ZvgkTSZSsQzfk6aZIy1LpDMHL6wP06i8yiuIE3rOqDIvML+94K4kWVewBkJz4MPLuqdmFKI26li0xJGw7gRGheauYWQvv39i1UA4Eo+9/vre0DMFP/MnrFi+AWk2QnR1cuVhlMwSRFQBrnfQ7A8lGNm5/u47MACUjxZoFOq7XacGmiDAroawSrUZgKOzWueoryjNLqZaK5FqOeBO7Jmh53uTAvDOKrX+itngR1k6mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18)
 by PH8PR12MB999321.namprd12.prod.outlook.com (2603:10b6:510:40e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 16:36:47 +0000
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9]) by SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9%6]) with mapi id 15.21.0382.014; Thu, 10 Sep 2026
 16:36:46 +0000
Message-ID: <c9ad15c1-10c0-4111-a143-baf72fccf1f2@nvidia.com>
Date: Thu, 10 Sep 2026 17:36:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] arm64: tegra: Clean up AHUB on Tegra264
To: Thierry Reding <thierry.reding@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Charan Pedumuru <charan.pedumuru@gmail.com>, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thierry Reding <treding@nvidia.com>
References: <20260902-tegra-ahub-dt-cleanup-v1-0-028f3c5e72f6@nvidia.com>
 <20260902-tegra-ahub-dt-cleanup-v1-7-028f3c5e72f6@nvidia.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20260902-tegra-ahub-dt-cleanup-v1-7-028f3c5e72f6@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9P194CA0026.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::34) To SJ1PR12MB6051.namprd12.prod.outlook.com
 (2603:10b6:a03:48a::18)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6051:EE_|PH8PR12MB999321:EE_
X-MS-Office365-Filtering-Correlation-Id: cce5ea85-10f3-4b3e-0b33-08df0f59b493
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|22082099003|18002099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	chsEPxlrNMTFKCOie9ka4wMMlpqKwa6B4CV01WBWT3oF0DGvO4bszsBdNyF5zU9SEfXmpMIXZT1zFwnQRngHzWt9siD67wGuKNVCoVWbRNLd4etDL2VnmFqwzi/PQNComD46e5xKcJzvgxXmn/1C7YfIJLCXrtxlmYXB0H3skEOMWQZv/R5Efyhkov/Mxvr4iYN0fEwyo/DqK+1i9JjO6ze0OzBMTi/eagc9I/RuhZ73K9hPS/cHcnv978Z3nw2UphX0khVSKHKbnQ427Ydb8pTn8Immb+QfrJuIkXGbPbh9BbK9TcZUmepZUmi7NuKecZgt6q/IKexMyY7WV4wQx7JvMaX+pngP1DI8JTJADmbldT53he3AhnevPMKBVnQlAiJHpMP0fRHTj0xhOU/GBjrosfhQ6rIdMUcN+gY5E7nSBKk0SbGKhk4hvGzqvOrb8hH5ZPIeil/HwVMrcRsLc5PAKb3Or06GwITgkoajCt5XWvGGA69LG5t//l/URmB6IzzKhj1FK2t/yLmNAHoxe2SMXaUHM/h0s8ax+NzGtKhlZBl0QSa+8dNE/x9b2GGyPzSgo8kkDrOLtgDe/rsUOxF0rnGllmkwBodQYtiBEKUlAktWjAhIwerxjF8/EvrBcN1son65ICys1e+ef2THAuAKPBilHI+e5Ye2FAvYm5w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6051.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVBOa0FUK2o2dXZwOVVLdmxSeUZIdy9rSU5IMnZyU3phZ1BxSTZYTW5XVnpp?=
 =?utf-8?B?bzBZcG5GemRsRS9oeUF1WDdxb3p5YmVTd3JNdHo2eklKOGtieTN4YjVFRTVk?=
 =?utf-8?B?djhNNFZiSHlIUUZ0SWlTVXZYYkk2b3pnUDFLdW5WQ3lUcDdzbjhGZzNkMHV1?=
 =?utf-8?B?OWRzRG1lYVV2bk1aSHEzREZLWU5yckJjNEl2RUZibG1STzc1MUlxa0hwcnlZ?=
 =?utf-8?B?R0Y4QUczdlRhSExGRnBTYjJUb3ZuV2hVV0lWdmpQSzIvZGhkTHQ5WTV5cFFL?=
 =?utf-8?B?YitaV05LNFJYTC8rNThXK1ZNdVdpMHIvQTNMR0NaaDBnMERLQzJTMHpreUtI?=
 =?utf-8?B?ZCt6cndJbEd5dFBFSTM4NVY1QkRqYTNablR0R2VpWDBlVCtRR0JEOHdxZ2I4?=
 =?utf-8?B?UzRpZ0pqZzZvem1OTnp0OXB2TnlNTERjZ3o1dm1tTWpta0g5Z25ZQUJpektn?=
 =?utf-8?B?bVcydTJ5VHZ6T2JPRXRqNnRSSU4zTmxQU01SYnI3Z1B5U3l0cjBBQ3drejdr?=
 =?utf-8?B?NDFjQkV4RmtieVBqQzdYTTdpZWh0NVIxYnhuZ2VRSlpuQ3hDYjc5bm1lTTR2?=
 =?utf-8?B?aTF6OHA0M1Nzdklxa2dFZGZUSmdhTkFlZjdTSTV5RXY2SDNTa1Y2NlhwRnZm?=
 =?utf-8?B?YVZISUhnR0NPVVh3Z2F3amVxRzNWMzhubGN4MXhlVlhqYVNJV1Z1alB5MTdX?=
 =?utf-8?B?QzZyakFic3EwMUQ0ZGpya2dvNE9FUXRjY3NNTEFGUEZXMEw3NllrUVZCN2RR?=
 =?utf-8?B?TWZESUlpamVxUVR3YlJ2ZUI3WFdXUUdzb2tMZzJvVG9kemJLdW5EaENNWE9O?=
 =?utf-8?B?NzNnT3ZNQ0VMZFZIN21LT3BGZStVekNEUHlmaDB6dTNoOS9EQzZEblhsUFYw?=
 =?utf-8?B?ajhoZElQOFNvQXlpSWMzdjhzeDdBY0ZNM0g2dXJpRVh5aUdGbEVJMzE1blA2?=
 =?utf-8?B?SGhuSXQ3UndHMU9BemdNNU44T1ErQW1IaDdLMVFHaWMrZ2JVUFh1Y1UxYnB0?=
 =?utf-8?B?aXhlOHVCTERzOXo5K1dWVmNsNGZBbkNzUkdZRFNVRlZBTUMvV3FER1B0MGx1?=
 =?utf-8?B?SFNmTlo4T3VEbHhHWSs0RWtaczhOVGZ4N05teWNKM21PcFhOaklUL3NuVW4x?=
 =?utf-8?B?MGZBT1lPQ2IrWkxabHQzVEppS045U2dIandQYTNoZHBsUkRtUk5NbWdHYlJz?=
 =?utf-8?B?K1ZuSTVyQmxkNjZhSVgvb2VlaVk1R2hBbVBqam95MU8wZjVqeXBuUFdTOWNP?=
 =?utf-8?B?NC9RS0pHZ09WS3R5cWdmK1pmS3pZUXNFellqZ2dXMTU4d0hUUkt5Y1BQRndN?=
 =?utf-8?B?aE9ma2RSRmhtYWdmUmtIdnF5NGQ4Q2R3U0lxdFhWcEZVTGtJNTJBbm0zTlJk?=
 =?utf-8?B?WGtnWnp5YVc5bndMeGhBakNLYitodE9yQUN3K0pieFJFNTNna0J5RFVma002?=
 =?utf-8?B?Q3lUcEJtWlZjelJCV3dZbkduSElyb1ErajlCczNMU3E4QTRoYUtDUUZ1eWVI?=
 =?utf-8?B?Y1dWY2V3NE1iS1oyYVpzaFU1N3FQdkRaUmhrb1FuU0pTdFcxRFJXcFJlbzRH?=
 =?utf-8?B?YW4zTXZacEQrY0xrSWpsRnUzYmtPOHhmdmx5allhR0F2MWxRRmVSUWZoYjdG?=
 =?utf-8?B?MUEzUnRUWEhYZXQ4MlBJOE84OW1jT3V4UTFCMDZIa01LVzhtOUhSYVdJa01k?=
 =?utf-8?B?dHM2Ly9mdEU4R2lLWGRHVWNlNFRHYnFjVS8yS25pRFhFcXJIR2RmYVk1bitl?=
 =?utf-8?B?S08vZXFTeWhrUTNzQjEwdHdmU01Wb3dzeUlxc1FzVVRxTERleFo3Y0tkd2hJ?=
 =?utf-8?B?bWExSUxnOGJCTHZ6WE1FMU9UY1VBN2hTdTgxRmphZTFpSkF0dkpwSjNDcVhH?=
 =?utf-8?B?MU5CaklNOTNLU1cvRWswRVM1eVVDVURER1M1b283akVLSEZlRjV4Nlh1ZnQ4?=
 =?utf-8?B?RWFXc3JaYzJLczBUSjFtK2lQbGRNdEtJVUFZZThHYmhmaTBFeXFpei9XaXZG?=
 =?utf-8?B?bVRmSVNMbzIwM0dnRTZLeWlWTkxMTFhRZEVJZ1hnZjZIWEorbnJJUC9WU0lw?=
 =?utf-8?B?VW4yL0s5WGZVTlhHK2xYWEdmRCt3SWVwSUYyN3J1YkZuTHZWWUVoZ2I0Vjhp?=
 =?utf-8?B?M2dvZkUwa1ZSRmVuaUI3Qmw1VUZ1QldGOVRacEFrSFYyN3JwWUVRQWg5MGJC?=
 =?utf-8?B?b2hib3FCK0E3WXgrWkZIZ1VpaE1OaWU0cVdNcG1lczRmZ0FaMEQ2bDRkd3V2?=
 =?utf-8?B?YXRXS2dMUmRJRlVGc1FjbzVPaG4yVDdjdHk2dW1ONUxSUEtxQVJjbk1jNkpN?=
 =?utf-8?B?VmRNVGNpWVhBS1NQejJ6eWcrbnNidFkvcG1qTkxzblBoWnkyRG1Vdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cce5ea85-10f3-4b3e-0b33-08df0f59b493
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6051.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 16:36:46.8678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: syfUuWzvr1PTPPVy3pQndLYkWd05eFsngVRenAiTy2A7rWHq3r+ac/QDF4M2qbOGCXDlnPpQjSSvfUGeg8C3qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB999321



On 02/09/2026 11:17, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Use #address-cells = <1> and #size-cells = <1> because we don't need
> 64-bit register addressing for this hardware. While at it, also adjust
> the ranges property to encompass the entire AHUB range as per the TRM.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   arch/arm64/boot/dts/nvidia/tegra264.dtsi | 118 +++++++++++++++----------------
>   1 file changed, 59 insertions(+), 59 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
> index 6b2e3a6ab810..4ed7dabafee5 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
> @@ -129,13 +129,13 @@ aconnect@9000000 {
>   			power-domains = <&bpmp TEGRA264_POWER_DOMAIN_AUD>;
>   			status = "disabled";

...

>   					ports {
> @@ -1584,7 +1584,7 @@ sfc1_cif_out: endpoint {
>   				tegra_sfc2: sfc@9710000 {
>   					compatible = "nvidia,tegra264-sfc",
>   							"nvidia,tegra210-sfc";
> -					reg = <0x0 0x9710000 0x0 0x10000>;
> +					reg = <0x9710000 x0 0x10000>;


Looks like a typo crept in here 'x0' which is what kernelci is
complaining about [0].

Jon

[0] https://lore.kernel.org/linux-tegra/178905234343.3919.16985173968804561026@kernelci.org/T/#u

-- 
nvpublic

