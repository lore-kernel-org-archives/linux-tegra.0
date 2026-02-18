Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011053.outbound.protection.outlook.com [52.101.62.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEA62989B7;
	Wed, 18 Feb 2026 10:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771410630; cv=fail; b=uq+AytxzDUOkZiTH6yS9soSElsH/iQOHH2dj7N/4RB2QZy+V3KEytNohQlrU7djWErQweG7nE4/y8NJfDWg7c1bL8nAq+9jlwk7/nohFzpQDK+MHuJYU45GnWzA1RYwyMPrlqsZwVoavQWgAbZOm0sqY6aav0iihqiB6dBoBt1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771410630; c=relaxed/simple;
	bh=3GqAv25CI14l/Bb9MiOH+T2CIojXvsCrODrFQ9a20C0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qJkKV9gjRMX37Ln/YuE+qunYrXUNI+f0ahw9XIMwZ8HdlZB6qHo7yBWLXIZYBZMLdEudMn0tNs0zdxBB1pPCD7+zEe6ibR3KmaZh4wgOzOC2plo4dIsvpabOjtSGlSeWTeVP5HzbmERJH2vXwu902KaQPQQ+I+KVSVZrGBRla68=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=p8mNTsO/; arc=fail smtp.client-ip=52.101.62.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="p8mNTsO/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t7xbxG2FEi4fMzA2kzVGS6dWBVGst/0gxgBhB1UtgyhE2jhQhB8v2dZ/5vr7RCENUTdvBQMHkJbrrQbbB+WnkCWfN18n+MToSj7UgCFO0xa5GO8kuKzXBjc37Jof7Eidhb33y3LVLym1YOIR2oa/Gmr6yIkb6cf+5isjdTSMRldNUR/DmZwVVKRfiobV/UVGf1NdIdNpR26Pw3oEXpF8shr7U1aaHMrmT8kKFxqVLaPj/px9W99nhd7n7SZWfM//97I7HF2oIHjQPq2q6WKEcP5vCOGzBwBj6i7FQAI3SnGMyAcGuqeJlNiH69omy5TpE3acBlKw2IV45VbCxvM1Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EAZLbxL3o1CtbyhZtG3YEgcaT9YPjSYVAkaV4SJFHAI=;
 b=opSCFAJmQp+ibXXJNDdbKHIfSFWeL/P0b17dmV1Gi6lx8d3bsI272b3qVKmcxE/XaOkB60ns+zBuSQOisQVkKc7PBwBfWa5tSBXNRkc/qMOj8AeVx5HwDcgWlujVTi2BnyINCx9KIU95Xw2Ett4VbuIpD6a4cdAd8uQ6qaaHr4kr/DK1PNpx+wWnSrYLaRanREfJt7VGenRjB4FLmUMUd2HS59tE7/6O/pMfps6FCtJ0oSFeTzGvjMDOSMp+wxndw5zs+zPHmFY5Ot3f/z85z6cq9diPH/MqyFI2dBX5vpy6NR9oognCG/bTJ9fMD34bIPDba1E85SphLchXkR8cuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EAZLbxL3o1CtbyhZtG3YEgcaT9YPjSYVAkaV4SJFHAI=;
 b=p8mNTsO/fIEMwTVld75fR4XHj2K6vPJDQD3ru+qy2JO5ETYMaT0XBw/IVfBav3U+7RSJWdFybXOnAHHvxhWk2zWV3J01IdZGGAnhMf236eiGwlv3S703iSE9rUfyeLdlrHDWIfsNLSVnpnZwiTtGT2M4brItnYtiPChW9+y+w2t4VTUcZsRBGqzQ8DN2GOY2kTw4QVW+Ms4ST4vW5/nOZTPLtoKqWNnxRaAxGnXRUW6PimM/vSg7T0CafBj2zBlb2rFF883yin/uvqZ2JkX/aYTey4481pst2e253vmIcUDqWrjmVctjZTcgOt6GogH5flEI1MnXKELBCWdzae9Y3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV5PR12MB9754.namprd12.prod.outlook.com (2603:10b6:408:305::12)
 by DS2PR12MB9590.namprd12.prod.outlook.com (2603:10b6:8:279::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 10:30:24 +0000
Received: from LV5PR12MB9754.namprd12.prod.outlook.com
 ([fe80::9667:3c95:27d2:73da]) by LV5PR12MB9754.namprd12.prod.outlook.com
 ([fe80::9667:3c95:27d2:73da%7]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 10:30:24 +0000
Message-ID: <16de27c6-9218-c52a-3f77-88a64b26e6ed@nvidia.com>
Date: Wed, 18 Feb 2026 16:00:16 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v6 4/4] memory: tegra: Add MC error logging support for
 Tegra264
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, thierry.reding@gmail.com,
 jonathanh@nvidia.com
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20260130173055.151255-1-ketanp@nvidia.com>
 <20260130173055.151255-5-ketanp@nvidia.com>
 <af414583-56e2-4754-8200-62215f514c8d@kernel.org>
From: Ketan Patil <ketanp@nvidia.com>
In-Reply-To: <af414583-56e2-4754-8200-62215f514c8d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0277.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::17) To LV5PR12MB9754.namprd12.prod.outlook.com
 (2603:10b6:408:305::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV5PR12MB9754:EE_|DS2PR12MB9590:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c949dc9-6a08-4c45-0088-08de6ed8b9b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OWtNeEpRQzRNZ3JCTnVvVmluYlZkUEpyYVhsalZPRmZiS1FHdzNBYmR6TWhu?=
 =?utf-8?B?RU43b1haNVpVdnZDVWRhU0dqK3IxOWlqVEh6NW04RjBHSzMwaHpZMGRZVkJE?=
 =?utf-8?B?d0tLcjFtb3lhaXkzUms1UkVQVkJ3eVJMK09neTFLMHI3VGIvRkhwR1BFYWZh?=
 =?utf-8?B?RWFuSzU1TGp3SlhRKzVrYmZUTU9vQTltQnZSOE1oTWpieHZ6UDJ5ZHQyVUI3?=
 =?utf-8?B?YkZwSEdrRjdaRlJrbWdGRytRenEydHN6Rnk5eURMTWM0bjQ4QTNxdWhMd1lm?=
 =?utf-8?B?dG84YzFvN0o5OUJvNlAycTVYQkhHSDBSQ09oWTl1Q2JuZUo5Z3Vicys1akVM?=
 =?utf-8?B?bm8zVEtYaXFhNit5a1hBbUtkMDlsd1J1RjRtK3hpNGlJb3IyTjllSHZhVG1R?=
 =?utf-8?B?NnNiUVZWYlNOMHcrby94RDBoUXpxS091VW9od3p1VnFQcGRkWFJuUFhlUUJu?=
 =?utf-8?B?WlN0RG5yNUFoV2tNL1R6c1ZwTDlOb29XUEpPdjJqOGFJMjRaSlFLT1BYSDBy?=
 =?utf-8?B?UFI2cWkvWGF4WFU2Z01Eenc3cDhRWFNHYkhpdnBxRmFWQVhmbitBSlU2bXd5?=
 =?utf-8?B?S1NJOE1qL1dNdXVqem1UdmpMdXpDQXljU2RJRzhpSkJ2bGMxS2dUYWNWTUor?=
 =?utf-8?B?SnF0b2tQQnE0VGhrdFg0a1JpdFYwZXg1WWFXL1djNXlzQzNTSkRuS2d1OGNW?=
 =?utf-8?B?VXNyWU54SUl5TUw5WDdnaUw5dkV0THBMeXpza1pPcXJ1cGsxODVmN2FZZkxs?=
 =?utf-8?B?VHpTZE1CUFA3RW5CTXFOU3Y2cWRCQTJEUGpxTzdJTkdjTUFGeUIvTGRlNG5E?=
 =?utf-8?B?SDVXMW05ZHNIVjFYN0p2dlh4bEI3a0pUWFJEZW5zT0ExaFkyZFhtNE15bUl3?=
 =?utf-8?B?VEx6cCtCMHo2NkxyeVJUeUxaVmc2N2tHUzN4WnZPUUsyMk1aci95dUhYNmJx?=
 =?utf-8?B?N0Rtbys4L3R2OHMzK1JDcjR6VXRmT0RPUmU4VnVNY3kvTDNtZWRNeDdEbWJP?=
 =?utf-8?B?ZFR6am5KWm1IY0s4eitORzRtS3VhcllRSS9qVWVoU2dSbkxZL2JNUCtWNFd5?=
 =?utf-8?B?ZEFqQlozY09DYmVQRTdDbkMyWEdsdXVJRUNBNzNMc3BhUFFLNXFaTEVVam9V?=
 =?utf-8?B?VDB0YTZuK1BISFNIWEFqSkJmN3lJUlNNWTNGNk8vTURBemJaZWNsdDkrVlZw?=
 =?utf-8?B?WjdnWlJOUENqQ1R0cnVicnY1MnpBbUFLL0M5QW15V2RVRmpwQmQwa0pJait2?=
 =?utf-8?B?YWErUk1YRFJSTXpkWEY5QnZyV0d3dzluNW0wNmhWbUd4ZkVnSXRJanZQTjdT?=
 =?utf-8?B?RHRWR0crdGtQdHczcFN6SkREZWlNQ2h4TzJxRTd0dVF3RWRaaVV0MTlSRVJ4?=
 =?utf-8?B?Lyt1N2dyaE1USnZENjdnQ05MeGw0WWNLcmZMcjJUWDZQVndwV0FuYnIvUU45?=
 =?utf-8?B?bE9aZC9mN2RBNGRTd0FuWkhWaGozSzVKdzY0ejc4T0lsS1IzUnFRdE9wK3E4?=
 =?utf-8?B?KzgrQnFKSzZvSTYyaERoeUVqdEh3d2M5b1o0NmF3WEZ1WElmU3c2enJWZnhq?=
 =?utf-8?B?cHpHdnlsQVBiei9XdVRycmxIS0NpNVIzajRobjBOcCtIN2ord3BVYUh5Tnd2?=
 =?utf-8?B?Q0VkTXE4Zkw1Y3ZIVkZEcTlSZnVQRGxYYUZaUVFIQUJ4YkpGMmVROWJKY3lI?=
 =?utf-8?B?emxuYTdhaFlzd0RUeVVjbEJjTjREZ0dhL3hQL3lGL1EyY1pNallocUZuc0lZ?=
 =?utf-8?B?dG1GVVRVVlhVRkpyK3N1YmhZem03UnNoUW5Xb2hROFByMWx0ODFHNmRONWtK?=
 =?utf-8?B?Zld4WFFQVWdjSWVPKzZGRnVTbFlTRW1Nck1ZbGVaK3NJYTdxWDROSjhYbkJs?=
 =?utf-8?B?SjhtSlA0a0lNME1NekFzaWdWSGNPa202NWRFKzdRNDdYbjJrM3hsbFNhcXpj?=
 =?utf-8?B?NVhHckJ3bzN2dmxmemk2OVNzeE9JSkdtdmhnRnAxMTdvNTRQUW44M08rMktY?=
 =?utf-8?B?YTdIVDVwa2FIUmZJZG9UUlVzQTZrY20zenNYblFJMWdTUk5iUHVyZFRTZW96?=
 =?utf-8?B?SHFHdFVZeUY5UHI4RlhXQ1psamwwV0ZzUkl6eWpna1FFTXl1R2ZyVUxPUUlX?=
 =?utf-8?Q?uqB8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV5PR12MB9754.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHZRclp6V29Uekh0VjlwQ0RwWTZPdUxIeHhpVjFLRmVqYVJPM1VNQWJoUWti?=
 =?utf-8?B?WHBubk9rYys0aVdHUVE1S3p4c21UN1FodlptOGkzM29YbEJOM3FyeFRZdG1V?=
 =?utf-8?B?V1Fjd254TDAyVjYxb0MwS0svazZqSTAzcUNCOFBZMFhHbGxJcTJOelV3SzEy?=
 =?utf-8?B?cFJNWmtxRWtLcmIxN0VQOGwwbXVLOFRuNUdKMXd4RWFQMkRnSmxEWlNSVE1L?=
 =?utf-8?B?MC9JUjRPeERoQ1dYelUwUmg2M1UwRSttN2VvdjFsUkVXNndnQmxtUnJ6V3RF?=
 =?utf-8?B?RHBOTFQ4aDJGUnlxSFBZTGJDcisreGJqZnY2ZGlkWDhMdmQzUEkzcElhTTJm?=
 =?utf-8?B?NDV1N2J5cW1yMzFlM091WTJKRGdkT0VNM3FaRG5Fdk9CNkxGQTdESjNiajA0?=
 =?utf-8?B?a0hoS3FJZHd6TDJrQzEwQ2dXT2FkOHdYVkNjcGJFbU4yV0gyZVBJNTVlb1E3?=
 =?utf-8?B?VXZmVWlUcDcrUHFjSzQ3U2pXWi9UbW8wUjNSa0dvd3NlbWNqWnNiZjBYM1NV?=
 =?utf-8?B?aVRpa3NKVkd5cC9UN2ROblJ3aUZRdHcyeUVIYUNzaGN5WGVPS0Nvc0Zva0VE?=
 =?utf-8?B?a2VXNE5xVzVaanprVytGVE5uV013dkNubC9zQU5MS2JVZGs0bWJtbUI4TEE2?=
 =?utf-8?B?V2pVR2krRW5xaFZHek5KTXVnaTViWGhuWGVDM0JiZ2ZvMnZzcVVYbnYwRnpH?=
 =?utf-8?B?dmRvK1Z5V2hzM2RJMUkrQU5sRmw0dDBkQmdKb1kvRjJQamFtQWp5eWVkTFdp?=
 =?utf-8?B?RHhjOWhoTHdZZlVHUWNNU3gzWEt1UWoxS3lLMlczSmtCT0poTlBaem9ndkQv?=
 =?utf-8?B?UlBtWDZkNHJQR0NVT2R4UFdjdjFON1BPWWtwdyt0TGErZ25OdDMvSzU3WVlR?=
 =?utf-8?B?RjdBOS8xc2t3aktaZUZLenFtS2ZzSUpmSHhYV1VwQXhUckplNGJ0QzhQVlk2?=
 =?utf-8?B?dmhzekhZYjkxYnc2RVVYYkxoZW1tTVZKbi9IcTI0RC95SFE5RVBwZ1dZNE52?=
 =?utf-8?B?bkVPQk55Yk1yNnpkbFcxOElMQkVpVElEa3hndi9pNmh1UTBlamhsMmhpM05P?=
 =?utf-8?B?bldoSzV4dVd1ai9tbjNteXYxNE5HWENyQ1lDQU4ycUhxU1IzY1R3eDhJWHIy?=
 =?utf-8?B?R3BucTZhclJkNkFGYlVILzBXSmYySHRDZGtjZDFZUTU5ZjJEL0I5NTQvZFBp?=
 =?utf-8?B?SmM4d2dPb0hjdHplSER6VHNzYVpLcjVoMXZzbGtJb2MzWFBHNTljRFFLRXdn?=
 =?utf-8?B?U04xMndEZTRRMGUrWC9aRUlEbEs4a3M0eGsrdXI5cU41V29hbm01VFZVMHdR?=
 =?utf-8?B?ZWt2bkQ0NzBHZTAzc1JXY0FrcGlrN1FuL0VkZVB4UVlPSG5ibWtjRzdSVGxV?=
 =?utf-8?B?WUxhQWZUc2NYVzVOcjl6QjhZd1lsNFRWa2tFUlQ2bVZRbkpSMk5jejR4dTNm?=
 =?utf-8?B?ank3V1FvUnh2d3d5MjZnRTBXbUVWb0VWdVE2NWE1UXJnUi9qVVpjYnFSQy9Q?=
 =?utf-8?B?UTZ0K28wM1RZcjRIR05WR0pxTnNmUzRzNVFqakw0VWlHWDFkcTVySVlQSWZV?=
 =?utf-8?B?SlFPZk5kSVVSZGJCc0NVNXVkZWJiL3g4Qnp6YkJQL2tqbDQvdVRYWU0xS0ov?=
 =?utf-8?B?U1dkWUE0UXp0cUVRMCtVeUZFUHk3RHN6bmtTYWxqQlJYbkoxRVlDRjNMdzlz?=
 =?utf-8?B?czd2YlZ1cWEwS3hOUkZVQ0xsOHQyaTlHemt5YUNyNE0rRHFzbllFOVFvV1RU?=
 =?utf-8?B?LzRYTmJML05oQVp2SS9GVm9xWHl5QWhCOGNZYzJra3QwYU8wY2JNak1QZXJ4?=
 =?utf-8?B?cmh2alZKRmljb3NKQUZmNlkrMVN4ZDlJVWthVVZQdFJSeEx3dTcrcVJRZmhx?=
 =?utf-8?B?Y2s5V0ppeVp0eXkxdjdvb0ZUQlY2WWp2UGR2NU9Ga0RJVkZQcmJOMWYvaGtm?=
 =?utf-8?B?SWFyVXRPcFhXd1hXNGtJcDBodkg5b2k1ZTdJMUdMUWRNVlZ2QXR1VGs0bTBC?=
 =?utf-8?B?OVdoMHMzZmtLWTRPOTFHNzhzZjRSejA5b3hDT2FmSHE2Sm53RDVFaFFzdDB2?=
 =?utf-8?B?R3lyWDFXMks4SmQ2WVBacTdzR3V4ck9QVlp5M2ZjVEFmd0s1VG1PclBQbERh?=
 =?utf-8?B?Ym41SitDWlVicDcvVVBMWGMzZUtQYncvclJESXhka1FYUEdoNXZTOE15ZWxy?=
 =?utf-8?B?dTBjNTFHZEEwSnc4eG1pMHM2QmU1L25EcDhXTHYvTGZKSVFHMjRQZUhHU1Qr?=
 =?utf-8?B?OHpMNVgwWVFSWE1yWlBOT0VteTRnS3lsV0dtZWF0Q01FelNkTytRbDVFM2hk?=
 =?utf-8?B?N1E2R2dzaG5tdTB3YURPZDhiSjV6blNKYVIrU1h6QUp5V05ETitpZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c949dc9-6a08-4c45-0088-08de6ed8b9b2
X-MS-Exchange-CrossTenant-AuthSource: LV5PR12MB9754.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 10:30:24.3778
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TqFFer3ayUAWhj9fKUl1DlIFv9SX3c2TS0nn1DirrjVyOycYDIqi+XKR2H8T4e4Gp5nHKKAK/RfPj6h812Xgcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9590


On 17/02/26 14:01, Krzysztof Kozlowski wrote:
> External email: Use caution opening links or attachments
>
>
> On 30/01/2026 18:30, Ketan Patil wrote:
>> In Tegra264, different components from memory subsystems like Memory
>> Controller Fabric (MCF), HUB, HUB Common (HUBC), Side Band Shim (SBS)
>> and channels have different interrupt lines for receiving memory
>> controller error interrupts.
>>
>> Add support for logging memory controller errors on Tegra264.
>> - Add MC error handling flow for MCF, HUB, HUBC, SBS and channels.
>> - Each of these components have different interrupt lines for MC error.
>> - Register interrupt handlers for interrupts from these different MC
>> components.
>> - There is no global interrupt status register in Tegra264 unlike older
>> Tegra chips.
>> - There are common interrupt status registers in case of MCF, HUB, HUBC
>> from which figure out the slice number or hub number responsible for
>> generating interrupt and then read interrupt status register to find out
>> type of violation.
>> - Introduce new SoC specific fields in tegra_mc_soc like interrupt mask
>> values for MCF, HUB, HUBC etc., which are SoC specific.
>>
>> Signed-off-by: Ketan Patil <ketanp@nvidia.com>
>> ---
>>   drivers/memory/tegra/mc.c       |  35 +--
>>   drivers/memory/tegra/mc.h       |  83 ++++++-
>>   drivers/memory/tegra/tegra114.c |  13 +-
>>   drivers/memory/tegra/tegra124.c |  32 ++-
>>   drivers/memory/tegra/tegra186.c |  24 +-
>>   drivers/memory/tegra/tegra194.c |  17 +-
>>   drivers/memory/tegra/tegra20.c  |  23 +-
>>   drivers/memory/tegra/tegra210.c |  16 +-
>>   drivers/memory/tegra/tegra234.c |  17 +-
>>   drivers/memory/tegra/tegra264.c | 428 +++++++++++++++++++++++++++++++-
>>   drivers/memory/tegra/tegra30.c  |  13 +-
>>   include/soc/tegra/mc.h          |  10 +-
>>   12 files changed, 648 insertions(+), 63 deletions(-)
>>
>> diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
>> index 49c470f7b1f7..a102a8ea7926 100644
>> --- a/drivers/memory/tegra/mc.c
>> +++ b/drivers/memory/tegra/mc.c
>> @@ -597,16 +597,16 @@ irqreturn_t tegra30_mc_handle_irq(int irq, void *data)
>>                }
>>
>>                /* mask all interrupts to avoid flooding */
>> -             status = mc_ch_readl(mc, channel, MC_INTSTATUS) & mc->soc->intmask;
>> +             status = mc_ch_readl(mc, channel, MC_INTSTATUS) & mc->soc->intmasks[0].mask;
>>        } else {
>> -             status = mc_readl(mc, MC_INTSTATUS) & mc->soc->intmask;
>> +             status = mc_readl(mc, MC_INTSTATUS) & mc->soc->intmasks[0].mask;
>>        }
>>
>>        if (!status)
>>                return IRQ_NONE;
>>
>>        for_each_set_bit(bit, &status, 32) {
>> -             const char *error = tegra_mc_status_names[bit] ?: "unknown";
>> +             const char *error = tegra20_mc_status_names[bit] ?: "unknown";
>>                const char *client = "unknown", *desc;
>>                const char *direction, *secure;
>>                u32 status_reg, addr_reg;
>> @@ -669,9 +669,11 @@ irqreturn_t tegra30_mc_handle_irq(int irq, void *data)
>>                                        addr = mc_ch_readl(mc, channel, addr_hi_reg);
>>                                else
>>                                        addr = mc_readl(mc, addr_hi_reg);
>> -                     } else {
>> +                     } else if (mc->soc->mc_addr_hi_mask) {
>>                                addr = ((value >> MC_ERR_STATUS_ADR_HI_SHIFT) &
>> -                                     MC_ERR_STATUS_ADR_HI_MASK);
>> +                                     mc->soc->mc_addr_hi_mask);
>> +                     } else {
>> +                             WARN_ON(1);
> You should handle it correctly instead. WARN reboots some systems and
> this does not look like really impossible path, which would justify it.
Yes, I am taking care of this in the next revision.
>
>>                        }
>>                        addr <<= 32;
>>                }
>> @@ -696,11 +698,11 @@ irqreturn_t tegra30_mc_handle_irq(int irq, void *data)
>>                        }
>>                }
>>
> ...
>
>> +
>> +#define ERR_GENERALIZED_APERTURE_ID_SHIFT            0
>> +#define ERR_GENERALIZED_APERTURE_ID_MASK             0x1F
>> +#define ERR_GENERALIZED_CARVEOUT_APERTURE_ID_SHIFT   5
>> +#define ERR_GENERALIZED_CARVEOUT_APERTURE_ID_MASK    0x1F
>> +
>>   static inline u32 tegra_mc_scale_percents(u64 val, unsigned int percents)
>>   {
>>        val = val * percents;
>> @@ -187,15 +255,18 @@ extern const struct tegra_mc_ops tegra30_mc_ops;
>>
>>   #if defined(CONFIG_ARCH_TEGRA_186_SOC) || \
>>       defined(CONFIG_ARCH_TEGRA_194_SOC) || \
>> -    defined(CONFIG_ARCH_TEGRA_234_SOC) || \
>> -    defined(CONFIG_ARCH_TEGRA_264_SOC)
>> +    defined(CONFIG_ARCH_TEGRA_234_SOC)
>>   extern const struct tegra_mc_ops tegra186_mc_ops;
>>   #endif
>>
>>   irqreturn_t tegra30_mc_handle_irq(int irq, void *data);
>>   extern const irq_handler_t tegra30_mc_irq_handlers[];
>> -extern const char * const tegra_mc_status_names[32];
>> -extern const char * const tegra_mc_error_names[8];
>> +extern const char * const tegra20_mc_status_names[32];
>> +extern const char * const tegra20_mc_error_names[8];
>> +int tegra186_mc_probe(struct tegra_mc *mc);
>> +int tegra186_mc_probe_device(struct tegra_mc *mc, struct device *dev);
> This is such a confusing design... Function declared in mc.h header,
> defined in a MODULE but used in a driver which can only be built in,
> because it depends on some ARCH_foo stuf. If I deciphered it correctly
> this fails and needs EXPORT_SYMBOL_GPL, but maybe I deciphered it wrong,
> because code is confusing. Your drivers Makefile should not have
> ARCH_TEGRA_FOO, but dedicated entries so the state of each driver is
> obvious by reading Kconfig of this directory - it is built-in or tristate.
I am re-working the series to avoid making these functions public.
>
>> +int tegra186_mc_resume(struct tegra_mc *mc);
>> +void tegra186_mc_remove(struct tegra_mc *mc);
>>
> _mc {
>
>
> Best regards,
> Krzysztof


Thanks

