Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2076.outbound.protection.outlook.com [40.107.220.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E961E6316;
	Thu, 24 Oct 2024 14:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729779061; cv=fail; b=rttmzFfOM5nszXvC11KvpaKXotpb75PIKSmyq/5AcWH2HbfoNhX8LgqTLRfcKBxTlQo57xn2HMgdC18nvf3oYdZLcL/EUKx+mnImIhg6NJGXhFw5HGU0kUL8IsfoCeMjBH4al9cb3bAzP/emY4DaiPUUp6ajRQcoZ0p8iEvXFXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729779061; c=relaxed/simple;
	bh=Em3zvddQlzybEYpP/jUgltYnrMzo2WbmW1bK4HU+AFg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UZtqZ07Hjs3f3iK5m21ETSfbxI66HwzgsdXCeVJW67xajMC8QnyfWLi/SzpKKWjd7JbRkh6JnFGMiD3/pp7ja1+tPz9uQegM5AFHd0ZGmfPqJA/z6RfcYL5htjh9DZyz4QnfTlEgmXM9/gIdO4u87Q6gEfB2L5DJ3kHuRS1v+QA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=C/4qq22N; arc=fail smtp.client-ip=40.107.220.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="C/4qq22N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wGAvPsQK0Evg8dbtcozXxctRMPWF49jl2lCBmS9bMbTu5BERf9sNUCdhTodRteNYyNqQCB95KanpMUX7SmjBS6a641oXNA7cwVWKdfrdCkCoMLr5xQjLlmkbNWgVyHdkmEd/K2ahK1MBZ4yUCAC6WSViVs06C8ZJejJZBuOZ3gWo9zUPKgXq/23ZM+/V/fOqnfrFmdBE9D9j/1R1ZZHj915R9KNQqBj/z1x+o4L1G0v4YXbDzOubTm8QpWbezuxzVEQqKcmGX3RTgIVkfduLpjCEufS3MyNb90vrqaNU4LOsbSy7d8cIDLfmD3kAhVulo5PfLUpqP0TPfBYdGoerYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l75bOyP3kW4rpzfkjErqlId/43gY2oD+PjEUkUAiotc=;
 b=J/shZi862upXNHMryLhxf1A+EU9UJp5n1kaZqpZK734bEqYUFHtOsqTP0pdNzjjEBW5Hx3q/tWD2YYnlv9kmuxMIVjKAv6lAgwxNKpa5+ko6A7F54Z9lgX6iO04bLXDI1wTLDjtDTKzykaCa1SHqaIZ4mXBivkLkcFCRW2f+72hUfJ5E8k6aKSQvCtdEvscXhXMwb3T4/dlXiXw8jMFbbPSJ1pfIilCjDzX4riJ8clvEccOxmO3/S14U2uur5KKriQfy6FnLVHFOo9HRaSdKhMS+4FRSUMHOE/Qi+Ws2Z5FmMaoSudG/s3GuRTv0zgLUr4DCaE8CXpAfUIda6jM/Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l75bOyP3kW4rpzfkjErqlId/43gY2oD+PjEUkUAiotc=;
 b=C/4qq22N9LUeu6B0Q8vY1Fxtei+VeMk6OBVLjQYtEWCz1yFmKSaGa3bfgyo5yVKQlFTRDQPXgc6ZfCSNPfrzlXK4FDwTlK7s4OxLitYzOyBfp9C+79ry11TCm5AWnQvBkEEBTdr+MFRnMZ4270ipfgWgvxr0iYpLjxa/1CCcxyJ1Hi7hITCqfxui+eU44LI5jOGQ+uOOvqe3zl17Gt8nlCkjkujTj7pgSg1O0E1vWd8WbzuE8/qzz41UB1GDg1yJNO4ECUINlgCFDUf74dmKU/BlISXNEwSEz6Q9jZ8C9nD3C7nB+TCyxgob214bMqd6ZYqAiFpbOwsNtZSZOII+Ew==
Received: from SJ0PR12MB5676.namprd12.prod.outlook.com (2603:10b6:a03:42e::8)
 by SN7PR12MB7786.namprd12.prod.outlook.com (2603:10b6:806:349::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Thu, 24 Oct
 2024 14:10:55 +0000
Received: from SJ0PR12MB5676.namprd12.prod.outlook.com
 ([fe80::abdb:7990:cc95:89ce]) by SJ0PR12MB5676.namprd12.prod.outlook.com
 ([fe80::abdb:7990:cc95:89ce%3]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 14:10:55 +0000
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: Will Deacon <will@kernel.org>
CC: "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "robin.murphy@arm.com"
	<robin.murphy@arm.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, Thierry Reding <treding@nvidia.com>, Jon
 Hunter <jonathanh@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>, Rich Wiley
	<rwiley@nvidia.com>, Bob Knight <rknight@nvidia.com>
Subject: RE: [PATCH 2/3] perf: arm_cspmu: nvidia: update CNVLINK PMU events
Thread-Topic: [PATCH 2/3] perf: arm_cspmu: nvidia: update CNVLINK PMU events
Thread-Index: AQHbChYmMxRBtseJkUCrb6TrJenHELKGYx0AgAHTh7CADIXZgIABabWw
Date: Thu, 24 Oct 2024 14:10:55 +0000
Message-ID:
 <SJ0PR12MB567691F0F89F18EDC84C6092A04E2@SJ0PR12MB5676.namprd12.prod.outlook.com>
References: <20240918215846.1424282-1-bwicaksono@nvidia.com>
 <20240918215846.1424282-3-bwicaksono@nvidia.com>
 <20241014131903.GB17353@willie-the-truck>
 <SJ0PR12MB5676697B93C267CE87C5A474A0452@SJ0PR12MB5676.namprd12.prod.outlook.com>
 <20241023162636.GA29251@willie-the-truck>
In-Reply-To: <20241023162636.GA29251@willie-the-truck>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB5676:EE_|SN7PR12MB7786:EE_
x-ms-office365-filtering-correlation-id: 0d10de69-9af7-4267-ec04-08dcf435acf3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?r6UjQWCpksySISCIc4q/zZjBZpV93IiQzrlUAXR0nO/Z46RN9kHg7/P1WTaH?=
 =?us-ascii?Q?EhhF6JBalfc42oBWzxiYoRZTxPJ9OHtDH/CJZ3yls4mk6cqkFyqTCyMC+lIi?=
 =?us-ascii?Q?1NEa6BxkAi6AIqIYIKoqgzfcvCil0+SOvM4WTHoMLCwSAGq5JI34Xq+qKns6?=
 =?us-ascii?Q?ztLzququTiUYaskBqsTeRNeVM1oIhvRAeX9PV1zz/bRw5om8wWFo3ItvSwYn?=
 =?us-ascii?Q?GpKuTel+3IGspQ657jYpdR3K0ulr7PHWy49L1lc1GBBv8QZg+dr88n54LLWM?=
 =?us-ascii?Q?rAD/XZl3pZLFAcpQ0OHrzIGxbKpmFAh8qhmh2jyAezNfTEBT4ENewkjL5EFA?=
 =?us-ascii?Q?hynf07tlTEXqOEoN/BxFic0+7pAwwsFRybdh3kw1FwlLveQHegBcJjvDfyp4?=
 =?us-ascii?Q?6euQ6bpKYtjxQK1lEZHU2TUxRTe32W4YcB63J32Caq4Y5vVpCnH1QO2VgeVy?=
 =?us-ascii?Q?6rbZ7MXrpkg/tVch6+wiZUEaSqSxfFGK//i0OMS+156L/czjBs2Rbro/LOYZ?=
 =?us-ascii?Q?UtlNPiGQpFtAfNv9rERj6zRBbSZDDBjXvBja5md0I9t0JMQZHgFMhvTZqq+d?=
 =?us-ascii?Q?FpyXAAMvW5xX5J7xp4HA35YfAwGvEoROtRp4ZozRUeSpef68RCUXZ7meu+sL?=
 =?us-ascii?Q?aZ0Lie4yrm12So1v7bboATgtcteMO34217aKg+IDpJV5wUotE1AqnGmwy1DD?=
 =?us-ascii?Q?XBURX2AIl7lQiiOrDDmRbBp0oC8a3c9xtLi7xqWrFWnFyYtAZKxoRZ5m5oKQ?=
 =?us-ascii?Q?qYnhNdUic7gDfwuE4RyNTRrVMmBxGNLb8kIeQZDUh86qKG2KSiiAzzPaENyz?=
 =?us-ascii?Q?J4rFtPBSWIwKiNk7EcpjCxMwgXlpPnZueUZ7GiGaH8tdtPf3BoYYThgwGUDm?=
 =?us-ascii?Q?kdehVqpLFwd2PCZRn+nLZt51BCLdQsaQ/QnbORzHTxVLPhRPlmkKiOBZfvIZ?=
 =?us-ascii?Q?SaMQIle9vX1FWXeIk85n0QjHL+WOSIkCTx978oj6PWMJExc98HbylANOGspH?=
 =?us-ascii?Q?g08icuj00izv+qR6WsUB0j72qikR22Z4v+7fyr9AI+FGvXUc9tOR9q3BJIhs?=
 =?us-ascii?Q?6b1UkORmUc9KMjmyblvhCzzUAnYTpbxXc65f6D7DjzkL/SQsvMIUWdo/Ym/J?=
 =?us-ascii?Q?k22m8uyzr5RFNTW8kgtAFXj1ZrMFg0geTmiLR8AuOwqgMYg1sXHYHjbL/X0o?=
 =?us-ascii?Q?+I6XzK1DumwljmSvPHdoCfmTdrYAVxOWtvgVryF7EN44g17a6BVfuJPCYXL+?=
 =?us-ascii?Q?jGhUEQIqvthmK5LV8gwXhQmo/ABhykxGbStRi/6Rv0zp3DenWYlgqMYzX81w?=
 =?us-ascii?Q?3zixjmWcTyM1b9DWaqtMqhKZKgJm4nKg/fnn16GCpXV+GVoYhqAPeENeVuD5?=
 =?us-ascii?Q?CJvgzCQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB5676.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?s+ZHDFPZikP8RRDY8gRgQY9j5vS0hGrKD0bPDHxs1EF8y4InBEqy68X4Y+Wl?=
 =?us-ascii?Q?l2oukU16lUv2P+sf08FyQeLAwmyDs+UZpzVyQx2tUl6X5zFZQ8kfbAS11VVM?=
 =?us-ascii?Q?TJ126xrRP+29GsPaSIffvgvaYGd2ByWHj86SxO4vsRf6C10c5kNngFfdkvB0?=
 =?us-ascii?Q?KtZDoBMRl/ADqHqU5XmwxsCJ94wARr3+IDIg/+/zy2FxcS2bcVeEMpEiTiC0?=
 =?us-ascii?Q?We30jmHyAVGIt6I7/7m6UPpY7JfRdlT/+QQ+DmChOkCkM9mOndpzFjngZ8Xa?=
 =?us-ascii?Q?KRn3pzC13fxz4yQ6/gHom2ArFu1garyf9/PXtqpFNsO75Zb8xJG0T0wLVTBb?=
 =?us-ascii?Q?qGoxB3hybg+hD0N0G8vHTq4n6t7VZbm0U2MWVn3VxauWqWf0ap7OqLcydLzy?=
 =?us-ascii?Q?n19qQ5TpLoh/Ys7pXQ6fUrToJdX3aiCUzcNNV6SU0TjcWYuD/6BUBZgozSSN?=
 =?us-ascii?Q?/BlThXAZbaDaN6NzsZnPLcHptPTvO9IZhmLK8UUl6I9uzx3A0Kqh6uuhDvul?=
 =?us-ascii?Q?wDRoLPCsTLOdLLfIhl1OKFzX5S6U3IVThUdhbwJm91ZXC2SLUXbosG4SqCsA?=
 =?us-ascii?Q?oxl+DSPQSJgw47gaPtx98VQTkTyIMDpWKpFZ5Cz7mlU41TxdX9OS9IXVJJfH?=
 =?us-ascii?Q?2mVvGzK3VYOXTwQi8Dzfbz1aE8RZMfnCoKqRvto2qzfmltlzHeAkp1PYfwES?=
 =?us-ascii?Q?E/yWzi9gb0tc35wClQoK7sORiogNacFEN2qwTOjNYDcjMh3BgtbdAbBajf6G?=
 =?us-ascii?Q?HR7HvAuvEQhf1wwzZjaUodtcUWCrp8taZVAZLhTSvuoUYELh9IpTZV6KYf6F?=
 =?us-ascii?Q?rMXyvpfpszwATZe8F7VeZkiGVohnZorFCwutb3vA8stho7pZxAQVMmtdgnjZ?=
 =?us-ascii?Q?jy+W94J0PwPrbRxsUQ8GPWD5twhfBTjMG8bu98t9BhcQrSYlJnF6QiPiCc+r?=
 =?us-ascii?Q?MJLAiYn3W7lHVxkrxXT0SakeT0tF7VUlvemwN0KacqRvR0dIipBOKsuJf+WZ?=
 =?us-ascii?Q?8ZHySVud4hasenGyaHfM6cKVnIaJKReXhrtcFBhdix6+4nrlmjrXpzg9jbLl?=
 =?us-ascii?Q?lzy4HOwnxM8z/+9Ms4jmvX5MYb8mgZV1zRpUuj9v06yjw4JHXvbYt0cOB3JZ?=
 =?us-ascii?Q?RwQWGnCqobp5oSM2S19tHbBDCz/9k6FOQ/UhpBrHlxUSZ1ntgJYjHBcpVnn8?=
 =?us-ascii?Q?nHkFWMIzXBb7vP2i/6/MXqeFm5IsPEvGb1yU1yBC4B3Yi4slE6mVfNuISB8V?=
 =?us-ascii?Q?vqvswQs+LkQ6BhAPyD1SqGZRTKzgiLrpObxuDQ9fDH2Ub7J+czabBLsU8qik?=
 =?us-ascii?Q?kWk6Z0wFpuhm2YSJxGmUKSmwEUDUnzAzrTH7aliWFIevH8md0T7/EN3dlvVl?=
 =?us-ascii?Q?frD7uSjdOMwRiNuX4cBjcrODAl636f256Ry3yoRJYdfVNyAYQJ8+vLFQ3BbL?=
 =?us-ascii?Q?DBuH5PlTfuTD+l3jsyfw39/rgLlc3q2sOKKxx3xQa7cQU96RbbiH1H+BR9Bd?=
 =?us-ascii?Q?ePIvznF6KRl9oxsSc12tLMUCJL6UI+Asd0HVmO2U5iH3lrikTsNHrLMlCA7t?=
 =?us-ascii?Q?T9sBsT0N4Sh+9vJn7zjm8GyzLt8CGgh+nUzEzmgb?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d10de69-9af7-4267-ec04-08dcf435acf3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2024 14:10:55.1432
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PMoLD+8D4vqob5RnZcelcMkSHQA40L5OyM3KkkAWSK9kiVzD1u+bTFIuX/hoNy8uZ3eR1gZufcY8o1u4Lqv4LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7786



> -----Original Message-----
> From: Will Deacon <will@kernel.org>
> Sent: Wednesday, October 23, 2024 11:27 AM
> To: Besar Wicaksono <bwicaksono@nvidia.com>
> Cc: suzuki.poulose@arm.com; robin.murphy@arm.com;
> catalin.marinas@arm.com; mark.rutland@arm.com; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
> tegra@vger.kernel.org; Thierry Reding <treding@nvidia.com>; Jon Hunter
> <jonathanh@nvidia.com>; Vikram Sethi <vsethi@nvidia.com>; Rich Wiley
> <rwiley@nvidia.com>; Bob Knight <rknight@nvidia.com>
> Subject: Re: [PATCH 2/3] perf: arm_cspmu: nvidia: update CNVLINK PMU
> events
>=20
> External email: Use caution opening links or attachments
>=20
>=20
> On Tue, Oct 15, 2024 at 05:21:06PM +0000, Besar Wicaksono wrote:
> >
> >
> > > -----Original Message-----
> > > From: Will Deacon <will@kernel.org>
> > > Sent: Monday, October 14, 2024 8:19 AM
> > > To: Besar Wicaksono <bwicaksono@nvidia.com>
> > > Cc: suzuki.poulose@arm.com; robin.murphy@arm.com;
> > > catalin.marinas@arm.com; mark.rutland@arm.com; linux-arm-
> > > kernel@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
> > > tegra@vger.kernel.org; Thierry Reding <treding@nvidia.com>; Jon Hunte=
r
> > > <jonathanh@nvidia.com>; Vikram Sethi <vsethi@nvidia.com>; Rich Wiley
> > > <rwiley@nvidia.com>; Bob Knight <rknight@nvidia.com>
> > > Subject: Re: [PATCH 2/3] perf: arm_cspmu: nvidia: update CNVLINK PMU
> > > events
> > >
> > > External email: Use caution opening links or attachments
> > >
> > >
> > > On Wed, Sep 18, 2024 at 09:58:45PM +0000, Besar Wicaksono wrote:
> > > > Rename loc* and rem* events in CNVLINK PMU to cmem* and gmem*
> > > events.
> > > >
> > > > Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> > > > ---
> > > >  drivers/perf/arm_cspmu/nvidia_cspmu.c | 21
> ++++++++++++++++++++-
> > > >  1 file changed, 20 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c
> > > b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> > > > index ea2d44adfa7c..d1cd9975e71a 100644
> > > > --- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
> > > > +++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> > > > @@ -112,6 +112,25 @@ static struct attribute *mcf_pmu_event_attrs[]
> =3D {
> > > >       NULL,
> > > >  };
> > > >
> > > > +static struct attribute *mcf_cnvlink_pmu_event_attrs[] =3D {
> > > > +     ARM_CSPMU_EVENT_ATTR(rd_bytes_cmem,                     0x0),
> > > > +     ARM_CSPMU_EVENT_ATTR(rd_bytes_gmem,                     0x1),
> > > > +     ARM_CSPMU_EVENT_ATTR(wr_bytes_cmem,                     0x2),
> > > > +     ARM_CSPMU_EVENT_ATTR(wr_bytes_gmem,                     0x3),
> > > > +     ARM_CSPMU_EVENT_ATTR(total_bytes_cmem,                  0x4),
> > > > +     ARM_CSPMU_EVENT_ATTR(total_bytes_gmem,                  0x5),
> > > > +     ARM_CSPMU_EVENT_ATTR(rd_req_cmem,                       0x6),
> > > > +     ARM_CSPMU_EVENT_ATTR(rd_req_gmem,                       0x7),
> > > > +     ARM_CSPMU_EVENT_ATTR(wr_req_cmem,                       0x8),
> > > > +     ARM_CSPMU_EVENT_ATTR(wr_req_gmem,                       0x9),
> > > > +     ARM_CSPMU_EVENT_ATTR(total_req_cmem,                    0xa),
> > > > +     ARM_CSPMU_EVENT_ATTR(total_req_gmem,                    0xb),
> > > > +     ARM_CSPMU_EVENT_ATTR(rd_cum_outs_cmem,                  0xc),
> > > > +     ARM_CSPMU_EVENT_ATTR(rd_cum_outs_gmem,                  0xd),
> > > > +     ARM_CSPMU_EVENT_ATTR(cycles,
> > > ARM_CSPMU_EVT_CYCLES_DEFAULT),
> > > > +     NULL,
> > > > +};
> > > > +
> > > >  static struct attribute *generic_pmu_event_attrs[] =3D {
> > > >       ARM_CSPMU_EVENT_ATTR(cycles,
> > > ARM_CSPMU_EVT_CYCLES_DEFAULT),
> > > >       NULL,
> > > > @@ -234,7 +253,7 @@ static const struct nv_cspmu_match
> > > nv_cspmu_match[] =3D {
> > > >         .filter_default_val =3D NV_CNVL_FILTER_ID_MASK,
> > > >         .name_pattern =3D "nvidia_cnvlink_pmu_%u",
> > > >         .name_fmt =3D NAME_FMT_SOCKET,
> > > > -       .event_attr =3D mcf_pmu_event_attrs,
> > > > +       .event_attr =3D mcf_cnvlink_pmu_event_attrs,
> > > >         .format_attr =3D cnvlink_pmu_format_attrs
> > > >       },
> > >
> > > Hmm. Isn't this a user-visible change? For example, will scripts driv=
ing
> > > 'perf' with the old event names continue to work after this patch?
> > >
> >
> > Yes this is user visible. I am expecting user script to be updated acco=
rdingly.
> > Would this be reasonable?
>=20
> I don't think so, no. We don't tend to require userspace changes as a
> result of upgrading the kernel.

Are you referring to userspace change just on the perf tool side?
Cause this PMU doesn't have JSON scripts for alias/metric in the perf tool =
yet.

Do you have suggestion of the proper approach?

Thanks,
Besar
