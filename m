Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011039.outbound.protection.outlook.com [40.107.208.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B75394E91;
	Mon, 29 Jun 2026 06:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782713629; cv=fail; b=gYjNbLkwiM6AOgRKXii17lZkqDnSNYjw6ShKPiT9/Qs+AjITDUmbCWapKRRiadzHCg/KW+WDc6Bvq/iyUqdzy35RwqRQvTUohT2lVG7Ob5WJCCVm7m0TAdEbJ1ZNVmzVAAaY73aDiLyRYJxbcKAfvsoKhBikjsX1IwNVlVYRvxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782713629; c=relaxed/simple;
	bh=1bDFjsXssCkqLzIGNOWQq1oPp6XD0DT6Lx1Y166QUM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TLMUI/FsW+8BESUZAIeb2yq3fptwEl8LsqvtTlhSIwJ8rQNqQJNsVtC6iuGrpyczDY0myKp2duvLj/61Mi4EbAzUWU3F3o4ZaMHcGAQhu8uAd/EAdh03+H1j9phfd36pRw+UUNslrR/uHfJRboWSCxsZR5KwSqxHkkicFOFJG/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=aror4lL4; arc=fail smtp.client-ip=40.107.208.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="aror4lL4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cXxncENI3AayvzVZr04tJ3hVBdTOc+dMltBeN1/6wZxpCsbKM2kONgjB61J1OqH8JNqbznDRpPu3Px0kRPVe8tcTb1p8sZ8aE7tvMuLBfwUKbrp2UudtvS1pSal7zEbo81/8DDuRuuujpAWCENJFTKfK30ddudA07/5tADK2OfO0ufgeQb0UEkyZKF4gf5/YsSbwwuFTRqYsDSLFueBxa11hkpCice5wz3gOK3gS/5X7A3Mhyr3Xbme3hFY6wPcME9mo99qQtSn6priEajE2wl3zKngsgqZHdrFOe56r7PreSTUjP8ylZngmky7MdiKbiNiwu8Ow70muZEVjY6fV3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2U2p4tQXAfPmcwFGg4xovrsXyfVouUYkzgg//68tWd4=;
 b=wchroGWafxjSdI/oifhG8SC9Z9Y3ls9F5Nd4XbkZvBjI+5rErwr7EEwW9Vn3t34064GYMtuRH+7mOtjfO0tW2c6QFUAj3urg8aoYlbty65KEoELtS7JLNCnwcL84Wmzu2n6R0oo9MrjzcTiXQJuf5lP81UXQ+AZPnHNJN/BHc8+xoSBxtSBszRe1z+wXcvJ5yRNHSOfUIa7qOrSyMRgaqCCOCy21qk+vjkCnmYijmNB7i7mmu7FibNQE0OBXu5N2Du2vH4ZtRh0ufrsmRgsmvI4OAZrV+Scef9XcO70v9Eq1oOp6/W2DaNAayGpi5IeJJ7yUVE6fXVHnAJYbBZlHYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2U2p4tQXAfPmcwFGg4xovrsXyfVouUYkzgg//68tWd4=;
 b=aror4lL4xO0/2w91g2/Ab+4/S3lm/wi6FO10HDUfe9vfiVDcLwAPfFz5BSsHpdVjA9xAWL13cHWRKtH1rB421E4Mdj6mbyHYBwonW4MWHXfkJXSSoqFtEK9QX64oWOVgecEbl7EqqO3SArtfoydv8GuS2x3V2aopsoFTNErgVMgD+SYA3vL8sFSavDeK/gJBuPs6kVWsMPjeX4egKXTcc3sTF8BNmUkTtPS1r83DBw2OBpPxfoTFSFdD4PJaE+8g/e5MQ4qDbBgFLTtRxaTckveqL4bjVqbNWcNhjW6cCxgHKYiZu7G029x3wIbA5Vv+EmSkVMkHJB34opiiUqBgqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by CY3PR12MB9630.namprd12.prod.outlook.com (2603:10b6:930:101::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 06:13:44 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%6]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 06:13:44 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: linux-tegra@vger.kernel.org, Jiqi Li <lijq9@lenovo.com>
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com,
 mpearson-lenovo@squebb.ca, Jiqi Li <lijq9@lenovo.com>
Subject:
 Re: [PATCH 2/2] arm64: tegra: Add Lenovo ThinkEdge SE70 carrier board DTS
Date: Mon, 29 Jun 2026 15:13:40 +0900
Message-ID: <XXX946K0Q5e-8PlN1f_iEQ@nvidia.com>
In-Reply-To: <20260628124318.627393-3-lijq9@lenovo.com>
References:
 <20260628124318.627393-1-lijq9@lenovo.com>
 <20260628124318.627393-3-lijq9@lenovo.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY4P301CA0069.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::6) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|CY3PR12MB9630:EE_
X-MS-Office365-Filtering-Correlation-Id: b7c9f4b4-6b40-47ce-322c-08ded5a592ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|3023799007|6133799003|4143699003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	9WFbmY1QykryBfdFJht8Nq4sxTwThZc8aDuMqVIGrfspj9+qFA/475hWXNUtHJ6EBWXd5ujqfWYwBc6t61XJeatPVNRNxbZ2q0iH4G9mkyydmlCK664VK2QF8TezQ7exHrosS03hOYz+/p67hd0glcxBXKZ6CBlOPL7v8o26PQ/mrnYx+15tAIVEpyRXUavLe4PMrgCMaLvHZ/lcDTI3uqM7lwS6ieo/0ArCBrRWM1CelYMWyZ8s2eqEFLevuns66bh1LDNW8D6eqafFvJ3ympvDrVmp9gT5xxEwHC4zMoQVjwBxtVK2sWj70UpICIyRmYDs76o+2iglTDr5mofACU/FyNrjTunCJLMq56b1zTFavdBnWOBoq/2iUwKm9TkstXVekBiY2dhUtIOAgdgBrIenRJ6CV7V3noz90Eqlhe+ZgYZGx+2/dGxkT9QMk/73NakM2CDxVxuAn4S2Xlhug+QeUn+QKjUhdVU/pQ+N/BALhKU4A0pyK4PIDQHMMsfy8LwMbPrly7dMaDuSB+9l+VrfqgBp2bFvWr8o2PvZRJGFXbGaSwBH9dwWZ2cdDU1t06Q9vVf2RYpqiORP4DdNUriQk0mx3M8TwO9ODV1xCS3F4FVGrxJOWyWV7tWDUVMHV9HhRU4xzjnUZ8RXptkj9OJ+mk+6kEINvCyEEeokKU8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(3023799007)(6133799003)(4143699003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlpVOFBWckdHY3UzTnUzNHBFUzZ4cGFUdng0elFNTm9ESGFJZWhvOGhOZ2o0?=
 =?utf-8?B?eDZ4SEZnZ2NXWHpEc1ZhcjZJU1greTl4ZGo2RmJLVTN1Z3cxZWV6aDZQMlk4?=
 =?utf-8?B?MUlIZjdGb2N3UWR6cTVYeXRvTVJxOEdIa3BzZU1ENThtM2YrVEIrNE56WThp?=
 =?utf-8?B?ZDNvTkgxejhaeHBvMUN1UDd4UGltUHRBTDFaOTRMR1cyZW5UVlhhNURwNzA2?=
 =?utf-8?B?TWJPdHVlREI5d1NiR2lpaFdzemhJTkN2R1FrSnM4d0tRVVErNGFINnAvUElu?=
 =?utf-8?B?dGJQOWdRcWYxUEZkVE5UbjFDbHpxMDRLNHE1cDE3eTJVaWJpS3NtdEUvb0R1?=
 =?utf-8?B?RVBBTDNOcGxoWWt4YzBWWVp3TGFseTFqb2VwbzFNeEVKd0RTa3ZrWjcyTTBk?=
 =?utf-8?B?cFVrQjF2dTlKQjRkNi9RdFhXSzcyQy9mNFF5OUxYeEszTU54QnVEc09WUUlO?=
 =?utf-8?B?VjRucHU4dXZFSEk0U2dEcHR3SHdBR2NQQ005RXNXTjBadHlXK01zQmdqMlEr?=
 =?utf-8?B?bjR5ZCtDRmlRRS9PeFlHTjliVi9ra1hZdys4dFY4Znk2TzRaOWtoMzF2VTBF?=
 =?utf-8?B?Y3F6MnIxQ0VWb1RPQ2ZMWTgxenRlZzNhaWFncDg0OStmOWU3WW10LytxNy8x?=
 =?utf-8?B?Z2tmbFlxYVJKYWtvWlAvemVUUGR1aURSbGlqM0FVbTk0WW43TkRPSVBhZmlK?=
 =?utf-8?B?bTFMQy94cW02R1NBWUlpU0pmSGpmQkpqb1o1OERrcDlzS29ycmVCaDFhSlBn?=
 =?utf-8?B?MC8vd0ZKdCtJZnhSeEhtOVRiRklUTWFwMzZ0clJGNThTZnNaM0ZubW5JMUNT?=
 =?utf-8?B?V0VqSDYwVGZiNVMzYTVGenJZR05vbk44Yk1GVEhHaWtMeWc0dEo2RzZ3OUg3?=
 =?utf-8?B?eCtQQXUyKzRJblR4NU84aG9LNkZaSk5Jb3FrQW1US2t5T21hWCtiNGVpdFRF?=
 =?utf-8?B?Mk1zMzA5WTd3SG1tNjhrWE9pWXFmZi9ROEZ0cWlvZGVnT1lOQmVBRllUNFZs?=
 =?utf-8?B?SmhlZkQxTnBmODBtR0U3QkRWT2JydHo4QWF1UE9kaWxSQ1dhSjUzWnZFd3pw?=
 =?utf-8?B?c3p3cjQ2VEhxWnN6Mng1bXkrV1JEZWx0MXB0SUp6RmgycDJVMTZHaHRCZGxW?=
 =?utf-8?B?aG1BTkErL1RBUHQzVk9NRXZJaHhvZ3hZUGdKMFNCRXROT0lZL1Rqb1lNRC9M?=
 =?utf-8?B?RHNEdS80YlNjd1Z0L3E5end6YnpDVWlNc3VhcWpPcW12RlVLWE45YVJjaFF1?=
 =?utf-8?B?ZHQwd282VFR0UUZieWFEeVZoM0YxcUtlVVA3dHJpM0kzNzdMTkhjd3A2VFVO?=
 =?utf-8?B?dWZuWFdEb2hUQzZlOWVmNmpRVzhseExiL3B2MDF3M1h0eUNVZlNnak1aU3h4?=
 =?utf-8?B?STl3ejQzL0psSEtDWEozSUx5YzBkUlYyYVo2Sk8zczRjWXI0MG9UdWlJQSt6?=
 =?utf-8?B?dmNXZDZ6STBzVDI2OFRCUHhBaldZZGsrRlQ3Z01lbyt0K0hQZGt0WVo1UlM5?=
 =?utf-8?B?THBNeFVONXpleW41VWc1MWNaem80QldReHhoMk5QeU5ETTl3bU5XRzlDZjBv?=
 =?utf-8?B?N3pDLzBUNzc5R1lMR0tSRjFTM1dNdlF4MHVGR2tUOTlBbmtqbGhMOEN0M3BG?=
 =?utf-8?B?c2I1S1lrWW9QZU9PemY0RmJRaW9hMFFpQXk3UWRvZkIyc0xYQy9uUmZuYVNu?=
 =?utf-8?B?WXZsMGd4NG41SVBpVXVTVUVxM1AyM3pTeXJNc2MycVlQTG9zT096MU56NDdH?=
 =?utf-8?B?dlc0b1FYaU9hMklzUHBHNHNIajVzRFZlQVVFVUVBYkZlalBiZDgxd3o3dHFw?=
 =?utf-8?B?TUtqMEp5ODUrSStVQ2RvUHc2NEJ0dUROZXNFbDNjUS9tbjYrcW5JWG16bGlL?=
 =?utf-8?B?cER3TU5tTjI3UUdpZFY3UU0vL3RpSi9UR1NhQ016SzFDcHprTFo1U3EyVTRh?=
 =?utf-8?B?WG1WdzFKaXMzK01Gem4vNEVSNWtZamxRalYybWorSVF2Znl6UHRONHJBNjJz?=
 =?utf-8?B?QlJhZjZ5ZE5GeXQ2QkVBekFkckl5MzhuU04xZjRVeDByNWdmQmgydzhWZnJl?=
 =?utf-8?B?UFJNV0FpL1Y3VjQ1QkwzUllrQUdkc0M3cXpFVXVmRFloZUQ1TnhhOXg2SmxP?=
 =?utf-8?B?YkllSXlvNXNGK3F1SVl5dnQzejlpamp4S3ZkWmJwVHJRdlZ1SDNFMno3SFpm?=
 =?utf-8?B?SEhWcEVJQk8rT0JUaTllaitsZjRrL1hGd2U5RzExNURad0NnYlloczR2VnVT?=
 =?utf-8?B?UmQ1K0R0WG1kR0JpbTA4MHZzQ29CMjNiV0ZsZXlKTVY0WjQzS2VIQ2JvQk1P?=
 =?utf-8?B?YTd2QkRNVHhTdkRhKzJCS1YySTFXaWF6YlRobFJ3ZFZ6SnBmWWQ2Zz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7c9f4b4-6b40-47ce-322c-08ded5a592ec
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 06:13:44.6854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G4wiV6cHEdI612HAqC9XP/SgShVPN3iVMHhLVq++vqAL+HBhAzTWrmRWFzrIjB7MISw/9yWYjMxH18jxs0WJsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9630

On Sunday, June 28, 2026 9:43=E2=80=AFPM Jiqi Li wrote:
> ThinkEdge SE70 is a fanless industrial edge gateway built around
> NVIDIA Tegra194 Xavier NX SOM. This patch adds a standalone device
> tree file describing core carrier board peripherals:
> - Custom 40-pin header pinmux configuration
> - External SD card slot with dedicated 3.3V fixed regulator
>=20
> Unpopulated PWM and fan peripherals are explicitly disabled
> per hardware layout, following mainline device tree best practices.
>=20
> Static verification passed: dt_binding_check and dtbs compilation
> complete without errors.
>=20
> Signed-off-by: Jiqi Li <lijq9@lenovo.com>
> ---
> Changes in v2:
> - Refactor peripheral layout under root bus@0
> - Fix regulator label hyphen naming issue
> - Drop downstream-only nvidia,lpdr pinmux property
> - Fix SD card detect GPIO polarity, remove cd-inverted
> Changes in v3:
> - Reorganize all pin configurations under native pinmux@2430000 node
> - Rename sdhci@3440000 to mmc@3440000 to match upstream node naming
> - Move pwm-fan disable override to root level
> - Remove redundant disabled overrides for non-existent peripherals
> - Drop unused #address-cells / #size-cells properties from regulator wrap=
per
> - Extend root compatible string to triple board+SOM+SoC format
> Changes in v4:
> - Fix pinctrl subnode naming to satisfy tegra194 pinmux schema regex
> - Rework SD 3.3V regulator: remove invalid simple-bus wrapper, align nami=
ng
>   with official P3668 DTSI and add regulator-boot-on property
> - Add required MMC properties: bus-width =3D <4>, disable-wp, no-1-8-v
> - Remove incorrect spi@3270000 disable override, retain QSPI for SOM boot=
 flash
> - Correct commit message wording to remove reference to disabled SPI
> - Resolve all remaining Sashiko static device tree violations
> ---
>  arch/arm64/boot/dts/nvidia/Makefile           |   1 +
>  .../nvidia/tegra194-lenovo-thinkedge-se70.dts | 125 ++++++++++++++++++
>  2 files changed, 126 insertions(+)
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
> index 000000000000..969ea1783bbd
> --- /dev/null
> +++ b/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts
> @@ -0,0 +1,125 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/dts-v1/;
> +
> +#include "tegra194-p3668-0001.dtsi"
> +#include "tegra194-p3509-0000.dtsi"

Based on your description, this platform uses the Xavier NX module
w/ eMMC (P3668-0001), but a custom carrier board. P3509 is the Jetson
Xavier NX carrier board, so you should add a new baseboard device tree
file. This will also avoid the need to disable nodes that don't exist
on your baseboard.

Best regards
Mikko

> +
> +/ {
> +	model =3D "Lenovo ThinkEdge SE70";
> +	compatible =3D "lenovo,thinkedge-se70", "nvidia,p3509-0000+p3668-0001",=
 "nvidia,tegra194";
> +
> +	chosen {
> +		bootargs =3D "console=3DttyTCU0,115200";
> +	};
> +
> +	/* Fixed 3.3V regulator for external SD card slot */
> +	vdd_3v3_sd: regulator-sd-3v3 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "VDD_3V3_SD";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		gpio =3D <&gpio TEGRA194_MAIN_GPIO(Q, 5) GPIO_ACTIVE_HIGH>;
> +		regulator-boot-on;
> +		enable-active-high;
> +		status =3D "okay";
> +	};
> +
> +	bus@0 {
> +
> +		/* Custom pinmux configurations for 40-pin expansion header */
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
> +		/* SDMMC3 for external user SD card slot with dedicated 3.3V power */
> +		mmc@3440000 {
> +			bus-width =3D <4>;
> +			cd-gpios =3D <&gpio_aon TEGRA194_AON_GPIO(CC, 4) GPIO_ACTIVE_HIGH>;
> +			disable-wp;
> +			no-1-8-v;
> +			vmmc-supply =3D <&vdd_3v3_sd>;
> +			status =3D "okay";
> +		};
> +
> +		pwm@c340000 {
> +			status =3D "disabled";
> +		};
> +		pwm@3280000 {
> +			status =3D "disabled";
> +		};
> +		pwm@32c0000 {
> +			status =3D "disabled";
> +		};
> +		pwm@32d0000 {
> +			status =3D "disabled";
> +		};
> +		pwm@32f0000 {
> +			status =3D "disabled";
> +		};
> +	};
> +
> +	/* Disable fan hardware not populated on SE70 carrier board */
> +	pwm-fan {
> +		status =3D "disabled";
> +	};
> +};
> --=20
> 2.43.0
>=20
>=20




