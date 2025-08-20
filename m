Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567EE284690;
	Wed, 20 Aug 2025 19:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755716829; cv=fail; b=qKoMkgJ99db89APnot3E0MS0e7ioiHzNIZdA1klGdzqtA2uerj8ejqoq+oi925pvaJqj3VdJoC+FTZ4SEzMc/M69vbTz7MOffZ0onVyjV61pmU7/FT716vjE6GOwW7t9PKnQc5q8xUBxUwluaHzZEEJ/ZWVCBlEeVHyAye0KW38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755716829; c=relaxed/simple;
	bh=Cdh2805LGybK36HsZwrvSSyhF/7YVTxUZ9h9Yhn0WJ8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aVncCJiRbpWVJUVzbBTE5XOPbZUN5jZUpMHZqVpLXRleEApUdWFRx8TIOLNwYxlwshRorwmbQcZzEjTB2AoIFFey1wPHkhuclZX4zjDjXQ2onIGmR2Zn9/QZA9TAldMGBNdF7J1HjjPIM3Nt5AAoxobr7LS/DfnwAC186+u8XSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=A/ZEd8fl; arc=fail smtp.client-ip=40.107.220.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="A/ZEd8fl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GyD6XthJZJqu+pTvEk1ErQVDDdVS227ysqTuJvWV1TcOTDbg0RAgP1qG3y4DdH5w81sKKwIm3YGSxkmnq8I3poasvXScFCO4T5jSZLEAeOb0ouzGCgy5fJs1FMTTrIN0QPP4hpHFzrxtCTCSDrceS5mg1W/ffnGmuIqz1Bnamj7ODAO/9f2Zzv+/ZUROzHmwjAywBP53VSxJQt+ieIj7YvsXr2CysQnhd6KYuExBlP6/lrokvZcUnJrS1UkckefMGCTRy2LzfEcFrsZ+mF3yjSXbzk7bZBJWga+WqPRatxi9JyTzHXeAGlut2RVYAMR6NvU9r/MveazGElmgmtdzQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+bezVhWTR1gRHpCVs5fagH3IIYHRSy2g/INic32z2vw=;
 b=fgdKoW0L4E/tR63kr9nK8f3GTZiJy2rL0REOZv7L8ec/Chcsh6pvf7L+ap8X+XqJ0MYHHI/o2v9gPtMv5kUKXH4qxuW+05+/LOd7hi0KzJBwH0kje/7g3BJYnJtZd+hQNoN/tvDdFW1Gyky5gJdad4FH55dfGpBfFCCJZr9CdXErgDCdanMPpyNyOOFQHnB2SY06egqvhPbCH+DkOJfNg6i9zIS/EX+F6Wnz+bOM4ScsCwaFNmdcgO/F01X/AmkjzAmO3PB8jZETktdrFT9gJv7DOWQNyRZh4Qm5Tu/PgEuzpp2kQ+1qZRrRIDXJTMIh8WnCY/d2nCpOoqYtTm72jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bezVhWTR1gRHpCVs5fagH3IIYHRSy2g/INic32z2vw=;
 b=A/ZEd8fll+GHcmQQ28txtP5zfNYtU9XO/A1tju1tnJl55v84FVZsM6zDmmqUAB2uUqgm7hoM9F1jcyQDItxrZk/4HcSlwzU8KZ6t0h5Aoefpjf9H4JwNvDQ6AvhrDmXVm6c1HApkVkiumxPt098F6TTw2lkJqzhXdt7A21LTuhbkpnP+gvxtJ/jZHncggzwHSkjWGn5vsmU5db0/GWqs7B0jn0pHC66MHWpFPQlbUS5X2jYTHuTcpG347LGSSsl2YLlj6nggJcAGDnKI2tZ4WeihVdD/hLMbCiQAesklOVz1AVoS37HAZ7hUL9EUECa3KktGUPMpPsgDwGFTfvv3JA==
Received: from SJ0PR12MB5676.namprd12.prod.outlook.com (2603:10b6:a03:42e::8)
 by LV9PR12MB9806.namprd12.prod.outlook.com (2603:10b6:408:2ea::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Wed, 20 Aug
 2025 19:07:02 +0000
Received: from SJ0PR12MB5676.namprd12.prod.outlook.com
 ([fe80::abdb:7990:cc95:89ce]) by SJ0PR12MB5676.namprd12.prod.outlook.com
 ([fe80::abdb:7990:cc95:89ce%5]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 19:07:02 +0000
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: Ilkka Koskinen <ilkka@os.amperecomputing.com>
CC: "will@kernel.org" <will@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "suzuki.poulose@arm.com"
	<suzuki.poulose@arm.com>, "robin.murphy@arm.com" <robin.murphy@arm.com>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>, Thierry Reding
	<treding@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, Vikram Sethi
	<vsethi@nvidia.com>, Rich Wiley <rwiley@nvidia.com>, Shanker Donthineni
	<sdonthineni@nvidia.com>
Subject: RE: [PATCH 1/5] perf/arm_cspmu: Export arm_cspmu_apmt_node
Thread-Topic: [PATCH 1/5] perf/arm_cspmu: Export arm_cspmu_apmt_node
Thread-Index: AQHcC+ImMFs5yr1DfUmkmrpnMiJW+rRqdGWAgAF7uzA=
Date: Wed, 20 Aug 2025 19:07:02 +0000
Message-ID:
 <SJ0PR12MB567600C6753A076E2ECD6FC6A033A@SJ0PR12MB5676.namprd12.prod.outlook.com>
References: <20250812233411.1694012-1-bwicaksono@nvidia.com>
 <20250812233411.1694012-2-bwicaksono@nvidia.com>
 <88a25a26-109d-b5cc-4bd2-776c3c2ba113@os.amperecomputing.com>
In-Reply-To: <88a25a26-109d-b5cc-4bd2-776c3c2ba113@os.amperecomputing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB5676:EE_|LV9PR12MB9806:EE_
x-ms-office365-filtering-correlation-id: d0549e50-9829-4ca7-a3ae-08dde01cbf11
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?oD2ZnbAaknmD+93/SW8fiSLIubxYu5b8U8BtjXUdel9OiC7lTwjF0EbQe34K?=
 =?us-ascii?Q?4CNdqrVXoBbwQO+34cbcMZUlVJuUruSrYprbZB6OwWADmsV6H4M2mXRmkZso?=
 =?us-ascii?Q?9Iih4SzUelOjX0pHQZ8kyxcPAk1GXCYy2D1Uw9zBb8H+iRdWh6EMjpkEeFUV?=
 =?us-ascii?Q?86FSzulT661Bd7pJD5BsWZROtOJyH4aciaYaDZ1qf+cf8VWBNhikUeS4bcqp?=
 =?us-ascii?Q?cwifJmrba2AB0GGI/S/mrYdNpXFZsk0MSp2WzBo5TqyKobWQ5OUMPseRt3vA?=
 =?us-ascii?Q?m6RBeLwWKzZXIlyhNpxmsUOX6cyrV7yJpg/DbT6Hc/aqOU9zR1njQBS6N2/f?=
 =?us-ascii?Q?OkJZkoWRnLFr5v06nKblz551l+3rcJHcmogNwk6XP8F1yAxWJbfI17//1bXv?=
 =?us-ascii?Q?xIariPaA7qap1viFcXSPXdrcuLpMT/mVIiUoD4UxTZ6+oSBnsxxXT7h2JVYK?=
 =?us-ascii?Q?rjTy/zzm3s3j7w5LTZfBLazb2GB6JOBCvnPGtIaYTCwfN87U+eWQbXlv1Woo?=
 =?us-ascii?Q?X14Da/YYm1UZ3y+3tHsXzF/LU2PN8pDN/4IEpxzLR4LmTCWVnfjaOLvOnrB5?=
 =?us-ascii?Q?Vl7tPy0MqMtllUa58cU867f3sKv9oyWMVIJ9G39j32JS2jzJDTODyN6UfDZ1?=
 =?us-ascii?Q?sbaWAHZ9JEgXTPhURGBX9upQOMD/J2G0BSzU+QEHBudXkawdnE0kYC1yr9f/?=
 =?us-ascii?Q?xeDW+pZL0Uslc9KQKLLIHXp4iG+NQjDSJ3SdH/c+jtSEemZpbNOmOO4oa/+6?=
 =?us-ascii?Q?lNgcJPlIIc4h0haC9L43ovFdi3PUIkkZMuF/mfCaRPvTNpslVc4n/d7o5JQX?=
 =?us-ascii?Q?YDqz9X4Z0suthkH++9wVbSwj4ZErzQxTQ2QhhhGaEjl/58aikbxJRuwx2pHi?=
 =?us-ascii?Q?Rw1m1N+EdJs7pimPDdbdP6b9rwukyJIp6PXRQDU+NnShfOxyQVBCzWkW8+LL?=
 =?us-ascii?Q?Y6Fc+JbqcrlPfXjSW9bpql974V1ilDlYQKNJk6Ft5lYGweaUpTF2/RObetUq?=
 =?us-ascii?Q?tUuwLZj2VsjMXQKL+Co26HnqwDqni6ExlOzD2P0OLjvfnzOTi8I6QrDlae5Y?=
 =?us-ascii?Q?fXFcwltefT0YUacgRrQ9vnD+2j61G4+v02lAgB4d/Dgq1u0rOv00EwbZ20rk?=
 =?us-ascii?Q?KIiFUtdz8cLQK7UYM5mb8tKbcDrbdE2Yh6iC3/dA/e4dVC5oBLMLJHoCukB9?=
 =?us-ascii?Q?ypDngOHE/QIJ/ZYL7hC5lFpPQh9nCEDNwGLz2Axdnrf1+oxrdOPUOZcRWhz1?=
 =?us-ascii?Q?8gbIcFiFTxmOScmw0UNfkSOKz7REpAr6/oqQxBCHlwKqemIb+aKyhgkf7Kr4?=
 =?us-ascii?Q?vdfifPzXXKsSXFhF/0bhDER/FE65HyCshlWgYqEhmlQTycBRxrQH4S4vWe+s?=
 =?us-ascii?Q?ucYRYv0jwlhoBPlTKLTekgaXtccm/b+/oDwYkVoRBsTYJsWYsi7XngMRQz9m?=
 =?us-ascii?Q?wQVMo9KLNxz976Ua465ICpTxx7RB41VJxfkzJCn4mCn/FrW6agcoJB6pjUV1?=
 =?us-ascii?Q?uh7K4HPD5sjjUFU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB5676.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Y87ssEqYq+/nDh+AAV++PPUUiMzOewy4GnG9sG1h3dRMGG1Cas0SHYfvaBEN?=
 =?us-ascii?Q?XJgihloZBLt77NAxvA6P9JBT6wqIXnL/J96oBF+SL3dyt3fZDGcNgizq1GoT?=
 =?us-ascii?Q?boELys5afqCJi2TdPBy/vgvyqY2dZu7tLbqJRVKbkPcget1wLSxmVFC0LaBK?=
 =?us-ascii?Q?VTubsNKs0DhKDHACNasw0nq2wfaNPub1Dn6Trra3NAjSsXiLF0XkvDiJ/3FN?=
 =?us-ascii?Q?HFl+/CBLEJbyyXAbzyumxTahS6vaaZ/l5zsnCjYhJqwTHOtEBTYpr+uzQM5t?=
 =?us-ascii?Q?zoMmuje2sWM85HN+dsrX4ePGCN8LtxWzHbfdjWtk8qT+AUxiQi2XrLi1cNjf?=
 =?us-ascii?Q?/ru65JhJ6sKOCCOSpTeQuZ22vzaj4PT2ikqgxxu7ss78RRXa6W+ZxUDYL9jk?=
 =?us-ascii?Q?U4fP6RCNZGwV3glJroOzwIA3lo88VlrqaPJPUDphg0omAwbKQOt/p76oGGOU?=
 =?us-ascii?Q?xpl6A8JWtyfKCLpDYR5gXoZGuaP225K/7ZFVALsgRzbOYgLyaPRmwZZafMx0?=
 =?us-ascii?Q?+zfLwrA43pLJddSxcjgMVWLNNZqACvzewtgtYetU0nJ0438rNzCb1Cdp+X+L?=
 =?us-ascii?Q?JzuYkpaUOrzcLy6DF28MJoBNNeL0gzq1fgsXtmt6OJlQojrvTdwr9hecMv+L?=
 =?us-ascii?Q?toHVUt/g1jb3tnYbVGcXCXNzsEsGUO3lu8BP1ddf3Ukp9Lyi9QNdvew7mk5A?=
 =?us-ascii?Q?UsDkmZub5Wp2WcjhSEBrrk8FQ6qYbczJKr1JpRjIYUGtF60e09zrKvsCUxH4?=
 =?us-ascii?Q?CKSyabYytVyY0gt19JsMtjA7q5IBnj7Zt//LWprf+R1UOBbdKvUJTwA1BxnT?=
 =?us-ascii?Q?n2Io8hHYmUvmheKxHVwEMO2naanNEiGOtcL9za9JFSUmcyiNj2SQve0vUi0L?=
 =?us-ascii?Q?Y9T0h73T8ZngY06gM4WsOKSc3TRBMOAcdWB0X6YLTynpnXs4YOKq7oCwaF48?=
 =?us-ascii?Q?xuh1jagVhHDTYHQKIS2zeGTT2TUbmOEvswlFa1S/47A5VmXb496fKeKbst1v?=
 =?us-ascii?Q?nnVWDQJ75lEmqyvcP/x/uDYkfTuHcZA2nZh+UsqmXwrMnOHR+2DnkeuF0589?=
 =?us-ascii?Q?vyRX3Wu/f7vDrE09VXZ2M6U1McFefwpgUHFkhlJu2xhAf6CvaZSP1o84DAZv?=
 =?us-ascii?Q?cIOF4O0OOp+wkFS8SLRu8fnaG6AXFFb03luICrjwWHFtWckwsxHGzcncpd1R?=
 =?us-ascii?Q?vfFcgI4YKSUnFc7arqjPj1pmVxcRgXDMWcoNC8n+QuNGFuDx+UL56iS013pY?=
 =?us-ascii?Q?q0NLRyQHq+ul3ZDKKiixr5ad7L0tdVBFlnA3nmjL+gEvNXlg0VEGAUtQCPNR?=
 =?us-ascii?Q?edzeUj+RNIUPYTecCngl+dbZPZm/XvGSfhkGM4O+tM08yP8SgEyCW3ayKgba?=
 =?us-ascii?Q?G6m5rUUf2sp6NAZvagKtqvl+OqSZzh7sUY+kXAnIL32N94smRRMswmltF/t6?=
 =?us-ascii?Q?hTL4+gY28MFKO2pzwtLx2XBA/JqP1TqYNh3DCnjJYszR+xXDBcSlex58K/Xe?=
 =?us-ascii?Q?owbZRJ03ICBxg7NF2oXovVclcjkbKo9JYrSZe1kcf5WsYBmLP+Y3zUc7bm8m?=
 =?us-ascii?Q?dq7Ts0S45NdyLevQgpMJdULj5KmyfjSOa90rFhQ8?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d0549e50-9829-4ca7-a3ae-08dde01cbf11
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2025 19:07:02.5711
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tGLxBt42vef6j9zKDxQH1odqqqRAHjV6b3PxAhcqArG0TRdKmo+ShgzXn4OBUl7WJ+2h9xAG7T1t3+9hOEdFtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9806

Hi Ilkka,

Thanks for the feedback. Please see my comment inline.

> -----Original Message-----
> From: Ilkka Koskinen <ilkka@os.amperecomputing.com>
> Sent: Tuesday, August 19, 2025 3:16 PM
> To: Besar Wicaksono <bwicaksono@nvidia.com>
> Cc: will@kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org; linux-tegra@vger.kernel.org;
> suzuki.poulose@arm.com; robin.murphy@arm.com;
> ilkka@os.amperecomputing.com; mark.rutland@arm.com; Thierry Reding
> <treding@nvidia.com>; Jon Hunter <jonathanh@nvidia.com>; Vikram Sethi
> <vsethi@nvidia.com>; Rich Wiley <rwiley@nvidia.com>; Shanker Donthineni
> <sdonthineni@nvidia.com>
> Subject: Re: [PATCH 1/5] perf/arm_cspmu: Export arm_cspmu_apmt_node
>=20
> External email: Use caution opening links or attachments
>=20
>=20
> Hi Ben,
>=20
> On Tue, 12 Aug 2025, Besar Wicaksono wrote:
> > Make arm_cspmu_apmt_node API accessible to vendor driver.
>=20
> I think I haven't seen the latest version of the spec. So, I'm curious,
> what kind of information the table has that the vendor drivers needs to
> have access to it?
>=20

The vendor driver may need the node instance primary and secondary
fields to get additional properties of the PMU that is not covered
by the standard properties. For example, the PMU device entry in
APMT can be defined as ACPI node type. The node instance primary
and secondary will contain the HID and UID of an ACPI device object
that is associated with the PMU. This ACPI object can have more info
to supplement the standard props.

> >
> > Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> > ---
> > drivers/perf/arm_cspmu/arm_cspmu.c | 3 ++-
> > drivers/perf/arm_cspmu/arm_cspmu.h | 4 ++++
> > 2 files changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c
> b/drivers/perf/arm_cspmu/arm_cspmu.c
> > index efa9b229e701..e4b98cfa606c 100644
> > --- a/drivers/perf/arm_cspmu/arm_cspmu.c
> > +++ b/drivers/perf/arm_cspmu/arm_cspmu.c
> > @@ -70,12 +70,13 @@ static void arm_cspmu_set_ev_filter(struct
> arm_cspmu *cspmu,
> > static void arm_cspmu_set_cc_filter(struct arm_cspmu *cspmu,
> >                                   const struct perf_event *event);
> >
> > -static struct acpi_apmt_node *arm_cspmu_apmt_node(struct device *dev)
> > +struct acpi_apmt_node *arm_cspmu_apmt_node(struct device *dev)
> > {
> >       struct acpi_apmt_node **ptr =3D dev_get_platdata(dev);
> >
> >       return ptr ? *ptr : NULL;
> > }
> > +EXPORT_SYMBOL_GPL(arm_cspmu_apmt_node);
>=20
> Rather than exporting the function, wouldn't it be better to move it to
> arm_cspmu.h instead?

Sounds good to me. I will make the change on the next revision.

Thanks,
Besar

>=20
> Cheers, Ilkka
>=20
> >
> > /*
> >  * In CoreSight PMU architecture, all of the MMIO registers are 32-bit =
except
> > diff --git a/drivers/perf/arm_cspmu/arm_cspmu.h
> b/drivers/perf/arm_cspmu/arm_cspmu.h
> > index 19684b76bd96..36c1dcce33d6 100644
> > --- a/drivers/perf/arm_cspmu/arm_cspmu.h
> > +++ b/drivers/perf/arm_cspmu/arm_cspmu.h
> > @@ -8,6 +8,7 @@
> > #ifndef __ARM_CSPMU_H__
> > #define __ARM_CSPMU_H__
> >
> > +#include <linux/acpi.h>
> > #include <linux/bitfield.h>
> > #include <linux/cpumask.h>
> > #include <linux/device.h>
> > @@ -222,4 +223,7 @@ int arm_cspmu_impl_register(const struct
> arm_cspmu_impl_match *impl_match);
> > /* Unregister vendor backend. */
> > void arm_cspmu_impl_unregister(const struct arm_cspmu_impl_match
> *impl_match);
> >
> > +/* Get ACPI APMT node. */
> > +struct acpi_apmt_node *arm_cspmu_apmt_node(struct device *dev);
> > +
> > #endif /* __ARM_CSPMU_H__ */
> > --
> > 2.47.0
> >
> >
