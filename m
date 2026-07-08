Received: from mx0b-00823401.pphosted.com (mx0b-00823401.pphosted.com [148.163.152.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0759126ADC;
	Wed,  8 Jul 2026 03:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.152.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783479877; cv=fail; b=Cry7ur8DAbL9Gwtl+c8zBowk/G40GdSaUQFAmuc8fibqhxosWnBgEeDPMAVoPikcwbAcZyPv8KXz1jJBSeqTDe0KMs2xnI8w6TCFW/vqxnKXQqNfdBG7MsISfUJoPaW6vK+VAUj0uHFpH+GqaPzdbu0K5FMASbckxNYkHfvVff8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783479877; c=relaxed/simple;
	bh=tzzxX2C6Rnue9WmwWmYzUyLWqfa3SfTYjQhJZYfK+7M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=K7k+hDR6ST0COJiwss7vr3hyHC0dUPLA82H1Ca+XQsr6xZRehRGriq4EG7zm7WcmPj3LFiNRwjtv1OBNe0DIcFgYZi8s7cKUQ58eJ8e9dYypox3eF35f4U68rg7/SWPWpmviTQNzcadr6nYBfW68ODptE6Cgwtdq0ZFxxpUAxxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=1h0vJZ+x; arc=fail smtp.client-ip=148.163.152.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="1h0vJZ+x"
Received: from pps.filterd (m0355089.ppops.net [127.0.0.1])
	by mx0b-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667MbNb41517747;
	Wed, 8 Jul 2026 03:04:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM202306;
	 bh=O5oofertHlkob9CBq4Q7vcO4on1jJFyF6FIpTXEpBxA=; b=1h0vJZ+xjlaG
	n9futU9y8YWneyWQD7+UTx6f6HNgn5Q9tuQe0Y4UD3/mhwIfy0zGAWAeeFLQztFO
	yTIK5myXlWiOWpTSOau6pYzQXoyp2xi0qRWDBLw0yGjZjRa1olTK+ITnh9j4P2Oh
	hTHP1BFsgvt+0d7Bf2UirOMIUMob3aW3pQXk099gaqiP6uSzD/D30Cmy9fUwHK1q
	C0q/qCVz1JctJoqDCnOFd4EMY7tigPp5sGCoDP7PYnJjThdX7wD5tdcrlHOSeVJB
	YAOnG++FEtmU3Eio1pJpQRNlFgvgOD61zfk9N/jES3OaGQT7CuG9jizdyx3HMR2z
	jxKkOh24Ow==
Received: from tydpr03cu002.outbound.protection.outlook.com (mail-japaneastazon11013007.outbound.protection.outlook.com [52.101.127.7])
	by mx0b-00823401.pphosted.com (PPS) with ESMTPS id 4f7eqmd6fa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 03:04:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X+gHc5JBKZaVak9QQI5vuhf3F4fEmAzdyFkDQT6BwE+d+VjSNYRTOfgeB+103XZAJVGMfIAUaIx96YbUF+5ZJsZHWF3wUpRYEW8zcWA8eB69mfvwTb7bVCZUFAHJSPO2I6uY/kzSkvmPUk4XLFRehluQaNfeACOfR0xouh0Exerr/tEGPraz/DwxlsUcKSLjJPnDhjdRnIYJAG3JrItxLDRPll/ZO5uMFRCU/IM10MioDDi//CszfG343EY6QuYQPKf+12XIC3uMjyMJAT48p8DtxosSlbCFJryu0LrS+FwoPZtk38rIh8AxM6SQGXpqE/5BHyVFqYwRXJ0mkOkNpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O5oofertHlkob9CBq4Q7vcO4on1jJFyF6FIpTXEpBxA=;
 b=qViAl9gm1eJd2NIIF0B2YjUr5ThXNanrtP+Y8TqGR3e4W16MIPld4842amV8DnJspD3SwPtJ61AXGZQe3NrHoXi17KmAZAsXiHrODJ2VFNtfuZvqovewAoFFjhnlILXSxKNZ5YdrqrarQvnMcVzrancRAe3kq5hf7H2/wjkpQYMaLUTDqjLOcH58ar4Nr9FP7PtKe+dE/81xnm9JsyY0Vn8+p1Q0y+kcB+aQ5vRbrNij/1pcjvLxxpDYBzw5kOHMohY/zZWKJMDtNG0Ij3zpBJuoH8v7LoohhQ43F5r/tyBhBdIQ28IP0cV0luXusbyXW0JGwicEB/hMunpeEcyvPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
Received: from JH0PR03MB8637.apcprd03.prod.outlook.com (2603:1096:990:8f::13)
 by SEZPR03MB8205.apcprd03.prod.outlook.com (2603:1096:101:199::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Wed, 8 Jul 2026
 03:04:18 +0000
Received: from JH0PR03MB8637.apcprd03.prod.outlook.com
 ([fe80::699f:723b:4200:763d]) by JH0PR03MB8637.apcprd03.prod.outlook.com
 ([fe80::699f:723b:4200:763d%5]) with mapi id 15.21.0181.009; Wed, 8 Jul 2026
 03:04:18 +0000
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
Subject: Re: [External] Re: [PATCH v3 0/2] Add Lenovo ThinkEdge SE70 carrier
 board support
Thread-Topic: [External] Re: [PATCH v3 0/2] Add Lenovo ThinkEdge SE70 carrier
 board support
Thread-Index: AQHdCTjxOzozK4CqtUahAUjjsEWOYbZi6CgAgAARo6E=
Date: Wed, 8 Jul 2026 03:04:18 +0000
Message-ID:
 <JH0PR03MB8637D0FA3B8FAC7C10BADDB883FF2@JH0PR03MB8637.apcprd03.prod.outlook.com>
References: <20260701090639.669524-1-lijq9@lenovo.com>
 <TwdYRdQxROulqyHmM20o9w@nvidia.com>
In-Reply-To: <TwdYRdQxROulqyHmM20o9w@nvidia.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: JH0PR03MB8637:EE_|SEZPR03MB8205:EE_
x-ms-office365-filtering-correlation-id: d538af6e-9bec-4427-30da-08dedc9d99d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|18002099003|22082099003|4143699003|5023799004|56012099006|11063799006|6133799003|38070700021;
x-microsoft-antispam-message-info:
 XHBNSxWmeVlJQqfpnNEDyd+1/c80euYCgEYOK3HSQNl24rQTPkTVS/CNw4Vhc2accw+UXzjFV0LmFd7ftmm8FwNdOB0eK7a1vddLO4W9zHvYR52haDcEAwL1HhItajdRx7OaLwuyfVYA/2tsV7c1mTPnATgp7RS25qJy1+adbeowrjQN/1ZqyIPP1x9rNVXQzirlOx7QW2HVEfo+t8IiXJEuRWAtL7HkRhZFtxzlQhIgsM64KRxUY7LH7TjATjGABYnTBLvkyWmllyfq+Mt1PcqGpwSOr5QqvSTj+0/k2lNeqyVx3BnMvJ4ATUg/booMs8/t3jdiy6RbPa/hLJhNtDVQOhaZRwfI/TPFiCmOHKGeI5xL26WLC4WSXP+ZmlZZYb4Y8G3fvbMh9NidBtzGE2ODe2WuM971jhaCzKCcHybvgkN2M9KE9rZCDfwOUiq2p988xP3tMfP1g+pRZjz23nLEgI/42hRRus+diw/utfYbuJlgqWhxVGwTrjBck/eLiysOJoGt+RL0ALBP04RmQUOYrCKmpyEJnq+K8eAS8O7SIkLDEiOIoJrw1R5rGTIuM9jG8hjKUM0iFeQ9omcqq4/lUfT+aP/fB3Go3DbEmcIqC0VkX54KQpHjZ+Ahd0BzF0qWTOWQefcRCaeyfTUFHhMHbObu0Ee7UI9X8B6WOIrH7XJIdeIEskYG85RQz1nFjfEo8F2Vo+DJ7a7NtUnagWlwT6Pm1Qrx9gpZRwoSvfk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB8637.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(4143699003)(5023799004)(56012099006)(11063799006)(6133799003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?sme2T1y3xPvmHOx6Q1wUeZbsIyoP/Ni7+hvJTNNuoLa3Bn1nf0J2yivOCx?=
 =?iso-8859-1?Q?PanVQZNmDLWZhx2slRMH4dlw+CXT7/++atJ7nX7FfrFM9TtGxZBcC6msyb?=
 =?iso-8859-1?Q?D2sbSuLstxC9lJKtGjp7pWcmXrjYH7kHR7dUcxCDEiVcgNSW5WaDP8CaaU?=
 =?iso-8859-1?Q?UkaQ4Un5w3XC2q92/7hw0hN0ICLBoFjL5bkyzPmNbdW/dPjdtVt5XIoPf3?=
 =?iso-8859-1?Q?Movwn+Jt1MzNiKYzKmg4Oyg3JBfAKkHJj1fK8YrI8jG+ZtrbeYK8nskki+?=
 =?iso-8859-1?Q?6tBXinChNp3ItcYDwgWpVcTD5hM/jAUYblzWdN3MyLZdblR+H5KAAPqHpF?=
 =?iso-8859-1?Q?NNcsr1X/Yjz1bgcErf/RDnqTlhZB0rrz6YW0lTPTQqeoRvufio5pX3t/3u?=
 =?iso-8859-1?Q?f3S1FTBDaJ1bNJkNUj3zXczM7OUKRLZqPuIQnQxprjU2R+veQxEWd0xhyk?=
 =?iso-8859-1?Q?rx44yiNdGjF0m8s34evp72X6wW2FOGopEX7zVqxuG1R+kkqd1Mwdn3o4bo?=
 =?iso-8859-1?Q?eGnFkVaxd2tw8l7O3gQqIQK/qAdzhTqgybuBQcblOHojQwEY33YWZ6tuc9?=
 =?iso-8859-1?Q?n+KJMv48gvNBufeWJTkQSeuGVRUEoIlVFyZbMhenW0tE1wAcDsFyyYSy4I?=
 =?iso-8859-1?Q?JqlM9gaWYAfnxjBoUG7It14uDNc2hIHhj7Vvppw0ril3q6Jc3Sh2v9QYAS?=
 =?iso-8859-1?Q?2/OMlfAh4Yf2t+uf0TOsoQCovvubDe0sIabTaDcCjx1BVAjxxOIMQzfFx5?=
 =?iso-8859-1?Q?rvPXCNS2sTei8MylpaUYBQJnyzBrTEhf27Rxnd7/dtFr8/OnA/jX4Ifthl?=
 =?iso-8859-1?Q?/IeqgeUDGNcWiLAjKGiteHKveI3gWIdnd+ZKEPBDNr7hz4LPTDJmixwfhK?=
 =?iso-8859-1?Q?TP8SfmVup2SSVFMBt+ndjaIjAEcAo0Cc0FaTpJtghhKf+RYPSJvYMdxQQD?=
 =?iso-8859-1?Q?BYpUo+NFukNjAkeomTFXrpKsD2u/TtItuFwGVdhC+vIt1oM2aqQeEX1n+F?=
 =?iso-8859-1?Q?ViyZPFL+aWBUnERdmiLHCJYEIPatPxJBqk+nT1YdsOjPwqqaT9/l/9RANJ?=
 =?iso-8859-1?Q?2N0skUSL9oV76Y6QTC1iTb50BlB7KNPyHZ9qgV+Ge6fag53kM49LzD2uk7?=
 =?iso-8859-1?Q?3N1QPDtEoU3EbyI6H4VGHdSOxnb2ZN9eFBvQ09idTWIaeSLoYj8knxEAuG?=
 =?iso-8859-1?Q?tU7+VmuJAe3SokWZ7BbWMyei+26zkRG3JyZQc2tt9L9lyYw4235k6zC4N3?=
 =?iso-8859-1?Q?8F/QRbq0FuAjSqrF8Tbq0jTKhHTC7AvEcmZdI1P5aXtU2B2aZ243xqcjwj?=
 =?iso-8859-1?Q?lHaNZM7SMFFo91VoCabALgdpQnC+OuVw6MnESOfVQjpTwwt9+ONL4htUEM?=
 =?iso-8859-1?Q?b99M9t0PmwJdKBMZVYYSRgzzVysn+19mN1H82BaoU9OF96y07ZaZpnCtNb?=
 =?iso-8859-1?Q?zZ3zEMYAIGRi4mzQjJGcR9l9qYwonhMlhKsqX7VUMXC0gBpsno1PytmGcq?=
 =?iso-8859-1?Q?yDe5D9XWbrz2oercNckfMqxQ5MLBRyfZv1MdkhBPo2Wn2hXg8bt84BuQ0d?=
 =?iso-8859-1?Q?Jt9XljcoXf+SLazU3NFc6YzQl9dynWuBjtIWr7zvHW6ddINYSKAyv1nYD1?=
 =?iso-8859-1?Q?X+lY3wXz2/HXn0TIYjJfrFtJ0rJ7KZ9bc4NV8QWpI16zSr0x22R1jR9hBn?=
 =?iso-8859-1?Q?z0zNomWhCvqYbNIY02uQVF5Hh77G/F5YJ8zLOZz9S0J5Z3agccM4xuiLRz?=
 =?iso-8859-1?Q?K7W0RGM0kFhzYzzcbSDGW4IV3RJpUGPKEfltPxIvqN+Tr4?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	cAc7FY98+Re8DGTlwZojW5Wau7ZG0iiInGvkoCnXkk7VHrwlmwML+jLwfybiqBv9yXJX4z8ouYk7aKS3OQuhlWVN6/ZzLxnatpa2yUZp3uQvH7Zz5mtC2XWkQfSmWsmf12e/b8b4zhYD+UQ4conGr6AVTXfGSBPTIEc4XrDc8MX9XaYIRZZnI+BcRMbdtEwM0drVY2/F0UxwjWNcpHIJdnQdabsw/i7yeh9cSEsQY0CzfFnkJJ2qMgjHGhH9yuTiX3SphWIoN7PozeTq6c2m4bQYbU1QjlDCY1IWVPXBYIAltGzNoCdZMSnT/ZOfT7uwbcQYy1CidlSsBVAJpW5zpg==
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB8637.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d538af6e-9bec-4427-30da-08dedc9d99d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2026 03:04:18.0914
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6YDbNbQoQ0B2iCXihe1KOZ3+H6FKeu0GwPTjGaZAG7iQaRiU+EggWT21n2DnbYUBwkFR6g9nE/nZSfS9+K+neg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8205
X-Proofpoint-ORIG-GUID: G4o_h2tJ8ZIs0tRWEQWCMykxpgc_QpXy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDAyNiBTYWx0ZWRfXyWg2tJmN2SrR
 IlY+L/ssF7XwSgGiyS7VEXUHLbOEQGqpWBvDSS9bXxG9iyC1EwpuPtXTyz2V+b96ydss2gPIF1k
 LLLsjZbocLxttU1V5neam1H7nZljQro=
X-Proofpoint-GUID: G4o_h2tJ8ZIs0tRWEQWCMykxpgc_QpXy
X-Authority-Analysis: v=2.4 cv=M7F97Sws c=1 sm=1 tr=0 ts=6a4dbe37 cx=c_pps
 a=VhINkPhjMBZxqZI0y8VZxg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=j7ft8fR0phhCBGdaz6r4:22 a=z0sgJKrax1YI2imw96gA:9 a=wPNLvfGTeEIA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDAyNiBTYWx0ZWRfX6I1kLNV2cfKb
 cUspNsvlDeTUVTeX6gA6UyIy+leGvsPeIDFLjXTHN8hD8LzCIMrgnXp4w75riXmtEXPQYQVvoBY
 6iPW+WgOOZnMbI+EjCpFG4leNflVcQGpXOEKufhDBlT9EgKBdtNCKN74r+rkhzQ2C3pyDyB+rWb
 HvE8PFAL/Dvtj5Gwf3kIsO5aaOsveLTONlrNyhYxMR/x8V91fn56EjSmdcudL9tPvtllj51n1aR
 phig318X19nLThOyx7kPqfGz35v2MWm99ubWATai8h9HBnKZnbOsl8EbF2HgYJudeiJn5h6xd72
 hXRKJXbYTS2QkwbOqxZFm/9Xb6ESmptPYVJbzMPqAXnXVTnv20Dqq//ok8Htox03uSrb2jMLGLo
 somHjjx8K0fQakBO5Pl9U2VGDtKiWi/XNVDVGMehQX6z/7qbRHudgmlqjFF0ajyAki5CmLVODco
 d9NcS+aS1SpFpW84GZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 spamscore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=-20
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080026

>> This patch set introduces device tree binding and standalone DTS file=0A=
>> for Lenovo ThinkEdge SE70, a fanless industrial edge gateway powered by=
=0A=
>> the NVIDIA Jetson Xavier NX module (P3668-0001) on a custom carrier boar=
d.=0A=
>>=0A=
>> Patch 1 updates tegra.yaml bindings to add the three-stage compatible=0A=
>> string matching board + SOM + SoC, following the existing Tegra=0A=
>> carrier board convention.=0A=
>>=0A=
>> Patch 2 adds the complete carrier board device tree, including:=0A=
>> - 40-pin expansion header pinmux configuration=0A=
>> - External Micro SD card slot with dedicated 3.3V regulator=0A=
>> - I2C bus for 40-pin header=0A=
>>=0A=
>> All static device tree checks pass: dtbs compile and dt_binding_check=0A=
>> complete without errors.=0A=
>>=0A=
>> Jiqi Li (2):=0A=
>>   dt-bindings: arm: tegra: Add lenovo,thinkedge-se70 compatible string=
=0A=
>>   arm64: tegra: Add Lenovo ThinkEdge SE70 device tree=0A=
>>=0A=
>>  .../devicetree/bindings/arm/tegra.yaml        |   5 +=0A=
>>  arch/arm64/boot/dts/nvidia/Makefile           |   1 +=0A=
>>  .../nvidia/tegra194-lenovo-thinkedge-se70.dts | 113 ++++++++++++++++++=
=0A=
>>  3 files changed, 119 insertions(+)=0A=
>>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-lenovo-thinkedge=
-se70.dts=0A=
>>=0A=
>> --=0A=
>> 2.43.0=0A=
>>=0A=
>>=0A=
>=0A=
>Your patch email formatting is off. The individual patch subjects should=
=0A=
>include the series version. That's what you should get out of the box=0A=
>with git send-email.=0A=
>=0A=
>Also, please don't restart series numbering. The above two make it hard=0A=
>to track the series.=0A=
>=0A=
>My strong recommendation is to use the 'b4' tool to manage and submit=0A=
>your patches. It will by default result in emails that are easier for=0A=
>maintainers to work with.=0A=
>=0A=
>Thank you=0A=
>Mikko=0A=
=0A=
Hi Mikko,=0A=
=0A=
Thank you for pointing out the formatting issues. I understand that the=0A=
individual patch subjects should include the series version (e.g.,=0A=
[PATCH v3 1/2]), and that I should not restart series numbering.=0A=
=0A=
I will prepare a v4 version with the following fixes:=0A=
- Use `git format-patch --subject-prefix=3D"PATCH v4"` to ensure all=0A=
  patches have the correct subject prefix.=0A=
- Keep the same series numbering and clearly mention in the cover=0A=
  letter that this is v4 with no code changes (only format fixes).=0A=
=0A=
I will also look into using the 'b4' tool as you recommended for future=0A=
submissions to make the process smoother.=0A=
=0A=
Thank you for your guidance.=0A=
=0A=
Best regards,=0A=
Jiqi Li=
