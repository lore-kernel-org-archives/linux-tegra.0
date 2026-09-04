Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012016.outbound.protection.outlook.com [52.101.53.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DAE408035;
	Fri,  4 Sep 2026 08:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788512024; cv=fail; b=EG3bpY/3OmatG/dxAb7FmW0n39IhcawjyYJaPf1eLG9U/AiFMSNl2a4QigMut1jPf5H0CG0z2qpIK4sHNlj1wEMrCtVwgVK1+/C5bvmxPOsYPpJ8roRrcSX8fwJe0XfkOZrcVpqHk0SKNnoJhF1WGW98wNgSo7PRmjmIfQu4YNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788512024; c=relaxed/simple;
	bh=/YcU8WAJkQz+Pk/O5vUYCtCtYLHOwSYDzH3o7IhzRKI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mw0aWO/lowGjIKtGEoslT/Rc/ZEWhNx6XzgYB0/c3pUKJEffsPLtIdC2Y1HXnF1d/SZ45oTeezCf7TVL6pZ+0AYQwFNrJBma2B3Jr/+jXr8ZfeH42kqKsi1FqrBZMSPxI++h/VQMqWgCPgHKWHW3MY/wcKtG/BKo4+XaC+U3tJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=W1PLFNZj; arc=fail smtp.client-ip=52.101.53.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="W1PLFNZj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oDDCuyZnfjz1t9tLYa3IE4GiKCFpydTNakbO6wNzSC8xwKYTs4AJy6DaXo0zqjuPSnqvYuSTcenFt5RNhn2+A7HEbJECby+VIVAoVJ07l9iIYSy8C+N587DSoe5W7ksCGbkEWqdMLLTsYP4cMXaxyzX/485z0so4Tu7YmUcGh36INH4ArGX5oDJ2pjtV7ySM3M/1fk87bs29L8VMGSbZLxF2H38amOqKpFm4eFmgu9skBCf0SdkTEZqU2rXFuTBTlUdMtQ/MWFU6mtNxUdOpMVWJgbdbaxauH1WuFFSK9ZO8vL7DwN3V+M/FLwZEW/uMerGMVOep5PxATedkBHW/Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCNEQPuAtcfGAiEE/GbdkrO06yW3LpvnyamPRm61EVo=;
 b=oxyO/LxA5lR06wR5q3tP1lHPHwv2VvyyRDBqYtfKpAU3CdPPD3SGKl8SF2KhUdvLY7RTWLrLQWJrwD/F8f52Wp2zCKeSUugHH+zvqQlgDdgDPdhh/EegSTVPu0WdMMMD+xrhDenWsJx7rRVgZUk2uoX+7FGuRDSoFY1xsgrp7fL8ouUmm5OFL6Akcto70+ekGQn1p0AsBsETSCDF66hkcXr2Fa8Am5ZPw4wL+Usu7TT/0tDbh+KqZ+RYdUW5G/YE0zR2tjHIXNjBbQyOl0FWLYxvCSS54MaKE131e3Rq2xcH4TBA7k4l8PJkGfgb2zTcNyvv6x/Lx+Jngaom2zkp0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CCNEQPuAtcfGAiEE/GbdkrO06yW3LpvnyamPRm61EVo=;
 b=W1PLFNZjwhv5imd/NRkHw3nN+12GqItxJAKT9G+HCxSOqhp+5CPrUO5BlgIeAQBI/PUNVTat6OIEigKr6LsPWFLNLMLW9vjUnOa1qduQ3GR+gyqD/jZ0iNCnn/Iac51kQiBkkC9FMx9QtQumXJvTbTjjdf12u+bSTSx5cKBZaysrgxSoow2s9YUiSuZ+/21YzOD/GreFJfw24HzeG0koeBckD2qr45gId4YXQexCqGFiHojIQBFxSVAgZv0KXWJX1oOGeB23sMUzK/7+WJBGoheyIcu/uKHQCFYcDGKhA3bks8UZKP8xUmbSo2MsKFtDmFA9cDIVdrYgQlaeZnqsfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18)
 by MW3PR12MB4459.namprd12.prod.outlook.com (2603:10b6:303:56::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 4 Sep
 2026 08:53:39 +0000
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9]) by SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9%6]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 08:53:39 +0000
Message-ID: <578c07f6-3473-463c-b204-72335aa63264@nvidia.com>
Date: Fri, 4 Sep 2026 09:53:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/21] ASoC: tegra: use .auto_selectable_formats
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@kernel.org>
Cc: linux-sound@vger.kernel.org,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <87zexzyw5v.wl-kuninori.morimoto.gx@renesas.com>
 <87bjafyw3s.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <87bjafyw3s.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4PR09CA0003.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::6) To SJ1PR12MB6051.namprd12.prod.outlook.com
 (2603:10b6:a03:48a::18)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6051:EE_|MW3PR12MB4459:EE_
X-MS-Office365-Filtering-Correlation-Id: 23a17cee-55f9-4278-5f87-08df0a62035b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|10070799003|366016|23010399003|4143699003|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	NkE3KCrXyVNH4E43VOJgb+/UNDSUjpxquMRynHRQWaFmXDyvzTv1d9MEVNCIPz+SQcjyw3ojzWTTkFuWi7H1Hl7Wkk2jplOvF96XoZKE/Z8sRJVQmPpl1FYfJBZFdO1i+BIUDZpWfzmNj3MGVOKD35HdzyoOcEkQobC5YMgmtiEp1+Noynqt+TJrj8Az406Cs29Lvg1+S80TQBKxmcmblVVnlMslWN7bXBBr1cWWLUucSDTdsfJn5L/owUMCGfqsUj09z4/ORuRbu6s5d95hlKwtxjSgTjp6jfrneJyWLECY2NLX/K/RNsDUEhH8FuffCt9kMwdrzw5yO3eZPJ63iaTpxle8ZWMVEHOaaKDEzkAxNTczZN1Uk3jJoqglWR/rFZh317BvCCjJCI7NQFsVTpwlvUbWQjWw2LjmqZcS3RlselBD+wBhiouXcArQRRc17UeZfAMSh2uWkqku+vbYPzxNrsOZXhGeIo7tGU99Znldsk7yfs8UDhEp4wvqUM/shBBnGYrbDhHIjbjh156PUId7azumujNax5HtgIxLpRP0DqgZZsH0R+cI2iH7bCb+M92YjQxSoor4WTKd0/l2VIOfkjBsALmMqCR5oWJ8qJNlAIiMGHVjHH323vtE9FnemPXp1fwSvruQTwYInxd9WKmHLGdhmPcuFK92wjmxsX4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6051.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(23010399003)(4143699003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0Vrck9aczZ5UlQwTDFqanFUYlF3dEZhVjlZVWd1Q2N6bXgwWFpKRWpKY1Uz?=
 =?utf-8?B?M0ZJdHhJMWdsYzFkMGtwUytnaFdRN2xSVVh3b1dXYnUzTk1CTGhHanBmR0F1?=
 =?utf-8?B?a0w0bDFCQjMzNGVuYmVYZFRaUGlxMnMvVVhsUGxuM3RGRXV1TE5YR3RJcmt0?=
 =?utf-8?B?bFFTMWxZWnMvclBvbTNNS3FHWmh2Qmc1Q0gxejBlZFBvam5HdldnZ1BVUVpN?=
 =?utf-8?B?bVpXbGV1ZUZuR0ZWUEsvNEFBSHVydkk2bExUQ2tjSlNGZzRvNGtmbkV3MC9Z?=
 =?utf-8?B?SGRVOEdYNUtFa3RDbVlqclBrTzVGMllibTZyclJsOUI3SlBlRGFUMnFkTzA4?=
 =?utf-8?B?N0RNRDEwTU9NQWQ3aVROcWc2WUVodTZabC9CZ05ORHhGZ0FhcUVNUW9HU0gr?=
 =?utf-8?B?T25BeGxQTkVENy9pK1Y5eUgzM1FXWG5PY0VTVGlsQXRvbDRldVlvSGRIalNK?=
 =?utf-8?B?MkM1aEJaZXplV05veWl6YXBJdS9FWktFRG0xWVljQzBwdkNjQllhdnJ1MFFB?=
 =?utf-8?B?Mm5DZ1d3aUhYSldwM0dGWjhqckVUUUh5NEF6ZG1JQURBYmNkSkhzUGZjNDNz?=
 =?utf-8?B?Q2FZaFBVbmRoSFdnaWFWNzc5bEVSNS80UnpQZnZZYUNzT1VlM0FFMlpJL2lS?=
 =?utf-8?B?Sy8wdW10RVlaQmlaa3lrejFvbzdramhJUHRqNSt4N3dXWkNkSHFGTnk1Wm5p?=
 =?utf-8?B?elg4eFErS1hxNHI4U3hZWWVXRk5aQzF1eVgwNmduRVd5cHZWenBnN0lHVHdq?=
 =?utf-8?B?NzE3YWtaMVpTRU05QWxPaFV5akRjUDhOSTFuYVIvSjlMR2FKdVI3SkxvTFZk?=
 =?utf-8?B?M001cHV6a3NxY2VYSDJRUFI0L3NoVjl5NmFYazZ6eCs5S0NNYlpUL1dUYWxR?=
 =?utf-8?B?cHMzWjBWems0T1pUdy9ncU8xTjg4L2tNWEZOdFlyVUJ5SlcyejVlZjNVdkZ4?=
 =?utf-8?B?cTU4aGR6RkMwRVZUVGNJdFpGcHVpSWdBL05zRmxTRVphbWlPR3dOM1Jicytz?=
 =?utf-8?B?cVFCZTlYSGQxbk5rY2ZETXpnR3dMdnZ0ZTBlb2tTTDJwcWJjVU9GQlpwNS9V?=
 =?utf-8?B?ZmJTR2NrdTJPazA3bEJVMFVHNGlMZlM1S00yVEt2VCtmRVd1djVIWVFwNTdQ?=
 =?utf-8?B?NThhM0E3SjFST3RwTEQ5TGR0UjhDdzJuRGRxa0kvYjZMaTVkV2xZVnNQZkRw?=
 =?utf-8?B?L0dRYTBNZFJRdzBwdklQMlA5YWZUVmFyOHFxUlZBM2R0VmZiQW5jRkR1MFYz?=
 =?utf-8?B?SGxhWXBjWDhtbklvOHNMcWtWcXlVNENNajRicFdKTFo2cTZJOTZ2QjNBak5L?=
 =?utf-8?B?S3hkUm9HVGRhMmhTem1rdGozU2RnS0FZT2RKWjFrMUpIRmRaOURBT0NxRFNH?=
 =?utf-8?B?ZnF3SFExY2NqdHNLZnBXZVRhRFZGRXJ5SFBsbFRVZmI2RUFwenFoTXF0QkVN?=
 =?utf-8?B?M2ZhRnBDL2NDa0FkWWNZdS9LL3FmL3p2b2ExM1pVejhIWXZVRDJCUXduTHFX?=
 =?utf-8?B?SUVaTklWQXp0dnY4emRoaXFPVkZNeUxKc0NrQWd0ZE5zZGV3Z1NwN1RtTUcz?=
 =?utf-8?B?Vm1GTmpCZlUzVHFWcnhjYllXbmdTdzRubkNnU1IrNWd5dmZVeUI1QkhCMXNh?=
 =?utf-8?B?Uml2K0xQN1lOZGwvT3V1amxBZ2JVT3JDZ1ZNb0pKbUhyY29meWtQL0V5dWg5?=
 =?utf-8?B?aFFzUWdjbmlaU3VreHJyZ2hSU2tMY3NYekdrd2lzeVhLQ0FkUThCY2pCOEht?=
 =?utf-8?B?SXVlZHN2a285YzVmbkltQVlEbXlQZTM2UlBJVlEyWFZCRTc1RGFBd1BFSGc5?=
 =?utf-8?B?anU3cExJcTB4cEQ5SmdrTVZ1MGd4VTFSSUxMWjQ0QnF3Y2VFOW9kWDdNWUZv?=
 =?utf-8?B?ak5vSzloalA4OHRZWWxsVzB5dHJyenc5dkFOYTdYVm1FUzJWUjNCbVRuMHBj?=
 =?utf-8?B?Rk11L2ZOYTRJWU5DRjZNZGhEQ3cvMlBuSkNWT3RHbis4bzhYY0VLK2dvV2FD?=
 =?utf-8?B?eGlkTnNsN3UrVVFmVWt6NkloWWJCbWRaUzdjc1ZPRytQQUZVSDIwZ3NETTFX?=
 =?utf-8?B?VW95alVac2Y3T1d3dWk1MUZha2IyRlpzUHlkVzh0TUNsWjZzMHo1d2x6QWhi?=
 =?utf-8?B?TUt6WkdRUTFrdFV2OE14b1RSYjFvSWxXVkVrOS93SUhkc2J2MlE4bEFRREo1?=
 =?utf-8?B?RnhPOEZTbmhzaUdHaGF0S0VuRkh0QSs1a1NSam5ack1QSGFwUmFvQ1JRbjQ3?=
 =?utf-8?B?VGJWMVNrWjNMcnRXNW51Y1VuVU9CUklZZG9zZDk1N1ZoZ29VNEVUS2pFd3Bq?=
 =?utf-8?B?WnR1WmVGd2hDdzVsTmRmREFlSWw1cEZpUGllSWwxcGkvQ096UXc2NmRQTkNj?=
 =?utf-8?Q?rcS3hzzlsX1sfeOkIeQQyTG9b0hu9uT1b0kSr6KAcp/Zg?=
X-MS-Exchange-AntiSpam-MessageData-1: eW7mYGeuEKlNow==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23a17cee-55f9-4278-5f87-08df0a62035b
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6051.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 08:53:39.2265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UQeIrebB0KtWcQRJkVCeCffPNEsv2FVv0Cqu5N1OaIycSVeL+51WljuB6RKlZgY6EPsQC2hIsM+D8p6DO+Fquw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4459


On 03/09/2026 02:14, Kuninori Morimoto wrote:
> We can use .auto_selectable_formats. Let's adds it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>


Tested-by: Jon Hunter <jonathanh@nvidia.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>

Thanks
Jon

-- 
nvpublic

