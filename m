Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011065.outbound.protection.outlook.com [52.101.57.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51C23BFE34;
	Fri, 29 May 2026 09:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780046751; cv=fail; b=lVblxYsmvBaVjeAPYw8GiIaLi9wFosO1dXCMn5PNAKVzWf1cF9TAppscQq/EHAHlH4tMkWBrfK8er6NWxV0GFAGgDI+6XMfTJf5OynMWtn7A0BUZyU3AYc4bMY+fi1S14pHscUnALXEF1PAnFgKFowWlXwMrksk9NTNGz1lBVF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780046751; c=relaxed/simple;
	bh=dNL4dRy6uuq8CqVL1jpCIORrzApKLpCJwW/qwbJBKCk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NVl4q2cG/6nmZJHICiRZLpdFNeX7kqLwDIVtYQVXfULY7/sy55XZ0KlKiSY8btAkIZS9xeWDpjKhLG8GFvzJsJN2cxh3Sm3pkvTd4oSdh2k39eWQCIYWjzbHMISgCbXBXs1E/pcJDldBeA2U5ZTro0aLLKDaMHG2vI/btMks1zQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qt+3Z37C; arc=fail smtp.client-ip=52.101.57.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qt+3Z37C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qfwR1JKdRc6JYvG2OHX7vQ1ERYy4yYEMtYSoeXc/EC7Z43s1E4hKuQc0CCo0+ewj59nYh74pXusA0lGtAzRzuoZa3x1OUJIYCS3ilB2P5ONmzhT7N+qm9NzEj/BS3/ZUqHzQMqCATIRQavOOuGXl6tkF4y00BRhwzDAHcy1JXSjL+fFDfniFGAfmK2de5p8ZOd0hTC5XWn+H+OiT6V3Qofk1qsLVSdplAIRCk0xJYElp3rq/EE1FtLAoBa0DFWBTdPF1yXSAUzSlYpQM+c03rSj1IR0mCvQdchVSYA8H1+k0jihlOMwPPbuzCaKkBBOdulvgELE0JHWjwRqLK/MT8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=872lTukkj6zo7SeBRyLX8mk9nlBIJwbjM4OwTOlIV1A=;
 b=k//ITr/OJpaxjE1CWEhlw8vO4uDK7XwQwqYy2gDk0shB7iJTi3e6M5vlYz0sZcnB/7kKgIXggsMPe1WA1fGBwkHpnz3W2ocnnpbVxhVrZ/gt7bfZxUhTGhlQdFot4IoXAbTK1DIITweYso+Tkq+rw6lx3eULiiUQm+A+fTlZQQlNJ/iT/p2j4pFnGVqRZo6GeNgwppnmhuaTAOfuxT8TLBr0+duWXF1YFhAEM9bZ6gkve2YOKmBQSz/0Swok3Gxf/WZd4lZrahmy6NwCdpjTmCRWujOc7JGipDP60gyZH6wPMc+aJxhwzgpqs9iY1a+dYUcnAd/ftPVJ9a4MPccXZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=872lTukkj6zo7SeBRyLX8mk9nlBIJwbjM4OwTOlIV1A=;
 b=qt+3Z37CZg+re/KN/9mokwZgpx1PBJagZ5XMjX4vFn82B+0LD/LPOtH550q5TX2MWmAMrVcUkXNBQBEoN4qvMzFOAks/OQwI40YggEFgGFWoLpNStdyejtaQSJ76DLTV6SWI0nEFl62cjCHNrOFI9RF3i6NQitaToKnIz+njauL/Xq99o/MtrMiz9+tRxi1YVqaHOH0vWh82Uylq3qKwCaoY0fQ7WeWSzkeV10u8ezl9E1oBBul7RDO4p7BB/bIV5aL80syaOQc/ojYfYBltfUfHnlwsi8AQ/HLBsdO/omsaZrpkw4o64PXnUFNAMT8X77hM/Wl3RSCVcwXyxjlyCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BN9PR12MB5179.namprd12.prod.outlook.com (2603:10b6:408:11c::18)
 by CY8PR12MB7587.namprd12.prod.outlook.com (2603:10b6:930:9a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 09:25:42 +0000
Received: from BN9PR12MB5179.namprd12.prod.outlook.com
 ([fe80::cf08:f59b:d016:c95f]) by BN9PR12MB5179.namprd12.prod.outlook.com
 ([fe80::cf08:f59b:d016:c95f%4]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 09:25:41 +0000
Message-ID: <ef3185ce-6a6f-4234-96a3-383480ba8216@nvidia.com>
Date: Fri, 29 May 2026 14:55:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] memory: tegra: add multi-socket support to the memory
 interconnect
To: Thierry Reding <thierry.reding@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: treding@nvidia.com, jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, bbasu@nvidia.com, sumitg@nvidia.com
References: <20260521140546.3023819-1-sumitg@nvidia.com>
 <2caba07a-511e-453c-8e1e-f2b07b84a096@kernel.org>
 <58ae92f3-3e6d-4f60-970e-76ee4d7dbd4e@nvidia.com>
 <2ba14e8a-1664-48fe-ba99-c81100de78f4@kernel.org> <ahgr7EevWJ-unfSV@orome>
 <ad3c49f1-044f-445c-a586-675252f157ae@kernel.org> <ahg5_Lm51AcfkQm_@orome>
Content-Language: en-US
From: Sumit Gupta <sumitg@nvidia.com>
In-Reply-To: <ahg5_Lm51AcfkQm_@orome>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS7PR03CA0120.namprd03.prod.outlook.com
 (2603:10b6:5:3b7::35) To BN9PR12MB5179.namprd12.prod.outlook.com
 (2603:10b6:408:11c::18)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5179:EE_|CY8PR12MB7587:EE_
X-MS-Office365-Filtering-Correlation-Id: 59feb0a1-771c-4ef4-00ab-08debd6440b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|18002099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	uKpXhSkf9v7KVvyI0VWkj8mZXZ/mM5bOhj3lH46ketglJYh/jtkv8OOUV/bpWxaCAFxdNnQc1yJnTE4/80jWbEsfg+zPQwljtI0xzZGw/CHP/990qjAd9stj3WLSTlq2/gCJ7EPb66EYf77fRHJNxbGdIVofiVHNnn1IA+QUvAThwn6t+oE7lBboK1dm6wxqRHi2U6CvpnChL860zGiSzt1oBERVKNHVhegLPbMCCX6VnLuYCkstsStY0GcqHIDK7zrhXWFdRSQ2dmhbOj2jsoQU4K1+tQEVyzPBY9H2Tr2WPcSLII8NvGDdYFilMVUM9oJgl+Pzi5stNyIIy6GBQyOLeVQL/27YIOoaCW7bCYjnwbTtqoNzJ5wrBOZ2kdux6IioRRGDLeEx34pMXcf8UKCNaLzw/WBp9eZDp1gs5zDRQ4raZH/BiidzHygmacMBlOX6sV+ARPVJ94xV8DRfacJ7ZS4k+1Vv974CKOVSNCG7QHAcx8fF398nCFRzMoxu3d/WuDsRhLW3+nj7fSA5r6PELENrHi2DpJxTwRKCg3uBc/j2UuK1nR0ctICyAioAkguPbkRMLuO1kIUt406/ghU6ot28zOYCACQw0UKmQxW9qNDPLzb1Fvad6yGtVU10FUGm9R760q+KVG7hPP5G9ldY7kxz+vZIDNLYkSFpx6gp5/UhzT9PL8sbxUGOLkfHncGv7Ng8uD8CYnXcrPP7lA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5179.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUE5cy83RENINlREaVlCV0RXbHQ3K2JubGQrb0tFMEppN1BmR2g0aVZ6aC8z?=
 =?utf-8?B?eUM2aUU3dmlUazE0dkhEbUFNMGMya0twSlpGbGFXZWdZam9RZS9wdkVxVzJ6?=
 =?utf-8?B?ZHlTbks2UnlqNEoxdFFiOWRvTEpvUFNNbStPblhlL1hraVE5NVdBcTBiQ3Fr?=
 =?utf-8?B?NFpRSmh5RFh2VURNUDU3WUE5OVJWdzJVSWxSMjF0enlmUnI0ZTk0dlpMVUJF?=
 =?utf-8?B?Qm5iTFNWcmJjenA0b1djYnFTZWtCYzNNSE8rWXBGRStKS3JWYjhNb1UydjFD?=
 =?utf-8?B?TktLajdNbEphWlJadldTQXhUTHBGQ2pQZ0tnakhVWWJlYjZYL1k5SDhxT0pz?=
 =?utf-8?B?c1FXT3dzNzlSNjNVMnFxQkdOdmJHUVBueW1wbURDNVpDbkVPRWxvWERNdXZl?=
 =?utf-8?B?TlVvS3VpTERFSEJBQXFCTHJGRFRlRGRkV25OSVA1UUhiOWVjOEplOHdVT05y?=
 =?utf-8?B?QmJaUzVlL0ZQeXgyMnd5KzRWZEZLd2o0N2dVSmE5U05XMDEySFpka2dFeEV2?=
 =?utf-8?B?dWliNVFNd1R1UEdjcFV0YmRjWlQrUUU2Z1hKUEdPdWhiN29JUjAvSVdLQlgx?=
 =?utf-8?B?ZUc1a3c1MUpXZ1FmNzladlNuMmF4L1NwQXZNNlFXMlRhckh1eFpmRks1Ykl6?=
 =?utf-8?B?TTAvNEIvMDJlVHNkOXdMVFg1S0dLdUFsV3BFTS90bHZtQy9UWGlUbEYrOWQz?=
 =?utf-8?B?eWZadUI2WThxdlYraVNGUVVsZ3R0S1pINnkvcVZjSGp4RkwyZ0VEZEFhV3N6?=
 =?utf-8?B?cWRLSHBZNFV4anYrVzJGV2FOVVFhLzdPbWJ3T3JXRDRHcmh3Y2g5V0diZmdW?=
 =?utf-8?B?UXNkc3o3RzlsYzBNS0hnaFNFNHhTKzNlZE9DMnBLZ1JaZHoyclR6ZW1OQ1ZT?=
 =?utf-8?B?ZTd0SUx4eHJDc21vQi9CUDFoSlF2YmduK3pnaGkxSjNOQWlySjNKRlNuZ3gy?=
 =?utf-8?B?ZFBWb1ZYNXh2L1BMckJwTythUXFHNGhMYWxBVmliTENUM0x2eXJQMGxERVdC?=
 =?utf-8?B?eTBtVFZFM3c4SVYycHZndG5CM056KytIeGQrT3NUR25YNW1ydDJtdFQ0QWdl?=
 =?utf-8?B?T1Y1Sm9Dbnl0c3lxVGJ4cHA3YjhaUG90V2dnenVCblRnaEI4QXU3NW1NWGxW?=
 =?utf-8?B?M1AwT05iQkNha3RQR012QXlPUkc5QmZsYmtiWWdTWklSWllyY29SaW5wNWcx?=
 =?utf-8?B?MnNPaWNRSEo1UCtrSFVTRWhycS9zWktiZlRWOExYMjJVQ1pBbWRKcGdmem5I?=
 =?utf-8?B?bGRLZGs0MUdJbHdkTENlYXlxWUllMUVBOG1rV2hZV3BSQlZtMDhqOTNFeVdh?=
 =?utf-8?B?K0hnSStTaU9FUGprQlJvWDB0SGR1NWJkUk5rU1craTFwLzVTTGJycGZONDYz?=
 =?utf-8?B?K2tCM1ZRS1d3a2Y5ZDFlaXk5RU54T3hqd2lveXFEL0ZsWXlsV3EzczlRS0o4?=
 =?utf-8?B?ZUgzQWFaNGpPK20zOTEzOG1FUjZ0QXV1cmxRSEpUem9TL1paMkNQWWpSQkpw?=
 =?utf-8?B?STVjZDV3Z0JYNWoyZEF6SDJzWEl3TlgxdEE2N3hEYXExc1FpU3VFZzFRR0lk?=
 =?utf-8?B?a3c4eVFNdEYyK2JyWlBteHVRSENmZlB2R08zMXBhZUF3dFVRU1ZhTW9mQjc1?=
 =?utf-8?B?cE9ENlVrdzRlUnlDVWdqU2Z6c0psTlBXd1VQU2h4OXUrRVR0T0VmT3lRV3Ur?=
 =?utf-8?B?NUR1WjBGOEt4Y05ZWE9OcENtZUd4YzdwRlJ3a3c0eE12RmZrNVZXYzg5M2dy?=
 =?utf-8?B?cENheXdRNDJhRzFtdXd5OGRvbGlCaEhWdHNmSFBoSGRjVEgzZ01zMmRQTHQ1?=
 =?utf-8?B?bFJDQjVkbDRrRjNTN3FWRERjRExVdmVtSXZldmNrNVgzdlNXM1poNDVSZWZo?=
 =?utf-8?B?MExmalNpNy9zakRKc0ZqUWVEK3htYm5qb3JXNmpwYkxTUnNwSDJEN205SjFR?=
 =?utf-8?B?dFQ4cjRwV2VwYlFlejNBOVFIOHNzdnVueHVBL2RPUmFQa3M3UnRkbXQwZkx2?=
 =?utf-8?B?R2dDV3pIM01vSVlPTUxjdTBDTlduNkZzcUl2M1JsbXF5aUNhblpKeGFlb0Rh?=
 =?utf-8?B?STlCSW5LS01lV294a3FHVHpOYWJUVGkvN3pGbEFrRURML0IxaVZVSDErNTIx?=
 =?utf-8?B?M2M3ZkZ6SEx0bjA0bm9sUVZWMEIvRlR2bnlpUU1vRGt5ZGZKYm9lVjBZeS9H?=
 =?utf-8?B?RkEvN245Y24yeFBuNkVvQnBmdWszb3NvQTJvNldWK2JVZUJuaDZPdkxiU2kz?=
 =?utf-8?B?VUE1Z09lalRLLzdoZEw3OVg3SCtnTDZsZ2hKS0x2WEpjS2pqNzRvb2NwZmIz?=
 =?utf-8?B?V2JnVjVYT0hEUXM4dnVhV1JRdE9WNlBoWUE0NkhVMjJSOGNiRGpqZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59feb0a1-771c-4ef4-00ab-08debd6440b0
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5179.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 09:25:41.8634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tuNy/AvXLSQG/HPMvGZjRfsC2sXqy7HiGciLJkvIdf/kMsirrAWwxi2KLTCA0Sbaasz8cWxAzvfSa/cJsXw2MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7587


On 28/05/26 18:35, Thierry Reding wrote:
> On Thu, May 28, 2026 at 02:20:07PM +0200, Krzysztof Kozlowski wrote:
>> On 28/05/2026 13:56, Thierry Reding wrote:
>>>>>>> -     mc->debugfs.root = debugfs_create_dir("mc", NULL);
>>>>>>> +     if (!mc_debugfs_root)
>>>>>> That's a probe path and you created a singletone. Looks like preventing
>>>>>> async probing for no real reason.
>>>>>>
>>>>>> I am very against singletons and debugfs does not look like justified
>>>>>> exception.
>>>>> The singleton was added so multi-socket MC/EMC instances could
>>>>> share a "mc"/"emc" parent. I'll drop it in v2.
>>>>>
>>>>> On single-socket SoCs, the "mc"/"emc" names will be unchanged.
>>>>> On multi-socket SoCs, each instance will create a top-level debugfs
>>>>> dir named with dev_name(). Same pattern in tegra186-emc.c.
>>>>>
>>>>>     if (dev_to_node(mc->dev) == NUMA_NO_NODE)
>>>>>         mc->debugfs.root = debugfs_create_dir("mc", NULL);
>>>>>     else
>>>>>         mc->debugfs.root = debugfs_create_dir(dev_name(mc->dev), NULL);
>>>> You assume this is fully synced, so you as well could do a look up and
>>>> then use what you found or create new dir. If you think that is racy, so
>>>> is this approach... How are other drivers handling per-device debugfs
>>>> directories? Do they also create such in the top-level? I think no.
>>> I think we want a top-level directory for a bit more structure in
>>> debugfs. But I also think we want to create that top-level directory in
>>> the module's init function rather than _probe.
>> I was thinking about this as well but that would mean your driver will
>> create it on every multi-arch kernel.
>>
>> This should be then moved to some core bus (and there are examples of
>> that, e.g. USB), except there is no core-MC bus code to do that.
> We have a utility function (soc_is_tegra()) that we've used in similar
> situations in the past. We haven't used them in a little while, but it
> could be useful here. It's not for free, but should be fairly quick to
> error out early on multi-arch kernels.
>
> Thierry

soc_is_tegra()'s match table currently has entries up to Tegra210
(seems only used by a legacy 32-bit ARM path), so it would skip
the SoCs this patch targets (Tegra186+).
Could we follow tegra_init_soc() in fuse-tegra.c. Only create the
"mc"/"emc" parent at module init when a matching DT node is present:

     static int __init tegra_mc_init(void)
     {
         struct device_node *np;

         np = of_find_matching_node(NULL, tegra_mc_of_match);
         if (np) {
             tegra_mc_debugfs_root = debugfs_create_dir("mc", NULL);
             of_node_put(np);
         }

         return platform_driver_register(&tegra_mc_driver);
     }
     arch_initcall(tegra_mc_init);

Each probe just creates its per-device child under that parent
without touching any shared state. Same in tegra186-emc.c.
Or would you prefer a different approach, e.g. extending the
soc_is_tegra() match table for arm64 SoCs, before I respin?

Thank you,
Sumit Gupta



