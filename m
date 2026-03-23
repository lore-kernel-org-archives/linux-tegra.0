Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010009.outbound.protection.outlook.com [52.101.61.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E616C1D45E8;
	Mon, 23 Mar 2026 13:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272301; cv=fail; b=ND4tV1EBIACzaz91lWZ0OMcDiqrJrC4elX59e1ryHgqWxWEGN7t9P12JxFG0ZY154x0DP+9cLqKPdKThOAne1KvbB2EZtyHHZJgygzzirua5H3ZtYtTM7D4eGtUzOURQBKk9K4raONLg38b4iCVeiyrPX04m6PXJQs28zEB6ZVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272301; c=relaxed/simple;
	bh=JPc8vPX5+e6vnOJFOua4whRSgRdqF8G6WXtNwpXUEAg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cNV9SrqwB5Y61L+wx+PlR9mPNCR2F+EPG97WIcWuUvlnd4/slNjq9f1iY1JY5C2Db6fI+M0E/vL9zIR/c2sHjhO+/m9xMrCSQqfP+Skgx8lfeW84TAgCRHuVYkE5WG3XfiUoOE4DJptObMtxRhcFfYPrvC+K+FFSO3mTSVeMV+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DjMOpJek; arc=fail smtp.client-ip=52.101.61.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DjMOpJek"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZS/13m0OmdnAvEj1A1bKHpAjgTiMP05/CE9tV3UuTi3qFFLTyVj1/meDYpCI919N77i6aU7z137+9xxBQjEgdCRhibqQXIFUk/ADgnPnB7BZBXuiCXa7AvbQWqHhiBZ5oTgCfSwYWScVhRZuhtjHlbhl0qO0y+MRKQ0lyuRR9ti5kqGUpzQIU6Q5hDyNEdfFlpJXATBksra8v/zxvoLBPccW9OeE/winjtTorK4FnwLsrY4x/43jkDekf6UPmJVoEFkcrWqE1VRjFl5Sb7eTDxvMpi2cz/Z0pC4kGL92yFBkAQgmDg0iFEY4gtQinHbQhuEplkfvTpiqd340ipE8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2M4qYMkOS5uPXveU0PDqAhNzQHvGdf0VpY7aZ4vHFz4=;
 b=Jh4XhCoWFs+pKb6TEtTftvTDgXh1sub27WF9D+NHC4mC3a42WISn0R4IOJrFOeu6XwyzPbzpfwcFP+MM7HkpYaH0lid6VuXJwh97zek7+JObOTyPxDTRVJ6MDQaDnLuB3Qdmb4d/dfQ9rzRQZW38HAuVSB9lQgs495tzs+zpWTgGEAbj4x1onHhM9NZB5otovHCnMb70XBmt818dh1PYXIF55li8J6Z224ztGsdirMHFZOgAsHoDzypIavIub6s5WFWBOZIOJctxCbUPXN+kJinPp2wZ5vJ955wR+QdFlD7TYXKZN8uKxQLuPz+Y2hmGVdQDdL7iFNo2e+Jk00X9LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2M4qYMkOS5uPXveU0PDqAhNzQHvGdf0VpY7aZ4vHFz4=;
 b=DjMOpJekzyP0yUtAjNiIneBxggW0eAsdFHh/BP0VWHQmPq1FWz8YE1/H1FaQ5YlGGt6W0R/7VPqvkcB8VjU905LYQ8GyfrOkHnmplOiglH3X+bgB6S4eWXQ0rfoy9wdsFyuIj8BeeTLyA7qX5MWu+dM5LvYImGa7CxGnnfVa0WkJ+WHcVikom4OPqIksdqNtKlIzr2KVJteUw4WQZhAxUQazsKSvE7EBmWxhN2T/LGjwEKYKaGDokYEVOmKyQD+WiL/o6maHh/Il2Jdzued3WbljYkMphdHYq2fW1a3QaHYHyJpiuShCyuW0mutCe6cpf6ODbrTC71nHOeNrZty15Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by DS0PR12MB6606.namprd12.prod.outlook.com (2603:10b6:8:d2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Mon, 23 Mar
 2026 13:24:53 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9745.019; Mon, 23 Mar 2026
 13:24:53 +0000
Message-ID: <5b30286e-c0ba-41c3-acd9-f60d0dd6fba9@nvidia.com>
Date: Mon, 23 Mar 2026 13:24:48 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sched/topology: Initialize sd_span after assignment to
 *sd
To: Peter Zijlstra <peterz@infradead.org>,
 K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Valentin Schneider <vschneid@redhat.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>, Chen Yu <yu.c.chen@intel.com>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
 "Gautham R. Shenoy" <gautham.shenoy@amd.com>, x86@kernel.org,
 Kees Cook <keescook@chromium.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20260320235824.GA1176840@ax162>
 <20260321163852.11102-1-kprateek.nayak@amd.com>
 <20260323093627.GY3738010@noisy.programming.kicks-ass.net>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260323093627.GY3738010@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0685.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::8) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|DS0PR12MB6606:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b35844d-4db5-434e-0310-08de88df919d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|366016|1800799024|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	YRdIEHlNIXxEqAin12neFVj1fiDu4hU2xYdUz59FmgGzg/sDm3lNOVFE5uTyMRqLD55HVi1mSSmNQXFIYgb8o+yLHiSzkyo3NoRgxguS3Ea/wKYh+kHJpdi2eQqsjK5aH9KATdKjZwab47KZDZKODKVx8PMr/ro+7Vy7AZWE2PsciH6d9LEO/E6nOPO1PjeApH6+cGugh5tX8uwBfiIlFsVDOr4DxHouxLBU72UaUkoWF2ouZZl4vx+Bbfj01UF0wFtQBjXPtyNYF4noJmmqxyv4K1D9GgjTIe3xYL/ZBochaXQy2vpjm+3POZQOHnSqUHonUzb+c9wF3aiPvFZiRIje55PMw2uY4bfQD0j4SQNTrEvbd6QKH2qnnl4WEVUCAHcQ1QLkUHAKdBGed3t8jvQ83o9G5sjw4b7KwliCl35xKHvkg6sif3KON4EHY+HQhzS50XzP0SCpqxvTkqEozl4fqW173DE2vR1mJVYOEs8GfIKibt3Jhb/mMrPPWLxKkM5bX1D0V0ymbmPK60rHS0520QTyDeUTGL2dwhjU1yvojWXgmCOByGXU2Gaar3q/hed2/pTkBiWN6oyrQ6Z6jk+oiZYBZcWCsHFiCU+lK3L4B4YlWcgW9248GAneBEgsbYR7DzLVJWrT0CftMcRhXWNhbWmGHsKmap7xGjs37009lR/QKASafOQ/ZDeUEsXR/su7l29nupFKWooM0oYxBIuHujshPmiRtJg/Vni5Zz8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWlndmdFREowbSt5cUsxWk9sTXJtWS9iK29ERDE3N25BRzB2MGhDblI3ZEdw?=
 =?utf-8?B?S1BMSFMvSVg2djBZT2dPWGRHY3pTa3JsTGhSaHlVSHk3Qmh6dmg2bGROK3hU?=
 =?utf-8?B?ZXZ6czdIMWtxRzkvRUdkQ21ORVN3aEppMUZPQ1l6UzdqZ2d1V1FjMzRXREFh?=
 =?utf-8?B?N2xnVnBOYlVxZnpHMjBPMkw3M0Ewb0dSY3d2RjdzS2hIamYzenN2R2MrRTlv?=
 =?utf-8?B?NXhIOGJqU081Q3JvUnUyZjQ5TTZjcmRKWkVMYzlNYmI1bTlERWFON1poekY4?=
 =?utf-8?B?ZnczcTJDcy9NSUgva1hobjZwbkdSSUpwZmlvWkc4Z0JINUVQOG5EdzRWNXZv?=
 =?utf-8?B?KzJzUS9rMkJQZWwvVCtPOUk0MzlQVGM2TGxsZVJZOHBPTEx6akNXYk45cmZq?=
 =?utf-8?B?NHZDU1J6NDQxQkJtM1ZSeHdKRjBMNFZIbk5HYXdYWFRWYjg4SkJobVhqNHpU?=
 =?utf-8?B?cE43elIvaTJLenMzMEJ3bjNCMW55dW1IL2JBTFlIWngrOHJ4aW83ZkluZGZs?=
 =?utf-8?B?UFkwMEh1R012T29ySEZ6Q0lNdlVjVVkzSzV5OE5vdFVmcm9UQ0VoZHludkZC?=
 =?utf-8?B?R2M1cnJqRTl4eVQrb2xnbGtXdlBRSWpxaWsvSTAyTGR4dlU0QllGQlk5UFhK?=
 =?utf-8?B?Q1RNV0s0b2ZWSzhzaGliTGpvZ1pIZ0wwWlZRL3p5enIwMEVEV3p1VERMOXJX?=
 =?utf-8?B?NW9yNjF4a1F1ZnhpMG4wekNqRFYrWmp4QlZJcHNJcUpCMTdkZm92eERIblpv?=
 =?utf-8?B?RjVMUytMMFBLMU9CT3lDdWVORUpSN0NsaFVYaG9mdC9DRXd2T1NkQmhhaUF1?=
 =?utf-8?B?dFluQ3U3bngrVUFtdVFWaHVuZkJWczMxME82K1pyMmNKcm1BNHB0Y0d0bDBW?=
 =?utf-8?B?aFlzV3dBaElnUllzVUtLbUJpT0VqMmNMVzBYQ3lJZ21zWGVmZk9SU3R0RDgz?=
 =?utf-8?B?UTFCVTBLNDRvVUt6UFIwbEhoS0dteTlzMmFxYmZCSGUzOG5yZ1BZTDhpdlFH?=
 =?utf-8?B?Z0xvbEw5WVNuVW1RS0R1NVBhSHpGV0FyLzBTSU1hc0t4c3hLMkN5bWVNVmVD?=
 =?utf-8?B?aVp0MzFhaFZjY1dpcGMvdDZ4clNCVHJadFNON3E2ZXFwK2ZNaFpCU2xFOCtN?=
 =?utf-8?B?RDJEQ3l5SmZiY2w3ZDROQmZpOGNPWFlSTW9sRTAwaXhnbHZiU1hEczFrOVha?=
 =?utf-8?B?QVdwZUUwczlHYlFpMTFzYkhiMmhmN1BueUltaTdNZThzSVlrdFFWWDVEcU9o?=
 =?utf-8?B?dTMyQnJLOXNOSkdFdGNDQ2Z2QWgrWWsyR3hzY2J2U3UxMUVLLzFnU1NYOXJv?=
 =?utf-8?B?OE1ZOThYdW5WT3YvdEd1TWJIMVlraW5rQmJDczUxWWJ0NW9xMnZ6RFFhbzBz?=
 =?utf-8?B?QlJaeU02ekRHSlYrTjg5MEd2SmFpQWJ0b2Evd2hYREVUdEFaK25zSTJQTEJk?=
 =?utf-8?B?Q05GWHhLeEl2T2RCNGMxYjRRK3hEdTZXNVo2ei9vT0V0eDZ1bFhZRzFrbEcr?=
 =?utf-8?B?ZjNKczZENkErdkFmSUZPMVdXelpjWXNmVS96YlFqNmt5Nm4wRjlhNVRHcEk4?=
 =?utf-8?B?WjdHM1ZoZ0NwM2FERkRTbitNQ2dNQVptWnk0SzRVTHVGd01ReSs2ODZHL1VE?=
 =?utf-8?B?R1hRVXF4ZHZiTmtlcDBqczhOOGNUV1EwRGd0T0ZLcUVCVnFreHFwc0ZXVkZY?=
 =?utf-8?B?bmxCVDByRE93UjRsWUtrUm5heVhzYkxGQXVTUmxCR0FnOFlDd0h6S0pkbHZq?=
 =?utf-8?B?OUFTemlwNUpCZW5GU1IrWk1WQXFwRjBoVXlCQ3FRTVRFQS9BMTMzRTJvNllj?=
 =?utf-8?B?Sjg2UVhCS0JKNTZGODA5eDdDN1Q3SFhxTlFQMlliVW1UU3dtQVI5NDJwQjZ3?=
 =?utf-8?B?TFBTMHR0TDEyNzFUNFNINFBBa2JEOGl6WURjbXJ5dzdTNk5hY0EzajFpR0M4?=
 =?utf-8?B?ZEsvTXJDWG1PWHI2RUp5MXhPTEFhNzFwSWpKRnhQT0lrQnVHTHR2aUk0OU1V?=
 =?utf-8?B?VDk4a25yd0hkRDU5ZnkwbTRNVU1XdGRLRVI5ZG9XRzNMeXJ1RDVQbjJZR1hJ?=
 =?utf-8?B?b3BWai81Z3ZKc3NjTEtwa2RnS3Y1eTRTU0lYTXFpS3k0bWxINmFGejNzU3d4?=
 =?utf-8?B?dW5XWHIyZk1pd3B4M2JXWmZ4RUg2K0d3cVlrOVBHeFhPdjlLcVdTbUhhVUVi?=
 =?utf-8?B?U1NoZXZMSjRKUXJYV1AzWFBUWWNkZjVnNU9xS2RGdXJMc2dLOGpvU0NNL25l?=
 =?utf-8?B?Qk9WMGhZcVhGcFE1clcwVG9ReFVuRkFXQ3Rpem1QbFRFWDdlTHpER3hINDdX?=
 =?utf-8?B?YzBTaEZMMjNXbSs3Rjgwc09JVHFvTjlTMFFPNFovY2oxU3Q3Z1VQMWJIM0Nl?=
 =?utf-8?Q?OmlYMHdExE8lhpogv6udx8+CcQ0b+oL12WsVyS5cHq//W?=
X-MS-Exchange-AntiSpam-MessageData-1: eQXxrLlbBcmabw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b35844d-4db5-434e-0310-08de88df919d
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 13:24:53.7268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 32rCE1G56bAenUE2OXA7mXnfKui2lz8dkX0zWdahWoOwtLUidzMj19KLe86XXfnqUqsYMxi5jM8mzbSwZG/OSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6606

Hi Peter,

On 23/03/2026 09:36, Peter Zijlstra wrote:
> On Sat, Mar 21, 2026 at 04:38:52PM +0000, K Prateek Nayak wrote:
>> Nathan reported a kernel panic on his ARM builds after commit
>> 8e8e23dea43e ("sched/topology: Compute sd_weight considering cpuset
>> partitions") which was root caused to the compiler zeroing out the first
>> few bytes of sd->span.
>>
>> During the debug [1], it was discovered that, on some configs,
>> offsetof(struct sched_domain, span) at 292 was less than
>> sizeof(struct sched_domain) at 296 resulting in:
>>
>>    *sd = { ... }
>>
>> assignment clearing out first 4 bytes of sd->span which was initialized
>> before.
>>
>> The official GCC specification for "Arrays of Length Zero" [2] says:
>>
>>    Although the size of a zero-length array is zero, an array member of
>>    this kind may increase the size of the enclosing type as a result of
>>    tail padding.
>>
>> which means the relative offset of the variable length array at the end
>> of the sturct can indeed be less than sizeof() the struct as a result of
>> tail padding thus overwriting that data of the flexible array that
>> overlapped with the padding whenever the struct is initialized as whole.
> 
> WTF! that's terrible :(
> 
> Why is this allowed, this makes no bloody sense :/
> 
> However the way we allocate space for flex arrays is: sizeof(*obj) +
> count * sizeof(*obj->member); this means that we do have sufficient
> space, irrespective of this extra padding.
> 
> 
> Does this work?
> 
> diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
> index 51c29581f15e..defa86ed9b06 100644
> --- a/include/linux/sched/topology.h
> +++ b/include/linux/sched/topology.h
> @@ -153,7 +153,21 @@ struct sched_domain {
>   
>   static inline struct cpumask *sched_domain_span(struct sched_domain *sd)
>   {
> -	return to_cpumask(sd->span);
> +	/*
> +	 * Because C is an absolutely broken piece of shit, it is allowed for
> +	 * offsetof(*sd, span) < sizeof(*sd), this means that structure
> +	 * initialzation *sd = { ... }; which will clear every unmentioned
> +	 * member, can over-write the start of the flexible array member.
> +	 *
> +	 * Luckily, the way we allocate the flexible array is by:
> +	 *
> +	 *   sizeof(*sd) + count * sizeof(*sd->span)
> +	 *
> +	 * this means that we have sufficient space for the whole flex array
> +	 * *outside* of sizeof(*sd). So use that, and avoid using sd->span.
> +	 */
> +	unsigned long *bitmap = (void *)sd + sizeof(*sd);
> +	return to_cpumask(bitmap);
>   }
>   
>   extern void partition_sched_domains(int ndoms_new, cpumask_var_t doms_new[],


I noticed the same issue that Nathan reported on 32-bit Tegra and the 
above does fix it for me.

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic

