Return-Path: <SRS0=aGvU=EK=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E4C0C55178
	for <linux-tegra@archiver.kernel.org>; Wed,  4 Nov 2020 20:40:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D814C20825
	for <linux-tegra@archiver.kernel.org>; Wed,  4 Nov 2020 20:40:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FIgUVBFu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731047AbgKDUkK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 4 Nov 2020 15:40:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730224AbgKDUkJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 4 Nov 2020 15:40:09 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E72E4C0613D3
        for <linux-tegra@vger.kernel.org>; Wed,  4 Nov 2020 12:40:08 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id h6so28951239lfj.3
        for <linux-tegra@vger.kernel.org>; Wed, 04 Nov 2020 12:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NliwPLOKGr18LLCATSIFLwL/pn/L+wahTkFLHRP/Da8=;
        b=FIgUVBFuPDpKgqH2FNciNgk6rmmMBKZI4zmPQ4huwl4qVsDTzsNSHyzusnChzuAxRu
         pTuHLnZ6t0/yZAaLODXnCDPzBfIOcr1AISSau+pIkrR7I2683s2p5zVPxDnrgtzCiL5/
         yOS2+qBxTPkiKx4m1q24lDBEbLKjrgMTNaNduGO+WTq4zO1r7Qw2vP8sJkE+E0ts9Gdc
         fRQxd1SRm9pDeEp8maqTm7/TOAremo3UUoKe12hqQd4HcLxAEUVKt2j7FIgSIFHGdux9
         Ld2r7JL+vfwEVQlXHffBW6Cwca/hwcC3rcs37YxhqQmbZ/dOpw/ddKAAPoDHny5twRgy
         3Njw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NliwPLOKGr18LLCATSIFLwL/pn/L+wahTkFLHRP/Da8=;
        b=IGkNL/dj1J9ZCp5EVGf3wgTpS4DuRQMGhbF4rQ/Grg0gghEcg2LxlsTx6A7BYeN52V
         eH4EL/qXH6KmVTYi8dWO7cs46zsjAGp8rghSCSkKKErhaK50HurKXSWlvhX6fghX6hql
         yig1LxAYSuzncQBQ121H6ApM5iXomA3/8Qo7bkQSarITFCwEgWlCPyW+9hgZIclIt8Xa
         L4PXpoDeLEHMrRjAX4Zzk4j3/X8IQOfw7ZO/dOT9fBJFYOaGB4mzs9FkA19O4tpf0dIe
         xGE/PaADg0kzq6MSKIJVS2wguChL9fkz4CylnCtsUSS8pjX29A/80tEN3Nn1Iq/p0mEM
         kJaw==
X-Gm-Message-State: AOAM531LbAfdkN2xDWBmWRSxF74rKgTpTsGwpiVGfYiv8XV98n1VMv05
        fghtAMgiC9CrfZzYhAdHUedzoMF/ZdQ=
X-Google-Smtp-Source: ABdhPJwu3TQ/tLB4K3f2Nyfg4NwKnLEdIpYeGmzyaja7zK8Us134qteSDx32cuCY0gheFiVQr25suw==
X-Received: by 2002:a19:740a:: with SMTP id v10mr9723543lfe.315.1604522407296;
        Wed, 04 Nov 2020 12:40:07 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-83.dynamic.spd-mgts.ru. [109.252.192.83])
        by smtp.googlemail.com with ESMTPSA id v27sm249128lfd.220.2020.11.04.12.40.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2020 12:40:06 -0800 (PST)
Subject: Re: [PATCH] ARM: uncompress: Enable debug in head.S
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Russell King <linux@armlinux.org.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20200901124736.155281-1-linus.walleij@linaro.org>
 <7e34261d-c7b9-99f9-121e-05da76a8781a@gmail.com>
 <CACRpkdZnZ0fxU=7_RLMEivvFProa5r9VPpPiHHR_45zzk3_kCA@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6877bfc9-3099-226a-7f9c-9f1c488e0872@gmail.com>
Date:   Wed, 4 Nov 2020 23:40:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdZnZ0fxU=7_RLMEivvFProa5r9VPpPiHHR_45zzk3_kCA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

29.09.2020 16:48, Linus Walleij пишет:
> On Wed, Sep 23, 2020 at 12:13 AM Dmitry Osipenko <digetx@gmail.com> wrote:
> 
>> I have CONFIG_DEBUG_UNCOMPRESS=y and was trying today's linux-next which
>> unfortunately doesn't work well on NVIDIA Tegra30 because it's
>> frequently failing to boot, hanging early during boot, about 1 of 5
>> boots are failing. Then I also noticed that Tegra20 has a similar
>> problem, but worse, only 1 of 10 boots succeed.
> 
> Hm let's try to fix that.
> 
> So you got the "Uncompressing Linux..." message before and all
> worked fine? So we know the physical UART base is correct.
> 
>> I loaded Tegra2 QEMU and got it also hanging on boot. I retried multiple
>> times and most of the times it's was a silent CPU hang, but one time I
>> got an endlessly reoccurring debug message from QEMU telling that CPU
>> tries to write to a wrong/non-existent IO address. Then I attached to
>> QEMU's GDB session and found that CPU hangs at the busyuart.
> 
> Could you try to implement
> waituarttxrdy in arch/arm/include/debug/tegra.S?
> A copy of the contents in busyuart should work.
> 
> I suspect this could be FIFO overflow making the hardware
> hang.
> 
> If this is trouble to you I can try to make a patch
> that you can test, just tell me.
> 
>> Reverting
>> this patch resolves the trouble for both QEMU and real HW.
>>
>> I also tried to revert only the "ARM: 9006/1: uncompress: Wait for ready
>> and busy in debug prints" patch and got this in QEMU:
>>
>> Starting kernel ...
>>
>> DTB:0x016F6A20 (0x00005DA6)
>> C:0x010000C0-0x016FC820->0x0125AF00-0x01957660
>> Uncompressing Linux...
> (...)
>> LZMA data is corrupt
>>
>>  -- System halted
> 
> Hmmmm is the physical and virtual address to the UART
> really correct?
> 
> Else it might write in some random memory.

Hello Linus,

Just want to let you know that the problem isn't fixed yet and I haven't
got around to work on yet too. Hopefully next week!
