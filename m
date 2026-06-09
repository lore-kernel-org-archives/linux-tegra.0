Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012042.outbound.protection.outlook.com [52.101.43.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF8135E1D7;
	Tue,  9 Jun 2026 15:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781017645; cv=fail; b=jtFCbkUCxtjFyBvkbP8QgC7STYGY7wts7bYfXYqIp4KI8Fs00Tew8xsOst5dDuAMISnS8jCRLcenqOugeVsUXxOyjHr+BjqiekigbzJlvvMDjK2IHO0G0cGlAgQ9igGjfODZFAY3wWEKDFVuzQmsB0P4/cFZCb68tnLHjjAoknY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781017645; c=relaxed/simple;
	bh=Jmh9D3cCEIk4PEMnMgMTu01wlPNpVyvuoQ3xA6+hXV8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=atIA5RiIlBR5+qqkHk1bkCm6y8paYidQrbAvCH7PXYsEZ4REBZasvUSZAn++0whEbUSvn1oB8sQmCgVupU9oR49CtcSmzW6zXBoe5kc/zbW0DAoEs9kqJN/fDaswxRiqqLM+/acHvJpj0FDZhndrM6GfowsWG42jcF6oZthD6MU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=bKG7NV0W; arc=fail smtp.client-ip=52.101.43.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="bKG7NV0W"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y1ne442sNMAcleMlX2dmeHpCyprxZIqp1uJPkFIuYNRkxOLFqo+9locNv0qhlrlc1GESQ+V0G8b8yAIfaWGa3tqUG9xKXj7wB7gQZ95ETNuO0p8N6rda/Ceiiy1ndo4Qdgm51lOg8z9Dp9VPi3RzZHfxBXbZ/bmKN9z//ME8S9+HkKOX/WqEjI+r8Fp1JW0PrdoluHHquWt3ZoGCnIUhHV/haWhQMIVKyIgFck5rdObQzwTF2KJT5NT0i+XmanRRlNKWhBWagFIBSK2fexaSrw7Nj/dS8j3luCSrPIhWMIBQqTN0vpMYgroh8MZjJUFgEsQSfcgMqJTMI1vtQcXTVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZKTaezU2T5b16ej0Cit/1aGIiODu1Bu0ElNSBxE3fQ=;
 b=HEatbeVNiZa1aYp6q7k+tJ6o3DV1rNbuB4gAfxNpP5FwW9BNnAK/3UrLvfOi8f52SdbImsXKVJVdOkBkhb5qxGd4OqrZa3yJRwrcwrm1cVi4bl079H8J5wd+eVDMrLyJ0a7LjCyT/Y2Cm0USvIHUITV23D02SQOfbS2mltTfyt9P+UFIrpvnKEMTq6SRU4rzBALlr5+AQcjK7O0VNl9RMuMg4Oe9WSuWNy9pZaySiMpd72nZxAz+ASzIM7LnqLfOHO+Y81lAc8xPZ/GgAddNTFL3Bm+XtxICcFrD4fcD7TSjwKJUlmbYQgVmWzo3Rbq2pNfMUU0uRR7YgihZ/pgBSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZKTaezU2T5b16ej0Cit/1aGIiODu1Bu0ElNSBxE3fQ=;
 b=bKG7NV0W/O/DIrYzkVsnzPaac3aS2V2T0pEyqnl4yjEHjvIp98biJYwkFcVOXr9TOu3YHKda5FC7SrlqdtUvcTRhdO3sGN2zL2+XPgLFatGvhAyPiU6BkDfwLyPqfQ6lsWa9FAeH/JXkxz9I1nRa595XpeO8Fhc48eGRKfn5P3u7GkpYWDFmg6Lxdf9SgyMD763jeXgY3e0P1F8L6uhafeD31Cpj/DSvmogVNiiyP5i8a5NS2caJgmUTnMuhtx8NObKu3pIMulDTQvs90J299mnn7PSBn1Oq3BYkn3c/l/4cA6Q3nY9PUMkuauI/AipKv9XdNRqua+emjraoMrryHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by IA1PR12MB8192.namprd12.prod.outlook.com (2603:10b6:208:3f9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 15:07:18 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 15:07:17 +0000
Message-ID: <0d8f1f3b-ed7b-4066-af6e-08c006788535@nvidia.com>
Date: Tue, 9 Jun 2026 16:07:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] memory: tegra186-emc: stop borrowing MC aggregate
 hook for EMC
To: Krzysztof Kozlowski <krzk@kernel.org>, Sumit Gupta <sumitg@nvidia.com>,
 treding@nvidia.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: bbasu@nvidia.com
References: <20260527140127.49172-1-sumitg@nvidia.com>
 <20260527140127.49172-2-sumitg@nvidia.com>
 <31cba498-24c9-4d73-bb17-bba9cf730b55@kernel.org>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <31cba498-24c9-4d73-bb17-bba9cf730b55@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::8) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|IA1PR12MB8192:EE_
X-MS-Office365-Filtering-Correlation-Id: f6e7ad15-8552-4ca1-454a-08dec638cbcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	Fu5aCpyW7L1zreQWjEI+HJaTdHLz/iPRn5Zeul9JSAzzxW7DhCmKRDl5LuZHMGKfFnhaw+sz/V6IgTdAoThS1B4GjwxzY143rylZtoxRq2Rq2Zi8ti+vnWxvHEF8NBAdho7HZH9rKm6VHrdd8nkkm6vP1muzamghupru6xHqfc3RfcQJlgo4Z8AczOALgCB3Y4aYe7tvGPaeXOIvyzXTbOro18V57RK8TZqVcWwzXTH4XYE+dKM3GI7EvEEhxwhl8KORon77fwKhDbmkF6GfbRIMSp1ltu9wu1jaI+x6mCQLKeJfo7xg2Whf9AapB95F8oh78xzkVG2WizwGaXSYOgPL9iw73Fhfwy4iMpmIPqpTHQ0Mgh+doIkBsHDDqhqyZMJDltM51Ss77adQJhq2n4z5nBg3AhYPOyFwHisQ12NRJrM4WvF1cr4n9q1ln31kJqHwB0y0xSVMo5pa2lxk61zhOBHi4b6Rkujg6MW1UBCAQxkBpyKEIxJtzuJ6mBbsYKdUO/wjBLBAMIyzdnprmu1MP++XDAqz4BGiG+JIKdpmvGHIoKwPzJG0Nwf8PXiadAAvYuRjaTj/XYK4ujqE2U03x7D2dzj0bQ8CgsMr9pw0Z83OjnZi7pqIHP1MclcM/ZV4yUMaJdKj9DUYEj+9VdZJuexrQQedm+25N71m2FEmOUIywV4cylvNm+W17fDc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WStwOXAwVnYrYS9KVnlTNzNjYng5KzB1M1k1MU9VbkpIbEtSeDFFazd4eSth?=
 =?utf-8?B?SFdSdjRqdUFFWURjOEJjRWpWQzNHYnFWZEVzOXRTMVJVSTcvU3JxOG13VzJ3?=
 =?utf-8?B?WE5ROWt3SlptcHRhSEZodXBSV0tVVjJJSE1sR0RCVS9YQnJidmwwQ1dRNlds?=
 =?utf-8?B?a1RDRCsrbTRwT1hKNFZtV0xlZ0tjcmJvSWlkc2RDTlBBNy9ZYjUrK0RtMHA2?=
 =?utf-8?B?Z3dzQmhxaEtsb0FVaHRCNWxTTkI1Wi9TdTB4d3hPeHRUaG1hRE9FbFErNDht?=
 =?utf-8?B?aXpZdm90YkNpSmxOWVNBRkxodzdVVG5laXkxMHpwMWxSYzZabVVEaWl5SW40?=
 =?utf-8?B?QVJ5OW01ODZyL1JCS0RQcHdOdnlIK2NpWXV0RkJJY0dEcldKdEFwcUppL3p4?=
 =?utf-8?B?cFBEWXJHM1J4emZDMEd3bUp0OWtmQStiUWRiVzlDYjhvRStQbENaajZPT25P?=
 =?utf-8?B?c2prRHRzTzdzaGdyNnpTZkJwRDJCUDVzSUN0czU2U3RPRndndXRUYUFlWXQ3?=
 =?utf-8?B?Ri9GTFF1bjN6UWpaSGtnMSt3Z3dMaWM0NVNwdEhidzhnU1lmV3RBdjRvdDJv?=
 =?utf-8?B?eFVGNjZpL05ybHFOK2FDRFNjR1ZsK0RHVTJyQ0h3TXMrSldHRmtqQVlrSlp2?=
 =?utf-8?B?emtpOFYyWklDYXgwbHJ6N3ZUVmhxclRZRElYWGJOSW9sR1JLRTdCSjVXMXpH?=
 =?utf-8?B?RjdDVVEwY2ZONnl6ME9QWWcyOWZZOHJMblU1Si9oa3Jmb2luZlVvNzhDMjJp?=
 =?utf-8?B?ZjJGclM5MXJVY3crY1NYOS9tMjV5dTJJNW1zUFhxWW15QXZUMFhFMmpOK05i?=
 =?utf-8?B?L2xieGdmWG9WTU91V0FnVWtwUWhKWEkwZVNlTXpsVDNVVVlTME9nK2ZFT01G?=
 =?utf-8?B?Z1kwcUZodWZ1d3lTQkhrOTZOYWdYQkF0UDZacCtIS0RhMndpeTdLQkQ3VjRQ?=
 =?utf-8?B?RGs4QWdBa1pMcVVxamhXOFl3elRCUUhzUThLZjBjeHljdkRhOERneXRQVGJR?=
 =?utf-8?B?V01RRmx0TXc1Z0lMejM0RHdNZXRUa1ZxQ2YxMGE1Q0JsQXd0bk0xQnc2Mzds?=
 =?utf-8?B?eW9Ham40MW5JN0pCR2pOWVdBY2ZUK3B2b3hpdkU0eUFjS0doTFNBa1AyQzFx?=
 =?utf-8?B?Q1pPS2pIR2MraDdaZGwrWjMxaFFkSEc2aXRMR05nU3dEc1VpY1pZMUtDS1Qw?=
 =?utf-8?B?citzNmx1cHdJK1pZdWhVeHZBeVh1dlJsdGV4Y0ppbnNvRVRhYk9KbTd6SG14?=
 =?utf-8?B?UTM2V1pBRVAvNEQvSmlCeWgrYTZEcTgyOE9vdHprbU80VndvRnZzeHcyM2Nw?=
 =?utf-8?B?R2hiUklMQWV5ZzhHY1k2NGdpUjlnNUJLaFBuYmhMWk1GQVk3WEJhNXBtYWto?=
 =?utf-8?B?NVQ0R2J3MDZSRnI5UzVnR09EOGc1TFZ2ZWVIZk9zSW1XZmdPK3Vyd2NoVWdU?=
 =?utf-8?B?U3RZOUhUeFg4TGQyT09tQnhJaFp5Vjc3SDcvSTliRmMrUkNRamFmUFJ6UzZ0?=
 =?utf-8?B?OUhxQ1czYUFZendjWEVIajRNMlY1RW5vY1QwT0lXTGxuVE1qb0dQSW0rYzJN?=
 =?utf-8?B?OXBUZHg3d05RcFJhTWl2MEx6NW9VbVpIaVpBTkZRV1JOcUdFNDlWY1NYMzR2?=
 =?utf-8?B?d3RNSGo1RjFmbGFrOC9LQVlxTitpYkZGem05WDNseU92RFFDcTM5V2JZaWJq?=
 =?utf-8?B?cHA3Y3pPQzhTbTZYSjU0Yk5MYWFEY0xtV1ZpRGk5M0lXdWlpVTNZWkZzaWVB?=
 =?utf-8?B?TXFPNGVVdU8xL3BUZ2FaSmxlL2JBalIyZ1RmV3B3NGdkYldibXBhcDBoWUUw?=
 =?utf-8?B?blltSkFFK2hJR3VheWJ6ak1qZURJaFVkamtrK253V0x4bm9Vd2hkSURzdzg2?=
 =?utf-8?B?ejFtQ2ZYc1c3R0dUMXY1Q2xsaGJvc2lGQkM0ZzNpYmUxZVNKWllLWE80V2lq?=
 =?utf-8?B?bklqbzZ0ZHoxMGhhZlZIZE1hTUFmSHNnUi9FM3ZOajBYT2F2WGI3M3V3L0l0?=
 =?utf-8?B?TGVETnhxQktWU29CUVFLZCtpUXpNV2kwbUlvMHFSYzUyaFlET2hRRktjU2xs?=
 =?utf-8?B?emZuSko3QnkyUHVibjNFYnNqOStEYlVxQWVaVWcwUVFqcnl3ZlpKYnhYbmpn?=
 =?utf-8?B?WmJqVmlHckNTREZKbWVUdG02a3JBbUk0SG5XMDJJc3c1MnZKQkdhdzV1ajZq?=
 =?utf-8?B?RTBLeFFkYXludmVmcGR3ekJ5K3VjSi8rYnQzMDdlMWNRZXgvdG5ocTF3aFF4?=
 =?utf-8?B?UGF0ZHNQS2RyS3Z0N1AvcmJDS21CWmVLem1yaXMwN2o0WVZRaE8xekZmcUp5?=
 =?utf-8?B?NmxHeFM0V3VnbGQ3d2ZwQVZpY3FtdGhTVDhhT3hQVmozY0VJeEFDQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6e7ad15-8552-4ca1-454a-08dec638cbcb
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 15:07:17.5336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ljti8A8noFjSbSO5R3hq+oY4A2NH70l/mfPVTdiAN7HT2azJbXeSURdHlU7oElVRfY7+Xda97rJDGxoh1gzzEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8192


On 09/06/2026 16:01, Krzysztof Kozlowski wrote:
> On 27/05/2026 16:01, Sumit Gupta wrote:
>> tegra186_emc_interconnect_init() copies the MC's ICC aggregate hook
>> into the EMC provider.  That hook (tegra234_mc_icc_aggregate /
>> tegra264_mc_icc_aggregate) uses container_of() to recover 'mc',
>> which is only valid when the icc_provider is embedded in struct
>> tegra_mc.  For an EMC node the provider is embedded in struct
>> tegra186_emc, so 'mc' points into unrelated memory.
>>
>> This stayed harmless until commit faafd6ca7e6e ("memory: tegra:
>> make icc_set_bw return zero if BWMGR not supported") added an
>> unconditional read of mc->bwmgr_mrq_supported at the top of the
>> hook.  UBSAN catches the stray load on every EMC aggregation:
>>
>>    UBSAN: invalid-load in drivers/memory/tegra/tegra234.c:1104:9
>>    load of value 112 is not a valid value for type '_Bool'
>>
>> No functional impact in practice, since the hook's only other mc
>> dereference (mc->num_channels) sits inside a
>> TEGRA_ICC_MC_CPU_CLUSTER* branch that EMC nodes never enter.
>>
>> Fix this by setting the EMC provider's aggregate hook to
>> icc_std_aggregate, instead of borrowing the MC's hook.  The MC
>> providers continue using their own aggregate hooks, where
>> container_of() correctly resolves to struct tegra_mc.
>>
>> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> 
> I assume these reports were offlist. Otherwise this has a valid
> checkpatch warning.


Yes some of our internal testing flagged this and I had asked Sumit to 
take a look.

Cheers
Jon

-- 
nvpublic

