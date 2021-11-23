Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9560CC433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Nov 2021 19:53:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234702AbhKWT5D (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Nov 2021 14:57:03 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:51494
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233563AbhKWT5A (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Nov 2021 14:57:00 -0500
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A8B2D3FFEC
        for <linux-tegra@vger.kernel.org>; Tue, 23 Nov 2021 19:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1637697231;
        bh=4Zq6MbMn9LAKCplJdBRxuSWyKxaV4rsKVk4jv6quK5c=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=gnCMy4xpQXoPLkz6J172mbFSDUjqv6YFpogCpfr1BewGuUk75liw8sKOORshx2m+n
         fjKiIrtN0ZTXx2ZrW+mx1khkicB7FyqgdMUGp3GKUq2fbaD42gtpaHp242uhs1zURF
         Gk/Di4V6OUUzKZkZmr+uFzjktndVP1o7zcaYTQRHbv1cSboW9QWcvSyrPcwShjkHxg
         T1Rh2zQvlYABJZASRhV7Kj5Ly8prQSP1nXEncK5yZEJy8sGRBwAraPOVLszGGff5ox
         Kd0LyND1bPlnoCIRCyBp8kiPxmVRL4WymouCWIBl3Erg3jSVM2Yw2ixVfJnCGqZSXY
         n9hT1BDtFJq1Q==
Received: by mail-lj1-f200.google.com with SMTP id q13-20020a2e750d000000b00218c953d0b8so71841ljc.21
        for <linux-tegra@vger.kernel.org>; Tue, 23 Nov 2021 11:53:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4Zq6MbMn9LAKCplJdBRxuSWyKxaV4rsKVk4jv6quK5c=;
        b=yd/iLKWexoyACPfUTjRgaCMXtaHgjWqKqurYMA/ibgT9iRm9dlKUnjJ9ZBA75etPOk
         b4QCx/G7FQs07o0pwgms2MhlbOHKqZee0hSUV1oyCTKGRvHTE8yDnYoqE0zqs5UzCgtN
         amuO2ERUxej3yHyO56U9zm6mangBWfvniLbZylcv+HD53NxuxuGusq0KzPhRoMXDPpfg
         BYAcAlylqOddnzhqtSZ7fw8yGba2nYso+LjUEWC957C8uYZNZyNxCWBPH//xbuP36n33
         IzLGCCQFOJcX3nD5MigUfLJjMh+FDxB2/enFKupjbjPLxnf1W/GJuhynUfYg8BKXCRjW
         62Ug==
X-Gm-Message-State: AOAM53385jbg3tiSCNfSsde/4/LZOPdr7+igt/RL0i6jqut1xoUGZFDs
        dmNrC1RBSCdgdZ6iUWr93W1yMfmyZk0aCQbetEtLv+z/NdKY4Dpl6rvmraRPUsLc8uaQsWYXPUr
        o/CIL3jXAUyPB7O+/7W8+npL1dgzztuMI7PmBK2U0
X-Received: by 2002:a05:651c:112e:: with SMTP id e14mr8194460ljo.466.1637697230902;
        Tue, 23 Nov 2021 11:53:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjemlMI5EI99fhPJ9HY1rGImyRQTf2YT7NsQhHh6pN6UU71Nlm9uSU8jk1Fwr3K+pMROZHYQ==
X-Received: by 2002:a05:651c:112e:: with SMTP id e14mr8194441ljo.466.1637697230737;
        Tue, 23 Nov 2021 11:53:50 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id c34sm1389638lfv.83.2021.11.23.11.53.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 11:53:50 -0800 (PST)
Message-ID: <3ccecc07-5e76-125a-8bcb-12219af5983c@canonical.com>
Date:   Tue, 23 Nov 2021 20:53:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 1/5] dt-bindings: memory: tegra: Document
 #interconnect-cells property
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211112130627.3682795-1-thierry.reding@gmail.com>
 <20211112130627.3682795-2-thierry.reding@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211112130627.3682795-2-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 12/11/2021 14:06, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The #interconnect-cells properties are required to hook up memory
> clients to the MC/EMC in interconnects properties. Add a description for
> these properties.
> 
> Also, allow multiple reg and interrupt entries required by Tegra194 and
> later.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../memory-controllers/nvidia,tegra186-mc.yaml       | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
> index 611bda38d187..f6e4af4e86cf 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
> @@ -33,10 +33,10 @@ properties:
>            - nvidia,tegra194-mc
>  
>    reg:
> -    maxItems: 1
> +    maxItems: 3
>  
>    interrupts:
> -    maxItems: 1
> +    maxItems: 2

All these here and reg below might need if-else to define when one item
is allowed, when not. For example - can nvidia,tegra234-mc come with
only one reg?

Except this and Rob's DT-checker-bot rest of patches look ok to me.


Best regards,
Krzysztof

>  
>    "#address-cells":
>      const: 2
> @@ -48,6 +48,9 @@ properties:
>  
>    dma-ranges: true
>  
> +  "#interconnect-cells":
> +    const: 1
> +
>  patternProperties:
>    "^external-memory-controller@[0-9a-f]+$":
>      description:
> @@ -65,7 +68,7 @@ patternProperties:
>                - nvidia,tegra194-emc
>  
>        reg:
> -        maxItems: 1
> +        maxItems: 2
>  
>        interrupts:
>          maxItems: 1
> @@ -78,6 +81,9 @@ patternProperties:
>          items:
>            - const: emc


Best regards,
Krzysztof
