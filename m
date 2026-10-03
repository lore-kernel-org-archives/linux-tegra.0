Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012033.outbound.protection.outlook.com [40.107.200.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622952F8EBC;
	Sat,  3 Oct 2026 03:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790997778; cv=fail; b=F6+t4r4QLsDnyVSExblWjsHFaaNYdGGEONa39euuDRi7MHnGIXU3xWMuw9VohCkPP7SWMRP8tfPoHpqOPEkFE+xcyAuB9Yd5GRV7Rh0UJ9460YDkS0q3tl6V65sZBxcCmDJfAhO7DfOTyFEw43TYUFOxKE78kAkrH1vBOCRhjPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790997778; c=relaxed/simple;
	bh=13wMua0CGZsBTtVPL4G4396tSOqD0yxkgDIihpS47SU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y2HFXDup3XSfvwmGBE9kknkbunVkqA6PhDblABxHvaxYVNlMHW+PshurVhvM68WrrQ1wOH95cYXBLsiwiOHJisaY1y4p5UVFhxL4XHujWe0kSZ/9pauUX+3l/zqF7pqH3gJsyAjt+yWZ+oj4LaQ/OlaQWtvzpw8KpW95F7AvUDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WsCrYNnD; arc=fail smtp.client-ip=40.107.200.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WsCrYNnD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SUAsAD6R781ZGO867E4KOjOgs2puHfOZuhIl2uPtwXOmgLk9IBtYNTnyM14E6n6KKQlzDyJ+QWD6YB70TIdKlBQ/SeQDVc7qXsxzMQ2nkkxav0s6LOJ0iDO1LP6rQhSIh9ta8FaiFuQ7C6ED1hZG+FF3Iml8G8mB0mCLlapGHue/7nha5R04JXd7lXe6kTGd83SfIWek5C+XVgY7xlXSX9Etqb2uIVsqIwZpEEA4aC1P5EBmGftxQ1kbnxguw0I3/xea4+KWJaPnKE6YsS2sPayZ4p3SgoPCJmSH4YdNrT0dj3OqOYM0+S8Hxv3dhsEf7NPntZOfQ8IDx7npteqC5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+viOYnXk0t/bMwL+IZc2i1y/EJIC+8eEbc+TuChK28=;
 b=B2VzIPkXT4hx2jBG5S6su32SqjvUF7yYwMvM6hJUhLlWyf9AdAvSLGIFSMX7gLd9dzDPmBd9HzSHR2MjIUa+QckaqqFW0Bzy4y8Du00CkicmEQ+KPUEuEoJ4FW6iBRFyi5TvSeUV1Qrki54euDcYzpCiWDffMn4A2S7qhqEV0yraY53JbPjMkr1GoTlosMIsumWJbiUw/fU9RpC4+jXtedjZPFLtoFW0crF1RXINu7tSpLUqQ31Dt/1BvOWVmmZAYBO8nM6kQtr4ybugBRK5LwMJ0HI0R0rurTYl0ix0V0ie6UvlO6SWPVkMh2i02wpGE+tBVGNc41N7O8Zo6T7ECw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+viOYnXk0t/bMwL+IZc2i1y/EJIC+8eEbc+TuChK28=;
 b=WsCrYNnD97ByI4eh79WudktYMdY52r4A54wDvSBqhu07SY8uXUxPKKpNp5B5+tEPKULEBDhZh8A52y1Z7nXeE0mOOK8P7QD+8eLYl2MDs/G1ZKpOTxdLr9702OHTbjBbdzblAP4I2uSOmPuKU8QVAKWWb9ych24N8VCKR0VVZvNFLR9XtC3qEVQcFrOU444yDFnXIS9SxaSEQLZNpShTuZV0wIVEVwsRn7RRGj3bZBPPF/bOAn5Kpst7BpURhoMX9oOGw+xV0s43xy2YCwRVYlKV5ut7NcySfO5NqaO9+Pg78ePRIgyutug0Haomtm/92lm2xoV695Jqa9oW6p8+CA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by SA3PR12MB9159.namprd12.prod.outlook.com (2603:10b6:806:3a0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Sat, 3 Oct
 2026 03:22:53 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%5]) with mapi id 15.21.0472.016; Sat, 3 Oct 2026
 03:22:52 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: tegra: Fix Tegra114 MIPI calibration clock parent
Date: Sat, 03 Oct 2026 12:22:48 +0900
Message-ID: <encGrolPTXOOvSimmmZLIQ@nvidia.com>
In-Reply-To: <ar_QXessqHKkVAHi@redhat.com>
References:
 <20260930-b4-dalmore-fixes-mipical-clk-v1-1-0518be6c7979@nvidia.com>
 <ar_QXessqHKkVAHi@redhat.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0372.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::20) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|SA3PR12MB9159:EE_
X-MS-Office365-Filtering-Correlation-Id: 041ccbbd-4073-4c64-877f-08df20fd9bdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|10070799003|376014|1800799024|22082099003|18002099003|4143699003|6133799003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	5aVhUnQd+YSgbP9bceF630jzJReXXbS2sODx1rlPjywggAUzjq0q8vrvi0NQ+qV3ybgtQaTgvB9DxE7Q9hwZ2aGvky3ppH61HJB+FwYRQ1x5ZIp+N6CzHkEjnwj7HxFPFJ701sRxDrOKft5ko2+L10gXJL0zK/Fo+IB4KgLGov+rkkgfP/Ujn5gTCuMshUXYx65PNh84wB8aVPXkHuWAAb9XZAjq53vwgXIijIj8R6S9DNnzrrc8wQGSL0f7lDePe2zcQ/XamN8F7MZC5JTDCoYYw/FmphOwKqMxKj8sRYNtK+DXXd2j8OVC/4WFHRD0rQqmgEjR1gJCO88uoRwt1gWCJ6tZG6IRXwpwL/A8oXnQCmWsceiMeedJfvpJSuNR2Oe4RfhilGXXB/brQOQrCSC1oJjl9JiaiB/NbLXCWRvHv9r8yv+AtPXbtQhGz11dUCPhF3MNT+yLUEpSDRX/87CW9m8n8tlvcuAOfVHSaPm/Lfi5gcGTxoSXvv0giH3YOCqRy7Q2apxZkkHf9DXOdiBm3V+HBNV+O/eUBRV66aV0CkZr+87h/WGFmcAXEx8YSUWxEgECIOjH13v4ci5AU5WiR9ldf4bDMhuqTha2E5micDCsN0vKrTp9C73MB9VnaQfTIKiV9MsQTPZn7uKT5SWcIoKbFrwxCxNQTtlCJGM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(10070799003)(376014)(1800799024)(22082099003)(18002099003)(4143699003)(6133799003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXhuWmlIcjVSVW9KZGJOci9IWXVEZUFremhtQ0tORWZuVUc2ZWgwanRMYWg1?=
 =?utf-8?B?eU5wWmJtRWYxa1ZHWERhZ3FORFd4VlFZUVNNaENPN1FxVnk1R0N4OG8wcFBl?=
 =?utf-8?B?emN1b0ZqUU9yRlgwY3grSGtVQnBEMHNiRGFQVHVUU1VreDhrMzBBSFBYWEhE?=
 =?utf-8?B?SVdGd0FtM0pWYkhobDYwSWJBb2JvL3Irek50aGQyODVMNFZlQ1BPWVdNd3RF?=
 =?utf-8?B?aXM0SHRvRkZ0OHFiTnJUcmg2ZFJOU1NRL0lFc29FTlE3R042Z1M3SXFjeXNu?=
 =?utf-8?B?UkhDSUhsTXNSSUE1VGVIbmFGeXFOZUwvNEtKQ05NQjl3cm8zMzNEWHdGSXV4?=
 =?utf-8?B?ODNJbUpHaHhDbTdlT3JLS3lMNUJZWHZpdi9tUjhlbzIyM1BmWk11UEtIZzBx?=
 =?utf-8?B?T2JIbTU3Q0FwNmUxRSt4T2R1aVJlcWNtRHl6Ukpnay9qQWk1V0lZUk13cFVR?=
 =?utf-8?B?NU1XQkdzcjNPekc0bDNZN0Jvb1VDb3E2KytrVHdZU045a1Q3T3FYT05zNW5k?=
 =?utf-8?B?V3lZRTZ4LzIzY09FcWllMDJIZ2lXY1RJMUZ6Z0VuWmlXRXpoYXZ3MjlPcnc3?=
 =?utf-8?B?YUtoM1ZoQmk1a1k1SEh3Wlcxdkt2TUZIOGdGUS9FbjFXVTdjVEdOeEd1cGE1?=
 =?utf-8?B?Sjh4M0FLa0Qzd0grNHdZVkljdHV3YWpJMHF0UURWcXJYQWpHUGhGZWpVUEJY?=
 =?utf-8?B?WWdKdEY3Qy9YTk1EaDNqdFVlZXJoL2E1VzdrVnUrT1puLzJwcm9oRHNZNEha?=
 =?utf-8?B?RFIzWlh2N0xabklrbmpqYU8yOXNGQTcrRmJOM2JkSlA3a0w5Tk1rZkxjb1VY?=
 =?utf-8?B?dXVIMUdhMWdKWnMxc3AwVFQvei9IZkFtakYyS05neWIwNXA4ODNleEJBcndh?=
 =?utf-8?B?aUZjUnJJY3ZNcDRUcTdZYUFhM3RlRE5tMm1BZ0lrV1lSMzlZNk5Pak0yblNt?=
 =?utf-8?B?djFvQ0wrbU9YdTl4bUtFUGJFdzArVnE1WGZ6dFc1R1pjT1FvM25DaDR2UGNL?=
 =?utf-8?B?NmFvay9wejRCazIrem91T2dqVmVKRmtHOFZrRmliWlNyRjh1NjFhbFRKakNM?=
 =?utf-8?B?T3c1bjA0R1ZSLytkYW1acDlFUUhhOWlYRkhlWDdHS3J3NzVCNm5CcGFUYWpx?=
 =?utf-8?B?TWp1ZjV3MkJZdHVucjdtSlV5aW10TXVMcTRkRTFIQjNOUnlSR2RHbno2WG15?=
 =?utf-8?B?Nit1SGpva2dGT2NjRUgrZnRHWlN2b1c0OHVZckNBMndRemRsVUNLUU9odEt5?=
 =?utf-8?B?OWgwMFViNk9UUks0eENFMnFUVjc2WHV6eEtwWjFtVk5tdFpIa3MwWk1saU1h?=
 =?utf-8?B?dXk1TWlPVmVBZWs0QnNoTU1NOTZuZVFERGxETGc3b3RxZnN2VmNBY0RLamJG?=
 =?utf-8?B?SGJla3QzZExETDNjWVRXekFPNVlTK3FkSHE3Rnp6TGhNNVJkdnR4NnljSkx2?=
 =?utf-8?B?WlJKK3lYbkxTd1BYSngyL2tJckxDbGNpL0orOFNVQlJxUGUydXJIZHpXbUVT?=
 =?utf-8?B?elJOMzlPeWc5aWYxMTk1WnNkSkxDdDFpT0MwcmZheEhHYnQ4RVB1cWVGSmlo?=
 =?utf-8?B?TUsyZU1VL21WOUxaeUxsUkZZWlU3YlRXdmZNcXJuVWhEQXlYelpxR2tWQXZL?=
 =?utf-8?B?R1habDRlRTliWHBzUkdvRnBoZnBobENuKzVnVHNmMEZxeGxMYmlJcFJKOVBO?=
 =?utf-8?B?RGZaRFBReWNMWGR3WVZaSWdVc3VYYUtLZXpONUhwNzIyZjc4VkRtNnZkVkdS?=
 =?utf-8?B?RHErOVF1NS9pbkRNejRqZHRtUUIrbGlEb2EwYWthYnFIVXR0Q0FxT3pmbkhU?=
 =?utf-8?B?c3VjdFRpb2I5V256c2MreGY1elhvbHNrS1IwZ29ZSUhLSTlnY1dQc1BnUWJE?=
 =?utf-8?B?WTRjY2NDWTZEbG55TDdoamk1SHJqY1NybkZmTXgxeTlTTno1VXc1NUhpWUxz?=
 =?utf-8?B?Z2tYQW43bzBoUjRtNHBjR0tWdVFRNWpZVkorYXMrVWl1cUs3SWkrVmNKQ1BY?=
 =?utf-8?B?SGJxWXU2OVVoUHg2bFF1WHlBYllXUlZmcnlFMTAya0w3MDB1Q1RVT2xqRWY1?=
 =?utf-8?B?am0rRWZreGhYNlNrOXVwTkRsY0ZZLzEyODR6N0NXTlRPR1NNaGxISStUeHEw?=
 =?utf-8?B?cTgweEJCZVRsWDRSeW1jRnZkUEpsZEs1NG02T2JkRkthMjNIV1FTZzJ0RHBy?=
 =?utf-8?B?ZXZRQ0ZLQXdVOVREK2lENGcwNmF2VytGOXdaNmNaRE1vc2k5TmxVekVtanBa?=
 =?utf-8?B?ZkxLUXZPZ2lub3d3WTh1Yzl3eVZCZlZrMmMwUFRJOXdqeWxhQzdVUSsrSk9L?=
 =?utf-8?B?ZmkxLzhjQXlwbkxoMnhwNEtvUUNHVjd0MEsvUmlTQlVma0J5N05TUmZ3RHlS?=
 =?utf-8?Q?Hz/mSMXahm8DIpgFSJ6Gs+pZKVVLoF1k0LzGtF169A/Jd?=
X-MS-Exchange-AntiSpam-MessageData-1: Eqdi+RJXBXyQyw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 041ccbbd-4073-4c64-877f-08df20fd9bdc
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 03:22:52.6001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p3tX4cNcKOUPNtux4BV2UXHmHw08ayoql/Q7VPpjZvCQu2L0rjKFNIbyHPHyYRbAUfqambvfYsd/WnMKZs7z0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9159

On Saturday, October 3, 2026 12:40=E2=80=AFAM Brian Masney wrote:
> Hi Mikko,
>=20
> On Wed, Sep 30, 2026 at 02:18:34PM +0900, Mikko Perttunen wrote:
> > CLK_MIPI_CAL on Tegra114 is a plain clock gate with no source mux; the
> > fixed parent is PLL_P_OUT3, which is specified to run at 72 MHz. The
> > clock driver currently registers the gate with clk_m as its parent, so
> > the clock framework never enables PLL_P_OUT3 when MIPI_CAL is enabled,
> > and reports the wrong rate for it.
> >=20
> > Register the gate with pll_p_out3 as its parent. Also drop
> > CLK_SET_RATE_PARENT at the same time: the parent canonically runs at
> > 72 MHz so we shouldn't change the rate.
> >=20
> > Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>=20
> Should there be a Fixes tag? I see that Thierry made a change to this
> same clock 11 years ago:
>=20
> commit 07314fc108e195044c074f4b443974b5aaa2d5d7
> Author: Thierry Reding <treding@nvidia.com>
> Date:   Wed Apr 8 16:48:26 2015 +0200
>=20
>     clk: tegra: Special-case mipi-cal parent on Tegra114
>    =20
>     Starting with Tegra124, the mipi-cal clock uses the 72 MHz clock as i=
ts
>     source. On Tegra114 this clock's parent was clk_m, so it is the one-o=
ff
>     chip.
>=20
> Brian

True, technically this is a fix for that patch. I don't think this patch=20
warrants any backporting, though, that the tag may trigger. If you'd=20
prefer I can add the below (or if easier, you can add when applying):

Fixes: 07314fc108e1 ("clk: tegra: Special-case mipi-cal parent on Tegra114"=
)

Thanks
Mikko

>=20
>=20
> > ---
> >  drivers/clk/tegra/clk-tegra114.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-t=
egra114.c
> > index f1bca81b7776..97f5500b13b5 100644
> > --- a/drivers/clk/tegra/clk-tegra114.c
> > +++ b/drivers/clk/tegra/clk-tegra114.c
> > @@ -1050,8 +1050,8 @@ static __init void tegra114_periph_clk_init(void =
__iomem *clk_base,
> >  				    &emc_lock);
> >  	clks[TEGRA114_CLK_MC] =3D clk;
> > =20
> > -	clk =3D tegra_clk_register_periph_gate("mipi-cal", "clk_m", 0, clk_ba=
se,
> > -					     CLK_SET_RATE_PARENT, 56,
> > +	clk =3D tegra_clk_register_periph_gate("mipi-cal", "pll_p_out3", 0,
> > +					     clk_base, 0, 56,
> >  					     periph_clk_enb_refcnt);
> >  	clks[TEGRA114_CLK_MIPI_CAL] =3D clk;
> > =20
> >=20
> > ---
> > base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
> > change-id: 20260930-b4-dalmore-fixes-mipical-clk-eb375008dd66
> >=20
>=20
>=20




