Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2057.outbound.protection.outlook.com [40.107.236.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6661B21AA;
	Tue, 15 Oct 2024 17:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729013376; cv=fail; b=TOkRGZCN4VEGg62D8gl5bzMLA1aKZyBPfP1ZYwhzYO1187nvmjvmq1pZeVpId98xY/9D4WuAe4CMXYug9dsBv7ZUln8ofNPztV+vsSo/4qHkX4R2CQJ0piaDBqcyvYOQRs9lVPuIbv4uwvkX2XiSSEsh3BvqdLw7LJViwaEWDoI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729013376; c=relaxed/simple;
	bh=eEcTIKswsFLllx3uSg9vDvVIaRdi+hY5i8SmLc+fIOQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KTtQe9pBX/FDDh0QLUtrTxqUOy2WdcRxGlEQnmnq9rYbW9lvhZvEQLp1PhXIh7gb13occHfIKk7JyuMSFZnqe4tszpzOgu25G70JtUv3z76s6ixGt2NZ2gukip1WO2nPcPFsVKyIK5T8GQZxHNk+O++JpxuVx692MUwW7w9Dtjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ad0BfJtX; arc=fail smtp.client-ip=40.107.236.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ad0BfJtX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vL/WREYjm/HN8z47T98BMwJfCA03p2xm+fpqgeKxNkQaIrMjyq8WR+OyrC97n6oxM4f6wNp45rFrfu0iTqManBR9jhS8aSLGO3IXfpgm72oWwAphju85k6Dyv0NZEkBq8Tz9202QQBnw2gPfylFtHkfK74METvD6aRG8VRRUHnG74LSmCsARH5jPXRUzQ32Ir/bQcoag/tPqsM9txHf7uTEItBf6Uq9qi6/hPZIt8bqJy2qmQf+VxXPq0vbABbMSJRzw/jYd6xZYeLprGjV8uRMGD4nakOmIufGYFEsmkMI+HtOLb6KV7S/s6eB5JEG/TT9Ccjn5u3YSDH02HisjDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1vJbNuenjDPS5m4zQUeAKtXhzTtdTZ5HM0V/muFUKw=;
 b=NqIFb/aFGzLwKvyaIjaYh6dy07JeSqz0sXWYr2oUCQKiMvQRwVwHwmlkrVKzW0UoITuZUd173gHHWOzGEk0AcsKZfC4ha4Rpxw9BJt+OnbAla7lDdRVMtJe11ufnp04T/jDhZizhh9tUy2AdY2wxw81rKP1syiqT2LP6SyMnTjM5toTNaGCDd0aSGjZJSsMqNHcF2cETqzRhSMz4y+LUhtlNI11z+bRoIx7/Xq/c7fmiB8B45Pyk7qt84GK4jAkm6D9P0CbxGRmtAcysDaGkCpiwV460E1ZGtFKqHfbQsqLnxDNxUKveX9JxV58vY+EVXIeFU3b3Iw8u8VhZeJL2xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1vJbNuenjDPS5m4zQUeAKtXhzTtdTZ5HM0V/muFUKw=;
 b=ad0BfJtXBhPU1GFFZVl0BUNfNS3Qsg8/ZcM80VMOI9PEEPfISZ5p+hUEpqLD7LUVpGdEgbyjQsD+CtnFKBNL55i7t8zl6POoSie8UEvof4+Gk5rWxp+x+PIPsQZKK1r66NsyQ17hkmxmQnwfhKLnFNa/BEpe0XO6TTTRy0i3pjS2cnEx1zzJ2GRVkEJjJP0N08QcRBQbZwJ5+KWOPPzxYcGtEYQVffCJDt3sVZcplrr3bxoY8g8bP8asz/2vr714cpdmDLF2yBogkcglzIIZOAaox6OKupsQpDYJMAbf6yQjj8sXHFburr3w7PzRyewSOoyODd55+m0Z32Bo27hY8g==
Received: from SJ0PR12MB5676.namprd12.prod.outlook.com (2603:10b6:a03:42e::8)
 by DM4PR12MB5795.namprd12.prod.outlook.com (2603:10b6:8:62::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.26; Tue, 15 Oct 2024 17:29:28 +0000
Received: from SJ0PR12MB5676.namprd12.prod.outlook.com
 ([fe80::abdb:7990:cc95:89ce]) by SJ0PR12MB5676.namprd12.prod.outlook.com
 ([fe80::abdb:7990:cc95:89ce%3]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 17:29:28 +0000
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
Subject: RE: [PATCH 3/3] perf: arm_cspmu: nvidia: enable NVLINK-C2C port
 filtering
Thread-Topic: [PATCH 3/3] perf: arm_cspmu: nvidia: enable NVLINK-C2C port
 filtering
Thread-Index: AQHbChYj1X5inLf58Umf+UFCUOgZjbKGZcuAgAHTlPA=
Date: Tue, 15 Oct 2024 17:29:28 +0000
Message-ID:
 <SJ0PR12MB5676D1817E2C2F3693B82D4EA0452@SJ0PR12MB5676.namprd12.prod.outlook.com>
References: <20240918215846.1424282-1-bwicaksono@nvidia.com>
 <20240918215846.1424282-4-bwicaksono@nvidia.com>
 <20241014132839.GC17353@willie-the-truck>
In-Reply-To: <20241014132839.GC17353@willie-the-truck>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB5676:EE_|DM4PR12MB5795:EE_
x-ms-office365-filtering-correlation-id: 21aba04a-d855-4edc-371e-08dced3eebe4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?mXte96bUREMMl7ID1wZ7nCpmVl3gwLRbG2DDa4R35zms31ayF8s/1kOka/0V?=
 =?us-ascii?Q?7xfLLjJcouZa4v/pwBvEwkPS7rHUhC/AYFgUQzFgGRx2c8foai86UDLn7R5U?=
 =?us-ascii?Q?ObcqjgPn4aaz9QG7507jKm1Hytu+ztF4kjWGFHivWmvG4up8T928Xtc4ETF4?=
 =?us-ascii?Q?ASt1G6xmUYgndNA0Fswyhc/r/EurhFYFT5vqeNN+UavKO3XKTAf4y9NBzgZQ?=
 =?us-ascii?Q?ytR7zZKyjgq4nUi/RaOX2EY5oP+jL3qq2Svnfx1Ic7ndxmD9UUrif79JKUMe?=
 =?us-ascii?Q?F6B/z137LKXdDUWAdGtlTxgsDIB7uOV5hpEqIugeS4uj0WUvH0pAryCse7TG?=
 =?us-ascii?Q?L9XOrz8zNkNJ8MXYKsb6ivieiQ6Jc0PwIGj1jcRneMdqQBQ42RB/TmasnUZF?=
 =?us-ascii?Q?fuIKYPaFr3m6X/feIjg4RZbi2tGpSxjAM26qK7Wp4Ez3rQll7YnZvr3WFn0u?=
 =?us-ascii?Q?VWWeWAX/7/SViv2A8hyzt9u9j+EJkbqIYZsYAHJAGVLIy/omqudycE3a9hyG?=
 =?us-ascii?Q?9rQvwjB+pfA+ZgEbBoCRhVFHhFWPh0VjYDEYLRaw9iPuh5wXk8mVgPNAA0Sn?=
 =?us-ascii?Q?sxl7cRK3YMenxJL1y3klQUdI7IqlBqrYyAIO0lJr8PjtPH4pb9ccyQnbeOIT?=
 =?us-ascii?Q?SL2liGyeb7aYszCWwG6+QeH/vunX9OomwvfNIL7uiJoi5X4RovEaKtdJmx9T?=
 =?us-ascii?Q?oKdY2NltC6tXVwxAMjthLkhG/AzzSARzORpPhnUNIYcX0FXvuPfgJMEJSDz8?=
 =?us-ascii?Q?dcCO7MxJ2tO/gDCb9uL5zBo6jGUsnSUE98WgbhOZ80wDmRUL8rV5f5TJ2Pan?=
 =?us-ascii?Q?QdRHXg/Y93SvAU/feHviISNc15neD2tG6Ovqhpy2FMySffAPjG26Tv8FPL13?=
 =?us-ascii?Q?eKBYINLiWDqxenKSl4a+29AvtLpbylmX2xR0botMVVF8prEeD2A1Wivxzlqw?=
 =?us-ascii?Q?sbXPl6UUANKbOdteRm7xI7pvU6QYQ6oFDzFe/WzQxKyUkc/8j9Q4IYR+TBz1?=
 =?us-ascii?Q?F3Lbwx97TxShiZLyCvoGb3nsi4uGLyXsw0qC9W+0dPXgCdy/11bNB8wTv8EB?=
 =?us-ascii?Q?OXDoWb23S6V3UJ/n37N5Xd7uGpP1U0QWl/+0mKmq1ijGKybX/XfMVT2RGvao?=
 =?us-ascii?Q?gVOuLeAiAIeGcikxi7IIPZKONSXzFwa1jf2tz9lNZQtgrmuUO9Cl1NLz/LKO?=
 =?us-ascii?Q?WKDYa/Qysfd95c9J/DB0JsQcyOsuFFgC+9/VQjdNNoTQEQrVjWsErjWbAqhM?=
 =?us-ascii?Q?QgbOJgsUuxoviXDLU/jaMVqHgesHGGNCjwecxBZfV/9EM6Tx1EuS2GDXxkX2?=
 =?us-ascii?Q?EOOjuSX1CtiLoA2NtUCPEKys8qCsYyU9PyXkkpXjJ82BLA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB5676.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?32XeKM07X88ABmyahCjO4XcEhjip6j0X5o5b5OY3S4iOhVfTlIA2HvyT4JJr?=
 =?us-ascii?Q?q1WRM+1ZxrUjbPtn2P9BsSXbKtiMuFl0pryOX0b2OGjhsmI/ryb9kVj3bYXW?=
 =?us-ascii?Q?TvDGJBtgI+kJF2j+bhswy2COweTwp9J0SR6uNiofiJzoqQ1uG0Fpb1obST7y?=
 =?us-ascii?Q?23iKQIOKR0zPHKMrD5V3TTxTD98KUD9W+21LLF3Q+bhft3I4dJ3e3Ra6pObk?=
 =?us-ascii?Q?ZXQmi3O0CbdHxvml3bDsFbrin2zPDLWU5GzS09Fmi/RXW8R8CuCIpWOPLoUv?=
 =?us-ascii?Q?0wlAZZwBH43iN0bmoZEwLYsHZ2YmwfT2sFUb/0wKRPF+LPfFNuwetaoT6ccv?=
 =?us-ascii?Q?hSpfSC+LzoYu/ZNTAcPI5PRQoQaxbkxuBXS6CySv0yVhhLijH2xvop6xDwCz?=
 =?us-ascii?Q?OmkH14KNH3V2TBXSE2XaqYCdkJXzqgFCigT4QYTAK8fRlhZBeTN1TBJQXoWQ?=
 =?us-ascii?Q?qj5CHVTWIlE5NgLhGx/56xPFY02mQ7Pl7gn8SQI5tYj1FOP9nDxPWHBUHLAc?=
 =?us-ascii?Q?vNSX/vgsX5c6tkU1XRqMxhlQKepQM29G4L+JGGU46NGjLbyb43FVKpbwPeGD?=
 =?us-ascii?Q?iAUbGAUzHjN/Px8Lvq3V5z3rjrbxNo+cbRS/KtgqsqhzlAzPB7lBo6cP93oH?=
 =?us-ascii?Q?ihv4GGL9/Xtb9HcaywoMZlaThHJUmFXVv/agi5hXi2sz4dcR+cgRQvprRjI/?=
 =?us-ascii?Q?DViOTJ/+jS1zh+5ps3iTvpjmNcubyrLdJBOh2v2QqIEC3bUKzNRKJpjD+Dvb?=
 =?us-ascii?Q?5VOem/eMgyZByI/9/KLBRLRYYTBJjUOwDnbBBGL+mNy3vM53rJg/6o+D/WE0?=
 =?us-ascii?Q?YsrpfJoIq8J1GA0x8GU3U70BENQwYT2XDKi2/JAbi8f+iq0AIWjXIuNDZ9VG?=
 =?us-ascii?Q?RhhrC4tWkbowBt0REeS+11oZrIkzjchWpGaa6iAnDAA9/lcG2LyhEXahgSSB?=
 =?us-ascii?Q?BngfWUyafKLRamH2etaA3GHzJ0rP0Z9d5qBuDpfjrfnZbnZNTmI83hjm2x/h?=
 =?us-ascii?Q?13MJXX+C3U/O4Zryls9KPpJ0LtPnz/qzUmjYfzxgJdLHr/QZhpewupRgkexP?=
 =?us-ascii?Q?Ervo+2J54tYA0DvaKWl/IG4PFNypPf7NTw6KHLjJKw2Hl9LUAlDbnMucy5N9?=
 =?us-ascii?Q?oOVw4RUIgpFxJVc6DqPDspGcs5ROjc7Lyc0vO2PlHoPJ2olKpRYx7QtJVa9u?=
 =?us-ascii?Q?ZuljCqAuzXPbhVgi5KO/m/oQepbpuq6m/dUfFu9yiLLxxR/TzdMd180KHR9b?=
 =?us-ascii?Q?PcS4nJap6hYJwwSvOIuOM6XaHbHoKpEHYQ05AozTW+FF+0FFn6YvZ9/eibPe?=
 =?us-ascii?Q?eiyCRDCkEDky/vS9NNot4dCFnYe1Rwp2wHstVXKQpF9Yytnae/5sO07ZDINw?=
 =?us-ascii?Q?ZhgjzXBZPUH3oR3gFZG2A5Giod2lJtT7NXUBl+2J2eL23Oov7l7pQ3MQJUjQ?=
 =?us-ascii?Q?rdDuxxZUpJ9pr+0dC2AVcIruLLmuL0Epi3xrYv7e73xEgBdly0t6YNVBTOtJ?=
 =?us-ascii?Q?Uf2U5lgJkrtvJ9sn/l/KnGRbptsTv9B5jgrfs1GvXXOMsiLepdbBYFt6l+4q?=
 =?us-ascii?Q?DRD16whs+ysZ/X7cFkZBUacww+jWdssRtHugfran?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 21aba04a-d855-4edc-371e-08dced3eebe4
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2024 17:29:28.0525
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jqIV8VG6ke2hUFn2OaDHzA3+VJ6MTMwHfIivHiAusVBWfWvg/6acGYJkSIZtkk0KPhxSNOlfkHf/nR8P7yEx1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5795



> -----Original Message-----
> From: Will Deacon <will@kernel.org>
> Sent: Monday, October 14, 2024 8:29 AM
> To: Besar Wicaksono <bwicaksono@nvidia.com>
> Cc: suzuki.poulose@arm.com; robin.murphy@arm.com;
> catalin.marinas@arm.com; mark.rutland@arm.com; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
> tegra@vger.kernel.org; Thierry Reding <treding@nvidia.com>; Jon Hunter
> <jonathanh@nvidia.com>; Vikram Sethi <vsethi@nvidia.com>; Rich Wiley
> <rwiley@nvidia.com>; Bob Knight <rknight@nvidia.com>
> Subject: Re: [PATCH 3/3] perf: arm_cspmu: nvidia: enable NVLINK-C2C port
> filtering
>=20
> External email: Use caution opening links or attachments
>=20
>=20
> On Wed, Sep 18, 2024 at 09:58:46PM +0000, Besar Wicaksono wrote:
> > Enable NVLINK-C2C port filtering to distinguish traffic from
> > different GPUs connected to NVLINK-C2C.
> >
> > Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> > ---
> >  Documentation/admin-guide/perf/nvidia-pmu.rst | 32
> +++++++++++++++++++
> >  drivers/perf/arm_cspmu/nvidia_cspmu.c         |  7 ++--
> >  2 files changed, 36 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/admin-guide/perf/nvidia-pmu.rst
> b/Documentation/admin-guide/perf/nvidia-pmu.rst
> > index 2e0d47cfe7ea..6d1d3206b4ad 100644
> > --- a/Documentation/admin-guide/perf/nvidia-pmu.rst
> > +++ b/Documentation/admin-guide/perf/nvidia-pmu.rst
> > @@ -86,6 +86,22 @@ Example usage:
> >
> >     perf stat -a -e nvidia_nvlink_c2c0_pmu_3/event=3D0x0/
> >
> > +The NVLink-C2C has two ports that can be connected to one GPU
> (occupying both
> > +ports) or to two GPUs (one GPU per port). The user can use "port" bitm=
ap
> > +parameter to select the port(s) to monitor. Each bit represents the po=
rt
> number,
> > +e.g. "port=3D0x1" corresponds to port 0 and "port=3D0x3" is for port 0=
 and 1.
> The
> > +PMU will monitor both ports by default if not specified.
> > +
> > +Example for port filtering:
> > +
> > +* Count event id 0x0 from the GPU connected with socket 0 on port 0::
> > +
> > +   perf stat -a -e nvidia_nvlink_c2c0_pmu_0/event=3D0x0,port=3D0x1/
> > +
> > +* Count event id 0x0 from the GPUs connected with socket 0 on port 0 a=
nd
> port 1::
> > +
> > +   perf stat -a -e nvidia_nvlink_c2c0_pmu_0/event=3D0x0,port=3D0x3/
> > +
> >  NVLink-C2C1 PMU
> >  -------------------
> >
> > @@ -116,6 +132,22 @@ Example usage:
> >
> >     perf stat -a -e nvidia_nvlink_c2c1_pmu_3/event=3D0x0/
> >
> > +The NVLink-C2C has two ports that can be connected to one GPU
> (occupying both
> > +ports) or to two GPUs (one GPU per port). The user can use "port" bitm=
ap
> > +parameter to select the port(s) to monitor. Each bit represents the po=
rt
> number,
> > +e.g. "port=3D0x1" corresponds to port 0 and "port=3D0x3" is for port 0=
 and 1.
> The
> > +PMU will monitor both ports by default if not specified.
> > +
> > +Example for port filtering:
> > +
> > +* Count event id 0x0 from the GPU connected with socket 0 on port 0::
> > +
> > +   perf stat -a -e nvidia_nvlink_c2c1_pmu_0/event=3D0x0,port=3D0x1/
> > +
> > +* Count event id 0x0 from the GPUs connected with socket 0 on port 0 a=
nd
> port 1::
> > +
> > +   perf stat -a -e nvidia_nvlink_c2c1_pmu_0/event=3D0x0,port=3D0x3/
> > +
> >  CNVLink PMU
> >  ---------------
> >
> > diff --git a/drivers/perf/arm_cspmu/nvidia_cspmu.c
> b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> > index d1cd9975e71a..cd51177347e5 100644
> > --- a/drivers/perf/arm_cspmu/nvidia_cspmu.c
> > +++ b/drivers/perf/arm_cspmu/nvidia_cspmu.c
> > @@ -149,6 +149,7 @@ static struct attribute *pcie_pmu_format_attrs[] =
=3D {
> >
> >  static struct attribute *nvlink_c2c_pmu_format_attrs[] =3D {
> >       ARM_CSPMU_FORMAT_EVENT_ATTR,
> > +     ARM_CSPMU_FORMAT_ATTR(port, "config1:0-1"),
> >       NULL,
> >  };
> >
> > @@ -193,7 +194,7 @@ static u32 nv_cspmu_event_filter(const struct
> perf_event *event)
> >       const struct nv_cspmu_ctx *ctx =3D
> >               to_nv_cspmu_ctx(to_arm_cspmu(event->pmu));
> >
> > -     if (ctx->filter_mask =3D=3D 0)
> > +     if (ctx->filter_mask =3D=3D 0 || event->attr.config1 =3D=3D 0)
> >               return ctx->filter_default_val;
>=20
> Isn't this a bit too broad? It looks like this filter function is used
> beyond the C2C PMU (i.e. the PCIe PMU) and you're also checking the whole
> of config1 rather than just the port field.
>=20

I think the other PMUs (PCIE and CNVLINK) that have similar filters will al=
so benefit
from this change, since a filter value of 0 on these PMUs are meaningless. =
Should I
make the intention clearer by moving this particular change into a separate=
 patch?

Thanks,
Besar
