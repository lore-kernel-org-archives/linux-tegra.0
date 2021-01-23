Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99FE0C433E0
	for <linux-tegra@archiver.kernel.org>; Sat, 23 Jan 2021 14:04:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 716F322C7B
	for <linux-tegra@archiver.kernel.org>; Sat, 23 Jan 2021 14:04:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725440AbhAWOEv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 23 Jan 2021 09:04:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725290AbhAWOEv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 23 Jan 2021 09:04:51 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C88AC06174A;
        Sat, 23 Jan 2021 06:04:10 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id f19so928140ljn.5;
        Sat, 23 Jan 2021 06:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RD9SLLf1ViNdAOSKgTwzEtIO6E9+dKZ8F7wwjtvoDpI=;
        b=oWC0fK1qZnIJ3u5UBDIkK8UzdQCpXKEZBOMqkVQp3mQdbb3qIsVdlZs6Q2roovkqwe
         T+MVN3o4DfAklxvgZbf81pZ+hpkCW2xJZNB3iKUJ6Xi3s0RJU4BtogbtGtd8hGVqLvPW
         z3tcF+1qwBlyXI+Cu4YvxRrN7ckKVnKmX0PI7WVFavO5fjsdMQ3eQJtA0Br5plV+147E
         IofGLE/WocXCYqaBcGlIi94RN+JlxJ/oR7MjXY5hEfEmTxFG5aRbDuFQj+vclWEJDduy
         TPh9u5IhXT+7OIZxDK+PNvAzZFdbekBJu65jf6iT8GBOqUodhusaHvJzMxVIvlW0bl1S
         B5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RD9SLLf1ViNdAOSKgTwzEtIO6E9+dKZ8F7wwjtvoDpI=;
        b=ANOBlinMpzO5tYc5h9aLYQi+dhkhER1ixhPE1vj2Z9jdZxDnPJTiUeYpEnqPssR+NP
         A9aDdQrohActzhV9h028m3RkeX+NvD6+tO2LkPmZwwtWCnn2x3bW6vtHAG+Z8X8BKab2
         UvuXYJfAxQd+drfYp//YvmcfmmAx0710VpaRa0PGsd/Tm6Mtgsy5C787709CdD/TBvJn
         AaTlzbT0C7VoDRXqdACkUiMHbhFvxMSyzImvkx+e3ckcjDxZK58nTeraTyDAmGjfZJiS
         /nr9jmwpV/8FzAUUfB0/YerJUtMNulxf5aWU7qveGE3Tq0jJVZq9zyLmEoCwx/E5MLn6
         F9jg==
X-Gm-Message-State: AOAM531ZvbEq6ppyaEP12pEJ+ZyRpmOG8m7LyJ9lHbJ2VZalDYi6BHVN
        2Ytkuit6xLBZXb6EDh71GUgyeAOyjOw=
X-Google-Smtp-Source: ABdhPJz8Fr6cQH9o4zOxkKbi7Jj7oDQEwFMC6DfaVdvzvipDGrEtWszCsJbKBxhRWV0PvpwQhfH58w==
X-Received: by 2002:a2e:8010:: with SMTP id j16mr1116698ljg.40.1611410647716;
        Sat, 23 Jan 2021 06:04:07 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id v14sm889864lfo.210.2021.01.23.06.04.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Jan 2021 06:04:07 -0800 (PST)
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
 <20cc8401-1934-6e4f-8e66-3216b86681fa@gmail.com>
 <20210122231950.znm7s3zukn63q46m@kozik-lap>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <9a28c66a-8fa5-3c9b-3301-947341879525@gmail.com>
Date:   Sat, 23 Jan 2021 17:04:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210122231950.znm7s3zukn63q46m@kozik-lap>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

23.01.2021 02:19, Krzysztof Kozlowski пишет:
> On Sat, Jan 23, 2021 at 12:58:12AM +0300, Dmitry Osipenko wrote:
>> 23.01.2021 00:40, Krzysztof Kozlowski пишет:
>>> On Wed, Jan 20, 2021 at 02:52:10AM +0300, Dmitry Osipenko wrote:
>>>> Check whether memory client reset is already asserted in order to prevent
>>>> DMA-flush error on trying to re-assert an already asserted reset.
>>>>
>>>> This becomes a problem once PMC GENPD is enabled to use memory resets
>>>> since GENPD will get a error and fail to toggle power domain. PMC GENPDs
>>>> can't be toggled safely without holding memory reset on Tegra and we're
>>>> about to fix this.
>>>>
>>>> Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
>>>> Tested-by: Dmitry Osipenko <digetx@gmail.com> # A500 T20 and Nexus7 T30
>>>
>>> Don't add your own Tested-by. Author has to test it.  However this is a
>>> v1 and already three other people added tests. Where are the emails?
>>
>> The test results were given on #tegra irc.
>>
>> Author doesn't have to test, from time to time I'm helping people who
>> can't make a patch with fixing obvious bugs for the h/w that I don't
>> have access to.
> 
> By default, author's patches are assumed to be tested, otherwise we
> would be putting own Tested-by in most of the cases (ideally: in all).
> Just because you do not see author's Tested-by everywhere it does not
> mean that author did not test it...
> 
> Testing is also a requirement:
> https://elixir.bootlin.com/linux/latest/source/Documentation/process/5.Posting.rst#L35
> 
> Therefore if your non-trivial patches are not tested, please also
> mention it with RFT or after '---'.
> 
>>
>> Anyways, I'll make v2 with myself removed if you prefer that, thanks.
> 
> I applied it without your tested-by. If the tested platform is anyhow
> relevant, just mention it in the commit msg.

Alright, thank you. In this particular case the platform should be
irrelevant.
