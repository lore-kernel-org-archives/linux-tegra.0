Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012018.outbound.protection.outlook.com [40.93.195.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D26D42669E;
	Tue, 28 Jul 2026 12:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785240579; cv=fail; b=mHHQjYYpU+lPkBlm01dseECCH/8Qz/9TO2HfcxrH14gXiz/lxFxArIThdgkso0p8aZyrgPQRmKTvTAzZjJWJGF/z9NqzyIF5Xc4v3E1N2JBpOqsARA954REfUNY74iiS30JCPd0wkBYaIEbdS9KmppA4IC3ID0cBsmjsj/nhshc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785240579; c=relaxed/simple;
	bh=uVxAsGNB3ts5Xki7xLVyGcLscDnQ5J020wPpKYNETrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ouA/0DE61rlhEBfeuoVHDywJh+dkv4It2jouZ2L7FUigYCMZ8NDCEtoT+sm9xxJWtD+NYYZ/f17H6D6XV1DqDMif1iQuLcZhQVmFTNhw0EgsIw3sr4nSjvYUoqLi56RyFXExw/qcwr13SLHJ5+uxnOxxC/XNV5CEsRnTdXW/EXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BhXFBaBB; arc=fail smtp.client-ip=40.93.195.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BhXFBaBB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wHERpojw3SNEiHfV3zuTLyvWwO2O+1JbGvBMEyI2mMMzZMaOGrwT5KF1OwCIkJ9k17O7wAJPjpUthmR6unf+daM5V1yKKbVKcdA2732hQ7Exs+kAdWA6iGLXmo0VyWs8Acpm/9wGjbc5gw0xVgvNhdnoz38Qlrlfxwhg29Czm3r6cLeFz0AuY6nIuH81G/XklWacSSFCTgf5YoeYGqiMp9fAztFcrDi/hnkA53bKnQ5zl/ICvejB8BCnDhhwCxJmyW4sEb4XMu3VbUeP7zpBtOn285CCQjxN+aw2Y7QkaT5qWlHSdZuwPHyLhBj6r0DLP4DsY1vh7TJrayLqYJo3qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uBuIly6Fw571Myhgz4+le+paY32vx6r2jbXrfgN6Wbk=;
 b=q8eFZTpjKruFT5Ue5btYyXjrWw/RqvtpJE0Uqa16xQACr6leUEkV8NzOriCMwviAMXg/1kyS/KtZ9gUBBm+FaTotwLteV+FSKkZNDwaQZQ1lOk1qQjXxEW/nEipkdQtBMPqiVXTNXc4ViyndajSuHgZv115AVdKZgaq5UOgMtHYGPzA42IzR9R78e+Cl07lXQZZUFjSGmhYzt2m4w8UrLwhDr6+TEYUFwVDdtx2GA0yFepLK6mRE27kOIPzyAuOCKCpgiKPRN0pNaMPFppI0ZrILx8mW97rUIuw52IKUJGBT7b4q8SWd5XCjXGN/6bZ+sI4AYdd0UC5d3Y13MUY6QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uBuIly6Fw571Myhgz4+le+paY32vx6r2jbXrfgN6Wbk=;
 b=BhXFBaBBSFnqjukx/+EsHYytWeE1UkzEeWRxUbpLmJcyjVLMbYBiU4wwvtti44VYh8xGaBrODXIyowDKRqF08DL+/FLmf0+iliTAHGpv2Q7FtZ0Z3Tn770RgDm1mYyrx5agMWZiHXq9RD8aVYSgcXzEPCNrlR8h6or5Dmri5Yx+b4Z0g9WSLqnOIe5xYqQnLLHfYyrHoA5POHAttDE5ybpMlQjStkumoYE23a07aUfcHaECaZnnfJkCAPwH9GRtVPnn8pTmMf0MWJ57ysCjTLX7v5exNLcSP8ry6tw5NWSiM3C9iIA2hRyZZ+O02THErQZyCU+/Kqivne4HYqazu5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by LV3PR12MB9236.namprd12.prod.outlook.com (2603:10b6:408:1a5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 12:09:33 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%6]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 12:09:32 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/10] ARM: tegra: tf701t: Tune MMC devices
Date: Tue, 28 Jul 2026 21:09:28 +0900
Message-ID: <L1pGU82wTC69ycdbd3YRJQ@nvidia.com>
In-Reply-To: <20260721101059.451699-7-clamor95@gmail.com>
References:
 <20260721101059.451699-1-clamor95@gmail.com>
 <20260721101059.451699-7-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYWPR01CA0021.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::8) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|LV3PR12MB9236:EE_
X-MS-Office365-Filtering-Correlation-Id: d141c4a1-bedf-4a66-bd10-08deeca11502
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|376014|23010399003|1800799024|6133799003|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dN1cGYlqldm5UTvOhOtO05NmCHCr16KrIX5GR43VWdn5Hk8XNnWr2dtX52uXsRJA04IkHUQSI1KjrTiIPMolUlP25bSTsyRAnmEEi3qmbrhibDugOqupOC2cjUIMSSRdVdVdyZkikh+QsiEMQ5PmsgrarpaJz4vM4smuJ71Q2p8e53zKDnirDMTOwfHxKOwNguw6RboFI6hVZTGLq0cUWoTA/Shl6HmMbRsulud/Dd8SmXUZygvD9IXNaMIia0VvLbHkpnwBdRxPd42i3gXNxv5563zubONU9YgmrH86cwMiTAfMhzc1LdkdPsfq72DlWOqtxNRsO+3xOxl/woUtK3vGY4Xi+ijZOHMjQaj6h0xoJmmimX1mTI6bns7yzQ+fPqwJ6eRULXyDGQ4QxYIr5r9YDl8or0Z4chCYYgY6lB8Z8f6QvnjcKDsieJH5Y1iP/N9mpYx15bB7I8Xtbm90UZ3s+P7trTAsDwPiGKeYMLkgSo74QaQcMGjZXWQgPA02KVHpsBdl2O+bNx2WyxUwwG5GH1Bi4N+FXdLIztXtYL/OHaBeULq9jKe9Dhaczr/qNiUbLpkOR3foj8cWRfpwYGr/c1VaQhliEq2c62lc7mA+OSnUSEmQekbaVbO0IldiqhE9cyv/+IkiUvkgXVrh89ZcGDcPgsi5yjv4jTQh1Vs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(23010399003)(1800799024)(6133799003)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djlWblpIQy9lU3RXdGN5eDRXL0ZzYnp3a3lUVFpJajJTR2RMYnc4K3FNbWlP?=
 =?utf-8?B?aWYwZDYveWd4cFJzWFFwcDQ3TnNBeFFhOVBVMWt2OXVGVTRhWlUrNkNqbEVv?=
 =?utf-8?B?d2N3eXh5aEs4YjFTSW1OOEs5YTZWN0JyWXh5ZVUxcUJxZ1p1bkpSeU1xUFRz?=
 =?utf-8?B?clo1TnBhL1AzZ0NGZE4vUjhqeEgvNW5ERVBEMFB6MlVXSlh3aXRMdm9WRGgz?=
 =?utf-8?B?b1ErS2NIZzVkZGlab3Ird2ZwUGxLSFRqMktWMlVNeHc5bXU5R1Y3TzZuVU1h?=
 =?utf-8?B?d09ibmJiYXgrQTZSYVdUUG43cFNCUzZLVkczdGloazhYMHRIUVpDd3RTQ3VN?=
 =?utf-8?B?bWIrajRzOENkTlRTVDdNeVRORjU4Wk0wYWRFOWphN1pBMkJZNWk0REVyTCs5?=
 =?utf-8?B?U21UNC9uQWdZWEE2WkFUVUVrcGcxdS9oQlVkaC85MlR1WDdsRWphTVh6SVVp?=
 =?utf-8?B?ZUhyUXZHWktQakNWWFVudmhMVEtudkd4YW5QL3ZNTmRIdHowejdiRTh3a2pQ?=
 =?utf-8?B?clVTSktObllxNm0zQ0RZaDEyNlJnVkovOXBLNFRtZ3drSjIrMm5pdFQrZWR4?=
 =?utf-8?B?RTJHeEZtaFJaOG9tNnVZeG9WRkNoWE9RSUt3M0t6cWF1WFI1ekEwUlozckY4?=
 =?utf-8?B?UEdtUFBnQ2Izc25hZXBmWVpERjdya3lGQ0RUd2Ywd2ZRUVZKQkt6RlFGTFZ5?=
 =?utf-8?B?eVRWMEsreTlJcHdZVm01eXVMWDgzU0dOdnZPa3pqT21ONnE2QjhqUXBxOTky?=
 =?utf-8?B?bFEyWmlzVHJUMjZxRHR4dmxmZDFoS3F0YlZrRkRWWkZ2OXpWblpGRXhkRFZB?=
 =?utf-8?B?cUR3OUpWWkpSTWNkaXpUZlc3WXJsUkdHTzFSUnM0dU8vMjVuUWhBUXlDZ2dy?=
 =?utf-8?B?d1cwQVB4dW41enRwR3I0OGdJMTdPRkdldjBlNHd2UTFBS1lpdWdWMWJBTE04?=
 =?utf-8?B?ejBwQkcrRjhDalZFTzJSdm8vYURSQnhpNmhRekNxd2YvVjNuNFVleUQ1ZGIy?=
 =?utf-8?B?KzJlUkFldWEvWHdVYUVIT0hwSkR3MHpBc3lEMkYxNTNudHFTMFcyN2FlWFRq?=
 =?utf-8?B?c0dVL25HUkNKRGNlMHJwa3VHdGNhTzZ3Q3h4RXNSNDg5UnJnL20veUpkc0JX?=
 =?utf-8?B?QnR0TXdxYlorVi8zVGE3WlVDb1VCWWk1YzA1VXBzanRWQXhZSlJ4UzJmamNz?=
 =?utf-8?B?WXZwbDM0MFVpSHJDKzV3SkliRFhraldrRjhSYU96VkNPSnlFZGFtUGkwVXFm?=
 =?utf-8?B?VEkxLzZVVG5BUWxjTzFBNytKbWZLbnN1WmY5ZmFMbFlLZ2NLYUYrK1kzN1pT?=
 =?utf-8?B?ZmMvbUtoU0ZpOElGTTFTM1FpeGQyYUczTUxrcXg3YkVIdWEvWWo2V0tQcTY0?=
 =?utf-8?B?cFEzZitzekRzcU5MYXhyRkw0ejE3WUcwMHJsc1Q2ZTc5M2hxVXVNTUhQRVVH?=
 =?utf-8?B?T3FjcnNUQ3kxZHBkVzgrTm5DZzlFelFwVUJreFd3cSt4b1NMMUQwZGw4V1BH?=
 =?utf-8?B?VHlBVkxDM2tSaDhHTEhJeDlpQzc4WmhmNGhpRWZGMy9adkNJMjhSODhnclRw?=
 =?utf-8?B?Yy8vUzIrbFpHMHVhOFRyVTB6QlVQMUgwWUhleTNEd1dpUGJnWGYxS1FQMGNn?=
 =?utf-8?B?eU1CRUpURFR1czdsUWE4TlhTWDZSOUVSV05XZmZtK2V6SDZHNzdxMk5GRFZi?=
 =?utf-8?B?ajhUd0ZWN1FvTlMyVzJ6N0lrYmIxRjVUcElzSlc2cVlkWlRPYlpUdEhjaDlV?=
 =?utf-8?B?VFVvbElRaVpsZ1ExbW1tZVhCallqRTFNbXQxWHBvWDMyZGhkcmprOG9lbkZS?=
 =?utf-8?B?QzF4OGc3WENwL1RySlFxZHJCV3l5UEcvN3pSWWpQNkg2TmVlZS9kNUhvTTFz?=
 =?utf-8?B?aUUzMVpqekt0NkFTZ3Z0NytjNW05R1pqbmZCUGtzREdPZlRWNkl5VzNXZHBC?=
 =?utf-8?B?NHlIQXhudWF3NFEyS0xkMGZWM0liTlIvN1NMUEl5VkVuMnB0WDl4VWIzcWQr?=
 =?utf-8?B?bjlOQVY0NmxWMjJRSkZmZk1KWmVsTGdNSnIvQ2JnbkFjeHFxRFNsTVBqUGZr?=
 =?utf-8?B?cGUybVNtaVpDb3J4MkxCam9NZjJPSFlnWDBkRkZlTW9yTWpQYWFoaW1pK3B6?=
 =?utf-8?B?YzBreWJDajUvYzdwN05XZlVsVm1TNktrcEJERkxBNWYxZFhnWFV3cHNTVU1i?=
 =?utf-8?B?R25DK2lZbU1hdWp5aE1HcHZWSXl3ekM1R1dMVDAwblVSb1h4b0Rmck11WEhm?=
 =?utf-8?B?RlBXNDJUVWQ4UVZ5MmxUcTJ4SVZKYTg5em9sektqWFVLeTVMWWdSdlErQTQw?=
 =?utf-8?B?cVJUMVJPaEZFOExpYXB4ZnBzakk1TDJ0Qm1QSVY0Q29rRjFCSGh3VUVEWEd5?=
 =?utf-8?Q?Mnw+qNYVwuOofpwfPqPc9NOxEXtpHJihp6BGyRHj4cqSb?=
X-MS-Exchange-AntiSpam-MessageData-1: 9MJVRe7JD1EONg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d141c4a1-bedf-4a66-bd10-08deeca11502
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 12:09:32.2769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CH6pIXaDw2Dm7pILZNpODTR/tYNPMnxiUUCDiMvaDjMK74AZESKSQbfng3PSbS+gs+g3na0yycEjCmW6zoi1MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9236

On Tuesday, July 21, 2026 7:10=E2=80=AFPM Svyatoslav Ryhel wrote:
> Add SDR104 mode to WiFi SDIO and uSD device nodes, remove mmc-ddr-1_8v
> which is eMMC specific and improve their power sequences. The uSD card
> refuses to work reliably with fixed regulator and 1.8V IO supply. Adjust
> configuration to mimic setup proposed by the vendor in the downstream
> kernel. Add HS200 mode support to the eMMC sdmmc device node.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../boot/dts/nvidia/tegra114-asus-tf701t.dts  | 35 +++++++------------
>  1 file changed, 13 insertions(+), 22 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm=
/boot/dts/nvidia/tegra114-asus-tf701t.dts
> index 83f8dd84d28a2..3de5c84d5f009 100644
> --- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> +++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> @@ -1645,9 +1645,9 @@ ldo8 {
> =20
>  					vddio_usd: ldo9 {
>  						regulator-name =3D "vddio_usd";
> -						/* min voltage of 1.8v is not stable */
> -						regulator-min-microvolt =3D <2900000>;
> +						regulator-min-microvolt =3D <1800000>;
>  						regulator-max-microvolt =3D <2900000>;
> +						regulator-boot-on;
>  					};
> =20
>  					avdd_hdmi: ldoln {
> @@ -2350,9 +2350,9 @@ brcm_wifi_pwrseq: pwrseq-wifi {
>  		clocks =3D <&tegra_pmc TEGRA_PMC_CLK_BLINK>;
>  		clock-names =3D "ext_clock";
> =20
> -		reset-gpios =3D <&gpio TEGRA_GPIO(X, 7) GPIO_ACTIVE_LOW>;
> -		post-power-on-delay-ms =3D <300>;
> -		power-off-delay-us =3D <300>;
> +		reset-gpios =3D <&gpio TEGRA_GPIO(CC, 5) GPIO_ACTIVE_LOW>;
> +		post-power-on-delay-ms =3D <100>;
> +		power-off-delay-us =3D <100>;
>  	};
> =20
>  	/* WiFi */
> @@ -2372,9 +2372,7 @@ mmc@78000000 {
>  		non-removable;
> =20
>  		sd-uhs-ddr50;
> -		mmc-ddr-1_8v;
> -
> -		power-gpios =3D <&gpio TEGRA_GPIO(CC, 5) GPIO_ACTIVE_HIGH>;
> +		sd-uhs-sdr104;
> =20
>  		nvidia,default-tap =3D <0x2>;
>  		nvidia,default-trim =3D <0x2>;
> @@ -2396,14 +2394,18 @@ wifi@1 {
>  	/* MicroSD card */
>  	mmc@78000400 {
>  		status =3D "okay";
> -
>  		bus-width =3D <4>;
> +
>  		cd-gpios =3D <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
> +		power-gpios =3D <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
> +
> +		sd-uhs-ddr50;
> +		sd-uhs-sdr104;
> =20
>  		nvidia,default-tap =3D <0x3>;
>  		nvidia,default-trim =3D <0x3>;
> =20
> -		vmmc-supply =3D <&vdd_2v9_usd>;
> +		vmmc-supply =3D <&vcore_emmc>;
>  		vqmmc-supply =3D <&vddio_usd>;
>  	};
> =20
> @@ -2414,6 +2416,7 @@ mmc@78000600 {
> =20
>  		non-removable;
>  		mmc-ddr-1_8v;
> +		mmc-hs200-1_8v;
> =20
>  		vmmc-supply =3D <&vcore_emmc>;
>  		vqmmc-supply =3D <&vdd_1v8_vio>;
> @@ -2608,17 +2611,6 @@ hdmi_5v0_sys: regulator-hdmi {
>  		vin-supply =3D <&vdd_smps10_out2>;
>  	};
> =20
> -	vdd_2v9_usd: regulator-vdd-usd {
> -		compatible =3D "regulator-fixed";
> -		regulator-name =3D "vdd_sd_slot";
> -		regulator-min-microvolt =3D <2900000>;
> -		regulator-max-microvolt =3D <2900000>;
> -		regulator-boot-on;
> -		gpio =3D <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
> -		enable-active-high;
> -		vin-supply =3D <&vcore_emmc>;
> -	};
> -
>  	vdd_1v8_cam: regulator-cam-vio {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vdd_1v8_cam";
> @@ -2655,7 +2647,6 @@ vdd_3v3_com: regulator-com {
>  		regulator-name =3D "vdd_3v3_com";
>  		regulator-min-microvolt =3D <3300000>;
>  		regulator-max-microvolt =3D <3300000>;
> -		regulator-always-on;
>  		regulator-boot-on;
>  		gpio =3D <&gpio TEGRA_GPIO(U, 1) GPIO_ACTIVE_HIGH>;
>  		enable-active-high;
> --=20
> 2.53.0
>=20
>=20

Which vendor BSP are you referencing? The one I have seems to set=20
MMC_UHS_MASK_DDR50, but I'm not quite sure what board definitions these=20
devices are actually using.



