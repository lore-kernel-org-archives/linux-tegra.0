Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010062.outbound.protection.outlook.com [52.101.201.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9553B995E;
	Tue,  2 Jun 2026 11:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780400989; cv=fail; b=KbQ8l9RKLpFVegZqbqaAZ6LyZHDLCxeqi7ShGMq0UjLKXV+drNTxoFmdd+yEIkWe6/boX0lFHC1pj4lvyTvwYEhRAiB3l5ZuFla2PvlyEAZsf3TVPZyKQpv0h9cPIEJ23cLxZ9CxlUttJQEcnUYCi4t9Wc+/KfdVHIHGpKNjfio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780400989; c=relaxed/simple;
	bh=WTSxCobOsA1MwbB0s0+JVhM0ZW2e/EdRloynMb5EkwQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bdHFS6VWtTylzeqmrErwGuJaBMMNYqLjtqH4vsP01tdJECM8GEpPAaN0yo3ga5CIRiq3f+XcHhTPC6jmWjvkN5PLdzdfEFu37oL5imMgQapy5Z4CLKhbd6lKyrJRo+OFCRhDdHYiM1Pm9xerk8T/DcoNZCgeM2crSZWjgcYb+W4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=agkJym7J; arc=fail smtp.client-ip=52.101.201.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="agkJym7J"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JudbZ6jpkrhuDUU1ojFoYTHjqAFxcA2JuDfs5V5cUR5rcLiKlkbQow2ndTJ4sJOIJSR8fnmamQbgzjXMijN69SNJ86fz8vzBaUPqcpc/qz+kEX3zhnuVshaXW2DssaJMM66xUrK7OFPu0/ikal8+iccxfRnO5KdjANnLkgRoBTq3nDrOGrGH3kwVnX3ZlavcUYRlCVk/VTeiDLJdrXgqm7+jK1AxQMjq/O7SE16gnCS+cO9qDA+qBiVjgN0tA1JI12f1bc2WsYdupkTl+viW+0ZtwuAkTsi79+qzI+2jqO+yZ+Ut+miQkGFiXHzDPPnbkATmTkHyZ4/w84V6TncMKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=17hH3Q6VmnHuuFHR1co4nZLOtXX3NN0o2IyNgmF6fdc=;
 b=YnYXJFcPZnKqEIRdH4q00O9den6zVn0KF61Ej/zH4eIlCP8sXFjnJo620+lozTdZYnxserGFdLQt+yumw6EVF8/5p+gnRqI0VBUQtYpEJYA0vKm3kNfdt/Ay2ndQcSqr1ok7PzWFSVPxwoZPU7c7mFeqrDZFWj+Q76lG0TgdkG/3rascrZPvUtJq1ZSX6/7cDXSA70IftJHWeC3QxZUDD0Nvttv/loaCorPTM56aYwKCFsG77v//M67rOhf6wG0Q7yRroZ2hH8j7JA4zp/CZgNsWsw9GPvXeULMNAa/Gl8eWbsI27HMC+s8oRPxlpRTgJHvCJVdfzuIW92Sl3vgPvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=17hH3Q6VmnHuuFHR1co4nZLOtXX3NN0o2IyNgmF6fdc=;
 b=agkJym7JTK1zkp3dK/U17xnlNKTEzeO7TaYhGDFE2f5T/QBgV+u8nY86Z64Cso4554oxSccsGP6JnCrbl0C2sS9OU+ACSiZ+aldp9dkjSvKPPWS67z7l/IkfAZNjyLzHxJUjkm899/z0ADMpSRiSXXmbBiEJc84iRPCIIpFxhba9HVmKcmsp7+V6hlKnrOxQBTxwkafbUBJ2V5lwJ9VYGSRf5K14k/294lRqd4m0N9tGnrgc2dDmPVZ6nlAdbY9GefW5jHjNVUQaqPSlJvoaeII3ydhlX6U5uIRBKHzDpZdWZqppQpJ+DaSpbZmJQ47x5p3kLKKiURh38W3DPdLYOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BN9PR12MB5179.namprd12.prod.outlook.com (2603:10b6:408:11c::18)
 by LV3PR12MB9411.namprd12.prod.outlook.com (2603:10b6:408:215::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 11:49:42 +0000
Received: from BN9PR12MB5179.namprd12.prod.outlook.com
 ([fe80::cf08:f59b:d016:c95f]) by BN9PR12MB5179.namprd12.prod.outlook.com
 ([fe80::cf08:f59b:d016:c95f%4]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 11:49:41 +0000
Message-ID: <7050a624-96be-4186-98b1-14239b3c9b87@nvidia.com>
Date: Tue, 2 Jun 2026 17:19:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] memory: tegra: add multi-socket support to the memory
 interconnect
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Thierry Reding <thierry.reding@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, treding@nvidia.com,
 jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, bbasu@nvidia.com
References: <20260521140546.3023819-1-sumitg@nvidia.com>
 <2caba07a-511e-453c-8e1e-f2b07b84a096@kernel.org>
 <58ae92f3-3e6d-4f60-970e-76ee4d7dbd4e@nvidia.com>
 <2ba14e8a-1664-48fe-ba99-c81100de78f4@kernel.org> <ahgr7EevWJ-unfSV@orome>
 <ad3c49f1-044f-445c-a586-675252f157ae@kernel.org> <ahg5_Lm51AcfkQm_@orome>
 <ef3185ce-6a6f-4234-96a3-383480ba8216@nvidia.com> <ahmuTcpUdsHYKTPu@orome>
Content-Language: en-US
From: Sumit Gupta <sumitg@nvidia.com>
In-Reply-To: <ahmuTcpUdsHYKTPu@orome>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0120.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::9) To BN9PR12MB5179.namprd12.prod.outlook.com
 (2603:10b6:408:11c::18)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5179:EE_|LV3PR12MB9411:EE_
X-MS-Office365-Filtering-Correlation-Id: e5ad33ba-9402-457a-07b2-08dec09d0837
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|6133799003|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	I5jNJpFUuEti8su+9yX+Z3yMvZlOmWxYmtmyuhMgyKM8+z3Kk0EToF4b3RkU1AnKoF2Ds5S0cJMAzA9ZthNTM0pE0wmb6/3TygFgwOAbfZMGoHeG8NlLQFosy/p0r8IKQKAYWOeGWGlqxGJw2KXNhthGyHjnr/yq9PpVwUbmUVd8D2aSirZF3BwQtJejeAAZwzlBPwSoolZuMXZfM3aSEKoHIhuR2L3rgxZfZxHa0YFgRrhCIx3t4cpWRum9PohXEpRFJYM2yGQcj2Qd782JRMNpXHD2F3wOYRosSJrDCLlhAyWIh36YooMJWE8dbMZAPflag7x8t8QyDZq4tZjW5hZS8OoQgfXYC0wyoCoS1/wVmrnUqBGKM814RcGrgjangqKVk+xjCsPET5cARq87xINdDssfrczGA7t9C+yY4LQ7ho9e5bGueMBU+WJCANfj+NigpDR6uz2iR4wGreFKfFRxvryYGIXJNvYLMZaI7bNmA48IXG3hdHPQh0odo19GQ4nb28No9JNEedxpM3iQW3nSojK3uYwGuXZK7oH8cBBiZvuVozBvXfc5EmSy6aJ8CJXGwtmDj2vhWHNagIsX5anL1FHl/3rYnJNYqArXaC4dsZJF6zV1agRh5C4IrLmVBJn7FGVlX8FAwlT9xSgVGX51ArFdKy508Jwj1Mo6DTPVAisuRap8wDcCyS/yqImU5Uvmju4SBNY+IKQGMZWfrw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5179.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmZMTGQ5TXRubE1kenpKRUVPV1hCTzAwUkZqdlN2NTJvdmtZUjNENXFBOWY5?=
 =?utf-8?B?aEN6NU5MVmtZY1BBV1U4WWdZL1VUU1NSYzlBVjZ4eDdFZHFyYUVsekNPMW84?=
 =?utf-8?B?Y3A0WFc2L2hQYTltY3J1akNpdms4OFdZMlcyc3l2NGEwcHFFR1BwaGgrbitN?=
 =?utf-8?B?eDU0SjVJT2hydDNEZU5uWUJlS0hsZHhsUlFYUndYWXhrOCtpMThvRDRmanlN?=
 =?utf-8?B?Q0dSTlF3THpGQ3dLdUE0OUhkNkxxK1lDSFVYdTg4MjVNTXU3amhvQkx3V3pj?=
 =?utf-8?B?NnRNdnZybjFCMDYrNjdXUGdNTVJQOVpYeXdEZk9pT2psU3E2S2dOUEFHTytP?=
 =?utf-8?B?aVFxcFZYV0hqNVFlRXNFdUd4MHR5L3QreGNXVm1QbWlkbTFuaUFkMlhDaVlC?=
 =?utf-8?B?RmZNYllIclphUGdmdnZmTlluaWdEUGpieUZYWVZxN0tiK1hrSUp6Mk55a0ZT?=
 =?utf-8?B?aExSdXJKeGZic2kwbThrY1JuN1pLQmlUeHBPVWdHU2VjNWZZclJ6ZTJWWmx0?=
 =?utf-8?B?Q3UvajBYS2NUdkx5M0xYWlRmajg3VFVsc0NXaEZDL2lDOSs5dHk5U1FPRXZr?=
 =?utf-8?B?NElieU1SeEFvVHE4bjhsZ3k3TlVDZVNkdnBCOE53RU9Nalg2ZU1SellYNC9r?=
 =?utf-8?B?bXpnbXRpODhyWER4SjRJVmNIZFR0Y1Fxd2V2d3hoVmZmZGFOZGNuazgrb3dY?=
 =?utf-8?B?cXJqdmZNM1pHWllRTHo3b3ZvaU5ncWxuS2pzM2JBeXB2Q3Jlc3QzRVJidUov?=
 =?utf-8?B?ZHZPZmlnelJIMTdybXJCZHEzaHZNV0w4WDQrTERhREVxalNyT1J3d2NONUY4?=
 =?utf-8?B?M0NFWWtYb3o3ZUg2VXlkYWRxUTBIc2E4U3Z5NUtmWG9jbGllMmovTGZsV0N1?=
 =?utf-8?B?ZTFWWkw2YWF1RVZXeERiN1NrNytBVVgrTUZlZUhXVWFlUHR6VEV0YWZaMmtr?=
 =?utf-8?B?aHZOempuZFNiNGRIWnVGdlBHNU9YV0pZMmlobDBaeG5uUVJGanZkY1pKUlRM?=
 =?utf-8?B?a1U2YVhJYUxtY2ZyUnRCNHpkUzdGZkdkdG1WQ1ZXZFYydjkvWngyR21ZeDZB?=
 =?utf-8?B?K3BGaWxNT1M5ZUlzbE13WWlRM2p5NFFmaTNqSktmS3pjTkZBTFlGYnMxWFRP?=
 =?utf-8?B?UXBLZG1rc1VKSnBmdDNLMWFRalF1a0pJUXA2dmFwVUJjTkFzR01yekpjdVAv?=
 =?utf-8?B?NE1pMGtyR0VaaDNma2RZbWp6NmRHRlhyZnlyRG5FMG5oN2I5NEc3dm5KK0Vk?=
 =?utf-8?B?V0ZrNklGcndKUEk0OEdHVnQvZzM3V3NiSTczeUdSaTRLNWNVVnc0cE52cmdM?=
 =?utf-8?B?NUNjRlJiSVVRRmZIRGJKeHJhN1pYSko0UVJzUjRXeGN6b1dtaXd3QWIrTXNN?=
 =?utf-8?B?Tm9hSzBSdkMzcDZmTmhPR2poWUg3YzNyM2dkblZaWGh6SUlPMVBVL05ZTDFR?=
 =?utf-8?B?QWlRK1lDa2VYS0JVMTdBNk9CUCtjNWtzbWhQTWtyTDZZNHpleTdMaE9RenBX?=
 =?utf-8?B?V1JYT2JlVGFyZk5LSXlYdnJvYmk4QklFMkIvbENBOTFjR2pkYkZ6byt6VTRy?=
 =?utf-8?B?WnduZVZ5cXkxVGNDaFptaXhoSjJIT3VuODF2eCtlaGVRMnpQeCs2dnBEb0JY?=
 =?utf-8?B?cmhveUt5Y0lDdXNWUFhlVGhCWnRseG03Ykk0WThaUU1YTkZJTUVKNEdnU2Fm?=
 =?utf-8?B?WEJ3eWxOdWlyWXh6UnZlWW1tQVRBUWZETTFHSUFtTVNqQVEyQUpKemFvcnZE?=
 =?utf-8?B?emJUZU1tTTZGYldzbm1IaDZiM1pZcytDckF0NTJVUFdOcXpnSkxEZVYzMCs1?=
 =?utf-8?B?K0lxTm1DTlNBZlFEZTM2QSt4TjJtNW9wbW9adzhtbnJpUlV5UmpibVlCaEJC?=
 =?utf-8?B?M29oMnRsWnBYbi9SRmhNcnJzMVlTeFZFUjJsbEZkaUc5ajF0T3BrMHhTOGFp?=
 =?utf-8?B?NE8yUDJpWUl5S1YyL3JBdHRaT0MzMTBwOEhSd3I2d05jSzZzL1VnM2kvRzdC?=
 =?utf-8?B?Q0RJUDdOLy9JZjUwOG5WRVVPZUpGdm00dzhtZFE2R0o4dTdJRTMxUTlCRWpM?=
 =?utf-8?B?MlY4SmdzNDZOb09sV3Uzd29GT3FEdXpWVUFWa3NieUhVTWNXWnVDYXNrMUtk?=
 =?utf-8?B?b2x1ZGdHbjlkNzBPcVp1S3d1R1dOSCtsakQyVDNZM1E0UEM3NmdPcU9VdzdS?=
 =?utf-8?B?VUJjeHU3VmIxQVdiOG4yQWNZYUNGR3hGdmg3ZW5Qb2NkcEc3VWkrMXUwRzdG?=
 =?utf-8?B?R3NFOXE1V284SlRxNDNMMkFidWtzOHdBT0ViRjZ3MjFUVWFpZGovZ2FoY0xD?=
 =?utf-8?B?QjVwZVpsVlM3V2JHaVVtMXZCY1dKdE9zbVMyNEJ2WHRWVGw3OVlIQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5ad33ba-9402-457a-07b2-08dec09d0837
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5179.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 11:49:41.8039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kd11Dn64/FyeRwBxz5u7iEaMKPZN2NGul70qsN2ih0dlv+P6xeYg6x0y/mnGyAE08l9I/UvZ/fs4TQrXmm3b2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9411


On 29/05/26 20:53, Thierry Reding wrote:
> On Fri, May 29, 2026 at 02:55:35PM +0530, Sumit Gupta wrote:
>> On 28/05/26 18:35, Thierry Reding wrote:
>>> On Thu, May 28, 2026 at 02:20:07PM +0200, Krzysztof Kozlowski wrote:
>>>> On 28/05/2026 13:56, Thierry Reding wrote:
>>>>>>>>> -     mc->debugfs.root = debugfs_create_dir("mc", NULL);
>>>>>>>>> +     if (!mc_debugfs_root)
>>>>>>>> That's a probe path and you created a singletone. Looks like preventing
>>>>>>>> async probing for no real reason.
>>>>>>>>
>>>>>>>> I am very against singletons and debugfs does not look like justified
>>>>>>>> exception.
>>>>>>> The singleton was added so multi-socket MC/EMC instances could
>>>>>>> share a "mc"/"emc" parent. I'll drop it in v2.
>>>>>>>
>>>>>>> On single-socket SoCs, the "mc"/"emc" names will be unchanged.
>>>>>>> On multi-socket SoCs, each instance will create a top-level debugfs
>>>>>>> dir named with dev_name(). Same pattern in tegra186-emc.c.
>>>>>>>
>>>>>>>      if (dev_to_node(mc->dev) == NUMA_NO_NODE)
>>>>>>>          mc->debugfs.root = debugfs_create_dir("mc", NULL);
>>>>>>>      else
>>>>>>>          mc->debugfs.root = debugfs_create_dir(dev_name(mc->dev), NULL);
>>>>>> You assume this is fully synced, so you as well could do a look up and
>>>>>> then use what you found or create new dir. If you think that is racy, so
>>>>>> is this approach... How are other drivers handling per-device debugfs
>>>>>> directories? Do they also create such in the top-level? I think no.
>>>>> I think we want a top-level directory for a bit more structure in
>>>>> debugfs. But I also think we want to create that top-level directory in
>>>>> the module's init function rather than _probe.
>>>> I was thinking about this as well but that would mean your driver will
>>>> create it on every multi-arch kernel.
>>>>
>>>> This should be then moved to some core bus (and there are examples of
>>>> that, e.g. USB), except there is no core-MC bus code to do that.
>>> We have a utility function (soc_is_tegra()) that we've used in similar
>>> situations in the past. We haven't used them in a little while, but it
>>> could be useful here. It's not for free, but should be fairly quick to
>>> error out early on multi-arch kernels.
>>>
>>> Thierry
>> soc_is_tegra()'s match table currently has entries up to Tegra210
>> (seems only used by a legacy 32-bit ARM path), so it would skip
>> the SoCs this patch targets (Tegra186+).
>> Could we follow tegra_init_soc() in fuse-tegra.c. Only create the
>> "mc"/"emc" parent at module init when a matching DT node is present:
>>
>>      static int __init tegra_mc_init(void)
>>      {
>>          struct device_node *np;
>>
>>          np = of_find_matching_node(NULL, tegra_mc_of_match);
>>          if (np) {
>>              tegra_mc_debugfs_root = debugfs_create_dir("mc", NULL);
>>              of_node_put(np);
>>          }
>>
>>          return platform_driver_register(&tegra_mc_driver);
>>      }
>>      arch_initcall(tegra_mc_init);
>>
>> Each probe just creates its per-device child under that parent
>> without touching any shared state. Same in tegra186-emc.c.
>> Or would you prefer a different approach, e.g. extending the
>> soc_is_tegra() match table for arm64 SoCs, before I respin?
> of_find_matching_node() has the big downside that it scans the entire
> device tree to find matching nodes, which can be quite expensive. The
> soc_is_tegra() helper uses of_machine_device_match() which only checks
> the compatible string on the root node and therefore is much faster.

Good point. Will skip that approach.

>
> Jon is working on a different solution for a similar case for BPMP, so
> maybe we can also look at doing something similar for MC. It's a bit
> involved because it adds an extra mutex to make sure we don't end up
> racing the creation of the parent directory, but it has the advantage
> that it's only ever triggered when really needed and doesn't need any
> "tricks" like soc_is_tegra().

Sure, will do a similar change as Jon's v3 [1] for debugfs.
[1] 
https://lore.kernel.org/linux-tegra/20260529173337.155722-2-jonathanh@nvidia.com/

>
> I wonder if maybe a helper could be extracted from that to make this a
> bit easier to replicate elsewhere.
>
> Thierry

Will do it as a follow up if we have more users.

Thank you,
Sumit Gupta



