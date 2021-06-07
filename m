Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE6FC47082
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Jun 2021 08:28:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 388596121D
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Jun 2021 08:28:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231459AbhFGIa1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 7 Jun 2021 04:30:27 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:38916 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231286AbhFGIaI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 7 Jun 2021 04:30:08 -0400
Received: from mail-wm1-f71.google.com ([209.85.128.71])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lqAcK-00031i-6Z
        for linux-tegra@vger.kernel.org; Mon, 07 Jun 2021 08:28:16 +0000
Received: by mail-wm1-f71.google.com with SMTP id a25-20020a7bc1d90000b029019dd2ac7025so3825576wmj.1
        for <linux-tegra@vger.kernel.org>; Mon, 07 Jun 2021 01:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tn/PW7iw3ZbAUs3i31JVSRUjJCgjQwcQNEdZxUQkqes=;
        b=PAgHRbe75IQSCEwYRu6DpRyErJrB3t/h8jyb6ApmPUCItsIYC8l661b/4HU3pYtP4W
         eYxx5kyiSUjUVvFrZtvCjuvzMlkUZP19Gu7I29tvX84ngDeVq2sHNIJTCY6gSXzuqqnc
         Pv3nNExbflj5zoL35WDb2DGUoB8GEh+9EvSsJz4lstSVYbQtVKkoYbYTWKodw4fzunik
         p/Q9ELr/GiVKS42SJ5XVKiTlLCujfUG2sd+e58O+lBzI8APBHTS0XSVHa9tVgw9s8oZh
         e2YdXpvqIUOYxSLq8TYU3RHFN5gJIE9WeBYDI0NdfAq6p2YFHyBSWrFxAq3z3pIPhQAl
         HLxg==
X-Gm-Message-State: AOAM5314bb45AK2UTTZJ+F03YEQtyuKmPcEpO55/E9eEODy2jsug3I6N
        ySribYT7g8QBMZ+oovecdcFwQdSsUR8Tjj2IRTLb4+ec/rXBQTienF2sfnqGXVW2WnZi9rtGrxQ
        96UBkWKuPq1BLJ/7xsh+ibxEFwomLt3y3KBatQcRg
X-Received: by 2002:a1c:7912:: with SMTP id l18mr15621542wme.135.1623054495943;
        Mon, 07 Jun 2021 01:28:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJhpSCFwmj9c2S4ax3pZ90jedpMf6jg3flUJOKt5T80FVwei4/TBIO66LJvQdg1Zb3OAVHaA==
X-Received: by 2002:a1c:7912:: with SMTP id l18mr15621530wme.135.1623054495814;
        Mon, 07 Jun 2021 01:28:15 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-185-9.adslplus.ch. [188.155.185.9])
        by smtp.gmail.com with ESMTPSA id s7sm15631663wrf.91.2021.06.07.01.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jun 2021 01:28:15 -0700 (PDT)
Subject: Re: [PULL] memory: tegra: Changes for v5.14-rc1
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210603143739.787957-1-thierry.reding@gmail.com>
 <772bf62a-fb09-cec4-ed4d-ddbfc2832e2b@gmail.com>
 <YLnzQk+suAG5clzB@orome.fritz.box>
 <3ed358ce-de98-0b42-2446-873af55ed825@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <9f1fe71e-3900-fa8a-8c09-4bc2dc084156@canonical.com>
Date:   Mon, 7 Jun 2021 10:28:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <3ed358ce-de98-0b42-2446-873af55ed825@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 04/06/2021 14:51, Dmitry Osipenko wrote:
> 04.06.2021 12:32, Thierry Reding пишет:
>> On Thu, Jun 03, 2021 at 10:56:29PM +0300, Dmitry Osipenko wrote:
>>> 03.06.2021 17:37, Thierry Reding пишет:
>>>> memory: tegra: Changes for v5.14-rc1
>>>>
>>>> This stable tag contains Dmitry's power domain work, including all the
>>>> necessary dependencies from the regulator, clock and ARM SoC trees.
>>>>
>>>> ----------------------------------------------------------------
>>>> Dmitry Osipenko (18):
>>>>       clk: tegra30: Use 300MHz for video decoder by default
>>>>       clk: tegra: Fix refcounting of gate clocks
>>>>       clk: tegra: Ensure that PLLU configuration is applied properly
>>>>       clk: tegra: Halve SCLK rate on Tegra20
>>>>       clk: tegra: Don't allow zero clock rate for PLLs
>>>>       clk: tegra: cclk: Handle thermal DIV2 CPU frequency throttling
>>>>       clk: tegra: Mark external clocks as not having reset control
>>>>       clk: tegra: Don't deassert reset on enabling clocks
>>>>       regulator: core: Add regulator_sync_voltage_rdev()
>>>
>>>>       soc/tegra: regulators: Bump voltages on system reboot
>>>
>>> This patch is a build dependency prerequisite for the "soc/tegra:
>>> regulators: Support core domain state syncing" patch. Will you send a
>>> new PR to Krzysztof with the remaining soc/tegra patches?
>>
>> soc/tegra patches usually go in through ARM SoC. This is merely included
>> here because it was part of the set of patches that were needed to
>> enable compile testing for the memory controller drivers.
>>
>> I've applied the remaining soc/tegra patches (12-14 of the series) to my
>> for-5.14/soc branch but ended up not pulling that part in because it was
>> unnecessary for the memory controller patches.
> 
> Does this mean that if for-5.14/soc will be pulled first into mainline,
> then the patches will be applied in a wrong order?

All of the branches of each maintainer should be bisectable, so order of
pulling by Linus' should not matter. Assuming current Thierry's branches
are bisectable, how Linus' tree can be broken after specific pull order?

Best regards,
Krzysztof
