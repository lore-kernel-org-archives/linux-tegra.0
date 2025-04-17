Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2057.outbound.protection.outlook.com [40.107.236.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AD5A55;
	Thu, 17 Apr 2025 09:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744883025; cv=fail; b=QmjB5DWNa6vAFxCpCA0RedWK/fxtBDHCRulCM0gLgWB9J3vedgvVXOL7tszNATMe+RGouiMm9BXT5k0caq8AtJAFJlppBSCotzClWkUpGRSG15vKq7TsArO1/l3t24uvnt89kQ7pbbtulyL/nWmj/Ee7RSSLXsmoCO2Nj4Roh2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744883025; c=relaxed/simple;
	bh=isCix2OR9HziAa4d/98CVm1KLKr6sApPE1s2MpdvpEQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DRdAPGCzabxL3C96e1gOCsTDdVbj48KA6aNCHcIim6hiBWNIXCkVdOAOsPk85kpIn9mhPJH6EHLvANoXcAwgRTK182mGEfDYorMye8U3k7PdUY/ntq3vUWYZngWnbQog4Wm5RtwsgpJWGEfP0Jw45Lv4yuOyniDo1BywQNVOqxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kih/ax6e; arc=fail smtp.client-ip=40.107.236.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kih/ax6e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g6sowAKtoPMV0w34WMN/jQKadYA49nAqeWW0V3PvNGpJEQc96GsFBfI7eDLuUGTOCTeM86fZfvVxPL5uHnNRhPUwOVoRL6h07AiZtgZC3rP0nuYLuOe1Yd3ltZdaWOxIw+zC71w9k5xPSdkkje9eHvUkxAK1Vs/YVZh33Rt7ksKuhgYopzAKPspwD2jbvoRnb6I3q7VVyhmc9HYU/c8kmId15rwo/kwV1PnUYHYUUU+9COcMHBy7Rk4xPpN3wr8OPKupymysPKshctdFuZOmKaln7L42eAt0BvncHZnlJJgZrszG+1qtpQqGAV+LmpVOFh0zWZVdbXs7FgbVFsHMzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Mi1ftBq6qYk2+QzGw3wOKYahPb3qE60W08+2aY+HkA=;
 b=Nl4/56LhW2wGedK8BdTOw/D32Ff1LVtTwBrSvPygsfehv3TqsntvVOUXaoTTBEpF+SE8XEBvn9W4l1H362FpCO25Uv1YCFx0hKmGs9+G8p6IsZhqOYxdUIwjm5F2C8Z+xRKkFPQS0KyFoafq0Qi6tIfvRxi8zJOFXnVPmJRO40KgEIxyPUF/pSwUVG/VOgX+48tZU2ZVrxSN+weiXRXYueWBU8s18CRuiqCjKHJp6P0mvVo4QQVRRuquB9F4HlQjeasZQbilayUqUqKy/IK2gDWLLONrB+VIyB1j/YmdwnIxgESBiau//WIhsGsIFYFf1Xo22w/hODRnnT5Wqp34NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Mi1ftBq6qYk2+QzGw3wOKYahPb3qE60W08+2aY+HkA=;
 b=kih/ax6eAynvBHLFsdHjJvLS1hbN38Tidioi0qE79RiZJsWCe515ivL35atn6vo8l3cm7N0nWXdBBXFjaNY6mtJarCPhBJX6l5/NBYAE+RFg2qpg1heLwhiqWRk5rDrCHqFG/EAfXrTqwFsY2kYDLCMGJ6ETaU17oxA8WC+JUdPIu6n66Zb4bJD0f5ofpGNLCld+5Sf51zWiL8EKhjS6EtHeHkrAMhBIdeuvgNPeBZcMM+K2mXaQzSRju+noYPoYtWI13ijru1HgRL7rFMC+GQLqfI3OflqvPEYoQ2BKJJ5G4lmt/MvATE7+FA3AF4umTHfHkY86baIcHngOZb0jKw==
Received: from PH7PR12MB6418.namprd12.prod.outlook.com (2603:10b6:510:1fe::18)
 by PH0PR12MB5632.namprd12.prod.outlook.com (2603:10b6:510:14c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Thu, 17 Apr
 2025 09:43:40 +0000
Received: from PH7PR12MB6418.namprd12.prod.outlook.com
 ([fe80::c212:c319:304e:bb09]) by PH7PR12MB6418.namprd12.prod.outlook.com
 ([fe80::c212:c319:304e:bb09%3]) with mapi id 15.20.8655.022; Thu, 17 Apr 2025
 09:43:40 +0000
From: Robert Lin <robelin@nvidia.com>
To: "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
	"daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>, Jon Hunter
	<jonathanh@nvidia.com>, "tglx@linutronix.de" <tglx@linutronix.de>, Pohsun Su
	<pohsuns@nvidia.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Sumit Gupta
	<sumitg@nvidia.com>
Subject: RE: [PATCH 1/3] clocksource/drivers/timer-tegra186: add
 WDIOC_GETTIMELEFT support
Thread-Topic: [PATCH 1/3] clocksource/drivers/timer-tegra186: add
 WDIOC_GETTIMELEFT support
Thread-Index: AQHbr3shz4DTnH23jUWmHxsCiG0EhLOnmq9Q
Date: Thu, 17 Apr 2025 09:43:40 +0000
Message-ID:
 <PH7PR12MB6418D7F4AAE03AAB0600187FD9BC2@PH7PR12MB6418.namprd12.prod.outlook.com>
References: <20250417092817.2751534-1-robelin@nvidia.com>
In-Reply-To: <20250417092817.2751534-1-robelin@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB6418:EE_|PH0PR12MB5632:EE_
x-ms-office365-filtering-correlation-id: 69d763cf-befc-481e-b1e4-08dd7d9455d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?DBI0tPkAwiowoHyBFC9A5JxwDAQVxkznq6x8Kl3ulTsCpI/ki7gGqjVAm2J3?=
 =?us-ascii?Q?g66KMUDa7GpczMWshzjL0JaWNM2TNu5kIn25xkwo+W5sX4HMrhZ+Mlf3v9Jr?=
 =?us-ascii?Q?1ziY4V5xBldv/BCuz8jnShl4a1hgxZ12Cca+MXAN15lKCDvJUfg6+Y1ZV8zD?=
 =?us-ascii?Q?+gnZnuA2lE54lv869p3WP5RvVEdUMrwa2cTSCLVQn/Esa3IlRa6dcwPYCobF?=
 =?us-ascii?Q?sw7t50jt8JYSooCAkazIZ/Uhu6HWQC3YejWrl2Y7z1m4ovRSx4eBlTdH0mWe?=
 =?us-ascii?Q?ryAjxmCX/4qhkQFhA+91Ma4XgjRmY3jE0Yqu8Zw2hFes72GJC13ST7Ulo4S0?=
 =?us-ascii?Q?c9zyoEaldeOaRVuI8W+Xq2fqacqL6IowjWcY98hM3xHxUe/lPVtyLv33/M4G?=
 =?us-ascii?Q?StXAp2MxdS0PIglqyYjDfClm2BSedIt8XugJGNPeErVrJP35keouppMgJkI5?=
 =?us-ascii?Q?Vio6WZmWsEWFGYLaVPvHXA/69OIqLEGBX3Rm83LLtnXLpqXGDqENFMIZTD6M?=
 =?us-ascii?Q?gC2syHPYB587BW1PSOTAepgAJ1IlpAOkWaO5vu3sz7E/wamr2CqUA35iJ5H+?=
 =?us-ascii?Q?fcakIA+fzDOeYpBvpe1wNTeD7M2JXnO1/un+pzBngQLMCYQaAx+/kuRec2n1?=
 =?us-ascii?Q?Y/BT0JpZC9bOup/S8RwH6W/DA3gXXJMQ5t65IrhotCVQTDN/K4k7ycnkvSDk?=
 =?us-ascii?Q?7TAjSx5P5qAVlruPA2o3A5ycUNd0lSVXmqQ+/H9073ScHjsJGHrgW6NZXxU2?=
 =?us-ascii?Q?XbGNPR1SIXr4WVPwvZeqarrzvo+Jp+f7mYrLnWtP05kYHHwSW5hgVsNClDVS?=
 =?us-ascii?Q?hCrVmnv5FJyOjza2DK2zPsJLbXz+LDqo4HvwX0DJ+XGjXFtBwC2MRgFVRSxd?=
 =?us-ascii?Q?vJyH/eBS3TrUSMAhs/qrjmm2sYih5HCwXwMX9BQ6NLt7HUXzzpHbCNv3Q+5I?=
 =?us-ascii?Q?gCsa6bZfJR6WJ6PtMFhStm4ai9leUu8LwBhJsrvuRbiri9nI51hQFS5/Pgk1?=
 =?us-ascii?Q?P+D8jSoxGnzX8A7YKch8BXHx+ckVDRClpL8JHZaGa+UuD+nQq/bu1V8fgkvb?=
 =?us-ascii?Q?mV3sNXvUSljGLztjyZkV+yUg11i5izruIDNOu4erItFfY4ZMbFpevJlyBgyd?=
 =?us-ascii?Q?zQZAgluBTy63zz3rRZBBpNwG0g6SS8gQPMScjTWURUKm4p0sYugNZsun2Xcg?=
 =?us-ascii?Q?6OU+kgdPBNfn0v2lZFXXNJ96msk99Gzp65SXTbGn5jvfdaGhHJ97hj/p5T9o?=
 =?us-ascii?Q?6qxJYjAWLWH3DZ6/Rc6RLe6cUtsuDxo20y8VC6tJto0hPfJcPJxs1JO4FiCx?=
 =?us-ascii?Q?P4H5wMZehwouDLYTpUDTek+AMmpcr/kG33KrpdIlT3KhHgLl+icDsEDhgF1c?=
 =?us-ascii?Q?9nwqcjnqiJoh7AAxrUSkhSTtP0AdIiZjDAv1+ZP0Z26ultO8qwsegS7pLEON?=
 =?us-ascii?Q?hJz+CWSTf0nL6yaGuZrtluHFIiQ7Nmln5g6rJzWksR9MrhxRWoXQTBTXJEgE?=
 =?us-ascii?Q?9c+DjGV11GTW4Oo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6418.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?JVsYrj5BW/v0MHte2atMbnJNuDcMIMxjsm5lUpbMYoNjh0/0mM8ldjUmsqKZ?=
 =?us-ascii?Q?11Cr4Lijdhq6700kE9z4gsS08V75bxKLEcyesJjqboQGwTHvkQbUAna5Lptc?=
 =?us-ascii?Q?dzzvlNVUAlltQ92qRjkra6MPAF4O9lKGZvT6kM06/gfF6w5yAdwV0vxIVwCV?=
 =?us-ascii?Q?L8ae2LNN5vPGxu6vJOJ84kpcbMMyoEwKZQSx9aYbna3hll/UMPyyP2zadgKQ?=
 =?us-ascii?Q?mHxv5BKCefSI5JA2Ksqx7VNFxUveHW2PFp1BeEXr1yVpNI5wRh4Y/5PdlBVe?=
 =?us-ascii?Q?gXIYkBuur4vO0X35PJwBqN4N/wZcrD43aXhEf271lwRQBRAva1Az/sHg479y?=
 =?us-ascii?Q?cAMbi65x552SEQnK99f8n/SJ61+OZxL5OihXQNwhyzQGOQKopba33RGc/5b5?=
 =?us-ascii?Q?oXP+mpWzmG1PHdlhtU7N4vw7GCa8rC27BreAbVYVDxYtoMcP5S4AvgZFcewa?=
 =?us-ascii?Q?TSjfSMjdX/1sObHNvc8PYk/PljDuJpdrQ0qYDv+0lzoQVdD2gJwyyae49Niv?=
 =?us-ascii?Q?6q7XLyzik4/jWuazZn5yvHkwEbCnJZcrN29PcppswceYufFYrsV2n76IiHim?=
 =?us-ascii?Q?raDOuncTp3Clg2trNBf51Zzej73Esg7Z/8XTz6lwxGKCTpVCWOlnZO19iQKp?=
 =?us-ascii?Q?6Y9pFJ4q0VmpYTe9WBpeKqdJ3aZDvYaGvDsgUNhiac0piGaUkE3oVGNlzoDx?=
 =?us-ascii?Q?+ajJvFlvkLiw/PhCw2z+PeSKgJgypVM3OSYB4I7ZFuH67hIizPyTvft7qKGX?=
 =?us-ascii?Q?GAVHOY4dv2aQ7UzO0KIsOCvfztf+6/xillYGwiv8e4Z+nBqo8m+EyzyLCYwa?=
 =?us-ascii?Q?AriRFOw1l+y3pdszc4apj2gKsHj1a8ru1IxzFziqlBVUIlpy7GF37rsvE2fK?=
 =?us-ascii?Q?OVp4lSqnf7lUF63q1bwhotUks1l/HxL/Xwm1IhJFY6KqJr2PHQnPDbgZX6Zz?=
 =?us-ascii?Q?UZgadx1KKI5WJtfIiUjqn+yTam1pXb/CL7ZWKWSUh/s9pkHBfjfgNnS6ZEnT?=
 =?us-ascii?Q?YUb9ZgUiW/wvH99ZL0XRhRKIa2oUFHqOdSsPBtyyjSbARB3L5cg1UgrKnAaI?=
 =?us-ascii?Q?S1PH/AUyVB0H17wD7txk5dTK2qWsQhEHUKjJH5T3CWyNqfiaydn8Bs0R/hAa?=
 =?us-ascii?Q?OrDKENdumfJW5BFKo1tk0St6EthvFAEZa/NnyPsvZf0qW7cz1dGqgq3DS17G?=
 =?us-ascii?Q?+F9YwZmYUzaEWWFenMKgs/B/Vf8ibQFRtLkGSiGfoeaTJDBXAYEWb+VQlJ2q?=
 =?us-ascii?Q?nop8jlTp8uST6sWWFQls+i0aZyBrP6HmFB+yV4k8qNoJntjf9wzZKngWO2Uz?=
 =?us-ascii?Q?Q1dZaK/gyYtb+NGu2c9lbIfZ9XajgZKOFH1FRs9sLUeEGM0ijjemJbxw/afq?=
 =?us-ascii?Q?4INQpS22hO0+Ad2zp2fh7Hk17O9SyTYYzDrP9pSIJxSI0Kl16dTtyDFPw5WA?=
 =?us-ascii?Q?g6yP5eh1If78WbH1JyUNTdvZaEcvl1ozYxIhHy7z5g+cWQvFIW01i9t2BGbi?=
 =?us-ascii?Q?8zFcdCB+bD3Vvv3lfGMCYrGSyv2e2DdTjB4ItPrWuwuHTpNNmzh3JJOKNWce?=
 =?us-ascii?Q?rVzHm0ITHXvRCHdbNiw=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 69d763cf-befc-481e-b1e4-08dd7d9455d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2025 09:43:40.4937
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7WPk+K2AMP18fMyK9xoojczykpnUQI2ZQHfpLFix/eLHcbhRylsMX7bsA/3JupDfuNVFQTPFJrdfaJEAKv5W4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5632

> -----Original Message-----
> From: Robert Lin <robelin@nvidia.com>
> Sent: Thursday, April 17, 2025 5:28 PM
> To: thierry.reding@gmail.com; daniel.lezcano@linaro.org; Jon Hunter
> <jonathanh@nvidia.com>; tglx@linutronix.de; Pohsun Su
> <pohsuns@nvidia.com>
> Cc: linux-kernel@vger.kernel.org; linux-tegra@vger.kernel.org; Sumit Gupt=
a
> <sumitg@nvidia.com>; Robert Lin <robelin@nvidia.com>
> Subject: [PATCH 1/3] clocksource/drivers/timer-tegra186: add
> WDIOC_GETTIMELEFT support
>=20
> From: Pohsun Su <pohsuns@nvidia.com>
>=20
> This change adds support for WDIOC_GETTIMELEFT so userspace programs
> can get the number of seconds before system reset by the watchdog timer v=
ia
> ioctl.
>=20
> Signed-off-by: Pohsun Su <pohsuns@nvidia.com>
> Signed-off-by: Robert Lin <robelin@nvidia.com>
> ---
>  drivers/clocksource/timer-tegra186.c | 56
> +++++++++++++++++++++++++++-
>  1 file changed, 55 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/t=
imer-
> tegra186.c
> index ea742889ee06..201b24ca59f4 100644
> --- a/drivers/clocksource/timer-tegra186.c
> +++ b/drivers/clocksource/timer-tegra186.c
> @@ -1,8 +1,9 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (c) 2019-2020 NVIDIA Corporation. All rights reserved.
> + * Copyright (c) 2019-2025 NVIDIA Corporation. All rights reserved.
>   */
>=20
> +#include <linux/bitfield.h>
>  #include <linux/clocksource.h>
>  #include <linux/module.h>
>  #include <linux/interrupt.h>
> @@ -30,6 +31,7 @@
>=20
>  #define TMRSR 0x004
>  #define  TMRSR_INTR_CLR BIT(30)
> +#define  TMRSR_PCV GENMASK(28, 0)
>=20
>  #define TMRCSSR 0x008
>  #define  TMRCSSR_SRC_USEC (0 << 0)
> @@ -46,6 +48,9 @@
>  #define  WDTCR_TIMER_SOURCE_MASK 0xf
>  #define  WDTCR_TIMER_SOURCE(x) ((x) & 0xf)
>=20
> +#define WDTSR 0x004
> +#define  WDTSR_CURRENT_EXPIRATION_COUNT GENMASK(14, 12)
> +
>  #define WDTCMDR 0x008
>  #define  WDTCMDR_DISABLE_COUNTER BIT(1)  #define
> WDTCMDR_START_COUNTER BIT(0) @@ -235,12 +240,61 @@ static int
> tegra186_wdt_set_timeout(struct watchdog_device *wdd,
>  	return 0;
>  }
>=20
> +static unsigned int tegra186_wdt_get_timeleft(struct watchdog_device
> +*wdd) {
> +	struct tegra186_wdt *wdt =3D to_tegra186_wdt(wdd);
> +	u32 timeleft, expiration, val;
> +
> +	if (!watchdog_active(&wdt->base)) {
> +		/* return zero if the watchdog timer is not activated. */
> +		return 0;
> +	}
> +
> +	/*
> +	 * Reset occurs on the fifth expiration of the
> +	 * watchdog timer and so when the watchdog timer is configured,
> +	 * the actual value programmed into the counter is 1/5 of the
> +	 * timeout value. Once the counter reaches 0, expiration count
> +	 * will be increased by 1 and the down counter restarts.
> +	 * Hence to get the time left before system reset we must
> +	 * combine 2 parts:
> +	 * 1. value of the current down counter
> +	 * 2. (number of counter expirations remaining) * (timeout/5)
> +	 */
> +
> +	/* Get the current number of counter expirations. Should be a
> +	 * value between 0 and 4
> +	 */
> +	val =3D readl_relaxed(wdt->regs + WDTSR);
> +	expiration =3D FIELD_GET(WDTSR_CURRENT_EXPIRATION_COUNT, val);
> +
> +	/* Get the current counter value in microsecond.
> +	 */
> +	val =3D readl_relaxed(wdt->tmr->regs + TMRSR);
> +	timeleft =3D FIELD_GET(TMRSR_PCV, val);
> +
> +	/*
> +	 * Calculate the time remaining by adding the time for the
> +	 * counter value to the time of the counter expirations that
> +	 * remain. Do the multiplication first on purpose just to keep
> +	 * the precision due to the integer division.
> +	 */
> +	timeleft +=3D wdt->base.timeout * (4 - expiration) / 5;
> +	/*
> +	 * Convert the current counter value to seconds,
> +	 * rounding up to the nearest second.
> +	 */
> +	timeleft =3D (timeleft + USEC_PER_SEC / 2) / USEC_PER_SEC;
> +	return timeleft;
> +}
> +
>  static const struct watchdog_ops tegra186_wdt_ops =3D {
>  	.owner =3D THIS_MODULE,
>  	.start =3D tegra186_wdt_start,
>  	.stop =3D tegra186_wdt_stop,
>  	.ping =3D tegra186_wdt_ping,
>  	.set_timeout =3D tegra186_wdt_set_timeout,
> +	.get_timeleft =3D tegra186_wdt_get_timeleft,
>  };
>=20
>  static struct tegra186_wdt *tegra186_wdt_create(struct tegra186_timer
> *tegra,
> --
> 2.34.1

Sorry for the spam. My automation script has some issue to submit the wrong=
 patch series. Please ignore these emails and move on to the next patch v4 =
series: https://lore.kernel.org/lkml/20250417093110.2751877-1-robelin@nvidi=
a.com/T/#t

Let me know if this cause trouble and I'll need to submit a V5 patch instea=
d, I apology for the mess.

All the best,
Robert Lin
