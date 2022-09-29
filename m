Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C2FC433FE
	for <linux-tegra@archiver.kernel.org>; Thu, 29 Sep 2022 09:54:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbiI2JyG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 29 Sep 2022 05:54:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232007AbiI2JyE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 29 Sep 2022 05:54:04 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2065.outbound.protection.outlook.com [40.107.92.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 564954D261
        for <linux-tegra@vger.kernel.org>; Thu, 29 Sep 2022 02:54:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mtIHgy+E4etkod7tBHqTmn0fXtExjuHjWF7ktJxzHEpSHXPGQF/PGbu4oJ5sQs0vupjcKO/ITub8Nfyj3S6w5qwXlzQ30aoClXXYXvoFc2h75LxanjQjDJScPopWoDOMs4Aimmf8Rv2SAeD1SDwjlcuv92+57l6vUzyMBvnUIXD7Hp8xFMo4yEJIX8VBzbBdY62hrUtoyWuwMsLlVZqbL9LTY6VgHUsfK9UbRJpNpZH6gLV8i0qWomcjkKP2Xd/wkEJbvxHBtiOBZAKYWVIC6xXoRvG/kZIWrzFHHIGqy3DyKKXQ44tmNI0NQmoocqcErR3Lt1UB3XWn8/NSXIVUOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZm/3KV6I4BD3WAZVQ+/BUJLXPE37SoeACIh0AHyhJc=;
 b=UjiQoRYyuPwUcfGOcVAeThWEKu0QQynQqmpIqElQBZofQiSZDGsm7xs6NcA1CnVsefTc9KF0uEi58yCCGmhFNY6a+x7mfdebzuIbzngyDX7Y2582veBBS/Yp9jtsiic7eUQWnNwAzrxNtTi7n+/l4PBWvjgXe3BeOPQwU6BriAM1MaUs4J81/pg30OVC/eIeH1mPKqNDbhV3B/tP1I36HCLPYAbWusSxg7Eli24M79SDawFhOlkSD6CF8pr8lV1KwgrQoDXJAllrt/geyODGYbUwybTot/qd5YcxgFENtTTuzD1Hr7UoThp+2R+TilBia++oAyF618KMhKqlGNIVGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZm/3KV6I4BD3WAZVQ+/BUJLXPE37SoeACIh0AHyhJc=;
 b=rK+ocXSwd5ezsL7gDwnVtIgO3ucUXAR/uMpwYzmditNBm5CabowDzfMarXjStHqaJHzJiYtdsqaU5OZDvPvIhs39lZ68WMJEiHaBhxOJZCdX5FFCwOXpVkAf5A6LKgCgXEyuxv3VuY6VTn5jWVPLsyDw8MRfXjjJrMMlWgQYUWvn8aOQLnDrbtbqi54T/8U3aqcSuzJFYMcNG8M2F1kNW0HbG0GESpLGIICK1nb9c1UvkG0iNro+K7/oqOsWqdAuFV7d2fSf0qFzYd3VLIEVqLmo2VbXCMo1A0i8+VxunUA4WTRDO6xwkiMw/SJmzx+bwvdC4YiasQMitYw1gA8pVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 MN0PR12MB5715.namprd12.prod.outlook.com (2603:10b6:208:372::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.14; Thu, 29 Sep
 2022 09:54:02 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::b07f:53b1:426e:a29d]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::b07f:53b1:426e:a29d%5]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 09:54:02 +0000
Message-ID: <dc53c62d-58e4-ce20-edc6-969c71801c9a@nvidia.com>
Date:   Thu, 29 Sep 2022 10:53:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 6/8] arm64: alternatives: have callbacks take a cap
Content-Language: en-US
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     ardb@kernel.org, catalin.marinas@arm.com, james.morse@arm.com,
        joey.gouly@arm.com, maz@kernel.org, will@kernel.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20220912162210.3626215-1-mark.rutland@arm.com>
 <20220912162210.3626215-7-mark.rutland@arm.com>
 <3cecc3a5-30b0-f0bd-c3de-9e09bd21909b@nvidia.com>
In-Reply-To: <3cecc3a5-30b0-f0bd-c3de-9e09bd21909b@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0406.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::15) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|MN0PR12MB5715:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c181196-0f32-4b25-38df-08daa20089cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cqLNKl0SiHnHCR4jYujHQEPIaiEYCmDOxbt/0je33EEcxCILdkJnZhJ7/uO0u7a22YC3tWnKIotj8s4ldqYF1TE2Y5HgypcjmzPeVJlOcgo6lbwy5V9WqLuTzbRCoSzY8KKEa8U5y05EVtHekwU4c9VLvcXq0VaktXXaOA5WiwSTHdHPzrNlwbYfTys6fuYQSbGfJnZPiTlWbzDGOmRTBYTgv/HJCs0D+V7PObd1AJJUHbmz7yCQg8kMHAyAQgt3Bm5e67+669q5UJZ0KCujlsgRT+D3+dPWCJbahZ9p+Hp11rYf4WNzrxKOf3WmM482/f4gom/f6Eo6w5X/GN197gTErden4lCkBTD+wXx9KxT8yfnIX5jTihrQd0LWoEBFPUIbgxZgH8cTRMLu/Kmsl5gp5DeOUwOdOPD7gHz1nRk/GWORDXYAUrYhZSdxaWrcneRziG7GYWNZMInXEix6xYgffIbj8m0NUWob63f6aiH9iEVaGTBWt8WHRgHI3RmsVTw9MBfT5UTFOpA7IebHe/kheYpL2G2uQw8FN4E7Y9mUnNPxDhCo9AcrW0Sk4PTCrzM3WLASrNCIKLdJKLSAVjuJ1nTTIzWWEQLVqZzDDa9O3qa21g/i7z6Ui/CF+dxSr+NZHUEMrCV90ZJ+GqCBO5I4pNjnzMvRwnIYcWIEe1QNaAiN+r9ukuq2/6AAB4fsCHCI99J4NJ1uEA9LJK35T0G6q/w/qygJM3DL26HxzlHyFWZilkm+G/iKLOdryk2uDun3BUd4H3WyO1rq7v4KOelL9wuk4NEFiNdXsQlhX0o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(136003)(346002)(396003)(376002)(451199015)(478600001)(5660300002)(31696002)(53546011)(66946007)(2906002)(6506007)(2616005)(6512007)(316002)(8676002)(186003)(36756003)(41300700001)(6666004)(66476007)(86362001)(4326008)(6486002)(66556008)(83380400001)(8936002)(31686004)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmdmUjRVcll1QUwvZ1lOK3BXWlhHVGVXUmMyWGFmclV3Tk9rRWg1WFV5dC90?=
 =?utf-8?B?dXptbGU5QTkvMENGZ3E0YWdCN0RNWFNOcDY4K2FoV0FhSWlONk1BbGdwbDRt?=
 =?utf-8?B?MjJtUTRseDdUV0VTK3RkcTJlYXMvQkh0bTZLcm5zZUxGUkk5S0JuSHUycFpL?=
 =?utf-8?B?THpWYmI4SlRyaWVWMEliWHYzK2pFZ1FUWXI3QXNVYWFvbnAvWlFqV2ZiQ3VF?=
 =?utf-8?B?NWhRMFJlVkNRbENPTTk4QnFqZlQwZUt3bktPNWdSZW9BQUEzUzBiRkNSNVhN?=
 =?utf-8?B?N0ZidlZhdVBnejF0Yk5wVklPNTVYbnZMTnZabUVkeFNKYnBLazJTdkVKaGNt?=
 =?utf-8?B?MVgzL0QvZllHWmpDcDhsOFB3ek50S2xKN0pyOEpsdHhYR3d3Vkc2c1V6Vk5B?=
 =?utf-8?B?VTdCY3hmUFN0QTF2OTZuMTdBMmgrTnY1bE9aT2pvdmFEZWVGeFFaNlNVYmw5?=
 =?utf-8?B?OS9PK0tEOHNxQ0M4alI5SkU1NHNWdEp0RVdyOGRkNm13c2wvMHl4Z1JtbWxY?=
 =?utf-8?B?ejFRU0R5UHJxc1gzY0NXNW14UEk5WTduZ09zUjZxYjRnaVRpeSt1T29lcVdv?=
 =?utf-8?B?MU0xQmlXNktqWGJKVWJuUTEwdTZHL2V3WXoremhKbG1VVHhtSStaTTNad0do?=
 =?utf-8?B?UzBuZG5QbUdQSGhWb1lhV0RTbjZGaGJxcW9mazBHR0FHYTdVRGFRa2M2V0Zs?=
 =?utf-8?B?L2I1dHZwUUg1eVlPa3B2bjRiUDVGMHhkQ0YrcFo1U25IN2krRG8rN0FMUFVR?=
 =?utf-8?B?V1N3eFQvbExoYjVhcWdkN2U3M2ZjQitSdGRDSEVDdjJDVmRucXlrV2FhMVR2?=
 =?utf-8?B?dWRNQ3ZQYmZPaG83TUgzeVFPaWtRdDF6UG9KdnJhNUZjaGdPaGdPRWp0NGVM?=
 =?utf-8?B?b0NlaHBKT0dGUE9kcXEyT0p2aVBtbFk3Tm1wYnRYVnJ4aTlvLzVETU9yVUFR?=
 =?utf-8?B?Qm5wVmVxbTg5RTlNQWtKTU02UkFLWUdYWkoyYzNMY0NZK1VvU0ltZTk1d1pP?=
 =?utf-8?B?ZGp0VXV0L1B2NGFGSzZjRlQ5YnJlVkR6VCtMeFdRQ2tnM0xqYmNEYXFvSFdk?=
 =?utf-8?B?QWlUQm8xQmJScnNRRnNDcDVvN0JDRzNmc2hyUk1ITHUzayt5MGlEbjZBZzQr?=
 =?utf-8?B?Tjl0MUR5NGZjMy9YbmNRczVVb1NsRlc2Y2xMSndvUURnMmpCRS9Qc2ozbTM0?=
 =?utf-8?B?bmJGTXFyUC9PWHMxUXoxRnFYWnpTblhzL0FJSURqU3Vld1pic1BvVWU3RGNl?=
 =?utf-8?B?d0hQTU94NjUzNFBkVlROMmdFNElHTUJHaExXNnI2RFBFVmZBVkt6ZXc1OXdl?=
 =?utf-8?B?MHpjM0s4S2NLeFVlNFVuclgrNVhvMkZyTHBGTzY3R2F5eXVZS1NpSzhyYXUx?=
 =?utf-8?B?QXl0cDMzMWlLVXg5N0ptOTFKNnRGbmd1VkhnUlVHVGFhUDZTSnZBL3M5RjFi?=
 =?utf-8?B?L1hzcFNzT280WmZja3FaWklMdnovYlpoaHloaCtjZGV4TG95WGJhODRMUVhV?=
 =?utf-8?B?WllQUWE2SENQK3BvMGx3Z0NPcDhwOXpRWG5LRjFWQzJ0NFVCOXlVVTcrOWpz?=
 =?utf-8?B?VTQxMUVJVWhUZWNVbFl5K25vdEsrbjNxRW9KL0lXK01LSytLNnpuZytkejRr?=
 =?utf-8?B?M3Q4Nmc0S2ZWNndyQTA4bUo0eUlWQjZYaWFTbm8vTVdVWjhkRk1UZHllRlVj?=
 =?utf-8?B?YVU3UlpUUno3dW9saHVMY2xnMktFZzl0YXFhS2hXbGNXaGpiTTRhbDJmYzU3?=
 =?utf-8?B?cGZhWTJqcURLZXQvazJNMGk1anFjbjd1WTdZdkdGZWdWOExrVlBlMVdLUXI5?=
 =?utf-8?B?ZjZJQlVjM0huOGZueGpVd1RpR3VsMzd1aW1nY3hZWmNQWGJpaW5ZbE01anVM?=
 =?utf-8?B?clpMd2Jsc0Rua1VJODJuVHFWRFRPUVZPYWdONElERmJ5dWdmTitkcDBzbWJD?=
 =?utf-8?B?Z3hWcXBDaisrb2w3dUFHamNaOEJWUGtKa25PbzlzWEk3a21LRm1vSk10aDBs?=
 =?utf-8?B?TlM2Q1pQb0IyZ2FMODYwVS9pVUFpVk8yU3Qwc210MEx4QUI3eUQza09KU0pw?=
 =?utf-8?B?R3NpM3c1NHc3cDZLdkdqbU5lSHRpdWkvUnBrVXNJMWRUNEl3OHBQTVZRa3FN?=
 =?utf-8?B?bFRzcjl1bG15QXVQRzdoOFRrb2VLNGo5UE1Vc2xxWGViQzcxM1RvRG9rWFBE?=
 =?utf-8?B?b0hHN0lGeU9GaUNxS2ZtT3RYazNCT0dhSHozMUpPK292dm9SNkhya1hvZXZB?=
 =?utf-8?B?c3hFTmZoM2VxV2RoWm1BR0JHbGVRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c181196-0f32-4b25-38df-08daa20089cc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 09:54:02.4408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a3ASe5oFmfBsK4TsjN041HgnhzJTjCe1D4IUrkgaTpaNdCWsPgmMRn8FlI0FXaIKEFfaSzJU5k6Dh5VtPXK5mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5715
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 27/09/2022 10:31, Jon Hunter wrote:

...

>> diff --git a/arch/arm64/include/asm/alternative-macros.h 
>> b/arch/arm64/include/asm/alternative-macros.h
>> index 7e157ab6cd505..189c31be163ce 100644
>> --- a/arch/arm64/include/asm/alternative-macros.h
>> +++ b/arch/arm64/include/asm/alternative-macros.h
>> @@ -2,10 +2,16 @@
>>   #ifndef __ASM_ALTERNATIVE_MACROS_H
>>   #define __ASM_ALTERNATIVE_MACROS_H
>> +#include <linux/const.h>
>> +
>>   #include <asm/cpucaps.h>
>>   #include <asm/insn-def.h>
>> -#define ARM64_CB_PATCH ARM64_NCAPS
>> +#define ARM64_CB_BIT    (UL(1) << 15)
>> +
>> +#if ARM64_NCAPS >= ARM64_CB_BIT
>> +#error "cpucaps have overflown ARM64_CB_BIT"
>> +#endif
> 
> 
> Some of our builders are failing and bisect is pointing to this commit. 
> Looks like they don't like the above and I see the following errors ...
> 
>    CC      arch/arm64/kvm/hyp/vhe/debug-sr.o
> /tmp/ccY3kbki.s: Assembler messages:
> /tmp/ccY3kbki.s:1600: Error: found 'L', expected: ')'
> /tmp/ccY3kbki.s:1600: Error: found 'L', expected: ')'
> /tmp/ccY3kbki.s:1600: Error: found 'L', expected: ')'
> /tmp/ccY3kbki.s:1600: Error: found 'L', expected: ')'
> /tmp/ccY3kbki.s:1600: Error: junk at end of line, first unrecognized 
> character is `L'
> /tmp/ccY3kbki.s:1723: Error: found 'L', expected: ')'
> /tmp/ccY3kbki.s:1723: Error: found 'L', expected: ')'
> /tmp/ccY3kbki.s:1723: Error: found 'L', expected: ')'
> /tmp/ccY3kbki.s:1723: Error: found 'L', expected: ')'
> /tmp/ccY3kbki.s:1723: Error: junk at end of line, first unrecognized 
> character is `L'
> scripts/Makefile.build:249: recipe for target 
> 'arch/arm64/kvm/hyp/vhe/debug-sr.o' failed
> 
> Seems that it does not like the 'UL' macro for some reason. Any thoughts?


FYI, this issue is seen with GCC6 but GCC7 and beyond appear to work fine.

Jon

-- 
nvpublic
