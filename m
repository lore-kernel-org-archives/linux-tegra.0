Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA94AC4361B
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Dec 2020 19:48:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7736722B43
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Dec 2020 19:48:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726745AbgLOTsC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Dec 2020 14:48:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728336AbgLOTry (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Dec 2020 14:47:54 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBE08C0617A6;
        Tue, 15 Dec 2020 11:47:13 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id 23so42490928lfg.10;
        Tue, 15 Dec 2020 11:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3A6CDXSH+vJBbeg+vruqLPWO3m3JGaTS3T7HZ1Nlumo=;
        b=bZHtPkI45bDNaBdWxSEBmEXfkhUhET45w0D2M+oxvx5jxsWo2HOmvwZrBsLaFUDDYN
         uxvEXpR/idKhsz/wjaowEeTLqWuGhhXskr+b+uxd6t38j5osy/V3o+3xXqhVwxXf3hH+
         RdAs0c+wqVkntfNmY8zQ8nLdK+lOKId/2u4VRuNNdT/YKjuq6DCTvNmPVxBMeZ3E309r
         i2I6Fj/lvK4qQ1bkBh3pO1C7fPHTPTdy3ktt6OcQjdysgYoTUZmmh/AUu+V9CLfcmZxn
         mv41xrQYsE2iyNo4L77kaxTD65OoY6n18PoueVC+lTh2Asmm+5GD3Ri5sj0SvYWsq4q+
         cHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3A6CDXSH+vJBbeg+vruqLPWO3m3JGaTS3T7HZ1Nlumo=;
        b=k7wgufYxjXdSpI1fNec26drpER7zG08msloXX/erjr6Xfk0aJTl4s1iDpBAoz1Jui5
         73gHaWI7HO7uFUCCV/D0VBmbXjZPr5OtetpyU9xerHqUou3EDC7HvfMmRIj9lEMA59AA
         yY1flJrAtvIkjo8xB+I9USjqGWBrZ0/cCm2orfFmtLZO90VORUpF26hkE3d6xhyFTtEc
         DPZqGzS3vM82K/OOTjhjYUykUGmA6ZHe04HwYuwC/WN9MoPWaNMTqbJNzlQySmChJkAZ
         jLfp6uJYhrIAExCFIiceSo55xif2AdJsVnk2B1EbGO817geG0GzCEqF/41p38OEDKt3x
         7lOw==
X-Gm-Message-State: AOAM531fF5LrOpxUsYtW4CJ+VvcJ8qB0798nrv8/WiKnNHg4EKTm0fiB
        awbqtsNPSlVohoFUkzaVD8XeYAmzGHI=
X-Google-Smtp-Source: ABdhPJzy2XRxYzV7WdNff9pQdbYOlZvid9eVlCyWElunz0K8pe498HJjiTW9U5bA8VdwqlRg6O8Zvg==
X-Received: by 2002:a2e:6c03:: with SMTP id h3mr6005597ljc.360.1608061632135;
        Tue, 15 Dec 2020 11:47:12 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id 6sm2842692ljq.69.2020.12.15.11.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Dec 2020 11:47:11 -0800 (PST)
Subject: Re: [PATCH v1] ARM: tegra: Fix misplaced tegra_uart_config in
 decompressor
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ard Biesheuvel <ardb@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20201215135222.6899-1-digetx@gmail.com>
 <980f70c6-8967-c110-1699-cb0da2f46cc0@gmail.com>
 <5b01ce96-5f8b-dfcb-accd-2ba29f34947f@gmail.com>
 <5853b349-562c-3b6a-33d6-49516553dad8@gmail.com>
 <b115f985-b27b-bbcd-fc42-d9e357ecf46a@gmail.com>
 <b8de29b7-b0f6-5b2b-6ab2-f4399bc241fc@gmail.com>
 <604dd2ea-d813-fa3f-3e2f-4d66175162b3@gmail.com>
 <8ddd0072-e5bd-a035-b782-bf1ca88eebc2@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d4a4b200-ede7-0fab-8317-38abb677e5f5@gmail.com>
Date:   Tue, 15 Dec 2020 22:47:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <8ddd0072-e5bd-a035-b782-bf1ca88eebc2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

15.12.2020 22:20, Florian Fainelli пишет:
> 
> 
> On 12/15/2020 10:56 AM, Dmitry Osipenko wrote:
>> 15.12.2020 21:22, Florian Fainelli пишет:
>>>
>>>
>>> On 12/15/2020 8:53 AM, Dmitry Osipenko wrote:
>>>> 15.12.2020 19:40, Florian Fainelli пишет:
>>>>>
>>>>>
>>>>> On 12/15/2020 8:17 AM, Dmitry Osipenko wrote:
>>>>>> 15.12.2020 19:04, Florian Fainelli пишет:
>>>>>>>
>>>>>>>
>>>>>>> On 12/15/2020 5:52 AM, Dmitry Osipenko wrote:
>>>>>>>> The tegra_uart_config of the DEBUG_LL code is now placed right at the
>>>>>>>> start of the .text section after commit which enabled debug output in the
>>>>>>>> decompressor. Tegra devices are not booting anymore if DEBUG_LL is enabled
>>>>>>>> since tegra_uart_config data is executes as a code. Fix the misplaced
>>>>>>>> tegra_uart_config storage by embedding it into the code.
>>>>>>>>
>>>>>>>> Cc: stable@vger.kernel.org
>>>>>>>> Fixes: 2596a72d3384 ("ARM: 9009/1: uncompress: Enable debug in head.S")
>>>>>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>>>>>> ---
>>>>>>>>  arch/arm/include/debug/tegra.S | 54 +++++++++++++++++-----------------
>>>>>>>>  1 file changed, 27 insertions(+), 27 deletions(-)
>>>>>>>
>>>>>>> Looks like arch/arm/include/debug/brcmstb.S would need the same
>>>>>>> treatment since the implementation was copied from tegra.S.
>>>>>>>
>>>>>>
>>>>>> Good catch, will you be able to test the brcm and make a patch?
>>>>>
>>>>> Yes, absolutely, building a kernel to test right now.
>>>>>
>>>>
>>>> Thank you.
>>>>
>>>> BTW, I noticed that the problem is more visible on a thumb2 kernel
>>>> build, i.e. you should get a more reliable hang on boot. On a non-thumb2
>>>> kernel the hanging behaviour seems depends on a device / bootloader. I
>>>> haven't tried to figure out what exactly makes the difference, perhaps
>>>> it should be a memory layout / state.
>>>
>>> To build with a CONFIG_THUMB2_KERNEL I had to fetch:
>>>
>>> https://www.armlinux.org.uk/developer/patches/viewpatch.php?id=9018/2
>>>
>>> to avoid a build error, too bad this missed v5.10 final but hopefully it
>>> can make it soon.
>>
>> The VFP fix was applied to the -next very recently, it should propagate
>> to v5.10 eventually.
>>
>>> With CONFIG_THUMB2_KERNEL=y, I am not getting the head.S output where it
>>> prints the start/end of the compressed kernel:
>>>
>>> C:0x420800C0-0x4321B0E0->0x4212AB00-0x432C5B20
>>> Uncompressing Linux... done, booting the kernel.
>>> [    0.000000] Booting Linux on physical CPU 0x0
>>> [    0.000000] Linux version 5.10.0-g148842c98a24
>>> (fainelli@fainelli-desktop) (arm-linux-gcc (GCC) 8.3.0, GNU ld (GNU
>>> Binutils) 2.32) #71 SMP Tue Dec 15 09:53:09 PST 2020
>>>
>>> I am only getting:
>>>
>>> Uncompressing Linux... done, booting the kernel.
>>>
>>> Is that the same for you?
>>
>> No, start/end are printed for both THUMB2 and ARM kernels here.
>>
>>> Looking at the disassembly of head.o it definitively has
>>> brcmstb_uart_config in the .text section as the beginning just like you
>>> mentioned in your commit message.
>>>
>>> Disassembly of section .text:
>>>
>>> 00000000 <brcmstb_uart_config>:
>>>    0:   00000001        andeq   r0, r0, r1
>>>         ...
>>>    c:   467c            mov     r4, pc
>>>    e:   f004 4478       and.w   r4, r4, #4160749568     ; 0xf8000000
>>>   12:   f504 4400       add.w   r4, r4, #32768  ; 0x8000
>>>   16:   4678            mov     r0, pc
>>>   18:   42a0            cmp     r0, r4
>>>   1a:   bf3f            itttt   cc
>>>   1c:   48d4            ldrcc   r0, [pc, #848]  ; (370 <LC1+0x8>)
>>>   1e:   4478            addcc   r0, pc
>>>   20:   4284            cmpcc   r4, r0
>>>   22:   f044 0401       orrcc.w r4, r4, #1
>>>   26:   bf28            it      cs
>>>   28:   f000 f9aa       blcs    380 <cache_on>
>>>
>>> however after applying a fix similar to yours, we do end-up with the
>>> expected data embedded within the code and given brcmstb.S would be
>>> subject to the same issue as tegra.S, it would not hurt.
>>>
>>
>> Have you checked whether start/end printed after applying the fix?
> 
> Yes I did, it is not printed when CONFIG_THUMB2_KERNEL=y, but it is when
> CONFIG_THUMB2_KERNEL=n. I don't have a JTAG adapter on this board right
> now to single step.
> 

Okay, I don't know what's wrong there.

I also noticed that brcmstb doesn't check whether UART address is 0x0 in
senduart / busyuart, perhaps this needs to be fixed too.
