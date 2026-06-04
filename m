Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012071.outbound.protection.outlook.com [52.101.43.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5620284B25;
	Thu,  4 Jun 2026 05:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780550081; cv=fail; b=qBiMDAKZgdFlMrj6cg7ZD3LpRqNa/+m1qtYhweSbWf2wKk1Bd+yGs7j8Otf6CX64ToG7hrTZI8OdC92BHhe/Bme7rug/hvrqAludg/g3yen9PJZC/BVdyBGyVMuBHF0t0QgexXsEWIxY3ZzGjOpOc9c7ZyWwelLz6Tap3uqSjAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780550081; c=relaxed/simple;
	bh=tYUr9ZJE+2iN53O42yHhM6kX8XhcJ0FUTgYqDAKtS3k=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=F2POfjJlOBXXn2jjw93tYxmbmC/zjsronTJ7s4NQ737xRZk8dOG0NGpSEZ+feXFATHiTZcfFoNj8FhWFx4n5g5t3pd4n1l+iQoilh+2cK1R0zbi5MUbq+HURiQkKZeRzD/MqYni6T0YkCrtD/guaM8NCT6sh0jLki867qhX5cRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bVjIlVpr; arc=fail smtp.client-ip=52.101.43.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bVjIlVpr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eecgNGAGOlxOf0iQfs18pxzA3KriHh6aR48P+1Irnyiwd6GIokb2wUzbQ9S6K1cyw+bIwzz2G11dlisvP4fVFd25lk7kuGdvnk5spsOA3hxbsPStqOUAQ4LPCEenLA4FAcE5Jil4L1E3cjQod6woK9joA5EBs5VMaAz8hrclokhtXaXw3xP51XmIkHJou0u5WiNvkXgDFrgEC4LGpYTOxIRrC2oPPTf693CMuo2O8P4Fu4Mt3aLCXpy8hUMkRSRUvub14iXvTdoIF2jlmO5Ht+ww8kyzY+DeORsUzSh5hLi1uqCQZ1/6T6+16obamDkMI3RO7c813oJmYShVTUgNMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rieBbIZ1z/ff1t932mq7leZTIMnlWobh/D/eiXVqgYw=;
 b=mTMXLOpRIHyZsgMJTEx/EE9fiMC1Orkk+gtgvoevk+JBu1oWafASCMoDnLMMyvrV1NO3z8FlMDJEs8bYbWAXSHykcT9rtV/SWaoyMyoAdD/nP5vScL6B/2eorRjPNP5P7QoTvP9oqvgR8h6DEZnjlwMzISg5r/hMpTdly113LZQY0po/LWyYK0hIAZvxeZaYw8Bq0aaUVdSn0EaySI8bK6H3u1h0gVpq+SmlkrrcFIBjipq/Mavk4PVMACvEM4E4tpxMHRfqQXmdAEPKe4pds9fl3DgMaFelEIN58QjxVhOV5bxGPV8l/Ei8kh05ERAMU2Q0+R3cOYQcOiDPs+kvIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rieBbIZ1z/ff1t932mq7leZTIMnlWobh/D/eiXVqgYw=;
 b=bVjIlVprDnif+nEstCHWFXrcvC2j6EDBjT15ycODKG9hojWI5+MbZC1Zhf5czuba+gkEctmzLpnNimrqhijAOfvdnKUt/S74yOb/RAVtSIiXvxQNAcGj+ZmMQ9aDVO1TfRjrIDcRGCIxWAaZEPvvbwr+E6HbTCIhPNGFmxaLe6UZlWr1IMmaZjVMDSAT2H55QTuTcKHn9mW4Sfne+NzoE+Ij6CQe+3vUquEb36LlGIzj9LOaca/ntYVT8NCEWZrwb5bntKv7R+SU1+L1tyvMSkcqYssr0sxVIzvD7NLnyiu0dakPkoiWzp8bSc9vLxXi7FgKjBqS6FgBYQU/KyVSxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5716.namprd12.prod.outlook.com (2603:10b6:208:373::14)
 by MN6PR12MB8591.namprd12.prod.outlook.com (2603:10b6:208:471::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 05:14:34 +0000
Received: from MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::bac8:2b43:2a64:4c76]) by MN0PR12MB5716.namprd12.prod.outlook.com
 ([fe80::bac8:2b43:2a64:4c76%3]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 05:14:33 +0000
Message-ID: <d71731f8-9b4c-4298-9b30-dc24c919f5ea@nvidia.com>
Date: Thu, 4 Jun 2026 10:44:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pstore/zone: Emit registration message as a single
 pr_info()
To: Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 Jon Hunter <jonathanh@nvidia.com>, Thierry Reding
 <thierry.reding@kernel.org>, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20260426090929.1528232-1-kkartik@nvidia.com>
Content-Language: en-US
From: Kartik Rajput <kkartik@nvidia.com>
In-Reply-To: <20260426090929.1528232-1-kkartik@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PNYP287CA0115.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b3::6) To MN0PR12MB5716.namprd12.prod.outlook.com
 (2603:10b6:208:373::14)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5716:EE_|MN6PR12MB8591:EE_
X-MS-Office365-Filtering-Correlation-Id: e271225c-18bd-412f-84d1-08dec1f829fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7UG8G0Sn7ajop17qawOXcF1qTpNaQU8O3X77om+XijAhjXFU809gi4dBh1fWnXaadveU3o3CLssc8YGGvdXzueTFmxjcLZBPFW/VhVp+y6pkcuctjWMe0z13NK3XYrC2Z03SmBwBnmXsZbwvK7d3mm85rLEWTnJz/EkmmEa34xUBiqQQT0Uj9VN1KTP6r5RaxpVJjuvQUxY0VjSmy9VjLunRc5Bibn4qTVSY4Tk7YjWRagnfVX1INnMNuOoxwqMpap70Ok3B3qcd7cji9crCZjBg7ItUI3r4VzFlt1ciBgvkEerstqmzupG8wRPOcuC07+cqd28XjyKIxS4sMh7ytUf3c320A9GP+4niQnJ/gQI5Ms3pYPwLPY++HkNSwu2jZWqYRohnm7ZkYq3Kobl8Pnm9Gf1CD8wS2CbAiIMCF5BS3Fg/jMOKRg7wjjAGhzlNL39FTU7rM2PCg422u6SNAAf/iTJ4qu6kV0HGmv87/exum9rggIB1riKfemma5HvegrrEC1Wo4CCdMUE1nV61hJc6oN2wqHkS73WfS1gUA33fe3bmsTQ+oSjjxwtXdtDipecWSWcpTkbsNogv1Bjhtg32CsVgK9H9PGVHQumz549qDnPh4uc13exnzcD4YaUxPs4xbs5jTNTQVBHrLXBTQ4NlBSyd1q0+XCtJucwr2EqVIud9c2ljxXTypuR8qOsghjfTFbmt8bdjQQhXlto2Cg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5716.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d2o4QXk0TmxxMHJuVEovc2FFZ282WlVUZnliZU5IdkZnQ0lZTC9iejluNGhU?=
 =?utf-8?B?ZFByNU12ME9FYm9ZZFN0R2J1VVpZNVlBeEVmN0JzeTBUK3FPa2J1R0VzZnN1?=
 =?utf-8?B?QnhVSGNUWTUvSEJGcEdNT3M1RGx3Z1VQV2ZDc2diVEF0ZjV0VHJMRXR0SDZl?=
 =?utf-8?B?T1UzYmQ2T2h1bkYrR3d2S3ArR25sQ2VUNXFzVU1WZW5IRkVHQklidDh0T3h3?=
 =?utf-8?B?MnZ6N2lkU0YzWWxOeHBOSTNQMkRyOUQwZE5xTFNRRjRHYUI4d2c0WExoRVQ4?=
 =?utf-8?B?YmdHWHM4VFFnQ0YvcjM0SVdxK0t2NDBXaEx0SVVoWk5yWEJMaFlkMkt1dWRR?=
 =?utf-8?B?a1orSXNnbm1aWnZ5S0V4M1BwMlZXZ2RzSGxoK3BJWExUa1VHL3dXeDlzWTVB?=
 =?utf-8?B?WWhEQXlQTDFPTmFkRDNMWm1xeTZySDFhRmEyQTc2NjJOekEvcXNCcWNZMlhh?=
 =?utf-8?B?ZjhkZUdLMy9GYnIrTURLbUQzT1lIeGZVUUhaNHJ2UDVSWTlBMjVtOTE1MTUx?=
 =?utf-8?B?eEljSC84YlpMeE5EcFNIclVhNnJ5UXhGenZnVEN0eDI1eCtKekdTVEhIcnVN?=
 =?utf-8?B?Yy8ydExzQ2VoR3FnMzhVbGgvcUxUeWdpalMzSEtOL0lmWVgydWF0M25xVUUy?=
 =?utf-8?B?SmFzalRkclpmYmI4NzFmNm1Xc0hGRzZZb0hmbVRvbUd4M0wyMnZ1ekF3SWdV?=
 =?utf-8?B?NUhaeWMxcnZISEdycTdSdVhtZEtlVytoWnRJWEJGbWtoTWNCaFZmTmlUTTRp?=
 =?utf-8?B?TDBmM2V4Skw3T3R2NHpnZ3NFQmNOTXYxWktBa0tmTmJFeTVXc3R5M2hOUnJK?=
 =?utf-8?B?Vkw2TGRKZ2hMTktzd2o5RGtucnpBNENEblRtMEFPMHBzM1gvNDY1cCtLUVRs?=
 =?utf-8?B?aFhrcy9QNTJKY3ZPSzFYMlJnZkpPdXhic0IzeG1Wajdnank0OTJNSTVRVUdU?=
 =?utf-8?B?N21vVVo3ZlBkQmZGNFhYNlBOaFMyNTBMZU4xMTF4U1NZRFBVakxBaXpnODBw?=
 =?utf-8?B?ODV1SWVtNWRrUSsydnFhTXVPa2wzeEk0Ymo0alVqYWk3TFRkVkh0THdQVGNC?=
 =?utf-8?B?RGE4cFJnMnlDbkJGc01aVDZWMThsbDR3WlVLV2lZUGllak44UVNTSHFNd1pI?=
 =?utf-8?B?eXJiMFovb2ZTMmxtUC9XcEZGcWdqVlN5RmRiaEs3U1hMV1dSb0cyNVpHWUU3?=
 =?utf-8?B?NFdNMGt0RHRCR0FxZWlMNkY4OXpZdTRzaEpJQmVTTWdNYUZkL0dJVDhIM0RF?=
 =?utf-8?B?TjBtZTRyQkpxS2xxK3NjM2hGT2FFNjgrZjhwZm40SVV1QmZmQVUzN0NQVG82?=
 =?utf-8?B?Z05zdkJpL1NiQkFBQjhWRXpQY1VndDB3Y2Z4K0hmMjFBc3c5Y2ZCakZXRTFR?=
 =?utf-8?B?eEZWQUNlZUhjVitEM0VTWGRBMWlsYU9MWnpUaUVEU2ptSDNtUUY5TUVMU1RV?=
 =?utf-8?B?c0djSWdyTXprZUZMamNBV1ZiaHpjaUVlVWY1b1Y4blJpd3EzclpNU3YybGNV?=
 =?utf-8?B?TExzSWJlTnlORnN1eXRFWmliUTlNOEgxaTFMcUY0aWZ3RWJoeDQwNm9SRDMz?=
 =?utf-8?B?eWl4QW5XMWg4R0tIeGhYREdzYWlMbDQzN2ZCeHY3WnRnYUNOREVLQ1oxVTdk?=
 =?utf-8?B?UklQTit4aGw4bTJCSjQvUVpvTzg3VU5BV2pEa1BhQTUvdkFrajZ2N3lpaFo0?=
 =?utf-8?B?RGkvSmd4SHJQRTg2STNZYjgvaWVPUEE0c3RSdG5iOXpock03UGMvL0JSWTQ0?=
 =?utf-8?B?akgrblpjU3dob1Y4WWUrVHdiV0xlM1hOZ0p3NEh3UW1XQ1RZNThCNHpMVmJC?=
 =?utf-8?B?bmR5MXhKak1OWGNPcU0wN3Y1T0duYk4vMENiMTlMSy9ndm5McWt2RHdTbTRP?=
 =?utf-8?B?dE9GU3hBbThoakgrT3FDM0tNUXVZdHY0UkozQnY2OEhQSnNOemRWc3F3TVZE?=
 =?utf-8?B?OUV2VGlhL21PQ1U4MDlkbjdaV0dod1NXY0pKVEZYVlJWM0J0S1g4Y0RQZEFn?=
 =?utf-8?B?Y3lRTFdYN1BVWmZvS2swS1d4R3hwUHJEb3BIUWROaHpkU2U1VW51RjFSRWcv?=
 =?utf-8?B?YnA3UlNxU21hZEhJVW5hMkdqVzRmcXN3WFlWNVZyL0t0YWlPNW93R2dFUk5F?=
 =?utf-8?B?MEFNbEZkK2taVjdnMG01a3V0QjdyY3U4OVJrTERxa0U5VEdQYkNHTWFRcUpj?=
 =?utf-8?B?b3Q0ZVp5WnZtVHlMVXh4RzluTXV5cC9lU2RSME5FT3ozN05BVXozanYyU0M4?=
 =?utf-8?B?MTBDZVg3Nit2V2pUTWhxQjk4THpwalBkbUxDaDRjYUlJMEl3d0l6QnhEdFJl?=
 =?utf-8?B?clE4YUlJdkdORTFudmx0QW85RW4ySStFYTFwOEs1eGRPbGRwWnRIQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e271225c-18bd-412f-84d1-08dec1f829fb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5716.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 05:14:33.8405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qYos1YUlzNGNRZ3Nafz40dJehVW6jIYz2tMxTwexS9imNmG7SuQStfGNjpA3SgD2CbZDZt46wqEmMEBPL+DP0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8591

Hi Kees,

On 26/04/26 14:39, Kartik Rajput wrote:
> register_pstore_zone() prints its "registered ... as backend for ..."
> summary as a pr_info() followed by several pr_cont() calls.
> 
> pr_cont() is not atomic and has no log level of its own. It appends
> to whichever line was most recently opened by a printk(). If a
> pr_err() or pr_warn() from another CPU or an interrupt handler
> preempts the pr_info() / pr_cont() sequence, it closes the
> continuation between the fragments. This can cause parts of the
> pstore registration message to appear at the wrong log level and be
> interleaved with other messages.
> 
> Furthermore, this causes the detection of new warning and error
> messages in the kernel log to be unreliable.
> 
> Format the registration line into a seq_buf and emit it with a
> single pr_info() call, making the line atomic with respect to
> concurrent printk() callers.  No functional change to registration.
> 
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
> Changes in v2:
> - Use a seq_buf to build the registration line instead of scnprintf()
>    calls.
> - Link to v1: https://lore.kernel.org/all/20260424095820.1433700-1-kkartik@nvidia.com/
> ---
Just following up on this patch. Did you get a chance to review this?

Thanks,
Kartik
