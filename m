Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013017.outbound.protection.outlook.com [40.93.201.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF333B47F7;
	Thu, 30 Jul 2026 06:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785394138; cv=fail; b=L7/EoUTvm1HFINdNB3BusKcui2Gc5Djz6MfBm2AZI53NCM913CD5IZtkj77CwNW+o/ua0OXdUeXIBTN43pjAVefq6Znhgb1UDJS2E0iVUsVM9wmlgJwSG5DOXGtR65HkP3ToRjCaCv9LwFpL+AFpOEcTEw42dsevvqeFzLGG5FA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785394138; c=relaxed/simple;
	bh=AuzfP1X3NdHrl8hYVyn+oDexGobBS18bX6F8h+Xx12w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qDoEC3J7htFSD5I/xC1RZrzAUlibHNo+vvxRvxJQKAdYTpSXR/Y5UrDznGm/LftvGLPhy39i8PAdp2b70mj8NpZvA0W4t6b3m158RR5aQRzc+DH/xDUDgh79knqVlRofKe+VeLzmTvQfwLrNmpUc/FRkjOF6CEyLCsLrHrYqBQg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YElovB1E; arc=fail smtp.client-ip=40.93.201.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YElovB1E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8ESp/NoFEawM9KgCH+t1zWA0vv+TM7xYYLhcYvrxMQgyZ5DDlFXoCxzRw7PcrIYUlRReQEJ9t5PL6yxK++c+B+VSa+FFhm2s7cIVKt7EKpiOM/nslOOEDa5LL38rw3BXdylTildM4s2NlPTqTqAMNbQH2+Ftz53JvQZ/j8rf+jMl4hhQZfwY1vE2Pm30CpAq9/IEylVXzwbvYbOBHvZLBMRUTNeTSXStDkP+YHSD8S+PNL5t/hP9s6ztnDtkTf9a01yF0kxbnPxrhFyrkS+IT8c0e2XKY+5ttl0O4ejKy2Jgk8k6ANDiiGEU61DJetgLUZCeFdYfGgAZccC523RZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+PJ1luUnaRz8A2pl1o1dBA32RlHC2KLulayUi/kFDys=;
 b=pT09Na5p2h2vOzI7CkjEj+D4OR3L5TXr5mYecP1MahS4b3yIZFoosqfkgr9n+Rj4Te99wEUe2H9KEIh6CihuxR1TUkxPwlqySWQfNb1YIS5uNZO2h4I3gK3ZBeoUB1Va98ucg5i92Wq3v7nQwRHTEs87FBaK9tANFNlgowOqRJNTqWx6DBivd0WWFCCXKhkUk6EOjLg2RomSLuwkm6vyQZaTlEhZiicg/CfHTUDWBGNQOQWdyVRDUgu57/9VV+5wbx6RqsTyDQHtjEk3Hmctfek2UrilLwdsKk90V5QDqVvhvpe7T3HtQyuX6aVmUntn8nWalC60VXD31yweYwJXjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+PJ1luUnaRz8A2pl1o1dBA32RlHC2KLulayUi/kFDys=;
 b=YElovB1EtRC1c+ivGjRxln/4qSkrZJrfL0Z9fxE+KAqCtRoJ2s3mDthlfsKjFXEe2x8+8Hd/R529rSDiVa5BX3e+M8EMABehw0OXjNB1mtZAXHWIpxDpg+iLRTv9UY274oCGYvDuvRHKlEzST9PsPxlf7Sj1VJO8GwLqW5GoBYPGZvxyry3dxMFW1wW+s1oQdVfKnmpDLyObus9zEe6eNHbmzJcZcT/y0wAzp/DjXxS8oIfnEKE4vWeUM6NPVom3tDA2bxrSSERvbRKUonVZ0otC+JWk47lHZXx0WgDQlIAD9WMpUrj6zFjrD/Hxle01Cwm5EeiszWQ39cYlTMcYJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by SA3PR12MB8810.namprd12.prod.outlook.com (2603:10b6:806:31f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 06:48:54 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%6]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 06:48:54 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/10] ARM: tegra: tf701t: Add core-supply to PMC node
Date: Thu, 30 Jul 2026 15:48:50 +0900
Message-ID: <3JQnU_sURPCAZW10tQPnUw@nvidia.com>
In-Reply-To: <20260721101059.451699-3-clamor95@gmail.com>
References:
 <20260721101059.451699-1-clamor95@gmail.com>
 <20260721101059.451699-3-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY6P301CA0033.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3ba::6) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|SA3PR12MB8810:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a744ed0-eccc-4e43-95c2-08deee069f1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|10070799003|1800799024|376014|56012099006|10067099003|18002099003|22082099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	kGjcn6qOBZtA3ke5arr7h6lIKmjv9yBwSPgqWxjXuU0oGUIM6K7sdo5ZQaKB3f1cKKNBQ1ZesQbCgj16K2rTXlVc04ApxK8tM51iHh890gbK//9Te2LujaDLAbQdExjXXnJqXo0jn1tWwIHP8pmR8lBAT6DD9U4tXrH+w+LU9DzGrynDRZnNtMbeisYChLoVsvu8A2eMHuXayN+dePIet8ZwVnZ4wi8iR56I5cZmuOKTGlLXQf29mfNcax5Rwj0bcyWYgfeihBotMBw2DMDCCYNzTuIv4Su5k+oRzSaKKbLaQ7Z5pO7xFrecdoW+p2DsooXQDFxvz7syATzAfbctrtIljVabPCiBud0y+z8sjjTPHhICH0HbP6Asq6eDim4RJroQs6Q/MugX8hri+Kk4vjDaPsauEL3Gfbe57Zif4Ha3kyVQIBRQmk1vjE/v6P3iFJ7QcbHeOFwBR2czzh2YQYjMngslMUofIxH3l6Ln/MPuJ/7faZPErBSJLyv6grB5ziW82njxCOFwOFaOVPFWScaLs277YxdScDrOzu3exzkCfxzNAZ0A69Zz7xMX0ysEkA2pPiktqu6PLlFzstx3BVHWy0WW7R4rwSpO8ho/WiGeNmVgh07U5w0uoXUfgvmZwGBxnLH8Vr2XWGxzNeem+F6QmHZ1bieesqfIYdudumk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(10070799003)(1800799024)(376014)(56012099006)(10067099003)(18002099003)(22082099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEltWkMxMlppL2diWGwzRHBwaE9abHNTeFdRLzZDRFBMVlBWVE55WHdield3?=
 =?utf-8?B?OC9DcS9WQllkMTVaSk00SVZUclQrSk1QNk0zc2FYOCtocHEvOElidGp6SGRo?=
 =?utf-8?B?YVI0SE9IVHNrMG84QXgrNjAyYU5PaGlJTVJ1Q2hxSUoyL3VoU1phdno3eUxC?=
 =?utf-8?B?RXgrb3I0cEc1MHp1cWszaVdCWm5Fd0ZLcVYxVElNWHdvcG8yWk5EVkJ5ajJP?=
 =?utf-8?B?eGthZFkzN1M1L2JqUXRkM1pBbVlrVEd4NkNnZFdCMmIrVmxleGM4Q3hKbmlu?=
 =?utf-8?B?aTFBbnB0ejAxYmtPM1o2SFFSczMraXBydEpuM1N2L2xMRFZEQkJYTUtEZUlO?=
 =?utf-8?B?Tm1UR3FyMnp6YThqcm5pL0U5cHlFR3R2VUJpMGdpSno2NmxZSGlaRDJYZHNp?=
 =?utf-8?B?eVVGVmxwMVFFczN3YXpSRFBnUkdWbnQzcmkvdkdpUmFxNHE0TWc5R1Z4NDlh?=
 =?utf-8?B?c1orSFM0OGRTSjQyOW9yRm9jZTlGa1RMZnBSYjMrQW84UmMrelhNK2hqVWRZ?=
 =?utf-8?B?U1ZHc1hjT29Yam5KdlJPbVJWN2Mra0NMcVppTkVTTi9BTExFd01rSXF6cDRv?=
 =?utf-8?B?dllQWnI1WktDVlg0b1Z4S0s0bC9MRzV5anlKTUNMeUpuNzkyK0ZLWG01QmVP?=
 =?utf-8?B?YlkzL0hkNUwvaytvdjBWdmYyNVo1RERkMlBHTGtFRVRSWk12UEJZWTB1Uk14?=
 =?utf-8?B?TFNtRnFCb2E4bTlpUmt1c2g4elNvN2tUQzZSTC9qeEpGOGpyL2RlZnZpOGp2?=
 =?utf-8?B?Mm9nWWZLZGtTN0tlcUExenFxNHNsTHllbFd6czFTRU8za25RcUxHWVA0SWo2?=
 =?utf-8?B?WVZJUy9vYWpWSHlKTERTWG1RT0hkT3N4V3BuNlIrY0dUU1Q0cnpTaTVvQjg2?=
 =?utf-8?B?YXVhN3UyWXk0N2NkVDRtb1UxNDZkeE9naVY2Zi9veW5tZndXK2l6WDBHUFMv?=
 =?utf-8?B?UGw1VFZUSXJ0bUZXNS9DRHB0V3dQM3ZCYlB0TWpGZElOM0dLUGRlaVd4SEpr?=
 =?utf-8?B?Yzkwb2dxQmpRVWtkMUR0enFTNEdkTDcyaXFTL2prM3ZwUEhFemM5M1J3S01O?=
 =?utf-8?B?bWgwUlIxTUV2VC9pMG5GeTJvQlV0VDZPVThXUDFUa0lpWEpkVllrNkh2b1VG?=
 =?utf-8?B?d2FTd1BWby9BUEI4cldnTlJ0cmx5aytTTGxMdUtDbVJFRlVCTWdXUnVvb0xa?=
 =?utf-8?B?L2YxQ2RoSm00TnhabU8xWms4MzFwWmp0UWdSQkFnK3N5ZGpFYWxkdHJpblls?=
 =?utf-8?B?bDU4a1Z6R2NQUllBeG9lRTkyajI1NU5wSXpMY3ppTWRWd3AzZG5taHVLaW4w?=
 =?utf-8?B?UVdiTFg1c1JPQjFEM0dzQ3p1OExUS0ViWFd3L3RVaHJ4c041TUtna01aQTJs?=
 =?utf-8?B?T1JDS296L2M4R1dGZGxHSFBKRU40eUtRcnNZQ3VDaldrOVRnL2xuTWw4U1Jw?=
 =?utf-8?B?S3VLNEYwTjE4VHdrYi9ucVUxSU81OW9ZVjc5eXdxczJ6SmZ5UXVZbFRNTm0x?=
 =?utf-8?B?djh5UmFheEtMTENjT3ZlQlJ6S2s0b0JlZjJqTVNqVmgyRWhuNnJWQjZUSk8x?=
 =?utf-8?B?RThzK3VyT0M0RnZPQi9tRThrejZlYUorZXRTUmprMFpwV1pZWHdDdGkyZXhV?=
 =?utf-8?B?eVZ6djhXeVl0NGVtcTJRcHNxT3lyOVVlNUkrSFpNYjhPU0JlbFNXRFgvc3BO?=
 =?utf-8?B?UGJyOFlnbGJqVjgwRUVmWWR0ZTg4NmtKa3NHSW54RnR1S0s1WjNXa2FxWE9o?=
 =?utf-8?B?ZGtuWFdzek5QdFNpWk1KaGNmZWVuMkNHWEFUeENmdVRmQ0FXMU8zYWdLUnFs?=
 =?utf-8?B?bWQ4cUdOQTFoRVNmVDgyOXJuNzAxVC9mL1c4V2Q1L0VSTlltZXBlY1ZKQXRh?=
 =?utf-8?B?NzhaUmcwQWIwRVkwdml4ZEJIMmRSN2JkOVU5MHRsbEJ1RGJEdGZrcDhQOFpm?=
 =?utf-8?B?dGtoT1ZrWEgzWXVqcGZWS2RvWWVCQTlHUC9uSEVON3JOb255MWdqLzQwdHJQ?=
 =?utf-8?B?d01nY2FzWkp4L1RkZHBTNEdOYTJwZVppZ0pCTEVhdlU4ay9DdUZPaExLTkMy?=
 =?utf-8?B?TytCNDJLbnJNUzRiakZKdmRnd3VRdmQ2YjVaNHhxSWhPZXA3MzhWSmpRdFV6?=
 =?utf-8?B?VWg2SnhNOGtGcGxtTENvSlZRdWdyVklvZWNKUlNxcjF4aHNYYkJ3WVUzVjdx?=
 =?utf-8?B?U29sVjN5V3dFdVZ2bkdWQ0pVUlhCYmM2cWhlODQ0NlZmT20wUGp5L1ZVcnI4?=
 =?utf-8?B?bkt5SGpqVzZXNy9icFRzNTE3cXJsSGFuSHVPeXZoRGFlUUFBNlU3MWNzN25i?=
 =?utf-8?B?V2dZcmtTK0ZKSFZ6ZHlXS1RHWmY0SHJFQ2dwZkdjOGtOTzZxYkNPVjZKWitX?=
 =?utf-8?Q?o8qwDsXyKFtDeTuotbaOzu601LE9w0jH8g67JPACdQ8B2?=
X-MS-Exchange-AntiSpam-MessageData-1: Y+KI91bwYSTm4A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a744ed0-eccc-4e43-95c2-08deee069f1c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 06:48:54.1048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d/GgMT81k8x96InS8d+fEdikFVRT9YgPjNoEsId9uC8fw/bq9+hpnP3lm7EGI5D95pBO2tCEOS9biJqqWgCPuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8810

On Tuesday, July 21, 2026 7:10=E2=80=AFPM Svyatoslav Ryhel wrote:
> Add required core supply to Tegra PMC node.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm=
/boot/dts/nvidia/tegra114-asus-tf701t.dts
> index 5358cdb6efc10..55e9256e80f33 100644
> --- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> +++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> @@ -1599,6 +1599,7 @@ pmc@7000e400 {
>  		nvidia,core-pwr-off-time =3D <2000>;
>  		nvidia,core-power-req-active-high;
>  		nvidia,sys-clock-req-active-high;
> +		core-supply =3D <&vdd_core>;
> =20
>  		/* Clear DEV_ON bit in DEV_CTRL register of TPS65913 PMIC  */
>  		i2c-thermtrip {
> --=20
> 2.53.0
>=20
>=20

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>



