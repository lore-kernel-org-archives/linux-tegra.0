Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012040.outbound.protection.outlook.com [52.101.48.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6613161B9;
	Wed, 17 Sep 2025 13:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758114750; cv=fail; b=NQpEVo8gjCq1ATgbedf0GrdVgykV0O78bLReht2TMYPbGkVPJSBPGy9NrpOJzV86Kmgm+LRuLjv/4sdVp/IOnD7cTj95lE7ZHrBe02O6a27f+wDyA0VKz3ksFdHTwPAus3Me/bTFlQVtc/6ZpmL+p4H/f6QW/YJghKrdzSqGc4M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758114750; c=relaxed/simple;
	bh=PiLNKeXyMM+pEhoa3zBVlPZXTRbYjErjts1QAvdCzgk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oJHAwuIlHqNRtbOI0mKQo1APueLRy0Afdu+ugads7O10T2353LKNGpUIDw7bv8IGEpK1HaGshLfQTXcx3hJ8OWPLO0dRUSTZIcEBmHJXTMRRQAGWoS2UClL70LkAU4bG3MJLg93+rCzphZPrue8MJfiW2OWcf53R6biWQhaPCZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lnOLjAMz; arc=fail smtp.client-ip=52.101.48.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lnOLjAMz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gGGKGBucR1gWwnpo1XALL7MafsFKV6ZJTJ38l69KHgiwEzul6pSnCYpyNyVOMINjF86d6L1iGIcjRT5XWg0ISV6Ss5qmOXM6aa090IEHR028QaR+EfPhJB4QrxGSXvI9hvWKlHO5j3KcCUODC116l09Pmx6LeBOc8wI/ZDaM3cFde993GnIhQ9Jq2P/EyLUYR8ziRyLX9E7lCPZwcyc4pYuR2OtxROI7J8nxvf0Wv/YEyMflLhM1xujH3F1imx2/4eMy6BdHri5MfjMtB+2qSuFhV2eFetRQLGGqNxMEw+RJjNqquafJx6FfFZqg4EHPex/8WgO6SIAXde+GCEX6QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y/F8miTfwp1SYsP2XZPrz+Spp4sSvIRJM57/ZBwQxuQ=;
 b=cZiJweJ4CLrZmpwni9u96Pnk5craRI3B5lmJyElAkCBUG9fvXVASFU3pooGm7a0fkese9l3W0Odfml5x7hPkT331BzuzA5S2BskCmsKMkjCMNl+DAdp1HI06hemqMGvx8WD/7Ac2Oo4LyAnxaT8ajz2pQ3Nua9ZgK0vLwXXG0Ncdn2QpbE/uWkIHzDNEDdpoljNhYTb9IUeIjzsonnCXBFG1xNCz7diV/Arm6bXxIHRpMyfdBIsf24N8UdR2QXQOYdvbeYh3eEBzhUUKfsjPLtQjvyHGX8uV6zwrgyrmcKGLXypy8O2gWSzx9rNZUqwY3K7K3lswR29tRiseekwACw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y/F8miTfwp1SYsP2XZPrz+Spp4sSvIRJM57/ZBwQxuQ=;
 b=lnOLjAMzlNNGOEqgvW5Wl3cUlzyWIEsKwKvgQ5P47axAmpHDCIADAQQPJSs0QdrCvD1YXYWAnIeHWfMwjmyV9SRJWjQauZjkGA8NH0vrLRWJeOQ0teHRBtGTeSty+J1WwuZPJaKNCfOruDiGiDqiaI1YuV4nBmfJ9RJ9tAGWt9RPpJypKAWkM5ixC3SyoeJOYdd7LawNuppWja5p+EFWpb0NMEuGiUczFADFru2/luz5YVBRlgwy1OUwXAEcm1aaBzOKkWqaGyGDYy4VwXEZx16V4TDtmvTkALr9QHwj18Rrz1DV0goHL4hRaHA3/BSNsIYzurYH1RRmsiiC5FGjpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 by BL3PR12MB6404.namprd12.prod.outlook.com (2603:10b6:208:3b4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Wed, 17 Sep
 2025 13:12:25 +0000
Received: from SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9]) by SJ2PR12MB8784.namprd12.prod.outlook.com
 ([fe80::1660:3173:eef6:6cd9%5]) with mapi id 15.20.9115.022; Wed, 17 Sep 2025
 13:12:25 +0000
Message-ID: <0a0ca1f0-fa07-49b3-ad7f-0a5f485ac505@nvidia.com>
Date: Wed, 17 Sep 2025 14:12:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/13] memory: tegra124-emc: Simplify return of
 emc_init()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 Aaron Kling <webgeek1234@gmail.com>
References: <20250911-memory-tegra-cleanup-v2-0-d08022ff2f85@linaro.org>
 <20250911-memory-tegra-cleanup-v2-1-d08022ff2f85@linaro.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20250911-memory-tegra-cleanup-v2-1-d08022ff2f85@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0194.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::14) To SJ2PR12MB8784.namprd12.prod.outlook.com
 (2603:10b6:a03:4d0::11)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8784:EE_|BL3PR12MB6404:EE_
X-MS-Office365-Filtering-Correlation-Id: 2824faf1-f9ad-4a0d-6406-08ddf5ebd81b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L0tWRmp6ZGtuNkxLQVd2Sit0YWlmVHRrNTBhTU9sZ3orUitvWldTSXUrdEVD?=
 =?utf-8?B?MjU1QVR2Ump4cGhlMzZqaXJ5NHc3K1FrVjlFcUo0K1RIOFhDRkREcDlzZVV3?=
 =?utf-8?B?MWVxSTd3VkFGUW1EazdKNnRZWENsSzR0eStZYVpuMnF1ZG5OSFQ0ZGQ2RUFG?=
 =?utf-8?B?ZDl5bEFDdkFQY0dTSG9Iek82c3B3ZncwMmtaRDZ1a0lRMDBJWjEvREh2dDJj?=
 =?utf-8?B?OTV2MGx2cG5UMVZBR3dJbE40MVp5V2cwcWhqdWtEVHlsRStTVjlVdC9ldEI4?=
 =?utf-8?B?R1NEVXpySUVvdURuUmpTQkRDMS9BamFPWmJHNWtLb01kTFNEekFzOTNsZ0c0?=
 =?utf-8?B?S3VENzJjMXJCYXBHTVBpdXVCWStEOHJoc1RTZ3RyK0RMeHhlNndxR0dmazln?=
 =?utf-8?B?TmdFN0drcEtsTTNtSTZnUWV1ajZpQmZidnl6SVVVdUQyZ3FPZDVyaVA0RElV?=
 =?utf-8?B?Qkd2UTlhN1NNMXIzdkRvNWN1MGlQejk3bG9kTGMxempzNmJoOFBKM0diUG85?=
 =?utf-8?B?L09Sdm9EWU5MQStpcitBdkFSREw0eEJ5WitNUGtFdlpmN0UyN3lPWmVDWWpL?=
 =?utf-8?B?eUVWOFQrL1dQQUFxeGNXYmlzUWdKci9pSjZNNG51a0lDdDRYelFWTlp6TjRP?=
 =?utf-8?B?TzFvTzVYUG44eDA1YldLTVgyVjFuZzJiSHFGcFN5MW4yWUJxd3o2ZFhkTFFU?=
 =?utf-8?B?cW5KeSs3SjNsMjJFTU9IZU9lRVJ4TDFNOU9IdGdiOUFRb1ByZW1jSUsxOU1w?=
 =?utf-8?B?WVEzalF6R2p6SUhrcldjVW91NkhMSklSODFBSk4wV1FFZGxVL09UaEVubG05?=
 =?utf-8?B?eUhYZE51VkpQMGo3d1JBY05MRnBRZTZRN0RrYkhSQ21QVkV4WXY0TncwVHpF?=
 =?utf-8?B?SGUzOUsrWmlEeWNkYm5JUXZOQzBzUktDUnlqUWtoN1lKamk2ZFVqWTR4MXdm?=
 =?utf-8?B?ZlJTN3JaTnpiMHcycVF0Ulk5NG1uM2FEdmNoZkpoSjNsZm1hODJqeWdobjBE?=
 =?utf-8?B?WFpPNi9hdzVCVmRldGlHUHhBdWRwYWQwdzRLQ3lCUnM5dEdJcjUyK0QvcGMy?=
 =?utf-8?B?SldEeTVTN1hKNXBoL1luMFBoZzNrZ0VPbmVTWkozRnpveUM0WkR2ZTRlVWxw?=
 =?utf-8?B?VlFNcFdnZEZSMFpBRDVSdG1jcmFyNjZ6bmtkQVRRK1hUZGRqcVNoUW5aT29P?=
 =?utf-8?B?VEpOamM4Y2VWc0ViOWxGdWFBTW1VSkNSU2RrckJCL0hmZXg0eWZGS0pJVGJ2?=
 =?utf-8?B?MWZtU1NSVXFxZXFLWTQ5aWpBMlczSldZb3VpdEZrOGhlZEd1Z0p2UVRTSEhI?=
 =?utf-8?B?MU9Uc3hwWGVnemxzYmhROGRNN1FuYk41Sk04dTQ1NnoveEkvMDJ6K2NYQTJJ?=
 =?utf-8?B?NDNEeGR4cHM0anRXTjJoQW1zYWtsQUJERC9Rc3d4LzhiVFZ3M2lZZ3VhckxC?=
 =?utf-8?B?WlpBU1pzODJ6TFhBRGZxcEQzaU12Wnp0a1krOE9WRm5WaTZkYzJxbFIzSFZW?=
 =?utf-8?B?N0tWVWFuUVlTZWYrNGtxREpkOFQyQ0ttZ0NoaEtxd3lnWXZmOG5ma3VZTlNk?=
 =?utf-8?B?M1l0L251dmVJYWpkU3hrR1Rtc2pVNDN2WG5sUlQzdUFYS25CWStMU1k0UmpO?=
 =?utf-8?B?Q1F1eUwvS3FkK2lER28rTDA3TlhhUVgvYkhXdWV5c2hYVDhHbm43QkdQdHZR?=
 =?utf-8?B?bWhCTVRUVExEcmVwMkJ1ZjFLQXp3VlNUZDJSOUVLeEI4NkZQK2xKazBkblp4?=
 =?utf-8?B?Sk1zbVJtSm85VkV2SFR5cytVOFlvVW9ReDJ2ai9BaXVjczB4YnBRVytJMGNu?=
 =?utf-8?B?SkRSdERqOGFtYlhocklmVEl1UHJ4TjRtT0NzeGM4eUpJREM5aU5JcGtIRGd0?=
 =?utf-8?B?alpnalRvU2M3Z0QrWlFQSHNmNE9zWVFicEY4REQ4VkJZc1BRMmZOZnkxbG0v?=
 =?utf-8?Q?cNXkZMI1sCI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8784.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MG1WRTZxRUg2a3Q2dFdCTW5XOWhURlhSYWdsdUVCVlhFYkNuUlFSanRJVUxC?=
 =?utf-8?B?YlVpVnN0UjY4TGhQdWxlOGFveG5GK0FXekNlZUtWUGgvMGxEMzkzUlNLTnhU?=
 =?utf-8?B?V21WMUtiTTIvYWVOcmFmSlBTcmk2VjI3UExOdUxieEp4NVdlVnUwSHcvQzVZ?=
 =?utf-8?B?OHBPWUcwSGZvTDJNTlROYVBjQkpDVlAxOG41dkc2TTVCdngrWDlnK2ozdXpN?=
 =?utf-8?B?K1cwMmNCQ3FHdFdHNHArRG9VVVdaZ1Y4MW9VbEZhZGRsYkJtVjVDVXY0RFB4?=
 =?utf-8?B?c1lFYmkxRHRZbnUxUmwvOHJtQzNseHliVnBXMENsWjJmYzlkbnczdC96MUox?=
 =?utf-8?B?VGJpbWhvK2RWUmlzaDd6K1RRUHBHSlk1czQ4TFpTYmVxQVF3ZWZUSysvdjJ5?=
 =?utf-8?B?aUxma2FFRXRHVWkwbDlPcVlvRXVkQWR0NkVhaGlNck9uRjBrcHpYN3J3aVEw?=
 =?utf-8?B?bzhZNVErMHQ3U256OElvanlWTjlHWmlyZ2RSeEJKZ2J4MmVqaUJ6MmM2SmFB?=
 =?utf-8?B?Y01nRVJjN25XNG9xVjBKS1pxbDVuVm02a0JoRUhOaVI3RlE3MDFtYjQ5bjBG?=
 =?utf-8?B?ZXdyY3d2empBVUdFUE15WUFPNzdaRE9oeC81cjllUTc4NGdLZE1Cem1NQkdi?=
 =?utf-8?B?anE0WmtMa0ZkakJOUGJub3o3T0RkOU1oOU0rdVhxeFRQd2RWK3gyN2VkRkM0?=
 =?utf-8?B?eXlZM240bDVNcG9LKzZuSXR5NU9maHF2ejBtTDVTTHdvZm5ma2h2cThzaXIy?=
 =?utf-8?B?S1hsUHZzNk1mNENnMDNBU0NHb0RRb0dDQWUrOUZYTkJMOVlvL216TTVVa3lm?=
 =?utf-8?B?NzY1a0xGRkRPQTZuZm5EengxTHFKajhuRFN2a0kraVhud2ZTRkJaeEI3YzBK?=
 =?utf-8?B?OTFhN202ekJGeUNmNEdZVTJpWWFRMGNlNG5TRyt3UXgrdHBHVkQvQXVlY3RG?=
 =?utf-8?B?UE9XSkgvYU9OTCt1WDc1Q1VwelRFd1dJRWE5QnNiSHh1SkQzTFExOGVrZ21m?=
 =?utf-8?B?Y09halNQQkdCSHdXazBKTmoxK1pwQ3lkeEtURyt6Y0ppMjFuS0V5T3ZCRjJE?=
 =?utf-8?B?SFdxN1dCN09jZCtLZWZjdk1WVFJhdlNHSWtET0VPcGwvY2Z1dVArUE5yWnZL?=
 =?utf-8?B?KzlDSkN6N01mVUZUQ2hsTXR5TEk0c0tFWllqRTE2bFJRNnpjY1JpUm0wa3JW?=
 =?utf-8?B?NEl2bzJRaGxUUU1uZlhGUlpsNVdEVWdGM0J6RzRUcVBLVGxNWFM4elBQalNO?=
 =?utf-8?B?SlVuVHJ3V09NY0M0eHBkeStENjhOQlJjWlQvK29pOGlRZUFWUFBrS0dkOGRO?=
 =?utf-8?B?RG1pakJjV2V6aXBvM0NmVmhicGJhWml0bzhyQzBBYmY5eGdtNEwzZDkxUXZo?=
 =?utf-8?B?UEw4TkYwelI4ODJudnNRRjg1aW9YWSsrRE5CdUJ2OVpLSjFtWnROemc1TjJ4?=
 =?utf-8?B?QzRQWDRTUmpWQjV6dTc3K3cxRzkxY1ArM25ORGYvWXdML2JCMms3SnNMWWY3?=
 =?utf-8?B?eVIrZE4zT0NlbXFmVGN0dzlneFhlZUc5UThqSVRQOHFLdnA0VExZZ1p5TzBV?=
 =?utf-8?B?VHZIMlROcElZN2JBZklzTkM2eEkrY1ZqMzFUN2l1Mng0YzgyaXY0Si9LdEhL?=
 =?utf-8?B?Y3ZLTXpjODE1ZEduamthSGFIWlE2RHNNaEtXYWJyUE1Jam03Myt1NDBaRVA0?=
 =?utf-8?B?NGlUdDhQclptZy9YRitmQmp2RytmYmhaaDVZNlJqcHdFUHBHODMyZEQwYU5F?=
 =?utf-8?B?N0NLTWs4YU9Qc3JHRFlBTDQ4d0x5NHAwZmNKZUlaM0hOOTlLM0tnRXhLY1hw?=
 =?utf-8?B?TmJPMFRqZmpiVnhFdjhVQ0Y3ZHpPb0hTd3N5U0hxU0RmK1NuNGJzNnpPaVFs?=
 =?utf-8?B?cC9uY0t4L2VkK25peTluNVZWcFN0WHhjUWhCWEt0NlpBSzhWTEROU0pCS080?=
 =?utf-8?B?UmtPUVdlQ1FOb21sZDNtMG5FTUFYcVVjOHI5RElUck5ybW54R1ZLcUx2WnBF?=
 =?utf-8?B?ejl4U085M3BUMjIwb3BkSmZmVDBFZVFWeU8wR2M2QVpSWC83R3F3bUNBVW9Z?=
 =?utf-8?B?b0JjMElyUFBBS25mQVV0N1hsdWhHSWVuNFhqdllBOFpWUFpiT1RyNDYwL2ZS?=
 =?utf-8?B?QWJNMmcwQzdaTU9Yam9tZHN1cXp1SFk4VFZjZFFnd3paSUpiWG1vSU9rd0Jr?=
 =?utf-8?Q?X8aSMTa6NvZzuauLWredV31BggOc+NzYLnhNUX2qWcDy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2824faf1-f9ad-4a0d-6406-08ddf5ebd81b
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8784.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 13:12:25.0145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v2OsvfmBpVohGsbosiwyg3YpDoYRauLL112Eyb0+bGZJ0uZew1iLgcaEryloHvwzIa9FKgfY8km2YB4C5RbcQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6404


On 11/09/2025 10:43, Krzysztof Kozlowski wrote:
> emc_init() returns always success, so just drop return valye to simplify

s/valye/value/

> it.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/memory/tegra/tegra124-emc.c | 10 ++--------
>   1 file changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
> index 03f1daa2d132a81d28705ec7c62d640d7d25a894..9aad02901613f1b2ed855c11bcd76fef153034af 100644
> --- a/drivers/memory/tegra/tegra124-emc.c
> +++ b/drivers/memory/tegra/tegra124-emc.c
> @@ -896,7 +896,7 @@ static void emc_read_current_timing(struct tegra_emc *emc,
>   	timing->emc_mode_reset = 0;
>   }
>   
> -static int emc_init(struct tegra_emc *emc)
> +static void emc_init(struct tegra_emc *emc)
>   {
>   	emc->dram_type = readl(emc->regs + EMC_FBIO_CFG5);
>   
> @@ -913,8 +913,6 @@ static int emc_init(struct tegra_emc *emc)
>   	emc->dram_num = tegra_mc_get_emem_device_count(emc->mc);
>   
>   	emc_read_current_timing(emc, &emc->last_timing);
> -
> -	return 0;
>   }
>   
>   static int load_one_timing_from_dt(struct tegra_emc *emc,
> @@ -1472,11 +1470,7 @@ static int tegra_emc_probe(struct platform_device *pdev)
>   			      ram_code);
>   	}
>   
> -	err = emc_init(emc);
> -	if (err) {
> -		dev_err(&pdev->dev, "EMC initialization failed: %d\n", err);
> -		return err;
> -	}
> +	emc_init(emc);
>   
>   	platform_set_drvdata(pdev, emc);
>   

Otherwise looks good to me.

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic

