Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67467C433F5
	for <linux-tegra@archiver.kernel.org>; Wed, 25 May 2022 10:48:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbiEYKs1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 25 May 2022 06:48:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbiEYKs0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 May 2022 06:48:26 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2049.outbound.protection.outlook.com [40.107.243.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C1AED1
        for <linux-tegra@vger.kernel.org>; Wed, 25 May 2022 03:48:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B6Vj1Ql+YkgkAORgl9CtHHxiYlt+nQnDDrwoUZS4xQEEpOgB9/3qWq007Pm942WtcnCMq72XbYFeDYyMFk2Y0B5Mq9H71WzWDbGuLoooXkry/Ave5GOHYFMlkqRl2btF+CoG42RF7Gcf5UcEBOWRW8IXMYr6JxAiA22use0OK+JWXUakmCD/xapQ3K8sX6ZLGievjeZgNVppvJdqAACCCa9rn2DwxtKkIEYuhDgFpOOJllvtQKPzXVLDTSlHn/eNMS9eV5Kx1ukB2ebAQYf8j98Li5HD4I2r71gb0hZVi6+OvQuU6YJOo5tfifJ9roS+WnqkzOgD54YHFJI7ojXttQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Bbbt/1lJ7mQMxOTm3prqlooJuZ8qQnObx1vXrL1ki0=;
 b=OoCcBD8rSdw+35jk3CUmne8yRcYaOE/wuvZu69xR1cxbjNa4+xTe2xvge2dtP05wSB3s9QMogAt2HQOWdH0NqLvzwySqjxocES5dsm00tAcXdcy/kyxU6HgEAkkhLadpmmf9Y+Z14VIZ5OBrGYPtKrRSei2IgZxZIE1w+OJjRnixzRfBTKcuryP7/vZH0sSDEtiDRTexTiv1Kyn6d3uKPCcSxfv+QUsuaGozWSr+ezyKj1MYZhbzLl/ikbStsES78sYjbx3RUrXjQV34E4vtGyKhxhECKqj/11IfU7rJrte7MUYqnLiWU2djI6I3ZCsYowg9SdfLeda8o3qFlOFEsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Bbbt/1lJ7mQMxOTm3prqlooJuZ8qQnObx1vXrL1ki0=;
 b=OJ0k0hexT92UwjrSdbv38l5x5d6WCMJr07+aeseL9n+VXWLUsXwVPKDNeLzpLJbJuU/F7koGej8o5gctUJ3fCbO+7KJTARdMa7XE0CVGEFEnIRUe44BlbttIPJnJxUa1Rb6FJ9rK5W6jPJoYT4XFblp6RIuK0OmJy0+YRJZYVfM0tnj+O0+3GFeugt0wzKJRLU90PS7mQ1An7LhzVkYxvcV0BlIkqbq2JeVeTXYHrxRtCsKmoa30oj9Xtv2R8MjttXuk5JI7OzbE9CW2ZET1d+CzyeWw7IpSWmyo/Is1xEAHTIobykryP0TXhnWfilorLVUyx/W7+vQGw37pqCwjbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 MWHPR12MB1807.namprd12.prod.outlook.com (2603:10b6:300:113::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.22; Wed, 25 May
 2022 10:48:22 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f954:6840:ce82:c54f]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f954:6840:ce82:c54f%4]) with mapi id 15.20.5293.013; Wed, 25 May 2022
 10:48:22 +0000
Message-ID: <d35a3d03-8ee9-7242-9b92-bad3a44d2c4c@nvidia.com>
Date:   Wed, 25 May 2022 11:48:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/6] ARM: spectre-bhb: enable for Cortex-A15
Content-Language: en-US
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20220328134714.205342-1-ardb@kernel.org>
 <20220328134714.205342-2-ardb@kernel.org>
 <a589f56d-a0e1-328d-e4be-9427342d46b8@nvidia.com>
 <Yo0PzCkBLK5U1nB2@shell.armlinux.org.uk>
 <b7f9d04b-db90-4dc2-4a52-7e637dc7a2ad@nvidia.com>
 <CAMj1kXFPwRkMu9Lc=vSyPwYMnMXNmv3LdHsSMfZk56m8cAJzMQ@mail.gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <CAMj1kXFPwRkMu9Lc=vSyPwYMnMXNmv3LdHsSMfZk56m8cAJzMQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP123CA0002.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::14) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0479f08a-b5ce-4720-9bd5-08da3e3c1645
X-MS-TrafficTypeDiagnostic: MWHPR12MB1807:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB18071F70819D91D6025480BCD9D69@MWHPR12MB1807.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bkUtFd8/PGhbp8roCyTzeq/HXnVCv0cpSk6+geT0ng1TyL1OCpZa5UUzlkZs46Qz0FiI41lYdTuXY4ZIvdZ3cA4SKvuiBhDz04DW/UHl8UDJLl6v+v2+g8Uw/Qc7AWeBAti+IJGxgJfRSdlSk/8wzIb+R6zwORXLvLW+UTnT0IWrTJlqZuV7CQ/VK8T2VOonOefaB9QuIm2KxDtYlNZFjpmkA9m3xVxZsrpPhuj18uUkKldppYN2WuvwBbiEnvZtYWUG3UGXyPdUAwXlixGZFbGqt6nfx3s1OqNKOLlor6k7vbw2IeBU1091FD8MQQJzWCQm3i4RHTMXzKyFSAUqdv5rM4rV2L5JnbFakD++szAx3Wq1ozbz8aQoMb6R9mCOjDQnzC4cxg0hvnTOoYkLbdWtWnIpXwbAxHSCbSWJgQGtvWoOzFNG+IjhdMMzrxsk2qKLkLDmXN0gBonwL31iwJZXUxQmCsYQaxzdXOiEwbnote4mhza9TaeUhPkrILHmxzQg8EeZQTZYQLvOg1vkzEyUfLwpPL3bf3Z94TegtSTvhn8QkQaJhLDSaxKFJ0Dk5cdIeNM+/jFO/geN3sl6ywT23bwQMffTOc+NzaWFQ6OcCJLX7GLQp++J+478t3Y+6L5C6/yxnELDzSKQ7tTA7+Nxkwdg4hrRW8Vm4L54ukmOvgI4x/uTvfUcpedBBvDOz6kV3VY7xdUutbdIZGIiQNSOmve7obc1115qnV8BZAyq5IlP5X3kYF5a5CVe5u/Teczr5te4QfnjWwrXmpvOoh/l22LxvrKPxr4e9Xz1XQFdW+8IJC1Tc28yoSes5PBB
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(508600001)(6486002)(966005)(186003)(8936002)(26005)(83380400001)(6512007)(54906003)(66556008)(6666004)(2906002)(53546011)(55236004)(2616005)(66476007)(6506007)(316002)(8676002)(66946007)(4326008)(36756003)(38100700002)(86362001)(31696002)(31686004)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVc5N3d1OHV4cWdyZHMxUHZUeEZSQTY1ZWxtaHgxWmk5VlYxZWFIQ1ZmdTZh?=
 =?utf-8?B?YUg1bEtaakhjTXdDOC95ZG5oZ1JCakMvNFlneUJJNCsydHBKNGFiTW5lNTR1?=
 =?utf-8?B?VmNDcWdaT2lOUTFTVmxvQ2liVnFVVUY5V3RnYkg5S2k1c3VaK3RlSHpnWjds?=
 =?utf-8?B?MmY2UStIenVseUFadTMxZlZpdmZMdUkyL2piaC9CMXpXeU11MHRQWjVWYU90?=
 =?utf-8?B?VWpVWE1BMU4yU2h0RlJYTmgvT1RlUmc1Rmk3ZG5QTEFNYTQwVStPWnJYY0Iz?=
 =?utf-8?B?QTc2UG0vVjZLc20ySmNKcDVzTU8vWWpOVzBDcXF4YnNlTnNzdGlYQzQ1WVR5?=
 =?utf-8?B?ZVIyV0p4N1YvVHZqWGlvakJDR3FEYmdzUGJDQlZVZTFJQ1Q4bXM3dXZqeWVU?=
 =?utf-8?B?L25SSFp1amJmTnZEU2FlRDV0R3dXcm9LVnJLbGk0aWZydEJNd3orckw5RGxl?=
 =?utf-8?B?RnNOWlFKTDkwVElkeDJHZVpCVmtKWjlYOHA0TWlYNmRNSTdGVERVMjBXTUJt?=
 =?utf-8?B?ejYzem02VW1xc0RZQ3F1YVpxN2RobWY0ZlV5TkY0Wi9jOU1DWUJXSCtxQmlh?=
 =?utf-8?B?b0w3d1BHdVg5ek9HODlVNkNmNWxkQzBhWWZmbyswdm8rMnJRdTVUVTFuUGVI?=
 =?utf-8?B?M0p4b1NaY21KL3MvK0Y0ZFpLZXBkNXhaTGthWjkzaTNvaXM0ZHlsY1BzeHJt?=
 =?utf-8?B?aitGV3pHVk1kd0NHMHFZbWgzdzVXSlQzenB0TE94bitQU3JZajN0cXdmSEJD?=
 =?utf-8?B?b3pxSVdqa2V4Sm4vdzU5S1lTN0tsaE9taEg5bzhtQWdBbjcrQVZycmZjQW8x?=
 =?utf-8?B?UUg3WGx1dXZsY2FmT1RCRjlCWFRqVUgydUM4eFdDekFhWkZmd2FRdk5JK3dm?=
 =?utf-8?B?QUV6M3JkczNvM1BHcXlWRldFTy95SWFKTDZibnI2MG9RUkNGUTB1cjhGYmti?=
 =?utf-8?B?UG9nMzJzaEFJQUl0b1NVT1hoeXFYMk4wZjVIN3h1Z3lQdUtIWkt1dmh4KzU2?=
 =?utf-8?B?YmdDQmEvQXU1YWZkU1lGSWR1di8vaGMwWjJtTjNoSkJpSHRzc295d3I5Mjlk?=
 =?utf-8?B?VlV2SXgzZTljUlpqM3ZhcERWaGE0OTFrb2ZFZ3JGNnArVnQ1WnJ3eXBQd1kr?=
 =?utf-8?B?S3lsYVhoU1gwNWNoZDYrSnIycWMrcmtaMVV5SHFZd3A2TldTMjZRV0xpRGFD?=
 =?utf-8?B?SC9EMHlVUERkRWFWN1orUmc4WXozcXMyZWlnV3VIMUdYV2QzUVhVWFJhU2Y4?=
 =?utf-8?B?ME0vTWduMEo5V2VRZ29MUmt0Sk1KQnFPcFJqb0U2MDJqcHNwczFiR1FCN1Iz?=
 =?utf-8?B?Q01neXRLbkpaOFB0UU1iNTFTczFwb2p6aGFYd2ZXTDczVmtOb0dMTTlhSGxp?=
 =?utf-8?B?WDA0SnBYMVM3Z25qdk01RlBTeWNtTUp6VUpERDBzTE9ZTVpRUEF6SUhpY0NL?=
 =?utf-8?B?TlRBNlFjcm5wT3I1UHJXaUxhOEpEalR4YlFKcFYrSHdpdkJwTGNiR3pKVURz?=
 =?utf-8?B?ZWl3MXdDeFFQQ1N6anZMdlc1cjJjVHdGckNHUlZra01JSUNuNU00ajUzOEJL?=
 =?utf-8?B?elNiMm4zZXU5aG12VWlxV25EZ0U1S2tkUjI4MUlvQkRtNit1SnNRa1gzRDNh?=
 =?utf-8?B?czJUZVMyRzhoTU1sS1ZnUnAxOWpOWmVCN0NoWWsva3J1aHVpUWtOOWp6eEgw?=
 =?utf-8?B?Vy9qbDhPaFRucDE1anR0QWlpaENNbjZocDV6NllIbWE5VEd2UXIzVWNEQm1t?=
 =?utf-8?B?YTBnbUszU3pGa2ZNSEhYREFnMHBDMko2UzlTdGNJRjRvbEhDclRXTG5nWXI2?=
 =?utf-8?B?dzhnV1Z2NFJLRTREZEM5U0F3MGpUOFp1NFI4M3BiTWVsVzlEVE5YelFTNlZV?=
 =?utf-8?B?WUlWSFFiejZDU3FSOVhHK0ZMaTNZalQzTHU3YklJK0pNMjFlSGxDQ0hjM0F6?=
 =?utf-8?B?UU5uVHlRb2FJUmhHb0NkdmhXSXdiNFNQM2RDQXhudk9qRXd6TmZRdGJ2QkhV?=
 =?utf-8?B?dFJuTjZGaWJ4UjFUdW8wTGRYMTBqSVV5VXhFV0o1SXhkMGVpa3ZSdVZxYmM5?=
 =?utf-8?B?MWdhVHZUSVAzNlZqZWUvVzJqaHkzemtTYU1GbTBFQ3Y2R3N2aVNIYXVzMHlk?=
 =?utf-8?B?ejlKbXlVS3EvbFNhTWswREt5WWNibGlpVTgvNG91TUJkRm5PdXd4enA2TWts?=
 =?utf-8?B?VWhHZytrSVNSYlR4Z3RNYVNacTlxZ0dkVVJjMmtGWjZWOGl3cWs3NWRGNGxz?=
 =?utf-8?B?RXlpZEFwTExXRUEwSnpOdXRTZjlxOFRnV3Q0R2pRalVRMnd5ZEhja0w4Y3NV?=
 =?utf-8?B?ZkdEd3lPZ2tjWWVSQytlb0FNTStta3NZVW1jeFFGVTRuNU96LzBWQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0479f08a-b5ce-4720-9bd5-08da3e3c1645
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 10:48:22.1935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4W6sWo1I29rLrkcjjYMlgdTt96xpxiKeN19oF/+Etc7k3jPh4xeTlpdTmGjVhXsyRIOWoFuu8bJYo8m0q97GYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1807
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 25/05/2022 08:09, Ard Biesheuvel wrote:
> On Tue, 24 May 2022 at 19:49, Jon Hunter <jonathanh@nvidia.com> wrote:
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
>>
>>
>> I am seeing ...
>>
>> [    4.415167] CPU0: Spectre BHB: using loop workaround
>> [    4.417621] [<c01109a0>] (unwind_backtrace) from [<c010b7ac>] (show_stack+0x10/0x14)
>> [    4.430291] [<c010b7ac>] (show_stack) from [<c09c2b38>] (dump_stack+0xc0/0xd4)
>> [    4.437512] [<c09c2b38>] (dump_stack) from [<c011a6c8>] (cpu_v7_spectre_bhb_init+0xd8/0x190)
>> [    4.445943] [<c011a6c8>] (cpu_v7_spectre_bhb_init) from [<c010dee8>] (cpu_suspend+0xac/0xc8)
>> [    4.454377] [<c010dee8>] (cpu_suspend) from [<c011e7e4>] (tegra114_idle_power_down+0x74/0x78)
>> [    4.462898] [<c011e7e4>] (tegra114_idle_power_down) from [<c06d3b44>] (cpuidle_enter_state+0x130/0x524)
>> [    4.472286] [<c06d3b44>] (cpuidle_enter_state) from [<c0164a30>] (do_idle+0x1b0/0x200)
>> [    4.480199] [<c0164a30>] (do_idle) from [<c0164d28>] (cpu_startup_entry+0x18/0x1c)
>> [    4.487762] [<c0164d28>] (cpu_startup_entry) from [<801018cc>] (0x801018cc)
>>
>>
>> So definitely CPU idle.
>>
>>> We can't really do this for the other print, because the system status
>>> can change as a result of CPUs being brought online. :(
>>
>>
>> How about making this a pr_debug as opposed to pr_info?
>>
> 
> We should pull the pr_info() into the conditional so that it only
> executes the first time around:
> 
> --- a/arch/arm/mm/proc-v7-bugs.c
> +++ b/arch/arm/mm/proc-v7-bugs.c
> @@ -209,10 +209,10 @@ static int spectre_bhb_install_workaround(int method)
>                          return SPECTRE_VULNERABLE;
> 
>                  spectre_bhb_method = method;
> -       }
> 
> -       pr_info("CPU%u: Spectre BHB: using %s workaround\n",
> -               smp_processor_id(), spectre_bhb_method_name(method));
> +               pr_info("CPU%u: Spectre BHB: using %s workaround\n",
> +                       smp_processor_id(), spectre_bhb_method_name(method));
> +       }
> 
>          return SPECTRE_MITIGATED;
>   }
> 
> If you can confirm that this fixes the issue, I can send it out as a
> proper patch.

That works for me.

Tested-by: Jon Hunter <jonathanh@nvidia.com>

Thanks
Jon

-- 
nvpublic
