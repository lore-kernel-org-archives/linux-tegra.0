Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012035.outbound.protection.outlook.com [40.107.200.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915A31FF7C7;
	Mon,  3 Aug 2026 06:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785737144; cv=fail; b=hVACRszf4wfjUukQ7RvdB5stbIG21z2iQiXQrjEOcXT5fAXbcGtEaWQwyIhtCdlVia6VowYJg0rTpj+BbCs8CJXJnpTvhviyRE9mcYIySO0EwkK1KuoGpP2Lve8hjptYbIzK+jhYM+IHTsLvFv5gJVYVVcW345vsJLGuhbCMEow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785737144; c=relaxed/simple;
	bh=4+BRX7NUwWWSUUeKrG8SRK4BcL+Vam+sIu+W3YgRfhw=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GJuiaILWu+VwKwUrd2wXfl3IIP9HiBZBK+j/DEhbQqKHDvk8OK6IvyC9mT8i7Dmw47EKASUKIQeA1ZPieYmTnytyEoqJDf1Xe/NgxC8Ue406/f+YnS3Kj5d9ZpDkqn+c2f8bC9uXICFSnayvWD/Nwjo2EihHOia2tdfrZ9tZLik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=1L0NkgU8; arc=fail smtp.client-ip=40.107.200.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1L0NkgU8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MuRwV9orrniJBGcWQTyH56glwExBIQqH3+BaGOhYTZzZ8MrUfMlWrHZbioqjsFYqhGYPh/6a/8rRfVh8AFIEF6KpUJjfX8MVYGbh/wxMl8y07/eoN8aVBpH6OV5Dfnt2pirWqL+1B+RYoN0CPcvWKxGRGZWKTSlxZm1byvLR522wL4E120nlYsHVdwsfO2xo9UwhejzQFori3b/8pxIjsSiPxW2cYup1fzMFBsYPV1aamb5L7yi1kFhspD6TyS3PlQ2ACIsNEplKur+YGs02Q4CyLG/ADnhH4o+vrPq1xY6zCRmLD7uN4NbZX0FCeW1SveYPV2CZa7Sp0HEyCnCA+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fic+o5xOPl0LUBDeQ4o5ksmZcI4SzJ9nrj+6tkfgd7g=;
 b=b/Q0pze6XAgzsOS9zj3zzgxyJpBTbOOo8KaF0iuKF2MEbbeGpMD7+aZpPu2xpAF132YTs1M32VeKoSINqCBdpaUGqT2FhqhwMBd/iSD9rg5VrL+PU42zKj/ODoe7gAKwjNdvBX5tI+hJ47wXtgOJSO4/xsYSp4VmMdyptqLQk23QbtN2pKAnuiQJv4jjTkVZu9+khLa5PIkHYmIIBpT7HV9jNP5zstXuw+BCtUHnfGR8F1tkcfl7yBsFcob6JDaqSB0LW5D03b8Lyu+gX0oj/UX0JEghQazKEc8YfTnLj32WBqZ9XxH5dT8m2J+YavZi4CVZCA/f2KqBwD+t38sAoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fic+o5xOPl0LUBDeQ4o5ksmZcI4SzJ9nrj+6tkfgd7g=;
 b=1L0NkgU8Qh39JGFZrK7NQCdMaMLoQB826HCokZjuQaMwGM6Lfg/0PHXZjiK2dVqjWy3YFPmvuuiqBTXEq6NBSTKTE6FEBcEk5Vs01hQqMg6FNnfslJzc97pvkd1NkmJCBvKEcFpcyVaJi5aGP6eiAjQEJddNwdH98UYKRvC6QYQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by CH3PR12MB9454.namprd12.prod.outlook.com (2603:10b6:610:1c7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 06:05:37 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 06:05:37 +0000
Message-ID: <dc6ae753-d50c-48d8-8b37-4a525fa81f47@amd.com>
Date: Mon, 3 Aug 2026 08:05:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ARM: dts: Correct white-space style
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Khuong Dinh <khuong@os.amperecomputing.com>, Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Dinh Nguyen <dinguyen@kernel.org>, Thierry Reding
 <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-amlogic@lists.infradead.org,
 asahi@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org
References: <20260801210210.383417-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260801210210.383417-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0045.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59e::14) To LV5PR12MB9779.namprd12.prod.outlook.com
 (2603:10b6:408:301::14)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9779:EE_|CH3PR12MB9454:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c4e2413-0b28-436f-6370-08def1253d2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|921020|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5LKMOuMYJgyHQ+utgYRMcklgTwUpBhIEC1tkXepHB4CUE32F9v+IM5tttIjoTjeFf0KoQPeJMHuY/4/ER5VQKfkPTpRF6DW3HUCthVlP/Vz0N0XzEP48YFBzIsMnMfIj4Y0492HktkkhWlObV1gYtRXXxh//ls43A2j4LNm2i0jhRnyjOTg+1WfRpagX/Yl6CrJ/TGdyecPr/EuV6wD/a0k58eQM0MR5zHyxj0EA/3pOF8yyN6XQxOLDJ+l+iDW50jDptD8HsXlwGr7T+EekE66LXIzWWryrrJfVjLDIVT51or+tZZRPHsWaCWrERSjdp6IuVXLIkmWIhebPT2vBGDkTur0q5guvxDNo4gE6oQY7GNtwiPOz8WhxBtM1cbSFdpnE3RdEfNJC94G8JdNn8L1IA4+4Vz2XkwQXAvf5tvYTYHp+BVF5nQFjiDsXDPpTqA0OcC/cr7jI+LpH4GLMixDB+Tn1KGgFQSobmKn0kdvaLMHN9MkY6gUC6y4K4C8AXH5u8N81U45uvSl76Y1q6UOgZJY40ceqtfJsfTAkuZr57dgPXTNFwDILBoZGeTegs4crLvPncx5NzRhouXkoOWBlSCq+DuCBmtWKdVYR6QN6COTHd36F6mo4U4hCKhAB2whJFa7dLnuLurgbxb0LbR96MBCWzcGc6WuvKxBnyxPutzYsjy65B+rxv4h6/F+C3JTg+zzfeGnh1Nv0e+SWcg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(921020)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U0JDbzc3QzhoR05qajRPc1FSekorOXB0cWRabkc4OFJyZ2Z1RVJtNEpTUWJO?=
 =?utf-8?B?d29wdUEzdE5XUUJ2Ylg0M0hxOUtQOG9OMTI2ZGhZM1dXRUtNU3lGNVg4Wm9J?=
 =?utf-8?B?MEJOVGVoUnhrUGZTcDlwSzhrK2dYNlV4bE9RYWJZMzFybjlaVnFtNVk4bzRO?=
 =?utf-8?B?U0ZSOWVoL1Vla1FqQkx1aStEeko5MDhjRWM0Sm5KNFBmQ0t1UjJKQTBNUDht?=
 =?utf-8?B?SkZ4RXp2NFAwQ0dIbTZBRDIyeW1ta0lCN1hWQXp2c2J1d2hCbVFyOGtkV092?=
 =?utf-8?B?L2trU3hCa21RcFFWQ1BlRlFaMFBlay9LVW5hSk1NbzJrNVR3bWtLV0xtUzlv?=
 =?utf-8?B?dXhGTWJvMkpRa1B2WXp5Wm9Mcmh2R0ZYWG4xK20xb255QlR0STEzMzcxTEov?=
 =?utf-8?B?QUs3S2FkZXJIYm1DYkRJNERQSmNlcXdMVXhJQXp3V2tQbkFkRFh1QUJqdi81?=
 =?utf-8?B?eDM3cTArTzR4UnlHZGZwaXEyWllKOHczaTlDeDU5RFdGdDloaldKZXdBdHVD?=
 =?utf-8?B?SDNOd05xeVhDM3U3TWp2S3Fid2JYTUtKWGxaYjdqZG5mTXlwNTg1THd2bzFq?=
 =?utf-8?B?aFRmVEZVaUxWZkRjSlZQODltdGlYMUYyWnNQb21DOXJ6SmZ0TGtXcVVzL2kr?=
 =?utf-8?B?cUFsVVlBWXowbWRNditnanRwa0VVRlZEdHRDamgrKzBkblAwbWphdkxhSlZE?=
 =?utf-8?B?MmgwV2ZONUQ5T3ZxY0pSdlM0d2hXNWdGZUprTlVMb0ZTOEhYSS9PaFhrT0l3?=
 =?utf-8?B?WFF5anBLTDMxeFpzZkMxZlZXdUlJUTJzeFBTMTNNNE16SGlpRWVDSXpMejZz?=
 =?utf-8?B?dWYwV1B0cXRCOTVxYXVmZ1czbmozV3EzOHRVb04vRHByNHNIdFo4cjRZeVRp?=
 =?utf-8?B?WkRXaExVR0RKbVNFdENoVEpCK2xMM1NiblNxZnBBdXZNSURxZGlnNW92Q0VR?=
 =?utf-8?B?dDJybnh5U0ZXSDNaWGxLYThHUVIzVTBkeUl3SkI5Nld0UWxiWTdKZjkxdVd5?=
 =?utf-8?B?S3pJaU1HOHYwaGZxcDlScnluSjdLQ0gwWTFpWlJ2V1JWMzJTaHN6OUVGRFRX?=
 =?utf-8?B?cXJSZG5GWnFwRDVkbUs4OHlnTlRyZDZrbWFsU1lDTDI3RWJNc2lvOE4yQjlQ?=
 =?utf-8?B?end1Uk9DdXkzdEZSTkZDTWl6OXMvMEJRM0pLbFJQYnY4UHFyRjZ3NjI5SE9r?=
 =?utf-8?B?UEtqSTJFQzNHSXk1WEpXbTQrVXkrKzBzQ3dyK2JKVU5WNTExSVMyQmRIeVUv?=
 =?utf-8?B?aFZFaVZYb2VON3djWTJWZGxzOVRrTTRCeFBWcTFjVURvcG82TTA5UHhDa21O?=
 =?utf-8?B?ZDU4YzRON2xOamR3MWJHcUxEZno4K0hTYXlsS3hXS0Uvd0VhaVErbkZrODNB?=
 =?utf-8?B?T1ByWWNmbUdpZXNOZkdtcmlXMmsrdlJCNGpTQ1hoSlJycjRkMndQRmNLTVBZ?=
 =?utf-8?B?THdubXNOc3pTZFhvbjh6eHM4MTZKUHNSNFFZdnU3a09BSHVUaTNkaWx4L2Rv?=
 =?utf-8?B?WXFUVUNxT21sMXN3NmJtTm05c0x3RnJIak9xY2xlTms1UGNXbThiL2Exd1Fa?=
 =?utf-8?B?eG5IMklYa0FReEpFeWNXbWtEb1lIVUU2NFBMb2NndjE4SEVPcVFoV0VqVUkr?=
 =?utf-8?B?K1lON2dQQTdFUm5OSHBkZXpjZTVHWlpnQXpKMWt0QTlyZkgyZ3BoQmJnZHRy?=
 =?utf-8?B?TURwWkRaTlYyeHdEV0xiVzd6OUQ1RFdMRE80aXRCOWlzK1FvY2dpSk5vM1Rp?=
 =?utf-8?B?TVhTZDZhbVBjVVY2ZWgvMkdCK3RmMnBiTG1wdnZUU1UwcVRSME5CSWV2SGc3?=
 =?utf-8?B?eHBIWUMxNFhFL05iSWxLODZQZklNbTJMTHRwb25Sem9zclFyd0crR1E1bnMz?=
 =?utf-8?B?bm9Pa3VjOTR4cDBYUG5mVHdvUzF3T0dNTEJ2TFRjQWlaQ3N6Vk5JcmFvV1Vy?=
 =?utf-8?B?S21qTGx5R2dvWUlIZTkrYWtxTWhZSkpuc2k2VnozVmo5Y0JYODg3czZKS0dw?=
 =?utf-8?B?K1BHdnVDLzNlMVlIMVlwTjhlZHdGRlF1T2RKemljcDZJVmxLMVkyTXQxQ3o4?=
 =?utf-8?B?clNPWW5qUmRBTlJEL29Jd2pXVXhGNkV1bnNwYzNqa0F6WEtSRGI5L1l0blVV?=
 =?utf-8?B?NmlVNWlSdjJKQlErQ0lkM0Jva0NiZGVJeThoQkh4R0FRQjRGR290ZDJ0cEdS?=
 =?utf-8?B?V1VBdlFXNWxpeEpxS2FMYWdycTNBeFdzNnpPMmxCVTJHOXJKSnVmbWxxR2gr?=
 =?utf-8?B?RzJYK3V1eHNOMHpFQ1dPU1NpY1JpTEIrL2NoMVVSS3ZIek0rY2ViMEM5MmFu?=
 =?utf-8?B?OU9ndlBaQXpjRys2OGZnUHFjY0dGOHdhVFVRdE0xalF1aHQrLzZyUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c4e2413-0b28-436f-6370-08def1253d2e
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 06:05:37.6287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nzzeBDnKo5Z/wzunBxtsrN7me42WNOkgZQo1/KlymQY9E1u/ZSqIUIIZsfzc/Ujn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9454



On 8/1/26 23:02, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like missing space before bracket '{'
> character or spurious space, which will be flagged by dt-check-style
> ("redundant-whitespace" warning).  No functional changes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> I'll take this directly via soc@.
> ---
>   arch/arm/boot/dts/armv7-m.dtsi                           | 2 +-
>   arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts | 2 +-
>   arch/arm/boot/dts/marvell/kirkwood-nsa320.dts            | 4 ++--
>   arch/arm/boot/dts/microchip/at91-kizbox3-hs.dts          | 8 ++++----
>   arch/arm/boot/dts/microchip/at91-kizbox3_common.dtsi     | 2 +-
>   arch/arm/boot/dts/microchip/at91rm9200ek.dts             | 2 +-
>   arch/arm/boot/dts/microchip/lan966x-pcb8291.dts          | 2 +-
>   arch/arm/boot/dts/st/stih407-family.dtsi                 | 2 +-
>   arch/arm/boot/dts/st/stm32mp135f-dk.dts                  | 2 +-
>   arch/arm/boot/dts/xilinx/zynq-cc108.dts                  | 4 ++--
>   10 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/armv7-m.dtsi b/arch/arm/boot/dts/armv7-m.dtsi
> index 26f5443d85e1..6ee18d6a93ef 100644
> --- a/arch/arm/boot/dts/armv7-m.dtsi
> +++ b/arch/arm/boot/dts/armv7-m.dtsi
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0
>   / {
> -	nvic: interrupt-controller@e000e100  {
> +	nvic: interrupt-controller@e000e100 {
>   		compatible = "arm,armv7m-nvic";
>   		interrupt-controller;
>   		#interrupt-cells = <1>;
> diff --git a/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts b/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
> index 74161b76008a..6c4131b846c1 100644
> --- a/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
> +++ b/arch/arm/boot/dts/broadcom/bcm47094-linksys-panamera.dts
> @@ -141,7 +141,7 @@ mdio@200 {
>   			#address-cells = <1>;
>   			#size-cells = <0>;
>   
> -			switch@0  {
> +			switch@0 {
>   				compatible = "brcm,bcm53125";
>   				#address-cells = <1>;
>   				#size-cells = <0>;
> diff --git a/arch/arm/boot/dts/marvell/kirkwood-nsa320.dts b/arch/arm/boot/dts/marvell/kirkwood-nsa320.dts
> index dd5c8ffc8781..56334b71152d 100644
> --- a/arch/arm/boot/dts/marvell/kirkwood-nsa320.dts
> +++ b/arch/arm/boot/dts/marvell/kirkwood-nsa320.dts
> @@ -30,12 +30,12 @@ pinctrl: pin-controller@10000 {
>   
>   			/* SATA Activity and Present pins are not connected */
>   			pmx_sata0: pmx-sata0 {
> -				marvell,pins ;
> +				marvell,pins;
>   				marvell,function = "sata0";
>   			};
>   
>   			pmx_sata1: pmx-sata1 {
> -				marvell,pins ;
> +				marvell,pins;
>   				marvell,function = "sata1";
>   			};
>   
> diff --git a/arch/arm/boot/dts/microchip/at91-kizbox3-hs.dts b/arch/arm/boot/dts/microchip/at91-kizbox3-hs.dts
> index fec7269088d1..19a286dcc8a5 100644
> --- a/arch/arm/boot/dts/microchip/at91-kizbox3-hs.dts
> +++ b/arch/arm/boot/dts/microchip/at91-kizbox3-hs.dts
> @@ -35,7 +35,7 @@ led-4 {
>   		};
>   	};
>   
> -	led-controller-2  {
> +	led-controller-2 {
>   		compatible = "gpio-leds";
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&pinctrl_led_red
> @@ -58,7 +58,7 @@ led-6 {
>   	gpio-keys {
>   		compatible = "gpio-keys";
>   		pinctrl-names = "default" , "default", "default",
> -				"default", "default" ;
> +				"default", "default";
>   		pinctrl-0 = <&pinctrl_key_gpio_default>;
>   		pinctrl-1 = <&pinctrl_pio_rf &pinctrl_pio_wifi>;
>   		pinctrl-2 = <&pinctrl_pio_io_boot
> @@ -170,7 +170,7 @@ verbose_bootloader {
>   			input;
>   		};
>   
> -		 nail_bed_detection  {
> +		 nail_bed_detection {
>   			label = "nail bed detection";
>   			gpio = <&pioA PIN_PB12 GPIO_ACTIVE_HIGH>;
>   			input;
> @@ -276,7 +276,7 @@ &uart4 {
>   &flx0 {
>   	status = "okay";
>   
> -	uart5: serial@200  {
> +	uart5: serial@200 {
>   			status = "okay";
>   	};
>   };
> diff --git a/arch/arm/boot/dts/microchip/at91-kizbox3_common.dtsi b/arch/arm/boot/dts/microchip/at91-kizbox3_common.dtsi
> index 465664628419..75d2e748a3db 100644
> --- a/arch/arm/boot/dts/microchip/at91-kizbox3_common.dtsi
> +++ b/arch/arm/boot/dts/microchip/at91-kizbox3_common.dtsi
> @@ -298,7 +298,7 @@ &flx0 {
>   	atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_USART>;
>   	status = "disabled";
>   
> -	uart5: serial@200  {
> +	uart5: serial@200 {
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&pinctrl_flx0_default>;
>   		atmel,use-dma-rx;
> diff --git a/arch/arm/boot/dts/microchip/at91rm9200ek.dts b/arch/arm/boot/dts/microchip/at91rm9200ek.dts
> index ce691c4692b9..b849bc7049d6 100644
> --- a/arch/arm/boot/dts/microchip/at91rm9200ek.dts
> +++ b/arch/arm/boot/dts/microchip/at91rm9200ek.dts
> @@ -117,7 +117,7 @@ kernel@50000 {
>   				reg = <0x50000 0x300000>;
>   			};
>   
> -			root@350000  {
> +			root@350000 {
>   				label = "root";
>   				reg = <0x350000 0x4B0000>;
>   			};
> diff --git a/arch/arm/boot/dts/microchip/lan966x-pcb8291.dts b/arch/arm/boot/dts/microchip/lan966x-pcb8291.dts
> index 3a3d76af8612..1f0b0b647aa9 100644
> --- a/arch/arm/boot/dts/microchip/lan966x-pcb8291.dts
> +++ b/arch/arm/boot/dts/microchip/lan966x-pcb8291.dts
> @@ -64,7 +64,7 @@ fc3_b_pins: fc3-b-pins {
>   		function = "fc3_b";
>   	};
>   
> -	can0_b_pins:  can0-b-pins {
> +	can0_b_pins: can0-b-pins {
>   		/* RX, TX */
>   		pins = "GPIO_35", "GPIO_36";
>   		function = "can0_b";
> diff --git a/arch/arm/boot/dts/st/stih407-family.dtsi b/arch/arm/boot/dts/st/stih407-family.dtsi
> index 08acba209c56..436fafd30317 100644
> --- a/arch/arm/boot/dts/st/stih407-family.dtsi
> +++ b/arch/arm/boot/dts/st/stih407-family.dtsi
> @@ -812,7 +812,7 @@ ethernet0: dwmac@9630000 {
>   				 <&clk_s_c0_flexgen CLK_ETH_PHY>;
>   		};
>   
> -		mailbox0: mailbox@8f00000  {
> +		mailbox0: mailbox@8f00000 {
>   			compatible = "st,stih407-mailbox";
>   			reg = <0x8f00000 0x1000>;
>   			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
> diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
> index 6022e73f58af..1d6435c59096 100644
> --- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
> +++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
> @@ -382,7 +382,7 @@ goodix: goodix-ts@5d {
>   		VDDIO-supply = <&scmi_v3v3_sw>;
>   		touchscreen-size-x = <480>;
>   		touchscreen-size-y = <272>;
> -		status = "okay" ;
> +		status = "okay";
>   	};
>   };
>   
> diff --git a/arch/arm/boot/dts/xilinx/zynq-cc108.dts b/arch/arm/boot/dts/xilinx/zynq-cc108.dts
> index f5525c048426..e7cb82c7b8e6 100644
> --- a/arch/arm/boot/dts/xilinx/zynq-cc108.dts
> +++ b/arch/arm/boot/dts/xilinx/zynq-cc108.dts
> @@ -92,8 +92,8 @@ partition@f00000 {
>   
>   &sdhci1 {
>   	status = "okay";
> -	broken-cd ;
> -	wp-inverted ;
> +	broken-cd;
> +	wp-inverted;
>   };
>   
>   &uart0 {

Reviewed-by: Michal Simek <michal.simek@amd.com> # Zynq

M

