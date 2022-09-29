Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2834AC433FE
	for <linux-tegra@archiver.kernel.org>; Thu, 29 Sep 2022 11:01:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235022AbiI2LBu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 29 Sep 2022 07:01:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235194AbiI2LBg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 29 Sep 2022 07:01:36 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 815B8E999A
        for <linux-tegra@vger.kernel.org>; Thu, 29 Sep 2022 04:01:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cuC8uawkV+XLykwqK9aWZWtLKX+GZf7UDQMX4rKr/gBk+MTZPWbZxJW6vjHtMOtARk6qRHV7R4cdXeqRa+PP8ZEkwJ52gk6LyS/n4ZJveAKIPslcmxVLfIAOx5SkA4BOQdjrcFRiO3BVy+lJzTSFjT7QhiwFewbgo7hy7+Wd6HFJ8SACotQWZblaqgCbfbvD3aIvziGP3xYD8XLdVkbMaETPc+aPJ1O+a5O5wGvp5JXhfCUTsBzMz2q9mSQ33WQWMiMM6rXQuKxx86wP3mulz0qatvZp80afMIjb0pnJyde0ReQXLihFqwiESZAu00D8Hi9YRXhOyiOzz7JK6aJF6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tl3AUaoA34zh+uc8M/2C0g1pMt9CNz3NxWOGdEeVAo4=;
 b=XbvcIpWuq365BuDf7pPxgmTF/by2hylt1vApzfRrIF5IW/547KB/SLyRF1vqpiF6bHDXN3yWhh5Hv45cFnak7TXzRb7vEu5sXudwqk9C0Mwa0SmM4O8dZjgAV+XPrEmVs98ThjcCam349SXPIPtf2U42zI/o2gGd5v/KzUeErUi4e2CvWqLBRCO1f/ItXxU/u1gxqRv/Pb2WgygJomoOrZAFKgI+EH0W63Hsls5rnPmxs7cCCk0PHRILKH2oWgFRppsOzCO8hIZ9M+YMAmMcw8YFWP2Xby0cKa3Gy0PpE3xMm5Dt97eQJgD7DVv3GwxErMwLNojsMroG0i0Fh3NEYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tl3AUaoA34zh+uc8M/2C0g1pMt9CNz3NxWOGdEeVAo4=;
 b=TXECkymeVNgDmgsxGvNdGXM/K9KHqRIZrpk1xvQZKNcLWC7gaxVKEaXv20ZzS2fwXCb5JwVmNsohLtOc081qVx6Aohs7qqPULgxFoE37mElhY7lLxW+4HsCg42F7rG9EcGcBs9A2zOXDaEuxpp4Y3L6STsf41olX87xo74T1/fJNEB1ui184WH1us6+0iTQ49QhT8yxGOXj9tEIvl5M2b8cjnkbXxjXOjVBB6mWNa+o8+rIRwwVOcDJwpjuiu5OEr9UjLnhdvpnv1Df5GXtg02KNZACsOddIh0h555/b41Jhd9VSgMsw/NkJTIGXplwrL0dqgIlnDZvgDtDv0REL+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 CH3PR12MB7689.namprd12.prod.outlook.com (2603:10b6:610:14d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Thu, 29 Sep
 2022 11:01:30 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::b07f:53b1:426e:a29d]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::b07f:53b1:426e:a29d%5]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 11:01:30 +0000
Message-ID: <9317eb32-4dc3-c865-a1ac-320a14ebea56@nvidia.com>
Date:   Thu, 29 Sep 2022 12:01:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 6/8] arm64: alternatives: have callbacks take a cap
Content-Language: en-US
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-kernel@lists.infradead.org, ardb@kernel.org,
        catalin.marinas@arm.com, james.morse@arm.com, joey.gouly@arm.com,
        maz@kernel.org, will@kernel.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20220912162210.3626215-1-mark.rutland@arm.com>
 <20220912162210.3626215-7-mark.rutland@arm.com>
 <3cecc3a5-30b0-f0bd-c3de-9e09bd21909b@nvidia.com>
 <dc53c62d-58e4-ce20-edc6-969c71801c9a@nvidia.com>
 <YzV3y361Mj9N+CcW@FVFF77S0Q05N>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <YzV3y361Mj9N+CcW@FVFF77S0Q05N>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0153.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::21) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|CH3PR12MB7689:EE_
X-MS-Office365-Filtering-Correlation-Id: 29f63f83-637a-4db1-5e89-08daa209f678
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kq3tW8RHnM7oJbYwtFcd5EyG6i7zaDuaNJk+nlV+PDN4DXBLtnvQ6Ee5qYnpkDm9sxye9ctyDKqjqEggphmixH+ypAF1+qfOj0a7C1XKKpFk83NlKf3B84mDZ7GZny6+mTsj8MtN5PEckxPuOiq5CSYcbiw3CHJEox/57x/Q65oQXvLz80sxjw7BOZXhyEO/Ylxi7dEZ+EfaR++QcYdygAoWVjYmE1uI5Wt6O031GQbEaVxL6llx+KsdsrPcjKs1YCrm/GPI3fGBaG9mrgMzQyIn/7kGNib4HFKbqTdSfRi3TMvqm2K+W7F3nx8pgmWvIRvnlItJubqIUs7PVithFnTGRjtIVPRxei9s4q8kvBGIpNqF1CRAM2tTRFM9GyMwk+1WkYI6zhzp3cVXqQXDeNrMwv2q1z53nEQsNvUPsS/PeYmlnw5NT4E8d+JJ4+MAqWKY4n+Ldq12kMs6FwVNq+o0sLqcsoiKH0ZSY5Cwk9osLrJ0nOqJFsRC8P4Hoj16VGXwee++30WXFsXmhSazqlSCMFRLTPJR89Q/QkPVQdoHNU2HGmou2efolCbueHMg4wBcFnJOv+ZTerMpe3cRt1zMNz77MJIq/cxn92xkqOMT5VqgCUKFSeu8EPORKeXINTb4wyjySBINQSu5EUuHQL3jn8B3aYmYw/oV2vj4V9KOQRrH6WD3XZTmZWz8DQrbDU4JQCZpqktsCkkg9Bsj0Nh+mrpDi4DRKEApMEWFWcV7Tzq3PeOr8QeRKv/Vd4JO6xUa2qXNuj0O53daYXuVgMnRLcczDaMrZrAYT4yqqNI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(376002)(39860400002)(136003)(346002)(451199015)(83380400001)(41300700001)(36756003)(66946007)(6512007)(2616005)(316002)(6916009)(38100700002)(2906002)(5660300002)(66476007)(66556008)(86362001)(8676002)(4326008)(31696002)(31686004)(186003)(6486002)(478600001)(6506007)(8936002)(6666004)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDBWNlNNdnRESEtzREd3b1F4cEtYeDlPWnZ6aTJHc3FMM0FXVDZOMW9VL0h4?=
 =?utf-8?B?VTZOSlRPVFJBdXlFb3U1VElSb1RhQ0ZEbDQ4SkhnR0hTWExpY0tBTDhkMlBt?=
 =?utf-8?B?bHoxcVhDUURqZVZvY2NQaDdxRVJjbzZod2pBM24xR1JpRXlWYmUydTYyZ294?=
 =?utf-8?B?Q2xsN3cwOG1SZy9sQktCMy9NMHpHOCtFRTNhZjZrbU8rMlBINzE3bEV0ZkRh?=
 =?utf-8?B?MGJLTW16ZlcvaXBkYVQ1MkpLaTlFUFE3UVdjcW90d1FxWXlWRE5MamxJRmFZ?=
 =?utf-8?B?cjBhbk42cjNRWWJYeVJtUFE5K1czUFRFVFdnM0tmTjQ0b2s2UXhEaTVzVjZD?=
 =?utf-8?B?OEI1cU5JU09xeGE4WDRITnl0Q2ZxNlVzVUQvOHQyK2pSM2tsbWlvUkZmNkxr?=
 =?utf-8?B?K3NlTnhKejFtNGNTRVllQXlKb0ZycUpwMW9PQVlVRUhDYTJtd2FVUk1ZUXpZ?=
 =?utf-8?B?ZHBGWFhCQ1VZbXFXa0c1S2RmTnJwVG9JRVJ1azBwUkVueVdVUDQvZ1k3aHhB?=
 =?utf-8?B?ejh1d01pcHdnNHp1U1IvdzdlaEZDSFJhTnl1bHNoZ3VydGlXbVVwRnFucHV0?=
 =?utf-8?B?L0ZsdG0rL3NFUUg5VlplVHZ5VFpEci9XYXd5MGhGdS92WXczQzhMMnREQWdM?=
 =?utf-8?B?clRyRERJUThTQjZVOHpSd2lNZWw2R1BxSDAyS3krMWh2Mk9LaWFVZHc2UHg1?=
 =?utf-8?B?WTJsd2lMZ0FRTHFhQ0Y3Nlgrd0d0NFZUbmFMZ01jODZydk91WStWVUJVQ1ZK?=
 =?utf-8?B?bW9ENkNWRGtzL1UyYWZ6bW1jZVcrdWxtMGhZVkNoR3RycTJKNUpoSHNQdVFm?=
 =?utf-8?B?UkJLNGxMd1JoWUxaeFcwVUsxalVWTG9WckVGRnF5eHVmTU5XQ3pUNVUxampF?=
 =?utf-8?B?Rngybk93eGpHOEN2K0hMMmJubnVuZHNRMDdEM2FrQ0lLdnkrTW40bFAwdTVv?=
 =?utf-8?B?QjhqQ1lCdXhtS1dOUkc5c2kyc0VZK3BuMHBiV0NhM1pPK3pJRTAwV3M3OC8y?=
 =?utf-8?B?cmxCOGZ1bmh5Nzd5NEUvV3ExSkIwbSs0U3JidHVQbW9iTm9RUk5ZMEpCQVJu?=
 =?utf-8?B?ZkFyMDZwb0FVTHJKelNwNlBtQm9VcU10SERyOGcxcHk2Y2c5bEZTUjhLSG13?=
 =?utf-8?B?cHZyOFdyYXZ0d3VaQ2FDbzhnc0phRlhtVFQ2OEZpZ0FHcXpMdWs3ZEJEamJs?=
 =?utf-8?B?NTZUYjQ4UUNhRHlGSTB4UjhqOFQ4d1lxYkovWlgrZUFqYmNOMENTeWQrRUlX?=
 =?utf-8?B?ZWJDY3RxV2tKN0tKcys5Ym1BQVlIZ0ZQNWlET0l4cXZCSkVlam4vdUVvUjl6?=
 =?utf-8?B?YnBSSGJ4UHJrbG12aStLN0pVVHBJbEFrMWFKcWx0aER1MmtnTW5KeWRIMW0y?=
 =?utf-8?B?UVpJRThMdkxENVpIY2FxOUYwTk43ZTdLYTcxNjVRM1Yxd2lJd2RxSjhmWkpl?=
 =?utf-8?B?RTI1QlRpUHR1MTIyRC8yQStjLzhBTDgxR3ZyQUc0ZzYzVjFlU3RRaTRCbkRi?=
 =?utf-8?B?WlRPdy8yMEcwNFlMYXVUYU44bFNrN2g0Q0EweTlaREVVbGw3cjFWOUZQbjNm?=
 =?utf-8?B?bTdSOXVkS3pMdnVhZ2F0NG9JS2s0eEpmYTkvT2tWaGhBRFhMTi91OWh1SUgw?=
 =?utf-8?B?SS9BWGpLK2xPUy95djVoaDZxM3JsbHU1SEpFU1A1Tnk0Sk80Q1hZU0dSQ04r?=
 =?utf-8?B?UHR1N3czekJiQWpDRUx6UmVXK2hPVlFxSXc5MkFFSVFMdWtuSkZ0NGM0OHlE?=
 =?utf-8?B?S1RnNUtYUTQ1Rk91blpMYm9neksyVklTTGh2QzRHREZQeFYxVXRSOUxsZEFD?=
 =?utf-8?B?MUMwQzR4azZPeUdHWkFrc0xhak9OcUFXRUJlaGkzQ2JtbmY1VmJwSW5lcWQ3?=
 =?utf-8?B?ZmpNbFJaM1FSd1BCZU1MTzUwYnBSNzIyTG1reEVhOE9pc1N2Q25NakFodzQ2?=
 =?utf-8?B?OGpEQ0h6R1VZN1BWMThYT2xqYXV2UEZ4L1RMQm5tdlFvYUN0UVZZRlVKQ1ZR?=
 =?utf-8?B?NjJEMERZUVkwOWVsYytpa2dIL1dkOTFid2dnZkFWOTA4V0Q1RTBRaXdmNWlj?=
 =?utf-8?B?ekpJK2NvZVJvbXJrVHVIeGM2bkFMTi8zWWFORTluYSs1TGZlREQ1NS9HN2N1?=
 =?utf-8?B?bUdXSzRya3MvQW44OGlTQXlFNVFHUk5tWFBBTHVLL2VkQ295M0lNb21aaTZM?=
 =?utf-8?B?V3Z4djlMVmpFMXRna1o3c0lMbk51SXpuMGZaTVRseUhzSHNVbno5ODY0QTc1?=
 =?utf-8?B?RWJQT0d6ZVBlb1Rxcms5cHNpLzFRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29f63f83-637a-4db1-5e89-08daa209f678
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 11:01:30.2647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IKz0y2W90XZagmvnR8OERCzkbholNjA4Nv/NbxKPubZYt+q2u52MZS1YeVemaloEuX6KMsm/bnljgb1UEt3EYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7689
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 29/09/2022 11:47, Mark Rutland wrote:
> On Thu, Sep 29, 2022 at 10:53:56AM +0100, Jon Hunter wrote:
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
>>>>    #ifndef __ASM_ALTERNATIVE_MACROS_H
>>>>    #define __ASM_ALTERNATIVE_MACROS_H
>>>> +#include <linux/const.h>
>>>> +
>>>>    #include <asm/cpucaps.h>
>>>>    #include <asm/insn-def.h>
>>>> -#define ARM64_CB_PATCH ARM64_NCAPS
>>>> +#define ARM64_CB_BIT    (UL(1) << 15)
>>>> +
>>>> +#if ARM64_NCAPS >= ARM64_CB_BIT
>>>> +#error "cpucaps have overflown ARM64_CB_BIT"
>>>> +#endif
>>>
>>>
>>> Some of our builders are failing and bisect is pointing to this commit.
>>> Looks like they don't like the above and I see the following errors ...
>>>
>>>     CC      arch/arm64/kvm/hyp/vhe/debug-sr.o
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
> 
> Hmm... IIRC there was an issue with some older binutils here not liking the UL
> suffix, but I thought we'd moved beyond those versions now; can you tell me
> exactly which binutils version you're using?
> 
> I currently can't run the kernel.org crosstool GCC 5.5.0 release on my machine
> since something's going wrong looking for an older version of libisl.so than my
> system provides; I'll see if I can get that going and test locally.
> 
> I suspect we can bodge around this with something like the diff below.
> 
> Thanks,
> Mark.
> 
> ---->8----
> diff --git a/arch/arm64/include/asm/alternative-macros.h b/arch/arm64/include/asm/alternative-macros.h
> index 966767debaa3..4dd23bdbfb9e 100644
> --- a/arch/arm64/include/asm/alternative-macros.h
> +++ b/arch/arm64/include/asm/alternative-macros.h
> @@ -2,12 +2,14 @@
>   #ifndef __ASM_ALTERNATIVE_MACROS_H
>   #define __ASM_ALTERNATIVE_MACROS_H
>   
> +#include <linux/bits.h>
>   #include <linux/const.h>
>   
>   #include <asm/cpucaps.h>
>   #include <asm/insn-def.h>
>   
> -#define ARM64_CB_BIT	(UL(1) << 15)
> +#define ARM64_CB_SHIFT	15
> +#define ARM64_CB_BIT	BIT(ARM64_CB_SHIFT)
>   
>   #if ARM64_NCAPS >= ARM64_CB_BIT
>   #error "cpucaps have overflown ARM64_CB_BIT"
> @@ -80,7 +82,7 @@
>   	__ALTERNATIVE_CFG(oldinstr, newinstr, feature, IS_ENABLED(cfg))
>   
>   #define ALTERNATIVE_CB(oldinstr, feature, cb) \
> -	__ALTERNATIVE_CFG_CB(oldinstr, ARM64_CB_BIT | (feature), 1, cb)
> +	__ALTERNATIVE_CFG_CB(oldinstr, (1 << ARM64_CB_SHIFT) | (feature), 1, cb)
>   #else
>   
>   #include <asm/assembler.h>
> @@ -150,7 +152,7 @@
>   .macro alternative_cb cap, cb
>   	.set .Lasm_alt_mode, 0
>   	.pushsection .altinstructions, "a"
> -	altinstruction_entry 661f, \cb, ARM64_CB_BIT | \cap, 662f-661f, 0
> +	altinstruction_entry 661f, \cb, (1 << ARM64_CB_SHIFT) | \cap, 662f-661f, 0
>   	.popsection
>   661:
>   .endm


Yes that fixes it.

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
