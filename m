Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012035.outbound.protection.outlook.com [40.107.200.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F0C3093CF;
	Wed, 15 Jul 2026 06:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784096051; cv=fail; b=bIW8CvUZGq3ehBMpbaA33FGPfCJm4LsLYlTDw83aka4hqHzw0+jNI6Pf1hA9McLirMYq4yVKOMaGTFlKd8Po7NI74EcN1eNgtrrIOUguYM5l8YjHe47r1XqXYd+u06VbBzK2dwtc+OkhVVISKw//9iLRA8K3qijBhVos57qsXwc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784096051; c=relaxed/simple;
	bh=PEGid3du9ldpzOolD8Oc4h4EWbjiTbYETKeUTequ1LM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hDOMVIbtr1SIkFNY9yk2atiGOVtzfZrhhlez6y4RqvNqPZwTxaCcSRzaOAcOc8vs0W4uLKg37BepTlDCsp3ykHzCcvSyIdDBGVx4MWjP3jST3wI2fNA+tRjqj9pwIITzXeQsoaaOzGkfEdf4BJPHJynVkOJvAvjnWz2Ph3l+zQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jqftRAZT; arc=fail smtp.client-ip=40.107.200.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jqftRAZT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zV4HqwSGo5mpq28YdluhR9GY17tbFc3qIa0Pz10SeBsppuW5Eu/n9aEHqLfyS4WjgqOgAp91rutuPPqbV75bdCIeNJG1Hr1E3gC1wa7F6lkGJjFI5MYwHzAUiiNxUldkSFdhjxfUD3+LFW590m1hG/+RPNH3B+d2BlhJCs2Oz8ewlx+kUiQgJHEDCy6N31SVzCznwEw+HX8+Bbud7IQ2pSIoOks/WkVadHiRs4kuR4vA9DuhG9NqByL+7uBf5Jz7sJX4/w12ciBO6oZm8nSzay923WZN6DneNXB9RT5cB+h5Brm3gCnQ73F2JSJkUEQ2kBmXL6nEs//Qmk/bvoJ0Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+uRu2qCK995nfqZQu1K/XfvNl3YggSsGXJX2D32xky8=;
 b=JCNF+axX8o8ny3xPtbLDhCNno3hWdvqRy5DPxZiUwhBZBTn0+WhZDKBIGdnzi4gak91+Bb4reX+hgmM58WopVZcASWwWWLcGFxsVTcunQDtlnCyoRY4Op6SxxZ8IEV8tqL120aiQ8Ob8cANXhdhjHulkjphMh3QQQQyKZqRuCmYcMy7q9yxHwhLDjwj6CWnQBQ4H1M7PMEVOP1GMOMjOi09hBVM0xqs7quvM9LIMBxkIgfVHASYp3ATnh4qfRfPM7fEcnJQ5rRjf4EnydWJhXrshKLxu+RpDp9HimOPBydExkfU23mgHIbIlk5t1CovfZVY/qCVG5eRgtYU4O+Kc7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+uRu2qCK995nfqZQu1K/XfvNl3YggSsGXJX2D32xky8=;
 b=jqftRAZTythaIDP7Xc3aJPcZlmXHYorkGJvySdmDsUTJEq6XQjaJDvon05bjtNQGP/kK2QhVuO4sOdE53AynlY1TWtGIQVb27OMRREDNcNnmM9HNXF6CSC/K0g0ROmpsLGtgy/SVKeR2KakbGn3ThZOyb1TgeHa0LZ7z1GKeH4T0Y/+GzzEl0sC9HIijceyuPqv7ckD1bi5iwFbaoJ21+lu/HJFMY0U8qX5MaisoN0cDxU+554hgCu7o6L4HuaRrWb7KcbFiksmCJrMPg/sc1A5ybI0Lshofn8YJcAsahET6quZ5zugd3g1XVIogasGs0nZGM3R02e+ZSjHxE5IjMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by CH8PR12MB9742.namprd12.prod.outlook.com (2603:10b6:610:27a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Wed, 15 Jul
 2026 06:14:07 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%6]) with mapi id 15.21.0181.019; Wed, 15 Jul 2026
 06:14:07 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Pan Chuang <panchuang@vivo.com>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Pan Chuang <panchuang@vivo.com>
Subject: Re: [PATCH] firmware: tegra: Remove redundant dev_err()
Date: Wed, 15 Jul 2026 15:14:03 +0900
Message-ID: <6A2ROEhiRXKNUTuswOgtPg@nvidia.com>
In-Reply-To: <20260713131940.355559-2-panchuang@vivo.com>
References:
 <20260713131940.355559-1-panchuang@vivo.com>
 <20260713131940.355559-2-panchuang@vivo.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY6P301CA0008.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3be::16) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|CH8PR12MB9742:EE_
X-MS-Office365-Filtering-Correlation-Id: f2eb1950-1861-4813-36b1-08dee23846fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|10070799003|1800799024|23010399003|18002099003|22082099003|56012099006|4143699003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	IGZHCul1CQDJk8Jbe0uxa84e2zNSxxJq98K5+5xsq9Nt+FbStOMYlBTwrdSU2IBqgDpVMj5gtdiTULcY4jedRBKDSkRWMjzeGlxUau3ytaj2TKF5bg/T5HZytKy3NU+LaepFJRYsf3wSpyKHWBaxKLrseeh/JmTQFnRZPfqVmJJzqwrosTrcZqyBJE619H1GRbr1Hr2tvKOQGmYOsVr2NoREAeNIoayjsA+oDlMpYEGK+OHyaYJdADjZUhK2vQ5ZBWWmNdFr1zWA/i699CsrQ9981nx2X1WK0TLeQEzMnk0idtcRK56fTiotXzu2yz8Ib+vZMjm4NrLgBSp/vCpGGVQCaTNC9OACI+6eavpD9UGW6FiyF34U3XnlS0Rmn1vtwI/QSNfTWlrsT331aCRpB8R66ubxQSefWOE11tksIC3a5n2sjrD+Arg29HMm3Rb7Iw5/rD0/7thJzADEUyqxSGyEJiIJLejcFRJZFjbDSGlWy/4hvIw5Vgju5prbPqy5tPYT6sh3FtVed5CDkTc+el4vjHl6AgJSWHFqR2d8ciNM+DzZtQy9+EG6Wjb+dfaVYgbXp+3/K7V/7CDkqOWpSQ5HV2K+nr7jMuvJKj5aVslYjHwx29McbNqy+qQ1PubWd+hS4uaGUcOiYWMPGYwgP94zSLiw/rycSE8gFyYdwhQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(23010399003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUE3MTUxYnE3Vmt6K2VDQitydm90RklxRm03aUR3TkRtejRlZERqMSs1ejVy?=
 =?utf-8?B?YURTQUlQNkxYNFYwaldYZUM2YUlTcDJwR0dHaHh1VTlTM1VCamUxcmpocGFi?=
 =?utf-8?B?ZWtNY0pPd2FlM2F2VEh1dmxpMmpiWDAwa2ZkdmY4d2FpaFZpN05yZTB5cUZP?=
 =?utf-8?B?SGVBRXFEUTFNY3drL0hxN1ZmRlB6TjVVTkV6WnVDRmlJdE52UWRIaUZhc01N?=
 =?utf-8?B?QjZmNzcwdzhsNENjZUdpWkM4VFJqaDhNbWVNa1A5L3l0cjcreU9rMmkvZEZG?=
 =?utf-8?B?dDkyR0tSbktrQjJBdnlXYy9tTzRVaHY1dmNMcFRnNlQwOWdoVFdzZndndG9a?=
 =?utf-8?B?d29DRUNNU3p4TGtCVFZXc2ticGFtNE9rNW1XeUJIeFl1cDhCYitWb0dTNHdX?=
 =?utf-8?B?aVhYcCszdE9venVYVlN5VGRtUTh2OVBXRjU3R28wMlBkbFRUQXJBZ0U2ZzNG?=
 =?utf-8?B?ODFSaUNCRVZjN0VYaFcwdk9IYWVUYXNTRzl0UWxjU1JKMzRteTJlVEJMYWNx?=
 =?utf-8?B?cmNZVnFQcmdwaDhsUnFoKzdZRGMxbE1CSE1hQUxPQmsvVURDMy9Sb0thODd6?=
 =?utf-8?B?eEtkMWJpTkd4UkRTZ2JWQ3VFUFdNSWFXUFlFbXNSRzNIczNPNHNrTTRjYUdG?=
 =?utf-8?B?MndQS2ZPQTdiQTJzZDk2ajNLRXJhejlsUkh3SC9SSVRjR0RWaWMyY0RSa0hS?=
 =?utf-8?B?Q0RxOXFOM1ROYjN2Z0NScnYxVFkyQ3NxTFZ2ZWU5bzRpeHR4bmRJZDc1aDlB?=
 =?utf-8?B?eXJUcnBJKzl6TmFBcUVmeGNHcHhrNlJOcTFCUUtSUTZFNWJUV29yRjc3cFQx?=
 =?utf-8?B?cnJZSWxQWHVZWXkwQUZZZGcwV001bkdBL2pDV1YyWi80TzdWTlYrZXdsUlNP?=
 =?utf-8?B?QXdVclA0SHI2LzRodGZrTU5rR0MzRktiVGMvb2V3ZzRsdDhSa1hIbGNyVnEr?=
 =?utf-8?B?NUd1dGJ1dHlFRFVoSHJJeDM2NjRYNXZaNGUrVXg4QzZWY1dKTHZMS0pMQkxN?=
 =?utf-8?B?M3VNb1lldzlZSWxTeExLcms5dHJoZmFjcUpHclBvODR5YUZ4d3RTd3R0Vlhm?=
 =?utf-8?B?ZWxKWHVucGpUNWs3MjY3SElKQXpzR2F3clRMYVVYWGJnaWMvU245VjgxQlJL?=
 =?utf-8?B?dTJSZVRjNWg0UzBhTzAvNTFGWXNOcEEyQTBJMGRrQW8yQkYycUllWXNROFA3?=
 =?utf-8?B?VW15by9oMWEwVnBncktSWHV1cFQvUURLb2krQW81aE1vOEtSNlFRdnY2MFly?=
 =?utf-8?B?alYwaXFGeUZqbFIvRDgvc20yOXIxSzJRZzdpRVZiOEg0NkNlOXNoRUczOU5s?=
 =?utf-8?B?ZnZoNHNuMWhEOXlWc3JpOWw5Y3FvZnhodCtZTytPQm96V2FJRmhpZldpVGs2?=
 =?utf-8?B?aXY4SGd3L2JmK3M4QmFyV0lqSVVWRzdYZ2hzM2tkN3Bhb0pjWTlWVGFsd3pN?=
 =?utf-8?B?R2pDMnVCUU8rWldWaWdoKzNBZW50QlhoMlZqMk05ZjJOZVNEbnpxd2VHdVUr?=
 =?utf-8?B?ei9uZGU3UU5HaDdKT083Mm9JaG1UUmd4SFpublBBYW44dXA0RXFWZ0gwTXdZ?=
 =?utf-8?B?Tzc5eEZBQXZhdXJIcjltZXkrNmtEWGloRTlGSDhCaWJ5cmdGRVo4RWJOVk9m?=
 =?utf-8?B?SHE4R2RCTUdHbWNzMFRoUjdhaWFtUXdyN0FYckJFRk00ejhOY2xSbVE0VVpT?=
 =?utf-8?B?M2ZKMmJERUZpcjM3Q3FJOVpVejBFdVdNU0h2MVJNeVZDM3o3WTVjKzd5eEw3?=
 =?utf-8?B?a2JkVndQYURWcFMybVgxZTVuNUVUbnYyN1IrSlpST1JlenJQd2JDcGErcktP?=
 =?utf-8?B?WnpqOVBBYW9NZmZScm9FeW4wWTFtNUp2WDUvakQ5SzI1MUdHV0pEN0hCczhJ?=
 =?utf-8?B?S242eFNMZ0hzK2ZBNEJaY0dCWjUxdlFSbmw3SWQxQk1COC9MR2drRlgxeGti?=
 =?utf-8?B?QzBiYkQrQ3Jmc0R5NU4zck83eTJObnMyUmxKQzdBNWRZZ2kyVlg4WW83WS9y?=
 =?utf-8?B?OFZHb2lwcXdvSGZDTG5yVTJCZm1MSkpTU1JtS0dEVHgweC9IaWVUTzdLV0ta?=
 =?utf-8?B?amUyZTBETUM1UHJtbjdLakovNldIallMS1lYWGJNTVhWVHNlSWZ5WXlURW01?=
 =?utf-8?B?QS9rdVdnL1FYaWs5UFJNVWdLUnMwVnZ0Ylk3VHBKVDZsK083cmJqdnovMTVy?=
 =?utf-8?B?Q2lzRmRUTUlrbUFRdFovMGlmcHJxWGU0M0FSZkhjMzFRNWZPYWNyZWkxRGJH?=
 =?utf-8?B?UHdKV21Rd2E4NEtCb2NnMjVSeXhzdERJMnU3TkNyeENwVWFRaDdZOW5STjVR?=
 =?utf-8?B?cVh6ajNXcVBPY3M0RDVDZ0FHTVZTSWxCUFBBdU9yY0Y0SWJmaXVyMWlLN1Nj?=
 =?utf-8?Q?0aPc0BieJoju/anA2x85L3uKhst+4Dr9zQBqenHJkvmIU?=
X-MS-Exchange-AntiSpam-MessageData-1: WzIY6neUQEvELQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2eb1950-1861-4813-36b1-08dee23846fd
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 06:14:07.1625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mT1ZXspnhHQZ6qYNwz9gXZdo9CzcNbCwkXcGdjpXqQ+D3+DnuPhknLIMRlAk6FVsm4mA26UFSqGf6lXZYncebA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9742

On Monday, July 13, 2026 10:19=E2=80=AFPM Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() calls.
>=20
> Signed-off-by: Pan Chuang <panchuang@vivo.com>
> ---
>  drivers/firmware/tegra/bpmp-tegra210.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/firmware/tegra/bpmp-tegra210.c b/drivers/firmware/te=
gra/bpmp-tegra210.c
> index 6295f5640c15..643068a8b3b8 100644
> --- a/drivers/firmware/tegra/bpmp-tegra210.c
> +++ b/drivers/firmware/tegra/bpmp-tegra210.c
> @@ -215,10 +215,8 @@ static int tegra210_bpmp_init(struct tegra_bpmp *bpm=
p)
> =20
>  	err =3D devm_request_irq(&pdev->dev, err, rx_irq,
>  			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), bpmp);
> -	if (err < 0) {
> -		dev_err(&pdev->dev, "failed to request IRQ: %d\n", err);
> +	if (err < 0)
>  		return err;
> -	}
> =20
>  	return 0;
>  }
> --=20
> 2.34.1
>=20
>=20

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>


