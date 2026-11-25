Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795602534;
	b=Totf/eERMwGwRV8Z30b0bxTR5Y3VWrhJlE+LfAYtl5orh4N/0HLeS/dhMbMf59tVoWB0
	 2Es9H17K+JpXNKh0FjYWYNvFvtPjWlmUCRnoMTv7bQOrQqqKVSseksqyVY+WuIRLqLYu6
	 lqx2CK2w76iW47l8ZWddNx/8blqWO52ZUZGBscy40+uYi2ZgZ8j8j/ejs29HiOWG5/1e9
	 g7s05d8YE8K0SBDUVR0K9yKe1GCkyl/Q4FMX2Xnr1U1tLaJwgTFZ3V0b0+9Qv+z0WAT3p
	 3hQAujemV/6b8aExZ8jvhiEJtvl+d+bxLYV4Yw+FjQpfSWJUp8/8jY1pKV1rPHmNY7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795602534;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:X-NVConfidentiality:References:Content-Type:
	 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=AqQ4eTjbgqwtpHsHeMRrnzBGnXPuleS3AQRZw8Ziw2g=;
	b=0O7qyOx0k8UT3hQHYKdntywvfeKsH4Cr850q+WZj8gTk4F87EVmkU2eriORkkamL36rI
	 kxHVLPHL6yzo+w2OPzc0Nbl+QlfmkQvTuiLGHX/B0q1BOUmBaGLTn49OmckvYk6raIX+w
	 02b18FMdOAIchNKJDCdHUBo8BWUK0v66CpWMkkGy5YyV9zCYnflQErwBO0sHHl+m6+2YD
	 5RmkCwCa1Z5a0SRE57y7vd7dH3o/NQk+v0U4l1kAFsY9dZCdaG9fJlCwtBm/fwB+2Oyct
	 ZtohHO0tOW2pxFvlEm2lPSq8T0mOv8UWS9srmvI1/HXeSRpbZ4L4AblmdDIIjXeqZ+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=j30iQSjQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.53
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012053.outbound.protection.outlook.com [52.101.48.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819CD606A323;
	Wed, 25 Nov 2026 10:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 819CD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=j30iQSjQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hm9t/qX75tfygjkt5OJnHcCww8xBkOSylloZaRHJfp/0k1Ei4uzEaF9LWsAXQrIVV+D0tuZaaZn/9IDypu+ahvjoZKIwUHWZ6FVVidRu2k60jxEiB2+d4OISJKElDWHja30tplBvp3ROzc4MY7ltWRvmkGa8uAEl7toB70ILKMAQfcwmKptDe5bFoXCW9TDp/e968zQFhQpC32xCwycop4NAqoBDIja8Yf5mWy3HWpzpi26v3j19C7VXdQFgCFpv95GkheypsU4w97RFeTNUuyXeU5AM504iI2Qdg1DylECYEwwHJffEqzl+OQhiMhg0pCWp+cQGA27JIP7IcZxa7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AqQ4eTjbgqwtpHsHeMRrnzBGnXPuleS3AQRZw8Ziw2g=;
 b=CwZgWGEnJqVnSJjpth+NeadEznzMs1agqf2GtDz2r75UgdU1YvvoU4o2tXH+k+h2FxZ+pevWeCQ8KgiE98/P5XxJ9Cmx59PvZ73iZjl93NW4HXZclcRW+dzRJY3CkD/Sw7ES4x7KeEq7rtNxqS1RfISYkSg2Jfj4g9CCQiIXVA+2YxO7fsUi2qad3avx2kWArpuFNKj4CeEZozR2fpPKLBZruVAINWRw8jqeBXDu0OUaR40/uNGNdYFVRCbLzi4fZcoq2hifkuWAwHVW3MrnvovhYjTJjMBUKtRwtRQVi/M7Xagf1v+fwDMgIplS5ZdhhiVyIYlB5/Hes9kZm51ZhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AqQ4eTjbgqwtpHsHeMRrnzBGnXPuleS3AQRZw8Ziw2g=;
 b=j30iQSjQ49jhjEcT7MaZX6JBgA0AEuK6jM+Re5oim4qSAtBQPRKVoXrGFh7sp9E+DGCWkY3Vyw+vovhZe59XL8ec5+o7WrJsIfuo1bPibJoCCgttokhD407xSBGgaSIRKTpmYBR7Y+qQ9cEmEd2Lai3K8MGQamlol+p11uBaLjOhAq7gaTHNR6ziPUKXMziXOosiouwUwRlnjx0mnJLW72+SCqOFg9S1b6+2LQluBsoKDrxJ4Er+Scsrq+LLGew0P57BtGRi3v6muBYyr2U2B0YPWMqCxGmlkfWtJC3jPEy/XAjcZHUpaMIhT5e4xcTChWbkw1kzhMCjNgS5lhNlNg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB6022.namprd12.prod.outlook.com (2603:10b6:8:86::7) by
 IA1PR12MB8312.namprd12.prod.outlook.com (2603:10b6:208:3fc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Wed, 25 Nov
 2026 10:28:48 +0000
Received: from DS7PR12MB6022.namprd12.prod.outlook.com
 ([fe80::ed94:5edb:3834:5a3c]) by DS7PR12MB6022.namprd12.prod.outlook.com
 ([fe80::ed94:5edb:3834:5a3c%4]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 10:28:48 +0000
Date: Wed, 25 Nov 2026 11:28:40 +0100
From: Thierry Reding <treding@nvidia.com>
To: admin@tsv-stahl-riesa.de
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Svyatoslav Ryhel <clamor95@gmail.com>, Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, stable+noautosel@kernel.org
Subject: Re: [PATCH] clk: tegra: tegra124-emc: Skip timings whose parent rate
 cannot be set
Message-ID: <awa1pk-vFb_zq75r@orome>
X-NVConfidentiality: public
References: <20261111-upstream-clk-emc-parent-v1-1-636eea572572@tsv-stahl-riesa.de>
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p36q2hw2h56swyuu"
Content-Disposition: inline
In-Reply-To: <20261111-upstream-clk-emc-parent-v1-1-636eea572572@tsv-stahl-riesa.de>
X-ClientProxiedBy: FR4P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::8) To DS7PR12MB6022.namprd12.prod.outlook.com
 (2603:10b6:8:86::7)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6022:EE_|IA1PR12MB8312:EE_
X-MS-Office365-Filtering-Correlation-Id: de012adb-8245-462c-2cb8-08df4adee3c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|376014|1800799024|7416014|18002099003|6133799003|22082099003|3023799007|11063799006|261021121427099003|56012099006|261102123227099003|261022105027099003|261026121527099003|261026140227099003|261009223027099003|261021123027099003|261021135927099003|261022075727099003|261028144727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	s1GNVJsPcXCxZVmHJFVbhyEfe6JFHaR/FB5AIgNg4OLEc5zRiYRD5Wr9QmdVzvDImJW1apub/cwirBUnuegjMS8mx5EtnypEJDKiWA9aJcXVl+uOsKw6ATzpwJPiO9ZyrwZiXZuAQMB07CgMzweNrvayODAKjcyvOyXKW++3uHQrl8cTbU5WICi4+hiYFVIIiIhbmo5KNQCbLxjxPAMc12n1EUM/aC/TuLP4Q3yD+NpOVzd/C9pSFN5mfNORSRpHGPIq6Ezmf4MQBbGxBNpUEqohn6QXbo6IDqh6WJoZcnL1uDk3uyTu4c1f9pDZeXX8Rwm9e8/qErUh56Fh+oWQWpEkU7YH1HfDbKYgK+9Q2IcJCB3GelafqnWmnq2u34tV3x73AyzX20Z/o06vUSQYSWgugMKaULAXKcUXuyMloNO1JpikGAcG7gUPL9sZvxhNtfzWz97FiezCkmBcGBsE0KfP9CCocFk01aStBw5KwUagkwj97UkzC9GNNLWynR2EfaYOKR+p4ZF/mN3qxL2wwkSwSxUuBXFznxVuwr4XIB0FkQSjZqreLSvG/C6fgEvas4aJ9qeMTG5Iv3Xcq38LubwLtu+U0dn/B+Yd3EMwFvreCSjCKGwun3k+/9xH7cnprrycPXA9becd/RMwSmqydHeblTaxi1d4IM83Fci+RHw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB6022.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(376014)(1800799024)(7416014)(18002099003)(6133799003)(22082099003)(3023799007)(11063799006)(261021121427099003)(56012099006)(261102123227099003)(261022105027099003)(261026121527099003)(261026140227099003)(261009223027099003)(261021123027099003)(261021135927099003)(261022075727099003)(261028144727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vF8xqbActM0JMlrNPd4LVnBY7Kr+H/JcmtLPa332mX3DgjwskjecDGUrLiJD?=
 =?us-ascii?Q?ufFdbKhh3PLMPk+wsYEm6MmESt5IHHbMoQPd6djQaI6oMzGz9lWNQYRexeKx?=
 =?us-ascii?Q?XIKoZ6gDgrFIQztsl08+6i8XqPeCZDRptagnfdnJOUThXIS7Hu3k1HZcMSOp?=
 =?us-ascii?Q?xDwiONBVcLLJDRHpdg8PP7H9IJtVCe69fK14yUYUK6IoCB/S+bO0LNOAZlqy?=
 =?us-ascii?Q?VvVX8TWC/TE2j53cwgecSMkhpS4gYc9CZlgXJaS85eo/ZKO62t7ZDqZjC2gf?=
 =?us-ascii?Q?oo49MdAcsCgCSQSLy/HS5GAMxSaMtnEEYbYpX4A8C29wElYa4J+/11TsIslp?=
 =?us-ascii?Q?eB3C6z8AJsAG1mImsfJJFnMC1k58Ie57t6lVJ4aQ3qHFnYs6hXGYIOn+NUKF?=
 =?us-ascii?Q?ekbPDrvJ9GrEiatRvtjTPWlZkpPYneetOSkrmIk/ZTZtjPTa6mrSiv8LKA8+?=
 =?us-ascii?Q?s6E/ap8OKc46cGuZPpaucmvCxG0PNGImrbYT5XA9bdJsI3kzl0OQD/x4mazc?=
 =?us-ascii?Q?rCe3lQbyk1w81mDB8/xPvMAv3e/3p4StGxo1XUNLjIdsHuA3H2dW4TQ3i82G?=
 =?us-ascii?Q?NeVaYKSpIBdbLa/Iv/hOjN+FGZmflcDukFNCzccgJhWPUmDwbvYq2uCQPpI7?=
 =?us-ascii?Q?L2QwkM4Vaa6QdpDBWft0TphaS5/saSNefsB16pmsHejBDwLEyoTC3rdxuhYr?=
 =?us-ascii?Q?7sfHTOAIfyxXGCylXF7LKyILPWoGtFPoGRCUPlYkBdEAmnWs75jNPyuWIpkG?=
 =?us-ascii?Q?eoWj7jIBFqZCXzOIuIQmgvrAWuyBWoFGorvrudOjEnTZGDYy++6NJlQ9KASs?=
 =?us-ascii?Q?28Z67RKuglkny1yRS3mJmt0LPONxD0vzjDEJp7FIzU24l0l3wz2xrrygJ0A7?=
 =?us-ascii?Q?8/9OCtU64PJ3LsugGrQmVN2M1wwAT56TlIwUbLB0+XSEjphMg3A+8PEiljWE?=
 =?us-ascii?Q?xnRHT26ZkUHGmwRh5O2GGypWJ3E2mvPyC03zYQ15GXYXnwITdR6T9Yrg52Id?=
 =?us-ascii?Q?xVTbL0/ptzln+K+ApEK8++K0uN81d3nVwc1GHmLsg1HhACcnhDYB1GqJrB0F?=
 =?us-ascii?Q?pSavyfCu6xFcw3N71PiKqrDDbccIoif6X6uNEs3uV8z71wIjjjuvKd7hqnLu?=
 =?us-ascii?Q?jSZOWaw7hFYBDciyoHko3xVjNU1YuSL8I4BoInWMA5fffaGgSrLbshQQDNfS?=
 =?us-ascii?Q?D6cB+OEV89NbufMwe4z24rBjDArlWs4weS9Gi/SmloW5Odgx6yvwMetphPq2?=
 =?us-ascii?Q?nZGNYgJujDH7X+yVouvTKyILbLSpVizPLBl8RWGL5wDubSad2159J7pbiOs0?=
 =?us-ascii?Q?RTxjb1pt3VTKHn7VWKHDwh4RTGANDIx5xyvdK0cP/Qjgfnbf0OXu2dRsp08K?=
 =?us-ascii?Q?rSeAlFpjmgXriZdRfpgU+LZeb7iT6gp+xlaIIpeESe67JmekyLetmSQA4Ep/?=
 =?us-ascii?Q?gEgbnCJI8sWFZylnZzOXZezhpo3VXApad4YBYsj3ZDVgCqJXDomztx47Yza5?=
 =?us-ascii?Q?UZKcI9TGzM4Wgr7BYoJhZyY6ptnnms2+woyngJkBGCL09/3p7s+2tNAfyZGS?=
 =?us-ascii?Q?gnyb98elnIvUupDS+Nz01lfOxWPVpFbLlLQBA5slFES/nilOHRQydVQxgksa?=
 =?us-ascii?Q?qvGMrHUSa0WQDa2AphvzGRHNIRLsBta1A7a/b8Go4EIt8rXUvaczBGyMl9fv?=
 =?us-ascii?Q?xKAp+l++38GrsFD4S5E2Os16EvWPq59misE3BVKb8rhrOOn2+yI/p/y51+X6?=
 =?us-ascii?Q?PViRYWNN/bTe6cafJgvQ3yg3aeADHNp+fpFyG7xp8uDdZ50fRQkbYlFSkc10?=
X-MS-Exchange-AntiSpam-MessageData-1: 7Q/UAm1PPX5NCg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de012adb-8245-462c-2cb8-08df4adee3c4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6022.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 10:28:47.7394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QWLyozIiEomTkm9oKjo8L8WXX+dGtIDxDpd0+MKjWF/Sp2ombmA4xjBYKXEXoBDeWyXZiLShm9wO56lRXHd3aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8312

--p36q2hw2h56swyuu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clk: tegra: tegra124-emc: Skip timings whose parent rate
 cannot be set
MIME-Version: 1.0

On Wed, Nov 11, 2026 at 11:14:10AM +0100, Patrick Fischer via B4 Relay wrot=
e:
> From: Patrick Fischer <admin@tsv-stahl-riesa.de>
>=20
> Each EMC timing names a parent clock and the rate that parent has to run
> at. On Tegra114, PLLM is registered with TEGRA_PLL_FIXED, so its rate
> cannot be changed, but the Tegra114 device trees still contain timings
> on pll_m at rates the bootloader did not set up, e.g. 792 MHz on a
> Tegra Note 7 where the bootloader leaves PLLM at 408 MHz.
>=20
> emc_set_timing() calls clk_set_rate() on the parent, which succeeds
> without changing anything, and then loads the 792 MHz timing while the
> EMC runs at 408 MHz. On the Tegra Note 7 that gives a refresh interval
> of about 15 us instead of 7.7 us (DDR3 allows 7.8 us), and the clock
> core then reports 408 MHz, so later requests for 408 MHz keep the
> 792 MHz register values.
>=20
> Skip timings whose parent cannot be rounded to the requested rate when
> loading them, so that the highest reachable timing is used instead.
> On Tegra124 PLLM is not fixed, so its timings should all stay; this was
> not tested on Tegra124.
>=20
> Fixes: cf561283254d ("clk: tegra: set up proper EMC clock implementation =
for Tegra114")
> Cc: stable+noautosel@kernel.org # needs the Tegra114 EMC auto-calibration=
 fixes
> Signed-off-by: Patrick Fischer <admin@tsv-stahl-riesa.de>
> ---
> Tested on a Tegra Note 7 (Tegra114, P1640) with Svyatoslav's tegratab
> device tree on top of v7.3: both 792 MHz timings on pll_m are skipped at
> boot ("pll_m cannot run at 792000000 Hz, skipping"), the EMC goes up to
> 624 MHz on pll_c instead, and the timing registers match the table at
> each rate. Actmon requests for 792 MHz now end up at 624 MHz without
> errors; a memory test of 3 h 20 min with mostly such requests ran
> without errors, together with the EMC series below. Before, an actmon
> request for 792 MHz left the EMC at 408 MHz with the 792 MHz register
> values.
>=20
> This came up together with a series for the Tegra114 EMC driver,
> "memory: tegra114-emc: Fix bus width and pad auto-calibration" [1],
> which I sent to the memory controller tree earlier today. This patch
> builds without it, but please do not let it land in a release without
> "memory: tegra114-emc: Stop clearing EMC_AUTO_CAL_CONFIG" from that
> series: this patch moves the EMC from 408 MHz with the wrong register
> values to a real 624 MHz on pll_c, and both kernel panics I saw on a
> change to 624 MHz were with the pad auto-calibration cleared. For the
> same reason it is not marked for stable and asks to be left out of
> AUTOSEL, despite the Fixes tag: I could not show that the wrong register
> values cause failures, while 624 MHz without calibration did.
>=20
> [1] https://lore.kernel.org/r/20261111-upstream-emc-t114-v1-0-54d9e1bceb6=
a@tsv-stahl-riesa.de
>=20
> As Svyatoslav confirmed, PLLM does not have to be fixed on Tegra114, so
> the proper fix would be to make it scalable, as the downstream kernel
> does. Until then, this keeps the EMC from running with register values
> for another rate.
>=20
> Tool use (see Documentation/process/generated-content.rst): the patch,
> its changelog and this note were prepared with an LLM coding assistant
> (Claude Code). It traced the rate change through the EMC clock code,
> read the EMC registers on the device, wrote the code change and drafted
> the texts from my measurements and instructions. I reviewed the change
> and ran the tests on the device.
> ---
>  drivers/clk/tegra/clk-tegra124-emc.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/clk/tegra/clk-tegra124-emc.c b/drivers/clk/tegra/clk=
-tegra124-emc.c
> index 0fc74808fe39..2f4d39922b73 100644
> --- a/drivers/clk/tegra/clk-tegra124-emc.c
> +++ b/drivers/clk/tegra/clk-tegra124-emc.c
> @@ -458,7 +458,7 @@ static int load_timings_from_dt(struct tegra_clk_emc =
*tegra,
>  	tegra->num_timings +=3D child_count;
> =20
>  	for_each_child_of_node_scoped(node, child) {
> -		struct emc_timing *timing =3D timings_ptr + (i++);
> +		struct emc_timing *timing =3D timings_ptr + i;
> =20
>  		err =3D load_one_timing_from_dt(tegra, timing, child);
>  		if (err) {
> @@ -466,11 +466,28 @@ static int load_timings_from_dt(struct tegra_clk_em=
c *tegra,
>  			return err;
>  		}
> =20
> +		/*
> +		 * The register values of a timing are only valid at its rate.
> +		 * If the parent cannot provide the parent rate, for example
> +		 * because the PLL has a fixed rate, the EMC would run at a
> +		 * different rate with these values. Skip such a timing.
> +		 */
> +		if (clk_round_rate(timing->parent, timing->parent_rate) !=3D
> +		    timing->parent_rate) {
> +			pr_warn("timing %pOF: %s cannot run at %lu Hz, skipping\n",
> +				child, __clk_get_name(timing->parent),
> +				timing->parent_rate);
> +			clk_put(timing->parent);

The clk_put() here might warrant a comment because it undoes something
that load_one_timing_from_dt() does and hence it looks asymmetric. Now
that I think about it, should we perhaps move this check into the
load_one_timing_from_dt() function? It's all just dealing with that one
timing anyway, so makes sense within that function. That'd get rid of
the asymmetry, too.

> +			continue;
> +		}
> +
>  		timing->ram_code =3D ram_code;
> +		i++;
>  	}
> =20
> -	sort(timings_ptr, child_count, sizeof(struct emc_timing),
> -	     cmp_timings, NULL);
> +	tegra->num_timings -=3D child_count - i;

This seems a bit weird now. should we just remove the tegra->num_timings
increment all the way above and just do:

	tegra->num_timings +=3D i;

here instead?

Thierry

--p36q2hw2h56swyuu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmsGuFUACgkQ3SOs138+
s6Gfaw//Z3uw5ma9cqqblA+8nu2yBkAWOBSwERHiiL4gdesj2MuLPAmXia44Urn6
HQJPhAHWcKuzca2bDAIVvubtyB9qkmFNFtiQvb/ABLPNQQqUIEJw2QAJO0HSeXqx
NmnOFdyp4pcq3ON6q3lD/aB0EdAVUu9bCg7m0G37F/caISWq4F9uUdnuL2aqA4hl
zrb/oH0WvwHrQ/RAbuFHRpSUsuLDige8k6yYMi7noSJH7q/HJGsB3cIDGBYllpwF
hVnwQEVWII55tYSUVOAZBIrTLgHg25vQNAQ1fVUfRcEemuKsaaRz8eZXmXEfUJK2
jWNqI4Ro5wo368APpL+RVqXFCwt875N51P35FgyJQmaAR11uMQNGVTjEpjMCjtV/
qzLUtwQrsTZ7qd7HWROKE3KbjuXklV94kkmmXRLPejCQIPKfKrxGXvBYG8kwrgDw
0uZXNRxlXBqDmWLiFwzX2vNbrpGdVXmaIH0w27FB9SznMNZc1oHwzZ7ji+M3Scwk
bH0krbrQ4X37XAIy1oGHJFuMazVV0/ncOaScxVMMa9SxskEqiaYR9DElfLfcEj9H
Bq4zkSbnVODMo97WMqPPdgIfA1HBHUKKO8P2HuJNkMjlRi5r0Z18HorG0NopreAe
acd+OoM5LSA8TE/wcbbBbfC5LbgfbJ32hfAWLxy62WB/F0p+nfU=
=zgYi
-----END PGP SIGNATURE-----

--p36q2hw2h56swyuu--
