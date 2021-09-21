Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADE86C433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Sep 2021 09:49:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96DE961183
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Sep 2021 09:49:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231532AbhIUJvG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 21 Sep 2021 05:51:06 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:37452
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231524AbhIUJvD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Sep 2021 05:51:03 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 19BFD40257
        for <linux-tegra@vger.kernel.org>; Tue, 21 Sep 2021 09:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632217771;
        bh=TC8to0fdr9vxFSQxicA3tEJVkEMx8qYFCoQHA/EWSRQ=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=B0ri3zaj7BZc7AwccJ3k9mn8Q5+7POL0YCf+ebxyQ6U6bo5xhFLvjUAFVW/jzWw30
         bEZcpJy5VIP4eMzT+BYZwe6R+ndBTeVthkouPvWYqxKjq1mTXMOvxMFuv3Cbsiq+Ex
         cI+Q0fNJGbnqBfP/u8JyAptkJPn7pSzgvekzbQxUGFT0CcaOjLst6nBLYI6S7eXEp5
         Wyznhj3qh0XG2sg05XqcvZygTPDIFWtV1ahX7JAWwOALCc57zRogPsP8/2g5Ruu+FX
         pMiZneIXrkEJtxK3rQtvuwHqQLyhxq/hm/KZcuGcpGaAEIDG0mXWf2cdX70G7vakHG
         seOtudxfw6ucQ==
Received: by mail-wr1-f70.google.com with SMTP id r9-20020a5d4989000000b0015d0fbb8823so8322903wrq.18
        for <linux-tegra@vger.kernel.org>; Tue, 21 Sep 2021 02:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TC8to0fdr9vxFSQxicA3tEJVkEMx8qYFCoQHA/EWSRQ=;
        b=JK+X1CmJCURsOKvY55qLM/6YvxhLAlVvTYMpvclQOhg7/NlzzNkz9GwhpfRxjI2bNi
         goj1n8QaZpJZgDGmx3YHalRlXixRomiaVGdQe4ASKN+yPjiTqli6EeQ3P6HAAorgtpi4
         YSDFqlkYasFvbWbU3SpbraR8+Ewc4wqycWFjHmw83xPT6BkW49/2m7v8sl84q89bupCK
         FHX8DWlPOX23pmQ2ecWwoi0I7ypQi+IVj6uuRDeV3AG7tNFw+B8ZaKgBW5i15kkIQeRW
         ufy6c+m/nEMFloNBX5XdgkH7+EPgiOEjM5zQc6m6XKwQwwRXXJx82lDEe7OhZAgikRTn
         LTUQ==
X-Gm-Message-State: AOAM530Va844CEl1ggtBfj638PboMdAMG3hysCOVWE92kcqs5msE0DZJ
        DUPzJ8oYLpuOg7u7s6Oo5AzD+Hef//HrIl7DXFAgwafuMuNL/mQdkWymLne2I8CE603lTYCG3Wp
        HmhocB1B1/ylwMTMUI8OkWjqfBVeRpYix7YzgDGa5
X-Received: by 2002:adf:e6d0:: with SMTP id y16mr33331517wrm.284.1632217769962;
        Tue, 21 Sep 2021 02:49:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQF/TUirez5540bL5zNEt/2NcRjxdz50w7vq6r7Er4fKkMq96l4CT6K2GEozMAHCojeKegcg==
X-Received: by 2002:adf:e6d0:: with SMTP id y16mr33331492wrm.284.1632217769817;
        Tue, 21 Sep 2021 02:49:29 -0700 (PDT)
Received: from [192.168.0.134] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id j134sm2798987wmj.27.2021.09.21.02.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Sep 2021 02:49:29 -0700 (PDT)
Subject: Re: [PATCH V1 1/3] dt-bindings: tegra: memory,bpmp-thermal: add SPDX
 license
To:     Bitan Biswas <bbiswas@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20210921094206.2632-1-bbiswas@nvidia.com>
 <20210921094206.2632-2-bbiswas@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <176ba3a3-5179-56b6-081a-6c93493b207b@canonical.com>
Date:   Tue, 21 Sep 2021 11:49:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921094206.2632-2-bbiswas@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 21/09/2021 11:42, Bitan Biswas wrote:
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
> diff --git a/include/dt-bindings/memory/tegra186-mc.h b/include/dt-bindings/memory/tegra186-mc.h
> index 82a1e27f7357..be313d3790ae 100644
> --- a/include/dt-bindings/memory/tegra186-mc.h
> +++ b/include/dt-bindings/memory/tegra186-mc.h
> @@ -1,3 +1,4 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>  #ifndef DT_BINDINGS_MEMORY_TEGRA186_MC_H
>  #define DT_BINDINGS_MEMORY_TEGRA186_MC_H
>  

The files were licensed as GPL-2.0 only, so you are effectively
re-licensing them. I guess this is ok, as you act on behalf of copyright
holders, but please state it in the commit message.

Best regards,
Krzysztof
