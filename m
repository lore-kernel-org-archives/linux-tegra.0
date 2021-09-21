Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43431C433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Sep 2021 11:35:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 245966120A
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Sep 2021 11:35:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232434AbhIULg3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 21 Sep 2021 07:36:29 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:40276
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232427AbhIULg0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Sep 2021 07:36:26 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8C3C34019A
        for <linux-tegra@vger.kernel.org>; Tue, 21 Sep 2021 11:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632224097;
        bh=3qq/eN4U25uXpOowfjqd2mOALCyRisNs/QeVz3su/sU=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=JCYq9Pvyp/J7JyM7sY/K3BGTs5uwveg8bVZYQ/Gf5jnbd5NjxkkC0VtFDsLpFgZk4
         8Sactl8W7kztZ75eOl3GhO8WbEeiYY36IqWJr1n4zJzDi5Lugxlpc7xy1WDLPcCZIE
         /rlmRa+0/T4ZbiGP7CwM1jBu1941wwA1clOuxZWL8mTIO+7I4teufTVKO7zPMUFCA4
         VpYbbvk7x5J1oQu3L0eKTHgtkLCrqVHMHXbkgn9BbL0+5ATtu8IjU9NGmYRYsxJjil
         bx+ohxXZlsS30YZRpS81C919J+TYQwWhOE2o6sSsPZI5DigbBvNux8/FPUMJXZN1nn
         DSfBoQZEbbHEA==
Received: by mail-wr1-f72.google.com with SMTP id j16-20020adfa550000000b0016012acc443so3187333wrb.14
        for <linux-tegra@vger.kernel.org>; Tue, 21 Sep 2021 04:34:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3qq/eN4U25uXpOowfjqd2mOALCyRisNs/QeVz3su/sU=;
        b=FXLY+Pkm8HonyZPsxpvd72qurl3qspRh1kNI+tFsLHKH2ch3X/Dv044TxUCXBBH0gg
         Q72s6rU5LAxKMOptKGNuU8nFINsoQdHQaT5qf6zqAJ2A9jHFKE2a91IB3dripU6c2zAy
         ERHmiq5Ip0WhLZmYHiMHbv5OlORLtYdkODjPu9ELUoMKYLS8rFfd+lypRTH0toInnwKs
         WVzdU7Fdb2w3E1AtiqBdzXndMFU+s/jocZPmnhf16S1kBmxIROU7AvVLByLgDm8ahPs7
         3ATH51s92a7f8kNIcfQVXFiaTrj4mUVynXKOwog6sH731OKr1sYAeGKy242ljP6QVMiT
         FmBg==
X-Gm-Message-State: AOAM531xkS3lLgI6FzcUKQU+xnuNZgsw1cH6w2B3kKhZrkBmbzxXQ1qf
        PxUcKTxLsMbbGsN8gRqFUMB+D4ZcLgVR2u0SueWS8XVfJQztdpFcAbQyfEOq8iTgOt+/boS1Ps4
        FXUPS9yrkwyOyg0xvUs9GOvMehwtUpJSXam5rDypV
X-Received: by 2002:a05:600c:225a:: with SMTP id a26mr4218678wmm.57.1632224096957;
        Tue, 21 Sep 2021 04:34:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxp02VQL/BqP2bBl5NT9zOKeZStP0pv824t2d6ns4gFKUDtsZcT5G6OGk+kUxEE1DpGLt0jIg==
X-Received: by 2002:a05:600c:225a:: with SMTP id a26mr4218662wmm.57.1632224096779;
        Tue, 21 Sep 2021 04:34:56 -0700 (PDT)
Received: from [192.168.0.134] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id y197sm3016215wmc.18.2021.09.21.04.34.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Sep 2021 04:34:56 -0700 (PDT)
Subject: Re: [PATCH V1 1/3] dt-bindings: tegra: memory,bpmp-thermal: add SPDX
 license
To:     Bitan Biswas <bbiswas@nvidia.com>, robh+dt@kernel.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        rostedt@goodmis.org, mingo@redhat.com, jassisinghbrar@gmail.com,
        p.zabel@pengutronix.de
Cc:     skomatineni@nvidia.com, broonie@kernel.org,
        linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20210921112716.3007-1-bbiswas@nvidia.com>
 <20210921112716.3007-2-bbiswas@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <c2ec765c-f881-17ea-3f9c-cf83ea0313f5@canonical.com>
Date:   Tue, 21 Sep 2021 13:34:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921112716.3007-2-bbiswas@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 21/09/2021 13:27, Bitan Biswas wrote:
> Add Dual licensing SPDX license identifier for tegra186,tegra194
> memory and bpmp-thermal headers.
> 
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> ---
>  include/dt-bindings/memory/tegra186-mc.h            | 1 +
>  include/dt-bindings/memory/tegra194-mc.h            | 1 +
>  include/dt-bindings/thermal/tegra186-bpmp-thermal.h | 1 +
>  include/dt-bindings/thermal/tegra194-bpmp-thermal.h | 1 +
>  4 files changed, 4 insertions(+)
> 

Hi,

It seems you sent the same patchset twice. I already responded to all
three patches.

Best regards,
Krzysztof
