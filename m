Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2041.outbound.protection.outlook.com [40.107.101.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE4AA55;
	Thu, 17 Apr 2025 09:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744882665; cv=fail; b=Z5WnwwJ40sFlIW4yySIamqAWCdWUbAX9Lbb7u50cp38Yge6P6utHIQJsarNFxntN3OhQm3fMoDYRr6vxepfBYu3vr140yKZFt8q32KOadIOOf0xojPNb7HF7d5icP+sOmrBUiPZ+lCMYPu3e3I0NySARGLjHCu3wODha84/35O0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744882665; c=relaxed/simple;
	bh=v/xyW9kMALqe58zP8A4EzzY9Ct5iqO9e+ceGnMU69Gk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mi/8Mj/ChPEf+R7+r2URNVvUZHiwNMEF8RYUtELgo6XVPcNvKw5gfxoOONmlexP/3FKFwUUrLsleSFYIbTaZy2vN6rk3GdZiZf4qdHV0EStJqgXwMhsnqabJiKLRiGlJc2ZjzJDMr0FVOxP17r0oRx8bQaqOsM1xno6kHs5B9+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jdmvDe3R; arc=fail smtp.client-ip=40.107.101.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jdmvDe3R"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ti3SfAOwe4ZA8qDrGvSXXCBJDNQqbe9p7JLsrfOAdKJUQyRDhFeBsR9lGPUsAa6t9seEiqfRcfT87BOOVPXGZiLSet1c+pJ+kZRlxMcpNQbAy9N0VRuTviwdXFe/ol9rqr8mXjSLFdpRAbGLmncyBMhW1OBeDsJIau+UTFII+Zj15+/kJAFyR+qkYwBoSE2W0pbIGZDfu/tWTlk1mKsQgNCMWO8Ik+zCId2CjrYfRauA6y7HXYRxdFqUZDw5I1cornXHZUfHDPb37ubG+nWZfr1O0qxtFaBkvNCMJ31DSZJN1p1XW6jdqd2K4zBRRKL5vIFlgTSTcuOITNB183iGvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ztkTdlNNARA/WCG7jiavdPVFq8+nx6QSNh1GNU4iFDk=;
 b=WpnbjiTeapbg4oNj2nk1GoPr2KKtWoDgP/pLGnuZlG6nMpkgzfr2drZHUANprH4Umtew6d72e2fg837S4FuicTqHhCjw7FMF1fbquE9zCkCtHDZGZ6lw7mYzYFpVIfagsU0vo3WRNBCUrav0cWeZWi+t3jaoZaMdHpYXSRDFTPfs2I1fEJ8UwE1kGdqVj4n3wMujMqMTcKNSJj9AyM5CAMvADHVo98TkMigJUFmbfLjGOtVBLcwolvvbhcoXmtb02SgLLh2hRQ8o5BvHNBFgSGdpZUzndN9QwEgbTm3Kr9Oh8CcOBQBgWAP/DgTBZac9YHUuTlKZWZnnqyxCFNXOuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztkTdlNNARA/WCG7jiavdPVFq8+nx6QSNh1GNU4iFDk=;
 b=jdmvDe3Rk+Nl57NtWlFaNDs3JX7GcrMjN6Y5VOKnB9jJi/4ZHB0ZTaasfMbWKZ+QdVnfoeLcMMmcIhYW8SmoyKZqXIQy/1Ird7aS5AL/mO2dLegQkXOgKzF2KgtYX2WxENRT/kre4w2Cg8epZo+Y/01GmtZc6kHvUIfEs/EQnNqZSlHuAvb82mUv9iMwdRbyGYyCYVXtF+XLIRVi86ry9AXHBohvcY4Im+lR4oWFmNtMqadzx7kyvoyOiDtGV2JVHR2OubNCQ54jPWGFPpjAB33RtCMqx9Wk7BBYrYVqFpV0FKEWZ5oZ4TJ4DzDd9FT9AncFr9EE7PSMjNO5Unbpww==
Received: from PH7PR12MB6418.namprd12.prod.outlook.com (2603:10b6:510:1fe::18)
 by SJ2PR12MB7868.namprd12.prod.outlook.com (2603:10b6:a03:4cd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Thu, 17 Apr
 2025 09:37:39 +0000
Received: from PH7PR12MB6418.namprd12.prod.outlook.com
 ([fe80::c212:c319:304e:bb09]) by PH7PR12MB6418.namprd12.prod.outlook.com
 ([fe80::c212:c319:304e:bb09%3]) with mapi id 15.20.8655.022; Thu, 17 Apr 2025
 09:37:38 +0000
From: Robert Lin <robelin@nvidia.com>
To: "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
	"daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, Jon Hunter
	<jonathanh@nvidia.com>, "tglx@linutronix.de" <tglx@linutronix.de>, Pohsun Su
	<pohsuns@nvidia.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Sumit Gupta
	<sumitg@nvidia.com>
Subject: RE: [PATCH v4 0/3] clocksource: fix Tegra234 SoC Watchdog Timer.
Thread-Topic: [PATCH v4 0/3] clocksource: fix Tegra234 SoC Watchdog Timer.
Thread-Index: AQHbr3sq99agF5K14ESBggPMJWNW8rOnmNxg
Date: Thu, 17 Apr 2025 09:37:38 +0000
Message-ID:
 <PH7PR12MB6418E97CD318D901556C9DA8D9BC2@PH7PR12MB6418.namprd12.prod.outlook.com>
References: <20250417092817.2751534-1-robelin@nvidia.com>
 <20250417092817.2751534-4-robelin@nvidia.com>
In-Reply-To: <20250417092817.2751534-4-robelin@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB6418:EE_|SJ2PR12MB7868:EE_
x-ms-office365-filtering-correlation-id: 021b492b-314d-4d9c-85ea-08dd7d937e36
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?1oubz1g2XHGp99vziqI0hnuNCvCOwl2itvwl4zaj0PIvzTrVp6Y6CflW0qqB?=
 =?us-ascii?Q?Wirs4vEgygb7OFuR2Na3TvtZrjQxzs0fS4haY2hgCWZddCmyB1S0lQmlmWiO?=
 =?us-ascii?Q?/tkXUHkkSrfbOejG0tQxFKsnEXlWh6g5jEnnarPrpBbMQB0i59KQc9KRc+n/?=
 =?us-ascii?Q?lvCc2nxe60cnJJc/Q/JPoz7/4AJy1OWyL32t1tSCw/yv8m9YayJeMl9YvQpi?=
 =?us-ascii?Q?aMq+UUG9e9ar49rHljf53aKjZD1GAErX0+RFkmGI6D1uIGtjR2LmGEtNYPic?=
 =?us-ascii?Q?G9GRMMPuOG9JghchPWIQR2u5bvKZFrsk3P73WmoqVxGkJQFknSWLUuYqyJA9?=
 =?us-ascii?Q?y0Hk4d1eh4EUAQb6x9jwXnl4FkV4av9ZDC9a12uaiINvdiih8t8V6p9ueT/c?=
 =?us-ascii?Q?+U2zq6pji/TxBOM7/roTlRohsB6B5YrNC3ZrpXFiX4hcTXFiNS+HldzaZY4Z?=
 =?us-ascii?Q?zwVPWokFrsa4oEbwXmFkssFjdf+zdF+cbNZrg99PMipk+3RYg9eegMNWgQnl?=
 =?us-ascii?Q?lIXpWQlB8Ycvk2try/oRHKGBgAaYedq1MedljV95vNtzJ4dHtHZNbudHiTRE?=
 =?us-ascii?Q?ccLhX28GLhCflc+V0ZJQBFi59VhOEdg8oUWXDxu8Xkc+jXwl0+b1FVSeQk1z?=
 =?us-ascii?Q?GTkwODi2223u78cc/G0Kwlaw917yjgs2sXSp6xj+1Ctj/7s1frM5EHpQBioE?=
 =?us-ascii?Q?Eqq4OXZlQMS1x2bTWCoq7qNpaoTVoFELKVU3/O0Cgjv21+zvcYuIT4t+Igc6?=
 =?us-ascii?Q?Up7aTJX3mZlRepMv7oFckDxGFmZcfGeh93aGpMYLm+17uwSzfN2J0LQqHlkq?=
 =?us-ascii?Q?r9ZAbqwj30/uHMnMyI54Fl7g93Wwi+Cw53cjsywl1fbWWuhS9l1p3Mxa6eVH?=
 =?us-ascii?Q?DhtHYuQOKXBN+Oj3BUYYEt5mBqXJYMXiJco9duEeMn3Uub6pG1ySCFPjD3hK?=
 =?us-ascii?Q?BPOP17Ejz3zulVoF9YR1DMEUyGvdQgVa6q//pjeZ6iOEUJTBYhkUPIqt+eJw?=
 =?us-ascii?Q?ytcRPRaZJxwpkdpxFPxecHb+T3l9Y3FWz2h7UNIuwL28uOJvmPKTWSLEVmcb?=
 =?us-ascii?Q?G1QwfjAuhErIdhvQgXKBDBre2eWyTsmta9Ofo+Xb5ZcNe3Y74PeDS6FHogJM?=
 =?us-ascii?Q?B+kCIv0TUAyKUY1yg03D+ZeMprCrv02C7yEOnIP9JWA5cnvZ5PI0abuPHzXM?=
 =?us-ascii?Q?qhZb1mTzK1sjaZLqtVNGn7yUjrgGygYpMiocFGNCiVjhMZAGRvh3KVLfnYzG?=
 =?us-ascii?Q?y739Ln0PRQgRPLZgOwqJaUZHvZjoETViCEnSOLQsN7j4/1uKasJB5/M4iCYj?=
 =?us-ascii?Q?0vW+tSVK4q1RZ+QtsaJAZWqpriV5QQtQUI1fAjqEdVz3doT8T5LtLoX8jB30?=
 =?us-ascii?Q?cgFPptCiI0KLjuzddFR5Y3sPUfiEuMOi2WRTrf/5/c4TfFOoJTO50Sia8E0/?=
 =?us-ascii?Q?J5T612J6KyEcRSribpbX7OckY0t64cJY3C4AfbkVbLnZTNyQ7+YCkw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6418.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?KEHv0tIcWNq8buPDcq3nhil+DBF8tOILauWXiGRVhMrjHshtXLP4+tsSUJ2s?=
 =?us-ascii?Q?mWbzdgDA/cvYWFZNM1FtOOg4C6/3opX9Fp4qyGwJ+4ltiVBko4EWaUOwF3WW?=
 =?us-ascii?Q?nRjYKIx3nzJutAz1KThVVej8J6vL1hC4rCkXPpUvkXACKi0CxfIzw49tLuCD?=
 =?us-ascii?Q?LxEGT3I6t/dE/rs/eo6cVHjl3Eu5iiu4BbfV5qXkeG1v8/7a58ub+pn/i6u7?=
 =?us-ascii?Q?5AJ7vqOOy0aEACesNWZEfiAagUUWMksW02ajeuXIvIbQj6qGgNyp305h7Zkx?=
 =?us-ascii?Q?FkhWVW9TmU5Pmfx/TY16yz6bHHZrqD2QVE3wmhXGrTUNRs7K6YDeha9GH3d7?=
 =?us-ascii?Q?2ndMSWK9ZYgUiEqnLEtWpvSsnDJ1RUws1KPlhisl5ppy7sZgdUWpqtTYByCX?=
 =?us-ascii?Q?2lUB4ySVyGNRkL6UVLYkVxbg6e2tRPNC9ZZUxiUS2Zq0w39Nw2auVfJ1N8i7?=
 =?us-ascii?Q?BtEka3KNT4MWb2SyZnke4aU4K4h5OsURrl/rc1w+3rpMuYhQsa0wa9kUhYix?=
 =?us-ascii?Q?nHxHWkV0e8m/0UhaUCCgPz2rsNxlsoSfNonhKUsryxF8RtNQtPBQALh9YvrF?=
 =?us-ascii?Q?4QF7uAaKLA4GYkxFs9n22RIC/sTNqv+QRXrCE21FqAs/YkVMisfvBZ7W9pLL?=
 =?us-ascii?Q?2hARKtFaeg8V79MHxkef9xxu9uNkIYVikDKs95mZkeUSkuEoAybxCemhv2uS?=
 =?us-ascii?Q?OzXVL46AvOA0TBxwOekUgaMlPc3lEyJVfTxr1uUm7jTFbsbwn8IGDTx4tHf4?=
 =?us-ascii?Q?5H5vjlEdApFyMdNlS8WxIVHvsQNzqmRaMeHi5V3LPCEEaBTJqWrnmieShAkW?=
 =?us-ascii?Q?XKeKTe7Xedai2BW3z6p6UgNyqeOua/EPLOGJNKQNIUtpWu2XANu/yp97pRv3?=
 =?us-ascii?Q?k8CJo067MOCbahiam/2e2NWcnoaixAiaQSimzQwjf+1wcQl2V+x9k65ODWXw?=
 =?us-ascii?Q?mEN1APGLf+Lz9TQ6p2wF4aL4jdbioXSp69mInOuNBxONAnP3yMZBzFyRRadA?=
 =?us-ascii?Q?TeSAhDntujZfN8agPHG82Bcar6GHBNuwlQi+amFHXqGxdsVs+DvzLQ9hsTXZ?=
 =?us-ascii?Q?WeDnLtKSu+ZFXe7YSGMFgFb09lw7vxg7zym+WRFJiZUGUQ+Vllz/t9tSN2gt?=
 =?us-ascii?Q?NQGSqwph/Nern9Im/vlWQyL+KYA98JZa8eokCINUmRqBhsFS7Nomol849W/C?=
 =?us-ascii?Q?5QvCFJN9UPgHHVA/glWnhk3H7p/3E9Hyj2RZGpMRidFu3JEKhzyJMFTTRpDk?=
 =?us-ascii?Q?V7vHUEOjg9x1feJfguhrrgkxtWREKOLgTBMV2EKazp3ZLjspArOx6WSwxBdF?=
 =?us-ascii?Q?xwX1gBHKOXP8jPfZBXPb8AzW4nVf4rlp+pbeL0eQ7Tm/lWheNG4p5EWI2zx3?=
 =?us-ascii?Q?/R8c79gpRfPG7xdouHvMevNl8oKeuDBeTdjF6vD3mzEYmKNv9jeRyMmd3m0p?=
 =?us-ascii?Q?tao+Vk5PnB5v6lCTFAV88xrlvfc/qBMUX5cQPFZQt6JP9RNOIpOB7aBqZYfY?=
 =?us-ascii?Q?WWH7rNr5I6EWpq1mS4n7LjMeBodAHYGWtyXZFYSv/xa4oYFGUUesrFZ/BVmZ?=
 =?us-ascii?Q?IUAEoHjMc2w8mA0viMQ=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6418.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 021b492b-314d-4d9c-85ea-08dd7d937e36
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2025 09:37:38.7251
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gwGKdu5tQXBJ4q0s0OD1ytthlt1f2XY4exjSOf5qwH0ljjstmuD/stMrlqtJzSNYApHn9UYfMlzu3wJJqQoSAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7868

> -----Original Message-----
> From: Robert Lin <robelin@nvidia.com>
> Sent: Thursday, April 17, 2025 5:28 PM
> To: thierry.reding@gmail.com; daniel.lezcano@linaro.org; Jon Hunter
> <jonathanh@nvidia.com>; tglx@linutronix.de; Pohsun Su
> <pohsuns@nvidia.com>
> Cc: linux-kernel@vger.kernel.org; linux-tegra@vger.kernel.org; Sumit Gupt=
a
> <sumitg@nvidia.com>; Robert Lin <robelin@nvidia.com>
> Subject: [PATCH v4 0/3] clocksource: fix Tegra234 SoC Watchdog Timer.
>=20
> From: robelin <robelin@nvidia.com>
>=20
> This set of patches includes a fix for watchdog for it may not bark due t=
o self-
> pinging and adds WDIOC_GETTIMELEFT support.
>=20
> --
> V4:
> - Improve the precision of timeleft value
>=20
> V3:
> - Improve comment description
> - Refactor to fit codeline within 80 columns
> - Remove unused if(0) blocks
>=20
>=20
> V2:
> - Fix a compilation error, a warning and updates copyright
> --
>=20
> Pohsun Su (2):
>   clocksource/drivers/timer-tegra186: add WDIOC_GETTIMELEFT support
>   clocksource/drivers/timer-tegra186: fix watchdog self-pinging
>=20
> robelin (1):
>   clocksource/drivers/timer-tegra186: Remove unused bits
>=20
>  drivers/clocksource/timer-tegra186.c | 92 +++++++++++++++++-----------
>  1 file changed, 55 insertions(+), 37 deletions(-)
>=20
> --
> 2.34.1

Sorry for the spam. My automation script has some issue to submit the wrong=
 patch series. Please ignore these emails and move on to the next patch v4 =
series.

All the best,
Robert Lin
