Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012009.outbound.protection.outlook.com [40.107.209.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A9C37EFF3
	for <linux-tegra@vger.kernel.org>; Tue, 24 Mar 2026 07:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774335935; cv=fail; b=rLU5otwjVXDOP5PM0H8b7PA5F6cnAHHbP4rwXjxbO6npU5GyDF1EdnphoACSnpDvlRS2UbyoS2XwhEBAviGBuR8s2nD+1U4o8fXlyIwxwwR6tNJjXDEv4vQ25DE3SPESZt8hd9zrsjriNZQLsSCkFBNuJj+qtJwKPxde7VwJY8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774335935; c=relaxed/simple;
	bh=dHN2nTTvSIY/awZORRJuTtBtIUyHRe/rCI0Y5eOVGdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X0CDPiSeD6NWVT5NhfQVYgJUtpy4NYXzp7Ec8kYejYvtjSuLcuJjmTjf3b7dh2CoXwvJ9AQPxtRW7M6Br0hdmLmZ+Qq5orLAybwBI+4CV7kwxahcIADmaiS+WZe8a3c8cAFZD4QVm3S94Ed0fCxFGPleYWSt/gnaw17yGrLQW9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nGe5SFRu; arc=fail smtp.client-ip=40.107.209.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nGe5SFRu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VVmCIZFBWIlIfLxtpRjDfKNixETJvWyKWRQVPoTJigwnNqS5bt8jzE+AW9k0zPa099tlmJUJCj+uigdrglFCQeBj8a7qUzAvM6gA4Itns562CpyTfs3crlZJ8qUbbeYiJX4Tyu3xgjEQzpHfZ8P3J2eE48Ja++yxrildg0V5aQ+yLYBe0Jj/85F8JqikkyjT4FOqSnjUoRM9iOAlUuyRQfb3j7BgOQU0+AwRx4jyTflWzU2esqrHQeMh/CnhUdV08MVnUuxrLculvistaXOlXCp18BwZuZe14aJrrlqtgG7fZLj2sQvjnAgpDO+RUtRRzWPCGgGuUmq6ArlyUfaQMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sDkAvopJT3ekVsGkhX9UXuTMGDTcyMI3INeeURvDcfA=;
 b=nOF1KKcMRYjkGPdiyR3+fUxOY2pgl4S50Gp3wLQlDKsqhBEYzI218Qv6/WEDm0YMjX9sqeY89557HmRIrUcZN8pfSOyOueqWwQpmY/RcrxbAFa3xultf2fzml7PstbCklMDzr/gprEsWuOVfjw/nKiDzuJGwjsa3CUdN9+WJu5uZR4lVr7L9EbwN4NhdksZxhACsTDapUB0TZXANtDGOBPPqFR7xZHY2+vQ7WllJjrMWtjAA2TgT+1Gjx+YKsuAyMN1mUXs7E3rzjmXPINNyjYi/u9T/kpn9i1Xi/XoG2oU5Ojzl8Y3Xjb79HIPvIPHuSskgjXJFCm9vsKfMIjdoxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDkAvopJT3ekVsGkhX9UXuTMGDTcyMI3INeeURvDcfA=;
 b=nGe5SFRuWjIy19GMB8YcbdtLmzy1xo1UGiLD0RpgwA/qtA2HHVltwnXhZ+zz3xpHc7IhbI4DJLJe8WocoduzSTLd5WpF1jvtVVNnMU7Ycds1Q/P/iK7wo1YdPemC81WcfFE035Bj9/5UUAb/c3kTvaOrroI/Tu5ERs7hvV3wIeXKymY/8ChJscZfumGgBY1DlqB0GUIaD85IrYQhGibUoDpXXQCETlp1PIITkSrdWUu5Tf57HK7NL20PhkdSlXMT1aW1MZ9t6u615w9G8ekyiMu7KWnjC76vEBiyuD3GfXhVmthQlDLt4cyzHA7oH4urbO6Dtg2UcFCmeJNKdctshg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by CH3PR12MB8712.namprd12.prod.outlook.com (2603:10b6:610:171::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 07:05:22 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 07:05:22 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Nicolas Chauvet <kwizart@gmail.com>
Cc: linux-tegra@vger.kernel.org, Nicolas Chauvet <kwizart@gmail.com>
Subject:
 Re: [PATCH] [RFC] drm/tegra: fixup primary/overlay format for tegra210
Date: Tue, 24 Mar 2026 16:05:19 +0900
Message-ID: <10027014.CDJkKcVGEf@senjougahara>
In-Reply-To: <20260323130804.67936-1-kwizart@gmail.com>
References: <20260323130804.67936-1-kwizart@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY4PR01CA0124.jpnprd01.prod.outlook.com
 (2603:1096:405:379::6) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|CH3PR12MB8712:EE_
X-MS-Office365-Filtering-Correlation-Id: 206cced3-c043-451e-eebc-08de8973b78b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	qI7AoVr2htORZULcFF68xGsM/IVOKVNSA6PzwGfw3vFoOr7xGTJyYGvhacl04MejtO04lTwntEj6TsQS5Hayl0v2PhkiI0jG1UcEHz7eF+iyAU5WOMbyFKu48jT2kPdKSr4491Hku/dXVruPBSOfTFHZ2Ftx2psLMeOwHFepYHh1rsTIV9B/0A06JYNfIjhrTkVTAsst87U6jJPNKMBpMSjqYSmx95FYI8V3yAFpmx0tGMnP4ty2eSSCmb2gD4SjGaQ6Zm4iUsOPLfE+U1qP0JpnV2CgBrYE1/gZSrr65EqTegFg6bCyqohF3uBe+zrhS8xIa1bpD2zyrmdC4st5Vb/josFbKB7t9AdEn3VELCsG64lRohJRfydzP+Q7EN8u7DpKtUnVYpytnnRUUMvOJi1liupST5eE2LR/3S2DIhSQBK/0DAreDY6yWvwFTLaUlWfgaoZUw7r73cqBQsVNQsxZYavNZPPMNr8T1tXwFWzrPYStdMBX8ap+qw+K0VUZtapuKn7+v1/iqTiYsGIev2N9wnIwcLDF31IAK3QZL5k0yyHcQVSMx9Fr525OqB7iUzLqYHpaiwgwYlCgKuvmPhAZPWUZumfzEYSAiVmqRoZmCTvAg++czAuePvdpwcGNUgJJVEptHBfYbGtcw/mektHMuP5PLlTGQ3uwReTyGYFIYihAlItTTfUecsoAAG7nbt0y1sp1kYv603xifa8mGeesCNRuJLcHWVW2pYfFMdA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0NVdEhQcVpKUTNMZWppemJUbTlQaTFWZ0o3WEx3aGNvNy9keG9JV3VIVkRO?=
 =?utf-8?B?TlMrbkNac1pzZS9UWTJMMytKZ09ZTWhndHI5cUN0aTJPUEJLakorWEJTaUk4?=
 =?utf-8?B?eERESTN1MlJlcjRwNjJDbmh1aTdGWnJoMStNY0VRclN4ZFdDSnlsU0c0cFJY?=
 =?utf-8?B?Z2VYUGpSUWpkcUZjTXZGZGJuTFNNcjl6YzVYTDcrNll6ZW5ucldrU2ZjTnNY?=
 =?utf-8?B?U1FEMlY5STJ6Qk1Xd3I1UDI2SGNUbkNpN21RVVk5SStRQWNQWnF5eEx5L0cy?=
 =?utf-8?B?d0hSUUx3RHlOMWpJQXAzMFluallpdlpndEhnNXI4dklYQUF0Y3cxbDN1enRQ?=
 =?utf-8?B?c1laZ3RKMjNBa1JnWi9pdU5sbzRjZ2g5eG1SV0dPM0Z0Z1YzQmUzNHZ6NW1O?=
 =?utf-8?B?ai9UZjFPbEdsczNHRmZBamw0MTNQNEsxemtYckYxbmZXem9ZLytxK2N2YzdB?=
 =?utf-8?B?TFQ3U3Z3d0tEazNWY0xFM3E0UFF4cWF0OWlDMEpFNVNrd1hLVzhxTGRXbDcx?=
 =?utf-8?B?bVRBQ0xSR0ZRUm9jQW9jR2ZMUGtUU2FPWGV6c3BXazFFTXRHUElsdlg1VHJV?=
 =?utf-8?B?WmdGSmp1UzNIVlRpZjRUbmF2K2JDRUp2bCsxZFF4Mk8rLzhoSWNINEkzWWxj?=
 =?utf-8?B?Q1JNK3B2b2d0WTZsUllGclNoUkJ2Q2lEb1lNQjlUZDhISERTZ1lHU0NTODB2?=
 =?utf-8?B?b2ZPWVdHbFVFbGhvYjQ1UkdtYTBkQ2djZEJlY1FhUkh6K1U4Z0lvQll1TjF5?=
 =?utf-8?B?dDYrS3BBcWs0SSt3MCt0UWlBcFZYSnVEWGVtZG9OM0ZtWFk5K0x1UFNVT3FT?=
 =?utf-8?B?S1RoSGZFenVRMTA1dXlwNjNkRk4ybktKVk9zeUlJeURpd0UwMW9EU2R4V0Zt?=
 =?utf-8?B?aE44dWVTVVVhWitWenJYTGxPVUtoVnNHTTJjeitJNE0rZ1crSFhzRXp6VzMz?=
 =?utf-8?B?UkFuc0dRTjVudFgzc3Yzb3c0SXNJa2JhWXdoZjQ4TGFKVE9kb1ZaVnBjbzJ5?=
 =?utf-8?B?ZFU1NE9melo2dUZydXROdnlJRmxnVjg1ankvbjBTWkNwdnRsdFI5b3F2anZJ?=
 =?utf-8?B?eSt5RXdEUzU5YWtYelF0NkIwdmNGTWRwQU93aGk5VFdwQ1ZWWWpTTVc3eGV4?=
 =?utf-8?B?ajBsZDVxcVoydGJlV0FBcnVHRHhlMkx4L253TGJ1LzgwWGZjUHhqcVR3clZJ?=
 =?utf-8?B?K09pOUFYaUtqbWdNMXYrWEpwYXA5NmFYLzg0dVlpY3pLdHpCaVlJc3pjSXpl?=
 =?utf-8?B?WElhOEIxQkYycEREaHV4Vmd6cU0zUHh5ZVViOTVQVzA3RG9YK2owVm93b1Q5?=
 =?utf-8?B?ZmpnQXR5MVYxbThiTGoyL3ZTV2RXdWZId2hJVXNscSt4TnZQaXRTbCt4VWtI?=
 =?utf-8?B?b1ZBSC9RZkJwSzB1ZXdTU20rdCtiYnFYUWd6RHYwSC9iN0ZMVzBBZkZWOGts?=
 =?utf-8?B?dW93czh4QWFsSStBa0FhT1VxK29kU29QdmN6eEl2bzhHcEE5c1hUQW5Iemw4?=
 =?utf-8?B?UjBxWHlrd2VMQXJHaXgvNDJSRytnU1JjZlVwN1A0U2huTXdxM1UxQWRydHFG?=
 =?utf-8?B?ZElFV0J5ZFpkV05mVFdCRFZHek9mYWcwTGVlK29YL0lBVk1uQlFFNm0vTk9W?=
 =?utf-8?B?dWh3d1dxbDlQcFY3M1JyWFduTDc0M1JBVlpUWDUwRkNkc3prSDUvQkY3aWVP?=
 =?utf-8?B?M2hnaEdmS2sycmYxZjQ0Z3hWT0k4M3M0V0ppdzRoWHRJWjRwaGFxVjBxOGxu?=
 =?utf-8?B?YzI2b2tsdTdsdHBJbDE2UG9wdllqUUxGMWVtOW53VURQdklvMytRMjhqVm9q?=
 =?utf-8?B?WEhsRUJ6Y3lCS1FpbllRcW04TWZoZm5pem1adDNKUDFBemowamRrSW1yK0hM?=
 =?utf-8?B?M1Vxc1RPekJOdUdHTVBPYkxvTVVRUGN6S21VZnk5U3B0dW9nOEFMdUZGWUJF?=
 =?utf-8?B?YlpRYjNGNE8yN1RpRGY5QmNUa0ZCNFpkQmFSNE5OZiswWE0zeGRlTWtQMVIv?=
 =?utf-8?B?SlJwUU1INmF2QlRYREdvNzR6cFg5dHNoVmp6NGNqdVNHcHBaSVBuZjNIczVQ?=
 =?utf-8?B?aG1WTEx6bE0xR3hHMXlDVUxsY2IyM0FJQVA2aE1EVVZXRTNNWFp4R0xaNWFF?=
 =?utf-8?B?eEYvaktud0RtTlV6N3MzUTNZSU43ZFV0UjBiNjNhdjRYa3pOMTk4N0RidGt2?=
 =?utf-8?B?a1BXaXk1OFRqb25seks4ZTRSc1pBNC9xNjJiaXNDZTNLVTVKNHlrYTRlL1l2?=
 =?utf-8?B?U3pwcUM1NnJIdUwzYkxMRE50cUdIZ1ZvUUtxTC9FQzRIajQ5SFlCYm9Yajlp?=
 =?utf-8?B?REQ3MGVzUW5BR0RUWWEvcERHSkJmcTRyVE5WN1RONFpFRm9uZ1NSbTVhVnAr?=
 =?utf-8?Q?kZzMEBvFMoBcKkNUYBk06bIhoV+UrBTyGk7F4S04RNsbj?=
X-MS-Exchange-AntiSpam-MessageData-1: mF+oTGRYgON3+A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 206cced3-c043-451e-eebc-08de8973b78b
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 07:05:22.8037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: azk94Lxn9SdWYA6NHEGx3cC9nQXcngvdpM/CjBSUaXk8C5OiIMJHu1FqPliiOnxrO65Z58I9IX95DjCY+P/b3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8712

On Monday, March 23, 2026 10:07=E2=80=AFPM Nicolas Chauvet wrote:
> The primary_format and overlay_format were picked from earlier tegra114
> generation instead of using the previous tegra124 format leading to
> missing format.
>=20
> This patch is RFC because while it's unlikely that format availability
> have skipped to earlier tegra210 soc generation I haven't confirmed
> any runtime error nor experienced any regression by the lack of
> availability of theses format.
>=20
> Signed-off-by: Nicolas Chauvet <kwizart@gmail.com>
> ---
>  drivers/gpu/drm/tegra/dc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index 06370b7e0e56..d5896f12f25f 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -2942,10 +2942,10 @@ static const struct tegra_dc_soc_info
> tegra210_dc_soc_info =3D { .has_powergate =3D true,
>  	.coupled_pm =3D false,
>  	.has_nvdisplay =3D false,
> -	.num_primary_formats =3D ARRAY_SIZE(tegra114_primary_formats),
> -	.primary_formats =3D tegra114_primary_formats,
> -	.num_overlay_formats =3D ARRAY_SIZE(tegra114_overlay_formats),
> -	.overlay_formats =3D tegra114_overlay_formats,
> +	.num_primary_formats =3D ARRAY_SIZE(tegra124_primary_formats),
> +	.primary_formats =3D tegra124_primary_formats,
> +	.num_overlay_formats =3D ARRAY_SIZE(tegra124_overlay_formats),
> +	.overlay_formats =3D tegra124_overlay_formats,
>  	.modifiers =3D tegra124_modifiers,
>  	.has_win_a_without_filters =3D false,
>  	.has_win_b_vfilter_mem_client =3D false,
> --
> 2.53.0

Looking at the TRMs, I think indeed Tegra210 also supports the=20
DRM_FORMAT_RGBX8888/DRM_FORMAT_BGRX8888 formats, so this patch should be=20
correct. Functionality-wise, the formats aren't handled currently in plane.=
c,=20
so I don't think there's any change in functionality.

These formats require enabling byteswap -- so do RGBA8888/BGRA8888, but=20
plane.c doesn't currently do that, so I wonder if these formats are just no=
t=20
working right now.

Thanks!
Mikko



