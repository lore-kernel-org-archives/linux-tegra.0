Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010030.outbound.protection.outlook.com [52.101.201.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E9E44C4FE;
	Wed, 30 Sep 2026 08:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758240; cv=fail; b=qAbjG6y65VDbjKPhRUJspoLKhD+H5a68JEOFsk3qN9Fafcv5aXq51WN+fNZ7oGQsxbct3FqEteqvznjOasfNWj5jv/2TPDRE1V+NkSC8a5yZ1GCMs5/w2ic8HW0L8fGLphvcVuLIhVbLRzSr4KoX6dVx8udWudAAn/x+NaLujcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758240; c=relaxed/simple;
	bh=Euw9VCpVWRGoxCc93PVndDv+X9xSBzgwvuDT1UirBsU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZT3syLwCsx9S33NWsDW7xItf2Xlu06dvkbMtCvs5oS6o6f8IS0SZZkeVFyEG/GUC15woT0Ss8Ua7TCCRJ0UejbFzc0XgVjJeC+ln+XCpJXPuEqh9PJurJd7mWEBxddMyxtsIoIm5ARUJ8jxGLUrwHGl9ZhwZPAHKfJV6UhUezAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rhsNFWA9; arc=fail smtp.client-ip=52.101.201.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rhsNFWA9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d9VHu+/cUsG/P4uOogjg2Q0S5MJfbUj6gTxK2Hbq0HDZDmV6Pb8oUJoXoXcGmhGZ6k2RAGKT8+hsLPQJVLjj7aiNg3JjDWROIim99Eq9wOOkbRjhkQnFlXDlx6XjsAXvyJ96vfUoyhHHLlvxIlClf8ddbzkhbeGnCSE2AQDIIvngRxMY0D8xM5+V2FR9Fn2GI9xIub3bOswrtMrmG2qXwoiacB/Q1xnesDs0MU2PYHCu/+QTle1Rb2JuoFsYyNery3nsFDe3gmNYigkRWaIgHxD+Fq6uuqcYapMaFhRZMzWVvEa9swoy+82r8N28c0D/jPjFqkcwUOc2jGVhGgwLbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DnCqqX2hdNxs4roy0ayvbSgSo2kiuNU2y8LlmXcXP14=;
 b=NhjA7S09RJcI0JAX6rzSsVOMmTkR6sD2cbHgxAr8Df4fVAtVUv0oR1upTdDG4f4CyVytUibZCx1U5TVKysgiRfAPYExOfwyc9mTGBBKRpi0iYGdumWqhw9NN4I6WGLA6epPvTUBkEAlQ/hBctrzAIsaiXC19S1sBEQ7umF5NKjUq6v41a4YgMX8nQHHJ623BMjELMd/xCBRoi3hFZLDMDELRJFpD9EoP54BFPRT0jYoPjKWjmIUHjAhgWLrCxouX0ZjRDNBkDCTZvy+2QDYffgVlFsUECJNX6MHAdyQ89x7L3WT6mpXoh0wowJnXx347D1WVc1WLUmJ4JsZXM59uNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DnCqqX2hdNxs4roy0ayvbSgSo2kiuNU2y8LlmXcXP14=;
 b=rhsNFWA9PIUw+S1uIyXQX/94r4CCSVddjBf/Hss3ussacWgHuzln9qY/xCgN3Wuy1ebZ51L49HuNBu0uU3KdhXLT7Bm4/l8RoE4GVx8GvQAPe7zBq4qUOP6oqU0DKquiC7erY38KQRH1mvaNaH3HawmOuKFD8OT2/awXJ837ZcjV7ZJI1bg1LEffytMP27SKKVR34hofZ42i6vDdbho5PsM+fSLfyYNrGg/ZlE4WXSTz+2qezufWwybszEDqs8uLtVPLX8/7//jSe14S9Pffi8CyW44u4c93iKXnxnqq8a0tByDyenvICsTVfNKVY6p/X7AVlWN6fTchycUuACcjTQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by BN5PR12MB9509.namprd12.prod.outlook.com (2603:10b6:408:2a8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 30 Sep
 2026 08:50:34 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%5]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 08:50:34 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <treding@nvidia.com>,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: tegra: Add core supply for Tegra114 boards
Date: Wed, 30 Sep 2026 17:50:31 +0900
Message-ID: <9C0coc-qQg-ICz_OVjO0Yg@nvidia.com>
In-Reply-To:
 <CAPVz0n02==Zq3sZvW3p_pPs7RUASvP0koWNjsAZY289gqnNxxw@mail.gmail.com>
References:
 <20260930-dalmore-fixes-core-supply-v1-1-4bd87fd70b0d@nvidia.com>
 <CAPVz0n02==Zq3sZvW3p_pPs7RUASvP0koWNjsAZY289gqnNxxw@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP301CA0083.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::13) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|BN5PR12MB9509:EE_
X-MS-Office365-Filtering-Correlation-Id: fb6a2f84-965b-4895-c844-08df1ecfe3ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|10070799003|366016|376014|10067099003|11063799006|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	76AiWVn8hZ3EYHtiLlIqRb0aIXLMmszBRu+99LTAvOsQJ4JyThZkVqqKxp/lHBiIaxex1LDoAuwfI/tv8ZvMJ8pKjjrHJWMqmvBUki58wMzcDRzljDG24xa1aAEak2KqCOnKQPx1TMBg6flJvBTT4W3Cdp6v83p+U/3ndTVFcKkw1HMZPyBGu4SzVDpZZ7WyCBn6axnlI5l91bHZBMxShQqyxdRXiifF8CNDNrB/mNFwTHECxkTaaoGUuo6VkWX6ZcXxA/7165KmqsXQ+gdID/JBIyK4hi1ahtgFDJ0vQIXRrQCgeCOavqqLz22bbBGV55GfiEJ1+pj9i0aHNp5cQhMeafnVblseBhP3K29sVWXErXeKcIIIBI8azChhv882FWSWXaBMuoKksi4+WnxHWjWstxiRvPmRVlYCSH1VAM9HLGEgg7fUgNIym/opRVjs6XHTTw3E1P5cmLnJb6Bc9Usj+sfYOxcaaTOi4bYqhCswysXqfyut10vsoK764vRANHYV8r2xRQ0R6AfF8YCT4Ws5chH6BxyckdSU1DWIwCliPTWpk0CMOSeNSkAT7k9/LeW7BNZvDO2jtC3PG4TlM3dU4zUgLLFloO6aWNqj28RzqzLnk+UVxfnhL3y7WsMLB4oDU2uYF7SQhG6rfQe/GTXSCoHp80oStebVJgV9vLs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(10070799003)(366016)(376014)(10067099003)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2xybDVqZkpOcDc3QzJ6UFkwWEpZVEJwT2lad0F2Z2U5V2s1WXFPUmIwOUhU?=
 =?utf-8?B?L3o1NWNpMkpCcTRkbGZwSU92Nk5xcmxtd0YvK3lMVHZ3TEFrOWZuQ0pJRGV0?=
 =?utf-8?B?aWtRRU9OZHJBRnI3UUtwbXVyQ2RQQ0dwWXowV1F4STlldVJ1bGtlZlBtaEM3?=
 =?utf-8?B?Ujh3UG9KS3NSc1NJYmFKT2psSHhQU0FNN2xKY3hETlpTeGQ2ZVhpTm04YWpi?=
 =?utf-8?B?QnhDZWlZaWZGcDBZNExFb0ttaXBKczhURjg4MUN0ZW1rbWVSeDJBcHZ6cGZs?=
 =?utf-8?B?NzloZEk1bmt3bjhMYTJqM21BWWdQcVpvS3IyOTEyWVc0azJQV3B2c01XWXdH?=
 =?utf-8?B?dmxnN2NuNUIwSUZMQ1dxNXJPVzdMelZSRGdIN25uZW0yTm5BSmlsM0M0YWR4?=
 =?utf-8?B?RUJkTmhUeXRUUWRQaFpJRm5QZmRYR3FYUEtnSDFpYm41dnV5OXBlbDdRYTVT?=
 =?utf-8?B?NUc5N3FMRTRYWWpPb3NycFpMZE81NGxvb0VTbjB5ZE1KVGRIbmVuZS9RK1lI?=
 =?utf-8?B?YjQ4WEVOVHZCRnZPcWd0UTZZalZwZVI3VkJXRG55Q1RSUmRNRC8vT01zVVlw?=
 =?utf-8?B?OHpvdGI0T2l3SGxGbi9oTWp3STlJYTQ2U1FncDZhS1F1TWRPZFM1cDFQNkdJ?=
 =?utf-8?B?WkJkZ2l3UEhqcDRieERKSmVzaG5LMXVLVDZnL3BSRHZ4V3pVdXVrd295R0t0?=
 =?utf-8?B?bkxHdXdVK2FNRjdDdCtFanFrcUQrL2xNUG02TUhzcnFjYlRQWU9EWDV4dlM0?=
 =?utf-8?B?Zk8wZi9YWUpGc3lLQmZ4OE80NXRqeWNKWFYxRTlBWjZQVG5MOUFraXJDWmNq?=
 =?utf-8?B?TlFicjNReTRJK01MTXZjaDFOaTl5UTdrSGpBZVZxVzZ6TitmaWk2TWxERnZo?=
 =?utf-8?B?cTBJeGdkTTVkeE1xMXJLbVZBSlEyT3VFaEc5emp1Y3d0SmdHSU11UkFwN0lt?=
 =?utf-8?B?QkVuWFJzc0FuVlVhTXRvYkRqNCtseGZSQWJMV0JPbDFQN0RzT1YvTlQ2anhU?=
 =?utf-8?B?N2ZrVDR0RUJ1SEl3bEhncm5jRGJoTkNJbGNFMDErdVZGcW90Z3JRZHlGRWY4?=
 =?utf-8?B?Z1NjM21jdmQzMml2MklDM25XQVg5cmpvbFNaUWswcjhlWFV1UlBrcUZZNktX?=
 =?utf-8?B?ME4ydjFLMXZsVUxjOUhIL25HN2puNllnRDc2ZHdSOVFqdDBndXZWdEhQNnZY?=
 =?utf-8?B?K3czVGh3cGlzR2daVXg3cXRidkZnVlgxaWpuRlhYWjQ2TlN6Ulp4Zmp3a1Ft?=
 =?utf-8?B?c1Y3UXZidFRWMkozdFI4Z1hKV0d5ZG13V2ZDb3dhcWVVNW9YdStzbm1CVzJM?=
 =?utf-8?B?SmlNdzhKZUtneHpDY2s5QW9Ob2tjU21nMWZxSmJMRG1COHZLRTRlblUzNkFQ?=
 =?utf-8?B?RjcvUitKYzVUdDRkU3ZFK3ptdkRSSEZEcnRrSXA1bkhSemtOVkhqY000cE9p?=
 =?utf-8?B?LzdmRFpKNXk3ZGFFN2NSUjRUR2JxZnZ6eXBDaGxyZFptSmlkaUFIRkJ5Smt5?=
 =?utf-8?B?ano2ZmNtSlNxMFZ2dXVlcitHem9EcldIU3hWV2FoMkN5T05GbVNHR0FlWnRu?=
 =?utf-8?B?T2ZVM3RNRWZ3K25IMjd3bmJvS0VJaHBKZGdDSUw2TGU2T1hhelUxT05SUU5r?=
 =?utf-8?B?Z29sbU1WaThxRTc1N3BURFFEdVlIYS9hbk1IeUVvTTQrR1dvU0pQWjZKZ0Y5?=
 =?utf-8?B?YU9sSkFTZW1YdFVEQWFHN0hhSEZhdE03QVBBdmJBdzJYL3MyWnRSL3ppdXFu?=
 =?utf-8?B?Rm5DNGp4US9odGNtRlVXOWtpSGt4WlAxUU0rYTRmK0NlWDhic0dGQWtWVU1q?=
 =?utf-8?B?aGFQc3BTU2tIZlBtMjdyV3FzMlZmYzBQMXpFQ2paYzJQdU1UK0gvSTZONnMx?=
 =?utf-8?B?bVQweEtHdUNzOVpNWUZNYmRQaXdEOVFZQUJjTElxR1JDTjVrSnpZREZBbGtQ?=
 =?utf-8?B?eU40Vlh3eldFTkdJOTBGYTlaSVN3Z0RpSW41bzVGeFNVelRtMk9YdnUxcTFV?=
 =?utf-8?B?NmZ1cS94WmcyaXJ6U0pQUlc3c3ZqVmZmSElSeXRPTHM5SnU2Wnd2dlE4RXMz?=
 =?utf-8?B?UHF5TS9DVjVyZ2VuRHZnR0M1RzVraCtSSkorZDQ4MGdaUDFhbCtLMVN6SXBE?=
 =?utf-8?B?L1pvVzlaZElUMEhFdUFTVlUwTElseGEraEFBWnd0RjhXVDkwNjFnZUNlK0xJ?=
 =?utf-8?B?SVM0S3NiWE83emQzVFNUUXM4T3hNMDFGcEVMT2xHc2RhZTlFa1E1Z01ocGVu?=
 =?utf-8?B?eDFUdTBvdmZ0STNDUnFpWXlqZnRrSWJVallNUThnZjhZZXZKRWdWYnV1RHBP?=
 =?utf-8?B?MjVIWGIzUE14cVN4eXZBaVBxbzgyTm9yR00rSkZqa1dTYmFVSUkrMHpsKzMr?=
 =?utf-8?Q?7jpuU8UHRBctgvHytrof0RWPE60bGiLRVjVqmbdK866fj?=
X-MS-Exchange-AntiSpam-MessageData-1: VuFMiJzH+P80sQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb6a2f84-965b-4895-c844-08df1ecfe3ec
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 08:50:34.3790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L5lf/uf311ua+mVxcSnr9rlBe1hTy4ydhnc6tzOgC2DtulRIj9tBTAmRtHholvJXw/pnQroLIlbLfHnY5bJKPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9509

On Wednesday, September 30, 2026 3:48=E2=80=AFPM Svyatoslav Ryhel wrote:
> =D1=81=D1=80, 30 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 07:11 Mi=
kko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > After commit 4cc90d4c043e ("ARM: tegra: Configure Tegra114 power
> > domains"), a core-supply property is required in the PMC node.
> > Label the core regulator on Dalmore, NVIDIA SHIELD and Tegra Note 7
> > and add the property.
> >
> > Fixes: 4cc90d4c043e ("ARM: tegra: Configure Tegra114 power domains")
> > Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> > ---
> > This skips TF701T since there is already a patch on the mailing list fo=
r
> > it. Tested on Dalmore, but not on TN7 or SHIELD Portable.
> > ---
> >  arch/arm/boot/dts/nvidia/tegra114-dalmore.dts | 4 +++-
> >  arch/arm/boot/dts/nvidia/tegra114-roth.dts    | 4 +++-
> >  arch/arm/boot/dts/nvidia/tegra114-tn7.dts     | 4 +++-
> >  3 files changed, 9 insertions(+), 3 deletions(-)
> >
>=20
> Thank you for catching this!
>=20
> Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # Tegratab/TN7
> Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com>

Thanks for testing!




