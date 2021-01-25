Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE7A5C433E0
	for <linux-tegra@archiver.kernel.org>; Tue, 26 Jan 2021 02:54:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8977922E03
	for <linux-tegra@archiver.kernel.org>; Tue, 26 Jan 2021 02:54:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729071AbhAYOKn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 25 Jan 2021 09:10:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729258AbhAYOIr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 25 Jan 2021 09:08:47 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77AD4C061786;
        Mon, 25 Jan 2021 06:08:06 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id a12so9774706lfb.1;
        Mon, 25 Jan 2021 06:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=b70UYa8YIK0x9xv+9vYo/yu767VIPloSWRaqTr4Le5U=;
        b=p2aWeLNxieT8woVT0Tl/UIXog/WUBwAaE+KXDvN3pVh7Tl9ZVAD+1/JiZX0bHE311l
         WIS0Fc0dUG8GqfDKDPHM62E60VTzNwJvhZ46CsjqN/rZm3IzD0xVx2BxdNdl70xehQFp
         n+8ebZ0qkSe5mVX0/BRW+bf4RGo5bVjD8r2D8v/1iYWgFcc5Zb+cfEz5VjMIzRNnwn+t
         0klFZfxePE4Yjx+zVVUFn1w+f5UJmTS05THBybzYt7h7+SNQ8mK7pDQgsyS0O2QdG4vM
         Spg8PBxWdArWbSyOxtTrtP1cUfqxJXuzbdVcJ81elQ7hGOsQ2WoVpl3Z2vZIob0F1fff
         bWEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=b70UYa8YIK0x9xv+9vYo/yu767VIPloSWRaqTr4Le5U=;
        b=ajqKU+lOY5i/Ac0LOz0bkepiDPCkU8gTRJLNAeUAq9y4MAYeiS7OKwzqkqr03hlJDU
         Uul0VwaoCXtZsKn8EySqBVNxTm8rcqNI8Y8bOvdfo7UjV0rSIM3Yxg9ylbORtbeg6v8O
         slmFxILim/TtO8Jt4HMxwbJ8ZSn2omJpPhUXn/fU+akKFGBqjqVFNhxRnHyaGu93QYdR
         kfRLkpT6SeMb6nxO8DB7Ba0p/tLyZPTZAwRMGlHT4AI1VcmoKAFZtIA9/N/qxaPPcLhd
         eJLcKcSBntMaawGj1RX9inCWLFu8g+7gpVhaChnyXhnmGv4nKEQuc8F6qgUPRtdlYU7j
         dqWg==
X-Gm-Message-State: AOAM531pVhliHwqr8Gz26EC0TIDVJx+3Vb2qscyNySlP6sfX7NPFmedJ
        oRJyplZU9ixMfCCtdn/a9DLAGI2U9Bc=
X-Google-Smtp-Source: ABdhPJxCtwtWXYO91eo6tYXFDoyFBpADb2MoH9I5qV4pNcyLmcqhJSYYTq9inWLbmT/uD6Wo9qmcmw==
X-Received: by 2002:a19:c1c9:: with SMTP id r192mr351166lff.578.1611583684824;
        Mon, 25 Jan 2021 06:08:04 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id u18sm298271ljl.57.2021.01.25.06.08.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jan 2021 06:08:04 -0800 (PST)
Subject: Re: [PATCH v1 0/3] Support building gpio-tegra driver as loadable
 module
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20210122185543.16554-1-digetx@gmail.com>
 <CACRpkdZTyBuz240iYuvi91k3dLKKXX=4DNxFEBP7mSNB58XtDw@mail.gmail.com>
 <24d46928-8c57-acba-f9cf-49afbe4c983c@gmail.com>
 <CACRpkdaR9+mxXXjRADG4+qaGiqgwVRPcCAo-5nZwXXASYfs9+g@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b6075dec-c019-3701-4d3d-d3327aef17d7@gmail.com>
Date:   Mon, 25 Jan 2021 17:08:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <CACRpkdaR9+mxXXjRADG4+qaGiqgwVRPcCAo-5nZwXXASYfs9+g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

25.01.2021 01:46, Linus Walleij пишет:
> On Sun, Jan 24, 2021 at 12:56 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>> 24.01.2021 01:50, Linus Walleij пишет:
>>> On Fri, Jan 22, 2021 at 7:59 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>>>
>>>> This small series adds modularization support to the gpio-tegra driver,
>>>> i.e. driver now could be built as a loadable kernel module.
>>>>
>>>> Dmitry Osipenko (3):
>>>>   gpio: tegra: Use debugfs_create_devm_seqfile()
>>>>   gpio: tegra: Clean up whitespaces in tegra_gpio_driver
>>>>   gpio: tegra: Support building driver as a loadable module
>>>
>>> As these three patches clearly make the kernel look better after
>>> than before:
>>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>>
>>> However when we are doing this I would strongly encourage you
>>> to also make a patch implementing remove() so you can insmod
>>> rmmod the module at runtime.
>>
>> The remove() is optional for drivers, it doesn't prevent the rmmod.
> 
> Aha you mean all resources are managed (devm_*) so that
> rmmod/insmod works fine with this driver?

yes

> OK then! :) the work is finished.

The work on the modularization indeed should be finished, thanks.
