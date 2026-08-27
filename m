Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013034.outbound.protection.outlook.com [40.93.201.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA33738C2DE
	for <linux-tegra@vger.kernel.org>; Thu, 27 Aug 2026 09:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787822621; cv=fail; b=M8o3d45N05gDURAZT71AU68CAvg5PVPRlYZFeFJNnSVQXMXK1ZRExoWperFMnouv71HUrWFSpkT9iLwUfaN3vGRnP1cY1xF+AhMQoLU4TSrRaslUrDVKFHxLZ+2UFBm2kqv319KgUyWOOC9su3WT2B8CMWvMCCp9wDoULYSq0KE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787822621; c=relaxed/simple;
	bh=NwnB1vhhQ1h0gBl+6P3uT70J69GZMee3qkrbDIYkDq4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EM627gQE7hrEbuWwwdYNQ/dVg5/6SCMqBO3zKm/de4rbUXjO+PDUQCTKqFCZD58S+1//ItWem+so6unSxrHX8cpfl0F+43nq1/pg9eWSiPInrsijdYDiQpwxnH+DZwZDoCzfpKxMdoi359LrjsqA8M6wFtbKb56JOWK3I1IHRU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=g4WeOpYH; arc=fail smtp.client-ip=40.93.201.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="g4WeOpYH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qF0vlOuOBJXfJi5+ffdIgWjEWpSeK2O/+FWMi/ONPV2Y4xhegldwQ9Ga5ZPfPPin38gy5JH80BqpTtaeHygngjrBME0In4LcF9B8tqxlF8efdDkpYs0LsyYimfUv2LVsjYSpkYAEJ6I5CY5Qn2J6QGhE7aM4+BoMeLLswKb5/qqi1X0jVOjKTMBPtiJ5TZjjyjMcQE0cfy9M4QPfnnh9Ux8jL/eC4Do+HX8vmgRaEaTL4i4T5GSBFL4M2LMyuNmb1fQHsJxR9QvZx6byOzDqANSB/PLlutyao2F2gmDtnoG2BsqAwDGQDtk0rWCbJUB1WgG7hmFA/EuuPLz9ruYTHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mN8ylfFIU2kotLWbCfWqPtrKq22jRGVktZUenmrZGKc=;
 b=g9HHHPkoX/8REbyxijvvlFC+IsbjwSGjpT84kLJ1WIoTFrQ5GQqToFqsEfW/jzT5VED8lMLQkk2cWjQBWkbThN1RCGdCK+f19AuJXMvUBJ1AABOb4tAA6fv95mRprxfbl6CGnV8Rw+lNGJyGNB7/ruS4/sXsA+g43yi5MFuuno++4zbjQkcXpyUFEW7y9LKWx1FEOLlabYDpm7EPc9U1vPiWqKMSWZ6GmU0amvHSVo5U8wDIbIDwzQ474/CIDw+HhXHThNCyOZIT75ag+zx2Ljk8nV++X02Y9c6fUNZH6U6Rp/lfvJp+hIpXdGzAxvO61+BHDyPbgD5vUPhk+i2nUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mN8ylfFIU2kotLWbCfWqPtrKq22jRGVktZUenmrZGKc=;
 b=g4WeOpYHG/nRtrF4oN1n/vDGL2Z7sTYZSC/5lyVgUuCY65Bc+dImUylOZQPWzaV4CqfgrvkHElywtESqp7Ox1vGb7SOeB4/Yjcq86XTy44rGPdvhpkHaQfGaxk8rPwOtjpsS3ENBvOHriEyuYA65nDdmLC9OAefX7q3vcEaxqBeXRe6qXQ5TG7MN/yv9fl0YtK1uXFkKOqGNh1OoqSlnoOsotx3/ZZbeL1WeekzuS6RraF016pyC7WdQ4t2JKalt74WIUHx94jrePULeVN51gpb73RnqDoA90yqNzQHNis/xURbnCaf590WRu8rwdrBI8QWf5LSzKdRU4q4Ns7C+xQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6063.namprd12.prod.outlook.com (2603:10b6:8:b1::19) by
 SA1PR12MB7367.namprd12.prod.outlook.com (2603:10b6:806:2b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Thu, 27 Aug
 2026 09:23:32 +0000
Received: from DM4PR12MB6063.namprd12.prod.outlook.com
 ([fe80::c06b:5df:6a68:1b06]) by DM4PR12MB6063.namprd12.prod.outlook.com
 ([fe80::c06b:5df:6a68:1b06%3]) with mapi id 15.21.0339.012; Thu, 27 Aug 2026
 09:23:31 +0000
Message-ID: <043ffecd-22d1-4bfc-ac25-b95118471972@nvidia.com>
Date: Thu, 27 Aug 2026 10:23:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tegra: Add blend mode properties
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
References: <20260826105421.1825331-1-thierry.reding@kernel.org>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20260826105421.1825331-1-thierry.reding@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::8) To DM4PR12MB6063.namprd12.prod.outlook.com
 (2603:10b6:8:b1::19)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6063:EE_|SA1PR12MB7367:EE_
X-MS-Office365-Filtering-Correlation-Id: 729ab6ee-9818-4751-fbe0-08df041cdc73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	N7FrK7xoiA9RR7uZdEfebtxYOi8EnE3vyH1I5CuBoPq5fEILYyoeu28lTIw+uk0IJxLWOgj6WRQQ7ESPNZ9sktNMgoegCmRsxe961h4klJ5vJI9aU7uTYMaVNksT9dFVzIZXuDC0PgjSNOy7fkjjyKHfHkrCJz4TNg+DtEVL415X8+CTB2ofqYzA7Q9ejT3N8OeUtvqlnSFV7d1DF8Mux2MR+APEi40qVauan2H2kg8a+Dd4kwr84o13ObKYSWJpZKTsCMHS5gx3YH8Ej824dFeA67KOquvf+uZJ9eVbMCZ6H7KcE794NukjC+kMJMfji6DgyaGHAN0f1EQ0qMw3OcnLrTizLiETBr+n3pkhLVVP5Gw+FnaHvV0t94olR7H498nPNp09W40g0JF4eSxuLAJ2vNLbQeMkbGP0wVtIbd0CUwx1atp47vdJUCxWDtx9IMhrYcxzi+SJiqV2ZvePWeagJ6SGUQ21r+8DO9oM5Vrxo3ESjbRWAR/y0cyOZvLfgHJeNrhCrSsbdPEltKE3uCjNJpU9YdwFDdA5M6hV79xBn6Vfz2jiX06thtSvD7/adFrxUrAreod2NDH2Ahf5Gy7fOIc3aBYQr3mGqLcCA43KiX9IE/ddw44MvbGthMyXEN+l5C5S67ZujTfvQuOdM5uH9gCDW3OSswC2CzmdGl4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6063.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEpSTFhxNG5LeGhZNW1xR1k3WkRoV3YvMEEzLzlTZ0ZXRTdCL2lORmtCS0Zw?=
 =?utf-8?B?MlFWTktqQzJUT1RaYW5WV3p5Uyt2SjVXQVYrRkJkLzhTMXlsV0Y3RStaMTdV?=
 =?utf-8?B?b1ZsdjFGTHN1L2NsSklQNmlrUEl5SFpoNkJHemQ5NnUybGxCem1UOHZrVy9w?=
 =?utf-8?B?UmVIYkI4V3Q1L3FtUWVxWEZjS1VsYTFHcDNOc2JHZ1JDblRVWUQ1R2hyUENW?=
 =?utf-8?B?S1NpMDdkOUUrYnBhNjRRek9WV01vRVV4M1QzeXpZT1Z0Ry9nRGlQTE1XcnU2?=
 =?utf-8?B?K3pFNkcyeGV0LzZwZkJyVkc4WVpnNGFocXBIaDZFdisyMDJTVXBUMG5zaWVK?=
 =?utf-8?B?OXJkRWxNOGFFWkxGT0x0TFlpK0x5VmUxaktJeDA4Qm9JOUpMUGYwNjRjaTYz?=
 =?utf-8?B?S1QvbHQxdUoyaXlpQll2aFltcWVaTC9OL2JnRFNKaldDYytid3NENHQwVEgx?=
 =?utf-8?B?VFhBK2l1YThQSEpJaW1PUU10ZTRjeThaZ2hzdFIxTnRyc3hCQTM4VCtEYk1P?=
 =?utf-8?B?cnMwcEZ2MjFWb1dsVGgwbUJ3SVNwL1paNERLRjZTRnNpZHpwbVE0RWhQTHJX?=
 =?utf-8?B?elhLM0I5ako1UEsxZmNHZktnYnZYSWdkN3FSZlJlR2NMeUpVZGxwRU4vOGgz?=
 =?utf-8?B?RHlNVEU1aUZKMGRuSEhUWXNaTHFwOUhtUjQrZzdKWlVoaEVvNmhLN01hSkdt?=
 =?utf-8?B?Y1pIbDlucWtMWVRTakpzVVR2Q1RRdUtKZFVzWFdCdWVGVld0RWI3eUFHUXV5?=
 =?utf-8?B?ZTJTRmRYTkNTTDJqbjc1dmN1dFZmeGU5bXNsOXJSRVNlWjBiMU16dE5NNUJy?=
 =?utf-8?B?M0RUTXBRUmF5ZGJGWnBScFJoeHpGdzFBeG1RYjNSREFlUVI1VDhkQU9OUlda?=
 =?utf-8?B?RnU2UnM5Z1dqVWpzVnFsZ240Z1YxYys4bkgzdTV5SHNTdVlOalFpOUdtM2ta?=
 =?utf-8?B?OTVPT1NPS2FUU0JaWVF1aGtma3MzVDYxbnZ4eVpKZFFNSnpScjg0dEprd1Bn?=
 =?utf-8?B?TUIySHgzY3JoUUQ3WTRLVzZaVndCLzRMOUxXNVd1RnhKMnI0a3ZIazJKQ1hv?=
 =?utf-8?B?aWhQb3VSWlcybEhTUTZITXdGeXYzcTdZYmdvR01ZYmNLc0N6dHErVFVqUFJT?=
 =?utf-8?B?c0FteHF2S3QrUDZLYTY3dEZheVh2UVp1RlJqRVg3RXZ3NmFqdTlma1AzZE05?=
 =?utf-8?B?WTlQNjlITVg5WWpXZU5GUFVlc05PeEozWE9WYWdVallCUUtiWStxV3JrQldN?=
 =?utf-8?B?SWhiWWp5YVJ2Unl0bzZXT0N3bFk4dC9yc2Nsa3JTeUFvclRjSlpwRisyRHFo?=
 =?utf-8?B?c0tJQUM5cmlsKzVEVWszL2F6bnBYZXpUWHo4UEQ5K3Y4S3hGWCtOYUZqd2lH?=
 =?utf-8?B?b3JUb2owKzBKR0QzSm9MRHVKcldCdklyRmtOWnJNMjBVd0paNFlMcG5idXdw?=
 =?utf-8?B?TDg1VWd2RSswS0gzL3VxQStrUWhMMUpZcUZOZWxzSkNhTXI1Z3NXUmZ2cDVk?=
 =?utf-8?B?TTNKcjVBREVDa2RwaWtNV1F1dSt0aGhhRUtOK21qYTJqSmtTanB5NnZOZEUy?=
 =?utf-8?B?b0NpVERKVHB2S1VwcDBqR250ZDlOSVhWSGJrUkFmLzVEUXJJd2V5bjJCQjY0?=
 =?utf-8?B?cCtLMGdrTkdmenVqTkczVnU2b2tKaDkrNk42Y1I1NU9vNVZLVk5LSDdIWklt?=
 =?utf-8?B?MFlqN2VpKzBJZ0Nma3pQOXZPdDlDN0dMV3I1alJTK3FNM2JCMDd5ZWxmU0hx?=
 =?utf-8?B?eGtIZ2l1cWR6QWxSSCtoVmpITHd5a1NwUm1mc1ZPamV3UW5SRXhTTGdmOE1y?=
 =?utf-8?B?bE9OeHZ0Wjk5VHVJMG56Skp1bFViN3Erdm5LeHZvRUhhTmROaUJZaHhOMHJW?=
 =?utf-8?B?SnNPQjIwNWNObTBVSlYyUXAwSEV5L1d3U21hT3NLb1U2Mm8zL1dEMGV0NFJn?=
 =?utf-8?B?d2JEU3Z3RTUwNVVDaGVUc3NyTUpkT25qSjYrNk1RMFdKVTlSS0gxaExJV00v?=
 =?utf-8?B?ZFVhNXFFVFh0K1RxYk1GSUQxbmtGL2RuSC9DQnRSUXpoR3ZqWmpZM1ZFL1ZW?=
 =?utf-8?B?bUN5U1hlUnM4TjJ2NGJ5RnNoYXFGWTZUbDdrajRrVUFQSXpjTkVselkwc2lB?=
 =?utf-8?B?ZmdkbEhySTB0TE14Z0drMnhzdndtbTF1bWdnR20wR1g2WC9BMUJxcUcwNmJk?=
 =?utf-8?B?SVZTZm8wbGg1ZURoSjh1UmxoK1RCRnpFeGsrZmd0ME1MWGZnS3VaOFUvTi8y?=
 =?utf-8?B?c0F2WkNSbDJ1SmRYcEFRL2VsaFhPZlRjclRZcVFPRlphQ09SMFRFdHdnVld2?=
 =?utf-8?B?K1lwelpOVGRmRVJ3d25LTVphNW1lajBXOFVvcUJHUWR4VjZjbjRxZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 729ab6ee-9818-4751-fbe0-08df041cdc73
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6063.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 09:23:31.5275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iTPz/vPIYDB0OLG+qv3jOO8SlMbooa1vPVjIC+sROF/ZqI04tQ9jl21rLkE2O+58mpsbOmugJJqX8JPhMDnEng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7367


On 26/08/2026 11:54, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The default programming in the driver matches the "coverage" blend mode,
> so add the corresponding pixel blend mode property to let userspace know
> about it.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>   drivers/gpu/drm/tegra/dc.c  | 6 ++++++
>   drivers/gpu/drm/tegra/hub.c | 2 ++
>   2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index 0b3fcc7011b35..fefc3761a4bc7 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -904,6 +904,7 @@ static struct drm_plane *tegra_primary_plane_create(struct drm_device *drm,
>   						    struct tegra_dc *dc)
>   {
>   	unsigned long possible_crtcs = tegra_plane_get_possible_crtcs(drm);
> +	unsigned int blend_caps = BIT(DRM_MODE_BLEND_COVERAGE);
>   	enum drm_plane_type type = DRM_PLANE_TYPE_PRIMARY;
>   	struct tegra_plane *plane;
>   	unsigned int num_formats;
> @@ -939,6 +940,7 @@ static struct drm_plane *tegra_primary_plane_create(struct drm_device *drm,
>   	}
>   
>   	drm_plane_helper_add(&plane->base, &tegra_plane_helper_funcs);
> +	drm_plane_create_blend_mode_property(&plane->base, blend_caps);
>   	drm_plane_create_zpos_property(&plane->base, plane->index, 0, 255);
>   
>   	err = drm_plane_create_rotation_property(&plane->base,
> @@ -1209,6 +1211,7 @@ static struct drm_plane *tegra_dc_cursor_plane_create(struct drm_device *drm,
>   						      struct tegra_dc *dc)
>   {
>   	unsigned long possible_crtcs = tegra_plane_get_possible_crtcs(drm);
> +	unsigned int blend_caps = BIT(DRM_MODE_BLEND_COVERAGE);
>   	struct tegra_plane *plane;
>   	unsigned int num_formats;
>   	const u32 *formats;
> @@ -1252,6 +1255,7 @@ static struct drm_plane *tegra_dc_cursor_plane_create(struct drm_device *drm,
>   	}
>   
>   	drm_plane_helper_add(&plane->base, &tegra_cursor_plane_helper_funcs);
> +	drm_plane_create_blend_mode_property(&plane->base, blend_caps);
>   	drm_plane_create_zpos_immutable_property(&plane->base, 255);
>   
>   	return &plane->base;
> @@ -1356,6 +1360,7 @@ static struct drm_plane *tegra_dc_overlay_plane_create(struct drm_device *drm,
>   						       bool cursor)
>   {
>   	unsigned long possible_crtcs = tegra_plane_get_possible_crtcs(drm);
> +	unsigned int blend_caps = BIT(DRM_MODE_BLEND_COVERAGE);
>   	struct tegra_plane *plane;
>   	unsigned int num_formats;
>   	enum drm_plane_type type;
> @@ -1394,6 +1399,7 @@ static struct drm_plane *tegra_dc_overlay_plane_create(struct drm_device *drm,
>   	}
>   
>   	drm_plane_helper_add(&plane->base, &tegra_plane_helper_funcs);
> +	drm_plane_create_blend_mode_property(&plane->base, blend_caps);
>   	drm_plane_create_zpos_property(&plane->base, plane->index, 0, 255);
>   
>   	err = drm_plane_create_rotation_property(&plane->base,
> diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
> index bd442bfd45407..448f49f3a7d7e 100644
> --- a/drivers/gpu/drm/tegra/hub.c
> +++ b/drivers/gpu/drm/tegra/hub.c
> @@ -759,6 +759,7 @@ struct drm_plane *tegra_shared_plane_create(struct drm_device *drm,
>   					    unsigned int index,
>   					    enum drm_plane_type type)
>   {
> +	unsigned int blend_caps = BIT(DRM_MODE_BLEND_COVERAGE);
>   	struct tegra_drm *tegra = drm->dev_private;
>   	struct tegra_display_hub *hub = tegra->hub;
>   	struct tegra_shared_plane *plane;
> @@ -797,6 +798,7 @@ struct drm_plane *tegra_shared_plane_create(struct drm_device *drm,
>   	}
>   
>   	drm_plane_helper_add(p, &tegra_shared_plane_helper_funcs);
> +	drm_plane_create_blend_mode_property(p, blend_caps);
>   	drm_plane_create_zpos_property(p, 0, 0, 255);
>   
>   	return p;

Tested-by: Jon Hunter <jonathanh@nvidia.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic

