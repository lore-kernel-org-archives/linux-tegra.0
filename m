Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2077.outbound.protection.outlook.com [40.107.237.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C412DFA29;
	Tue, 15 Apr 2025 02:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744685828; cv=fail; b=Vx/6ScTBo0BE+8O4lISVc7NafkO8AJoSZWoyBmv2EPVjehGZThzi4u6FwQzBAfYozr6jg6/qWwxPaYkGdA14jejcN4skgWFOoiLafhImgJ93d+kPiBhpurpOZtDLGZMWPJgcDAa0UKidckqaKM8jOYrdylEahgfFAVjUcHbbOCI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744685828; c=relaxed/simple;
	bh=i3MIJGmefRfX5WSqCz+QmwKI0D/+CyEb/fNlswkoSZY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QiVP6Ns4KGMCHDKhscRUm1i3Rh5oXJC+38dtCp/VyvdavR74YXKjTjtmTwNhHbbXh3UocjnxrNYn2RzwN7fSU+4cH96tCCtmw1oo+Ub0MDgo4tdaeJcPXYHpVIoHQOwtOZ4v0kTIKbA2m8IXvEtbnLwI84sLD79BpTWV3ZVf9W4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ra+K/jTE; arc=fail smtp.client-ip=40.107.237.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ra+K/jTE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EVpkwnBUWyAphwE4DnuRDC22kGIA5ekFKDl36Mc1SiR/h8B+TMw0bFl1GjvDvPhyQvUVVUUWTTrdywmiKR7GoAdEMrU0ITU944cI3MFKRr+/TmdfacGBehNAXH65ev+bXzj/lwnwYu9+FXVMTYJJtDmuB7AHhlfFIgyTIurqMEa/LEnQRdeHbiRk/ItemQlXtuf+qZpoH/n/D1PPljutB3+YQLv+jD25pwqaE6uyM71kvdHoen+tG9BUrLNPyUXZxK7zncaA1Kk380r5VhA7M7+1f9ZLas2hR4NUlZ4Tb4Iy3PDmVAMuKgs4P/KK00JIrFIkUiiC7QfXhgzOpNoK8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3MIJGmefRfX5WSqCz+QmwKI0D/+CyEb/fNlswkoSZY=;
 b=EUb9iIBSoN2WqokOZevBDMgx+OL5TVpvgRQ8HQlX57CvBUSu5QAykdlX6ulxQgptyJFpbDAH7bJvYuPesJ1BbkbT+IbJfhfMpnDyFDsKVfQcEGOxnGUV5DiEaOR4vBORMWIP8bJ0ABhGEhad03wJGGDhrJYhTikdMgWPjAfnu5jK8IqoPInpJg//alAy2YYHyn2ES52DrCi2ABIpaFR2asbFbsqr0QuiMDpwr4G6Cyj4cHPSQz8Dm2qWgxo7UCMih75TphWyPYooFlIN5/+EtkxQwMnIHPUoKcmQZkfc5iBh+29i9PJHfF1RGJoPjzgqAL+GBl5SRbtPRBeNbNzUjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3MIJGmefRfX5WSqCz+QmwKI0D/+CyEb/fNlswkoSZY=;
 b=Ra+K/jTEi2j0IfynUxSXioPgC2BVyX+YyMQe++0hy9YJ31yhsf6s+/urdZqjcBFEUcEQGXfWJ2G3ZwyZHr2oDXJNJk/lvywWiG3oZdAXSGRnmJVrKDf1gp9xZbl1BGTsX4S5xZN4HawBSKtKi7OSBLQ1P8IGINgqMs5fqB73XZwPfm5OuemfL7N+0n0LXsaXtLjuhJAP8s0oWXk6geu18PgyrFQd3HK+8fQYFx/YWd6kM80XrVAkSsy4GuLsb518XBNbfWCdote5q8zy/2H2/LZjwyq7H8RaeDiJ6eNU2Yoj16of7y7PsAHi1w37R3hZRnJLcBOSOovYDBbMKrwo4w==
Received: from PH7PR12MB6418.namprd12.prod.outlook.com (2603:10b6:510:1fe::18)
 by SJ0PR12MB6965.namprd12.prod.outlook.com (2603:10b6:a03:448::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Tue, 15 Apr
 2025 02:57:03 +0000
Received: from PH7PR12MB6418.namprd12.prod.outlook.com
 ([fe80::c212:c319:304e:bb09]) by PH7PR12MB6418.namprd12.prod.outlook.com
 ([fe80::c212:c319:304e:bb09%3]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 02:57:03 +0000
From: Robert Lin <robelin@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>
CC: "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, Jon Hunter
	<jonathanh@nvidia.com>, "tglx@linutronix.de" <tglx@linutronix.de>, Pohsun Su
	<pohsuns@nvidia.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, Sumit Gupta <sumitg@nvidia.com>
Subject: RE: [PATCH v3 1/3] clocksource/drivers/timer-tegra186: add
 WDIOC_GETTIMELEFT support
Thread-Topic: [PATCH v3 1/3] clocksource/drivers/timer-tegra186: add
 WDIOC_GETTIMELEFT support
Thread-Index: AQHbp6ctb8vK8aaVkEa9Y6a6haH7KLOcseSAgAdh8fA=
Date: Tue, 15 Apr 2025 02:57:03 +0000
Message-ID:
 <PH7PR12MB64181B1CDE2E0EF833458072D9B22@PH7PR12MB6418.namprd12.prod.outlook.com>
References: <20250407102323.2690911-1-robelin@nvidia.com>
 <20250407102323.2690911-2-robelin@nvidia.com>
 <kq4ie5pdf6ozi4pnpkngiuny3h62tdcerntkpglbnp52yqaqfs@pjm3y2eraqve>
In-Reply-To: <kq4ie5pdf6ozi4pnpkngiuny3h62tdcerntkpglbnp52yqaqfs@pjm3y2eraqve>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB6418:EE_|SJ0PR12MB6965:EE_
x-ms-office365-filtering-correlation-id: 5c3e6201-9ce7-450c-2655-08dd7bc93308
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?iJSc+OXgYpSRhHMjq7hlaNyD56j/sZK8EyCrELgUgtbiPwl0HxEljHO1zwj5?=
 =?us-ascii?Q?uLdlKfCz5VPlFiJOs8ZMq05RNdV9bt94ekz1mBtc8THlbrliUZZQuN3cp1I4?=
 =?us-ascii?Q?UpViGKIoffFJPvKd9+gBkKxFyCak1YFbmUbVA24hYKZ/y54fnGf7vWDr5W3O?=
 =?us-ascii?Q?5JD5Z9LT5c+zO1EHzC9/FhMK1M4awhgW2iyYCbmQi9YVmfXSqU/Q9TooU3vp?=
 =?us-ascii?Q?Z+LeZU4oHoHzhMaKmD7o8cTz83bBBMXgm0bDYephYBMMKtxrkC3d+DXUDmq5?=
 =?us-ascii?Q?bQlv/AxCSIn+ZFawpz/l7ySwcOivTG6F7RtelWYdLS95SGkM3LV7SLk/nQPN?=
 =?us-ascii?Q?Pxn14QgT1NUgGLSPBZQnKA6K7sSPb589imBoTgb7mQNLDKoLzU7bYEGU+KVB?=
 =?us-ascii?Q?rZcVE9O+RtTZKOw6259CB4TebcB5Ui502nYPGXgSa137UT8lrRoiKf4tfC2y?=
 =?us-ascii?Q?vABUO/DBqB4Q1QweW3hFXskmz+AQikLg7wurWWFsCeezS0J45GXvNuapa+Ah?=
 =?us-ascii?Q?mQ2oTfj0XENjSQxnj3lGowRUm9ExLs7ScwwWHrrmWCQRQNq6dWwNWLDwrDj6?=
 =?us-ascii?Q?jqbyml+V9FT1uLq11fCGRKQldIR13ujEpUOEEVpRQ24ClAkZNo4I7JWpZ28L?=
 =?us-ascii?Q?w7f+MkIiAty1JGDIuz2R3CxLq3b1yhynlg426pvpqhpzbucY2SzKIE8YIbq1?=
 =?us-ascii?Q?PJZy9T0Px/T8bGWlin6XrEv/FNv5+VU8TITZi+23v/CN9Bm08eKBzkO2A+e5?=
 =?us-ascii?Q?wVYBEOwm8O975EeHAHu+CZCE4EQOy2FH0hwFh9gQSJ1ezLTdoufuU5YiSar6?=
 =?us-ascii?Q?zr5YWBL2X7Yx2CS3fZSWpVz0CQIN4d10rLAYfS9412xrVxGK6aePuLxtzrNL?=
 =?us-ascii?Q?UBV8jO1MxikA7oMHj66CFfF8HE/gsvF6w4zgI80wKE/PHO4RFiFnNYEH5BNh?=
 =?us-ascii?Q?a4gMqNEbEKhGS/5gyQrauJPahRX+BhEvc5AgU5Yfabqv4Y1LKvTFUwSMtxoy?=
 =?us-ascii?Q?ph1fkBeY3kJUNWmWb/GIEJJC7+hayAKrTOFbu4DL/DXsr3y5vuf72pBDyh/+?=
 =?us-ascii?Q?hzZ5aEXSV9XHa8kZywxEuvbFrzOc6Yjwlu+nvjdglOBzb6WVrz0z5HT7bY/g?=
 =?us-ascii?Q?eHIiyy2J50z4jFfjoH3miyS1fd1dRQRwfGHnQbxIkgyDVNOGEdB9J5/2hcT5?=
 =?us-ascii?Q?AABJ3pSJhcqz8W79CtzwQ8iluyQBf+ajq3c6nO9ZLZ8MsJuWilb9XSeTkxWf?=
 =?us-ascii?Q?spKAnw/q5PPe4WH8Zu82+4gURx+hgbnW+OaxeUoV+mXhAhzfoXyxre7HLum9?=
 =?us-ascii?Q?3bOeiT91n5WSO+aMRpJjV0djlmf854qXzyknZ9TW+gZixGcGSDd2qA3bj9T2?=
 =?us-ascii?Q?S7HY7uP18XrhYV9Ud88x93LXEETg/9W5Vd5Zn9mGG5ReqErUHfPEzQ6YQEtS?=
 =?us-ascii?Q?yDToJIXFf9WRnwGz4wcaw8oBw2h26xzWzS73MdqXT3H3kKx/tYS6Ow=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6418.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?JKMSY/xFB7mlQG3rEYEXo4jg1kaYVWJDzveopLFtqshcvBEbbmhnseYKxO1y?=
 =?us-ascii?Q?mXT3DT4rSiianDjL+Sh6OZJa2M3mjr7NC8fW1/Stl92F89HHvrLH3yCvaflb?=
 =?us-ascii?Q?fuShP7LvwFYOtVhCdQld5LjIrlI/t6FNuICdVp0w6LmBSrbSVmZmIW93hA4c?=
 =?us-ascii?Q?KvqN0Ori61fCx07s1N/SJPisNUcxn80np7rM9W9hXsNTX1BAFQtR8HGxcESj?=
 =?us-ascii?Q?CiUugd3Q8QrtbxDERPa4bLO46nJy6XzcvlLNAYEQ7eOYH+KN9IKU5cntfbtb?=
 =?us-ascii?Q?vZEUt5T5wDRzThsohq2DQ03WMY2XR9Don+gpXr1jrzGjC75T6XMDGMQAJ3+r?=
 =?us-ascii?Q?NejE/qCysRmsfCNqqTvwYzcba8tHSXuOlgI8aSjUors+snXINbz/cS7dGCez?=
 =?us-ascii?Q?VKML3TtL1ztdd5zdhKe2e6gaYEaQyMC1gO2WA8igWcv2KrTH+quUJO4ZTrim?=
 =?us-ascii?Q?iBswat6ZtPu0vHr9gelOgaaEXEHL8eADyb3BQ0LPnO5veGETV7AR237Y8IdE?=
 =?us-ascii?Q?1AmKLDnqQVOdMEl+LTwqX/07odFtkxmyc85KnHthu0/fVbJGc0tJAzJRUFK6?=
 =?us-ascii?Q?J3qMRzXyyLaKTn3nOYnE8cWD+fCRKU6mp/tITAwH8RynRqH6K2svYJSMhd0M?=
 =?us-ascii?Q?J5E9w2GLGI+RBww+Ky0BF6CZOkfiJsZ7/SQv3BR5iVn4XNMxCyV0QgD7brT+?=
 =?us-ascii?Q?ISjMLHxkUGC/FqA6N3NA2PxVfKtvguCRQC9xY0N1QprVydlvv29TQERuRZVF?=
 =?us-ascii?Q?YjdsaG6/SZY0SqOlQSe0utJlD5+BAYc8Jkpf4C0IK2+y15QUibcyR8AIM/Rs?=
 =?us-ascii?Q?jCub3GSzM5ChZgwJCpJaaxqQLWpCQANMmI4KZXhzoT12edobiioF/9N54Fye?=
 =?us-ascii?Q?P09z44hIBo8jjsorUChfoyk9uxDdfk5yIV++3egrhAOFNlSaCm8vOgO/HXYy?=
 =?us-ascii?Q?ygmBmRGPjKFxz1O3F7DzWoyS9CVkcEbniEeEy5q7if5nZNwbhrtRds1Bz3EV?=
 =?us-ascii?Q?anlvtPS5KE1hR7hJT3eSS7H78X2WYsbmwZsX9a+PuNPJ8cxK3tEBliNGGBO7?=
 =?us-ascii?Q?BZ9BnuWBA76N3/fD1288aAbrd/MWfLUQKHkZ6Y+pWkT47ST9ELvMqaFvd02X?=
 =?us-ascii?Q?/6dmtmjOOZerieoRvDfjG8voGyNm9qy3yrb3KAauJ9vL2iQ9RISeh8HIxfoz?=
 =?us-ascii?Q?WXpNySrAm0HdRWcFZxfE1ID6oD5P16SONKSv+mq42a4Qx67mY+eyA11awfk7?=
 =?us-ascii?Q?umlNqYqkPaCaQfWsnb6hZNxjmXGKwKd16Qs44sRbzp0Vcyr/dT1C3sTkfU9J?=
 =?us-ascii?Q?npPXa4tJ/RPGEeURJLIK8TsKFd8UVMzT8px8I3wF9JFEUDnUxPH0rL2O6iK9?=
 =?us-ascii?Q?vQGU2pZ0ejeFXx4cwCihcCQYzOxjWte7IVpq0O1nZaUMAxww0nmYdOeprrHI?=
 =?us-ascii?Q?r2rtVkkkgfmaB3loLTEposFYqxGIh7wSgDy5eWYUPzybUjiFJXSw5jDJLVoZ?=
 =?us-ascii?Q?rK/ij1Zg7zqvaIlaePL4ZYUFvUGGgxR8X1c6jyzG8GBHIoO4DUwWRn/Tf05Y?=
 =?us-ascii?Q?uFzgdiYcF276NG/7GN0=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c3e6201-9ce7-450c-2655-08dd7bc93308
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 02:57:03.1166
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z8zZfUXB52EBgeyz16VQ9PhbYGtuQY0Rsy4lYF/y7tEa680NoXsEbfcbjYKaNKpVhLwzT4qXecLR0Gyw1o23EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6965

> From: Thierry Reding <thierry.reding@gmail.com>
> Sent: Thursday, April 10, 2025 6:09 PM
> To: Robert Lin <robelin@nvidia.com>
> Cc: daniel.lezcano@linaro.org; Jon Hunter <jonathanh@nvidia.com>;
> tglx@linutronix.de; Pohsun Su <pohsuns@nvidia.com>; linux-
> kernel@vger.kernel.org; linux-tegra@vger.kernel.org; Sumit Gupta
> <sumitg@nvidia.com>
> Subject: Re: [PATCH v3 1/3] clocksource/drivers/timer-tegra186: add
> WDIOC_GETTIMELEFT support
> =20
> I'm a little worried that we might be getting a very skewed value here du=
e to
> the multiple rounds of rounding. Can we not compute timeleft in
> microseconds until the very end and only convert to seconds then?
>=20

Will do in the next patch, thank you.

Robert Lin
