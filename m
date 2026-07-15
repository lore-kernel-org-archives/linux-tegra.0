Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011063.outbound.protection.outlook.com [40.107.208.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153E71A9F87;
	Wed, 15 Jul 2026 06:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784096265; cv=fail; b=bgmnlocIBKuG+33XOsU5FzrJ1850DYOcNWS1emSz0SrzdVNzi4upcY48Emg4FPgnho9Zm355tn4hkdRbub36i35Ew7rU7eMsqThG0/6D2uhyR6CUQtTsJZquMVqhSz1OYOiPNPObv4itm4gAKN0PJz6So63+8zEA3gA1PdLtHTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784096265; c=relaxed/simple;
	bh=v/tEu8p/cgeaHiBnjRo93udjDqXQvfK83zEBtcVL4Wk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O9up00pPSq9YtZiOsLG8KKumtdaOvppovnDilUVjDOaALD+H6KC0fgzepDWVdstUidQ6DBgMBkoXQ575w+V2/IyqzmKan1JYCC41AwhhUg6j5si5hOvWljAdiUK0lL03oHuwJNDDXHaGZeE2efm7bx7J3ew57s7WKSI4Elb3Ibs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ukr1LnVH; arc=fail smtp.client-ip=40.107.208.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ukr1LnVH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N1FhFqatUmcYseTvlbXBuZ7f2o+ks5Djsx5xMvEZQ7KFlfs1dVRqMfHOZGdSxME8bh8ZQ5q9XwMo2KWZWvr6CY8wLINZ/VkTBxHQFu35eNE7tDL7asaoltpWuLGCH0lMmY0BjyI3U5dlEHDQcw+k/38b4WR7PWqxRWRTwBE2788oLmblEmasrpQrLz4xkOIOB3OPYIsundIj6kAbLLzs9f4C5IGjKl0f+68nCYTN300GSWkOUpQLTKfYfV6sgpXoKx+CGEKr02cuBmFK+4UkKOg8iM8iwshKqh1hGtbHyTrxRf1X0JiuoBnlfOqNRP7MCt0NXjb2qJuHs43SdxhLwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0nYMS2upB8gwMcuLyyASqE8ByohIviz+3+ir2T9uAfE=;
 b=E8v9oJ53Q8pv/0oW2bnIvheJ+tdzt/Supi7zikwVyQD2KDZ/RBHfqGApWbCi05lO0dMXlHKXrx4X6yXLjZVdneUjCFRhmqifnGiDqmohcLFNhmgr1+rW5xsi09yS79biv4GExMJ7RmZaE2jbGWRj0pY5MukT/SGYUjQc1D3OhHY9bNWDmEq7uiNzEqI64HjjKBGUBZPYKWeGBgwheMOAuLXMjMd0/aPG3lbE5WbjajOxNMWIUjLzoLH+MRAYL15T68iUQ60vUDoR0akl7ecPhpLCxxk7f65zoODY/KXGdlyEfOwIQz/0TkVXDaN/Z3wf0MxR3VFP7DQ7SwaE4Vls0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0nYMS2upB8gwMcuLyyASqE8ByohIviz+3+ir2T9uAfE=;
 b=Ukr1LnVHmtZT9EkSo3Lz/hwxc38hPwInImEyW5AYXWufrycU4Gls7nqyCqRm2dJ5B0vBzn6LMMKtMQceXkeCPmxFNGZJ4saU46vx+Ne4ibhVuX8TbbAXE21N35krIT/3Vh+l0LTDPsXILw3mUk126i7XFfVa1K6+VgyfQk7SwzUtAZyON1t6dtHinaZt/K4S4x8n+0gvl/dz9QFCV5n6MV8k+HfPKD4B3bS8qmRHUzKsbtwybhFLqkh1V55ZTjL2eTMnCWcHBfSd9zkUFsLUk7TMyJypXgRmftTDew3sN+Yi5e5TGWklzmY1klDTwIh1f4NLeyGs2KkpRYq9FgWHaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by CH8PR12MB9742.namprd12.prod.outlook.com (2603:10b6:610:27a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Wed, 15 Jul
 2026 06:17:41 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%6]) with mapi id 15.21.0181.019; Wed, 15 Jul 2026
 06:17:40 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Dipen Patel <dipenp@nvidia.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 "open list:HTE SUBSYSTEM" <timestamp@lists.linux.dev>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Pan Chuang <panchuang@vivo.com>
Cc: Pan Chuang <panchuang@vivo.com>
Subject: Re: [PATCH] hte: Remove redundant dev_err()
Date: Wed, 15 Jul 2026 15:17:37 +0900
Message-ID: <uIEUpy0pQeWhsholK67nMQ@nvidia.com>
In-Reply-To: <20260713132924.403440-1-panchuang@vivo.com>
References: <20260713132924.403440-1-panchuang@vivo.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0177.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::20) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|CH8PR12MB9742:EE_
X-MS-Office365-Filtering-Correlation-Id: 4943dc41-eb7b-4fd0-aa7b-08dee238c662
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|10070799003|1800799024|23010399003|18002099003|22082099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	a6homoaD8+0LGX5LkRGp+7TmuBuHQJN6M7WKZcIoZ9t57CsY/pd8+qFx12FvsWqEOo3SZHqhBXd8rrkOCxXytiYXpig5rR8UaPwdYPZUn4EL37vc0kwFyLYY4X+WxREr8fVoRiPyK6+oOcdS8NpM4cHgzE3GF+GsfjPEF3UUXe3SEhrDcGdew0vhiLKDBb5DdyX1DpYJwJZ6r+3j9yW/rLBqgVqD3DvCrIvo1ahAwm8okF8JNxW5KodgIVNxzt79Zl5WRuWuu7h1MYgWtTCMAGzd9h6p4bPjA5r6mLhRszFIM1cbeqq4H65kZsupZ21KtKqXolTOrmqgip2TUTvOiCPPIqcc8R9K27HbX6BlsLjFwiR2TgqVZUJQTh7THXvLiTff1P3qNZamvBIT4oO/Q2C1Tyw0EaAxVplPKdkzzAtPdjB9ctbMWFISwfTh9LmK5lKo1g0xhb2AO5VxJi++Fgsjcp4ilKgq65cA3yguUI51uXFF9Fb7uA784OZ0peg9aWEtGb9YL/YB5Bvphw1nbf4sNXoe16mNZMBzs3VehYSeeEczCsLXFMXpHOuYZTmZ1AfmdMWHdxR8t80uK9pN5aFjvIuKS1FO14Ood8U5CMr2U/jRLh2+LkhPQPcC1qSkQZS7hLlpAmrs/TIeeQVWR4wOntV24MuZvpw4zV82sNc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ck04aHZ2cFptTUVNMmNrRXhnT2pxNkd0VUtyK3FSYU8zeFJHc1JGY3dhVUhl?=
 =?utf-8?B?eVkzSkZhRUdBTlM5a2Fla1lzMFlQT1VreGwzSUtQZ1B6dm5ObG4zNS9GN1Bz?=
 =?utf-8?B?Q0x0UWZrTVBHdXFKeGEvTEdUVjJDa2ovVDE0RmZzaU8xMUk0cFJ1VXFzYWZz?=
 =?utf-8?B?WVRPRTZMOW9hYThQRlVtZGUvZVZMOUdWeTJUUFMxMHM2ZkljeVFlZm5mTmRY?=
 =?utf-8?B?cGlmZ0JLOGFST0JPdFpVWGtqSXVNYThTTk5nUjVjK0ZOc3dVU2dHc3Z3RU95?=
 =?utf-8?B?bUF2V2hRWXlPVlBqV0RTK2E1UWJlb3Arclc3VGRqMWJYOHpNVFpROGFrNjFL?=
 =?utf-8?B?NjMydUwzQTJ2S1JzZHRsMmNjNHpQQmt3UFgrRnEvWVNYMmpZTWtlblhzbFdG?=
 =?utf-8?B?cS83R3VQOWVIQTlZYk51ZmxHaWZjM1BRdUE4K01PSFZuSGpuOHhTYzBoenhK?=
 =?utf-8?B?Y296TU40SklXYU91dG1NQ0NCNWpUK1V0SENMRnhOS1FHVkJsemlDZHM0WERG?=
 =?utf-8?B?aG9uREJZT1NlLzQzdHA1amxMdTFvd2xMYlkvQmVFV0NOTGVaK1IwOTlJNUVi?=
 =?utf-8?B?dDd4ZzJBeDlZR3JqbFJaa3VCSnd2ZEJBMUZEaFRqVWJLSWMvaksyVDBCeHFa?=
 =?utf-8?B?bTAyZjhmM2VQWUIxVFpHUG1HeEVaTkpIdHVnekI0Z2JCTW15eGNzSkRQQzJj?=
 =?utf-8?B?bUJYQzRLNkFBM1FnWFlFbG5kYkhIUitNcXI2cnFRdmp0MVFlN0FYaGZxdTdm?=
 =?utf-8?B?VHRYWjgwNW45Qk5MUWVVa3Y5Y01ndUQzN0Z0QVVGR3Fjd3NNTWpwWGhOaytV?=
 =?utf-8?B?a092VVU3UkZ5b2lhZ1hZd2FGZFN3emo0dEJaeEdVUEovYWFPeVhwdGhMZERj?=
 =?utf-8?B?dXBSZHNoZUwvME05YURMazMrUmY4MC94a3dUUDZRbi9LU2dCbXJtUTRpTmpl?=
 =?utf-8?B?b1VIVFcvSlJSbWtPdUFqYmdFYUlTU2FpaEtDUFlkY0hpWnJBdE93a01tWWtB?=
 =?utf-8?B?OW95Y0NFRFZJT1J6cUxQNUp2UTJ2OW9rOTBaZi9lQlhzczB2R3BUSkN6YVBy?=
 =?utf-8?B?S0VKbzFhK2MxWDc3S1BwTmVPU2JmUHBsN1Fia1pKZW8wcVZkQ3pEbTNYS3RG?=
 =?utf-8?B?NjdPWkxOS243dkZBWjd5TkNGOEVBVk1NWmp4b3hTS1VIckNQbENHaXdRQ2Ra?=
 =?utf-8?B?YVdWSmw3SEY2UlhBdCtrK3FSM1RyY1BwdHpJTFNDRTRPbWY4c0w1Ty8xTGlE?=
 =?utf-8?B?UUxCVHF3U2xBQzVPTHdEaXU1V1BLZTUxMXNRb0UxSkd5L29qY25CampwYkhU?=
 =?utf-8?B?NmJ0U0EyRlo2NmJNMWpab2Nmb0lZRmcvb1IrUzBueVBYMFFpa00zemxBckZr?=
 =?utf-8?B?QlQ0bm1oWTdzMEh6cndVM1ZGQ1FoU0h2SkU4VStQYUVVSnJoaWkvQnBqaTYw?=
 =?utf-8?B?Y0dWZ3NsN1k1V1VuQ1dHRWdFZ1JYK0FyRGVlTk5UV1R4M3kyUkVhcDZDdGxL?=
 =?utf-8?B?Y1I5aVdZMko4c09obW55MG9Rd2MvS01yd2orS1J3NGxXbjl1dnZjbGhHRld6?=
 =?utf-8?B?dFVXSkJhTmhDREJCY2doM1RzVTlLUUdoN3ZMc3l0YkEyNkJ2STU5ZGU2YWdO?=
 =?utf-8?B?Wk50WWsrN1V2azJ1a000NGliMEdXaXg1V2dpdUluRmR6R3E5a1k4RStKZXlE?=
 =?utf-8?B?eTVmZUluWCs5M0ZNc3VhT0c4Q0orTVd3bkxJb3lIWFBJQ2NBUThCaCtPM3dt?=
 =?utf-8?B?alY0MTdOZURJWGNLRGx0VnJ1alU4dHY3bWFtVytHaXliK0YwUFQ0bXlpVW15?=
 =?utf-8?B?WlNlZnBvRnZUU1pGVGRmYnJ4UU5sS2xXZ1drRnhwY2hYelN6aitnOXZXZnBC?=
 =?utf-8?B?Z1Q0d0hjQmgyR3I5MmN3T3RteDRqakt0cHlaRnJrSGJZN24vVjVYVURQc2xs?=
 =?utf-8?B?WG0raWZsdmlyc0pZVkZSSmtlSi9iNEhNR3p0Y3huR2dwb29VaXVucGhvK3BH?=
 =?utf-8?B?MjZvdkVnSnFKSjRIWU9HNkhxMnh5QU9HOUdoNWZ6NFQyWDRGb2FLeks4eldB?=
 =?utf-8?B?QWpDaytBNVZldUNDTnJXcmtoUFlaMHRFUWdHeUtVdkRiNW9raGhQZnM3U1g1?=
 =?utf-8?B?TzRYMHBlQmxUM1ZsVGNzWmtrOERNNDdZMmxpRHpYS29nWCtwYTJ0WUR6ZVp2?=
 =?utf-8?B?R3ZCTThUNWpQcmFoaUdOSCtNYkUrV2xlR3FkT1F6SHN4L1g5YW5xb0VDK2kw?=
 =?utf-8?B?RDNOTFRLa1ViWDEwTjR1cDVvK0tOM05uZkM4eStzRzhUU3V3MDBUYm0wWlZO?=
 =?utf-8?B?dkt4aXgrS25NcnA2aTd1OEEvODlPWFR2SDZWYlE1MFhBYmtkVFNhZHd5eHUy?=
 =?utf-8?Q?xTRkRFgnqWqAwufUO1ycS6FZQuWqYgtE1wq2AjGIQl8mp?=
X-MS-Exchange-AntiSpam-MessageData-1: mttO9iR827HZPQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4943dc41-eb7b-4fd0-aa7b-08dee238c662
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 06:17:40.8833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IgxyUl939eBYrPYetMr302fzMTCTiM4qbCHODE1oIWucF65CgBHABiKMdGWnCUhn5SjwBw2SE7FjEmzHioN/BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9742

On Monday, July 13, 2026 10:29=E2=80=AFPM Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() calls.
>=20
> Signed-off-by: Pan Chuang <panchuang@vivo.com>
> ---
>  drivers/hte/hte-tegra194.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/hte/hte-tegra194.c b/drivers/hte/hte-tegra194.c
> index 4a7702b32b24..e29fb105ca2d 100644
> --- a/drivers/hte/hte-tegra194.c
> +++ b/drivers/hte/hte-tegra194.c
> @@ -856,10 +856,8 @@ static int tegra_hte_probe(struct platform_device *p=
dev)
>  	hte_dev->hte_irq =3D ret;
>  	ret =3D devm_request_irq(dev, hte_dev->hte_irq, tegra_hte_isr, 0,
>  			       dev_name(dev), hte_dev);
> -	if (ret < 0) {
> -		dev_err(dev, "request irq failed.\n");
> +	if (ret < 0)
>  		return ret;
> -	}
> =20
>  	gc->nlines =3D nlines;
>  	gc->ops =3D &g_ops;
> --=20
> 2.34.1
>=20
>=20

I suppose 'hte: tegra194: ' would be more appropriate, but it's the
only driver under hte anyway.

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>



