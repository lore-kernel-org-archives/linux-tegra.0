Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11020116.outbound.protection.outlook.com [52.101.201.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12931274B48;
	Fri, 30 Jan 2026 02:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769738957; cv=fail; b=TokBDlEbSz9knKFkpK001xtEsulZ5pnVEx7ky4QestPkLASuWAI9SBInBGlSvmrH/qhk2fHFq0xQ6PJRBDIaMvnRskfuzjelVrTJnCsK3OUH5d5OIfp051ZDt/A4894C2BZkCd8QmaA2jclOinJNAs9Ps2mg6y6GvTvKoX1Gnfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769738957; c=relaxed/simple;
	bh=tX93SHQWUFfbtckDZiMhq7GpQmFF69O+/14xB79BnDk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=p8VeE4YO/pWzvQO9acrwp3rgvdddCSUFI9KpqWmPsshKFF2ARonhUMEhzLWrOLVNaujbkeuKJrLxvfv1NQqfB1D1qE4WAR6Omwi0qHbDrgCLrd/dsdES+G+LSERCdnRs+BqbSR3218zhTqdDJuBvEfwwvEePEDP7fNqQtgN0TaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=UNFA1PMR; arc=fail smtp.client-ip=52.101.201.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="UNFA1PMR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lvn1hvyJ8MRS+wpuQsgDborDGudFXscRFc5roPoZX7chOTMztyjcQt4H9vHSJZ9ewr47sdl79Qek3+MR4BhZVv8IGp6zxAueSBRwN8kQN06IXdi+UQ8wCD+02zZOdGhXMp+BUJrWZ3wN1XpARTjtyw+v56eMLnK/6ibxvjjyE1D3oBP8KBffyA35GJV2py51jagGODlmCYVS6xwDAEEfjz+BGBKP6Y+zP6VOGqNjWJ9rAxBrD1EIP4L2XrjJPaWVN3WabKtuiMBQUmdoKkfFUKyjKvC/XWUE2T2tc58YGBz5FU4EqTnG4qpVB+GqXEmeggnelBMWKfOb3QlNPMYn4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EY8+Ex0usF8ycJKxQjjbsZphZo1kqW4LiFDvNKaNJFc=;
 b=yJpC2JBfEZ1RsLsjAnc/BQdJsPkK1cnuplW+6rMiWtaSaB21VTkdIJIip0+ZRkC6Q/uIiZqmhjjgv2uww94YMoN1N4qSvdqVerrxxdnA1BEGzmunGSKgluGVlUwBwJiQjym9wVidH51VvQly4NJBfRhSH2LiGgfRXviUkW3iC92nnVzMvqXfEhitzfdrG98U5R6JpZmMP07WLSeDMfu8zqiRDZ2O5xfOtaWyn0YgAsqfDk6LbeNzuzPnOtEL9vAq4l6JcePrROxSDoTnETzFzGtgUG0GynnT23joNxJCWvv5X1GarG/+DFEUuiCrvqfkLt/TFEar9kdh9fcF23Zvvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EY8+Ex0usF8ycJKxQjjbsZphZo1kqW4LiFDvNKaNJFc=;
 b=UNFA1PMR/XMR3Cz+Lwwza+guXKmdeFKVJDnWJn7q0ArS6l6YWLcd312of9d+A2VyDEW978MH6/NKQ/OJgXkzt9aB2mQbzi3mVsH8Pq0nnD9I3xvJbwQTIpo9N47aNZl+bJIEXvuhAgyBnXaWs16gMjHghv4Jv/0h+CSx3M39KvE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from MW4PR01MB6228.prod.exchangelabs.com (2603:10b6:303:76::7) by
 CO1PR01MB6776.prod.exchangelabs.com (2603:10b6:303:f4::5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.11; Fri, 30 Jan 2026 02:09:10 +0000
Received: from MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::86f5:4db2:7ad5:7fc4]) by MW4PR01MB6228.prod.exchangelabs.com
 ([fe80::86f5:4db2:7ad5:7fc4%6]) with mapi id 15.20.9542.010; Fri, 30 Jan 2026
 02:09:09 +0000
Date: Thu, 29 Jan 2026 18:09:07 -0800 (PST)
From: Ilkka Koskinen <ilkka@os.amperecomputing.com>
To: Besar Wicaksono <bwicaksono@nvidia.com>
cc: will@kernel.org, suzuki.poulose@arm.com, robin.murphy@arm.com, 
    ilkka@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org, 
    linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
    mark.rutland@arm.com, treding@nvidia.com, jonathanh@nvidia.com, 
    vsethi@nvidia.com, rwiley@nvidia.com, sdonthineni@nvidia.com, 
    skelley@nvidia.com, ywan@nvidia.com, mochs@nvidia.com, nirmoyd@nvidia.com
Subject: Re: [PATCH 6/8] perf: add NVIDIA Tegra410 CPU Memory Latency PMU
In-Reply-To: <20260126181155.2776097-7-bwicaksono@nvidia.com>
Message-ID: <e8a77cc1-ac2a-0dc6-4d0e-672832282309@os.amperecomputing.com>
References: <20260126181155.2776097-1-bwicaksono@nvidia.com> <20260126181155.2776097-7-bwicaksono@nvidia.com>
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-ClientProxiedBy: MW4PR04CA0313.namprd04.prod.outlook.com
 (2603:10b6:303:82::18) To MW4PR01MB6228.prod.exchangelabs.com
 (2603:10b6:303:76::7)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR01MB6228:EE_|CO1PR01MB6776:EE_
X-MS-Office365-Filtering-Correlation-Id: 4de955c9-df51-47ee-9051-08de5fa48e0a
X-LD-Processed: 3bc2b170-fd94-476d-b0ce-4229bdc904a7,ExtAddr
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?U4oz9atw2VkiLs4M3z57A8RVK78OTjQOqH9OgJeTIKFFTeduH5tkcOjtnUbo?=
 =?us-ascii?Q?ybHkaOqxOfWF5g1SjKGPv3WQmF1uvDjX5iC6MtkOQnK4gfLc/+j6pu0vYw4t?=
 =?us-ascii?Q?n6HzsLG/APWxMiMeveXR1yx46ozrVx3RVcGhDKKYogteoC6rJ/1VEQ6cGn9C?=
 =?us-ascii?Q?9c1/kMcz7Uv7OvGKnDaZyS5L7GVkS7gURXrw+exvyovgYd117poDdCH7RBqC?=
 =?us-ascii?Q?C1ttd8OPDBrWMwIUKNLIV5xVu8pOmhYQihYSpL7fCZduQ1/kKa31wJjEZ9FS?=
 =?us-ascii?Q?TK4d7IBaf7zVH/JOsIebd6d77lqEMh2Q0B4wmpSk+nBLrmuIekkqnJqYr28O?=
 =?us-ascii?Q?T4u0zzVh281j2bDfYxSLLQQf14pQOPmpj6F2qsaFFXB+CIJsDjctqinyi1Lr?=
 =?us-ascii?Q?z08A/+TAe3t2f/cvK1mOS/X0/zvM7t3oCFYlxFpZ/4BVHmrfRCytLxbBSdVD?=
 =?us-ascii?Q?7dtfAEUKZOhSAEApP/RhsUJpbX82kwBSOczoBlGPKKP/jmrvF+igfD7Wc/jS?=
 =?us-ascii?Q?MHRIAptArHgTcYblyM4/gf5CyEFq4FtGu8b3xylYCTWfJNRRv327xIhBE8DH?=
 =?us-ascii?Q?NPDobeNqxmf6QLrw4LnIsd12oIn1838fUAScxpa5hBVE/02Q7GtYDuhDpknj?=
 =?us-ascii?Q?HqJztRIOzypMOKTfdnurGGNQqdvYHwKo9lwWVVeCFykxpHeNw/5mxz2XF0GV?=
 =?us-ascii?Q?Ics+zFbSKI+tHlIV2skEAt/hew468g2XhOmmXxYAvbw2AJuuXzIjFq3K6Ukr?=
 =?us-ascii?Q?QCAXEa+Jcl9SsPBmYEw4uFd6PRE1xY4nMbB2c5LcEic3hIMN9c1n4mEdBmrh?=
 =?us-ascii?Q?m5QrphCDAWeXi9wyAHhG6YRqEpq4c5ZHbCuKdfa6m82479aAl0SA1IfvZ7EF?=
 =?us-ascii?Q?QEJebe302h3sycIHmIyJIl0D7yO1LxHBdu58o76Bi5oUuVZ6Fzg3upAM46oh?=
 =?us-ascii?Q?hXIh9aBTmHBYTS1P1Cf6yJATl+pHEoya57iADaftt4nXpyYsz1N5EtRELA3n?=
 =?us-ascii?Q?WdiBsuPfY1Tt/tgarZaIqB8k8PuyQuNicPBYd0j4wtB2W01o413AsCkfgBG4?=
 =?us-ascii?Q?JJ9fOyq8CbV88ndD2ym5eoYVw6ZmRp39LwP8ed4Pklf9RpKfrCtOHZw8/Lqd?=
 =?us-ascii?Q?crD5x43dlsF2Va9Dlaj2hJjdD9bMMSxAujVxg1Oro75qGRBJs+LDod/c2/Bj?=
 =?us-ascii?Q?smzjxZO+uk5OxY26RPR2lBnLk3z4IM/l7mYEPv6bUhRt53DVXnbK9KqkSHjq?=
 =?us-ascii?Q?TgUT/CWO0Hlt8lDaf4JRFOlCGDlsKYilvhwNtc5v/s9qiV3w20xitGPRykSn?=
 =?us-ascii?Q?6cLGuGcQQ6PCtaoFXaM/FHD5AmjIWSafdxWhhvMNzoETQbqEewciLo9lTGBr?=
 =?us-ascii?Q?cxhHDD8950wDMhsbsWEEFnw08tvXthoQOuUAxTgiw1qevc6Y+rvyt7x2cNDp?=
 =?us-ascii?Q?p3DdoWDQvU0JdPxJbV2BqRX/wvDw8vgwoYn+T5D88DK+OUqhsN24gc9721u5?=
 =?us-ascii?Q?8Nx3VhAkaiUKc9e57XjVtE2UsNnXVtS6MpDJIrYJuMiHB+PopTaHpKpnd0g0?=
 =?us-ascii?Q?S8Zi+apPca5VPM2rFfo=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR01MB6228.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?GOrddJfkyd4BaDWaLG5XrqV+Ch6Zfvt2pDpJnaM3QW6+R9MOGSanMLc8PGDK?=
 =?us-ascii?Q?7SgJ+EKmCoNtEKC7e9XwZCZeNPG74ooCcJuqDkXwspzcfqJQbIuSXHdYUtlS?=
 =?us-ascii?Q?6007j4Lt6No/B+vqG5lJ0UWvvd+NoxeZ8qNqjAjiH1/x56iEkExUPGu6dauf?=
 =?us-ascii?Q?WaV+z6hZny8RSNFPiQz20U+ve7ag1voSdbdAQnHlwxo9I6TvgzgxwbmI4VKe?=
 =?us-ascii?Q?qeiA9nirBc4dB0+kH5XeMm9ayGvhjpWs849N8+XQo7N5ZzW7gGNvq7fF+oji?=
 =?us-ascii?Q?PF+yFSm8WFn0p9tiH0u3RoB4MVcdHT2j51+/lK33x1qvSI6f8mdfJv5hEFvW?=
 =?us-ascii?Q?ZpscNCoBDgYCnE3MYfwYUd2RuHYb0nNdNXey4NG4ECZ3qZfu3+BG6hcxvqo2?=
 =?us-ascii?Q?3Xs72Erg20z9cJ83MEG8E3rBWaqLEmJdGqfe7zav/28paZ9ykRBw6PsQqQDH?=
 =?us-ascii?Q?JMjG7PKw6Ekz+izfT2pXRXUB0/QpP9amOBN5XpmIlNjBb2nomr56WP4aAmnJ?=
 =?us-ascii?Q?VYg4JPy4csq6we/w8xu6hE6dLRm333wv4g/1npal2SaO5HtUc2KfDbY/hMvr?=
 =?us-ascii?Q?KV90u4jftXV2YfgU5hNxdwHfuvfzW01S3okfIFZvOdNJgxaDhhGGuXyMgZH7?=
 =?us-ascii?Q?S6phUO2eoDJPng3C9MXknDjpA3tbMX0EWt92hD+9rV+K2J1BwkF7t1yjKwDX?=
 =?us-ascii?Q?rCRwYuMBu0W9txreDWcHoiygsewcDeK0QA/EtP2NXwX3e9/9WUllwoEyly7H?=
 =?us-ascii?Q?bVVeEvX3QH6ILCf6GiUXyZXhB7xz8B5QtYEAkKLuiF/lQXGJ8VuDEF7jy0oy?=
 =?us-ascii?Q?ypyXGeenL0vJEUc/Bd2W9FBCWULcbOvUVM5xABixKcyf9GdfShSfSsNI1L1P?=
 =?us-ascii?Q?N4GF3c3UotYtAV1jpX3ooQNIq0vkbP9QP43fvJhqsu2+l3ec0A4xYVG/pGQB?=
 =?us-ascii?Q?oWR1wOEJek5nx0NQZAkC6rxivN9kVBxKNHSlIvlp3622yhDINzIfj3Q91Cb8?=
 =?us-ascii?Q?472mlIvtKQ5ZnLGxwFTF9qlWjYNKe3axmSMMP337znqAB2gsa8MNWBZ8X7gI?=
 =?us-ascii?Q?lSe2KikF3vf6IY0F2trCoX+/xFCSZHc4PhetXhPH8m/NGNYVywZotasqgSM8?=
 =?us-ascii?Q?R/ewU6nfj6GcDv+wPDpKqpXfP6JzX24QYxsklFG1Za3KOiFKDTSWdcbc8o9f?=
 =?us-ascii?Q?am6ewN9O/U1BpRzmUnPE/aUHkIf9iVl9BuLsMqYt+3i6FraCNefH0205IxaT?=
 =?us-ascii?Q?ryopGCroc+zlVkfCCOE4CZlU8ClqY8hWjzyARafrTlvV/OigYJ3jINlaUEj0?=
 =?us-ascii?Q?Er+OlACYEQ7MK/nh2EdAqIuoP5s7gNjOjLo99ffVUBqZe6tND25+2DzddAZ9?=
 =?us-ascii?Q?CAqNsjFpfxei1YhnXZcmUHPbB5bJ9MDDX8UrcLrXfKUreuMYtouwi9qx2Rdo?=
 =?us-ascii?Q?sI8hJbecwiF5PFTAXzf80O/teCyTORdeRaMF31YuLLoeS4bcSpFo0thC6ult?=
 =?us-ascii?Q?goZ+7y81cAFTtYAljsMVqPUzuevDc8VtVI6iZFEEh4c/b7cNMOEgUqK/C8Ay?=
 =?us-ascii?Q?UrIDP2S1iO/fOInIC/AwKRyMox91DnuIHShwFq4zkJWvsbEbzt08nsOu+s1+?=
 =?us-ascii?Q?MOVA0POIeBBA0lnM/Dsr3aVf1qJX4eKg9p8AGEE9rHrKpyN7nLlNgvpJlPkR?=
 =?us-ascii?Q?HTZN2FIBI3WjBX4/ijSWfnL8avceG+aZEh3TXWMiJpUZj+Z0FK8IsBbqQh4R?=
 =?us-ascii?Q?+VgiG7mB26O3tI217pnogIE6Y2/T/mI=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de955c9-df51-47ee-9051-08de5fa48e0a
X-MS-Exchange-CrossTenant-AuthSource: MW4PR01MB6228.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 02:09:09.7978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 10EPgJCD/N2Wbju98VNBPALyHVeNYtHVU9+DTu9MYghN67u6XVFcj/a/LLDEoBVwLwqdfieiB2uME06dZJZYatbJpfQLNNf5lvSsM4LZd1LKp84a2Qs6g42As1O0anN3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR01MB6776


Hi Besar,

On Mon, 26 Jan 2026, Besar Wicaksono wrote:
> Adds CPU Memory (CMEM) Latency  PMU support in Tegra410 SOC.
>
> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>

Looks good to me

Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>

Cheers, Ilkka

> ---
> .../admin-guide/perf/nvidia-tegra410-pmu.rst  |  25 +
> drivers/perf/Kconfig                          |   7 +
> drivers/perf/Makefile                         |   1 +
> drivers/perf/nvidia_t410_cmem_latency_pmu.c   | 727 ++++++++++++++++++
> 4 files changed, 760 insertions(+)
> create mode 100644 drivers/perf/nvidia_t410_cmem_latency_pmu.c
>
> diff --git a/Documentation/admin-guide/perf/nvidia-tegra410-pmu.rst b/Documentation/admin-guide/perf/nvidia-tegra410-pmu.rst
> index 07dc447eead7..11fc1c88346a 100644
> --- a/Documentation/admin-guide/perf/nvidia-tegra410-pmu.rst
> +++ b/Documentation/admin-guide/perf/nvidia-tegra410-pmu.rst
> @@ -8,6 +8,7 @@ metrics like memory bandwidth, latency, and utilization:
> * Unified Coherence Fabric (UCF)
> * PCIE
> * PCIE-TGT
> +* CPU Memory (CMEM) Latency
>
> PMU Driver
> ----------
> @@ -342,3 +343,27 @@ Example usage:
>   0x10000 to 0x100FF on socket 0's PCIE RC-1::
>
>     perf stat -a -e nvidia_pcie_tgt_pmu_0_rc_1/event=0x1,dst_addr_base=0x10000,dst_addr_mask=0xFFF00,dst_addr_en=0x1/
> +
> +CPU Memory (CMEM) Latency PMU
> +-----------------------------
> +
> +This PMU monitors latency events of memory read requests to local
> +CPU DRAM:
> +
> +  * RD_REQ counters: count read requests (32B per request).
> +  * RD_CUM_OUTS counters: accumulated outstanding request counter, which track
> +    how many cycles the read requests are in flight.
> +  * CYCLES counter: counts the number of elapsed cycles.
> +
> +The average latency is calculated as::
> +
> +   FREQ_IN_GHZ = CYCLES / ELAPSED_TIME_IN_NS
> +   AVG_LATENCY_IN_CYCLES = RD_CUM_OUTS / RD_REQ
> +   AVERAGE_LATENCY_IN_NS = AVG_LATENCY_IN_CYCLES / FREQ_IN_GHZ
> +
> +The events and configuration options of this PMU device are described in sysfs,
> +see /sys/bus/event_source/devices/nvidia_cmem_latency_pmu_<socket-id>.
> +
> +Example usage::
> +
> +  perf stat -a -e '{nvidia_cmem_latency_pmu_0/rd_req/,nvidia_cmem_latency_pmu_0/rd_cum_outs/,nvidia_cmem_latency_pmu_0/cycles/}'
> diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
> index 638321fc9800..9fed3c41d5ea 100644
> --- a/drivers/perf/Kconfig
> +++ b/drivers/perf/Kconfig
> @@ -311,4 +311,11 @@ config MARVELL_PEM_PMU
> 	  Enable support for PCIe Interface performance monitoring
> 	  on Marvell platform.
>
> +config NVIDIA_TEGRA410_CMEM_LATENCY_PMU
> +	tristate "NVIDIA Tegra410 CPU Memory Latency PMU"
> +	depends on ARM64
> +	help
> +	  Enable perf support for CPU memory latency counters monitoring on
> +	  NVIDIA Tegra410 SoC.
> +
> endmenu
> diff --git a/drivers/perf/Makefile b/drivers/perf/Makefile
> index ea52711a87e3..4aa6aad393c2 100644
> --- a/drivers/perf/Makefile
> +++ b/drivers/perf/Makefile
> @@ -35,3 +35,4 @@ obj-$(CONFIG_DWC_PCIE_PMU) += dwc_pcie_pmu.o
> obj-$(CONFIG_ARM_CORESIGHT_PMU_ARCH_SYSTEM_PMU) += arm_cspmu/
> obj-$(CONFIG_MESON_DDR_PMU) += amlogic/
> obj-$(CONFIG_CXL_PMU) += cxl_pmu.o
> +obj-$(CONFIG_NVIDIA_TEGRA410_CMEM_LATENCY_PMU) += nvidia_t410_cmem_latency_pmu.o
> diff --git a/drivers/perf/nvidia_t410_cmem_latency_pmu.c b/drivers/perf/nvidia_t410_cmem_latency_pmu.c
> new file mode 100644
> index 000000000000..9b466581c8fc
> --- /dev/null
> +++ b/drivers/perf/nvidia_t410_cmem_latency_pmu.c
> @@ -0,0 +1,727 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * NVIDIA Tegra410 CPU Memory (CMEM) Latency PMU driver.
> + *
> + * Copyright (c) 2026, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/bitops.h>
> +#include <linux/cpumask.h>
> +#include <linux/device.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/perf_event.h>
> +#include <linux/platform_device.h>
> +
> +#define NUM_INSTANCES    14
> +#define BCAST(pmu) pmu->base[NUM_INSTANCES]
> +
> +/* Register offsets. */
> +#define CG_CTRL         0x800
> +#define CTRL            0x808
> +#define STATUS          0x810
> +#define CYCLE_CNTR      0x818
> +#define MC0_REQ_CNTR    0x820
> +#define MC0_AOR_CNTR    0x830
> +#define MC1_REQ_CNTR    0x838
> +#define MC1_AOR_CNTR    0x848
> +#define MC2_REQ_CNTR    0x850
> +#define MC2_AOR_CNTR    0x860
> +
> +/* CTRL values. */
> +#define CTRL_DISABLE    0x0ULL
> +#define CTRL_ENABLE     0x1ULL
> +#define CTRL_CLR        0x2ULL
> +
> +/* CG_CTRL values. */
> +#define CG_CTRL_DISABLE    0x0ULL
> +#define CG_CTRL_ENABLE     0x1ULL
> +
> +/* STATUS register field. */
> +#define STATUS_CYCLE_OVF      BIT(0)
> +#define STATUS_MC0_AOR_OVF    BIT(1)
> +#define STATUS_MC0_REQ_OVF    BIT(3)
> +#define STATUS_MC1_AOR_OVF    BIT(4)
> +#define STATUS_MC1_REQ_OVF    BIT(6)
> +#define STATUS_MC2_AOR_OVF    BIT(7)
> +#define STATUS_MC2_REQ_OVF    BIT(9)
> +
> +/* Events. */
> +#define EVENT_CYCLES    0x0
> +#define EVENT_REQ       0x1
> +#define EVENT_AOR       0x2
> +
> +#define NUM_EVENTS           0x3
> +#define MASK_EVENT           0x3
> +#define MAX_ACTIVE_EVENTS    32
> +
> +#define ACTIVE_CPU_MASK        0x0
> +#define ASSOCIATED_CPU_MASK    0x1
> +
> +static unsigned long cmem_lat_pmu_cpuhp_state;
> +
> +struct cmem_lat_pmu_hw_events {
> +	struct perf_event *events[MAX_ACTIVE_EVENTS];
> +	DECLARE_BITMAP(used_ctrs, MAX_ACTIVE_EVENTS);
> +};
> +
> +struct cmem_lat_pmu {
> +	struct pmu pmu;
> +	struct device *dev;
> +	const char *name;
> +	const char *identifier;
> +	void __iomem *base[NUM_INSTANCES + 1];
> +	cpumask_t associated_cpus;
> +	cpumask_t active_cpu;
> +	struct hlist_node node;
> +	struct cmem_lat_pmu_hw_events hw_events;
> +};
> +
> +#define to_cmem_lat_pmu(p) \
> +	container_of(p, struct cmem_lat_pmu, pmu)
> +
> +
> +/* Get event type from perf_event. */
> +static inline u32 get_event_type(struct perf_event *event)
> +{
> +	return (event->attr.config) & MASK_EVENT;
> +}
> +
> +/* PMU operations. */
> +static int cmem_lat_pmu_get_event_idx(struct cmem_lat_pmu_hw_events *hw_events,
> +				struct perf_event *event)
> +{
> +	unsigned int idx;
> +
> +	idx = find_first_zero_bit(hw_events->used_ctrs, MAX_ACTIVE_EVENTS);
> +	if (idx >= MAX_ACTIVE_EVENTS)
> +		return -EAGAIN;
> +
> +	set_bit(idx, hw_events->used_ctrs);
> +
> +	return idx;
> +}
> +
> +static bool cmem_lat_pmu_validate_event(struct pmu *pmu,
> +				 struct cmem_lat_pmu_hw_events *hw_events,
> +				 struct perf_event *event)
> +{
> +	if (is_software_event(event))
> +		return true;
> +
> +	/* Reject groups spanning multiple HW PMUs. */
> +	if (event->pmu != pmu)
> +		return false;
> +
> +	return (cmem_lat_pmu_get_event_idx(hw_events, event) >= 0);
> +}
> +
> +/*
> + * Make sure the group of events can be scheduled at once
> + * on the PMU.
> + */
> +static bool cmem_lat_pmu_validate_group(struct perf_event *event)
> +{
> +	struct perf_event *sibling, *leader = event->group_leader;
> +	struct cmem_lat_pmu_hw_events fake_hw_events;
> +
> +	if (event->group_leader == event)
> +		return true;
> +
> +	memset(&fake_hw_events, 0, sizeof(fake_hw_events));
> +
> +	if (!cmem_lat_pmu_validate_event(event->pmu, &fake_hw_events, leader))
> +		return false;
> +
> +	for_each_sibling_event(sibling, leader) {
> +		if (!cmem_lat_pmu_validate_event(event->pmu, &fake_hw_events,
> +						sibling))
> +			return false;
> +	}
> +
> +	return cmem_lat_pmu_validate_event(event->pmu, &fake_hw_events, event);
> +}
> +
> +static int cmem_lat_pmu_event_init(struct perf_event *event)
> +{
> +	struct cmem_lat_pmu *cmem_lat_pmu = to_cmem_lat_pmu(event->pmu);
> +	struct hw_perf_event *hwc = &event->hw;
> +	u32 event_type = get_event_type(event);
> +
> +	if (event->attr.type != event->pmu->type ||
> +	    event_type >= NUM_EVENTS)
> +		return -ENOENT;
> +
> +	/*
> +	 * Following other "uncore" PMUs, we do not support sampling mode or
> +	 * attach to a task (per-process mode).
> +	 */
> +	if (is_sampling_event(event)) {
> +		dev_dbg(cmem_lat_pmu->pmu.dev,
> +			"Can't support sampling events\n");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	if (event->cpu < 0 || event->attach_state & PERF_ATTACH_TASK) {
> +		dev_dbg(cmem_lat_pmu->pmu.dev,
> +			"Can't support per-task counters\n");
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * Make sure the CPU assignment is on one of the CPUs associated with
> +	 * this PMU.
> +	 */
> +	if (!cpumask_test_cpu(event->cpu, &cmem_lat_pmu->associated_cpus)) {
> +		dev_dbg(cmem_lat_pmu->pmu.dev,
> +			"Requested cpu is not associated with the PMU\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Enforce the current active CPU to handle the events in this PMU. */
> +	event->cpu = cpumask_first(&cmem_lat_pmu->active_cpu);
> +	if (event->cpu >= nr_cpu_ids)
> +		return -EINVAL;
> +
> +	if (!cmem_lat_pmu_validate_group(event))
> +		return -EINVAL;
> +
> +	hwc->idx = -1;
> +	hwc->config = event_type;
> +
> +	return 0;
> +}
> +
> +static u64 cmem_lat_pmu_read_status(struct cmem_lat_pmu *cmem_lat_pmu,
> +				   unsigned int inst)
> +{
> +	return readq(cmem_lat_pmu->base[inst] + STATUS);
> +}
> +
> +static u64 cmem_lat_pmu_read_cycle_counter(struct perf_event *event)
> +{
> +	const unsigned int instance = 0;
> +	u64 status;
> +	struct cmem_lat_pmu *cmem_lat_pmu = to_cmem_lat_pmu(event->pmu);
> +	struct device *dev = cmem_lat_pmu->dev;
> +
> +	/*
> +	 * Use the reading from first instance since all instances are
> +	 * identical.
> +	 */
> +	status = cmem_lat_pmu_read_status(cmem_lat_pmu, instance);
> +	if (status & STATUS_CYCLE_OVF)
> +		dev_warn(dev, "Cycle counter overflow\n");
> +
> +	return readq(cmem_lat_pmu->base[instance] + CYCLE_CNTR);
> +}
> +
> +static u64 cmem_lat_pmu_read_req_counter(struct perf_event *event)
> +{
> +	unsigned int i;
> +	u64 status, val = 0;
> +	struct cmem_lat_pmu *cmem_lat_pmu = to_cmem_lat_pmu(event->pmu);
> +	struct device *dev = cmem_lat_pmu->dev;
> +
> +	/* Sum up the counts from all instances. */
> +	for (i = 0; i < NUM_INSTANCES; i++) {
> +		status = cmem_lat_pmu_read_status(cmem_lat_pmu, i);
> +		if (status & STATUS_MC0_REQ_OVF)
> +			dev_warn(dev, "MC0 request counter overflow\n");
> +		if (status & STATUS_MC1_REQ_OVF)
> +			dev_warn(dev, "MC1 request counter overflow\n");
> +		if (status & STATUS_MC2_REQ_OVF)
> +			dev_warn(dev, "MC2 request counter overflow\n");
> +
> +		val += readq(cmem_lat_pmu->base[i] + MC0_REQ_CNTR);
> +		val += readq(cmem_lat_pmu->base[i] + MC1_REQ_CNTR);
> +		val += readq(cmem_lat_pmu->base[i] + MC2_REQ_CNTR);
> +	}
> +
> +	return val;
> +}
> +
> +static u64 cmem_lat_pmu_read_aor_counter(struct perf_event *event)
> +{
> +	unsigned int i;
> +	u64 status, val = 0;
> +	struct cmem_lat_pmu *cmem_lat_pmu = to_cmem_lat_pmu(event->pmu);
> +	struct device *dev = cmem_lat_pmu->dev;
> +
> +	/* Sum up the counts from all instances. */
> +	for (i = 0; i < NUM_INSTANCES; i++) {
> +		status = cmem_lat_pmu_read_status(cmem_lat_pmu, i);
> +		if (status & STATUS_MC0_AOR_OVF)
> +			dev_warn(dev, "MC0 AOR counter overflow\n");
> +		if (status & STATUS_MC1_AOR_OVF)
> +			dev_warn(dev, "MC1 AOR counter overflow\n");
> +		if (status & STATUS_MC2_AOR_OVF)
> +			dev_warn(dev, "MC2 AOR counter overflow\n");
> +
> +		val += readq(cmem_lat_pmu->base[i] + MC0_AOR_CNTR);
> +		val += readq(cmem_lat_pmu->base[i] + MC1_AOR_CNTR);
> +		val += readq(cmem_lat_pmu->base[i] + MC2_AOR_CNTR);
> +	}
> +
> +	return val;
> +}
> +
> +static u64 (*read_counter_fn[NUM_EVENTS])(struct perf_event *) = {
> +	[EVENT_CYCLES] = cmem_lat_pmu_read_cycle_counter,
> +	[EVENT_REQ] = cmem_lat_pmu_read_req_counter,
> +	[EVENT_AOR] = cmem_lat_pmu_read_aor_counter,
> +};
> +
> +static void cmem_lat_pmu_event_update(struct perf_event *event)
> +{
> +	u32 event_type;
> +	u64 prev, now;
> +	struct hw_perf_event *hwc = &event->hw;
> +
> +	if (hwc->state & PERF_HES_STOPPED)
> +		return;
> +
> +	event_type = hwc->config;
> +
> +	do {
> +		prev = local64_read(&hwc->prev_count);
> +		now = read_counter_fn[event_type](event);
> +	} while (local64_cmpxchg(&hwc->prev_count, prev, now) != prev);
> +
> +	local64_add(now - prev, &event->count);
> +
> +	hwc->state |= PERF_HES_UPTODATE;
> +}
> +
> +static void cmem_lat_pmu_start(struct perf_event *event, int pmu_flags)
> +{
> +	event->hw.state = 0;
> +}
> +
> +static void cmem_lat_pmu_stop(struct perf_event *event, int pmu_flags)
> +{
> +	event->hw.state |= PERF_HES_STOPPED;
> +}
> +
> +static int cmem_lat_pmu_add(struct perf_event *event, int flags)
> +{
> +	struct cmem_lat_pmu *cmem_lat_pmu = to_cmem_lat_pmu(event->pmu);
> +	struct cmem_lat_pmu_hw_events *hw_events = &cmem_lat_pmu->hw_events;
> +	struct hw_perf_event *hwc = &event->hw;
> +	int idx;
> +
> +	if (WARN_ON_ONCE(!cpumask_test_cpu(smp_processor_id(),
> +					   &cmem_lat_pmu->associated_cpus)))
> +		return -ENOENT;
> +
> +	idx = cmem_lat_pmu_get_event_idx(hw_events, event);
> +	if (idx < 0)
> +		return idx;
> +
> +	hw_events->events[idx] = event;
> +	hwc->idx = idx;
> +	hwc->state = PERF_HES_STOPPED | PERF_HES_UPTODATE;
> +
> +	if (flags & PERF_EF_START)
> +		cmem_lat_pmu_start(event, PERF_EF_RELOAD);
> +
> +	/* Propagate changes to the userspace mapping. */
> +	perf_event_update_userpage(event);
> +
> +	return 0;
> +}
> +
> +static void cmem_lat_pmu_del(struct perf_event *event, int flags)
> +{
> +	struct cmem_lat_pmu *cmem_lat_pmu = to_cmem_lat_pmu(event->pmu);
> +	struct cmem_lat_pmu_hw_events *hw_events = &cmem_lat_pmu->hw_events;
> +	struct hw_perf_event *hwc = &event->hw;
> +	int idx = hwc->idx;
> +
> +	cmem_lat_pmu_stop(event, PERF_EF_UPDATE);
> +
> +	hw_events->events[idx] = NULL;
> +
> +	clear_bit(idx, hw_events->used_ctrs);
> +
> +	perf_event_update_userpage(event);
> +}
> +
> +static void cmem_lat_pmu_read(struct perf_event *event)
> +{
> +	cmem_lat_pmu_event_update(event);
> +}
> +
> +static inline void cmem_lat_pmu_cg_ctrl(struct cmem_lat_pmu *cmem_lat_pmu, u64 val)
> +{
> +	writeq(val, BCAST(cmem_lat_pmu) + CG_CTRL);
> +}
> +
> +static inline void cmem_lat_pmu_ctrl(struct cmem_lat_pmu *cmem_lat_pmu, u64 val)
> +{
> +	writeq(val, BCAST(cmem_lat_pmu) + CTRL);
> +}
> +
> +static void cmem_lat_pmu_enable(struct pmu *pmu)
> +{
> +	bool disabled;
> +	struct cmem_lat_pmu *cmem_lat_pmu = to_cmem_lat_pmu(pmu);
> +
> +	disabled = bitmap_empty(
> +		cmem_lat_pmu->hw_events.used_ctrs, MAX_ACTIVE_EVENTS);
> +
> +	if (disabled)
> +		return;
> +
> +	/* Enable all the counters. */
> +	cmem_lat_pmu_cg_ctrl(cmem_lat_pmu, CG_CTRL_ENABLE);
> +	cmem_lat_pmu_ctrl(cmem_lat_pmu, CTRL_ENABLE);
> +}
> +
> +static void cmem_lat_pmu_disable(struct pmu *pmu)
> +{
> +	int idx;
> +	struct perf_event *event;
> +	struct cmem_lat_pmu *cmem_lat_pmu = to_cmem_lat_pmu(pmu);
> +
> +	/* Disable all the counters. */
> +	cmem_lat_pmu_ctrl(cmem_lat_pmu, CTRL_DISABLE);
> +
> +	/*
> +	 * The counters will start from 0 again on restart.
> +	 * Update the events immediately to avoid losing the counts.
> +	 */
> +	for_each_set_bit(
> +		idx, cmem_lat_pmu->hw_events.used_ctrs, MAX_ACTIVE_EVENTS) {
> +		event = cmem_lat_pmu->hw_events.events[idx];
> +
> +		if (!event)
> +			continue;
> +
> +		cmem_lat_pmu_event_update(event);
> +
> +		local64_set(&event->hw.prev_count, 0ULL);
> +	}
> +
> +	cmem_lat_pmu_ctrl(cmem_lat_pmu, CTRL_CLR);
> +	cmem_lat_pmu_cg_ctrl(cmem_lat_pmu, CG_CTRL_DISABLE);
> +}
> +
> +/* PMU identifier attribute. */
> +
> +static ssize_t cmem_lat_pmu_identifier_show(struct device *dev,
> +					 struct device_attribute *attr,
> +					 char *page)
> +{
> +	struct cmem_lat_pmu *cmem_lat_pmu = to_cmem_lat_pmu(dev_get_drvdata(dev));
> +
> +	return sysfs_emit(page, "%s\n", cmem_lat_pmu->identifier);
> +}
> +
> +static struct device_attribute cmem_lat_pmu_identifier_attr =
> +	__ATTR(identifier, 0444, cmem_lat_pmu_identifier_show, NULL);
> +
> +static struct attribute *cmem_lat_pmu_identifier_attrs[] = {
> +	&cmem_lat_pmu_identifier_attr.attr,
> +	NULL,
> +};
> +
> +static struct attribute_group cmem_lat_pmu_identifier_attr_group = {
> +	.attrs = cmem_lat_pmu_identifier_attrs,
> +};
> +
> +/* Format attributes. */
> +
> +#define NV_PMU_EXT_ATTR(_name, _func, _config)			\
> +	(&((struct dev_ext_attribute[]){				\
> +		{							\
> +			.attr = __ATTR(_name, 0444, _func, NULL),	\
> +			.var = (void *)_config				\
> +		}							\
> +	})[0].attr.attr)
> +
> +static struct attribute *cmem_lat_pmu_formats[] = {
> +	NV_PMU_EXT_ATTR(event, device_show_string, "config:0-1"),
> +	NULL,
> +};
> +
> +static const struct attribute_group cmem_lat_pmu_format_group = {
> +	.name = "format",
> +	.attrs = cmem_lat_pmu_formats,
> +};
> +
> +/* Event attributes. */
> +
> +static ssize_t cmem_lat_pmu_sysfs_event_show(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	struct perf_pmu_events_attr *pmu_attr;
> +
> +	pmu_attr = container_of(attr, typeof(*pmu_attr), attr);
> +	return sysfs_emit(buf, "event=0x%llx\n", pmu_attr->id);
> +}
> +
> +#define NV_PMU_EVENT_ATTR(_name, _config)	\
> +	PMU_EVENT_ATTR_ID(_name, cmem_lat_pmu_sysfs_event_show, _config)
> +
> +static struct attribute *cmem_lat_pmu_events[] = {
> +	NV_PMU_EVENT_ATTR(cycles, EVENT_CYCLES),
> +	NV_PMU_EVENT_ATTR(rd_req, EVENT_REQ),
> +	NV_PMU_EVENT_ATTR(rd_cum_outs, EVENT_AOR),
> +	NULL
> +};
> +
> +static const struct attribute_group cmem_lat_pmu_events_group = {
> +	.name = "events",
> +	.attrs = cmem_lat_pmu_events,
> +};
> +
> +/* Cpumask attributes. */
> +
> +static ssize_t cmem_lat_pmu_cpumask_show(struct device *dev,
> +			    struct device_attribute *attr, char *buf)
> +{
> +	struct pmu *pmu = dev_get_drvdata(dev);
> +	struct cmem_lat_pmu *cmem_lat_pmu = to_cmem_lat_pmu(pmu);
> +	struct dev_ext_attribute *eattr =
> +		container_of(attr, struct dev_ext_attribute, attr);
> +	unsigned long mask_id = (unsigned long)eattr->var;
> +	const cpumask_t *cpumask;
> +
> +	switch (mask_id) {
> +	case ACTIVE_CPU_MASK:
> +		cpumask = &cmem_lat_pmu->active_cpu;
> +		break;
> +	case ASSOCIATED_CPU_MASK:
> +		cpumask = &cmem_lat_pmu->associated_cpus;
> +		break;
> +	default:
> +		return 0;
> +	}
> +	return cpumap_print_to_pagebuf(true, buf, cpumask);
> +}
> +
> +#define NV_PMU_CPUMASK_ATTR(_name, _config)			\
> +	NV_PMU_EXT_ATTR(_name, cmem_lat_pmu_cpumask_show,	\
> +				(unsigned long)_config)
> +
> +static struct attribute *cmem_lat_pmu_cpumask_attrs[] = {
> +	NV_PMU_CPUMASK_ATTR(cpumask, ACTIVE_CPU_MASK),
> +	NV_PMU_CPUMASK_ATTR(associated_cpus, ASSOCIATED_CPU_MASK),
> +	NULL,
> +};
> +
> +static const struct attribute_group cmem_lat_pmu_cpumask_attr_group = {
> +	.attrs = cmem_lat_pmu_cpumask_attrs,
> +};
> +
> +/* Per PMU device attribute groups. */
> +
> +static const struct attribute_group *cmem_lat_pmu_attr_groups[] = {
> +	&cmem_lat_pmu_identifier_attr_group,
> +	&cmem_lat_pmu_format_group,
> +	&cmem_lat_pmu_events_group,
> +	&cmem_lat_pmu_cpumask_attr_group,
> +	NULL,
> +};
> +
> +static int cmem_lat_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
> +{
> +	struct cmem_lat_pmu *cmem_lat_pmu =
> +		hlist_entry_safe(node, struct cmem_lat_pmu, node);
> +
> +	if (!cpumask_test_cpu(cpu, &cmem_lat_pmu->associated_cpus))
> +		return 0;
> +
> +	/* If the PMU is already managed, there is nothing to do */
> +	if (!cpumask_empty(&cmem_lat_pmu->active_cpu))
> +		return 0;
> +
> +	/* Use this CPU for event counting */
> +	cpumask_set_cpu(cpu, &cmem_lat_pmu->active_cpu);
> +
> +	return 0;
> +}
> +
> +static int cmem_lat_pmu_cpu_teardown(unsigned int cpu, struct hlist_node *node)
> +{
> +	unsigned int dst;
> +
> +	struct cmem_lat_pmu *cmem_lat_pmu =
> +		hlist_entry_safe(node, struct cmem_lat_pmu, node);
> +
> +	/* Nothing to do if this CPU doesn't own the PMU */
> +	if (!cpumask_test_and_clear_cpu(cpu, &cmem_lat_pmu->active_cpu))
> +		return 0;
> +
> +	/* Choose a new CPU to migrate ownership of the PMU to */
> +	dst = cpumask_any_and_but(&cmem_lat_pmu->associated_cpus,
> +				  cpu_online_mask, cpu);
> +	if (dst >= nr_cpu_ids)
> +		return 0;
> +
> +	/* Use this CPU for event counting */
> +	perf_pmu_migrate_context(&cmem_lat_pmu->pmu, cpu, dst);
> +	cpumask_set_cpu(dst, &cmem_lat_pmu->active_cpu);
> +
> +	return 0;
> +}
> +
> +static int cmem_lat_pmu_get_cpus(struct cmem_lat_pmu *cmem_lat_pmu,
> +				unsigned int socket)
> +{
> +	int ret = 0, cpu;
> +
> +	for_each_possible_cpu(cpu) {
> +		if (cpu_to_node(cpu) == socket)
> +			cpumask_set_cpu(cpu, &cmem_lat_pmu->associated_cpus);
> +	}
> +
> +	if (cpumask_empty(&cmem_lat_pmu->associated_cpus)) {
> +		dev_dbg(cmem_lat_pmu->dev,
> +			"No cpu associated with PMU socket-%u\n", socket);
> +		ret = -ENODEV;
> +	}
> +
> +	return ret;
> +}
> +
> +static int cmem_lat_pmu_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct acpi_device *acpi_dev;
> +	struct cmem_lat_pmu *cmem_lat_pmu;
> +	char *name, *uid_str;
> +	int ret, i;
> +	u32 socket;
> +
> +	acpi_dev = ACPI_COMPANION(dev);
> +	if (!acpi_dev)
> +		return -ENODEV;
> +
> +	uid_str = acpi_device_uid(acpi_dev);
> +	if (!uid_str)
> +		return -ENODEV;
> +
> +	ret = kstrtou32(uid_str, 0, &socket);
> +	if (ret)
> +		return ret;
> +
> +	cmem_lat_pmu = devm_kzalloc(dev, sizeof(*cmem_lat_pmu), GFP_KERNEL);
> +	name = devm_kasprintf(dev, GFP_KERNEL, "nvidia_cmem_latency_pmu_%u", socket);
> +	if (!cmem_lat_pmu || !name)
> +		return -ENOMEM;
> +
> +	cmem_lat_pmu->dev = dev;
> +	cmem_lat_pmu->name = name;
> +	cmem_lat_pmu->identifier = acpi_device_hid(acpi_dev);
> +	platform_set_drvdata(pdev, cmem_lat_pmu);
> +
> +	cmem_lat_pmu->pmu = (struct pmu) {
> +		.parent		= &pdev->dev,
> +		.task_ctx_nr	= perf_invalid_context,
> +		.pmu_enable	= cmem_lat_pmu_enable,
> +		.pmu_disable	= cmem_lat_pmu_disable,
> +		.event_init	= cmem_lat_pmu_event_init,
> +		.add		= cmem_lat_pmu_add,
> +		.del		= cmem_lat_pmu_del,
> +		.start		= cmem_lat_pmu_start,
> +		.stop		= cmem_lat_pmu_stop,
> +		.read		= cmem_lat_pmu_read,
> +		.attr_groups	= cmem_lat_pmu_attr_groups,
> +		.capabilities	= PERF_PMU_CAP_NO_EXCLUDE |
> +					PERF_PMU_CAP_NO_INTERRUPT,
> +	};
> +
> +	/* Map the address of all the instances plus one for the broadcast. */
> +	for (i = 0; i < NUM_INSTANCES + 1; i++) {
> +		cmem_lat_pmu->base[i] = devm_platform_ioremap_resource(pdev, i);
> +		if (IS_ERR(cmem_lat_pmu->base[i])) {
> +			dev_err(dev, "Failed map address for instance %d\n", i);
> +			return PTR_ERR(cmem_lat_pmu->base[i]);
> +		}
> +	}
> +
> +	ret = cmem_lat_pmu_get_cpus(cmem_lat_pmu, socket);
> +	if (ret)
> +		return ret;
> +
> +	ret = cpuhp_state_add_instance(cmem_lat_pmu_cpuhp_state,
> +				       &cmem_lat_pmu->node);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Error %d registering hotplug\n", ret);
> +		return ret;
> +	}
> +
> +	cmem_lat_pmu_cg_ctrl(cmem_lat_pmu, CG_CTRL_ENABLE);
> +	cmem_lat_pmu_ctrl(cmem_lat_pmu, CTRL_CLR);
> +	cmem_lat_pmu_cg_ctrl(cmem_lat_pmu, CG_CTRL_DISABLE);
> +
> +	ret = perf_pmu_register(&cmem_lat_pmu->pmu, name, -1);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to register PMU: %d\n", ret);
> +		cpuhp_state_remove_instance(cmem_lat_pmu_cpuhp_state,
> +					    &cmem_lat_pmu->node);
> +		return ret;
> +	}
> +
> +	dev_dbg(&pdev->dev, "Registered %s PMU\n", name);
> +
> +	return 0;
> +}
> +
> +static void cmem_lat_pmu_device_remove(struct platform_device *pdev)
> +{
> +	struct cmem_lat_pmu *cmem_lat_pmu = platform_get_drvdata(pdev);
> +
> +	perf_pmu_unregister(&cmem_lat_pmu->pmu);
> +	cpuhp_state_remove_instance(cmem_lat_pmu_cpuhp_state,
> +				    &cmem_lat_pmu->node);
> +}
> +
> +static const struct acpi_device_id cmem_lat_pmu_acpi_match[] = {
> +	{ "NVDA2021", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, cmem_lat_pmu_acpi_match);
> +
> +static struct platform_driver cmem_lat_pmu_driver = {
> +	.driver = {
> +		.name = "nvidia-t410-cmem-latency-pmu",
> +		.acpi_match_table = ACPI_PTR(cmem_lat_pmu_acpi_match),
> +		.suppress_bind_attrs = true,
> +	},
> +	.probe = cmem_lat_pmu_probe,
> +	.remove = cmem_lat_pmu_device_remove,
> +};
> +
> +static int __init cmem_lat_pmu_init(void)
> +{
> +	int ret;
> +
> +	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
> +				      "perf/nvidia/cmem_latency:online",
> +				      cmem_lat_pmu_cpu_online,
> +				      cmem_lat_pmu_cpu_teardown);
> +	if (ret < 0)
> +		return ret;
> +
> +	cmem_lat_pmu_cpuhp_state = ret;
> +
> +	return platform_driver_register(&cmem_lat_pmu_driver);
> +}
> +
> +static void __exit cmem_lat_pmu_exit(void)
> +{
> +	platform_driver_unregister(&cmem_lat_pmu_driver);
> +	cpuhp_remove_multi_state(cmem_lat_pmu_cpuhp_state);
> +}
> +
> +module_init(cmem_lat_pmu_init);
> +module_exit(cmem_lat_pmu_exit);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("NVIDIA Tegra410 CPU Memory Latency PMU driver");
> +MODULE_AUTHOR("Besar Wicaksono <bwicaksono@nvidia.com>");
> -- 
> 2.43.0
>
>
