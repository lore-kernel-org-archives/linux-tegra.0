Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EA940BCAD;
	Tue, 30 Jun 2026 11:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.148.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782817461; cv=fail; b=pXRqN1h3o+Jmo4S1r4+Zzipz+foR/A4Fu96RphZo3Sb3/to3IEQ79TTLEz7i0OmzAYf4MVfhYNT21pTrxouAJ3v2b6lZ9XsXW9KkXsQF3W+7lKsChUZR6WRynXaubIu+gYvCYFcBjj1jHI9KVmtvDf6i+x2uJTvg+nSlY5YSVDQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782817461; c=relaxed/simple;
	bh=HSfYR+PzZcZQz+uRqhUnHX8DQbnOTNKA20varVuLia0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ofF2Q3m0g2NR/SYyyG4LhyrbDx1aVDgt6TkWwKU9IqaYQmhUUzJJDjs6PS/0gxpDDz8W2sCGg6Dwrksw4Hz2apznQ4zQnGN4mXU6sJ4GeNuvLPEgfx6teykQu3frVcaVwqVONl4rlAhSoezNDZ/btmgfsd6Mv6kxDkU82rjtpXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=3YPyEk21; arc=fail smtp.client-ip=148.163.148.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="3YPyEk21"
Received: from pps.filterd (m0464638.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9kePY3730123;
	Tue, 30 Jun 2026 11:04:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM202306;
	 bh=iag7nviDayGcPJNivAOn4v/ZRq3uOdJoKg5ElumqMyk=; b=3YPyEk21fBrD
	3ffP4SlVjmuXiHFatvtVfH4r9J8RA761tDxnKGZbNg888MSpNwg8afCrGd0Jyb7N
	YgntGYO2CwArF6hFtKr5Mbu5u62q3h3ikWoXYDvkLVAC/5+uxA1JOPXsikdakK9L
	Dr0vzC6W78XfiSTmBBkl4LL6ahpfip0dQCgGFdesO0gWOl/pVB/ijdaeTlOsmxwb
	KsHtCUgmi3a3HFEA9agvRvo0saC2x43iwYHRbIZgJJZBjPrF7O/xt0eYG1hBjGzm
	sn28zduCoz2MrpAbKCITXjA8PXSjKlJdMkWJj69/k9DR+R6Dnfd4JOl8FkGjdC9l
	RJNLV2EuqQ==
Received: from seypr02cu001.outbound.protection.outlook.com (mail-koreacentralazon11013007.outbound.protection.outlook.com [40.107.44.7])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 4f2syevdqy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 11:04:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hz1wjfCLuRYHDYieG+6iQJ37pyvLX0iOOjUu8mDniobuMdP+EtHH34EPFLZEuWyB1yDu0Mm3ts4iKVeV2jz3Dzmo4jD+MWQR6A8eLAIkdKjGs3BilYapc6rc9kMjPkGjK14JLLYt8VdjMKBrHeWUSSq2Np8n/il/HwArEoSy2P+e5umZaqzJazhTYsDuxMy11QCiVyvTsVAOh696vY6AZ/EVIC4BivrHyoOajaNHPwCSyH1zhzNZh+X4b+8craaipU9L8k+ru6Vu1DmU0PSortUTXeJspJ7zXIrJH7h3DqSI1ktGKhyW4MwlV7J8jOFo2gxKFBWQDFsYpvFCFslJ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iag7nviDayGcPJNivAOn4v/ZRq3uOdJoKg5ElumqMyk=;
 b=epdY3ZP02D4qB6f9cGJ8LU9+J+zx4PF61T408RT9ImyzC2Fr5aD7BZYHWYKKvytpnna7pxR684aIDQjXbZeXg3msYdJEgLJ68NgAy9Ym7I0ymiU7NUnPTURs5fIeJ1zMvsu4aQ8MRuKTHNJHlNixPT2v+beGTAZJuxG+jLqnSSO6FhdbJ8UJEtx8CYQgKc31l6NuoWoWCiaxreI8rF/S0wl1yYUjnqZw7MdpnuoeLjluTTqItqiIh8CAGLOgjd9P+vuhryCnyH8Ka5q+mf8HNkcvKtukyzybVcScciftFrkgqldzjflqKUwpJkXm8DJtsMtJJ929HGI2+F5pNXRLsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
Received: from JH0PR03MB8637.apcprd03.prod.outlook.com (2603:1096:990:8f::13)
 by TYZPR03MB7667.apcprd03.prod.outlook.com (2603:1096:400:428::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 11:04:11 +0000
Received: from JH0PR03MB8637.apcprd03.prod.outlook.com
 ([fe80::699f:723b:4200:763d]) by JH0PR03MB8637.apcprd03.prod.outlook.com
 ([fe80::699f:723b:4200:763d%5]) with mapi id 15.21.0181.008; Tue, 30 Jun 2026
 11:04:11 +0000
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
Thread-Index: AQHdCHFTDOapB3j1yECfkt8Oy1jGYLZW3i4AgAAP9W8=
Date: Tue, 30 Jun 2026 11:04:11 +0000
Message-ID:
 <JH0PR03MB8637692033F3AC7486EB397B83F72@JH0PR03MB8637.apcprd03.prod.outlook.com>
References: <20260630091743.657388-1-lijq9@lenovo.com>
 <20260630091743.657388-3-lijq9@lenovo.com>
 <d7bc7c0a-9f36-4440-b6d0-2e23667659c4@kernel.org>
In-Reply-To: <d7bc7c0a-9f36-4440-b6d0-2e23667659c4@kernel.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: JH0PR03MB8637:EE_|TYZPR03MB7667:EE_
x-ms-office365-filtering-correlation-id: 72902f48-bd38-4878-2df4-08ded6975086
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|4143699003|56012099006|11063799006|6133799003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 1un3ZbTaEiNj/MmwOWVVsol66sjNdSsL7lzgxH7Kqb3qPRtQnQNgGNuYxBY/i1YinsJgfNU3xKwzHY8Roj9jb1C7LAL7z/drVyPwH9azl4pPGq17cMpbT7NAbKTlA6TGGYqMqS0E9sPqs+TbHhSda17AGz9ciLy4ajNVax/tI4R/k954y7kWBJ0+k7yecAVjyhqd4bMIbJMPSV2VEizyJAC/6ufLbymqYUh2LhI1I6jrP9MXsXp8HTzkV2nNnbAydoISYkrR2VsaN6kyRpqkvEGsg1anQM46fzhPuNk6rzBVvFuAC/P/Pq/KnOJ6wPRmJt61RiMsTuSH0ep01NxY4lN1A8x3mf/gy5xr7WmMzmnBL61ZtNedpr4xdx9DnK8TvkQwa+WUnYPyivlCavEfBg8vwJhRfUTAKAc2eo+H8lPsvIj+yyZ7sbXA8EIrH7xOnt/p6oa0f9SRoXQoyfLZdvS/ByXw+KLnmAXz58qcRwaG6D+gnVUTZM9RGoteAtxK/EajPIc3ckKLlifAvHFBDMdDMvQEdEwM37Vj8+Zb9fxx0yDDFqiE+1mk5r71aEIC8Kqy00aAWrpMy6pttWBv6JBs3nBavl8ntEC5T7lY/pdrsRT4ROwSE4S2RweLl1O0HeX+YqDaBuh3dK0G/Uel3UDYpsqkHuSifzbqtPDuGkTp1+snobiULAdlhWkEtsypXO3gEpCEBAWw7qir+HYz2R4ea5LsZBBX0Qz6/NxiZvA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB8637.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(4143699003)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?DlBMHt83SsNl92tiniWcZsMRBlCPd0YVoeoEQFrpYG5dQ8ZTtCndpx1B?=
 =?Windows-1252?Q?gxJRTrDD5+TeLUgRS4sAW8fsj0B7R4FqAh1/eZ4dRJUJh1lRFTemHRUe?=
 =?Windows-1252?Q?pyjQLE07hymirB9w4w7nvkxIEpdK/sjVCF9RHQK3+RNVawfYsBTjqfOK?=
 =?Windows-1252?Q?0amCxCrDT7wEF1byP7evRkNYPFbXUTcnVgbhxUieDJl6fE1Mkyiznsd7?=
 =?Windows-1252?Q?Ip2CrRVS2kLi8PaNEGyxHPqiciHzpBR+Zy3a8wkA9pHcyLrCR57iqK+Z?=
 =?Windows-1252?Q?Q7vlnQr6x1DTrl1t4La3E0ZQQHpaxh4ajqLPbpeuuXe4eWq8iyn+GMcn?=
 =?Windows-1252?Q?yY6ZmYLaOsSMzvn4SBnLKVCKvXtEtb0q8Hd+tRCDxz7plK6APlcmpOhM?=
 =?Windows-1252?Q?ULZcNd7NLJqxf7N0p7eguJASO8J/xb9ijIMWlQgMV4dsmpP1+P1UoNF1?=
 =?Windows-1252?Q?thODYwD+2PISQVBVr+4+A60J9UB9XqtmblRJHje3iMxcVN5+yUjLxrRi?=
 =?Windows-1252?Q?Ef/NFLUafUWmiBWl/3To9lHzfF5IrQ8dhrTvVRAOb3oPEgzqPgZdYp2T?=
 =?Windows-1252?Q?kuzSBbDI4Bj99o/LunEc/BYEpZvcWzWji2y1JsYs/UhY8S9bAt0NjYrl?=
 =?Windows-1252?Q?kfLSRWd6QcS0adAZ8r8Mn7V/zXl67ILrnVVzACj1lT/rhZhVBXn/zXHE?=
 =?Windows-1252?Q?FfIqw+uECWFBTh3nSoQtyanIis+rUe66BBEAgazK2dC6d07OpXz/jMA1?=
 =?Windows-1252?Q?as3zTsXxVbkkBdq94As1BSGT639BYMxV5CPSQ9fEUmesgggyPet9bXBZ?=
 =?Windows-1252?Q?sffU51gQEOSRnCSyjKiOAYPQSjvauRTsBm4DsAW+HZGgEIwXrSQVaecm?=
 =?Windows-1252?Q?IMLWR7plsR1IWiyHwT0icsb3BFtUi1Q1eKR15SYy/wPDBGCS9zs12o2i?=
 =?Windows-1252?Q?yhgkDyYstIg/0OnQQqX6AIO9UAwX1pA/u+WPrnNH6AbgvIsEdyNTVIlc?=
 =?Windows-1252?Q?jYXICVqWthLZ750/DKVzfd5mmPhiu47xDtNoczMdtsYwqet2+0+dHx3O?=
 =?Windows-1252?Q?LOSP5q7xr0GqNj0vH3+HHFB7UurCcXP1VF3fuWmRThgM8Yo/0xPHCcxg?=
 =?Windows-1252?Q?fjKkCVvLtoq42yNWqClUj1+3vAT8wr6hRQthKOvqpchzV4i5r+jMl8wU?=
 =?Windows-1252?Q?67lnGbYbOlkQsVeH/eVeQ2xo6+eEcnMtepTylMRkAbi7H0hXR8h5OtI6?=
 =?Windows-1252?Q?pbOsoVa19qRoiPhjM8twiFx2+8IAjb9naUPaGvLFOleslyWGoSduYYD6?=
 =?Windows-1252?Q?7Wlg8EgwhXXdj4nlRE0aVNSM1nqncGGUFgZQeBZHb4U92tMshZCYzTW2?=
 =?Windows-1252?Q?dBP1MoLItkX2o+J3tSDHNG5UJPLT6DnAhmOjxy4qEolOl/xKR7cBl494?=
 =?Windows-1252?Q?0dnxTHpwrqLrltpbrjztk4Hj23ywA/vlnxduwV47AAQYcWJPUP6WbOOV?=
 =?Windows-1252?Q?VkRyVZowKWDNJmUxVI9I+b8mil8yeXS9hURSIvXFVqGJH0GnyoUpD42W?=
 =?Windows-1252?Q?Tt3v3jwisXHOcwcd/BGLevhRaTLi8GBi40bs9XD0U1v9UObr16Z3Hc4z?=
 =?Windows-1252?Q?SOMUV0VPHsUbGvz8M5yK+fWHDU/loWehEltoQr4USIc4hDkNWVO7l6aM?=
 =?Windows-1252?Q?GKifXJw8s0bVCYsv2UYGD/UydRSbD4YSYcPH/dyvsgw+CviB5ExtohbP?=
 =?Windows-1252?Q?nG4kaYp5tSwsv+bY1fj0sGdD6HeztzRp+YSc37edzuuBU2XyIvcws0y+?=
 =?Windows-1252?Q?CfH11KWRXAlhR7/OGD2lxRMwylghyJL4Vm2r3rxsMIBzT7bS?=
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	muLYNUg1vttdCLZpY2qTSo1eKJdNPCKBjh3JWKEjA8/LCX5bvoBQPR6btcz9ZjvEwMv9vIbGcZ0PhZFvIkRzoZlshTPiy6ZWrxSSzWKCSFGPDD4YbKItCKjY6idbgxzD2EkuEwnYWNaqyBKYJvGoONcQKmt/u5NVyrO6qZwrmzpE7F4pjmdmw4lTLZCt6ye2Mure5mzC8WRQUnBzQNqJkSo8YzBC+0cGFb1Wy4fb2/SYGQEX65wID6b8iZTCpxOPnES5xBsdLrLkz3hURGXw52PO3j98HhX1i/Q18umq31ZTvTOdi+Mj31j24Ckk/h+WxjAMHJ+d8xqpj32upZe19g==
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB8637.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72902f48-bd38-4878-2df4-08ded6975086
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2026 11:04:11.1879
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pTOk+AijDuFTcqyk4LtGu2TxOmDvOZsGrhfhcNPa5gGxD5D36sxG93PHblK3n7+zWIfE4uxlPOoWINUMIr2xSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7667
X-Proofpoint-GUID: bZsgYL7zlfAQ7CKvHmIhDs3pQlUM0fnn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEwMSBTYWx0ZWRfX3DFWMn/G/hId
 kaEoETU01J5ht+KzO68xZ9rkQ9GUvTTPXSIIWJ8wPNVtwV+/Z+VzNdXWPpKD8xtv+6HTy0Rfxi+
 CkPemKefe1xvrtmkZDN9eZGh3rTexV8odREkmZBRptRzd7O0dF3Kf+TAUOT/u0UYsiThwwwBqoE
 1o+RxB5lx/xxs0NvsJLydqwE3ZUZJPbkE55LMFtIZZgO+qwkfLkuJIkrgBYiRw0oxcb7PiqXpKT
 /Z58lmAtlgn+e8BTHDqpaRmG9TGiGzA9Bl24pJEMyk2E0YvUdDTGRumzQY7NoXTAXoPNV1nEgiN
 woOn/X0O7wqvAE9kbXSEijvX3BmZrf5D/FtoCXgU1sCaqMDwt8Be3x8epjtwaJU6HQ5SAYB2WTA
 9qE3KtAfEKF9oB7HXiOrr+xfnabXPF5tDvwRBeRAqwcPVp8oCAc1q7N0O0A+k9jzvPgKwsv7ML1
 wZ18eTG/d2M9e0Wj60w==
X-Proofpoint-ORIG-GUID: bZsgYL7zlfAQ7CKvHmIhDs3pQlUM0fnn
X-Authority-Analysis: v=2.4 cv=S8TpBosP c=1 sm=1 tr=0 ts=6a43a2ae cx=c_pps
 a=UnW58Y/yffJfwI1+CksWwg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=N659UExz7-8A:10
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=QJilI6ASod0cdCKXAsqI:22 a=8k6WQxmsAAAA:8 a=wCxiEiQ-7hyFXQ6ihi4A:9
 a=pILNOxqGKmIA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEwMSBTYWx0ZWRfX+/Ssua9Rc0HZ
 JJOfNNp+250cI3MwQmFU+W/7HzD4FdTnWcf58nlayBTi52ufxrOMbJJNpsb5Zn1KSHTDuM6kqFW
 ak6l9YvUuJmYTz6qvf40k0FQPA3q0+c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1011 suspectscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=-20
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300101

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
>> ---=0A=
>>  arch/arm64/boot/dts/nvidia/Makefile           |   1 +=0A=
>>  ...ra194-lenovo-thinkedge-se70-baseboard.dtsi | 103 ++++++++++++++++++=
=0A=
>>  .../nvidia/tegra194-lenovo-thinkedge-se70.dts |  14 +++=0A=
>>  3 files changed, 118 insertions(+)=0A=
>>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge=
-se70-baseboard.dtsi=0A=
>=0A=
>What is the "baseboard"? You do not have compatible for SoM, so se70=0A=
>feels like final baseboard. Also commit msg says that se70 is the final=0A=
>carrier board, so a DTSI for non-existing hardware feels confusing.=0A=
=0A=
Hi Krzysztof,=0A=
=0A=
Thank you for your review.=0A=
=0A=
Regarding the "baseboard" DTSI file =96 you're right.=0A=
Following Mikko's earlier suggestion, I initially split the=0A=
carrier board description into a separate DTSI to avoid=0A=
inheriting from the NVIDIA P3509 reference board. However,=0A=
since the SE70 is a complete carrier board product with no=0A=
separate hardware module, the split isn't necessary. I'll=0A=
merge the content into the main DTS file in v3 and drop the=0A=
baseboard DTSI.=0A=
=0A=
>...=0A=
>=0A=
>> +};=0A=
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.d=
ts b/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge->se70.dts=0A=
>> new file mode 100644=0A=
>> index 000000000000..a8de685f05ef=0A=
>> --- /dev/null=0A=
>> +++ b/arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge-se70.dts=0A=
>> @@ -0,0 +1,14 @@=0A=
>> +// SPDX-License-Identifier: GPL-2.0=0A=
>> +/dts-v1/;=0A=
>> +=0A=
>> +#include "tegra194-p3668-0001.dtsi"=0A=
>> +#include "tegra194-lenovo-thinkedge-se70-baseboard.dtsi"=0A=
>> +=0A=
>> +/ {=0A=
>> +     model =3D "Lenovo ThinkEdge SE70";=0A=
>> +     compatible =3D "lenovo,thinkedge-se70", "nvidia,p3668-0001", "nvid=
ia,tegra194";=0A=
>> +=0A=
>> +     chosen {=0A=
>> +             bootargs =3D "console=3DttyTCU0,115200";=0A=
>=0A=
>=0A=
>Why do you need bootargs? stdout property does not work?=0A=
>=0A=
>Best regards,=0A=
>Krzysztof=0A=
=0A=
Regarding bootargs =96 I checked tegra194-p3668.dtsi (which=0A=
is included by tegra194-p3668-0001.dtsi) and it already=0A=
defines the chosen node. Following the NVIDIA reference=0A=
(e.g., tegra194-p2888.dtsi), I'll define it in the main DTS:=0A=
=0A=
chosen {=0A=
    bootargs =3D "console=3DttyTCU0,115200";=0A=
    stdout-path =3D "serial0:115200n8";=0A=
};=0A=
=0A=
This ensures compatibility while aligning with the existing=0A=
Tegra device tree convention.=0A=
=0A=
I'll send v3 with these changes later.=0A=
=0A=
Best regards,=0A=
Jiqi Li=
