Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011030.outbound.protection.outlook.com [52.101.52.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D38836897C;
	Thu, 23 Jul 2026 04:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784779879; cv=fail; b=B19/YamYVdXD2N7GgfB09lFfv6HSnILNB9hrLOB4bTuSFbrJKlfFZaxOVZHE0CQft9NKIwzp2kHzWCZMWV9SP9uTs633AZb8qVGoDVQMOTY+YwulOoPz3sAxzbEfN2zFAXb2S4VvOAatejytajqEmH1PSA3uZsC4HRIgVjKd+pE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784779879; c=relaxed/simple;
	bh=ElzG4+qOYn5QftwbkFZ3zF7xXoeEhjF/rLhWXzut9yI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FUp1iv9pmVxe+X+KgxoLwCIdbg8hDPnqqH/51DH3a5SkgU4MMTTBCN8ciOD5F6ZtO0ehrfCFv+xaCFXIilKN0nplScn+TS9MW8M95KmBglqnG5YMDP15yAdUBmOs1GnKh4+sgrb+KQzUzILRacPPwn4UfckrXz91TTVFgjFXeQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HalwZDct; arc=fail smtp.client-ip=52.101.52.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HalwZDct"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j9ZzEcMrB4p99gML3VbwHnn2hXtmub1ETPW+7AgyNyO0qTRz6qiOemy/ihvQ9N+7Sj3bvYDluaRUqmcw71+NrZdnIIAXVUdi4jq4hhyRXNuXtGbpDi1Gv5JchbWdUsMPbbUxK7Mut0z09/U6Jv6728Ears7aHhhn70BYZrjzltCBC9IqkvYL+xVOAnSl9EZWrGoxeY8I6UOnA/RGtSRcxWQywSfG7SU579LTA8dv0jd0qQ/C68KoUHpdIFb8LVCVmDet3fXUpi7kdAFUGVfF5toUp6LtUU9TYmNl05XaqHf850Vw46H0wihTr5fJW8KcGH8Tw04HWTOp0Fyd07UMBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+/LtGoC/kIfXT7stMHl6nkQ4CVcxnZODYrKTUCbYmY=;
 b=UuNgXWgFZyZ0fFs5yGNSx7Qg3PfeAt93HLm1QTc5VimCAXDI9qZRvi//w5PeSbuHxqvWlriu0TxyqhBiDz5QNLzC9jQXGgOeerhgJI+B2aZAmBdg4wBlhOkfsvfv7SetWMdZmpmND9vPjPhqjszT3la0nwcg1OBk0VALb/YMVxJjj/lWHe5rbYyi9jXIKkfDrtr/zUWTn7U/OeyYwwmYQz8WhKBhI++ydqnCmerwhpSaySxujAFUEjMZoQ0BHwybLAL7yp950Qky57b+IbdPfqtWI9rA8zqFrD7lzB6hxsxmpmBxwa8VMzu8wv2hXzaWcBJFOisocXEIzKdw84c9qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+/LtGoC/kIfXT7stMHl6nkQ4CVcxnZODYrKTUCbYmY=;
 b=HalwZDctYAB37KUkTE+NOg7t4LUtAqmCff6GiV+imPUBh8I9l6BNMGjRpNmWLXbiWh0SX5/lBciq3mX7VKj9LwPP5F+1b10IKdqRaXUiJAuQEC5j6gnVXZYTE1sL4nOdzOSNiaG4avNZi3ynxpSS/gvFQPt0eNz94jKrKQJTq+pHlU5uJETH02PeVG7PrArlexvP+VmTPZe2teyvAIr9H6T62Lj8cd6RbMKt5VY15mhu/Joxp8Kf9nPmgXXnc+0UmC2L8gP1Pho9rpBG1M0QwiT1EH+zOEPhdnphsfPWnFqY+6tlzxUwAL3uVbNLge8YnduJY3hYUObh9lHWxEmTgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by SJ2PR12MB7961.namprd12.prod.outlook.com (2603:10b6:a03:4c0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 04:10:56 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%6]) with mapi id 15.21.0223.017; Thu, 23 Jul 2026
 04:10:56 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Shashank Balaji <shashank.mahadasyam@sony.com>, Gary Guo <gary@garyguo.net>,
 Danilo Krummrich <dakr@kernel.org>, Rahul Bukte <rahul.bukte@sony.com>,
 Bruno Sobreira =?UTF-8?B?RnJhbsOnYQ==?= <brunofrancadevsec@gmail.com>,
 Pan Chuang <panchuang@vivo.com>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Pan Chuang <panchuang@vivo.com>
Subject: Re: [PATCH] soc/tegra: cbb: Remove redundant dev_err()
Date: Thu, 23 Jul 2026 13:10:52 +0900
Message-ID: <H7KyavPATE6M4x_cuD_lSQ@nvidia.com>
In-Reply-To: <20260723023803.4304-1-panchuang@vivo.com>
References: <20260723023803.4304-1-panchuang@vivo.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: OSTPR01CA0089.jpnprd01.prod.outlook.com
 (2603:1096:604:218::6) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|SJ2PR12MB7961:EE_
X-MS-Office365-Filtering-Correlation-Id: 84e3616f-c1bb-43bb-454f-08dee870653c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|10070799003|22082099003|18002099003|10067099003|56012099006|11063799006|921020|6133799003;
X-Microsoft-Antispam-Message-Info:
	wTJPWMIZU6jyHOOp0pfgdl89evKOR3fzF3viLNFbYPXlnu11i9KMPx7W+vmpGp1ATtpSaii7JcQ4Ghkf5p3yIHD5+8nsN9UvDGlS2emKJDisPqWy9wM1Tn6a8Qrbz1LoZvUgdw3G4O0qmlgDCWNa0I1X+1Y56phfg5+BPg4cuacA607xnamdlNivE9q4hEbxni0u4rH5n9fRwn5q5qpU853/4EuRLFkT0W0NOqpHvOYdU72ETm36s7ilyAKg/q/EsC+MJ6ky2fr0SNeW+bR8cUIZghMKG/AEWXaNwmwOlWfOk6m4x3d4jd1DLJ4YCZ7EaeO8nPtXAI+w8YYLekicRi8RTo4vI+KScnwIs0Z+/BQ0lJEF3uJlJUrItdS8lxtJdnQTTi8VtGqUwoVkF+81UDAmpQEKgfuOxncA7uh6O/fRnqLgTWLsb9UI/+ofHH00P5659XXuaJTmYA8h6axG4AruUQk+vP08BHmuDE8169r0ZaR4E6cdMI93QnH+YFARuqzjvCXklg1otj/WWKBW+iOuTZcSqcBCM1joJ5BQNJAeg7gAVu71tFJdw6oU2dqU/VU7M9JVEsYGMnN0nUhCmQAbwJQHLoXgaSoQoZaau6la65+/5UyQOWwBwpc8tSJFtX2vTHCz78+3VbIKg85bj15dJmqQKyLkcr3oZrFGid554IX4jssqftbbvKbj0kyiraaxRwqSKu33oWHwoNIs1Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10070799003)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(921020)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N09RODZjS0NMQm50MlBQYlZYUFhZeG5tZEdQMlRXMGExZnhaWVp6WDR3QVo0?=
 =?utf-8?B?Vm5OeVN0UFlRaUJIQ0wwWVBhb0k4Q1hEWVhNMERpRk1zbTFacTIzckFXcGNt?=
 =?utf-8?B?T3NGNGY5cXdXUDFNUGEwNDVIZ2Y0MEsvTjVCRFB3YVRqSW93TFZMeEtLeCtQ?=
 =?utf-8?B?NkU3c1k2T1FMb2FYTGR6OEd3RFRHWDMrYU9uQjY2RGRmbFRLUlpYYWxsNzNu?=
 =?utf-8?B?MDEyVFl5T3NEM2h0RE1jK3JUV0RubHpESFNHYTFkeGFzUTIrYjJqTG9mdXBv?=
 =?utf-8?B?dXZybTZpQVY4RVBKVlY1Y0xEQmxLaGxUaUYyclBiQnpWY2JDeUZsZ1R0eWNO?=
 =?utf-8?B?WFRoWnI0SzFxVmUwQUsvbWNac0JlRGd5WkQ1TytITlpYZVlpQndaQ1VZRWR2?=
 =?utf-8?B?aCtaVXZCbE5EVXhtM2t1VHNodVFTWms5cThDVUZiQW5tS2VhZzNsZTcvNUt0?=
 =?utf-8?B?Tk9weVltVFVac3VhMXIvNG9qMGM5MWdub29DcVJJNlFIbmRwQ3BCYUMyaG9W?=
 =?utf-8?B?cHRDRGE3M1Jkc0NnbHpDM2tSQmZUVklCZGVENUxMUDc0aklOVncyVWZWR0M0?=
 =?utf-8?B?d0h2NThZSC9ob3FsNmtXSkthZkJOT3ZtWmx1MkdzMUlQRzRPdTlMd1kvNmd2?=
 =?utf-8?B?eXh1TGxSVFcrVis2MkVuYXBKRWo4QW1sSVI3RFJRdzYzMVdLMG5xa2QyM0FV?=
 =?utf-8?B?bFI4R0dtNnk4bTdZbDNLajljTVpHVEUwMXRiTTNzb3c4SVhqR0psd01YL3NP?=
 =?utf-8?B?Yk5ublIxa2dLcnRabENZNXdHbXBiK1QyUVp5L3hZZGdrbmFJL2J4OVlVVTEv?=
 =?utf-8?B?UTA4cFI0cEQ4RE1nemhnK1h3SkdyKzZzZnlSejR0Skh4dDJqVndUa1JsYW5n?=
 =?utf-8?B?VlFpbHJTVmpSMmpHWmVRdzZEOFNsc3Q2cTRnU0JvaUFtL0VxU0FFay9nZWJv?=
 =?utf-8?B?NHhPL3JQdEZWN1Z2cWhsMlRhQmxUbEdsWW55akplbjRRQ1dtV29hYnVsbW5T?=
 =?utf-8?B?TzVRRHcvVUE2WGJidnpMenFhRzAzeEFnQ3BhQ1lrWlJxR1FJV05nUGF2bHlK?=
 =?utf-8?B?ZHVPRGU4cTRjMitSTHE0eWNoTlJyTGpkd2ZCK3ZTRW81cEg4V2t1QmZ0RVpn?=
 =?utf-8?B?emw4MVNQb3ZySDhXYlZlNW9tRG9MbWdYbFVQS1M1OUZwTi94dDI2VEltemIw?=
 =?utf-8?B?YVRHZkdUQUlGeHVXbTNPdlhVeEhBcEVJZUxDaFhxSVUyckVGeldsaU9HVnl6?=
 =?utf-8?B?b3RDSlZYL2ltUlMwYnMxVDNGbk50NDVqb0paV0huc2oyR1VEUWMwUmczRkow?=
 =?utf-8?B?STJJemdiK3J1OUV1ZHhxZTYzeDg0eTB0Y0w0YnVFcGFVTCtBL0Zza2FBYjcx?=
 =?utf-8?B?S0xSdk9nQVQ0T0RPQnlFSHViSFdKUkUwdm41cXdDRVZBbmJYcmYydndDQU04?=
 =?utf-8?B?eGNxcUhsdm1uZG03c1RwaUFYc21wdStwUnl5QTIwZDA1Q0crbGlmY1orTXNa?=
 =?utf-8?B?U1l5UXFiclFCYnVXUHNpMVBzQWl5NlBXdTdQSDZ4K2FDT2tWVkVId2RrdXJ6?=
 =?utf-8?B?bnAwekEvbDlxUnB2WDFiQnNqUUpsam1NdERyaVJMUUdzajdqZWg1RjJVSDhO?=
 =?utf-8?B?V283TUo5SnI3L3dMZFdaS1lwaEsyeWdNb2dKMkFFb1RVN0U1UXpVMDRFSmtw?=
 =?utf-8?B?VTcxQWRFc3Q4T3ZvZlgrWmR3THErNGxJdFdwQURjMEZqRWMrRW8yN2E1WGdW?=
 =?utf-8?B?VlYwci9tU3BXM1VTOWp1ZTdmcFR5T0JiVHQrRFZjT2ttMHhyWDM3NFRReW41?=
 =?utf-8?B?N29SNXV6QjFqbmhBTEdLYWNmTmFoeEtOSENwc1pwZS9JL3J2YTBIL2F1bkpm?=
 =?utf-8?B?WmZZM01SU2VqRUYrZkRUbWRRbHBHckpuamhIamJScm9xWjVlU1JSUWlNYVpB?=
 =?utf-8?B?blIzd3pSdnYwMmJDeWJYS3RybkNjamhyVGpHZkhuZ01FL2xIbHNaMTFCZE04?=
 =?utf-8?B?SFF3K3NaMmY0aVpJY2piQUJCRkhhSmV5enkrVGwxWnF2cTRnVC9jT3ExRHUw?=
 =?utf-8?B?bUs2M0Z3L0V6OXB1d05qemxJalNSVFhOZWFMYWVITXdRakdZOVNLcmNhTUtt?=
 =?utf-8?B?UGQvaERscFBDdXorSkJERi9oWEtJNUs2KzlVb0RUdVJtaUZXcDkrQWNTNDAz?=
 =?utf-8?B?SmJIQXhYQWtGbVBuMEtFcW42eFV0VWxobE44MURXSEw3MmsxRnJaazQyY0pV?=
 =?utf-8?B?YVpubkVSY3VzbWViVi9zcUpzVEpZT0JiMFZBT05DRGlzVGdpZWlqekJ5WHp1?=
 =?utf-8?B?Z3oyRVdwTURvMVJmVlIxUnFlR0lvcWt2VmtHRzc3Y0xZSU5ZK1Y2cEhqLy8x?=
 =?utf-8?Q?zzFT0nBywFaJqgxosTBi0ohid/ioxHMswJbnnHKHO2IM9?=
X-MS-Exchange-AntiSpam-MessageData-1: 42jG7ib3UehXrQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84e3616f-c1bb-43bb-454f-08dee870653c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 04:10:56.7040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5QBVMvmVylyDPuifye0NNNS9N34mjXzwLVbunIqYjUzjAxgz1IiESKjS96gaVjPxbdTYgFXJMDJXmoVULP3pSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7961

On Thursday, July 23, 2026 11:37=E2=80=AFAM Pan Chuang wrote:
> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() calls.
>=20
> Signed-off-by: Pan Chuang <panchuang@vivo.com>
> ---
>  drivers/soc/tegra/cbb/tegra194-cbb.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/soc/tegra/cbb/tegra194-cbb.c b/drivers/soc/tegra/cbb=
/tegra194-cbb.c
> index 2f69e104c838..69ef929e04f8 100644
> --- a/drivers/soc/tegra/cbb/tegra194-cbb.c
> +++ b/drivers/soc/tegra/cbb/tegra194-cbb.c
> @@ -2072,20 +2072,15 @@ static int tegra194_cbb_interrupt_enable(struct t=
egra_cbb *cbb)
>  	if (priv->sec_irq) {
>  		err =3D devm_request_irq(dev, priv->sec_irq, tegra194_cbb_err_isr, 0, =
dev_name(dev),
>  				       priv);
> -		if (err) {
> -			dev_err(dev, "failed to register interrupt %u: %d\n", priv->sec_irq, =
err);
> +		if (err)
>  			return err;
> -		}
>  	}
> =20
>  	if (priv->nonsec_irq) {
>  		err =3D devm_request_irq(dev, priv->nonsec_irq, tegra194_cbb_err_isr, =
0,
>  				       dev_name(dev), priv);
> -		if (err) {
> -			dev_err(dev, "failed to register interrupt %u: %d\n", priv->nonsec_ir=
q,
> -				err);
> +		if (err)
>  			return err;
> -		}
>  	}
> =20
>  	return 0;
> --=20
> 2.34.1
>=20
>=20

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>



