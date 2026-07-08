Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F4B3271FD;
	Wed,  8 Jul 2026 03:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.148.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783480656; cv=fail; b=QwXBx6FB48uplH/0C5bgcxehHBzGPvPTDiNHgXt8Jv/iPvnDIJiSa//EgoDnyrA7EyfQJPcGOBXjzDzNIgUPHqHxJz16XXEFnUAw1csCSfVmyJAdJ78p9nYYsnKppPHMX1zlH7UHk1i/D6gzIupqABxDB0Z4lyKs/TySgIzxxj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783480656; c=relaxed/simple;
	bh=z9dwWb52mxQJ9scqU7sJULp8Re7dW/VpWq4ac6VJ+bE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BTjEpQ4+Kry9jsSPAWtRy53OCGOfH0zuYPus3VHAaAiRQy+gFNgYxrpyJdfvq4QGV8F6Lcq0MkE/ogf28Fdp5tJUjU6hfv7Lv2Bv5cZVBcsgNVOl09HJejjnc8poGVztZSXaCqudzWeC/ffe89Nmu1DT+YLDgUVGxYWIJi8Ef/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com; spf=pass smtp.mailfrom=lenovo.com; dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b=FT0jD9lg; arc=fail smtp.client-ip=148.163.148.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.b="FT0jD9lg"
Received: from pps.filterd (m0355086.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667MaoQv1529856;
	Wed, 8 Jul 2026 03:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM202306;
	 bh=0jfcLEwAR3yiXhI5spTEjL4u7xRnaqrrHlaWRLOmxq4=; b=FT0jD9lgv6zI
	RVXBIrUSjTLczSpPQLCXFVhh5DQGUZf+mwmdkhexNrJtS3OHd+hGpHmn8IOZcrCa
	3HhQwvVt0ThJIqgkvtYe/ZApWxSy/ig5YsLqUZCT1keaKRa1RyY5jR7qhqI/xjBv
	uAvjJZLgA7j0/S6uvVIn0jbhE+x20CKCmwbn5B5vg53RHxY9ZemfBJG83wOYDgx0
	rvSrrMJlET43/F5Cn2gaHgHxDUbTGNN6B6e4NgI2gNrZdZPEXY+MCeRR2A1UNyBL
	6ig9Qe3ez2Nxd1R1eqePJR65znjGggzhqoQajptxiXEEZfxIeZZarRMVs+RQHYlg
	Fs3aTtpynQ==
Received: from typpr03cu001.outbound.protection.outlook.com (mail-japaneastazon11012057.outbound.protection.outlook.com [52.101.126.57])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 4f7fxgw5jq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 03:17:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QalOckWi+A37KoU6L4rCS1Cv+S3YQDwKB5oTeripbpgWcrT5D7d18L/nCGlX9ouua7IXzhQG7jAOdqGIRXpnZzOqQbirAXn6skieAhur397gsbEbDKcHyMIu/4pgK1DG4ZnZTnXX6hWdPYfQ7IT+ttMGeWix8wliRe9RcBxy9WDtLyaqM0KGPHPUE15S4O9LILd3qBhMJuBX7LB467/hhqADUdKXGu/JmB/+GTjqQPte1fe0wgv0hVqb1bq+yUDmAI2Un0NT6/t/o1zAXOGlQNuH0TTvqi0MWZCwe3n9OVK28mzS4SxSzon3TnP2eqJvFb9W8HnbTlMekVJlZkgamA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0jfcLEwAR3yiXhI5spTEjL4u7xRnaqrrHlaWRLOmxq4=;
 b=m+raT9HNGxj0cQOLEV1opTZztqz0X9jDWQxT4piTf1E9h8OZ4E3lY013hj8KE7maZUGxMKXCk6ybPqf4uh9w8c83Ad0HW6mFZl8co8TCfRo2KPBLtG+ifyoN4qYeiHLVmCzyl7EUPM1xOYp2594Tfvu7r8JGRkpYJbp9qheoeO38W2mhz6r2IRmilAO98WTwN6cw5etdWZp3wX0sT1fJPH0ATjOJpHFCgGnLgbCQuw2+0G+C4djnQRvaX6yOv3dvvTDMlD9rfJxCXuQ8/n0dR4YMOMfuvCQJEXxAnWcsf2XA8Ck7GSE8l1zkXhvoFLbmGE/hpyCwZbrcsH2u7vDxcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
Received: from JH0PR03MB8637.apcprd03.prod.outlook.com (2603:1096:990:8f::13)
 by SE3PR03MB9491.apcprd03.prod.outlook.com (2603:1096:101:2e9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Wed, 8 Jul
 2026 03:17:25 +0000
Received: from JH0PR03MB8637.apcprd03.prod.outlook.com
 ([fe80::699f:723b:4200:763d]) by JH0PR03MB8637.apcprd03.prod.outlook.com
 ([fe80::699f:723b:4200:763d%5]) with mapi id 15.21.0181.009; Wed, 8 Jul 2026
 03:17:25 +0000
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
Subject: Re: [External] Re: [PATCH 2/2] arm64: tegra: Add Lenovo ThinkEdge
 SE70 device tree
Thread-Topic: [External] Re: [PATCH 2/2] arm64: tegra: Add Lenovo ThinkEdge
 SE70 device tree
Thread-Index: AQHdCTjxqFFLh3hcGki6q863z60IUbZi7r4AgAAMxPo=
Date: Wed, 8 Jul 2026 03:17:24 +0000
Message-ID:
 <JH0PR03MB863759EED0FBEED43ADE8AC983FF2@JH0PR03MB8637.apcprd03.prod.outlook.com>
References: <20260701090639.669524-1-lijq9@lenovo.com>
 <20260701090639.669524-3-lijq9@lenovo.com>
 <qdp3icvlQKCtNtIxYUjG_A@nvidia.com>
In-Reply-To: <qdp3icvlQKCtNtIxYUjG_A@nvidia.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: JH0PR03MB8637:EE_|SE3PR03MB9491:EE_
x-ms-office365-filtering-correlation-id: 9ec6393b-c3ec-4d14-6e4e-08dedc9f6ed0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|18002099003|22082099003|4143699003|5023799004|56012099006|11063799006|6133799003|38070700021;
x-microsoft-antispam-message-info:
 gKneVzMjT/l2sOAD3mtaD4GRfbM9z9MtaMMJx/jI8mz4+M0NfcrAfWm0LZ83YngMZYVUPv5U6rdoq+voaOkwFWsEICaeRj5e5Z5ZhEI+STJ7xSyQ20fzW7wBhNfRNo/wW+uV58QPUMFJvmXme+N1dt6lYugq2NiKMQoCPQYNVRpUEHc7xB7EowO/alMdNqZeNBCX+IwB2yXMejP7Qc2BSJ7oGGfxNYBQj7GnNjE6R1tpxiaaVCV5ufgBrYwtPzEayJ4klDyIt68w6EIJbp6lwWMzOENfeenPc2dxIW5C7XBO2K/mexFEpzwW0KkhBCWSAEaTlSzYutzAcsKgGLce6lcZWAewXhFnmvf9Xv/z1G3slbuYEt9tUpwY1oQKVKKobf4Dpl2TxCqP7LRO2+2u0TzC0vax00zgaEikTBkyPIqY79xXiTWoCRw6/cj8jfuC77LEhNRDqBkTv3LolCBJhhEEBWVFfK/JLQtHOnK3ZgfHiXnNXnYL8VGlEajqdpxaJ8+7F7jLatv2wz1h9iLYFFbL42Vbr3dotTJ5nZy2sBe2kiON7rXcGEk7+OmfijpwxnyudyP18tMUomXGamADGNRXhcMh/dX87eA6ss+ixuSvNNCMzrdt/vwEI10JtZ8R84ZE0sjwuwGrremZ+of3C+Peuu343sSuKoVhz+WJKbW1rEWvkMTYjOaDyqJjjCGIYrvonVAA8Q7oylbS5jdlpsUsVCaO/uF+EkNf1Xu/FvA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB8637.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(4143699003)(5023799004)(56012099006)(11063799006)(6133799003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?8zQC+LsxgzbXV51xamLtEeFhhb1hwGukGosmF2MpHJhKG3xUNCWUW8NUa0?=
 =?iso-8859-1?Q?15deEUyvkMzOLAmhmcgn/hx+xKxSOBEgBFKfUpCmWSzFr+HMVmPjZgPEls?=
 =?iso-8859-1?Q?AsaT0yFzlwOq5RljAXxbmyFKxowyR6FZYtIUYjJHXLKjDxOZGnu695WyZC?=
 =?iso-8859-1?Q?7dWU6/tDNX54tCwcjYdYMiE9do4XV37iXP/2/cO+GR2oKYBlW6dCvgPBJm?=
 =?iso-8859-1?Q?8uthvjm5syRrcxkzp2Tb6GIjnmO1k07nhpcKofiwaTPZQHT2KIsdUtNjAP?=
 =?iso-8859-1?Q?oTeoFk71C/crBCnsYGREtliJa1HoRo9bxEGorbm2jPC3+u++vwsfWSOwfk?=
 =?iso-8859-1?Q?nDp5yKNChVq4iFirwQKVxsB5rJPxheBbV1whixGjkI/1t3tiy5AtI1bRVP?=
 =?iso-8859-1?Q?cZS+ienII+jT7vH1XQ27hnCATiRQPysk9k0WnrEeY60/xx56iw0mF+j+qy?=
 =?iso-8859-1?Q?Fa70VmHWNFmWK858ncmOg181qhpDfuzQAkXcP2aXAk8kDH4fJSZi3g2jM6?=
 =?iso-8859-1?Q?7CFs+AcAjiz/+S6n+iQ+TUVJvMU9csy/LHGz42lOFQ6kUOMJhxZDyeZUou?=
 =?iso-8859-1?Q?h8yAIxHX3Q9iQDSUf6rWoTFHMujZEDVgaGFiq9rQU7ayZvDY9KusjMn3IW?=
 =?iso-8859-1?Q?xFJSer8E+UiFLREivYvlJgIHpNPht0P/4/v5/Z11nLKX6ktuSh3WtyPZt6?=
 =?iso-8859-1?Q?RTLG6asT1Z9fwrEMogY3oeAxCq6vq32veAADDSP3mun0c8j7nCMP99a8x4?=
 =?iso-8859-1?Q?tHtoK7/stZp0JoXXrA7kFqV8OG8negM5/KxeJtYa1oISrO8edSWeuZMTeI?=
 =?iso-8859-1?Q?0jXVu5o0DjUyECapqk5Yc3Qg6l8+4y1Q4IyNmAKHSRYZD6BvtKlKvOOOdM?=
 =?iso-8859-1?Q?P8m/qxa3GW4BPLXWObVXJ1MZK/wNadou4qkU44UJ7bjaafYh+tuyszcckY?=
 =?iso-8859-1?Q?QsKTAIj91o74f5//QWG3fSJoBqqdQdLtOMC1SxO1BCAyXHhTDWeKiCI2ZH?=
 =?iso-8859-1?Q?bOjfs9HMR2f8zKY7puHnaCgrSXQQyMn2hAIJ9xI9Zp7D3AV9patsyfezIx?=
 =?iso-8859-1?Q?6Ut8sbVYoaDixVn0F5V+Qu6Cwo3UKxaD3Kw3XuCxM6x5tYJm2AbhXrxvBj?=
 =?iso-8859-1?Q?MFZJHzJxlY5WZvIm5ijl3bHZnp16LDFMB6+OviXJAU7z8cAgQF+bRoKktJ?=
 =?iso-8859-1?Q?W9KIC4s3ZKrHjbr9kesdtLcqtG2GYXrffS3zv6Cga2vWkQPKGVLP9r0yWR?=
 =?iso-8859-1?Q?2gTnFasAtl6Iu38cYIFcuFKGWuQT+yL/AeWc21DJjlZYvK6cxOhgYDxaea?=
 =?iso-8859-1?Q?j7WaLe/QT73v0w/ibSvYdXfFd5S/euco3lERfQEcTkK37g6ji0/W7MNc38?=
 =?iso-8859-1?Q?u0AvhdyJf5AjJzjzO7M9RYdgRMuZMtfjE+OsQe19IwBki7vKRgwwCo6hLV?=
 =?iso-8859-1?Q?ophhQyQ0LKeC3cLDsTTuH9erpF70B06oDTLbqVF4vehy266kCJMIeBJSYY?=
 =?iso-8859-1?Q?4iLD2lrwcvQkqenKcoquG+k4b1Gdzvb66XUl9Tc97GgP54L8pDfZRPbRRw?=
 =?iso-8859-1?Q?TcXLeJEz4sbdTA1L+MX79ss8ay0I2UjT/t9tqQTl5B3HrW9r1dlSs8ItIR?=
 =?iso-8859-1?Q?OE2+aYTACJIfkUoyyKs0fc6zBLCyVFVgdp2bs7ReyadUVO+2OtIGC7dp7T?=
 =?iso-8859-1?Q?ruXRUbcLZjj0oek/1wyxumxOrLXbG5zXNIOYBWxcBuY03+hEJZmceQcLgq?=
 =?iso-8859-1?Q?ARfPXVLn0HnPu8lGR+phFmwE9Jmvz5SIZPubVQyA/E7/rq?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	huZ1XATGEMf/lvmfApYId0k3eSI4uhVQaJXpI6qGysTyUgICS5Tkms0N6Z7HB6MW1wpLz+T6q+wJ4UVIQ6ddWn4g4BP5AAIeJMvxw334em0XaPElTpN+KNju6GgLc6M9HWwmnNRjtGbvZM/oe58Xg+4G0gY6mZmINQm1vJfQxua5yxdIUJVZ1es0wRUYeapYGpVrsyEi6PmmSjePrGAbs49aHEL5wxgrHq+jSl4ATh02ZtoVfZ3iOxc3jb/J5RvIaEVFdAZkzGlh+XX2Ws2w32wK1FlQVphJqM+WN4oFZ3C57jn+kEIjxK4jbi1OybVg87eWsBJ1ekyoG218sZG0Lg==
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB8637.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ec6393b-c3ec-4d14-6e4e-08dedc9f6ed0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2026 03:17:24.9728
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FpUAxvJ9TrkGNOXFQsoD3s28QrWr8wGm2G9hYlT94V4dwgxW1b40ijCdFDCQvVxQNGLmbLH4+fCNBTjUFRTJgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR03MB9491
X-Proofpoint-GUID: IqLNusX6VrpFh7sia-BE1kFHhrE5BS5_
X-Authority-Analysis: v=2.4 cv=OpR/DS/t c=1 sm=1 tr=0 ts=6a4dc148 cx=c_pps
 a=cXgjlB4WNwmhKq7J5cQgfA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=hJVLCblJc-VYA0_z04R5:22 a=8k6WQxmsAAAA:8 a=Y64CQvTNjfaGe2oV3P8A:9
 a=wPNLvfGTeEIA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDAyOSBTYWx0ZWRfX+liiFlBEy5o7
 kMGot2SIh4qg3gwLGvZ0xdP2xHncYD4Nu4BAfyZUhJ34gnzJKLDc4lQ9JIDY8iacd3Cq8/DMSTQ
 c46Z2K7gVSdr5v6dUv6uqamsbhDss9f/c9BLtTC1ZgNPS5G8eKwtzp6Zsl8zDUdDwbhUEEo4BSW
 FGkHfcyBPBxza3vYEcpr3q2gJXZiVvFpYlDRGep85a8bqeo3MUXsEClqxtdCtrqsVpslJtUH7oB
 7KZLYnOfJ8B8SCvgpskOR5PWoEjP0ixfWgxRQRY1UsbBVgQBkPVuS3cb9WmD4G1KNtd5P9tOU5k
 xrIipPIbP5z6GAZ/tvSJaAe6Ai/ETkQGc+bOo4UmfVKELlFI5S5rMnMv7OC1oWyi1vadMKswV8j
 o/utacUuN8iuQlNFeRmFfpR6OPzeCSIS143SvxGxJNtMuSmNThrnJl44E/Y6EjvHt9bVCvQlLWv
 4N118LQE8p6bLsXNayQ==
X-Proofpoint-ORIG-GUID: IqLNusX6VrpFh7sia-BE1kFHhrE5BS5_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDAyOSBTYWx0ZWRfXwOSlphRYR+Y5
 KHGZQlegtSRnZRBVdKRv40gthDe7lOsGboVVGerGREgXOwh99meqvxjXKTgZ2vn36o4jwK9b9ip
 nxnRlrOFEO7TRn1JAYrPMlpYVbSX0ng=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=-20 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080029

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
>> index 000000000000..530d5bcaeba7=0A=
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
>> +=0A=
>> +     vdd_5v0_sys: regulator-vdd-5v0-sys {=0A=
>> +             compatible =3D "regulator-fixed";=0A=
>> +             regulator-name =3D "VDD_5V_SYS";=0A=
>> +             regulator-min-microvolt =3D <5000000>;=0A=
>> +             regulator-max-microvolt =3D <5000000>;=0A=
>> +             regulator-always-on;=0A=
>> +             regulator-boot-on;=0A=
>> +     };=0A=
>=0A=
>Nothing currently references this regulator. Should e.g. the SD=0A=
>regulator below supply from it, or should it be removed?=0A=
>=0A=
>> +=0A=
>> +     /* Fixed 3.3V power supply regulator for external Micro SD slot */=
=0A=
>> +     vdd_3v3_sd: regulator-sd-3v3 {=0A=
>=0A=
>Should be called regulator-vdd-3v3-sd.=0A=
>=0A=
>Also, please move the regulator nodes to the bottom of the file=0A=
>matching other device trees (alphabetical order).=0A=
>=0A=
>Thank you!=0A=
>Mikko=0A=
>=0A=
=0A=
Hi Mikko,=0A=
=0A=
Thank you for the detailed review of the regulator nodes.=0A=
=0A=
I have addressed your comments for the upcoming v4 as follows:=0A=
=0A=
1. Regulator naming and placement:=0A=
   - I will rename `vdd_3v3_sd: regulator-sd-3v3` to=0A=
     `regulator-vdd-3v3-sd` to follow the naming convention.=0A=
   - I will move both regulator nodes to the bottom of the file and=0A=
     order them alphabetically (regulator-vdd-3v3-sd then=0A=
     regulator-vdd-5v0-sys).=0A=
=0A=
2. Regarding `vdd_5v0_sys`:=0A=
   - After removing it, I encountered compilation errors because it is=0A=
     referenced by nodes in `tegra194.dtsi` (USB padctl) and=0A=
     `tegra194-p3668.dtsi` (PMIC regulators). Therefore, it must be=0A=
     kept in the file. I will add a comment to clarify it is a system=0A=
     supply required by the SoM and SoC layers.=0A=
=0A=
I will submit v4 shortly with these changes incorporated.=0A=
=0A=
Best regards,=0A=
Jiqi Li=0A=
=0A=
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
>> +     bus@0 {=0A=
>> +             /* 40-pin expansion header custom pinmux configuration */=
=0A=
>> +             pinmux@2430000 {=0A=
>> +                     status =3D "okay";=0A=
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
>> +=0A=
>> +     };=0A=
>> +};=0A=
>> --=0A=
>> 2.43.0=0A=
>>=0A=
>>=0A=
>=0A=
=0A=
=0A=
=0A=
