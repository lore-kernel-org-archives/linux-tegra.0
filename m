Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FCE7C77B60
	for <linux-tegra@archiver.kernel.org>; Fri, 31 Mar 2023 20:20:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232996AbjCaUUV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 31 Mar 2023 16:20:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232792AbjCaUUU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 31 Mar 2023 16:20:20 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E9E520D9E
        for <linux-tegra@vger.kernel.org>; Fri, 31 Mar 2023 13:20:19 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id k37so30474603lfv.0
        for <linux-tegra@vger.kernel.org>; Fri, 31 Mar 2023 13:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680294017;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3SPLomdELf3/6WXbkk42uvtuWz5cs0Z2rPW0s9xDm3w=;
        b=PlZmbRBdePA2yadiuExBBkYSwjjHzYw7CHRbOX3LXSjuTMGFwQBSfXhbbH2cQHGmR2
         NuWHPTbtNfbCiQq/Wit+b0KRakOeh6RPxBBePdjCVDU6UuQvgPwsByHQDb2UU4/1KrTz
         ZRikUPyPyW3vtri6pHFzfMJEuHIG9Td76Ww0/pAqbtl4GBTfe37HOfQ7NcuwjbTKk01G
         xmo0iwZZb0Axj4CDRqYLhLSd9HGTfBLLPGFsrYhMqzA5HvxdQiI0PqVxGMIpvS5+qjhy
         FxDvIemj8oUlK3IzKBELetvv2YgQkC4SB6wELoR1ETJRegAMI8EUm15hK3NrHJb2C/Di
         VDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680294017;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3SPLomdELf3/6WXbkk42uvtuWz5cs0Z2rPW0s9xDm3w=;
        b=D7qF7H0/dRG9xylCrz+u+LlmZIUcO3glEQg7HgjDvebif0Ta0UyjqnyIkGI9gX2Ry/
         GGYLTL2/9Sfros47EPwwY1glxmKMh+QKjVDB9JQ+g/i5Mivply4NOtZmJ5xKhekhDHAb
         wFTCuRT0CjsWnWeMrHcMKu3+GP27vLOq5PC0eGvF0p0i7cQOX3NGXMlnTEjqX+/tjJCR
         iM5aq5K1GN4nuxPVPQmmkhlTfxei9Nn3ofmZm/yNTcqtUqJhFwxySMDlquf2ms/HtTUM
         Am72vWoh1NkOdzY+6EjOg1FIchCqJoO5rk6T3Ql56iKnuiIbmi87oN8WBNbnmoqpF4/a
         9Cnw==
X-Gm-Message-State: AAQBX9e8iFat/LZkyG8TYUk0uVfIRMBfFmvyjB1MWeCC3BuRPMsiLPyR
        sPeoCI3onGeQ1MewSHeRu9EB+w==
X-Google-Smtp-Source: AKy350bDnj2vn5A58o+3ecBy79qQnGSur7Wb85FlT/UQCLSfU3pI3yDQakMb/D9gjB8EtIuUlaC1cw==
X-Received: by 2002:ac2:4ac7:0:b0:4ea:f7aa:e778 with SMTP id m7-20020ac24ac7000000b004eaf7aae778mr3426407lfp.24.1680294017454;
        Fri, 31 Mar 2023 13:20:17 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y24-20020a197518000000b00498f67cbfa9sm512742lfe.22.2023.03.31.13.20.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 13:20:17 -0700 (PDT)
Message-ID: <944bc557-7090-4b5a-e1bc-31b99fad06e5@linaro.org>
Date:   Fri, 31 Mar 2023 22:20:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/4] dt-bindings: tegra: Document Jetson Orin Nano
Content-Language: en-US
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230331163159.17145-1-thierry.reding@gmail.com>
 <20230331163159.17145-2-thierry.reding@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331163159.17145-2-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 31/03/2023 18:31, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The Jetson Orin Nano is the little sibling of the Jetson Orin NX.
> Document the corresponding compatible strings for these devices.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  Documentation/devicetree/bindings/arm/tegra.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
> index 61e638c9cad7..60c151da5e06 100644
> --- a/Documentation/devicetree/bindings/arm/tegra.yaml
> +++ b/Documentation/devicetree/bindings/arm/tegra.yaml
> @@ -220,6 +220,13 @@ properties:
>                - nvidia,p3767-0001
>                - nvidia,p3767-0002
>            - const: nvidia,tegra234
> +      - description: Jetson Orin Nano
> +        items:
> +          - enum:
> +              - nvidia,p3767-0003
> +              - nvidia,p3767-0004
> +              - nvidia,p3767-0005

Similar questions as for patch #1. Where are the DTSes? Where are the
differences? If we keep documenting every SKU which is the same from
user/OS perspective, this list would grow crazy.

Best regards,
Krzysztof

