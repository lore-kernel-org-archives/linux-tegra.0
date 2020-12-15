Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68200C4361B
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Dec 2020 18:57:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A20F22B2C
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Dec 2020 18:57:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731770AbgLOS5m (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Dec 2020 13:57:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731754AbgLOS5f (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Dec 2020 13:57:35 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D6B0C0617A6;
        Tue, 15 Dec 2020 10:56:54 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id w13so42108008lfd.5;
        Tue, 15 Dec 2020 10:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+i5bjad9QX6E3m5+IhhqYMH1QUZhoYEcJW2382imKTk=;
        b=m2RZGxiuekpTbkPAgPnQNV+CPN9irjQoP63xr2BF8YvZENTID7/3a9g0WpCfD1Fwoi
         Kff4ns67yZjRq+X7RyPqd6BkrIsCrw7bRZWSwu0kpjtZ0h5rU6/ap8cp39Kxl/wMIpLC
         zlFxCxP7SAGEUqNtlVBkpSIDmCKCZ4JoqvQiE7Tp6Mjyvrm787W2ULDQs1HIyJeswCcc
         tRbkiVKSzRwTKXBdTMK3Ib7e6JmDjD98qP/FxSwEizsiOXTDtI/tXXmgXbOb+E0Gxiv0
         vZH9aN0KxC6Y7Tn+q/CeXN0rb1TopxbdgeMlqhLQr2nncsuo+jrT0wIb9n1eB/ZHpQ3l
         2ZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+i5bjad9QX6E3m5+IhhqYMH1QUZhoYEcJW2382imKTk=;
        b=akJe6vRe2CYhnRDrWYokwGNM/wOOEVmOb+0NgvFbbWb7YQb7JTcTyirav8cJ5cZIm7
         YJmcA3aobTLi2IyxBNco4efim1ygvBPPwgpMS0gZ3ten5LoYTSxsKnaohwXcFzTFsQ5v
         9SuYZOkAcyTpWMj97sPObs6U0T605GCqUr4AYiMjCZWfGHQxcv7NjeauUCkN7X9BwA6p
         0JrKRRxOW67dmZ3tYMc9pzVCl53laGRjr0/64HVrO2Y1jkL8MaOLnBBGe9xCMqiz31cf
         fj38p4807D3/aQ9E2z2kDmjuVU4aywSP+ZUBO24k4dnloSmoBsoTncQfFCd0sZqdMKOK
         lppA==
X-Gm-Message-State: AOAM530cgvSqKN34xO4sZ5CbmuX8ioDmaEMtGTm1kPB6OBN41CD/yzVq
        8QpwH9E/UhTWZx9XxO3vqI43LYCrENE=
X-Google-Smtp-Source: ABdhPJy0sVfW67lV34+qhwsThCdopBt5g7fI4+SPn1QwqP6GwbVKYpYFk+yXjJWA3FaF2O1fwxKFmA==
X-Received: by 2002:a19:cb05:: with SMTP id b5mr11311074lfg.61.1608058612809;
        Tue, 15 Dec 2020 10:56:52 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id e1sm300729lfs.279.2020.12.15.10.56.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Dec 2020 10:56:52 -0800 (PST)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <604dd2ea-d813-fa3f-3e2f-4d66175162b3@gmail.com>
Date:   Tue, 15 Dec 2020 21:56:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <b8de29b7-b0f6-5b2b-6ab2-f4399bc241fc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

15.12.2020 21:22, Florian Fainelli пишет:
> 
> 
> On 12/15/2020 8:53 AM, Dmitry Osipenko wrote:
>> 15.12.2020 19:40, Florian Fainelli пишет:
>>>
>>>
>>> On 12/15/2020 8:17 AM, Dmitry Osipenko wrote:
>>>> 15.12.2020 19:04, Florian Fainelli пишет:
>>>>>
>>>>>
>>>>> On 12/15/2020 5:52 AM, Dmitry Osipenko wrote:
>>>>>> The tegra_uart_config of the DEBUG_LL code is now placed right at the
>>>>>> start of the .text section after commit which enabled debug output in the
>>>>>> decompressor. Tegra devices are not booting anymore if DEBUG_LL is enabled
>>>>>> since tegra_uart_config data is executes as a code. Fix the misplaced
>>>>>> tegra_uart_config storage by embedding it into the code.
>>>>>>
>>>>>> Cc: stable@vger.kernel.org
>>>>>> Fixes: 2596a72d3384 ("ARM: 9009/1: uncompress: Enable debug in head.S")
>>>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>>>> ---
>>>>>>  arch/arm/include/debug/tegra.S | 54 +++++++++++++++++-----------------
>>>>>>  1 file changed, 27 insertions(+), 27 deletions(-)
>>>>>
>>>>> Looks like arch/arm/include/debug/brcmstb.S would need the same
>>>>> treatment since the implementation was copied from tegra.S.
>>>>>
>>>>
>>>> Good catch, will you be able to test the brcm and make a patch?
>>>
>>> Yes, absolutely, building a kernel to test right now.
>>>
>>
>> Thank you.
>>
>> BTW, I noticed that the problem is more visible on a thumb2 kernel
>> build, i.e. you should get a more reliable hang on boot. On a non-thumb2
>> kernel the hanging behaviour seems depends on a device / bootloader. I
>> haven't tried to figure out what exactly makes the difference, perhaps
>> it should be a memory layout / state.
> 
> To build with a CONFIG_THUMB2_KERNEL I had to fetch:
> 
> https://www.armlinux.org.uk/developer/patches/viewpatch.php?id=9018/2
> 
> to avoid a build error, too bad this missed v5.10 final but hopefully it
> can make it soon.

The VFP fix was applied to the -next very recently, it should propagate
to v5.10 eventually.

> With CONFIG_THUMB2_KERNEL=y, I am not getting the head.S output where it
> prints the start/end of the compressed kernel:
> 
> C:0x420800C0-0x4321B0E0->0x4212AB00-0x432C5B20
> Uncompressing Linux... done, booting the kernel.
> [    0.000000] Booting Linux on physical CPU 0x0
> [    0.000000] Linux version 5.10.0-g148842c98a24
> (fainelli@fainelli-desktop) (arm-linux-gcc (GCC) 8.3.0, GNU ld (GNU
> Binutils) 2.32) #71 SMP Tue Dec 15 09:53:09 PST 2020
> 
> I am only getting:
> 
> Uncompressing Linux... done, booting the kernel.
> 
> Is that the same for you?

No, start/end are printed for both THUMB2 and ARM kernels here.

> Looking at the disassembly of head.o it definitively has
> brcmstb_uart_config in the .text section as the beginning just like you
> mentioned in your commit message.
> 
> Disassembly of section .text:
> 
> 00000000 <brcmstb_uart_config>:
>    0:   00000001        andeq   r0, r0, r1
>         ...
>    c:   467c            mov     r4, pc
>    e:   f004 4478       and.w   r4, r4, #4160749568     ; 0xf8000000
>   12:   f504 4400       add.w   r4, r4, #32768  ; 0x8000
>   16:   4678            mov     r0, pc
>   18:   42a0            cmp     r0, r4
>   1a:   bf3f            itttt   cc
>   1c:   48d4            ldrcc   r0, [pc, #848]  ; (370 <LC1+0x8>)
>   1e:   4478            addcc   r0, pc
>   20:   4284            cmpcc   r4, r0
>   22:   f044 0401       orrcc.w r4, r4, #1
>   26:   bf28            it      cs
>   28:   f000 f9aa       blcs    380 <cache_on>
> 
> however after applying a fix similar to yours, we do end-up with the
> expected data embedded within the code and given brcmstb.S would be
> subject to the same issue as tegra.S, it would not hurt.
> 

Have you checked whether start/end printed after applying the fix?
