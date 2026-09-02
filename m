Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012013.outbound.protection.outlook.com [52.101.66.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076DC39EF19;
	Wed,  2 Sep 2026 08:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788337307; cv=fail; b=KRn52hmo6vKq3FxbC82LPeh61LsLkZTnrFksvUzNHXoAgiUt4wxkTSIc20DsttSjdFOiVfvKUHIa6+LnKVv202KYdcT0OEnsrYBZ9u88RoswHFYVkCrrV4gISBOrwM5FoMrjuxEVXkirDulj+jTjqaLWJS/x6T/vlwyjYoEgOoY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788337307; c=relaxed/simple;
	bh=Dnr59P3+iBlcT31Fp0AwSssYYYXgV1vPd09iXq96WFY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=o1tBtQpaW04C+AJO3MuUYv3RZ01CR7VZENyaD/vAht9YvUg5kd4GMbpaa6UuP1W/QTfEaU7lFVK+aM+/3bfW2FlGG4pzeZRKVAm1JeFrdai8Xk7spsaCBQ+/IArANWbcS/m38cjxeeVkr1LC7zhXEv07KeOS4tSbxunPBAw99Xg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gPUIiAhY; arc=fail smtp.client-ip=52.101.66.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gPUIiAhY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FFOKPI1uJG9Ntu2279gUbrbp11wgACDNgkYyIy3AnT5IibxIEOZhloEErtScV4ozZb0p43z7X0UkPu8zi2L/tjo4RJPlZVmwp2QSCoS02sGGscrOyWdJcdG2eK9pGd9zVybU+ieMc0pvo5BLsNbjmTxSxzNz8gCvHX/66yICcX2/tbFJnesBgueekyPT4VcE0yZxviR9UvcFrkhrl8b6QjFVZjcos+rpJ1EF3gSYY4BRyIf1WwwOVrGhmN8R3moKfxfpGBDOXamdMHfQ9GHF+uFdVxUoVB3pXrdcEWJmMoBKr0azHVKyjwqCcAd7FuHgWajyKkGVIzu0HRP/xoZmVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dnr59P3+iBlcT31Fp0AwSssYYYXgV1vPd09iXq96WFY=;
 b=RuO4G1jwHq8CACh+VySsF/iPrled9dhclDGEvDHBMDS8dN+xHY6TTzzaBNIe4L4AS5xtCH9ae7B3LuttnT7xTlSUcmOWXCCPH46MZV+lQrkBikvYdxLT/Lb1SLH1Jd8B4t7kE9gOA6z83nTePUf4z7QdOvi8T0vfy3xt6wFM9Jil74jsnliAP4iuAnNT9aNbAI4B9F8dSz43RkVMtLh9Mx3aw1rDwFc10lNouZlrX5JIatYJCh4d/TPDO8jtnuxtou44lEzNh+AXYp4F6U6kXsHgydibUJzHvauFvzuEGqAdPzt2oU/PLM7ueDXHjIyn3l95It0nDpDLtrqdGw/uCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dnr59P3+iBlcT31Fp0AwSssYYYXgV1vPd09iXq96WFY=;
 b=gPUIiAhY3aygY7bNXxix8iXl3hvBckJUY5R8nT8fubZS9w9RkvJmEClZRLBFIhHUMJQwAJTixsSkjTo2NmI4+XZSL6ttYQ49t4Xg02tZQwkb2QsvHSeKh7X41KccsCwliPRXc980HA7PoVcx8g7qlvBf468EEdXZYGS1oBxJ/I8dxTpwUBg3yDe4wMuo12WFuMIc4EaHKJiB9zFaJEaYm3wWqg6jWfvaXiFLZTTen4QC9fk50HvJpit/mp+OTitlVv1B8Oeds8ktCyVn2z0+DZfJkSephF7rjIZ0YNGrTdj6zfHiBRN+lF3dJTdDPMcSvyRwa/yipz6mCmmZ2AApDA==
Received: from ZR6PR04MB375776.eurprd04.prod.outlook.com
 (2603:10a6:910:dc::10) by PA1PR04MB10442.eurprd04.prod.outlook.com
 (2603:10a6:102:44a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 08:21:40 +0000
Received: from ZR6PR04MB375776.eurprd04.prod.outlook.com
 ([fe80::b83a:a0f5:2b29:50de]) by ZR6PR04MB375776.eurprd04.prod.outlook.com
 ([fe80::b83a:a0f5:2b29:50de%4]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 08:21:40 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Ryan Chen
	<ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, Stephen Boyd
	<sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Billy Tsai <billy_tsai@aspeedtech.com>, Nicolas Ferre
	<nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Taichi
 Sugaya <sugaya.taichi@socionext.com>, Takao Orito
	<orito.takao@socionext.com>, Linus Walleij <linusw@kernel.org>, Avi Fishman
	<avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry
	<tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen
	<yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, Sudeep Holla
	<sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, David
 Lechner <david@lechnology.com>, Abel Vesa <abelvesa@kernel.org>, Frank Li
	<frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel
 Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Paul
 Cercueil <paul@crapouillou.net>, Santosh Shilimkar <ssantosh@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Vladimir Zapolskiy
	<vz@mleia.com>, Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski
	<krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi
	<cw00.choi@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Dinh Nguyen <dinguyen@kernel.org>, Viresh
 Kumar <vireshk@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	=?iso-8859-1?Q?Emilio_L=F3pez?= <emilio@elopez.com.ar>, Chen-Yu Tsai
	<wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
	<samuel@sholland.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, Thierry Reding
	<thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Kunihiko
 Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu
	<mhiramat@kernel.org>, Ulf Hansson <ulfh@kernel.org>, Liviu Dudau
	<liviu.dudau@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Michal
 Simek <michal.simek@amd.com>, Matthias Brugger <matthias.bgg@gmail.com>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
	"soc@lists.linux.dev" <soc@lists.linux.dev>,
	"linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>, "linux-sunxi@lists.linux.dev"
	<linux-sunxi@lists.linux.dev>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
Subject: RE: [PATCH 13/45] clk: imx: Make sure clk_init_data is fully
 initialized
Thread-Topic: [PATCH 13/45] clk: imx: Make sure clk_init_data is fully
 initialized
Thread-Index: AQHdMUshdAE051jZ4E+/rwVFI0+pQba7BWSA
Date: Wed, 2 Sep 2026 08:21:40 +0000
Message-ID:
 <ZR6PR04MB3757768BD7CFB1176AE69BBA8488B72@ZR6PR04MB375776.eurprd04.prod.outlook.com>
References: <cover.1787239813.git.geert+renesas@glider.be>
 <7300fde72b6449d2cd7c043e4caec9a6c4171424.1787239813.git.geert+renesas@glider.be>
In-Reply-To:
 <7300fde72b6449d2cd7c043e4caec9a6c4171424.1787239813.git.geert+renesas@glider.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-09-02T08:21:01.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZR6PR04MB375776:EE_|PA1PR04MB10442:EE_
x-ms-office365-filtering-correlation-id: 3b525e9f-60ff-4b6b-e763-08df08cb36d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|376014|7416014|22082099003|18002099003|56012099006|38070700021|6133799003|11063799006|4143699003|10067099003|921020;
x-microsoft-antispam-message-info:
 KS4XAauf8aI2gnt9WAHXQGpLNYyyqLPug6fkCh7BHq9uwa6S7uIV5+GQy6kqhkz5IFEc+KvhuZQUUkf8XTb2e0u+1uZjAUDpoOCnaUcxWiulSrhf2YNhh53DTjWH9pPxFBOkRiv/0CGe34PppvvRJ+EXobVlj+SlQlnxuYo8wDkuMsKSuhAuPZyVpZSqQ0a1+238hSBWDIOQe5qMuguBEw7cugcAMmPr99WWWTCDSOAHcibFf8SaadknuZfADf7R/g261OwHK/IeG2bjZbKJpFQGqzzGeqhuaprlwdAs0+nrNd4BlQtR+AzCqzhIR4Jfyrwfdza5fyu2KeVUS3hyqvIuS51YIpH3JBjbZ6lg0xqqrzALxbUBTRsewW82PIbf6NY7ImU/dHbOGgF6fRHBIwENo5vkOXr/l7/Ms0EFOoKQCK187hXc80A+E7MKrS1WQ3zX8q3zMSSAF6NIf75X0qzoBX4sfWROp3qQKywcA0FFQM8PvxEdDdZwpczvjI1pydoMYEmu+IEcxHFI7XDpiXM6H3lhSWo1LrW4LZubMVAZ2MQgn9CkszvWZoXgFKVk9d1wHMRQaXfvs11FHahTjY7VdqdqT6VTaUaRlh1p78u2Qpbo2bgbJn7Ex5JQI7G45yRx91yMgdpLecKCIr+cn5g3MFPE5V12mD1bBCBDbDfQ/r5OjxCeeF1yCOrOhYsiLYTqpFXMIOPVx71wndh4Pjy71DZ8GNS2qrt9CPKUqUk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR6PR04MB375776.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(376014)(7416014)(22082099003)(18002099003)(56012099006)(38070700021)(6133799003)(11063799006)(4143699003)(10067099003)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?lpLwwldFWTBamxk3Jp2hBv22PNzdAAPkFSY7Sc1TbeM5i7xAvgudw50n3s?=
 =?iso-8859-1?Q?/RXyHpbAGiiGQyjLEBcTDW2+SQiUHkPUYLXMsHUsBCoyeQJz5GPnpLRMDR?=
 =?iso-8859-1?Q?l3rgRfjSLodkRR374cZug/4FLdfDvo3q7hJCnX611bQZDsCkNGF1dPMh2F?=
 =?iso-8859-1?Q?mxvpEwczwNfZNHqWx9+zKv7Vsf8G33LQdkcYusLtLZcxGC7AJVS6Q+cbeX?=
 =?iso-8859-1?Q?/h70nWGk8emZul8xxyOubgYMMogEaYuAI1+OGKPfy/yzcteACDP3VGX1JO?=
 =?iso-8859-1?Q?O/A8h+Y7byW7InIIwnZl0q64w5qj/tHB0dOxhc/5yHlsGEcOTMNCmBxvOw?=
 =?iso-8859-1?Q?9MwQmwWIV06rky7BfX4kvF6f+4wb+Er8521iaNIVLsAToRlhdZWwE/jeI0?=
 =?iso-8859-1?Q?UVxD/E1w092ANqMMVzZLaaEJSE092L/zM98XOcEdyTFjrPR+gQ+82fhqnd?=
 =?iso-8859-1?Q?Gk0LYhxpPmJH0elKe9pv9bBjXY3sFls8Z77p4hhPOsrExyXzHhLN95nu7m?=
 =?iso-8859-1?Q?AACSzsbhhsHgxR2VPIixWPfslnTtHWNpkBoHcfV8tnspmjOvhHzeJgpYT3?=
 =?iso-8859-1?Q?3au9sS1OOJbeJFAu12JKgdWIHdOpN1xv6mvbpIaqSKdMWiq2hvGij0gnDo?=
 =?iso-8859-1?Q?pJOjRc91LikcZHeH7t/Nn8vDlpEgzTUPX5IPU2WiV1uBfym8Sog/Axb8nP?=
 =?iso-8859-1?Q?sYT/ZpoSXJtH1rcm3dTnjbfV6apg/kqm0JNAD0RxNed1lxZSP2g3+SgPXX?=
 =?iso-8859-1?Q?k1ojedsgdXHu68qLC7a5fpWzn363IbzEfPwMKCa+AucDlS6KVlm41TpwyR?=
 =?iso-8859-1?Q?aFWERaiYu5sp4wL/kHyN3v5WmIYM1WVL1ZwQiwxqAw5Fxuv374kq7BvqWm?=
 =?iso-8859-1?Q?80inKT0Gogyxfr6NWS/CG3ZDr1XdAQkBnK8InN09tCFjUtv8K2nM8huAo9?=
 =?iso-8859-1?Q?hlEL/I5ZznpIJcVnk0GtpEqJgTMP/EZQtJD+K7OKRiHf0xp6sId+jh5+xv?=
 =?iso-8859-1?Q?nL06JcA7YxzTozxXoIDH9O52oCP9VxOe0PVpHWse0EWaFK27ZGn1Y6Lrhl?=
 =?iso-8859-1?Q?pcB02UGnlRFhS+gy8y9plzhL4aC6qe5Xl0gvnXKD2Bmzv0OeLTQjsFscG8?=
 =?iso-8859-1?Q?obWToIdva62Bs36RU4Ea62j9lGr5iK/7Orj6z4Xd1RoFSvK0ZcDrIWvVha?=
 =?iso-8859-1?Q?vzwMMNJHhDPTjXdT+OxIsK8kZL0zIWqEqZT4CBGDoQeLWHu0SynKY2NhTV?=
 =?iso-8859-1?Q?5Ze/x8okFtYVDeb2RxtdNQ9BdNhlOZKZWU3Hl6iHWJXmI7LOwddyqhJ1CM?=
 =?iso-8859-1?Q?1nEc1oUA9MS0Or/giUopHJSk3nT6j/FoswENmzGTxzhXEz6ospjrsp8btU?=
 =?iso-8859-1?Q?kUsYTH1CTJbfrlO+jjA4T6oQ6tVPN5M7KT1YybibzQAv6aoq/90Pnfw+dB?=
 =?iso-8859-1?Q?fHdv2FAMALvQY7fMx1wiyTqoQZFUYtlJgt3tx1Odo5BBesXGgHXg66+B6G?=
 =?iso-8859-1?Q?zNzhWGT1rH62l8F2WkZKAY+rVbePJt2fyWDk9IU1urJLla7KUc+FRmfKpJ?=
 =?iso-8859-1?Q?aamtyFeZ+0fBaIhFJmYOpDhBWLqoBYLYsoCvxfTFaOq8zdQzRKeShF3MS0?=
 =?iso-8859-1?Q?kOvb1NbEUS+7f9/xjLzcRhsOSxJfQRZKS48kFW4GjYJTA1NQpAkoJA9eVU?=
 =?iso-8859-1?Q?Esln4MdtFXQD99u17JFqo9MCvkVXv7BGO4dBMFkv+eqKWB8E9ycKcIoamZ?=
 =?iso-8859-1?Q?b5sGphJNl8acIk1RyboKm5rNQP2sZKF12c7L6qQnrGaV/v?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZR6PR04MB375776.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b525e9f-60ff-4b6b-e763-08df08cb36d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 08:21:40.0858
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yw7pZB20bOBDHTI+enJjTq8b3ccF9TOBNYDd2k/sjyNEJPLhGl9ST4FiVF9MUin7FQYppfTzEfjQN/iQSgYr7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10442

> Subject: [PATCH 13/45] clk: imx: Make sure clk_init_data is fully
> initialized
>
> The clk_init_data structure contains several mutually-exclusive
> members for different methods to specify the possible parents of a
> clock, prompting drivers to initialize only the members they need.
> However, not initializing all members may cause subtle issues, which
> are only exposed when CONFIG_INIT_STACK_ALL_PATTERN or
> CONFIG_INIT_STACK_NONE is enabled.
>
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

NXP Confidential
