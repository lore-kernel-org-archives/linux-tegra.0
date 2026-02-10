Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012046.outbound.protection.outlook.com [40.107.209.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA403803C3;
	Tue, 10 Feb 2026 16:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770739312; cv=fail; b=IvqLbQHkc1DfIglbutRixYdXfsdpIW7QEed+qQlQtIlXN7uDik9P1s/eJf9iGb5J2Uik3gDV+SpDqqCg/vtmpU0unKT1a3GIQMTjrCSWzgQrrEsi4wTHSgytudN6GBXch4lirN1KbhbvYhAA5XLAmcG8iv64FZ2SJqN4RSwbltI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770739312; c=relaxed/simple;
	bh=ggDRC3BLYAHvOSNrdLqRB4cTOfd9uwci8Qif8PcAGPc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JGAvttPSWAC5BTRezwPKX6eGLborhMzYlm5HAy59oJ4KtiCAlDihoJwr/Qbp2fsUQyfGPyD7AdCpHySGyTZ1nk1xrmc26L3ICwcIXQWbt5thE9vz7Eq+QEbT6WRIsWyHwza6BNnlQXk+DoTjB+dSYdUTwEFW2EfJFuijMuuVH6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FY6g4E2M; arc=fail smtp.client-ip=40.107.209.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FY6g4E2M"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hVJJmFQZO6Rkrl+A2DDkGKYebhlGD3kTDnhHjNXTws18n1zEH9hk3UkyumtmFLP8Nf2jNPr6Zx0kdRjofPRkSqcTsj0i1ZcIJ2fPRvQ0TpD1hRF9zHBNhmIlSjfqqlQcNM6jOnOtS94g8EHUzhzfEMBkcXL2fSC1X0JP8U6Da3G1K1RpmUnW7bbTb3D5hxJuGCXtwrJzSJNC2lZ4a4TrY21bEWJnBe+7eUYA4coAJYgrKr5DEmego1HOWUI7wdP0I8bbuHFA2WS575ZcPvEyE+nRKPsqTyLRV70V0/5XCEgLeimtXpU2gciU+W928/0OQp1xnIfrXsusS+tBqQSmKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=By4PdmS1kv7kqE4nixbGDCx6u1T6duRDq95l49lVN3Y=;
 b=a4UYoWk8FLjHvH8eHCv6GjZHbsr+NoQKv0E/mnMC/WvZYah0PMBSLihhp6DERhPrmrCl5f2gfZzzW4cfedHMcVuQeo6myoW6RZpPY6zjbKScumbjrW4OdwpuZ27L9VrkKApKuFycFwidFGwYGAQo73kgnI4xZtciGKqEXUjp30GtIefdWHBrji88TM/9QgaKPnNMNlngn5mnlhJp+8yFs+9WsodNiHR39Zz2zrrV1TtUAtI9mergngWJdXdayvNbmepQqMrSrK8ejFtW5dZ36zm/8O9bH1YJf6dAj+9BAgno9+vusZDiUIdvDy70ynmx83bdBsxguqtW3S1kN42tbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=By4PdmS1kv7kqE4nixbGDCx6u1T6duRDq95l49lVN3Y=;
 b=FY6g4E2M4LPz8zSHQ2Eh3C7HcbnuknJKpelCEbmzmZ0mdRo6qNUE0/tSBHwd5yTyDiTPiSFEWquVbcuqcUHjs8+6nxHePnyVmG6JNyx+la94epjI77vEZw7RP50yNwqyBMGa37sqz92Ys2FOeznDohmVkONzPqxRHj3gGjyPotxg4HUbKyhwT7QEnmWrBXjIptQw7mIAUQIFMcT9weLwqYdUlbSxGVLzyFUqgV5PhOQRKyI6+PInZVFqv6TqYSiO7Qx+ErXonyAtgdwgK+u751WkBr3dQoAm8QX99Lg6R8tVJb2xe8Kvzbgp28r6U/MrXO01/A5VI1e7FzxaJQBL3Q==
Received: from SJ0PR12MB5676.namprd12.prod.outlook.com (2603:10b6:a03:42e::8)
 by DS0PR12MB7969.namprd12.prod.outlook.com (2603:10b6:8:146::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 16:01:45 +0000
Received: from SJ0PR12MB5676.namprd12.prod.outlook.com
 ([fe80::a3fc:754b:9159:b13c]) by SJ0PR12MB5676.namprd12.prod.outlook.com
 ([fe80::a3fc:754b:9159:b13c%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 16:01:45 +0000
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: Ilkka Koskinen <ilkka@os.amperecomputing.com>
CC: "will@kernel.org" <will@kernel.org>, "suzuki.poulose@arm.com"
	<suzuki.poulose@arm.com>, "robin.murphy@arm.com" <robin.murphy@arm.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
	Thierry Reding <treding@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
	Vikram Sethi <vsethi@nvidia.com>, Rich Wiley <rwiley@nvidia.com>, Shanker
 Donthineni <sdonthineni@nvidia.com>, Sean Kelley <skelley@nvidia.com>, Yifei
 Wan <YWan@nvidia.com>, Matt Ochs <mochs@nvidia.com>, Nirmoy Das
	<nirmoyd@nvidia.com>
Subject: RE: [PATCH 5/8] perf/arm_cspmu: nvidia: Add Tegra410 PCIE-TGT PMU
Thread-Topic: [PATCH 5/8] perf/arm_cspmu: nvidia: Add Tegra410 PCIE-TGT PMU
Thread-Index: AQHcju9ytzwrZVU+1E2Lwe05lOfHs7VpwqQAgBJsTPA=
Date: Tue, 10 Feb 2026 16:01:45 +0000
Message-ID:
 <SJ0PR12MB567646CFC7CBB6F114ACDAFDA062A@SJ0PR12MB5676.namprd12.prod.outlook.com>
References: <20260126181155.2776097-1-bwicaksono@nvidia.com>
 <20260126181155.2776097-6-bwicaksono@nvidia.com>
 <409515ed-61bc-2cd5-ea9b-e9f246884c6e@os.amperecomputing.com>
In-Reply-To: <409515ed-61bc-2cd5-ea9b-e9f246884c6e@os.amperecomputing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB5676:EE_|DS0PR12MB7969:EE_
x-ms-office365-filtering-correlation-id: 4faf88e8-53d3-4758-67cc-08de68bdb08e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7053199007|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?taV3jloTmOayP9ElVVYxfjTIA5eItWw9ID5YBDmZZgbmj47Iw7vwFeHGihzY?=
 =?us-ascii?Q?qB+dVMhXmmVq9ywPQw9yaIOV1MhDMjkocltJ5B7SKbHgz6POXN8e3s+3ZL/h?=
 =?us-ascii?Q?WKPt5FlTcR9njziwJ52k0+M91XTyrooVIgkmUCG7bkzoty9l9uh8n4/xMapC?=
 =?us-ascii?Q?A5tM+FJClhj1JUqXzXLu//kqaZBKE2BIlCnYQhJi37hWJfZ6IvuVtf6oiejb?=
 =?us-ascii?Q?2h135+hiTfF9DPbUranxN32sy2/5aRqnWg3L2KY94HfvyfKqN4rH+jbNqaOm?=
 =?us-ascii?Q?wM4z5XbAuP9Dxs212pDvMbkL+SFhlwzXZY2P3wiIDgxBlAzjxlxZydoYuUHq?=
 =?us-ascii?Q?WcaQy5NLFHXPyjS8C27PC+XTAPzNy60r/ZU9ob8QqJW0jEB8lkgMwe91/f7Y?=
 =?us-ascii?Q?AP8aoVx92cvk9BGc9vP99NXB/DDlqoA/LYzESMXvLvjlxF71IVm0syVUYZML?=
 =?us-ascii?Q?pfyl3Ztzaf9qp1+WAny/IPXGRRG9H1Jhzrxu1v+GvwBVbub515BgUEjuuHHt?=
 =?us-ascii?Q?FYQBIznH7FbzU+YpMorSOEZ3zV7Z3vjHq0cukBHYHGZF0uqBH75E1A4fHMrX?=
 =?us-ascii?Q?QR2PGZXAbr2gDwMlPNa3pVQKh217gW4SnRbznZuC0mo7qXvFP4rJ+VFEDj+s?=
 =?us-ascii?Q?UFMSeajYK7M9VhIdCYc5Jmdxh5vyt1mqMdYr3hk+I/BJj8RgPgtN7IeWobn2?=
 =?us-ascii?Q?gdGWmVii5Vq1tqa9ZtMrQwDi1nW/zUOL8bmDL+TgUDwAgv5VmAzSdz76fTOD?=
 =?us-ascii?Q?+31dWmKb0bKf1B/AydfsYam4QzKTl3SS0uSxNDAYipjFJD8s+6UpTSo+UTBh?=
 =?us-ascii?Q?7qD9Yw7skVGSUWLiy62y4v1WDnQHdVP5x3tCsapGbLQbvtC6BlWdZDW0eJZj?=
 =?us-ascii?Q?dmBcIoYG1pzxytESLJJqHX/uSsB+kM2IQ+tDkLRYNGNyTSSBBw6uBIls6DfP?=
 =?us-ascii?Q?2C46O34pvoTbX0jyIm4QExZcyufd8+fciaFngJ42XvY2kNSdjCeNcIRdPQ5J?=
 =?us-ascii?Q?lqROPt4ZQuly7tqo6FS+yi1micM3qkizJkktvoOVjfox370l7kpua/+Kb+UN?=
 =?us-ascii?Q?WELI/1GZ9sDrGy3GeMAuKz1/iALsanOWeRADiyGgdqyTKmId+vii5kjhZVCN?=
 =?us-ascii?Q?Jwc1Ov6mp+AP++itrfYT1jehOWCQhSrONWC49v4zrT5ka4/sdomfGUcs0145?=
 =?us-ascii?Q?XlNc56h1aHPcVM2ct4i3AgphFpGB/Y1KKtBAak11kLE5xsJCcucFLGqP2BFo?=
 =?us-ascii?Q?zspoi3rbWVkure0QBKWQk8v6RfOtazECAiz06/k+BwdSR994h+nCMEDz3edw?=
 =?us-ascii?Q?qhVElpwVEN98kztUjanbWXCdH/zq0Td+yZep0TFIsDjPrjb/O8DI6K6fDolA?=
 =?us-ascii?Q?UAC9dWjToY1zMhufJH9by3l9gBp8JyNFMkHUUgwOtJExOobfTnP4pmce10AM?=
 =?us-ascii?Q?jn2msBmWa3pHIblvzjjb2dH5BgK02rfSJDUkynSUMlhRIIAYp1UjGnzMWMBm?=
 =?us-ascii?Q?8K/DABqdkYMrJ7EnE4VzhKynGnYM9nbVRjKI6+IUOq94tGV2F0iEc+D2Sd67?=
 =?us-ascii?Q?kZDcw7aAytI73GyK0cPCxN0vSme/uzmZCLsgjPndwZcmhQfx1HEqrt0v5cQG?=
 =?us-ascii?Q?26tq3GQcc5z6zyiqgv4abAw=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB5676.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?NgzT2v1cAu9ezdnt323wcdHEafOUBWJHcCUWYQUAapNuei7sO5EheEVzovr6?=
 =?us-ascii?Q?C7PAffu3Xi0Dl0v5k2zDs19YSiw1FsRzJbsWj1D/rkzLN6V9lBeKHYh7k8KW?=
 =?us-ascii?Q?kTvO7XJdk4nZmx7tSNDilWe9KIVyRT7NQwoqEcEXsrdcu6EsdpH3QwGaCcHY?=
 =?us-ascii?Q?CxoXvFM27XIlfGsrj7Q7fY9wDv4D1R/JWW8BaL1fhK8yoghIjFLRoowTjbPI?=
 =?us-ascii?Q?Pu9q/D03T26fCf5foE5ppAYwHl4M+wA7vT8LA2mfZqvQa65IdCCGLZpnXxhr?=
 =?us-ascii?Q?HcjsA+Z1dgb8Xrj7d0HKkWSVEcBrkXyg1YGzh5HJTk4UrFmytdB85NTTBt3A?=
 =?us-ascii?Q?S6KXbesBzkza3fasp/+gcxXE3/Ky2rDWeFNWM102C/ngFxmIR1btEAGtbVmi?=
 =?us-ascii?Q?euK1afFguS5pl5X2K8NYXY0gzX1l+vYm9Q2Y2FqMv/oy+hfoi6qZPU4hYYZ1?=
 =?us-ascii?Q?RfYpTf06695yC59+E1j6tmnd3fqvfCwXuBBSRL6Z1dRqZoD1rZf2EbAveVv8?=
 =?us-ascii?Q?gqA6DpohPGhpS4oylJculFrztxhxWUc0wCHFpIDN7pKFcmbe1i2Fre7CJdkv?=
 =?us-ascii?Q?YkgJ9A1fQVqo3wkYkdzQgAScECoqgpHS/pn4mQMSXnUZl1A3T+8RgSNfRluF?=
 =?us-ascii?Q?a7jK8GyCGq63ZnBFHgTrdPjJY/7EaoF9l14rirtOAe6JlPotUO5c73JqZmcS?=
 =?us-ascii?Q?xqigYKw185owpas+xQcA5ok79dbM2GL/FaiPkhXqTeYqM2JMrjTx7+aeJZui?=
 =?us-ascii?Q?pATuOK7iH38V0HmFh0N6DA0IhCRzhDo0yoF+RD4hSSzL9jUjPbshGjZY4XRP?=
 =?us-ascii?Q?BWjuDAZUUuCCiKPMh7TP8Tl5f6jRJSa+j0CPK8qUbu/dfM8T6Xig1+JGRAL/?=
 =?us-ascii?Q?Vma12vIm5bRET7yTzuQi+TeTvsjq+CDJ4MDe8VXhQnqZIntMV8tOAVlCSNtF?=
 =?us-ascii?Q?H4EZ0zyvWhq8jZ4lnHENC0aZGv1qCKfMmP1BXLVZ0gQr6v8Ur37RcLF/4/DI?=
 =?us-ascii?Q?8Gs3bwMQS3EaAHrtWLhuI/VrKvYPH0AeRwPELq48PnaPTyjQ8CZbHPQC5AW6?=
 =?us-ascii?Q?/HEOvR5wcLzGoBUqyJ/rq8wcQoiiZ1B1mBJDWrBpWH2TkoN18x6opMOrgXUQ?=
 =?us-ascii?Q?9C2a5LLKmVu4OMKt1CpnJsm+HI/WtmE9TMcs4VgPHT8cqmEEspVOeLtfsmZ0?=
 =?us-ascii?Q?i7FndArtu2XTtLnm84FYaNuan/evpdQOMuw2lEaEW4Q5IZ+R21juGfOX41oX?=
 =?us-ascii?Q?8VjQjJPOV5gD5ZB4KAkoTqLPaSaF/aXRO8j6h/Gj0pIrv3GqWzr4AaV1uO/c?=
 =?us-ascii?Q?WpM/E/7jNfw3pwKv7/89vsuIooBU46Wut1Wf3Tg8hXdunRZwiMCPzEY7q9Rj?=
 =?us-ascii?Q?K5mrLXfHxw8uKAxr6Y2r0cPoUGIWT36MkEDPcKlACh6Zdds/s4/a4umU0KgT?=
 =?us-ascii?Q?5OdMADYD9B2ZP8nj6VETVddXPQJr4mQx/M8bDQ4PRjBI8yPhfSKpKYCaNmsz?=
 =?us-ascii?Q?Ra+g7UhPnJfisT1bPR/RusnEBn+evEp96y4xvxH+IFBR9D7r0veRmRgJk049?=
 =?us-ascii?Q?yg+uxbGr62v1YnS8wtDA2ShPDfRvnAIjpL5b4ojT6nJFD+gX5EVCZgy/kBno?=
 =?us-ascii?Q?g4mIBPyXmrk6yBpHJLgISAuhDqlY4Pj23WFbNP7fAn0q2orKPLZ7LyDT3tJU?=
 =?us-ascii?Q?o9i4Nkq/38MV5hs7jicDGGtdnQDMVylt3qwqf/7PuqDh+uvcq6rX2Edz5n5K?=
 =?us-ascii?Q?uZemD8+ixQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5676.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4faf88e8-53d3-4758-67cc-08de68bdb08e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2026 16:01:45.2135
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cb1BEs3FzelVy4YNUWoEF7MuahRGiSCl3c67HyaQXaKPnSres8qSBnJho3ZzrLmq2EzzlBnJFCDFslJ6yjfTbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7969



> -----Original Message-----
> From: Ilkka Koskinen <ilkka@os.amperecomputing.com>
> Sent: Thursday, January 29, 2026 4:40 PM
> To: Besar Wicaksono <bwicaksono@nvidia.com>
> Cc: will@kernel.org; suzuki.poulose@arm.com; robin.murphy@arm.com;
> ilkka@os.amperecomputing.com; linux-arm-kernel@lists.infradead.org; linux=
-
> kernel@vger.kernel.org; linux-tegra@vger.kernel.org; mark.rutland@arm.com=
;
> Thierry Reding <treding@nvidia.com>; Jon Hunter <jonathanh@nvidia.com>;
> Vikram Sethi <vsethi@nvidia.com>; Rich Wiley <rwiley@nvidia.com>; Shanker
> Donthineni <sdonthineni@nvidia.com>; Sean Kelley <skelley@nvidia.com>;
> Yifei Wan <ywan@nvidia.com>; Matt Ochs <mochs@nvidia.com>; Nirmoy Das
> <nirmoyd@nvidia.com>
> Subject: Re: [PATCH 5/8] perf/arm_cspmu: nvidia: Add Tegra410 PCIE-TGT
> PMU
>=20
> External email: Use caution opening links or attachments
>=20
>=20
> Hi Besar,
>=20
> On Mon, 26 Jan 2026, Besar Wicaksono wrote:
> > Adds PCIE-TGT PMU support in Tegra410 SOC.
> >
> > Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> > ---
> > .../admin-guide/perf/nvidia-tegra410-pmu.rst  |  76 ++++
> > drivers/perf/arm_cspmu/nvidia_cspmu.c         | 324 ++++++++++++++++++
> > 2 files changed, 400 insertions(+)
> >
> > diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c
> b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> > index 3a5531d1f94c..095d2f322c6f 100644
> > --- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
> > +++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c
>=20
> <snip>
>=20
> > +static void pcie_tgt_pmu_reset_ev_filter(struct arm_cspmu *cspmu,
> > +                                  const struct perf_event *event)
> > +{
> > +     bool addr_filter_en;
> > +     u64 base, mask;
> > +     int idx;
> > +
> > +     addr_filter_en =3D pcie_tgt_pmu_addr_en(event);
> > +     if (!addr_filter_en)
> > +             return;
> > +
> > +     base =3D pcie_tgt_pmu_dst_addr_base(event);
> > +     mask =3D pcie_tgt_pmu_dst_addr_mask(event);
> > +     idx =3D pcie_tgt_find_addr_idx(cspmu, base, mask, true);
> > +
> > +     if (idx < 0) {
> > +             dev_err(cspmu->dev,
> > +                     "Unable to find the address filter slot to reset\=
n");
> > +             return;
> > +     }
> > +
> > +     pcie_tgt_pmu_config_addr_filter(
> > +                     cspmu, false, base, mask, idx);
>=20
> I think you can fit the arguments in the same line with the function name
>=20
> Otherwise, looks good to me.
>=20
>         Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
>=20
> Cheers, Ilkka
>=20

Thanks Ilkka. I will incorporate your comments (on the other patches as wel=
l)
on V2.

Regards,
Besar
