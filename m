Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80A75C7EE25
	for <linux-tegra@archiver.kernel.org>; Mon, 12 Jun 2023 13:16:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbjFLNQ3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 12 Jun 2023 09:16:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230331AbjFLNQ2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 12 Jun 2023 09:16:28 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14938D3
        for <linux-tegra@vger.kernel.org>; Mon, 12 Jun 2023 06:16:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K8j0VCInup2R6X8NVbJS+kbYRSkcZA+O6tQB57wA5sBVf/reWCMxKGtDtyypGiAoFLKC/FozPnymA/X3BzN6JJCSXow+WA+8xD+KvwqRBgdBu9KaBGT2+hDKU2+7VSARD0APUCwdGxmgzaoVj1jpHlcQ4tD0FywzXJEer6KHoUp4qA2IxZCaolYhJUEJNcG2+lOEYnaAUJMH3el8Vxp8rToZ5+5kojSUJ+9S3WdCyWT2KeWY1WOjLLCQpWqksF/782MHPehy1cbzecvu3zStRa5r12Rz+ywaS1fja6m5i/m+K9NDNk4ems8SFOckHgRH7ohp4SkqvhzI93wMKRxhzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1b4iydlR7FMYkDMW889aogHdHXIaU7TUMIDeuvtmgV4=;
 b=H5vDkykY4tZ5W+lnPoRwyOhA1uzD/o1FiZ37iA9QEYiwTLs70mqqGRIRq2eetAxEoLaahPOPohYhpv2wLqsoKTbT4KaWV8x3y6a/JpLJa1CZzYfpaqpOD6mXdiY1lPr5dMf58p/8Gly7MFmj939Eu86X9jamkL3FfirIH/GG8X75pNhipBFp0xtHNfyPnE+OkZunrkK3ENZH4hIcLt0rbMj/BwkRyqVSmyN6aOBhj3CoCapJ5Amq5hrq5jDQlOYSorm3RnDKmTjTglDlnyT++kp8lDL6onWUbkSvDqTDnjLPi8WB4T8xpsTVuMrFrxnFdlczopJt9/P0PEV8ejh4UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1b4iydlR7FMYkDMW889aogHdHXIaU7TUMIDeuvtmgV4=;
 b=sPrZOGjhzEMHyA5rd0JLeS+9xlIAhmuQlG/8Yn0Q1XhNqBmVjF9fzNni9ZCUOkm/t2482VdH39URrXErC8tOcN1r0Y7jQY2WocADoQpyOIMWNzX4W5d+tD8RX8FY90yZRnERpf+OYEV6v4IGRr3gfPtA3bFhiA6q+R7vPoMGbjoJhHFVjsadFvSowIrC35ALGAunXeSJ3a49Kz4eDsxP6S8DkTm5TNQFbxkyBYnqJOLVNHIcDwCbxjBRUo9AcBqPn5X83r9f55FQKuVbdnGvpOa2KPtJfjLfZAKzdBO7DAnMXIFvMGiau+Hsywo+u2OdQPUfmZ2lpg/cn/8O01KppQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 DM4PR12MB6062.namprd12.prod.outlook.com (2603:10b6:8:b2::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.29; Mon, 12 Jun 2023 13:16:21 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::21ef:9d59:5b2d:f1e8]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::21ef:9d59:5b2d:f1e8%4]) with mapi id 15.20.6455.043; Mon, 12 Jun 2023
 13:16:21 +0000
Message-ID: <76082a48-508b-e5cf-6ae0-66c265ecfdd7@nvidia.com>
Date:   Mon, 12 Jun 2023 14:16:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] ALSA: pcm: fix wait_time calculations
Content-Language: en-US
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
        alsa-devel@alsa-project.org, Sameer Pujar <spujar@nvidia.com>
Cc:     "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20230405201219.2197774-1-oswald.buddenhagen@gmx.de>
 <b57c46a6-4446-3418-fc4a-8bef1e28868c@nvidia.com>
In-Reply-To: <b57c46a6-4446-3418-fc4a-8bef1e28868c@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0015.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::27) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|DM4PR12MB6062:EE_
X-MS-Office365-Filtering-Correlation-Id: 25dfe230-b36b-484a-6e5c-08db6b4736d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l4zhIeupoxF5rjfDrj+ZWrCpyAs4c76IpsY1e7UDLM03wCnzhEbBssu93EUR+JRFSqo3Yv/tg9/+zh52TXHdfdx2eTeqLWAb+LLt2UlokPwscdlfahJXNMqMMalmfuTiAuK1y7OPbwmPG7EHn8r4Rz7v8GaOTM1iQAb+CELXNWeLeksmvGXPMQ+DOLIBVbMZOPIYy5sBFbAQWl9jxnBAxuxYHMpKKH+x2a/QxWUPOYWPluCoIk7msZA8dQyP4EyS2qtsZemR7SmuDrch771tbv1xKZqcouWDY0swEGTeJp9FmT8c61rlfCCsgMF1OzYhfSO7Xtf/XcauvokdwU/Yw4gkQF/GeWPSByI5nv55S/xt6jwr1+e8rCmIB6BQBfGb60f+RF7CyIk+FdV9OTouvkgmj7KUVV3Ef8iGEqyDcz8MdFEAEFsJFMnXSELDjIV58HGSmANJrdWV2QGqjX9XMx2HL8i85WgxNQxV0W9K5cEEoNczGUIlvwBlDlDbD8Xfb7T6Uckd/Meewu/YxHCU2k0DTDsw6bIYa0li9NOt8n3vWiycxtZ3w4YgWStBYYOqyzQmO9PY6gi1kzyiqO+1V3Jr+Ufnw60mp49l2q9FGSsb1E87+rA81mp6N4DKsfb/h4cxOxyUe3xM3z9qIRxpWvx9zR2O9LfRlP4NgUnX51aOBpbfvXXfcA3qh6XrkzzY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(451199021)(31696002)(86362001)(36756003)(66556008)(6636002)(110136005)(478600001)(4326008)(316002)(6666004)(66946007)(66476007)(6486002)(8936002)(8676002)(41300700001)(5660300002)(2906002)(38100700002)(2616005)(6506007)(6512007)(53546011)(186003)(83380400001)(31686004)(45980500001)(43740500002)(414714003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGIvNzVabXhndGpjdHl2V2pvK3k5aEF3bTU3RUpDMWhCSWtpb0g2TUwzaUk5?=
 =?utf-8?B?UDNuWjBhTzJZUlhjWGZaaXpUQW9rVGJHWVRoQTRFdHIrbko0ajJjUDBMM0wy?=
 =?utf-8?B?WTJNdWl6NUMyeWR1THdmczZwNUdsS1dlRHZadUJtSTRuSFhEcW1ha0Y3MStX?=
 =?utf-8?B?MXh6OFFMYkg4M0E0bXZIU3lnQ2NMZlk4TytvQnJkRE5WaVp5V09nNmpRaWF6?=
 =?utf-8?B?bWVIcld3N0pDMVhFOXlpMWtRRGlXZDJrOHBCWW1wdjllNU9iamVNblpTUFg0?=
 =?utf-8?B?RUMrWjE2NGQ5MGdXR1c3T3h1SHBPbW5QY1JZam9tV3lqNDJTR3pwS0ZtcHpZ?=
 =?utf-8?B?MDgvUGhzcHVkUlNOQ0s3WTZiTXk3azFTQlU3ZUVHeE5ySDMyZUVDdXp4QWxM?=
 =?utf-8?B?YUJFZWFaNU04NDBmNHpYNVpWTjBDek40TWVwWkcrVWdMRXRSNVpySkZheThj?=
 =?utf-8?B?ekh5R3laWUp1ckN3WFJZYTZMbHJpOWRkRHh6c1lvNWY3ZVl3NGZXT2ZsNlpQ?=
 =?utf-8?B?dlM1TWRWbmRyZVdJZWt1UEdQSjAyQ2JqOUVxTTZQalRqRkptS2QyQTBRNFNz?=
 =?utf-8?B?ZENiZUVpbkZkaEFiTzduQnVlK29OSy9KVHJzWmNMYjdhS2prdHZpMDJaSkg2?=
 =?utf-8?B?dVFnK1YvOEFtRVJNWVpDVTB1bUhWN1JkajU0NTlscFBVU2pJSEt2UmN1NUZn?=
 =?utf-8?B?cGtpOG8wdkwyTDBYemR2bnVJQzJsbmRHNFhqekxrQVM4eWVJVTIrYmgycXNj?=
 =?utf-8?B?ZDRPMnhoWXZjTndaVXd3WVNQYi9KTTlQa0QrQ2g4ekw4VVNCbmd3enpkQ083?=
 =?utf-8?B?cTVHa2VYeG5rSThMSm1xVEd5bVdXaVM5U1VLcmFzR0RubmhFUDdUZDNOc1Br?=
 =?utf-8?B?cXhqRUxpRHpHSmtzaGMzREQ3ZmN4c0RRN1l3WU9BNEdoU3dJaXhFV09tbXh3?=
 =?utf-8?B?MmZITGdqR3UxWm9KL1VrdFZlOGI1TllNYm9vZDBQZHpUbzRTUlRBSXhDd2xM?=
 =?utf-8?B?WHExTVBlczFkRVloSElQM2xPejh6NnFQTGlvRkU1c09LUEVGclpPQTdYOTJ2?=
 =?utf-8?B?WUxaTEpOZXZkcVdhejBJK0x0NFJMMzh4RFZSM0NnTE1uKzZEbWVCVnAybGpQ?=
 =?utf-8?B?Y0tQM0kwdndyRUFLcThUZ2g5anVJVmk2d2Vpdk1qMy9RalZNZWJiejA1Q1pF?=
 =?utf-8?B?SGZEYUNQNVBVV2FwbGhHbUFTN0dod1FVSUp6cmxLUXphRVVTanZGdWVQOHNC?=
 =?utf-8?B?ZVUwVVMwcXhIL3ZLY0t4ZXpMYUJFWTBGUWgxSHRTWnQ4ZXFmQ3BLcURKMHRW?=
 =?utf-8?B?TkhKcWdhTXFLcjRoaitxR3BWUnQxaEZGeElwZ3R3RUNpcklNY3FRVmY2djJM?=
 =?utf-8?B?T0s0U3YwOFgrSDJtYis4dEhLQnAzalVod1pnYTJjaDFPWXFoM2JvaXhHcERP?=
 =?utf-8?B?SkN6WGtKY3JZWS9OVXZVSSsxNXp0K3MxcEJVaGR2WkFvdVdGSktRWmM4UU1a?=
 =?utf-8?B?OVJKTVg3Q2VxbHlTaDFGL1Y1Q3h1OUUxaHJKUHBYSjV1L3dnMXprVm1zb3Yz?=
 =?utf-8?B?N2NjelRiR2lLb3Y5ZWF4YldtSEwvdzlhWXdPVS9HaGd3MEE1Yzl3OEVBbXEr?=
 =?utf-8?B?UHVFQVZSV3VBYks4RjNLQkk0MlBBQVE0aEtjUHNJaGZzUXZEdjh5WVVyYlp3?=
 =?utf-8?B?bi94dmpSRm8yMEJ0SnBWK3I3aHdQR3VzeWZWVm04ZTdVNFVmSmowVXZRWm01?=
 =?utf-8?B?UTNaTkR1ME5hWjhEYzBnTnBPRVRWR0QyeFQ1eEI3eDBCN1RPSjc4Q09XUUZr?=
 =?utf-8?B?TjFVMzMzMkE2VlZJQ0czbmNTVWVPR0o5aEtaUEl5YWVqZE5kSXpMNVNoWnBO?=
 =?utf-8?B?MDMweE93SllPaGR2NnUyd3g5eW5WNlRFc1VXS21iZ1dlNVJKREJQWnM5THlZ?=
 =?utf-8?B?bzZqWnRnODJQODQwSFFsUlptSUdTcEhPcndGU28vSXRhUTJ2dlNqWG1nZ3U5?=
 =?utf-8?B?dDkyQnFlanRGclIwV1RjdkgvbW50SDhHalpBSTE2Y3puZ1A3QlhoV1RSTmFm?=
 =?utf-8?B?QXZKNjhJWTBzZXBuVTRuSHdTU2l6M0xMdXlBSzFOU0FtdFJWemRITzFRKyt4?=
 =?utf-8?B?bWFLbyt4UllmbmtsUndLR1k3Yjh0d0M4UFFDVEZlYTIwTUphUjA3S2xSMTRG?=
 =?utf-8?B?ZEk5RzExcUs1NlYrQkl6VDBKOEp6M1ZHYTgrd3o5M3N1S2NEM1p4d2h1SnFD?=
 =?utf-8?B?Z0FLZFoyaG1CWTlKejFHMHhyUTVRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25dfe230-b36b-484a-6e5c-08db6b4736d5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 13:16:21.2736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Prx+W2hykTZnupz1/Zl93IlOIl/kRa/F+4+DoQrYQ6/qEDwyaV6GJpF6RUe5KcGZYNkiAM6+NRSMxE4b5fKBlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6062
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 12/06/2023 13:18, Jon Hunter wrote:
> Hi Oswald,
> 
> On 05/04/2023 21:12, Oswald Buddenhagen wrote:
>> ... in wait_for_avail() and snd_pcm_drain().
>>
>> t was calculated in seconds, so it would be pretty much always zero, to
>> be subsequently de-facto ignored due to being max(t, 10)'d. And then it
>> (i.e., 10) would be treated as secs, which doesn't seem right.
>>
>> However, fixing it to properly calculate msecs would potentially cause
>> timeouts when using twice the period size for the default timeout (which
>> seems reasonable to me), so instead use the buffer size plus 10 percent
>> to be on the safe side ... but that still seems insufficient, presumably
>> because the hardware typically needs a moment to fire up. To compensate
>> for this, we up the minimal timeout to 100ms, which is still two orders
>> of magnitude less than the bogus minimum.
>>
>> substream->wait_time was also misinterpreted as jiffies, despite being
>> documented as being in msecs. Only the soc/sof driver sets it - to 500,
>> which looks very much like msecs were intended.
>>
>> Speaking of which, shouldn't snd_pcm_drain() also use substream->
>> wait_time?
>>
>> As a drive-by, make the debug messages on timeout less confusing.
>>
>> Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
>> ---
>>   sound/core/pcm_lib.c    | 11 +++++------
>>   sound/core/pcm_native.c |  8 ++++----
>>   2 files changed, 9 insertions(+), 10 deletions(-)
>>
>> diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
>> index 02fd65993e7e..af1eb136feb0 100644
>> --- a/sound/core/pcm_lib.c
>> +++ b/sound/core/pcm_lib.c
>> @@ -1878,15 +1878,14 @@ static int wait_for_avail(struct 
>> snd_pcm_substream *substream,
>>           if (substream->wait_time) {
>>               wait_time = substream->wait_time;
>>           } else {
>> -            wait_time = 10;
>> +            wait_time = 100;
>>               if (runtime->rate) {
>> -                long t = runtime->period_size * 2 /
>> -                     runtime->rate;
>> +                long t = runtime->buffer_size * 1100 / runtime->rate;
>>                   wait_time = max(t, wait_time);
>>               }
>> -            wait_time = msecs_to_jiffies(wait_time * 1000);
>>           }
>> +        wait_time = msecs_to_jiffies(wait_time);
>>       }
>>       for (;;) {
>> @@ -1934,8 +1933,8 @@ static int wait_for_avail(struct 
>> snd_pcm_substream *substream,
>>           }
>>           if (!tout) {
>>               pcm_dbg(substream->pcm,
>> -                "%s write error (DMA or IRQ trouble?)\n",
>> -                is_playback ? "playback" : "capture");
>> +                "%s timeout (DMA or IRQ trouble?)\n",
>> +                is_playback ? "playback write" : "capture read");
>>               err = -EIO;
>>               break;
>>           }
>> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
>> index 331380c2438b..94185267a7b9 100644
>> --- a/sound/core/pcm_native.c
>> +++ b/sound/core/pcm_native.c
>> @@ -2159,12 +2159,12 @@ static int snd_pcm_drain(struct 
>> snd_pcm_substream *substream,
>>           if (runtime->no_period_wakeup)
>>               tout = MAX_SCHEDULE_TIMEOUT;
>>           else {
>> -            tout = 10;
>> +            tout = 100;
>>               if (runtime->rate) {
>> -                long t = runtime->period_size * 2 / runtime->rate;
>> +                long t = runtime->buffer_size * 1100 / runtime->rate;
>>                   tout = max(t, tout);
>>               }
>> -            tout = msecs_to_jiffies(tout * 1000);
>> +            tout = msecs_to_jiffies(tout);
>>           }
>>           tout = schedule_timeout(tout);
>> @@ -2187,7 +2187,7 @@ static int snd_pcm_drain(struct 
>> snd_pcm_substream *substream,
>>                   result = -ESTRPIPE;
>>               else {
>>                   dev_dbg(substream->pcm->card->dev,
>> -                    "playback drain error (DMA or IRQ trouble?)\n");
>> +                    "playback drain timeout (DMA or IRQ trouble?)\n");
>>                   snd_pcm_stop(substream, SNDRV_PCM_STATE_SETUP);
>>                   result = -EIO;
>>               }
> 
> 
> Sorry for not catching this sooner, but I have just noticed that one of 
> our audio tests for Tegra is failing on v6.4-rc and bisect is pointing 
> to this commit. Reverting this on top of the current mainline fixes it.
> 
> Sameer, any thoughts on why this change would break the volume control 
> test for Tegra194? After this patch is applied the test fails on the 2nd 
> test for MVC1 ...
> 
> [ 1314 ms] Starting mvc_run...
> [ 3616 ms] Starting mvc_check_configs...
> [ 3921 ms] Starting mvc_check_sha1sum...
> [ 4379 ms] Test with gain of 40 for Linear [ 4404 ms] curve type with 32 
> bits 2 channels using MVC1 ... PASSED!
> [ 4437 ms] Starting mvc_run...
> [ 6720 ms] Starting mvc_check_configs...
> [ 7029 ms] Starting mvc_check_sha1sum...
> [ 7463 ms] Test with gain of 40 for Linear [ 7490 ms] curve type with 32 
> bits 2 channels using MVC2 ... PASSED!
> [ 7541 ms] Starting mvc_run...
> [ 9899 ms] Starting mvc_check_configs...
> [ 10255 ms] Starting mvc_check_sha1sum...
> [ 10384 ms] Error: Sha1sum check FAILED!
> [ 10590 ms] Error: Incorrect output gain dB against [ 10613 ms] expected 
> gain -122dB for channel 1
> [ 10701 ms] Test with gain of -119 for Linear [ 10730 ms] curve type 
> with 32 bits 2 channels using MVC1 ... FAILED!


If I enable the debug prints, I do see the following messages ...

  tegra-audio-graph-card sound: capture read timeout (DMA or IRQ trouble?)
  tegra-audio-graph-card sound: capture read timeout (DMA or IRQ trouble?)
  tegra-audio-graph-card sound: capture read timeout (DMA or IRQ trouble?)
  tegra-audio-graph-card sound: capture read timeout (DMA or IRQ trouble?)


Jon

-- 
nvpublic
