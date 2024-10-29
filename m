Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1878D1885BD
	for <linux-tegra@vger.kernel.org>; Tue, 29 Oct 2024 15:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730214452; cv=fail; b=OfubzrQqZbDKgDPifg5GsuhY90NCqfs/uPf+zaCMLsm2OihVfoSPEiR+MhAOI7M9juhVQhtIvKgbxKelAEkNaWYKstTNDCYWQRRSbtaBkzKFIJ/npR8v1NjL/WAX+W9z9S41WM57r2ISGDIeG3e6Rr5Lc5JwJ2i3EyzqJPLsHMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730214452; c=relaxed/simple;
	bh=TyrdSLK9LLCKV07yfQtRgN0UTJ5KFZHzj7yjSfXDyx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hdh2QcWHYbnovsmnym1N0pt/sYMaeIJwEwy/HdOxPOl1XIWP0oBArrA3ylLMJPIRYCteQz64rj3J+VgfMf4fMO1kMT8bvTUy0i4m+pvxMEQ1Fx9AFeaOFNu80zoAGIPloN91jVeH0FTtIdSfxEWbx4UdfMDF1QlolNIXPQl6yLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tBFE7o4h; arc=fail smtp.client-ip=40.107.223.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tBFE7o4h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZaLkrOkAg3kMz1n9NQs+O+HGUsZRrjUPz0YgEUftXx5Ev8JMbBhzzVB0SznCTzeTwhw5Ym3dpkFk3/wZCW4YPaohJXcDzL8luOJ7ki3Hr2TSf1f/SKyLbe2Zl09zPX5win/FZDvAS5PiYpj+d3SFuy8tCYaJUc5Eeq5k+YtgOZStt28KmnLg4FUhePPo9666yrFXQLUVV1cC4Nmg2hY6n6628YChwlqxGa8FHxoOE1+Fki0aPYwRWn7fV9oyMG+tTjzOFA2A+2Pxzla5M0iuXaeDyiOv67lZNGrDI5XEM7Y4wC83JyhUIcgwbfpdK2sf8gAzWPFzf52RyFnzf5G8dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ckAycHEDNfh7LheqzAXSHeNiEiPu7NfS3ugPk89zpAQ=;
 b=kqoHKZMwh0A1d7gWxM+2qTKmZAAWJFJv9ciOb3nvsSyFmlk915ubm7S5edp0mkqWryeDUonTegj+IAlJi2nLYCvlAeE0yvMw1DBPcbKxn7hIQiXmvVE+6EjXeX16A2Rg05cfv0/mYd6fWr08HM8F4it8G4FDwHnm6whHOC2Mn296K3h3CfVmOBl8I42wMhBqMYow3II5LK1ceF9ajMXqimQwFnlcoJs/7rf2W4UnYczQSyFtYhyEdskhYlTaBtHRAZJI1pOO5IHELa2v17zaaseWHBY7CgN3q6DzZUKhOI9AB3Fa01gSYoXokD89wLWMGXgPnxzwr++NMyEvu74rDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ckAycHEDNfh7LheqzAXSHeNiEiPu7NfS3ugPk89zpAQ=;
 b=tBFE7o4hr1dzMsvE1Wuthmic5rmNpJhlgXftaF2cYbu8Wlu6kFw2La063Gy5ry6iLiUAXHeb/6oz3AjTwFNbb8IWEeTWvSST014709mSBRtFO+c/9Zn2IJUQ6XrNYVpjdWp+T5bSKAjDl9gUoKoFeUul4S03EfPmi9XUaEqYfQzwzvnRuJkzGA9vI3hQtas8KWcCtlLeGqcwgrf6PosEwdCYwdPJpV6w+WwOUwb4My2JqGw/X/xK79ezNXy+q+IMvMe+nV41RFf/x6gqI7ljFGhKHKSNLwr2t/F8r9D/i3KmH6akMRXhAgtZfHUr4blYfwo4/yoK2eY6Bmvxdo8QOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DS7PR12MB5887.namprd12.prod.outlook.com (2603:10b6:8:7a::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8093.25; Tue, 29 Oct 2024 15:07:24 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%7]) with mapi id 15.20.8093.021; Tue, 29 Oct 2024
 15:07:24 +0000
From: Zi Yan <ziy@nvidia.com>
To: Jan Stancek <jstancek@redhat.com>
Cc: rppt@kernel.org, linux-mm@kvack.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jonathan.Cameron@huawei.com, dan.j.williams@intel.com,
 David Hildenbrand <david@redhat.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [bug] aarch64 host no longer boots after 767507654c22
 ("arch_numa: switch over to numa_memblks")
Date: Tue, 29 Oct 2024 11:07:21 -0400
X-Mailer: MailMate (1.14r6065)
Message-ID: <525593F0-1AA8-4BCB-9B6D-630505C49F10@nvidia.com>
In-Reply-To: <CAASaF6zxBr2J_-eESQQXCRxOgy4RsuxG0te7d-wOz9d2YXj5Fw@mail.gmail.com>
References: <CAASaF6zxBr2J_-eESQQXCRxOgy4RsuxG0te7d-wOz9d2YXj5Fw@mail.gmail.com>
Content-Type: text/plain
X-ClientProxiedBy: BL6PEPF00013DFB.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:1f) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DS7PR12MB5887:EE_
X-MS-Office365-Filtering-Correlation-Id: d86c5cd4-8b93-4558-bb4f-08dcf82b64d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?35jaaQu+k28C6fZ9nH34CBVNEiK5oOC+5j7/RUC92Dy9wFsSKUID2i/XuOZy?=
 =?us-ascii?Q?esAZByR+5nTSAmXl7rxUCRWVkC+sRiffa2Z18RpWYqZ1YK1WNd6m+sNPbZMn?=
 =?us-ascii?Q?iN6ms9g7z2KWJxWtmcmARqf0ZK2nP7kS2QIWhIATF+N9dXdXXvr2JDEjvNpG?=
 =?us-ascii?Q?ehy1OAdtu3YhKayZGFsUqi95U7oojZh5+JZuh8AIYAtfZmeULJ27vZ/UdWIJ?=
 =?us-ascii?Q?e412XBNy482EB1kHnPvBMXPpBkB85sJFFbpTXGAbGmuHI62EWEri8/qHluhQ?=
 =?us-ascii?Q?KZE/ZqgYqMqNN6Oob4+31w55a4kdhhF/iyLu2Kx3D1V/LOgu/KNC7jRqU/El?=
 =?us-ascii?Q?vOYakveEiMDwO0u+McIQK+Kzvx6eIQjRb3CTzxZdeFGLMK9P4kfvOFeabe5B?=
 =?us-ascii?Q?eybvk6phfVBTfUqzveKyp7fKNpUYsiTXro7nXXnBJHNhQRzNOd5Do6qqJ7az?=
 =?us-ascii?Q?CYdXU5V3/1y0InarCcAVSdpy95kZjeeFkjgoESKaYxuKPrGde16ucmee+kZm?=
 =?us-ascii?Q?DDUYnlL3TyEJF75zbvkR8ZYGknkINg4XSQLaASETf5kH/5TEL5Dpr6t2H/Zo?=
 =?us-ascii?Q?b+Bmx4KNBkIJNmHnFThvNC4r1XIxow/F+w5S+bJI9a4MwZF4oyRGggXVlRHs?=
 =?us-ascii?Q?vq7aZlORQ63B042hbeilZUfeMi8KdtQ6xWhaBqJREEWMXWkoszzo/dTAZSwb?=
 =?us-ascii?Q?6sLyk+DE1V4sNgeVHk2e0YiQHhJIezl3YmXySaeo7LSVzG4VT4hLbXZ4t5Vm?=
 =?us-ascii?Q?ifofixAm0DKRvMWFR/xJugtgt00GBWjQ50knJt/fSKo+TfZFWHL5fTfxHCbl?=
 =?us-ascii?Q?XScLPuHDBjokTyvYdz2jA4a0nX+awXl9lMToju7v9BSnR+pGIn3wC9JX8JjM?=
 =?us-ascii?Q?KbFtKtC8LLKdI4A2im6/xs3w4c6TFfVXML+KW2GqxzDBxPVtJM1t5w80iujj?=
 =?us-ascii?Q?cbCk84oSwztQBtH9LHsy25XUBCtmDxSa3Q5NC4miBpuxnX+LO1XYWM6f95Ph?=
 =?us-ascii?Q?7/+j1m2vW52S5GAJIge6YD+uK7+Nlx8YDDrfgbclK3aE30e7zAhp5G6oDRwB?=
 =?us-ascii?Q?DaV2sgwmzDHEpK/U4FVKc8Xh6xwRHDvaeYIAwYEbWG1CliRbkKCVNYpO8wO4?=
 =?us-ascii?Q?A22QdebAFeNKkqRBK98NzcZxyT/IrrxlBS37DcaOYJ7YrBQaB9gtKRfq7/hQ?=
 =?us-ascii?Q?w3wubnXAAkGDJpOg/EcCWRIhNYalLdLQilHBikq5vuXkW+CMdDAWxbl6JoYO?=
 =?us-ascii?Q?i2lkZVSISI+Fi1bPdr4r2bE/e2D6iiqWUlXSHqdkGz3Fuvej9e/OYBooIOv6?=
 =?us-ascii?Q?7mkZ8us+c33IPKAcOa8op93P?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1zZPfgmFkPxomGKJ0ii0jSnaUfmR/kR+n+RuvsHEQlpDILsYCHkiTiGF0fPa?=
 =?us-ascii?Q?YzVXfjny5pQmXC7Ynx38Q4fbYDXxIM/bWGDOoBbRI0W+efYBfskn5PlTWymc?=
 =?us-ascii?Q?/ERoIO+lkbADuTGriCIyvjZUW+uzrg36YtHtU7TS3W96rLKKUqBASwuMSQhe?=
 =?us-ascii?Q?osaGQS6DpzEpT491uv6eqEYaEdDPRnJuGi6HO7D98e6mHOyFIZw40Cp1BSe/?=
 =?us-ascii?Q?xVwKBlPNFzcpjKTaE7+WHSIduNnoXesOKmHQTMK+1aNKpiQomxVQH0+Zo9Si?=
 =?us-ascii?Q?4pLv3n9nD1K2vh95zihZBI+hBuXglaEhvfPmW7u4vvmYcZlFkRB7PU8Sb0xT?=
 =?us-ascii?Q?JOhDVIVC56KfA1j3VAcozV2ZYYbhypQblLr/WcPAP+UPkb06ukGSk6AhHJk+?=
 =?us-ascii?Q?1ONrc6/aL2vL14p2R1i9Bvq5LXaNp8NPRgnqmthYJ4LDPGuhq8lu+TOsU84F?=
 =?us-ascii?Q?k/dCJVcRMtdOPkQ0/54K60xWa765cglryDVJATPdTCsZcpSjv34JX+KuXF2S?=
 =?us-ascii?Q?wY44lhrQedWoiEkrzcj5YxEwYvcURx5rMEYzFpJvT2xF7M/c+HiN03YoGu3Y?=
 =?us-ascii?Q?+A4E7jLy4ej5gs29e6rfWA50+J5RAQeg//gep+7djaCa1v4Evp15Wb0uOvMW?=
 =?us-ascii?Q?RJTWMr3tgt0fXoeUzVtkX/zseT2WcZrcXN9DFbP1aov5fokK7hfyiT5X0sl6?=
 =?us-ascii?Q?BwBSC8Ll4saQ/JEtoruOK2zbPjAKFhYQ7UHYiWCJph4wETn67r/u9M4ctVvF?=
 =?us-ascii?Q?ZxhKq0xM7+4P5M0KYnUVp4jY4bEhmIaKpKnC0Nld7tZkJlOvTMd/Uv4ttfom?=
 =?us-ascii?Q?evFeCdFPug0fuJG2kS6nCSiXcS2f06KvERYNkTqsncDQbdn0qxFoDnRB89ep?=
 =?us-ascii?Q?IPHWTK3InWvGHktpf7rr5HYrQ1agXodwfShLPEM2C31eUumzmyq9SFKdUWiK?=
 =?us-ascii?Q?u6XF3RtKj5oPsRQn0FoOd1N92rjZHZY4+uZKtCZZ/lj4iGpRVBMMqS7WUygr?=
 =?us-ascii?Q?urgt63uPyI5Pr0GRoLzw2BDoxPLghprqaIER4+Hiq2bQOZXlp2KETpkmruXJ?=
 =?us-ascii?Q?BaWhhq/UwgqT9YSKZDXd+wCvoSurTP20bvE+uaR+CbRNlEuCqF3nPsmsqXH9?=
 =?us-ascii?Q?qXIYzSSPsH80oad0OlE0I/o102fx30u/mOqz0/xKSylNFdUajRZ631kmoiHz?=
 =?us-ascii?Q?YEDfv6GrftFd99rEOKZx7AVLqsheVAu4ziWSfg6o7fe6/rlt2JVInk4rE+sB?=
 =?us-ascii?Q?tY0h6saBSZu7tKbda/QKrtZ+gdMwh5Zy+WdAzUxnZnHwWLSYPtXr3fmJBFOC?=
 =?us-ascii?Q?jZNmQ1Pg38FSJ3Hz8hOmMlwpqgcWWB4OYMeIx0VceNs779E6lI3VPKJwBkJu?=
 =?us-ascii?Q?Mt0xWgztixxdB484nQRyg5nbMu+uXrlosYIsJIjqIhQ8UUv96U5iwSrb7p07?=
 =?us-ascii?Q?5U8hHorp3X29ZRZnLu5lc1dEXP9CrVSt0Eq1ybZND4cMGdxlrtZT+Vtobde3?=
 =?us-ascii?Q?N0zSpsbj/DhMyIYTGQVVhpt4Ars+DWiEMZJYQs2CBG9y2SoKiZIpnMkjHb5x?=
 =?us-ascii?Q?RhqqpiW17mqVCC9lbepoxfr4yxf/2UPfgrx3A1uQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d86c5cd4-8b93-4558-bb4f-08dcf82b64d6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 15:07:24.0002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: meZ5ZiYFMNNLgnrAuSVfTbYMGNP21Mn9Bo6C1M8HPvTd380zRAp71vXVrvlDkwNx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5887

+tegra mailing list and maintainers

On 29 Oct 2024, at 8:47, Jan Stancek wrote:

> Hi,
>
> I'm seeing a regression on Nvidia IGX system, which no longer boots.
>
> bisect points at commit 767507654c22 ("arch_numa: switch over to numa_memblks").
> It hangs very early, with 4k or 64k pages, with no kernel messages printed:
>
> EFI stub: Booting Linux Kernel...
> EFI stub: Using DTB from configuration table
> EFI stub: Exiting boot services...
> <hangs here>
>

Is it possible to have earlycon output? It is hard to debug without any
information except kernel fails to boot.

Since the previous commit boots and I assume both kernels are compiled
with the same gcc toolchain, this should not be caused by the binuils
bug in 2.42[1]. Is your binutils version 2.42?

Thanks.


[1] https://sourceware.org/bugzilla/show_bug.cgi?id=31924

> Here's a log from successful boot with previous commit:
> https://people.redhat.com/jstancek/aarch64_numa_boot/console-log-good.txt
> and config: https://people.redhat.com/jstancek/aarch64_numa_boot/config
>
> # lscpu
> Architecture:             aarch64
>   CPU op-mode(s):         32-bit, 64-bit
>   Byte Order:             Little Endian
> CPU(s):                   12
>   On-line CPU(s) list:    0-11
> Vendor ID:                ARM
>   BIOS Vendor ID:         NVIDIA
>   Model name:             Cortex-A78AE
>     BIOS Model name:      Not Specified Not Specified CPU @ 0.0GHz
>     BIOS CPU family:      257
>     Model:                1
>     Thread(s) per core:   1
>     Core(s) per cluster:  12
>     Socket(s):            1
>     Cluster(s):           1
>     Stepping:             r0p1
>     CPU(s) scaling MHz:   100%
>     CPU max MHz:          1971.2000
>     CPU min MHz:          115.2000
>     BogoMIPS:             62.50
>     Flags:                fp asimd evtstrm aes pmull sha1 sha2 crc32
> atomics fphp asimdhp cpuid asimdrdm lrcpc dcpop asimddp uscat ilrcpc
> flagm paca pacg
> Caches (sum of all):
>   L1d:                    768 KiB (12 instances)
>   L1i:                    768 KiB (12 instances)
>   L2:                     3 MiB (12 instances)
>   L3:                     6 MiB (3 instances)
> NUMA:
>   NUMA node(s):           1
>   NUMA node0 CPU(s):      0-11
> Vulnerabilities:
>   Gather data sampling:   Not affected
>   Itlb multihit:          Not affected
>   L1tf:                   Not affected
>   Mds:                    Not affected
>   Meltdown:               Not affected
>   Mmio stale data:        Not affected
>   Reg file data sampling: Not affected
>   Retbleed:               Not affected
>   Spec rstack overflow:   Not affected
>   Spec store bypass:      Mitigation; Speculative Store Bypass
> disabled via prctl
>   Spectre v1:             Mitigation; __user pointer sanitization
>   Spectre v2:             Mitigation; CSV2, BHB
>   Srbds:                  Not affected
>   Tsx async abort:        Not affected
>
> Regards,
> Jan


Best Regards,
Yan, Zi
