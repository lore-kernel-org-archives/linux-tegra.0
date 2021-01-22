Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5CA2C43381
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 21:59:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B106123B08
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 21:59:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730019AbhAVV7a (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 22 Jan 2021 16:59:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729576AbhAVV6z (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 Jan 2021 16:58:55 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20FE8C06174A;
        Fri, 22 Jan 2021 13:58:15 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id u11so8182962ljo.13;
        Fri, 22 Jan 2021 13:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XmVwcl5zov3KR+vEhZu6TM/lbJHaayiWVAvDfTYcGJg=;
        b=Jfp3zu+DNoQBWUPlvlhJpjwwkHiJMuyg/x3E1zTiq7E5c8b9N2+Ekj/UynidTve9k9
         qBWVzvzk46qU3mXkydK9Dza/CR0p/CXE0y9LGZsfkM+yT+jFqoNZGvn4sE4d0O+i62uZ
         M0+A//Nm1Zx/ow9vdUMnD+DdDfM1RljSFLKQ4fo+faBPmid02wsTVMLQqOJ+uM9X3y7E
         rkSPBQEftvA+TwjjpayNpITUpotZaqIKuCp+KBMPBlJpc7Hv9J+Sgyx5VEd13xUd5Owa
         PNfYTEqtQpM5VhmqBPiE2cU7KkBlvvVwxssAcVSTdXUxOLO1WsKyxo2yCSR8jMEHpqex
         jYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XmVwcl5zov3KR+vEhZu6TM/lbJHaayiWVAvDfTYcGJg=;
        b=HOyTJt6rzt869CHAqMdZtOjtFHpUK8NWyBBRUvyGlLk1miFfe1hNuCdrAFVnXqeduL
         B6dp+s+kVBFl3F0hxhhLjwAcbyFkzgb8EHrYy1xYciV28ExMvmeztUc2y+miRHS36o+4
         irBZ2xMjCWQb4kEVag3X8V+S3uVMVEBs3Qd6S4rDrW00SRP12uOEfgDPOt5eqm2BNPju
         lJVoYMGK/gZQcJyRO2wvm0I3lHF7d+snDqHYF5V0Ozmvh4Xo+VvwohJvQwW5J33IVP1S
         48PsW+87EjlwFRGrrFNj5l+2Ea0MKdX8tL8Z4Y9AAK3zAJyUiO3JAca3+RO9MrmociD6
         fClQ==
X-Gm-Message-State: AOAM532wnCb6/dk9V0r7n/3SGh3wSwS0G/BMYsDaOSi6NAlesjhBJkxo
        jAqlNx/9B16zwaDaShb2ZdU3iqfEua4=
X-Google-Smtp-Source: ABdhPJzL0Qff0MnWj81jjM+rLajUyTVkI7773FXMWioYjSYTCDNefT6rCEUD5xq63TjsiKXX8t52Zg==
X-Received: by 2002:a2e:9d8b:: with SMTP id c11mr209129ljj.470.1611352693430;
        Fri, 22 Jan 2021 13:58:13 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id t2sm484560lfk.28.2021.01.22.13.58.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jan 2021 13:58:12 -0800 (PST)
Subject: Re: [PATCH v1] memory: tegra: Check whether reset is already asserted
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210119235210.13006-1-digetx@gmail.com>
 <20210122214005.bfsznpaga2rhl3ow@kozik-lap>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <20cc8401-1934-6e4f-8e66-3216b86681fa@gmail.com>
Date:   Sat, 23 Jan 2021 00:58:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210122214005.bfsznpaga2rhl3ow@kozik-lap>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

23.01.2021 00:40, Krzysztof Kozlowski пишет:
> On Wed, Jan 20, 2021 at 02:52:10AM +0300, Dmitry Osipenko wrote:
>> Check whether memory client reset is already asserted in order to prevent
>> DMA-flush error on trying to re-assert an already asserted reset.
>>
>> This becomes a problem once PMC GENPD is enabled to use memory resets
>> since GENPD will get a error and fail to toggle power domain. PMC GENPDs
>> can't be toggled safely without holding memory reset on Tegra and we're
>> about to fix this.
>>
>> Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
>> Tested-by: Dmitry Osipenko <digetx@gmail.com> # A500 T20 and Nexus7 T30
> 
> Don't add your own Tested-by. Author has to test it.  However this is a
> v1 and already three other people added tests. Where are the emails?

The test results were given on #tegra irc.

Author doesn't have to test, from time to time I'm helping people who
can't make a patch with fixing obvious bugs for the h/w that I don't
have access to.

Anyways, I'll make v2 with myself removed if you prefer that, thanks.
