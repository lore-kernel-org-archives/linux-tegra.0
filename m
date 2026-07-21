Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010000.outbound.protection.outlook.com [52.101.201.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A664343F6;
	Tue, 21 Jul 2026 07:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784618564; cv=fail; b=pWim6G1qXjFnLRoJp3GHLn9NFgV0+S+/5+v3BumKw8dBOC2dV88taZ9XaXpxG2UEc8WA5huG018GkyxxcyoG2WHU5iRpLMRXF/CdTmkvyy9NTZHirNjTtNDnla7WLXMWc8rYWEDwWpnFreGTervCXFSrP1NlzhY0BI55iF9XFQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784618564; c=relaxed/simple;
	bh=F+RDZly23ZvTdac27mmcbLBXyEa4a+uXbplDSsZI+mg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e25OHzWYA9DqAXC4zGPOIv2588OawCvYG9rVF2v+9iuZYu1mV8LptHfQjKBE47UnYf5k6YwrSm9MOnG8i4yyYxs2m/YiTjb4xuqhzZXWeib654fDhX8XHbweGYqJVmdTGe9E+aAvP1u03YqdQBDVf3UBtBKkxm1pT8NhqFJBnQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=T5AfDH40; arc=fail smtp.client-ip=52.101.201.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="T5AfDH40"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EFZwVKQFNTg4kJgJSVRsKA5wI+Y5H+o2cki9/XTOEVJFr29QEgqFLotxwcEUpuM/7LQfziaKW+/LWbog4XQaCF2TWEKsDCAydCuhCdygdEpblxwc3TjUlHYJ+y3c9klyYToMFebGyEOIV7qMone3hZVJwwa/2xOeBLqUynKypjBaySi/xrd2KnvE/WJMZYkjhf3sMUNH4ptLEWEKD18RhnvN2Y/MmK6GYOtvN3pOYhK9dGRUtS5yxrmMBU9bKyPd37nQeIdTGZogkedhA4PsvMIWK5Czqz262/ISmjYV6IQvz85uf6/SWVspMVTxq+MLF4TU1566rgG7mY6O8fdq4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xtQl0Jyq6XngTdiF5dgM8RNRyLCQqSzlbh/6QTUBOw=;
 b=Me8/lyE8/B2bYUPY8NJYFyspA9yvkx7K65ew9R5VABZAt0025QTuoMlyCWpZHQZmMTGHsIqTxqI/DNqfbpr0KqaP3lQMvLDCzh9hR2ZOfOWzC7Y+dbIMuGeqHElaHG1bsNHYhZfPA38SWP8F4gGBAk9F3cAv9jMGm6r36Y3NnY7pF/fKaxLYP6QCIWc+2p4KW0mwfG5FhXskmrn5YhZODjqmxtqF31HrF1rKtlu5qIEtmOjus6PSs1Dd3d8jBr5ig8arX0DDNEGayK3nBTUVXK1PeAAvzn3pkCy0kvi8/Oa5LpOdaXoHWBDb0wbpRkhlUCAOB0GPgr/ckV0io00/CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xtQl0Jyq6XngTdiF5dgM8RNRyLCQqSzlbh/6QTUBOw=;
 b=T5AfDH40OWa+eyBK/17FEshgSF4nfFxAnpWfYqaCp8EYYOM9IQk2PfJZ/Y/2EzXTZChbMBA7Z6yyrHTiphc7YPTcazgcjbuNQtKPNuc/Bm5XLteyL2m/KAKfhbpirUBlIbNii1thlBsXcSrgmF0kwJBRlb9nK6mHcdQLchRSRW1gw6sQIi3wQb+nCnizqns9wDKK1Oq5aUQKU9VcpAGe0MWkWU9Jbdh/Xp8DofvePAF+BBBu+l53GVm2STDKgR976ZlyJmYcWQsW0KXREKAK5wQuGIUAm/+m+aOscYJdIWXMT9a2dokqDcZcMJjqO5d6KjO3276a+QZxnAedGsdylw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by PH0PR12MB999114.namprd12.prod.outlook.com (2603:10b6:510:390::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 07:22:41 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%6]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 07:22:41 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, webgeek1234@gmail.com
Cc: Thierry Reding <thierry.reding@gmail.com>, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 Aaron Kling <webgeek1234@gmail.com>, Azkali Manad <a.ffcc7@gmail.com>,
 Thomas Makin <halorocker89@gmail.com>
Subject: Re: [PATCH v2 2/2] soc/tegra: pmc: Add Tegra210B01 support
Date: Tue, 21 Jul 2026 16:22:30 +0900
Message-ID: <rrmQkm06RD2JduKX6eSoDg@nvidia.com>
In-Reply-To: <20260720-t210b01-pmc-v2-2-ca5317f8507b@gmail.com>
References:
 <20260720-t210b01-pmc-v2-0-ca5317f8507b@gmail.com>
 <20260720-t210b01-pmc-v2-2-ca5317f8507b@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP301CA0001.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::19) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|PH0PR12MB999114:EE_
X-MS-Office365-Filtering-Correlation-Id: 13fd7376-f5f7-466e-1923-08dee6f8d979
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|10070799003|18002099003|22082099003|3023799007|10067099003|56012099006|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info:
	jFdFr7Tq4fDPybWcRQyIiOxQWSLzaiD7uz8vr2T7828xT3SgfZHYBbhJ6C0+xVRtIHS4fVw+xGIzN0GD+KCxs02bu3jkJnx+6t8rjhHdrnoxVMVs8s0U4ll0MBSw4kiQH+68cIlUnVO9S58ZCE2F/YF3bNAKTFehBUhoxeHz8ClIbObO2443XnGJkHRv76/a/oDZnzoE3jaEE1xIye65ydDJLNkxStaMXt7nOQlLES7zomXXDvCfIxu7TQdlL4nzlSIsleb9m8+Gni8Z0uLDMrQ/Q+IUTmu2a34VJ9gSglarR97CpKT5KdDeBG2wmQzNM+KE0IJOYWIqxa1uhgzPt1BDmyYGoeBjf+KacsDtFUm4TtxIALroPFtpxPHxtgIiQ5NG93Fgrmf3TQjBHp7Vd6bj3rY1G52mJpN58eQpQT6dSO4M9rgBhMfiaSeU6RPS70VrR5B4IM5t/dukXepC9erw5dZdf1REpWJey4qcb+9uEV7esUP5pnVaFk55nuzPdaMLoafEApMydqb3womcaPvjICMTe2s9aQJd8DcdWBq0PkaNbvAm2IXAM+43ze9rbv7oU3unywrl+SeoA7I7azqLsADcLGIn14OJgOCVeCd9OWgFJSaxm4lfkXg5Y1wssAPXe2+Ra9lLcWXy89NlG89cMqVflDJdU6gU9XiQhZ8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(10070799003)(18002099003)(22082099003)(3023799007)(10067099003)(56012099006)(11063799006)(4143699003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDYwc21ZZldKVm1aTG1uanExaWQ0T0p5QWtGY1RiZ2pRcGdaZVlKQlJ2d0pk?=
 =?utf-8?B?dFErMXlYQTVpdUQ4MmFheE0renZ6Q3hBcEZ0ZUJZdkZEMWV5OEswcmtqWW1O?=
 =?utf-8?B?V3pJTTgzVWlJaXhzdjYyZTNaQ1Y2U1p6TmVyaDkvVzBzem1qZmVuN1dZdVRi?=
 =?utf-8?B?OTBFWEowOGt6WlhRSnJhazNOSVhZM3FMTGpKanY1aFBqbFFHNlpSRXBncFRE?=
 =?utf-8?B?M1NLM1BuUDhuYUx5aHNKV3FGQStSSUFVbGgvaFoxcGpuSDg3dU9OVUJoUmNj?=
 =?utf-8?B?T1daR2FpSXZkL1VjTUQwNzdncWlSQnRQRGJzM2QyYjFnVDdOQUlmZWMxbU0w?=
 =?utf-8?B?S2k1VzdnRFlqOC9WUnZpdmJ0REU4cjlPSlF4ckFaOWlNZWtYcmhmREhoMm1n?=
 =?utf-8?B?QXpGZjduZHdQdTkyZitHcU11KzN5OVlmTEZpOXF4T2pyRkZMWXp6NlZ2ZElo?=
 =?utf-8?B?Q2xzSngrdDhIZjJoTDl6dEtyMXZXUk8yeU5PRE5rWU81b2Y2ekgxMWx0cVRy?=
 =?utf-8?B?Q09HSHl4cWdoaDdkUS9vbDYzOTlYRks1WkJMU1Y5T0dJNDIwYitSeEhFdEJ0?=
 =?utf-8?B?MDdhMldXZ3hVcFQ2Z0dqelVZaG0vNDZiTzh3MWU5TzJTUVdLeHRhamt6VDhH?=
 =?utf-8?B?K2FyYllRaFNaL05sN1AzUkVBT0c1RmVDVHFQa3dod09FMTI1SlhIU2R3NG40?=
 =?utf-8?B?QS9EZ2dybG91YStlTzNCSG54b2xVTnZnLzF4c1A3TXBZVFVPckFjMDNLNDZO?=
 =?utf-8?B?SzhOY25qc1dObnVmbXdmNlBXL3dWSkJ0c1EvR21hVFdUZktQUnJaSzkrSzJV?=
 =?utf-8?B?SVRyNjRGQWNpOW1jWmI0enZwUkIyMnpNQVFiL1BvbnlDdC9XTVp4bzlabjlI?=
 =?utf-8?B?Qk9zTFdUM1BOVngvL0pORVNMTmJDRGpHNytkR2J6RWJlRXNVWk9PR0V3THhY?=
 =?utf-8?B?QkNiY1p3dnpxUE4yOGRCU0ZpTzVVaE5IdXBkNGdWd3JWQVFzY3JyMkFvK1Ft?=
 =?utf-8?B?L2R0eEdQVnVGejhyQkJQZHFoYjkrRWNpdlhVL0FwcTdXOG8rMUMyN1ltdXdT?=
 =?utf-8?B?eC9KdENxZXZ3Wk50amFxTmVZS1cyeFUyNnk3OXpDanJuaG1iQXl1UGpyWVNC?=
 =?utf-8?B?MDNGN3BYNU9sOUhYa1E4T3g4NFZDQnkzQzAyeGtnTzJvcmw3dkYrN1BmeHVJ?=
 =?utf-8?B?ekhkZGFzZ0YxSlQralZTS1pWR1hwN1dNMGRTQ1pNWTJVTXNyV2d1K3VpSTZh?=
 =?utf-8?B?SjJqQ2RTQkFXR3RRWTZGVXFacUlZSmd3MUxNdlhpdVdCTFZkZlFkc0UvQWhN?=
 =?utf-8?B?dmJDN2Evd29oRUd0MTIwQUt2cWMzQWpKcjU2Rmp0NkVKSCtUL2lFWnVTUUo2?=
 =?utf-8?B?a0pKemtVTG5MOUtvakVCbjR3WHppUDZBK0oyZG1vd2JRV3Y2TVp1NHVXYTFN?=
 =?utf-8?B?U21kL1llb1hBZlFyalhVUTZkMFZINk5BRk9NMW0yUEgwYjM2OEpKa3hDbGJy?=
 =?utf-8?B?NFVaQ3VYTlFOejRJRllKMnlVVm4vTWJDcTBzZGl3N1pySDYwYnhpd2ltRWlz?=
 =?utf-8?B?NzVRM0RWWWk2dGQ4VUhhdjN0WWFwcm9XcENUQTF1MU9HZW40Yzk3NDdHSG1C?=
 =?utf-8?B?SGtMbGZORmdBbTZLZkhvd0FkNDIrZWtlYXJLODZjN01SMEZqUlNBSnlLWVBF?=
 =?utf-8?B?Mk5MTWg2Z1k3aXFEd24xenRuTGhsdlY1a3lTYmxZd3NRZ0IvalN1QlpUVW83?=
 =?utf-8?B?QjM5WHR1UzZidWJXalFienZpNlNVUi81RlJYODY4dlNnTjBpNUtkVWdMbGVj?=
 =?utf-8?B?QkNoNkg5L3RFc1VBa1BlZ0FnZW5YWEtNWElGZHJraWtGMlc4djlyU1VQeEdo?=
 =?utf-8?B?VkRTakpWVndud0FBUVVpTVpLQ1BNb3JoUllqM1lBWVFxQmNta2ZsZjZZWUdT?=
 =?utf-8?B?a3FsYlRCSGdDWVJUU05GQlpROGRLdGxwbVJSN2NPZTZqbmR5TFZ1ZUJtN3Zp?=
 =?utf-8?B?WWU0NjF4TXIydGc5Nk8rMS9zdTFKN2lzYnB2R3NOTWdUaUkxUFFEbXZWL2Mr?=
 =?utf-8?B?MVZmeVBrT3B1TFhKZjhPMXNHRDhseFdxZUlBUVFWWUJ1a0txVFZyNXVTZVYr?=
 =?utf-8?B?SkQrUmgySU9xMmdXcTFLYVVFeDgzQ2xzdzJsSG1kSnFGcUVrNkhwMHRWUEll?=
 =?utf-8?B?ZUlQWXFzNVdURHZGaWsva1ROVS9yUEhBeVdpRHV1VVhkZjJjRmdLWm1yV29U?=
 =?utf-8?B?UTdVT0hQRXp1bSt0aS9JZDVxMUhlTzV3TFhYRmhGS0JkdjdNazZYWXhDakEv?=
 =?utf-8?B?aC8xYk53czBsOTFKNk45ck1tNlZnUDE4WGRKVmoyaDBmQTU1VTlyem5DMXBI?=
 =?utf-8?Q?sg0Im4gRyKsi6TgdYAMTl+gXXdnnsL6v9PTPpNgefJT0W?=
X-MS-Exchange-AntiSpam-MessageData-1: If2NIE/OnZIHxg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13fd7376-f5f7-466e-1923-08dee6f8d979
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 07:22:41.0386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +BKfaEDeFNOI1K1zpovlYfhoBFjklP9sis6ZpS9G4Lwpu/+66nmXpMTJwTmyA9Zu69bJ4nAiYIdP8eJiqVQf3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB999114

On Monday, July 20, 2026 3:31=E2=80=AFPM Aaron Kling via B4 Relay wrote:
> From: Azkali Manad <a.ffcc7@gmail.com>
>=20
> The PMC in Tegra210B01 is very similar to the one in the original
> Tegra210, but has a few powergate differences. Add support for this soc.

The tables are a bit difficult to compare directly, so maybe list the=20
differences between 210 and 210B01 in the commit message.

>=20
> Signed-off-by: Azkali Manad <a.ffcc7@gmail.com>
> Co-developed-by: Thomas Makin <halorocker89@gmail.com>
> Signed-off-by: Thomas Makin <halorocker89@gmail.com>
> Co-developed-by: Aaron Kling <webgeek1234@gmail.com>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  drivers/soc/tegra/pmc.c | 62 +++++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 62 insertions(+)
>=20
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index f419a5395545f..48ae4ff3f00db 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -3897,6 +3897,67 @@ static const struct tegra_pmc_soc tegra210_pmc_soc=
 =3D {
>  	.has_single_mmio_aperture =3D true,
>  };
> =20
> +static const char * const tegra210b01_powergates[] =3D {
> +	[TEGRA_POWERGATE_CPU] =3D "crail",
> +	[TEGRA_POWERGATE_3D] =3D "3d",
> +	[TEGRA_POWERGATE_PCIE] =3D "pcie",
> +	[TEGRA_POWERGATE_MPE] =3D "mpe",
> +	[TEGRA_POWERGATE_SATA] =3D "sata",

T210B01 doesn't have SATA, so this can be removed.

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
> +	.has_io_pad_wren =3D false,

Any particular reason to flip this to false? AFAICT it is still needed=20
to make PWR_DET_VAL writable as on T210.

(The reset value is already (mostly) fine but seems prudent to write it=20
anyway)

Thank you!
Mikko

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
> @@ -4824,6 +4885,7 @@ static const struct of_device_id tegra_pmc_match[] =
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




