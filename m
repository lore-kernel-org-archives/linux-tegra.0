Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2069.outbound.protection.outlook.com [40.107.101.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02C5182;
	Fri,  2 May 2025 12:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746189456; cv=fail; b=pTAF/RFnHDoeiBeEME+NjO8g3e+mQd4nGwhkARkT9oeLsK/0twFxANalMQ16JqoUvn1hy+RFk5juWSK0pC/gaUSEiBiL7DwC8kTK8xrnGumhZ0nK8LkHupj8OJTWlSYnY/nU28tNW3EJkkJu/soyWAVJ0vDD4V55ZDYPDHdQWog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746189456; c=relaxed/simple;
	bh=p2F1SMd/ya6fblMHmXrRO2M2OxQ2HSpNUj4IFVZ7Snc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VC2GKeGgJn3NUxNTmchHTRY0CiFmAJ0Afl95rCKs4OIC1xb+v7GFLVcj7h1xfQy5SE7FbIBH43l/d0XV5JnrKSqifa0EcyjRC9NcMsKsKkA2YuUesjCXKMcORGs7Mx6F5B3msKcmYSpSD5DOxoCQELrTCeyvq0r71EOwUrrcazk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PlmJ5Mbc; arc=fail smtp.client-ip=40.107.101.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PlmJ5Mbc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uOJORYk6D0HZ4QGxmk7yDttA5Zonel7bKgcLfhJYok6P1qU5a4MWKzwTGj5aqUstexdewnNWXqu1n33NZ542yrZBd2TJxwhEVgEmHIObpv0yR/5CI4diTJdMTSbmHgPhBxv0R74I+++INtX2Chgobb8XvLIKABgVwkzoRPK2zQ41lPinJiOGATk7ui3JowMkfeEgyapbvHNJvBNwjnlDjKcETF7LaE8dm+pYLaSIHnXH9ogxExj5EhTeu4S9ELEwSHoAa3uUwIa3DjMPG5GHT+qNTDI83RmUeLHYUqzQRF016McfqB47HWmXT+seYni/qyl8Fy7o3yFuk2iE5oWskg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPKMbsYGoyBBg5fhF8xMNfFJq9CAIrzWwh07XBsvTgA=;
 b=FTqrCuR8BO9mSAoHGiLtORV7BfUAsJjiLU1ReEkgAmxG8uu/S8OlaPw3sn+lhDdm2hwjONOEP9EfzblVc9/pU9kJ7wHM45oVJ4o26PrdR+U8yT6AxtdD9id6GMwqnvmuTdg/j9fSqozh6XnlGd7NfL9P39uVRkSBrdg2NLhlrsh9WiE6IniBZpldlOqNUhq6bBNmUD6JDsQvcpvrnSxmGiQkXC/gFFdr21oe8+4NCqfDKaC8b5dyN4n2ekxwZbq3Uj95Ju92M2JZV2tHOkCNjtDKletnC+8qK8Dr+nIXTS/6yraD/KZ+UL0+fAvGNVFaNH86Qjeu8McjdkaSjmuuOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SPKMbsYGoyBBg5fhF8xMNfFJq9CAIrzWwh07XBsvTgA=;
 b=PlmJ5MbcQJI3+W/93DV/x8JKg2Cv1rtY/oixp3izd0WRqYFGfn2SWDcx7k0X1Bqrq5GcIdVJM09kWzp9YH+5SpBGcLSVLZaBJ4GG1grC5OdkV6Ki5ScKtlrySyHzh0gSiW97vbX6bNQegc33x7PHC4keiA1tAUyYAA0snA0b4yq2MnU68BqtaQ0y5QLQjc1HDqkxumkiBmq4EAAdAiNuybod5quPu7V+P5sAX+DNVsYRpqYbU3Lzp3OzPgPkCmnfxI+FExv/kI890plkPsW0VcCC9KisYFsKW4ekx+ebpjwhqm4F56Mnmz0puDiAV3ON5EpusYMpGgxw2veWUIL3Jw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by BL1PR12MB5801.namprd12.prod.outlook.com (2603:10b6:208:391::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Fri, 2 May
 2025 12:37:31 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%3]) with mapi id 15.20.8699.022; Fri, 2 May 2025
 12:37:30 +0000
Message-ID: <a6a45384-18b4-4500-8b8e-8cdd8df5ac1f@nvidia.com>
Date: Fri, 2 May 2025 13:37:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] clocksource/drivers/timer-tegra186: add
 WDIOC_GETTIMELEFT support
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Robert Lin <robelin@nvidia.com>, thierry.reding@gmail.com,
 tglx@linutronix.de, pohsuns@nvidia.com, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, sumitg@nvidia.com
References: <20250502043727.396896-1-robelin@nvidia.com>
 <20250502043727.396896-2-robelin@nvidia.com>
 <aBSOJTlQUUnFIEVr@mai.linaro.org>
 <af0e0ab4-89d5-4f77-86c7-90d2bc3e13dd@nvidia.com>
 <aBSjyZJ0__ctBa-4@mai.linaro.org>
 <5824d505-0a42-40cc-84ec-814f0bbfb79f@nvidia.com>
 <93f063fa-0012-4018-8c37-a2bfa623d2bf@linaro.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <93f063fa-0012-4018-8c37-a2bfa623d2bf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0260.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::11) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|BL1PR12MB5801:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d162d60-590b-4707-be5e-08dd89761a4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VURmTVcxbzg1NEVPVjcrRno2eDZveFc2WERTdExZL2F3ekNTWTB2RlJZSVl2?=
 =?utf-8?B?enh1SnhtTFMraW1kQzlPcUhTMXRvR28wSGZYek1XWnlTT1ZTSGlTRXVVcGdm?=
 =?utf-8?B?Zlk3OGo2b2cxbXhNczg1K2tMNm5yRTBWQkFDandFcVlFTkk0NWNGaFpBcHlN?=
 =?utf-8?B?emp1VEpNekxCVXdkRjBVVXpncFdRWWcybE9HRDVXdWVoS0F0RXAwSEZFL2xo?=
 =?utf-8?B?SWowMmx3aVFXZzM1NUZvTGhzclEyb0xMQjdTcXZKNC9xOEhMRGkrbm5kVXhY?=
 =?utf-8?B?TDhOS2ZnOXFkaHBFOFdJTGZWOHpkUENadUw0a3ZZUDFFL1c2bG93Rm1UOVRj?=
 =?utf-8?B?d3Z1UnY0M3p6Y2s4d2JUV1FERWRIMWFDZmJwK1dWWisyT0QyanRvdzZrdE10?=
 =?utf-8?B?c0FvREpobndtaGxzRGxyM05YYmdMeDB4WkNyaEZTanhhQy92RjNDa3RSZWFt?=
 =?utf-8?B?Mlh1dncvekx1b0xKajJ4TG9QeTkreFZXcDBNQzd1a1BXYUpzU3h2MUI3UjVV?=
 =?utf-8?B?MVptbWFpUW1LVmVFRm1HRUZZNzRGQStXYzZMOG4zbFZaMXhIZ3poL3F3OGh5?=
 =?utf-8?B?TU1tMHYxRHNFWkJGR25UQWFJQ3ZNc2puTkR4THJjcC82MndvS1U5TUcyMFZv?=
 =?utf-8?B?VHVFWDV0ZXl3Z0FyM3JTL3h5YXZFUUtkZ28zQmtXOGdLaEs0bWQvaXloWFd5?=
 =?utf-8?B?ZXZweW0ydlU2Uk5Cb2J2eEUyWFRVOWxsQmNGVXBCRy9oc1lRaVpBZTRhVUM5?=
 =?utf-8?B?bmRQMmo3N2tCQ1BMd052R2E0S2FzRk56OHd3QTJhS1NhOHAyTzZ2aW9hbU5h?=
 =?utf-8?B?dXJ0RG56WEtHNFRwaE84RlAxTlVzazZXTXJTQXFNQ0UvTFhWcmZxZUZUNkRW?=
 =?utf-8?B?eUVaeXlBT0NML0lRYmIwR293K1I2Z09LSTRsSXZQZUIyQW9rcEhuUFhjMjg2?=
 =?utf-8?B?M25xUXpFTVhlQ1VhN0ZPcCt4T2pRRmdMbDdKbk9XZGg4N2lQcko1V3laclhi?=
 =?utf-8?B?dWdsSGtkcGhWUHRjVHJXM2d5bHg1Y0FLSXN6N1NEc1dtNXJNdnAxcnBhZWNV?=
 =?utf-8?B?MW5KZnFyYmYvcGVhTDNzT1o1Yms2ZExZakxFSDZvbjBMZThMbjlNN3psNkVP?=
 =?utf-8?B?eUJkbnhpY0ZxbkV6dTNWb0NKSW5IUTZlbFB1aWV1bDhubVgybU5mcGZUMG02?=
 =?utf-8?B?MHl2VnhSQTgxTUFHOU83QW5XS0dPSU5lSzYwWWFiOFlpbW9xRmxzMTM1bDdU?=
 =?utf-8?B?QjZPZ0R0S0FiT1pWOWJhZmtHNkNpbS9SZGJicjZDNjFGUHB3MjhGQThQQ3hE?=
 =?utf-8?B?RjhFZFp4dy9WK2dLQk5NVkJZUk05WmMwQTRSQ1p2UUcvWGxMcEVDTnVMcG93?=
 =?utf-8?B?d3hYNkY0UzZTQUlhWnh4aFd1MU81SHNHTC9ETXdEaDZ6OHBpWEpMREhmb3Zt?=
 =?utf-8?B?VnZHT0l5UUZ5SU85emxzVmorZGx5dXNGQWZMc0JxR0Z6RGVNUVV0MGZNWjdI?=
 =?utf-8?B?QWR0SUIwWU1MbWFHM0pmR1FqVHUyYVRDTHFaZWladk9LZmVKb0J5TGMxK001?=
 =?utf-8?B?a3I0THNaejVHQjdYK0NYb3lscHQ5SXBrdGJSeEx4SG4wdWNTSnNpK01aeENj?=
 =?utf-8?B?TFJ2Z1FRaWNqZnRBSGhtYW5hSWJSOUlRR2FNeXA2eEJlTWZrYUNXc2tUOTdK?=
 =?utf-8?B?aDh2V3I1dHJGTjBTOERRT1VHVHlVTENvdEsvaHB3WGkzRmovTXpwTUxTVTlQ?=
 =?utf-8?B?dDJYSzVyVFFNWmRjeVdtZTcyYWpzQ0FhRm5VVU16bndpWlBPMkpMd2wzVzFW?=
 =?utf-8?B?bjA5L01ncnUxUXplRWkxSnN5elRDbFduZmtsNUxCNnNvM3phaWh2QktWZDR3?=
 =?utf-8?B?MVhHeThNZEZyOEkvYTNQeURzY3hMSURJc2lPQ214VTFYQldkSVE5ZjZCK21u?=
 =?utf-8?Q?pQxSylGuCB4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RSsvdXBBOGU5Zy9scjBLV0hIZkJ2dWlGNnA2eGdxY2J3TmNUckh6S3IvdG5E?=
 =?utf-8?B?RncrZWFSQXB0OXpwQXZteW1CS2hJQkowTldiVHZIMGxNdEgzU3B1SnBkTDVy?=
 =?utf-8?B?cFFSUkZDSDdnOWwzZW91MWplWW1yS3VaRjdQSDUwMjVlZGVza0ZNcFkxYTBm?=
 =?utf-8?B?dE5WMm1XenlNSGRUemNIa1h4VlhoZmhKM2JhN21IYkl6V3hyVGIwaVlWQ2Iv?=
 =?utf-8?B?cWxITk53SzZGUWRobG5uK3dUTFQ5dUc0OFB6Z2JzNFRqT2E4bnBTWDMzTUdY?=
 =?utf-8?B?dDFTN05xcXJqT0pIWXI0OUtWTGt4Y3lnZkpjUVAycm5xTDhnNDRPbW5nc1Rz?=
 =?utf-8?B?NnpTRnRHbFQwZjJ0OGVwRmwxOXBhY2x4T29pUktyQVlIYmtsUWFqUGdHRHJC?=
 =?utf-8?B?cjZPcmE4SFZic2hialllNUszS2JUQTcxV1h2ZEJ5ZzhRVnUwZDhkdVJHS3Iv?=
 =?utf-8?B?QjhZRlAvMEhDdHFnUDlsOTdaY0U1YWJvbzFMVTZkRk5nWS8rcDZoUThTN0Q0?=
 =?utf-8?B?bzZIUmJ1S0c1b1ZWZzgremh6clhXWWxLZmdqUXdIOUk3V3NhTzFJMUkzVElp?=
 =?utf-8?B?MEk1dEZKRS95azhCckdYMlQyUDJ2QTNqMmNPRUZwMWlSWVBUekl2bTVrNWxD?=
 =?utf-8?B?NDAycFNBcWNONEovS2RxSzJYUXQrazl3cCthU29mVHpKZmZYTEQxUmNFYTBE?=
 =?utf-8?B?MVk5ZkxCZTNoZmNmR0ZKRTV1UGoyK1JoMExObUVVcU5mdUlteGpoZHBlb2RS?=
 =?utf-8?B?RzNFeTdDZE0reWhEZHEwdUZST3BnNWtIN1Uwb3pXUGNQVmRWMTYwNEtnMm8v?=
 =?utf-8?B?WjBkTExJejJkbHp1UVlDeTNEUUNLNy9SV0dSek0rMkxvTFJYRy9IS0QvTGhw?=
 =?utf-8?B?MWYzUE0yV3AxQ1ZkVU1XTm4rUnRqd25ETDJSWFF6NTlqV2IxSkV5RHNVa0ow?=
 =?utf-8?B?QUgwWWpUSXZPMi9hRUlXNzNFQW00TGhydXBvY0ZnUmRjWmtsSTdxM2xxNkh5?=
 =?utf-8?B?YVYxemVPSjRvdmk4TUs5MFRJQ0JYWVluQlUvcVA0c0czcmZkVHArS25ZeUc0?=
 =?utf-8?B?cTZuZTlDZTlwNGlpamIxMFBIZjlWY1J4YmFWb0FYcEk4d3ZyTWxYMmpIZGt3?=
 =?utf-8?B?QTdKdThXaWNqVWdmczAvTzg5cWtDc3NjL0hNdFFNSS9PaU1hOXRNTnBwZlVN?=
 =?utf-8?B?QjRubXgwS3dPd0c4SmlMOEh2NGM4blE1NFVib3B2OVBsaFplM3Urek1LQ0xH?=
 =?utf-8?B?UEh4U3ZuOUkzOTRXNVhHZ29oWENyZ1NWaXFob1JuMS9MblIvVXo1L2pxajBu?=
 =?utf-8?B?ZVBKSDJheXZGOTJNL3NIeGtMeEtNUVNKY0ZkSjB1UE1zeklTUWJ1RDFXTWtJ?=
 =?utf-8?B?ZmpRMmhuRDZxU0tVUnFnS3ZOY0VwWmJUbDhEem9YUVg0U1JIeWtPZEpVakxI?=
 =?utf-8?B?aDhieGJqeU5rSlFxTjZMNG9SMEs3clRJZ1FpR24rcjNmS2RIdytycmtUWWNJ?=
 =?utf-8?B?cWNxbXFtMDl0QWttb3FONGFjL1A5NndtVGN6T3FkNGF0ano0OVY0QzZVSFA1?=
 =?utf-8?B?T0VPZTl2eUVyNTRMVzdlMW5wNnZ2eENJRkJPVDBNWVUvWWZ6YkN2d0JpVXo4?=
 =?utf-8?B?cEFHVzFOL3NyME9tcGxLSzd4ZHQzWnNDV05IVXk1aTdUZm5NUlQ3dk15aHNJ?=
 =?utf-8?B?WGpjZE0rTEt5OTdkZkRzV0pFYVIralIzL2FCQVNMZzd4UndSWHA5c3hQUkto?=
 =?utf-8?B?eTA5eE5RNzFGT0tnZkpxK3h4eTVrNjQzM2k3WVNUMzhXT1BKOHRKSkVzVjRI?=
 =?utf-8?B?UVlTTjJOSWllR3ZLVUVnV01ZMXBabnZVUVBZOXhpU0o4Y1BkeHV5TmFNTFMy?=
 =?utf-8?B?dERwU3NBK3VVWE1BN2ptay8zb29mNWpxQzRnMENYWnEzdkVqOU9EaVY4eHFv?=
 =?utf-8?B?a0ExUGkyMDVScU1kcEZmM3FaTDdtVTdvRWo2MDNmZzk2bHhPTHNoUVhTbGlu?=
 =?utf-8?B?TkIzMFVkSktHUEpYTTlYNldTd3QxODNzbUF1OFVYM1ZFRHgwZzdMSkhFOGZt?=
 =?utf-8?B?YU5XVUxTYm1uVXpYS3QwOTd2REl4SVZjUXd1aUNSd0JLZ25hSEtFaXM3MmNW?=
 =?utf-8?B?Ym5wUE5kSlNkb285WUhmNTVPTThmRFp6b3VCSUUrbU1wMnB0eVI3bXFMOGZ5?=
 =?utf-8?Q?HDeT4LPsCsTdAT4eKwQfZipWW03b/E9EquBi3oYPxCih?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d162d60-590b-4707-be5e-08dd89761a4f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 12:37:30.5376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m5yIbVI3oS7uDq7Qb2aQ9jtcsecCWf6tQaN3T9j8zv/j4NwM5Gxig6N+yBpbXP1ylggnTg+NoTWcgjeknQuDiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5801


On 02/05/2025 12:29, Daniel Lezcano wrote:
> On 02/05/2025 13:06, Jon Hunter wrote:
>>
>>
>> On 02/05/2025 11:51, Daniel Lezcano wrote:
>>> On Fri, May 02, 2025 at 11:16:17AM +0100, Jon Hunter wrote:
>>>>
>>>>
>>>> On 02/05/2025 10:19, Daniel Lezcano wrote:
>>>>> On Fri, May 02, 2025 at 12:37:25PM +0800, Robert Lin wrote:
>>>>>> From: Pohsun Su <pohsuns@nvidia.com>
>>>>>>
>>>>>> This change adds support for WDIOC_GETTIMELEFT so userspace
>>>>>> programs can get the number of seconds before system reset by
>>>>>> the watchdog timer via ioctl.
>>>>>>
>>>>>> Signed-off-by: Pohsun Su <pohsuns@nvidia.com>
>>>>>> Signed-off-by: Robert Lin <robelin@nvidia.com>
>>>>>> ---
>>>>>>    drivers/clocksource/timer-tegra186.c | 64 +++++++++++++++++++++ 
>>>>>> + +++++-
>>>>>>    1 file changed, 63 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/ 
>>>>>> clocksource/timer-tegra186.c
>>>>>> index ea742889ee06..8d5698770cbd 100644
>>>>>> --- a/drivers/clocksource/timer-tegra186.c
>>>>>> +++ b/drivers/clocksource/timer-tegra186.c
>>>>>> @@ -1,8 +1,9 @@
>>>>>>    // SPDX-License-Identifier: GPL-2.0-only
>>>>>>    /*
>>>>>> - * Copyright (c) 2019-2020 NVIDIA Corporation. All rights reserved.
>>>>>> + * Copyright (c) 2019-2025 NVIDIA Corporation. All rights reserved.
>>>>>>     */
>>>>>> +#include <linux/bitfield.h>
>>>>>>    #include <linux/clocksource.h>
>>>>>>    #include <linux/module.h>
>>>>>>    #include <linux/interrupt.h>
>>>>>> @@ -30,6 +31,7 @@
>>>>>>    #define TMRSR 0x004
>>>>>>    #define  TMRSR_INTR_CLR BIT(30)
>>>>>> +#define  TMRSR_PCV GENMASK(28, 0)
>>>>>>    #define TMRCSSR 0x008
>>>>>>    #define  TMRCSSR_SRC_USEC (0 << 0)
>>>>>> @@ -46,6 +48,9 @@
>>>>>>    #define  WDTCR_TIMER_SOURCE_MASK 0xf
>>>>>>    #define  WDTCR_TIMER_SOURCE(x) ((x) & 0xf)
>>>>>> +#define WDTSR 0x004
>>>>>> +#define  WDTSR_CURRENT_EXPIRATION_COUNT GENMASK(14, 12)
>>>>>> +
>>>>>>    #define WDTCMDR 0x008
>>>>>>    #define  WDTCMDR_DISABLE_COUNTER BIT(1)
>>>>>>    #define  WDTCMDR_START_COUNTER BIT(0)
>>>>>> @@ -235,12 +240,69 @@ static int tegra186_wdt_set_timeout(struct 
>>>>>> watchdog_device *wdd,
>>>>>>        return 0;
>>>>>>    }
>>>>>> +static unsigned int tegra186_wdt_get_timeleft(struct 
>>>>>> watchdog_device *wdd)
>>>>>> +{
>>>>>> +    struct tegra186_wdt *wdt = to_tegra186_wdt(wdd);
>>>>>> +    u32 expiration, val;
>>>>>> +    u64 timeleft;
>>>>>> +
>>>>>> +    if (!watchdog_active(&wdt->base)) {
>>>>>> +        /* return zero if the watchdog timer is not activated. */
>>>>>> +        return 0;
>>>>>> +    }
>>>>>> +
>>>>>> +    /*
>>>>>> +     * Reset occurs on the fifth expiration of the
>>>>>> +     * watchdog timer and so when the watchdog timer is configured,
>>>>>> +     * the actual value programmed into the counter is 1/5 of the
>>>>>> +     * timeout value. Once the counter reaches 0, expiration count
>>>>>> +     * will be increased by 1 and the down counter restarts.
>>>>>> +     * Hence to get the time left before system reset we must
>>>>>> +     * combine 2 parts:
>>>>>> +     * 1. value of the current down counter
>>>>>> +     * 2. (number of counter expirations remaining) * (timeout/5)
>>>>>> +     */
>>>>>> +
>>>>>> +    /* Get the current number of counter expirations. Should be a
>>>>>> +     * value between 0 and 4
>>>>>> +     */
>>>>>> +    val = readl_relaxed(wdt->regs + WDTSR);
>>>>>> +    expiration = FIELD_GET(WDTSR_CURRENT_EXPIRATION_COUNT, val);
>>>>>> +    if (WARN_ON(expiration > 4))
>>>>>> +        return 0;
>>>>>
>>>>> Each call will generate a big warning in the message. May be simpler
>>>>> to add a pr_err() with an explicit message.
>>>>
>>>> I prefer the WARN. This should never happen. If we do change this, then
>>>> dev_WARN() might be more appropriate, but I think that this is fine 
>>>> too.
>>>
>>> The function tegra186_wdt_get_timeleft() is triggered from userspace
>>> via an ioctl or sysfs. The documentation process/coding-style.rst says:
>>>
>>> """
>>> Do not WARN lightly
>>> *******************
>>>
>>> WARN*() is intended for unexpected, this-should-never-happen situations.
>>> WARN*() macros are not to be used for anything that is expected to 
>>> happen
>>> during normal operation. These are not pre- or post-condition 
>>> asserts, for
>>> example. Again: WARN*() must not be used for a condition that is 
>>> expected
>>> to trigger easily, for example, by user space actions. pr_warn_once() 
>>> is a
>>> possible alternative, if you need to notify the user of a problem.
>>> """
>>>
>>> I understand it is important to check the return value in order to
>>> have a consistent result when computing the remaining time but that
>>> should not trigger a warning each time.
>>
>> Yes so WARN sounds appropriate. It should never happen. I don't see 
>> the issue.
> 
> The issue is if there is an userspace application reading the ioctl and 
> or the sysfs, then the warning will be emitted each time if the never- 
> happen condition exists. Preferably replace the WARN_ON by 
> pr_warn_once() as suggested if the bug must be reported.

Sounds a bit funny 'if the never-happen condition exists' :-)

However, I will be fine with WARN_ON_ONCE(). I think that this warrants 
more of a large WARN splat than pr_warn() because it should never happen.

Jon

-- 
nvpublic

