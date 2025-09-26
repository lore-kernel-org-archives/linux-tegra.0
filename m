Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012023.outbound.protection.outlook.com [52.101.53.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794802D542F;
	Fri, 26 Sep 2025 16:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758904533; cv=fail; b=b50eMHhtoLzHxb15dSlYKCs/B1Jp3rFfnbYmnz4wYvkFwauGnRJIaxQHRDQVyxHrmECvmtTkfWVL5pn+dCKn6Z/wFbjluGqlwQlFHy0lJxWm4tGfsSE1Fr04KaYEAviYZ5BVjyaCLnYpmFmHqln9T11MqME+Lt7yPvQ5PNWKqig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758904533; c=relaxed/simple;
	bh=kqEYxPLWNt78MXmy3ilVdLjUzCAJVoF+SFL2PBg7Ccs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LelrWDAdmvFuHyVsld6/2mW1TsfZ5V60aCwnSX7gorQYTrKiFj/cx6OzhuaFtfhdipB6K9ahyWCf9YeS57rGDIRKi1RLP5brjFqZQPDE7UUYg7jie9R5tyW0pDFfXkfPVNblf84hpa2JGuCHpq5caRAV6AZXR1nfGBEtoXSe8b4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=D3NWyVPl; arc=fail smtp.client-ip=52.101.53.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="D3NWyVPl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJoM8c6nxdcCzmAq576O/5+RU4Cqt4RGlXequW+QPEc9g3Znv8nrJTsI8e8egTp3Brn6gL3VBJjYlhZS2gb9DoscTVH2Zn19jB2cL9ycQiTuAgAYQfTH6OAskd7BBe19d689PodyXPpiPPmRCTx230od7wwKRWbE0MyLtHPQw6rn4XdezepflCplBLzkEAKyOFSVgxjXIldy8LZbi6EtkZVCMUpp+eOmsav68brZqqy26JBivYFbvEWynCEuaFZeRUS5wblW9C1rqb253lwIaI2uEfF6UNd36YzfbOoV3Y6y7Ky1FXi+lFRaWXPqEbzt37yBTJ7KSKYiNdTWbyaXNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ML4BHztNDGklZNqW+2j9xEMQB8Wg9hNG61Rm64ubzg4=;
 b=QzRoYndbIukn8L28QMFYgQDLYr5uLbPOhVgENId8+NKTFUET/fPJU/eGdC3PFL6/nuGMtSMOkeJilWi1hz051N3B1KIsaeorC4MmmqpBnVH87ip4WmJkHDd91vPC6GxkwIwlc6sj7y9QR05fRcdcH4vdD6F5T0IAj9mDaQSr3ROsdxRyUS8MGfE9h1iyyeaxrNMWC1eFAshLOn9jNgkmE1ZLX/VFeodfbh3/9OkLB4OG0dQ1IZ6lEeX3CpjDyuVk9mSBf+FvGcib8C9xLCK5hA8CSD4+mD4aph8VcTFVMQTtmpS1R8GpjlwkvTn8HkvRShj4JU+j6g1D8U+PweUoww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ML4BHztNDGklZNqW+2j9xEMQB8Wg9hNG61Rm64ubzg4=;
 b=D3NWyVPl/QcZDK053ny6pzdQBlpPOb0cSXxUCH9TJtThUJ74nLcGWtKbTHeHPng9QkVSB0AoO+yuDgftLopm+Kwro0COOP/qFwssLPkdELC/LSvaYVDGjHH7QLiZSttyQwMJ9qPQtzwJUrGNta65GrQSXJo+8dgdubsl+iY3CQWNjlecgEoqbdkd6UuNjE+q33bcrlGL1vO1gB1VaECEBsyxFlqsPitOvX2fImbFPa3MZ6FtRH7oiDdVGGhN70ir2QqkqJ2czRfKwW7fiBsQWPB7pXbkPftwN5iQCLa5N3R1U+E1bKctaf6p4SOgwXCyggMgWe1gNjx5Oi5jrdBH7A==
Received: from SJ0PR12MB5676.namprd12.prod.outlook.com (2603:10b6:a03:42e::8)
 by SJ1PR12MB6194.namprd12.prod.outlook.com (2603:10b6:a03:458::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 16:35:26 +0000
Received: from SJ0PR12MB5676.namprd12.prod.outlook.com
 ([fe80::abdb:7990:cc95:89ce]) by SJ0PR12MB5676.namprd12.prod.outlook.com
 ([fe80::abdb:7990:cc95:89ce%4]) with mapi id 15.20.9137.022; Fri, 26 Sep 2025
 16:35:25 +0000
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: Robin Murphy <robin.murphy@arm.com>, "will@kernel.org" <will@kernel.org>,
	"ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "suzuki.poulose@arm.com"
	<suzuki.poulose@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
	Thierry Reding <treding@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
	Vikram Sethi <vsethi@nvidia.com>, Rich Wiley <rwiley@nvidia.com>, Shanker
 Donthineni <sdonthineni@nvidia.com>
Subject: RE: [PATCH v2 5/5] perf/arm_cspmu: nvidia: Add pmevfiltr2 support
Thread-Topic: [PATCH v2 5/5] perf/arm_cspmu: nvidia: Add pmevfiltr2 support
Thread-Index: AQHcLB//WoupxwU/dECKu9IJoVgrvbSlSVcAgABiohA=
Date: Fri, 26 Sep 2025 16:35:25 +0000
Message-ID:
 <SJ0PR12MB56762F9D281C3667A5C60087A01EA@SJ0PR12MB5676.namprd12.prod.outlook.com>
References: <20250923001840.1586078-1-bwicaksono@nvidia.com>
 <20250923001840.1586078-6-bwicaksono@nvidia.com>
 <1ff12bce-1369-48e9-8807-3a7ecd8e1559@arm.com>
In-Reply-To: <1ff12bce-1369-48e9-8807-3a7ecd8e1559@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB5676:EE_|SJ1PR12MB6194:EE_
x-ms-office365-filtering-correlation-id: f7bca1cd-dd44-40c3-c02f-08ddfd1ab1f8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?qiM34hF/h8Es69f47Hncrn/Ud+8WYIrVzpTmQKSmFIiS3DkBoxKVl99Mbyri?=
 =?us-ascii?Q?7pdLAcXy2BD/Tx9kT9y/0kOQ7irIxhoiWJxH4cS+kyFTMmiF06U0iY+mVNAc?=
 =?us-ascii?Q?zy80kqTg4oMEtE+mKQRnTdBZLs3MJG5LvmLmMsmcwodQ0rRn6JRO+TTq7u/O?=
 =?us-ascii?Q?5RB5EH7LRI98NG7LQ9JtpOe+RJLA6BfKEsDyw5u5LQ/FJ+iuEmfU9HUuWevt?=
 =?us-ascii?Q?wTqw1Qk3MXOjUKEwyDGhX8z1wzJDvfRdUPzRbVc01sjy4qj5Q0CrzAOdMbOi?=
 =?us-ascii?Q?Uhdd+SmNFdhfkSgxLZ3lksQiBuGwf+0RBu0hiPfR15nsKina+sECAJj5Qkcn?=
 =?us-ascii?Q?2uAZmGg4j2rRfqmkfHdKnco+jAYFSktLBeFrnOhsPkLdEj5T5rdoJW3+33WQ?=
 =?us-ascii?Q?Q88WVy6XsleBLTqDkyVILOiTpZnL+EqwL19XkJmZb4tcahNFiMQH8E5mlHoN?=
 =?us-ascii?Q?SD4alOv0xYl+omIgDsvLj1T+so3OK4ncJGi0CK/U/CK0mXtQy2xwSYmziUY0?=
 =?us-ascii?Q?b++4frRkz1BVGfsJ+oA6mq0Ib2U19zRMMpF+rxB7cmUZ3DA/ouhQlxyh/LAK?=
 =?us-ascii?Q?trOoXEOxmQ09zKuWJvgAoBk69zEf1Bt5lWfNP95IAUFxSKbVcOWLjVEDXb9O?=
 =?us-ascii?Q?L41jzBpjaEIfGz0eLmDsopfA+oED1MO3ggmQq/9Lu6gLgB4P9NOjzb0PYWJ9?=
 =?us-ascii?Q?aMV85Gi7FnVaN/OWg5uZAqtDVIpe5e3xER5AYfca6mwu7Iz4n4QZFDyUsSPc?=
 =?us-ascii?Q?sM6fzsH9YPCZPnn0pEVfwCuglTGyvhOpeEWWEtiFvUSqqSYQPWgL7nqpVcNQ?=
 =?us-ascii?Q?KqAzA9RRdLvO1GvcC7S0P5EOGlcmPQWMbgdjI8KT0PNv3710eMj/igwaaroO?=
 =?us-ascii?Q?o4zySo+3H/9Uf+ZKJ6IXrySdpSSmcRvlhZs64Pme/gjfP3cSoYB3zwrVkeuS?=
 =?us-ascii?Q?qWASxsW9tQW2e0+q/FHbRGp1ZcWy+a12ilA1l4FzNZ6ge0tFZS4RlTgqrj7D?=
 =?us-ascii?Q?I1+VKgkjE3gdSR3WgWTqUCgX1rS9mjDxN9T0HIqo7CeuLmJvha22SOr8jApb?=
 =?us-ascii?Q?C0/d7TSfqs1lrwznI77QNbT2kF/ukO3/uJrzmCwEfT1eruXXxHhpi8ZwbJhK?=
 =?us-ascii?Q?eHGQn8s3a8jw3jUltOLBYS1amoVYixZOekr7VRphBi6qAUvc4o5hBXT2E4Gi?=
 =?us-ascii?Q?MuzX8OUfuKNcxU8Sk9sI2ppnZ+0JpkMCtjxf5cbY8YN6RMNlBGseIm9c7Thg?=
 =?us-ascii?Q?KkVn8jcZCJTyhipmO2dcWoBAymfS+fzw5nOYyzZcKuBrTL0PQW0iPqDSlqg1?=
 =?us-ascii?Q?d8l00wmOaHKtQ3eaKLX2d0E4NRAJ8isjwe/H0FH2CBiH72xPLIq7uA270Z/r?=
 =?us-ascii?Q?rop07xeh4oF4djtInuVVZ+PlvBesEKd0djFszq2kowpcBStNJPcUeGZLII9o?=
 =?us-ascii?Q?p4fGZraGuXVO1gKTWLUxPDULbi7dGMWi66OvGBJJzZUb1TJ9SOPUUWKL+gLB?=
 =?us-ascii?Q?r1H/7FA7o7cSeFKeY60EAC4QtcXgTPHdk7Rk?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB5676.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?hx+vo7EdYMO5ONXjNlK9D1kZsYo3t12jRLorq3LQvYi+cPS4CnUAfzhO7paf?=
 =?us-ascii?Q?NZ+V+ZnDNa3Xlbx5mY/NCULqFjx1C05T9E0go8aGAi2vWogWa0F3RC/ThW9r?=
 =?us-ascii?Q?uSUExfXdVhK427qoo5htyLQY790GJktbgnr5e1bx9BlYW9TPWmlPr3Qw8416?=
 =?us-ascii?Q?sQrPnK8oW+FjPIDt+RuxA0QDckjObeQDRGQSwsy4ouSaBZduDOatbV01g0dC?=
 =?us-ascii?Q?7VYR24MHwP4y/mUAxXqVOKlJj3GCpEBPTZD0VekXMRS6LnHjzb/A+AtveqCX?=
 =?us-ascii?Q?rTyRcDDMPa9+G5fhKyxJkZeGVO7e8+GXbblc8FYztP/dg0G9a6F7dXMPHoS3?=
 =?us-ascii?Q?1EUzRmVj5Y+iDcgut/JF1xYmts+nM0ISzr7G9M+Ttt8hAgQFBaCF9IunLHbr?=
 =?us-ascii?Q?RbFTYTYLAcelIuTiz9mCAHi7GcSyNKie0BwSknLIPEJ1OPXEMYOIOAyb5Sw8?=
 =?us-ascii?Q?VzMUaKkvF4RzWlYIyI177HSb1x37sNifcI3N75D5RWpfTGMvmsrqAg17NM2Z?=
 =?us-ascii?Q?4uezqFLO6Ng77XjaOgfIVMp0/9f4v56qhsJuUTphc4DHHi7oiyqWgePE/DLr?=
 =?us-ascii?Q?Y4XHzZRB9dsbbNUY0Lqw4HH8ikXIhTdaBAXkZUtjrDH/R1a0OGocH7WQ54sj?=
 =?us-ascii?Q?b8mG+A1QgF1WKcIieqK4iOX5Rf7jiYIUOxBpxcktBALaKtsSW0zKPbVpWI22?=
 =?us-ascii?Q?PGdAxaufPGn1Y2rVJiIjuMwywIy6AK5I30tjltATq4e46zNwNKsb+zxNfHh0?=
 =?us-ascii?Q?P2IBqUm4a/PskvZ0RGf31TBGfx9BXTp5h1hc/GSHw+eGCEYSWHH7H6g8Fcjj?=
 =?us-ascii?Q?rKvpUhbBgE60N/AKMYPD32TW+Ng9BjuEwK9tptVZKY6pBrJJfyo5J7veVRh1?=
 =?us-ascii?Q?6rBjg6A2Rw1xSHgh+M4mY5T8m7mY7NuTXdzIjiC/ps+Tnh2ODOBMYlIAukFL?=
 =?us-ascii?Q?KwWM2kmNcoyaM8q381fAr+lXiZ0ptzMDXULtdZOh6tUbGxOdMswdZs4mDld7?=
 =?us-ascii?Q?sOHA77sgOVv+gQsJJ1Krcg31xIE+H17LhLq400pCAoDG4bB1+IywvNDVjI/p?=
 =?us-ascii?Q?/01nlRdXgyvNvcq/iwwmhVTGGYZ0AsEAMa5mChvraEq8gOMSnuP0W0rCGbPG?=
 =?us-ascii?Q?CCCKBy1MXW+gLHJaTXf3jKIuSEAHeSMaGzrVzyYKkI+eNfS6u3sd6hfAz8iD?=
 =?us-ascii?Q?N3KHNzq0HuQaWZLnwEeojwa/ZFEXyac+pfZ6ja1g6cqHMT3gn+Ai+Ew8otVT?=
 =?us-ascii?Q?WL0gIAYoQsWs2J3AKtIp6aYEkwWfn+r9zHhiecM8ZzFM1LNNYGiaiJgW1lXb?=
 =?us-ascii?Q?rodPdOh6AhjsbNqIirUzPEq+wse3Nogk8dvIoLjqaMOAoZC0ugoXa1R6Tqbv?=
 =?us-ascii?Q?DLsV3Jf6ugwL0UvXphG/7aRt9plBc8b/BkQwiIwKaQMDTEo7qNDMGElYa6n/?=
 =?us-ascii?Q?GPcjFCUE9Retq0f39OaoJoR6dFmVvRM3P4rdid3WV+PKIiXCpR65sA+bxLHB?=
 =?us-ascii?Q?PH65TU7TUE4vzE0D7hM3jkB82fcQKH/TEKKeljkU1PcZi/khg/Rm6t+5tTRO?=
 =?us-ascii?Q?s0HbkUWMSHy3ZfeSuDBhETrcibBY3eASFmx7pu90?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f7bca1cd-dd44-40c3-c02f-08ddfd1ab1f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2025 16:35:25.2767
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n5Ednta/UN8uNqkmI/aRyHx1NbwTIJIaSoxAalcAx0pG8HSvg7sPU4Z672Kgj8/++dgLr9y/K2zWog+0URheRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6194



> -----Original Message-----
> From: Robin Murphy <robin.murphy@arm.com>
> Sent: Friday, September 26, 2025 5:32 AM
> To: Besar Wicaksono <bwicaksono@nvidia.com>; will@kernel.org;
> ilkka@os.amperecomputing.com
> Cc: linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; l=
inux-
> tegra@vger.kernel.org; suzuki.poulose@arm.com; mark.rutland@arm.com;
> Thierry Reding <treding@nvidia.com>; Jon Hunter <jonathanh@nvidia.com>;
> Vikram Sethi <vsethi@nvidia.com>; Rich Wiley <rwiley@nvidia.com>; Shanker
> Donthineni <sdonthineni@nvidia.com>
> Subject: Re: [PATCH v2 5/5] perf/arm_cspmu: nvidia: Add pmevfiltr2 suppor=
t
>=20
> External email: Use caution opening links or attachments
>=20
>=20
> On 2025-09-23 1:18 am, Besar Wicaksono wrote:
> > Support NVIDIA PMU that utilizes the optional event filter2 register.
> >
> > Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> > ---
> >   drivers/perf/arm_cspmu/nvidia_cspmu.c | 176 +++++++++++++++++++---
> ----
> >   1 file changed, 133 insertions(+), 43 deletions(-)
> >
> > diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c
> b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> > index ac91dc46501d..e06a06d3407b 100644
> > --- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
> > +++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> > @@ -40,10 +40,21 @@
> >
> >   struct nv_cspmu_ctx {
> >       const char *name;
> > -     u32 filter_mask;
> > -     u32 filter_default_val;
> > +
> >       struct attribute **event_attr;
> >       struct attribute **format_attr;
> > +
> > +     u32 filter_mask;
> > +     u32 filter_default_val;
> > +     u32 filter2_mask;
> > +     u32 filter2_default_val;
> > +
> > +     u32 (*get_filter)(const struct perf_event *event);
> > +     u32 (*get_filter2)(const struct perf_event *event);
>=20
> Callbacks for this seem like complete overkill - you already know
> whether a given implementation cares about each filter via
> .filter{,2}_mask being nonzero, so unless you intend to have wildly
> different event encodings across implementations, a simple conditional
> extension of the existing nv_cspmu_event_filter() logic should be all
> you need.
>=20

Indeed, this is the reason. All the new PMUs we are planning to support
have unique requirements on the filter configuration.

Regards,
Besar


