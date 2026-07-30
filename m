Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011023.outbound.protection.outlook.com [52.101.62.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 735EA3B6348;
	Thu, 30 Jul 2026 07:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785394843; cv=fail; b=BQ3ETkA2OzqHd+c2sHZXFSENYNQ2S8HUPL22rqcCyiu8Cnb0RwHr8LB+A3u66yCTJfiDQgiD/1JvGZUs9Le7N/4M66LILKEjcTno9FjTJpn7okMoKn0OhHRNRgHWFVrufPj12GgDq6PIcrZSnyfWg8113vJxnyPhmkwj8Q1N/yI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785394843; c=relaxed/simple;
	bh=70zotvTZ0F6kF9aGoi3b3W//Yy7qyQUIEL3drtzmFgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RkEGfQEoMYQS6oBcRP2xk+XqIvUcr1B2orEXryD/SbIKjt/31heIE6DmJMuX90wOx67mM4yW6Fjdew1PmMKIMBRNLlwiaj9BPMq1kecL0ClVPJ5ZNKML+YnZ6H/J9S2QU+r7tsAFntPYrjzh86gIa2EeabGlJho1BZ/qKMvnBO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=i9uSEwrQ; arc=fail smtp.client-ip=52.101.62.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="i9uSEwrQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ae1uSqHxpaPaqX0DS3i08GaSpRS6xCfqKv8/9ZbGvo7tQMrBgOD1E5YA4XU3a5GFodxwpxjo/mocNopelGL4ZIQi/rAJPyzUOSClNReiiNs4/HHrrIO6NCUKIIXPxEWW3mUaFafuR7yPG5SfzW/tTZDtB770o0CaBhlwjD15ZXPGHu+LOaNPYFKCOOhzC1ZSn3diA2Jfq6BTroYNufro1p7CjTteAD3b43/rJoSX9k9zC3zsqb1Nk0q+Y5ddKwEr2kd6yARMabCv9IehTASILe4giaTPzmUjnsUP1aTxQcBgtbdRMuiNLdlY5PKO01MC2UEPrQ7xz/cq69wCe0KlYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MOsGXatJFt46mJnsySjJ0oLrI2Bx8f9DGYtPaCvu7IA=;
 b=a0QlJ8IlG6e9vTQJJU4gSZZxQor1T9tU2I1Gc3eGTAf5+FWncQnxQ06rYbge2mDnbicwiwCKhUjqSFXECKNDMIC63OF+CLZraOhR2X99jplpnW09A3qcqiWvfWRB+exx4Lk81xP0j7snHXDGPDyRnUhXAsAftxG/YAhpd4284hWQ+EvWI4TSj6pTU+1Vu900woBYUF92DFbzkxPTUHKmz0659TGqwjUiPQy1DEtV7ZmBZdj80lSuDmNsKX839T7+14aWa92DjpkIvOHhzrSOxNEvzrCbUKdUVRLzXY5h9uS0mIpsiv3rrVHLTNrHkQy1Rj+fhXxzAT8FIRgvCDjH0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOsGXatJFt46mJnsySjJ0oLrI2Bx8f9DGYtPaCvu7IA=;
 b=i9uSEwrQK0nt8+tPeyrnb0+75OKjojATg0/7fs3R2vfQHCusACnDvAzytWM8wRCCgmCRq1N2rvNQoozAOQRi9kFtjJFXykTyBCz75DMJuldqWeR2KRl8eBheSzDdSlNb26226i6cc5n6Y9y2olZkaUztYHs5UZhgLNn5y0qP+VhEkorYQsoZdeNZmywYwEtxAnCvq1Iyr880YMalJWPyY+vUhfuGU8KBylN1kWrFQB5tYrBNAEZuFxijl5UiLj+ybSCMx5c5TMllWj5Rnq/2tDG/zKzxgqZAELBqDH5374F+mNM+F/frFUxEWV8bTXJ1z9LU4hOdiKGeVnfz8hmj7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by MN2PR12MB4424.namprd12.prod.outlook.com (2603:10b6:208:26a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 07:00:18 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%6]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 07:00:18 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v2 04/10] ARM: tegra: tf701t: Remove pin_ prefix from PMIC pinmux
Date: Thu, 30 Jul 2026 16:00:14 +0900
Message-ID: <coToVZNpRembJrCwaZZXrA@nvidia.com>
In-Reply-To: <20260721101059.451699-5-clamor95@gmail.com>
References:
 <20260721101059.451699-1-clamor95@gmail.com>
 <20260721101059.451699-5-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0207.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::20) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|MN2PR12MB4424:EE_
X-MS-Office365-Filtering-Correlation-Id: a0692e87-864e-4700-9f95-08deee0836ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|366016|23010399003|1800799024|56012099006|4143699003|11063799006|10067099003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	nNnu6QNPhZXHgz+FKjIAoKq3T2zaaHQh+BoFDn4C+TKtGuGmMjluXkAWVQi8uItuxBeBaCGWKUIS3JGpph21dboAw/Xj9Pe9t9yLm7tUABVGClyfSYOSFiGrWNCv7DOvBa8JVjLRJ4KeJRCU/4VdPEk/GuOgcZchOaU6rQuL43j4+Jb8q45I/y+qpjBvVXl1zPb3/WS1zLMwFx3vfV2S6PNgcQM1hlcHH8Grl76RlfUcdY4zM9DikRqFgNNKhtAok3H/Zcc/WO73F1a6Pj5VRTPFQ3wmKshdtnXmI24Djk/SaJnUsjPaF81P6ULSF4/94RE42cwec0t+ZVL9vFTf9CkoJccvTjeCjd6WAOcTEBfhW0sBDsa9eNXHppuOGykGEu6VUreY8lqSJkG59Hgyl2I1ymLr5CNJfBEltr0oEUkztJSrf9TOA8/W2LlzTkqn32iS9QQueWRqcNvktrl4GSPGvSp8fA+b3/3izv5pk/imTrIF7HwdiLUucfxzmvcXWidgy1Lbd+Vws6BIgRwPcb+VPaPQiL1t2B52n/cKLSRvdGnxvG1139uVARL5405wh6mLlVfsd373uLRmiV+tzCLFh9ZAbghOpwmt6yewKrnkN/P9DS5nKEvtmnGHixqXEDwaKSSzO4L7JzKqAqCdtIiUreeMWG/t54VgLSDnsl8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(23010399003)(1800799024)(56012099006)(4143699003)(11063799006)(10067099003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjgveTdGM0Eza1N5eGtpcXFWQ2xLdDlDSUtBeE1IRWhZTWZPVHlUSGVERDVV?=
 =?utf-8?B?cXlEQi8rZlF2YmJEakFLdUVCSzgybjNqQkRHTmw3YVZadGlwL01sbDhORml4?=
 =?utf-8?B?LzZsL0RRY08zS2tkdmxhblpVOHpHckhJSFkzTFNSalRvWHRBMVpLTW55UHlK?=
 =?utf-8?B?Vjd2dmd1enpDRXlnV1l0d2JwVzJ4ZmtjZlExb1NGQmsxdVYrV0VhMFBYT2Vs?=
 =?utf-8?B?bzJvY3U4RjdLSE0xeC9pckcwdUVEM3A0VVJBdFIybng0NkpONHEwbXgyd1p4?=
 =?utf-8?B?b3JFYmFGejVkRU9VdGZ0RUgzU2FjVndVOFkvdlhLUXo3WXR3cllYVndCTE93?=
 =?utf-8?B?cy9EQ3diYmIxaEI0VER2S1BFbFJVSE0rK0Vyd2tjdng4YWFkY202TENBR0dG?=
 =?utf-8?B?b1F4RHllUmllNDZpUmI3ZnJrUkpjbkVUZUtvMkVtaEZVNHhxdDJVNGhYdE5Z?=
 =?utf-8?B?N3NNVzZlTjdhVzFmSDgxYWVSNTdsV2paM0FsSGdlczhzeE1aQXZsbVRzaVBp?=
 =?utf-8?B?N20wNFBObE5NeUV2NSt1clY5bHJFTWZleVB0ZCt1ekZQNDdneDNHcEVDN0dW?=
 =?utf-8?B?TEwzbVEyMERLckJ5b3hEak1mVi9YOWFTRUNoT2pvM1RFak9jUGl4YW5xQ1p4?=
 =?utf-8?B?ZHUrUWdDUlBPaHFBNDZIQzJxWElSQ1h0RDFUYmpNZDRoK2F1dmd1OXdBa3RH?=
 =?utf-8?B?MTRLOWFnRFR0UXNxcmJUSloxNm51UGZlN1lhR09FSTJObExTUTVpL2tYSjBM?=
 =?utf-8?B?WTRlci94SXNrK0pySFA4NEpoeWdUc3ZpNUxtN2FQL29iNWJTa2VJZDNvQ3kr?=
 =?utf-8?B?MVpkM3cxVG1yUXpoSzhGRTlJSytGVzRpSHJPZ0dwWXZ3T3V2L1pPSDJjSmJN?=
 =?utf-8?B?am83cWorNlFXVm1DT2thZHl0UGhiS1pNZTJxY1lqZTBwbXZNOFgydkJIb2V5?=
 =?utf-8?B?cFROYVJyTjArUXdRVFkyQ09wR0syVzZwOFZuRHF6YWM0SmU1KzE1eGxoZHFI?=
 =?utf-8?B?Q1hGUnlURWFWRXlqa3JUd3JWUEJLYlRXWnc4VG1obGY4elhkM0tCdExEQndX?=
 =?utf-8?B?dHVYWjhoRFFxVjBBSVZZeWxIbUlVWjB0VkNreFk4ZjhjYnhEc25RSG5BT0dC?=
 =?utf-8?B?Z0R3QkVmeFJYRXJLdnJ2OHdNWU9GYm80akZNejBtZHVIcndNci9VWWZjcWI0?=
 =?utf-8?B?RGFtQ1k3Q2pDek1yRUpZbGJ0N2poWXpEaUl4SjFnRFBZYXdacm9GVkkySHBl?=
 =?utf-8?B?Y2pXR0l0eUZwNENMV2s4bDNWTEJTVkN6emlRcVpSZFBzc29zaU1OcXY1NGpj?=
 =?utf-8?B?Rm0wWE9FUUtSMVNHeE1wTnB5R0xMdS85RzFpSUFnSWVyR20zYWVpNHdTemUy?=
 =?utf-8?B?RWR2M21kZnRJc0VrU1BNZVN2bTBQV0I0Z3Y4eERBeTA1SXB1b2I2dXFEdG12?=
 =?utf-8?B?VWJoM2FicUZQaXI4RzNGcHQ0U3BLcmZYZVhQdE43UEd6Yks0em54MHVqY1l0?=
 =?utf-8?B?ZVBrU0M3K3lQUWlVSnNIYVpHK3VDT3JOY1haeUdjSXdlelNHbjVuVnpJZFdZ?=
 =?utf-8?B?YWxXc25RejZyRTlyNVkzS3JUYzFQdlh0ZUNEci9MVitVY2VRZWs4QmdhUXZz?=
 =?utf-8?B?S2t0eUIyWlFrVnFCRXJEWi9yTytYR3BrWXczNnZoblFmZE1pNDNMelFIVXh0?=
 =?utf-8?B?ZVpKaHpEVTVqRHFXUWVBVVhHK0JOVG1wZ0pJaE16VjRSTXFacUFJckF0NkQw?=
 =?utf-8?B?VUxnWDcyanNrMVhqRWFZT3QraGJxUmpmY1NNTzBsQnhPVm9Za1IzUGN0aVFi?=
 =?utf-8?B?aVVyU0dKL3h3SGVickNyb1M2a1Y2Y1l3Wno0SlBDd04rTkN6ZWtZSjFjY3Z3?=
 =?utf-8?B?aTcvM3NyQXVtcDJXT0o1bkJPTG4vOEptT3lweGtGbUtzWnFTenhnckI1Rkxu?=
 =?utf-8?B?ODFBQXZieW9scWdJSlkvU29ORHMrS0ExQ3M3VTByYWU0czVzTGk2cEt0RUVU?=
 =?utf-8?B?VDVNM0NkOVU3bGR1ZEd2Wlg2SWRpYmN1cjhscmRqY3phandjbG15R05STTVQ?=
 =?utf-8?B?d3NCMVM4RCtRSytSS0l1VGd6ZnlyYUdPT1phNTMwSVFsVWpjR2JqblJMcGVk?=
 =?utf-8?B?NXB0OWRYZVdCZHRoSkUzR2Y4cW5pN2FuWjJkQTlLdTVjMTlMYng1K0prMUNQ?=
 =?utf-8?B?SUVEV3p5amVBbVducXNpWGo2d0Y5dEVjc1Z6ZWppL3kxQ2lza3RGcTNNejN3?=
 =?utf-8?B?cFBOZkpSTTNSc3daaVJDUTVxTXhoSjVWS21sNDlMVWE3dm15Q3NwbW9mUUNI?=
 =?utf-8?B?dGNCcGxSRUlxRjFaeFFaVkpMd3d1R0cyeXBhc2M3TzFWaHMyQjczeUNDeTl6?=
 =?utf-8?Q?t7aVtibzecloIe04lEM5kZQVDJAuaNjhGAY0qR7phCcOg?=
X-MS-Exchange-AntiSpam-MessageData-1: 3yo/BbenXNTt2g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0692e87-864e-4700-9f95-08deee0836ed
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 07:00:18.4565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 21BdMQ35cgFtx3EvivJab8IeZaT7NgD/984pwj8lnwC0MpbHXrMeCP7zqz5oV98QM5Yb28Y6+3YPuxIjB+483g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4424

On Tuesday, July 21, 2026 7:10=E2=80=AFPM Svyatoslav Ryhel wrote:
> Schema discourages using "_" in node names. Since pin names in palmas
> pinmux is not an ABI, remove all "pin_" prefixes from names.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../boot/dts/nvidia/tegra114-asus-tf701t.dts  | 20 +++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm=
/boot/dts/nvidia/tegra114-asus-tf701t.dts
> index 00eeedf3ef7a5..a27d3c4f2c63c 100644
> --- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> +++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> @@ -1462,52 +1462,52 @@ pinmux {
>  				pinctrl-0 =3D <&palmas_default>;
> =20
>  				palmas_default: pinmux {
> -					pin_gpio0 {
> +					gpio0 {
>  						pins =3D "gpio0";
>  						function =3D "gpio";
>  					};
> =20
> -					pin_gpio1 {
> +					gpio1 {
>  						pins =3D "gpio1";
>  						function =3D "gpio";
>  					};
> =20
> -					pin_gpio2 {
> +					gpio2 {
>  						pins =3D "gpio2";
>  						function =3D "gpio";
>  					};
> =20
> -					pin_gpio3 {
> +					gpio3 {
>  						pins =3D "gpio3";
>  						function =3D "gpio";
>  					};
> =20
> -					pin_gpio4 {
> +					gpio4 {
>  						pins =3D "gpio4";
>  						function =3D "gpio";
>  					};
> =20
> -					pin_gpio5 {
> +					gpio5 {
>  						pins =3D "gpio5";
>  						function =3D "gpio";
>  					};
> =20
> -					pin_gpio6 {
> +					gpio6 {
>  						pins =3D "gpio6";
>  						function =3D "gpio";
>  					};
> =20
> -					pin_gpio7 {
> +					gpio7 {
>  						pins =3D "gpio7";
>  						function =3D "gpio";
>  					};
> =20
> -					pin_powergood {
> +					powergood {
>  						pins =3D "powergood";
>  						function =3D "powergood";
>  					};
> =20
> -					pin_vac {
> +					vac {
>  						pins =3D "vac";
>  						function =3D "vac";
>  					};
> --=20
> 2.53.0
>=20
>=20

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>




