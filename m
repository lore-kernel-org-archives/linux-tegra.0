Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9611304BA;
	Tue,  3 Dec 2024 03:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733197442; cv=fail; b=qf9Bdgkt4fhbJW5f1vp7iJOJi61wWezHmcZeBVnmVnbyNjarpJk7KYVAUt26sLmKYXlbkrmgFNlG1ANYMoNuXU5rJi1bkUgzGYfyYYsVn1MDezu1czJBuw/89XmqJ53SsZ+QFN2ZFgCrhB3KKTDqAXsTnGg3vgOP/rnBnuKdxcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733197442; c=relaxed/simple;
	bh=zeCz3HBsb1cbOHl8VLA74Gke7kblP+uj1x0K34qr/e8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JVja9UMSA68HdPZ1T/eava2xit+pqJjyOGENTaFZKREmOm2fHM6hHTxr/9nWmyRaGfRmOyL3qpyAI1SkieDViAuDKt31pcp9Uqv4vadPSOnfLoJOrQ7hfr9gYEUKXg37uzWVxiDQpBsBCNALGxxLC5KXxzq3d9vRDwXUrWr3Dls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fFWeUirQ; arc=fail smtp.client-ip=40.107.223.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fFWeUirQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g2vmPbzwrkk/pXqRXoZPYzTQWIpOrbaxwx+aQKJSrJzGgzoq9JxhTr9sdXAiN+VlE0jZuOdmI5eJgkXF1KsEkuTgKMjaqjTQkaMM2IInvMUT3TS9t4jQOjZYOcIzgEvqcq1CgucJSk63hXv0uocKhZUCj5ZV5M2nNWnRB+vRnWN+gDnap3dazs21OYN46pw8a7HuzaYCozRXRXIkr+S/tYQtB2Qvo05RSSO3AwfFyERRg0zQs5W/g8wznoKZevoMKd4zC4Sv6Zx1wWba+7rXezjYapAFhYBW7LYmViN0FlAvPbm5pPTYSI8bmYpgqA+RPIhg9GNwBI2lRejFd0N+kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BQidfS0kXfT2mWenBybVZFLp6UIkkgtA7JZm9pP5FP0=;
 b=G3i4xaLcdR3wpxC+GwJh/XwoeC8g4kzAQf8T7YwKHHWZBUGyT/+bduNsZ07RTGjIdi1Dniyl+BLltQUF/VuFiNuR8bmrm0bRLbFABsSFiJF96GEO+FO/lPJAge5m+h+yIdEmtbmyU7LiDOQwtK5UM6RS0wVK789qCcwR8OdfTiC6LQPqDnhjeJflaoiEt/EDU6B9HnjUaeM1HCLO2AJ1+BcLLmUv8cgQougz6GBq/f/Wm7/2SYW4fMracYxaqin2y/umT1COZc4dEU2LpFoiKTCcI9vqKZVvLEyWcgh9NF/PJj/TkDrMtR8L8XvnWrZrttTI+0bLrcXH3KQVUA5R7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQidfS0kXfT2mWenBybVZFLp6UIkkgtA7JZm9pP5FP0=;
 b=fFWeUirQlvIyLA4IvlAlUGItlET0anJzxPm2Z9fY5gw3pTaoG3rc2ls6v7QGznzA4WlVfaLPDjddCrTsPWkOtTiSGA/1XzrYdulst15X9ExW+kXfR9y3l/TfuCBFdd8Gg/FKbxm3xB/eY52c1Y9N8LShO9Cjm7smvqYkTyEC49qThDhDEUV1HdhiH0tgq/h5Ds82oVGG/96oBHN/wRzMCpvtEYEccfvlRZ5na1DIwrmKKvcsoUZezL4a7uWdOaz8vA0Ht2YUAhfJXeXTaEoJjLuM20Z9ly6YKDV0FiSaEa+AJ3A6gVx3etITSgTgsDd0MHIT8eTnd8I5R1mP85QnLA==
Received: from SJ0PR12MB5676.namprd12.prod.outlook.com (2603:10b6:a03:42e::8)
 by CH2PR12MB4040.namprd12.prod.outlook.com (2603:10b6:610:ac::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 03:43:56 +0000
Received: from SJ0PR12MB5676.namprd12.prod.outlook.com
 ([fe80::abdb:7990:cc95:89ce]) by SJ0PR12MB5676.namprd12.prod.outlook.com
 ([fe80::abdb:7990:cc95:89ce%3]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 03:43:55 +0000
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
	<rwiley@nvidia.com>, Bob Knight <rknight@nvidia.com>, Yifei Wan
	<YWan@nvidia.com>
Subject: RE: [PATCH 2/3] perf: arm_cspmu: nvidia: update CNVLINK PMU events
Thread-Topic: [PATCH 2/3] perf: arm_cspmu: nvidia: update CNVLINK PMU events
Thread-Index:
 AQHbChYmMxRBtseJkUCrb6TrJenHELKGYx0AgAHTh7CADIXZgIABabWwgAZenwCAN89gEA==
Date: Tue, 3 Dec 2024 03:43:55 +0000
Message-ID:
 <SJ0PR12MB5676EFF6A0B1EEB4927FA06BA0362@SJ0PR12MB5676.namprd12.prod.outlook.com>
References: <20240918215846.1424282-1-bwicaksono@nvidia.com>
 <20240918215846.1424282-3-bwicaksono@nvidia.com>
 <20241014131903.GB17353@willie-the-truck>
 <SJ0PR12MB5676697B93C267CE87C5A474A0452@SJ0PR12MB5676.namprd12.prod.outlook.com>
 <20241023162636.GA29251@willie-the-truck>
 <SJ0PR12MB567691F0F89F18EDC84C6092A04E2@SJ0PR12MB5676.namprd12.prod.outlook.com>
 <20241028151725.GA2484@willie-the-truck>
In-Reply-To: <20241028151725.GA2484@willie-the-truck>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB5676:EE_|CH2PR12MB4040:EE_
x-ms-office365-filtering-correlation-id: a71c051b-76c1-4daf-30de-08dd134cb633
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?jVjHkx3O+b5qTmsgRRTliyVwpD0yBJh+54WyL50tm7gKwsHMSLM+q8BKeDfW?=
 =?us-ascii?Q?c0qqSlFPXucJhD7Tuom2Z87U2Qd7IC0VDf6aTAWg9vEFo+zrrmNnHMGqfWju?=
 =?us-ascii?Q?OUSqqkvY12YzAxx7vG2NgG0Fh4E7iVoW9acBYYZIf4U+Y7VY6WmrDqxGcqIy?=
 =?us-ascii?Q?w8fzlw6ZgxJ8iymmbRm7dfd1LQOjV6qvWwBFbX7Q7IxwzCvRZRrVFR4Mu/Vo?=
 =?us-ascii?Q?TXRfBnC1+mCqyzS6WbVi0auiCNLcdSJXgMts1LX4lhm4qLjuaPLggFfC+WkA?=
 =?us-ascii?Q?V+2MbW7kTlgGGxsCVSFypBOVX7wHrhlqDljQzgcUYR8rtatsRj8hMOCmRmqX?=
 =?us-ascii?Q?h0NHuI/Qz9Wg+3T0gKaJl98TVDe/NT1DEyPu5W0xDIPn9GUIiox0aeOWjolT?=
 =?us-ascii?Q?KC4UbPYxo0yGIhrvMcrlWayr6QQIgMcB5LFDau8sa+tj1eTCshi/ye3nSdkP?=
 =?us-ascii?Q?bbsBUVlK0Pn8jf2M+fYQISXFsRYj4+MbOfOrSVe4hnp9UMzebjOe3IVxIuLt?=
 =?us-ascii?Q?Vmh3LdRhXZi+zZJ9JxyIExu0OpXfvIIMES8gKxlryJFtxV3OQ6+kMhdycTTX?=
 =?us-ascii?Q?RnFuWrK89Dx07dibY5+rGHbfLFAbk+uEbvCzErQEzJBNfXWifRzbpaPMwp7o?=
 =?us-ascii?Q?F1f3j5R3qUgno3yInOSu5PH/qB+H2LxegyiGv9q87DdKP9F7sdY7wZgoa8E1?=
 =?us-ascii?Q?8L0CbmTXXGVE6wkLlu928mY24qyDjdZv9GxMDDzws46p9weTEgegyVxLH9R/?=
 =?us-ascii?Q?Q4yCCBtOa3FoE1npJ5H4qJPZbq0jZBr6jRHzchO+CboKEWiwJ2azJZYJabNZ?=
 =?us-ascii?Q?lBJ80+UDGKSUSLtWjimmMfj4ytM/UeWNXaU+7iKS5ahNJVsRzwXm4Cd0o/Ar?=
 =?us-ascii?Q?xNMHgCWu9z64Lk8zcse/gW0ZKUkQaNQXB1GwAAd1aYvuL3BEQkK1QaDPSu0G?=
 =?us-ascii?Q?jUf9LHEcVZwLAYab6u/NAAYzLb2CnVgGRmEUBeq5dhQQli8a2b5HYqarljLc?=
 =?us-ascii?Q?XQOUA9ysLjt1c9c7zWm9j245xqknXptehWk5v1khTt54SvwQa6gQ/DWx2+b7?=
 =?us-ascii?Q?yYj0L628D2HCUsBdNQwmbecEXC0RHTssjHsh59siObE+LKPsD9lBkZ3SNZyx?=
 =?us-ascii?Q?sXUf+OiiYjRG3AtGWtjq38eYMxQTq9YQOl9C5QENMr5GxtKfRBFGCqZr9kV9?=
 =?us-ascii?Q?KWXhUwhmdpXP3AidNPTtfNMskWxPoCigFmT8vINW0HHEXRM4r+38HsQvilDl?=
 =?us-ascii?Q?sAH6eBldKwHun3jUDaVnAPIqKpOPgBZ1pnPKL39F5vzJJsHnz/xXQfjahqew?=
 =?us-ascii?Q?AWRVxlk/xj7Q3Z/DlpiuLqYBxD20MAdRnqhqHQSijdxUXTBlqYQxAoBRqh7W?=
 =?us-ascii?Q?V3WUkOxwHWm0rFKpc6kMDIUEki9nMiGnCLeOtr9jZ8XDWv3xvQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB5676.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Ym6fCFZ2MBXoG1Xr8M2PlSO+2rKi6q86DPIk/3CwwSSNcWLF/kSOR/fUMVgk?=
 =?us-ascii?Q?GtyZfr7SrERvueB3Kkzj/aCEF6m45BXlRSmvDISUPx+fwCWn0HrCgPv5oxeV?=
 =?us-ascii?Q?orHcbP0+KXvQSwzy5qxUcqvq36xz6vouhqxbBNEjiqn3lwUa0cxBR6hgd7FV?=
 =?us-ascii?Q?ivqMTkekMg/0ueJLQkHHsrqBvXzifNUNPhQZEf6XirtQOxWevsUUzqoK0/90?=
 =?us-ascii?Q?rRR4ir+ofCjG9ORtMUB7PanGkNhjItiCbEIKOWcX/dZ2HLe/m7DFIaMOtk1b?=
 =?us-ascii?Q?0OaaSF0udgt5lIBGbTG90CqT2/l1v9rV5G5jATQ0S19BWILHBRZnrAGMQvJg?=
 =?us-ascii?Q?Lqhm31zJLx9SD7n51Psh/7yaxL9ZYDK7czg+1yShC7PQA0rCUxN+gmAZv32J?=
 =?us-ascii?Q?hQHUW/PO62sqxlt+x6Uf9W8sAp1b6YAMEHBMyVvy+x2fhbg48/zP5oph9WyR?=
 =?us-ascii?Q?il69TZZamrMwmgXOmR3F7TSeA3qXl+lNVQ9laAaVH8mm1axXxp5Du/hF+xy2?=
 =?us-ascii?Q?NMR0ebPCpewGjzWOhu9gMNnfrsVApWL6xZWIBFbGWFC4ZClAeeGtheh/bpdG?=
 =?us-ascii?Q?iyeTMYT7zZitf59V/Z/jq386Qs8zAzb+P9YteXCn7KzmUQkjYOuthh2h1KYh?=
 =?us-ascii?Q?oD/FxSGUTXLvu1Lc29lzNvARAIfckdr2+4vJoK0sECjLPHStLfOD6IjoYF9Q?=
 =?us-ascii?Q?zUmk8POwolt8D2DndP9pXy1t2Aokd8x51Dte4Pmfag5toNIaAySpsKuRx38z?=
 =?us-ascii?Q?47DQowRb371YCO04B4n521WPoaCcsdRIdUzeckHR7GSpgBgbUnCJ/iwlYtw1?=
 =?us-ascii?Q?d2B4qYmAA5mqrVfWMep3C11nQOagHB5n8TMycgkIklFVESGf9csOlPS5bYSJ?=
 =?us-ascii?Q?Dg9EGaxpsuihkE+QG8/1DoD0lKn+vYD082nbgMVf64geIk4QOovH1iZKf7i0?=
 =?us-ascii?Q?vCAtBYRYSCQHHsw9vP4KQYhVolLSKoDDw7TExyLDapQp1hGD6TL4Fi6ylLtS?=
 =?us-ascii?Q?RBdRBAVgF/SFrW2dL+ObsSZ5A/64q7lp00y1Ol/bgPWH2LgYkr6wJgxixwZN?=
 =?us-ascii?Q?13zijuav4zdDeQ5wmC3uFUDzkZVwWYuePxfvudyqeWPN1xpPVuZydg2iYeHs?=
 =?us-ascii?Q?BTw4SagxTw9uXL1N+kOg7RQs17pl3PjBwusCz6N6iAtKIjF9yxKFLbUdhZrA?=
 =?us-ascii?Q?B24IQdCLjLZkoAMQEf3RbCeCUF9NHdaDf905LJQF7uNzDTE55lgvox8W5PTA?=
 =?us-ascii?Q?UghTgNcsDRPawIVZMQeMKxavfnDV5pGJjd16eYcuFmK0i7+25qVrRz3rtZR8?=
 =?us-ascii?Q?f53FZkHk8NeRa3TBML/ghnuKaXSHMmXwoNc9ChVcQKrmqmICSLPbpQ899aPm?=
 =?us-ascii?Q?InAmpGPmWCJut7MeQ3NKTPykdKa9xLC/2wVa1Hc5QlQaRFV0GAOz1i9qx1oc?=
 =?us-ascii?Q?Y7C3F6V5/mK3JJ4m1oE08nahoZx2fvPjY7Q3R8tbI1HM3VyPTarxSZQvSOLn?=
 =?us-ascii?Q?zQfjH2kyups9FL7xWO+YNxXy3oOyyTymSjv11M80E0zJOgN0KzL94wknZexW?=
 =?us-ascii?Q?dDmI1/NtidHcLTYu97/XGMPTQCZjpwLVZzkBJiBD?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a71c051b-76c1-4daf-30de-08dd134cb633
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2024 03:43:55.1596
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nDZyZdaiHTVMLnXH3ngBp1tvyLj9Wa+EvIofsudqnvd5lhUZ+lU3na5Rqj2538OfdMdZ+X+VfvMlWcjJtOC7+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4040

> -----Original Message-----
> From: Will Deacon <will@kernel.org>
> Sent: Monday, October 28, 2024 10:17 AM
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
> On Thu, Oct 24, 2024 at 02:10:55PM +0000, Besar Wicaksono wrote:
> > > > > > diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c
> > > > > b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> > > > > > index ea2d44adfa7c..d1cd9975e71a 100644
> > > > > > --- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
> > > > > > +++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> > > > > > @@ -112,6 +112,25 @@ static struct attribute
> *mcf_pmu_event_attrs[]
> > > =3D {
> > > > > >       NULL,
> > > > > >  };
> > > > > >
> > > > > > +static struct attribute *mcf_cnvlink_pmu_event_attrs[] =3D {
> > > > > > +     ARM_CSPMU_EVENT_ATTR(rd_bytes_cmem,                     0=
x0),
> > > > > > +     ARM_CSPMU_EVENT_ATTR(rd_bytes_gmem,                     0=
x1),
> > > > > > +     ARM_CSPMU_EVENT_ATTR(wr_bytes_cmem,                     0=
x2),
> > > > > > +     ARM_CSPMU_EVENT_ATTR(wr_bytes_gmem,                     0=
x3),
> > > > > > +     ARM_CSPMU_EVENT_ATTR(total_bytes_cmem,                  0=
x4),
> > > > > > +     ARM_CSPMU_EVENT_ATTR(total_bytes_gmem,                  0=
x5),
> > > > > > +     ARM_CSPMU_EVENT_ATTR(rd_req_cmem,                       0=
x6),
> > > > > > +     ARM_CSPMU_EVENT_ATTR(rd_req_gmem,                       0=
x7),
> > > > > > +     ARM_CSPMU_EVENT_ATTR(wr_req_cmem,                       0=
x8),
> > > > > > +     ARM_CSPMU_EVENT_ATTR(wr_req_gmem,                       0=
x9),
> > > > > > +     ARM_CSPMU_EVENT_ATTR(total_req_cmem,                    0=
xa),
> > > > > > +     ARM_CSPMU_EVENT_ATTR(total_req_gmem,                    0=
xb),
> > > > > > +     ARM_CSPMU_EVENT_ATTR(rd_cum_outs_cmem,                  0=
xc),
> > > > > > +     ARM_CSPMU_EVENT_ATTR(rd_cum_outs_gmem,                  0=
xd),
> > > > > > +     ARM_CSPMU_EVENT_ATTR(cycles,
> > > > > ARM_CSPMU_EVT_CYCLES_DEFAULT),
> > > > > > +     NULL,
> > > > > > +};
> > > > > > +
> > > > > >  static struct attribute *generic_pmu_event_attrs[] =3D {
> > > > > >       ARM_CSPMU_EVENT_ATTR(cycles,
> > > > > ARM_CSPMU_EVT_CYCLES_DEFAULT),
> > > > > >       NULL,
> > > > > > @@ -234,7 +253,7 @@ static const struct nv_cspmu_match
> > > > > nv_cspmu_match[] =3D {
> > > > > >         .filter_default_val =3D NV_CNVL_FILTER_ID_MASK,
> > > > > >         .name_pattern =3D "nvidia_cnvlink_pmu_%u",
> > > > > >         .name_fmt =3D NAME_FMT_SOCKET,
> > > > > > -       .event_attr =3D mcf_pmu_event_attrs,
> > > > > > +       .event_attr =3D mcf_cnvlink_pmu_event_attrs,
> > > > > >         .format_attr =3D cnvlink_pmu_format_attrs
> > > > > >       },
> > > > >
> > > > > Hmm. Isn't this a user-visible change? For example, will scripts =
driving
> > > > > 'perf' with the old event names continue to work after this patch=
?
> > > > >
> > > >
> > > > Yes this is user visible. I am expecting user script to be updated
> accordingly.
> > > > Would this be reasonable?
> > >
> > > I don't think so, no. We don't tend to require userspace changes as a
> > > result of upgrading the kernel.
> >
> > Are you referring to userspace change just on the perf tool side?
> > Cause this PMU doesn't have JSON scripts for alias/metric in the perf t=
ool
> yet.
>=20
> I'm not sure that matters, does it? If the mappings are exposed in sysfs,
> then the tool will pick them up.
>=20
> > Do you have suggestion of the proper approach?
>=20
> I'd say leave the event names like they are and if you want to add aliase=
s,
> do that in userspace.

Hi Will,

Could you please review the V2 patches in https://lore.kernel.org/linux-arm=
-kernel/20241031142118.1865965-1-bwicaksono@nvidia.com/T/#t?

Thanks,
Besar
