Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011011.outbound.protection.outlook.com [52.101.62.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A06D37107E;
	Thu, 23 Jul 2026 04:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784779750; cv=fail; b=UrGc1PhxaukELO8tir1ENijrWxIG4fHRzQI878dwaYjMzYjkEkaarPxtElbX2XP2rdJ8Te1WnMnY7KHU0hY8CkF80KJT1marD2DoryEDhRti5dYROXnVXX7qwll3h3ifv9DlmkaGBrYeKlz7yr2ElvQtkb8NuaMGUcYxeyID8vk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784779750; c=relaxed/simple;
	bh=j2gBmIQYPHwAQzvH5j48PdzCEmbqF2zHdAcwokoiq4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=auLtX2z78y256Gmyy7/DGR5ImF4L7pbk94L6EeYz83adipKnSEcGcPdA8VXNmaE/E9dc4sCYo3UzqksL6sqs/+DqANe88U4O8llE+LCJ55FJElUllTg0uhNDtUNp5FHFcPjl8rw8NavJMMRsS7HRz+BxcA912rhBC51mtniFxFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FbP5127V; arc=fail smtp.client-ip=52.101.62.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FbP5127V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F5CDBvcf6R8UArFytNMB1XUs8AGRhnwEEy2yNBNQrjZyc9lYta9uMFD61rHDSPnyrQ7J6nkPZVklEWEemHf43yBgmwig8NYaV2y+500vjRU6HdWUnN44u6hDDIWlViJsZ50zProU4xlhiT9NRnBjiOuErz93yDmlvuB99h96MmwUIlE5j1XL2+XfrLGegu5MpoI0ZD6IDIfiDdo624OQLVpRgPjF3s7U87/h3lZOj1RiYvTRMJQq5JrUQktUufaWQptMO9yoRiqTptIpQN7UWqfDUdHZHKVbxUuU4LDuQ3i92QLRulvbG4dRV/P3tOcNDClw0yulmd5ilIWQ0dTPCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LiT3qkMTBE7x1w8nSFHx6MNR/W7ypFEzQcJf1DcxHK0=;
 b=WWbOSoNBxCCPGGwJD8sfHu0Lts3l8qfh9pr6co75Jd8h/78XfC/yD5rBxgw28WseBfsG5GSh3Mjfi8n+Nu4vtViqIwVmkws4zvu6JPDeS+p4f9Hz5gzNNbFdm9u3MYeadazr/YuHuWA+zwORLmap/3VwOhC+/P71yLvl4xjRRNv2TQAGGuZfGTvSJfh2/9/FDvMC3JTftz3rmyWtlgoo1HAMvtCh2mrvlk8gRhdd8iOdrS2/Z3jHpNf/HmD/2JLbx9BYFkjo4uBNA9j0YEU6bFbPeaZ36sR+JbaXVd6dF3k19aWF4+q4gUUKg2fbrC2h9X9ja8B4CxNzLi671bV4Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LiT3qkMTBE7x1w8nSFHx6MNR/W7ypFEzQcJf1DcxHK0=;
 b=FbP5127VyyOI5s7EDQzVoeK628E3+U+9ok1WFXUh7oVuTc1z0ZCdbHZdFGBUh0ne6PbK1xD1WWwEXZ9vxW8ImfOWRapEqFGF+UI2d/pF9jUE/MLI6J3D04vRzC4k7Emqime7COoQwgJVxW3xjQRcGovDsY7jTigKOHV5foasvtO3gGLi+lLqTPjmHiw69dhBJS7xfR5Nho3AE8rdMAoBWXOIrHy1tgeI+dMXjyU2IvNieDb/0wMcZWO4mIDerLt9pOdYfKubxz78KIF3BAacFX2HJpE6rae9Tc6RVjVYhtKNf9Pe5UoxBsmQx8itV6r/oXjG0aD0qIjxw/0M+83Yww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by SJ2PR12MB7961.namprd12.prod.outlook.com (2603:10b6:a03:4c0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 04:08:43 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%6]) with mapi id 15.21.0223.017; Thu, 23 Jul 2026
 04:08:43 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, webgeek1234@gmail.com
Cc: Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 Aaron Kling <webgeek1234@gmail.com>,
 Alexandre Hamamdjian <azkali.limited@gmail.com>,
 Thomas Makin <halorocker89@gmail.com>
Subject: Re: [PATCH v3 2/2] soc/tegra: pmc: Add Tegra210B01 support
Date: Thu, 23 Jul 2026 13:08:34 +0900
Message-ID: <DuGKqNifQkiWC5s_qt8g7Q@nvidia.com>
In-Reply-To: <20260722-t210b01-pmc-v3-2-1c5b970788f2@gmail.com>
References:
 <20260722-t210b01-pmc-v3-0-1c5b970788f2@gmail.com>
 <20260722-t210b01-pmc-v3-2-1c5b970788f2@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: OS7PR01CA0055.jpnprd01.prod.outlook.com
 (2603:1096:604:254::12) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|SJ2PR12MB7961:EE_
X-MS-Office365-Filtering-Correlation-Id: 067aa3a7-ac2a-407e-fe33-08dee8701583
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|10070799003|22082099003|18002099003|3023799007|10067099003|56012099006|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info:
	WnxPCFkNi1JG+YMPG2ZdnV8bBAAZl4x1+oVrmPlfDGYPepdy4QzWZ6oniJhkaNP+rG/BEHFM/78XnEoR5YR4/etUslCBV6rEgBIahT3MvXdDXqM1ZfWFjvdmaVSR/QLfYP9X08pSUaGI66I+v0VLmZiL3VRNtoFrpf9KZ2NFUeU7BRFVGmUq4r0WbiGshsM1lAgYMF93l1w2uo+Pv9OmfYgT/IMgzTUR7W41HvVHY4GnR0uyf5DcKZSuuKmhDAlOjHysa/QSVG1vUeQUntxbrpQmEtbupM8nsUf02q/VWggbVcsoZ+pRxpJ/8FWZk7BXQT4CUouEH9u0x5hu9Tv0FeksSXIp67sRPGLpQA/6A8ugEh8WSz6cfhIPmIFwfEINf4en2n41TUSoCaIoqN20eKLWwYthrh9W3Hy3S+Y35G09uzlr3eAEqOjawjH9Tqd1HQTmEsFbUDGzuWfEGD96A9HIKtNRn6CxUZ+i0G51y3wxBx0Uq8irGlJCTdkaS+IM8fuxAHrgdlwb5umuN0Cf+UgCTx4iM1XJVt3Q+VW0qlXrYcm96n8hU3nc7B8+gxSJj3B1G4qDhH1LYT2dP74rpt3IJqb85n3MkCR8unRtoUAKcxtXY+nhycjs9tB4v6qYyedLfTPJKc2RHvvHj2wTauQ9A7D0yywOwu/cBXVirYk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(10070799003)(22082099003)(18002099003)(3023799007)(10067099003)(56012099006)(11063799006)(4143699003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3FQNis2LytXSDkyOGVLTUZTN1l3b1VvZlFYWk5GTHR2d1Y5cWlocHN6LzhF?=
 =?utf-8?B?MEZuRytTd3g3ZnpSVjhBTEJsWUZXWTc1M1FNcWxLZEtja2k0b1FPQWRzTzJG?=
 =?utf-8?B?dHRVUHJFNGp0R1pHWW0zLy8zMDk2aEYwMUN1VlZoWnAxSURoZlI4RmoweUpK?=
 =?utf-8?B?clJWdmpNcC9BZVZlU2tZUHdZNFVkT0MxbVlYczNaR1hKV3VCT3lYTWJZZ0Yr?=
 =?utf-8?B?WG5ESC91dnVJWS9JSFpFZkFvS1k5eHNSVXZORjNGMmRLR3JkeFFJT2ZRVGl4?=
 =?utf-8?B?ZDR0cXZKYWxVRVZTbDVaeHpJYnA1Kzc2bnpPaXZDRlUydVd1WGFGNWdGVWJo?=
 =?utf-8?B?R01OQVlnUG1VUitFWjhGdlR3RU43SFBUeUV6WXV2R2dOSjAwUFdldGt5S3F0?=
 =?utf-8?B?OXgzeXE2bVM1WDJtOWNVZlI2dEFxY0FqU01KY0xTWGNVdWhMRUFvUmo5V2ow?=
 =?utf-8?B?djJJcm41enNIWk5xYlBjTzJPbmpSWkVBTHE1TllhL01SWlRzQ1F4OTZRd3RB?=
 =?utf-8?B?aU1SNWt2d1ZXbkRheDVtY3d6WnpYemJmYk1tMjJCc2c3eXZoazJuZkEzSWg1?=
 =?utf-8?B?c3k0OVNrSWpOU1dPK2hSS3c3WlBZR3huQ0dtemFZUDBKemZYMjB3elY5ajJM?=
 =?utf-8?B?Mlp0VkIyUHV2V0VOSURjMUFQZlc1NldlTFhuWEl4clN4eWdocWZhcHZtNHBw?=
 =?utf-8?B?c2trcERjamxQUXlPbUJNSDJ6REFucm9TZkxCcU9iZkcybGlqMDNacmlRWTJK?=
 =?utf-8?B?aHpWOHdjSDR2ZUdzcy90eGtmRG13Z1hsNnhudHRhRmNHMmxBRGdEZXNEaVk5?=
 =?utf-8?B?ck14WENldEd3TVJWV3FENXNVTkEvRUYxZXIrSEhsaXE0bkxuNDhlKysvZDc2?=
 =?utf-8?B?UVV0dTFXSTdYOTVuT044TmJNeWlvVTVBMWpIY05idW5oL0srM2paVENvQkIr?=
 =?utf-8?B?SG1qNTZIeXN3aElSM2pwZ1Y1eWJpTnlXaW90clRPaTlLMXlYMk5zS05wN3ky?=
 =?utf-8?B?WmtZKy8yR2FFVEpEdWh6R3RRWHZCZUNFSytSRi9TQjNSamVBYVF3SWZSVEdR?=
 =?utf-8?B?UitMMkRxMlJxdzFrT1A0VVZ6NlZGdE8rQ1BQanhTSkQ1UWcwN3FPUGFqRGs3?=
 =?utf-8?B?RXBQZkpMNDJMTm9zWXV1YW0veS9tVGlOeWNJblU5Y3p4WFYrM1c5K3UvejVQ?=
 =?utf-8?B?QmpRaTliazVjdFZwbzFxcFhUR1ZwL0ptTlZobXdYTHArMlAzR2w0SjBnUStF?=
 =?utf-8?B?OEJPcjFWeWNNY2p4YkJzSmR0WUZIWU1Tbi90TmRoa1R4S1RtZmVpQVhyNDk4?=
 =?utf-8?B?a3VXTThTUDlKUkw1MjFvUFE2Mm55UGVMQm9rSEI4aWlUbFlSTytkQnNPWldp?=
 =?utf-8?B?WjhlUHJQWjE1a0tHa0lPdzUzWWZvaW5iREVuM05aWCtVeml5SUprQlJVbHdz?=
 =?utf-8?B?U3RURFJ4ckZ3YVdDOXpReTVId0JVQXVsSUlyeVdmRU54S0ZHY25hL01GdzFQ?=
 =?utf-8?B?U1FPbGFJWnNCVENyM0pMNTRhZllXWUdJSEUvemIveitMQ1Nyd0pQOTI3SE9z?=
 =?utf-8?B?UDNsVVhoUkVDa0ViWE9nMjdRMFFFeFN1ZWlMTmNxdTdhMUlHWHNzTzhUMlZo?=
 =?utf-8?B?M0lxK3k2TFFwU1gvVWJkOWFDLzhiMjEzUjlSbm5nYlhQUUhIbmsxMDRCZ3Bw?=
 =?utf-8?B?cEFRVk9GQk1CZGp1QnBzdGJ3eVJRYVBaaWZrdlJHVUlYMCtZbXdTWDJadnBz?=
 =?utf-8?B?d2VPSWw0NDBCb2NPMnVONDhITTVmaHVxUWhUMVRvMk9JOHdkSUdEalVRcCtk?=
 =?utf-8?B?bDZMQjROaElVU2pHTmwyVmUvOFB4MWZ6NEl2dkFRQ1BHS21xblgvMHRtd1Zu?=
 =?utf-8?B?TFlHaDhWQ21JZVdEL1hSUk9ONjQ0bmVlWUdqYzE3OWx4b2Rqd1NJREZ6WGtl?=
 =?utf-8?B?bjlzYjBmNkRZeEEvQXRldGhPNC9PckhGSW55UisyQlBXUFc4bWtjVGM1ZktF?=
 =?utf-8?B?Y2tRZVRPeWtWbHhTY3l3SFVIZVdNNHljZEY3VDBmVXRLZ3loUnlUSC81NzJN?=
 =?utf-8?B?RlVzblVoMjZRNjZhVlBNbDJ0U3gyckRzUmQvcUlWWHRqWU10K2RtRVExRTl5?=
 =?utf-8?B?R2VHcGk3SXFEcjlJazdreUJxM1ppeVZqSUZjT2xZbEVSLzZuQmcrSCtJbjk4?=
 =?utf-8?B?VzQranFkS3BLWHlmR0ljczVMME4wdndXVVMxVUJDd0thaUx1azRJUndPNGpQ?=
 =?utf-8?B?amUvSHdkc3VOditSb29weDVHZGxmK3VsYUJhNDZtNmM3VEZiVTdrQ3hPR0dP?=
 =?utf-8?B?MmJnU2tiMW1Yak1ENndVOGhRM1laV202Z1Q0dHovcklualBaMnFxTlJDVWg2?=
 =?utf-8?Q?Se+isV2X50E0gO2Q1+a1PIQc3Ua/norkeCg7S29Kqs5PE?=
X-MS-Exchange-AntiSpam-MessageData-1: cg4fGQHdTM3zbQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 067aa3a7-ac2a-407e-fe33-08dee8701583
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 04:08:43.0742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qIi8d3D9hgEHK7JDkCwrHncHDGND9ip18mSB+tax650gGtaLqQIxMcK+7uZrs9coqq3wRAvav6Tu9MNzKsSGKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7961

On Thursday, July 23, 2026 11:46=E2=80=AFAM Aaron Kling via B4 Relay wrote:
> From: Alexandre Hamamdjian <azkali.limited@gmail.com>
>=20
> The PMC in Tegra210B01 is very similar to the one in the original
> Tegra210, but has a few powergate differences. Specifically sata, venc,

I believe VENC does exist on T210B01.

Aside that,

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>

> and ve2 are removed.
>=20
> Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
> Co-developed-by: Thomas Makin <halorocker89@gmail.com>
> Signed-off-by: Thomas Makin <halorocker89@gmail.com>
> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  drivers/soc/tegra/pmc.c | 61 +++++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 61 insertions(+)
>=20
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index f419a5395545f..d133f445e4ec4 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -3897,6 +3897,66 @@ static const struct tegra_pmc_soc tegra210_pmc_soc=
 =3D {
>  	.has_single_mmio_aperture =3D true,
>  };
> =20
> +static const char * const tegra210b01_powergates[] =3D {
> +	[TEGRA_POWERGATE_CPU] =3D "crail",
> +	[TEGRA_POWERGATE_3D] =3D "3d",
> +	[TEGRA_POWERGATE_PCIE] =3D "pcie",
> +	[TEGRA_POWERGATE_MPE] =3D "mpe",
> +	[TEGRA_POWERGATE_CPU1] =3D "cpu1",
> +	[TEGRA_POWERGATE_CPU2] =3D "cpu2",
> +	[TEGRA_POWERGATE_CPU3] =3D "cpu3",
> +	[TEGRA_POWERGATE_CPU0] =3D "cpu0",
> +	[TEGRA_POWERGATE_C0NC] =3D "c0nc",
> +	[TEGRA_POWERGATE_SOR] =3D "sor",
> +	[TEGRA_POWERGATE_DIS] =3D "dis",
> +	[TEGRA_POWERGATE_DISB] =3D "disb",
> +	[TEGRA_POWERGATE_XUSBA] =3D "xusba",
> +	[TEGRA_POWERGATE_XUSBB] =3D "xusbb",
> +	[TEGRA_POWERGATE_XUSBC] =3D "xusbc",
> +	[TEGRA_POWERGATE_VIC] =3D "vic",
> +	[TEGRA_POWERGATE_IRAM] =3D "iram",
> +	[TEGRA_POWERGATE_NVDEC] =3D "nvdec",
> +	[TEGRA_POWERGATE_NVJPG] =3D "nvjpg",
> +	[TEGRA_POWERGATE_AUD] =3D "aud",
> +	[TEGRA_POWERGATE_DFD] =3D "dfd",
> +};
> +
> +static const struct tegra_pmc_soc tegra210b01_pmc_soc =3D {
> +	.supports_core_domain =3D false,
> +	.num_powergates =3D ARRAY_SIZE(tegra210b01_powergates),
> +	.powergates =3D tegra210b01_powergates,
> +	.num_cpu_powergates =3D ARRAY_SIZE(tegra210_cpu_powergates),
> +	.cpu_powergates =3D tegra210_cpu_powergates,
> +	.has_tsense_reset =3D true,
> +	.has_gpu_clamps =3D true,
> +	.needs_mbist_war =3D false,
> +	.has_io_pad_wren =3D true,
> +	.maybe_tz_only =3D true,
> +	.num_io_pads =3D ARRAY_SIZE(tegra210_io_pads),
> +	.io_pads =3D tegra210_io_pads,
> +	.num_io_pad_vctrls =3D ARRAY_SIZE(tegra210_io_pad_vctrls),
> +	.io_pad_vctrls =3D tegra210_io_pad_vctrls,
> +	.num_pin_descs =3D ARRAY_SIZE(tegra210_pin_descs),
> +	.pin_descs =3D tegra210_pin_descs,
> +	.regs =3D &tegra20_pmc_regs,
> +	.init =3D tegra20_pmc_init,
> +	.setup_irq_polarity =3D tegra20_pmc_setup_irq_polarity,
> +	.powergate_set =3D tegra114_powergate_set,
> +	.irq_set_wake =3D tegra210_pmc_irq_set_wake,
> +	.irq_set_type =3D tegra210_pmc_irq_set_type,
> +	.reset_sources =3D tegra210_reset_sources,
> +	.num_reset_sources =3D ARRAY_SIZE(tegra210_reset_sources),
> +	.reset_levels =3D NULL,
> +	.num_reset_levels =3D 0,
> +	.num_wake_events =3D ARRAY_SIZE(tegra210_wake_events),
> +	.wake_events =3D tegra210_wake_events,
> +	.pmc_clks_data =3D tegra_pmc_clks_data,
> +	.num_pmc_clks =3D ARRAY_SIZE(tegra_pmc_clks_data),
> +	.has_blink_output =3D true,
> +	.has_usb_sleepwalk =3D true,
> +	.has_single_mmio_aperture =3D true,
> +};
> +
>  static const struct tegra_io_pad_soc tegra186_io_pads[] =3D {
>  	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIA, 0, 0x74, 0x78, "csia"),
>  	TEGRA_IO_PAD(TEGRA_IO_PAD_CSIB, 1, 0x74, 0x78, "csib"),
> @@ -4824,6 +4884,7 @@ static const struct of_device_id tegra_pmc_match[] =
=3D {
>  	{ .compatible =3D "nvidia,tegra194-pmc", .data =3D &tegra194_pmc_soc },
>  	{ .compatible =3D "nvidia,tegra186-pmc", .data =3D &tegra186_pmc_soc },
>  	{ .compatible =3D "nvidia,tegra210-pmc", .data =3D &tegra210_pmc_soc },
> +	{ .compatible =3D "nvidia,tegra210b01-pmc", .data =3D &tegra210b01_pmc_=
soc },
>  	{ .compatible =3D "nvidia,tegra132-pmc", .data =3D &tegra124_pmc_soc },
>  	{ .compatible =3D "nvidia,tegra124-pmc", .data =3D &tegra124_pmc_soc },
>  	{ .compatible =3D "nvidia,tegra114-pmc", .data =3D &tegra114_pmc_soc },
>=20
> --=20
> 2.54.0
>=20
>=20
>=20




