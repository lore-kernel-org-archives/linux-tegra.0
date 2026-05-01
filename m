Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012015.outbound.protection.outlook.com [52.101.53.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F01372684;
	Fri,  1 May 2026 10:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777631400; cv=fail; b=ZeaOoHkR/Otqo/6c6O0EvWA4dsNyH4TnmxINjdH1qMxu55ot/G0CR+1aLTxgj75oMsvmRqQnQIKCBw+Kop+hpDbum3pqx/cUJ53QMAsNgvUDCIE4cdssWIIyc7wVwM5RFZ9lZoHHD++eUaBsNg/tDEXIrfYg2aC6wjw0RJSQrzc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777631400; c=relaxed/simple;
	bh=meMoMPMTWWda55HVJIgp2ApbBxqLCmr4TXjsvNatzIs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ndQ2azzJj3Zwx03P/jV62/Sj3z/vluwSkxzHgaR4qEmnFJv4+igkJOE3SnLjFxO0dKtfCgY2lySSWkzPRMnoTarcC/qCPkoe/PJ7I6Vg6olUfYQMwLL0fGI7hs2+FA9bKmQu2jpdLhRi8WGF2LVQqKG0LvKjck1kyZperBAuN2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Nf0fUBzU; arc=fail smtp.client-ip=52.101.53.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Nf0fUBzU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YnupNMJTudIkc2z8/AxhmM+Dd4BevJIfPiDKP+132r8rWSO+iEcxDfl0WfYS9dGM7KfTgpFYx5liG277K1oA8jGXyNXRZJ2g/BOrqMVCtSBtAtrJqzMAz5OsnwR9Ltn1m0r46DbirpiukKRMZYgonvBFvU9W6DWOP2/eanGWeADHhfqVChbJN7PVwqHELB3FlqRWWoLpbp3gTA/WzN/6UoHoxvw/VbDjjGIrf+CcsvvKCAOmDDwVXtbAsK871Eb1EgarGAxFjF3kCH+n2PFHILsERnuFppaSRAXVNx/yGMRaNKW1N91pklNQnV2Vj5BJxzz342sGvIXbG26RgBxsEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1c/F/MFl4/qAf9Dvi74f1N1GTtLfV1pZYEAr4h6t9u8=;
 b=D/ffOJhnDcuJfyy8qvZFGkwvfkC/n0wzilD1iPTFw23PJ6jrUhwMuQsX5rmmFJiB9r0feifkVUaC6aFnXT38dyZDy3uLgC4GVkGTy2cOycQ5UNWzVzSxAzBvSEARaoajxtMnVM8G07yb4mCbeiteqkqpZRhjxbLJxUk/a0wB2a1hi1O3xGLfb5Eh577ctgSB9o1bx1r8RHIT/pC5JBVNwn4MIU7VZUkpvaHiuY5/ES1j1e7liHLQ2L5L63ahaSS3Tl5e3qMyr7qLL4tjP5qT5W6rq2Z2a/hzH2/UnxdLXzaPejiOBOYh1/daEmrEKgH/1hn4xVK38vbYvRqCgoFcxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1c/F/MFl4/qAf9Dvi74f1N1GTtLfV1pZYEAr4h6t9u8=;
 b=Nf0fUBzU/irTZBDKcqvYTnxisteFIQeCN9ljgwKb6cNoB9M74MuavlntKdhtPifx+pfeoEzYjwl/QAPbSPJ7+NLIgsqp2+dOeTM4MDtXOTnNBujyHjnvGRf6eOfuHS1s1RLr6pBQ63JEJ78+Kxqhk/wvzwqbKlkAtZAs1AFVfkaloGZljEr/4LTXdgEzEoF/ySSZhlbWfGJBukRbzpLqDsGh6yUSiOjOeoWbt6mXCzbGREOwU4rvG0XqBVWCxwu5f1LXdd+nxqh3XHehWXdM/KO1R4yszsqLjIS7ho6M5woQ3egi86T5z7G+EppXIkHxog9Rt0w8PlJ2ueskbqdh3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS2PR12MB9750.namprd12.prod.outlook.com (2603:10b6:8:2b0::12)
 by SJ2PR12MB7893.namprd12.prod.outlook.com (2603:10b6:a03:4cc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.23; Fri, 1 May
 2026 10:29:53 +0000
Received: from DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391]) by DS2PR12MB9750.namprd12.prod.outlook.com
 ([fe80::56a8:d6bf:e24c:b391%6]) with mapi id 15.20.9870.020; Fri, 1 May 2026
 10:29:53 +0000
Message-ID: <81a17221-ba3d-41b2-ac87-a137d1e5d9fd@nvidia.com>
Date: Fri, 1 May 2026 11:29:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 0/3] memory: tegra: Restore MC state on system resume
To: Ashish Mhetre <amhetre@nvidia.com>, krzk@kernel.org,
 thierry.reding@kernel.org
Cc: ketanp@nvidia.com, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20260430095202.1167651-1-amhetre@nvidia.com>
Content-Language: en-US
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20260430095202.1167651-1-amhetre@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P265CA0012.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::17) To DS2PR12MB9750.namprd12.prod.outlook.com
 (2603:10b6:8:2b0::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9750:EE_|SJ2PR12MB7893:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d2b66bd-63d6-4c2b-2034-08dea76c94f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|366016|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qb+vBNuCp9D3Uahx7S7uHKnmIk1rq2AUAdGpQC0buKgy9bVWUIYwtb3SKh3UeE5V1atvI8A8pKBIYQsacJacj3XeM+0ll4Kv13nFG3F+6LRsdb+rfJulZe/5EhuS9fn2pn+ZRi2a2AkMayfIXoSkCR4ENGBknBu7m97pzbxElj612Zhu5ZZRSbKlIK2uEbum4TZWg6aWiJ6ksepnynWYav+0AXEz/kNYVd380zEQxRKN71O4Asb7l3y0uxen4iK5IFML7cgRjHY8uvTyjZHT0YwvCngXaDZAynkoNrhnBGBdxQhlusLwiGyUqPyypYjZ1G57GWBlBWRfqhJhyWfZ3eiTJuKA2WNnrolTNRu8kIVc4e4sGz2hKRxedFeko4XHEr80C/q0tcu/HchrWTQnmA/SiOXsJ9TWyENnMIVnJWHQfOn/XLWxL+Sf5X0+Pq74XkIbw3rFFMYWTh3eSM0ZBD9R/qHQO6pvrTkh55hw3bDlHnIED2eaH2YbZ61Y4XOZsyOR46yba/+coZxc5wdhmOUdbynvakre23S6o/lZgrTKXfAJLzdEqVSupejRDTgwdxt6gOACqUQhywErFIt/aFBIBMcVfIAGmSasQ0Ayivr0fi/W2FFP9EtOKt2nQhQNc8GP6l0Bj7/I8NUv9TCbTLMp0JTDoKQd1ZTRcYLt0N9olyRUuQ7+KLwpB7AIWNLM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9750.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXppeU5mL29sRFpDc1NTdUVIMFZLNkpZMWQ2WXdFSEdzb1psZ3VmeSsvVW9o?=
 =?utf-8?B?ajhCcVRMOGtZT0Njajlya1QzMFpwTlBqakM0SDJ6MVJtYlcxcE1GcFVvM2gw?=
 =?utf-8?B?SlFBQmpkU1J3NmthcVpEaVBLRVl1ajI4Z0dMcGFuMVpvb3UwdXYrTUxpbmhX?=
 =?utf-8?B?SHhmZ0R6UzhpU1RBV0FwMHcrelhIclJ5R1crbWszNUV3NmcvOGRIaGhYMk45?=
 =?utf-8?B?QURMTnpzZnQ2aDM4UzJ6eXlYV2dyWlRmV1BLc0JWMUplbW15TlVTRTNmSGEv?=
 =?utf-8?B?VUM4Z1JZTHNxZTJna3NZZ3JnL01POXJZM1BXck9USG0yY0N4NTdTb29qY0Rn?=
 =?utf-8?B?dFBjWjE0cG5KYWwxTFVEa2x5ZWQwanRsQU53ZkJ6VTBQU0E5QnZXNlZFUlpW?=
 =?utf-8?B?U1dmRHFFVDM0b3ZybTZINHh6eUREaURmTVdYNmtONzdEUmN5eThCYXBUV1Iv?=
 =?utf-8?B?cFM2dW1BMjdYcjJ6d3dBK29lVUlEMU1TRzlGZVJRak01by9xOGY4RjJub0Zp?=
 =?utf-8?B?ZnBHSnZ2WFJ2dHBSTlBqeFU3dVRzZ3IyZXdHbUd0NVdGOC9jcldGU05yWEl4?=
 =?utf-8?B?U0J4T2ppWDhBMmRCclhDTWFLbDVaL0lJUXkwbU1lMCsrNzhQajRreVQySWN4?=
 =?utf-8?B?RmlITFJmdzdFT0l4VXlxWVlzV1FyQ3lWcldQUFU3OEVlRlVTVVQ5blU0VW1z?=
 =?utf-8?B?cElKRnBOS0ptS0NocDhmUCtSa0JNd05lQXlnV2I1M3BmVnRTMHphTFhpMmh1?=
 =?utf-8?B?VWtORWtIdnhtQ1JzcElnQmozWXpKOHdiS0xOL2pqM21uR255QnpKZHZPTFpq?=
 =?utf-8?B?UlB1N0pLdGtmSUJiVmIrcWl0b2dXZWd1MnhnQTg1UWRhWW9pWW1YS2NLVEJ5?=
 =?utf-8?B?TmVhZkJ2emFiU01YL1hGQzZ6aStLem5uT2wyaVhsSlJKVkJwd3o5VDFtbUFJ?=
 =?utf-8?B?bkRmS1p2THFLT0E3T1ZNSzhwY0JobytuN21RL09lSlM1SGZ5eXJFa3UxSmRw?=
 =?utf-8?B?TGMzNkx2RUNUNWg1MzFWbFUyWHRYUTRheXdkKy9sVHRaRllzRFVCRlIzS0Yw?=
 =?utf-8?B?TlpQUEgvSDJkb3Q5RERxbGlHKzVVYlkrZ25HaGQrU2VWRVhTOTY1cHBpZDVY?=
 =?utf-8?B?WlFNZk05V0Q3a3BXM25hbUJWSXo4ckhBby9UMlBhUkNtVWhyN1hBTTYwNm45?=
 =?utf-8?B?ZWd1dTEyaDc2cnUzZkVLNlFTWEVsWThNL3VVaW94ZTloWk5qR0dRQ0VMcVV1?=
 =?utf-8?B?Z3BYSFFCNG1LdmJhRUVYb0IvTjBsMFNzRmtFUmtDWEtFYmxJYjdGcVA0NUdT?=
 =?utf-8?B?T042cDhrdGVSOXR5a0puK3ROTlFZZUIyMmVuL2xlNkJKNW5lNDNxQ2tkUm10?=
 =?utf-8?B?VVFLVjFsWGowK3dMMTdmNXArOHY1c2VxQmQwWVhKaThtYjljcDk3QVAzT21q?=
 =?utf-8?B?dWRmcTdBVkk5YWhCWjI0Zm54YmNndEYyZjh0MFhBeVJ2WGhISEt0S2xvYkhS?=
 =?utf-8?B?YzhucTZOdzlxZG9GVlBFamZRc3FLVk9XY0pSNXRaVlhVQnBEMVBXeVdrT3JX?=
 =?utf-8?B?Y25WeWE1eTNwNmQrNzI3KzJudTA1OHhyNi83aEl2aHJ4bGNzcGRNbVZncUxW?=
 =?utf-8?B?ZlRHREM2eXZMcm80MXNPTjhWcXNiNmwyamRVa2NSQkk3ZjZmMzBKd1VLdEZE?=
 =?utf-8?B?ejFuSkZveGExRS9HODNGdUV0ZFo5bitEZ2RJMlBGZWljR094UHAxaTdWemIz?=
 =?utf-8?B?TFhvbW0zd2hLMFgzOVdNZzM3UjdLbnczZTN5QmNocmJ6ZGJTUXEvc3I4NDIy?=
 =?utf-8?B?U0JlcWhJckZZUncwd3FuZVJGNkx0S3JjNGVjeXVSU2pKbFM1aENtSWM0VHoz?=
 =?utf-8?B?K3V6VGl3T2hyMXNQM21paVM2Yk9weFp3cmE3Z3Zub2gwMUpoeFc5cGlKU3h6?=
 =?utf-8?B?WnBTTlh5ZkJRcC9XaStyNFpiZm9kNE9rK2ZMai93c3hzL2dxTk1vSkdvUTZi?=
 =?utf-8?B?TmhYM09KMkNqYXplZWhPLzAxbFYvNVlCVTVNN3VIRnoxc1phenVxb1oyN0xJ?=
 =?utf-8?B?WSs3MGM0eVA4TGUvM3MybTVGSlE0MTlaSkJmOHVrelFQSDlTRUpzSmVvMkNT?=
 =?utf-8?B?L3oxWHlRMmhqRDJPcmtia2cwY1VncDczMUM5UXVITlhQNm1NTVMxeUFoVndv?=
 =?utf-8?B?M0VRd2Q1cUNCMklyMG9Ha0lFamdZZENldWx2YmJsZVRyZkVUZjRNdlk5NVRo?=
 =?utf-8?B?VmttVkU2M3c1Q0hjNldHZzdVOUF2aFNnREtoYzZ1ZVY5TktHQUtsWTBCWVEx?=
 =?utf-8?B?MTFjbGhqVzNXUmhTZjRPbTIzUEFzOFFGOWtIYUZ4NzE4M1JQL25lTGl6d2lz?=
 =?utf-8?Q?ArBRZEeqHsbA0SMokNENsmmwcTbIRLEY0zn3deipUc9Sg?=
X-MS-Exchange-AntiSpam-MessageData-1: FTOB7rBSnGon5w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d2b66bd-63d6-4c2b-2034-08dea76c94f3
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9750.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 10:29:53.2551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ATm4oE2BEereiRjw5VGTqWWFp4/HsaNiSs/2tg4a/S4uer3wNKyz3NqnK0AoNwSgcjOBulqm62B3T/GFswphsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7893


On 30/04/2026 10:51, Ashish Mhetre wrote:
> The tegra-mc platform driver does not register any dev_pm_ops, so the
> SoC-specific ->resume() is never invoked (e.g. tegra186_mc_resume) on
> system wake. On Tegra186 and later this means MC client Stream-ID
> override registers are not reprogrammed, and clients behind the ARM
> SMMU fault on the first DMA after resume.
> 
> Patch 1 makes the SoC-level ->resume() callback return void, since the
> sole implementation never fails. This simplifies the wrapper added in
> the next patch.
> 
> Patch 2 registers a dev_pm_ops on the tegra-mc driver and routes the
> system resume callback into mc->soc->ops->resume() so the existing SID
> restore path runs again on wake.
> 
> Patch 3 factors the existing intmask programming out of
> tegra_mc_probe() into a helper and reuses it from the resume path so
> the MC interrupt mask state, which is also lost across SC7, is
> restored on wake too.
> 
> Changes in V3:
> - New patch 1 to change the SoC ->resume() callback return type from
>    int to void, so the wrapper in patch 2 does not need to deal with
>    an err value that is always 0. (Jon Hunter)
> - Patches 2 and 3 simplified accordingly, no other functional change.
> 
> Changes in V2:
> - Split the original single patch into two - register the PM ops and
>    reprogram the MC interrupt masks on resume.
> 
> Ashish Mhetre (3):
>    memory: tegra: Make ->resume() callback return void
>    memory: tegra: Wire up system sleep PM ops
>    memory: tegra: Restore MC interrupt masks on resume
> 
>   drivers/memory/tegra/mc.c       | 37 ++++++++++++++++++++++++++-------
>   drivers/memory/tegra/tegra186.c |  4 +---
>   include/soc/tegra/mc.h          |  2 +-
>   3 files changed, 32 insertions(+), 11 deletions(-)
> 


For the series ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks!
Jon

-- 
nvpublic

