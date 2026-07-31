Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C57D3B42D7;
	Fri, 31 Jul 2026 09:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.148.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489896; cv=fail; b=gqLD7CH07TV/VkWFSUGh//+KGBc+BkP4pdOoNn3ZotBgQ0Md4xUVIkyW6fRtAcA9Nr64vaqB2yrCJKeP0L2uevnsv4eFruejJfTBDAK222S1GMblJLHC8VvLF3n04IbjfNGiuEj+HR4OoXZo0lUpTciKfNuUtXXiDDRfArvxC0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489896; c=relaxed/simple;
	bh=KAiy/exCr2xjmdmMhqmmcsKB9RmUXuxCNg8omHvSlk0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SpOUpmoSW/HLoDoeQgPcz/6aWRJg4hFanQNK8wadQqG5o8EXHG4sFpE2gnFB7c+ZVKhvYPiIxs5A4oclu8hMtSPaYT5kHJm3kXV8UiW6Sdn/D6AViWNlxnRE6r0Wg8TVc4zN0E3uwgJEEpDdLI/wfR0hjiWPlRRKYEPpSvb2yXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=zwBtb/p1; arc=fail smtp.client-ip=148.163.148.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="zwBtb/p1"
Received: from pps.filterd (m0355085.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V7ux223076042;
	Fri, 31 Jul 2026 09:24:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM202306;
	 bh=kwmRQv3GLL+M+BhG8xX7x8hiYLej0wjtN4GuYjpOcF0=; b=zwBtb/p1YSIu
	+Kzt3ld5NZOox0FIVfEXY1JKO99Z9FiH52jvlpF6c5QPhvnOB51H1788VltkZf9Q
	UyVu7FcNw/Gm6QaOB+vWl0v9NUIZQTb9YA3W6py7cPmFZTLerR4Jq8tJOAj1pEoE
	QhAqgBuAGspYDDRMleUAhpgqiGEl0W/m4BUXNKwLtDlCv9uPFCMCAcynrVuotrAA
	dDpZg65FVbn2AvxCgqUJ1IdJ6KkHofcPXasWcSXFFffwmTYtilt+ujKkliLtyWAm
	Fc3fpDTOW1W8kaa/SNzYptRVynWIBhKiqtce8jUzjSZEnhc7hSLo+qUJxa8tajG6
	sZwS/GWQgQ==
Received: from seypr02cu001.outbound.protection.outlook.com (mail-koreacentralazon11013012.outbound.protection.outlook.com [40.107.44.12])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 4fnbne552s-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 31 Jul 2026 09:24:36 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hxhTLOXIi+8pJJA1Ea2erN2I9jevpaG8wdSPTAHq2ZRB7zmHg2VnUMEwjSi7wrHFqfCvYdgOHcm6wCaSJSsIHwxzh8qodXzA+AGAfkOAkN6qJsTtaOpKQmCnPzD7SvMkO5lFzfW6DUBk2oyIsR0pKU23pt/O8QcacfN4U9aBkR9byt59dguYCIOxoTJ6pZQKcHI2YVal+taxrZR9LEArBL7u9KKhjfANtBbOk2sZEMIz0n3whAfXRA6lt16ZX9lN9VtYMS5Kw0TNQkQ96idN0Ir6iTrvHUPWcT1wfz5UQj1KNg9kLV480I+71yqHKG7H+mSE905XPbmZtKWVqrsC8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kwmRQv3GLL+M+BhG8xX7x8hiYLej0wjtN4GuYjpOcF0=;
 b=oEhItR6uCC3P5suvOT3V6A/Z5E5rcGOfgO3n7yXZao+W1ksxHGKZXen4Y390avL211JhoksOsKKJ40fWA8037R9Z51Gy4JkgphO+OLtWGjLBjEZKdbZxVmHlwb/kWxNVjZxs3YlrvqDmCH9yrvsdecBY9x7JTKr9eyN65Uro4VYGHU/qtzN1uitot8hjEYczaYtoJG5toShYCCgdLYVzek6cr26bHbVUNd6ApOu+QU13hv3H/bdjX60luUuDi885XwPcOQ9brEfDj4I+BGwFkA8F2P5gQJMBNl51BuOiQSvlDgxfHmZ2c4V9eyroBQjOh04wpYom/+/rx0RWY5zYCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
Received: from JH0PR03MB8637.apcprd03.prod.outlook.com (2603:1096:990:8f::13)
 by SEYPR03MB7950.apcprd03.prod.outlook.com (2603:1096:101:169::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 09:24:34 +0000
Received: from JH0PR03MB8637.apcprd03.prod.outlook.com
 ([fe80::699f:723b:4200:763d]) by JH0PR03MB8637.apcprd03.prod.outlook.com
 ([fe80::699f:723b:4200:763d%6]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 09:24:33 +0000
From: Jiqi JQ9 Li <lijq9@lenovo.com>
To: Mikko Perttunen <mperttunen@nvidia.com>,
        "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "krzk@kernel.org" <krzk@kernel.org>,
        "jonathanh@nvidia.com"
	<jonathanh@nvidia.com>,
        "thierry.reding@gmail.com"
	<thierry.reding@gmail.com>,
        "mpearson-lenovo@squebb.ca"
	<mpearson-lenovo@squebb.ca>
Subject: Re: [External] Re: [PATCH v4 2/2] arm64: tegra: Add Lenovo ThinkEdge
 SE70 device tree
Thread-Topic: [External] Re: [PATCH v4 2/2] arm64: tegra: Add Lenovo ThinkEdge
 SE70 device tree
Thread-Index: AQHdDrsIdCcuoK3tUUWPa6HM9H+YrraHZVAAgAAQKEA=
Date: Fri, 31 Jul 2026 09:24:33 +0000
Message-ID:
 <JH0PR03MB8637489B10DD45D2C3EBD4BF83C82@JH0PR03MB8637.apcprd03.prod.outlook.com>
References: <20260708092017.745545-1-lijq9@lenovo.com>
 <20260708092017.745545-3-lijq9@lenovo.com>
 <LUpVYFLORmKcgYXsb8i_3A@nvidia.com>
In-Reply-To: <LUpVYFLORmKcgYXsb8i_3A@nvidia.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: JH0PR03MB8637:EE_|SEYPR03MB7950:EE_
x-ms-office365-filtering-correlation-id: 1402f621-ac60-4e10-f7fc-08deeee5888d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|10067099003|11063799006|4143699003|6133799003|56012099006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 AAVEHOhY0JKBPF3+nOSbut4gdBc2U1Hi8hZKaqM85drGR2TEQL6YDtw7EQ7vmT6pDZHHRUbJnHdVxpk4txUfCwv2kNZ5Ci44orsmXR6ZCNUSeARCnyjMcxaHSKgBrOO2ik0i8y9VLG9ZSbXOmfcwNftEuXG/M763OAoxFfPMOJ75XwFxBoFgq78T6KBfR+4FCMMo8OGoV+MjPaCalpsSJ5PKb6jOE7UJp68HSSGSNMMlboNsq74R8/V5oYR7qCujr8N+I7tQycsf0ObtZFzObAtKNw86DMWhpAM/sEduOqDbubVaykNOqQMbdmpw3o65wzWEy163aMGKPp+0M1zutbJmcElDegiAP1Pe6zy5PsndjR3u/G70YUsMgIiCh/QL9WA4JpikyKnbHZN1BLrG4TJXzWbwLucAJkA+Sf2qprUX4tBc+cRB47m/H/Efy/PI1E9yICoqZgNWmbqgRGBKWmyXKPM+FLqavdiqotij/EmLCzlN+G+p3dVnZ1ipnYs40Vzm/+Y0UC/ISewkcFf+pNSekEEDgbNogvWYjuaNspuzxHWy7J5Ph4QXxnztPPA76056RBTDled2EHoZTUQgJYtPg6rU1lBrcQaC3zlQVVHXUi8+rpLX0jA2v6we5dY6rfhyu79lyEoG/5RzsdRs08GsGD6f2oEUYrDy1FGYesIKxo2fQE4lUvBaGsw/mowsFaMhpcBGPja4NzKKX9KV65/auH0AESVyIZH9YuBBj24=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB8637.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(10067099003)(11063799006)(4143699003)(6133799003)(56012099006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?XK1QKg7ba9nefYT2Jz2rlwH81Sh3ONeGyRYO1aNXhvj0xHzGMFI7BQjs2E?=
 =?iso-8859-1?Q?KhRvUzCo1YtA9JPiyN/IgCQeQhIqq2G+OYj81MNO6wAkwRwJl8kcqWJ8DL?=
 =?iso-8859-1?Q?PIb7YPz7ULk9IedZudUxq+xFwTr1W9ZMG2OxqZDVIt+HmT8L2+e1l7U6tN?=
 =?iso-8859-1?Q?X02YcDBiNjsEXkjBhrGJWiqh22SwXAPhEgkwQeQJeI9E9PpvQvas5XFXOG?=
 =?iso-8859-1?Q?5XI8x1OybMHMkon1lDhR6KmZ0blXAi5F0Sffy1q6qfE1yp9Lt/DsiLk5Dm?=
 =?iso-8859-1?Q?1DiqnS+Oxhf5PpABFHYPTX+ifNcQDgLqm7ZXEy13R8BApoWITgyz7GmNb5?=
 =?iso-8859-1?Q?vlheWTNVYcSjvw864JarVikfe0GjKLtLMJvUfea2ej82hLQSdfWdYZi/sM?=
 =?iso-8859-1?Q?0WChsODSc8TeXuo/hKDDsGBXoTTJGe4DCoBK0hgVtVNO+h6hP4ZQUw6bof?=
 =?iso-8859-1?Q?yNEs0v2D5dnrxtAr7SBCzOwg9dibWH60N0diQ18pKZCV3JzVs42ONa1tWy?=
 =?iso-8859-1?Q?rvaStzqZ4TNPPBf0Bu96vHUVRZSzp03S0FujwL1QjT1W4x+QUMGl4OLpjR?=
 =?iso-8859-1?Q?WfjyDCkayvvjBxkwWKhrJyxFBT4wWsawocwB4bxxb6dnyqUwgQIYuZUhfI?=
 =?iso-8859-1?Q?MGQb4r+hraqXoKjvghQlug2nvZK2ra5DBZtDUmy2SwVLuajTEupGsz+RE2?=
 =?iso-8859-1?Q?0EbPHt3Zmwbozvvl+LJeOs9m1k6nrV3hYnQfLoiXfUDKZE8/sT85ZIxaZL?=
 =?iso-8859-1?Q?tG9TDyhjh2KpljKg+zo/Xi9LWYKHh0uted11vK2ia+lHusxLIp6SoMd3+o?=
 =?iso-8859-1?Q?uR3t0/9dn2JGA0JjZ9HxJMUsSbZYxYoRSGK1tgNI82EkhPzFdsZ0KBRTz+?=
 =?iso-8859-1?Q?m3vfjp2uwxOCsH4MyxBugb5AiHJRcNm+kJPCFakszPH0qZNCelo4tM9wMq?=
 =?iso-8859-1?Q?NYlnzUuJjDYVw1s63N6rsjY8Mn+LRViwDmjB4tGolbv0GL1EjYxYEj3cPI?=
 =?iso-8859-1?Q?eER/6jij6dx87L/FfYnd8Yvqq+UxzSS2oBHxtmqNmbJ1+D+SR7vlGRelzq?=
 =?iso-8859-1?Q?peq0sdueot760Girk2e7zS9ln1FpN/DpdmY7WCvH/0BycKos4CsjfoFK+i?=
 =?iso-8859-1?Q?jRuZysRBS1rJTa+48qKX7XPfZsRIU0auNdC9IYvaSiaX32k48GHR6YTalM?=
 =?iso-8859-1?Q?450K6Sfj04v9SLz7bF0Lh19G5uY+tdbHFeU+GfjGCGnxPmDQsHyAlC89dq?=
 =?iso-8859-1?Q?m2V/lwgadXBAzxcU6WlijEMqzH18rKZxWAg0AaWd1AJcMqWQAtdNMZ9Emm?=
 =?iso-8859-1?Q?N5GmjQkuFWj0FUFSVcSU83lSBlh8R9pa9ISNplw3NpiFS1rzRVFmlifpp8?=
 =?iso-8859-1?Q?lls9QxZJTl/nC0EsQSC0hixPeclprn5B1MQgh2NVEqhZuBuUZRrj2qBSkQ?=
 =?iso-8859-1?Q?/mX/bbzTYJPirdZQjA/H74rbXoxrBonWE1sg6+hIBMK84aIbrTs8Ix3fsS?=
 =?iso-8859-1?Q?VWsste4I1NSNMDly15vzuOKS5ImJYZbESZ7daOoTC99MJGagAF1FnQaT/j?=
 =?iso-8859-1?Q?ZCHhyOl+lM9fCrTeTBEJZndaUCJMOyxCq3VjtSxvNZ3Z6dx9s5fTLHN8XS?=
 =?iso-8859-1?Q?hBlvwf1TDooTJw/IKqaYwThiktwWLZuEa0Cc4ND92Hrzw7pZYZg3oTDpnf?=
 =?iso-8859-1?Q?PLAOWqT6bzw8wXdaNvSANWmxguiYTWhyKWiTd9PVAE/d98hrpKGis/dXyU?=
 =?iso-8859-1?Q?TY94EWFeCTtJfu8QJYmsawXpMDpezyExQe3/cXvaOrSnWW?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	AYCaH+p9kSPT7OsFnsYG79zDK6g9ubTmar3xuyGcUK3qf57IWL8qp09ElnfOQi6fU+FIoTR+9YWhCxFuIMirWScRvnRhkc3TxsAo8seXJrBA3hn51+M/Mz6lN2FA8OHRE7Xu/vifszHfbVOxs0G/lIKubFMxtfmAHHfccVCo8TSXg2z6+IJAebRwA4dpCWRGMeKjFLUeXsrYBbvBbf22VmzWaUZESKIVAbXdp4iYfD0YzmMHFZkmUNww/eahd1mv78XHCFN2MxHFDhmA59S4xTu8dn6a1O9a9AYg+rPuDmnBB1PbDQutmEb2hTNoMPDtJkSh2TchlNelf1qyMfK9xQ==
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB8637.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1402f621-ac60-4e10-f7fc-08deeee5888d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2026 09:24:33.8865
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O2XY78PoPHoaj0ziKQvHiAne6hHJg72mFlIMcs6of1yxU7GOwU40g1mmHlecS0UW92GIBs7Dt+mUHAH9XHRyIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7950
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA2OCBTYWx0ZWRfX/KgtcluyzkZq
 HGdCcTWzJjtIJ0/ahD4DmzZKTM26Pv+8bhAumKT0FGUpwpfjX4qEhjKDoatAkUBi04dnPQ7w9xz
 eu4eSt9LOC57OXqBenpJeKBn/y1ZbAk=
X-Authority-Analysis: v=2.4 cv=Tt7WQjXh c=1 sm=1 tr=0 ts=6a6c69d4 cx=c_pps
 a=b0ENjZ4CjYyMlAnPOiXQkA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=ohM_6DErYqYCNn4jCPz8:22 a=8k6WQxmsAAAA:8 a=Ikd4Dj_1AAAA:8
 a=ZfBgxSNTTGU-A4EXHlsA:9 a=wPNLvfGTeEIA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA2OCBTYWx0ZWRfX9m0i2x6WTHJC
 EbeCUWn8xiVnQ7acd/3BfodPg18QMOWbXGiaoazWwjani/UG6q8xcK2o+f6A6zrK4Mn8tqG9PD0
 GAtn9cNFWy8BcsrOwD40HSjum4sDaSIATtqbc11rPCCfJ9Q68zynxmNF4CMIFSbiXVwl1ZllimG
 jhv9/JgxyCCmeXgZMeAJkg3nO1ZFLXNNbu3Vi8qzyKUYaa/nJA5qnJ+EvPuhnMsf6duWT5yk1Oy
 jUhHLUmA7++GoxEw0ZnABAizkQoRC+N2l9NYJX3Xb+IqPhRF8VMOoxH/J1hdzLL/lWetDUHbjYE
 Lye+GtPf5iVgslrm9fZHiJCPvl0g0+CEaNMe4RIsUB23YAggnGFdc4b+ymGMsjgcwSElmZ9AkBO
 rI/fNyjK2z7cDPx11g19AfgR4rfs1SlsU9nZJn2DUADI/0KAstERc/8MTPkXGX6M1qw00nlLzGQ
 kUM3ttIe8MgJSxp8z/w==
X-Proofpoint-GUID: _Fadb5AbI-sctUbgviXrgGGrd4LY8p_s
X-Proofpoint-ORIG-GUID: _Fadb5AbI-sctUbgviXrgGGrd4LY8p_s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=-20 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310068

>> Add initial device tree support for the Lenovo ThinkEdge SE70, an=0A=
>> industrial edge gateway based on the NVIDIA Jetson Xavier NX module=0A=
>> (P3668-0001) with a custom carrier board.=0A=
>>=0A=
>> This initial submission includes:=0A=
>> - 40-pin expansion header pinmux configuration=0A=
>> - External Micro SD card slot with dedicated 3.3V regulator=0A=
>> - I2C bus for 40-pin header=0A=
>>=0A=
>> Static verification passed: dt_binding_check and dtbs compilation=0A=
>> complete without errors.=0A=
>>=0A=
>> Signed-off-by: Jiqi Li <lijq9@lenovo.com>=0A=
>> ---=0A=
>> Changes in v2:=0A=
>> - Remove unused input-related headers from baseboard DTSI=0A=
>>=0A=
>> Changes in v3:=0A=
>> - Merge baseboard content into main DTS, drop separate baseboard DTSI=0A=
>> - Use stdout-path instead of bootargs in chosen node=0A=
>>=0A=
>> Changes in v4:=0A=
>> - Rename regulator node from regulator-sd-3v3 to regulator-vdd-3v3-sd=0A=
>>   to follow the naming convention (requested by Mikko).=0A=
>> - Move regulator nodes to the bottom of the file and order=0A=
>>   alphabetically.=0A=
>> - Keep vdd_5v0_sys as it is referenced by USB and PMIC nodes in the=0A=
>>   SoC and SOM layers (required for compilation).=0A=
>> ---=0A=
>>  arch/arm64/boot/dts/nvidia/Makefile           |   1 +=0A=
>>  .../nvidia/tegra194-lenovo-thinkedge-se70.dts | 113 ++++++++++++++++++=
=0A=
>>  2 files changed, 114 insertions(+)=0A=
>>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge=
-se70.dts=0A=
>>=0A=
>> diff --git a/arch/arm64/boot/dts/nvidia/Makefile b/arch/arm64/boot/dts/n=
vidia/Makefile=0A=
>> index 72c0cb5efa47..736a3f8a923f 100644=0A=
>> --- a/arch/arm64/boot/dts/nvidia/Makefile=0A=
>> +++ b/arch/arm64/boot/dts/nvidia/Makefile=0A=
>> @@ -29,6 +29,7 @@ dtb-$(CONFIG_ARCH_TEGRA_186_SOC) +=3D tegra186-p3509-0=
000+p3636-0001.dtb=0A=
>>  dtb-$(CONFIG_ARCH_TEGRA_194_SOC) +=3D tegra194-p2972-0000.dtb=0A=
>>  dtb-$(CONFIG_ARCH_TEGRA_194_SOC) +=3D tegra194-p3509-0000+p3668-0000.dt=
b=0A=
>>  dtb-$(CONFIG_ARCH_TEGRA_194_SOC) +=3D tegra194-p3509-0000+p3668-0001.dt=
b=0A=
>> +dtb-$(CONFIG_ARCH_TEGRA_194_SOC) +=3D tegra194-lenovo-thinkedge-se70.dt=
b=0A=
>>  dtb-$(CONFIG_ARCH_TEGRA_234_SOC) +=3D tegra234-sim-vdk.dtb=0A=
>>  dtb-$(CONFIG_ARCH_TEGRA_234_SOC) +=3D tegra234-p3737-0000+p3701-0000.dt=
b=0A=
>>  dtb-$(CONFIG_ARCH_TEGRA_234_SOC) +=3D tegra234-p3737-0000+p3701-0008.dt=
b=0A=
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.d=
ts b/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts=0A=
>> new file mode 100644=0A=
>> index 000000000000..02ac645a7784=0A=
>> --- /dev/null=0A=
>> +++ b/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts=0A=
>> @@ -0,0 +1,113 @@=0A=
>> +// SPDX-License-Identifier: GPL-2.0=0A=
>> +/dts-v1/;=0A=
>> +=0A=
>> +#include "tegra194-p3668-0001.dtsi"=0A=
>> +=0A=
>> +#include <dt-bindings/gpio/tegra194-gpio.h>=0A=
>> +=0A=
>> +/ {=0A=
>> +     model =3D "Lenovo ThinkEdge SE70";=0A=
>> +     compatible =3D "lenovo,thinkedge-se70", "nvidia,p3668-0001", "nvid=
ia,tegra194";=0A=
>> +=0A=
>> +     chosen {=0A=
>> +             stdout-path =3D "serial0:115200n8";=0A=
>> +     };=0A=
>=0A=
>Unnecessary: the P3668-0001 dtsi already includes this.=0A=
>=0A=
>> +=0A=
>> +     bus@0 {=0A=
>> +             /* 40-pin expansion header custom pinmux configuration */=
=0A=
>> +             pinmux@2430000 {=0A=
>> +                     status =3D "okay";=0A=
>=0A=
>The pinmux node is already enabled.=0A=
>=0A=
>> +                     pinctrl-names =3D "default";=0A=
>> +                     pinctrl-0 =3D <&pinmux_hdr40>;=0A=
>> +=0A=
>> +                     pinmux_hdr40: pinmux-hdr40 {=0A=
>> +                             pin7 {=0A=
>> +                                     nvidia,pins =3D "aud_mclk_ps4";=0A=
>> +                                     nvidia,function =3D "aud";=0A=
>> +                                     nvidia,pull =3D <TEGRA_PIN_PULL_NO=
NE>;=0A=
>> +                                     nvidia,tristate =3D <TEGRA_PIN_DIS=
ABLE>;=0A=
>> +                                     nvidia,enable-input =3D <TEGRA_PIN=
_DISABLE>;=0A=
>> +                             };=0A=
>> +                             pin11 {=0A=
>> +                                     nvidia,pins =3D "uart1_rts_pr4";=
=0A=
>> +                                     nvidia,function =3D "uarta";=0A=
>> +                                     nvidia,pull =3D <TEGRA_PIN_PULL_NO=
NE>;=0A=
>> +                                     nvidia,tristate =3D <TEGRA_PIN_DIS=
ABLE>;=0A=
>> +                                     nvidia,enable-input =3D <TEGRA_PIN=
_DISABLE>;=0A=
>> +                             };=0A=
>> +                             pin12 {=0A=
>> +                                     nvidia,pins =3D "dap5_sclk_pt5";=
=0A=
>> +                                     nvidia,function =3D "i2s5";=0A=
>> +                                     nvidia,pull =3D <TEGRA_PIN_PULL_DO=
WN>;=0A=
>> +                                     nvidia,tristate =3D <TEGRA_PIN_DIS=
ABLE>;=0A=
>> +                                     nvidia,enable-input =3D <TEGRA_PIN=
_ENABLE>;=0A=
>> +                             };=0A=
>> +                             pin35 {=0A=
>> +                                     nvidia,pins =3D "dap5_fs_pu0";=0A=
>> +                                     nvidia,function =3D "i2s5";=0A=
>> +                                     nvidia,pull =3D <TEGRA_PIN_PULL_DO=
WN>;=0A=
>> +                                     nvidia,tristate =3D <TEGRA_PIN_DIS=
ABLE>;=0A=
>> +                                     nvidia,enable-input =3D <TEGRA_PIN=
_ENABLE>;=0A=
>> +                             };=0A=
>> +                             pin36 {=0A=
>> +                                     nvidia,pins =3D "uart1_cts_pr5";=
=0A=
>> +                                     nvidia,function =3D "uarta";=0A=
>> +                                     nvidia,pull =3D <TEGRA_PIN_PULL_UP=
>;=0A=
>> +                                     nvidia,tristate =3D <TEGRA_PIN_ENA=
BLE>;=0A=
>> +                                     nvidia,enable-input =3D <TEGRA_PIN=
_ENABLE>;=0A=
>> +                             };=0A=
>> +                             pin38 {=0A=
>> +                                     nvidia,pins =3D "dap5_din_pt7";=0A=
>> +                                     nvidia,function =3D "i2s5";=0A=
>> +                                     nvidia,pull =3D <TEGRA_PIN_PULL_DO=
WN>;=0A=
>> +                                     nvidia,tristate =3D <TEGRA_PIN_ENA=
BLE>;=0A=
>> +                                     nvidia,enable-input =3D <TEGRA_PIN=
_ENABLE>;=0A=
>> +                             };=0A=
>> +                             pin40 {=0A=
>> +                                     nvidia,pins =3D "dap5_dout_pt6";=
=0A=
>> +                                     nvidia,function =3D "i2s5";=0A=
>> +                                     nvidia,pull =3D <TEGRA_PIN_PULL_DO=
WN>;=0A=
>> +                                     nvidia,tristate =3D <TEGRA_PIN_DIS=
ABLE>;=0A=
>> +                                     nvidia,enable-input =3D <TEGRA_PIN=
_DISABLE>;=0A=
>> +                             };=0A=
>> +                     };=0A=
>> +             };=0A=
>> +=0A=
>> +             /* Configure i2c bus clock to 400kHz for carrier board per=
ipherals */=0A=
>> +             i2c@3160000 {=0A=
>> +                     clock-frequency =3D <400000>;=0A=
>> +                     status =3D "okay";=0A=
>=0A=
>This is also already enabled.=0A=
>=0A=
>> +             };=0A=
>> +=0A=
>> +             /* SDMMC3: External Micro SD card slot */=0A=
>> +             mmc@3440000 {=0A=
>> +                     bus-width =3D <4>;=0A=
>> +                     cd-gpios =3D <&gpio_aon TEGRA194_AON_GPIO(CC, 4) G=
PIO_ACTIVE_LOW>;=0A=
>> +                     disable-wp;=0A=
>> +                     no-1-8-v;=0A=
>> +                     vmmc-supply =3D <&vdd_3v3_sd>;=0A=
>> +                     status =3D "okay";=0A=
>> +             };=0A=
>=0A=
>Perhaps you want to add an mmc1 alias for this in /aliases.=0A=
>=0A=
>> +     };=0A=
>> +=0A=
>> +     /* Fixed 3.3V power supply regulator for external Micro SD slot */=
=0A=
>> +     vdd_3v3_sd: regulator-vdd-3v3-sd {=0A=
>> +             compatible =3D "regulator-fixed";=0A=
>> +             regulator-name =3D "VDD_3V3_SD";=0A=
>> +             regulator-min-microvolt =3D <3300000>;=0A=
>> +             regulator-max-microvolt =3D <3300000>;=0A=
>> +             gpio =3D <&gpio TEGRA194_MAIN_GPIO(Q, 5) GPIO_ACTIVE_HIGH>=
;=0A=
>> +             regulator-boot-on;=0A=
>> +             enable-active-high;=0A=
>> +     };=0A=
>> +=0A=
>> +     /* System 5V main supply, referenced by SOM and USB nodes */=0A=
>> +     vdd_5v0_sys: regulator-vdd-5v0-sys {=0A=
>> +             compatible =3D "regulator-fixed";=0A=
>> +             regulator-name =3D "VDD_5V_SYS";=0A=
>> +             regulator-min-microvolt =3D <5000000>;=0A=
>> +             regulator-max-microvolt =3D <5000000>;=0A=
>> +             regulator-always-on;=0A=
>> +             regulator-boot-on;=0A=
>> +     };=0A=
>> +};=0A=
>> --=0A=
>> 2.43.0=0A=
>>=0A=
>>=0A=
>=0A=
>So some nits, but overall:=0A=
>=0A=
>Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>=0A=
>=0A=
>Thank you!=0A=
=0A=
Hi Mikko,=0A=
=0A=
Thanks for the review!  I've fixed the nits you pointed out:=0A=
- Dropped the redundant chosen node=0A=
- Removed unnecessary status=3D"okay"=0A=
- Added mmc1 alias=0A=
=0A=
I'll send v5 shortly.=0A=
=0A=
Best regards,=0A=
Jiqi Li=0A=
