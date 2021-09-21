Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B5E4C433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Sep 2021 09:47:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49B0761178
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Sep 2021 09:47:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231469AbhIUJtD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 21 Sep 2021 05:49:03 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:37388
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231392AbhIUJtD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Sep 2021 05:49:03 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 28CA840260
        for <linux-tegra@vger.kernel.org>; Tue, 21 Sep 2021 09:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632217649;
        bh=5rKGjzk2iJHCad2Wjp3hC0ji4eFCvwrD/+tacFrzJ8k=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=vA/5skv2AhSpGONKVmyMkQ0mdvb/0q2fFf2cS23DtAGLGGLzGxn34vJiK3uofJc6e
         lvK6vrVEpkUL5MIdq5htG1j67WaUbP6/iPN53MguiRQsoly3Kf24aiPI3g7dh/SdH3
         bDOFGcL57GB4EzGOI4b1eq/+pHWPr2hn0AK3UC7bOH8dwWbfnCX95qLLwHw12vD6r4
         IucZrlXccTDYR0SVXJf23+H6Wuea644ovRp0MLmUBY5igv0Y7gmhWb2IVYiveX2U5c
         98X0lU6z0rWkKDGYkvDenKPsTP6NHjj8cX1Sd/KDa8Vm09i83m5baT1h8VciLz/B0P
         EG1Am7n6gW03g==
Received: by mail-wr1-f69.google.com with SMTP id j16-20020adfa550000000b0016012acc443so2967707wrb.14
        for <linux-tegra@vger.kernel.org>; Tue, 21 Sep 2021 02:47:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5rKGjzk2iJHCad2Wjp3hC0ji4eFCvwrD/+tacFrzJ8k=;
        b=SRJyXTk0CheqSRNw3DI7orHi60VcclSwmUT8F68l5+PmLi9Wil4aJou0q1wQoFKBqt
         Gb3zPapdChEUMGzWcCxldRCdwRumoKPaGcPMKCuFL36JvBMM5mJ2F8Q+1IxQikJtWBwB
         z4GdyRIwnnGJUj/z9hkrr3192JeSyXlNj4z67t3F2fHWUHa7Pl3VYCh1jb32qvGg5vqX
         UdnZh+lVk9R74p3AqOjuFBxuWnHQM/UHMR7RvrTz4Ym8r7TZFZkupB/zEXO475pXd4FM
         rryYN54JrAQc2lFBIwxmhSEyi06VddpUYTbj06izuEvMu8gmTCJ72vFQ4iCswLWoxhfE
         zKig==
X-Gm-Message-State: AOAM531QBTyRkToOgYzaxb/Jg5tzqA4FcaWQnZFao9y8hCqCcPco9m4G
        gRbSJ+3agTC8kPOVG8pynepAh3aDn3B8Rqit/uUxYSk8nracnmSYqDX7JcKBsx4NmT9aMG3ZVqJ
        zBCy50jy9TNbgz1zEcMoALbgylGNW/WKM/7pSBCnx
X-Received: by 2002:a05:6000:1446:: with SMTP id v6mr22861380wrx.427.1632217648437;
        Tue, 21 Sep 2021 02:47:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXbt7WJCDbRxN7MmrFcZT05y5pNeN7cJzgv+q+PfXKrPjjdcyoJra4XLP1MTSr212NN2xIDA==
X-Received: by 2002:a05:6000:1446:: with SMTP id v6mr22861355wrx.427.1632217648229;
        Tue, 21 Sep 2021 02:47:28 -0700 (PDT)
Received: from [192.168.0.134] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id s14sm18498932wrp.84.2021.09.21.02.47.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Sep 2021 02:47:26 -0700 (PDT)
Subject: Re: [PATCH V1 3/3] dt-bindings: tegra: clock,memory,thermal: add
 header Copyright
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
 <20210921094206.2632-4-bbiswas@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <de4ad32b-ab60-a4dd-793f-9bd520ed5a87@canonical.com>
Date:   Tue, 21 Sep 2021 11:47:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210921094206.2632-4-bbiswas@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 21/09/2021 11:42, Bitan Biswas wrote:
> Add Copyright for below Tegra dt-bindings headers:
> 1. clock
> 2. gpio
> 3. mailbox
> 4. memory
> 5. thermal
> 6. reset
> 7. pinctrl

Why? Please explain.

These are trivial constants, so I doubt there is here any copyright value.

> 
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> ---
>  include/dt-bindings/clock/tegra114-car.h            | 4 ++++
>  include/dt-bindings/clock/tegra124-car-common.h     | 4 ++++
>  include/dt-bindings/clock/tegra124-car.h            | 4 ++++
>  include/dt-bindings/clock/tegra186-clock.h          | 6 ++++++
>  include/dt-bindings/clock/tegra20-car.h             | 4 ++++
>  include/dt-bindings/clock/tegra210-car.h            | 4 ++++
>  include/dt-bindings/clock/tegra30-car.h             | 4 ++++
>  include/dt-bindings/gpio/tegra-gpio.h               | 4 ++++
>  include/dt-bindings/gpio/tegra186-gpio.h            | 4 ++++
>  include/dt-bindings/mailbox/tegra186-hsp.h          | 4 ++++
>  include/dt-bindings/memory/tegra114-mc.h            | 6 ++++++
>  include/dt-bindings/memory/tegra124-mc.h            | 6 ++++++
>  include/dt-bindings/memory/tegra186-mc.h            | 6 ++++++
>  include/dt-bindings/memory/tegra194-mc.h            | 6 ++++++
>  include/dt-bindings/memory/tegra210-mc.h            | 6 ++++++
>  include/dt-bindings/memory/tegra30-mc.h             | 6 ++++++
>  include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h    | 6 ++++++
>  include/dt-bindings/reset/tegra124-car.h            | 4 ++++
>  include/dt-bindings/reset/tegra210-car.h            | 4 ++++
>  include/dt-bindings/thermal/tegra124-soctherm.h     | 4 ++++
>  include/dt-bindings/thermal/tegra186-bpmp-thermal.h | 4 ++++
>  include/dt-bindings/thermal/tegra194-bpmp-thermal.h | 4 ++++
>  22 files changed, 104 insertions(+)
> 

(...)

> @@ -1,5 +1,9 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
>  /*
> + * Copyright (c) 2016-2021, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
> + *
> + * Author: Joseph Lo <josephl@nvidia.com>
> + *
>   * This header provides constants for binding nvidia,tegra186-hsp.
>   */
>  
> diff --git a/include/dt-bindings/memory/tegra114-mc.h b/include/dt-bindings/memory/tegra114-mc.h
> index dfe99c8a5ba5..1a2d16853847 100644
> --- a/include/dt-bindings/memory/tegra114-mc.h
> +++ b/include/dt-bindings/memory/tegra114-mc.h
> @@ -1,4 +1,10 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2014-2021, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
> + *
> + * Author: Thierry Reding <treding@nvidia.com>
> + *
> + */
>  #ifndef DT_BINDINGS_MEMORY_TEGRA114_MC_H
>  #define DT_BINDINGS_MEMORY_TEGRA114_MC_H
>  
> diff --git a/include/dt-bindings/memory/tegra124-mc.h b/include/dt-bindings/memory/tegra124-mc.h
> index 7e73bb400eca..8a7abf2325b6 100644
> --- a/include/dt-bindings/memory/tegra124-mc.h
> +++ b/include/dt-bindings/memory/tegra124-mc.h
> @@ -1,4 +1,10 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2014-2021, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
> + *
> + * Author: Thierry Reding <treding@nvidia.com>
> + *
> + */
>  #ifndef DT_BINDINGS_MEMORY_TEGRA124_MC_H
>  #define DT_BINDINGS_MEMORY_TEGRA124_MC_H
>  
> diff --git a/include/dt-bindings/memory/tegra186-mc.h b/include/dt-bindings/memory/tegra186-mc.h
> index be313d3790ae..283ea29bf426 100644
> --- a/include/dt-bindings/memory/tegra186-mc.h
> +++ b/include/dt-bindings/memory/tegra186-mc.h
> @@ -1,4 +1,10 @@
>  /* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2017-2021, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
> + *
> + * Author: Thierry Reding <treding@nvidia.com>
> + *
> + */
>  #ifndef DT_BINDINGS_MEMORY_TEGRA186_MC_H
>  #define DT_BINDINGS_MEMORY_TEGRA186_MC_H
>  
> diff --git a/include/dt-bindings/memory/tegra194-mc.h b/include/dt-bindings/memory/tegra194-mc.h
> index 16bb62bf8166..30182fd94f0f 100644
> --- a/include/dt-bindings/memory/tegra194-mc.h
> +++ b/include/dt-bindings/memory/tegra194-mc.h
> @@ -1,4 +1,10 @@
>  /* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2020-2021, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
> + *
> + * Author: Thierry Reding <treding@nvidia.com>
> + *
> + */
>  #ifndef DT_BINDINGS_MEMORY_TEGRA194_MC_H
>  #define DT_BINDINGS_MEMORY_TEGRA194_MC_H
>  
> diff --git a/include/dt-bindings/memory/tegra210-mc.h b/include/dt-bindings/memory/tegra210-mc.h
> index 5e082547f179..c4e3ba88f77b 100644
> --- a/include/dt-bindings/memory/tegra210-mc.h
> +++ b/include/dt-bindings/memory/tegra210-mc.h
> @@ -1,4 +1,10 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2015-2021, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
> + *
> + * Author: Thierry Reding <treding@nvidia.com>
> + *
> + */
>  #ifndef DT_BINDINGS_MEMORY_TEGRA210_MC_H
>  #define DT_BINDINGS_MEMORY_TEGRA210_MC_H
>  
> diff --git a/include/dt-bindings/memory/tegra30-mc.h b/include/dt-bindings/memory/tegra30-mc.h
> index 930f708aca17..4972cf7e3cf2 100644
> --- a/include/dt-bindings/memory/tegra30-mc.h
> +++ b/include/dt-bindings/memory/tegra30-mc.h
> @@ -1,4 +1,10 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2014-2021, NVIDIA CORPORATION & AFFILIATES. All rights reserved.
> + *
> + * Author: Thierry Reding <treding@nvidia.com>
> + *

I am sorry, but that's not entirely how it works. You cannot add only
selected (stripped) copyrights backwards. If adding, please include all
copyright holders.


Best regards,
Krzysztof
