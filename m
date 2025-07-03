Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2044.outbound.protection.outlook.com [40.107.94.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43B52C327C;
	Thu,  3 Jul 2025 08:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751530999; cv=fail; b=giPVFe1LEZSK4NNeS/fze6MtLlL2OYC61uU51GoE+FhTN1Ev6tNYP4FaZnazOpQAi7NSOJVvwaJULmsWVuo3KF5LDWEDL2z0WII1y9QlspoGjYd0A+i3Bo3pS665DFW7YygXqtMXnMaMsZ4A7z+7EFxRtE0fHinR91rvuBCgJVw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751530999; c=relaxed/simple;
	bh=JY5EkAklMi24aGH9Dap3K10Avt/rFGsRQDPxy+9QvWs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dSs6ipZb0IyWAqV3VwhAzhrg08c4t27I7EnQaSeJgb78S8h8B1N9ibmKLNItEubBWx8F10E+3hHEpAHiQRh2VhKo4O5y/q/C/9aZ+gnRKiTF2F3neWl6FRfIh6RIAVRy00GtMaBJKDhaV4K/y9SP7HtqF+nne1lNvBI60H/guEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GvUriEFY; arc=fail smtp.client-ip=40.107.94.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GvUriEFY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tEO2xe6voEmK/WgTpYBArp5LQuC/Ae7oIorCYfkCzdFbaS3yDU6JxUlsNi4fxom3S8lp/1+IhsbWIR4/cDZKprhQr2qKK5GMEo4SMCemXE+ILY3S744ioZtLusuiPgEq/eLHk0+vNSCMOtNTHJbC5LvOD8XHFegrT5wlPGNKlnOUMgZIUYBHqNTBmwrt5YyoMzX8e18ysg1vBvgT9EDhsJp8mz870z4PO3O9wHftc09CqMft9fd6SG9a6tahVT2MvdfwC2mQJJqwXC2M00y/yjuHtzLR/UL0axxzcTy5FIWhq9js0j3zjbP9R8N3UAEH23BK8BMlZWNEJBVAAhocpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JY5EkAklMi24aGH9Dap3K10Avt/rFGsRQDPxy+9QvWs=;
 b=codm2d+832ONyw5RV9CiisR60hBko31lQHb+fQHmckBJoJsfRWe5S/F2PwDd6Ldx1e4hyZAkKLUtcEIhWpt0RGewC3jdenSqCnW5C8nqLv2XsBUa+wSMsqj0/E2IQ3arAX6W8DLRXuzcqT975rqBrQnokkr+bhzYpoHGb2ofKd/c+KKwSiq/e0Kppd0NfEnYfKqAEPuK/9pAVpSU2NjgrnATwr7OPBTJxYFvCPpKlW0SMmF6N51gFSUu91cgwvsTvnwgDYMb4IQa4ssLXCenklPmMPCNblVnNlU7GwK6BG31zRx8FhkuIXCu6YcUgfdRXm6onryXNdDE0dNA6kDaog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JY5EkAklMi24aGH9Dap3K10Avt/rFGsRQDPxy+9QvWs=;
 b=GvUriEFYLE25YGkm+grmp2qSRP4/+X8aDkIur1rSODN7m8oNISZB7rGzl93mUP6BIQBEiiWYfvXib2aYVusS+UsMpvJgxaMDaJUfjA4q+Q7t+rSWHflgvsGhbKJ++/ZqLVbsGQV9FJcX1GvgZQMazYBbaK2rCHZc/ix/g+PSqtviwqg3Z+UUOdlhtkhW52LbBcsc0D/1JI6NIZ0snsZyAW2I27O9wVUud6njXCqWLP04S/YWa0PccOVylB68libD4ttEC1MWoUeuo0mdGC9xx0hp+mHmTfvkHHGix1cj+FMCiCjKy4JyAo1vK40M+O6eXk8lQ0xuohCTcTtywuJWOg==
Received: from MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 by LV8PR12MB9184.namprd12.prod.outlook.com (2603:10b6:408:18f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Thu, 3 Jul
 2025 08:23:14 +0000
Received: from MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861]) by MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::1770:161a:675f:7861%5]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 08:23:14 +0000
From: Kartik Rajput <kkartik@nvidia.com>
To: "thierry.reding@gmail.com" <thierry.reding@gmail.com>
CC: "tglx@linutronix.de" <tglx@linutronix.de>, Jon Hunter
	<jonathanh@nvidia.com>, "daniel.lezcano@linaro.org"
	<daniel.lezcano@linaro.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>
Subject: Re: [PATCH] clocksource: timer-tegra186: Enable WDT at probe
Thread-Topic: [PATCH] clocksource: timer-tegra186: Enable WDT at probe
Thread-Index: AQHb6a51lHjGNatydkGaYtnu4rjqi7Qf+5GAgAAYTgA=
Date: Thu, 3 Jul 2025 08:23:14 +0000
Message-ID: <0afa0fbf2c19069e710b9c506fb66bec2f904e74.camel@nvidia.com>
References: <20250630110135.201930-1-kkartik@nvidia.com>
	 <3wesm6syeqmjdzyyj2mjp4sjfwl7ebeahqxwcvub6gwvoifuh4@43tunmtjsq4h>
In-Reply-To: <3wesm6syeqmjdzyyj2mjp4sjfwl7ebeahqxwcvub6gwvoifuh4@43tunmtjsq4h>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB5716:EE_|LV8PR12MB9184:EE_
x-ms-office365-filtering-correlation-id: 50c1bbdb-7bba-4665-9edc-08ddba0adb22
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NFpKWFFXdSt5Qzk3MWVlOG1IeG03ODZuM0JtaTBKbEJYbjJzdVpxbEVSd3Jp?=
 =?utf-8?B?MTNJeHNEKzYvRmNkME02Z2lYdGRjZEFXNlRsYkN1b3NrNVBmdWNmSktKMkY0?=
 =?utf-8?B?dXFtRUd0NU5NSHhlSC9LM2pGQXFwVVV4L3ljQnF1ZkF5cW9JUWFGNVhkUDhH?=
 =?utf-8?B?bEpkVW5jZ0tXS0lLMVhSY3gzNUFRQjVpcmMyVVJBa0hzdCtvdnZtMndnWnVK?=
 =?utf-8?B?cm9ZbWcydUY1TU9hN0FjMDE0cWRPSnF3akF4endnMUwyUEVCL1lVY3lZOTJn?=
 =?utf-8?B?cUkxR3Rod1ZrTkliR1l0b0FEY0FrU0FWdHM0OXVBU0p5VWR6YXJqWm9pZHQ4?=
 =?utf-8?B?OFZSSUtaajkyWFFBU0lpcWYrZXRGWVluUnF5UFFNdEhNaGd6dHFNNlJaai9U?=
 =?utf-8?B?a2xZQVZQTlZXQ0ZrOCt2K1NqNmFhdVFpSW1PY3Y0RkFEWHI5WVV5cGkrSE9V?=
 =?utf-8?B?YlZ1c25aaGdwYWk2Y0t6QU9DM1VyZnBCTHF0MUVxYWI1VzVYeEUrRFpCSkZu?=
 =?utf-8?B?b2RQWnpsS0k4cE4zWXFydTZ2c0ZnRDBUdGhBRm92TVNrTGlqT3Vnb3hCRUE1?=
 =?utf-8?B?elZJQUJEZWxDYzZwUkJZNkZ6UWpRdXZDUzkyOG9pQ2tFOFNObXBHUGRtOHZI?=
 =?utf-8?B?VkFtSkdXSFc0cjBGcFRwRzZDTy9kWVEvaUVTemFjOFJJbjBpWlhaRmxOMzNx?=
 =?utf-8?B?azJUY1hsa1hhRmV4L3EzNmFndjROMFRuUk5vZ0pnQzN2ck9ZT0R4clFFQVhv?=
 =?utf-8?B?M0Z2Qk5VRzBZdTRGSXQ5RXRZaGFwOXZQUFFnbTZXWXFneDlUUXZyVmhsTmxv?=
 =?utf-8?B?a2NEdm5NbWlEWlBBMitsWXM1ZW00QWhFTU9WWXlFcS95OFphaVBvajMwaGk1?=
 =?utf-8?B?U0pFZWpaUVpPU2xibCs3K0xOeHJta0lVcW91QzU4Z3E0cUVGRkRtdDJaa0dM?=
 =?utf-8?B?a0YzS2d1MEVGUmJUck9FU0lSMTBLV3NWM2NjTzhYRkUwaUd5QURWOVM5cm5U?=
 =?utf-8?B?bzNxQ3VhQmhZaHBYV1Z6alZYZndWTVk3VDFQTXZrd3QrMnhFZmp0WERBN1BL?=
 =?utf-8?B?MFoyZ2h5d0MrTVBvV3ByYVlqV1J0cFEwUlRIRlE5M3Z3R296aUpUMzJPOUZi?=
 =?utf-8?B?Qlg4bUU4aG5ESkNmYkt4VExHcE5QUkVGYndZRm1ndllVczFBZDhZM1lLZERN?=
 =?utf-8?B?OFN0SFIvTnFvS2ZucTFZYytGVCs2OXYvWDNOMktEelo2bk0ybkN2c292U2Mz?=
 =?utf-8?B?YXgxVGp4NkU2Q052UVRZK0xFSFpMVmF0TWMwS0c2YlBiWTYxbGFmbFArbDRB?=
 =?utf-8?B?WUlXRFE2YzJNVGFaME9Wck40REU0TEhSMlBnQnJEbHNQZGFoSUpETE5WK2dn?=
 =?utf-8?B?WGpKQTdReUFqZG8vYlJUZktkNS9LMVBjUnBETEhRMWpiSzVlZWE2MXg2elVJ?=
 =?utf-8?B?UnJtb0p4c0lDeWlVemQxalBhek9Rczl3RUZnSDFNbExxbXNBendZQW02ZFpM?=
 =?utf-8?B?TkRpZ0wzSXoxbkY5emtpd2dqSVpMZTIxTE8vREUxUzlRem0xakdqVGtiRFRH?=
 =?utf-8?B?WnM4S3hRR05pd2hkL1ZiSFRFLzJ2R24wYUVCdmRQK21Tc2J2azFFVlNlZVFh?=
 =?utf-8?B?ellLcFBqaGs2aTgxeDJlclpEczltTm1HNXN5eERlaE1yUjZKNDRLbFBIWm9W?=
 =?utf-8?B?WVBDWTFPb053enpQOElqOS94NVhxaHdQcHRRTWRGNGp1Zy9OM2x4cnpISnRy?=
 =?utf-8?B?eG1GTEVZWlhISDNScVBZcFd4Um41Zkk5MHVHNVArbDJWT2ZmemVxZGwyYzB2?=
 =?utf-8?B?QlBYejNKVzM3enUxQmJsYjVqdnh1R0kwTUlvWnZYdGhjVm15M2N2VDM1azY5?=
 =?utf-8?B?VnhlMlhFR05BLzcycWFqck9PSk81OFlBY1R3RWR1OW94NjhRbGtZeWJXL1NP?=
 =?utf-8?B?NUcyU095d05Bc0p3UUxabzcxdm1VYm8zbDRrQzZaeGpPUWZYMEgxTW1BU3M5?=
 =?utf-8?B?K29WdUFrYzdRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5716.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RmtHNlFjNVNxTXdMSHhHSEk3Tm9PMGlHc2gxUWhadlBXbzBQMmtZL05ydzNq?=
 =?utf-8?B?QzlUUWtkM042TVUwczVoRmI3TERSNk44RWxSMGhyOTNEeGVUM2JQNlFVQXZv?=
 =?utf-8?B?RXA5ZVRkcGR2T3E5M3gvdHJyNE8zN3FKak1rM0x0OTRRN0dHcG0vRGJUc2hu?=
 =?utf-8?B?S0VxWEo4WE9BblhIbENRUlpNenVNSmxDTkNzVnIvU3dZODhJNmpGVS9kaThT?=
 =?utf-8?B?OVNFV1lhdWpRR2dYYW5OOEliQVBmL2hac0tXam1VSGtvQmRkbUdldlhEK3dy?=
 =?utf-8?B?RmYzSnlhWlFHYm1RVEdpMmRQSmU2TElSZVl2cDhjRzd1RTl4YjJveDVJVG5n?=
 =?utf-8?B?VnVJNkxJU1NaSStWS2FpVm9lajVIZzhuTXViTGJFUW5PU1oramxmVWNrOUtq?=
 =?utf-8?B?R21WNkZ6WVNvbVNtVzk0SUpKcnZrYzZLVVIzOFM0bTBzVDEwNFpWSlpXTld0?=
 =?utf-8?B?VSszd0RUbWxpWGtiSytsbk1WZ3NCamlXYVJSQ09Jc1ZCRDJLWExtUkkzVjhH?=
 =?utf-8?B?VlV4cHExZGszWDV6aDl3RDNJdEw0N2hDL3ZFSjJIR1JpK1NmaWowMWpQa2E5?=
 =?utf-8?B?Z2R5MHJSQXFuQWpsZ1Qvc0dDY1dxcENFaWFOdmEvb3ZkRCtDUTZzUmlybHJp?=
 =?utf-8?B?ZGZ3ZUcraUpNSUYwZXk5U3BVU0tFU3FPU3FjSFR0d2E5MVBsYi93OU1KOTNt?=
 =?utf-8?B?dmJNWEZCNnQ0MWlqVU9qbE9VS0Z0czhxY2p2ZEYxMHBJNUhobHoxS3FmbzV0?=
 =?utf-8?B?akdIcW5XSW5CZmdZZE42dkdmeWJCbXpjTEdQVHVSTDBHY0JNZi9abmJJeUZT?=
 =?utf-8?B?b3diSDhkcm9CbEtJSDROZTVCZjRqTGFwMFNHMGRDck55eklvQVhtbVQ0dm8z?=
 =?utf-8?B?YmZzVVd0dmhhV01hZmRUd2FTTUhEUGUyMzJCaXhwdWZnMUlxNFBuMTFlMFZJ?=
 =?utf-8?B?V0hDbEk2aDRCRklpZnVFWEZzZ1o0cnk4TUdFcHlBMTBKNlgweWRicWlCOVU5?=
 =?utf-8?B?MlZHaVp0ZGt1QkFobXhOaWxnQXp1OFkrMnl1dXRHMHR3cHd3WUszRFdpYjI0?=
 =?utf-8?B?a01HaVpWU0xod1JzK2dRUWpmUVIxY201eFBzbTFaQjY5MzkxS01ES0lUVjNV?=
 =?utf-8?B?MmNtMkU5cGxsUnhqejNkdXYwaTNzVVJlUUNRcDB6T3htMUxLUCtjSmg0cnFq?=
 =?utf-8?B?dnVKVTFuRjZndDVBTUhJM1JIb04zREYwclVmVVNQOEhKZGVyVyt2bUdXb09z?=
 =?utf-8?B?T04yTXIySXltelRHY0w4YVhmMVp3V1hLZU9rSmxNWjZtVmYvbGduQ3BpSHIr?=
 =?utf-8?B?SllnSDJyM3R4MVZXdjNGTE0vTkRCOFd1ZGNNRm50NjB0T2dOeGpwSUo0aUtw?=
 =?utf-8?B?dlRKZ2RrWjBzSFI2QlE1TkhmVjVOQnczTCs5RzN5SFRndmtYSE5JMm5PZWxF?=
 =?utf-8?B?ZzljcTFxeG8xTlpOWVQ3c2VUbkpHN0trREdRZ0pqY01KS0NSK0drWFdkbG8y?=
 =?utf-8?B?MURkQzN6V2toTHcvV20xK2Fnb1orS1lXMmRadlhkeUsvTStlQUhYblJ6WnFm?=
 =?utf-8?B?K0E3clBaazV4eGRKelRzdk5aQWFCSy9OVXdZblozaU5wWUp2Sy9OTlBEM0ww?=
 =?utf-8?B?c0U5bGFtMFRCeU5JeDdMMi9TMG9vY21ZK2lKOSt0Rm9pUG4wakNxZzNiOXhL?=
 =?utf-8?B?SisxWUNNajNyMjRsS01uN29jWUdFMmlTV1VKTGVCdFVaTWFXTWlwc01CYmJD?=
 =?utf-8?B?cEVHaU8wVkFqZEpFWGh5eHljdloyMDBiYXdGbUNVQ3haT1BTQ2FWOXRmMTRh?=
 =?utf-8?B?TnptNmIxRTNHbktTVFFKYWRxZnVoWXl1T2tnNjZIeGdWbUYrUWEvRGo0aE56?=
 =?utf-8?B?ejJkRmZ5ZmJZeDh6Tm5tV0xUNW5VZUVLZTk4Mk1LanJhMGRJNWM0bE9GWkdQ?=
 =?utf-8?B?VVl5dnUyL0gzSVJ0SjdnaW9PamFMa1hGVFR3b3hHTWxOem9OV3dWOW83MDVy?=
 =?utf-8?B?MnNUNjFFN2V2cm9mZmJMOHgrMVduMWk0cEJITTgxcXpwV3lOdXJpalJMVytU?=
 =?utf-8?B?THJFOUdhUEVmM2tQYnAxcU1WNVNRNittSjE1U2xRQkxXSnR0Rk5RL2lJdXpz?=
 =?utf-8?Q?tRVfCreWq5s3ysi/a+X735WUh?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <51E26235E9D9144A8C9C5D5AFD9D4E48@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5716.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50c1bbdb-7bba-4665-9edc-08ddba0adb22
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2025 08:23:14.4917
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VGKnyyLRc6owVJNBsJSgA28YL7pRK6XMnid/9gn3d5dbluVBAZuRe9XE2XT+PM0rTAlJ2R6On7T1IVqef2VvZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9184

T24gVGh1LCAyMDI1LTA3LTAzIGF0IDA4OjU1ICswMjAwLCBUaGllcnJ5IFJlZGluZyB3cm90ZToN
Cj4gT24gTW9uLCBKdW4gMzAsIDIwMjUgYXQgMDQ6MzE6MzVQTSArMDUzMCwgS2FydGlrIFJhanB1
dCB3cm90ZToNCj4gPiBDdXJyZW50bHksIGlmIHRoZSBzeXN0ZW0gY3Jhc2hlcyBvciBoYW5ncyBk
dXJpbmcga2VybmVsIGJvb3QgYmVmb3JlDQo+ID4gdXNlcnNwYWNlIGluaXRpYWxpemVzIGFuZCBj
b25maWd1cmVzIHRoZSB3YXRjaGRvZyB0aW1lciwgdGhlbiB0aGUNCj4gPiB3YXRjaGRvZyB3b27i
gJl0IGJlIGFibGUgdG8gcmVjb3ZlciB0aGUgc3lzdGVtIGFzIGl04oCZcyBub3QgcnVubmluZy4N
Cj4gPiBUaGlzDQo+ID4gYmVjb21lcyBjcnVjaWFsIGR1cmluZyBhbiBvdmVyLXRoZS1haXIgdXBk
YXRlLCB3aGVyZSBpZiB0aGUgbmV3bHkNCj4gPiB1cGRhdGVkIGtlcm5lbCBjcmFzaGVzIG9uIGJv
b3QsIHRoZSB3YXRjaGRvZyBpcyBuZWVkZWQgdG8gcmVzZXQgdGhlDQo+ID4gZGV2aWNlIGFuZCBi
b290IGludG8gYW4gYWx0ZXJuYXRpdmUgc3lzdGVtIHBhcnRpdGlvbi4gSWYgdGhlDQo+ID4gd2F0
Y2hkb2cNCj4gPiBpcyBkaXNhYmxlZCBpbiBzdWNoIHNjZW5hcmlvcywgaXQgY2FuIGxlYWQgdG8g
dGhlIHN5c3RlbSBnZXR0aW5nDQo+ID4gYnJpY2tlZC4NCj4gPiANCj4gPiBFbmFibGUgdGhlIFdE
VCBkdXJpbmcgZHJpdmVyIHByb2JlIHRvIGFsbG93IHJlY292ZXJ5IGZyb20gYW55DQo+ID4gY3Jh
c2gvaGFuZw0KPiA+IHNlZW4gZHVyaW5nIGVhcmx5IGtlcm5lbCBib290LiBBbHNvLCBkaXNhYmxl
IGludGVycnVwdHMgb25jZQ0KPiA+IHVzZXJzcGFjZQ0KPiA+IHN0YXJ0cyBwaW5naW5nIHRoZSB3
YXRjaGRvZy4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBLYXJ0aWsgUmFqcHV0IDxra2FydGlr
QG52aWRpYS5jb20+DQo+ID4gLS0tDQo+ID4gwqBkcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXRl
Z3JhMTg2LmMgfCA0Mg0KPiA+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiDCoDEg
ZmlsZSBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspDQo+IA0KPiBUaGlzIHNlZW1zIGRhbmdlcm91
cyB0byBtZS4gSXQgbWVhbnMgdGhhdCBpZiB0aGUgb3BlcmF0aW5nIHN5c3RlbQ0KPiBkb2Vzbid0
IHN0YXJ0IHNvbWUgc29ydCBvZiB3YXRjaGRvZyBzZXJ2aWNlIGluIHVzZXJzcGFjZSB0aGF0IHBp
bmdzDQo+IHRoZQ0KPiB3YXRjaGRvZywgdGhlIHN5c3RlbSB3aWxsIHJlYm9vdCAxMjAgc2Vjb25k
cyBhZnRlciB0aGUgd2F0Y2hkb2cNCj4gcHJvYmUuDQo+IA0KDQpUaGlzIGlzIG5vdCB0aGUgY2Fz
ZS4gVGhlIGRyaXZlciBrZWVwcyBwZXR0aW5nIHRoZSB3YXRjaGRvZyB3aXRoIHRoZQ0KSVNSIHVu
dGlsIHVzZXJzcGFjZSB0YWtlcyBvdmVyLiBTbywgdGhlIHdhdGNoZG9nIGRvZXMgbm90IGV4cGly
ZXMgZXZlbg0KaWYgdXNlcnNwYWNlIHRha2VzIG1vcmUgdGltZSB0byBsb2FkLg0KDQpUaGFua3Mg
JiBSZWdhcmRzLA0KS2FydGlrDQoNCg==
