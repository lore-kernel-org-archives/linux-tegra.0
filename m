Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 553E4C433EF
	for <linux-tegra@archiver.kernel.org>; Sun, 20 Mar 2022 12:42:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245090AbiCTMnr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 20 Mar 2022 08:43:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235927AbiCTMnr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 20 Mar 2022 08:43:47 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0C591A847B
        for <linux-tegra@vger.kernel.org>; Sun, 20 Mar 2022 05:42:23 -0700 (PDT)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 563823F1FC
        for <linux-tegra@vger.kernel.org>; Sun, 20 Mar 2022 12:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647780135;
        bh=SdUWMHmZ193wUTPTiF7ipsfDvKGml1ecvzIaMqPfwIA=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=bOOcD5ULx/b2QfC2o28RQkjhFjVqi6hLXOo6NL9WTXyXFd9dk970s3z4wau945C+X
         IENBklif2QrNXb4RbQhWAjxC3IWZh8GyuyNaprPgNgo5oNBQuHanby9E5tYOPdS7lm
         pnWIf3UDze4I52X/g86RCuaAq5S/66zB+UjrEw0JGlOtxzH3YNlEE6KudbZbJZOGPK
         PoSdJ+nYG4gIooVTGnpxrIKupGt3tjXbsWimSwpgQGMBbKP6mFUuB0IGDLI23q/UOq
         /KPzc3en862eoYDqKjiE3InonyOvAfPzMMfG78jt5BBuWiPqa38TYrHcZyWCma0Fwa
         c16M9tIBRlH1w==
Received: by mail-ed1-f71.google.com with SMTP id d28-20020a50f69c000000b00419125c67f4so3150937edn.17
        for <linux-tegra@vger.kernel.org>; Sun, 20 Mar 2022 05:42:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=SdUWMHmZ193wUTPTiF7ipsfDvKGml1ecvzIaMqPfwIA=;
        b=M1ETQltlBkB6rNHXfHhknk7ZoTJzykZcVbFI/xnNkW4N3u+iGFPWaEZkv35NA3ADhu
         PkTis+mtfbucaRVK7+daWJgP5EMu8ofZ45f74f+SSQJR6BgPRp0SreEft6r2R4YPMPEp
         zwhOkxWJYq9sz7j2YXW3APhzeKFatm5fWnF80nqLV0LaXnzaTKB2K+IEb6QVc4+ZXrA1
         fq99GxQ4/Foec4eiiPv6aTHDAmG9DYX2rt2eBKzvulJtqml7ZF9y6wvSx5CEE50AsO20
         naFjeE6QVZl5KTZbys5ShQWEWcFRkSm1mqx4gViiROS+jUTn72TlH9vH5OPniDSNomU0
         LTkA==
X-Gm-Message-State: AOAM530gsgaYH6CnFCxMtpWyXOh/BBvUui+2oNbVI4aP/caLuYHo/GXM
        Q0AMSyFEsPwYIjlJYgLrHNuLGMOq+q6q31dawjs4X95vXhJg8NtINQN0LIDj3PZOXhRgcTQyBky
        08gZVKt6lYPrBACXD+6y1Y10hMcZgzTh37k30VGeu
X-Received: by 2002:a05:6402:484:b0:415:d931:cb2f with SMTP id k4-20020a056402048400b00415d931cb2fmr18507925edv.287.1647780134921;
        Sun, 20 Mar 2022 05:42:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFr8QjIsnRNA97/xRKhcXrC9HuSe14EplGK5C5xpZHxfHczzlRSkdY15/du/MsMa43QLRVZw==
X-Received: by 2002:a05:6402:484:b0:415:d931:cb2f with SMTP id k4-20020a056402048400b00415d931cb2fmr18507916edv.287.1647780134738;
        Sun, 20 Mar 2022 05:42:14 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id c14-20020a170906340e00b006ce98f2581asm5788379ejb.205.2022.03.20.05.42.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Mar 2022 05:42:14 -0700 (PDT)
Message-ID: <74db8a20-7cce-ff86-7ae4-466416443ba9@canonical.com>
Date:   Sun, 20 Mar 2022 13:42:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Patch v5 3/4] dt-bindings: memory: Update reg maxitems for
 tegra186
Content-Language: en-US
To:     Ashish Mhetre <amhetre@nvidia.com>, robh+dt@kernel.org,
        thierry.reding@gmail.com, digetx@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Cc:     vdumpa@nvidia.com, Snikam@nvidia.com
References: <20220316092525.4554-1-amhetre@nvidia.com>
 <20220316092525.4554-4-amhetre@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220316092525.4554-4-amhetre@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 16/03/2022 10:25, Ashish Mhetre wrote:
> From tegra186 onwards, memory controller support multiple channels.
> Reg items are updated with address and size of these channels.
> Tegra186 has overall 5 memory controller channels. Tegra194 and tegra234
> have overall 17 memory controller channels each.
> There is 1 reg item for memory controller stream-id registers.
> So update the reg maxItems to 18 in tegra186 devicetree documentation.
> 
> Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
> ---
>  .../nvidia,tegra186-mc.yaml                   | 20 +++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
> index 13c4c82fd0d3..3c4e231dc1de 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
> @@ -34,8 +34,8 @@ properties:
>            - nvidia,tegra234-mc
>  
>    reg:
> -    minItems: 1
> -    maxItems: 3
> +    minItems: 6
> +    maxItems: 18

Still ABI break and now the in-kernel DTS will report dt check errors.

I think you ignored the comments you got about breaking ABI.

Best regards,
Krzysztof
