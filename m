Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2052.outbound.protection.outlook.com [40.107.92.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40303085BD;
	Thu, 19 Jun 2025 07:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750317445; cv=fail; b=JdP60V+BDShe5EekSU44sw7Ys9GA9cFcfnmcLUPiU8SPMj1qbkKOmAnApLVSGWPq6/hEySDTWSfSHBausaa+G9EfLTRZz3eOeGQ9ZWH4aiQ+JZCYC+uz97hb7OEt5zwQRTezOD4HUSt/dEeeW+MPjMo95yKtmWLVhVYxddgXx/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750317445; c=relaxed/simple;
	bh=3oh3UqHaaT3GYs6des3UUW0FO1OQVzeESJZ6OhaZQ4g=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EgKg4ZtJK6bzKzZ2UQ5P/lh0FzWOeacbxJ8oHDLeDCU1X6aLc4UVk+5vkwb4a9YEbtSsGaareJkCudYI+fqBMUqmazUCsA+Sy/i51X1WPUpJEQsUwRGR3LCKVuY24YsfTlgZkjCB3t1bJ3nDGlRTPzmXD8NN/nF9OETnXFACQLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TvAIbaoQ; arc=fail smtp.client-ip=40.107.92.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TvAIbaoQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xX2EDjeg+g8x+0MndOqBiOx+zc/uH2yAi/hqbZ8aEYjvdXugf1SNMl6cvQPil1m2hytF99zHftznjyZBewYkkzklzBWSgSRQKyZB73qqaW1Qw7/WUXoWtxZpsMjn2pTCqPGyLQhnF91xGZ6rVMGxphCesBadT5ETkvrmUgDQA86igmQY0deF/CQmMxz4ohLgd/JIiQZZw3BADY58xN0AYdt5dNeUwuDPy7LL3Y3FFtubrP1C14D0fpCmoPze8D2UyaugwbKWQse+kI2wgj943899ACG+1kMkIpYcDx5zhT7hAHXopF7IAOhJXVIEYgKshOjsKqgk0mOTgXW311uuAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1mzduCp5iGm5BzLUD3Y5QbCp0H++fqS3U1edZd7q/KA=;
 b=GEBVAQBqoFS8fMOOVp8Q4513dRxXl7XWxFP3LRSnbvegzN6uJ0OCDF3+UhAPPxKAu6qjLikGB1QX08zKnIkDduetuWqQHJ8WEfLel8DEuX0JGFhAFeaYww+5INMfDmoLZCFLrETLIGxpGEwgokP5C3elcztpU08MumcBGAOXdC2ykrFR/gKf0VFUE74Cr/sZewC5t2+SVBb8WQ3f/LwBayASfXVRF3YAk9xHcybUKkEWKBXF/NEfHOh+9jxohBoyJ3QDQ90LFx9m2YKVFtacYKOKyALIfo+Dwd7Guc5k0Kx2wJYGzYOS99HBqs03kZKcFUGZFJcYP6p7CXApWPRcHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1mzduCp5iGm5BzLUD3Y5QbCp0H++fqS3U1edZd7q/KA=;
 b=TvAIbaoQU5SCKDPp4tg2gE3EuIodgl0GVtPXycOMtrY38iev+r6w50wEmdPHvbVVeqpU3EUZJzUYfBLR4iF0WFQj4t4jmcqpeNjiz+zCwMIEz+na6A22lEtGDmgKlDN2ofphMC1L6L/npp7WRVTGDB+UvmHaMTvKgc6j6LAbZWMgmoFZ7XjM9p6FEHH7lizQLB1zQvG6UdSs/D0r2cH6cepfIgTKMsFg3ZCuIO1PJSILj3XEuITSZO+7Ee8K08Qed3lJeno70hq+Co+xkGyhwJi8CCoyF+6ljkFcTOur/u1bftpsMIzyDHhgDSzq9tXGY0vKy4QFpNoGuriXG+DTcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SJ0PR12MB8115.namprd12.prod.outlook.com (2603:10b6:a03:4e3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Thu, 19 Jun
 2025 07:17:18 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.8835.027; Thu, 19 Jun 2025
 07:17:18 +0000
Message-ID: <75496de8-51fd-4e27-9f92-babaa0e22c14@nvidia.com>
Date: Thu, 19 Jun 2025 08:17:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clocksource/drivers/timer-tegra186: Avoid 64-bit
 divide operation
To: Guenter Roeck <linux@roeck-us.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, Pohsun Su <pohsuns@nvidia.com>,
 Robert Lin <robelin@nvidia.com>
References: <20250614175556.922159-1-linux@roeck-us.net>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20250614175556.922159-1-linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0543.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::15) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SJ0PR12MB8115:EE_
X-MS-Office365-Filtering-Correlation-Id: 4171907e-094e-480c-0bdd-08ddaf01534f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NDFpbXk2TVI2TEdxWVlJWENibGl4UjRGMFhrTkVla01DbE4rMVNXcFM2dndC?=
 =?utf-8?B?amhlVEwxMmRPTHRMUDRsVDVveTZQMFRvQ210cHNGdEZXa0Y1VXJweHpCcXVJ?=
 =?utf-8?B?T25PTUtpc2Z4R2tJL2ViNGFIRXpsQXQ3Z1F5d2dpZ0NUUTVZVDA4UnRNWHZ6?=
 =?utf-8?B?Z0R4cjRPQ3NLT3hEWlNQdjN4L0YzQXljYzRTdTZnUnQyZzc5V253NXBpMTBG?=
 =?utf-8?B?U3AzcE90UkR5MWJlNXd2RUNoWllsWFBvb1pSOUlCbVFOcnB6QUdacEZkMmx2?=
 =?utf-8?B?WTUvSXhqd09wV3dLMk5vOGduMXJ1QW44dkxZeURVblV4b2prZjQ1R1ByYWFt?=
 =?utf-8?B?YkF5KzdyT0tidkY4UGZJUjNJQk9JcXdqdENvYWFKUi9QZmtsZ3pTSWlzOTVO?=
 =?utf-8?B?SDVQMEEzOUkreTRObDhrQko2WC8ra2traUhVMkhtRE5ETTlwME1kYW1hQUVK?=
 =?utf-8?B?L3hWRHBNN3pHSnhDOG1pdVBKQkdmNjJqNk1ZbitSWVdWYnBXQWlmd0dubXN4?=
 =?utf-8?B?emhqY1h4bWJrMCtWTmJIcmwwb3dkMkVVWnRld0Z0bmU1N2dyRTRYK1ZaTHl4?=
 =?utf-8?B?SXNjOXJlamNwUktKK3pydUxFd1ByMDBDY0xuRFA4cWdkZGVwRmZMREZreXhQ?=
 =?utf-8?B?L2EwWmZ1VWRrL3FhOXdsaEFSK0VEVzI3UU9NQm1pZkZtN0hwR0xEUCtXU2gy?=
 =?utf-8?B?c2VFbTVaVGg5Rnh0SktFRjVnYUROMEVFdmYrNW4zRVVIZ1h0L3NrWEF1UUNB?=
 =?utf-8?B?S0VKa0xsVFl2aTFLL0QxaXNiL0Q3cXhqcVhkOHZubFR5OUh2eHNacjl3VDNE?=
 =?utf-8?B?Y0ZobDdrUzN6VWFYanN6QUtDLzF3OFRKaExpZUprV0FMcXJmWXI0REU4aXQv?=
 =?utf-8?B?K1I2dlJBTnowSkIzM3d0M2RwcWdqSEZ6NTI4dnRCc1NvNldiRXc4QmFiVGVE?=
 =?utf-8?B?YzhpeFI3N1lmYS9WNkxjdUVJSnoyWmdWNEZSUkxYWGNFM3lycTlSeXZWS1p6?=
 =?utf-8?B?TStaRVVUeGdiRmNkbjh3R0tIVGVqWDZWZDBZaEVkcElpbVdJUnNNNW9zN3VM?=
 =?utf-8?B?bEhzdStDaFhPNHpXNE41azd2WHFabHhMdlkwYUphVXlrbUlFRmNvL1lZR1hs?=
 =?utf-8?B?bUtnRWduVGZ6VzdyVjIzTlk1WTNyY0xKc2RpdFBmai9LMGRuazdGeEFjMWNw?=
 =?utf-8?B?QjRuNzJTQXlHZThYbm4zeHVvWUczbmdUeDlocXZ3WmhUeno0VFduelpQbUFR?=
 =?utf-8?B?VVZYaUJtbm1nWHlwdU93RVBkWEV3Q2F5MEhVaFFSektsdHlhdFZNRmNiMlVn?=
 =?utf-8?B?WTZKZnZRSHh3dlVWL21ZR2svdU9leHkxZVk4VGlScldrSlhaR1JSeXJOM09X?=
 =?utf-8?B?Uit5d3hXZU84OHp2VWFhdkgxRE5YMkViRE8yZkJxQlpyMmtMVTYzOXVMZEZD?=
 =?utf-8?B?VEdwODE4TndaVVlydGhqY0F5RDFBT25xVnFIZjFaSjFFVVpXRFNiMSs0ek9K?=
 =?utf-8?B?dVVaVXBudnFSNTNTUHZLQUtOdUZnQUowNE1DQ0RlVklUcmFZZHM1c1Y1K1BI?=
 =?utf-8?B?MTJZTTFkRlUwOThNYldQbmMxSjNZNVpaelJicTlrRE01SHQwd2pkZUZQV3cw?=
 =?utf-8?B?dzJSTWZ0RjMyVlRSWnNYeFZFSlNHOThCUVZ6aUxKM3BXazhXcG5tWVdLVUVs?=
 =?utf-8?B?SE0rMlUrZGZ6ODRnOTQ4VW84ZWRuTVVNVHd3bC9TdGVzZnFtdFJyR2F5SlBx?=
 =?utf-8?B?TXY3T2tqVG9LY1RvTVhpblc0dklVV09aOG1GYlFYR1RpcFJweDhFZW5lRnNt?=
 =?utf-8?B?V2VQdTdjRnhxa0VlMGVPMk1HRVRleDZBNXRFVERHTlZiSzVXam5OdUdrZlU0?=
 =?utf-8?B?RlN3S3FSODVwd1FQYWtaUDV6eVVTMi9POW4zKzZqcTF4M0ZQVUNORSswZG92?=
 =?utf-8?Q?pDl3WjqxTsE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?LzN5UTZDTWZydFNiNmk5QVBLYjBWNFNVT2lUWUpPRW9TdlhvdEdEZE1MKzFt?=
 =?utf-8?B?Q3IxZHUyKzhMcHp6b1dFcTZkaFVnakNPeDc5bXIxMndRbmZURk41WjZnWUZr?=
 =?utf-8?B?R0FQMFAyOFRjbWJZbGN0K0Q5TmdQWnZFQnJIbk1sS2U5bi9tYjFjOU8xNDJ3?=
 =?utf-8?B?VkRjU3dmRzROZ3hTRXF2V1RCVzVHMWduTTNXT29vYnZYNElkQzBaNmVOZDNv?=
 =?utf-8?B?WEdsQ25VTldXcndibjZDM3FEV0FFM0lZOExsQ1Y3OHk3Q3JYVW16VVJkMTdz?=
 =?utf-8?B?MUpuWDh6aDZ6azBzbXlLU0MwMmZZbUxFeFQxWnUwQ2hlSmV4Y0VEMmJxdXVj?=
 =?utf-8?B?cWppT1lLYnIvaTM1TGVlNkZZQmg2dXc1Q0UxVDM0NDNRZ3pPdCthMy84UXhG?=
 =?utf-8?B?cGtKRWVBRkx6QW1JR0lFdi9Kb3A5YVlSTVVlb01sU1dVZVN5WGFUSzAzYlhr?=
 =?utf-8?B?V2lmb0laY0NNY2UveE1NalliM3dWTkx5MGhWMWs0TVFLSjhWSlFnM0EvZUhm?=
 =?utf-8?B?b2xNMWJnc0liRU1IVG5ZRUJJM2M5Q0xpUmNKTCtEMExKMnJ4bFNDR1hTc21G?=
 =?utf-8?B?NWZQemlmbWdwQXNLRHhlOEl2Z0h0dzJBcERzRmpadFZ5dzhmdG1xTmlIQnhW?=
 =?utf-8?B?aTRGVTlmVWY0RWozazFpMENuNVloMVl4bUV4NElNMmtXbmN6SWpTREdJdTI0?=
 =?utf-8?B?V3JJbFZROFJNR0lqYVFsUHNXWk51Y3VCK3Bja05LSytpeGp6SHZDMkdkWjlW?=
 =?utf-8?B?cGJJZTlaNzE1cXJYaUdPeUVKL2pnd1htRk5jK25zbzlzWUE2UjVNd1ZIRDhi?=
 =?utf-8?B?aTBZNHJjdlpTVVlIbTl2djdkMDRsYmc2ZzU0enk4OG9ERGRZWlRYUGtrbFMr?=
 =?utf-8?B?MGN6RFFpNE9SYVJNalVUN0xJRDRybGQrR04xRDRLV2JqcHVUVVR2VVRBOXli?=
 =?utf-8?B?MWVYQjRoWkhQWDBUVHRvcDB3Y044cjh0YlVpVkxLMlgvaXlPemp5c0FRV0J6?=
 =?utf-8?B?eTZxNnE5aWkyR1FjODdYNEJ2a1NJc3pIb0xLaG9sQlBsQjNMRVhMeHV6aDJP?=
 =?utf-8?B?NmZzZGVWYkZ3alBRdFk5QUpRZ2JHQ042LzdHeXhmdmRLdkxaOHovNE9wRlBv?=
 =?utf-8?B?RVJiQjlhY09KdU5INFBKZGM4NlNSUGhtdm94UlVLSWU2ZGJzWHd5WVovc0dh?=
 =?utf-8?B?bVJadlUzTDhBUlNpNmVHVWlvaENsOVAzRjVweldhSjIyNWY2Yml4dE43eDdj?=
 =?utf-8?B?b0RqVU0wZ2RJS05pYnJxWGQ3d3pNa2xyMzlJZ1JKZG5MRXhGbGpISjhZMFpu?=
 =?utf-8?B?RXlTaFJnM3Z2WTdnYzBEYkQwOG0vaTZPWnBYVzVIZVUyTS81MFNRekxhWm1m?=
 =?utf-8?B?QmJieTBQSTlXSnFINHQvOHIxSTVnR0xqSitGVmNtQjJQeDZ5RHhTT09QeEl3?=
 =?utf-8?B?d1lpN2N3SjFzb1czcGpOakx3L1BZRjlvMHBpOThZSGVmMW1sWlNpTzVVbm5V?=
 =?utf-8?B?Y0dwOW5EL3F4aDR5K3BZbis2cmdvYlkwbE5sSWtuSUVPcmg3a05LMzVhWGh6?=
 =?utf-8?B?a0NsNDIzaWcvR1B1K3ZidjZ3czJZbUFaQWdJOG1qSU8xVjluNFhhL2NaYWpX?=
 =?utf-8?B?YjRTT0ZrZDFhZVlqTzNBNlhZTUUyOXpXTjBvS3lmZFRUeU05Zm0rMHBzMVVW?=
 =?utf-8?B?ZUw0d1hPb0ZnRzczY29HR211QjBENTJVYnB4WVF6dVFaQ1ZiNy80RnducEVP?=
 =?utf-8?B?b01LNDhxM1U0TXQ1aGx4R2FFQVJLcXc0WDF1bjRpemR0RytWcnRkakRGL2k2?=
 =?utf-8?B?OUIraG9qbitJVzR4TFErVE53aHVaeXN2ZThsSFd2WFBZYnN1SlRsL0VWZjYx?=
 =?utf-8?B?RDdKdzIvVGpqeEhqRzBUR2h3VnRzSzlWNWQ2NkN2OG94aWkxM2VSN0dQWW1L?=
 =?utf-8?B?WUh1R1cvbjBqWUZlYXowOEpYL3ZwVDdrd05ndTV0Rkd3djh5eFYvUys1NzQx?=
 =?utf-8?B?UHdBZmxUeWRVbEU5Z2U5bllISXNhMndTWFFPZkFSYkNCYi9TREhhWWI3Y0pC?=
 =?utf-8?B?ckFvVnFmaTEzbVBpL2NWek9ROERGcmtGZTR2enc4WkxZekJQZTdqcWxiQVM5?=
 =?utf-8?Q?coPqBvUhNVHHqV+kHcerqhRI+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4171907e-094e-480c-0bdd-08ddaf01534f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 07:17:18.6627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: orzUlEbskbIkgnfKX5V1OKN5xeZy/qnojarwDyf7y9U2CZFYQXl2jkj4RvwLZq6UUxDROsPKpggNq1mejRPM4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8115


On 14/06/2025 18:55, Guenter Roeck wrote:
> Building the driver on xtensa fails with
> 
> tensa-linux-ld: drivers/clocksource/timer-tegra186.o:
> 	in function `tegra186_timer_remove':
> timer-tegra186.c:(.text+0x350):
> 	undefined reference to `__udivdi3'
> 
> Avoid the problem by rearranging the offending code to avoid the 64-bit
> divide operation.
> 
> Fixes: 28c842c8b0f5 ("clocksource/drivers/timer-tegra186: Add WDIOC_GETTIMELEFT support")
> Cc: Pohsun Su <pohsuns@nvidia.com>
> Cc: Robert Lin <robelin@nvidia.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>   drivers/clocksource/timer-tegra186.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
> index e5394f98a02e..7b506de65438 100644
> --- a/drivers/clocksource/timer-tegra186.c
> +++ b/drivers/clocksource/timer-tegra186.c
> @@ -267,7 +267,7 @@ static unsigned int tegra186_wdt_get_timeleft(struct watchdog_device *wdd)
>   	 * counter value to the time of the counter expirations that
>   	 * remain.
>   	 */
> -	timeleft += (((u64)wdt->base.timeout * USEC_PER_SEC) / 5) * (4 - expiration);
> +	timeleft += ((u64)wdt->base.timeout * (USEC_PER_SEC / 5)) * (4 - expiration);
>   
>   	/*
>   	 * Convert the current counter value to seconds,


Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic

