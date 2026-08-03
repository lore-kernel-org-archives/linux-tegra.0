Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010010.outbound.protection.outlook.com [52.101.56.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4A838A70A;
	Mon,  3 Aug 2026 06:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785737159; cv=fail; b=swYGo7OX/e6BUkSi6gpzLUKY/yrLI0FiTOo6j+KB6rMbEZeJYARkXPusslBdm1lR6zXbXVtqFUqZmCZl87zt50qEIGI6jk4j5Nde1xZQH8MgAWXBrWPe3ElTAIMP1ER1j6CcXQ7P/iqcZSTYs+Tm6gIf7N5xtL8B7YQ+NhF5VOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785737159; c=relaxed/simple;
	bh=zl4hKajqpn1gBPWpPybANXArm3xrsDcok9wANyt4EZM=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mrtpGf59xIJqvxvJDSVtgbhoqPM9vQpE/CjKU/kltIOJqyd/83qOED3JVfNA0nUV0W7PAzmuOTwUyN3CuL53IBCTqs7YO9OOSaL4igAwLtUO4LJk9WOFLyyp5Z6lexIM7yVEQ6/TvFM9lhotTnagQCnoGRCAavh8NwjmD4S9X5g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=igqzoJzi; arc=fail smtp.client-ip=52.101.56.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="igqzoJzi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vKp+Api11t/npDHk3G4QqO04Ss30GDdONCVRlQ8Z84Jp33qmnqWGWtJiO3Re9GoLZqmeQQDEiN76156w+PEn86s+ZOmmQPbZZH5jwKbtqx3GvFxOipbv6AqIv8IxtZId0HImPv6MBifGyWTkzn7dohBhCgOyoQi5GPjXvMG8nmqoiDE+iYfmt2svPb/ASWgMedYo4d/15oBBegpM/ocTHin6u069TJCuWw1pakyRm1zORNm4RvoH8MpzEWV30H9hKQmwe98NpBuY3LAfIZPstH87gaLEWntQrf01XJH3tcKzcqMqH1kPAfacvgToxOB4BAQGpcMTcILuke4tbstDeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5cR97ISV9zwjJi6xH3sRwRGS0ICZzlTVpYi2nZsMiE=;
 b=SNYPgRp0ZdzCsjarIUx4go2KyH18/8ZhIlsId6vlNtzF04TuNxXj+bgLvGwhzfdpdFzG+80mumR2jsyjxow9VuDCpB9R1YRZXqJNhW/JKRhTwPUWGVvT2Zk0bPvJeulYzOodQFgsCEE9xUH7h7TgErKuca8xycyVfrf6CLclNledeHjOhd2IPU2u5kFSYVhvJsGkS29yw8x2XNZefrqT9hcs72KUuwLrCEF3dzpfLPlmBdCvPSoRW3+U8nGnrOcG8ysRhOd4vm84RZ6Asd7gJfB7yfgSctOnKNGNhFbGVKtgLBTDBPLeV1WPRyZKwjM+R8OEW66Q+0zt8p7hG/SJfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b5cR97ISV9zwjJi6xH3sRwRGS0ICZzlTVpYi2nZsMiE=;
 b=igqzoJziR6n7EaX7uRPs1OLDsa4ic94PIvMaXWICQt+3ZYRdDfYyY3/mqkbFr9mTI4CGMrgm3FjuiIXO9M5nO1MW7XE9uvZ0CgV5UqpKWxGmmX8+rMlu2Dm6IMHsXtE1eD8aRnCqE948NWMNXKOeO1IPB5rvheipf0O5fytlfVI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV5PR12MB9779.namprd12.prod.outlook.com (2603:10b6:408:301::14)
 by CH3PR12MB9454.namprd12.prod.outlook.com (2603:10b6:610:1c7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Mon, 3 Aug
 2026 06:05:53 +0000
Received: from LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287]) by LV5PR12MB9779.namprd12.prod.outlook.com
 ([fe80::8ac8:e862:8ae9:9287%3]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 06:05:53 +0000
Message-ID: <1be5c002-7c50-478f-82af-fadceeb86a1b@amd.com>
Date: Mon, 3 Aug 2026 08:05:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: Correct white-space style
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
 <20260801210210.383417-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 mpwx1d8=
In-Reply-To: <20260801210210.383417-4-krzysztof.kozlowski@oss.qualcomm.com>
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
X-MS-Office365-Filtering-Correlation-Id: b5bdf1b4-c1fa-444b-7994-08def1254690
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|366016|1800799024|921020|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	xRc/AIEiNwFL1Mc4fcooCyOcZ7Frg1BokCeWQXzpQ+oOwrpfTiB0cOFDj1IVnWxDCCRwbScqW/7WOjw/7PV/8gtcGzvpYyt0V36MKInvMFAtj0kWwzPxjHNRMyY3dS4Z8uYU5EfGHiLrimGDokYCY5sLN8KpD1puC1ObVFVkDsM24ViZORgUcCJquohCyjLGlROXwgisHqE3lsbsa/Z9qDg+6DtmYA6aX5N7c4YYZ9FK3dOliqhET669pM/EEbumZdVNeTi+k5r+PNc4ugncv7Z/hCURL4Ak5QODAJBG/0Rrml4sA1kk2AyAi4mQDK5cMBZ9YZIOW7lBm33aajok8I/6R2pt3MK49cPwYisiwznnm+ZHfSGDws/XXmoOMJtr80/G9veY8BE6JAQeOi30R1+7UqcY6Ns2C2KOiFGKCKF1ij0DCY6q34uVOSFrvxx0axYN5+be6Cvb3MbkMXcLuPlJppONHhorwXYf9AKnRE0u6d6KRXe0tAwkXGpVjafIy+piydhiNR36EJ1SxU627GQ9iO3GtuGpQEuPd3VMEbBACBYIlF7C5XHS6BvsHjlHpruGYk5ZuX8yYA/NqePsWJ/Zi9whQlly3wIdVLVdbFpK9G+vC5QfCZObcS0hRH9HVMkEt5qymQ/AFotO3AeENKO3gNhYT9HwYmk8jDw3Aucq8N6lrFwlEiQlsY43qZQLMmmjGzkS6DagY5gJTkeHZA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9779.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(366016)(1800799024)(921020)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXIyTGMzZEF6cFF0dTFzWGwrUElGNklyeFVveUFmVjBLY1BzQkp2M2RWNEVR?=
 =?utf-8?B?WitYREJlTWF5bFpaK21IOGlodG5qdkhYYzIzT3kxa3hvZlM1MFJDRFYwKzdC?=
 =?utf-8?B?RUNPZXQzQ01EcmdZYmFrdXpQNC90OXhVSEFJTEpNV0JQbjc3RTMwZlVkcEc0?=
 =?utf-8?B?QUF4czJjcFgzd2JTL2hqdU9DWklud1pjbWJsYXA4ODBvRjcrNmxIcHJyMm43?=
 =?utf-8?B?ZHBzTVdvNjh2aGplYzFrNGdrKzU5TnphelF4QSsvaWsxRjNFNncwa1pHV1l3?=
 =?utf-8?B?ajRtR29yT3VrczVLZDJveVVESmxNckpGbXBrRWVHYU45ZWcrdUlBRnJaMHlQ?=
 =?utf-8?B?dk04VzkyNzZMbXJNVWY5VlBFaisvVkdDVDczTUtqT1hMSUVHWFpyV1F3dE9B?=
 =?utf-8?B?TWYzSTZqZ2cyNEJnTGh5cWsyKzJ3RU1hVFVZSjI0MmpibnNsQUNJM2RDcXdK?=
 =?utf-8?B?K1hhQVlCTy9YZFVDSFBKSU5PZy8zUlRHd3hSWFVUY200L0VKWXhLS201UmZD?=
 =?utf-8?B?SDcxTTJTcXhqcTFlMnMxSHkwS0t4TXAvbFdYNEtiaWxlTFBYWE1tZEh4YVRu?=
 =?utf-8?B?LzNNRXIzMURJd1V3dHk2b0RRYklES1VwcURTWkdPU2hrSjBFVk9CdERoV3pt?=
 =?utf-8?B?bDJKaWJmVGxGRUl1MXVwM3hVbm1SKzNwaStNRmpIc2NyUkhKTDlNTHdIRXpD?=
 =?utf-8?B?WSswOGx3cXA3eWRnbC9Uc3l1a21aaGhvelhaMERGc1M3QWUzMm1pakN1Zk83?=
 =?utf-8?B?TXQwdmtiajJVWGJXTzhCSytCVGo4Sk9ZNzAxYmdXYnRCbVV1WmQ1TDhFaGlH?=
 =?utf-8?B?R3pla3VGemt4L241WWJYMFRPZko4OG9INmhFU2tCSGludDFUdXJFM2l6UjlL?=
 =?utf-8?B?aVNIT2ZmU3lrUEJZN0diakVwNzZjekdrZHFKcVV2aGU3U1Zobm9EbzkwUm5Z?=
 =?utf-8?B?ZFBYMi95S2JzTHorUjBNbmJCM01IcW1FRnhRSnpjVmxvVkFISWs2KzNETmFV?=
 =?utf-8?B?QmYydVFnWmorTDRkbWVRdnFXbWtwWGdjNUVoOUs5ZnNkQVRiV011TURMMDdJ?=
 =?utf-8?B?RFZPcGovRXduVGRETXlNY3dMV0JYekJBVGVLNzJEWmFvSkVKalZBK3Vwamt1?=
 =?utf-8?B?Z2JhNFVWRGZjdFc4cnRhNXAxMFVMVjAwSDgyWERzb1B0SmVVc2ZyTWkrZkw2?=
 =?utf-8?B?ZjdmSWw0YUUzZlVFcFJud1NlN0Q0V0MxNTVIUWc0UjhBV3ZYNWEvZEJGbVNw?=
 =?utf-8?B?MElhcTQvQ3NTOWJOSk5JdEhoRlpHcnRPSXB6Vk1BRjlQT0d1MjJMcFdwSlc4?=
 =?utf-8?B?djdBTFZpN2ZQS0xraS85OWFDTmZPR2xRTnc1K1g2YWNMSERJKy81MHduVmNl?=
 =?utf-8?B?QkU3NTJYaGV0SjBIU0lzUlZ1cUhEY2p4TC9sWlBhREJwZDcwanl0WmZ5U0M4?=
 =?utf-8?B?RHhRNEMzVzRXMlA3U3dYbHJ6MWRQTm9WYnBUMXdIbVN6T29CNHRTajlaVDd5?=
 =?utf-8?B?ZjVlTFNVU200eEwvVjF3Wmkyc3RUOTFPNDN3T0QzVktWVTRZeWVza0NzS29T?=
 =?utf-8?B?UVExQ1pTQ0tnYzJkL05yeFdmTW9uY29qeEZtTjlTdjh4MlAvZWQ5OXk0bGd1?=
 =?utf-8?B?clFVNlVETXFUaHI1ejhxTHpHV1RDYXJZbGpJZUpyencyL1pxZXlQbW5sK0dO?=
 =?utf-8?B?amplRy9HT0VKQTRlcEpKK3A2bEs5VUVpUS9UM0dKSE9KUzhFL2RSTFpCK0pi?=
 =?utf-8?B?Um9wNUpHd3ZaQ3RoQWtmZlB6NzVmKzNVTkZRVEpXSDZxS2lZTzNoVGRJZ1k2?=
 =?utf-8?B?c3Iwbk9CSndsQndpVU1CeWUyMVFXZC9LcDNMdUFLUkcwQm51bFZCdEZ3RDBO?=
 =?utf-8?B?T0VLU0dCTjRFeU9nMmRHTkdidHZCa0J0R0djbGxPMDk3VjQxS1d5NXdWY21l?=
 =?utf-8?B?bW0zNWVnZ3Y1TUFEQ1NtWlFoditIMVhGbE9ZbHhpWko3eVpnM1RhMklrdjhK?=
 =?utf-8?B?eC9tVGVaWWIwajljeGpXRC82V25DVXdpUmtjVHZMT2dxakkrZHVwOHYxMzFC?=
 =?utf-8?B?VjhKTUk5a2NwOXFxNWtlcGxIZGxoOTNOWFNCY0NhQnBjRFRNUTUreTE1VGRq?=
 =?utf-8?B?Z1JPQ1h6cmNTWlNQenhUK3dSaFF6TGpsSU5xZVBna1p4NzdlVUowcExGc0hE?=
 =?utf-8?B?VWtVcG50WXpDMFNXQXFSaVJRaFNYNGJPcmhmZzNHQ3dDeUd5aDBZUWc5UHNN?=
 =?utf-8?B?MFhiNlArR3Z2c0puZ2tTVS9MbERzdS9jM1ZuZGs4VWo0TzlhTVluRVhRWW5k?=
 =?utf-8?Q?g0gr3i46R1QFRvpwQI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5bdf1b4-c1fa-444b-7994-08def1254690
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9779.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 06:05:53.3668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ArEFYMxchNlakO/pGQY4SI+3KAhU6bMJSRblBM2EUs17D9QQbgufePMNNvFWu7e
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
>   arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts          | 2 +-
>   arch/arm64/boot/dts/apm/apm-shadowcat.dtsi               | 2 +-
>   arch/arm64/boot/dts/apm/apm-storm.dtsi                   | 2 +-
>   arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi           | 2 +-
>   arch/arm64/boot/dts/broadcom/bcm2712.dtsi                | 2 +-
>   arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts | 2 +-
>   arch/arm64/boot/dts/marvell/armada-3720-db.dts           | 2 +-
>   arch/arm64/boot/dts/marvell/cn9132-sr-cex7.dtsi          | 4 ++--
>   arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi      | 2 +-
>   arch/arm64/boot/dts/nvidia/tegra234.dtsi                 | 2 +-
>   arch/arm64/boot/dts/nvidia/tegra264.dtsi                 | 2 +-
>   arch/arm64/boot/dts/st/stm32mp257f-ev1.dts               | 4 ++--
>   arch/arm64/boot/dts/xilinx/versal-net.dtsi               | 4 ++--
>   13 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
> index a1c5d10f2f54..91df4793dd6e 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
> @@ -546,7 +546,7 @@ &spdifout_b {
>   };
>   
>   &tdmif_a {
> -	pinctrl-0 = <&tdm_a_fs_pins>, <&tdm_a_sclk_pins>, <&tdm_a_dout0_pins> ;
> +	pinctrl-0 = <&tdm_a_fs_pins>, <&tdm_a_sclk_pins>, <&tdm_a_dout0_pins>;
>   	pinctrl-names = "default";
>   	status = "okay";
>   };
> diff --git a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
> index e930f2f26f4b..e110792cdc76 100644
> --- a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
> +++ b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
> @@ -293,7 +293,7 @@ socpll: socpll@17000120 {
>   				clock-output-names = "socpll";
>   			};
>   
> -			socplldiv2: socplldiv2  {
> +			socplldiv2: socplldiv2 {
>   				compatible = "fixed-factor-clock";
>   				#clock-cells = <0>;
>   				clocks = <&socpll 0>;
> diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
> index 4c4938faffb1..d67f5ed985a2 100644
> --- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
> +++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
> @@ -174,7 +174,7 @@ socpll: socpll@17000120 {
>   				clock-output-names = "socpll";
>   			};
>   
> -			socplldiv2: socplldiv2  {
> +			socplldiv2: socplldiv2 {
>   				compatible = "fixed-factor-clock";
>   				#clock-cells = <0>;
>   				clocks = <&socpll 0>;
> diff --git a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
> index ee12fea5b12c..926bb4ab77af 100644
> --- a/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
> +++ b/arch/arm64/boot/dts/apple/t602x-j474-j475.dtsi
> @@ -33,6 +33,6 @@ &hpm2 {
>   	interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
>   };
>   
> -&hpm3  {
> +&hpm3 {
>   	interrupts = <44 IRQ_TYPE_LEVEL_LOW>;
>   };
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> index 761c59d90ffc..6a066c43d24a 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
> @@ -644,7 +644,7 @@ mip1: msi-controller@1000131000 {
>   			brcm,msi-offset = <8>;
>   		};
>   
> -		isp: isp@1000880000  {
> +		isp: isp@1000880000 {
>   		     compatible = "brcm,bcm2712-pispbe", "raspberrypi,pispbe";
>   		     reg = <0x10 0x00880000 0x0 0x4000>;
>   		     interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
> diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts
> index 82cd4115746e..afe4ef182ee7 100644
> --- a/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts
> +++ b/arch/arm64/boot/dts/intel/socfpga_agilex5_socdk_013b.dts
> @@ -107,7 +107,7 @@ qspi_boot: partition@0 {
>   				reg = <0x0 0x00c00000>;
>   			};
>   
> -			root: partition@c00000  {
> +			root: partition@c00000 {
>   				label = "root";
>   				reg = <0x00c00000 0x03400000>;
>   			};
> diff --git a/arch/arm64/boot/dts/marvell/armada-3720-db.dts b/arch/arm64/boot/dts/marvell/armada-3720-db.dts
> index 06d4a3a93f84..efc32074bb11 100644
> --- a/arch/arm64/boot/dts/marvell/armada-3720-db.dts
> +++ b/arch/arm64/boot/dts/marvell/armada-3720-db.dts
> @@ -109,7 +109,7 @@ gpio_exp: pca9555@22 {
>   		 */
>   	};
>   
> -	rtc@68  {
> +	rtc@68 {
>   		/* PT7C4337A from pericom fully compatible with the ds1337 */
>   		compatible = "dallas,ds1337";
>   		reg = <0x68>;
> diff --git a/arch/arm64/boot/dts/marvell/cn9132-sr-cex7.dtsi b/arch/arm64/boot/dts/marvell/cn9132-sr-cex7.dtsi
> index 91ba5f7dc9b4..feffb9c299fd 100644
> --- a/arch/arm64/boot/dts/marvell/cn9132-sr-cex7.dtsi
> +++ b/arch/arm64/boot/dts/marvell/cn9132-sr-cex7.dtsi
> @@ -353,7 +353,7 @@ cp0_mmc0_cd_pins: cp0-mmc0-cd-pins {
>   			marvell,function = "sdio_cd";
>   		};
>   
> -		cp0_pwrbtn_pins:  cp0-pwrbtn-pins {
> +		cp0_pwrbtn_pins: cp0-pwrbtn-pins {
>   			marvell,pins = "mpp31";
>   			marvell,function = "gpio";
>   		};
> @@ -378,7 +378,7 @@ cp0_spi1_cs1_pins: cp0-spi1-cs1-pins {
>   			marvell,function = "spi1";
>   		};
>   
> -		cp0_uart2_pins: cp0-uart2-pins  {
> +		cp0_uart2_pins: cp0-uart2-pins {
>   			marvell,pins = "mpp50", "mpp51";
>   			marvell,function = "uart2";
>   		};
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
> index 16cf4414de59..6f4879c49da2 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
> @@ -1159,7 +1159,7 @@ asrc_out5_ep: endpoint {
>   							};
>   						};
>   
> -						asrc_out6_port:	port@c {
> +						asrc_out6_port: port@c {
>   							reg = <0xc>;
>   
>   							asrc_out6_ep: endpoint {
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> index 820670dd6042..b80f64bb81ea 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> @@ -1765,7 +1765,7 @@ asrc_out5_ep: endpoint {
>   							};
>   						};
>   
> -						asrc_out6_port:	port@c {
> +						asrc_out6_port: port@c {
>   							reg = <0xc>;
>   
>   							asrc_out6_ep: endpoint {
> diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
> index b141e8f884fe..013228a81723 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
> @@ -2015,7 +2015,7 @@ asrc_out5_ep: endpoint {
>   							};
>   						};
>   
> -						asrc_out6_port:	port@c {
> +						asrc_out6_port: port@c {
>   							reg = <0xc>;
>   
>   							asrc_out6_ep: endpoint {
> diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> index 14e033f365e3..b5db62a0a550 100644
> --- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> +++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> @@ -404,11 +404,11 @@ scmi_vddio1: regulator@0 {
>   		regulator-min-microvolt = <1800000>;
>   		regulator-max-microvolt = <3300000>;
>   	};
> -	scmi_vddcore: regulator@11  {
> +	scmi_vddcore: regulator@11 {
>   		reg = <VOLTD_SCMI_STPMIC2_BUCK2>;
>   		regulator-name = "vddcore";
>   	};
> -	scmi_v1v8: regulator@14  {
> +	scmi_v1v8: regulator@14 {
>   		reg = <VOLTD_SCMI_STPMIC2_BUCK5>;
>   		regulator-name = "v1v8";
>   	};
> diff --git a/arch/arm64/boot/dts/xilinx/versal-net.dtsi b/arch/arm64/boot/dts/xilinx/versal-net.dtsi
> index 15f767608e67..21bb917bcba1 100644
> --- a/arch/arm64/boot/dts/xilinx/versal-net.dtsi
> +++ b/arch/arm64/boot/dts/xilinx/versal-net.dtsi
> @@ -1074,7 +1074,7 @@ usb0: usb@f1e00000 {
>   			#address-cells = <2>;
>   			#size-cells = <2>;
>   
> -			dwc3_0: usb@f1b00000  {
> +			dwc3_0: usb@f1b00000 {
>   				compatible = "snps,dwc3";
>   				status = "disabled";
>   				reg = <0 0xf1b00000 0 0x10000>;
> @@ -1099,7 +1099,7 @@ usb1: usb@f1e10000 {
>   			#address-cells = <2>;
>   			#size-cells = <2>;
>   
> -			dwc3_1: usb@f1c00000  {
> +			dwc3_1: usb@f1c00000 {
>   				compatible = "snps,dwc3";
>   				status = "disabled";
>   				reg = <0x0 0xf1c00000 0x0 0x10000>;

Reviewed-by: Michal Simek <michal.simek@amd.com> # Versal NET

Thanks,
Michal

