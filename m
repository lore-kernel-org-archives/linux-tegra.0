Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42D521D3F8;
	Thu,  3 Jul 2025 12:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751546055; cv=fail; b=izFhbCDKiHJx0itgA0qPrCjWsGVMaK3afWlfvBaVbVMAx+/xRRj+SCOPwJ9cpnhtK9NmG7RX6hhF9s/LGlRbLeGALs8KaNQ+0s/8iNW7oKNx7jsQSaJdfAM2N8tueSYjdIFEqIb/FZooGqyzblRfNlM94m+S5Fd21q4xM+ET+2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751546055; c=relaxed/simple;
	bh=z5VZabfUpJjCGxRdrLcv1uMI6bncKeHlj3qe4SSfCoY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Xyux6f4CkMUKSuyHTqB9G4Q8XIrYFD6Yx/MYi3VDZwEv+Ge62qzMiQYcRtKpzk7WN+pWxnkFwS7IrLHiTczcYIqp1KTIaEnVbApkyARlq7qG8aZxiNC7+lREcbknvj0gIQtaNQZu7yAOyNA7iIwpYUhHMBGvFvlYrtJEH1G+kRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nlA2u6Z+; arc=fail smtp.client-ip=40.107.237.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nlA2u6Z+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=teeC/RCKXKSiF9Z5v72eGmCaOowCom/qTvN2FjeU7TkYl2QG2qVeWlFYdE4OjgMDLPmmVREeroMyovhcKKtpQKzuDLNA0H7mUkZfB1pOyvFPa8LL/xyg0Ee2Chww46wxVpdc+09AP8Q0lvqJHUnxpTQH9RQuD1hsn9l1iozGzkFdAdBiQxWS9gcWjsVSI5jDfiOpEKfs1x52wjISrhexb7ILEZwgGXyo/u+tydaGF/lRqwFqZ8oPx8ZDs98G3678+3sbAgLXQECGG8Tz91h/kYQJ6XUxZXhdleHLjlCgPWIeGtOZg0XgMTH3Cxc64jhzhNvtSCp1Tx+JdM6fZx2Pbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1l5iLJkwXGaGQUBi8zN7AqpZXAbsUP0rGOE4Iwsubj0=;
 b=wcuYupbJnvUuod1gmzx5v923zxXQoyHXBSnSlEYeEL2IEcfDOIcEIAEofaGcEo4LCynegBW3YQtgf7r/DU8vujtHs911ekyWRWOGNBmP0M/9Dbp7PhDIfDNt1ig0GaZyT16olaGifGjdcC2oEIeo3vQNLfv+XH24AgGvMpZN26uykVQjN0KaQAgzIjY2KV2NSHoEIYU+ODmY3uCDc/LG4dHM+yJuSB6iq6IBr4lMipzBjxJoKkpxdqiIk4d761WvjuA0bcnBqQ4munq+/4+ISFRK37+0aHLjuDBRRU0y7ssXyDFpVRyiBLl4OSQ2wrxSCQDJRMlysOgFl9eTQS1Ipw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1l5iLJkwXGaGQUBi8zN7AqpZXAbsUP0rGOE4Iwsubj0=;
 b=nlA2u6Z+HIJqhINR1sLKaTKHCnPaMinLvRdQCLIETv5hvnYdIZtM+dYqvFbO6F1uVqLVcHK8RbHjSXTPkxqXbkWaLkbRiaO6ELjUGZWPxh5fC3CEA5Ct1kCfv0Lz08Da7+oz4aUz8H3Y4yuu2rC4zeDyaBbmi1afZDG0IzCEvQGqnYV7sbvEkK8UlTZbm5X3TgAsUtRBTw6/37yBahCicNJMuOwpG0hdlAfz7UQc3rv4to4VO2moU3eBBOyI5+yRoY4qzbRDMASijsWgdswO1OVcAZ15wTHBVRHx0FijIY8W90IhLurg2Z+ZNqgg+rwmJiSd17ibmhIpSkSMTmNx5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by SA1PR12MB6677.namprd12.prod.outlook.com (2603:10b6:806:250::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Thu, 3 Jul
 2025 12:34:10 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 12:34:10 +0000
Message-ID: <b77c900b-3b54-4cb6-8057-e5b7ca0fdfa8@nvidia.com>
Date: Thu, 3 Jul 2025 13:34:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clocksource/drivers/timer-tegra186: Avoid 64-bit
 divide operation
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, Pohsun Su <pohsuns@nvidia.com>,
 Robert Lin <robelin@nvidia.com>, Arnd Bergmann <arnd@arndb.de>
References: <20250614175556.922159-1-linux@roeck-us.net>
 <aFq29Fr5c2TAZOYO@mai.linaro.org>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <aFq29Fr5c2TAZOYO@mai.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::15) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|SA1PR12MB6677:EE_
X-MS-Office365-Filtering-Correlation-Id: 3265884a-447d-4d72-42d2-08ddba2de90c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QjNwYTZYRCtzY2JRd3d5WTgvV0duTjA4ZzU3clY5Y0tIYmJCRExlbWthNTFu?=
 =?utf-8?B?ZGtMU2RrM1FKT0Z6TWN4NVlTL0E2Smd3SXM4bjFzV2pmZmZjK1dLZUluRTEy?=
 =?utf-8?B?SVQ1V215WjVuTUdCRndYaDA5QkVtNG1mY3MwQXVGNkd5UmVWcDdOaHRTMHFj?=
 =?utf-8?B?VmVTTkhBZjIzcDR5OXlCSGhpc09KM1pUL1R6bGZnM0pLSDEyWVVjRmVBRmhq?=
 =?utf-8?B?b3d2dVN0YW45VHNiS0V0V2VJRnFMTm5rLzNYTVJYSHgwdkxLNnBaQkdZSVQ4?=
 =?utf-8?B?RmM2SzBwNmlFU3N0VXhmcXgxSmJZcktNajBVM25mUWRBY3lacVVja1Z5bzZT?=
 =?utf-8?B?MHFBdENSTWVIb3JVTkcwcjJwb0VqNFNiNkxSZ1NxcWwrMEVTQ3JYbWFkY1Z6?=
 =?utf-8?B?cWdkaEFZMFh0bkwvMCtlZmtrdHdyRmVCWEpVaXBuZC9mbXkzck52Zld1b1ZZ?=
 =?utf-8?B?aEVNcGJPcGRNTkw3OU5CbVZvSVR3aEZJVThXZVllWkY0TTZ3dVVUTXVXWURZ?=
 =?utf-8?B?azVBRlduWHNaa1Jid2tPa1M5YThicTBwTUl4TmY2UkVJSmNWWEVwWCt4Y1Ba?=
 =?utf-8?B?bUxJVFNlMVBRU0dZaFRVVVBXOG5QQ1U5VFUwUlBGWFVGV3VVQTFTUWVldnho?=
 =?utf-8?B?TlRyLzBkTGlHVjJGbExLb2txb0JrcHF3YTlramdFUDN6aFBJdXJncjhHblE0?=
 =?utf-8?B?bDB3SlZRVEpDZ2t1QTNqVENWaFJXZmFmOWpqMk03RjRvUUk2NVdaVGNFdS9R?=
 =?utf-8?B?aHFOOHU1Mm1rY2EyOWgrdnd1eUlTRlFTYWhVQUdlWi8ya2cwVzRBd0EyRXFM?=
 =?utf-8?B?T3dxdnY0OXFXWmRBM2c3MFVoVzhLUTJyYU5DU0kvTVdNVTd5VHp1MHluaUFF?=
 =?utf-8?B?NEJvMWNoMDc5TXJjVEtwZ2psZWZaRDF2K2hHN3dwQktDOXJQaTh5VjJkbVNG?=
 =?utf-8?B?akliRTc4SWhud2g5Y2lBTW5PT2N4WGt2TzVYTXJkWlJ6VG5abHJ3RGw4Tzd6?=
 =?utf-8?B?L1FDYzZFN01tV3lDME1GeUpTTlNydXFLQ0dXTkN5VThoNzF3TnlSMzRWaFpQ?=
 =?utf-8?B?SjdWWW1tV2xHS1h3VVBkL2xXV0hLNHhKcWFtQU9SQXIyM1FiekFmb1lmcHBL?=
 =?utf-8?B?VXpnTkc0YU8xZTRNeDRaV0hNcGZHYVFvQ3F1UllZMWYveDVDOU94WEhENE8y?=
 =?utf-8?B?ODRnMTRBUlhGYWl0WlFCNmxzLzZ1UUh5NjJxWCtMV1pSalZuRGlCU0JQUEFo?=
 =?utf-8?B?UUc2MVJGUDVnaDlWTDNWaXZPa3pFQ3hsWTJuZTBRT2xuMmlQT0l4cit3MzJW?=
 =?utf-8?B?VE1uTC85VTNUMzJRcGJaT3lBWFJLWjcrK05DL21EUWlSeGR0NitGeHRwUVQ2?=
 =?utf-8?B?YlhaOVM1MDg1cjVBMS9PVzAxd00wL3VxK2NZd002T3pwQkJNVktFY01vb0Nn?=
 =?utf-8?B?bkN2WDZ4SW4rT3o0WmFzSWQ0cnUrV0RBYlYxVXh5NldmMUxjTkFXOGlLbXRq?=
 =?utf-8?B?M3NoSHFOVWtzZCtHOVc2d2xPdVNLNmNMTERveGRGNmY2TU9xRmNVN0lqRCtv?=
 =?utf-8?B?V2hEeHNmRmFWTXdDbmdoQ0pqTTZJZUNPUHAwSkxraERadVR3aHIzUnZsaldL?=
 =?utf-8?B?MzBQOWNkNWd0TE9NWVZERERxN1J2L1BLNVdsZ3JIUVJwWFJ6cEpscXN5cTJG?=
 =?utf-8?B?c1hDN2E3WVVLeW9XVWdYcHRsb0dVTDJ0L09hdTYyTVhmQzJmQllFMjF0QkF5?=
 =?utf-8?B?WUVXZzB2LzhKOVd2ZjIrTU1TN0lkUnEzR2dIbDlyUFJtRWd5T3FDK0hOY29z?=
 =?utf-8?B?S1NWb29FbEJvcmFTOXhHZlpxcndVWFFOeEVncExncnlaZjJDSWpVT0JpVFdR?=
 =?utf-8?B?NGd6WitScmNNQU5WL1hCalF2OWNDVkluNHNZTzBOY0kwTm95VWlYZE9VeHFR?=
 =?utf-8?Q?CUFNgOlYobo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUVlZTVhWnJBZzgvZXFHQWRIeU8rSHVFSXBOSHMyTWR1WTF0akU2Y2xKWXdB?=
 =?utf-8?B?amwveVdublEzbEVsUk1hYjZxMUVXK09ZRmhIYUtFaTZaWG94cmpxUVR0aUZ4?=
 =?utf-8?B?TVBtSFRCRVZnQnExL1dqTzB0bWdlZDJJR3FGbDdBMmFybnpmVmlNbmEvMGo5?=
 =?utf-8?B?Qy9Wc05VVmFVc0NETENtWmovODNadG5JUURQMms5Rmp1NElVWG80MkdnTnJ0?=
 =?utf-8?B?bzM3SFFteDlGaHMrd1RGS2o0WGdFbGFmUW1BdmUvMlhJcVlXb2pmV3NJSnB3?=
 =?utf-8?B?VHhXaUZLTjlKNy9RMnNPaEkvQVN6djc4b0FFOWlVdzZNZEU4YnVRSU4waFJw?=
 =?utf-8?B?THZVam5NcThYU2JPSWpsUyttcGtIcWJYRXR0UTJmUVpZRDB0QVpIZ0V0c3BC?=
 =?utf-8?B?MzdseHRmeW0zZzNWdkRjeGp2QmRrY1AwWnE5MnNFSWNzN0NqZWxFbjJNbkVR?=
 =?utf-8?B?d1dkVFhZZCtCR25obmRKMFpyc1N3Z1RPVjVoZzBVMGIrQlBGQWt6VkM0dVpE?=
 =?utf-8?B?dU5QVWhtYmdNSVN4RmhmaEJDdENTSXc4V0c0Y3ZSOE5ybG9aUVEvdEdSeWRR?=
 =?utf-8?B?eEVHRXpZVHQ3ZHFnL3AxMjV1eFJzMWNxNy9kYlZrbkxLRWd0RnRQTERhWFIy?=
 =?utf-8?B?VWpidzQ5RTd2NXVGc1ZtRlN1blM2djdSRVprNTFXb2RiaDRuQ3pMM2pJOGhp?=
 =?utf-8?B?SVIvODc0Tm1JaG9ZMyt5ckN0NDRYb25keThmOFpxYVVUMmkweHkyK2ZZNlJQ?=
 =?utf-8?B?WUZsbHg5b29aTjdKbzdvYXAvZ2ZtWnRRM2xwZjlUTW5TZnMwd2VRaHZndWMy?=
 =?utf-8?B?MmFHalF4ZkFKKzhZR244VzNpdDc2ak9aZ2JReGpTektLbWhZY3IyZFV2Tmd3?=
 =?utf-8?B?SHc4WGFJWFFDd1JNOTdiN09HaXp6N2NzR2RMWjd0dFJDNVNHaUpnaDQzVGd4?=
 =?utf-8?B?ZWxWK1ZwNXVsMGRmRlhucndYbmlEemN2OGNDOGw4K0NCS2JwWWpkY3cyYXlU?=
 =?utf-8?B?dUpUODROMlhjVFJ6Yzlla3NNQnNLZEthSU50SFVyY2h5c2ZGdE4xb0l0eEJx?=
 =?utf-8?B?NThJalgwR1NoM0EzbzdLNzUzUWNUS0lJMEFqR1FmZ3ljcU5BekpMZWtVUHRO?=
 =?utf-8?B?LytrMkZiWDhaaC93bHlTdzJxUHpVV29weU1EMysxV1hNTEdUTzFmVTdJQkNE?=
 =?utf-8?B?cmt1ZDlEcnQ4dkxVY1JqYXpCV1NkbktGZHYydlMzVWNBMGZUbjMrUVlUVG9E?=
 =?utf-8?B?L1ZtMFhMWEdOQXRjeEQra1hSendSTUQ2KzhFb1VYSGxCNStwellGYXZHd2p1?=
 =?utf-8?B?NFUvVDdNRTBPdmFOalhOdjRKeVBta2trMFVXelhWSVJ5NENqSEVPTFZVMHBn?=
 =?utf-8?B?cDFkLzJ5aDJtOTdEYzUvaXl0dms5K3ZsMlJ3SEszT2I1eEhvcTE1SWttK0l0?=
 =?utf-8?B?TmdjZkhDSWhaSlZ1OGZBWHNrbVVXQlFWRWVCeVg0aEx2VTNhUmNNUXlIelN2?=
 =?utf-8?B?a1ZvdWlXOHAybkVERHA3UzlCOWU0U3FKditJY0xzQnBDbzVzU2hKZGF3OTlx?=
 =?utf-8?B?NlZpY2hCQU5DeUtxWjFQWHQ4Y2FhMlNRSWVHNktReHhmQnRreUxNSnNrREdp?=
 =?utf-8?B?Rnh6N0Q4VldMaXFaSGZaVWlpTUkyRXpKVUxRNjlRaURodUdBSGR5RXJIYUpF?=
 =?utf-8?B?R21wMjVVd0Jac25ad2JHYTJ2SjBtdzZCWllhN0lMbUxjNk94Zmw5OHY3c0Jy?=
 =?utf-8?B?YjBZdlVsbXJYaVFoK09KYndEcEdiNEtGVDMvVUNMem4rNndqMnBQMjA0cjBh?=
 =?utf-8?B?bzFjQ2JYUTl0dGVkOS9kWWZJTm1WbHpHL1JoRXZ0NlFnQXhyVVhkTkM5WkxV?=
 =?utf-8?B?UE1iamFkZHIydVdFMjlUUG1tUXFNT1JqTCtmSThGNU8zVmZaNnVSS0FBUEgr?=
 =?utf-8?B?OCsvVHUxd1g0S0NQSU9iUHpxNDBoQkkzT2dLR2J2d2Ric05tWVoyQWt3Si9K?=
 =?utf-8?B?TkYwV251MkZKdWNrMDNyN1AxMks2UUcrUlZrSXo2aEZjWmhkaCtuTEtwYjhY?=
 =?utf-8?B?enZEVlRSVEx6N2JES1lkeXVoSURweGRhbFhudHNtSVNQQlowRGFocjN5cXE5?=
 =?utf-8?B?OTh4ZFV4RkdZSzByNTRwRllqcUFKZmxBazhWMzF6Y29BNXVnalVJVTQyNUlJ?=
 =?utf-8?B?K2c9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3265884a-447d-4d72-42d2-08ddba2de90c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 12:34:10.5041
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FT60hFkhkvO3V/88pZNNwfEqoPG+3xlOq5i+Ld4hh0h8wprgirT/VF1AbOvKEFW/6GlMCFUFPYqqsq7ekNhL0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6677

Hi Daniel,

On 24/06/2025 15:32, Daniel Lezcano wrote:
> On Sat, Jun 14, 2025 at 10:55:55AM -0700, Guenter Roeck wrote:
>> Building the driver on xtensa fails with
>>
>> tensa-linux-ld: drivers/clocksource/timer-tegra186.o:
>> 	in function `tegra186_timer_remove':
>> timer-tegra186.c:(.text+0x350):
>> 	undefined reference to `__udivdi3'
>>
>> Avoid the problem by rearranging the offending code to avoid the 64-bit
>> divide operation.
>>
> 
> Hi Guenter,
> 
> Arnd posted a version which seems more complete.
> 
> https://lore.kernel.org/all/20250620111939.3395525-1-arnd@kernel.org/

Actually Arnd responded here saying this version looks better :-)

https://lore.kernel.org/all/5a571236-7de0-42bc-bfb2-52a57e210852@app.fastmail.com/

OK, to pick up this series now?

Thanks
Jon

-- 
nvpublic

