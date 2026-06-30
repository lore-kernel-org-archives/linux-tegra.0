Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C00A405C57;
	Tue, 30 Jun 2026 11:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.148.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782818261; cv=fail; b=Dz3s684zNNBXnw9hbdrFyI75IPCvdslQ6MKfPOGJ81iWFOlroGt3jn9qZXE0+AMY4JTyDhuTqRVS0054qvuF7SskZIOX/Rowh+tWP8KBabhAL4A4DF/a9LZ7TotdGL6WM6c6Gm1LNQOmRgg9LCrVSLY7iOe9R9mgJqF0gRu5PsA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782818261; c=relaxed/simple;
	bh=fBu8FI0nVgFyU5ZxJd1h+TBLlHV2S2JMCUjyKd3LuIk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TeaDrhNqkCQP9iEMaYFL6BpE+NtH8XIPnkHdbeTqV+uJIPis1YKlsI7CuLLIE5uyBZ11Lx9bepiJeJPtTqGzGQee80IS6ZvlafOuqeU6he9kvM73ho2wsy7B77U1TwmS77kFLMQucZOZbCmRKTXMwkEbxZPey+EnnjdS/Hx6dxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=YPCNOrp4; arc=fail smtp.client-ip=148.163.148.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="YPCNOrp4"
Received: from pps.filterd (m0355086.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9kYnt3697693;
	Tue, 30 Jun 2026 11:17:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM202306;
	 bh=dwiBxxAmtMxuWxLdHposZcbOXtnYjPJNGszDxd8DRnc=; b=YPCNOrp4STRb
	jovbSkNHpvCb+PyFxeqzRn+fZ7Hz3sjhnFDpl3Gb8IHOhLlh5N+cFJr3f6Ri6VNd
	/P0zQyFUBVAbH6VOQ1Vy/sZshiNpU5XHdK4953BhZAd4x+Fuaab3ADnSehLzzZ3K
	tVw/BvyNdD0W0ozoQ2icfIgj0Fgx7ISB8xTY98otc1nqw7IYkq2z6hCb4I6PK1zL
	gpr7L6kBjjqBygCfhJ866RJEmaTJbngFXtcg7qZCwwWwF8KgPKhjJbm45VQz/UhN
	whPW2wC25D99r9ogv+ZglZsPt65ghPq7lGmoTxgs9ZWi8xcNc93jiJ8uSU9Q7G7/
	KQL8rOXN5A==
Received: from os8pr02cu002.outbound.protection.outlook.com (mail-japanwestazon11012041.outbound.protection.outlook.com [40.107.75.41])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 4f2v9fv33y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 11:17:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=njUYIeoFZ+hlq+G7dq9jQpDJmbLefwCUOLW3i2mlZ/ZeU/krv6eYOpO5raQGDCSNjHydFqYktZJ7wjBVgIGan8Ae9ICU/66aaP+kAOiTAk0j+Wm1mWxDf+xFi3PvaNrVAlY98Ti3RtBNhy0KgiGQp7cxr2e8X8/j93hvpHkoB6xPOrfSUKn53JIXgBPbdAd8NmH0Mr3XyJmOZLi1vTsGkAXuVyCJ+HPFAK7Ud7ldESXO76VU+9cJ/M5oVzMOja8BaBKxBPUlx8KxWuBNSKjq7Hxh6L4AXhTcDhslPMxG0nwTRcaPwk2Be2CE5f+4fvSqySWvsylWqvVjTcYRn+NLRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dwiBxxAmtMxuWxLdHposZcbOXtnYjPJNGszDxd8DRnc=;
 b=Mqf4z0Sa7LHzRSF9WOONkAyoPrQlRrwYuw/ud0c1OYp5jnucKRiqqFL61J220N2jFhYdshP6iZWOq5azvKyKGrHnB/ZnsRz4bDwEQeQrWQjpBj4aqyPZQ8YkwWCtQn6jJV8m6+ytUqaP8LvTgefIZD750dneRZ9TgtaW3tpX89RmqRTjpgaE08lpBvgC+15opJWwv/8rXzNr0at++ONvvlPoRLTssHSmJN0D340fxAVX8osrH5YygehsZqRlDE9UwdbL6C94ns3Gxwmibj4S4ST74XFjBD13MfENbM/JJDexdE4qncllEw0cll3iaJLwFlZb/fY5YGlGREAysaa5+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
Received: from JH0PR03MB8637.apcprd03.prod.outlook.com (2603:1096:990:8f::13)
 by SEZPR03MB10281.apcprd03.prod.outlook.com (2603:1096:101:339::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 11:17:31 +0000
Received: from JH0PR03MB8637.apcprd03.prod.outlook.com
 ([fe80::699f:723b:4200:763d]) by JH0PR03MB8637.apcprd03.prod.outlook.com
 ([fe80::699f:723b:4200:763d%5]) with mapi id 15.21.0181.008; Tue, 30 Jun 2026
 11:17:31 +0000
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
Thread-Index: AQHdCHFTDOapB3j1yECfkt8Oy1jGYLZW3i4AgAAP9W+AAANNgIAAAPWo
Date: Tue, 30 Jun 2026 11:17:31 +0000
Message-ID:
 <JH0PR03MB8637543B5B3BD38C5E06E0A383F72@JH0PR03MB8637.apcprd03.prod.outlook.com>
References: <20260630091743.657388-1-lijq9@lenovo.com>
 <20260630091743.657388-3-lijq9@lenovo.com>
 <d7bc7c0a-9f36-4440-b6d0-2e23667659c4@kernel.org>
 <JH0PR03MB8637692033F3AC7486EB397B83F72@JH0PR03MB8637.apcprd03.prod.outlook.com>
 <09d16eec-dc61-4576-b9c0-3471802a584f@kernel.org>
In-Reply-To: <09d16eec-dc61-4576-b9c0-3471802a584f@kernel.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: JH0PR03MB8637:EE_|SEZPR03MB10281:EE_
x-ms-office365-filtering-correlation-id: 963fb96e-0c67-409a-1649-08ded6992dae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|23010399003|38070700021|4143699003|56012099006|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 5pxfwT0nrS0nDBSlEdUS1D02JlIL9Vnx+dsRqFymo3WK+42F+4BR3yFrlQSEHiYp4WiFDKQGlnvvcsBv8ksn5xSJiA1zAy2A3zTEYJBJ4GmYalD/H3KV1SDcf73k+ya+x4bbThbyQvbVf1O4ugjWLTDU0NZ5RQxK8KhjxEMKEz7+HMVal7O/Y8Ip46VbU6lvmiodkFHNAON8tjYEaFUzXcSaqFeU215+HNZe8C3OxNRCsSSTNIKVtHKPbSdtenTxBlZzfEPzHdYiRCMTVLg1axKNHgydD34UUH/V4LdB12f8HOW41RV29gG8ufkay7PSriEUwFIETsLt/bwls/5kaZyhsQL2UgMi+hCcBMMyVj2h5Au/3SCJ3rpKnm1/aLd//ZLQaSxiAFnGVCDS7hc44DtnfT8UAforRVRrPwnbuHEOnVtfYnr4RmxcCmryx+uDXP4u5dZ874GRrCoDRD1QqKMJ1vcU9UdjZ2ZYsE1waivSr9HTuChvN6dptIm52ghflLffvNdcp4sG3hxiRzO+baEAAEnhMMWw+/ACbfzTF9TLFB9OI3E1E09zmFrCIcBiI83lI2KV2wOdQAWXB4nmkf/mQt/lOluVseFP+DR7joQCEkvKu00pIot6OOIvydO8y2yu5wJH1ntVSlEht0405LOx+G2jDGzlpNQSZfqeMCFothgAZLQGbgYpETOrSA4t4ktwrj5WGrWPU6h+WocwkuTYaCaCNgQLTqXWSJnGJf4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB8637.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(38070700021)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?fpCZi6579onaLIzDDsB2sgoT+egkSD1UwEb+T+c8LV8sGZxKjXmcfKn6?=
 =?Windows-1252?Q?6Y9doUsFeObYGlx434Yqo5gyzYgxnvew8Q5Fky6S4O2XWNwA/N2kK0ah?=
 =?Windows-1252?Q?opzuO9OJlasLGUenbuF76rbzVSsiQfF4/P+0qHEnK8BpqBPH6IooFhzl?=
 =?Windows-1252?Q?5N3BwaYtz+ryb9AwbJqOzYZ31XvV41q7YS+dEdgvPH541syWQcBvNR67?=
 =?Windows-1252?Q?FS9Xi5wG9epEdi/YaMKBZRvxUwkaG02pwEezhUY/F/nlG+mAzbTUeRpl?=
 =?Windows-1252?Q?cXtElElm3uIeVD4Eo5TPr71snG9CWdIB+6LrWbSjU/e1MaOTIT4NjDoO?=
 =?Windows-1252?Q?jVIYgVwOOos4ttJKiTmVrXAcVUJ0KeT5Y5TqX/fqynheeyRNfrz61cg1?=
 =?Windows-1252?Q?GfwO/GzchGT/Rt83y0KajwYgavLlX8tx1CQkOwIuYlleFBrqGgnligUJ?=
 =?Windows-1252?Q?QJ5NpleeMfAyaecQzau4ThWVNbkE5BRLO3GnNdgIczEEvbq+U7m1zZr1?=
 =?Windows-1252?Q?gNzIY2/W3pUeDGYQ2P9Q3svlzMAfJ2hb49mrVA6awSKoahnC+TC2hiuH?=
 =?Windows-1252?Q?FqJEYT4H9UeQ8b729rgIwFw1KFpewyE7z/GtD5k8on8Wm440BPQVMi8N?=
 =?Windows-1252?Q?DJS0eAYKoyWaFN1+29as06R4V6FsURHsopdEU60BgeMFf55hYHQT7KtV?=
 =?Windows-1252?Q?QnDzkxoErQ6w1JOQS48erAKUrx8f10/2CG16aVIlVaRIBk351f7X0UrQ?=
 =?Windows-1252?Q?yRyHD1eCM/k+M6HjATX3JT0QRSti6zWpQRdUrre/9KE6ZkCdm+4jhLpa?=
 =?Windows-1252?Q?jNBKPOna4FvTjjnw/kyNU39m2Up62WWSccS4CcOOY+/pG2jfZdbzpF+d?=
 =?Windows-1252?Q?0vvRzXfNFHCppYz9pxxRlLn1Uqb65PEMFhUc273GyZpabo7ZRercDqrL?=
 =?Windows-1252?Q?JjM78CD5l65NVXpKAVmAcWOFrDJ5S1VoJmso+vXURcqUeftBy6o4VbRj?=
 =?Windows-1252?Q?Ly/ynXPL6SSLC7XoWvlDXHpBZkVed7pKwLJSL7U5aC6HMpM7xz4kkKA/?=
 =?Windows-1252?Q?ThvThvLQKO0fPwJ/GdaDxXiu3SZDAU3dat3uaVHV/g1023cUV6VqY1Xv?=
 =?Windows-1252?Q?aXylL18b4J0lPP3M4B7VVzyj2WwEK7SMkEhk9G3GpvtyI3ThEvEgT6Qy?=
 =?Windows-1252?Q?47tCkxlYuoCAeBvMmn+UUoP8xWZ/1HDSnBO4knYslv0stzzQ1iKTY6le?=
 =?Windows-1252?Q?aVe9AH/3LppJrCDW7Knb4OuhIEHQxo3Rhal6qmKASOIKca0qEWPMx2Qt?=
 =?Windows-1252?Q?qAlu9+Vg+nGA/dm1/6Uixqs3kJBqhZoD8MrR2hctKJCUAzkQY6T9AK+H?=
 =?Windows-1252?Q?Vzx436Dx1tDHvRK1KMjUYXIasRJfMUSeswEVFs+4v63rzpQ2OlP/QgY4?=
 =?Windows-1252?Q?6c2Ak1a+GE8S9rQFta9uLmwlKjC68LkxgMIxm3fApE2AXCfXtqZeurci?=
 =?Windows-1252?Q?auJa3Ziy2IGiEe9NZLdVx+IWmADMJRSoKabY3tJIXF1p0F+NEFJrf6v8?=
 =?Windows-1252?Q?i1/TBFhi4a2vDTs6EBKcXXWSMPxkGgV+t2DQNv0CLpTFXx/3AEr+mfij?=
 =?Windows-1252?Q?dZo/ETAeGDvvr53T8To5ZWGHefQrZXIvRzO1DbhPOu7EDZw6KAPOHMhu?=
 =?Windows-1252?Q?/KfM54OIORmG+iI/c2eWcPHeBAdRBo7SMHBZBAun29aOa+b3TA83xBHE?=
 =?Windows-1252?Q?+5vH0QkgxvDrK78oAK3ZBDYByPnhu5zvsmgcYM5ApnSqNPsFzbrjDn/f?=
 =?Windows-1252?Q?aAHE0CfLH28qv4Dob+zQH2UWWV0bUPHyM4MeE2u6zLpIzVku?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	IDMC3BTP6Pgu3ZTeSUoeh/kq4z85mhNG64I7EHY0umZDEOYQjM8aZvZFYQHN9yxc0stGjinaOG272XAvtV8vS7Ee7215MCFTPHo4YE1yXXIRUhQhyOpoP2UgQhnY1c0N1Gal9fmGtlenpzhkpuTWQ3gsYNAJeWZwze1XvJPdK6hGY8xzyHNrHf6DOPxVdds+4eg7KYjjxomrorocLjT1fSSrXbQdfEJabjlaUlQ/xab5s4h0Cn+wBODYOYaUiV5ipEYcXP+W2zg1+LjREwMYA3lSy3MWwVT59sa1EqVBrqUHnTyX5qEKDiCMWld9Zeo4B/EnPPRS6HvyfMoXR2Z6rg==
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB8637.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 963fb96e-0c67-409a-1649-08ded6992dae
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2026 11:17:31.7654
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VkJ4wx1bGkhMgLAa36TVrUNKB7GE6W1b0Pndk7cgxrk/pwOoxiMeeoAUioqHBJoPOZgRjaYlbS9HPZRFRaMELQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB10281
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEwMyBTYWx0ZWRfXxWYpYi8pL79y
 TpNZ2RuePvnCUMd//XPFDxYYEHxsjJy+q/PB288rzP1YV8aS2GEdGz1ffeoNK6+KAyn8gynilFR
 3r46qJQYOjIoZK6Wqh9t3qoS8LWufq0=
X-Authority-Analysis: v=2.4 cv=W6oIkxWk c=1 sm=1 tr=0 ts=6a43a5ce cx=c_pps
 a=savoUK9sGRPjy6QWpdpojw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=N659UExz7-8A:10
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=hJVLCblJc-VYA0_z04R5:22 a=4otBVI19bc_Wzkg2UoEA:9 a=pILNOxqGKmIA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEwMyBTYWx0ZWRfX7DDVshhPYg7j
 1InqHgXfci9h0P3qQX1oGxaUtF+K8HsfikuhHDnuR0pZ2UpQCkg5OCNu/v1g9NsM7Yi3MzPned+
 LrR6oMv1w3hxXB0G8ECSfN4xWG2/Qngei89OqAp8qWDyvZcUc7zaDDgGugXQgRZbOQdV+BVdPqV
 V9RUjHvYEc/BR3GjG1slCuFJiV29CtcpZt37FNExt+IORnINNsTbPDXdJtnx8G2uyk8C4nDw+bE
 WBS6XWp9B4nBD8rzAyqANL785zFfDabEoptFrwKcjUP7OezLWaYOVEJcxYCARUQpy4WDmsVvfUW
 8/fBy2ZrNbjUdGVPywAHEJ7MKLBNv3WkWQQ7HrYqY5kSxlPKgFBPgtQl1fb8/JyAXnvUX+hWKxI
 oXqEjjrxU29EUEljs80sEChOa1H+G1QXmfEkhGnkcokFmbG3rBy99lZ5uH5X3LSifPij9+lqV6e
 xR2CE1dOSdKWjmJHw+w==
X-Proofpoint-GUID: XZrgw_93a41w2IRXCpjDGl6VB97BgCka
X-Proofpoint-ORIG-GUID: XZrgw_93a41w2IRXCpjDGl6VB97BgCka
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=-20 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300103

>>>=0A=
>>> Why do you need bootargs? stdout property does not work?=0A=
>>>=0A=
>>> Best regards,=0A=
>>> Krzysztof=0A=
>>=0A=
>> Regarding bootargs =96 I checked tegra194-p3668.dtsi (which=0A=
>> is included by tegra194-p3668-0001.dtsi) and it already=0A=
>> defines the chosen node. Following the NVIDIA reference=0A=
>> (e.g., tegra194-p2888.dtsi), I'll define it in the main DTS:=0A=
>>=0A=
>> chosen {=0A=
>>     bootargs =3D "console=3DttyTCU0,115200";=0A=
>>     stdout-path =3D "serial0:115200n8";=0A=
=0A=
>No, you only need stdout-path. Drop the bootargs.=0A=
>=0A=
>> };=0A=
>>=0A=
>> This ensures compatibility while aligning with the existing=0A=
>> Tegra device tree convention.=0A=
>=0A=
>There is no such thing as compatibility with convention.=0A=
>=0A=
>Every modern upstream DTS uses stdout-path, not bootargs.=0A=
>=0A=
>Best regards,=0A=
>Krzysztof=0A=
=0A=
Hi Krzysztof,=0A=
=0A=
Thank you for the clarification.=0A=
I'll drop bootargs and only use stdout-path in v3:=0A=
=0A=
chosen {=0A=
    stdout-path =3D "serial0:115200n8";=0A=
};=0A=
=0A=
I'll send v3 with this change along with merging the baseboard=0A=
content into the main DTS.=0A=
=0A=
Best regards,=0A=
Jiqi Li=0A=
