Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011022.outbound.protection.outlook.com [40.93.194.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24EC1A5B90;
	Thu,  5 Mar 2026 22:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772750043; cv=fail; b=PCK+o0LCdn2B9ppc1S0Soz41+xQt2Q6JdkG8L+eOKtoSQgJEOb+DPd2O7INIZE6T/Sw/dNWlptjevbnKqytgZzxuWDHlFBYArIeDNO5FCKh9Y9IM8Pem29zuAjv6mWcxyk7mqyu84E7Uk/6c+jDK+hSQif5pozJukGQgqHmq7eI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772750043; c=relaxed/simple;
	bh=7wHYd5Sbjz4fvQQjjT7etij/bu2yyjUWRoAmoqa3OCw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fwxV9FJFyKc6NiqgnfAqZCnm2VgadRf+EgzjSnWzCk/w3PUP8xdnyCdVjzChPW1gy17D5VPc8jR34v9/ubkIkQ4SEBtRQpNaQd4NuKqTW7mgIc4diamb7JIsA3U8vz1AV8cTjc3FAXph5xnd3OdPYBPD9FcpJgEVv/3tpsrMuW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Sjcvc/Ot; arc=fail smtp.client-ip=40.93.194.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Sjcvc/Ot"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fApkQip5tgPJmtgZnrrqHKdq9t4JjWnd3+Z3tjkFiUDxr9FpvctLV1C0CMtoTi1Ffif/9liNNWUwPHaN+wcag/rRhTkof1+Ul/mxLkgPBz/0HrXBBxeOSTe0Oc9KnLHgMMnfKCZpjCqj8CKb+XU+OjHccXZ27uOX9K0QAuK4DcrEg1ndw5qlD6ZvYyZiAgrrAEiVUCA26KYuE/qsvw2oC/S58QoQGtD4OR1ajoDwnA3MBGxxOv++kpb3L4/GXN+1mCFf2S8s/kGikRli1lLxcq2Yjnh8qBPTq9H7gQ9UNS1KSNS0WCtV4UolR2rjA31s4EcnXquA776zc5lv7ur/AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7wHYd5Sbjz4fvQQjjT7etij/bu2yyjUWRoAmoqa3OCw=;
 b=xyzAUFWCVtYakKIcAMw2VC0zA2+aHm2zb0MupZi8CKdH0Wyxqo0mIvygXCrRdJcXFFpQ/uWU0EbxW1w56dqcsx1YDR+uIUoYdNlAz7jpzjYnincNBOX5rtWSfdA38PzZw9QmW3ITRiPmoRCt44y+Q0c4XTAFnIRMRWO1118wBGep/ccRJvud9NOGHEGSFIrAcErkVxiJkpdb5yeVdhieVvoM397LBf7mfkfpPdy6CjpOZqR8EOg0uX+4aQcjUDNFQKBFNqaGH9fYfgmfA7a7xTG470iTgwD1ADYzXjolw0YxmV8f1tYnphDX5QtIFrHyaQfhOd0w8WWNjsB+/FuGNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wHYd5Sbjz4fvQQjjT7etij/bu2yyjUWRoAmoqa3OCw=;
 b=Sjcvc/OtJXRXXwTEGuBkoXOp6M4vnMkibv8unhRTBNtgdkBNaS7qhfLdvmNbYGhkqm0Q9n6MRKXd3T1F93tsrzFVKv+RTnXtj2RMr+soP2giJyDm0zfDhc1nTk+CEfli3f1dvE+hKxHTUMo3wC+nuflJc43USs5ZtT25jIFtetzAC7IsVmW1OIxamRV1BJmkuDCE8Mzsfhn9tNNkPQtRgAo7Y9y2ubTbTaabadu2063vdRlnMqMvfpnNy7oDa6TKp7gadtyvss3SJOo6zYkXHuIWV7EpOK6fOSLQQA+YD0Pevddf3Y8Yjfiw9BSBdlvcA4k0bGNSe+eRP//KoJy11w==
Received: from SJ0PR12MB5676.namprd12.prod.outlook.com (2603:10b6:a03:42e::8)
 by SN7PR12MB7370.namprd12.prod.outlook.com (2603:10b6:806:299::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 22:33:54 +0000
Received: from SJ0PR12MB5676.namprd12.prod.outlook.com
 ([fe80::a3fc:754b:9159:b13c]) by SJ0PR12MB5676.namprd12.prod.outlook.com
 ([fe80::a3fc:754b:9159:b13c%4]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 22:33:54 +0000
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
CC: "will@kernel.org" <will@kernel.org>, "suzuki.poulose@arm.com"
	<suzuki.poulose@arm.com>, "robin.murphy@arm.com" <robin.murphy@arm.com>,
	"ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
	Thierry Reding <treding@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
	Vikram Sethi <vsethi@nvidia.com>, Rich Wiley <rwiley@nvidia.com>, Shanker
 Donthineni <sdonthineni@nvidia.com>, Sean Kelley <skelley@nvidia.com>, Yifei
 Wan <ywan@nvidia.com>, Matt Ochs <mochs@nvidia.com>, Nirmoy Das
	<nirmoyd@nvidia.com>
Subject: RE: [PATCH v2 2/8] perf/arm_cspmu: nvidia: Add Tegra410 UCF PMU
Thread-Topic: [PATCH v2 2/8] perf/arm_cspmu: nvidia: Add Tegra410 UCF PMU
Thread-Index: AQHcoOcaCMaPuF0S1UKkPigER3Git7WJxowAgBbXkKA=
Date: Thu, 5 Mar 2026 22:33:54 +0000
Message-ID:
 <SJ0PR12MB5676B2F947DF0E5AC61B9409A07DA@SJ0PR12MB5676.namprd12.prod.outlook.com>
References: <20260218145809.1622856-1-bwicaksono@nvidia.com>
	<20260218145809.1622856-3-bwicaksono@nvidia.com>
 <20260219094318.0000283a@huawei.com>
In-Reply-To: <20260219094318.0000283a@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB5676:EE_|SN7PR12MB7370:EE_
x-ms-office365-filtering-correlation-id: e74d534f-f088-4b93-33b2-08de7b0748ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 6NQcrvWYRzdHjsOFLRylGibI6cL3bRxX3ei1pqq0eY6exNZRXvp0VGl5M0LizsjL/Uhson+LR6MLpCQBeKmo/WrzajVMLrnzl7EXPO7IG2/Ud/x5deSu+WV9twzX6ITHi5qEG8MWU6b4XYTpXBs1EH2XWymjbt16dZXX16cjxmyUNmJmkzGkxtv213s6X+xGhN4IMopORR1rbVCML07u921B+BhFhx886Qef//MZ6wDSpI/woQo36DS+kikZNytZI4ftnh8EdFdBY955twHD8nfBaKMd/CWDl1BJvh+hCahA3J15R3ozj1SQjuRubVtVzjYLbnVlR9K11C/2Sp4P+t7rrOvD+Xuq340ceVM+Udvrcql1l80kWRLi9y5SmH+2gS9Y8DEXuhVsYb/VD8S8i4iodBALBi1IXNSGyzgDNkMom8jb1NTzA8CXXJyRp3w3DoayqFaMbbkK8cFL7uvUc1grPrIkMaYq6RuAi3lQ1gYGFTrN+ZjHFisUAzy3fvonzsqqpIsAhzJaz8GMaidtQj6idkn9yQjZbSbLZ+laycPzAR0Kz2DzMA7f6zk8mke9J0OfXhkmkNl6Q6dZq4wFYI0rSzHr7nXaDcBj/FnrAvNuNbc/fVjTtNcuQJRHM5/MqaOjC8BOSocLD2t19NDe+fvExRT1mX7fzVBuuoeB8MdTK4lkZ9axqwDi/dx6EdGuHgjRiq9utTQluYzUbHRVDUDh6uWgMrfIRQl4kY5OtiBVWxnhLIAZxmLamSaXjRdJU/V00VlvKSBQUQul4MBF0Lldu78ZVWxH9Ce3LEPZoJI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB5676.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?6H+eXVuqbaPI9CwSbKK5C3b1WTTEXyLBnML3LyUdSQx3Yv/AgUxN2hXzKgFg?=
 =?us-ascii?Q?W6kzwUth6fqwkmjG/oIAaMefZ0rXWeH8mg1C2Y+3X411wbPzwakyDch3JUhk?=
 =?us-ascii?Q?R4ZuRo6gp7sgvFHSkTu15zQn/LqtsbEoKKSV/TGZsuGxOAzmMJIFTKDmIHzl?=
 =?us-ascii?Q?ggd4siP2RmzvFWMOs/qh7hckW4MH6Exb/RxGj9q+f+Nowf5/6I4cYQ+lGbYe?=
 =?us-ascii?Q?AFNdd/gJtHHy/fMEImWKFhWw+xWvVGUzD0DKmHEWrQL5sm8U2aSDjenZCowZ?=
 =?us-ascii?Q?jZtJmb6Nju9OGQ7I6tohhkK5YGRsxPkfsjW/Hp82vKezAexP5NgAXdA3Js1M?=
 =?us-ascii?Q?b0pI8tg9l9wFeHyE9N29pDKruCgsZ8VJnfzTd2yKSAy7fgumYjuhkuqUigFM?=
 =?us-ascii?Q?+D+mvtTmBB6u7eJWGJkh8Qu8IPcsriiFi5VifM+MDLtpfqPqRWlqEBBHBmXR?=
 =?us-ascii?Q?+wosoLWau+u4Q0fDco88GEV5mbikb75NFvtaRRuqinRW2qIkLR3iVdW0CQAx?=
 =?us-ascii?Q?0GbXuMWwf5TKmhzHls4/7yTFa3/UEzAWUaNRJ7/Vwb/57fbzcngzPTIzWznP?=
 =?us-ascii?Q?L+iKm3Tb1ZERwCFE9tDyztD1VOcu0Lg+JZnVRNjOp0DPomMWFKyReQREsk9x?=
 =?us-ascii?Q?7YnuVHMfn46bFzDi7gYMtYyjKm6PNDRuEc2qoZiPJryFQo+CNOkW+RVYy9Sh?=
 =?us-ascii?Q?eUwZtmTzYCsOjkN9m+Ml7DM8OwfCrHBD/I46Mea17+Ekq0/fQNf5K9D4R6Kq?=
 =?us-ascii?Q?L695VCXfsBtnY6GY4cJpquJArhWqa1QIJHjKA9p7oUZ3uHBJw3xyk5HrDIla?=
 =?us-ascii?Q?bh/CB9Qn0U09AfH7d6FMjU8VnvYZJLmT5BgmTJp7rdL0yGSO1abFdkjliiNx?=
 =?us-ascii?Q?uXhl9lpVHgKRlWlpXJac6IxdAZNxy+weWScK76Ikv6+9aVRAr/27iCGRrPlM?=
 =?us-ascii?Q?GBzu+0C8EcItOiIY+ZBiyzgcOJxDCB0Z2wooQd8+Y+LwJxbmU97Hbaee06UU?=
 =?us-ascii?Q?J5ZmyGCZm7oTOQTy8gS4nu8HWCRsVknTvRma2BaTilOCGcvM8c57RsJY1f2o?=
 =?us-ascii?Q?lKoc8pIXPU+u5IGDHz0xhYwZseyL0nsj4W0YBdSnqgTe12oNgKBEnYpOX6xJ?=
 =?us-ascii?Q?88e09fS2kV5m/tS1P9p5pcGAm6KmY3j8FkhqSDNJYCd/+znhNHkDpzizwbvl?=
 =?us-ascii?Q?U06209GXOjcQBuqpnn9vNYV5CYVpbYm5zy+CGZ6XzvDWCYfUvWsHX9Qeg/3H?=
 =?us-ascii?Q?Zm3ZRmg+2miH6dhMXG+IZjhkY2j1dQwAgqB+I6PzOWrkr9mjLKFe7cKP4c1A?=
 =?us-ascii?Q?sIKiqW+yEk7vjgnWVyepPFsOVmYiQKXxm+ejmkkFIMFL1o5nUtFoyT7ved06?=
 =?us-ascii?Q?oWStzPjoIjnVnXQuz04wa9OtaacK1nWlriCsyxxBJ9RqoXbfDtBmKA9uMFC2?=
 =?us-ascii?Q?NEtIjud2B81Au9g5tmLL34jtFiH8me99Yx+ajsz6FmH83am6z5dIDHIXsrk2?=
 =?us-ascii?Q?2z6E7cu7r4350tF9yGbaCltGLz7bX1m8/XInKTwbqFPi80AtmuCgKMr/xry9?=
 =?us-ascii?Q?q1+qPmRZDia4vdNBN7G0ayJROO7avHuIUgVRa+iQWu5C+3/MDhYlMxJ9CZrg?=
 =?us-ascii?Q?zQpK96L2vyYRXw+m6e5JDptTLKYFc7Na4tQ8PhNF3VA8mlmzDdNWIGrJRgSx?=
 =?us-ascii?Q?3TsFcChL+hKXScgbe6BMwhGD0cfMAfyjTTc3IVNrJzU7hIBfou7sH9p7JBkC?=
 =?us-ascii?Q?JOWL98P5CQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e74d534f-f088-4b93-33b2-08de7b0748ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2026 22:33:54.7071
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3I5kg1mN0pGPUUG2vV03JHEPeP1gXHtIj+WMWm1a61b0Jtxb0AhLC/tX6fCEEbgaHK5iYQqpRlW/BQc5h/oy2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7370



> -----Original Message-----
> From: Jonathan Cameron <jonathan.cameron@huawei.com>
> Sent: Thursday, February 19, 2026 3:43 AM
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
> Subject: Re: [PATCH v2 2/8] perf/arm_cspmu: nvidia: Add Tegra410 UCF PMU
>=20
> External email: Use caution opening links or attachments
>=20
>=20
> On Wed, 18 Feb 2026 14:58:03 +0000
> Besar Wicaksono <bwicaksono@nvidia.com> wrote:
>=20
> > The Unified Coherence Fabric (UCF) contains last level cache
> > and cache coherent interconnect in Tegra410 SOC. The PMU in
> > this device can be used to capture events related to access
> > to the last level cache and memory from different sources.
> >
> > Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
> > Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> Trivial stuff inline...
>=20
>

Thanks for the feedback Jonathan. I will fix them on V3.

Regards,
Besar
