Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010055.outbound.protection.outlook.com [52.101.61.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862BF3F7AAA;
	Tue,  7 Jul 2026 11:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783422062; cv=fail; b=NgJ7I9ukf1zYxWuA4r5n1rJ5AvGLnFAoY30h53b4o1QeJYtVmQUuZtfH11Y59X3/O0qUd3vidtQR6mld3tTZcs1IuAVGPQwh6A2DKd4ZN2l64oR4WUsjUfr2ADWjNksNtF9pCYJrSbysE3pJhQf5DP1qiUkbRSwW1Jd6+5hMNjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783422062; c=relaxed/simple;
	bh=Jfi0qX4H7WtXTaKewZ5GfMy2kwSbjFLwTVrq3pZ2ig0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LAApYt6Tpj9auBWg+SV5jzstv0y318KHQ5gyj0uyIdfiHXsbxQf1QDhw7fepKJ7u3kj15k+9ZbmXFZJjj+g3gU/P/tOmW/QKDY18dLMCa3irGt3nbNXw49ufS91Z/DYFa0l4p41+djGXZzbUeAcG64ug3skFNuR5f7oCFlTAhOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ihk/rCYH; arc=fail smtp.client-ip=52.101.61.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ihk/rCYH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JMjMo6M5rbgvGm74q3bopdR2cxj6dd4X+sJvOO9386IPpBr2yT+ftpd6OF1tDa21+lJylotFysjotUjGv8k8ES8fUZd+fqNGFxjxkiIt5BonU9eKNtyXlZluETLuv+vskDbeNTAccErX0yDXkf4KIGgnb3KiqAF0iLq1ExEfoDEcXXrapVrGBzoxVclOvrlEg1Xqa8kqTAD26JOKuFUu8ea/2URDsHeszP8SsvoGic2huM6KCYExdI+KFOr97F2cDNJl0kbE6CAK29WESEK+AbBqpfbptDdQxJafRnnj58U2jpjZh9ng00PGVJDn4V2/DVlW4tfG5FkJJoPyV4MuPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ga/oqn4lk/cdZTLzS/osD7IbNyYvXyX0U/r901TPaq4=;
 b=CcknOm+BtFO9uqRo6oDPgy387x4TmVquSF7b1gi+r6lmrkt/mwGdexyJXx0hxKklIyAr/DUkal9TjPRcQlgZSphCTHoVF+mo76xikLgUAAmjKqtMCfxKI03n0H2BVsIPCMGWy4mnWon15pKI/GawDuowyo5sWnuAF01Mcu2gGnvLPrEzr2toE4kfOqnZsQmYx+bY9lYWIgMcV5aXgfNfiqvNOuqLRm6JALzK9pVUGREzCQ/dBbFEhDOk4IKc0TynjxtOegwh/IwxM//AxSUx2HyBi8kQl/FjgUOCPDuKJSv756dd66A0QqRyvpN1gLHD9d5iwxbB08+iWRCKGGKB1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ga/oqn4lk/cdZTLzS/osD7IbNyYvXyX0U/r901TPaq4=;
 b=Ihk/rCYHa2xL1rJGGPL1EXOq3nJ+Ue6J1zpUHksslLtgWdr23nzPveJw/BH9GmkVrVNT4qkBzrE4HdTrGB34em5bjnY9OsT32A78w4LWfrArV0ND0jXIcRIoHhX3hVhNyyGMgyC0MIM1F9mSBXuHV60bVC1v3oJTeaRSkz3HMmZTM0K/U424CNX/P5sGdhKZ/tNOxeB6bGBi7cEq5j6CDfLvY1lzS28Iz/ujlA5y/PMrWMnLPet8cuPDRX0zLZ9F7CAEiFSrWZx1AUrGdfUm1NVH6YgM55Hpo/91jQoOuCqXj/KzTWKFCDo16FnkbTXpuDZGSBrNNCls8B7K+0VMuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18)
 by PH7PR12MB5877.namprd12.prod.outlook.com (2603:10b6:510:1d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 11:00:54 +0000
Received: from SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9]) by SJ1PR12MB6051.namprd12.prod.outlook.com
 ([fe80::96e1:b300:7b78:d3a9%4]) with mapi id 15.21.0181.012; Tue, 7 Jul 2026
 11:00:54 +0000
Message-ID: <294fb73c-f368-4737-9450-16d6160067cb@nvidia.com>
Date: Tue, 7 Jul 2026 12:00:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] memory: tegra: add multi-socket support to the memory
 interconnect
To: Sumit Gupta <sumitg@nvidia.com>, krzk@kernel.org, treding@nvidia.com,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: bbasu@nvidia.com
References: <20260626131423.3986998-1-sumitg@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Content-Language: en-US
In-Reply-To: <20260626131423.3986998-1-sumitg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0047.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::16) To SJ1PR12MB6051.namprd12.prod.outlook.com
 (2603:10b6:a03:48a::18)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6051:EE_|PH7PR12MB5877:EE_
X-MS-Office365-Filtering-Correlation-Id: 78d00026-83d3-4012-9277-08dedc17037b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	egzyDWeti61M4v7Nxro/ApHzCoUChPtpuXMjhn4nY5XxXPt0/vKkF0DNOgUtazSVqC07/6tyhCph+juJSBYQocbsRy5wHoEuosMLpBHw5dTGVxCie2ipa2dzsqB+I7zgltaU50tHsNksD2EPmr8Lkki4DaOxcpD8PJ3RtXx54BVacJyIhcBjFQeonX7lnqMQFYtWbZnh3SiFUgNCXR9oDzyzfYdRCihOHhdU+bCH5nHPyhztcfA10KA/QJLUzfuMFTjHH8XNMzwsIsbUkni0m3IjnArmjUOg8pVRGfHU2pMbf3ml7rDBbbLwxullaGqcl6bRD8upi4ycKcRlLaTYsrp1hrHDj6JliItzOVn4l51tuXVWRfqfKc85bCiQKxaH/Rdwsg4wr6kLuTm4T9eTyLb4ZzHLOdbusb2zTZYL1ocqOZn4zgRBw4qdwPC5jutP4mASZq0MKSloFm/GbJ9B+AKAoSjbKor2FvAPywvmcUIJjvc107arLU1qSz1ktcOcs/BwZK4+3NnqKnYbL6r1yFLAUuEI/3KIHwdVRhjX2XEMSKIP/0Q7MeuHRR7hyILiVK+DiV4ErpOt4KfDBpw2DTOA4tgQComLqnecBRwAO0X9NkJDlxm0lwJsmIZBgfhboqGPWE+SkdkvcF4wDqWiAL4MvgNbh/7xKbgO70Vp8Go=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6051.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T09UclAvOTV2UUZqTDRoOGpVUDhCL3RjNVlqNXg3QlRtVS9UeXVWaU1wbWlP?=
 =?utf-8?B?U21iSWtZcmZ3Und2OTA5enkxZnpJMjAydnVCM1NVakNHb2pjZDdwTnRUR3JI?=
 =?utf-8?B?YVRqRW9UdlRVQnBPY1Z4S2FJd0pSWDBHVS9nTkl3WExwNkZENkx4YWgyN2Fp?=
 =?utf-8?B?SHhIbStSODdkQ2FyckJJeVdPV3Jra1NXUUN6ZFhGOE5YQXhSSCt1N3hQSUVI?=
 =?utf-8?B?WXQ5bXJLdjdWb3NMY2ZLV3BYZGpIb0hsUndqczFtVElhN2JiaTRuYlZPaGVh?=
 =?utf-8?B?dStGejFMaDI0T0JYNzVmWUxMblYzeFhacUx0dldJc3BrOVlBUmZVSk4rVmZq?=
 =?utf-8?B?YzZ0eUx4VGhDbUVSRnRvZnZ4dEV0TEg5d3owTU16QW5XQmF6TTgxalJQeHUz?=
 =?utf-8?B?NnV4NzFpYlNMVlM2eXJJTkZZb2preC9pT0JGcjl1TG52eHg0czdiZXVXdW1V?=
 =?utf-8?B?Z0JKb21RdjdpbDF1L1VsZzhpNjMyZmduVlhQQlQ0WEkvNEx3TXNxMXhRc0Q2?=
 =?utf-8?B?RDcxajZadmRDdHhiZ3pCTTFoMFZmcHhiLzJ5YWFMRDNKUVZZdCtqOXVlY0JC?=
 =?utf-8?B?VlBxYUJ3SDJvYUhYZW85d1dBVytZK0NQdVFRTDdFcTZhdlBxb0p0RVBIVTZr?=
 =?utf-8?B?bEVHL3VLU2gxMk5yZ1RRcmc5ejRGeFU1YnZ6d3dNRjRTendOTmUxVUJxMWxM?=
 =?utf-8?B?YjN2ZWVVcmxpM2V6YnUrY0ZnRGFsaUNFa0tLZml3WFJHS0x5ZWhlcG55a1VI?=
 =?utf-8?B?UW9jRTE3djJPZENaS0xwVnhvbEw4RmQ5c0pJK0dMWmplNFhmT21SWHpyQ3Qz?=
 =?utf-8?B?aXZrNjJnV1cxbEwrNDhTMUwrQmZsQUppTDRtUEl1RU9ubkpQVzNWZDZHdXNT?=
 =?utf-8?B?N3dUY0oyUy8rT2cxbUZZTks0bGgyQnNKNDN3WHBzazlMajdhNlN6RDhyV09i?=
 =?utf-8?B?SVdFcyt3YmNNUWx1cWdkMVFPWURXMGtzSkd5TmY5MWs5MEg1dUxBNmVkaVRN?=
 =?utf-8?B?THpoY3NpUDltN2ZVSy9ETktnZnE2OWJ5NWQzdXM1eDZuNW9wem45dGx2M2FI?=
 =?utf-8?B?RDFwUlJYck1wbkV5aGZ2azdPQjNsZm9zYjU5NUJ5NFJBVlQzS21ZTjBjWDI4?=
 =?utf-8?B?VGZEVzE4NzB2OEZVNFpPYUN6ZEQrdis2VVU0NHBBSTJBK2w2OGY4ZWFreXBH?=
 =?utf-8?B?TTJwNGM4QjFyQ3loTGNETVRobnNDZkwyVUI4aGNTVVRQdU1mQWRwWFpIeU5Q?=
 =?utf-8?B?VWI1eVg4bGN6bjVuNWdnVmp6R2VhWUZYUFFtVmNCUWVsRVozbmlPelNjS25v?=
 =?utf-8?B?N3FhbXhZcTBOQjhTb05sWk4xRXhOV3lhSXM5UnpnRkNJS3hhbWllZnVvdGx0?=
 =?utf-8?B?ZnZySFIreDUrNEtHUmdGTkNVbzNBamRJUXViS2pWRXE1SFRDSmFjWTVYQzl3?=
 =?utf-8?B?QS9xbmh2ZVp4TnZHcnd6cjEwYVdvaGt2eG5HN29EbFRXUzRvRTA0UmJmZmJi?=
 =?utf-8?B?NWNEWjl0TW9UcHNiYjk3cXppVW92YksvRENmRDZlMXRuN3hvOENCUU1JeFBR?=
 =?utf-8?B?QVB6YVRwZ2k3dzIwRzZJVEk0WWFydHN6SkFGWk5mYUIvV0lTNEFhc0R3eFU1?=
 =?utf-8?B?aVlGdnBYQkNYMjdoaVQ0Z2MyakZ5TVRUanN3bnNudnppYThUbjNHYVhTd1px?=
 =?utf-8?B?bDdrTG9lZVBjbGt6MlZwNnU0OFM5emRjS0hVaXNrcHplbEJQR1dzRGVOZUZH?=
 =?utf-8?B?S3FjMkdkSnVNWUtnU2NYNkRqbTI3UzdLWHpSVjNic0Yxd3dFeTdFTVFGckhF?=
 =?utf-8?B?Y25yWmY3bXRtN1hrVlpqcURJTlFKRzY0UDY4OTk4dExlL3Qza0lPRFcvM1hE?=
 =?utf-8?B?dE1sWi9RVDRNU3hUb0dCL2F5L2VUdFlzKzVhZkU3Q2tFN1AwSTI1c1VhY1Nu?=
 =?utf-8?B?dklSUjVMSlNGQVhpWi83Y1BxMmxYMkk2cEdHTTFUZ3VxWEVRbGZ0RGNzcS9B?=
 =?utf-8?B?dVlFNVk4ZG9EVDhYYW9zcDJrOC9pQVhBb1NNSjFRcWloRmlKbnhzRllkeHhI?=
 =?utf-8?B?NHRSQ29xSVliZ1dlRDlTYmF5bzhDb29UcjlUdGVFYmEvT250eUk5N1RvQ1d5?=
 =?utf-8?B?Wkw5dERWcWNZSG5hTnV0MytGZTFUd0QzMnRpRTlrS1I2eXpSa3JRbUhVekhi?=
 =?utf-8?B?ZjBKY3Jnb25RNVdmcFZBN0kvVG1DZm5obkRYODRpeWVtR2RxLzNjNEovNHZr?=
 =?utf-8?B?V0lMcnpFOHNjU2RyN2ZVeFRuU256UFh0bEpjK0RxcjNhSnJPME9hZFJubUNu?=
 =?utf-8?B?TzZrU1dFZ1ZuVGRoMjFNaW95U1hweWhZRkFWcUorQ3p3RnlXYzJjQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78d00026-83d3-4012-9277-08dedc17037b
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6051.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 11:00:53.9131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0OXdN7ZeK2DLgULweSZWhSvaWZ4ZwB1O94+gV1MVR8CMT3DV8E6XCHDOaHVSYSzTLYvr2LCm1iiXTyd0rXqUWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5877


On 26/06/2026 14:14, Sumit Gupta wrote:
> Add support for representing each memory-controller instance (one
> per NUMA node / socket) as its own interconnect (ICC) provider,
> with its own MC client nodes, to match the hardware topology on
> multi-socket Tegra SoCs.
> 
> Use the NUMA node ID to make client IDs globally unique across
> per-socket providers, since the ICC framework allocates node IDs
> from a single global IDR. Per-socket MC and EMC node names are
> also derived from dev_name() so they match the corresponding
> debugfs subdirectory. On single-socket platforms (NUMA_NO_NODE)
> the existing client IDs and node-name strings are preserved.
> 
> Each socket's MC and EMC therefore get their own debugfs
> subdirectory under /sys/kernel/debug/{mc,emc}/. The parent
> directories are created on first probe.
> 
> Bandwidth requests from MC clients in a socket are routed to
> that socket's local BPMP.
> 
> Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
> ---
> v2[2] -> v3:
> - Reduce per-socket shift to 12 bits to keep composed ICC node
>    IDs below ICC_DYN_ID_START.
> 
> v1[1] -> v2:
> - Mutex protected lazy creation of the mc/emc debugfs parent.
> - Rename {mc|emc}_debugfs_root to tegra_{mc|emc}_debugfs_root.
> 
> [1] https://lore.kernel.org/lkml/20260521140546.3023819-1-sumitg@nvidia.com/
> [2] https://lore.kernel.org/lkml/20260602132314.486066-1-sumitg@nvidia.com/
> ---
>   drivers/memory/tegra/mc.c           | 40 ++++++++++++++++-----
>   drivers/memory/tegra/mc.h           | 37 +++++++++++++++++++
>   drivers/memory/tegra/tegra186-emc.c | 55 ++++++++++++++++++++++++-----
>   3 files changed, 115 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
> index ec80ea9cc173..51ad0d3e48d4 100644
> --- a/drivers/memory/tegra/mc.c
> +++ b/drivers/memory/tegra/mc.c
> @@ -3,6 +3,7 @@
>    * Copyright (C) 2014-2026 NVIDIA CORPORATION.  All rights reserved.
>    */
>   
> +#include <linux/cleanup.h>
>   #include <linux/clk.h>
>   #include <linux/delay.h>
>   #include <linux/dma-mapping.h>
> @@ -10,6 +11,7 @@
>   #include <linux/interrupt.h>
>   #include <linux/kernel.h>
>   #include <linux/module.h>
> +#include <linux/mutex.h>


There is a conflict here with the latest -next and so we need to rebase 
this. Otherwise ...

Tested-by: Jon Hunter <jonathanh@nvidia.com>
Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Thanks
Jon

-- 
nvpublic

