Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013044.outbound.protection.outlook.com [40.93.196.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37DB299A94;
	Thu, 12 Mar 2026 08:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773305481; cv=fail; b=ie9mFwN4CK5hhzpbhZdoMT2Mw5In3D220S6kSVVqcbBi89jpHkJ+9SpvNBo5QjHXVWfqJGiShL3rQm8TmgafkzNMQhIxWlub84AWahg8kxuTsF0m27OmC240tx2b8HBaf+6SJ5R+nXW7Jl9HaPzNlRFeq5OJy+B11KBgyREkTN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773305481; c=relaxed/simple;
	bh=p4Hg32AGlgeKOMqhVTznr9dO4Bz9eSsXzNV3JqyFwrA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=s7+c9EHcRXUh+SqC08KHYwX9cyawHJZfxYxPR7kKwhtXoen8HFSk4xlvlKSYQ7c9Spb7xQN2J5mBcujcE6SJiJSZ+jBEQPKJduHedP3dDJ6C46pLrJoBqiSex4utyyxw54tpcfBwLfL+MWxnAdogIkxI07k7lzEaSZs3nLo1Gts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DMs0pUct; arc=fail smtp.client-ip=40.93.196.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DMs0pUct"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o14nxkQ80t4AXUFbo6RcAiYzdbXWTIGCGE2EWSLpxryXaQq3DKzo+P5RTJOXkphICVAZL3/AY45hccaUSSsLjGPr6GNIR8MznPfBiqyaypRbauO/NdAqVNHAnQNxUyS+hLYXw9/CQV+3AbDpVPlXsKAnhhAhaAYKZfpyojfHC9PW1GpuIDqIWMpgikpSPRim0xl4fXwgWsqvkBMN3oZCXDT+AS8V3dBxTIBtNFUVZPOj8RIjQDbbwWQ++m/3Xz3W1lq3USihyX2KgO0FOlCMPYSC8kJfUe05AM0HbqRh/0fkWZUhpn8bH7N5wRK7atGO5w093WIN6PwtIsEYr1CPnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2LkiqnoclMrvCG6OJctCIabOUKZPa7d5jZjnCNWTsQY=;
 b=Yx5Jk5D4JKwtpiQbh4D+2Cea1YTxXUmpXDse/bWOXQ4oL/BBKtGYHcHbc6sBIPTrSCCslE9ZsEJOyqdzlh0Yf+XH/Qlj6VsqS0FnQbkSq2CPpboYqwZhnOl8xcmdo0dqVO7rabeHr8RBWJpu82u/doicNddHyrI8eVaZsaY6wNOd53yG2wsZuXfWmoF6ymC07AFbsut8/0qVe8T7nqSKa/1eyHGw0y1QFSKwMJn8rpORZ979Id3s2/GDtVoujZl5/JLAxzPtqukqE0eY4i3sff4svMdANPcIGcL9tciWs/XKUVs0jH6k/3AH6pvXu+SR51FyEScADOe6CuUk7TRM5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2LkiqnoclMrvCG6OJctCIabOUKZPa7d5jZjnCNWTsQY=;
 b=DMs0pUctnDfWhcCHgQkEdSXQM2A736xcXQ1etnrqYJMKXrzV+WrhvzM3kddpjncjhGozdKPmkOo/5I5TXCk6d+rIRgXKbQ/uSWD3kJNl2ZG/GOH5ChfkIWjiecigLeTvY3HGoEdTv7aSAowtypAQPluhBzSE81Al75NWlFdAFMrPktizJPTL2jCCq0zXSJZ/c4O7HgY16N7DOadWrmZGtKLs3UB6Ig3uPi5kvFmFzv/lLT6dMsvRMqey46im7+HAZ/fbAFPcgDGZg5q9wlrYjDDql5Gd0qSSerHo/Xm7+BKl/xfcJQjqbTjC5oxA7Q7HTz6ZSDHZBITSNUMu6yrBCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by DS7PR12MB5792.namprd12.prod.outlook.com (2603:10b6:8:77::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Thu, 12 Mar
 2026 08:51:14 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%5]) with mapi id 15.20.9723.000; Thu, 12 Mar 2026
 08:51:14 +0000
Message-ID: <ceeddf8e-d8f1-4520-8030-67a1277a1032@nvidia.com>
Date: Thu, 12 Mar 2026 08:51:09 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mm/cma: move put_page_testzero() out of VM_WARN_ON in
 cma_release()
To: Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, SeongJae Park <sj@kernel.org>,
 Ron Economos <re@w6rz.net>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20260225031231.2352011-1-ziy@nvidia.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20260225031231.2352011-1-ziy@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0379.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::6) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|DS7PR12MB5792:EE_
X-MS-Office365-Filtering-Correlation-Id: 1970be56-f0e2-4649-e17d-08de80148478
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	fvnXjG40lGwy5XENdfSPR6NfVv0lPCfngPeoPIQkCDbDsCo/DYchFUPNxT0JKe+duMWucufoZQwLzruZuyPNJJ928AI+CcKUclJR3nvAsxt09w5zUT7nsJWH1AbSQSmOJMc2UegnL7YalxMIPFnpJftjtr+qFXTz7cgBbTu9ARscnML5EbOPZaWOtvJZRqqtcbRT0SCTg3FCixPr/KppCwvx+Ev3y1ya4LZOVNmezUJRGcCEt5eCKVKDQJVSG9vYllTML239lutIWDYPdBZYk6YzG2HY1PxRsmryDeL3IZKdLFNhI8L7GKrOzRxmrWuhhabQ/HAVj69tMjV2grfzMseZSjkWLETe3jH2cIWPFhzBaAHnFkSV/XPcWmtBthHn2TA9Do0uf6sMHcYM01QZVACgtY63VOdAxb3QpK8F94vgJEHOCNgj5c2+ub07bup6bxv4oTadLhx/+hmyEACEO1hRUroGGv0collfERWkWQ48T2fxvgq/bZqrEnU6Dhe+R8g/sYWy0IFTAobaHOca/GiBuzSfM0wyvJAU6aQtaFsjtdzDRZMM+1TPEjNRJLIMN7/9HS1Ez8C1Tuw/0L5j/JQgRf7MbkMU8bMPNmSGd2Ymc4S4JmCEUzJohcPT+QD7ylrFrd1yIuutQ5Agm4Bz0pP8kcaND4f9+a2zh60xkGCtSbfNArufhvsY9DZWEKb5qz0bejWHIdYEMG230dm/Io2hkkFr7OFpnxBW5f1kBrw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bldzZEVHZDZ3SGFuNXYrczNiaVFlM1YwTFBiaXlUQ29paUIramhJaW82UEpG?=
 =?utf-8?B?cEZUbUE1TkNtTmFWUHh0Y0oraHpqV1RuUmFKQ2x3VitGREZReUdidW0vSGZ2?=
 =?utf-8?B?WGRmRXF1am1nTUVJQUZuc3piVjhMTkNQTkV1NlhrbDdXZnEwTXk1c3MrV2RM?=
 =?utf-8?B?NkZRME4zTzV3YllGV0M3d0hMYTcyY2E0TE1YQ3UvR1A3di9DR3NyaTIzdUpN?=
 =?utf-8?B?cjVOM0ZsZDRPN2hscVdHU2VVUkNhcWxLb0h0bzJJbnl3SXAyOGtZZHhoeUlx?=
 =?utf-8?B?ajQzTHFnWGpsNVVoa1dnQmNrZFg0WmhpU0tuM00ySDRHWEhXa0p1YzZBSms4?=
 =?utf-8?B?TzcyTFhxWDdaRVVjQXA3WCtJWTh5MzBMSnoyTEpDR1FLY3daZ25MR3Q5cHZY?=
 =?utf-8?B?RElUZVN0Ujl5d3F6U0Z6aUFYaHNJeHZZeEt0Qy9LUkZ3ekpsMTVZenFncUFw?=
 =?utf-8?B?K2lMMEdGemxrMWxmdlBQbngzRDZhaVhibkY1REQ2ZGhCUEpCTXE1bGdRNDJx?=
 =?utf-8?B?M0dpUVF6SXN0YTFzZnhLLzNNeVBxK21pZXBJaURtTkV0MHZGVWpSbnZyQU90?=
 =?utf-8?B?M3Mxc2RqZWFGTVFYRmk0d09DQnNyb3VxMnpLWSsrcDRpVXZkOXh0a3hQRTFz?=
 =?utf-8?B?ZmwzalFQVzJ3bU1NbDJrOTNLN1hXTnpSUnJFVmxZS2dvTjl3R3QzL1BaeHNo?=
 =?utf-8?B?TFdoTjdJNDgzejhFQmI0WVJPZ2p6NWdIYWI4OWRDK2JPakgzUms2THRlMXZn?=
 =?utf-8?B?WEtpRUFDMS9rTTEyZndqeTNsYnFRTW43VW00YUplT3o0enJvNEI0T1R4dzdC?=
 =?utf-8?B?NEVvWGppKzRnMmFCTEM4YXJtSDZwSlc2NCtrOE12Q1kxSmE4QTZrckRlREpI?=
 =?utf-8?B?NnNjdkNlT0FRMHlVQ3B1QW8vbHdzN3RNc0xCZy9rajZCTjEvSEJTeSt6Y3Ir?=
 =?utf-8?B?UjVabjd2VTg1MDlrN3p6L0IrY2kzNjFBczM2UGh6YWtSSFlpWHd4SGdJNzBJ?=
 =?utf-8?B?TWtteldHaTM1ZndWYnJkS0JSWW13eTMzYWgzdUg0VllGNkpuamcvMDJ0NE5s?=
 =?utf-8?B?b0NZbzNYUjFGYVhFaWtLMWdBUUdpY25pQ3cwOVR2anhzL1hjRjdkdmd1QlZE?=
 =?utf-8?B?UGx5cENjUDQ0d1lHREF5b2JmaU1NU0M5ZDJ4T0JjZVVvOVU0dFRvVm1uVHNR?=
 =?utf-8?B?UDFOcFVMWWRRT0s5TC9Hb05rSVExNGlvNVhtNm0xMlpzWVhBWFBhSnhVOTZw?=
 =?utf-8?B?WEwyMUlxN0pSdnVLWkM3QSt3bjhEQVJHR0FEc2ZvS3RyS0hVdVV0aTdrekd6?=
 =?utf-8?B?STR1Y3VrV28ycG1IQVBrL2lrRlVkZjRqVk9sSzBsY3dkdWJWZndGQVdsZFJH?=
 =?utf-8?B?YWNtMlNJTWRweGF1VmErYXRKRk1kL1dFOFp1czFNbnc1M0IxSTU0QTk5NXlK?=
 =?utf-8?B?aC9mcDlpRXlMV0x3VWRVTThMREFRcmNqN0JMMWZvaGJtRDJTbUNpeTRKS25l?=
 =?utf-8?B?VjcvZHc2NGUxUkNFaVZQUFowVmhCZnpBYlc3R3duMWxWZmlZcThEWjdSd2Ux?=
 =?utf-8?B?ZnVZalZ6M2QwWEZ3OGVMczdzaTE4QVBsTjdrQnIwcXBxN1dnVUVzVmVWeUJ1?=
 =?utf-8?B?dmFjYUZsNk55SjRuSHdxdFFEcDJxbEFtZTB6TlFGQ085cXRxREJMOHQrT3dN?=
 =?utf-8?B?YTQ5VkRBU3JkVFlMM1RFMzNOZXJVaTc2Y0xPS1lraTJGbmNpeFpoOG9rVXhJ?=
 =?utf-8?B?WThpR0J1a1YrOEdneTBOWTljVFVGS1NUdDB3YnZEb3R3bzUwdG9aclRYMHdv?=
 =?utf-8?B?d25HWUFhZCthS2tQMVVkeTh3VDNvQjJqYVJMZWhHL2dJVThYbjdNRTlxYUoz?=
 =?utf-8?B?Znd4bHFxTkJrN2NnUjNjc0w3OE80cVZ3RVkvQVNUNm9MOFIzQWRkNG9XclZ5?=
 =?utf-8?B?VXhaSG93TVJ1ZmRjMWE0cGFWTjNxdnNHRGxpMmFzTW1FRW41bHFvZm5mODl4?=
 =?utf-8?B?NExDVUpsVkdmUDhHWmN6T2M2a1lSZm40WHYvOTFUUGh2REpQdUtCUE5QSFVE?=
 =?utf-8?B?dHJvbFlOMi9KeVI5QWNaUmhqd0lSRG0rSjhiWmxPRG5WaTVoNmFpZGpUUUl5?=
 =?utf-8?B?dHlzQkZyL3JqblNYL3BMeS8ybXlLdlErTWJBcDBWeFZwcDJ2c0k3OFoxOTR5?=
 =?utf-8?B?V0poR1lRVkN1QkNVY1BQTEI5RGh0NGxwNEJjbGwrMGdIZ3dCN3ovVWlXOUp5?=
 =?utf-8?B?MkdNNVdYT2dYNlFveFh6TFZ0Y0prZUhrQzJZVlloSHF0UytYbzNJZkRvOTE1?=
 =?utf-8?B?NDdJYzFOODBTYU04cy9LWWZreUxDZHdvcWxEVjQ4RlZMc2xJT2ZDdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1970be56-f0e2-4649-e17d-08de80148478
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 08:51:14.5534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xL4ETf0yYVtudXMs2uPSmBjFGCEASXkpltLqAjwKxXKO50cUduapcm73u1ujPSbekOXwI409PCsyR3OvAO5HWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5792


On 25/02/2026 03:12, Zi Yan wrote:
> When CONFIG_DEBUG_VM is not set, VM_WARN_ON is a NOP. Putting any statement
> with side effect inside it is incorrect. Collect all !put_page_testzero()
> results and check the sum using WARN instead after the loop. It restores
> the same check in free_contig_range() before commit
> e0c1326779cc ("mm: page_alloc: add alloc_contig_frozen_{range,pages}()"),
> the commit prior to the Fixes one.
> 
> Fixes: 9bda131c6093 ("mm: cma: add cma_alloc_frozen{_compound}()")
> Reported-by: Ron Economos <re@w6rz.net>
> Closes: https://lore.kernel.org/all/1b17c38f-30d3-4bb4-a7e1-e74b19ada885@w6rz.net/
> Suggested-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---
>>From V2:
> - Collect !put_page_testzero() to get the right result.
> 
>>From V1:
> - Collect all put_page_testzero() results and do a single WARN after the
>    loop.
> 
>   mm/cma.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/cma.c b/mm/cma.c
> index 94b5da468a7d..15cc0ae76c8e 100644
> --- a/mm/cma.c
> +++ b/mm/cma.c
> @@ -1013,6 +1013,7 @@ bool cma_release(struct cma *cma, const struct page *pages,
>   		 unsigned long count)
>   {
>   	struct cma_memrange *cmr;
> +	unsigned long ret = 0;
>   	unsigned long i, pfn;
>   
>   	cmr = find_cma_memrange(cma, pages, count);
> @@ -1021,7 +1022,9 @@ bool cma_release(struct cma *cma, const struct page *pages,
>   
>   	pfn = page_to_pfn(pages);
>   	for (i = 0; i < count; i++, pfn++)
> -		VM_WARN_ON(!put_page_testzero(pfn_to_page(pfn)));
> +		ret += !put_page_testzero(pfn_to_page(pfn));
> +
> +	WARN(ret, "%lu pages are still in use!\n", ret);
>   
>   	__cma_release_frozen(cma, cmr, pages, count);
>   


This fixes a regression I was seeing on Tegra. So ...

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic

