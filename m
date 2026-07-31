Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011042.outbound.protection.outlook.com [52.101.57.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2DC392837;
	Fri, 31 Jul 2026 07:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785484294; cv=fail; b=sW/Vflj0NfD9rXutJuVm2Prjm6/Cm//IIMACxRX56X9l7R7VUpKhgbI8fJopinY2AhTgvGR68khpaKDA5y9rYk9Lf2/zlM0WX/YC0AQvGczQz8+VlrHJJ6CBlpTNHSc8i7Mhex+iKK88d10i/yXFeTQ+Y6CN9Gd+44rZJ9wTHd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785484294; c=relaxed/simple;
	bh=jjMOVvA0l2GuE4eOA3I1WT+6ZleSXMDgVX0xQXHrS0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E4k6SAWG45469WfJ4uQbrntiGqi+LBf7nNm+czMP8K6kgg0m2CLpPG3pQxZ2CoPcDlxL7Gdb1gaODt96RJkBl+97144RDD4MzrtjdMBNYCAJz8/uaoOR5j6mV0ZFkJtmLj7RxeMmZsV+n7/l8FgAy39IFn6IZU8c3heRjsHiwAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pJ5eHxFR; arc=fail smtp.client-ip=52.101.57.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pJ5eHxFR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uKZga5x28khBkAtuomP9/dLuW5/kOx0E7I6J7ceZPmIbsOspOxRITyGb7D4uNQwiT+neFJL1HF/jGfoqI0lbQ0ow/cNphM43ikyVDoAkyJDhubhWFetZvI9gUcIpQLuy3/8HirN+NcHJJ8GpPfI4zRnqEP+ASmDBAK24LngDscAT10RQAm5JHjuC31HInb4julddnvC79pHmhVcEu7ONsrjmc+l/Z+BR5xRENxwWsVRY9s8HP0zwuisTf0ENfpdSKjP0WMJ4VfCQpMTDplAouRmHFKm59CNtzCH/uHl56c+fZ2gI+51drCljXEa0LNtQPwZX9Uo41ZFRvhi66jhGbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DzTs6h7sjZ/bSkdNBgWSI8xKTaH6OKZc5g9NWaUr074=;
 b=fZPafU+M2cfZhhTld2XAoKjv068sruNmYHcD+ZT0H12ZLbMxQMgYOUmrcp95bwWl3hT6bWckP+hZ6UiQz4H6hMMps2e6mBcVUOjpjTU7gaNxsXG+GjkHECYqLq8q6waEiSEx+67ZOt0FqGvqOCM42jKF1mbNbmqSwRfzuUJQCodFkdpsBJYOAzogS7JwPokzrnft5sN13UQgot9b+QPhH9RbmyaTdCyDRwPInPOpdf0ChyFNo14NwqX+5uGYMYMcKINYRW5sCUw9L0sKwwj4/WXrmvmLUsG05yQfXxH1w4dbADLWvYoNGCG8awA9eb1QLszC9E9N1oz5F5rYxya1gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DzTs6h7sjZ/bSkdNBgWSI8xKTaH6OKZc5g9NWaUr074=;
 b=pJ5eHxFRugVNYgFYEyTv9ONLp5tcni/y9w30JKrgUtgpQDgWPce3GHs48ye/YbyHVZq1Gyz+p0UNghVnTZq9UOD8/jqNb+ufXHWAJULRHpSdPT54VnTHT5XcIF9xBRfxdWRTOaejvH9YUDxV65hCannQ6CO6xILWpm8MHDeLiGn6im9P84+//sjwed0+e9q6atP8Wzlb4CPhU64ASarhHXu5hTwEccLIsYeHaVqXUKx26k0kwMjV5LuASz/H0WIjeN09SdISKU1egPek+JbewwMGgv4JhuhVi0axqWA9m7FxUgwRGZQHt2vZeKO6a1AHDrEbittLfMYbbzQKWh0HCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by SAWPR12MB999140.namprd12.prod.outlook.com (2603:10b6:806:4e2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 07:51:29 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%6]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 07:51:29 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: linux-tegra@vger.kernel.org, Jiqi Li <lijq9@lenovo.com>
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, krzk@kernel.org, jonathanh@nvidia.com,
 thierry.reding@gmail.com, mpearson-lenovo@squebb.ca,
 Jiqi Li <lijq9@lenovo.com>
Subject:
 Re: [PATCH v4 2/2] arm64: tegra: Add Lenovo ThinkEdge SE70 device tree
Date: Fri, 31 Jul 2026 16:51:26 +0900
Message-ID: <LUpVYFLORmKcgYXsb8i_3A@nvidia.com>
In-Reply-To: <20260708092017.745545-3-lijq9@lenovo.com>
References:
 <20260708092017.745545-1-lijq9@lenovo.com>
 <20260708092017.745545-3-lijq9@lenovo.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY4P301CA0091.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37a::14) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|SAWPR12MB999140:EE_
X-MS-Office365-Filtering-Correlation-Id: 754992af-69f5-407b-6f7d-08deeed887ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|376014|366016|1800799024|6133799003|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	I2geHM2MDqtnp5D5t6fFjV4TmeqjtM9ddlGUDJeoSUXW3hlG0ky0ZgokMZeUR6hJGZp08zxacUIqTlXbubBuFxWgFybKVYdHxy5Sz9xpeb0WIrY7geIPFkYJ6wE9/GucTm6fni0N06EFjMf3rmPr6JaI3q9am0NAT2Wmy/K0mENUHCCQKmy7OHHtjgsMX0Vyqw5SlR9L3pP5h6r0obriwZyAIfyTqtAYT/7qJ+ntxf7qafTtSUUhpK0d137AasGp5M9zW/vvQQqws20ePYKZrdBT/5mMdj1kZaiOWdrG1DO6tBRhcH6X5rxZufLXCJaA1Uj/8/peFZoNZxRp4GGqpkdo2/Qhcz05pLcHnixu+6aOsWMFQNxs/D71VaamNvhVXXqHO/1UHjLiGbW4Ake9GO+zzTbQGTpLAaRL13DLbuON8k/tn9WDYvHgMoyjr3BBuuIYiad/zKTYu9dKFtg18N3PZH3Z/pWo+kcDEMeTAXNRjwg8bYUX/Dji5WkC6dxkXlLadJeRD9rtaE6tdrkvZP3Ix0W845bFPxvCgLJJcfkbK6cL8aUyo7yhqwcBdRFiT6Y4bhL4azcohcjVSvUzFa0P/99O/wQlsfoHTihk0uSi3Ou6DSgviuqlfZRPX1zD/aIXspjDYyrhgQg30BAsxVxh9GgVzSYYB9NAbNqNwsA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(376014)(366016)(1800799024)(6133799003)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?em8ydnVPcFFzVXBTRGNPOFFKNVJOMG9hUkxqalVNSnRGN1g3WHNDUEUxVGVM?=
 =?utf-8?B?eHJLNE0vZ2JYcjNQWjIvakVWZEUrWm5WWDlkN3RKdnpHdDM1QTdUOE50TXcv?=
 =?utf-8?B?ZHVtbmlqeUtRZ1hqOTFERmZxTCtmWHRrRGRSVzdjaTdOUUlKTUlyS1hlOUkw?=
 =?utf-8?B?MC9JUTl0aHhzdjNocFl5VzlEdEZsVFJZdUpNQjY2SDF1UzJ3WUxpSkJZOUIx?=
 =?utf-8?B?SmVPaHdRWjZSTEUvcS9naUloN1FtTmY0c2QxdUR1dlNnQW1Ea04yUDNuMm9D?=
 =?utf-8?B?VG1FOE9mM3JrVkIvbExPK29sY0tOWDlNTXIwMEFPN1ltYXAxU3NhZ3ZKSGxx?=
 =?utf-8?B?eWdOQWZBd2NFNWt5Nkt1Si9ydWZVdThUWkZHNWt2N0d3UWpINWQ5eVpUWnJ0?=
 =?utf-8?B?TEFmRERCbkZiQlduSlRoRGJoRXdGdzhtYmtYaE94TVVOL3ZJV1UzZXZtRkdC?=
 =?utf-8?B?U1phVkdGb0lsL3B2YTFSd05NaG5MWjlJSkw5YjdsRmN2NFBwNHdES29aNk15?=
 =?utf-8?B?OGdtYXhkS3hiY0ZmUVlSNEZPTFRlU3hUcEh6dlhVNTBiSTdscFZLNldpeldD?=
 =?utf-8?B?UXdESWtKWk9BNERRbVk4U3VlTjVNSlQ5SElwclhkVVJxa2tpQ3dDU0xxcHZV?=
 =?utf-8?B?cktkUFJ5eDVEM0RUWDVlVWFGaERTQ0Z6Snk2bEFJV2x4bE1uZ3Y4RnVKaVhO?=
 =?utf-8?B?LzY2bFhiUk9zK3JPVFlUODNZQnUvV0lTbmU5RlQrK05nYnZ4aElXbmpDakU4?=
 =?utf-8?B?SC8yY0JmNlI5N2cyazVtZTdMT1ViaUFaakUxdEtNend2Yzh0Znl4aTFmdXZx?=
 =?utf-8?B?aFhlNnNwSmV3b1ZJcVlMUENQakFacTVLMXNyNHRSQkVxUDM1OWxyLzZhTlpv?=
 =?utf-8?B?c1V3NDFmalBGRk5QU2hLVEc1S2Z1ekt6S1N2NzVQZXIwTE4rTjY2WDJiNnB6?=
 =?utf-8?B?TlNMdklEZktjYUNaVjk2OEFRT29qcGp2enBoMjFwdGRoSzZvUkdtT0QxSTJl?=
 =?utf-8?B?WEdGV3hESEVmOFhadDRrTU96RWRTTXY5T2JzNEQvTzhmZElrTXUyYkxrczla?=
 =?utf-8?B?VmtvK3ZhRFhIT0htclAvVVVDVVdERnQralNxSjU0RlA0ZXhYdHdJSENYclJS?=
 =?utf-8?B?OVg1ZkRRMjdSSThYdm81YWl6ZURGODR5MWN2OWYvZ3YxVnRZNFNjZFBuUW50?=
 =?utf-8?B?UzVZSlBhZklYS09PdTUvVzVXMnNySkN2TXIwY1RTdnNRRzc5RVRLYUJSeHBz?=
 =?utf-8?B?S0gySGdpeFhsMlBLVXN3a2J6ZDZZck9FY0lFMmorbllBNm9CcHp2MVIxa2Vu?=
 =?utf-8?B?MzRvcVpuMkZNK0ZnVXI1aXNDSFFHQUVsTnh6c2c4elY5UGtJSjFvc3dEWFc1?=
 =?utf-8?B?UXU0aFNsYncramlXWWMzTFI5dkQ5RlMrNFR3MFp5STd6WGpBdnlxRFlhVHRD?=
 =?utf-8?B?bU9NY1hwR2czV25NOWREa2FlWDJhTkU2a0VMRTJaYjJLWTMzVWFVMU1rQzZk?=
 =?utf-8?B?THMzT3lUUGVZbWpNM3BGSE1PWENQVkNLMVpianVTeEtuZlYxcS9kVUp1azZw?=
 =?utf-8?B?MEFxZkYzTWt0SXFpZUR5M1pXdFZXcHBsK2x3NUVGL0JHWHY5WHRmRFpCSkJD?=
 =?utf-8?B?WTViN0xxMGpsWlZXQWU5emR2U0J6YW5IcThaYlFXVmJqc2RiMVE4WitUMFZV?=
 =?utf-8?B?dG1jUGdnUjNxcmYzWFJJeHQ1dzRxU1JLS25JbXczSTRDbis4Q0hGdUpWaEUr?=
 =?utf-8?B?bys0ZDdlQTBjaGRxN2NmdFByNTI1RnNPelBBSzgrSGtLZTUrZHVWRVc4MWR3?=
 =?utf-8?B?cStWY3BQaERzTnZSYUZtTWV6S25GcXJOSkZoRTVERDg0ekJyUU4wdWI4MFhN?=
 =?utf-8?B?elgrWC80S1ZSR2g0eVlqWVFCOW94WWhMUXQyQms2VGZyZWpXSVFCam41bHRt?=
 =?utf-8?B?NWNWdmtQS1kvNjNSb1ZhU3NMUTZWNUV0TzBEK0FyVXJ0STZKYURBZEQzendq?=
 =?utf-8?B?bWVLci9NUU0yajIxNlcvL0FOeTQ2a2xLcjFPRHlXdzVtcVVrN0ZCa01FQ1Zv?=
 =?utf-8?B?dzJDQllDVmEwY0g2VzNueUMzODhwbXEweFZrL21tUldQNG9BM1A5YXlTeDAr?=
 =?utf-8?B?YktUSEFOd01YVlhlTHI0L09YYlJZSlB5eTBZZTVCeGhYKy9halFsUnRYd04w?=
 =?utf-8?B?L2dEKzVjWThiVmhnZjM3c2JPKzZLSmdBTjZrTHVzaHpSUTRRNTlJODBoSnNF?=
 =?utf-8?B?VlZGRk1QbklYbkV2cS9tWThHZGJldG84VExCZjRnRXdlcmJ6MERVRHNrYlNN?=
 =?utf-8?B?UkE5WVpyMVZoUUFBNnZpZDRUb1krZ01FVFAxaW9wNVk4QVlYNEZDQ0tyT0RG?=
 =?utf-8?Q?JS6Htrcy70me9aYMMqffFnzdxjsMeBmlr+VgIkhG/tx3s?=
X-MS-Exchange-AntiSpam-MessageData-1: kzeukh2qXclAuw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 754992af-69f5-407b-6f7d-08deeed887ed
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 07:51:29.6967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FkeCqvy9cl4CkAKFepDs4/XgLHBBPNWRzgts5OdGXpWxRviC+gUju5a2xLcIqCco/3FE9jq+gZaoLxtgR6TndQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR12MB999140

On Wednesday, July 8, 2026 6:20=E2=80=AFPM Jiqi Li wrote:
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
>=20
> Changes in v4:
> - Rename regulator node from regulator-sd-3v3 to regulator-vdd-3v3-sd
>   to follow the naming convention (requested by Mikko).
> - Move regulator nodes to the bottom of the file and order
>   alphabetically.
> - Keep vdd_5v0_sys as it is referenced by USB and PMIC nodes in the
>   SoC and SOM layers (required for compilation).
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
> index 000000000000..02ac645a7784
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

Unnecessary: the P3668-0001 dtsi already includes this.

> +
> +	bus@0 {
> +		/* 40-pin expansion header custom pinmux configuration */
> +		pinmux@2430000 {
> +			status =3D "okay";

The pinmux node is already enabled.

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

This is also already enabled.=20

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

Perhaps you want to add an mmc1 alias for this in /aliases.

> +	};
> +
> +	/* Fixed 3.3V power supply regulator for external Micro SD slot */
> +	vdd_3v3_sd: regulator-vdd-3v3-sd {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "VDD_3V3_SD";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		gpio =3D <&gpio TEGRA194_MAIN_GPIO(Q, 5) GPIO_ACTIVE_HIGH>;
> +		regulator-boot-on;
> +		enable-active-high;
> +	};
> +
> +	/* System 5V main supply, referenced by SOM and USB nodes */
> +	vdd_5v0_sys: regulator-vdd-5v0-sys {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "VDD_5V_SYS";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +};
> --=20
> 2.43.0
>=20
>=20

So some nits, but overall:

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>

Thank you!



