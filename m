Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275F73B6C19;
	Tue,  7 Jul 2026 07:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.148.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783408425; cv=fail; b=TH2SQPMrbVlLe/3aUjlKRlN+qOWC2ECwt3yf69tkQawl/QsCimq6utuGTeZhidTSjuwdY4PdgQLiQYo8ohKpm+pEy2pXFHz6QtYL5vQTDNKW2Jx0ymKosb5veEh3twpaJHj3LYR6Xm1Xn+lEf1zMi3r2XRIlYz15l2c6E93HksQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783408425; c=relaxed/simple;
	bh=Vp29cHDdKV4pCLCpsn3no4Hv5C6mlC70JrdxrC+KR1U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tiCQuCNC9JbB2xMzLY3H2pvgOb4OUo6BIsWNuRZvdlFr8vuCUZ8U5ZWv8NXsoDwqTMpo2ogHlx8i5YPfffHdXVLOCM29YDgBRpPandYqJYsuyCp7cjk/DVzzBMEPa7pIzyO1+rejeGtTqy+q1gL8aZx8GmR9V8Ds58elp/Zfh5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=4NqbaumV; arc=fail smtp.client-ip=148.163.148.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="4NqbaumV"
Received: from pps.filterd (m0355086.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748avx3764768;
	Tue, 7 Jul 2026 07:13:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM202306;
	 bh=Hx2zWVNbagiMauZ4xfP+qkh5ZQLgjHcM4LCir5kpa6c=; b=4NqbaumVZawc
	98/6UW/gXKfiEyj0RrgQe6bQ7bnuhQS8iaW2DAULR6oJ9vFC1jElAVeYjANvoEeu
	PSZkEzyuvgosJ8rKXaeQ94+W4I3P0E+pbFwmSmZF0C82orlvWf+9qMsAnQd7YjMo
	3IUaOKoDufxJhXWnzUOw3PHkgVuYLtpl+pmPbnVX0ndAM5wrKK/8JfLfbeV6hKyF
	/dd0nWJoCGv83TAYtHM/auBwqqaPs58tI4rBBF2gHdnQe7ZR9/XtX2pBvCXrj88V
	gRywhgFYJQ3pg2N8gFvajNOXVva1MORzGZEaXzykLBXAZUxH94GRBJGwraLRudhG
	fhWaVFlB4g==
Received: from seypr02cu001.outbound.protection.outlook.com (mail-koreacentralazon11013025.outbound.protection.outlook.com [40.107.44.25])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 4f7fxgu8fp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 07:13:25 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RVK7yKW9Rhudn37I55NeiWWPj78/YXqzhUjWMLZULjjfxEvxNlw0ltMsCK5mrjB99ipu/Oj7zheYmRRVov6pFgOJ7X1dpDZNRvuEFN488v2KtTOtt5pdIMM9DZ98gFbFtTfJZAVJIFsnZ3e4tibGKotWp9pR+FLOz7cHCBgNXG6DCTzelvc7hJ1ktHYJG9m9QFvcNRkSMWg74IKH6394DTxqA6vcH1P0QFwoidT9E0+SzJYCBr4yyqx5icVwzCb8guRa4DIwF6KwhOS1mJ57HrpDI54dXb99BNGY9mCWdpffvrG1ODKj95lu5G0X199Vlf1z3QTr4clOeuMCqzUN+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hx2zWVNbagiMauZ4xfP+qkh5ZQLgjHcM4LCir5kpa6c=;
 b=XeY9GvF1kr2+KmaEPdv21cctCzU/OaocwQ/96WOq4eU9zhDVouqw6q0A0JGJQQpOnXK77f4jNZm40PzqyEbLReuWsX1Zn2qp50cbsqnx7/UcurvUSmn/dSyVH0DH1njCYy5MD+iCawIiq80vhpIiMAS13kXqwWSe0EvyDM+qX++PBVkszYZyYBWG+OecVuymZevxxqpSKT1TtJyGOtjj3ftz/RAJe8heetnc5ZEMp1iIHUCnPLEJDZW+NEtML5GzaJhp2LBAuPuowUkkwrbtabRU9TONRa7+miizlez9tpUYO5cklxJCJgTYWncOkOYbxCW6g4radVGeKd4/ZM+LPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
Received: from JH0PR03MB8637.apcprd03.prod.outlook.com (2603:1096:990:8f::13)
 by PS1PPFC298ECED6.apcprd03.prod.outlook.com (2603:1096:308::2e7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Tue, 7 Jul
 2026 07:13:22 +0000
Received: from JH0PR03MB8637.apcprd03.prod.outlook.com
 ([fe80::699f:723b:4200:763d]) by JH0PR03MB8637.apcprd03.prod.outlook.com
 ([fe80::699f:723b:4200:763d%5]) with mapi id 15.21.0181.009; Tue, 7 Jul 2026
 07:13:22 +0000
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
Thread-Index: AQHdCHFTDOapB3j1yECfkt8Oy1jGYLZW3i4AgAAP9W+AAANNgIAKu3xs
Date: Tue, 7 Jul 2026 07:13:21 +0000
Message-ID:
 <JH0PR03MB863781340E5314E374FB486C83F02@JH0PR03MB8637.apcprd03.prod.outlook.com>
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
x-ms-traffictypediagnostic: JH0PR03MB8637:EE_|PS1PPFC298ECED6:EE_
x-ms-office365-filtering-correlation-id: 4cb3f1d8-feaa-4755-3834-08dedbf73a9f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|7416014|366016|1800799024|38070700021|18002099003|4143699003|11063799006|56012099006|22082099003;
x-microsoft-antispam-message-info:
 vKt9LflrKRvBpF3k0EqS3SV9nho35somGlsfBHY1+bnCzqxBJUAJ6cm3gEvg0b4krwAyaKW8wEQZmyQemCIvgupQSu3QlYuggK1ykqgq+RZAlRFd1HzxUhldB/O2jDjFhh4rb8XmRu6ec1whcQmHcY4g2Jvu/gac+6IGdzRh4N98+2ARDgnOIiIzjXI1JkAWnQMP3akTHM/PpSkl2L0tEuVFC9H18sh3/Cp0a7VaRPEbp3F5pZo+QzAgwhW1o+QmkVoK2TiXD3wIrvlMw4qFrNiHkEwl41G58mlnRXGlasjjH7mnCau4vr7UQGBpdfKU6uuQmEGwMQUVGplaqyFpEVM0L/PUxQykc2yMiszpN9BemFlBkO1kAPMwqxyGWX7aW7a9dvNR2emZBdDCZ7OGF+zIN2O18lLbZAoEWbq06zqH7lkaRZIgG+seUXOn6gPoYJJp8o/LwlLq2SsDnnjl99kmdbpcPs/xvqeSP4xHiyL9xVTRcQfnZ2bPnlzMc8trBz28UCqb7exo82OjKBXLmwJHh1dQTmVfCyIMbHJ2/+z6vKMcC4JyVoIwOYrDUX88I7+7WBhcVevncls2csL28IubiCG0FnDJPuH7KEZWzdoRk80XRVvkoKX0Q1B7o6J/dk/NAKgOfEvmslb6Lel0RbtYIx65HxlsXB4u7e/AaVuoUVoYbfn4yVLXXB3YndXw1wA1l247TCHbFfxrJ7jJgdZ+rEbi/lMcXUDFTdlFBig=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB8637.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(366016)(1800799024)(38070700021)(18002099003)(4143699003)(11063799006)(56012099006)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?BkBWDjV13qVuOG0l2M1hw1u34nGGXvFSYDU4XI7aPwGIlPrb8M3+49W2?=
 =?Windows-1252?Q?e9+T3+/ZIwzNwptsmYpkDxFxxBTUXuBzT3mbhU2hZHr/iFeHgUHeicGm?=
 =?Windows-1252?Q?whK/hR3EY4m5QhaEwRWkHMgiqkuZlr2ZzfPNB8+H0T9b0I4DcQ2riTmw?=
 =?Windows-1252?Q?XIiSilVOnBn+V37+wcW8UedTmd9Pt8nlAi30IeL5mvolETbyM9FZPmSY?=
 =?Windows-1252?Q?r13esDq1SWZec4zuduGjoXrHjnnsXzh3/Ypcxoh3O4YxuQIkYLk/32a8?=
 =?Windows-1252?Q?WZHsD3WKVuD6uPi9pnro5QXYRWhlYJ1nnV9kD1I3jTPEKVgbzZleEpdM?=
 =?Windows-1252?Q?DxH0kpRGGUmf5weD8YH0n7x9w5gjuAWe9p85Vjfp9PaIR/zjHvJQ9OIE?=
 =?Windows-1252?Q?PpvxqIyTATneP8nnFZsNfiSQn6tmzqv2b1HG+WO4IqjhQtz/6n5aqQnS?=
 =?Windows-1252?Q?cFkJ7AD1hanOoVTqHODAWTGYrpETLFZoReDD2gca1jcU9tKiWikqj/8p?=
 =?Windows-1252?Q?ynu1BnLyEnMWNhclVby3TjbAY0hOClP+kWSKAyAl5ezwIhuglplciMKP?=
 =?Windows-1252?Q?+DDVAuR74aZ14hHtmXndium1JfXRoK2w7tt9fwMu+8fjsw7YmdgHT9sF?=
 =?Windows-1252?Q?/cJBmTlLRxNClgTYzV7clqitZ5Dgxf0hAB26VteWrmqd6I5bTPUcAK4f?=
 =?Windows-1252?Q?scOokghxHPeMs0GzIows27JkAbhFQ7R31UiKTdvAYB74vW7fD8tGlEqk?=
 =?Windows-1252?Q?LQHyS96WEFnK8SHf7lJ2pDgF5xDYj0Pd1HU3aMr1qbwsALrc4rCpSBHh?=
 =?Windows-1252?Q?qXr15XPPutuvCqqws2QXCIPSJ1aig83PHk/TSrfhfh8okkWRAUGhAZ0O?=
 =?Windows-1252?Q?7VG9A4vi8cDoxjDxGbZDDmIt8P6MbWrJjytTKUO22o+faGyWGJFCc9hG?=
 =?Windows-1252?Q?9ZIn31WQDyds3hMNMNSFJ8HgPkahu0/Uc1rB2n99qBoUmc27UuvLWFGb?=
 =?Windows-1252?Q?Fr8Fb+ERXye2ZhS8g/WYLJcyhqG7wHTs7EZ7z3czZXp0tsWnc/Ws/4qq?=
 =?Windows-1252?Q?tmJ+wU9Aad1ziV20rop6BZY3pjI4hWJrCBHjT3bNrTRBfub8++PcHiTz?=
 =?Windows-1252?Q?YI+5o6aiXYUWACewZjB3om5ICo4evjRehrFcKvryr4uW/nMItVTq3gZ1?=
 =?Windows-1252?Q?rigEojlpgQ6DtQ8YpSWWeKZWhOd8sgcDKqAxpceAXhQGH01A++e/6G7g?=
 =?Windows-1252?Q?Hw+jxz0C6HxbPKhhFOAW4AkNqBD6dTsh1sLlyL2BXwyyrhn9zoUx4C8A?=
 =?Windows-1252?Q?Wbnyj3jCWu1kqNA/eEg3DIYQzK+fW29fUr4WvB+Yd6br7Xslx+3Y77vF?=
 =?Windows-1252?Q?vTlRTAeAaQvyRvOkKYkNoVcevFE0lJEe2R/Abq2R+AKZT3WftH4cO5Ik?=
 =?Windows-1252?Q?KIAFIeU5H5WahJPlVU7tlEbH09lFoSl1Yz1n0MNIcyxyRd5LOX8IlbMT?=
 =?Windows-1252?Q?f2ck+yOF+OfahEJwROf5etcbnTDQ6xIfabi3bsGbCjBL6u337ZTZ8KOa?=
 =?Windows-1252?Q?MS6Iz9swQtePGB3+z9ghqZSvkz3ivifHKeOhC45xBlQIxadLxO6NVxMW?=
 =?Windows-1252?Q?PO2MeGeEl+H4lXtlRXF4874mPocz6VFA/wU2ePI1kvGvbPgyW4gpMpmZ?=
 =?Windows-1252?Q?oxh11wZFDfu/X3zEzzZevzTAE9UwJ/GQYUFd/jfJbtcSOxybWxOnvYT3?=
 =?Windows-1252?Q?k3vlQEKobDExlInNvQs7fGUw+9mvLP3qBqXmxKDYusn+V30mlYVSCizI?=
 =?Windows-1252?Q?FbTAXXB5G3HMb97bWXDZrhFaiUFijmCz4gFDDNn8riAhPK5z?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	PuD56pyyw0c4tVbH/zn6cn+gxtnEP62KcE1XcSCm9Setxtt5codIpk7DBaX50g32ZWazMliox/7zKFULmgsSYlkPRtos9KCEZV46NacNDL1WqujLLNJwHmu+WM0WXxHsRP1sFQTo705XjYxHpnLIbDsfWv6Ff1X/uW6DtT1u05Ht8gsulS6qn5WMXY+vOj6ZfiIFFXyr7yxlDlUitpVbY6NjfuzlhylrcFZ1nep31Z4Mxzlbm8oUDkbQvspvBRYSzMHCLm/nR0KGsbqWfnkZ8288KgOD4uz8d3DdBQkCZDoZRzH4d1QdH/wxgtNXSoq+5AOtmoPVnChu5tZP8D/W5w==
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB8637.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cb3f1d8-feaa-4755-3834-08dedbf73a9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2026 07:13:21.9741
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: trknxG249ow70CjdgAPoPvT0DuJI7BVpTcF5nWfeFtSXetsM2YVCmmLnDSbdQvrMRMf7ZVBU8eWlh/hZ6EVCRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PPFC298ECED6
X-Proofpoint-GUID: 2Ult65MiE_sELd4vePIPR87pRMEswXB3
X-Authority-Analysis: v=2.4 cv=OpR/DS/t c=1 sm=1 tr=0 ts=6a4ca715 cx=c_pps
 a=D+H/svR3caUTK+bC/ONuPQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=N659UExz7-8A:10
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=hJVLCblJc-VYA0_z04R5:22 a=ZKumFRbM8d0mkTNR1rAA:9 a=pILNOxqGKmIA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA2OCBTYWx0ZWRfX+tNSoQMJ3bMS
 sTLGnu2hvs2bfvaBwRLaBjm1c3Iyn7nts8wvE8xUBmdqbAbCWPaK/Smw9kgV4SeIiCMAB25W0/H
 NjAnAC5ycy9PPakXYl8XpANDNH53AfOA3UYA1/FdGp+luo6pxHFVtqP/EJ5Zusy1oAs/D/kkFMI
 rxJuNSKYG5b0s9bpuNsPC7UjOuy6CASnGkow2/GxT0FM3AOKgK732DSMkz88VqC4S6Dv3PZZwIU
 UrNu80grfThwdDuxf6PPI6BowZ+aWBWpwHjHpcXBakqN2vNhUyRh0uxWVj+cmBJd47zpoh+P5wk
 C6WcAmUBlS1mif855W5yX/bp+7B1WToiCOR+rXi1+Gdyty2qWCtirzOq/PZJFkzO1r3e/WoKtJ8
 pNrPhhAsZ6Ay8BX8WkBB32kyDPdbqjHi0J1yWsM8ewBdxkI3Rh3n224NoSwcpp8T6Fz+mjFteGR
 3Ldb/BkaxZ0Nkh+qMQA==
X-Proofpoint-ORIG-GUID: 2Ult65MiE_sELd4vePIPR87pRMEswXB3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA2OCBTYWx0ZWRfXyt7owCv7bv8X
 KyBMZOEnmsYoy0Hmr8Ez81nGbXYavwL/tWD4jhkTVBAXJjH31I+JgsU122Pr9WhOKILLDwtfxCY
 /+p+9zTzzabaJ+e67zrI0UbFulTG1KI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=-20 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070068

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
>=0A=
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
Just a gentle ping on this series. The v3 patches were applied to the=0A=
CI baseline last week and have been waiting for review.=0A=
=0A=
Could you please take a look when you have a moment? =0A=
=0A=
Best regards,=0A=
Jiqi Li=
