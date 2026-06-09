Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012038.outbound.protection.outlook.com [40.93.195.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9DD3AC00;
	Tue,  9 Jun 2026 00:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780963302; cv=fail; b=qwUXaaVldX9bpnjBxYkEKYl+7UOfUQuPq/UuNVXB3Y7GqjZXGFvXUzhBaorVaAfQoU0ojXQ8+C/YNdqWu8P3PPEYsKILxtmf5xc0I2n6v0LmFz48j/DNd8IjdWtVG4GVbpmkJadkD2mZMzJ2QQnIKmQtFvsrr+hPNYZKpqS0X74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780963302; c=relaxed/simple;
	bh=vA/Qp8SpWpI9Uf+qTDCpDylgV7T0wEqRo/Vn2Lc476I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=khl2ZQNfCed+nxC0IMdHRd3bKu7WL0PpaHvyIo7XFMO83Il2q2P+3w+fxWLt01TTU1mNi+S0XcPY1bOU5uDZgyZ7vBAPffvr09TO8zcpNDa/kg+yV4Vewp/DO6ImW8YwgMJ47RwFAqC8ej4BFD3Q3g1GqKS8r+WcytMtGgLTQi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cNa8x689; arc=fail smtp.client-ip=40.93.195.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cNa8x689"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hd3xUhqOgjN8v/OfAwnq1sWxJURk4KOSKcnF2gu98SSvPGRc+ITDm0owd7mox4K5sMVcXMZKAVFVHcHC+MNUpeW+yjKg4Hw1JRvbCqhXcht6ynOZovTtJb1miADJFckMj3qLGQZBI16RqVfr1aj8m2GYOrMqeq1bK2uonZT1xCDlgE2XVs//LtJopoNE8AHsiDqQDOZ33jmKZknFxVwCPpgll7Ho8vHZ2/hs7ZCE0MfMNTIX4m6W82Rb6YsAWXSbVceY4b2lte6SaoiA+pTDrH5pWRIjlBdesv4e/8BRCsJoGE7/rJ+lgn9q2d4I9rPval4fDo+bkdn3ezCe+zktAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3y/BYJSrOGAsiShbtq8O4iJ1F5W1h8eDRdi0QjmAjSs=;
 b=sIW++losfrImMS+DdxOXaBqo0WE1wEAXnlJtryvhLc7JUpbA4IGTJyX+Nc53eNFvNrFezn/XKU1hoUjgFNxpBwAh7nS8wFw56Cc82WvyrpuJqu2to8cTiwwo2wySUcZCXIiyaGLjrFozX4GFf+2ylJThPWeCEG8Sei5UeCtWTJENc9CkP0R9sT9MCdJOFWBLdZd52rLcqQv/p2q4VV5IplO2nXgJnS8HwnfZQQi1eVXYXEbYMuMswjYm94HS5li5i0nm4AOs4f0DGd0XWtMc7YMw+q0Kyd/lLx25SGw+CPq6TbSwhAnQE+bAzR5UVuNjPeIUsZ7MwTgeURqwmI7eSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3y/BYJSrOGAsiShbtq8O4iJ1F5W1h8eDRdi0QjmAjSs=;
 b=cNa8x6896aUZjPAfdRbXhDh6OIInhT37gGDf7To3aqqZ8YCE2tiWY9/1YPTlopZIDQpe0ZqIoBuA54cmW9Ugqaf+LQv4DW/6qrjGH5Su7eQTpws8PTMyaQe8kAy+8dFmJqMgTbO7aEyBpFzqx4JSuy4rJv4mHL7NQK5JapSlNujLi2bt2ri567521v6G3Bm4WlLXI3BeBmNlhrE0jWxAmtE9boF3ucviS5kYF97Rf4l3/CJRNMI4JyMgRJUg89MFCUwrCC8r/PAEx9tvHT9+pPgewERflKDbdVJzBV6ja3bDaLClzc/vFs+1x235PyEQTL+V8HZ4YF7+s6llrkR6Ew==
Received: from SA1PR12MB6773.namprd12.prod.outlook.com (2603:10b6:806:258::16)
 by MW4PR12MB7216.namprd12.prod.outlook.com (2603:10b6:303:226::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.9; Tue, 9 Jun 2026
 00:01:32 +0000
Received: from SA1PR12MB6773.namprd12.prod.outlook.com
 ([fe80::ba62:69e8:261f:1cdf]) by SA1PR12MB6773.namprd12.prod.outlook.com
 ([fe80::ba62:69e8:261f:1cdf%3]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 00:01:31 +0000
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: Will Deacon <will@kernel.org>
CC: "mark.rutland@arm.com" <mark.rutland@arm.com>, "james.clark@linaro.org"
	<james.clark@linaro.org>, "yangyccccc@gmail.com" <yangyccccc@gmail.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, Thierry Reding <treding@nvidia.com>, Jon
 Hunter <jonathanh@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>, Rich Wiley
	<rwiley@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>, Matt Ochs
	<mochs@nvidia.com>, Nirmoy Das <nirmoyd@nvidia.com>, Sean Kelley
	<skelley@nvidia.com>
Subject: RE: [PATCH v4] perf/arm_pmu: Skip PMCCNTR_EL0 on NVIDIA Olympus
Thread-Topic: [PATCH v4] perf/arm_pmu: Skip PMCCNTR_EL0 on NVIDIA Olympus
Thread-Index: AQHc2+7PCtub6DIOa0uqgPp9pxW4BLYVUPIAgCA62tA=
Date: Tue, 9 Jun 2026 00:01:31 +0000
Message-ID:
 <SA1PR12MB677332F7E861D62C94EC6812A01D2@SA1PR12MB6773.namprd12.prod.outlook.com>
References: <20260504175204.3122979-1-bwicaksono@nvidia.com>
 <agxMXsznrU3mvcfE@willie-the-truck>
In-Reply-To: <agxMXsznrU3mvcfE@willie-the-truck>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB6773:EE_|MW4PR12MB7216:EE_
x-ms-office365-filtering-correlation-id: ab18081f-ee46-43b0-561a-08dec5ba4360
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|6133799003|3023799007|18002099003|22082099003|11063799006|56012099006|4143699003;
x-microsoft-antispam-message-info:
 0fvoIKfJgEC8fJY5zB5Tw3c98Mthk79MrF8xxYobuC5P4omO2fi7QZ6XjIILDPTJBaM2RQd4CZBbbtrRZ2PeowjsEdQKiazxk+tiG5CXfONg8zLsMz3Pe4mtMlN/vR4FvIxKxPwo6P6xQDRpwx/zkFhni9NlpZYcn2Yq/HNME44DHx+wqyoU8XUAU/nJqyvD39tRF7sRNEFNGsEqJjk53fXYb32D8W0HiywR2kSNUivANxSt//zAv8kTWekYp3QNQ2QD7L/qJVtuMZ5hkR/zg1qZf5YxWD76tmW8lPvis8vEojr4rjN0zGSDljCz/WX7pZTVVHCfDWJVkN7TRILkc96x2Xl6jCYol2xGwuYToNvi9gMicBzs77dFj2Z6zNOS4QWCChIl7PLVr749G/n/MwEbZX8eJjJsjBlqUgQ/2amDQMtAO4Es8ejNOeBHcH4xImFeGe1+Jcl8tdMgvrdnOjUZZH5U5qHzn/0xiFowEagMiypSMKaQEIEvhaIoG4OVduq2CFaeOUne3iB3Ggd7oGjudfrO+61s5PMZSZrLB7zf6Bp7E0UZzDDq/OKkx2fFz/xMsOxVzYyznHjhf4teZkOGSzvUfjMHRF3fR9nXJoC8MLgzyDreX6RLewlWrB6XJtj320Ykq7TPp7HvPBxLEjPNW4ZrctGojou2BiVXFlt1SVtstOdeiPJjLjdRQItzDFe21u9MqwjC2XSTdbTpBNkLmfgQmr4t3ylP0up2q4LxlSopQyZYwFkoSm8GzQ8/
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR12MB6773.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(6133799003)(3023799007)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?KNpGx/pISkyet7JaqAVCliBnz8ADyOYUZdkjzdg8iWBeezKq9E+WmgpOzuxJ?=
 =?us-ascii?Q?UDdkffbEziNO+A/8J3FLr9VJOKRPQr7mzyHmAn5VQh83nyJkK9wypeiU1XUd?=
 =?us-ascii?Q?aMFl8QNGqmZA07CYJITgGAQt5pb+NZfBKIv6Y4piuKZHr5In8g2K1ob9mgl+?=
 =?us-ascii?Q?ReU138IhOiRWEUV+BCXEr1WZOIQ7xGEKgPwRfEEGERlmeTSS6qJ9hjx3Op7/?=
 =?us-ascii?Q?4qsWMv+CX4V/kSUoHkYa0/1Iz4iIaf4PFPBChjsr71KHl6hD24ECc+Hm/lkP?=
 =?us-ascii?Q?A++l1PZ508taIY1wV2nmE2niBsyTXxjHVo7DSYked9aABo61AxR3kab53VbF?=
 =?us-ascii?Q?EJT4hXEdWbahdnhVbMetZhRzPjCriy6Ok8A6EaSfZYXFwqxcIJshnM1ArXyN?=
 =?us-ascii?Q?gKydZZioskGs5M8qYn1wRPUxpZZXx4AVJlalg1sNprPvOtk67GDWoOTEu8/b?=
 =?us-ascii?Q?8URisToSpKPXs4pVTsK1+94MEnFiVhTAzWFMepSoZcYWRvrd2eTHl8ycIQ/P?=
 =?us-ascii?Q?CCV2pnzvdQ3UiwiUbCVcd/F/cGFHy7YgoA2dw/HsZaENYEtRzHTdI6mqVoaw?=
 =?us-ascii?Q?MG4pUx8k7GeYfxxyLk/zTaTdSNeJHaofHXdyFkmXJwhF+6w9wYZ94Kki+rzm?=
 =?us-ascii?Q?OGFhxs0vi2pQ0ThzBspjdGArvQN3m3EoLkoZ9zsApTxQMF2TJzvsW4+d0xBW?=
 =?us-ascii?Q?RNJveY71fQ/v/oHukEZNomJw4LtO0GhIGXVsN4gCe5SvPvV815INo8zueqnS?=
 =?us-ascii?Q?Mz1BEAhU9shgjzIxc32UeVNSMMG6GypxqRfpQKrLWfbrewXMZLAFuMYdKydi?=
 =?us-ascii?Q?IhTzK3Xu72H28htKh0PrPG8nng+UehRHCUrP/ezOb69+p37RuLO7HdWhGd7/?=
 =?us-ascii?Q?3Vq+tQ7sa2DIk7bCUPoz9TUrpHztw9OeUViqS6JgZHDPv9+iTMAw5bdmLJmv?=
 =?us-ascii?Q?UHB0vBE98j9rg5Tog73MOgJL9sA4b92xfe2CLFKY5034RXC8eZYue3jtn33S?=
 =?us-ascii?Q?jTExQitMkZOL0uToGAaQsU7dZKMda3G6LmxhTCQXKWbreFTjHJ5RoFqOLocf?=
 =?us-ascii?Q?0nO8Qjyn9VBfWfOm+p4DaxWokXtE7odxDy7Q9AcwhDCK2yAi4Kqz4xRTIGSw?=
 =?us-ascii?Q?OCdMocb+I0iuAFRBAiqVNCFSTupxCPvUrwu4GIGHdyFHooIpR5FAi/VHMh2Q?=
 =?us-ascii?Q?6KR/niEO745wnLVYZHsH1xtXLyJSl9ZcsIjGByi9xN/Y9TyPdweoI0/ijrOA?=
 =?us-ascii?Q?OqtLlrp5LQ3k0tq/N25V9j8GNjs7A25OTW4lO0SW3qTCRJq93BZzz1IX2kK6?=
 =?us-ascii?Q?dP+5QfKiSq0Lk+WUWR3j93+rA8wKgz9wMmrUJDPtLSAaZN18KDvjWeBsT3j+?=
 =?us-ascii?Q?auJUenPpAOVAfLKBfnOFrvCOBqjNbSkAILgko5lSJCONqAPzVuCaroa9EWvz?=
 =?us-ascii?Q?kX0Fy6csrEZ36L8WmDNA2dfbtetkDjltgT0373O7cmjTXnPxc4idd3r6eRPu?=
 =?us-ascii?Q?sH52vT0iHuaTkZx0K4YEsoz30h+/sxp5nEeW3Jy30rK7d7sPlhZ3szMFnP7w?=
 =?us-ascii?Q?/CAyhIKyg4o8WsYNsafZ3rSKLhdgpXS5H9T+nwrF1E8wwQYVNwA6t0FuyaK4?=
 =?us-ascii?Q?p98E5HnFu2lJ12qgmLZ4carWPEF33CX/TbUxOD3fZNW4WnwdQG5pllBmcbZx?=
 =?us-ascii?Q?rbxp70WUcFBr0K48sTUN334lmgWcvIsFxPjgJ5CmqRLM1U5Xy+TgrKprty5d?=
 =?us-ascii?Q?dA0PmGttEg=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6773.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab18081f-ee46-43b0-561a-08dec5ba4360
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2026 00:01:31.7521
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HrcBqBZ9l7I4fOrQRu6bzhR+MTcFzOkPYAncOi1x/Si93NCxpBPl2HGhm7X/duB96rVrSVqxRUhTrWmZf7jwLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7216

Hi Will,

My apology for taking a while to respond.
Please see my reply inline.

> -----Original Message-----
> From: Will Deacon <will@kernel.org>
> Sent: Tuesday, May 19, 2026 6:41 AM
> To: Besar Wicaksono <bwicaksono@nvidia.com>
> Cc: mark.rutland@arm.com; james.clark@linaro.org; yangyccccc@gmail.com;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; linux=
-
> tegra@vger.kernel.org; Thierry Reding <treding@nvidia.com>; Jon Hunter
> <jonathanh@nvidia.com>; Vikram Sethi <vsethi@nvidia.com>; Rich Wiley
> <rwiley@nvidia.com>; Shanker Donthineni <sdonthineni@nvidia.com>; Matt
> Ochs <mochs@nvidia.com>; Nirmoy Das <nirmoyd@nvidia.com>; Sean Kelley
> <skelley@nvidia.com>
> Subject: Re: [PATCH v4] perf/arm_pmu: Skip PMCCNTR_EL0 on NVIDIA
> Olympus
>=20
> External email: Use caution opening links or attachments
>=20
>=20
> On Mon, May 04, 2026 at 05:52:04PM +0000, Besar Wicaksono wrote:
> > PMCCNTR_EL0 may continue to increment on NVIDIA Olympus CPUs while
> the
> > PE is in WFI/WFE. That does not necessarily match the CPU_CYCLES event
> > counted by a programmable counter, so using PMCCNTR_EL0 for cycles can
> > give results that differ from the programmable counter path.
> >
> > Extend the existing PMCCNTR avoidance decision from the SMT case to
> > also cover Olympus. Store the result in the common arm_pmu state at
> > registration time, so arm_pmuv3 can keep using a single flag when
> > deciding whether CPU_CYCLES may use PMCCNTR_EL0.
> >
> > Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> > ---
> >
> > Changes from v1:
> >   * add CONFIG_ARM64 check to fix build error found by kernel test robo=
t
> >   * add explicit include of <asm/cputype.h>
> > v1: https://lore.kernel.org/linux-arm-kernel/20260406232034.2566133-1-
> bwicaksono@nvidia.com/
> >
> > Changes from v2:
> >   * Move the Olympus PMCCNTR avoidance check from arm_pmuv3.c to the
> >     common arm_pmu registration path.
> >   * Replace the PMUv3-only has_smt flag with avoid_pmccntr, covering bo=
th
> >     the existing SMT restriction and the Olympus MIDR restriction.
> >   * Use the cached per-CPU MIDR from cpu_data instead of calling
> >     is_midr_in_range_list() from armv8pmu_can_use_pmccntr().
> >   * Add the required asm/cpu.h include for cpu_data.
> > v2: https://lore.kernel.org/linux-arm-kernel/20260421203856.3539186-1-
> bwicaksono@nvidia.com/#t
> >
> > Changes from v3:
> >   * Move avoidance check based on MIDR to __armv8pmu_probe_pmu() to
> make sure
> >     the MIDR is retrieved from the correct online CPU.
> > v3: https://lore.kernel.org/linux-arm-kernel/20260429215614.1793131-1-
> bwicaksono@nvidia.com/
> >
> > ---
> >  drivers/perf/arm_pmu.c       |  7 ++++-
> >  drivers/perf/arm_pmuv3.c     | 51
> +++++++++++++++++++++++++++++++-----
> >  include/linux/perf/arm_pmu.h |  2 +-
> >  3 files changed, 51 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
> > index 939bcbd433aa..aa1dac0b440f 100644
> > --- a/drivers/perf/arm_pmu.c
> > +++ b/drivers/perf/arm_pmu.c
> > @@ -931,8 +931,13 @@ int armpmu_register(struct arm_pmu *pmu)
> >       /*
> >        * By this stage we know our supported CPUs on either DT/ACPI
> platforms,
> >        * detect the SMT implementation.
> > +      * On SMT CPUs, the PMCCNTR_EL0 increments from the processor clo=
ck
> rather
> > +      * than the PE clock (ARM DDI0487 L.b D13.1.3) which means it'll
> continue
> > +      * counting on a WFI PE if one of its SMT sibling is not idle on =
a
> > +      * multi-threaded implementation. So don't use it on SMT cores.
> >        */
> > -     pmu->has_smt =3D topology_core_has_smt(cpumask_first(&pmu-
> >supported_cpus));
> > +     pmu->avoid_pmccntr |=3D
> > +             topology_core_has_smt(cpumask_first(&pmu->supported_cpus)=
);
> >
> >       if (!pmu->set_event_filter)
> >               pmu->pmu.capabilities |=3D PERF_PMU_CAP_NO_EXCLUDE;
> > diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
> > index 8014ff766cff..1ee4a09d0dcc 100644
> > --- a/drivers/perf/arm_pmuv3.c
> > +++ b/drivers/perf/arm_pmuv3.c
> > @@ -8,6 +8,7 @@
> >   * This code is based heavily on the ARMv7 perf event code.
> >   */
> >
> > +#include <asm/cputype.h>
> >  #include <asm/irq_regs.h>
> >  #include <asm/perf_event.h>
> >  #include <asm/virt.h>
> > @@ -1002,13 +1003,7 @@ static bool armv8pmu_can_use_pmccntr(struct
> pmu_hw_events *cpuc,
> >       if (has_branch_stack(event))
> >               return false;
> >
> > -     /*
> > -      * The PMCCNTR_EL0 increments from the processor clock rather tha=
n
> > -      * the PE clock (ARM DDI0487 L.b D13.1.3) which means it'll conti=
nue
> > -      * counting on a WFI PE if one of its SMT sibling is not idle on =
a
> > -      * multi-threaded implementation. So don't use it on SMT cores.
> > -      */
> > -     if (cpu_pmu->has_smt)
> > +     if (cpu_pmu->avoid_pmccntr)
> >               return false;
> >
> >       return true;
> > @@ -1299,6 +1294,41 @@ static int armv8_vulcan_map_event(struct
> perf_event *event)
> >                                      &armv8_vulcan_perf_cache_map);
> >  }
> >
> > +#ifdef CONFIG_ARM64
> > +/*
> > + * List of CPUs that should avoid using PMCCNTR_EL0.
> > + */
> > +static struct midr_range armv8pmu_avoid_pmccntr_cpus[] =3D {
> > +     /*
> > +      * The PMCCNTR_EL0 in Olympus CPU may still increment while in
> WFI/WFE state.
> > +      * This is an implementation specific behavior and not an erratum=
.
> > +      *
> > +      * From ARM DDI0487 D14.4:
> > +      *   It is IMPLEMENTATION SPECIFIC whether CPU_CYCLES and PMCCNTR
> count
> > +      *   when the PE is in WFI or WFE state, even if the clocks are n=
ot stopped.
>=20
> So surely the weird part here is that Olypmus chose one behaviour for
> PMCCNTR and another for the CPU_CYCLES event? The Arm ARM text isn't

That is correct.

> clear to me as to whether that's permitted but I think we should call
> it out here.
>=20

Sure, I will call it out explicitly.

> > +      * From ARM DDI0487 D24.5.2:
> > +      *   All counters are subject to any changes in clock frequency, =
including
> > +      *   clock stopping caused by the WFI and WFE instructions.
> > +      *   This means that it is CONSTRAINED UNPREDICTABLE whether or n=
ot
> > +      *   PMCCNTR_EL0 continues to increment when clocks are stopped b=
y
> WFI and
> > +      *   WFE instructions.
> > +      */
> > +     MIDR_ALL_VERSIONS(MIDR_NVIDIA_OLYMPUS),
> > +     {}
> > +};
> > +
> > +static bool armv8pmu_is_in_avoid_pmccntr_cpus(void)
> > +{
> > +     return is_midr_in_range_list(armv8pmu_avoid_pmccntr_cpus);
> > +}
> > +#else
> > +static bool armv8pmu_is_in_avoid_pmccntr_cpus(void)
> > +{
> > +     return false;
> > +}
> > +#endif
> > +
> >  struct armv8pmu_probe_info {
> >       struct arm_pmu *pmu;
> >       bool present;
> > @@ -1348,6 +1378,13 @@ static void __armv8pmu_probe_pmu(void
> *info)
> >       else
> >               cpu_pmu->reg_pmmir =3D 0;
> >
> > +     /*
> > +      * On some CPUs, PMCCNTR_EL0 does not match the behavior of
> CPU_CYCLES
> > +      * programmable counter, so avoid routing cycles through PMCCNTR_=
EL0
> to
> > +      * prevent inconsistency in the results.
> > +      */
> > +     cpu_pmu->avoid_pmccntr |=3D armv8pmu_is_in_avoid_pmccntr_cpus();
>=20
> Do we also want to hide the cycle counter from userspace? It sounds like
> it's going to get very confused if it tries to use it...
>=20

Makes sense. I tried making the change on v5.
Please check https://lore.kernel.org/linux-arm-kernel/20260608234135.185691=
1-1-bwicaksono@nvidia.com/T/#u

Thanks,
Besar

