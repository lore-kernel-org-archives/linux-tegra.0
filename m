Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949A021C170
	for <linux-tegra@vger.kernel.org>; Wed, 23 Apr 2025 03:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745378135; cv=fail; b=t7iOp7CNJrIBgsVP1x0yBR4TA89ZcgSKqiGFfxQ+btupTOwibi0ON9VH/09YYQ1eQx+moTMADyEGv1fCN+brB1rXt70eChpfArg+dXTpYp+hxGZz1OyuGs9LTA1N43EcDaPR4KBKgJI66xN6cpswCYAyXJ0ud82d5MCBTYzZqdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745378135; c=relaxed/simple;
	bh=6ulIPc6ykEbS04GBbgdOmD/YptM6SbxtF1bIdsqV/cM=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=F8lnC5k0df13E2TeNVuYTkjcg/yHRGiDV2jwqXFosDw3aJKeaAe448gcCceSJ46pQkdwSpvJ/5+6aW5+wR+APwBajQbzQ9biE8YtBhtsLIDKrxEoeg7HIEoPe6ZUNekXCh/SrwQR4GzSKBkao0f+qbq6txpaaqHkqGQSmxUWByk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N2WZdP015214
	for <linux-tegra@vger.kernel.org>; Wed, 23 Apr 2025 03:15:32 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2046.outbound.protection.outlook.com [104.47.70.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 466jh608vj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-tegra@vger.kernel.org>; Wed, 23 Apr 2025 03:15:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jQXkR/Oxu6Kb1rlTZHqSV3NJywPKjhhpPnQDbDhJz2VJm/bqFwApv2fwv0b2qkK+vPbf6NPgx0R8rkdGOVWZE6WzUoyM6hgjuPg7wFYVNga/jxK47xRW8mB+auRx5zLzx8PXvj78lHShFkwja7xna2bZi8GbqdJUet0EeIq/zt+zMuJURdCos6IwDyEKtVdXul89ThEZokL77rzpsz8XMcJDSTxZd/uiHo+gPTAcrOxdoVL/ilj+0m6cni7xthTQx+HM38uRJ5NjOyJuksxCROvnVVZ9zyDvn/XKp5fXgwMi6MZOHtkbYcdyeKXViPsrla7wkZt76JvOW5VHo5RPmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ulIPc6ykEbS04GBbgdOmD/YptM6SbxtF1bIdsqV/cM=;
 b=Wv7ru1mhArA/0aLRxMKV5gpu6jJVUQkXca1WcBu2cXmPMD5B6vYSY7OiJCXC7mtlEp4wZYxyNkG4R1ASqawuS/u90sUj6pu9Oaff5cSAldCp8bHzmB2TvZtHC5yV9rfHQFQ/Yi7vFmUYez8scAiiJLQBphR2EDqrQXZNde0+ijm2ZuanHwQsMGq99duQnNtt7SywgWfeGa5tAy2jdD4qgmpHiCUum0lllwjp4uOKItE+Bjaoh+BqqdMGLQFa0mG9v7M8H/WU6QhQbbeNtgPpeK+EVqnfgC+v2q2JL34FuTWAV/a8i29w8G5R7i/bBok1aFZ7vm59LJWxM6j2PCKvPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8773.namprd11.prod.outlook.com (2603:10b6:610:1cb::13)
 by MW4PR11MB6886.namprd11.prod.outlook.com (2603:10b6:303:224::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 03:15:29 +0000
Received: from CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2]) by CH3PR11MB8773.namprd11.prod.outlook.com
 ([fe80::c241:6bd2:b212:f4b2%4]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 03:15:23 +0000
From: "Li, Meng" <Meng.Li@windriver.com>
To: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: FW: tegra_ivc_check_read() reports -ENOSPC frequently
Thread-Topic: tegra_ivc_check_read() reports -ENOSPC frequently
Thread-Index: Aduz6iytccNxdy+JQbS9V+++1l14xgAE715A
Date: Wed, 23 Apr 2025 03:15:23 +0000
Message-ID:
 <CH3PR11MB8773DA6248911408B64BD2DFF1BA2@CH3PR11MB8773.namprd11.prod.outlook.com>
References:
 <CH3PR11MB8773F6E5A620F2A815AF0FDDF1BA2@CH3PR11MB8773.namprd11.prod.outlook.com>
In-Reply-To:
 <CH3PR11MB8773F6E5A620F2A815AF0FDDF1BA2@CH3PR11MB8773.namprd11.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8773:EE_|MW4PR11MB6886:EE_
x-ms-office365-filtering-correlation-id: 020e3cb9-da28-4a33-adee-08dd82151653
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?IraM5LArrk8XRUw3CQbQarFfh9qRpqasP+qPLQ96o9tp4jmVW0CyRfv9z9?=
 =?iso-8859-1?Q?OW6xsS0YjRmDOblachTvsPXdpBpU40oiNVFnwlakpjBgJ1FHoqjVHx/nyL?=
 =?iso-8859-1?Q?EFETObKrfF/wKul/mIfYTC7ijT2J8oaMTLnEskeqVXFiXAFj2YkM9AxjKM?=
 =?iso-8859-1?Q?Krmer/wp9DST2M+FAgRPwnBEvs2ZtiLHBjUsK8ZpCHnIeZfBBxBRyeTyYq?=
 =?iso-8859-1?Q?a51WKdWdrAzTTzn5FLRSh/jMbexD8DOF4m4XNnNz1MZn2qky9oRBC/MRUX?=
 =?iso-8859-1?Q?Oi4NBKZUUH4k7Bzfo/2MKrej/YcDbempA3bsw1YmYzye5zc0jOyYDp52ok?=
 =?iso-8859-1?Q?Yl1WDt2+h2pohPHyfz2w393UaheLMP0xxGPXNUW9Y5f76Ew1EnqvoHjOrs?=
 =?iso-8859-1?Q?3Uw2iCA2aZlR4AShMJ542R1UPIHCvkqyi6/bFWz1S+NPMUWKYQytamTK7e?=
 =?iso-8859-1?Q?OuC06irp/p/PSajPBVcx6225OcFelYw73KJuGUF0WzI2x+yeUMfmMTLiCu?=
 =?iso-8859-1?Q?PoeB/KcfwM6LZFWMXCQOyVdxPoPx2y/cWL7fjTc18QuxaaPtD96Qk3RHO8?=
 =?iso-8859-1?Q?aMavO63/2dKAhnBZXJkh7Xi0w7Hu8lYcS/r3wGbjAqtP4k05bFRfOzs3EZ?=
 =?iso-8859-1?Q?2EY3/0hwb/kckOSw1sO0Ej9e0wBbcJj3umEBiRcj8h/Mo/rJ50F74L26Yq?=
 =?iso-8859-1?Q?bTx7LMtW6dqxP+Qdo4SehwDuFaMVP+/yxIUKuEH4YXm3JGWnRS1Ny8vDk2?=
 =?iso-8859-1?Q?e9qFga9vQ8mqQGZI4sLTpvymhimFuU3aZf5zIUQjjVEIzjRxNrTR2A5A7t?=
 =?iso-8859-1?Q?X07lZfU2E8fbc/lt9SUuVs/ZXg24eIi5oJ72Ny4XxIN7F6JO3hNOW2HZad?=
 =?iso-8859-1?Q?VC8JmGRDDV1KEtNtVG4lDyIVZclwInHLQzAcV+CcW3zjy3Ho2S6BVlZt9i?=
 =?iso-8859-1?Q?olgFLS2Akg81AyIJ2G+kLE9o1Yf8d4Y+/wdV8ZcJLLQCfDmDfNjNk/c62d?=
 =?iso-8859-1?Q?cT4L9xwXQOYYIIvvy25zC7fj3JuQ8Pm+16vyhUVMK33BLLtmyv98HRCBoo?=
 =?iso-8859-1?Q?pybF4yVYcgPoCRlA98zfFGyupEo5rhsuIYUV2DP4zx/KBCkEzYCSFYVuQO?=
 =?iso-8859-1?Q?Nr2a3MV8j19hp/r2r0KcMIdXXfB3mJqZNUOMKvduHqrKIcJseELCs5b0BC?=
 =?iso-8859-1?Q?7A/E7Fx0wOb+Pk4xmIdx/I4scNMTS263R/Y5blWDKW/erE5Pza3+U1ZFxG?=
 =?iso-8859-1?Q?b+Dxty+EDgUxZQEdoYmdVC5zfpXMWRAmxhfV60GraY6j6SKyZb/4nndOfz?=
 =?iso-8859-1?Q?dsmaVLb+fNK7Gd5Krl9whL6V5MItylPisgxoG5kEczKRKSDyKVZ5iJKg0h?=
 =?iso-8859-1?Q?V1zNGH2A3n3lp7oP5ffkwmzv/F0R8VjdxwnSwKkmXrKjdANOrbmaFpHHb/?=
 =?iso-8859-1?Q?C9igDOa+z3S4u6UvfnBaK2Vl78CZm87o5kWoBDyWRWGOX40DHSAxDPFQsW?=
 =?iso-8859-1?Q?9LkJtS9p+OsTAc3oNBQxL4iJyqPQlRrad5DVUYmIQOfmIR1uWRHdyC2c1s?=
 =?iso-8859-1?Q?cO2qxd0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8773.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?2/Qir6fhv2LUa5ZXuKHxKvrdKYp5167r+z2Mo+5cUSeyPSyE+pSCqGKhVj?=
 =?iso-8859-1?Q?4itOiDzap8FXlruXmp6iUFsrPSPd5BLYr5DMTDLJORv/KiM2IAfZjQGmx6?=
 =?iso-8859-1?Q?FEpTwJqK2Tp2g9+uq64Fal4FuEMNvwih0hGvpUTAqX8O6ed8KXq+ofw58s?=
 =?iso-8859-1?Q?Zr9CTiENg408XgAxU7yQalYPiafayOi3PzCgWQ/Qrzsq0qMLXo7I/Lo6TD?=
 =?iso-8859-1?Q?3YFbonD/w+tXowphSitJpZcq9HInTjXterfJqLV/gTDIZuELy2XCujoOQ3?=
 =?iso-8859-1?Q?vWDg+IBWESvPpJCuup5gwaKUsl2/LnDpV6yd0XF6mKXgb8CWU1bR+gthHi?=
 =?iso-8859-1?Q?Ie6dOkdDCvH0+bFesSgpy7Ky87a4Z0PJcOmlbVyIFiji1dBkjArOY6vKAk?=
 =?iso-8859-1?Q?aVgQ3cm50tztE+WBGr9Tr2DxigBjXmb+tr4IzOxSROcR7sPGjrPTjCcGXA?=
 =?iso-8859-1?Q?CRuFkRo8e7lTdeqcLOKQCSuU5zSs0Rn7RBOg021ht/KXUDdgttzENHK4Il?=
 =?iso-8859-1?Q?PPLUlsOeFWlc54XmFjkxE/hLLBeadTBkaYs6AR/OPCZL8wu9ifGZUmroil?=
 =?iso-8859-1?Q?SUfVbUTWJBiqoIu7o86ijdcV3lYO2yvdVhSnXxSO41EFZaLRhd37Yztm8a?=
 =?iso-8859-1?Q?MLUSQV3wC/atYcb0lobb7wwZEYjws4oED0UZZYQZJxlzGvQxPJOIghjEiU?=
 =?iso-8859-1?Q?W9n/w4i3xHJXhAH7OBWtL7BVWLAwbavztCVf+9qDTnWjNpqwoFaXtQ2aWh?=
 =?iso-8859-1?Q?2sdckrnb/Fvukn/0FS1z2H2AGnX8P1g7hQHGt0GPrrW84JtiN8/Xs38eIc?=
 =?iso-8859-1?Q?ryViVud1uTfVDc0pi+RskBgyrb0hUywOTen3AiyUI42iS1pmEpzU2RP/4z?=
 =?iso-8859-1?Q?QkWRJfIEO3xBkqcteXDgqIevsGsgITpCMP3BNLW8ZADR3uH7sJkDTt8X6n?=
 =?iso-8859-1?Q?OA83UtsrX3rwabBkyHFI6udxa+tyydfd2e1//01+20MNgK6OZVjBZByuWO?=
 =?iso-8859-1?Q?VrYsT1FVzoPCiI9wXVejeshfnI4ntLjlpTfJR5ppbHKrd35oRMxZlMgyn2?=
 =?iso-8859-1?Q?YG1VCNTfRq09vkb4rGBYI1xKM1ibE54xTa7ROLzj7CHOpT+Z7fAydWuFDl?=
 =?iso-8859-1?Q?li+xEYYzlfJh7ooK620ZvhsdLTbuI0sKqgM4Vtlii++zv4NoB5FG6njrSd?=
 =?iso-8859-1?Q?E9b14Dc0sM2HRJ20yPiJDiAVbgXeBpiL6xabdA/EkthUBEexsJ1Go6J62H?=
 =?iso-8859-1?Q?ny/TkBebLPCHRD3+BQAzU7XyxzY7kAg1uObYMqA1yRv7Ttw0D6qCao74dS?=
 =?iso-8859-1?Q?3hg6nPlxwRM/4TWtD7/Umoyu07GXASdFeVit6MTIPkTFbPdLIBS7zTqq8d?=
 =?iso-8859-1?Q?Ze+x2xtg7YyEWPnHXmdvHodwH70Q8VgQQ9UOq393Tglvsl0aO7BBBK5p+0?=
 =?iso-8859-1?Q?KdcI0eZsu6gp6DnLfq9nvn5bVl+Y0dfTm5f0WEGljojDO8i5J/6DQ9EexY?=
 =?iso-8859-1?Q?KP0IVVJpZFXWcN/AuHi0Pm2+UZlosjhBRITC1RYZY3kaLPD5jEa6S/yWCj?=
 =?iso-8859-1?Q?YmTGqzFp1hc0hTHfEQ1qzQm8pzxZPr3yH/WyP4tCjOB97VSpVUeVHskn1F?=
 =?iso-8859-1?Q?VkQwRCEmZZ6IDiE/MqWeS3pLuW2yQqkHln?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8773.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 020e3cb9-da28-4a33-adee-08dd82151653
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2025 03:15:23.6588
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PpskW5pxF2xvTC4g74AX3FqhiZlWS+4cnp7gRGhJchshz13NdiV5g0p/RI/7OycxXVd3m5inyZLaMHzB4sMsqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6886
X-Proofpoint-GUID: LuHsVrRWLPszTdvtk4Yzrn9JZUpiVyDj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDAxOSBTYWx0ZWRfXzqHfBuUNkkPu +LDNHN21NGBaafZ04YDHiZx/Ud8fKIHIhOgAowOvp5GuVzHaOwbfgTUQGnaMR/XgHVmeytaU9RL oX1X96tFJRlJD/NqxYVqAmRwIb/yzbFXTgJPpcGdbfWAn+ZwBwi4/ZshBRr94dWyfWI3lhmbAr5
 DAB+i++rbckYm9sIbDiC7NI81Tdy/Ur9gmEgKTyY/PW5un2yJ2YLwfdUDRaUjoNh7UGgJRHcw6e T4hdYrkJBaC46BSlVRX2h7BCSKMnsjSi4zD9xwibyQXVysvoQF5bsrQQ5A+OPvmtJY4ezg3zpPz A/riD01a5E6mvq8ilZtRhPZYmL+07cWVcKSbu1WXyAL44j1eWidEYDT2OoUKZ1/pwLeDtpcapz3
 cfc4WBgAAvgTniqY4vjXFDoGaYV5BtjUqRxx1gfst2mKhUVTgLM8SFujncJTcsLDkLmmnnhM
X-Authority-Analysis: v=2.4 cv=Lu+Symdc c=1 sm=1 tr=0 ts=68085b54 cx=c_pps a=IwUfk5KXFkOzJxXNjnChew==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=Ikd4Dj_1AAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=QyXUC8HyAAAA:8 a=7CQSdrXTAAAA:8 a=5u2Y5eDtcldtqRTdKaEA:9 a=wPNLvfGTeEIA:10 a=cvBusfyB2V15izCimMoJ:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: LuHsVrRWLPszTdvtk4Yzrn9JZUpiVyDj
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_01,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=749 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504230019



From: Li, Meng=20
Sent: Wednesday, April 23, 2025 11:13 AM
To: thierry.reding@gmail.com; jonathanh@nvidia.com; rafael@kernel.org; dani=
el.lezcano@linaro.org; rui.zhang@intel.com; lukasz.luba@arm.com
Cc: linux-tegra@vger.kernel.org
Subject: tegra_ivc_check_read() reports -ENOSPC frequently

Hi All,

Sorry to disturb everyone, I encountered an issue when starting stable kern=
el v6.12 on Nvidia Orin NX platform.
I built a kernel v6.12 follow the instructions in link https://github.com/O=
E4T/tegra-demo-distro

And then I start the kernel, when I run camera demo, I found out there are =
lots of error as below, but the camera work normally.
tegra-capture-ivc bc00000.rtcpu:ivc-bus:ivccontrol@3: Failed to get next fr=
ame for read
tegra-capture-ivc bc00000.rtcpu:ivc-bus:ivccapture@4: Failed to get next fr=
ame for read
tegra-capture-ivc bc00000.rtcpu:ivc-bus:ivccapture@4: Failed to get next fr=
ame for read
tegra-capture-ivc bc00000.rtcpu:ivc-bus:ivccontrol@3: Failed to get next fr=
ame for read
tegra-capture-ivc bc00000.rtcpu:ivc-bus:ivccontrol@3: Failed to get next fr=
ame for read
tegra-capture-ivc bc00000.rtcpu:ivc-bus:ivccontrol@3: Failed to get next fr=
ame for read
tegra-capture-ivc bc00000.rtcpu:ivc-bus:ivccontrol@3: Failed to get next fr=
ame for read
and then I check the code, and add a debug info in function tegra_ivc_check=
_read().=20
After starting up kernel again, I found out that =A0tegra_ivc_check_read() =
reports -ENOSPC frequently.

Coud you please help to check whether the error is reasonable?

Thanks,
LImeng

