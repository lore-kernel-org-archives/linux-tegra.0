Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011028.outbound.protection.outlook.com [40.93.194.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9244734D4
	for <linux-tegra@vger.kernel.org>; Wed, 14 Oct 2026 07:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963364; cv=fail; b=LvD03G1OHSWvOPgbvC3PfVkdXp7mICNu28X+D2SXec0ltCQ0uJghwV62IhVo3iy53ewqgEpFmliX6d/D7G0KDO48XPBQQWbnPk+SwVr139JEuILG8x/TwJ8IrNscIVvxVsDL7Zk9mAkSXjvS4mCiF26kgrq42nVshQiEvvIM5QM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963364; c=relaxed/simple;
	bh=MaJdYYrxkpliI7fEEhpPY1bH8GtLC26OGzvaqw2FXkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cqhD1YfI9VlbNRa2lwjHAw31GoY1nvoSMh2QfVHfF6/5WDOwzW5OYFoVeeQyUDmiH5bUeNRS1/fouefq5uqkzFmDusHSMGWTC0lvqVfdJs7Qs2sP2dwx+JGgM8E+gbRx9tBAO84Gt4z3k6/iOP7TkdtdoXvsajoTMPtjMhYI/YA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=F8E8RyCl; arc=fail smtp.client-ip=40.93.194.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="F8E8RyCl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p9SsEweMcCm/VLsZgMcOKuZiFOeNOw0mFJtNsFR+I9W5gqATyU7HoRlvWR2gFPmnTFFPesmMoItIxKhdHhV1Wt95+6UBkN5dQ+1NxJgLwBUEqTEuXf4qxBk1IDmC6GxZPcv7oZ7Pu3N5F0XpQE4fL5XD6NTsLA079m6KYcVvJ7wcgfSrCBRnx0FBt02+c6Bb/VmMSZmL0DJXKauqPPBjhsRqofl6PePebjaysA8Zr9koh5Xp9d2/K6xQR6I154TcJY1oQRQ+/Tfk36zipdwIOUxPv74q9ov5eNtDr/oQ/rgm6wG9JsaHx3c8Ms4zbdIFZ4Rf33OcsCHUp0YogputNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jaX2b2RPJ/rEdtIPDW4RMcpPvgJZsUL5vZjMVlc0tAg=;
 b=NLplqPeTiKHVVYP+vyXRS5wQB2OPFuSXRqHcpAV6DvJZTZKC3H62+a91RBha7ASXzKdsdGQpi9E9IvyJ3oMzeFkKw4kRG6D4lZIEHvMD4QohOjOpu1eJXGvCy1q7fYoGJakggqYkmizsJcfEFiRPDF4nA0H4desDKw5UtUYZWXOemeCJJ7CjXsCR+WtqgypNfKvLLUtQ1fP7Fjh4jlT5Gbj4VfWN0c5dJlFTldLkkCQNBmfMqdAbC/toMhN6/yzfkLdXYTN+9e+xiHSU8riRDfbw+68NbP2x3hRXpnl1ulyIrVU+oLxXZ6Oc9JOSFEqyH7PFxE2tknJeq8ooEedXEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jaX2b2RPJ/rEdtIPDW4RMcpPvgJZsUL5vZjMVlc0tAg=;
 b=F8E8RyClgm9KVmaF3TAzcII/J4ekhfhGHC1SG2dvyiNswLeAOpBWgygaNuKsU4rj873KJ+1OxlS8oXSRgs8wixSX4LO9/7hjG44dpGD+Rd14cpF0Wm111hHI26Flm633oO/fdCFvcxf+yqvg6/MdCBb8lYYQ4Qh3ae9jiszTjXUbsoemOmiIncxvlMEWr02tbTIUbuTxcoJwzTFfs52DT1HxRVgbwqsM04/HGsh3oBJNdHDnVI+LGli6eqVdXyUk7x/Qgu1IUoAthoz/+lQT+KXgStrRmQ9W1+Sd4xmQaA/noce0w5m49dYWPVmJoNxN4o8FlfKhoDOu6kRFAJxI1A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by MN0PR12MB5739.namprd12.prod.outlook.com (2603:10b6:208:372::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Wed, 14 Oct
 2026 07:35:58 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%5]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 07:35:58 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Thierry Reding <thierry.reding@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org
Subject: Re: [REQUEST] Release Firmware to Match Current Driver Support
Date: Wed, 14 Oct 2026 16:35:54 +0900
Message-ID: <zTfGVn53QmqQRM9wpFd_XQ@nvidia.com>
In-Reply-To:
 <CALHNRZ-nBgurVhtHjRtz0W0u1oNJY2eQo7xRA6kaUPyfZv9hcQ@mail.gmail.com>
References:
 <CALHNRZ8uHmx3nqpg1-F6RCprDavx3nY55en5gJds54RU8MDR5Q@mail.gmail.com>
 <YuEtlKWiT96iasuBtZCX1A@nvidia.com>
 <CALHNRZ-nBgurVhtHjRtz0W0u1oNJY2eQo7xRA6kaUPyfZv9hcQ@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: PS2PR02CA0088.apcprd02.prod.outlook.com
 (2603:1096:300:5c::28) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|MN0PR12MB5739:EE_
X-MS-Office365-Filtering-Correlation-Id: f7bd8a1b-accb-41c5-b508-08df29c5c9dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|10070799003|18002099003|10067099003|22082099003|11063799006|261009223027099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	jK/dxmqLRZ+PE1ZO184dGRfWFk632mEgNXfPDg9prXFAwstkt5UiOQm1Eh3yRQuoOmUYVYgrnDtDFen5yZJwJRfvxozxLzZqCu1hCI5jZ13CoWpzBL49oWmL/JX6HMO68w0dJg3Hp/Hx+FQAan/kRUy3IFCZ9z0UelXsCeXR5oIuYI/rHtQKUUvDQ3aYRqL6fGWsGw1YZ/t0+ZgE4CDfebw4YaYVb79QvXSEBKRBKz7iZsgu4SBh4izAnrc+rAoh+68GgUdrSHjuWwAAhamNQuJ4Q913TEHIGJ43JnoUlyIq83zlDVIhlh+0oamoBiNH9VjNIsko05/CiOg/rwSAf6omQPQwDxLbzMHxwfarA5W97drBvdXv875AnhPu+6BoKxUstN/If4qZ4lF+qcgx8gMkWWFZrAYldPtknhRy4ESZYSZKec6dt7w9Cmvgjw0LvOY5UafuLv7VDuSW7W+9KL+v6pjlwKJN12HeLCbnMuqe2djiu8sOJvheBbFliXscEqbP6I1H0rUF9/p3IpBJPipkLS7K+VAdhob0M/OI5+2H8zCSICiPGk2Y8Gu+Nc6KTy5fLYW0TyMAnL/9wr9+z1Oj7EnOAXMLyf9Rgyl77WcJmd52+ADYIqiz9U9JPd4bbn+782CoAjFp06LzXNKymwLcF/00eDU6D8SVEezOX0M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10070799003)(18002099003)(10067099003)(22082099003)(11063799006)(261009223027099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3JBUEtoZDc0ckJsTm5zRFJMV0JEdDN3WEV5UGR1YU55dDFiMDcrYlhJL3FQ?=
 =?utf-8?B?anB4Ym9ENE1aaWozNkpBZUd2SDFiQWNHL1JVUlhwT3RwSVRtN2ZtUmJhZXha?=
 =?utf-8?B?dDFzUW9VVlFqSDdHbnpvcFc0U2Nna2hZZUpLWm4reVQzdGZSbG5razg0NG1Z?=
 =?utf-8?B?c0x4UE9reG1Bbk8rNklTWFYwS2Q0bDd3c2pVckdTVnpjWjEzTUNseWE5alBO?=
 =?utf-8?B?QU1iSGNwMHJKbzBELzVLa2lIZkhIRmJSdlNXcFBFZXJQVHFTR3IxcWhpQlZT?=
 =?utf-8?B?d1crMDI3cWN2S1djZkFkZmY1ZlJMSFE0UzdMWjZqTjh2RWpnaXVLaEh5YXND?=
 =?utf-8?B?U2FoaFY4UUxwcm9Mc21pbVEvM3MwSlQ3MGwrZXZMMjN0M1kvQU11bVk4bmxU?=
 =?utf-8?B?S2JzdUlUYTBJQVUvaEltdnc5VUZuYzlJMENWVEdnRzV3NDdNcUNENFp5eTZn?=
 =?utf-8?B?TmpBQnZWQTVIRGIzWVFGQTJKaEpSYW5rNXUycjNXakcvTWNkVEJnMzZOdjhl?=
 =?utf-8?B?dTliME5NOCtDWUpBTGxYalJIeURiU2J0anVQUXNod1BRd2hiRHlXNnQrSDhl?=
 =?utf-8?B?RkEwbEhrWEtnQm9MZEZhY1E3bWV3MmdSV1pEOHJHU3NZenduOWVXVWZQQStK?=
 =?utf-8?B?cG9tY2Y2Vy93SDJjRU1lS2o3dFJwYnZPQ0ROS0dRZXh5Y01YQ01wSGpldlMx?=
 =?utf-8?B?SDNueGhpRmYvZm15RXZkcFhyNkZqZmFEdHY3VURLbDBzVG9RQkF6TWJ0OXl0?=
 =?utf-8?B?dk94dVd0L05OWHl6bWdyWmhwTGd5aHU0NUNDbXk3UWJBSGl0alluRVJWSHRB?=
 =?utf-8?B?bExlcVU2Y05BdnpsWkJZTEdNTzFJL1QzN1QyZ0VEWlgyTkIxMzZ5V0REUk1V?=
 =?utf-8?B?VnJoc0IyOUh2U0Q3bFRia1hoMnZiVHBmUUEvT0VmYjFmaHRkWlhReUYzVDVx?=
 =?utf-8?B?OUVCOGxXbWpoaWoxeW9uRmdBc1Z6N1FwWXc1S0M4WXd0U1dRbDd0UkxVamR2?=
 =?utf-8?B?ZW5zQXBOK0hqSWN2c1FlTUVzKzdxK1FveHVrZmZkalF0bHBsVkVCRmNVZ0du?=
 =?utf-8?B?TWFqWG50YllvWEJ6MEEwTTVxanY3UFl4aEw0L09yeU1CWU5TbmVtamFVcDdL?=
 =?utf-8?B?b1MxdVNqZ3YrQ2ZHcEhlcTFaZ2hINFFxMEZtbnQ5OWFTWnptdkNuL0pBK2VH?=
 =?utf-8?B?SDVvNXpIa2wxVXNFWHFiMTZmMzhZSVBVWlNYeXZIb0VMbmhQNEk1VnF4bDhD?=
 =?utf-8?B?Q2dLRUJ0aEE4cldDRE8rV3FnZkwvT1NHUmVNelpSaEs4M0ZXSE45NWNVandn?=
 =?utf-8?B?OFNRVHpCNUNGcjgwRmhCTlF3cEFRdVFMRmU4ajQyZWQ0RUlHZnVFOGJMZFhq?=
 =?utf-8?B?NmFaVVM4NDhVS1BYYlVnbmxZaThMN1NmWTF3TzdaZHFSd2N0L2xHa3hWVkJr?=
 =?utf-8?B?V0w0My9aNTgxUXZvU1BvVFNCSHVpdFBXZzQxRGNFNllGamVjVFRTOUFwVmxH?=
 =?utf-8?B?Tld2eXpUV2lvY0ZFUGhMUHZmZitURE5YZS95TWlQcmYzS0dhN0tlRnZEbjMx?=
 =?utf-8?B?VEdtcFp0VE1qUzJ2YUptT3ExMEk5SHljSmNtMFg2d0V5M3RGK3QycHdFSmN3?=
 =?utf-8?B?WE9pZTE2UG9GRUROVTllZkpzYnRjZEo3cGdDQ0dFSW5ybVNlSWs4OVVEaU1P?=
 =?utf-8?B?K1dPR0dLa2EzdW5TWGlLaUYxZDN5SGtERnZteXRJUENUWXNjam5UaWVlcmtK?=
 =?utf-8?B?b1EyZGR0RFdlVjBOQURyVDU4WlhUNTVHb01wRVc5YlhGdjNCQnVVa1NDZDNo?=
 =?utf-8?B?bFN6S1ZqQTJRUHRSVm5KMHFHZ1puRHlIdXVyTHd4WDJXRElueW5WVDZIcm9t?=
 =?utf-8?B?T2tWU0JuNFp0YTRBdFBFOVZSWmlpWDhFT3h3RnExZWNkR0R2eEw1Tys3bHN6?=
 =?utf-8?B?L3NsTEtRV0Q4c2pSVElWNjRZeVVKcTJPZlVtam9kSG5MaGNDa0d5V3RMeFBt?=
 =?utf-8?B?QWNFQmswZnlsaTVRU0NHSUtyT1R3eXZMWlg4QjRkdE1BamYrV0hRa0xmbVAr?=
 =?utf-8?B?bnR0Y0QzYkhhTlBlenVKM1NPdmFoNnBhVThJejZiSzVNOEFvMVpYQXJROTdm?=
 =?utf-8?B?a3dyL2wyT25KNy9tdnV5UzVUeG5Cbmx0cDJQMDNrNjZQejNxNG0rZUdpNFp2?=
 =?utf-8?B?NW4zMkkzUEdqWjdCeEdqWE5seHkvL1d3ZkVucDRYZjF0NXp3R1FBcld2elNy?=
 =?utf-8?B?YTJnWTNEdkQ1K2UrY00wNlp1ODRkUGlNOS81dGc4ZE93b1d5K1RjbHlnUHZN?=
 =?utf-8?B?R05OMU1nQlFkekxIVG5uZG1GeXVZZ1JCd0h2eThkZVpkWVRzQUVIakZoRFVI?=
 =?utf-8?Q?Mw9IJ4Leq74G/RVl3iTKynlHPKLggcFaCUbvd4J+r7rSQ?=
X-MS-Exchange-AntiSpam-MessageData-1: 6YxZkUl1uC1c8Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7bd8a1b-accb-41c5-b508-08df29c5c9dd
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 07:35:58.4185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u+ZPjjC7hqS76aMSEdD6mgnPFUQQ7PldFTxLXZymNa2SAHzGNzZhEko0It4wu580we2roJ3+uz3dSq2BxYjTtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5739

On Wednesday, October 14, 2026 11:47=E2=80=AFAM Aaron Kling wrote:
> On Tue, Oct 13, 2026 at 3:51=E2=80=AFAM Mikko Perttunen <mperttunen@nvidi=
a.com> wrote:
> >
> > On Tuesday, October 13, 2026 5:49=E2=80=AFPM Mikko Perttunen wrote:
> > > On Tuesday, August 18, 2026 7:49=E2=80=AFPM Thierry Reding wrote:
> > > > On Mon, Aug 17, 2026 at 12:17:27PM -0500, Aaron Kling wrote:
> > > > > On Mon, May 11, 2026 at 3:02=E2=80=AFAM Mikko Perttunen <mperttun=
en@nvidia.com> wrote:
> > > > > >
> > > > > > On Monday, May 11, 2026 12:05=E2=80=AFPM Aaron Kling wrote:
> > > > > > > On Fri, Nov 14, 2025 at 2:17=E2=80=AFPM Aaron Kling <webgeek1=
234@gmail.com> wrote:
> > > > > > > >
> > > > > > > > On Fri, Aug 1, 2025 at 4:56=E2=80=AFAM Thierry Reding <thie=
rry.reding@gmail.com> wrote:
> > > > > > > > >
> > > > > > > > > On Thu, Jul 31, 2025 at 04:22:32PM -0500, Aaron Kling wro=
te:
> > > > > > > > > > This was originally discussed on the freedesktop issue =
tracker [0],
> > > > > > > > > > but there hasn't been a response there in 6 months. So =
I'm reopening
> > > > > > > > > > the discussion here.
> > > > > > > > > >
> > > > > > > > > > * Nvdec firmware. The driver has been in the kernel for=
 over three
> > > > > > > > > > years and there's still no available freely licensed fi=
rmware to use
> > > > > > > > > > with it.
> > > > > > > > > > * T234 vic firmware. The driver has supported the arch =
for almost
> > > > > > > > > > three years and freely licensed firmware still isn't av=
ailable.
> > > > > > > > > > * Nvjpg firmware. The driver is awaiting final approval=
, probably
> > > > > > > > > > worth it to release the firmware with everything else.
> > > > > > > > > >
> > > > > > > > > > * T194 nouveau firmware. This does not have driver supp=
ort, but there
> > > > > > > > > > has been some interest in working on it. Making the fir=
mware
> > > > > > > > > > available, even if it isn't merged to linux-firmware, w=
ould be one
> > > > > > > > > > less blocker for someone that doesn't work at Nvidia to=
 work on
> > > > > > > > > > support.
> > > > > > > > > >
> > > > > > > > > > Aaron Kling
> > > > > > > > > >
> > > > > > > > > > [0] https://gitlab.freedesktop.org/drm/tegra/-/issues/4
> > > > > > > > >
> > > > > > > > > I will continue to look into this, but it'll not be high =
priority. Too
> > > > > > > > > many other things going on.
> > > > > > > >
> > > > > > > > After some discussion with nouveau developers, it was point=
ed out to
> > > > > > > > me that the gsp on ga10b doesn't do much and the setup is m=
ore like
> > > > > > > > prior tegra gpus. And that it wouldn't make sense to suppor=
t ga10b on
> > > > > > > > nova. So I would like to expand the request for gv11b nouve=
au firmware
> > > > > > > > to also include ga10b. Perhaps not directly pushed to linux=
-firmware
> > > > > > > > until they can be verified working, but made available so d=
river
> > > > > > > > development can happen.
> > > > > > >
> > > > > > > It has been over eight months since the last response. Nvjpg =
driver
> > > > > > > support has been merged in the meantime. Has any progress bee=
n made on
> > > > > > > any of the firmware releases?
> > > > > > >
> > > > > > > Aaron
> > > > > >
> > > > > > I have the multimedia engine firmware files on my todo-list. I'=
m
> > > > > > planning to send these out after Tegra264 VIC support is ready =
to send.
> > > > > > Unfortunately there have been some delays in that.
> > > > > >
> > > > > > Mikko
> > > > >
> > > > > The Tegra264 VIC series has been picked up into -next. Is there a=
ny
> > > > > update on the firmware release process?
> > > >
> > > > We're still working on it, it's just taking a really long time.
> > > >
> > > > Thierry
> > >
> > > Firmware files for VIC, NVDEC, NVENC, NVJPG, OFA, and XUSB for Tegra1=
24
> > > and later are now in linux-firmware:
> > >
> > >     https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-fi=
rmware.git/commit/?id=3Dbdeb9f0f93f18d10b281217e66e81838527ce55a
> > >
> > > Thanks for your patience. I was about to lose mine a few times.
>=20
> Awesome. Thank you very much for keeping at this and getting it done.
>=20
> > > Mikko
> > >
> > >
> > >
> >
> > I'd like to add that I'm looking at GV11B and GA10B support and
> > associated firmware as well.
>=20
> Oh, nice. I've got t194 in fairly decent shape except for the gpu.
> Getting nouveau support would push that into a very viable state. T234
> is still giving me some trouble, but it's not too far off either.

If you have any issues I can help with please let me know.

>=20
> A related question here, for future planning: The soc in the upcoming
> Jetson Orin Nano 2, does that have ga10b or something compatible with
> the firmware? And is the existing t234 media firmware compatible? Or
> will there need to be a new release for that with matching driver
> compatible additions? I would really like to get mainline support
> going on that as soon as it's available.

Unfortunately I cannot comment on any specifics of the Nano 2 yet, but=20
we are working to get mainline support as quickly as possible.

Mikko

>=20
> Aaron




