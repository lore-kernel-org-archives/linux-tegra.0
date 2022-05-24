Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B2A1C433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 24 May 2022 17:49:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239624AbiEXRtP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 24 May 2022 13:49:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239478AbiEXRtO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 May 2022 13:49:14 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 033D95D668
        for <linux-tegra@vger.kernel.org>; Tue, 24 May 2022 10:49:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GSMGO3injMEEYUOjsfAK4Is5Pc+ZG84y1SyE7NKJNHJsZsAxbViyB4bv1tmEPXN+JtFsCWSmcH3uGbXu5BJpdwqpbEKb2dGfuHyYGMwfikUfjp49Ygd7JpKav9aAKp3bkoyqtIcAmdcWSliB/JArCEKahwcBBz4QRVgbbJ4IY/apBrDOfp42QQajX2XGRQ8jJXPQ+TunGsXfMVl8sTR0usGO+2uHKwMsvFN5kxVeGaGSxKX2g0E2t8S1G5PybjH7s6KRJzHKYgyZOdrAKZJ6Mhi9qI/s2kRns7OiMl6vMG5FDRlTMhbzKesqY66kTOJe2DMcLIYZoQa+GxDUo4NUGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0XLxbeBVLhPi1Y3JqbzxOYHxH/ezyFhAf6LD0seJ96A=;
 b=ISOw/78Glmw3HMV7Oa3YRZFs13Mwhxd0Pd/iwBAPA3DTNi6JCjeNHRXQLsnYHjfKT8XLDX5pBqkO9Rr3F28sLUp6+iOZzwX9Zbg7YjGd0og1HU8xos5v/yEp6K9sJnQpX5/pLQdM1TVD1ztLV5hUNSA9fsyJ75WzwN2bbVx41n+QW2sUwup/9/PQleIZ/K1+esXwf7sLQTz48Z+X7DG6De3jgwo7O5fvdwYTOXX/dREEmcwbIEeeONvPl1ITuaQt5Hv2P5D5WMdqiwpyl0gxdVBM7S4rplZCxHAqWL4RAbwYVpZcZcaczuxCWDZdge5cFR4OidV5yInsHGCJ5KT0yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0XLxbeBVLhPi1Y3JqbzxOYHxH/ezyFhAf6LD0seJ96A=;
 b=jZvg+WeJ4et030vcsauGRW2RTbz0i8sv6I2JLbogFa8LNJpVIBpkoJ65WPa4udE+KzqzTZz5DaUafiZ2am7Dc/VZtnHRpNXsOiWHivoMWiN60jKMoSYPpewyONnl88Z5yceHtSPriv7frgx/i8BVZTGEJot1WrEOXsJhyWDOvIOER2q4VPAi4faA+tAlOZ11tNfDosZPlhvE2pSnvxs1GYNj2Y9ByJAAa3Gf0sna/EObqvfTY/g0X/a+tL600PdcaV6RcuAUkIjpElPs3J4cfBvqRm8wn1EgipMetvxgiypcmQtvvLbhtRNvC29w+NEFQcj7ySS6bW+GIVIvkEpfJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 BN6PR12MB1892.namprd12.prod.outlook.com (2603:10b6:404:108::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Tue, 24 May
 2022 17:49:12 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f954:6840:ce82:c54f]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f954:6840:ce82:c54f%4]) with mapi id 15.20.5293.013; Tue, 24 May 2022
 17:49:12 +0000
Message-ID: <b7f9d04b-db90-4dc2-4a52-7e637dc7a2ad@nvidia.com>
Date:   Tue, 24 May 2022 18:49:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/6] ARM: spectre-bhb: enable for Cortex-A15
Content-Language: en-US
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        linux-arm-kernel@lists.infradead.org, arnd@arndb.de,
        linus.walleij@linaro.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20220328134714.205342-1-ardb@kernel.org>
 <20220328134714.205342-2-ardb@kernel.org>
 <a589f56d-a0e1-328d-e4be-9427342d46b8@nvidia.com>
 <Yo0PzCkBLK5U1nB2@shell.armlinux.org.uk>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <Yo0PzCkBLK5U1nB2@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0052.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::21) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3218956d-d7ee-432f-af1c-08da3dadb5a4
X-MS-TrafficTypeDiagnostic: BN6PR12MB1892:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB18927E34393D9C59FD53142BD9D79@BN6PR12MB1892.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KC934fTNKfZ8/qSnLtCWzxQ3CiPkZFMlJKW9Y13uBOXnOTh+iE+uAFIUZPmxvae6fsNasSZvYjMPzCrOFo5IEvwP75JgxtL7h5zk9GznhwwJHzRQMJjD++RZupO9/BdrXnwwAIazFvUfRKGjPdunmlLYb3g1+5StFLWE53AlGXuRN2JTSZG+5YM0gF0fE7IZAjOEa40Q2dhURFbAO9byixZDQFstIBPFi6p5qn9VLgYmAcFO1dGtVuiSVC3xGIhNDnBMg6JffKMEKDDc1qkfWgf7zRWLlPHoTt8qDEjayRcZaxdIRFoyeBFL3Ku2YTs33lnKBWJ0gd6fqTsBsSU9ZZLGK0pTfzzTFyrs/eSLFDTZ42FNRTfPxvAWKzy/YmvrUjify/X7AxCWZk+AnGlWgjOTdhw+5e6+nF7vmhONxeyCACLg8/Eb5XLJPj/PHdoFpbN5NC74XJUjp79bE5p5R0Y8Cp+Q2XmDyh0c5p3CcCVVWEJkUABKjIG3POl+T01mXW92oX82Or5SRspdSCHUE0mvlzEUEeDFaIW6Y50phq+YeaWTm7YQRUswikSCzV7vKnJRFCwv5DOod6n1biqxTNoZCVGkN8K7zVSpX9ASXwTAQFAs+6I/uhdPZmFU9S7WCqqPwGT+TvBGItPQf4wHWq8E4A12ywlLW421RJ3E/+goGQ0Qv0yenVGme1Rjv8eT+LymrwBFKMTNOI0szGab3KpGausrj6PnGuRrx35IMYNqotLhxdfDnaEkIEzGu51CS6mnsi3gLGlH4Qc53IQa2vUwdr4OcJFDwXfjtJAlUsv1nBO3wmweg8SnmyMvlujtFGqQS5cn4ejx5REAtfFZpQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(6916009)(8936002)(66946007)(86362001)(31686004)(36756003)(5660300002)(2906002)(54906003)(966005)(4326008)(66476007)(66556008)(31696002)(8676002)(38100700002)(6486002)(508600001)(26005)(6506007)(6512007)(2616005)(6666004)(186003)(53546011)(55236004)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmhpOEdkQTg4SFhmWlR4eklSeXp2SjJrTWt6Z2ZSK3VWZUNZbk5KeDBiNWxL?=
 =?utf-8?B?OEtWOHQ1N1UzL09UWFNLV2dLQUxEcWs4M1UyZmQ1SmVEdW5HMWNKRzdpbEo2?=
 =?utf-8?B?Y0NHZHdSdFk3Z0kvK2E0Wm5UeTNzS0tqZmQwTHFFUDJ1WmtVd0pkM3VTOHNl?=
 =?utf-8?B?aTM3NzFtZjdQYm1UaXl0cFFqRG1aUUJpWlZCbk96aWNmbHVyR1RIRDNQaEs5?=
 =?utf-8?B?TXBUcUJ2ZmZOK3l4dFlvM1Zka01vR3c0c0NCWWdIQWZmVWhqN1g1NW9NZ3c3?=
 =?utf-8?B?ODZ2bGZhMlpTZG45Wjk0NzlINmljamZaR1p4TUVPbGFGNlNaVDVnV2JLN3gr?=
 =?utf-8?B?L0JNVUlERnhKMTlSQjZzaG1OcS9VaktYcmVNbXgwUTg4Ui9BNGp6ckI0OWxF?=
 =?utf-8?B?UDNDSm0yZWczeE9NdkFXVkFmbDgzbjdVRTdJUzVjY3prbFdoM2tDd3I4QVdY?=
 =?utf-8?B?Qk9ReFVBd3ZoUzZqeEs2RVZEZVhRVVhTeDdyWnNTWlhqNW1BTkRaUFczTlE5?=
 =?utf-8?B?K254RFlqMlk5RDF0dktkSDFCM1FiL3UzekJSbWljeldNNmhoSU5OdzBsVXV4?=
 =?utf-8?B?d0gwMWZrRTdGVXhpK21zUUpJbXRIM3RvcXhIWEh4UU4wcm5pcUtDUHk3Z2pp?=
 =?utf-8?B?cFlycHloNmVGMkZORUZCWGh1eTJtVUtyc0FSc01vd0pXejdiK1dSVldET2pR?=
 =?utf-8?B?NXJiVG1jUHVvTDRMSGNhMFdwTFJSUVNRcFp6U1FpWmVselRoeFdIdmkwSHBJ?=
 =?utf-8?B?b1BHY3lhcTVBdy9mRU9wQnZXL3BaMk9OOW5QVldFbEE3MEdDMU00T04xaGhk?=
 =?utf-8?B?eThCS1JBR3l4QlNGT2tFVFhGTzdtSHg4UW56dDkrQjF5V3FRbG90MnZ3THVi?=
 =?utf-8?B?azRPZGJWNC9pVjF1QTRuRmo3TmkzemgxVzJENGtmcVV3TWF6a0hGT0NBbmNB?=
 =?utf-8?B?OVJ3R0lnNC9xT2ZqYmlIejIxMDc4QmdzcmdVOFRaaE00Vm9VWktLM2hrdjRl?=
 =?utf-8?B?WW9mN25ycUhaVU1ya2Urb05EekFRQmFqelU5ODdianpaaXNiNWxEZE1hZWxa?=
 =?utf-8?B?dFBIb1d2Y2E3V0U1VGduOGFMdG1tc2l5SE5kYTZ2aXl4Y25Rem5rdUhuR1cw?=
 =?utf-8?B?eS9qRitVa0doYnhNalR6MWtBS0hPOEJrYWtNcW80aTF3bVNvVlJMMElDc1pV?=
 =?utf-8?B?MDN0NURhWGZ4MTZtcTdJYnBJa0VZRVJlQ2JrbkcwY2R3M1ZmcDJCRk9aU3ZX?=
 =?utf-8?B?cGlXZkdkQzVQN3RkTndkeFpDMTAwOWhBQmlFa3NTWVppcUVLdmxiZEkzVzFq?=
 =?utf-8?B?V0RFd3BBcUNTTWVZVHFQcUJGVHdUc2JVODA5ekMwSTBSTDNVVHIxdE5Iajk3?=
 =?utf-8?B?dm1XMUdKYmlVdzFHa0VmTjFpLzliUmR3eXVvOTNpQTdPeGxKNnpQc2hWMWE0?=
 =?utf-8?B?UGRsa2J2aVlTanF6dURKTHJkSUthcW5WZ2IxbmRKQWppQTREVDVHREQ0cUE2?=
 =?utf-8?B?ZzVVa041SjMrNFdJTytGNkw5bTZwNWpoUEFTSVhEa29CNzFqeXY5Ny9uN0NF?=
 =?utf-8?B?NkZ6MlJNOHJTUVVLNU1WUGEyN3ZMOGxKZGZMVVJzOUZmZGIvYXY5cmt4SUVO?=
 =?utf-8?B?R0Eydi93WGRVUjdRL0dZUXl2ekVubWtsaHpZWW9UTklSVy9lR0t2ZXVMQ0FK?=
 =?utf-8?B?ay9WUGpUZ2JBYnFUMEN3QmF6U2M0N1RHQzRyVnBjOHp4b1RjZTVOaURrMlZM?=
 =?utf-8?B?MW5sanJvM1FTamdiSFVJM0JlVmRPaTBzU0FqWmV0RnU2YjVkblRxTkRyWkJJ?=
 =?utf-8?B?RWgzckh6MnRLcUVOWHdjajZvV0kvVThNRktPeGdqL1M4eUlvQzAzSC9DZFFt?=
 =?utf-8?B?T043b2s3SnZjOHNST243S0hWRHBDSHE4d0FZQjNaT05WWFJSWkZReGJwMEU3?=
 =?utf-8?B?MmhiNGd1LzRQcUtwWTdVb2R1ZEFJdkxYZVVJdDQ5bWpTM29lUVFob0Jad0Ew?=
 =?utf-8?B?RXZnNUc2MXAwTS9rUmMrRS9lM3lwSUFDejU2QWVNUDFqeXpya3RyckEvWmc4?=
 =?utf-8?B?Q1pzTTdHVVZuc3ppN3djU0JnOC9WOGZJWFVOdnZKcTQ4MkwwSGNXdExMWVlS?=
 =?utf-8?B?OG1YbHg0UG5FUC9ocjVJM0h6V2ZpYWFNdkhhUFhlNm5ldmVwMWF4bDZOeGw4?=
 =?utf-8?B?TmViWDM1YUNaTDNITjFlWEw3dDVaTWQ5Y0J4eWdBTXRYZlRzMzRVeENIVzQ2?=
 =?utf-8?B?UitRVXFrQllLNklkV3JGRDBzQnlqZnFsalJCTHRZTzZYOHRZSUc3OHhDaWpl?=
 =?utf-8?B?VTNsUzB3OUQ1TnRORlRLdHRrajdMVFYwWGNRakFaSVU2aFpEM0VQQUdMNDNG?=
 =?utf-8?Q?EGHrgNDyvD2/636Q=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3218956d-d7ee-432f-af1c-08da3dadb5a4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 17:49:11.9481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0tDR1zMelZkzLL2w2KeuCS40xUZM7wqieG2qoWDsGt3xec6lH2uDDtImlm249wWvcEPc0x647Z+YE/pBZ50GiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1892
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 24/05/2022 18:03, Russell King (Oracle) wrote:
> On Tue, May 24, 2022 at 03:50:17PM +0100, Jon Hunter wrote:
>> Hi Ard,
>>
>> On 28/03/2022 14:47, Ard Biesheuvel wrote:
>>> The Spectre-BHB mitigations were inadvertently left disabled for
>>> Cortex-A15, due to the fact that cpu_v7_bugs_init() is not called in
>>> that case. So fix that.
>>>
>>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>>> ---
>>>    arch/arm/mm/proc-v7-bugs.c | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/arch/arm/mm/proc-v7-bugs.c b/arch/arm/mm/proc-v7-bugs.c
>>> index 06dbfb968182..fb9f3eb6bf48 100644
>>> --- a/arch/arm/mm/proc-v7-bugs.c
>>> +++ b/arch/arm/mm/proc-v7-bugs.c
>>> @@ -288,6 +288,7 @@ void cpu_v7_ca15_ibe(void)
>>>    {
>>>    	if (check_spectre_auxcr(this_cpu_ptr(&spectre_warned), BIT(0)))
>>>    		cpu_v7_spectre_v2_init();
>>> +	cpu_v7_spectre_bhb_init();
>>>    }
>>>    void cpu_v7_bugs_init(void)
>>
>>
>> Since this patch has been merged, I am seeing a ton of messages when booting
>> Linux on tegra124-jetson-tk1 ...
>>
>> [ 1233.327547] CPU0: Spectre BHB: using loop workaround
>> [ 1233.327795] CPU1: Spectre BHB: using loop workaround
>> [ 1233.328270] CPU1: Spectre BHB: using loop workaround
> 
> Now that you mention this, I vaguely remember some email on the list a
> while ago about this being caused by something like cpuidle - but I'm
> unable to find it now.
> 
>> [0] https://lore.kernel.org/linux-arm-kernel/20220519161310.1489625-1-dmitry.osipenko@collabora.com/T/
> 
> That was probably it.


I am seeing ...

[    4.415167] CPU0: Spectre BHB: using loop workaround
[    4.417621] [<c01109a0>] (unwind_backtrace) from [<c010b7ac>] (show_stack+0x10/0x14)
[    4.430291] [<c010b7ac>] (show_stack) from [<c09c2b38>] (dump_stack+0xc0/0xd4)
[    4.437512] [<c09c2b38>] (dump_stack) from [<c011a6c8>] (cpu_v7_spectre_bhb_init+0xd8/0x190)
[    4.445943] [<c011a6c8>] (cpu_v7_spectre_bhb_init) from [<c010dee8>] (cpu_suspend+0xac/0xc8)
[    4.454377] [<c010dee8>] (cpu_suspend) from [<c011e7e4>] (tegra114_idle_power_down+0x74/0x78)
[    4.462898] [<c011e7e4>] (tegra114_idle_power_down) from [<c06d3b44>] (cpuidle_enter_state+0x130/0x524)
[    4.472286] [<c06d3b44>] (cpuidle_enter_state) from [<c0164a30>] (do_idle+0x1b0/0x200)
[    4.480199] [<c0164a30>] (do_idle) from [<c0164d28>] (cpu_startup_entry+0x18/0x1c)
[    4.487762] [<c0164d28>] (cpu_startup_entry) from [<801018cc>] (0x801018cc)


So definitely CPU idle.
  
> We can't really do this for the other print, because the system status
> can change as a result of CPUs being brought online. :(


How about making this a pr_debug as opposed to pr_info?

Jon

-- 
nvpublic
