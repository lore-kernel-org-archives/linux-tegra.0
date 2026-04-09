Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010043.outbound.protection.outlook.com [40.93.198.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718C22882C5;
	Thu,  9 Apr 2026 20:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775764962; cv=fail; b=MTkydBa/lylTYgtSmYb723qf2Yxu1I67lKlezVbBQRO/HV3Tn/EXz19pmZPTzsY411ve/Pqa3VaDA0p6M0fVfkV2z1ECKXvW6nCr4HNT9L2x8uJrQOopSPoBNQAy+/YOZx+w118gdCd3DrShCarFUM0SshsZY7mrKqoLh1hjNM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775764962; c=relaxed/simple;
	bh=NsPC0C/s3bgKFLASfBvq7kwHM7sVxsVUPOMMp6e+/Do=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VHRCk1W2l7k/2IevIm5WWbpcfFyEhGLx1UIiKOxbILCpxEAj/UN3QdpEG2JJq4/K1ua595oQOwLmWutoFCmF+LrNjdi0Q0Vxt7gSfTNqj7mY9IBhXBu6tIsHnu1kagYbdZPP8jnTe6Y4Rjpmw9XZgD3MTOYcvKF3aLXL38xcsaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=r/13kcvx; arc=fail smtp.client-ip=40.93.198.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="r/13kcvx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a4Fji/pNC8Su0OisQVl18h1Z1PdnL4D2lxdj1OCHg3yAOFJlbl+lkh7Oo1aq5omwT+BvRyrLh+QypeilG+8/V6akBKOcUpJc8QBAbsqT2pBWpuEHmIzKR1+ajvsfhsl7YdxJpPMADlTVjlw8dfXosVu+bLTqIxMFR3aDwCdns4LstaFthSGif7IXuLLiv4MtWwbxqexKDmmhH7kcPJgOhueMHuI+hRHe0vu/D1z1al9yR2e4QpI1/OUv4dZ8+k4w+P3ylmOQnUYKx4JvronKVZbfRr7Hqx3kAvut/O3mJb6WuIsVGaq1kCNSd5OY160Q3zXyw3Est/8ytSx2q15Y0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=US/TPYRBbjndpDCKE3UhGYVEIbeT8xndtPlFe3vEhjo=;
 b=sldS00vd9XNjTc4ZjCBACUEzpvyg4OrC+fRXkMuFDLQ/XdrqpslLbJWVvfLu4VRntETn/2XfGf/scW7i1quqjova78+f8wtpya7F0XlshiB+8jt36nE2S5iwNeZ0Zw8YZHCWwroqaGwQK5caKjTPf5CY3oX4TI8H4NXETxbBTVQUoFEY9lW6LXJwEn2FGmr5jjT31VG4aYKrSIiFe3jFiQ4rCbKV6YesASAX9U6TXOQAsLU1Lm40AwIfi/+quE/VauZclXn1AmAbMDDaHMF9DhY2RHU2zLsnKVNMlwDg81TzfbmkLCXBcu7ZQxRDyU3iv2aE48/ooeahsTqAq4n1+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=US/TPYRBbjndpDCKE3UhGYVEIbeT8xndtPlFe3vEhjo=;
 b=r/13kcvxdwtR3TnEydhTBx6QUXVUDgFnRIa5J9mTDxT1bEk33gb9OH90+swvE9qDVra+ekop8hCHDk30sQaFrRB53dNDookHtRY9WcpWrI3tm/Z3UTuRFr3wBf62TUCadtNntFNBbgFLdPqaidDD+q/UILZHfYRP7wZ7xTigSSc7HNyHod/jNGRfwoFUXA2dl3KI3SIkLtv6LihptbbYyrhQa9Ovb7eANk10NnpUloadaLRkyDRiDVAOsG2mDMU08mnpu0xu5qlve49XCrLSJAyU7r1CAU5e6IB7Fnrs+oet6seCD4o+Xs0YJA1tQpVqfI4IzXY2yfXuQSwjtDy+Yw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by DS5PPFC9877909A.namprd12.prod.outlook.com (2603:10b6:f:fc00::661) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 9 Apr
 2026 20:02:35 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9769.041; Thu, 9 Apr 2026
 20:02:33 +0000
Message-ID: <da886682-c255-47de-90bd-8bd708a0ebdb@nvidia.com>
Date: Thu, 9 Apr 2026 21:02:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] slab: support memoryless nodes with sheaves
To: Hao Li <hao.li@linux.dev>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 Ming Lei <ming.lei@redhat.com>, Harry Yoo <harry.yoo@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter
 <cl@gentwo.org>, David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20260311-b4-slab-memoryless-barns-v1-0-70ab850be4ce@kernel.org>
 <abE6uqdzMUv8k0mU@fedora> <8ab58ecb-1fc1-42a1-b67a-c3107de2ece4@kernel.org>
 <e7e4ea66-49cc-4996-a638-25f6cb08a42d@nvidia.com>
 <y5oqhhbecurzrj755sujnqyny6ohmyd4uhslrrigdgpq6shf52@nr5gp7bpit3g>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <y5oqhhbecurzrj755sujnqyny6ohmyd4uhslrrigdgpq6shf52@nr5gp7bpit3g>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0496.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:3da::10) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|DS5PPFC9877909A:EE_
X-MS-Office365-Filtering-Correlation-Id: 39632b4d-87dc-4af5-8ff8-08de9672f017
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|366016|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	R5jPyQVuA7CQ6t4htTDO26Ws5/pEAVOmPQOrVDIWIqzqhLLav88Z3CCKKl4v0yssm0Du74RjId7IYvclPxCseB5PmZz9qIY7HOMNLuvjKJEhU4kWRQcRx3PzILR8KolHgAf5Hw9EMUvY0H1Pl4vOwvWxkhcGKjzfrrooE+MIu4EvFIav8f82quDDv4me382LuKFbq4/alw6O8DofAYPb7RXQdfLitnPFp7n38Qk/x0zrDE4FWQAV6/DespdjH9zQnw66feNnyayEI9+zXx45FeUbi3HuttqJ1wUxDxvr6iPn7Mmrnhg4tZ9AFBf9GzQiyPP9IZ6akrRm46045h06N+iYlzPJJ/k0dbXIl/F8IJPBzVoPt3LqcBRdRqp35hTyhZ57pt0a6yFUGgoK2UTkCfmbghQXbNK9bD04/SEzlDMPhqp2/pET3YJMS8RLH0nDtbvELTpGUh6iJ3njYMQ4YrIP1yS1Tet81UfRb3YluUjXQ3lRSkMNiyo6dwvdR18yk6DSINCP3+o0Ox56zdQ6dXiAuXdHONucnfWx/rO7AaV4J97MdfmY71FrqLAQU+dWcL7Q98RISgwGyk6wXpUsC1jTm321eLyRtYkqNWoP20+VZuzpKfo5+04Ls02GsFOL4zMOUTyMNwUVVOrUwvxoC3iJFVekMDSaoolP8yhyq9a8rhLNmJ5C9jG6L3XAHGJvQ0WToM+QsXGJOosnwnlX2DFnQYRHyTiDkq1Zus4GejI8EMC8Q2LR2kH1I3sArRUN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mk1XT0hBVmFFeWpKMW82M09OY1VoTXNLb1o2aHZaWkJZMzhQVEFPSXNtWjNX?=
 =?utf-8?B?b1J5dVloRjFLbUNvMVdzME9sRVZ0VmVOb3ExYVN2ZVJuVEI4MkREQ00yWjJT?=
 =?utf-8?B?OHJhREV1ZVpsaWQ5Nm1hYmZqb2ZSZ0pwdzZLTnhjUWcvaDBlTFFDdjFoMmV6?=
 =?utf-8?B?T3BIcWVNUDZPNUpGZFUvelo5SGdOb0NFNkJQNDVBZ0ErdUJ6OWJxUWR4QjR3?=
 =?utf-8?B?MVcrdWxXb2w1M3JFSEhHdlk5cG5MTnlWNEJZZ3NUMXMwYUFTVzI4dzF6cnZI?=
 =?utf-8?B?em92dklXbWt2YUtNM1RyVEQ0Z3FOZ29USmdTQ0hmanlKVHNJTjc0dEhoK2RN?=
 =?utf-8?B?aUJ6TFpmQ3JoRUphWng2aU03dnNiU3RkV3YyYytuWnB6bExENk04Q3orWFdF?=
 =?utf-8?B?OUxUdC9UTlBUM0lTWDhBOHlHNXZPZGNlVlhZUFNHYkJCVkJLL3RmVHhSbHZj?=
 =?utf-8?B?SUViZEIrK1lML0hZSklxOG82a3FzZXRpaDlXbEMzbjNhQ01lMUkwVnJRNXRU?=
 =?utf-8?B?cHJ2d0xUZEVLY1BFaW5ReGh0bmhxSkYreWl1SitZbUg1eTYxemxQRjJCVlda?=
 =?utf-8?B?TWJkbG0rZ0c5Nk8vQjdtNC9nWHQ5c0c0ajJYV3lKdnM3MXo5NFkrNUFDNDdz?=
 =?utf-8?B?d3dvaWs1bTZqb3lMeFRhYkk2T0JFZ2t4VXV6aW9xWENvNjQxVm5FaHptcE1Y?=
 =?utf-8?B?bWw4bGZrT3lmdUIwKzQ4ODluZ3poekxuZnhGbU9RYXkrTnlTTDcvRnlVOWN2?=
 =?utf-8?B?c0hjSkQ0bzVsbzVWdG9SN1puVFVNM1o0VGJFK1dEQUp3MHdUeG5qK1JqVTlw?=
 =?utf-8?B?TVM2aXpFdlhhdTEyNFVOTDFvTFRCQmlNS2I5UHZ5V1pYV1V5MHQ0R0J5VTBW?=
 =?utf-8?B?dFpWZ3RtUlE4Q1BuOTZPTWJObEl6THp5UUFWWGhyM1BXWnVkVXExMkpCZFcy?=
 =?utf-8?B?RGxnQ0NJTWl2MmlwdkNuZ1M1NEYwYzFuZFQxWHd4ZzN3ZVp3NzdkV0dsdjVX?=
 =?utf-8?B?a2VlODBDL2hLM05JeU5GZUNYTzNrV1U2ZE4vNkltR2RBWEhDbHR3cURRd25q?=
 =?utf-8?B?a0dBZUxWUE9EdWwwS1FOci9CU1drUXJKNndVL3BjNkFOQ2ZxckdMeWdKWHZO?=
 =?utf-8?B?dnVrN3RoWWJhaXpkL1o5SFo3eG5xbnhtRS8zbU5oemhCTWZyOGRRZTdZcEp2?=
 =?utf-8?B?RDJ6MGVrbzlYTG40aEFpaUd1S25aOEh2d0lHc0V6RVFHRG1ISXJ1MWx4QXVk?=
 =?utf-8?B?VTQ4dGVZQ0tET21Cc0ZqUm14ODU1QWgvc2dYa253SjlKNmdjYUtybG5FSEFU?=
 =?utf-8?B?VG8rMjRCUXFJQzdxOHlnSnZlTElSVUxSSTE5a2tsOS8zRFFUd2x3ZW1kQnJq?=
 =?utf-8?B?anUrQlVvR3VFM0V4Ri9RaGFoY01OWE05RVkxWkpHVDIxTmJVbmxuTkN2ZUtS?=
 =?utf-8?B?VDd0R3BTN2x1VDdrWHJFTmU0QzBpWmMvQSt3MWt4TWMxRkZQQlovMlNnVjV6?=
 =?utf-8?B?S3RiM2psK0RjUmJ0WkRjMTFidTNsYkFITDkyUE9meGcralVOaGZUaTdHbVM4?=
 =?utf-8?B?RjFDcjdnelB6RG1kMXVqL0ZEMTdXM1JvQ1F2YXB6WHRhVjRMSmNCVHl1UU9S?=
 =?utf-8?B?TG01blA0Nlh4OGkzNlFKYXRMMDMvOGZVQjRMczNoTjFGN3ZVT205NmcwVUhr?=
 =?utf-8?B?WVE0WC9VazE0SjN5ZWNrcFdEb21RVzRNU0x6QnBXSzNuY2lIc1M5VWRzVDMy?=
 =?utf-8?B?RUNha0ZPR1VydWE5b0E1Z052NjR4YXR0dG5XZm9nT3hvWkxORnpWajFXdjQ2?=
 =?utf-8?B?S0xUc2k5Q1pDSVJKMisxbEdmREJwQjM3YlpFYW55aFRmM2NydTh1cWwwMHpR?=
 =?utf-8?B?eXczemdHNDdyR2JGcjFYNW5YSnY5K0c2UzBGYkwzRHJqUEtMMEJmc3VTUXBh?=
 =?utf-8?B?RERpR0Q2R0dEZUxhSDc4VjNqaWVMUFgyNkV6TklxNThLMm0zSGVvOFZqZXZR?=
 =?utf-8?B?SWNLV1ovYXdHU1hGMCtkbEVBWGltQ05WUTNST011bDl1LytTcE95ZllHYzgy?=
 =?utf-8?B?ZnVMQnhwMUhvcm9zRksyMzR4aUJ5RlUxWTFqdVA0VElZK2tnSDh2bkNxZGY0?=
 =?utf-8?B?b2hKbzVvdlR2OHVGSDRpUFdHYUZpb3BoVk1NSDJvNkpBU1lEMW9Fbk9TU25q?=
 =?utf-8?B?VTVnY0xQM1YzUUtqSFlYeXBISXlLZ0w4dXlWOGMyUnM2VEZZZEpmNUIyYzBV?=
 =?utf-8?B?amRrRm1mYkpxUWlXVWl4Y1lkeUhKUE13L3BiYmZuc01mdGxZMmFaVUhJdjhO?=
 =?utf-8?B?VWdVWWxJeUNGQXIrTUk4YW51QmtTNEs3QUptN05NaUpUSW5GR3Jsa1ZtUEk3?=
 =?utf-8?Q?Ag19H99G+mLTRV6z1m3qeir7kiblHafNn7xh18HIbjGzw?=
X-MS-Exchange-AntiSpam-MessageData-1: 7c7D8yDS3KyZGw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39632b4d-87dc-4af5-8ff8-08de9672f017
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 20:02:33.2460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XVG02U2hoF5K8LgU0E2FzR3Z57/yOjfErswVA1bkLoiWwnV5MZQDDIh9PKpWwAzbPqEZnWYnczWUhucQi8BgLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFC9877909A


On 08/04/2026 15:06, Hao Li wrote:
> On Wed, Apr 08, 2026 at 02:04:54PM +0100, Jon Hunter wrote:
>> Hi Vlastimil,
>>
>> On 11/03/2026 17:22, Vlastimil Babka (SUSE) wrote:
>>> On 3/11/26 10:49, Ming Lei wrote:
>>>> On Wed, Mar 11, 2026 at 09:25:54AM +0100, Vlastimil Babka (SUSE) wrote:
>>>>> This is the draft patch from [1] turned into a proper series with
>>>>> incremental changes. It's based on v7.0-rc3. It's too intrusive for a
>>>>> 7.0 hotfix, so we'll only be able to fix/reduce the regression in 7.1. I
>>>>> hope it's acceptable given it's a non-standard configuration, 7.0 is not
>>>>> a LTS, and it's a perf regression, not functionality.
>>>>>
>>>>> Ming can you please retest this on top of v7.0-rc3, which already has
>>>>> fb1091febd66 ("mm/slab: allow sheaf refill if blocking is not
>>>>> allowed"). Separate data point for v7.0-rc3 could be also useful.
>>>>>
>>>>> [1] https://lore.kernel.org/all/c6a01f7e-c6eb-454b-9b9e-734526dd659d@kernel.org/
>>>>>
>>>>> Signed-off-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
>>>>> ---
>>>>> Vlastimil Babka (SUSE) (3):
>>>>>         slab: decouple pointer to barn from kmem_cache_node
>>>>>         slab: create barns for online memoryless nodes
>>>>>         slab: free remote objects to sheaves on memoryless nodes
>>>>
>>>> Hi Vlastimil and Guys,
>>>>
>>>> I re-run the test case used in https://lore.kernel.org/all/aZ0SbIqaIkwoW2mB@fedora/
>>>>
>>>> - v6.19-rc5: 34M
>>>>
>>>> - 815c8e35511d Merge branch 'slab/for-7.0/sheaves' into slab/for-next: 13M
>>>>
>>>> - v7.0-rc3: 13M
>>>
>>> Thanks, that's in line with your previous testing of "mm/slab: allow sheaf
>>> refill if blocking is not allowed" making no difference here. At least we
>>> just learned it helps other benchmarks :)
>>>
>>>> - v7.0-rc3 + the three patches: 24M
>>>
>>> OK. So now it might be really the total per-cpu caching capacity difference.
>>
>>
>> I have also observed a performance regresssion for Linux v7.0-rc for some
>> graphics related tests we run. I bisected to ...
>>
>> # first bad commit: [e47c897a29491ade20b27612fdd3107c39a07357] slab: add
>> sheaves to most caches
> 
> Hi, Jon
> 
> Thanks for the reporting.
> This first bad commit is surprising. In theory, this commit seems couldn't hurt
> performance.
> Could you possibly manually switch commits to verify this bad commit again,
> without using git bisect?

So I went back and checked out commit 
e47c897a29491ade20b27612fdd3107c39a07357 ("slab: add
sheaves to most caches") confirmed that the problem exists there and 
then reverted that and confirmed that I no longer see the problem.

Jon

-- 
nvpublic

