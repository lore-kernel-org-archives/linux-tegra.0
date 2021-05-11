Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 149B1C433B4
	for <linux-tegra@archiver.kernel.org>; Tue, 11 May 2021 17:57:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB5D4616ED
	for <linux-tegra@archiver.kernel.org>; Tue, 11 May 2021 17:57:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231944AbhEKR6v (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 11 May 2021 13:58:51 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:59513 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231909AbhEKR6p (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 11 May 2021 13:58:45 -0400
Received: from mail-vs1-f70.google.com ([209.85.217.70])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lgWdW-0001Dh-0g
        for linux-tegra@vger.kernel.org; Tue, 11 May 2021 17:57:38 +0000
Received: by mail-vs1-f70.google.com with SMTP id k8-20020a67c2880000b029022833ef2244so9995462vsj.18
        for <linux-tegra@vger.kernel.org>; Tue, 11 May 2021 10:57:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=94ufJ3ormqHNZspvl8FvlXfnb6f1wmMKW3qzHjBjIRE=;
        b=R3ougoIw/viqkX99VJK4oKg/RaL20j/E0G2/UYvU/vSJQyTlLsHg56zXQ2Yc1Mt+0l
         DqUncgzXGKo9nJU7mCwrA7up3GWaTC4ZWeWpsa7XCuAiGV9IF8gRYyctNaFhp4U69awR
         I83R54Fj1hra3+gPAJ4lStg99NvaXZ4OE1HAEDiecW8E53oh2MnO/hBz7tJTz16TvL/A
         Ed7Nldb/+9n2NU8/pWIzWwVjPLqX1ZohBZyIPHAZ4vorDiWL1WBtrZYzQ4cQoVkV9BZU
         /atYCVBDsYCCHbi386hm2fcHGtP9WfImbMhJvRpANLJh4X0ESIpZNiVJy8Ury1QkK1ng
         fhqQ==
X-Gm-Message-State: AOAM530hihe53Ur2wnjLiRp66lTifZ8XTtRkAoIJq8lwGcTI/FmuQRyD
        /s9qKXFvyRuRU84TOl+uVQFAlpP81vJyGjB91T7vO00OfDWHgB2TqxWmrBjk+TO+/igKo5tQYGH
        4FRgLG1W9oxg30KZjB1jpfF7BEV8LtE3AAaz98eVw
X-Received: by 2002:a67:3113:: with SMTP id x19mr21194678vsx.40.1620755855164;
        Tue, 11 May 2021 10:57:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/Zydt+xpEYkJfW7skvnQeKr98J7KH3axJKmUi3JbjcEq6SHG376ogRH/+gT+WJ682romOXA==
X-Received: by 2002:a67:3113:: with SMTP id x19mr21194644vsx.40.1620755854977;
        Tue, 11 May 2021 10:57:34 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.48.6])
        by smtp.gmail.com with ESMTPSA id k198sm2338299vka.37.2021.05.11.10.57.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 May 2021 10:57:34 -0700 (PDT)
Subject: Re: [PATCH v1 2/2] memory: tegra: Enable compile testing for all
 drivers
To:     Nathan Chancellor <nathan@kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>
Cc:     kernel test robot <lkp@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com, kbuild-all@lists.01.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20210510213729.7095-3-digetx@gmail.com>
 <202105112125.VctfC6sX-lkp@intel.com>
 <dd0b550e-76a0-bfbc-9d6f-5d867812046d@gmail.com>
 <06addbf3-0090-b76f-65cf-e0c10d284c69@canonical.com>
 <3ab5d50b-4955-7144-5d1d-d44cb0892d65@gmail.com>
 <YJrARxhVD7QM/GPv@archlinux-ax161>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <6fc3e47b-cef6-0d78-0578-551608856ae6@canonical.com>
Date:   Tue, 11 May 2021 13:57:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YJrARxhVD7QM/GPv@archlinux-ax161>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 11/05/2021 13:35, Nathan Chancellor wrote:
> On Tue, May 11, 2021 at 07:00:34PM +0300, Dmitry Osipenko wrote:
>> 11.05.2021 18:31, Krzysztof Kozlowski пишет:
>> ...
>>                                       ~~~~~~~~~~~~~~~~~~~~~^
>>>>>>> drivers/memory/tegra/tegra124-emc.c:802:26: warning: implicit conversion from 'unsigned long' to 'u32' (aka 'unsigned int') changes value from 18446744071562067985 to 2147483665 [-Wconstant-conversion]
>>>>>                    emc_ccfifo_writel(emc, EMC_ZQ_CAL_LONG_CMD_DEV0, EMC_ZQ_CAL);
>>>>>                    ~~~~~~~~~~~~~~~~~      ^~~~~~~~~~~~~~~~~~~~~~~~
>>>>>    drivers/memory/tegra/tegra124-emc.c:154:36: note: expanded from macro 'EMC_ZQ_CAL_LONG_CMD_DEV0'
>>>>>            (DRAM_DEV_SEL_0 | EMC_ZQ_CAL_LONG | EMC_ZQ_CAL_CMD)
>>>>>             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
>>>>>    13 warnings generated.
>>>>
>>>> This doesn't look like a useful warning from clang, it should see that
>>>> the constant value itself isn't truncated, hence it should be a problem
>>>> of clang. Do you think it's okay to ignore this nonsense?
>>>
>>> I admit I also do not see the real issue here. The DRAM_DEV_SEL_0 fits
>>> in u32 and there is no other bitwise arithmetic than just OR, so why
>>> clang assumes it can have 32 most signifcant bits toggled on?
>>>
>>> +Cc Nathan and Nick,
>>> Maybe you could shed some light here on this warning?
>>>
>>> Dmitry,
>>> In general you should not ignore it because:
>>> 1. This breaks allyesconfig with clang on powerpc (or it is one of the
>>> stoppers),
>>> 2. We might want in some future to build it with clang.
>>
>> I meant to ignore it from the perspective of the memory drivers, i.e. it
>> likely should be fixed in clang and not worked around in the code. Thank
>> you for pinging the right people.
> 
> I do not think this is a bug in clang, gcc warns the same (just not here
> in this case): https://godbolt.org/z/e9GWobMnd
> 
> DRAM_DEV_SEL_0 and DRAM_DEV_SEL_1 are implicitly signed integers because
> there is no suffix on the literal 1. DRAM_DEV_SEL_0 is 2 << 30, which
> can be turned into 1 << 31. That is equal to INT_MAX + 1, which then
> overflows and becomes INT_MIN (undefined behavior). INT_MIN is then
> promoted to unsigned long because EMC_ZQ_CAL_LONG and EMC_ZQ_CAL_CMD are
> unsigned long due to the BIT macro, resulting in the gigantic number
> that clang reports above.
> 
Thanks, good point.

Best regards,
Krzysztof
