Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DD4AC433F5
	for <linux-tegra@archiver.kernel.org>; Sun, 12 Dec 2021 18:50:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231986AbhLLSu3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 12 Dec 2021 13:50:29 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:48754
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231149AbhLLSu2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 12 Dec 2021 13:50:28 -0500
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 66DD63F1AA
        for <linux-tegra@vger.kernel.org>; Sun, 12 Dec 2021 18:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639335027;
        bh=hEPUkc4LL4i/gGwaF5ugHQxC2zekuBT7zmaD1tTpKNA=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=MdM54K5osfJ4ehktXQ9zZnoaui3oXBZEca8rl/t/H1IWIW1kJfLmzMExhJvR1JPqj
         F768yGGQphZoyXjld3S3swglc6AMReDEZPU4dSLZmNQP7EiHDxdk+52ClGrLzF5m1m
         NxNG1EJpLdAssHXRN98pw/ktESyy8u6S1gTHb8jHCYBpP2VxG5sRJy8jUTMEt+8juB
         QBzV28RXoBJrLGjhqtOKRaoDpRKVKcMOGloC/1hkvpYb0MGUiOrLnYInncvPtubZJE
         fZluYvm4gl3+ga/iiz99Q8t34GZu2wfTHZgkGQZkF08uniuRWQmXMFiMdGX51UELnv
         RgSeHyvmooEVw==
Received: by mail-lf1-f72.google.com with SMTP id k17-20020a05651239d100b0041c32e98751so6502817lfu.10
        for <linux-tegra@vger.kernel.org>; Sun, 12 Dec 2021 10:50:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hEPUkc4LL4i/gGwaF5ugHQxC2zekuBT7zmaD1tTpKNA=;
        b=Vr30mq0k72ouz7P19qetPukqcAFYyiWYZsXnkMlPKIl5wfasmP+V0raeSooiXpQqgt
         0dweYuD18Q+x8EwRf/EYW/ko7CLIwFMsZvy1M4HPF0g45X9xEf3YB2+pujXnBDNoDGcm
         VMjcw8w6W7H0CfPdLx8rlVCkFUHxsH9xiHaBvl4fYZ8eGjxyk7K3cVyb0/lQVsAXIipe
         b288aelN3MSofct3ecvBc1SB650PJLwSwWZH2pHlIyiS/G7cJmo2AI39Z3ZQrO1GetTX
         TuHS35qh6CEtCBVvbAY/wkWQmqTGBEqtc4KEPgd931LZWmaHFJn/E7nN2LRiaphq/XT/
         ACGQ==
X-Gm-Message-State: AOAM5321brwSDCE/uX/NDCNJNA3mgQzTsBBmVGle0PQsevdajLZoETZB
        lHH1UgcIUcyVD/eFjr8uR+M6ieCLDsg8A3+OW6FA0pqo42n5FhSskRR6sXabjYgP22BCQFqV5tV
        VZec3/WaEpSxmzqFcWv8GRBjYQAeZdDnWo7sg61OJ
X-Received: by 2002:a05:6512:3a7:: with SMTP id v7mr1580889lfp.38.1639335026765;
        Sun, 12 Dec 2021 10:50:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjknyFs69XnefPUpSdk+caKnTh6qWLgyrLozHO1KCEUN/kRatVQ59NwitqYuKpsN2ATYd1Ag==
X-Received: by 2002:a05:6512:3a7:: with SMTP id v7mr1580882lfp.38.1639335026615;
        Sun, 12 Dec 2021 10:50:26 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id b7sm1124779lfb.224.2021.12.12.10.50.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Dec 2021 10:50:26 -0800 (PST)
Message-ID: <77efa5e3-f6bd-9892-8bf2-427b4709329f@canonical.com>
Date:   Sun, 12 Dec 2021 19:50:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 1/6] dt-bindings: memory: tegra: Document
 #interconnect-cells property
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211210164741.881161-1-thierry.reding@gmail.com>
 <20211210164741.881161-2-thierry.reding@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211210164741.881161-2-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 10/12/2021 17:47, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The #interconnect-cells properties are required to hook up memory
> clients to the MC/EMC in interconnects properties. Add a description for
> these properties.
> 
> Also, allow multiple reg and interrupt entries required by Tegra194 and
> later.

I think number of interrupts is fixed and you do not change them for
newer SoC, so the message is a little bit not precise. Also the subject
does not it the patch - maybe something like - "adjust properties for
Tegra196"?

> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - drop incomplete BPMP snippet from example
> - explicitly set minItems for reg property
> - describe MC and EMC general interrupts
> 
>  .../nvidia,tegra186-mc.yaml                   | 78 ++++++++++++++++---
>  1 file changed, 67 insertions(+), 11 deletions(-)
> 



Best regards,
Krzysztof
