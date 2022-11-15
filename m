Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CDB1C4167B
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Nov 2022 12:15:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230301AbiKOMPn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Nov 2022 07:15:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238259AbiKOMPj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Nov 2022 07:15:39 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ACC820181
        for <linux-tegra@vger.kernel.org>; Tue, 15 Nov 2022 04:15:36 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id h12so17244583ljg.9
        for <linux-tegra@vger.kernel.org>; Tue, 15 Nov 2022 04:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=spp9dkHGZgQDodLByXAhVTEFyPemlJZRHAN1Y7nBNVg=;
        b=ymUYv/Oi6G8aiGdWofIyBdj8GVJ2K/0VU+eb7/Nqt7gB5gZciBnHZJLMeNa0ZtjHZP
         T59m1RJ6vl8+hyKQ9wwaXLL9HibIjD6mEmV9q261LPfLveDJsDx8lEVUfrkLh6UX9o5M
         feMh1R9AuXDxBLrDCNyyv34iJqtw75cIyYkRCJ0zDt+yqVRhBwFhoZd+pjzUH1hXn7kh
         XTQJdi/7HPP8h1zQ4I8+sy6PWW4psEuetF5BuW3omjXJjBgjD0YHb+yUfwXO1YOBC0ax
         w/BPIaYC6+CHBD6fyGpCw9IbLelOusgSzPQl5zEurdmP+PgzJ3YT1h86UKw1pz5HJRwv
         edFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=spp9dkHGZgQDodLByXAhVTEFyPemlJZRHAN1Y7nBNVg=;
        b=yWsqpMrYZHeY5pEnbWkOQxjhDO2f22pMqk8WmzjPGj5PH4XKGZJWhaRKe+AuzuprHV
         lsaWXkIczKnGNUnehV8MC4aVm9cWXdelMxva/E9A3ayzi+hJszCPhKXjv0ZblnFgJhrE
         hWn5wwS9adVcaIHYuYHdOrlHA8QpftwnF5kdK2wL1laerJM6O25FChHcDWzzA60JAxGW
         dn2Wrx4QSDtVw4Gu0mCEw71HMcmecRVYGisGHC+946fpvtFTKwYd0aNGceCe6cF/d5fg
         Sy6GhomjUh+1FV2jrAEuq9ptcQP5HYtUsvtJjocB4PExLi8XZ/PFBt+DJ/vD6P1JaKZA
         dWdw==
X-Gm-Message-State: ANoB5plcHmYWM6AJgqIO9KXXINQrI2jqQDqQc3VTry7C7LrePYTE6F0X
        Q8kp0QK21frdY9i1u96CidJfZw==
X-Google-Smtp-Source: AA0mqf5kyq1KoTRqo1s4x36SAW+o4nEZ0jyMBBgN4JjqAOehEVO/C2NjL3odDI1zFExO9EeV2XWumA==
X-Received: by 2002:a2e:978c:0:b0:278:f59a:c7cf with SMTP id y12-20020a2e978c000000b00278f59ac7cfmr4559051lji.72.1668514534738;
        Tue, 15 Nov 2022 04:15:34 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id f14-20020a056512360e00b004a45edc1de2sm2173307lfs.239.2022.11.15.04.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 04:15:34 -0800 (PST)
Message-ID: <eae67ed0-fb60-a825-2ac5-a18a37acd7d3@linaro.org>
Date:   Tue, 15 Nov 2022 13:15:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 02/23] dt-bindings: display: tegra: vi: add 'vip' property
 and example
Content-Language: en-US
To:     luca.ceresoli@bootlin.com, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dmitry Osipenko <digetx@gmail.com>
Cc:     linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Richard Leitner <richard.leitner@skidata.com>
References: <20221109141852.729246-1-luca.ceresoli@bootlin.com>
 <20221109141852.729246-3-luca.ceresoli@bootlin.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221109141852.729246-3-luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 09/11/2022 15:18, luca.ceresoli@bootlin.com wrote:
> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> The Tegra20 VI peripheral can receive parallel input from the VIP parallel
> input module. Add it to the allowed properties and augment the existing
> nvidia,tegra20-vi example to show a 'vip' property.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  .../display/tegra/nvidia,tegra20-vi.yaml      | 68 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 69 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
> index 782a4b10150a..aab795241dd6 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml
> @@ -74,6 +74,22 @@ properties:
>    avdd-dsi-csi-supply:
>      description: DSI/CSI power supply. Must supply 1.2 V.
>  
> +  vip:
> +    $ref: /schemas/display/tegra/nvidia,tegra20-vip.yaml
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Input from the VIP (parallel input capture) module
> +
> +        properties:
> +          endpoint:
> +            $ref: /schemas/graph.yaml#/properties/endpoint
> +
>  patternProperties:
>    "^csi@[0-9a-f]+$":
>      type: object
> @@ -109,6 +125,22 @@ examples:
>      #include <dt-bindings/clock/tegra20-car.h>
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>  
> +    i2c3 {

Just "i2c"

With above:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

