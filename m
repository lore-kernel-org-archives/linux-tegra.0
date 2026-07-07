Received: from mx0b-00823401.pphosted.com (mx0b-00823401.pphosted.com [148.163.152.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA26D30BF6D;
	Tue,  7 Jul 2026 08:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.152.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783412494; cv=fail; b=gjgiJI2PXKzdhwNkb1Ok0r0FflU01ZrJ6EPIsLS8R0qlyJUD422GPGUqPk6kxXVfu/17FHvB8CgeXKb6WOy7flQOll0DMCGRQUhF/h+LYs3Bd55uLzst2MSpDtzQ1cTEQb+W+GRwX9+vTFmND6kCu66kfKH03OFan2KcEqHGjjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783412494; c=relaxed/simple;
	bh=xp0YsBigcBtBTEZ1ZiOkEFKrZ6zGB9xzhWUptCza5m4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NSrNUjY2k6NSUGxqx7v3aa6Fvs5nXK1ptvtw1Ym+6M/UVRmeo5s+AlcVD2Bqepry4IlXpELtAgp0wJjujT/HZaPi6kWATNc3dsVBMoBJvhj0RkTMUpbuOJFYWJXeZ4+1gwhB3m+prEl25z747toVwnB/xf1lRIfMMU8uzcDEb1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=FnIy3vBI; arc=fail smtp.client-ip=148.163.152.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="FnIy3vBI"
Received: from pps.filterd (m0355090.ppops.net [127.0.0.1])
	by m0355090.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6678HJD9218278;
	Tue, 7 Jul 2026 08:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM202306;
	 bh=fvwqe7xTO+CQNt6+1SUYmRiRP74Kx4nHuricpwwEYfk=; b=FnIy3vBIxUXZ
	q4azv/z2s96WftnWJCRsCKvq8xR5Vioxrluj61w6yX/ush/QyK9T95PWBvbK8OZa
	NfWE7CBeQqHAznUQZQQupEOGcIlRe2dOIEL0z4A6nbacHMTAUnM9P7bu1w+XB0KM
	beSzWrQGF9ArcNrnCwBe4v3h0/Z0M1RBizEOpM+szO4lHmTgJGNrmyfmSV+StaCJ
	Dwqd+OqPPYcXLrKzs9KaB1SoAIu4K4n1UcWpnXjzeqQD9mUCIrLyiYpFh0ggV/Gp
	tCZ8k/3RgT4B6uVRqX6gNRIkzwHu+aYlgiTu8C1QGBv2RJwdVX3dvRshCWLAUHee
	o3PfjRskRQ==
Received: from os8pr02cu002.outbound.protection.outlook.com (mail-japanwestazon11012071.outbound.protection.outlook.com [40.107.75.71])
	by m0355090.ppops.net (PPS) with ESMTPS id 4f7dgsuqjw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 08:21:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LK1/UJ0m0Bhs/vLjbXsSQyOP+yd/xIfDJSTWmqbdhumAst2Kf3UdbN5+pbWXg178AF6OcBGPf3xHxDY8KjWu1F0XOFsSp8qAcnyyZ8EWgYbsbYi5LO/6E4hkcnbPCfYkwZzxB8q+MmX7IefRc3WNtceNQGjsWRxJyUfnaLftesy53JPxTwPiRH3ty5wpW81bK4V1M+kZCHtUUQCv/CKQ+lxa7mYXgfuJDX71WSo8khDQoGDl8S9rQC2alwi5XitN7baU7V0wY8ukol7hBQGrlVtDklSq+KeWm8uBi9rdvm/bEk6rLsnUxY+Xdce2KAu/EF6Bu/GTwmRFmJ8XHlRn1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fvwqe7xTO+CQNt6+1SUYmRiRP74Kx4nHuricpwwEYfk=;
 b=aNvQOZS01HcfRnPjmVkbs89IRb0m9JxiwXCoz27vMX2taA7f2OTfmsJq71VvRdGNRUVRnboneHgkiVwCctsnO53Z2r8ezVVqdWCHpAUmmtdEs8WhJoQ02h5R+SZQaivEYu3L5BuPZmddxqpViedQlmqDI6Xcu+MN9wjv/YjKS3iGzySwWdgDP2/GvN33N0FUqy+4Xzx5VfvR9ZhFIHQSkw3SrssZtpVS0x8QWDmvsRRzVLXkIHHf4ciKQF2YqW6cJw1lxImG+/9nhfdZn15uv1wSKWaJQYqgXADVQa7+ux9p1VeLyyD2egLhFtToY0jzbYZMT5G3X8mEh2qVrj9oBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
Received: from JH0PR03MB8637.apcprd03.prod.outlook.com (2603:1096:990:8f::13)
 by KL1PR03MB7257.apcprd03.prod.outlook.com (2603:1096:820:bd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Tue, 7 Jul
 2026 08:21:18 +0000
Received: from JH0PR03MB8637.apcprd03.prod.outlook.com
 ([fe80::699f:723b:4200:763d]) by JH0PR03MB8637.apcprd03.prod.outlook.com
 ([fe80::699f:723b:4200:763d%5]) with mapi id 15.21.0181.009; Tue, 7 Jul 2026
 08:21:17 +0000
From: Jiqi JQ9 Li <lijq9@lenovo.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "mperttunen@nvidia.com" <mperttunen@nvidia.com>,
        "jonathanh@nvidia.com"
	<jonathanh@nvidia.com>,
        "thierry.reding@gmail.com"
	<thierry.reding@gmail.com>,
        "mpearson-lenovo@squebb.ca"
	<mpearson-lenovo@squebb.ca>
Subject: Re: [External] Re: [PATCH 2/2] arm64: tegra: Add Lenovo ThinkEdge
 SE70 device tree
Thread-Topic: [External] Re: [PATCH 2/2] arm64: tegra: Add Lenovo ThinkEdge
 SE70 device tree
Thread-Index:
 AQHdCHFTDOapB3j1yECfkt8Oy1jGYLZW3i4AgAAP9W+AAANNgIAKu3xsgAAQtACAAAHvJQ==
Date: Tue, 7 Jul 2026 08:21:17 +0000
Message-ID:
 <JH0PR03MB863740C0D777A6A97F479F1A83F02@JH0PR03MB8637.apcprd03.prod.outlook.com>
References: <20260630091743.657388-1-lijq9@lenovo.com>
 <20260630091743.657388-3-lijq9@lenovo.com>
 <d7bc7c0a-9f36-4440-b6d0-2e23667659c4@kernel.org>
 <JH0PR03MB8637692033F3AC7486EB397B83F72@JH0PR03MB8637.apcprd03.prod.outlook.com>
 <09d16eec-dc61-4576-b9c0-3471802a584f@kernel.org>
 <JH0PR03MB863781340E5314E374FB486C83F02@JH0PR03MB8637.apcprd03.prod.outlook.com>
 <e4a6d372-20cc-43f2-9299-14099af41181@kernel.org>
In-Reply-To: <e4a6d372-20cc-43f2-9299-14099af41181@kernel.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: JH0PR03MB8637:EE_|KL1PR03MB7257:EE_
x-ms-office365-filtering-correlation-id: 3c138b03-f7a6-4a2f-0aa6-08dedc00b80c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|18002099003|22082099003|4143699003|56012099006|11063799006|38070700021;
x-microsoft-antispam-message-info:
 u5eKD7hTHNI33E0JYh0ub6uE67XBVgWrs/h3o0p0oS+MTa3yBMPdbooeFtPeYnbOSEKggF0Z99GHBN0kEBZcQHxthuqmFG5Ty5ZyPA/PxkTgB9P+BYkojslOBtrYQmhgMPc/DXF4VOgexuK0zx17sOLvmCaSWXaIvQXog1ZEANtUpAgy/PAvQeaYyFIWnCOZrLCwOlT0a9veXO9/gnjyvRPVsV3pZRapvHF52JNtv3HlXFFVQEweqPF4UsINqceTfvpgXsrAMeNiI6doOC/XSLLqQDJDQVV8BlM2pYZYNqYix3P++3iuBS6xJmmkiuXTdoRHcXFmbeJ6fnCTE4Ii1ddVlzpOYKpmtPLvYlYNd9D1HSDUyeesgMKIawOpXa5qVJ23NBj2gy7mgSW3/oxNIVKsIMD5dTT0CDtDugg/GR3VHGpsCFJQD0MZR800knsJDYJe23f0bOcdodLf1aEjj5yrmu3PuZaFel9U/OfmyaIR4yg4xuFfuyVV75ZC2Ru1fmdrImjVahLRcDFIk9v5suBwIzCbZwJapl5uXOsu4GcZ5Dg1opHQKGoAPsv+1+VGtwul0kp2amTiOSiWpVAj2UwMhh6vEZ4kTQ+0nMkscUyE5EMhYZks3RlTnGLIjnkC1j7iPJ70SCAgdofasg2mUULqMMu0hLaleE2LyrZ8EBfItSXKabbhNyGPKk8Ha1DX+x8Ep39Dqd1+fXtP2daRDlNN94o+a2Yd7K3xf6Xbzwg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB8637.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?DbC30jL+upbbOPl/AoG7FKKDaq+5ptOn9pzIJUC1/msf5i542E+ovAnA?=
 =?Windows-1252?Q?DQy82ObpSZXbNN6a3270Job/ima9kYUzIABC1fWfhHxmvjtZwfYP4Q+9?=
 =?Windows-1252?Q?8QjnleEXHfP5RN4UqEGRZ/eql8cSirgDYJfAYfKw8AGXQKYYCGsnO32r?=
 =?Windows-1252?Q?Q74nvRg38qW7MmBh+pQZouifu+MRQ3C18x5ikYfOxJ3vru6OjErK5g2g?=
 =?Windows-1252?Q?z4NegvaXI7NMMyipHQWbPYfQR3QzJKY5GlOO7ag4noXaqxsiSTDUeKNh?=
 =?Windows-1252?Q?7jgalS+MvwcBzMyvURJ4cLhGz9lL4qycTgg4Xb7oKgXyUHRVbbk7ZSqi?=
 =?Windows-1252?Q?jpnao1DR6D7fllmrDWiCiYI32Li/9P246uDKc6xJ2oP+Lqb0oW8kW3aK?=
 =?Windows-1252?Q?fjOllwirJvWKP8OKKAYf7mrsOgwKbnxVzBzYiT7t7gMslaydfTzw8sBm?=
 =?Windows-1252?Q?L0EWovStRgu7V5nyx36AUcYCc1U8PoI5vGQfCFDMFik71AuhIrwcmAO7?=
 =?Windows-1252?Q?q+VF4k0IkDLfD2elTFMazkXkKfBAkT+CUmBP+YOYcsVeadOV6q2wL2jx?=
 =?Windows-1252?Q?6Wgr9g9HppMP86y9HC3XQmMrR+jKGKHjRWL9WEFJ/ixsqkodxvv8Cw2c?=
 =?Windows-1252?Q?gJWIzdZ0JUWBE9+HxXk82afNNfqQDojz4cQ4Aeh7t0OGGfixQtJHR4tv?=
 =?Windows-1252?Q?9TchckiXm5IBaVEJ0KICrjKhKBrE6nYDhE2CKEb0ZFgrr3CtssI8M5Ks?=
 =?Windows-1252?Q?Cm0RoIEYn81izG0ZufmLHH/mW5jmrNHwnBI8sV5e27qOZp8ofGqFvtCW?=
 =?Windows-1252?Q?bNsiQwZvXg3KTzYALR7dFnw/36Ltc+a8TOpNQhjDZpwB2qrT7ygzUF0b?=
 =?Windows-1252?Q?/wLTeGLqLmn3Dwqj5YvzBrXGlYPc3MqrADYEfVqUFJuH3Iq61PbsyEgm?=
 =?Windows-1252?Q?B+nKJh/cPdlfrv3Pg4uZwv+to/bFn205QmBlnyPkV4WiJTPQQt/xsqYC?=
 =?Windows-1252?Q?5Zi185Vp/EsjkV04WacuY73zBeWtkR4ove+1OiTphRbVXM5Sf4C5HU40?=
 =?Windows-1252?Q?efJOT7TD1tS/bUTdE16lG8UChtk82U4gMw9ETo7h2ijwqNJWS9PG/7WZ?=
 =?Windows-1252?Q?3EK0MhlCuixKYPiZu9ejMMGx3B5msHv8o2lRladfijwtqkAx1HUoo20f?=
 =?Windows-1252?Q?6o2l8kFdeqgSdoH3U5yIz13ZkOJuYM4SlS5qTXA/Y/9M+NG/CPG8eU8h?=
 =?Windows-1252?Q?rBoq9gU8NpKZx5w9Jp762Ig2pfG21Bxe+6NkT+JQgMdF7m72rkT6kAvO?=
 =?Windows-1252?Q?pueUdQoXBy1Y7nhz6omtuQlV+NdJWb519vx/DFNmVeXWVoCJTzOENtdH?=
 =?Windows-1252?Q?i/GBNRPi1KLkvLd2x/BGMJTLHZgmdxGH38vL9XN0Ke2v9Se//5DwW558?=
 =?Windows-1252?Q?uXhDivE+ei8NYoI28XgO59PPIC6sovkPjs6pvDgNA+CJgg6p2sq720gj?=
 =?Windows-1252?Q?sS3/oLUhU/eVeUUVeP80HHrbaIXPf0hGCiSw6/Z/Ja9VWTc6IGVjXs+k?=
 =?Windows-1252?Q?YVP0bRr//P67Fn7eWV9Em1AnysFx9WXYhjLDAgKFrLCr9E79uKqGaPSY?=
 =?Windows-1252?Q?mkmsABlQ4BqAzv4Qm2AvtPlb+snuHTstJs9tpTjqykJRqQvFhcXDO1ve?=
 =?Windows-1252?Q?bwTQ6gQOnPo9MnNqOuA+WRL7M1xPdlTrsIkJ22uxl3jh9Un3ZGFcS5CZ?=
 =?Windows-1252?Q?ZIkbHytaBKItQyRghNfjJzjpMLZz3qzVCm4P+B2LqEhUbRkhka3rz3vM?=
 =?Windows-1252?Q?GRKoEVESi1R4D0tkDEifcfPedaGIuJLI1KmoegG0eEtK3yBK?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	Y8B22zoR462hg9FxhGzyohfe/eOpgb4zMILoPpqR4Pk/hxR2u/1eY4D8MmAhEQwfe94K9H+0zcMzs/CpT1DHs6ufxvAMX7CKzMCLxNwbbkKsrKfPK7MWRXc6qvYgDi0xP+/+UTlpt2H59T5X2k8+wPssdMhTzRG7rJNsKKjhDjexbX5VcLdl3lAKKYXLWoStFY/jRHJiiPgQtKOLToCX/npTxTMBAAdzYVfUmOIc0/kO/5OuLTG0Y2F/Co6zQsbLZIjYbef+BHO/9k6irDQfI0Bsn+1acGq4gF8IKRPRvFlCSYW832pZ+5orQeFu0xbHb1x4V3d9GlnUTAQa2Bt52g==
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB8637.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c138b03-f7a6-4a2f-0aa6-08dedc00b80c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2026 08:21:17.9004
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GbPnaCaZ0gqOqKHoFY3JHmynDb3lbKXDSsxe5vkEBvR9+QighHym04kKSRUT4XGuUPmf0HB3E8/4jg26MZzB+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7257
X-Proofpoint-ORIG-GUID: suO9E5hvfEF8mNmUL6CsnhbmP90TDr9w
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4MCBTYWx0ZWRfX+7zMPcR/aHn2
 LA01fqQKdiUZMsP5c/tklwo9DBSvSZSUl8NbFnWxFkJDYFiNL2glQOtaLHUOXXOyZgCFSULWeq8
 Yvm5yrxvvvLUUOsGT3zLFtx8mYy4akw=
X-Proofpoint-GUID: suO9E5hvfEF8mNmUL6CsnhbmP90TDr9w
X-Authority-Analysis: v=2.4 cv=POw/P/qC c=1 sm=1 tr=0 ts=6a4cb701 cx=c_pps
 a=Qd7uyCs4ZF2uytgJbzLnAQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=N659UExz7-8A:10
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=ZyEuT479hi48zPIlagN0:22 a=voM4FWlXAAAA:8 a=EblUQcRG95dV1stFUOAA:9
 a=pILNOxqGKmIA:10 a=zY0JdQc1-4EAyPf5TuXT:22 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4MCBTYWx0ZWRfX4voPKF+CcnI5
 FlVk4fqr25z/4uffNlNXYS/wSWYxSY68CQ16n9QC/tu/tDhcktsO0r9WDFyNMEO66OqQOQ9LMIy
 t5Ok4enfzzTEiZOy/PCVABUuDmFhwnG+yk87aJoGpoyO2in/UoUAn5aYzmM/sYO47kmWqvgLgJT
 3p4RRT4n9grtILNCYFs17SjmGFapMOvYGFbFuAkCr/LMsR/DFUZkwBLkSdbLApdGuBvJBOUpzPK
 4p6qIT7jIcSXUTN2oFTRfOQFgFhzWn4WyUPl8vfto9FBB3VlFWuR2wKBnPBf932+Z1kfBZM/YWV
 AlW1P4Gue+rxM0n5MI1P1aARf6Jth6TdPgXFcPWp/Jwzfn0EEVHcjh+ihVM6oru/lneNMMeKwkU
 8n4jK5siAPX0IvR7AW9ca6lwv8Pe1Eo/Ax+yyy45pYqy9CghQKKnUgIr2BfIxbPkAcq4/lRVNxa
 7V0HjBPwb9fB+6rF2AQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=-20
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070080

>>>>>=0A=
>>>>> Why do you need bootargs? stdout property does not work?=0A=
>>>>>=0A=
>>>>> Best regards,=0A=
>>>>> Krzysztof=0A=
>>>>=0A=
>>>> Regarding bootargs =96 I checked tegra194-p3668.dtsi (which=0A=
>>>> is included by tegra194-p3668-0001.dtsi) and it already=0A=
>>>> defines the chosen node. Following the NVIDIA reference=0A=
>>>> (e.g., tegra194-p2888.dtsi), I'll define it in the main DTS:=0A=
>>>>=0A=
>>>> chosen {=0A=
>>>>     bootargs =3D "console=3DttyTCU0,115200";=0A=
>>>>     stdout-path =3D "serial0:115200n8";=0A=
>>>=0A=
>>> No, you only need stdout-path. Drop the bootargs.=0A=
>>>=0A=
>>>> };=0A=
>>>>=0A=
>>>> This ensures compatibility while aligning with the existing=0A=
>>>> Tegra device tree convention.=0A=
>>>=0A=
>>> There is no such thing as compatibility with convention.=0A=
>>>=0A=
>>> Every modern upstream DTS uses stdout-path, not bootargs.=0A=
>>>=0A=
>>> Best regards,=0A=
>>> Krzysztof=0A=
>>=0A=
>> Hi Krzysztof,=0A=
>>=0A=
>> Just a gentle ping on this series. The v3 patches were applied to the=0A=
>> CI baseline last week and have been waiting for review.=0A=
>>=0A=
>=0A=
>You received comments here, implement them please.=0A=
>=0A=
>Best regards,=0A=
>Krzysztof=0A=
=0A=
Hi Krzysztof,=0A=
=0A=
Thank you for your quick reply.=0A=
=0A=
I just wanted to follow up and confirm that the v3 series is now=0A=
available on Patchwork and has passed the automated Sashiko AI review.=0A=
=0A=
You can see the series here:=0A=
https://patchwork.ozlabs.org/project/linux-tegra/list/?series=3D511518=0A=
=0A=
As requested, the key changes from v2 version you reviewed are:=0A=
1. The baseboard DTSI content has been merged into the main DTS file.=0A=
2. The bootargs property has been removed from the chosen node; only=0A=
   stdout-path is used.=0A=
=0A=
Could you please take another look when you have a moment? =0A=
=0A=
Best regards,=0A=
Jiqi Li=
