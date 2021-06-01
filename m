Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D093EC47080
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Jun 2021 20:02:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA20C60C3E
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Jun 2021 20:02:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234796AbhFAUEH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 1 Jun 2021 16:04:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234835AbhFAUEF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Jun 2021 16:04:05 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EAE5C061574
        for <linux-tegra@vger.kernel.org>; Tue,  1 Jun 2021 13:02:22 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id a4so14156949ljq.9
        for <linux-tegra@vger.kernel.org>; Tue, 01 Jun 2021 13:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=COQ/ljg2vj2Yb48Uc5F/ApwjpjYZomFyAsXenq3lu+8=;
        b=edwNRPNXORm8Ky4b4TswNQ6Gtv0kgL22qmmwpA+sz/nqrZAwZouUjT60O39CZheg5X
         dMF1TmVTXJWN2PBNBKwInck+Sy7WnKwFgYf8mtc5e1oRVxgs57an/7qUdofHBBymipA6
         d4xQ67dQhaa/ZB+lU9mzIa32vB5sMXZRZs342bbykta2QNiNQobJzRd+3EXfxhVN9Iat
         zP9tieuyVM4Y42SkpJQ1lMjOhY1jKGMIFHDFnsDEXFUTLRBHjKlrnt1ycKKDdlz4/5NS
         ciAD7a3SHdSIZJ6JiWhmlO/xYHMn2dBlo4jr32WRajvEe8sQ3ge9SDTfOZi8uef3SE/a
         dz5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=COQ/ljg2vj2Yb48Uc5F/ApwjpjYZomFyAsXenq3lu+8=;
        b=nEIFKm8Nr033iugd71GodAdNvwAHeYf1SwbJgPfARPPWP5feBIV5STYcV0WhtGM4QO
         6QMLdBn1vtsENjy9B71Jpfq7Hm0xrTmtzPFErRZJqaPzka4Mh6ruPo/KkIyj+2+dLrAT
         p1Vj7IAFn0SMj6GXe5R69OygPfBnOlTUeM1nL1yOdjii8HL3zVQwjlQ3GvluTklf9hXl
         To/FDcqf1cC16plJux8zf/TKzpCGqRDaE/fGYAd6qkTDtwCkfoEpSj3nD59JW1MJB1pJ
         VHSy80MHZ8sWtKQaCzJZAooA+vyKoRSjzUvXOTUTzat/N64ufZ9/+TZdw0uDpLKu8DwL
         wv8A==
X-Gm-Message-State: AOAM531031ED/JDUZWfpt/VhSd6ycGOuVJQ2ImOeROdI9zupKX2C+N5d
        WKjBeJJ+e3l5bPZ6jQ9cvjI=
X-Google-Smtp-Source: ABdhPJz6Fe94PDJj8YfHE/+54/6Wg6HLfWUGWBT2GZCXoOB58iyIdxvnZBkjPj3oOwmxiw49dambvA==
X-Received: by 2002:a2e:b5da:: with SMTP id g26mr22125941ljn.348.1622577739223;
        Tue, 01 Jun 2021 13:02:19 -0700 (PDT)
Received: from [192.168.2.145] (79-139-170-222.dynamic.spd-mgts.ru. [79.139.170.222])
        by smtp.googlemail.com with ESMTPSA id w8sm11490ljj.61.2021.06.01.13.02.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jun 2021 13:02:18 -0700 (PDT)
Subject: Re: [PATCH v2 00/12] memory: tegra: Driver unification
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20210601175942.1920588-1-thierry.reding@gmail.com>
 <b7ec0fba-1eb6-62b8-837c-609327cbe541@gmail.com>
Message-ID: <43a76033-8a51-5a90-a2f8-a088c22c2b1c@gmail.com>
Date:   Tue, 1 Jun 2021 23:02:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b7ec0fba-1eb6-62b8-837c-609327cbe541@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

01.06.2021 22:38, Dmitry Osipenko пишет:
> 01.06.2021 20:59, Thierry Reding пишет:
>> From: Thierry Reding <treding@nvidia.com>
>>
>> Hi,
>>
>> this set of patches converges the feature sets of the pre-Tegra186 and
>> the post-Tegra186 memory controller drivers such that newer chips can
>> take advantage of some features that were previously only implemented
>> on earlier chips.
>>
>> Note that this looks a bit daunting from a diffstat point of view but
>> the bulk of this is in the first two patches that basically shuffle
>> around where some of the per-memory-client register definitions are
>> located, hence the big number of changed lines.
>>
>> Changes in v2:
>> - split patches up a bit for smaller, logical changes
>> - add better documentation for ->probe() callback
>> - use SET_SYSTEM_SLEEP_OPS where appropriate
>> - include Tegra194 separation patch
>> - use prefix for global variables
>> - drop commented-out code
> 
> Everything looks and works good, thank you.
> 
> I made a minor comment about the function which can be made static,
> perhaps you could improve it locally if you will take these patches via
> Tegra tree.
> 

./scripts/bloat-o-meter -d ./vmlinux.old ./vmlinux.new 
add/remove: 6/4 grow/shrink: 4/2 up/down: 2208/-240 (1968)
Data                                         old     new   delta
tegra124_mc_clients                         2948    3484    +536
tegra30_mc_clients                          2904    3432    +528
tegra114_mc_clients                         2860    3380    +520
tegra20_mc_clients                          2288    2704    +416
tegra_mc_status_names                          -     128    +128
tegra_mc_error_names                           -      32     +32
tegra30_mc_ops                                 -      20     +20
tegra20_mc_ops                                 -      20     +20
__initcall__kmod_tegra_mc__252_848_tegra_mc_init3       -       4      +4
__initcall__kmod_tegra124_emc__239_1536_tegra_emc_driver_init6       -       4      +4
__initcall__kmod_tegra_mc__252_980_tegra_mc_init3       4       -      -4
__initcall__kmod_tegra124_emc__237_1536_tegra_emc_driver_init6       4       -      -4
__func__                                   36101   36085     -16
error_names                                   32       -     -32
_rs                                        15764   15708     -56
status_names                                 128       -    -128
Total: Before=3674440, After=3676408, chg +0.05%

The +2KB in size is okay, I expected it would be worse.
