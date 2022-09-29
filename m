Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5996FC433FE
	for <linux-tegra@archiver.kernel.org>; Thu, 29 Sep 2022 13:38:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232380AbiI2NiF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 29 Sep 2022 09:38:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232007AbiI2NiE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 29 Sep 2022 09:38:04 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2077.outbound.protection.outlook.com [40.107.102.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4FEB1879DA
        for <linux-tegra@vger.kernel.org>; Thu, 29 Sep 2022 06:38:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dq1HjIFO16pQCu19LQa4iHCK7bfNVfKUL8k13FQD7Mdy/Jl8k7j0AudgNoyRafZPQ/tJytx7oSlL1dk2J80qpop+/RTMHSDsOBxL9TAHHSUsbOBWijS6rTT2HjFEeOxO9VVe+EFnmG9Zb2MsGXqROZDFL6+uHgTcd6+3pcKrZqhq3SNfqd/3jpOopeEmlgaCCG3NQ/zf2zMrRVFsScQPGNwx8qZd/jdjQzPg/rrUYoM/LvMmmUX8/YmNqAm7NmwxKc5YPQhlhHim9vSzRwWbcuV6TuURNU+jhZFdFS0D9txrNvhTsThac+2kPowhcjmcB007vnWiya98aK1euxyW/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NOYG5m59J2KEf5IJqNEFlMeKGFCg5LDik4uT84EQJd0=;
 b=CFj2eQWNNYA6oPFVvfZb7zelUvSN0dCGxPsjocX/wvi/0Hwl0qJFX7wSZMTy9P8y8wMGicU9NrE0Hi8adpJACslrmIUxCKDUV8uUWJaDKqMFoYgBm3eiIfPb5aZZYxohX1bSt8o2hJV+Dol5ZO1HiQUEN+tOAPG0UAk8QohUgP8vxd16FVRYoHWMiI0G8A50oUcUUeltuEZoRYTCXLKGScZInHUdxF9L9yJHxSML3VxP4qdto+kTIkM3Otr+nj3CJxKi/Okn+U7KoFNqXuyPpPck1Zy/+8iCGbYC5W5RUcsjkyoeBy34HwRJzRcAzaeOd/s2GgMfX1/kmFxfzfsIHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NOYG5m59J2KEf5IJqNEFlMeKGFCg5LDik4uT84EQJd0=;
 b=FbqWO4ta1XPVc91FJ2ZhL1mkaTZjBs+GJkvPgyEMvOssLCmUAuK3MMldVN0IxVRkSsuln1UP+l+a9mvDnFfZD3bnETGimL3FXc7UH/4mEXR1KFP7lDKcXCgGhKdp4j3faokDY3s32aet2XZJNfMPfY9eXkQu6ke6XRnUQzBnnRAROKCpsMnf6aj3VUHhv4uSMQ4OatbnYi9r69HgQcBwAInkW55QL23S8PG03FdlVBNc0SBQ8nEZE6/fGZ3BQ8YTbv7JeMxT7lkToHc72cw1oBduCbj3i1bkE4/8WsUrJhUC7qT9zubEUfYb6khr52yKVxeanY2TbjujcgBLHs7uPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 DM6PR12MB4435.namprd12.prod.outlook.com (2603:10b6:5:2a6::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.20; Thu, 29 Sep 2022 13:38:01 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::b07f:53b1:426e:a29d]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::b07f:53b1:426e:a29d%5]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 13:38:00 +0000
Message-ID: <f38d5afb-6d15-f802-7c81-533fa59e51d8@nvidia.com>
Date:   Thu, 29 Sep 2022 14:37:54 +0100
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
 <9317eb32-4dc3-c865-a1ac-320a14ebea56@nvidia.com>
 <YzV87YY4N7SJ3Q3H@FVFF77S0Q05N>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <YzV87YY4N7SJ3Q3H@FVFF77S0Q05N>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0419.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::23) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|DM6PR12MB4435:EE_
X-MS-Office365-Filtering-Correlation-Id: f769eda5-40fc-490f-6996-08daa21fd395
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mRL79GoCuAY9bxJS59gSdJ7QJq+S9dG5fC/VESdlgZfUAvf883Nj+AAfdUvS5mBfGx5M34uc9yXad5oW+8QW1KCMA7oQf9MYM8oGBkyBinaF2uxS/QcxqAbCo9Z8evchZgQHkD6zK70CMyx18DRTr5Gk7y8zRob5G6JIfqPEahdYzSRb7X2OdtyPj3TaO2V4wGhodEzHelYT3KfJRJc5FVAPCWNxqQhV9dylbZ2zZ8b5xuBmm0bF2fJjly+9mw6IGswCSR/g3wHYAQT6i+/S1sw/OW97nqaObSBpE/1Rnd0pgu7qDGQpRKVRJgo9UC5BAHFIH8rkrU4AYqsRjIT0bk62u+PSX51A2V+8l8sVFO1Sd2okJih9IEcNEv989vaH9XOpx0AUbymCQyVebr+iVZ0dUjyJe/8pH8xnFr/be0XDGypxJgMLTjbBSAxDK0o5SxyP2mtI6lmy5zLw/P3NyUNQoUe+wkfr7qkn94AHA2d2NCLszQUaclqisSpgpyPS+pDXCZFXEQOsJ0LcmfiWbwL/UkmlMl0vJejLu0vj7rYQc8V2O+kSWzr9EH6WF8vMKvHJCoqWRkErooFc4KRxlz1xRosZPd8X5iq/iTZ3+RL1kQ71zsvF1ytByqHpC3e7Lto4elKe7fsTj78W59d76fH0CLQG4z0En2fi6bISsEaiA7J8bAHreIaWzbMO96HVJ3ye7U3tiGnnF7Lxy8+qwMqKN21RIJidSsalKSAXUaUnFcYp7+iSNDjSWei2QIADy2Fj6LyivSYmDxhGWmwF2ZKi3YHuanv+LL0+vNnjgU8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199015)(53546011)(83380400001)(41300700001)(2616005)(6506007)(31696002)(5660300002)(186003)(38100700002)(6512007)(86362001)(8936002)(478600001)(6486002)(66946007)(66556008)(66476007)(4326008)(6666004)(8676002)(6916009)(36756003)(316002)(31686004)(4744005)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTZRbWg3dFZ5ZWQzZ2ppQ3VnQWVQdWxZQzBlem5INTJsRHc5TFROclArcUcw?=
 =?utf-8?B?aFB5dS9xd2hRM3YrQWtIY0JFeW5XTC92NTFidVZjQ1JycFp0UVhaSU1DcTd6?=
 =?utf-8?B?S3BSY3F6SWNHOXM1eXBuVlpZQ05qNUV6NGpXL1crbVlWV1hnZTlFL0xJUkVM?=
 =?utf-8?B?Z3QyWkw3T1N3K1FNSlZKNkhtVVVldTNROWpsUzladytLRmdtMnJjVUx5Nml4?=
 =?utf-8?B?MGx3ejU2aG9TSGpINTh1SllwRklubnlNMmVyZUJwM09lN3llWVNwRnRsL01O?=
 =?utf-8?B?eVhLUVBEbktUd2ljWlF0NUtzUVRYZitkVHRqWEdtVE4yWnB2UnpUbnIyVzBV?=
 =?utf-8?B?alBkUGVpV3pDVjUxWkNPTHFnT3FOQjRMUU9QRUcyZGg0S1U5dzFyWTBGcTdp?=
 =?utf-8?B?WU1tQUpZS3E3WElNWTdkSlVmSFhiZlBBQlRuZUhlOEUvajJKNzRrQ1NTbEtE?=
 =?utf-8?B?ajExaEpqbkVBUXNZQmR2alQ1WC9MV3lZcTJOU2I5Mm1zNVEvdUo4Y3I3bFdx?=
 =?utf-8?B?M0hCRTlyRk92dUhXbnJIdVBvV1JHVUJjWW53eElwQWZ3Q2hHaE44QW45c2s2?=
 =?utf-8?B?alpkQXRrMDRRNUlFL0RPMnZ2Wmk5Q2o5cE5mSjVFZFhSLy9TTkZ5aUpWQU5s?=
 =?utf-8?B?YzBkZitVdkZTM0VvV2FBQi94RTE1WlNiTXhtaVhWeHlmUGlyOGprZVpJWld2?=
 =?utf-8?B?QWZscDcxWmFyd3E5VEVhK0ZSdEFwaUN2U1ljYWdoVXZnUDZvMkZHUEVCNWUy?=
 =?utf-8?B?SjRibm4yYW5JZE9ucTgrQmxVYUREaE1LNFI3L0h2NmhFMmt0b1IyTkp1TW5P?=
 =?utf-8?B?VmlQMXZLRlpqVjBETWdSRkdKT3p1WW0yK3p2cDBvd3VDWkZySVFWSENlVHZD?=
 =?utf-8?B?Q0lCSXJFdk1pUjhIaXlBamIzdFhQVmdTNG9vWFNMeFovMXl1cDNodXdDbXNa?=
 =?utf-8?B?bllRQy9LWW9sNXlWYzRJck9XYlBnZUwrNlQ2dkNaMUdBam11Sm9IeEx5UU9V?=
 =?utf-8?B?L0JJU0VGKzhEMHhhWWN6NVlyUnhOTWFlUlJZUG9HaldMVzJJTjRQWTc4SUdW?=
 =?utf-8?B?MXFmUDkvQnBibndrVXlYS2dFVUxzTzREWUtDRXkvTmx0eGlRbFB6Z0tXdzZ6?=
 =?utf-8?B?bTlLUW1FUnpBNUJXTjJsOVl4QmttdXZGVXZSNHM0aWdJK21UU29QSEViL2ta?=
 =?utf-8?B?MXZkVmlrdDNJZlc4bzA3SEZQQ3czcnBFTlFWUytxSlhiT1VqSldmcURTZVpv?=
 =?utf-8?B?QUZXbkYyaXRadUszVU82NkxSSkZLU3VsYzZzYURYZXllVm1IR09lTHZpVUN4?=
 =?utf-8?B?OHpyZExUMUlTUG43ZDJ5WDVYUVp0MTQwa2NNQXhmc0JiWUhzZmM0dnRWMUow?=
 =?utf-8?B?eUlpVGp2dDRDOHVoSHVKSVBqOFdUd1BmZXZsaUZ5VC9ZeDdIZzEyNm1wLzUy?=
 =?utf-8?B?WFhPWElueVNteVNLYXBpL0NScVJsSDZBK0hXUjVSemJ1V0U5UDAvWjRoYmty?=
 =?utf-8?B?dHh4MFJ0OE9CWmtNNzFvSER0WTAyOFZhQ2MzYW9MdjZrOE5wRzFxMmtLME9F?=
 =?utf-8?B?NDJUd3lkeUJ5U0ExZVRhazQ5c2RxQXlpaFowbit0T2ZldjNDZXFDNlI1WUky?=
 =?utf-8?B?WlBIOGJSN013KzcvNCtrZ1dYNE9UQVE4NnhKQWpESUFvWmc0Q2cvd0pBVnU4?=
 =?utf-8?B?M3NibVZENVRDMmMraHJBaERwSk1aQ2JYUjBCMi96UU9uSjh6NjFPTzZEeEYx?=
 =?utf-8?B?T1U5dzBzR2RISjcrZXFOazZBeDFFK2w1MlA1K2JwbjhtMC8zRkg5aDJVOUt3?=
 =?utf-8?B?TGJwNXkwNXBPSXNTeUFEYktocXFxYjNRRjIwcmM0SzV1Qm1jRkJvOFd2SUJn?=
 =?utf-8?B?cVBPUmh1ZjRwMzNkd3JOcWVGVjB2dEJob1YveWhXODFHZDY4ZnVaekxzYVNW?=
 =?utf-8?B?eVlDbnpsMzZhcFpQWGRYeHcxWi95NjMzT01xb2dmOUh3T2NNanFXQUtsZ0hv?=
 =?utf-8?B?MkI2TlVrUm0zdzRSRUJ6TGZhSXFaK05WSEFnc2pMWlNGVzNMbnNXQzlKQklX?=
 =?utf-8?B?aVJHNjY5VjIvNjloMWt3QXNSVkhEM2JiV3FQRVBMRmF4ZmlwRDZTYWpkWWRE?=
 =?utf-8?B?YXZ1cDhKcFY1RW00Mi9zUUhtcngzbGhEZzg2dVNZWnpnSStWU0F5NUpqR3NH?=
 =?utf-8?B?T0s0bGR3M24yMTlNeFRJMWNGSjNUMStYVFR3cUtEL2oxVElyZDhTb3hhbFJ5?=
 =?utf-8?B?VUUwZCtMT1Z5b0RyRHQ0ejBaWWdnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f769eda5-40fc-490f-6996-08daa21fd395
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 13:38:00.6172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 01bG02bHw6Dy/X1kOssLVFo0RBOsZU5InMMiSBgXPZB7U7mbmAO1OPjUigtP6L+EGY3uy4MZ69WWqXfOYp6MHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4435
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 29/09/2022 12:09, Mark Rutland wrote:

...

>> Yes that fixes it.
>>
>> Tested-by: Jon Hunter <jonathanh@nvidia.com>
> 
> Great!
> 
> Could you please let me know which version of binutils, so that we can add
> something regarding that in a comment and in the commit message?
> 
> The output of ${CROSS_COMPILE}as --version would suffice.
> 
> With that, I can clean this up and send as a proper patch.


Yes it is ...

GNU ld (Linaro_Binutils-2017.08) 2.27.0.20161019


Cheers
Jon

-- 
nvpublic
