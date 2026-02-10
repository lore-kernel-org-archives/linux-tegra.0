Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012041.outbound.protection.outlook.com [52.101.53.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CE1387577;
	Tue, 10 Feb 2026 16:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770739516; cv=fail; b=OlIO9I8jJZuBiYTqYhqsVkgc9QlD0GQ0djcBUPo/NTBCv0wpL7Vsp7zdfkYGfooKY50hB70uXBXGahfn5ywwQezXz6BvOv1vbd2QbJbFnN2wtTTwmU6EMvzryL4bn6nJLOl71jmxoorh0aUpApmw5c6bR65IR/2yybBNeSYtqhw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770739516; c=relaxed/simple;
	bh=yzVrohlKmOVl9KcGb8GOspxcrf2KCInL6zlWQZlflVw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IdR4LZzjj+2Ciy78kiVtZ3FevJTFNRHxYLGW78V3TlAQHHT8ZcvfOIXKPUzTlKIJal7EDG/vpSS6xWs504LUmOWFFQNzJd88enrzL5TGdYN4WqW7gY7OZdZ4WLMvmx4yw0bMVn5Vcex1Xeu87Au2HnDWx7uJPZL67E0Sxye/to8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=a97gAvWp; arc=fail smtp.client-ip=52.101.53.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="a97gAvWp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQbj8tfqdoQVoLn9xnwqWILaT/8aBxc4TBBbkk+vQV97Qm7SnUBlwaS9AjT2asB5Jzrv3R7Y4hE4LVqbiVXOP0NXokhrtZFfskT0gpoeO8dAnXCvd1Lb2j/btQEM2bUtkuJQlZkTEvdHza/FYQYWIDE02TTB1d6EHECnl8I8FeVqdOVhxLfIReMu4LZ5c8LLVRnAIK9It/Off4VWObAnNgCZEPg1Gc3FbWF9zpoUUeCUg3xSjrMi0n2Tj/1YC1UFO0bJaoM/fAPjLkSYICJigLitXSIeGx1zEsYcBdAKJ42Bv2Xq2f6p5pehS09pxlAavLLsdSJeMww1RBOzAC8F6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzVrohlKmOVl9KcGb8GOspxcrf2KCInL6zlWQZlflVw=;
 b=vqt1LfFRiukvdc3f9i4DI9x7kWlAQz4av6yRxQEQ2Srhm5GkUpPkpbTbT8Dj708oJTJaXYZF+8dOTUNiVHfUBveu0eXYkmUXGddd5sf+ZeZCid8hMJUzxT8nOLNUXEMRYk0HlVtdTJ44ooUUXkX08/ZJGPV1/Ka9QLgEVa2L2g8IC2zZjZsmsZDEeHAmFpGHP0E3a17n/Rp/eS/hlP35/ZX/KEu59H5Wn3KYmT/bXOpQrmQtFTYZs0tOt/CvSYjFMtRRLxmlSrWezisjMVhU/bwkhRjuOgAkZUCrFpIkr/bi+DHnpemesKzoUkfBS9ZPxJhEiv3XQTtUBAWxgEhJqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzVrohlKmOVl9KcGb8GOspxcrf2KCInL6zlWQZlflVw=;
 b=a97gAvWpnQA6LzEhmNcqyMPucoMwb1EByBUkNPLqngxoHaph3aNOBrxCm0ePis91Lch1ICPCR4cU8ISs/fnD5f9atm5vL5HuM+jbuNAClrc+tRrt9Bo3ZQ8z30JMtWeYNw2nwdSKy5gleOmIyChzLwgfZlyxQw8uDPSg1XjPIH+4hWTuV4KTdRar+xOekJWTr9OeaC5QOCDyW70U8Avap9E4S3wr1ye3yXI87dRmEnkoSmBlJeLtS9GwceygcPjA1HD/u25u8ZKNUdW8BkxgYL/RBkk21XpPYRfZo7ndUhsgxJ1Tx7he7uulc6tjTOS+edcNj1vRC9c+qCRM9NDoZA==
Received: from SJ0PR12MB5676.namprd12.prod.outlook.com (2603:10b6:a03:42e::8)
 by SA1PR12MB8842.namprd12.prod.outlook.com (2603:10b6:806:378::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.8; Tue, 10 Feb
 2026 16:05:11 +0000
Received: from SJ0PR12MB5676.namprd12.prod.outlook.com
 ([fe80::a3fc:754b:9159:b13c]) by SJ0PR12MB5676.namprd12.prod.outlook.com
 ([fe80::a3fc:754b:9159:b13c%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 16:05:11 +0000
From: Besar Wicaksono <bwicaksono@nvidia.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "will@kernel.org"
	<will@kernel.org>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>, "ilkka@os.amperecomputing.com"
	<ilkka@os.amperecomputing.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
	Thierry Reding <treding@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
	Vikram Sethi <vsethi@nvidia.com>, Rich Wiley <rwiley@nvidia.com>, Shanker
 Donthineni <sdonthineni@nvidia.com>, Sean Kelley <skelley@nvidia.com>, Yifei
 Wan <YWan@nvidia.com>, Matt Ochs <mochs@nvidia.com>, Nirmoy Das
	<nirmoyd@nvidia.com>
Subject: RE: [PATCH 8/8] arm64: defconfig: Enable NVIDIA TEGRA410 PMU
Thread-Topic: [PATCH 8/8] arm64: defconfig: Enable NVIDIA TEGRA410 PMU
Thread-Index: AQHcju93VIQS/+1NU0G/as/VUXiQ2LV4u1GAgANz/3A=
Date: Tue, 10 Feb 2026 16:05:10 +0000
Message-ID:
 <SJ0PR12MB56762714BF94D1E67511C43DA062A@SJ0PR12MB5676.namprd12.prod.outlook.com>
References: <20260126181155.2776097-1-bwicaksono@nvidia.com>
 <20260126181155.2776097-9-bwicaksono@nvidia.com>
 <a3249d0f-17f2-496d-ad53-95ad5da26f5a@kernel.org>
In-Reply-To: <a3249d0f-17f2-496d-ad53-95ad5da26f5a@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB5676:EE_|SA1PR12MB8842:EE_
x-ms-office365-filtering-correlation-id: 61cda2a3-25f8-49eb-9d9d-08de68be2b22
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?yEv3F5wV7JO0kt4QiHZb5ht8a5RRvvLT3XqgV6n9gEkMJ31nvivxFcFNZUSD?=
 =?us-ascii?Q?NiyUlUjNbcxOaqVRaOecNUFuWITHSy0xJqNmXLS1WurhkDz7NWJRRlsd3zFg?=
 =?us-ascii?Q?UF1G79r4aJNbj3QzSgsV+xpMrm+dZNNtzreH3TBCRWBnZ86ThM7CUs42Ka6J?=
 =?us-ascii?Q?FL0BjP2RESaXYEyl47SdWXWvbKA6tLq4zwDm6b8+s5r1hcgNX3VEqj2Yhyjw?=
 =?us-ascii?Q?oIVLcgrkaf3wuuTRCTjl2/SPYGSXW1nf3J6wL3m5GfOhIP7ZrdxUpT734peF?=
 =?us-ascii?Q?pGeClLzYO3tyYK+5+AHyJXRc3NZAhol9KIQKRKpB3V2wHW9GX9w9FSg2wx+e?=
 =?us-ascii?Q?wfen/QKcdIczFfQ90UxI1QSOeluS/wgefbOqwQUj0/Fa469khvuadIxUH6g7?=
 =?us-ascii?Q?RZ85hUkTGMBV6FU9qssz1Pi9M35mWNeMQ0zL+64mSuT/v1w2pKZIssKeNgfd?=
 =?us-ascii?Q?OlZK84aN+3IP2KQA56YfAxFOBA/YEJ1eJPPlzOgzPT1XhQM5lOhZ8DvyHZxj?=
 =?us-ascii?Q?m0AQyMdJBISBvoCfNeWs4srnX+gRwILr7oo+ypEpML4SCtGzAI45OZjl3vra?=
 =?us-ascii?Q?fTj1i3o7/vtpIgPeUADTtVaLvRgzqxnuq7xx8ZV8U2UBlFnWY/hBnTVN9n0K?=
 =?us-ascii?Q?GhukV+KEajTdUoeU4nt9CyOJtodiVpqDQryCfemB4b2gagpfRD0nSOf22FmP?=
 =?us-ascii?Q?61ihYJu6Ewp7TPtKCX/leWgAe8C1d58fCbKMFwtSVGoIKKCvD1HwpKcGBKUT?=
 =?us-ascii?Q?8IyvZDsYMBBJy1+OwzxMv6dn3L2pOx7UJtPQiqd1VzJJ6QXJETEml5nJZx+y?=
 =?us-ascii?Q?dMEDtl1QnfbYozOaCpaSHkvNqnT60Kb1Pht8VCnyDdgqEi99tSyXFeIJcNgm?=
 =?us-ascii?Q?GjQ13dagZnntNPyqfOUVkM03zLa2SCF4OBIhe+FVPXN3zVXz96aVfg7Pk/zg?=
 =?us-ascii?Q?fE9Tu90Eg8AJxNTUzof84F6c8zZziwbb7FRI1XPh9tIONKxEXiH0kzqQR+po?=
 =?us-ascii?Q?94IT0Grn/kXUuoaujlQ0BKSrYAk3yAUxJhkSiO9NwpSgr01JAFyJyoz97Kln?=
 =?us-ascii?Q?XFmgJ6yuGeHyHhhrVozjEy2y+9EorHGqnqsvWR7G3LKABOudOwChsiLJzjpt?=
 =?us-ascii?Q?XO1MOGBdB9U+l6omRWs8Yy9TG7Fh/s3r2Wn7JBHv33goBoFJRd93qX4ck7a5?=
 =?us-ascii?Q?PnYykSA/Oxriuyuojaf+EX7pijpJaKc7/DVL2nBnZuvHINWKmBMryuauxWdW?=
 =?us-ascii?Q?56mMcsr+JAmxXorpgb3R9ZeUsGqvrSM7PhNxlnsID/vQl86IX7Ck/kqFA+bh?=
 =?us-ascii?Q?Wt6vr84MGT+tQ0fY+HaoJ1ZLf+qptHHztoB4a/ZfPwGaugPFXebtdkk5wVBP?=
 =?us-ascii?Q?9QDKZte8un4ZDb4RQ0Su+fjnyw77QOWOe6VxfUTGSipNIngnnW/oABkT05tt?=
 =?us-ascii?Q?Lv8zSA2Xk1TMR7xQev2+3jaDgWpLFjHqSzQ73vmfSSBk11bIt6GUAKylkx5N?=
 =?us-ascii?Q?8ZJwrdukUNGt6v07G3MmLmG3qXVYjMKGq5zJWQkQRsW5GbJwRdZoFFlqfuNz?=
 =?us-ascii?Q?83pWVtPho3AvBLB5U11LSDKTiWOnwxm1Pe7/unSzVzqiJG9oLO1zePDKTrZO?=
 =?us-ascii?Q?TMED/P15ELQQFFxCDqHIf1U=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB5676.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Hj9/8JcxGNuP73klVyjUEjvZKnR6YgGFs+BFfI0AmFjdLquEG80tcTHpIKIX?=
 =?us-ascii?Q?9dDLG/vb3hoDRUMC/XIVGung9kCbknEkKmP7RuiJE9TmmYf6p8E10qKvHWpF?=
 =?us-ascii?Q?QZulYzjd5Une8EOj8Qt0ekFtEcN88iCgz7YMkicuPyHMtCUspHasiof+d371?=
 =?us-ascii?Q?P+gcx7HxFc4DjbQJpT+0X9FGEZALKQgzKYcQHXaFfxJGtD3uBbkRgJ0KJvfg?=
 =?us-ascii?Q?HBJQ5AvAC3taWHQstaEAs4KTk7+nKevyX3u7r/8O6bdxMua5Rq75wLPldkH1?=
 =?us-ascii?Q?DscJrCWWyzjKGBViiQdYX/KIXxHHoxBgDzYVWmukal3iuu+PfENrvA9oOgtA?=
 =?us-ascii?Q?D9a0hhK/Yi9zdy/H3E8GPsSQT5f1L8qyRcFps5P3G+9NhWTXoRYgq///MB5G?=
 =?us-ascii?Q?UIYHZuwI6sMOmD+YMairIdSHP2nIdCrCSSBXalZgvDXt6WqoJBmB4qIh8tLB?=
 =?us-ascii?Q?n4x8BrlNIp3/Q1rNTv2PD7XpLzecwHtbGch8L8cC7KOBx5xmybB4MmJbH5sQ?=
 =?us-ascii?Q?EkxlRv4v15Y108SxaeE5aUrvyfVRwcUTy4I1KuwXSmDp42BdYjukMUkiGj+5?=
 =?us-ascii?Q?k8yCRYMzutfe0XK4UyGDWEA/fi1eeTuoW3Ct2vSGBXKzcqDi6xn1G6Dcdc7W?=
 =?us-ascii?Q?+JjTI6B4qFt7kM08QuXYpGWZ4JL6fIPH7uMngrbaQVT4QnyFRL2QsgXfJ+7I?=
 =?us-ascii?Q?mn8PmZ7IusgiJjdsA/dQHQz1yKBDFdJfq4O9seeUaSZbnxWw+z3MD9c/+B10?=
 =?us-ascii?Q?EHY5QhG/vhhhVxqSTWYlWtJNnckjNZEdUiFhX2jngzhTvvO1UqwNpzfsa3AO?=
 =?us-ascii?Q?XZ8wzdWI0J8r2As/6XrS9NsK5j1ZehIS7CS5QwGcJZ47JgthGzNt4IHQwJSH?=
 =?us-ascii?Q?mRafeWs2NK0n6zPdRkvFBIcrXmyXsMHL0YjJwpd87xHzWcRZztrPzKvM9j4h?=
 =?us-ascii?Q?CWkOK02e+mYX9Mdhd2N48IOgrzmVl+NC8Or3UMwfHM+V4SjpkF0mTkymIMGt?=
 =?us-ascii?Q?H4/LDBYLtTEXlxeVXcp3FAMUuDayIb40SQGhf35bf0oHdGIWFrZvbpIQ+wZt?=
 =?us-ascii?Q?IITeWcqSEKAqreV8dL6N9v1+TUMqKyxicSVzCqzAfLA931uA6ziKhSVegIPM?=
 =?us-ascii?Q?OLPUsZLDfOx26hHDhwfRUKi0fyys09Zt8NO/DpbR/D70aTkP2XnXDaozGQzJ?=
 =?us-ascii?Q?gvuxYZJz2o9scMljwc3RGy6IkMivMlT0BWtr5jVnIhg++6uYNOSS0Wl5ZR+K?=
 =?us-ascii?Q?MgvvEfxZeVESrdEf3wO7W3KHfDZDUxwZgN/Keh1yGZH9xhG5o4B62HCBbShw?=
 =?us-ascii?Q?fbOuIWpJJzk1yGXMPMxudgx4xm5Uq4AsTj5G4wSruKkHY3jS+coEeLvL8svN?=
 =?us-ascii?Q?XoapEZhwTTIgGvCOsWw0Am4BqxFSZzOomBwTpZSsbcjHLwr0sgC0U0nVq9cR?=
 =?us-ascii?Q?Ix8tJNWBia3InWNbPbg4SJsgfTic2eTWjx6/IJZUZW8U40gn4/kK8pQG/oU1?=
 =?us-ascii?Q?ek9vO6MIN77virrWP35QyGd+uDqw2Cs8OAgBRUJRVpx7nZ6Ikh7PKiHkUzJc?=
 =?us-ascii?Q?M13TImH7r2p9QgMwMuwxUglbNHVNjSxR3glIKGgFGOVADLarH6wbnKGZ0hrq?=
 =?us-ascii?Q?Mp8LbBrxNvZrCdPQbQgSTb6+nPs65/z/7/xM73HqdvgU5IMB3Q+9rDXt66OC?=
 =?us-ascii?Q?Lt6FZLPw0Ap/uChiYsFFBGU6EAoKwxvDE7hHUSDHRLJ9HgO5vAiB/jDDWS28?=
 =?us-ascii?Q?ofyA17RBFg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 61cda2a3-25f8-49eb-9d9d-08de68be2b22
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2026 16:05:10.9815
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yIByKJu13qGlVNVM7onYZsJMMSHHmyhvwwDjBxyNMNOi1kWEIj/HYooB28mpPQqmvvgBuh9oCTVBH9ByVC4zKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8842



> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Sunday, February 8, 2026 5:18 AM
> To: Besar Wicaksono <bwicaksono@nvidia.com>; will@kernel.org;
> suzuki.poulose@arm.com; robin.murphy@arm.com;
> ilkka@os.amperecomputing.com
> Cc: linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; l=
inux-
> tegra@vger.kernel.org; mark.rutland@arm.com; Thierry Reding
> <treding@nvidia.com>; Jon Hunter <jonathanh@nvidia.com>; Vikram Sethi
> <vsethi@nvidia.com>; Rich Wiley <rwiley@nvidia.com>; Shanker Donthineni
> <sdonthineni@nvidia.com>; Sean Kelley <skelley@nvidia.com>; Yifei Wan
> <ywan@nvidia.com>; Matt Ochs <mochs@nvidia.com>; Nirmoy Das
> <nirmoyd@nvidia.com>
> Subject: Re: [PATCH 8/8] arm64: defconfig: Enable NVIDIA TEGRA410 PMU
>=20
> External email: Use caution opening links or attachments
>=20
>=20
> On 26/01/2026 19:11, Besar Wicaksono wrote:
> > Enable driver for NVIDIA TEGRA410 CMEM Latency and C2C PMU device.
>=20
> Why? Why do we want it? Which *upstream board* uses it?
>=20

These are for NVIDIA Vera platform (Tegra410 SoC).

Regards,
Besar
