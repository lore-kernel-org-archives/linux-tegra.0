Return-Path: <SRS0=69DC=C7=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35262C2D0E2
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Sep 2020 22:13:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA1AF208A9
	for <linux-tegra@archiver.kernel.org>; Tue, 22 Sep 2020 22:13:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LMcCNlYk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726448AbgIVWNX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 22 Sep 2020 18:13:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbgIVWNX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Sep 2020 18:13:23 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDE73C061755
        for <linux-tegra@vger.kernel.org>; Tue, 22 Sep 2020 15:13:22 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id y2so19750220lfy.10
        for <linux-tegra@vger.kernel.org>; Tue, 22 Sep 2020 15:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NnmehhLWPOvqz3n0CcKLVCPYCi7ZqMDDiup3hV8xjTU=;
        b=LMcCNlYkFB2zwQ/+hNHCtP9+WOTgwSpOUkT+IDMPWuI2PadGo/HWldEOmQOVTWmwi0
         qyQ3KuBOAu1N5tZZkVIN8lyjbNoEjsXz3MFvA5nw98nDzHs6zdLxFTMT2aZp9RCsmKOP
         SDqBArgp4qk6AACVlTImLd619gK3G/sBl3ElTIv6HuvgYrre+8uVTLSIWU1gc37Zt/kR
         Pxm3LSPTU479Kh6JkmjNOUoKaVx8WTG5wCGFFkdIHWYcBaE+nzSn1exImX+EbAUAKGrf
         JucyyN9jwpH0zRH0hO1n6J0tUJaVtxctkLqjWqbwy0fkr04Pb0UtWGvvgF8i/CjJWqrQ
         5bUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NnmehhLWPOvqz3n0CcKLVCPYCi7ZqMDDiup3hV8xjTU=;
        b=jcplVRndfKKW+OYZaBHdvAb7yZc7DqaSm4mLIfukz5C+JHb1UuL3oDqcpcW2pbWELW
         QhpLduIRfacfV6mNRARmkCj6ANTxb1Mv9bxk2WFes/g2ax+vu67qnJ4osHfwp9x2cO79
         bQgoOPQPD2UVBZySGO6/TH8ZwQl3UTUaXNBxmW8bazAJjpQ+msMxSmYguhqoNPsfQUWC
         LdJ3mWX0KYNF0aqn9BC+f4IXhY8o+IiZaJ2azHJUAMyqpSNAmfIMQJLi17WfMfK15de5
         GTvVPCQXDNVnKnWj+7Jpp+28CdLJI7XQ7LchmKqELu9MTuCnWSkpw74YelKt0Qzdr7LA
         fswg==
X-Gm-Message-State: AOAM530D22iw1ykCqu0XuEMQRqjg9PZ317BZBtkVcZl9CciYnK/oYiqC
        PjUvmIGTxkiZl/dMfd0sgUmygnBWSMc=
X-Google-Smtp-Source: ABdhPJyPLE8KQ2/4iVVWjuhbdHT4Zb+RoSBsd0WnJhpKm3aaD3MPzyAaHMIVES5XmtAHA6qPIl2KMQ==
X-Received: by 2002:a19:ed1:: with SMTP id 200mr2219173lfo.392.1600812800669;
        Tue, 22 Sep 2020 15:13:20 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id b27sm3891232lfq.133.2020.09.22.15.13.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2020 15:13:19 -0700 (PDT)
Subject: Re: [PATCH] ARM: uncompress: Enable debug in head.S
To:     Linus Walleij <linus.walleij@linaro.org>,
        Russell King <linux@armlinux.org.uk>
Cc:     linux-arm-kernel@lists.infradead.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20200901124736.155281-1-linus.walleij@linaro.org>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7e34261d-c7b9-99f9-121e-05da76a8781a@gmail.com>
Date:   Wed, 23 Sep 2020 01:13:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200901124736.155281-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

01.09.2020 15:47, Linus Walleij пишет:
> The assembly file head.S includes some debug code that does
> not get enabled when we select CONFIG_DEBUG_UNCOMPRESS.
> The debug in head.S relies on the user tagging on -DDEBUG
> on the compilation command line.
> 
> To simplify debugging, tag on -DDEBUG so that we also get
> these debug messages when selecting CONFIG_DEBUG_UNCOMPRESS.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  arch/arm/boot/compressed/Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
> index 362e17e37398..ba50e0f4781e 100644
> --- a/arch/arm/boot/compressed/Makefile
> +++ b/arch/arm/boot/compressed/Makefile
> @@ -12,6 +12,7 @@ HEAD	= head.o
>  OBJS	+= misc.o decompress.o
>  ifeq ($(CONFIG_DEBUG_UNCOMPRESS),y)
>  OBJS	+= debug.o
> +AFLAGS_head.o += -DDEBUG
>  endif
>  FONTC	= $(srctree)/lib/fonts/font_acorn_8x8.c
>  
> 

Hello, Linus!

I have CONFIG_DEBUG_UNCOMPRESS=y and was trying today's linux-next which
unfortunately doesn't work well on NVIDIA Tegra30 because it's
frequently failing to boot, hanging early during boot, about 1 of 5
boots are failing. Then I also noticed that Tegra20 has a similar
problem, but worse, only 1 of 10 boots succeed.

I loaded Tegra2 QEMU and got it also hanging on boot. I retried multiple
times and most of the times it's was a silent CPU hang, but one time I
got an endlessly reoccurring debug message from QEMU telling that CPU
tries to write to a wrong/non-existent IO address. Then I attached to
QEMU's GDB session and found that CPU hangs at the busyuart. Reverting
this patch resolves the trouble for both QEMU and real HW.

I also tried to revert only the "ARM: 9006/1: uncompress: Wait for ready
and busy in debug prints" patch and got this in QEMU:

Starting kernel ...

DTB:0x016F6A20 (0x00005DA6)
C:0x010000C0-0x016FC820->0x0125AF00-0x01957660
Uncompressing Linux...

LZMA data is corrupt

 -- System halted

Interestingly, disabling CONFIG_THUMB2_KERNEL fixes the LZMA corruption
in QEMU and kernel boots up fine, but it doesn't help the real HW. I
don't have UART access to the real HW, hence have no clue what's wrong
with it.
