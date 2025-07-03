Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2085.outbound.protection.outlook.com [40.107.244.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80D4288CAA;
	Thu,  3 Jul 2025 10:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751538986; cv=fail; b=fzje5iRjhfUEM+RGN3DP0TA5Pd9dlzzQUSpfAOCBC/E+LmwMvhDLh06l+EssasaQxa9xk4GpeIqyBZFsf133qscnB19EcWNlk9skmPCOSm/2K/Q0ec1TShM43MLKnDC0Q1eo7iXH3sM+n9VZuF+uWqshv30kkUt6+zmAR+Vx3m8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751538986; c=relaxed/simple;
	bh=g2MictAat9fGhWhnKxp9diATnVJpXM9aHVUH7XuvVGA=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DJpsskTOMvrVCXkDxhaeD6YNyGLxm90tApfAyy6sjJy+N1qPoTB7J9bzKjSIE+TL56WWUyD0bxyJ11ybYf//kYpXlnMv01zSM/uE/66n+Frk/w7y92bsNxmIQUboRyCQHasEwwlMQShNAOlbpnyivEpZdybZjmePelQabuSmuEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TBQXeEeC; arc=fail smtp.client-ip=40.107.244.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TBQXeEeC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJPfUhjsBzQkm12VaJ2VCUexCqbv4+EGnKxDrfJO4rk0ZWhm7ZvZ3kjNrdVjWc48lw8/VO7TusL26SzHqoBPpw9vLrcqR85HSPn+Ptoa48liukAaGKTkMrZwCXkWJIGDhhBbKyHoAWHOXLCjGwzx84hhhL1158M2NBIrIXcSECna65ciIqkiuISJH0PCW2kTsL4AHOHMQrqvHrjLkY3BmXa4BFwVc0jPdKchl5UmV9OaFz5vENjFRpxIYQe65rZEy/OBoEO1wJiQXsQE0CADhTetTPJ1M3ptFqwIqCzzKcI/6vgY4lM+mCfWhl0ESjkKO1lRkHbfzcyBywczgNCPLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4D69Vu7/J9a4H9S3kbP+qTUfQZ6JV1sYrg5rg4ui6o4=;
 b=o8J3sa2zHk0B/WJVosPVtKlRuF5PYIXHF+COcIo6/mTNXBAtosk++7Q5cWruCrA0uV8OHXZWFagIzs+9OYYvCJqJvxz/kxz08uHRpFydzy95EXHRfdS4+h4oHhFVZTDhC1CJHHlpaPAuGR3k0n5ZYvKHCknsCx4k4R/qce7gk4nr9bDIhfM50tGY+HCmCbQwOT4bzrJ+LE+rmMiNmrN0F8fM+coSdhJ854OnQW0674uk+uE34KcX8x+uv0OhcIYNHlI3TkIu4gFk+OC3GgEdY+YEsjTWVKfwFfEQelJxMTIqtQvfsWwzfDgIVfxzQAlG4A8/jJvwAe9Ft9OmGt2xRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4D69Vu7/J9a4H9S3kbP+qTUfQZ6JV1sYrg5rg4ui6o4=;
 b=TBQXeEeCjAf5oBLNTFNqm2+9cEeVY2EdKv44OFcyCrrkQbOlihfseHgbej0uSXOsLKVRgZJua189Nlz00sdcolE9ZFAAc9ZW4NOeN/7qk/z24OHFF/zBhbaEAB9IWKSkM8lh7PjY9ED3pB7HpJUVhYU1NHW2J3xw/GmflLT87spnlXMIoEsdm43qcvgL9FvczS+GVVyN6FuUWvsXz1sD7GyJPTmx2qJM9EWQlTPRHb+EVOzddYeBySNbr+Kz+7jdWXQ4jlSxcqd41YerOf5BD2Gok3I8p4O70dsNqJnmCdfV4jWRvfCpJKp+pDRjk9cDgjxt2wp+eYm8WhF9QAG6Jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by BL1PR12MB5945.namprd12.prod.outlook.com (2603:10b6:208:398::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 10:36:20 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 10:36:20 +0000
Message-ID: <458d9b45-2879-4dd5-b164-82d87fdb5ad8@nvidia.com>
Date: Thu, 3 Jul 2025 11:36:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource: timer-tegra186: Enable WDT at probe
To: Kartik Rajput <kkartik@nvidia.com>, daniel.lezcano@linaro.org,
 tglx@linutronix.de, thierry.reding@gmail.com, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20250630110135.201930-1-kkartik@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20250630110135.201930-1-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0168.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::11) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|BL1PR12MB5945:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c7b45db-5176-432c-80f6-08ddba1d732d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WUdzOTI1aURzck5nUGVlT2VwcXgwOTRsWWpGOFRaTms3Uy80ZG9xblR4ZXpF?=
 =?utf-8?B?enBUMHQ4dEpzZ0lOR0xuZWFVTWpQY2FKSlJiUjVzMlNTTjJCRGgvcEhTcU5I?=
 =?utf-8?B?QVYvNk56c2gvRWlBMHdkdURZV2JQK1dxRnpmRWZFYnFLWUQ1NDR1WU9Kdlds?=
 =?utf-8?B?TTR2UkNtaDA1WEM1VEtsdG5qaGNSTDZPRmZQbGkrcG5iSVhkK0NHUy9QUThN?=
 =?utf-8?B?NHBBZWFMWldtaU1tSVB0bVV5RWR3eW93VVBpREIwKzNZVEovd2padVJuczNT?=
 =?utf-8?B?ZUNxS3N1cFNaeTRZd1JjbjQ3akxKZGVsWDV0V1U2anZ0SnJVSTFHY09waVVn?=
 =?utf-8?B?WEhaanBBeTZGcGdGWWtJcHhVdGlGU3pzbVV6K0xYVG1EMUJPYkJVVXFMaXFx?=
 =?utf-8?B?TGE4VUp1b3RuQ1VxOUlmOE5UUE5XNEdsSDZETWRCOHdUSVI5VHRqbmIxSXNN?=
 =?utf-8?B?dG9EVXpjc1p2YitDdy9qMC9maEZxTmhFSjNHY2FkOTgydVoyVHZjMHRMQkw4?=
 =?utf-8?B?T3daWXVIZmNlQkVIdS9MNjE2R1VFZTU3eDNaQitLUVIrQmxtYkxodkhxWEV5?=
 =?utf-8?B?VXpGcm1mWmFtY2w4bStBVFl5K2xpcXNHbEtRM1UwTUR5YmdETEpsdXoyUDdn?=
 =?utf-8?B?T1VSUVhNQlhYaXBoTW45VVFjTHh6ZndIbDRkNko0NngycTBKelc0OUxrM2JI?=
 =?utf-8?B?dVhlNHBQWnBPUUF2eWFSa3RLdzNJdUZNMW9Jenh3dElrTzRjMTZIMG5TeTdx?=
 =?utf-8?B?SDNraEEzT3ozUEZDOHYyei9nTjhPUnhhaHdqUjNmSFRtOU5lbHhMMDNvSG5t?=
 =?utf-8?B?VGYydzhQYXh3eHppeUxmZVRCSXkwUGIyMGQ2eXh2UVh6R2JoMXExNlJ4QUM1?=
 =?utf-8?B?Q2Fkb2dwTnJMVityb1E1bENzWG9QdUZTUHNXKzE5cFpLSXQxZ0RJS0M1cjBZ?=
 =?utf-8?B?TWZkbzNna2dxY3ZkQWttWU8rcG80SVQzZ3dJTldKK1hleXFNaEdoZmttOUh5?=
 =?utf-8?B?STlWRkFRbU1PNXlITERuUEJSRHFYNHAwakNTaVE0eXFIUUlOWksvWWd1Skw0?=
 =?utf-8?B?aUI0REM0NWthWjVQeEhKMWorSGVHVllDWW5pLzdaUEVOZVZuVU8zODh4L3NE?=
 =?utf-8?B?b291bTlZTDlWWTFVT081UUxSNmF0R0dtcDdCMnZJaGV3K3BJdFdWTjZkeWxr?=
 =?utf-8?B?MVl2Ky9RRkZ3RTc0djBvRjIxRElWblNzOUtTZ3VqeVc2R0tOK01RVFAzcHY4?=
 =?utf-8?B?aTUxTjhXb0RvWHFlMHFReXRzclN4dTYwNEVkU01MeFFNZVQwekg2cU9CMlhG?=
 =?utf-8?B?M0dIeFBsK0V5RG1HVWVjenhBZXMrdnFoK3V6czJSaGU3aVpsM2dWeEFkcm5F?=
 =?utf-8?B?QW9oWktKMTNZTkxCdjRqTVFqU2NlRmVCektJTjlORW9tRW8wb3A5OFdNUC9V?=
 =?utf-8?B?Z0UvV2tubU5sVkh1dHo0UzZhcUNCRkZFZGdjdno0dDJKZ25mSkRMTThSaXg4?=
 =?utf-8?B?SnBYWVJQVVYvRjdqM0V0NmRqbmVjdUlUVGZNcTBueU5TTmMyZSthRkY0YXR2?=
 =?utf-8?B?QnFLTU1JR3ZDekxYQ2hodTMxT05tYWlZbGVCeDNkL0JCQWtmMThQenQ3OVpn?=
 =?utf-8?B?ZTNETldJaVpwdXFsU1dWL0hJZTcvWEwwYXRYVStSaDlUL2swbVZtblB3ZHkv?=
 =?utf-8?B?STV3S3ZIQm5nelVxSFZodSswVGJHRDNkbGRwcHc3MkVKQVJObks0R216aVVj?=
 =?utf-8?B?S1lnbGwzc0NpTk5saVhSa1NyRWt4RXpZK2UvSktSU0srdVBGRW4ralpQaExW?=
 =?utf-8?B?TWxDSWM1SjhjSFlXamhBenhlUWpRaVI3YndYTndRUEt5ZG01cTZPdC9iR3pW?=
 =?utf-8?B?UC82U1FPc3h2Q0h2MTNKTHlINjhNN1QvYzVzdmY5ODBMSXJiWkFiMVNHSjVt?=
 =?utf-8?Q?XS+p9vhJgLw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVNRd3c4cERpV1pESDVLSFF0R012djlEdEQ0ZDc0NzJmWEpiUmx3b2ZIckNM?=
 =?utf-8?B?T1lPdDVxYWRZam5qQ3I3eEFGdDhHSCs3bUdTdUthM3NaMkxKYjBOcUsySzNW?=
 =?utf-8?B?bzNyYmpyYks5ZlBHdWZOam5ZRzdydVJyNlo5emNZeWpSZnRrQjcvWTlCekty?=
 =?utf-8?B?Q1BmR3hzclFIVHJkYVFTcUNEK0NacmhhR1hJRkNIWVd5YnRpcW9sbkV0NkRy?=
 =?utf-8?B?bGdVQXBPdWVIODlMZGtuakJVN0lkUko2ejAyeXpMTEltYVRJeGZzZXZCUVFH?=
 =?utf-8?B?MUVPRkczNFY5cFhvSkJLK3BDWUVabS9BSmVtT2I0QWFBU0hxTWVsTWJSYmxj?=
 =?utf-8?B?ckc3L256U2xtQi9HUVZEOUt1dVg4Z05HZ2Z6QmEya0xUNjU1blR3ZjRORDVh?=
 =?utf-8?B?MEdxMHFaZ2l3a2MrdkxYMC95ckxYRzJ1UTVMUmRRS2FzVmVxNzhRY3F0WWc5?=
 =?utf-8?B?bENNWVVzMm9hS04rWGpOKzZoUk4wL21GOVlaSEZpL0p6VXNVWGJiWG52N2RS?=
 =?utf-8?B?V01ZMHhlakZDK25xUlBQV0tTRUNBNFRrMkhOSmxMUTJ0T2FlaFc0UURucEJ2?=
 =?utf-8?B?U29XclIrZG4zZEVxbWpxOWZhWXQ5RWNPcmc1WGpIbWkvaWhmNy9PSWFNUm93?=
 =?utf-8?B?aGlDdVNOU21UUFlzeHVGbE9YcDBKZm93bHlWQk1uckdlSFlaQzRzdU4ycDEy?=
 =?utf-8?B?dXBVa2NOSlg4NHhCOXAwVWhZNGlTOFpIcldiN0FITEhnc3J4Z3Z2eWcxcis5?=
 =?utf-8?B?RDlqM0lKdWhTblJMdEJlanJtK1F5RTBKS0JWemlITGlJUkMvOFR1ZmJwaUFa?=
 =?utf-8?B?VkZwSzVZQ3Jlck5iVTVDWWdLTGR6K2R3UEdoUTZFeEEvVzMwWERlZEZ0a0tI?=
 =?utf-8?B?cWlzSW14U0tMczBZSktyS1p6N05mMTZFR2x5ZFFib0RBWkw2Q0dyUDlGZU55?=
 =?utf-8?B?MDliMWFDQlRkWUM2aWVxamdmQVBaVTV5Z3VWODVpckJNV0w0UjlnZHowUUpK?=
 =?utf-8?B?ZGhGMG9JTFN0aU9qaXp1b3A5Ukt4K1JvNkNPNmlaR283QmNhYnBvOG9qVGhp?=
 =?utf-8?B?VDA1RWpVdEhqZHdEd2hNRTVIUHJRSExuN3hkdWpzNTlCTWxQeWl1czVXUDVW?=
 =?utf-8?B?bVROUkZFRWVYNHhaQnd6TkhyMFFrbk1IMUdYblQxZEZiMU40ckw0ZXVudUov?=
 =?utf-8?B?cWVRVzNPZVFTK01kekJCOGtZS3k0TGNQaUZybXRMa2VUMi9IQ2hFRzdTdWM5?=
 =?utf-8?B?THZsNWhOeU5wc2VHNzBFOTh4WHRFS2RHa3VqVzduTDV2QUFqZFNLNW1hdmc0?=
 =?utf-8?B?V3NIMlVaYy9vaVIwOWI3R2lpWUJidkNad0wzd2RSNmVOVmRKN3hBUWxqVnR0?=
 =?utf-8?B?czdRZFluVXdvc2pkdFUwdmQ1TS9ad1Vkc2JDTEh2aWh1RWltbDB5WlZXTUc3?=
 =?utf-8?B?OG1WTTlHNklGWFRrZm1lNExsMFJmWnVWVU53ZmVMQzRlelpzcFJFQWtwQkc5?=
 =?utf-8?B?b2hiTGE1SmZ2SDQvMldZMHJyTE85ZjQyU2RQNjBVTVB5cTE5SkxHUVVmTTda?=
 =?utf-8?B?TUdDRXBXbGZFYmhyUVdwdnArNGFhdmdtYTZEWXNrVWVXT3pzRFhBR1J4Y2Ew?=
 =?utf-8?B?MTdQd1BEYVU5N3Q5ajA0Tk9iR01qc3dLenliTTByTkxUVE5udXZPRUdYYmR4?=
 =?utf-8?B?cnlLMjVxUG9PTTM2ZmZ3Y0xpQkRLTTdXWEJEMW11c1BlaXR1S25tQ0FQeFVp?=
 =?utf-8?B?bkl6RkZQTzBXQmFkeE01bXlCMkZLMVBaK2pkRnA4ZUh0bVI3TFhZUEczcVlK?=
 =?utf-8?B?NGJ5KzVodVNMaFR4SmVqRzY1QWNSZklwcGJLbkJPYUdrL04xMU96UnpDYUt6?=
 =?utf-8?B?YlF6RThzQi9QTVBNQW9yeHRFeVlObDMwREtRbnFaWkE2K2N3Q0l3d1RYa1pJ?=
 =?utf-8?B?ckovK2hoQ2FNSDBOdmhFY3lpdWVGaUVaY0Y3bFBXRkJkZy9UZzNqS1RveTA3?=
 =?utf-8?B?NjRsL0RFY0FvWm91OGpZZzNaK05zcFR3dkM1ZjZCeXNVdm1aWG5VQmVOMlBG?=
 =?utf-8?B?SkNKRWdIN1FHcE82eitaTXp0b2o1bXZ5Q21QaytJc2ttUXlsSUkzUk1xMlla?=
 =?utf-8?Q?DNSTRuk9i1o83FBd1WXLXrxny?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c7b45db-5176-432c-80f6-08ddba1d732d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 10:36:20.6476
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UlvX2x6rr+Oe63FECB9G9p6lmRe/Je6Ddgqo9X5kqVIv7qj247rj/zIdbBM1XPUd2de1/pMkjAaXjKxmrPq/JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5945



On 30/06/2025 12:01, Kartik Rajput wrote:
> Currently, if the system crashes or hangs during kernel boot before
> userspace initializes and configures the watchdog timer, then the
> watchdog won’t be able to recover the system as it’s not running. This
> becomes crucial during an over-the-air update, where if the newly
> updated kernel crashes on boot, the watchdog is needed to reset the
> device and boot into an alternative system partition. If the watchdog
> is disabled in such scenarios, it can lead to the system getting
> bricked.
> 
> Enable the WDT during driver probe to allow recovery from any crash/hang
> seen during early kernel boot. Also, disable interrupts once userspace
> starts pinging the watchdog.
> 
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
>   drivers/clocksource/timer-tegra186.c | 42 ++++++++++++++++++++++++++++
>   1 file changed, 42 insertions(+)
> 
> diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
> index e5394f98a02e..59abb5dab8f1 100644
> --- a/drivers/clocksource/timer-tegra186.c
> +++ b/drivers/clocksource/timer-tegra186.c
> @@ -57,6 +57,8 @@
>   #define WDTUR 0x00c
>   #define  WDTUR_UNLOCK_PATTERN 0x0000c45a
>   
> +#define WDT_DEFAULT_TIMEOUT 120
> +
>   struct tegra186_timer_soc {
>   	unsigned int num_timers;
>   	unsigned int num_wdts;
> @@ -74,6 +76,7 @@ struct tegra186_wdt {
>   
>   	void __iomem *regs;
>   	unsigned int index;
> +	bool enable_irq;
>   	bool locked;
>   
>   	struct tegra186_tmr *tmr;
> @@ -174,6 +177,12 @@ static void tegra186_wdt_enable(struct tegra186_wdt *wdt)
>   		value &= ~WDTCR_PERIOD_MASK;
>   		value |= WDTCR_PERIOD(1);
>   
> +		/* configure local interrupt for WDT petting */

It might be a bit clearer if this comment states ...

'If enable_irq is set then enable the watchdog IRQ for kernel petting, 
otherwise userspace is responsible for petting the watchdog.'

> +		if (wdt->enable_irq)
> +			value |= WDTCR_LOCAL_INT_ENABLE;
> +		else
> +			value &= ~WDTCR_LOCAL_INT_ENABLE;
> +
>   		/* enable system POR reset */
>   		value |= WDTCR_SYSTEM_POR_RESET_ENABLE;
>   
> @@ -205,6 +214,10 @@ static int tegra186_wdt_ping(struct watchdog_device *wdd)
>   {
>   	struct tegra186_wdt *wdt = to_tegra186_wdt(wdd);
>   
> +	/* Disable WDT interrupt once userspace takes over. */

Technically userspace is taking over at this point and so we should be 
more assertive here ...

'Disable the watchdog IRQ now userspace is taking over'

> +	if (wdt->enable_irq)
> +		wdt->enable_irq = false;
> +
>   	tegra186_wdt_disable(wdt);
>   	tegra186_wdt_enable(wdt);
>   
> @@ -315,6 +328,8 @@ static struct tegra186_wdt *tegra186_wdt_create(struct tegra186_timer *tegra,
>   	if (value & WDTCR_LOCAL_INT_ENABLE)
>   		wdt->locked = true;
>   
> +	wdt->enable_irq = true;
> +
>   	source = value & WDTCR_TIMER_SOURCE_MASK;
>   
>   	wdt->tmr = tegra186_tmr_create(tegra, source);
> @@ -339,6 +354,13 @@ static struct tegra186_wdt *tegra186_wdt_create(struct tegra186_timer *tegra,
>   		return ERR_PTR(err);
>   	}
>   
> +	/*
> +	 * Start the watchdog to recover the system if it crashes before
> +	 * userspace initialize the WDT.
> +	 */
> +	tegra186_wdt_set_timeout(&wdt->base, WDT_DEFAULT_TIMEOUT);
> +	tegra186_wdt_start(&wdt->base);
> +
>   	return wdt;
>   }
>   
> @@ -415,10 +437,21 @@ static int tegra186_timer_usec_init(struct tegra186_timer *tegra)
>   	return clocksource_register_hz(&tegra->usec, USEC_PER_SEC);
>   }
>   
> +static irqreturn_t tegra186_timer_irq(int irq, void *data)
> +{
> +	struct tegra186_timer *tegra = data;
> +
> +	tegra186_wdt_disable(tegra->wdt);
> +	tegra186_wdt_enable(tegra->wdt);
> +
> +	return IRQ_HANDLED;
> +}
> +
>   static int tegra186_timer_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct tegra186_timer *tegra;
> +	unsigned int irq;
>   	int err;
>   
>   	tegra = devm_kzalloc(dev, sizeof(*tegra), GFP_KERNEL);
> @@ -437,6 +470,15 @@ static int tegra186_timer_probe(struct platform_device *pdev)
>   	if (err < 0)
>   		return err;
>   
> +	irq = err;
> +
> +	err = devm_request_irq(dev, irq, tegra186_timer_irq, 0,
> +			       "tegra186-timer", tegra);
> +	if (err < 0) {
> +		dev_err(dev, "failed to request IRQ#%u: %d\n", irq, err);
> +		return err;
> +	}
> +
>   	/* create a watchdog using a preconfigured timer */
>   	tegra->wdt = tegra186_wdt_create(tegra, 0);
>   	if (IS_ERR(tegra->wdt)) {

-- 
nvpublic

