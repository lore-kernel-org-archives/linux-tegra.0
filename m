Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 977F8C43470
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Apr 2021 20:03:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 748316108F
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Apr 2021 20:03:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235357AbhDAUDL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Apr 2021 16:03:11 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:45358 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235223AbhDAUDK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Apr 2021 16:03:10 -0400
Received: from mail-wr1-f72.google.com ([209.85.221.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lS1Wt-0004md-F9
        for linux-tegra@vger.kernel.org; Thu, 01 Apr 2021 17:54:51 +0000
Received: by mail-wr1-f72.google.com with SMTP id i5so3112918wrp.8
        for <linux-tegra@vger.kernel.org>; Thu, 01 Apr 2021 10:54:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4CFEk31lTBQWiiG7xpH+2x4YOILEoKb0ei8GsZfyc6M=;
        b=pIRAEqB5ppmlvHgmh8Oupm5M4zpgLvJQmvL7IMcxoU3564NgxPi5WSrRWqSrODR+IS
         QjHEbIUT3DW6HGEQyg/41a/tr6RoOFMcR1nvnHoy0gNKxCqddCElrLBPqzkiEskyvO7V
         8a4ATAfx/k7MNQztxJCMZuNNHlk1J2E+5Gyi2oWG1RBYfAteR7wBxupoxG2BBE3xuyk0
         Xed5iZ2A4hTu57nSjxuVG/9xEeURPGFu/mBIdRoIRxNitaCmO/U9aS7i3c5Zy4SNpznW
         YgmLZO+1a1BHuZ6Yv0fs5RquOjIyZABgg3IfR9/ddxamwRuckJWKkmYTQbyIIRSaNdGZ
         4K7Q==
X-Gm-Message-State: AOAM533tZmNyySQxKu6Q+JIMFQDaKT8bWS3fBy2ivVkW88+3CSabbJxV
        FlJoU0LcHw1fRChrMmbeRynjBpwAqtsT2ldA0m9+ZyFET/e+OziiufmdEKNgy0NQ10Jfo5NinWk
        zjgRSGllRZyMt3MWUjJAdoChsbTDicn4gFztWC38j
X-Received: by 2002:adf:d4ca:: with SMTP id w10mr11550913wrk.146.1617299690879;
        Thu, 01 Apr 2021 10:54:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGW8yJwE93ict/YwQPJbUO7czbRnQb9qCGHhsljP71igXkiNSeAG4zprIUYcV5sJ4fZi6pAg==
X-Received: by 2002:adf:d4ca:: with SMTP id w10mr11550902wrk.146.1617299690759;
        Thu, 01 Apr 2021 10:54:50 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id l8sm11083996wrx.83.2021.04.01.10.54.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Apr 2021 10:54:50 -0700 (PDT)
Subject: Re: [PATCH v2 0/6] NVIDIA Tegra memory improvements
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20210330230445.26619-1-digetx@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <b9bc9700-d3c1-54b4-72a3-ace4c3b9e9ed@canonical.com>
Date:   Thu, 1 Apr 2021 19:54:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210330230445.26619-1-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 31/03/2021 01:04, Dmitry Osipenko wrote:
> Hi,
> 
> This series replaces the raw voltage regulator with a power domain that
> will be managing SoC core voltage. The core power domain patches are still
> under review, but it's clear at this point that this is the way we will
> implement the DVFS support.
> 
> The remaining Tegra20 memory bindings are converted to schema. I also
> made a small improvement to the memory drivers.
> 
> Changelog:
> 
> v2: - Fixed typos in the converted schemas.
>     - Corrected reg entry of tegra20-mc-gart schema to use fixed number of items.
>     - Made power-domain to use maxItems instead of $ref phandle in schemas.
> 
> Dmitry Osipenko (6):
>   dt-bindings: memory: tegra20: emc: Replace core regulator with power
>     domain
>   dt-bindings: memory: tegra30: emc: Replace core regulator with power
>     domain
>   dt-bindings: memory: tegra124: emc: Replace core regulator with power
>     domain
>   dt-bindings: memory: tegra20: mc: Convert to schema
>   dt-bindings: memory: tegra20: emc: Convert to schema
>   memory: tegra: Print out info-level once per driver probe

Thanks, applied subset - 1-4 and 6. For patch 5/6 I expect v3.

Best regards,
Krzysztof

> 
>  .../nvidia,tegra124-emc.yaml                  |   7 +-
>  .../memory-controllers/nvidia,tegra20-emc.txt | 130 --------
>  .../nvidia,tegra20-emc.yaml                   | 294 ++++++++++++++++++
>  .../memory-controllers/nvidia,tegra20-mc.txt  |  40 ---
>  .../memory-controllers/nvidia,tegra20-mc.yaml |  79 +++++
>  .../nvidia,tegra30-emc.yaml                   |   7 +-
>  drivers/memory/tegra/tegra124-emc.c           |  12 +-
>  drivers/memory/tegra/tegra20-emc.c            |  20 +-
>  drivers/memory/tegra/tegra30-emc.c            |  18 +-
>  9 files changed, 406 insertions(+), 201 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.txt
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.yaml
> 


Best regards,
Krzysztof
