Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2335C433FE
	for <linux-tegra@archiver.kernel.org>; Tue, 24 May 2022 16:08:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239453AbiEXQIB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 24 May 2022 12:08:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239661AbiEXQHz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 May 2022 12:07:55 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam08on2047.outbound.protection.outlook.com [40.107.101.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0006393F8
        for <linux-tegra@vger.kernel.org>; Tue, 24 May 2022 09:06:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VY62xvHWdUDSjDITQwOdPzrzhDUZsZ9LeskBC/YNCsETcs3oSx5iQcE4dBvD9c/U0vR5gsnWSdXsCjFgUuHOP3Im/ePtHU4s/OsHR+HO9Cbrn/Gymw4C8+UXPggwuxkBStRIqbqIbTaVJmBhUMQLS+u0q9ILY2WVhMY207Ee3YcZ3Do1n+Q/rm630/MbCyyh1l56lsse/jg3l4VSBngyqlOx49CiY2RQWROJV3tSm66M1giIzS9KS5W3QRRM50FjjT1BLvL95IaWXvJqOvHDr3II5Ll2wUP4GTA5eb4+kcs/pD9bVQkKOQn83euVBvWj+jKQBm55uJZKWsGKAGvoRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IaIRzPs4uLRA8SDqC12Dhfne15/FFHVRFX9LsUibWDI=;
 b=FhftcQG4kaAYLAfIfVMZNWN/cUOZ+P1h6e9LB9YuURxPHp3/lbzFreL1Gexf9c9KqGvn4cUIlc3HOoCyWzCwA+C69iLSBlqyd4VfniloaZ1hkj4C70OHVb2R4tdC0/A1XcbYnckR0GKe5q8O0Y5G/+U5V2W/coBCS52WmyWDPZwoqZxExvg/YPiyTC2kvB4qpcpe7ELKluIl8aTIfL6uohXX+iBcPFFB3MziI3WkgoVR0EqkoBw+YCfFgcukL7cJZz5r2aSgZW4/7TzdM7aGluQbJD/5iL6/ceB/hlQGT6tXGdbDgqzDeL7uE/RyYtbF/QHl5FDmQff1IxzsPo7czA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IaIRzPs4uLRA8SDqC12Dhfne15/FFHVRFX9LsUibWDI=;
 b=CbW1Q+pLT62Xtzb9Y+OGfdmeVs7f2RjBVlBGLGbnRSHT9WiWZcp5wPfVb5HvZChkkxzCPTCOH+I7mjtzDsTcTXdvYBlkwojcs6HOD8TgagsF8m+gy+jRomoqLnr9bJDUKlXVK4vy48VjGG4zzHrYc8MZsiiXewvZL8mL05nIq8ZNgdCuQ6oPoAegSCHtM604T5akNDDtK5SCuhUpFuulTuffvCO/xtHH2DBD0SRMTBzucB0bmXMOb2EZOZVSMISdOkP3aQtNUqWnJw/ROl7umwsNX7N6FSm+isf34dGPTagadDcZiirbXJ8cl/y0MNmCIkUVGYHRFKTW4OAKWjunrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 DM6PR12MB4106.namprd12.prod.outlook.com (2603:10b6:5:221::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14; Tue, 24 May 2022 16:06:32 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f954:6840:ce82:c54f]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::f954:6840:ce82:c54f%4]) with mapi id 15.20.5293.013; Tue, 24 May 2022
 16:06:31 +0000
Message-ID: <e2e648da-27ee-106f-9c69-75df69f38730@nvidia.com>
Date:   Tue, 24 May 2022 17:06:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/6] ARM: spectre-bhb: enable for Cortex-A15
Content-Language: en-US
To:     Ard Biesheuvel <ardb@kernel.org>,
        Russell King <linux@armlinux.org.uk>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>
References: <20220328134714.205342-1-ardb@kernel.org>
 <20220328134714.205342-2-ardb@kernel.org>
 <a589f56d-a0e1-328d-e4be-9427342d46b8@nvidia.com>
 <CAMj1kXEmZdUePX8+9SPQhhc9CPTkg0fGWY7ftroYm8vH8xnz9w@mail.gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <CAMj1kXEmZdUePX8+9SPQhhc9CPTkg0fGWY7ftroYm8vH8xnz9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0227.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::16) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf7baef3-b0db-4d0c-7878-08da3d9f5e07
X-MS-TrafficTypeDiagnostic: DM6PR12MB4106:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB410656B0FA87DC819467532BD9D79@DM6PR12MB4106.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SkKbYZks3V1PN8Uw6wObtxa+7B5OVTtGVTKcoxlZftTJ4nBdIdmh4fwYw8K6ucM8vJ2PpF9xvaem+Sw5vTVjzGAJoF6GBygw60x5X9LcjLSVP1TTjaum6dYIHOUz/LCdh+GT6Jj+tl4M1Jl6YMtFQC6J6vPlc9JPlsTW1OcWxNuvKjWmptVkoWYnAVffYoioxFwMKF97o+mXZUeWsPEB19roBuf85o/eglMCjD/sA1/DJs8uGxtmfs9RvSuk94hAREdYTOrfeo7F+ZHAcFsmlnCWiFXE6d/Gi/uTJ9pQ1pNOsIHmiJtEUq/lRkeAEdiy/4fAITFnItwO2o4ayXjoKh9PCIxr2ySTE8V8kEvPZKamrPbS0gQq0vNO/rM9o6dOTGsZjDh1gIoKfEIuZD51mwufp/wrpjgq8jwuH6ze2tfcRM8tGLn4PA9c2WZqGEUnH1x2FM0V040jRJtVqzYRBsGGrAiJQN3rlS+9g1NkkzPHIpEB3R22SIDZYRMlL3lOW/o+ltmijo3jujxqHxuFSRzLkcyqbkB9u7eZVFD+NfnHhQ1E1wV7HMDTwOjO4cGS9EaDaPjVoy0IDx87VS5vLeYtyf13xXmjNRr8wBcFdqXs8IL+a/ZeZevPk2xO2utibkDfWKmXVH1MxpuswjMPPV/soqAZyYvtDQ1Y5crlK4WnhitT0Emk2INU0iQ1FPrsVrrxAjcbeTrbWeJaEayfGioA4FjlH49vAEO3obkI6XFKLMRDTTQF97/8LipVntk9
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(110136005)(2906002)(36756003)(54906003)(508600001)(31686004)(316002)(55236004)(38100700002)(53546011)(6506007)(31696002)(6666004)(86362001)(66476007)(66946007)(4326008)(83380400001)(8676002)(66556008)(5660300002)(2616005)(186003)(6486002)(8936002)(6512007)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTZrWHpGa0ZXYy9SeVNlVUNqa1FEamlNZXhBOTBQdWROcU5wWVdSZjl6c045?=
 =?utf-8?B?Q2U3TWpDd2lpV2pVT3J0N0xGSEQvR0ZZZGdTZnhQd0k4a0doT0FwRlNWTjBw?=
 =?utf-8?B?aExneW8xWmFrYWxDaUxsTk1qbkR0OTdrb1lsMjR2MUdzMXdSVUhTdVJvQ1kr?=
 =?utf-8?B?YURXTEhqaXM0eFZCQlBVeGM5cUdrOXQvUVg2V3YxQm51dTR0UVpXc3krK3lG?=
 =?utf-8?B?TjVwQnJEYzkrdlJucXg0U0pOcGM0UXg2M0JGbHJpc0RpbXFobHovbjh5RXVi?=
 =?utf-8?B?MWxGbUcxb3pCMGVkRFVuVDJ1a0QzbTBJd2JZZG5qTDZsTWJiOGRtYmtBVzNL?=
 =?utf-8?B?Y1BabXp6U1RnamFhWGdCYzNIVExjWHRHeUFmNFJMZndyTUY2eDVlZHBZaWtO?=
 =?utf-8?B?YjMrRXZDbjg1djVvZmw5MkM4Nkt1L0RWaWppcHd0b0lMNUQwd29RTlA4cFJy?=
 =?utf-8?B?ejhmT0FUQmcvRGoyTk1kcW5wZzJDbkh1Uk5hUmtSWFY3RFB6RXdEdHptVVBH?=
 =?utf-8?B?VlRDRS8xMFNiME5naGdISWZhTHp4d2tRN1U0MWYrRUdqT3lyZGlyaDdUOFcw?=
 =?utf-8?B?U29qWk9FenNlL2N1d0g1SzFPTEJaVVFvcXhtVHFkZTJkQXNHTkpNQ1dJN1I3?=
 =?utf-8?B?b0xsQ1BjWlRVL2pMUVJuNStnemdJcmI0TWg1cFZkUzUzZ3dxRFgvRi9Ka3Ax?=
 =?utf-8?B?QXhlTmRDSXNTcHhoOElMRVVERlVaeXhjS1R5aWNrakxNcklUaUFjUFAva1hw?=
 =?utf-8?B?UnIrNSs1a01lT01XaFV2c09sN3gvNFA1NERTN2FsVTMwQlB6VHFSU1JmM0RS?=
 =?utf-8?B?RnZrdjBabkxUam56bmpjcElFaHRvbHBFdElvemw0YXc2RTAwSFF1N2VjRWN3?=
 =?utf-8?B?d1lTWDlDN282KytKOXl6UWs5TTZSRmVoYmk1Q3A1UHMwL1RlK0lVdkZLd082?=
 =?utf-8?B?UUtNcnJnWUlsNXE4MzBKNytXZVBvakh0VHp3ZGo4VHFFaG5GMjBNbUpPZU9v?=
 =?utf-8?B?dnBmT0ZHUGpML29GNExGM3M1azQ1cmo3M2ZWQWpQQ2NFbWtPOFNBQi9LRWxx?=
 =?utf-8?B?V2tjTDI5Z1BPaktYSWZGYkxZQjJyVXNSWXphMmtEZVFRSXJNbzQvM016YU1r?=
 =?utf-8?B?djEwZnd0Mi9iOW55WFpXcGtnU0o5ZFY4SFNPS0pEd1NCL0QzeUNRMDZlV2wy?=
 =?utf-8?B?Z1pjVFpDMjNrRUdnZG5Tci9KaHpEMXMrSzFjbjZHV3BNNE05VmRmOXlabkov?=
 =?utf-8?B?K3RHSkhJaXFjT0hCUHp1VXRNMnJPU05vUkpkWGY0OHRSc3ZvMGdZcXVjZmM4?=
 =?utf-8?B?dnI2VjI0aTVLSFdMcEFaakREdUZOUFAxZis0NWxGZUx5UjJNaWdSaFd5TVMr?=
 =?utf-8?B?d1hFV3hPRmVtcmZScXlQVGIwdm1tUnJsZyt5ajJrQWtjYTZoaTBFWjdOUzFr?=
 =?utf-8?B?QncyWWYvcU9nb2dpL2M4TVpRUHMwTUtHemlLd0dTODdMWTd5bVBEOXMrVS9y?=
 =?utf-8?B?TDZvcmYzVUZkbFl1MTZJU1J0TlpFdC83b2JKR3o4b3FaSmxocisvU01FRUEx?=
 =?utf-8?B?VVhVdHpmR1ptQ2wrZWJaTXpXRkJJdnp2SjFGbHpWckZIOUJ6QWxNSGVtdDNY?=
 =?utf-8?B?cDdWeklwNFlEbTRzMElSeXNOM1d2ZUFkN0hxdlFVd3RVaEZ0UlJGSS9QLzUr?=
 =?utf-8?B?UENSQ3pIODhsVWc0eDdZVVZXZ3JRM0JubllLdkJadEVVWkNYamYwa0JuK1Rq?=
 =?utf-8?B?OW16ZTk1eDNqNDRWaFlRU1R5M2Qwc2JlT25XaTFYcGFYZmo4d2pjTkhMQTZO?=
 =?utf-8?B?ZmI5L2lQejVqQi9XRnlvaG9oKzlNbkFHa01raUx0dWp1ak5HUmo2aS9oakln?=
 =?utf-8?B?ZWhCaEk5ZlRvc3A5T3lrMTNpQkZCVWpYWXU2aFZMYWZzSFBIV0NMcXg0QkRa?=
 =?utf-8?B?OUJRWk11YitwMU03WEE1UWRycGN4b0dlMjNuZFo2NmxFTHNIMFFabjYwQlhT?=
 =?utf-8?B?TjFqRUUrMktrUW5vYlN6Q09rYVpSTFR3aWl4dmorNitlYzlWM2VaMURCOHRC?=
 =?utf-8?B?WWgrZGRld1MxZkhtZXUvVklxRXV3YnM2b2hwaHJ4d2xxeFRSZisweXhOa1Fs?=
 =?utf-8?B?Ukp3MlpES2VhWUxZcTl3TXBqT1dJbVBTMHJOaFlNT0o0NlNuQ2N6bTNjVHJy?=
 =?utf-8?B?amhaT25ic1JrRjhoMWU3ZGlJcVQrL2J6Vm5TWkQ0ZlRXclk5Mm5NWVJKVGsr?=
 =?utf-8?B?bTdBa3lnUW5rZk01OGdBcjVnWDB3ajI3K0tNWUtNNzFXT1NGbmFCdVZFVkY0?=
 =?utf-8?B?NjZseGwxa1g1bzlOTFpjZGllRWpYZi9mL2MvWXJ1YW56MFVKbnc5ejRiN2xS?=
 =?utf-8?Q?e6Ww9bRHZra9euTE=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf7baef3-b0db-4d0c-7878-08da3d9f5e07
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 16:06:31.7988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gYYDkgZE+H/U2Z3tsLb6zBlUJ3D17RY5188QZyKCjN5cyXxhstcffC6bK/Ql5IiKTzgUV3Yt9QkD7GiqEg7M/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4106
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On 24/05/2022 16:21, Ard Biesheuvel wrote:
> On Tue, 24 May 2022 at 16:50, Jon Hunter <jonathanh@nvidia.com> wrote:
>>
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
>>>        if (check_spectre_auxcr(this_cpu_ptr(&spectre_warned), BIT(0)))
>>>                cpu_v7_spectre_v2_init();
>>> +     cpu_v7_spectre_bhb_init();
>>>    }
>>>
>>>    void cpu_v7_bugs_init(void)
>>
>>
>> Since this patch has been merged, I am seeing a ton of messages when
>> booting Linux on tegra124-jetson-tk1 ...
>>
> 
> Thanks for the report. The good news is that the Spectre BHB
> protection is finally taking effect on your system.
> 
>> [ 1233.327547] CPU0: Spectre BHB: using loop workaround
>> [ 1233.327795] CPU1: Spectre BHB: using loop workaround
>> [ 1233.328270] CPU1: Spectre BHB: using loop workaround
>> [ 1233.328700] CPU1: Spectre BHB: using loop workaround
>> [ 1233.355477] CPU2: Spectre BHB: using loop workaround
>> ** 7 printk messages dropped **
>> [ 1233.366271] CPU0: Spectre BHB: using loop workaround
>> [ 1233.366580] CPU0: Spectre BHB: using loop workaround
>> [ 1233.366815] CPU1: Spectre BHB: using loop workaround
>> [ 1233.405475] CPU1: Spectre BHB: using loop workaround
>> [ 1233.405874] CPU0: Spectre BHB: using loop workaround
>> [ 1233.406041] CPU1: Spectre BHB: using loop workaround
>> ** 1 printk messages dropped **
>>
>> This is significantly increasing the boot time and causing failures if
>> the boot takes too long.
>>
>> I see that Dmitry has posted a fix for one of these cases [0], but the
>> above also needs to be fixed.
>>
> 
> Agreed.
> 
> Do we have any idea why this init hook is being called so often? Is
> this expected on systems that do agressive suspend/resume for power
> management, or is there another existing issue here that is just
> coming to light due to the newly added printk() ?


So far I have not dug any further, but I do know it is not doing any 
aggressive suspend/resume. From what Dmitry indicated he saw this during 
CPU idle transitions and this platform would definitely by exercising 
CPU idle.

Jon

-- 
nvpublic
