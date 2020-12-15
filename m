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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D463C2BB48
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Dec 2020 18:23:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 653FD22B3B
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Dec 2020 18:23:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730817AbgLOSXH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Dec 2020 13:23:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729389AbgLOSXB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Dec 2020 13:23:01 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4AC7C06179C;
        Tue, 15 Dec 2020 10:22:20 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id t22so5604499pfl.3;
        Tue, 15 Dec 2020 10:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=je+ZmrwiUCXiuvPD1/Wb1EkZ6uMhA2JOKTB9txP5oCc=;
        b=PwUFNwTEuTjHERr607ESaHNJhHkaKE7DFFLXUYzHmmUH5D8Ws62qqcoJ+y9y0lygJv
         OPgG6eUFpK1V1NGYOaiJjkW7BX072KReb3Y/vEAOIdbtdtH+icRDyc6L43iPbk7dPLX3
         u/5NEdhVHctBXoilS97r62sSaV08duvXc1O3sivGZUJMseZhUdGoqrvt5ZZp8RzussVf
         iZ8cAFJ7v9o0XL6OqHd5o3mUagCsLXaHXTni6ziDLQIPnzggyY3sUKqXxXYtlWWK1Y1c
         T4NThc+WUuVcEUgpjjjuU6iPfgCv4V3xm3e7gu5v4tac+c6KBc3OU12O5QplVPpOcsHN
         GocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=je+ZmrwiUCXiuvPD1/Wb1EkZ6uMhA2JOKTB9txP5oCc=;
        b=AA9PrlXaFfcmy2UpFyce7yBxxYMtHteV94ZcHmPKn8U0Kp7wWcbnAyQKcchjaPVvYW
         dhgQL7NmISAm4dZeRNUBc9CKfcIeqrKwrC5UxEyknQW+Ewrj/OYfhuvNUAWq30L0An2e
         djCA/y+lHY/klCJy4EOR5qw+5LLP3v5U+pmeyA8bPDQb5oAd3E5Klnv0omLKh8yfp47P
         CV98/STpJHm7n/yea3Ui6zbSjVlhTK5WioNIBYdKvO35Ot1vNg606ReJYSFTt0qgaHZF
         /V93YCHZwVbymbwB1Umzkg6ZWssrad9HfpwBPPuLHkEtRBjNDD/eXAX7sRV2T9sHBnvR
         TZkg==
X-Gm-Message-State: AOAM533jcledk8nDmMVnAZDcJ1Slajw2Ou7yOfeL8x0o6sh/Fm7tlStq
        IqPCcniYq0Y98ySGO5TVMzycHbTngGY=
X-Google-Smtp-Source: ABdhPJzwo4fl5drkLZWEjXdYFdT6NJWksqohzDb+uPzvErFRAgw+ei95XVaVk2HG7eHpS2Q8eb01vw==
X-Received: by 2002:a63:d005:: with SMTP id z5mr30197428pgf.296.1608056539706;
        Tue, 15 Dec 2020 10:22:19 -0800 (PST)
Received: from [10.230.29.166] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id o22sm17846643pgv.9.2020.12.15.10.22.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Dec 2020 10:22:18 -0800 (PST)
Subject: Re: [PATCH v1] ARM: tegra: Fix misplaced tegra_uart_config in
 decompressor
To:     Dmitry Osipenko <digetx@gmail.com>,
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
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <b8de29b7-b0f6-5b2b-6ab2-f4399bc241fc@gmail.com>
Date:   Tue, 15 Dec 2020 10:22:16 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <b115f985-b27b-bbcd-fc42-d9e357ecf46a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



On 12/15/2020 8:53 AM, Dmitry Osipenko wrote:
> 15.12.2020 19:40, Florian Fainelli пишет:
>>
>>
>> On 12/15/2020 8:17 AM, Dmitry Osipenko wrote:
>>> 15.12.2020 19:04, Florian Fainelli пишет:
>>>>
>>>>
>>>> On 12/15/2020 5:52 AM, Dmitry Osipenko wrote:
>>>>> The tegra_uart_config of the DEBUG_LL code is now placed right at the
>>>>> start of the .text section after commit which enabled debug output in the
>>>>> decompressor. Tegra devices are not booting anymore if DEBUG_LL is enabled
>>>>> since tegra_uart_config data is executes as a code. Fix the misplaced
>>>>> tegra_uart_config storage by embedding it into the code.
>>>>>
>>>>> Cc: stable@vger.kernel.org
>>>>> Fixes: 2596a72d3384 ("ARM: 9009/1: uncompress: Enable debug in head.S")
>>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>>> ---
>>>>>  arch/arm/include/debug/tegra.S | 54 +++++++++++++++++-----------------
>>>>>  1 file changed, 27 insertions(+), 27 deletions(-)
>>>>
>>>> Looks like arch/arm/include/debug/brcmstb.S would need the same
>>>> treatment since the implementation was copied from tegra.S.
>>>>
>>>
>>> Good catch, will you be able to test the brcm and make a patch?
>>
>> Yes, absolutely, building a kernel to test right now.
>>
> 
> Thank you.
> 
> BTW, I noticed that the problem is more visible on a thumb2 kernel
> build, i.e. you should get a more reliable hang on boot. On a non-thumb2
> kernel the hanging behaviour seems depends on a device / bootloader. I
> haven't tried to figure out what exactly makes the difference, perhaps
> it should be a memory layout / state.

To build with a CONFIG_THUMB2_KERNEL I had to fetch:

https://www.armlinux.org.uk/developer/patches/viewpatch.php?id=9018/2

to avoid a build error, too bad this missed v5.10 final but hopefully it
can make it soon.

With CONFIG_THUMB2_KERNEL=y, I am not getting the head.S output where it
prints the start/end of the compressed kernel:

C:0x420800C0-0x4321B0E0->0x4212AB00-0x432C5B20
Uncompressing Linux... done, booting the kernel.
[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 5.10.0-g148842c98a24
(fainelli@fainelli-desktop) (arm-linux-gcc (GCC) 8.3.0, GNU ld (GNU
Binutils) 2.32) #71 SMP Tue Dec 15 09:53:09 PST 2020

I am only getting:

Uncompressing Linux... done, booting the kernel.

Is that the same for you?

Looking at the disassembly of head.o it definitively has
brcmstb_uart_config in the .text section as the beginning just like you
mentioned in your commit message.

Disassembly of section .text:

00000000 <brcmstb_uart_config>:
   0:   00000001        andeq   r0, r0, r1
        ...
   c:   467c            mov     r4, pc
   e:   f004 4478       and.w   r4, r4, #4160749568     ; 0xf8000000
  12:   f504 4400       add.w   r4, r4, #32768  ; 0x8000
  16:   4678            mov     r0, pc
  18:   42a0            cmp     r0, r4
  1a:   bf3f            itttt   cc
  1c:   48d4            ldrcc   r0, [pc, #848]  ; (370 <LC1+0x8>)
  1e:   4478            addcc   r0, pc
  20:   4284            cmpcc   r4, r0
  22:   f044 0401       orrcc.w r4, r4, #1
  26:   bf28            it      cs
  28:   f000 f9aa       blcs    380 <cache_on>

however after applying a fix similar to yours, we do end-up with the
expected data embedded within the code and given brcmstb.S would be
subject to the same issue as tegra.S, it would not hurt.
-- 
Florian
