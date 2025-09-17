Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010038.outbound.protection.outlook.com [52.101.201.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8182F745E;
	Wed, 17 Sep 2025 03:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758079287; cv=fail; b=kuvk4srKjxtl094Q7MdqmcW8A2Neq+9u8zGWqOLhy7wChE+8JF/ftB5CSPV6HHw2GCL5SWHuLCYPyEyYNh9Z3d89FTiUgkAZFN36d9EPAs4fJZdG68QR5QFLKsRq0c9wqjWDoCIGQJG0Den6orkaktmPZyfMD93UdGtNBZ4O9jo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758079287; c=relaxed/simple;
	bh=no8WrpqKG1VtuzZscBViwy+Vxjc1TiBI4Bkh2q2CxBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ap9b+6/2bzpdF4AB3AhmVi/REtFbQ4ZlBft9EuBY4zzXKkxFZt48wDrntnPiojyfXmpIUDSaIJidFB6zYodQH0cnnFhz0d9ZcoX/+kYWjgd8UAdBMlD/FQLw8DP1eqyV8vfPEMl7O1xWE9cV28RSxKf51mVt2vqHASyleyH7n3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KaGFQHuC; arc=fail smtp.client-ip=52.101.201.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KaGFQHuC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TNKHGF+wYu+tw4RX+gfMkOrC2tpW5y6jGJooEzkR/mgtmWeYjk5abA0qVi9IJvaiXtnxUMsJ0KZV64/CfabdGncWqhFkg3F/TNutLy5Oeui7qMFknujmp/gnpbpl6Om8tTXx5bue04NrQbZ/uUoNea6mCdBZeIF/pVxqPXNQtT4kHj0srixvVyq8+fEtCNqVt4+84PhmtWpO8FXKNDZ2C4Ptnh71f9ESLO1ACRvRW0rpud3MDLbNWIbEZ9Uk1IvS0YxCXzV33OwVlivdIyii3yNW3oz8C2d/GaQQSa0jk+RyT4vZJYcNKFn8TH1jAOY9TyrOGH/eC76KIfI1fKJFmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FuxFU3Q3hJg0BpLNuHSFhDchS2xXFKs5+D+zVH/PXbc=;
 b=L0H/8rcTEADcpE0wj6SmOazRt/z2PAU5YMkHkswDr6xuGDekn8O0ni5VncA4b7+KYnn6CtIUq+eBsZy2RRMo7RQHKvX0CqJOm6Pc3RPdl0qGQe2ODdc0hotBcmEKsjNqmUK7n9iyfnsyGt+y4TEIf3dE4vDHN62UbY9vcGIqFsYUc5zg2Pxj/rM29ynYj1XLQuoK4oZdaHO7FlxgqW9pnmpIWEFhVGy35LYKqF9f7xf4xjpBURxx3SgwK7wkYaR8VSB3FPNgZzxUIeno3ZAfERB9DbSSSYspTSuhe5oUE7/abGZbPZIvAnbLYVmBjFizbCtq70b30kCbCcCWwj0jdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FuxFU3Q3hJg0BpLNuHSFhDchS2xXFKs5+D+zVH/PXbc=;
 b=KaGFQHuCK2DzUeNtWc+MCQAfjHxSk+BOJ5mLl+8BlDjpvH4QrUySbC+G6+RPMY1OHDWHAV151wfH+qXGaIMCP8rXURTNUnMDFdtDrcyhqzgzSxR6syDKAChJDnCpTp78DYYiUBXnp+ix39G1qyMi5pMA7VrFlVJVPHSyE3QnXNMZVNMpnSm2N10OUTP0LTxI70GWm1IiZrlV6kSs3xBK77Ilx2LAOUiNzI0+AlRRyQLu6t9YTwkZq7h6QoFr5siB8wMJyNRT53qnORyQTHi7BMRT9TRrunFMLXaLSLHTTzxAPvmEFCf0akrEyrqh1YwBDRQti0aS3eLO6HcVNCgOUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Wed, 17 Sep
 2025 03:21:22 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9115.018; Wed, 17 Sep 2025
 03:21:22 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject:
 Re: [PATCH] clocksource/drivers/timer-tegra186: don't print superfluous
 errors
Date: Wed, 17 Sep 2025 11:05:49 +0900
Message-ID: <12921334.O9o76ZdvQC@senjougahara>
In-Reply-To: <20250813190657.3628-2-wsa+renesas@sang-engineering.com>
References: <20250813190657.3628-2-wsa+renesas@sang-engineering.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP301CA0034.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::14) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|SJ2PR12MB7943:EE_
X-MS-Office365-Filtering-Correlation-Id: ff640c5e-beca-4399-0816-08ddf59946db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Wi9qb1owK3VtbGxUS1JlY1RCTE9yZ2tUM2Z6NGhkUk16UlBVSHNDaEwwVlY4?=
 =?utf-8?B?RFFrQnRyUVBrcUVKbW14TWZPU1RnZldSODFTUURoUEc4ck52WExFV0JJb1ZD?=
 =?utf-8?B?RlJLOG5GTlBxeGFFbUxtYW1PeCs1bFZkczkzd3FUMmkzcTZHRUVsL2J6TERW?=
 =?utf-8?B?amJFUDZacjhFYk5vT0ovZzE1aFN0UGpOSm80RVZMcUtDNlJWVW53cnY1ZEF2?=
 =?utf-8?B?ZnRIcHkzb0lpbnkwL1R1M3RUTll2b2hGTFZOcXhlQ3Z1SHd5Ym9wNWtSTGkr?=
 =?utf-8?B?YTdpWmFTTndPWDJoNjY1WDVuSVoyeHpxMDQwS2pIVmNuT0hRYXZxa2ZhMU1h?=
 =?utf-8?B?OGVFTmxBQWE5SGJsZGF4eCtOanJCYzFKYnBNY3R2SnloaENtWER3aVJ1aHdr?=
 =?utf-8?B?Ulo3TFAzQ2dEdGZoNEJGc1JVTWxKVDhNTFZyWXBzaVVQZTJRWlF1WWRTS0c0?=
 =?utf-8?B?Y0tNR1FkdEFIV01HaEN4T1p0a2cyRDhrLzl5K1JaNnNpTUh5RFQ1SU9FZEZ2?=
 =?utf-8?B?QmtHblNabDI1TVEzMk9EcmVPVEFZZVd0Z1VvaGc3TkUxZVVTYlRFOVZtSUVV?=
 =?utf-8?B?WGUwMkNQL29KdFZ4SDBxZE1VRWhkVDdqRTBFODZldnJyYUowTXc0bUZJQ1Zu?=
 =?utf-8?B?MlZNS3hXNkp4eVBBQmlVbHlLSGhIdmUvWXNsYS84U01wMnlRYW11Ly9EVjRm?=
 =?utf-8?B?Tjd0b3ZPUytIcUQwRVNHYlc1SElrT29vcThrQjlybU05bHc1TVAvR2I0MWhB?=
 =?utf-8?B?YTczSCtKSy9ZRktBREo5YjcwdW5tMW96OEQwZk1LZ0xnUnB5dUkyQzNqaG5Z?=
 =?utf-8?B?U3ZlYlp6TUc3cmhrSTQybzQwcWR2VTRneUhNMXhBYkk5anVXVlZ6UjNrUW1Y?=
 =?utf-8?B?bHkwK0tobzFKWWJTWklvU2NZeHBZNE9lNXZIcWhGeVp1VHB5eFdsWUdEc1Yw?=
 =?utf-8?B?Skg4Y2Q2TldjaEZ4a1NlN0FnejFSN1F1N1Q4SnVBc3BUTS9YTGV3bnpZWEVJ?=
 =?utf-8?B?UGdqbVRYSEQvbEtyZEdLa0hiR1ZEVk5GaG5zYW5jeVFqelF2WVgvcWN2YmRR?=
 =?utf-8?B?MTdvdGJlYy9pbFZMOHBxVFJmSTlxTTZPd0tYY2pwRWZIRTFqRWFkbyt1OVhX?=
 =?utf-8?B?c3QyL3FIZFdIVHptQXlHSU5YTTBKdGJlZlF2VjdzVFJVMVdWUWxuaXFuSnBw?=
 =?utf-8?B?ZVJvWUl1QVZrRGZDMUhPQnkwZHdrcllrTEtPZlZldjdwZEZncXRXbHZKV0RV?=
 =?utf-8?B?V05UeXV4RDg2bjlBaFkrZG1qcHJBaVdqNmpmaXZTcEN3elFTQmNwYk82WktU?=
 =?utf-8?B?Rys5TWMwMzBpNTEvemU0OXlRV1VvbC9DK0czVFBHdW1zM2wwalp4ZlQvMVh5?=
 =?utf-8?B?anBoS00rdGpvZkVldDdzenVONUFkWkhTbENpMUtjTEFzQUFDOWt5dWRnYTF5?=
 =?utf-8?B?eUFPRm13QTF6eG5kNjhhb1IzaVNtRzNacGxVeG9TUmdoZWJYbDNGVmRkcEZ1?=
 =?utf-8?B?VEJXUm1Id0N5QUt5Tm5vaWJMTk1tNlpMSlBUZ2g1TEF1dSs5ZmR0TDNlOUxj?=
 =?utf-8?B?M3BKNkhCNFQ4SGZsUUpHY3VRazZZYTF3ZnN4U1ozb3h0aTBjNVV6K1dQQS8w?=
 =?utf-8?B?NVphZWtFcDVEbGEwallkaUVaM0lwRWFSQ0pQTy9pV2dwY3o5UUJYT1BhbFcv?=
 =?utf-8?B?cEhiR3d4WGdKaDJmRTlrK2YwV05ab20yWXgzOWliekNRSXYrWmxETVpqQWhw?=
 =?utf-8?B?VFpzMnFpRGV1SWIyYnB0K1VDODVDRjJxSkd6SGg1YStJbXN5UDY1K2tCNndp?=
 =?utf-8?B?NEtHWWJqbWxFaldUYUNzTTZhUXU1K0dpZEd5NmdiSFRwNmVXVjhIYmwyN0R4?=
 =?utf-8?B?OG8xb2R4LzBxYWhBdzNYRDdPSitLeU1GaUdVeng3M2MwcnpvOXRqWSs5M0pr?=
 =?utf-8?Q?N6Bx65aXUg0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6494.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2tUbktoRTNvbHB6d0xsWUFKUXU1Vlo1ZGdXbjhIU2toZFh4S1c3Q2wyVTF4?=
 =?utf-8?B?K0V2VlNrd2RsYnN4QTNuMnh5eVYzVUdFaU5UQi96NW41VEt0NEJIcE5ESHE1?=
 =?utf-8?B?ZlpLVTNjOHdTVUJ5UGlzeU9jdUZJbmlEbnpuUFBuRDhNejdJK2E5ZHdoaVZi?=
 =?utf-8?B?OTcvWUhSV1kyRDFDL2FRQ2czd0piMlZuZi9zbUZSOUpWRWt5M1hDeHJNcHJq?=
 =?utf-8?B?cGJncUdZRmRoSW4rZXpYQkJHa09YajkrUDhrdDY4YWR4d1h2YTFFWHVKR3Uw?=
 =?utf-8?B?NGtQblpOcUw4TGJ3UE9xdlVqZ2taalQ4KzlWdTRvRS9hOW9PcWh2T3ZHdG9L?=
 =?utf-8?B?WFpEL29GVWFOenE0YnRQSU5YRW40VXloN0RlTGxZTjU2ODRhNzZlRXlsbS9y?=
 =?utf-8?B?Z2s0RVVrMFlwVWN2TVVmVnNIcjVLV3oxYUtUZlMzTHUyVEo4cDdwWXlHaGRh?=
 =?utf-8?B?T0JSTEoxcFNCbW50QS93Y040S3ZXc1RFRFVaVGVIY0lCTDRlNFdWK3lhaTdY?=
 =?utf-8?B?V1NDc0w2K0hWNEUxbm51eGp0K3JBV2NyL2d2Wm4xaHh5YlFLK0dxckdyVk9V?=
 =?utf-8?B?L3BpOUJ4MmowazFzMitraFM5Zno2dTVQUXlMUWxFT0FoV21RNDl0YjJIRzlR?=
 =?utf-8?B?TngzRW4zMjNWNFFYWVRMVDBaR3ExU0tTOFpJSWJkY2pvVC80OWg0ajhQdktn?=
 =?utf-8?B?Sjhsb1VWOFhWNnhUZnZUM3JnOUU2YWZRTk1CanpyMnZDWlR2WE9IZFI4VmxX?=
 =?utf-8?B?RkJZUk9xMjVHUCtpZGtPallwc3A1eE94SFJVVnk2VEw1akk1N3MvNGdYdXMx?=
 =?utf-8?B?UURkRC9YVTBpVmJQS2FuUUEzL3FBdzczYmhpSDg3cGtmSThmM25LaVk1cUhj?=
 =?utf-8?B?TW9WUVF1UU1YY0dVWGlNNWU3T21KVHlpOVpVK2lhSE5YVjlWNTBxaTR2UVJ1?=
 =?utf-8?B?OUdaN2txcTAza0luZ25GbnRFb0JuZHhyUjl0VEMwbDdEaHZCNTcySk8xaC82?=
 =?utf-8?B?QkRob0orNE5pZ3JkVUNDYkhSNGtIcGtTVCs3bkRYWlpET1lzOXRJTjV3S1FK?=
 =?utf-8?B?L2FBRy9Mb0dWdDBoZ3VSNVZZaVdZdHJ3TW93MTFqTGlVak8rZStWeHZ3T1dP?=
 =?utf-8?B?a24zYjdtWDI2OEhjTjRHS2JpN3V5aGV6VDc5WHJSN0huOEhXUWtCSGpWanpr?=
 =?utf-8?B?OXhlMlhOeFpuSVp4dmdBckptcENQbHJFOExwb1FpV2xXRWI2Yk1IY0ZxMDBx?=
 =?utf-8?B?ZkpRRmk0QVYrRmpRampwNXR0eUNiNUZ3TmlkQkhsMWdhTVdRSGgrU3ZUR3cr?=
 =?utf-8?B?aG1SQ0VOR0g2ZW1xeWwvWWRDUEZZZldrRk5ISkRsREZIM3RxbEx0SGlxQU9i?=
 =?utf-8?B?UzlDYTlGS2RlR1JITVFGc1VzYVgrWGdhZ2VzQVlYTEFJVDdFYnBvYTZ5SFFC?=
 =?utf-8?B?alJ1MXlmczNhWWRQeGF1QisyNTFBTUlWTEVsOTZnNllBNGhJTFZwTTBTZUFV?=
 =?utf-8?B?SkZHTFVyd01DNkh1WFd5VEV4eHZEVCtzU2tQOTlRTXBCNFgyVDN0WnBxSHdy?=
 =?utf-8?B?aXRzZjZHcmJqNGdyMTMzYWkzemNaM1NuK1FCZHI0TjJ4aU1Uemw5ekRMeXVa?=
 =?utf-8?B?VUJ1RGdoenUxalZEdmZjRzBYV003VDVPRVpPVDNUZmNZUS82NU5zS1JxUllO?=
 =?utf-8?B?VkZmMXV1aU5BYlUrcDIwcTFWK0JIWkcwQU5DK04vcGd0RHJ3T2t6Nmw1ZXpr?=
 =?utf-8?B?T1JTMVJubUJybjN5WThiS2grbXdRTmZsVnFLL3RiMWtjUTFVcGZ2Y0dVNHVL?=
 =?utf-8?B?T3hPS1F4VUoyT3hHUTlEWXBzMkJpVkJaUy9lMm9QQ2NJSUc2NStiSlUyTFBE?=
 =?utf-8?B?TlJkMWd6ZG9NdjZGVmRpY3B2eG9SUHRmWitpVkI4N2VlcW1hcEd1aEdQeElC?=
 =?utf-8?B?UENxOE85T0xCb0pIcTI1WStUamkwVXVGY2c5U0lqVm1ocGxFOHZYLzkwbUZJ?=
 =?utf-8?B?LzgrN1VYOXBDTDFJaUlFK2Y2RGd1UDdLcXJoV1lRVmJBT2JxNDluUmliR3cx?=
 =?utf-8?B?Ti9OK2FGbkU1UmpSaUhQTDk0NUNoU0RQSHBYTjNXNityVDE5WWozQjhaYXVh?=
 =?utf-8?B?T0g2WVdpM2cxQUorTDUzcFp2US9ydXFwVC82Tkl0aVN4TU1XNDBueko2cHVL?=
 =?utf-8?B?dUFDdEU2VUxQYWNUdkI5VzZlRUF1MFlnbmZQK3Zrdk5IYlhKRGNiM29PWGhV?=
 =?utf-8?B?YmIwN2pUbjhxbUMxakRySXpubE5nPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff640c5e-beca-4399-0816-08ddf59946db
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 03:21:22.5550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f5LY8yVPLhNMibjMurr6Kkjp2QAxFdYVntQFh1C1HXhiTSwH/TtfAloGS6N4E54LmOSNxNyZzLN5DJrk71KRmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7943

On Thursday, August 14, 2025 4:06=E2=80=AFAM Wolfram Sang wrote:
> The watchdog core will handle error messages already.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/clocksource/timer-tegra186.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/t=
imer-tegra186.c
> index e5394f98a02e..b40d7ed37936 100644
> --- a/drivers/clocksource/timer-tegra186.c
> +++ b/drivers/clocksource/timer-tegra186.c
> @@ -328,16 +328,12 @@ static struct tegra186_wdt *tegra186_wdt_create(str=
uct tegra186_timer *tegra,
>  	wdt->base.parent =3D tegra->dev;
> =20
>  	err =3D watchdog_init_timeout(&wdt->base, 5, tegra->dev);
> -	if (err < 0) {
> -		dev_err(tegra->dev, "failed to initialize timeout: %d\n", err);
> +	if (err < 0)
>  		return ERR_PTR(err);
> -	}
> =20
>  	err =3D devm_watchdog_register_device(tegra->dev, &wdt->base);
> -	if (err < 0) {
> -		dev_err(tegra->dev, "failed to register WDT: %d\n", err);
> +	if (err < 0)
>  		return ERR_PTR(err);
> -	}
> =20
>  	return wdt;
>  }
>=20

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>



