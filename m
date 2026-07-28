Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011059.outbound.protection.outlook.com [52.101.62.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8E93AFD17;
	Tue, 28 Jul 2026 12:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785240794; cv=fail; b=CrX40cL66qSGcttbk3DntT6kcieXhTiuKfkuyQwlJW1loDNr09VThT+LpqB7ICuJZZmILwjZwOGqshifb6CULNa3Oqri+DK/5CRhBLA3K1PzJAp9b9tyAfJ0u5KQRegjaT++LCLLahEqPffZHy77ApfxNXdeUKhRvpSjta9W5oU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785240794; c=relaxed/simple;
	bh=a9lVWyl8PD/D5GTAdZ8AQ2JKmLqByeaHpcx88358kV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=igRJUUrCVKeg6JfJ8CkLAwzqzqnfcsxZVUQISAKExO97BYPuScXX1yR3bGRwICkDFK5wKspLaQTaW+4MqtoYPDSUsdB3aSsTskO9j07S7OZQKGEsyeaHtNNiz79+c5y9rtO6RhhgxlZXm4BUvX4V5h/3k5u0Phb8XedfrZW+qO8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pkI7hrP1; arc=fail smtp.client-ip=52.101.62.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pkI7hrP1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fx0fIePm6pzMyHqyH7YidlUT+oYlQMZKIEXms1nTv2ddGNyW8yKJZQnzNOHOTJa3CZMlBspLmInlXNL5cMFdtnwGKkXLQCu7SzhVAC/73C3X5qcC4yrwOd2y58KKVI5g1Fdyrsusp0Xb0oiTw9H0unRQ2C+pcv9yXWr2IjSTthU4C1P9yVWRIk3+Xc0VX7eLciNDVZR1VK1pdD010Gii+J77H2tThE026KNNhG28nshB9p6vCmvo2dqlgNe5T5vGdHI0QJu3O4K0IG/u4EpldDHoAIQsnRSMuvOz6CpuBda8iDm8suX4E08nExEe2/3SAj3ubGYdPMMWU0o580L6NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t8EQV1EnFN5UFHHU1MLNa1qlx+/1qcah5stcAjHOkWU=;
 b=AF2I9vni1I8ucyOUY0b6ooFeie3X7AfyqlGDeJBNbOog4TclL59lU6uvHLLHmhIvpJ71x7Qq0PtfVR7/fCOjG2/4bGdNPX0tIiAFqpFfbUTeMJr3cnjMJf5cN0f4okDqJkvHKfM5LpCxeim0XhX9q2klZItXJIWTnTGE3NzHxCVr2pchQQKJtPKsWsOgbqTftoMREren26Gl6OWFROKvqfL1jRnpGzj2NoA2a8LnoP/PjgwZX4X11rh13r8vbZyq+/tNFcmMabqBQZ2bVLipxcjDvWylz/reEfWwkkMrSEAyeulpOl1ViJ89jqslsUDoEae8y4f3UyMEtZnzP6NH2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t8EQV1EnFN5UFHHU1MLNa1qlx+/1qcah5stcAjHOkWU=;
 b=pkI7hrP1ESztKllQwoLt1UxgzYzkr41LhMpx2LI23BUmZgMRV8qU75B4k5OlLg/4DIz2Eb58IaJVGJMABnBpLPyx00fDvt4mJPJAeF5BZ9HLHyYibnssbhshmiKtgD29oyxHiGcYsaVTCfJEpUeK7RZHkY18lJCTgBOgNW8qFXa6Vupps1GrhYevVjDZzaTdWq+tgH/lXiwH70fh4PbxEJmmh6XV/QK9PWjtJbHdRce6EqJ/b92LCCot0foBWNN0w7iIS8/D+3EKm6XQFqsmLSFriuYYLgkZoKzVWH+PZiA2aVFc3Nv1oSeBnORAyVFe90ZGmhwmyHN0dJj2aZ463Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by DM6PR12MB4355.namprd12.prod.outlook.com (2603:10b6:5:2a3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 12:13:09 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%6]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 12:13:09 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 07/10] ARM: tegra: tf701t: Fix BCM43341 WiFi/BT chip
 configuration
Date: Tue, 28 Jul 2026 21:13:05 +0900
Message-ID: <AHCWpU8lS5mcA3Do5U45Xw@nvidia.com>
In-Reply-To: <20260721101059.451699-8-clamor95@gmail.com>
References:
 <20260721101059.451699-1-clamor95@gmail.com>
 <20260721101059.451699-8-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY4P301CA0009.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::16) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|DM6PR12MB4355:EE_
X-MS-Office365-Filtering-Correlation-Id: d79cbfae-ac7f-41b6-3ab6-08deeca1964c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10070799003|56012099006|11063799006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Ig640BP++teZDuWv+DkdtAtqTDE2f+Fz8lKv4jVLRRoUeE74vuf0LP0wMMnt/bPuGfWTRi+CrftaW/jN4zFSFzZ1xlPbvS3CqBaWctZz5j90qYcM1NfDPqOETauNX8FsDH1cEGsBHtaN9PTWw6jUK0uxuLQ5/odQnxlbSInPQi76c9HLi2irXIs1qqFDYl0W2149YYmePkpggNaW37ZI+YOiSnGI4wIyXmXRMVeZ83ukpz5rYwVYmMWx/4tGfwQSWVCHW9Kx1MH9xjihJJTe3UMBBWYv+mjBXTfWRRVUa3KowhQt6jpxsvbq/VzzchCN7Y9CepgkSnGfBSxk5ZsrthQ1v/vJznoBJJByZqRXJP0BwjlUZVkat/XgINVs0YjkaWuHxDyAL2FktuAjVt3woE5J1boazHPOzwIx8PQwOkAgSrquYNDRPieHQaBqq1gqySvATFVIEabj3+DthWnUcSU6q6pju2wiJc0xpG2dsTw9s4AaqQl+Io6+hj4r/CToY9hFjsoB6MvIhHJSK/yExWmMYrdmQj2LqscOYJSYbf1fIm2fzPx9h8TJc/lB8d1W3c4UkKT80CP0/k9i77YfsZooDSVuLN01hlYqYYuFCbEhoa97/Robjp3D2Qrd5TPlWe7BdkkyGjPhzwumX5+K1JgGUwdG4nn+cngmKqkwsOA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10070799003)(56012099006)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGdUSHBPS2ZHbS92Rm1Gek1lNlllR3lnOFlFa1NrYXowZWVDVW5hdlNBQnQ1?=
 =?utf-8?B?UWtHYjMzalNLRkE1QkFKd0xvSnFQMFJxUFFGM3NVNDNsdjdlYWN1eGp4Rmdy?=
 =?utf-8?B?Z0wrN2VwckpPUVRDcW1VTjV4S1dybVJiYUd0YWREMXA2akdqMk9tOGNsS01t?=
 =?utf-8?B?RUVodWJoS1B4WTBsVG9PVUJ5dU1JUjNwdVhMYjRLUFVzcWZVUDA5QUdHbDFG?=
 =?utf-8?B?dU1wU1RNNDQ3NkxnY0pDNkJGM2ExSWlaRHJlcG9XV3BCZk9lUzhKRUE4N05K?=
 =?utf-8?B?VkowdmtiZS91OVFKVHU4ZktXMWRhMmxadkVYQjNpcnRuVjB1cGtaWlRjaGRx?=
 =?utf-8?B?MlM4MjlGMG1QNktrZHhUVVBrZVRoMzY3V1JGT25TRlFucWJoRUs5T1hjY2VG?=
 =?utf-8?B?Z0sxQkhPd2gvWXBSemp2SVgwK1pCTTRjS0NtS0hST0JCbHVMT0FlUVF4c0xp?=
 =?utf-8?B?dGxpUUNsdzNyMHlmV292NjA3aDJ3d1FmMmpLTVV5MDUvWHFjNzYyaWxVZVNC?=
 =?utf-8?B?bFoyL1pNbEVETW41S3Z1cm1WNUFkSG5QY2pkWnJQL041OVBrMFhQdDlKQjR4?=
 =?utf-8?B?T1BMZmV4a1RJb2l5WmJMWnFiOGhVemQyQmFoTVhjN25yMlhqajlzUU5vakpo?=
 =?utf-8?B?cFdsL0svQzA2SDZQTEZjQjc0MUFhTWxnYnl1aGM0V203RjBGS1RweE9wRm9t?=
 =?utf-8?B?VVpZa1lBNnp0THF5UW1nWlZOZXhRSG91YjFzdmdVMS9VbWlGaVJMT25pdE54?=
 =?utf-8?B?NXBCL1p0djgwQWRLNVdGdllKTXZlcUhzSHdRakVUbEMzSTN0ajUweExuM25o?=
 =?utf-8?B?TExTQnRVZXd0RUplMldBd3pCNkxDekN2dlpIZDlrSk1wWTVsSG94VUtob3Fr?=
 =?utf-8?B?VThHTG5KNDI1M3BCV0tZSnFCbVZJMGhtUlRybFZDOXNrZU1zamRoYVowTmc0?=
 =?utf-8?B?OFcrWkJkVHRBZEtZQUFSN3hDNHBKUVliQWdjY3RLN1FMR3lRZmIrRVNBK28y?=
 =?utf-8?B?VUJlZ2xIL0JJR1doME1CTzk5Rm9ZWk5tYzJqYWlMRUlZOXI1aFRQTlFWMyt1?=
 =?utf-8?B?VEVyWm9nbVNHWVVIY2oyZURQL3oyRzZteWFLM29uOUFhbW5JS3A1VDBFV2pk?=
 =?utf-8?B?dnhUR1BsYXI2d2pWaU44cGQzNHlOWDBEb1ZXR2paakw2aHlCVlRkM0wzN0du?=
 =?utf-8?B?Y1FmaFVVaFBHYm9zekx2S0VrR012bkdHTnVFYmN5YzYrQVJZLzJVNGFFN3g4?=
 =?utf-8?B?c0NtZjhpUk12TGFsRGZaWkdxdzh6TWVxVldza2xzdkZUbzZMZzFKVU1jMmlQ?=
 =?utf-8?B?Y2xsN0RSSmd2L0VHOVc1cFpmS2Q4OExuOXpVclNTWkNsMG4vSDROblVranNQ?=
 =?utf-8?B?QS9mSHRJd3R2QzBDOElHQW8vZ2xyOXVMblNMTElPZFRRdWRoRm9JV2JVaUQw?=
 =?utf-8?B?akxWSkQxZ1g1eUNLdnMvVllHUXhVMXVMeGNMUGRrMkVGd0Vpbm5aOXV4N2J5?=
 =?utf-8?B?cE92TXFnbjd5elppRXUwcFBWTGtBM2F4Skxqd1IwRUpsR2d1dGdrV2o0MGpl?=
 =?utf-8?B?NUxDZk5VZ1FvcGpmakZSMlBuaUwya0xOcXM0U1FteTJSQzc4d2FsQWovUmE0?=
 =?utf-8?B?NCtOTndrWU91SGtId29wYytQS09ycU5oZVA3bDZWZFQ2UC9UVElrQnF5Z1hO?=
 =?utf-8?B?UTIrTUMzbUpOYUNOT3Y3QzZZYytCcno4S3YyZ1NMc2l5VEJjc1MxNlYxVTFK?=
 =?utf-8?B?aisvd3J5UFdPWCtEWDdHQWZiMSt1RTV6V1lrYkd5dU5qMy85Uy8zOXRDZHFN?=
 =?utf-8?B?bVVtallnUHNia25jNTNkY050dVBYOXlyYlZuSWtubTRYVmQrM2JzT09hZklo?=
 =?utf-8?B?bnI0VVBWYURreC8xLzczdkxQdkM4MTNwcHowNDB4V0V5ZTl5Y21NNTVoUVVM?=
 =?utf-8?B?OVBFMmY5c2pwMEFFMnp3cWRDREZGTTZGRFNMQWIrQTRGd00wRVY3cHZvTlhw?=
 =?utf-8?B?Z3VvK01KSkt3NVYyUlNrZi80S0hTbmVTWGNUcWFnN1FMbm1nVHVXempqWFp4?=
 =?utf-8?B?Ukc3VUduMU9aZjRNUG85VmFaUGdkMkYzTFRmM3hwZWdKcE1qSXpsR0d5QThC?=
 =?utf-8?B?NCtYeFNnT242SnBJdEloV1JhdkRlTjJBUjdnZ1RiSDI1RHpwMnk4TitoNmVm?=
 =?utf-8?B?Y1pMSjZpUTQraFpEUldyb2hnc1dkZGk1MVoyaG9DWExhcmxWK2lpYmxlUXNS?=
 =?utf-8?B?OWRBemYzZm5GTVhmbSthZWtPeDRSczNENnk0WTZxT1huMGFCckg3Yi9XbDAw?=
 =?utf-8?B?R1oyZ1M2YU1Ua2tLTTlxeFMrZ3VzSVl4eWNwUzIzVEdvR3F1enRiNzcwQlIv?=
 =?utf-8?Q?56aa7guFX1iO9pWyaiH7WsRI7JUUZDSs7mLlcbxTGyZB5?=
X-MS-Exchange-AntiSpam-MessageData-1: 89PRClXMN1nt3w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d79cbfae-ac7f-41b6-3ab6-08deeca1964c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 12:13:09.2043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: otwzyK01UjqxuXKvFNMk58pULWYOF0RG1/N1sdGyIgDyiW6InLc7//nV6j+1nmEcfIXIc4kOSVST1qWQwdOmKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4355

On Tuesday, July 21, 2026 7:10=E2=80=AFPM Svyatoslav Ryhel wrote:
> Drop reset GPIO from bluetooth part. Add lpo clock to both WiFi and
> bluetooth nodes. Add 'brcm,bcm43340-fmac' as primary compatible and
> 'brcm,bcm4329-fmac' remains as fallback.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm=
/boot/dts/nvidia/tegra114-asus-tf701t.dts
> index 3de5c84d5f009..b71a02b3fd86f 100644
> --- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> +++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> @@ -1300,8 +1300,9 @@ bluetooth {
>  			compatible =3D "brcm,bcm4334-bt";
>  			max-speed =3D <4000000>;
> =20
> -			clocks =3D <&tegra_pmc TEGRA_PMC_CLK_BLINK>;
> -			clock-names =3D "txco";
> +			clocks =3D <&tegra_pmc TEGRA_PMC_CLK_BLINK>,
> +				 <&palmas_clk32k>;
> +			clock-names =3D "txco", "lpo";
> =20
>  			interrupt-parent =3D <&gpio>;
>  			interrupts =3D <TEGRA_GPIO(U, 6) IRQ_TYPE_EDGE_RISING>;
> @@ -1309,7 +1310,6 @@ bluetooth {
> =20
>  			device-wakeup-gpios =3D <&gpio TEGRA_GPIO(EE, 1) GPIO_ACTIVE_HIGH>;
>  			shutdown-gpios =3D <&gpio TEGRA_GPIO(Q, 7) GPIO_ACTIVE_HIGH>;
> -			reset-gpios =3D <&gpio TEGRA_GPIO(Q, 6) GPIO_ACTIVE_LOW>;

I'd appreciate a note in the commit message on why this is dropped.

> =20
>  			vbat-supply =3D <&vdd_3v3_com>;
>  			vddio-supply =3D <&vdd_1v8_vio>;
> @@ -1450,7 +1450,7 @@ palmas_gpio: gpio {
>  				#gpio-cells =3D <2>;
>  			};
> =20
> -			palmas_clk32kg@0 {
> +			palmas_clk32k: palmas_clk32kg@0 {
>  				compatible =3D "ti,palmas-clk32kg";
>  				#clock-cells =3D <0>;
>  			};
> @@ -2382,9 +2382,12 @@ mmc@78000000 {
>  		vqmmc-supply =3D <&vdd_1v8_vio>;
> =20
>  		wifi@1 {
> -			compatible =3D "brcm,bcm4329-fmac";
> +			compatible =3D "brcm,bcm43340-fmac", "brcm,bcm4329-fmac";
>  			reg =3D <1>;
> =20
> +			clocks =3D <&palmas_clk32k>;
> +			clock-names =3D "lpo";
> +
>  			interrupt-parent =3D <&gpio>;
>  			interrupts =3D <TEGRA_GPIO(U, 5) IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names =3D "host-wake";
> --=20
> 2.53.0
>=20
>=20




