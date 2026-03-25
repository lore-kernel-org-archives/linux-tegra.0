Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010049.outbound.protection.outlook.com [40.93.198.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94697202F70
	for <linux-tegra@vger.kernel.org>; Wed, 25 Mar 2026 00:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774399852; cv=fail; b=njFUS26gubkA88XsRPSwkcv3tbY92zkgfcQW4WW5ecejzWSPecPBfXGkssBRtDVb3iAnS/cyB2blvD+grUlB2d1QQuLuGwF6PKRhdl2s29w0wGPynQmAPvOKivVyffakcV5Npney7jHgKba+iHuGMmkDFEmwRLd50Dii9SXXsy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774399852; c=relaxed/simple;
	bh=Gf0BK676OatxJY7UVHFU2TTU6heoO0G5Pz05oU9O8ms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y34gvd5kEFL6unbS8g4Elqg7SEthTEE3xEb6KbKqxmCOwYmnQTd4wSo/dGxWzsI/lsaLCK7uXn4WOQXKXwZ0R9eYF7y5haha5Tx8INPXYWgVo2BZgvSjQtHfy4YCPtFiVRJc7owwgL8VjfABX0DHqF2YmOK/3GHVBjP9WbMpIdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=C38breWD; arc=fail smtp.client-ip=40.93.198.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="C38breWD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aqAOpuxiHc10H37RbFUJKSCf0b/eqiTlHza3FDWYbWCRCv7TTON0WLd3R3CE98nYSMpOebTPN7ZDNRMCoijWthAu+52njVo8x4GCcy88s55R+RloXRmFTwUYTU+D2rIZHCq3S3Z18WhXkLCC/Sbego0Hg5kFMMcEUkMazVluWskz0ZIaFgp8jSJcklRnmEkB69SutgY5iuU86UKCJW+DlkrZ4t9Lc1JW5tNAfpbzetIwxClwKU+9eSfAR5RY8qzHeNf+hPjNfMp0gcdbqwJuciydOmrmsBHSANFFFuxX/n4fRvlbFHEETHxoNiiCq57iwgp7yiWujZLpdoG42tbNmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pr+gUJQPubd0R42wHmgmSOIX4d6BaYQRG4Yf3zTlyt8=;
 b=NroMATndYuhwlEG9fyVpOkrH2o+DBv6KeTnDbVbIayMyz2Yn4Ti/NaWC8BHELCiEmvSMsmv6opSwik3URgz/LdIRIXjtnV/U1zF525nAGtIC7YNsg0D4nnVKh3AzrftITUUdHRw1dOPEwnI48AJ0ADZZB5qgnaVlAVUNBeJqoqzTLF7WJPKsDIzaGmcJyxqAX/SJhkLRCNBrI9YoO8+N+901ogxxrcHKkn+8dvmQbirPm+hVPynMpnpmMmfUxS2h2D5yVpXFvXvUADILQu+Qn4TEUhyGz7CTodF0vOYoft5bPx48P9NjqNNkKlCEZYvGJwQLJ+1sYlntFvMq9BsCog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pr+gUJQPubd0R42wHmgmSOIX4d6BaYQRG4Yf3zTlyt8=;
 b=C38breWDutYm6ZL01EHIFMKm8/PxLIFFVD4woE/rh1dprbbGoH96dadyCez9vmfUNMo3FvJ5mcAiP76yDFO90w7uLnvA2JN6WuTcLgoQLX4Zfn2sDbLfQc5C+EQwgZLnu0y1YogKB8sU2YkT+qm36i+DFaN4XsshDgTWqo9dfCXSyxPwpsPBJ6iCrbPsxVb0qTyPoWWYaTfg6TAGCEvOnXvwlyBgxEDMYaBHyEhjqHaa7dajyw7FvnDSkrMrnxvrQ+FW4ew3qMt103H5oXGc6+JbScpEbC43/TorzxeLfp2qSaEWb1N4DbJj0RDcPPjGzq+MdtYrs0LE0czDb3GAGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by CH3PR12MB7571.namprd12.prod.outlook.com (2603:10b6:610:147::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 00:50:48 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 00:50:47 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Nicolas Chauvet <kwizart@gmail.com>,
 linux-tegra@vger.kernel.org
Subject:
 Re: [PATCH] [RFC] drm/tegra: fixup primary/overlay format for tegra210
Date: Wed, 25 Mar 2026 09:50:44 +0900
Message-ID: <6610665.MhkbZ0Pkbq@senjougahara>
In-Reply-To: <acJ3g4_DXDLBw5oO@orome>
References:
 <20260323130804.67936-1-kwizart@gmail.com> <10027014.CDJkKcVGEf@senjougahara>
 <acJ3g4_DXDLBw5oO@orome>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TPYP295CA0052.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::18) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|CH3PR12MB7571:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d9827fc-9b81-460c-bf7c-08de8a088dc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	fW+qzosIIR8nwKOh44uvzG0MS2JkDK+79sbQoOcWI1qWvulhTreiLtqpBO43C7pbGzZEHuGJSIcTB8C7zasnIGtLOxbzk6okgks1emDXSn0xhxDo5opG2KEGpLMa4Ulc46oLNTQSjNDHwrDhkb0sAQuia7ic3+tC37w04h1aAmeL5fzr+MeMvDA1vf4iDw3r71Q0t2svdcdY8tanbd3lldSDcPMznWQj9qwfSGiRAiBCEtRcOZShxwoFvQQvcq/BMQ+QZZaLfK8hlKN4bMk8jtB9jiKKL7veRlkqz2cbXUsfGmp2Mzl18FyTMp+YrbZ5G1fCMkezt7rsxH5ZydXQ50QItqSjln20sb3LuHjdqc9TftqBLGH8v6CGpxKgZoAtm6HsYZ2Q/lZ9MhS4Tw+dOT0KcrPRdH1IFiyGLgILQbCPG8ctLmkABuH9ITOZ3jU1Fq22WH+0sXcF/3iTP9Fi1M4SKtrYZXkniNeD3GxOct1swz4IgnlpnxD9aLIXlz1sy4YNcq5YRwJuWGhVvYZ8Hj2G8KvuK8fufaf/u7udfg6Wg9gzRO0wyQkZZkzuTzkP1v3tq8ePeQQQLZuKQ8i0ocv+k05raIf8Yy9WsxMF5u/0Ha05PXDrcnaPEnCFJOSmyypWmMGH5vEhevfNeZhaaPqwyvD69FWbxwHzzq42enkZVlXR10xb6AIRgZ5k4q7gYeqYX7SrZSxUrAq8JVL0eEza6WiEKKyup75mDI0AOwk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVFoMXc1ZkQ3WjFxMEg3dTJseXl2dHlrbUovb3VSNS8zU24ybkoxNHJ5Qko5?=
 =?utf-8?B?K2xiaWJrZndFSWRTNTRURnZDSkhYMk5zR2VwM0tkSVFZQ2lsekVHK3ZUdGFj?=
 =?utf-8?B?RGlKS0RYcWRiUHJyMHlGRmtoN0N2YmQ2WWYwQmZCQ3BLRjI0K3JEdW8vdzdN?=
 =?utf-8?B?WTJhSkZ5czJUbGtpY3RlZ0NXMTI0d09oZi96b2xlRFNYWTQxaC9QaXJGSHpZ?=
 =?utf-8?B?ejd0ZW02NGlnejBlY3ROZEhmSmx0cmEyQmRqZGVvUFZsUU5Hd1oyUW8ySnAr?=
 =?utf-8?B?b2M1RlloNHA1UmdJMUxidVZ2VmFwT3ZMb0hhN3JiYlgyRDFsNGNCeUF4Z21O?=
 =?utf-8?B?eiswazA0VTZVaEFpa01Nd2ZPd1FrekhUTFF1UG45L08weFE1dUZDckI5N0dC?=
 =?utf-8?B?blBTM0FSTWVBR2F6UnlUZ05USCt0cng3S3RHajVRY2wxY0dpNlhPRlhEMG9a?=
 =?utf-8?B?OHF3LzNVSXhoMWY4cUd4OU9DT05jY280YnhoNEl1UkNJcW5hK1NvWW04MkdL?=
 =?utf-8?B?aUZzSTdjaGhUZTFwZVYyVjZ4dythaE9XZCt3SzdjYmhUamt2K2RwT1QzNWxR?=
 =?utf-8?B?MGdleTNCV2V5V3hHU0FUa2J1NlpCQWs3dlVBbHlSTS9PcUZpWVhWWXRpM0lt?=
 =?utf-8?B?eW0yNTZEVENONjlmQkhrWTlnYzNpZm1lT09xbmw5bnlRMHBuV0dCbFpiRm40?=
 =?utf-8?B?WmNmWmN0ck1JQ3IxcUFnWTZqcHlwQ3Q5YkdXc1dQREk3U2ZXMFdmVEs1ekpk?=
 =?utf-8?B?YUVNRmV1NHU4TWE3WHlFWk4rMmdWS0QwSU5XZ0hCNy9pcURhS1RjcmVMT3FZ?=
 =?utf-8?B?bXZlZHI4N3lnOGs4U2JaU0VXU2hpUDJ0Z014QVhlQVNtOXd6T3hGVnMvTHBK?=
 =?utf-8?B?ck82VWpxWlNzME1BZ0pNN25DUExNYXZzazZLamxBS25KaDI1c0lSL3ZzK0M5?=
 =?utf-8?B?YndPenFIZTROcEJYcXpybkl6dCsvSzcvMFVrVmJLTG9pRXpNNW9zMWltZ0di?=
 =?utf-8?B?WWxzNEorbFBrVnJZcThPcldpNit0N0cyL0EwR2d4dU5NbXBZSG9FRjVwKzJ1?=
 =?utf-8?B?enlUbkNqdTV6U1E1a2p2U2crYno0a09JS3dKRzUyZ2I3ajQvclUxRzExelJO?=
 =?utf-8?B?TENqdEpGY0NvVWliaWdtVHVCcXlSZ0hkQmR2VDg4dnNpR3NPTzRlemU0YUox?=
 =?utf-8?B?L0ZycldBQlk3OWp3RjRUTExWV3ZDNFBTSVJlT2dTdnR5SjRxT2ZMcFdlYzdK?=
 =?utf-8?B?OU1PV01VNzJ4Uk96QXNLMW5WbDRaS2I5aUhuMGRIV0U5cHhxcEZDWVRkRGox?=
 =?utf-8?B?NVlEbk1RQW5EQm5veFlpWVd3cHlRU2MrdEI2cjJSdjhrL0I4SktjWHFpRDhW?=
 =?utf-8?B?dis4ZWs5VHpuVXp5UXZEWVJsQWx4SVhVRlJVckxHYXRwbUpCc2NtQnZIN3FB?=
 =?utf-8?B?YzhxYVFQcVNSdzRRNUFoTjV0OU9pN0Q1YURleXhROXBiQms4dzRJWHFLNmtj?=
 =?utf-8?B?VVExOEtCeTVPcmE5bWVXc3ZyeU9ZSVQyQldmMkNGeTREVEUwM1VQYTdaYW9W?=
 =?utf-8?B?V1lvYVNzcFlQeXBGRzBEREJLVEp6Z0hNWDdJd21QbWNuS1BxRFJoaVRmTCsy?=
 =?utf-8?B?SDZaT0NvdE9ZL1Ztc0hSWDRnY3V5Qm5QRjY0RFZXOGVLd1FTTFkzNVVvWHhr?=
 =?utf-8?B?aTc4VTRhcm05cUtQeXhyUEFCbWdPQzh2Q2o3VTYvbnBUZU1hYmVuaURlaS8x?=
 =?utf-8?B?WkhOTVBPbnRPRDh3UVZ6VDBEY1JiemhNTENESngwWGhrcXhFaXF0eU5QSU9n?=
 =?utf-8?B?ZVVWVENWRzEzNWdGd1Q2NTk4R0lsZ0daL1JtcmRYbTYyQmNFVDNXRlJ5R1FS?=
 =?utf-8?B?cUpXdE5Nek9SUWVvMEhRdWtLcEVZeFloeG9pK0dQUExxek5hRDBlVjRVdzgv?=
 =?utf-8?B?RWZXbnZFL0w4c3hscjVSQ0ROVHhURkErNzIyeVBJWDA5cjJjVFdxOHpYa3ZK?=
 =?utf-8?B?Tmt5UVJVa24ybVY4dVlFL0MrVE00VWNPYnd2RWtPRU5pVlVTWjJ1SWNic0Nn?=
 =?utf-8?B?UHJIdTZVdHVZZVh4ODhpM0pWQjNJWThZc0EwMVVPMG5EdXhUZStlUU1JSFpG?=
 =?utf-8?B?VnJYbEJ3U2hKNkhLRUdSbVpOalB1WFlrQzNuWGtGdXQ2elFZM0RjSVU0WTc3?=
 =?utf-8?B?Vm51UUJEZ2VjSmpRdWxjYlFpOXpWRkp5T3hJT2RwS2xjc1FBQW5CMWQwUEJY?=
 =?utf-8?B?NEk4UWlPaUlSQkFjQmZUSUx6ZUkrQXcybmVVWUpVdU4zeThzSWxuTVUwb0t4?=
 =?utf-8?B?Mnc2bFRuaUh5Y3pHVHZtUTZzL1NzcnFmUVhxRW9WVW95Y3RCRWhEY2d4YmxX?=
 =?utf-8?Q?nYsKFb+qX4Sw5B9vmufXyFH4z0/RoryvbFRtvZIilHoy+?=
X-MS-Exchange-AntiSpam-MessageData-1: v1+ZXlu9ujo1CQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d9827fc-9b81-460c-bf7c-08de8a088dc8
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 00:50:47.9123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NC6b4rlA04+VHOjLoRXVBwjhD9BGzdEuNw+AaofJHc9m8ra4UXllHRv/oEGpURFHyJ++KZ2A4BEvYJhqakilvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7571

On Tuesday, March 24, 2026 8:42=E2=80=AFPM Thierry Reding wrote:
> On Tue, Mar 24, 2026 at 04:05:19PM +0900, Mikko Perttunen wrote:
> > On Monday, March 23, 2026 10:07=E2=80=AFPM Nicolas Chauvet wrote:
> > > The primary_format and overlay_format were picked from earlier tegra1=
14
> > > generation instead of using the previous tegra124 format leading to
> > > missing format.
> > >=20
> > > This patch is RFC because while it's unlikely that format availabilit=
y
> > > have skipped to earlier tegra210 soc generation I haven't confirmed
> > > any runtime error nor experienced any regression by the lack of
> > > availability of theses format.
> > >=20
> > > Signed-off-by: Nicolas Chauvet <kwizart@gmail.com>
> > > ---
> > >=20
> > >  drivers/gpu/drm/tegra/dc.c | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> > > index 06370b7e0e56..d5896f12f25f 100644
> > > --- a/drivers/gpu/drm/tegra/dc.c
> > > +++ b/drivers/gpu/drm/tegra/dc.c
> > > @@ -2942,10 +2942,10 @@ static const struct tegra_dc_soc_info
> > > tegra210_dc_soc_info =3D { .has_powergate =3D true,
> > >=20
> > >  	.coupled_pm =3D false,
> > >  	.has_nvdisplay =3D false,
> > >=20
> > > -	.num_primary_formats =3D ARRAY_SIZE(tegra114_primary_formats),
> > > -	.primary_formats =3D tegra114_primary_formats,
> > > -	.num_overlay_formats =3D ARRAY_SIZE(tegra114_overlay_formats),
> > > -	.overlay_formats =3D tegra114_overlay_formats,
> > > +	.num_primary_formats =3D ARRAY_SIZE(tegra124_primary_formats),
> > > +	.primary_formats =3D tegra124_primary_formats,
> > > +	.num_overlay_formats =3D ARRAY_SIZE(tegra124_overlay_formats),
> > > +	.overlay_formats =3D tegra124_overlay_formats,
> > >=20
> > >  	.modifiers =3D tegra124_modifiers,
> > >  	.has_win_a_without_filters =3D false,
> > >  	.has_win_b_vfilter_mem_client =3D false,
> > >=20
> > > --
> > > 2.53.0
> >=20
> > Looking at the TRMs, I think indeed Tegra210 also supports the
> > DRM_FORMAT_RGBX8888/DRM_FORMAT_BGRX8888 formats, so this patch should b=
e
> > correct. Functionality-wise, the formats aren't handled currently in
> > plane.c, so I don't think there's any change in functionality.
> >=20
> > These formats require enabling byteswap -- so do RGBA8888/BGRA8888, but
> > plane.c doesn't currently do that, so I wonder if these formats are jus=
t
> > not working right now.
>=20
> It's been a really long time that I've looked at this, but if I recall
> correctly at least on pre-Tegra186 we properly program the byteswap
> registers (see DC_WIN_BYTE_SWAP in dc.c's tegra_dc_setup_window()). It
> is possible that I never implemented this for Tegra186 and later, where
> all the plane programming happens in hub.c with the shared planes.
>=20
> I suspect that for Tegra210 we could add a bunch more formats, and I
> have a vague recollection that I had prototypes a few more a long time
> ago (notable some more YUV variants) but may never have submitted those
> patches because I couldn't find a good way to test them.
>=20
> Thierry

TBH I'm probably getting all the endiannesses of these format names mixed u=
p=20
in my head. FWIW, for pre-Tegra186, we are programming the swap register bu=
t=20
plane.c always sets it to NOSWAP for the RGB-y formats.

Mikko



