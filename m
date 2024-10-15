Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A584B1D514C;
	Tue, 15 Oct 2024 17:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729012872; cv=fail; b=e5Zz2HhhSS8YtVjouNFeOVkgE4MTZ31phbHHAucPmbWObb55cBbcml7StTVwXzx0hH6ICt4IOjewNFWp4WvU0InIpTtAqwYF1AhvZJREoLMh28XM7HSM+50yzcDi4eOgG744XShxG+GS3m8f7bJ2ZTDOinfsUCfbFhpUMxrQ0Eg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729012872; c=relaxed/simple;
	bh=x0m42fOOd2LAcjlcqfEsH3xuvzMzQJ5cmiTVsvTSkMg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ld7lEJqn8DaLRyOKRnMHbqiqM8vQfrDl4ZTBaRu9T2joRwlfyeaj0BWayGvue3sh6XXRaglGASgft3qqAasnzRn1vUaK+4xAhlKioMnHtnO44oSjigEqqIVgq0ojyDlYDgjGGkgRwjQkPjbiBOnHZ4TKPCW1YjxIqQY4wYNTCYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ibrwLYIU; arc=fail smtp.client-ip=40.107.93.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ibrwLYIU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jzhBR1X15IiL5dwhwdVwRC/VGNoHSY8IpPTbydKXU+pwJ0Zz2GpxAECTrWG2DUbtqSTVyxtStj1KINCqVjZCbjz5hAQzdcCpIquw8weR16U1rkQhf8DA/KQQS8GJexi4amrjACsr5F05JyGVSk6WuLjNAWLxAX3GTzYQs3ZcSybsAqb6mcGR1I6hF/tmfM6W1a928gS0tgRNmM4cBBLB2MbWmDpQP8vkEAJf/NjtFhpXk3kJudy/0BMW9mOViQvpWqO013v+9GedmTlU/L9CvqBGQPyvaYyMOk1eYzijBQMPDl2cLy+N2kv23ml2ZQ3KW0U/1Ud9a5TAeiy4vcO0gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=skt4PDzr1OLsJ4mUTmiN4Kv9uWdycXcpnWo7NWVKd/A=;
 b=mRcuBDjSDN3iUQKcAXR64iTRMGOKQzKPkg4vlipTUeItjR0Gz1OEUf6qZLSgmOk+Km85LVQBzAuTiywGJTaDpy4x58R1mPSEVOQzFIOEUv22FXaFWKB5vVxkTAQROWblMRGPLdVQX5iRo1ygjW5HM1ggfHyu6S3a+vleEaHOD3xNDejTO/cMnYkThDt1Rq0bAiIK4jyS9d4p+sZmbDbkk7mf8xta/jb3MMW3pCjfkRNPxx4RKeaOeHOApjqKCJNDSgu8IdKEKvdwfCQtRknp+PkLEt+4UMvJkOI0YEeoCzYlE28d4bbryJP0nI3kSAkpUoNB8ziVWhOCqOggjlwnBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=skt4PDzr1OLsJ4mUTmiN4Kv9uWdycXcpnWo7NWVKd/A=;
 b=ibrwLYIUKXFYaHyCqindKl9GcoZq74B8ny53zLaxVwvbbBaLH9T6R4DmLhLTGel9iPqF2NinW9IrvtUqBP8wTdymoVld3XXp4V/tyP+6ZsMoM9NcGjbusXnyxW0mm0cmXI4It5e2uG4RYL6XMGBmD69dxETm1TB3jiLR2hk9ez944XxBI9AFs4YWUA9sIdLNB2ubY+rLkD3REjAy1ja7/yGbpafP7c3Jp/FHRgnGt4mnzkUfQ5YxsrYQHevZOamgssmVG8EbhmrvwOSz9lxoCBMMc6O7X0iQTcn4S8UDvXNPV0LK7zNjcHCs5G+Wb3+aTtRBGnd3/yp45NtOwki8Aw==
Received: from SJ0PR12MB5676.namprd12.prod.outlook.com (2603:10b6:a03:42e::8)
 by IA1PR12MB6484.namprd12.prod.outlook.com (2603:10b6:208:3a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Tue, 15 Oct
 2024 17:21:07 +0000
Received: from SJ0PR12MB5676.namprd12.prod.outlook.com
 ([fe80::abdb:7990:cc95:89ce]) by SJ0PR12MB5676.namprd12.prod.outlook.com
 ([fe80::abdb:7990:cc95:89ce%3]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 17:21:06 +0000
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
Thread-Index: AQHbChYmMxRBtseJkUCrb6TrJenHELKGYx0AgAHTh7A=
Date: Tue, 15 Oct 2024 17:21:06 +0000
Message-ID:
 <SJ0PR12MB5676697B93C267CE87C5A474A0452@SJ0PR12MB5676.namprd12.prod.outlook.com>
References: <20240918215846.1424282-1-bwicaksono@nvidia.com>
 <20240918215846.1424282-3-bwicaksono@nvidia.com>
 <20241014131903.GB17353@willie-the-truck>
In-Reply-To: <20241014131903.GB17353@willie-the-truck>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB5676:EE_|IA1PR12MB6484:EE_
x-ms-office365-filtering-correlation-id: a2dff7de-6007-417f-0685-08dced3dc0fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?FS8tlvYol+ERUm7f018wd4jcoZ3BZVCSkjXorAPErULtKPVMYM7zwxDVC8v5?=
 =?us-ascii?Q?D6w0SpE7/vWXPYrUvXDMhn2VEJpqA2t8ilRdEpIkfLSU+6zVA7HZQd4GLCHA?=
 =?us-ascii?Q?2LlJ4deL0T/cn5jUhKa9jn2c6z5EfruHKTFV2ZSeBgiY+iMSAece6X+5yUbz?=
 =?us-ascii?Q?/TI4sR2UXZwYR9w3XV9PXWTHwkJ7P7DmXLYytGwJ85O23dg2O8lTqsQCYcrw?=
 =?us-ascii?Q?+y+iA4bKkFvjwwmGEok5fG0kAur0j6ErQgsOSl1q4jJiRf8HmxbnWCe0WzVb?=
 =?us-ascii?Q?KEX3/0PVtolwH29xf+6NMnvcZ0LBqfnIpgaGV4kPq50oLBfRjll4/a32YM2y?=
 =?us-ascii?Q?VRDBSq/s0EFVPve39r/oDJfMqG7a1XaosL5RWAxFenrq+tbbT34k7rKXyFc5?=
 =?us-ascii?Q?lrxMHBxMhOsdv6OR7zaACZZm8wU7yXlUbeOvVVmBQUBNIb8AqLvjgk1H5wOO?=
 =?us-ascii?Q?c27bDEIV64mOs1bcu3/jaFdTjPMAhj+6nCNKHj477/2mWohIzfF+LoZpo384?=
 =?us-ascii?Q?h1bh4ACvtFhEsBd8PtW7idK8pWajGqcxNA4SzMIZf5gKcctanSh4nnbHLz6G?=
 =?us-ascii?Q?Qm3kLo+576sBhI54BJwpcxkWj8tvKxMvHcHstfFh1od3MjkT9iggJ85pwzOQ?=
 =?us-ascii?Q?ykm3dbMtQXUm44cdaYgjM9XPoF2GiY4USILgebIHyoqYIvK3HFD2bVLbYm1j?=
 =?us-ascii?Q?XIPCxs0nnQNHZLVcXZYcCEOa5B2xiOjPic28uEBv8g+8BxYnhsdV8ZG9++Ww?=
 =?us-ascii?Q?VmxQ4qboUy67sYcvD8WMGi3kLXzgDT4ddhj6pU5B7WMk81r8Lmm79s4wsPPO?=
 =?us-ascii?Q?OeX7kS8OU1wRZwZkED7C0XhcabxCxQSwGAoM7Nv+kEm3FbKRuCN/RtD4Wo0+?=
 =?us-ascii?Q?QVH7laCyOej9eMdJL4sRdOzRaErRwnC0rOJt5VcSPrzGRIqma23sKL1g8xbP?=
 =?us-ascii?Q?y9SmqUkOEY/2DEU8s6/RdFNmDFRtJ3/zhBf3hl05cOhwLtnbEPkcYWy1uQV0?=
 =?us-ascii?Q?hjl1uayWF3RqaXGyXwOGGv2PryQfL66gNcmwcFdWoTsjEnu9DKAK4XxA9VZe?=
 =?us-ascii?Q?+Wyiofy6jHpLSDXS3mO5DfmKFZey/+T7fYuXud2WWWkxGPZDWJO4/6M6ojI0?=
 =?us-ascii?Q?Jp2xSb+ZTwDa14sn++jp0Af9toAwDKvzwAN209e+qq4PTYaBl7TKQv5uLqL9?=
 =?us-ascii?Q?/2JVPIK9zIh2Q+7/CA7ZBeDSZJJ0p2tjj9+rMsZSj4An3Cg4Xa7vVvMeA44u?=
 =?us-ascii?Q?Uqaib29rHFgptmENQXAe85FH9MyZ6owe5Zx/Yz4r2AoS1QA568WDLTZxMKK3?=
 =?us-ascii?Q?y0VsrHirMsqmkDgm6H/qX8eCSXI+z7kE+prbZRpMQCwRww=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB5676.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?uLU/9f3pwz7N9e7eqWFtp346xFAQt9gjfp6jolEzU7HhmkN/zwkvOyP6fOW5?=
 =?us-ascii?Q?1fiyzV0vEN/zc1udRKvAWvPH1nTMIjGZ/b8qUUnSxJLruCsfNhkSAZwr2Akb?=
 =?us-ascii?Q?0g5J8c8oEWgm02f/5MnmgNo7Aiwd0+k5T9U3jbuU6b5RMfjHsOmqX+U2K7o4?=
 =?us-ascii?Q?45oPfftHWvf1Wo0yzllzHJZVSdO7aUHgb+vyAbXiiezmdt8NwUJbD7sQ5GKW?=
 =?us-ascii?Q?2bRW6HH7l/7Y4fyBGK9iKtuNeFiaIRJOcQTjarV4G0fBsIYRHVfw74C8AK44?=
 =?us-ascii?Q?SNYHgGztHsPd9Tp8ZzQT39RYZ8BJWbOtRdVwZW5X9g+Zkl8EWxqBLl1rZr5W?=
 =?us-ascii?Q?j0hJuTgcidftc72s/D9GG84wA1wUB5zgx/DLTMnB79GQ4XLAH02+TBa8aYhS?=
 =?us-ascii?Q?SC49Xo3C1nGoYXAiZ4pzRTKzt9mzJKvZbGl+dmzOKvCTX90Y01mTQaofkKw3?=
 =?us-ascii?Q?5z7CvAHWhDuobe237PJ/etxDxDR2CrMwouQzo6zdss9zSKVEuMS6BaNR34vR?=
 =?us-ascii?Q?0Cvy+V2CD9JALY7nrrD+gQ/Z6FSRvSIo7e+u/tqDCvkzyoj/EYVxuuQsqhOW?=
 =?us-ascii?Q?SIEBt/0xSKqdYwD1xV6QOWAFBCgoIbmAVtiskFlYAjBPyMOBDwPcD9te1NrX?=
 =?us-ascii?Q?ike3syXc8DgglYXuXDuhKZczw8w35yjHLdiqbhxokMbdrDSniwu8Rqd/bRLZ?=
 =?us-ascii?Q?ri9CfMQ+fPFcT/fzQZYVq3DkEBn4ymGBeX7/BePP1W6JIspBC+Clgtxt/U4f?=
 =?us-ascii?Q?/DRUINwraeZVyAPSAhJEfVzqDu1of6GUZguUw10U3GTpx3g/g9y0ciKL64Ex?=
 =?us-ascii?Q?35wdSFIDAF++299lrlZz/ZBNjfiFbeOBPPHNf3wriKRqHdt9xsS4jLOwENKM?=
 =?us-ascii?Q?UTjCUpDI0EMGsYKQj/qm/Z3W/OZfxkmSKg9YMg0UdzB0QO2RIpH8cyHNk5pK?=
 =?us-ascii?Q?uMFfkWfkZ5nmvmAJZlUSXhN8JGlZyS3UgayAIUxRYSQRF5aKD/pngXGa2XVJ?=
 =?us-ascii?Q?5QKt37C6kFM3d2Oew3o/Nhwa0Pl9HZrSzI24Y1mGVP21xbZxFMLg2fZRTUO/?=
 =?us-ascii?Q?+qRwshKAM6f/KqnlzKBlmD3t+NtYXyTvmkZH1hF1f3N/Z3/A5kMZsB+lRW6n?=
 =?us-ascii?Q?68Iy0w0aBWzwVwdVfuzhnrpEf1SpEd9byh04H8qP/yO4PUvNjw9UpT+Wr3f8?=
 =?us-ascii?Q?rIUbvRxYUzS9POWM4tLwh45dGnCptSACoA7wKj/Ke+tNodAAhtokSBu1I6CG?=
 =?us-ascii?Q?sRqf/EbR7MD1AYrwMqPLjX/czfsndpnqecQAAwknpT4aMBOmRujqU1fg+xYS?=
 =?us-ascii?Q?38JFRGddxms533dJNjoZbup0BeOuv0C001mkggXcFxp4XPhe5MGKl0Bgkuj9?=
 =?us-ascii?Q?+ULiVGPmme7ZhEthKx/45V4gSx9OTpuE5BxLeyfqqCws7cW4zr585gnIgcyD?=
 =?us-ascii?Q?ywFytDw0fTEaBHIUFPWg+jmpnmLY+aSFWSRlWZTQ8W5w2xjmby1mu9MRW6fi?=
 =?us-ascii?Q?zYloe3O+S3VPfCiG5J47jYyVdS383vAL7NVkbv7Wq1f/qAUNMcTOIld9YHlX?=
 =?us-ascii?Q?l88Y7SQ5xAVpEQNGPP8iE/EBRL2sN4dJVPpAvI0v?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a2dff7de-6007-417f-0685-08dced3dc0fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2024 17:21:06.5781
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dCVP3mgW/vqT1DSocKj1Yp7I+G2TzSXyZ5krF4paKFNi7GjjSQW5mbujzg9AY5i6GGtHaAR5SeJtxUW9JIFt/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6484



> -----Original Message-----
> From: Will Deacon <will@kernel.org>
> Sent: Monday, October 14, 2024 8:19 AM
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
> On Wed, Sep 18, 2024 at 09:58:45PM +0000, Besar Wicaksono wrote:
> > Rename loc* and rem* events in CNVLINK PMU to cmem* and gmem*
> events.
> >
> > Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> > ---
> >  drivers/perf/arm_cspmu/nvidia_cspmu.c | 21 ++++++++++++++++++++-
> >  1 file changed, 20 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c
> b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> > index ea2d44adfa7c..d1cd9975e71a 100644
> > --- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
> > +++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> > @@ -112,6 +112,25 @@ static struct attribute *mcf_pmu_event_attrs[] =3D=
 {
> >       NULL,
> >  };
> >
> > +static struct attribute *mcf_cnvlink_pmu_event_attrs[] =3D {
> > +     ARM_CSPMU_EVENT_ATTR(rd_bytes_cmem,                     0x0),
> > +     ARM_CSPMU_EVENT_ATTR(rd_bytes_gmem,                     0x1),
> > +     ARM_CSPMU_EVENT_ATTR(wr_bytes_cmem,                     0x2),
> > +     ARM_CSPMU_EVENT_ATTR(wr_bytes_gmem,                     0x3),
> > +     ARM_CSPMU_EVENT_ATTR(total_bytes_cmem,                  0x4),
> > +     ARM_CSPMU_EVENT_ATTR(total_bytes_gmem,                  0x5),
> > +     ARM_CSPMU_EVENT_ATTR(rd_req_cmem,                       0x6),
> > +     ARM_CSPMU_EVENT_ATTR(rd_req_gmem,                       0x7),
> > +     ARM_CSPMU_EVENT_ATTR(wr_req_cmem,                       0x8),
> > +     ARM_CSPMU_EVENT_ATTR(wr_req_gmem,                       0x9),
> > +     ARM_CSPMU_EVENT_ATTR(total_req_cmem,                    0xa),
> > +     ARM_CSPMU_EVENT_ATTR(total_req_gmem,                    0xb),
> > +     ARM_CSPMU_EVENT_ATTR(rd_cum_outs_cmem,                  0xc),
> > +     ARM_CSPMU_EVENT_ATTR(rd_cum_outs_gmem,                  0xd),
> > +     ARM_CSPMU_EVENT_ATTR(cycles,
> ARM_CSPMU_EVT_CYCLES_DEFAULT),
> > +     NULL,
> > +};
> > +
> >  static struct attribute *generic_pmu_event_attrs[] =3D {
> >       ARM_CSPMU_EVENT_ATTR(cycles,
> ARM_CSPMU_EVT_CYCLES_DEFAULT),
> >       NULL,
> > @@ -234,7 +253,7 @@ static const struct nv_cspmu_match
> nv_cspmu_match[] =3D {
> >         .filter_default_val =3D NV_CNVL_FILTER_ID_MASK,
> >         .name_pattern =3D "nvidia_cnvlink_pmu_%u",
> >         .name_fmt =3D NAME_FMT_SOCKET,
> > -       .event_attr =3D mcf_pmu_event_attrs,
> > +       .event_attr =3D mcf_cnvlink_pmu_event_attrs,
> >         .format_attr =3D cnvlink_pmu_format_attrs
> >       },
>=20
> Hmm. Isn't this a user-visible change? For example, will scripts driving
> 'perf' with the old event names continue to work after this patch?
>=20

Yes this is user visible. I am expecting user script to be updated accordin=
gly.
Would this be reasonable?

Regards,
Besar
