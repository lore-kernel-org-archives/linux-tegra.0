Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011027.outbound.protection.outlook.com [52.101.57.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D093235DA42;
	Thu,  5 Mar 2026 22:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772750393; cv=fail; b=YBqEBiYMFU1ey+dufvdlRHdcTcKSLmhmH7SNfat8H3o0Fbps79ui0vCodoXweIT5S5Vu+ThJawYLdo48ZQlJS3F/vA7SCP1bbu1zKEy0CchJelsKxDmZhhySGP13Bugnsu/JKe/xihqHvYjqz2/t/ycHWI8Hs/KBJCXfN76Fv0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772750393; c=relaxed/simple;
	bh=Eql1iGVYQXCExhTjRuuOUMGXmTetSzJVPbMHoBddTzo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Cne9+jkPihz8Kufz8XNmdOwzyZrVOu9K+nK+YIgi8ibALlZqE4nfZ0Vv1+mWQ4yChM7TP9fyeSKjpT7bQEl+KOedOEYrEFQ7H8EUMwKA0ftJKyWARi47hHygvmxqlpzZJ2XANNoN8O43tHMuyUKBGHNst2/y0z4/I3QiDLQ6Ppg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qu/72kpk; arc=fail smtp.client-ip=52.101.57.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qu/72kpk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MluAU5UD+bdz1BKQixzC2L4oB+1/E2OqkVRm68HOtOZGZPOexZY2YkWo8jKrCQMWQzDt/Mqv3WJl+pUKKpvvY1d+FEzDx21DKCQgHkGJSN8SMlbWJ+PyNWMxO5YbhgLIB/AFOUwYF6IYg8ZzBRpFMfnB6DAtw+cZfq2hR8n1U0ZhWR2qXJQvDSKc9H4PlFHU0kxI8p/dQb2EG4xV6kVVmclmyAMct+k/EbJc/rk4naJRtcJdie1/Z3HH66B0xykiike8WSLWlAvePN2a22Wsw9cvkbkpK8X+pcAHcAkTt8387NmWbjfrZ9x+pxYE/zNgCmkYbhfzimtH6QhBL3kV6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3oktdE/fId99QohICnfrRf2BXAc8Ew0Lq1sdStfpisY=;
 b=G0j/cUnByhdyl05kiWT8set6DCe+dFX3FTqxUeRVjlMIwvGPY2AbtNWKCtXV26TN5K97vn0pYGfJqlVB/t+tORWdSgkTn3sGlgr4DpHQpxeia+hhvVRc5V8AVJQXg6h7QvmwZKnlrUMdeYkOBsNMuKBE4ZRxH9xKwdwtwEK4JyinVMTZ9Qm8rg+P9V007SygjVMBkV9LEYge2m5Rj3tsr8a9LADvlYkzVq/dZwTr1mOz4zvQJzEY0Y6Xs08+pDydkMoO/Ybeva7yBoJ5qyYoeGgjVbD9jlFJfdV2ZyaPG/7P8xSxFETJDizlj1bJV6aCaXht6o8VbOd2qNZlKRVq2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3oktdE/fId99QohICnfrRf2BXAc8Ew0Lq1sdStfpisY=;
 b=qu/72kpkrgwMQdo6a18XBn9CFQTZGAGjcOPwAIo7g2LBicnpC+igq5Tf2fPuXozMkhzR3WLVENb0QTV7zAHdkhGnxODuVaman4cUS5DiqDTsSqn5wwT+o1HuhEExq7xjlz+3oNXlknVlZf0rlwBepUphSESNsFNjA3rmkbRubCGUyisUgW2zZJ7YfHwCemvxUlMbpD2NlIXAAI5Gf7N00rdM/WQLLn7kN+cJpebHUIMgayVDvJ45tDDE2qBTxKPPaDGYstThxFfIZZ4DR09WJUg1z5sQMKRNn6lAfpmkwhe6S92ruCQlJZKx9IitX6L36rWJZKD+rneLG33HbM2TAg==
Received: from SJ0PR12MB5676.namprd12.prod.outlook.com (2603:10b6:a03:42e::8)
 by IA1PR12MB8237.namprd12.prod.outlook.com (2603:10b6:208:3f3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 22:39:47 +0000
Received: from SJ0PR12MB5676.namprd12.prod.outlook.com
 ([fe80::a3fc:754b:9159:b13c]) by SJ0PR12MB5676.namprd12.prod.outlook.com
 ([fe80::a3fc:754b:9159:b13c%4]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 22:39:47 +0000
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
Subject: RE: [PATCH v2 3/8] perf/arm_cspmu: Add arm_cspmu_acpi_dev_get
Thread-Topic: [PATCH v2 3/8] perf/arm_cspmu: Add arm_cspmu_acpi_dev_get
Thread-Index: AQHcoOcgPIIggSqhkUqIoFyg95UGQrWJxbmAgBbZ04A=
Date: Thu, 5 Mar 2026 22:39:47 +0000
Message-ID:
 <SJ0PR12MB567604BF40BBA64EDFFE7B3EA07DA@SJ0PR12MB5676.namprd12.prod.outlook.com>
References: <20260218145809.1622856-1-bwicaksono@nvidia.com>
	<20260218145809.1622856-4-bwicaksono@nvidia.com>
 <20260219094021.0000465d@huawei.com>
In-Reply-To: <20260219094021.0000465d@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB5676:EE_|IA1PR12MB8237:EE_
x-ms-office365-filtering-correlation-id: 0f132985-4fc1-4f2e-fae6-08de7b081ac7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 +0WqTdNBzk3Y97XmujlYJrfCGAp+aE6wFPTMaZatUDkX6mdth7bMbxzljUDlDiVKYvbE81ykB7jWEfLi8+34hZbxo3kF+f+BEDV3mBz/ktbI5lK7uo2WxDUo0qf+nyqqOC17zAKOhPoJZWJxrrZb5SfAZk5Bqci04QNFRP8EUezvU9qJncXZrTjmUhKw+kXTn5o15kOM7GNvhLc1KxSmeJ0Q2UYFM6adPYa4YleALJt28/WcRf1ZL0t31NXB/fGCCT+eY41eSVvF8jsQy0dAKYTdpF+zIRjogzaTSWemJ6+ghwDjT3jagZBiHzWJGWf4kSidNCabEtwYihnKmVY170/DKyvtGfhQdAu21g1H6aJ5bn5hLpDh6MzPnTNRosMMbnbzNzixRt0ytbjh/xn8cMgLMJzXBB0QMzGTGuZkR/8YT+cctRkHpFiEKYzX2fkBJhfjDmSnYfbO4/MAynb1YtZGiVjM/I+jY/EkRSCdoHB+mSgtLaSVg4foOzuxBjDj+tFFFWL3FI6A9lsxucgRevMv4E34rhzwHrgJRk2ddpGv94o+pUBpuM9N32ZRjG5QEL9oJU8PEwUvgqxw8jxCOY6dbxqTEIYcvSzY7erwCnvqpYx1fv7ow6LTJmsI5r4ixFQMHLGkpCdh8FDwKSLWlBxf4XQv/cu2wMnetBxai6F7VTVmQirzVj1ZU3Lv5Op3+2UyEIdYRblu7g+gdDh4cWnnfiqH3i86Sn2m26/ScZel/bAJ5NcE0YvcwQRtdt/hf1A4qsM1vfJfEz7hsnXelWFfq7J3PNOwoI2QpAmcgFg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB5676.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?GGcs+AV9dgoEEJQNS3Yh8zQ6ekD4l8zYyqe9+ch7rkrX6mk12uwmH+Vvo1rc?=
 =?us-ascii?Q?Hy6RhweyrL78HWxVtjtltGEr6HBO5x+MHX9eTK9DVH50P+jffD536BiyXdvS?=
 =?us-ascii?Q?pwo/QYAg8D2hiVjhdv/45D+XvRzxu9BnbUpikjNRcEZ5XzrhNuDsrxGlIXNd?=
 =?us-ascii?Q?KZu/WfYRWkLNUzdn+JLkSpnbaU8nDqFdJP2yNnw7z29WN2ykG92w3QduaM5T?=
 =?us-ascii?Q?KSJ+ji61YC+2MFEM7y+jAn6rPta13sRs1Amy9rI0kGRDvXicuwvZ8eLhavU6?=
 =?us-ascii?Q?znNohM1MVRZeYRkeHUBsSKQwX+iEEEw/w9xSX4vfG4lf8EaTX331WWbcVu0w?=
 =?us-ascii?Q?SuddCoaZzbOiLhyiCkLzmUSewmhSdC7+36tbwg+XBOMWTlEUUF+cp5U09Ia2?=
 =?us-ascii?Q?wOwp+3jRQbCQEYSkqfONqx5pImSHek5mPZagtx05beGxrIjdq8gdWWAv5Ic5?=
 =?us-ascii?Q?M6laqXHOy419Pj9p/OwDTWIpyT0z3n33TUOrIAMMBiK93+XGkK1hmXUbM/U5?=
 =?us-ascii?Q?kf4NUpt0NBhQEF/gJ4nVNhmH4ZATczwHFkSlphbwaaXa0XoPTN83S/zbdquO?=
 =?us-ascii?Q?4SdJhIsmnxJNOlXCtso/FTAXr5fZrKkwyC352fxymu9rPRSv9zTjxBu91XsT?=
 =?us-ascii?Q?KxrGZPvOUU68Lc8qpDetwbuH9urhxsJB5Jw0OmXZimGwLTH8NmqueXGFrRQJ?=
 =?us-ascii?Q?Z5yuLGSg0PYODZDnPovpYOdGebVkYYZIfXzMrBxEiVD+tYavzEzov+vXvblA?=
 =?us-ascii?Q?q6Bx8rsZyNLRnwgY8JvTwBneBcxy65Zm8rKjExWfdTfJ5JKgo3QVZ/Xs9jzx?=
 =?us-ascii?Q?YBvEnx5TLrJpExlp+Yb6RthXX7aMQdTO6mbEugL1MxqiGifdCzp5oMHafX3a?=
 =?us-ascii?Q?/u66N4NoRnnwnGucuM1703u1Xk6hKLNKxnPDQJHxxqYFdHXbD38Zbr4Oh7Du?=
 =?us-ascii?Q?U5r758IFXOFpgtXrHpAMyseNs0oWGRx/VmY4b9dhd0G33hA5jxT0AULWVAa9?=
 =?us-ascii?Q?qiXgbEZRDfUxlBmHUfasjtvHLIhCwMk61CnbJvCXDv6U3HnW6pZaMW6xZXzI?=
 =?us-ascii?Q?D5Ytx4Lf27YsvOLChYwtV6kKlzMdA3bQz4UJEm+D6hUMG2jM5R6J1jgoY7c4?=
 =?us-ascii?Q?D9TCaiFbosvL0wQ7uPQhWBkD031GkjLjSS/NaeMl2FYPOO4jBPiI6iOBsVnL?=
 =?us-ascii?Q?8luY9B8trwJ7+r6F1iaAQ/990o7CeFWm9goYFi6SgiJFmUKxxxQd9Tqh3rXV?=
 =?us-ascii?Q?iV8cUPVjGwKaGKaq1dw217EqtbAg69OS4Y9RLIz1utGd1DxBuJQkfTRo0XC6?=
 =?us-ascii?Q?KOI43U1lmPiBLcmGCTgKf+2D73h7O0C5GMR+LUOfrrVQyTZCglIjY98la3JI?=
 =?us-ascii?Q?B74tVCkr2/CNrBhXo0b/KUAw050nRxuraSvMn7IUhpQonhRdvMbJHD7EsaAX?=
 =?us-ascii?Q?Oezj5i3Rt5wV+TGBA3aBgI31Eb1OcrCdGZqMu06M/iCIl64aN04QZKfU6drx?=
 =?us-ascii?Q?6+FnfiDTwUcxmxlISA6TSKZIVz4vWVSneEmWjjdWNuYHuVO8rT4PEYCkfEyU?=
 =?us-ascii?Q?RAjbXhJQDEKcOmN8rPa3DxTUe01dCISROSDt1xQ6CsrBHZqyERwTG/uy09GK?=
 =?us-ascii?Q?NLXwGO1c9ZoLzSlbGbTYjgAJhdgh42qmq+o1fJCd5FbXF4WqF41e1TRbKQbS?=
 =?us-ascii?Q?QA0hUNFOLUv33fFjVUnRo3ewokqIYN/IcFlZY1LVXUlOThWOxUG7P0FOynS2?=
 =?us-ascii?Q?1xT2Ck/fAw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f132985-4fc1-4f2e-fae6-08de7b081ac7
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2026 22:39:47.1994
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G0GZXy2mGF716iDfm3Ws35wrBxxU6oQ0sH9w+Hvrsk53CADOCqW0qao2ZH9T5HcEUC+1+PwGXndDMO3gQ3rHNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8237



> -----Original Message-----
> From: Jonathan Cameron <jonathan.cameron@huawei.com>
> Sent: Thursday, February 19, 2026 3:40 AM
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
> Subject: Re: [PATCH v2 3/8] perf/arm_cspmu: Add arm_cspmu_acpi_dev_get
>=20
> External email: Use caution opening links or attachments
>=20
>=20
> On Wed, 18 Feb 2026 14:58:04 +0000
> Besar Wicaksono <bwicaksono@nvidia.com> wrote:
>=20
> > Add interface to get ACPI device associated with the
> > PMU. This ACPI device may contain additional properties
> > not covered by the standard properties.
> >
> > Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
> > Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> Hi Besar,
>=20
> A drive by review as I was curious.
>=20
> A few comments inline.
> > ---
> >  drivers/perf/arm_cspmu/arm_cspmu.c | 22 +++++++++++++++++++++-
> >  drivers/perf/arm_cspmu/arm_cspmu.h | 17 ++++++++++++++++-
> >  2 files changed, 37 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c
> b/drivers/perf/arm_cspmu/arm_cspmu.c
> > index 34430b68f602..ab2479c048bb 100644
> > --- a/drivers/perf/arm_cspmu/arm_cspmu.c
> > +++ b/drivers/perf/arm_cspmu/arm_cspmu.c
> > @@ -16,7 +16,7 @@
> >   * The user should refer to the vendor technical documentation to get =
details
> >   * about the supported events.
> >   *
> > - * Copyright (c) 2022-2023, NVIDIA CORPORATION & AFFILIATES. All right=
s
> reserved.
> > + * Copyright (c) 2022-2026, NVIDIA CORPORATION & AFFILIATES. All right=
s
> reserved.
> >   *
> >   */
> >
> > @@ -1132,6 +1132,26 @@ static int arm_cspmu_acpi_get_cpus(struct
> arm_cspmu *cspmu)
> >
> >       return 0;
> >  }
> > +
> > +struct acpi_device *arm_cspmu_acpi_dev_get(const struct arm_cspmu
> *cspmu)
> > +{
> > +     char hid[16];
> > +     char uid[16];
>=20
> Might as well do
>         char hid[16] =3D { };
>         char uid[16] =3D { };
>=20

Sure, will do on V3.

> and drop the memsets below.
>=20
> > +     const struct acpi_apmt_node *apmt_node;
> > +
> > +     apmt_node =3D arm_cspmu_apmt_node(cspmu->dev);
> > +     if (!apmt_node || apmt_node->type !=3D ACPI_APMT_NODE_TYPE_ACPI)
> > +             return NULL;
> > +
> > +     memset(hid, 0, sizeof(hid));
> > +     memset(uid, 0, sizeof(uid));
> > +
> > +     memcpy(hid, &apmt_node->inst_primary, sizeof(apmt_node-
> >inst_primary));
> > +     snprintf(uid, sizeof(uid), "%u", apmt_node->inst_secondary);
> > +
> > +     return acpi_dev_get_first_match_dev(hid, uid, -1);
> > +}
> > +EXPORT_SYMBOL_GPL(arm_cspmu_acpi_dev_get);
> >  #else
> >  static int arm_cspmu_acpi_get_cpus(struct arm_cspmu *cspmu)
> >  {
> > diff --git a/drivers/perf/arm_cspmu/arm_cspmu.h
> b/drivers/perf/arm_cspmu/arm_cspmu.h
> > index cd65a58dbd88..320096673200 100644
> > --- a/drivers/perf/arm_cspmu/arm_cspmu.h
> > +++ b/drivers/perf/arm_cspmu/arm_cspmu.h
> > @@ -1,13 +1,14 @@
> >  /* SPDX-License-Identifier: GPL-2.0
> >   *
> >   * ARM CoreSight Architecture PMU driver.
> > - * Copyright (c) 2022-2023, NVIDIA CORPORATION & AFFILIATES. All right=
s
> reserved.
> > + * Copyright (c) 2022-2026, NVIDIA CORPORATION & AFFILIATES. All right=
s
> reserved.
> >   *
> >   */
> >
> >  #ifndef __ARM_CSPMU_H__
> >  #define __ARM_CSPMU_H__
> >
> > +#include <linux/acpi.h>
> >  #include <linux/bitfield.h>
> >  #include <linux/cpumask.h>
> >  #include <linux/device.h>
> > @@ -255,4 +256,18 @@ int arm_cspmu_impl_register(const struct
> arm_cspmu_impl_match *impl_match);
> >  /* Unregister vendor backend. */
> >  void arm_cspmu_impl_unregister(const struct arm_cspmu_impl_match
> *impl_match);
> >
> > +#if defined(CONFIG_ACPI)

Thanks for spotting. Will fix it on V3.

Regards,
Besar

> This isn't the same gate as used for whether the function is built. I thi=
nk that's
> #if defined(CONFIG_ACPI) && defined(CONFIG_ARM64)
>=20
> Whilst it might work to have them different today I think this is a littl=
e more
> fragile than would be ideal.
>=20
> The ARM64 bit seems to be there to allow COMPILE_TEST for
> ARM_CORESIGHT_PMU_ARCH_SYSTEM_PMU  and to me that smells like a
> stub or Kconfig
> dependency missing.
>=20
> > +/**
> > + * Get ACPI device associated with the PMU.
> > + * The caller is responsible for calling acpi_dev_put() on the returne=
d device.
> > + */
> > +struct acpi_device *arm_cspmu_acpi_dev_get(const struct arm_cspmu
> *cspmu);
> > +#else
> > +static inline struct acpi_device *
> > +arm_cspmu_acpi_dev_get(const struct arm_cspmu *cspmu)
> > +{
> > +     return NULL;
> > +}
> > +#endif
> > +
> >  #endif /* __ARM_CSPMU_H__ */

