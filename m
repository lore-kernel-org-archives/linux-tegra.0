Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA54BC6FA90
	for <linux-tegra@archiver.kernel.org>; Tue, 27 Sep 2022 09:31:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230324AbiI0Jbw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 27 Sep 2022 05:31:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbiI0Jbv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 27 Sep 2022 05:31:51 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2049.outbound.protection.outlook.com [40.107.94.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC00DD33E2
        for <linux-tegra@vger.kernel.org>; Tue, 27 Sep 2022 02:31:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bAJpcVCMPIOCPKBveHJyNCmfqIwAq4pnj/wsy1xDl2xKeC42+FXp7OTUAVASa7LCJeDIQY2PFNM58vJ8CZ5asVJl+bpXgdAmTtHLpfikV21GmW3HcTjNowWjqiyE89L9ywf19aLDEviniP6W+raXQQXTi4twvnfodccZrmJRyFtwdqOs7b2zfb3VgcgWztnXvo70i98mGgNGQRVizoTZJh7Z+Xf/V7MnsgHQVfcOzgebOP9sZcofMZbyiMCU0BT8yoEx8uGQio+ZNN5QGd740ceVWD00NuxfJ80MqVNQxjLQgT36yAmz1fQTLafxlV9qj4guAefdzpgYoAwG8KIZJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iC2CUvDIwkFTzKkretjvUi5AIDY2m1xKjssEKAL3hz4=;
 b=WhuE0ZlkYfoFYorULWhCZt8+btdjAQRCDsY18QMWLKl3OtGKPQ/dKcsMVFPFismbrcNwYatsPNWwZIkK4FtN+CpAGpCUbxUi6MuP175NX4j6j2Io5NarFzwL+hI6kvBiZ1FiYKvV0pScbaAeZAsMEiLKX4a75+kEDTcg9sO+HZj5aqTpW838cHlsPCtSoy+rqrPv8cPF4lVGUwQpdOn6cBfqNrQmfcMxVf430cnQnr2D9en4vUtl8aA/RX2/HPlwCjcYbbT3Zr+PXINAdCDDse5LbeXmzvj8ZOvbh3Md2crqo1WuBcajXwZaEsWLTiPUDHYt4/b04+wB/U3oWVvNlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iC2CUvDIwkFTzKkretjvUi5AIDY2m1xKjssEKAL3hz4=;
 b=IWtvYFkXOxrCexihv1tNqLA12hinRcvjjFsCCdhcpZduucx2ySEyhalFSdSife+lrn+9/DSaA9hBSQg6wsRMPDhNcuuc7JalF7kM3AJ1cHWKyR16B3Xn4K7MjZg1U4n3RpiVQfH3vUjmUfMd4vAYi+Nt+rw0vDfMaFhbM7OBIIqolSr30HblA2Lf5xvU9pLaBj9ep1wVbiAdoeVl1P1eyb4Yjy8Z49vZTyR1c3l3L8rCVUa1kzBpVmA9RL8vQfajvuzDfcrEFG4i+05UbgkPXH4A3ccwa5Ryd3tz6Fe+1oMV9CwB1AD5CO9LnQwOX6lGFJU1IgXYHqBcI9yml7BiZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 BN9PR12MB5243.namprd12.prod.outlook.com (2603:10b6:408:100::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.15; Tue, 27 Sep 2022 09:31:47 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::b07f:53b1:426e:a29d]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::b07f:53b1:426e:a29d%5]) with mapi id 15.20.5654.026; Tue, 27 Sep 2022
 09:31:47 +0000
Message-ID: <3cecc3a5-30b0-f0bd-c3de-9e09bd21909b@nvidia.com>
Date:   Tue, 27 Sep 2022 10:31:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 6/8] arm64: alternatives: have callbacks take a cap
Content-Language: en-US
To:     Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     ardb@kernel.org, catalin.marinas@arm.com, james.morse@arm.com,
        joey.gouly@arm.com, maz@kernel.org, will@kernel.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20220912162210.3626215-1-mark.rutland@arm.com>
 <20220912162210.3626215-7-mark.rutland@arm.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20220912162210.3626215-7-mark.rutland@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP265CA0036.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::24) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|BN9PR12MB5243:EE_
X-MS-Office365-Filtering-Correlation-Id: f761762b-bcaa-49f2-8ada-08daa06b1903
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R2w/rIlGOs9TI0hdZMRILtX/0YyUro84x7r2wDO4rIT9MZMug9UZ1EN9SWB9xgjosXLzjZw+sI+z7T1258IRCVALgK9q1+oaB+rAqA8c3Ummem+zsMEfu4SKW+ZPvBm6Ji+si25FO/sYvxumEGwNgIGT6V3e2S9Fx0UqYlKvE0BebNiJ7JLRnAQ+BxKS6YzyydQLmu0g036Y8vzBv3neNd5Xj+8p4RX0TxehjVxh4fUCYt7AKgL9tovC50uXMrIne6/Yb1zVvT73piQgkWlKxwYvlQb0YvXwAHIstkn7kUrRSbxZDuefP+C9B19gqNPj3nbyOGx9W0Lhv6A8DwmutPWe+EW8ewFyhdz3OM1+LKdLQwsgbAj9ZoxmxMsiGdxT90t5ocj6bACXO341YkVh8Db+ICnezzo6lVwYQ+xx4Kgu2VsZVql/rCSDP4EFmzTYTDRnSbA1wlHoeaUW7bVwJf6QLOUAWE1u/VLuOu+2uv4afDr19U/8VyCoRl6jC1FH4Gc2jWEV2aZAcBcQg42qPlQGMnKcY/UCx2D2pRz71yf36MgrCKqb+oquDrLnKnAe6qGYc9Cf1a1wh7yOkio30IlV8YLPdlj87dG8xg/ct120KTbtt5bQl3S+RSTAb53a1n1MMlbb+FZxD1pZeUW730r0aXVIxs8jQ267ZKoDlxFl9gqfb82/Ep0dpPH9jTu0UdhRjR/2oldjTLWRFoyEZ9Tu/iYSlWdeJHvwlnJfPNm6U86eyfftjYh4dA5gcL+T7cLldaWgdpQQxtjJWGbt/XeQxB8WvjqvLcitT31EwBE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(136003)(346002)(376002)(366004)(451199015)(31686004)(83380400001)(186003)(41300700001)(4326008)(8676002)(66556008)(66946007)(86362001)(31696002)(6666004)(5660300002)(66476007)(316002)(8936002)(2616005)(36756003)(66899015)(55236004)(6506007)(26005)(6512007)(53546011)(478600001)(6486002)(38100700002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1M4SVRSNDNKek5tcnltaWlydWdLcUY5bW5oanNGb01DdjNjUEtkVVVlMU4y?=
 =?utf-8?B?RWhsN1BnOTlkOXp1WGxzMElOOXV1eFJZRENld3VPenpEeE56Vjh4Nmo4NUF2?=
 =?utf-8?B?L2s4QjNSMWZVMUFlTU5xU3VxREgzN3dFL3g4emtlcDBjM2dZSWtmazU3TTk1?=
 =?utf-8?B?Q3dhckpHMmdKRjRvdTlMZ04wNGp6czdyR2pOWG1jMzlCdnIzMy9UdlBGT0Ex?=
 =?utf-8?B?ekJGUjBWTS83Mkdodkx4bWxib3I1V3RnZE1zNXNHd0J2Z24xdzRZdlQvN1Bt?=
 =?utf-8?B?VTVmMG90Z1NvQlk5WlRPY251TXFyNXl0Z20zLzlOL3ZpZmxmYkhhbC9XbUp6?=
 =?utf-8?B?WnVWcmNPbGZybmoyUGhTVnRBeWM0K0FjVWIzNjhFM0JxcGVkUFdjU292L0Yy?=
 =?utf-8?B?clg3YXpwN0c3aEsxRXk5UFYxcHQrNjF1RW9lWUFhSUxxdmc4WjIyQU5DYWMw?=
 =?utf-8?B?NkdYc3VHSmRrdHdPd1N3MDVqdSt6alU1UGhxS2hydU9aNHZtU2ZNRklVM3ZN?=
 =?utf-8?B?UlU3UDJINHVuanNrZ2wxM2ZBQkIxUkh6cXgwbkR4TVdIWHVUT01QT2cxTVU5?=
 =?utf-8?B?aENDcjBPSlY1RkZjVGs3U0wxUktjUnp1SlAxOTdsZXZ0U1dMVExQZVlLSnhF?=
 =?utf-8?B?aUd4bnhGb3RFd05XN09aVVl5ZEJrOXkwOWQrbkNaZWtPS1ptUTVIbVNnZVNz?=
 =?utf-8?B?NlduUXI0NGhXN1cyTm84ZmRsOXNwWlM4UUhMZ0R4c3VpeDJHUmNVcitEc1Q2?=
 =?utf-8?B?TTFPNVR3RUF5RFB4ZGJ6SVlFZzNhaEZVQUl0dW1qeDNkVzhXaGJHV0pJaFhL?=
 =?utf-8?B?Y0NiZjcvaThkeGFNOEFIemRobjlyVzA3NTh5SUI4STlzWDRIbllVM1lVY3l4?=
 =?utf-8?B?MVFqbU5xeFA1dG1oKzhZN1VyR2xrUm4wVW9ORVllcHl0UmZmanQ2MDNoMXI5?=
 =?utf-8?B?bDlnd0NuTmJLS2FJNnFJOUJBMG9Cb3Z2SjBIVzc5SXVYcEJiTTF5T1hnN3Jj?=
 =?utf-8?B?STFCRDhxYlA2VFdza1U5MExCNWNyNmMveVNxV2swTFlqN1o1MGNFVmcySVg3?=
 =?utf-8?B?VW5vZFdpaWpnd3VJZS81Y0hZMWJTczRtSHhOSDd1ZkJFL1dOeGhNR2tUMURz?=
 =?utf-8?B?UzVHekpmVStjYnFWVFNKN25MekduY3B1VTFmMU0wUkhjWVg2Yy9tSWxId2tQ?=
 =?utf-8?B?bmlWS1pLVFhFTU1uYjNUbCtjbkxkcndlTTFnajZQVVF6YmVRbVBBWk4zdy96?=
 =?utf-8?B?ZERkQzdDYkgvQXhDWXg3UlB2Z1ZCY25tcHdROEtIV0YyZThNMWwybzJiR0FY?=
 =?utf-8?B?a3lzNTd5NmlkMWRCVXJpSUdtTUhCbmlkVzd1cVcxNVhhejd1ajcvODk0WEJB?=
 =?utf-8?B?TmtLU2RLRnFySHFSazB1V3VzK1FEenFVTUw4cGdKTDJxbzVtMHJxSnNSS0ZL?=
 =?utf-8?B?bFdXSXJXNjJqTVFTTXRtaHNXUFhEblhLdVM1K013ZFNleGpFRERJNjJjelUr?=
 =?utf-8?B?OUFDc1Fpd3NTZTYrd2gzSkFxYmcrSmwxbGQxK3VPdi91MEtZeGdXaFRRU2tS?=
 =?utf-8?B?QzBMdHJieXk5dytSNmRVOHNsM2xkcUtsTmdZL0l1QVQ0eTFCbFlMRlB6TS9z?=
 =?utf-8?B?M1lwS1dhN21xUklLYWh0STNiZERVc3NDWG11YmxPWE5vZlZvZDZkZVY3dHlE?=
 =?utf-8?B?NFJvVk1qUjBuMzBxbXM4bE0yUFZFMExhQWc0anVqa2JKQXJiSzVJR0JPQ0tj?=
 =?utf-8?B?WVBHSXA0b04wQkh3UG5kYmozYnp3Z3R2cVZGdVlQN3d0dDFTYTRQTXFScW9j?=
 =?utf-8?B?VkVmTm5MRUlLM0wrVngwdkJJdkc4L0pJTEVSSGZ4NEMzVjVLRTJzM3RvYUx0?=
 =?utf-8?B?RFlvRGRqbkJJTGRGOGV5aEJ0blNIbno4azJremt0ZGl3VXhkMjdZbFJ1eFVL?=
 =?utf-8?B?aDdsS0tpT294R2tWZkpMZGErWGZuV2V6eTdic05XNnZVQ1ROMW05Y044NC9Q?=
 =?utf-8?B?UHU1L3FuQ0ttUXZZdjNaeVU5dmZLdDFQNDIvT3k4VEFoL0VXajdHdE5jbGxS?=
 =?utf-8?B?eVpyWlQzYTlJcFA3M0dWWjUyWGdXSVJhUDZqNFVtZ1NTUm5iY3Fiblhxa2Nw?=
 =?utf-8?B?WUYzKzdkT091c3FrbnNxc21sbDBDZTY4NmdsbmF5VWJoWTE5VGFoeU11VFNj?=
 =?utf-8?B?L0E9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f761762b-bcaa-49f2-8ada-08daa06b1903
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 09:31:47.0922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GeMk3YVLyA7MBsCSnLIAv9kj45+WuThv+D8N/xSaLFBAsW5mxd/iRoCVlkJMSRRpQPmDsAGpStq8OWPYm5f2JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5243
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Mark,

On 12/09/2022 17:22, Mark Rutland wrote:
> Today, callback alternatives are special-cased within
> __apply_alternatives(), and are applied alongside patching for system
> capabilities as ARM64_NCAPS is not part of the boot_capabilities feature
> mask.
> 
> This special-casing is less than ideal. Giving special meaning to
> ARM64_NCAPS for this requires some structures and loops to use
> ARM64_NCAPS + 1 (AKA ARM64_NPATCHABLE), while others use ARM64_NCAPS.
> It's also not immediately clear callback alternatives are only applied
> when applying alternatives for system-wide features.
> 
> To make this a bit clearer, changes the way that callback alternatives
> are identified to remove the special-casing of ARM64_NCAPS, and to allow
> callback alternatives to be associated with a cpucap as with all other
> alternatives.
> 
> New cpucaps, ARM64_ALWAYS_BOOT and ARM64_ALWAYS_SYSTEM are added which
> are always detected alongside boot cpu capabilities and system
> capabilities respectively. All existing callback alternatives are made
> to use ARM64_ALWAYS_SYSTEM, and so will be patched at the same point
> during the boot flow as before.
> 
> Subsequent patches will make more use of these new cpucaps.
> 
> There should be no functional change as a result of this patch.
> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Joey Gouly <joey.gouly@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> ---
>   arch/arm64/include/asm/alternative-macros.h | 18 +++++++++-----
>   arch/arm64/include/asm/assembler.h          | 10 ++++----
>   arch/arm64/include/asm/cpufeature.h         |  4 +---
>   arch/arm64/include/asm/kvm_mmu.h            |  5 ++--
>   arch/arm64/kernel/alternative.c             | 26 +++++++++++----------
>   arch/arm64/kernel/cpufeature.c              | 19 +++++++++++++--
>   arch/arm64/kernel/entry.S                   |  8 +++----
>   arch/arm64/kvm/hyp/hyp-entry.S              |  4 ++--
>   arch/arm64/tools/cpucaps                    |  2 ++
>   9 files changed, 60 insertions(+), 36 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/alternative-macros.h b/arch/arm64/include/asm/alternative-macros.h
> index 7e157ab6cd505..189c31be163ce 100644
> --- a/arch/arm64/include/asm/alternative-macros.h
> +++ b/arch/arm64/include/asm/alternative-macros.h
> @@ -2,10 +2,16 @@
>   #ifndef __ASM_ALTERNATIVE_MACROS_H
>   #define __ASM_ALTERNATIVE_MACROS_H
>   
> +#include <linux/const.h>
> +
>   #include <asm/cpucaps.h>
>   #include <asm/insn-def.h>
>   
> -#define ARM64_CB_PATCH ARM64_NCAPS
> +#define ARM64_CB_BIT	(UL(1) << 15)
> +
> +#if ARM64_NCAPS >= ARM64_CB_BIT
> +#error "cpucaps have overflown ARM64_CB_BIT"
> +#endif


Some of our builders are failing and bisect is pointing to this commit. 
Looks like they don't like the above and I see the following errors ...

   CC      arch/arm64/kvm/hyp/vhe/debug-sr.o
/tmp/ccY3kbki.s: Assembler messages:
/tmp/ccY3kbki.s:1600: Error: found 'L', expected: ')'
/tmp/ccY3kbki.s:1600: Error: found 'L', expected: ')'
/tmp/ccY3kbki.s:1600: Error: found 'L', expected: ')'
/tmp/ccY3kbki.s:1600: Error: found 'L', expected: ')'
/tmp/ccY3kbki.s:1600: Error: junk at end of line, first unrecognized 
character is `L'
/tmp/ccY3kbki.s:1723: Error: found 'L', expected: ')'
/tmp/ccY3kbki.s:1723: Error: found 'L', expected: ')'
/tmp/ccY3kbki.s:1723: Error: found 'L', expected: ')'
/tmp/ccY3kbki.s:1723: Error: found 'L', expected: ')'
/tmp/ccY3kbki.s:1723: Error: junk at end of line, first unrecognized 
character is `L'
scripts/Makefile.build:249: recipe for target 
'arch/arm64/kvm/hyp/vhe/debug-sr.o' failed

Seems that it does not like the 'UL' macro for some reason. Any thoughts?

Thanks
Jon

-- 
nvpublic
