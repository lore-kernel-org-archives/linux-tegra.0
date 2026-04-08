Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012012.outbound.protection.outlook.com [52.101.43.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEFA3815E6;
	Wed,  8 Apr 2026 13:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775653506; cv=fail; b=MRAwdJctDUloLiDBBDNB/LrFU9FEMK2JT5bVrO4SnZuB3R31p2ILssg9+o8WJWpO5jvEWKRwuP6GdkywI+Uhdr+dO6qGj/AOHhURopUxjaySfIGpbP8Yfb1i7lxs60sHj6ibgXoybbHBLTs4WqK6xW4EGS9J/KpapixWlEkE8H4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775653506; c=relaxed/simple;
	bh=zK3J8p030+Z76EJNjTcSGL54VWWfNMGv0hL5QJwc1gQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PKJEsfhfpwvBOFU9ozAr2Na5IalHcqzr3F+/VJC3shdRoH8zy4JvRCuT/EkDKjRQPI7dH4t39o35FRhU6PlOep14wiDQKcAQtjn9n21iK2mY3BUC490U4USJEa5hXvq+fbG7TzRirOQlhLHm6es6wXFJh5Y6tncNSdJCQyiSvm0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dpqQbrZY; arc=fail smtp.client-ip=52.101.43.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dpqQbrZY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ngjXcDK4/lR7/zLfXNn5QdYsFNeLRuCHOQAWpPAZvTJSeDD1s00gzHTjwPYoyDbtIkpupx3SR0/UvOHr3ompKG7tKdd6mZrDEUb8iG39rnnHjTIK3X4qRO+TBEtFdJTmK2h6BVqcnrFK9+CVv+irmeiyGuVb+LaHKvOJ3cZkTA9B/R7KmT4IAfLwlwb2MnuDukrf1oIntdj0odInBIEtFK2+wkc+EHLuNph5Og0JV9YxzMrS0sMH0hbOpRqLaWdlHnuk3d3SiucS3ddSBMeJcix31dz4WQ2ZjYLzV9M7RUIsl3QzgCBcfC9yq0KBpn9juxjymkKdwxc1F4LLd4eaEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ShGTk7jPFHUcUkfZ1NwAbbIGcepiNFUy8h8ZRik3lc=;
 b=T8M0QsO9qJucJfBCbuFxgWo6rwg70lyxDJhKxLYjW/l39NgIcmD5K6FpjmqCUq5UXUzPc3Y6lMBHBQi4nxVVkSDNlta6zUJj80fzKmj7szXft6F6twAa0GJ5EouYx7SOom3tKWJIvz/FQK9r+M295a39NLAq/KpRRMXnTfSHkSdG0ts/pPCj+K6iRc19VdHYCGr1STh6xd1IipWuA0QvBFc9Q7G8C9CMsthhcHI267qPr6AtiugWJUnquXnV0/zAj6wtLvLMaaX80Pa128iKdPKi0h78vnrM9iDH3OzOvtdjE2yaoNp1YhmJhD6kis5nPs5m6632MbB1ow5k3Nt7rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ShGTk7jPFHUcUkfZ1NwAbbIGcepiNFUy8h8ZRik3lc=;
 b=dpqQbrZYiYYaA+boRfDzblxJmopU9FM0jYKgofbUue1XZgr5J0rqSGyfCkZG0sIg3A/FtNzwNWG70zDD660Dsw6gXOlzdGZQud7cJTeq9+Fr3AFuRTbxU7+tyj20PH+Z46q7ifed+vE8H1JXWGJCl45M4CML/+sEVxEvGHxpiks5cndrsottTcP3lO8N6iZIV3rb+PTvQ/WqZeRhHbxDzaJCI7G3fL5UegChmKWMivJ6hNTYuXXpDv6k2g1XjYXLT/JnIlxMHq48TBxkUvuQVMiqsffGcXH3feA6wpF/sm22ryCTTe3w1ehe+jb6S6RRx8V82kgnRsUwbnkyBvPUmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by PH7PR12MB8778.namprd12.prod.outlook.com (2603:10b6:510:26b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 8 Apr
 2026 13:04:59 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9769.016; Wed, 8 Apr 2026
 13:04:59 +0000
Message-ID: <e7e4ea66-49cc-4996-a638-25f6cb08a42d@nvidia.com>
Date: Wed, 8 Apr 2026 14:04:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] slab: support memoryless nodes with sheaves
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 Ming Lei <ming.lei@redhat.com>
Cc: Harry Yoo <harry.yoo@oracle.com>, Hao Li <hao.li@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter
 <cl@gentwo.org>, David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20260311-b4-slab-memoryless-barns-v1-0-70ab850be4ce@kernel.org>
 <abE6uqdzMUv8k0mU@fedora> <8ab58ecb-1fc1-42a1-b67a-c3107de2ece4@kernel.org>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <8ab58ecb-1fc1-42a1-b67a-c3107de2ece4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0097.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::16) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|PH7PR12MB8778:EE_
X-MS-Office365-Filtering-Correlation-Id: e048d609-b813-425a-5e85-08de956f7075
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|10070799003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	B+GYXTwZZ4N5Ak8iXspirEhd9BgStzI2IUWrvsk/KWP5uylJZYkGz0aM/YLqzLdstZge/879fTCgkkTJgHZfDuZOfluI1XLFmlYrklrETe/Yb+1lWOlSrZC0WwtASbow07FJxpSGlGFJmrrlrMSeqmWUIG9sgBnnb5NDhbkpEXCQB2u4jXw9a2GBmgBc/92lz9BtcgLfpZoTkGJ1tsZCn7oCtGYi7z7HIX+Wm5Ov9tuNo+w5KRNofy/jTzZ3FAHiTdbiftn+nVCm4Aw0B3gKHyB2q6SL/uulGU0i5a5ODgBTyXa/C29mU6v4uSmv+GjvLstg5vJPgBeWOjbi5/SXneexDnRfZCEw5fh86J2WiHaO6YYW4oyWUNXdFfKNOkZbZK3g3/kA8WS0FuTADaHU/zv6chKgmkGUs4r6RHO6KchoKHpZdryjDTwSkI0xcEKbkj48q8Ah+YRWL3Tz8jShkuSn+sPvTV5/ySDuD2m6bU6J31bej0/oHpCHHGp6DsuFY8amilS3ZY4pkOmpFLjs4VtYlQDdG179qYxGi8L+V7M3q9305dX2MXIeQI3UyN3sHCBOwTlNXCufLR7l2TJ+0ikyFro0JKXBgnXAenFYeAwk8eEwK9qCW2B9oSwM1quCJGn3Mta1nXkB3ARQrUnPhuhN975vGCacr3mnetUgyCNBMqB9LHNuVH6Eq1KyuLQGsjj9CeTSdvqJcyYXGrZ84zMasAJFgcu/yJn1qVb7K/cdjreSSdxMYktK/r95X4ar
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTU4dEpVbGFjdUFwaTN6Qk1ZaGFLSXVOemxjMk4rWEFTU0lOV2hoRlNjUDR0?=
 =?utf-8?B?WFdSaElwOEVTaU9FL0kyU0lYRGhqUkdMeWMzOXVJMW9LaS9YYk5wR2VOdTVT?=
 =?utf-8?B?Vk9XSlJEUzlVQ3RlbEFnOTY0Sm1nc3ZHTUxXalJsZ3BLeHFKQUZUTE5seVFD?=
 =?utf-8?B?YVBEWTBqTHZ2QU9zMmlBWVNZZVlEN0V6TnlQcjlsaHhkV09aZ1FLblYyUzd2?=
 =?utf-8?B?SHNaMXBCeXNlNG56b2wxdU04bm9lZ1h1Y3BGM01LQThSNHBHeko2MnFLa29H?=
 =?utf-8?B?NjBUbHV2UmxZdE5HMks1VXVHWElvZC9ab052aE1hejJPbHNsU2pFdzRVWlNI?=
 =?utf-8?B?UnQ0VkEzdnlGZ0k4RWRQRjBUekQ0MjA3K1VUcmNQbTZESXEvR1FPMkZNeFRq?=
 =?utf-8?B?ZXRGeUlFOGEvYkNmN3NjRUgrZXAwbVJzL1NXbENHL2x1Qkorb3RsUkJIWnlZ?=
 =?utf-8?B?Q3MzNy9VaVIxUHlJQktxeUZKZTI4RTFhNjhFVTgzbXlsN2JyWnZOUnV2Wnpn?=
 =?utf-8?B?VHNEUjdVMzd1dnBzcTErZjBnNTE0M1ZHbUc3Wjh6NGxsaTJaN1R3V0VPSGRv?=
 =?utf-8?B?RGZPOGNUQm90akhaUGFXY2hoLzMyeFY3OXpIWk5wRWQ3Vy9jYTdxemNBdnBv?=
 =?utf-8?B?eVNOZWxzUHd6cFFwa2hTMWkrdG14WG0zU3JiVUxRY2VEQ2wzdTh4TUxGV2NU?=
 =?utf-8?B?WjErWWc1MVFzbG0xNy80WWJ0cWd0TWlSQ2IxcTVDY3RqRlMvT0RCRzg0T0lN?=
 =?utf-8?B?R0k3d3Jvb3UyeEx3Zm9FUEJxOHFlOGE1UWVDeHo5Y2FZQUlmN2FNMDVnTWFZ?=
 =?utf-8?B?bnZmTWR3QTBNSnZYZkZCYVJXU3BPaHI1VStCV0doV0xDMEFTSVdtNk0xREJR?=
 =?utf-8?B?WmFERkFjOXFVcUkvS3dndjlvekRBK3g2bDJ4N1FOME83SWhTdlRvTnlmQllk?=
 =?utf-8?B?ZE9EK1ZZWWYzbXUyQXhTekVWbTBYc3QwSSs2b1AvaHM2cGdpZE8xa3R4SXdx?=
 =?utf-8?B?MDZ3NzFOaEY4Slg4R01YYzJkRWRzTU1nRnRweVc0Q1dMR0NkdmE2QTY1Ullh?=
 =?utf-8?B?MUN4RTdLVVFBSGcrYjBQY1crdGlHd2tzMUREeEJoVWRMczFQWm5lQjFRY2kr?=
 =?utf-8?B?Zk03V2c4Y3pqeVBaV1d5eEFRRVA2dzhXZEU5WTJzSnRPRmVLUm9iSXdXbUlQ?=
 =?utf-8?B?ci96QTVTSGhnTzFrZTUrSFdrOUVJMkczdnluSmdOdnFha0FrNERVQXptZWJZ?=
 =?utf-8?B?S0h2RDk1U3RycWtaVGxTazNMMGFKaW9HSnFMYS8zWWZoZ2tSSmYyR2lnRXda?=
 =?utf-8?B?MTkyTm5Ybkl6Q1JUa3h1dEJzSTk3TFJUb0w1TStsL1JHcDdlbkJnSzNzelJP?=
 =?utf-8?B?ZXVQYXNOa1BlaGwvOTM0RWUwa3FkdCt5Z09iUHpYZnJtajFuYkpNNkN6eEpK?=
 =?utf-8?B?V0lWODNPNkdwMEZ2MjZtUmd2RlZDZzNXNXh4YXNwdVVhTVZsdmVlVWRxQkJ6?=
 =?utf-8?B?SWxiMjRhVlBtUXo5NUZaY2o2VHVBaTFKd2tBL1hTUERwVUUrM1VBTit0S3ZC?=
 =?utf-8?B?WjNnSjIzd2lQbHNWalUrblVMQys0Q1FjUkVSbUoyOEViMWdLTERyeHVxS25D?=
 =?utf-8?B?cjRDamFlcCtSTndveU4zek5JM3doZzBYdFhmSGM5Y3czdEtNRG5pYVNnTENT?=
 =?utf-8?B?VGRuVi9JZG1yZHU1UlVCSE43a21qY2FCMWhqdTdPYndlTEpaR2dNbVlDbkE3?=
 =?utf-8?B?NEdRNG5uV09tSmdWbG5wY1FTbkUzb0puSFRVY2N5dWtrZy9wRG4wckk0MUdt?=
 =?utf-8?B?aHo2eFRIMkJVampwUXVFTVcrTzFVMkFOSnZ1RFVsVzBDRDdJZjBSRGorSkxu?=
 =?utf-8?B?SXIvbXJpZkFVaU5DdTYxOE56RDJsLzF4VksydnBOaktKMHF1d1BCV3dBd0Ey?=
 =?utf-8?B?d25HaE9JT1Jzc0E2Q2ZJSEdMWDlpd1Vtd0V5bzEzYjlVeHFYamFKT2RUdjBH?=
 =?utf-8?B?WUo5Q2FxOVArbldRcUlVcktNMDV0alFXcWdLd255aG4yTlJrZEROWWQ1OGtv?=
 =?utf-8?B?UnBCQ0RzcFZKWmk5Z1pnSXdyVkF4eG1YT2VjRmIyazFTK3N4QldxUTZYbHlW?=
 =?utf-8?B?UklnSzdrMm8xMk43WmtCVml0M0F0RDI4d2hEQjFUYjBNbnpDSnZPeXFwalJs?=
 =?utf-8?B?NDVaY0RYRHJJV1QwRUs2WFlYWENEdkttdVlRTzFpWU1TeXZHOU1MZERVN2Vs?=
 =?utf-8?B?aE1BMU5vRmhJNDJJQmcxSXpwMy9sWHVvNHo1WnpRQ0NGNEVuZndEclk5dmVm?=
 =?utf-8?B?eldHaklqWVpBOU5YTUZhY3dPd1NTemNxVjk5V3E4b3FWZ1hXaGxyQ3J1emtN?=
 =?utf-8?Q?pwRDk829BiWbOTKuwW4Tei7fANz/jyjFnC5NhF9ujVS7M?=
X-MS-Exchange-AntiSpam-MessageData-1: lUv9SJ9qEWn7sQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e048d609-b813-425a-5e85-08de956f7075
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 13:04:59.5274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y6bxPD09TLbTfr8bW449X9SNcUtociJYQRijj/K1SXFmovY1Lv+eKxpnOWFZHLYy5jnfGwIbZQrszW1wf7R5KA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8778

Hi Vlastimil,

On 11/03/2026 17:22, Vlastimil Babka (SUSE) wrote:
> On 3/11/26 10:49, Ming Lei wrote:
>> On Wed, Mar 11, 2026 at 09:25:54AM +0100, Vlastimil Babka (SUSE) wrote:
>>> This is the draft patch from [1] turned into a proper series with
>>> incremental changes. It's based on v7.0-rc3. It's too intrusive for a
>>> 7.0 hotfix, so we'll only be able to fix/reduce the regression in 7.1. I
>>> hope it's acceptable given it's a non-standard configuration, 7.0 is not
>>> a LTS, and it's a perf regression, not functionality.
>>>
>>> Ming can you please retest this on top of v7.0-rc3, which already has
>>> fb1091febd66 ("mm/slab: allow sheaf refill if blocking is not
>>> allowed"). Separate data point for v7.0-rc3 could be also useful.
>>>
>>> [1] https://lore.kernel.org/all/c6a01f7e-c6eb-454b-9b9e-734526dd659d@kernel.org/
>>>
>>> Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
>>> ---
>>> Vlastimil Babka (SUSE) (3):
>>>        slab: decouple pointer to barn from kmem_cache_node
>>>        slab: create barns for online memoryless nodes
>>>        slab: free remote objects to sheaves on memoryless nodes
>>
>> Hi Vlastimil and Guys,
>>
>> I re-run the test case used in https://lore.kernel.org/all/aZ0SbIqaIkwoW2mB@fedora/
>>
>> - v6.19-rc5: 34M
>>
>> - 815c8e35511d Merge branch 'slab/for-7.0/sheaves' into slab/for-next: 13M
>>
>> - v7.0-rc3: 13M
> 
> Thanks, that's in line with your previous testing of "mm/slab: allow sheaf
> refill if blocking is not allowed" making no difference here. At least we
> just learned it helps other benchmarks :)
> 
>> - v7.0-rc3 + the three patches: 24M
> 
> OK. So now it might be really the total per-cpu caching capacity difference.


I have also observed a performance regresssion for Linux v7.0-rc for 
some graphics related tests we run. I bisected to ...

# first bad commit: [e47c897a29491ade20b27612fdd3107c39a07357] slab: add 
sheaves to most caches

I came across Ming's report and hence, found this series. I have also 
tested the 3 patches in this series and it did appear to help with one 
test, but overall I am still seeing a ~25% performance regression (the 
tests are taking about 25% longer to run). I am not the owner or author 
of these specific tests and I have not dived into see exactly what is 
taking longer, but I just know they are taking longer to run.

Anyway, I have not seen any recent updates on this, and so I am not sure 
if there are any other updates or what the current status of this is?

If there are any more patches available I will be happy to test.

Thanks!
Jon

-- 
nvpublic

