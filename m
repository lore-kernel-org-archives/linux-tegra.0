Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AB49C433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 29 Sep 2022 10:48:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234420AbiI2KsN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 29 Sep 2022 06:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbiI2KsM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 29 Sep 2022 06:48:12 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EE00124150
        for <linux-tegra@vger.kernel.org>; Thu, 29 Sep 2022 03:48:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PgsYLKZFChsDDTxbn4y4rNM4BZEL5Edlm8p54BoE9gPoU0Uy8/wWj/xzd8xKITTAS4eENkjBvHmRJWHf4QKcRVuIxObjsA/wDEuSttAJVuEJVjco1VyKIRiNBaK2EDFsrEzvrx/gNDP7a0yx3uEYXNfHkbKwkVkVGmqe5vm1yDst9+4mJRvUv9/1hmc4T6zDhd/K7cd3nU+3AIBy9Ei5noI+2DBnOcaFIg0B46Eo+zLBebvFpulloJ2VkLmZulatSY5pT++XIEH0gw45Z2uEY7xS/5uKy/wSaWdWstnwMgZIvhpLaCRBDKWCCjNohO6Ap2hSiYCEijc3Lm/9mKPOqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7uXt+LEJGE7qpUD32/Kwsj8mSRP/EUm4FoMx9N9M8Q4=;
 b=ZQ7DwrlhNoqf0vtaYy9Fp63DyWnQvY9lNtr7w7z38xEc6/mvZXbD4/0FFU+EobxXKzL+6KKWSS/RzXFk4H3cJF76g8s4qb/h/RjXPDSJIoP/aumvh8fV9fhjNcf0z/FUETT0YFxdh/Zl8qyO1KPldbHENaaQcXPSC6j1flwBoxz1NYAn0vKhYg353MujkVMmSG6TJKrSMVcmguCj/d0e9Vo5WBAC2s/xI4yxxpga6X6x5fGebBDaRl5/zdTMb+RFTzEp+n+hxw+/z00UyEXo80zo/BfNE75hD/bG5qICSgi5Q3LSjjG9UF9ucJukeVV5UKyS3e4i6Kk8VunvjXZm5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7uXt+LEJGE7qpUD32/Kwsj8mSRP/EUm4FoMx9N9M8Q4=;
 b=kM4kRe7Mt293NodVp1kaqggE1XmfAecQIJ3kP81UHB31lmMlI8btcGmF4ioTtoaWCuTbhTGbe9A5gDZ/G8cIkJZE7oJDWxfxBTXrLni673t3uDPbMHOsiun5yUANkqDZBynrOONJXeSYrKbnuC9ftpiNNXAVT8nJY2ttdv093ojy8Fz2MAjS4T5Y0Nje/DjUpEyazsF3B7GnW7l4V41J9/RSdtderC7WBqGD+ckWvW6qkIzRJUO0rFnSDcFOM+a1E2kv1dRZCtEcRECSWI54D6ozm4H04jZufInZD6tQPNMWMh8z15fgzNiE5dTQgLs1lDXbV0M2uo+m+aRh8v0Z6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 CH2PR12MB4311.namprd12.prod.outlook.com (2603:10b6:610:a8::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.20; Thu, 29 Sep 2022 10:48:09 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::b07f:53b1:426e:a29d]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::b07f:53b1:426e:a29d%5]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 10:48:09 +0000
Message-ID: <9e72d082-17af-69c6-8456-40af5b698887@nvidia.com>
Date:   Thu, 29 Sep 2022 11:48:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 6/8] arm64: alternatives: have callbacks take a cap
Content-Language: en-US
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
        james.morse@arm.com, joey.gouly@arm.com, maz@kernel.org,
        will@kernel.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20220912162210.3626215-1-mark.rutland@arm.com>
 <20220912162210.3626215-7-mark.rutland@arm.com>
 <3cecc3a5-30b0-f0bd-c3de-9e09bd21909b@nvidia.com>
 <dc53c62d-58e4-ce20-edc6-969c71801c9a@nvidia.com>
 <CAMj1kXHWyB8v8Wv-cMn7nZXvRWJ=FPsQd+7Yfni+fV7cbCGY8A@mail.gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <CAMj1kXHWyB8v8Wv-cMn7nZXvRWJ=FPsQd+7Yfni+fV7cbCGY8A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0326.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::7) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|CH2PR12MB4311:EE_
X-MS-Office365-Filtering-Correlation-Id: 63cb40d7-7da8-4222-c2b2-08daa2081906
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8afZHGotZgQBEf8BjaVOa2n8aG5dlU0vJchzTwGRIF0a0rJjiM1tNt8bRom1U94PXmXUb1oQPj9aLWgFlRNNK5b43iSC6sOwLuFQY65REM7UCtW5z0vZS9Ux1K+GWbCjK4NPaOGe9++8tAP2bf1QXFw76vjmdQLagFEaK8mDfqEs6+eO9UIqQYJXHGHKMXybTlez4SSOLMKXpaGXn2U9SHbYGvJ7/Nj8u6ARcBMyzEjA3V07fliscvVXit9IUKtFVIYJK41mAcqiYlTX9YyYq2gZEaa8EC6p08204UMGI0iAeUywNwu+SDt18HGerj6nEAhp1JZ2px8sC46q6+zA4VStgFVK+22JSawF6q9o31xSg8UeZtV2obHTjdwaUy3NGQatMKYLnAy+mhImuxMQnkOhpr8ZrIYbGIQ8lFJ/kaRLJD3fipLIxChvUEcNXFkuMDo1vviC6NvqT4OBkjw9XYR6BvNBZi0tMo7gSn2WAu8Vd6hyHaFCfz2buuJvN5oyJFIOnnkBJ4CR3GC6Ry1Y8cM+EEPTsQIaeNb9vMVuYDKfoYpQHA68OZGKVxdEBLDEMV2NX1Q+lktHXdnDTPYcR9wtjtJ4NWbYiedd/pyI9yi7JOD3GlZDoOMGER1PH6pMaxCDktNUBndRubNHhlQ1hA9lmrER7qiFv6tGy/8Q9XWcn9sm3brqxdytrkOjWij1aciYbUgQyewCgKI9Y0Z2igDSqD08fIQM5rxXU5tPO9yY8t0eDANopxRAqA0uEMDXoGdHqcQUYzL4QgThkwIEC/f6lv2RVTPNkkpjesG9j4M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(39860400002)(136003)(366004)(346002)(451199015)(5660300002)(8936002)(41300700001)(38100700002)(316002)(6506007)(6486002)(83380400001)(2906002)(31686004)(53546011)(6666004)(66556008)(66946007)(31696002)(86362001)(6916009)(54906003)(4326008)(36756003)(8676002)(66476007)(6512007)(186003)(2616005)(478600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REduKzNNNlNjM2ZmZk1tMWdyZmptQmZyOEJVSnZZbDFQN09ZSjhFbUEzWjAy?=
 =?utf-8?B?Nlp3ZFhCNjJtTXQ3VHRwUlJjSWFGQ1VUc3VtSUs5Wm14SkJXb21GUEk5ZS80?=
 =?utf-8?B?dkRXUFdzQVgyOVcrV0ZxQlVCcCtPeWRjbmZEL2VMVUJLcFBVWm1DblJsR0s1?=
 =?utf-8?B?WnVobHdjNHZiUjVaNGN5NUZ2d2c1aGVCTFN2TUtoekUwWmJCUEZSRUovbjJm?=
 =?utf-8?B?RytUa1JzdE1yZS81NHp4V0JqOXlXbUNEVzRCRGY2Z0hOd1FZZkpBUG9pVk95?=
 =?utf-8?B?ZDJ4bGRvaGJrNDk5L3FjczNzNXc2WXhCUmFzV1o4S3RhVkxkRmlEVVhRL3pV?=
 =?utf-8?B?U1FCM0JwVnZ6aUMvRW9HVURDcDc1UWtqdkIvbVZ0TFBXdFM3K242dTIxTyt3?=
 =?utf-8?B?Vy8wUWpCYjlkUHVhcTI1VWtUVEtVbm5kWFNFN0NPbW9rZjFHTGx6bllrYzNo?=
 =?utf-8?B?WmxOQnJ5WnpIZkRRTGdXWHFIRzNrZExKeDhTbmJxaEU5VmQ2cTI1Q2pYdFQ0?=
 =?utf-8?B?aEtzekErdzZUVUErTU1tWWs5cGs4TmdsSjQ4M1h6bG9aTlVKeGFHQzdXRUMv?=
 =?utf-8?B?S3c0SktjNGVqMzd4U1QwWHgvWEhDZWVXeElyN2pkalRUTUs3L1NNUjhhTjdi?=
 =?utf-8?B?cWw1S1gyQ3VEdWFMaml1ZWVDbUlrUmhUTWx3OGN1dXIxcG1ac2s3UXgzNlhi?=
 =?utf-8?B?Ri9uYWh1Q0k0aDVTQjFhd2pSZlR3cGpIUytPWWdGTUF3VjF4RkZRbEFzYUgr?=
 =?utf-8?B?NW9ZVzMwTDhXMkRCNldld3N2d21LMTFaTXFSSytkZ3Z3aWhsaVllemtMcXFL?=
 =?utf-8?B?MnhFejZVM25pb0Vzb2hGejcycHpYcmVEUFU3U0tqTkoyVzlLK0FPSHJGcEhN?=
 =?utf-8?B?M0ZBVEdjUmRlUG5LU29PRWlENXVuaDVLZXlXeW9HNnM1dzZhY1lQdUtJaEEv?=
 =?utf-8?B?azU4blpxTzQ2ak1JMGNoYTZKODdreis4dDVmVjlCNTdCTFUwWURyMmtUa0Ru?=
 =?utf-8?B?eHRwSXQvWXlObnkzQmNIMEpKbHlzRVBLOUxIVm1GSkRoZm5DOHBjU0IvN1Iv?=
 =?utf-8?B?Y3hZc1YvejVDcVdLVS82V2ZML3R4ZVY2WkExQ3ZreG1IdTVYcE4yYkNkZFpo?=
 =?utf-8?B?N2hkWjJrdGxzUXNyRWxXZUFvQUk4ZlZEcUV6N29OMnNERUkxNjR6WFdjbXhS?=
 =?utf-8?B?WDhLM29vblNyMTdzb09KUnBLTkdmK3hlQ2xIUTNmR0hXQlArdTNNMHA3VVo1?=
 =?utf-8?B?UEg3YzEyN0h6YmMxTWpxMzk5SWtTVlFIVjgvQ0R3d1dlUkdDUStleTZQaWw5?=
 =?utf-8?B?RFJ0UWo0WnRSZWlhLzNHUXhyaHNZU0VpcnhYdmdDUXRCSS9UMk41czcyZC9p?=
 =?utf-8?B?L2JJWmpEWHFVQ29xeEN4ZlgvZHBVbDZ4L0FhQjV2NlZKbVVYbkVvTnJJOUZT?=
 =?utf-8?B?N2Q1UEs2Vkx4WTcwNjVNK1k3SFp3MFpEUjVIVDBxWm5vNVlvSllzdjUzYmc4?=
 =?utf-8?B?NjMwT0pnazdvQVdocFQyenNOWmV0cFgzRHd6a0pOMysvbGlvLzREYU1EdDFn?=
 =?utf-8?B?clorV3JWcG1MeEhCVlNzNlhWSFlSbjJ4NlVLcGJ2TXNIUS9zN0ZzYTQvTVVL?=
 =?utf-8?B?UFFibDUzcldjRm1ET0V0eHRweStrYytWbnlIRjV1MVY0WDBuUUtTVkh2RUdJ?=
 =?utf-8?B?ZExtUGdCQ0JmRWhoY2t2S1c4M2pWRktFSXJwV1lSNWg1RW5Ebk5EQzl3dzVJ?=
 =?utf-8?B?WjRWaE83aVdMQWlJZVBXUlR5cjdVQVpBQmd4bkZpRzJac2lFdUdVekIzMWVZ?=
 =?utf-8?B?NDE4WXFCQXpGMTc2V2p5NEFZWlFDUFlsNGlSYVVJNmN1Sm42bSthdXlES2lD?=
 =?utf-8?B?UmdkRys5OU93aTNzMGx0eWN0MVBaMFJSYXBCUk9VM0c1RGJtWC9wMFlqWU51?=
 =?utf-8?B?UUJYQTFvSDNHaGdpRm1HUDRJcUtESGFKblBBdGVTWUVrN0FrVldzNUdQUFpw?=
 =?utf-8?B?RXJ3aGtIVk90c1owanVZR0hPZFhPSldxdmNhSkFGK1J6QjF1MTlwMDJQQWU0?=
 =?utf-8?B?eWpmQXEzYVk3NVR4Z21lM0hZbVpOaDkwVkYvTzZnbjA5dllIdlBiaUlBeUpJ?=
 =?utf-8?B?Mk04K2VGOU1vVytYdmZaaDVncXZnTmF2bk1pb3JLM3EvVmtIMFBpSFRnbFRs?=
 =?utf-8?B?RDRsUzE5bER2bGNhaGtpUEcrWWtRMWlJWWF1OTF3MXhqMTY1RVhEUzhOTWRq?=
 =?utf-8?B?eUFmY0lKeGxNVmJLUzZuK1lPRTlBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63cb40d7-7da8-4222-c2b2-08daa2081906
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 10:48:09.2013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qGRJOpwFm08b1yz7oIZPKPrJI0tQxn/WbOhmOoXh0u3jlel1E7iYJHAfmYcb7WXbrP5rEXA8bRabYTjS7idvhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4311
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 29/09/2022 11:10, Ard Biesheuvel wrote:
> On Thu, 29 Sept 2022 at 11:54, Jon Hunter <jonathanh@nvidia.com> wrote:
>>
>>
>> On 27/09/2022 10:31, Jon Hunter wrote:
>>
>> ...
>>
>>>> diff --git a/arch/arm64/include/asm/alternative-macros.h
>>>> b/arch/arm64/include/asm/alternative-macros.h
>>>> index 7e157ab6cd505..189c31be163ce 100644
>>>> --- a/arch/arm64/include/asm/alternative-macros.h
>>>> +++ b/arch/arm64/include/asm/alternative-macros.h
>>>> @@ -2,10 +2,16 @@
>>>>    #ifndef __ASM_ALTERNATIVE_MACROS_H
>>>>    #define __ASM_ALTERNATIVE_MACROS_H
>>>> +#include <linux/const.h>
>>>> +
>>>>    #include <asm/cpucaps.h>
>>>>    #include <asm/insn-def.h>
>>>> -#define ARM64_CB_PATCH ARM64_NCAPS
>>>> +#define ARM64_CB_BIT    (UL(1) << 15)
>>>> +
>>>> +#if ARM64_NCAPS >= ARM64_CB_BIT
>>>> +#error "cpucaps have overflown ARM64_CB_BIT"
>>>> +#endif
>>>
>>>
>>> Some of our builders are failing and bisect is pointing to this commit.
>>> Looks like they don't like the above and I see the following errors ...
>>>
>>>     CC      arch/arm64/kvm/hyp/vhe/debug-sr.o
>>> /tmp/ccY3kbki.s: Assembler messages:
>>> /tmp/ccY3kbki.s:1600: Error: found 'L', expected: ')'
>>> /tmp/ccY3kbki.s:1600: Error: found 'L', expected: ')'
>>> /tmp/ccY3kbki.s:1600: Error: found 'L', expected: ')'
>>> /tmp/ccY3kbki.s:1600: Error: found 'L', expected: ')'
>>> /tmp/ccY3kbki.s:1600: Error: junk at end of line, first unrecognized
>>> character is `L'
>>> /tmp/ccY3kbki.s:1723: Error: found 'L', expected: ')'
>>> /tmp/ccY3kbki.s:1723: Error: found 'L', expected: ')'
>>> /tmp/ccY3kbki.s:1723: Error: found 'L', expected: ')'
>>> /tmp/ccY3kbki.s:1723: Error: found 'L', expected: ')'
>>> /tmp/ccY3kbki.s:1723: Error: junk at end of line, first unrecognized
>>> character is `L'
>>> scripts/Makefile.build:249: recipe for target
>>> 'arch/arm64/kvm/hyp/vhe/debug-sr.o' failed
>>>
>>> Seems that it does not like the 'UL' macro for some reason. Any thoughts?
>>
>>
>> FYI, this issue is seen with GCC6 but GCC7 and beyond appear to work fine.
>>
> 
> Are you using the same version of binutils with those different
> compilers? And which is/are the exact version(s)?

Looks like they are built with different versions ...

GCC6: binutils 2.27.0.20161019
GCC7: binutils 2.28.2.20170706

Jon

-- 
nvpublic
