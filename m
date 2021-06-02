Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B418EC47092
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Jun 2021 07:53:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A020561042
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Jun 2021 07:53:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232263AbhFBHyu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 2 Jun 2021 03:54:50 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:45891 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229810AbhFBHyt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Jun 2021 03:54:49 -0400
Received: from mail-wm1-f71.google.com ([209.85.128.71])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1loLgW-0003aU-HA
        for linux-tegra@vger.kernel.org; Wed, 02 Jun 2021 07:53:04 +0000
Received: by mail-wm1-f71.google.com with SMTP id r15-20020a05600c35cfb029017cc4b1e9faso1832081wmq.8
        for <linux-tegra@vger.kernel.org>; Wed, 02 Jun 2021 00:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Gg5H9WVxyURb/f3UCtAlVdEEH4RFL4z76LBSyF0FWCs=;
        b=LhxIB1+S66r7tjoxfcJiR25ueIeyURZF/GB+vgy3NOUNXZ5SVfHEGyMgWWb7KcHGg0
         vsvETwksUJ/6NKGkbutk0V1SagCPE5V3vFCjigwZfy5RPG35wenQfvzhPc71VZqpRJVJ
         XtoxluKDD3E2M3o9x5mnM+uNPcQHULXGe5TuzFTPBjmfr3g+uK8x1yg8pSGQRYvPUDxr
         UVLyBHiIvGhfBnD6XaoAGzvjERw3e0oEubTBmKFn0MN5Sgrh64yDJUuxQA4VLBYbKuO2
         ZuROcVCiJD61yE3+uEcYIMsLE6tvembPJoa1PZ/II+q4iAJGbxaSzICh49T6ZTF2TUDo
         NSUw==
X-Gm-Message-State: AOAM532Gikl0EOO2jjOkj41WgkEOn/6sOtCSGhQLsG1bCXzO+/NaCxPX
        kmHUKj87/20RYvMnh6Mk0at1fvm92Ec7DkVi3phsvS4MjR3yWglmiqhOeb+LxkX+KnbkKqocCzz
        4yOpl/kyDPewW3gzqan7dM5YZNhYtVAqzssiY3Yjp
X-Received: by 2002:adf:de91:: with SMTP id w17mr7481582wrl.352.1622620384227;
        Wed, 02 Jun 2021 00:53:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkHyTd27Kww6ap+CE8qPxWKk3Oqcy8vBq6/QPz/QIyv7UfznL6HAxhNa1Z1bUUzqNwNu1jeA==
X-Received: by 2002:adf:de91:: with SMTP id w17mr7481568wrl.352.1622620384128;
        Wed, 02 Jun 2021 00:53:04 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-185-9.adslplus.ch. [188.155.185.9])
        by smtp.gmail.com with ESMTPSA id 92sm6299597wrp.88.2021.06.02.00.53.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jun 2021 00:53:03 -0700 (PDT)
Subject: Re: [PATCH v2 12/12] memory: tegra: Split Tegra194 data into separate
 file
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20210601175942.1920588-1-thierry.reding@gmail.com>
 <20210601175942.1920588-13-thierry.reding@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <59395d67-a4e1-5f47-2ced-e7b28ba66009@canonical.com>
Date:   Wed, 2 Jun 2021 09:53:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210601175942.1920588-13-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 01/06/2021 19:59, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Keep the directory structure consistent by splitting the Tegra194 data
> into a separate file.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/memory/tegra/Makefile   |    2 +-
>  drivers/memory/tegra/mc.h       |    5 +
>  drivers/memory/tegra/tegra186.c | 1349 +-----------------------------
>  drivers/memory/tegra/tegra194.c | 1353 +++++++++++++++++++++++++++++++
>  4 files changed, 1360 insertions(+), 1349 deletions(-)
>  create mode 100644 drivers/memory/tegra/tegra194.c
> 
> diff --git a/drivers/memory/tegra/Makefile b/drivers/memory/tegra/Makefile
> index 1af0fefacdda..c992e87782d2 100644
> --- a/drivers/memory/tegra/Makefile
> +++ b/drivers/memory/tegra/Makefile
> @@ -8,7 +8,7 @@ tegra-mc-$(CONFIG_ARCH_TEGRA_124_SOC) += tegra124.o
>  tegra-mc-$(CONFIG_ARCH_TEGRA_132_SOC) += tegra124.o
>  tegra-mc-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210.o
>  tegra-mc-$(CONFIG_ARCH_TEGRA_186_SOC) += tegra186.o
> -tegra-mc-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra186.o
> +tegra-mc-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra186.o tegra194.o
>  
>  obj-$(CONFIG_TEGRA_MC) += tegra-mc.o

(...)

> diff --git a/drivers/memory/tegra/tegra194.c b/drivers/memory/tegra/tegra194.c
> new file mode 100644
> index 000000000000..3ae6fbb76997
> --- /dev/null
> +++ b/drivers/memory/tegra/tegra194.c
> @@ -0,0 +1,1353 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2017-2021 NVIDIA CORPORATION.  All rights reserved.
> + */
> +
> +#include <soc/tegra/mc.h>
> +
> +#include <dt-bindings/memory/tegra194-mc.h>
> +
> +#include "mc.h"
> +
> +#if defined(CONFIG_ARCH_TEGRA_194_SOC)

Do you actually need this #ifdef? This CONFIG_ARCH... symbol is already
used in Makefile, so the unit should not be built on anything else.

Best regards,
Krzysztof
