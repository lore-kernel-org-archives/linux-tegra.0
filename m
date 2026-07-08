Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010000.outbound.protection.outlook.com [52.101.46.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CC1D3B42D2;
	Wed,  8 Jul 2026 02:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783477345; cv=fail; b=Z/GSHfV94zafveyXXcQj9wzRfVYY2Tm5ixvL+ffLhF7HXuJDYj95/1mHTcYD+W2wHAwKOhKGuQ6ASZ7fltkMKijXJlHoRMT7rVoac5fqOMT2ndUKl+qRtwj+0AiiN24P2fH63dmLZIilZi6dhMmtld1p+Z6xnRyO48yeHGNU6nQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783477345; c=relaxed/simple;
	bh=zcATGOF3mfhB5AefkwtDe+TJKp0Eq7ggs8EK3HAvqLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fLrbvHP+UMoFuc9ZxQKaa2GZAyA4jloglE5mXfQptTV1wyr4elZTWwgvznQrIxsShQIER0gwVTxHWrg7TqVk6J4dEOjQEHui7sQm1m6NohcyXPpWk+KT3dPqUH1w5h53et0RKWBrtd33575zcdRz9H8ZTEdywoEXwr6R7xdSbZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=EOVezLhZ; arc=fail smtp.client-ip=52.101.46.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="EOVezLhZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cXNV6ZrmFTx1EDs/F76zlvd2N5H8vIyf2+PA5V4HGX4AZpWPoAs0z0eKSZX3OEfT9bGPqtr00l0RUBAYpliwKzyNGdmwGLfVAhsm4HL9bPb8EZlFv4orvfLC/GiPEcKjwY+sKwBBuUWyumb95/LjaK5t+KfYKsQClh7wpf95IAH7oPEpkF5uYjJUh56BtkHShj+RSWFoB7Wwq91hKDrXB1ZqS8B98yj+pIAuGl9iybUhvi3B0mko713A5TbHC65ZnrQI0+yCbBFdfdO/5wve39HExGYYTiB/hQ6EPfBZSMi/VwZyUPgzQ0F73W8E0/+wzuWMzOghgx6tdDtSEMfH9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHaIKHnABO2htfw9cn8JxlA+hOo5DukejNQs3JpmyTA=;
 b=Ag9qmNhtqLtUEXBBIYJI8haFw8kdXFq5g1ZKVfEabtzTQ8KJ0jn5hMVc3YmMA/M1+2kmeECr65m924nC269gy7+wwrJPlgYeWa09Te47fPhryOELXzV4tcQ/yaD9sHZer4FQ0FTt/LFyffO2OqpssNpnof1ArTms/Ho8by+wk2ANT/WUt/uD7iiZIK3W68KU3P8Arcnw07nHctI9tvaggCXTKUikPCms2CYICeIAyMbqkvL1eofP+Cf1Tl76JRFf4Et2vR8ztw1EOSORHrYzDygFtfLEOzPxsKFJPhTR6hu4KkMBxcnAX7QUq57ES79lO1snNHeutBBsky58ivIiJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHaIKHnABO2htfw9cn8JxlA+hOo5DukejNQs3JpmyTA=;
 b=EOVezLhZ9k/+b0e9VkRzqupAWXwTZSRIZ13gOUwod1gy0MuRQs7/QhYsEDvkk8rLzN3dFfOyI/O4L4xtTNnzv+0DMFWp0bPcBWwpNSaw8sw6lnb9e0IhMJ8yRg6Eawj0rOIfJGgvcl/n9z2s4jWTNUoiJB52oqGQkuEEPy8oQtHOVcJE4ZL0OfAtKQ0yAo6r5bAKbzr8N8FpY0FJIt01LDSwZ043aFw6ZFk7d7WwcmqbTJB/N8EEw+K8+PYVnJwldddDnjhFpv0sPH8aBzTJHb1rhezm8OT/DONaQ2c9Dc65cfZRTrzEqLERRYObJHzFG4sFa2/5QD4HvaEPzJU/kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by IA1PR12MB7736.namprd12.prod.outlook.com (2603:10b6:208:420::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 02:22:20 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%6]) with mapi id 15.21.0181.008; Wed, 8 Jul 2026
 02:22:20 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: linux-tegra@vger.kernel.org, Jiqi Li <lijq9@lenovo.com>
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, krzk@kernel.org, jonathanh@nvidia.com,
 thierry.reding@gmail.com, mpearson-lenovo@squebb.ca,
 Jiqi Li <lijq9@lenovo.com>
Subject: Re: [PATCH 2/2] arm64: tegra: Add Lenovo ThinkEdge SE70 device tree
Date: Wed, 08 Jul 2026 11:22:16 +0900
Message-ID: <qdp3icvlQKCtNtIxYUjG_A@nvidia.com>
In-Reply-To: <20260701090639.669524-3-lijq9@lenovo.com>
References:
 <20260701090639.669524-1-lijq9@lenovo.com>
 <20260701090639.669524-3-lijq9@lenovo.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0261.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::12) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|IA1PR12MB7736:EE_
X-MS-Office365-Filtering-Correlation-Id: ece2f06d-b11a-4dfd-829f-08dedc97bc92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|23010399003|1800799024|366016|6133799003|5023799004|4143699003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	923xVW56XYPUSKlm9X/r0oJyoNpjRjGn+4kkj+TrggSWKA0FQl5DJKAQ/D45BoyTXCSSGI4A7a1ggwCKxZQ17w++zPZwe33NGvyv78E1Q/O29P3+hgPuDDpRy73vbSN74oRLWiP05J+L/Nux2ps30TGUMxiSRI+CAXvDiLRjSwRbdPoUehPBu7ADr+WYP4UM3nSl3yvS9jQXc8TqNQEf94fzTb93uE1VdK2or2yUyxskxL9jVkKTWbdmQDNj7wP8RuDwwSWKXuhn8+AnXLATIjR6bf1ZZI7VlvlXDyM6UmJa+FcLsk9LMqe2nGAGejBgacS69QPtHcImmdsnsNE+49pdTNH+K6IE4x7LYMdmgvEezbnu4effYPGxgOyKdclvpkdL//k5WzIl0HQjbdIySW0ByMIIhE/Kq+3K3FsPyL2eMGmnbS5UKO0Zi7z1ZQVFT5qZI0rbqD+H1eYh9OzD09NcNKCvz9K7ZUzIj5EK6xsM6Uc5lyZAr90Q5fzVwqARiXGzElPNtNQnhopanEcqtDwiY8HEWzULVimq060f2sAAF4Pu9OJVMmfjtRQDwDpWZzd9Uj76/fx+3ST0AyzGZB5cP6b4AU18B2wokORp3rIDFRiIcgiki+/hhsdhQinBLOwJ1rCaDNFxBBiROtE9eBUgR9ONHTAaCak0PDuJDrU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(23010399003)(1800799024)(366016)(6133799003)(5023799004)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MStJalMxeTJGelpQWEpsUXdDY1lSRzNkVmk2V3Z4bUpEc2laNlZjRFdHQVhI?=
 =?utf-8?B?SWFOb1ZvOXJuWkVHd3R3UGxCbDIyMExnaXcvKyt1TzQxV2VzS0hqbnIveEJL?=
 =?utf-8?B?ajB3ZzA5bFIyeVc1RG9rZkJhM2ZCRGxZWTFtb2dTMms2dlRZUlJ4TG1PdnVJ?=
 =?utf-8?B?YTVwb2k0RFg2Q2ZCV1lHb01XWTVVUGlZVjZROWxBT2hrc1YvM0tmK2w3aGJ2?=
 =?utf-8?B?TW1EeXpFdEZEQi9hcmlVSkVWUUg0VUVjZ1licURldnhEZTFGeHRuT1BIenk0?=
 =?utf-8?B?bmRmTnJNOFhQOFJDVWUxQ3dkSkpzamx4MHJyMURVREd1WHY4RWxXM0podzZF?=
 =?utf-8?B?OWVNQ1l0azU0dGtVMzBmMzNMNHFEbUpGRVVodFJhVVFVeVVRR3gyRURQaHhm?=
 =?utf-8?B?VWEvRW8rQk5CNnRZbm5vRnA0V08yS3FRYlVzMUNmZFdNZC9xSDh0WThyWDEw?=
 =?utf-8?B?SFA4WXFzTDRyS0ZlQnZ4VXk4T3J0TTBmbm1UUkZrb2dHb2ZvWGMzdmZOTGY1?=
 =?utf-8?B?M2RCUlcyZUhhaExOVkkxMmNEWnRPRi9DenhyU0xoR282WVg1aXlzdFZ0Rmlh?=
 =?utf-8?B?eU9haVVacVJIQzVQMkRxaDg4dUxyVExGWnpJM0c2L1FTS2FvYVhNVlNPNlEw?=
 =?utf-8?B?aVEvdkMySTJNcW5oclhwU0o5bjdPRmVnUkJlR0ZhRVJvcUExNGp2bHJHb0RB?=
 =?utf-8?B?VDlaZDZWR05ET1BxYldNL3k0REt4K3dXTjltQlVUbVd3cEx6VWUvVnpVakpk?=
 =?utf-8?B?SU1nVUR0SFFaWVdDSEVvR0RHaExFS3NZeDFhRjJoRk9vYXEybXdlQlpOenZl?=
 =?utf-8?B?M292UG1QS0VuUkhwNERFMmY0Qyt1Ymd5SWg3MndZQzJKaGRJMkhmZ28zL2ZX?=
 =?utf-8?B?VXBqUm5KdFc0UlhuaUlxdlRRZVBRMEo4aEVXMUlFMWlheWNzTVhxNFowV1B2?=
 =?utf-8?B?anRkOG1MdHNJaytoRElmblFJR1VxRkFHR3hWRE02Sk1TaENRNDBCTm9LNjJB?=
 =?utf-8?B?YVFoYUJHWG9JeTVjdnB6YkRwdG50QVhKTjVKeGlVNnIzL1Fsd0srWXFKZ0ty?=
 =?utf-8?B?Ni9Oa3d6RitTUzR2M3Z2YUViR3RRQ0dWREltZnBEbUg2MlJna3R3Lzc4WEhM?=
 =?utf-8?B?dk5obHFxU1JBQ2lNMzNxTGJKYWp3MUNDdy80d3NVWklUMFBNUk8xRG1aR01s?=
 =?utf-8?B?K29KSTRUSE5leWpjamNVTDN4RU0vMUdvbGhaR2VzOExkdjBPeEpzQzdvbXlK?=
 =?utf-8?B?R2pGSmJ3OGJwWlpNQjFvMG5ZdFpLNnpQL3FxVGphY2p0bzA2dDgwRG0zU29C?=
 =?utf-8?B?cGpKZnNpS2oydTBjTWJweHRMd1Bad2RFeGg1Z0pNeE1BdHlUcmdEOGdweE1z?=
 =?utf-8?B?bXNMTGxraGViTkJBamVtdFVGQnFLRUsyV0ZOUWg0ZGNvWllYampyWkdXU3JH?=
 =?utf-8?B?ajdCVW8vLzNCRjduRHViLzJMVWhXRlpQRnUzam4yVkJhSFdJTnVDM2I4Z2cx?=
 =?utf-8?B?Q0NnczZHaWZMbEN5ZUo0VGpMNi85TFZMZWR6bDBwRzhteDEwRlpTczI5dkho?=
 =?utf-8?B?WHpHZmx3OUdXc1lydkxJcnhnRnJiZ0lUNmMvckZYVFhYOHVpd2dBVlZiYUx2?=
 =?utf-8?B?UWVHMWZUVnlHNEVpd2hLSklQcTNNQTQveSs2U0N6VXhBRjk2dU5DQmNSaVdt?=
 =?utf-8?B?N21jcW1qcEhSUm9pRldnTVBINXM2ZThvY251aTFIb3k1YWZZQ3UwSTJpYStM?=
 =?utf-8?B?eEVITXNWR2pkR3M0TmVBaCtqT2tyRDVhRStFRFRMd3dVdDFleGRkbUM5NlAy?=
 =?utf-8?B?QzRmcDNjUFUzMkRncVdJT2lBNGt3OGZmaW5oaUdRSDlLWlRGZGFiRmo0WlBM?=
 =?utf-8?B?VWYxN21sNmxlOGwwNWdYZ1p4VzlzaEo2NUhIQnFqNnI0WW1wVFR2dzNic3o4?=
 =?utf-8?B?OHJGZXZNdEkwRE5mQTN2Sko3OFVCWXhZTXkvZzhTOHVPQXprNURJMzUxb2NH?=
 =?utf-8?B?QXMrSTFaWGJHTklFckxST3VpdWkzczBybWtxR2p5dFVNR1YxL1YwMjhxMERz?=
 =?utf-8?B?SkxvbGlITklrak1GeWoxa0lhYU8yVWs0MkVPTDc0RmQ4ZUM0VVd1OVhQS1Jl?=
 =?utf-8?B?NzNLcUpqRGpyRUtWL3dKeDNrVUwraXlZUTh6aUJwZWE1cjEvN1M3bE5RMGtw?=
 =?utf-8?B?Tm84SkNhc29GeE9EZmxUbjVybzhwS3JTTTBrcXp5U2FwejRBUXFIMDFaeW1P?=
 =?utf-8?B?cnlQRzZDYkZOUlBSaUZoT1pZS0tyMHpHUFo0QTk4SEZuWlBPZmt3UXczL0tp?=
 =?utf-8?B?Q3VPUnUyQlJ0OU93eWE2WThLai9Ba293S1F5Z0hjanZpQTBXcytxcTNPamdH?=
 =?utf-8?Q?rAyKWEblsMI7JKvufIHDHXThNFiZSlgbfnx49jIcLz75Q?=
X-MS-Exchange-AntiSpam-MessageData-1: H55sRmzHelrjlQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ece2f06d-b11a-4dfd-829f-08dedc97bc92
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 02:22:19.8103
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RvQLQXf82lCSjntLYNfFufWiLaP8a5V0MxA1NXq1UkTuqa/yQg9qAZZZSaiyigqHVuTKQmszpowwR8rA94GIqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7736

On Wednesday, July 1, 2026 6:06=E2=80=AFPM Jiqi Li wrote:
> Add initial device tree support for the Lenovo ThinkEdge SE70, an
> industrial edge gateway based on the NVIDIA Jetson Xavier NX module
> (P3668-0001) with a custom carrier board.
>=20
> This initial submission includes:
> - 40-pin expansion header pinmux configuration
> - External Micro SD card slot with dedicated 3.3V regulator
> - I2C bus for 40-pin header
>=20
> Static verification passed: dt_binding_check and dtbs compilation
> complete without errors.
>=20
> Signed-off-by: Jiqi Li <lijq9@lenovo.com>
> ---
> Changes in v2:
> - Remove unused input-related headers from baseboard DTSI
>=20
> Changes in v3:
> - Merge baseboard content into main DTS, drop separate baseboard DTSI
> - Use stdout-path instead of bootargs in chosen node
> ---
>  arch/arm64/boot/dts/nvidia/Makefile           |   1 +
>  .../nvidia/tegra194-lenovo-thinkedge-se70.dts | 113 ++++++++++++++++++
>  2 files changed, 114 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-=
se70.dts
>=20
> diff --git a/arch/arm64/boot/dts/nvidia/Makefile b/arch/arm64/boot/dts/nv=
idia/Makefile
> index 72c0cb5efa47..736a3f8a923f 100644
> --- a/arch/arm64/boot/dts/nvidia/Makefile
> +++ b/arch/arm64/boot/dts/nvidia/Makefile
> @@ -29,6 +29,7 @@ dtb-$(CONFIG_ARCH_TEGRA_186_SOC) +=3D tegra186-p3509-00=
00+p3636-0001.dtb
>  dtb-$(CONFIG_ARCH_TEGRA_194_SOC) +=3D tegra194-p2972-0000.dtb
>  dtb-$(CONFIG_ARCH_TEGRA_194_SOC) +=3D tegra194-p3509-0000+p3668-0000.dtb
>  dtb-$(CONFIG_ARCH_TEGRA_194_SOC) +=3D tegra194-p3509-0000+p3668-0001.dtb
> +dtb-$(CONFIG_ARCH_TEGRA_194_SOC) +=3D tegra194-lenovo-thinkedge-se70.dtb
>  dtb-$(CONFIG_ARCH_TEGRA_234_SOC) +=3D tegra234-sim-vdk.dtb
>  dtb-$(CONFIG_ARCH_TEGRA_234_SOC) +=3D tegra234-p3737-0000+p3701-0000.dtb
>  dtb-$(CONFIG_ARCH_TEGRA_234_SOC) +=3D tegra234-p3737-0000+p3701-0008.dtb
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dt=
s b/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts
> new file mode 100644
> index 000000000000..530d5bcaeba7
> --- /dev/null
> +++ b/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts
> @@ -0,0 +1,113 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/dts-v1/;
> +
> +#include "tegra194-p3668-0001.dtsi"
> +
> +#include <dt-bindings/gpio/tegra194-gpio.h>
> +
> +/ {
> +	model =3D "Lenovo ThinkEdge SE70";
> +	compatible =3D "lenovo,thinkedge-se70", "nvidia,p3668-0001", "nvidia,te=
gra194";
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	vdd_5v0_sys: regulator-vdd-5v0-sys {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "VDD_5V_SYS";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};

Nothing currently references this regulator. Should e.g. the SD
regulator below supply from it, or should it be removed?

> +
> +	/* Fixed 3.3V power supply regulator for external Micro SD slot */
> +	vdd_3v3_sd: regulator-sd-3v3 {

Should be called regulator-vdd-3v3-sd.

Also, please move the regulator nodes to the bottom of the file
matching other device trees (alphabetical order).

Thank you!
Mikko

> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "VDD_3V3_SD";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		gpio =3D <&gpio TEGRA194_MAIN_GPIO(Q, 5) GPIO_ACTIVE_HIGH>;
> +		regulator-boot-on;
> +		enable-active-high;
> +	};
> +
> +	bus@0 {
> +		/* 40-pin expansion header custom pinmux configuration */
> +		pinmux@2430000 {
> +			status =3D "okay";
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&pinmux_hdr40>;
> +
> +			pinmux_hdr40: pinmux-hdr40 {
> +				pin7 {
> +					nvidia,pins =3D "aud_mclk_ps4";
> +					nvidia,function =3D "aud";
> +					nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> +					nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +					nvidia,enable-input =3D <TEGRA_PIN_DISABLE>;
> +				};
> +				pin11 {
> +					nvidia,pins =3D "uart1_rts_pr4";
> +					nvidia,function =3D "uarta";
> +					nvidia,pull =3D <TEGRA_PIN_PULL_NONE>;
> +					nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +					nvidia,enable-input =3D <TEGRA_PIN_DISABLE>;
> +				};
> +				pin12 {
> +					nvidia,pins =3D "dap5_sclk_pt5";
> +					nvidia,function =3D "i2s5";
> +					nvidia,pull =3D <TEGRA_PIN_PULL_DOWN>;
> +					nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +					nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> +				};
> +				pin35 {
> +					nvidia,pins =3D "dap5_fs_pu0";
> +					nvidia,function =3D "i2s5";
> +					nvidia,pull =3D <TEGRA_PIN_PULL_DOWN>;
> +					nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +					nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> +				};
> +				pin36 {
> +					nvidia,pins =3D "uart1_cts_pr5";
> +					nvidia,function =3D "uarta";
> +					nvidia,pull =3D <TEGRA_PIN_PULL_UP>;
> +					nvidia,tristate =3D <TEGRA_PIN_ENABLE>;
> +					nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> +				};
> +				pin38 {
> +					nvidia,pins =3D "dap5_din_pt7";
> +					nvidia,function =3D "i2s5";
> +					nvidia,pull =3D <TEGRA_PIN_PULL_DOWN>;
> +					nvidia,tristate =3D <TEGRA_PIN_ENABLE>;
> +					nvidia,enable-input =3D <TEGRA_PIN_ENABLE>;
> +				};
> +				pin40 {
> +					nvidia,pins =3D "dap5_dout_pt6";
> +					nvidia,function =3D "i2s5";
> +					nvidia,pull =3D <TEGRA_PIN_PULL_DOWN>;
> +					nvidia,tristate =3D <TEGRA_PIN_DISABLE>;
> +					nvidia,enable-input =3D <TEGRA_PIN_DISABLE>;
> +				};
> +			};
> +		};
> +
> +		/* Configure i2c bus clock to 400kHz for carrier board peripherals */
> +		i2c@3160000 {
> +			clock-frequency =3D <400000>;
> +			status =3D "okay";
> +		};
> +
> +		/* SDMMC3: External Micro SD card slot */
> +		mmc@3440000 {
> +			bus-width =3D <4>;
> +			cd-gpios =3D <&gpio_aon TEGRA194_AON_GPIO(CC, 4) GPIO_ACTIVE_LOW>;
> +			disable-wp;
> +			no-1-8-v;
> +			vmmc-supply =3D <&vdd_3v3_sd>;
> +			status =3D "okay";
> +		};
> +
> +	};
> +};
> --=20
> 2.43.0
>=20
>=20




