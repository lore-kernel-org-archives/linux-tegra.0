Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 574D5C4708F
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Jun 2021 19:38:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 41B58613BD
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Jun 2021 19:38:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234638AbhFATkD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 1 Jun 2021 15:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233397AbhFATkC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Jun 2021 15:40:02 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC247C061574
        for <linux-tegra@vger.kernel.org>; Tue,  1 Jun 2021 12:38:19 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id f11so14712829lfq.4
        for <linux-tegra@vger.kernel.org>; Tue, 01 Jun 2021 12:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iEnBuHM/1NF/Bdbx1YtpZC3K3uwpbZMCJ62iKc60kqs=;
        b=E/YHImmoZDnL2w9Cpwr5yNFgVHoP90JuAUdbXeRQ66aua4Fn8sAmVwuXaBqR/RPbOj
         NOIile1i8dc/IxftfE7TpL/XhA4TUVpBurP5YZrOLD53YBmta4eE+KrE/0PiO3erMwS9
         g4a2jtYsYuCO9CCrYRjXYfYClbK5aIvnm6CB4Yfur9ugY8gpo4CG0H0BG0wjGNZWQUHP
         N3m+ugM/Y826Nb4r90KfKcdgjdnRbqDVMI4upzmZHSHoBpN1r+jFa/l2F2LfUWmhjFn+
         0H6GkxIv4BUCwVESIG4lp9xSLqXjCoTgCQ9lckA3zHI4NXb9jkAx4W1MN6IJfHTW4ANE
         EAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iEnBuHM/1NF/Bdbx1YtpZC3K3uwpbZMCJ62iKc60kqs=;
        b=BlfZoxbEdtNGdu+Xg6sKIMe6eDvmvPlgi5SkRqhKGIaLclK/oOtwqBg6f0tnD3bElU
         Vj4rCmYkcRW8JG//GIKPuzgIGYXBJFsUGLxOjh0iXnBfFzDjDqJSjQo+Hcoef5oGWxYL
         u/ZlWffpE4XLGNWIwDTzfxCGBkbKpvqGXaawgZIRIFw/mUSJtsId2kS6fRLkF49HP3Wm
         WXn66HTGO+GLtFO2Oew+CJPxNAWEUuSku6j4oUxq+ZnFswtX8x6KdXfc699iYu/RZWpB
         azka3qoJp8ZgMw7M8aHG1Req4sqEkoA0m1sELg28POBaMuhGlxNv/3haHDsoVT9EOYcV
         4ZKQ==
X-Gm-Message-State: AOAM532tyO3DsMppcgc3XMyla275nLK88McHrYglFVUHJQVGHL129F3d
        Qp7kpj89kJNEQmOaMiuwvkw=
X-Google-Smtp-Source: ABdhPJy/fCtN3WWo1PhwX7DujK8Xd7FF5me1Iyag6Zq0YoK9rTreKRhVaB3bcKdw4jJb2xgGHjsmJg==
X-Received: by 2002:a05:6512:3d17:: with SMTP id d23mr5943061lfv.596.1622576298244;
        Tue, 01 Jun 2021 12:38:18 -0700 (PDT)
Received: from [192.168.2.145] (79-139-170-222.dynamic.spd-mgts.ru. [79.139.170.222])
        by smtp.googlemail.com with ESMTPSA id i12sm250980lfe.86.2021.06.01.12.38.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jun 2021 12:38:17 -0700 (PDT)
Subject: Re: [PATCH v2 00/12] memory: tegra: Driver unification
To:     Thierry Reding <thierry.reding@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20210601175942.1920588-1-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b7ec0fba-1eb6-62b8-837c-609327cbe541@gmail.com>
Date:   Tue, 1 Jun 2021 22:38:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210601175942.1920588-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

01.06.2021 20:59, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> Hi,
> 
> this set of patches converges the feature sets of the pre-Tegra186 and
> the post-Tegra186 memory controller drivers such that newer chips can
> take advantage of some features that were previously only implemented
> on earlier chips.
> 
> Note that this looks a bit daunting from a diffstat point of view but
> the bulk of this is in the first two patches that basically shuffle
> around where some of the per-memory-client register definitions are
> located, hence the big number of changed lines.
> 
> Changes in v2:
> - split patches up a bit for smaller, logical changes
> - add better documentation for ->probe() callback
> - use SET_SYSTEM_SLEEP_OPS where appropriate
> - include Tegra194 separation patch
> - use prefix for global variables
> - drop commented-out code

Everything looks and works good, thank you.

I made a minor comment about the function which can be made static,
perhaps you could improve it locally if you will take these patches via
Tegra tree.
