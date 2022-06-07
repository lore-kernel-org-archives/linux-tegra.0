Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 339BDC433EF
	for <linux-tegra@archiver.kernel.org>; Tue,  7 Jun 2022 14:35:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243874AbiFGOfl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 7 Jun 2022 10:35:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245748AbiFGOfb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 7 Jun 2022 10:35:31 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2060.outbound.protection.outlook.com [40.107.220.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B196647E
        for <linux-tegra@vger.kernel.org>; Tue,  7 Jun 2022 07:35:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FBOO/ZvrfoutqQPPb2BTmmBhQvEEIAffCEgkGIlIhDLzNMyRtHAOEhCa462w1HGdBd4gb3oxXnu++abaWSYP+xIraVtHKLcgPCypac3/69xsk23ACZPPNN4zQS89FfkALlSQb/w2uWoc+OFwb9y9c16MtSu93C6m/8LtcQahDIrZxIVkf7VMKFPTW7gy+ch/aNYis93lalQ+QCm6QEd7rRgx/rcGyEciZfNwxYrcaBp71t6Xj1koYx4CDCkIEs6L+HtruZoNbeivpFnJRhgElPmgJtglzMcB5Xpn2SQ2gO5INkx76NzCcyhzuNbQYo+FmkkXRDxSpDVQ2xZmSk7Tbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FGNM5hSnA8X8Jk5YOseM3GOMx64iajZEfueHd+E7uoM=;
 b=cyDjQeLrHy2f3cMSjV9YvCpC1huI1K+khyvmvtxORpxas24hoJ62yIU/Cn9uqKh7pIhG8wmt5thx7pKFfzgDKPMXxFyPsT3w16wsBHcp7/LGvotErZw7PXoTQi1ysojCXifjX4yFuX66iJRWJPdKpSeE/tx0NrCcCj2fnsbahGsiuI+BIbnCxrn6FQCpy2OXT+6dXpuLZ11XDeH77IHPRMeFzMwMb2KUJtMyF1h1/QzdO6P1HnbhktvivaCaSVb0p7U9Cld05M2f7LQpoEGGlaVc51g9/UzSn/TUwCZMsVj52emVw3Z2TTq3Pr7+fs+TSzL2wW1mHNd217a6QRBOwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FGNM5hSnA8X8Jk5YOseM3GOMx64iajZEfueHd+E7uoM=;
 b=NZcpTG1BTx7eCaqDwq6d0HZgteS/v0JsuVqauyalOuWY6LH73DAJ39rE3yv1W5ZEleufJIFyrD1Icf46OSZTTtg69nypBQBJWTgqXalZhnHCzdTthLTKamMQQWCdINDPpeVouUhqmcLUuhc2paiwjQECMXyk2jZEYqB99j72sVtBfnB/vuKklscU5eAFQGQAOdQ/0f8b/Bbe2XJ1OYUb1nikYOk/motYuak+LJgd2ErKEEXJcbE7VIVTaqFhVXlIo6kPFShzIbl9v+VgCu4A1LAaYSrivXyTTXYULTFRR0HWARpBHO2NvXOWqr8mcMafrwYZvvWQ5tNmLJiNOBUdzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 MN2PR12MB2973.namprd12.prod.outlook.com (2603:10b6:208:cc::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.13; Tue, 7 Jun 2022 14:35:26 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f954:6840:ce82:c54f]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f954:6840:ce82:c54f%4]) with mapi id 15.20.5314.019; Tue, 7 Jun 2022
 14:35:26 +0000
Message-ID: <fe5ed99e-955e-d22a-0f78-d83c82cab66d@nvidia.com>
Date:   Tue, 7 Jun 2022 15:35:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/6] ARM: spectre-bhb: enable for Cortex-A15
Content-Language: en-US
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     "Russell King (Oracle)" <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org, arnd@arndb.de,
        linus.walleij@linaro.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20220328134714.205342-1-ardb@kernel.org>
 <20220328134714.205342-2-ardb@kernel.org>
 <a589f56d-a0e1-328d-e4be-9427342d46b8@nvidia.com>
 <Yo0PzCkBLK5U1nB2@shell.armlinux.org.uk>
 <061d892d-7a16-774a-4b50-b09055040ae2@nvidia.com>
 <CAMj1kXGMZR4+eyuG=-7bOLxzvs7Mhv4J4B-7kerdXKZxzON2ag@mail.gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <CAMj1kXGMZR4+eyuG=-7bOLxzvs7Mhv4J4B-7kerdXKZxzON2ag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0017.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::15) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57d8fdbd-0470-41f6-12e0-08da4892f66a
X-MS-TrafficTypeDiagnostic: MN2PR12MB2973:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB2973690CBA3BCA7125E29863D9A59@MN2PR12MB2973.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OThEthp064KXeGulBhl8naPKectBRFxS2WyF2PTJy/d15uRc91BpAponi1WlNo5ndyfBbAmHlS8OAdR1EZd9bSXt3S21xvFI0yAW017JBE2uz6FqOCbPPTpvmUqhZORCG25KUE448hEJGxDuUKmQXWGcoZ8xSpovn5d99mIK0zkETU4ypvbqVEukvzgbfWM3dZNKdShi4dUl7tv0myoMwJ//q0d+rJy5yHx2szcPJv129t8YICbc5yQIQ1HnA5h43wfku54X7atCxM9Muv1ovelrxAorZktPGKT3CmS/ScQVTytk8Ti0IZVe4Wx7lZwcBHh2JLfJmEdOvccybtasw+EwiiVK5rglxSG+13uRz1C72UehrsjxRVDezCLRq33wNG7oe2WHVtpma9FcnMMiq2DkOhPgfB9LIVNryvzJszFqOYiNXr2C+QfDQu0qHz11BrgmwIEKNFbo5VvPRSp3Cten8DL8nNIwrVwWE/L4+2gxwiBK/sVJC0wgvQF+6KZJ0IJ9fNPs70ObqAwqjK9XDksoKDcASp+XFVzG30q0/afks7xHIqqh8YmAZ4OdDVBvQlUgudYxgP/hPyjCl3MJ20Yc7u1N/3JOj5s9RdLyPxKm73n+bPWc+zf3Q/ilMVtyTDxRTbX1e62gsDj9nLin+G0y9HXjj/f4tPSE+AjTU2/QXiWehmjkTX+pFycMvfkyyb4XOdOyI5BzkPoHhSIIveJww3ipJpgRvN3MsTHUOodmVRnxoTvOUSLCqNK1KWwlDjiB555olxL9avWYuDLJ8ycmK+pSX3k5YCtT+5dy5zZ0FqsA6P7LdzBw78hTfsViRj+vgay5RLhbRApDkmBIJwGVPO3VxU2eRhb8YxRfiuo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31696002)(55236004)(53546011)(54906003)(66476007)(6486002)(966005)(31686004)(186003)(8936002)(5660300002)(66556008)(508600001)(66946007)(8676002)(4326008)(2616005)(6506007)(26005)(6666004)(2906002)(38100700002)(6916009)(36756003)(6512007)(316002)(83380400001)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2hJcDJZbjBaYmhrYnI3QmZtaEh0OG5uaTdyY0FqMmJrcFFTc3ZRV2JVNVY4?=
 =?utf-8?B?MVk5a1E0ZHNHaXhVaUxPRkdFYXZqZHQ2RHJTWmJuY01FbUNCa3VQNEVvd1pR?=
 =?utf-8?B?N1I0bnNaYnBJM3dLOHRKeVd1VnRWTTJTWVB0UVluaVpUakQ4OXBKSmNKdzBk?=
 =?utf-8?B?ODFYYmw4OXkwcytjTEdxdHlMT3B3dldnOWMxWEszZG9tVkl1THJGUUV0L3Rj?=
 =?utf-8?B?M1p3QUUxclpMeldSK3pNRktjOUtPSmpuMVJZdGFnODd6RlM1M0JjeHYwMjhi?=
 =?utf-8?B?dDNTQW1aNm00ekpOTXc3ejAwODhYSjhiL1pzNTh6L3hEZ3JvdzE0ZlVuZytX?=
 =?utf-8?B?T09kcGhWUHNsTnBNT1FxcitLVXlLTG5Ta0lKZi9WRHpBZXZCZzlTbmJiSE9J?=
 =?utf-8?B?Q0VVNU9JNlFoREVZQ0dkRWtUMVRoRUpFRStyZ3ZnczQyaUFYbUVVdDM3Qjhj?=
 =?utf-8?B?VlBZaDZ5NGpHeFhNanQxZCtjLzlXRjJ2OEZwN1RGUmlubS9PdFpkK3RNOW54?=
 =?utf-8?B?elo0Vy9YbVhpZEZOcy9GM0s2dWZNTGVIOThWaEhQODlDMVB3WVVXQjhpMmx3?=
 =?utf-8?B?YjFBa1M4bGVSSEc4czM0TWxxeG1IL0tMYm55eVl5VHhxbTZabUtjbUthbE1x?=
 =?utf-8?B?TWlOZTNUWDZmRm80NXArc0o1am54Y00xT0tsWG9yL1J2bE0zM3hnT3FxYTNN?=
 =?utf-8?B?aTNpRlpqd3ZJTnpvbWFNUXZndm9mcjNvUDJRbHpyeDhKb2xkRjljd3ZuNWVn?=
 =?utf-8?B?UXRHb0xsSzcxZTZFR09qZDJrVDJwWEZ1L1NhOHY2aHc1ZGlIUkNrRWZPTDBm?=
 =?utf-8?B?OVRtNHpDTm9YS0h1WFZZTk51aGJtSlFLWTZsNEw2c2xMY0NJdHJWM29UbEJh?=
 =?utf-8?B?b3RXbWxZRjNGR1NKNjExNVZNdHdrWFkyei9qYUFodkJ1T0J0RTRpcFNKWkZW?=
 =?utf-8?B?WGxJcHZkUE8vMnQ2ZzJOdVVxbU9XMmZRVlk5NUloQnFmMENuQWxGYlBiOU9X?=
 =?utf-8?B?dXdJaVZGQTIvZUhvcEZEaE5jM25MNHdiMTl4NTNjMzRuSEt6cFZvTkNqWENR?=
 =?utf-8?B?WlJkMmNSbTM0R3FMRVpkVU5oQkhuZHRsc05uUzRkQzBLL2RnSGtRMWZ1am1S?=
 =?utf-8?B?c2x5VTk1allKVDhVUFRkSW1xb1FRQXVZdEhvd3duR1Y4aW9Fc3NtL0sxMkpn?=
 =?utf-8?B?eUtFL1ducWsxQmg0bENJRExBRE15Rk43a0NYK01UclZxNk5QMHhmdGNSNktG?=
 =?utf-8?B?Z0dHMU5BN0hGTHd6bjE5WTdRMU41ckFrek44NnAxcmJJOWFvYUVLUkZyeUtN?=
 =?utf-8?B?K0JvVzkyNHdDckw4aGhRcmpuUXdkYis1Z09Fa1NZMzJDQUFiSVhmQThMM0lF?=
 =?utf-8?B?MW1QL3BsUUdZWGhrdm5NYm9ENm5JelVsOGJqNFV2ckN3TTdsc3JiQUg5OEJy?=
 =?utf-8?B?c2w1Z0poOVdQZWJMRnRzNDY0VTFYeGVLNmpOWFF6SHh2cmtsTm1maVlRR3FT?=
 =?utf-8?B?b3o3YkpyU01DRDhlT3NhdDFtNmlrZDhieEhjTFBkVVVSbXlTQkJnU1BKUjJJ?=
 =?utf-8?B?ckdYSU1HQk02dm8vbEF4VktSRkdUVnRxT1l3enRMQnBzcE9LTHZsRStNN0lq?=
 =?utf-8?B?aU16UXVONzBwNDF4SFJ6VzlCdGVIbHlIQ3plLyttTmtCQW1mbEVTSk04TWV1?=
 =?utf-8?B?WXhtK0FYc2pEUFdRS2RudTkxR0xFZXZ1R2hNMG1EMHNyQ3VpK3YvR2ZwK2l2?=
 =?utf-8?B?MFFFengxbHdIbEd0SXV6dFlXZkNNWTgxN1gwSkFtMHBQODlrdFhnM3ZjK1Bk?=
 =?utf-8?B?UUQ4YWg4TlRoWEF1UVdGOGZINVYwMW8wUjVhYnAyZGdZSHJpMWkzLzhjMlRK?=
 =?utf-8?B?VXdxNlEwMGhSNU9NdERjemhnVUdsNU1nRzJwa1czUS9oZ3N4Ry8veFN3T1FD?=
 =?utf-8?B?RnZwazROK0pGOXl5cFYzSHNZaTBXMTJ2TnB5bXdjaU1vWHZHanZOL21zU3F3?=
 =?utf-8?B?ajRSN2kyOUVRWlgySWdsTTZFa1I3bFFXU0o3UGJ0RkJJZ1krK2xkbWxESkMv?=
 =?utf-8?B?MWZjQjVKeU1sRWdHTWY0NlNBWTlXVytjTTJiMkJIdEhwbWpvckZKNndhTUR3?=
 =?utf-8?B?SkF5enBBSTVPV3ZVN2ZPdVdocHdTcWI2NUc4czNPUTk2cEtoRVgyRW82KzFi?=
 =?utf-8?B?b0dvTzhkUVVseW5FSFpHT0VlL2NDcXpJcEJncWE3MjY2cElKZGxpUHZ2U29t?=
 =?utf-8?B?UHU0QkV1ekdNVXMrUXhZWDFidzJYYzQ5NE8xNmZzNktMOHFGSTQvZUMwQXpD?=
 =?utf-8?B?ZVN4YmxwSWM5amlXbG9zeEFwYVRoRkE5WVhrU0ZERzVsZzdvSzBZdk1Rd01M?=
 =?utf-8?Q?cT6wU3tf85u9cx1I=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57d8fdbd-0470-41f6-12e0-08da4892f66a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2022 14:35:26.5261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zz8cl2vBDGQKD/vdV0nMpbVa4qhE0If6oiKD9hzSmwPYV0cqh/TKg8a6NIlGb7xF+G6/KGd0RV6Bx7LKVDlRZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2973
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 07/06/2022 15:32, Ard Biesheuvel wrote:
> On Tue, 7 Jun 2022 at 16:30, Jon Hunter <jonathanh@nvidia.com> wrote:
>>
>>
>> On 24/05/2022 18:03, Russell King (Oracle) wrote:
>>> On Tue, May 24, 2022 at 03:50:17PM +0100, Jon Hunter wrote:
>>>> Hi Ard,
>>>>
>>>> On 28/03/2022 14:47, Ard Biesheuvel wrote:
>>>>> The Spectre-BHB mitigations were inadvertently left disabled for
>>>>> Cortex-A15, due to the fact that cpu_v7_bugs_init() is not called in
>>>>> that case. So fix that.
>>>>>
>>>>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>>>>> ---
>>>>>     arch/arm/mm/proc-v7-bugs.c | 1 +
>>>>>     1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/arch/arm/mm/proc-v7-bugs.c b/arch/arm/mm/proc-v7-bugs.c
>>>>> index 06dbfb968182..fb9f3eb6bf48 100644
>>>>> --- a/arch/arm/mm/proc-v7-bugs.c
>>>>> +++ b/arch/arm/mm/proc-v7-bugs.c
>>>>> @@ -288,6 +288,7 @@ void cpu_v7_ca15_ibe(void)
>>>>>     {
>>>>>      if (check_spectre_auxcr(this_cpu_ptr(&spectre_warned), BIT(0)))
>>>>>              cpu_v7_spectre_v2_init();
>>>>> +   cpu_v7_spectre_bhb_init();
>>>>>     }
>>>>>     void cpu_v7_bugs_init(void)
>>>>
>>>>
>>>> Since this patch has been merged, I am seeing a ton of messages when booting
>>>> Linux on tegra124-jetson-tk1 ...
>>>>
>>>> [ 1233.327547] CPU0: Spectre BHB: using loop workaround
>>>> [ 1233.327795] CPU1: Spectre BHB: using loop workaround
>>>> [ 1233.328270] CPU1: Spectre BHB: using loop workaround
>>>
>>> Now that you mention this, I vaguely remember some email on the list a
>>> while ago about this being caused by something like cpuidle - but I'm
>>> unable to find it now.
>>>
>>>> [0] https://lore.kernel.org/linux-arm-kernel/20220519161310.1489625-1-dmitry.osipenko@collabora.com/T/
>>>
>>> That was probably it.
>>>
>>> We can't really do this for the other print, because the system status
>>> can change as a result of CPUs being brought online. :(
>>>
>>
>> Does it make sense to only print the message if/when the method changes
>> as opposed to every time the CPUs are brought online? That way, there
>> would still be at least one print showing the current method. I believe
>> that is what Ard had proposed.
>>
> 
> A fix for this issue is already in linux-next:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=bafa10435c4f34f4b9bda8fc7ee6e4330ebca3ea


Ah wonderful! Sorry I had missed that. Once merged can we pull into 
stable as well?

Jon

-- 
nvpublic
