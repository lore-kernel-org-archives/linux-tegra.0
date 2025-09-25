Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010052.outbound.protection.outlook.com [52.101.56.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE0622D4F9;
	Thu, 25 Sep 2025 17:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758820417; cv=fail; b=oojHfvuXB25ikQQ72j5x6jyIzY/cWB2AqpsVyeWdR9g08QQqlU5U0gt3ik2vcDAGVv/O6Ca3ICtHevFCZcBETbqKg11Xj98bV0V+QMT6HoImjA5BFebTgcpB2tUanhw9ANHgngjXss4vuSt0jOhg7A3OQX+wyvtgcPXPKCF/a8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758820417; c=relaxed/simple;
	bh=+g1ojD4CtWxqzXtwWaH5DOrLWWuxLzJxE7NR8p/egxI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DJY+LOV/kbl+2+ZVu440YgUaKLm54FaklrBx0g0iqlVHya1G/SkW4NO3GEnJbOXnDcZ3xoonD1BCLXyHcwKAFjkWMGY4NQ59OcTs0NZHx0zKNnmV/j37YPoIzDgr2FtGJ5MmWFHd3EzwY0/FQZZ0w+1nbzIUyH2fcR3kBSvh/Uw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=puXVyeWg; arc=fail smtp.client-ip=52.101.56.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="puXVyeWg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bk53Y4TpcDF7M6uc3mhi1IgG5I6pRrYDN1W42gH63TKOagOevxptqjOymfgXka5dAtehJVdqzt3MD577VQG6BQ9WB5Rk6O7rK6WKwoYhyjwcwOviI9OLE0lgZE0NmZU2BBgu4pezJtqUHxuEXMykaEsmir7otdLREY4SH/AaN+IkNgIc29laWH1DMjBScdstGALzhLbJj9sCsA9QwHf/7OpX2JUcPF57jvES7YaNJ9hDjp7pZZ8L2kHouA0D1E2KUwQ2T85UcJSn0nQLjSMjotxa5zSfCztMbadMy/0m/KwZPDcxuI7OI2CZmHqmCHsXZiYaOsWmHH3WEDtXz8AOiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1i8usWdgCBL07Pd+gV6BwvrtUR8swLThI0l+24ZsGls=;
 b=w+8GumZ/HaRWaxfIIOHjqbMZvVeCKwqkNViK1ZuLhrxNpOtCYjuQE2i1qX68z4yvO3hfqglywfHZmbXaK3FRsu/s3hopoHNmxxAEab4MkoRtgV24d8vgHr5T5foJYRYjNPYcnpBSZLWpIvS4O8l3oNjrTju5Z+3canlZnYTPoFgzZMR74Dm+jjl9yiUXDLRntSh491jOBjgbN4S4Aiz92aBMGzmBwfAHcVuoaoCJVA6J6g+8Z83D2G5JtW5/f5+YDnNjeUlLtvigNydyAw49IYZQNPQGy4coBKyh5mpSEMZcJLu0AX81XpI9MCZznsJiLpSpTHbu1Oje6YtW1qA0ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1i8usWdgCBL07Pd+gV6BwvrtUR8swLThI0l+24ZsGls=;
 b=puXVyeWgDOGGg8zY5gVNtCJKB/kdtET41plH9+FTEfLGdoOyzo89ZdHB+JetJDfj7K/H5Vd3TAu/E0GK0wONIwZ2TCKof1CxbnqYCxGoO5bjlx2f2o8mb4ZhH7d3U6xzHUdEZEsbDSKSUnuh7klaFEVCyQ9F/i7amPCbv1oPIerKXiHRlOH8pg8puMqIMKtGiiu+CV1P3v5J1s8d4C9pITQzqiQIjqOROzSctXbWL+OrzuIhHk0InHIG3SXvguYpBC0rscdyxT7UwLUUdH63Zh1WfAbuen/RhNVP5/FahO5WLigeuB2qPw4BaozTN4UP93wg1cFgceD+l8hLVKdbcg==
Received: from SJ0PR12MB5676.namprd12.prod.outlook.com (2603:10b6:a03:42e::8)
 by MN0PR12MB6365.namprd12.prod.outlook.com (2603:10b6:208:3c2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.23; Thu, 25 Sep
 2025 17:13:29 +0000
Received: from SJ0PR12MB5676.namprd12.prod.outlook.com
 ([fe80::abdb:7990:cc95:89ce]) by SJ0PR12MB5676.namprd12.prod.outlook.com
 ([fe80::abdb:7990:cc95:89ce%4]) with mapi id 15.20.9137.022; Thu, 25 Sep 2025
 17:13:28 +0000
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, "will@kernel.org"
	<will@kernel.org>, "robin.murphy@arm.com" <robin.murphy@arm.com>,
	"ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
	Thierry Reding <treding@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
	Vikram Sethi <vsethi@nvidia.com>, Rich Wiley <rwiley@nvidia.com>, Shanker
 Donthineni <sdonthineni@nvidia.com>
Subject: RE: [PATCH v2 1/5] perf/arm_cspmu: Add arm_cspmu_acpi_dev_get
Thread-Topic: [PATCH v2 1/5] perf/arm_cspmu: Add arm_cspmu_acpi_dev_get
Thread-Index: AQHcLB/x0ECYGsP7/UujGGehS37q97SjlSuAgACE5fA=
Date: Thu, 25 Sep 2025 17:13:28 +0000
Message-ID:
 <SJ0PR12MB56769D95623AA45135F113A8A01FA@SJ0PR12MB5676.namprd12.prod.outlook.com>
References: <20250923001840.1586078-1-bwicaksono@nvidia.com>
 <20250923001840.1586078-2-bwicaksono@nvidia.com>
 <331bea5f-cfab-49fb-87e4-7ec31523c2c3@arm.com>
In-Reply-To: <331bea5f-cfab-49fb-87e4-7ec31523c2c3@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB5676:EE_|MN0PR12MB6365:EE_
x-ms-office365-filtering-correlation-id: 0ebb4515-1669-4f28-b59c-08ddfc56d846
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?u4YfGwIdy7WODr/wg1z1O7oK+DuFfp4agedRSeF6fQY4J55CJ7qa/l8+fLbj?=
 =?us-ascii?Q?RqJc/sFl2egpU6MAvQFQBvstJAS39YM6mtV5YP1j4w70vBbXA2EyfEIL7HuM?=
 =?us-ascii?Q?tWF4kM7W7RDHrwKqXpagzeWqdy+xPSU61qXbmj2qsLYg3oASJSF3G3KrPCno?=
 =?us-ascii?Q?UDt7aPzhqkBcmgT7IImas22Y5l3pYONsYJnwKL/PY0Szus9d1RwtsXkDAv6y?=
 =?us-ascii?Q?i+gLQXni6vXzMIzetiMUkNayS3AtLTaEsM9IuntUnmu5LzcWVp4I5gha5oBm?=
 =?us-ascii?Q?sRsFo54oAFi+a+HZcONSo7xKgB2H0IusP87Z48tDs+xjvXlwwvOzGTQqLZCt?=
 =?us-ascii?Q?AsV5fokePHwR+UKT0/Th4BK4DI7o0eCPaQx93Qs7FpUgV27vXCTYfn+5nyiG?=
 =?us-ascii?Q?iAOcR/ay0c+N5Edyy8OLmgT6+SVPqORKr/Iwkv3vHRGjyTz1a9XxjuesGRqY?=
 =?us-ascii?Q?03kJimFdpeNODEFUGABR3jWHux0JrvxVqF8bNErsqOMmnYnc2ZfKSuDVSm61?=
 =?us-ascii?Q?OGUSnq6lHkBjfj7fQm7suF7i1nPTQgMjESXL57e+N6cKOrNH84j8339WeIgr?=
 =?us-ascii?Q?GrcdiNHcsA5YAxsDiiMdFGCyeb5V0PzlQCK0JNBGYerSi4GlKIP50Ey4iXKn?=
 =?us-ascii?Q?ApY1rqwRNVTZMrdDgv6zoFrkWR6KkLE1bb8FgVcUsW8tTjG9jcMzFrA1DJGA?=
 =?us-ascii?Q?shDAXNDVUfsvx3UWZU3B4Zye6G6yE3aO0krpVtSKtNGdmGpN/1rXu0T73CXz?=
 =?us-ascii?Q?VjOMT7cULRz7gS4Br7tDHrbYsZ3aI+3xXz8FgieQNPGtLEAfuNcxygWCGE7m?=
 =?us-ascii?Q?NEpQCcNERfMRn+jJ5woH8MYMN9GR0iSzQY6PBTCbpryUjfZDDLW3yrNBrwKw?=
 =?us-ascii?Q?si6TrOLyd79XnNvo6hVpv7JPJHpwNnxcCrN3RrJloThLctD9/LhijsYyJJke?=
 =?us-ascii?Q?6BqSXVeOBSfTk/Fd7+X3MraafPh2tIa/gm+g86cOPXTx+OQ/k8JmwuwVt2yb?=
 =?us-ascii?Q?XlwttR1jKhFehc48VtKUH0ax+8ThGZE5i1iv3LWZW/e6GjLKPfF7cDfj59UO?=
 =?us-ascii?Q?84KL79TFfTIDmRyCD5t7+TYIs+scnrY7eB1hhpE1ahccLRRwKY3KXMQSjiyP?=
 =?us-ascii?Q?6J+ovf5OWqzpYMvxqFRg3uEBtYZ5XqxWfvjZboypgpMHBLJOwM3BTsnRFkEI?=
 =?us-ascii?Q?XYjrEorNkZOGbEsWMIunxvd/wK69xBh9eN569Z/R9c3ivtr84wuz0XEqDeiK?=
 =?us-ascii?Q?fH2MWLda0apWs0XNHXfy6O7WMBPw5KzjPTDBWwNl+CfBu+vQ026WE3Kro4BJ?=
 =?us-ascii?Q?mp5Cb+mNR3bYFxHDEx0qL+xsK8AZvvsYvkAg3Zid0o46FJjN0Tj7WQsX1gC+?=
 =?us-ascii?Q?qUkDZ+0K0qcOoTMZh0z4NDVjBNvZEbKTFKZwNhTR0ci6Pa+oNku82JnuOqVS?=
 =?us-ascii?Q?TR9Q0whqR37UHEZVEbeui+LBVRyUZJe/v8Cia+iRDRRejcLQf6IYR6e/P7ut?=
 =?us-ascii?Q?pPJDcLWOGZ44b9EwEC5rGE7BJWd6FC0p/iAL?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB5676.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?YhmWpeFsYwf6ZpRjsb4WKDm4aUX7gWMbspefOAH9fl4PC/48UYUHFJ/Z7+6C?=
 =?us-ascii?Q?hhCjmanWIe239XF6W+LTonXaM6M6zibj5wPETHdTyY5Tjk3mNuVVtg2WchU+?=
 =?us-ascii?Q?Fhq0O7IYwfUo2S4/n1m1cw5mOO4jUgYpNhw4qYmn2ct6ZoDd/ABnerrKPx7a?=
 =?us-ascii?Q?1DNwCECjwkDFkKaMB1imP6PyNSzrXurc8hKFlJfodXS67vVLERixDmHbRLYn?=
 =?us-ascii?Q?IdQg3prjlV/jZ8k9lA/Pcghbw1nzlygnYKARdVU7WEbejlkXk2M2yb3VGhW2?=
 =?us-ascii?Q?sGuGMwXV+Suho25HLdKPmiI/5jyyJe8woEBhTrTP3EeobTMCyeGxOJRVhgFy?=
 =?us-ascii?Q?esmBidgJ/r3WNk5JiEyGpYGShrWJqa7gC1DpNEm8jQZszeXjMiqC0UxjEcxT?=
 =?us-ascii?Q?1qTVczuCcw/AF261k+1dxW1Wd1413S/xyzXF2ERNk1v1Oxd+jFUiqYjB9YWt?=
 =?us-ascii?Q?yI+uPutuEwlaItOTVY6Y3UsfoCkqOHjX3o5kJXJW2dfj1z6ZqaSyzILfB+VC?=
 =?us-ascii?Q?b4NO7xZfeNIwtvt6g1ijFEHRCrqzSUnPfYCCIktXNxSuV6szN6QWoiEsQZ3j?=
 =?us-ascii?Q?eKmb0dK5Mo1zJv/TSFtbKkt3YFh3a8syK/m0fmU1p7gnNQf0fFeg2Hpe8fQn?=
 =?us-ascii?Q?frqJNqoEXK1rFZvzuquR9DHsp3wAcT0OrhDTQ89/8QIP3+yGVhsD8GzIqjuB?=
 =?us-ascii?Q?i5667+Zyy7D9MpTW0C/3imOjxIKMf97k31NeAfR0DbjPv+4Myzb6Xprz8B/f?=
 =?us-ascii?Q?ZWtmIgV4F7LqWcelWwyx5/yS4XMxAsYU1CO1tG9DNTGSZywvnlzSDjW932oS?=
 =?us-ascii?Q?e7z64wLYkeqP6WgvZl2T9HDG37XJXrgGRBnsAD5l/7HYzraMOIH+Pj6qHUQc?=
 =?us-ascii?Q?QbiSpkgbg2rSRYLyUnIytVtceK+J3dZdGmFxzybdb8yiWY54u2W1UDQ/cS6P?=
 =?us-ascii?Q?XiSbwYIXtpnDBttsEb9VkkkM5leMbJh+UrI7mD4uBsEUSKYHk3YFqfDapNEI?=
 =?us-ascii?Q?5DwGmwOYcJ+BgI+3i5kpl31kILK4hw8S9Lt0/RXnk352E+heOyy6ytmNJduE?=
 =?us-ascii?Q?qntW3Sp5CSmDbkn8caqVExuxRrN5P+4/OJuzLYoYRU9PUufG+sI5qa0s1L8T?=
 =?us-ascii?Q?pjZOkuFGeMDOJjXgRe6mqkN++2JbMG6MEJONdiYEDODrpMQGKBH7aLTglEMu?=
 =?us-ascii?Q?OJTNQC20/rFTc8la3pie9Mt74JCjdb0dxCTfPilEZy+x4n2plfVFyzhRXbXK?=
 =?us-ascii?Q?yEG6+pB8k/TKkM78Yh8x51sDBYkaoBsrRGwNKlqLEnyyOUT1HYUPWSVdHEOj?=
 =?us-ascii?Q?jltV2ju/QfJKlZgMLrEoxcJ3UbDBav+pJMitJPkPBVVf19Zg6JaVD0f0a+iD?=
 =?us-ascii?Q?9rz64NB8YnJzT5gSCIVl8IL4Bd1Sm+k1Ti8Dt4grlvxWoRIRzgY+Fe2RclGB?=
 =?us-ascii?Q?diya7HjZGxf2zigvJUFtA8oFJUGF6j+XxzrLHDxZv8lCvS70Z9ob97zZSLWe?=
 =?us-ascii?Q?3dmhbmWxWFwb1COsuUxfA4e2WTX9DD5DziXrNos1tfW9+8PG4fCdyBmpZ48e?=
 =?us-ascii?Q?71uM4T797hG9InFifZwyu7pwcnxrd+WkFZ27baA2?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ebb4515-1669-4f28-b59c-08ddfc56d846
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2025 17:13:28.2330
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GeHSIH2FEuB8OTWkvj71EKBBs308Go1ELeVF4EGgn01+sHblQlrHZmlnEkqbG+2M1tMZVs7GkY65vXQ0hTxeAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6365



> -----Original Message-----
> From: Suzuki K Poulose <suzuki.poulose@arm.com>
> Sent: Thursday, September 25, 2025 3:31 AM
> To: Besar Wicaksono <bwicaksono@nvidia.com>; will@kernel.org;
> robin.murphy@arm.com; ilkka@os.amperecomputing.com
> Cc: linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; l=
inux-
> tegra@vger.kernel.org; mark.rutland@arm.com; Thierry Reding
> <treding@nvidia.com>; Jon Hunter <jonathanh@nvidia.com>; Vikram Sethi
> <vsethi@nvidia.com>; Rich Wiley <rwiley@nvidia.com>; Shanker Donthineni
> <sdonthineni@nvidia.com>
> Subject: Re: [PATCH v2 1/5] perf/arm_cspmu: Add arm_cspmu_acpi_dev_get
>=20
> External email: Use caution opening links or attachments
>=20
>=20
> On 23/09/2025 01:18, Besar Wicaksono wrote:
> > Add interface to get ACPI device associated with the
> > PMU. This ACPI device may contain additional properties
> > not covered by the standard properties.
> >
>=20
> Ok, but who needs this ? I couldn't see any users in the series.
> Did I miss something ?

NVIDIA will need it to support upcoming PMU devices.
I am still preparing the follow up patch series containing the use case
on these new devices.=20

>=20
> > Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> > ---
> >   drivers/perf/arm_cspmu/arm_cspmu.c | 22 ++++++++++++++++++++++
> >   drivers/perf/arm_cspmu/arm_cspmu.h |  9 +++++++++
> >   2 files changed, 31 insertions(+)
> >
> > diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c
> b/drivers/perf/arm_cspmu/arm_cspmu.c
> > index efa9b229e701..75b2d80f783e 100644
> > --- a/drivers/perf/arm_cspmu/arm_cspmu.c
> > +++ b/drivers/perf/arm_cspmu/arm_cspmu.c
> > @@ -1090,6 +1090,28 @@ static int arm_cspmu_acpi_get_cpus(struct
> arm_cspmu *cspmu)
> >
> >       return 0;
> >   }
> > +
> > +struct acpi_device *arm_cspmu_acpi_dev_get(const struct arm_cspmu
> *cspmu)
> > +{
> > +     char hid[16];
> > +     char uid[16];
> > +     struct acpi_device *adev;
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
> > +     sprintf(uid, "%u", apmt_node->inst_secondary);
> > +
> > +     adev =3D acpi_dev_get_first_match_dev(hid, uid, -1);
> > +     return adev;
> > +}
> > +EXPORT_SYMBOL_GPL(arm_cspmu_acpi_dev_get);
> >   #else
> >   static int arm_cspmu_acpi_get_cpus(struct arm_cspmu *cspmu)
> >   {
> > diff --git a/drivers/perf/arm_cspmu/arm_cspmu.h
> b/drivers/perf/arm_cspmu/arm_cspmu.h
> > index 19684b76bd96..9c5f11f98acd 100644
> > --- a/drivers/perf/arm_cspmu/arm_cspmu.h
> > +++ b/drivers/perf/arm_cspmu/arm_cspmu.h
> > @@ -8,6 +8,7 @@
> >   #ifndef __ARM_CSPMU_H__
> >   #define __ARM_CSPMU_H__
> >
> > +#include <linux/acpi.h>
> >   #include <linux/bitfield.h>
> >   #include <linux/cpumask.h>
> >   #include <linux/device.h>
> > @@ -222,4 +223,12 @@ int arm_cspmu_impl_register(const struct
> arm_cspmu_impl_match *impl_match);
> >   /* Unregister vendor backend. */
> >   void arm_cspmu_impl_unregister(const struct arm_cspmu_impl_match
> *impl_match);
> >
> > +#if defined(CONFIG_ACPI)
> > +/**
> > + * Get ACPI device associated with the PMU.
> > + * The caller is responsible for calling acpi_dev_put() on the returne=
d device.
> > + */
> > +struct acpi_device *arm_cspmu_acpi_dev_get(const struct arm_cspmu
> *cspmu);
> > +#endif
> If we need this, why not add an empty stub for !CONFIG_ACPI case ?
> Similar to what we do for other cases.

Right, this is an oversight. I thought the ACPI code is not portable. But j=
ust found
out linux/acpi.h takes care of it. I will fix it on next version.

Thanks,
Besar
