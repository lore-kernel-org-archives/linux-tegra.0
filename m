Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95810C433ED
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Apr 2021 09:06:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 540ED60FEF
	for <linux-tegra@archiver.kernel.org>; Mon, 26 Apr 2021 09:06:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232078AbhDZJHe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 26 Apr 2021 05:07:34 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:42904 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232068AbhDZJHe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 26 Apr 2021 05:07:34 -0400
Received: from mail-wr1-f71.google.com ([209.85.221.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1laxCe-0006Hj-Nk
        for linux-tegra@vger.kernel.org; Mon, 26 Apr 2021 09:06:52 +0000
Received: by mail-wr1-f71.google.com with SMTP id t14-20020a5d6a4e0000b029010277dcae0fso18600320wrw.22
        for <linux-tegra@vger.kernel.org>; Mon, 26 Apr 2021 02:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ErqR/dZBKlqoQZd88XCSGZBJPhckTsfJSuhX+S0HNxQ=;
        b=iAJzb0jt/6c55VTTrAMeDFzYZBpar9xmJwjwSbohXqHBfAkmU7xp2R2RljMhJSpk0G
         e6o1Ey7xH27ZwVS9m2/YI12zk+Uhs1oUFM2Lo7hceTWpb7GcQS3aJ02ClT0fy9qlVm0Z
         ThZHwcb0tH7fTtvubdYqixb/78pg0b+LVe+XMokxGdaWkxV/ePlFSuLzE2sXoiJbx8jE
         awo6gcHYpXFVz4idibaNVyRGe74hRXT2OaEsWvmiOA2FVCVCkfmoE207fqB4dUp/cKbX
         mpRpfygkWOzVkj4D2hCxu9R3sJWREExdIur0g5vEFcbD3XuPs2dfRuFOzY+LDgZ67q4b
         Cj/g==
X-Gm-Message-State: AOAM532On7vYmmRPNTH7SJ13iXauN6zVpufP7gD/469bs5KYeYskTizW
        GpedJDFMVlEaxr4ee5E8zCioDFDbubKtzqCiARWflWvpBQdeOGT4L7h6jhm8vF/uM1k1+baMbsy
        evPm9t4Xbzt2kldhQyKXM00OIrCoKsM8AYdaEtiFz
X-Received: by 2002:a05:600c:3581:: with SMTP id p1mr18552772wmq.76.1619428012480;
        Mon, 26 Apr 2021 02:06:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMmaLP/460WByoIAdfb+kfmiTYrgQPx/bZhlnxKbyixKO3N27aBxQYbG8YiCXf2J+LRYYqUA==
X-Received: by 2002:a05:600c:3581:: with SMTP id p1mr18552761wmq.76.1619428012364;
        Mon, 26 Apr 2021 02:06:52 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id z66sm21243170wmc.4.2021.04.26.02.06.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Apr 2021 02:06:51 -0700 (PDT)
Subject: Re: [PATCH 00/10] memory: tegra: Driver unification
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20210420165237.3523732-1-thierry.reding@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <519a1ee4-52a3-a465-9203-b14ae10d5e49@canonical.com>
Date:   Mon, 26 Apr 2021 11:06:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210420165237.3523732-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 20/04/2021 18:52, Thierry Reding wrote:
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
> I haven't done any exhaustive testing on the series yet, but wanted to
> get some feedback on the general idea. I'll queue up this up for our
> automated testing in the coming days.
> 
> Thierry
> 
> Thierry Reding (10):
>   memory: tegra: Consolidate register fields
>   memory: tegra: Unify struct tegra_mc across SoC generations
>   memory: tegra: Push suspend/resume into SoC drivers
>   memory: tegra: Make per-SoC setup more generic
>   memory: tegra: Extract setup code into callback
>   memory: tegra: Parameterize interrupt handler
>   memory: tegra: Only initialize reset controller if available
>   memory: tegra: Unify drivers
>   memory: tegra: Add memory client IDs to tables
>   memory: tegra: Split Tegra194 data into separate file

I didn't get patch 10/10. Neither did lore.


Best regards,
Krzysztof
