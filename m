Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56EAEC77B7F
	for <linux-tegra@archiver.kernel.org>; Wed,  3 May 2023 06:22:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbjECGWd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 3 May 2023 02:22:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbjECGWb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 3 May 2023 02:22:31 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D926359B
        for <linux-tegra@vger.kernel.org>; Tue,  2 May 2023 23:22:30 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-50b383222f7so6435214a12.3
        for <linux-tegra@vger.kernel.org>; Tue, 02 May 2023 23:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683094948; x=1685686948;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z8XVAqmXI+jhl3BFHPCqjLP+/G26BqqeUS0b4jpObIM=;
        b=VME+7d3JdUeuTaP936ESeJYi8Rkg3Bkw5MUcPv9lLHvq10FrJs4+hA5FUwIjCipCfL
         ib1DEfjqkARo8PuxhGP7YyTiFUPXXxI3cwbjRjlRG/jMinWGWg8e5hoHJowM2yvQnEDb
         OPjkLXMOc7TEaG18GgBbu8yvIBDzE0FWD6/KvG73YAhOKcgY98tBwDG6L+2dZE3W2gdn
         mW2O/IS0uBUUJzUGDBGa72VcQnlaBpDwnonPleryUXxwHApf05JYqT3VyGzxhxZC7pIf
         hb+HuWoeOJG9/jhQqUEkLYnCJNeU1Aq1/Rb+uso6C9Lgxk5N6UgdYZMAfVmqdoN7CKf7
         u3mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683094948; x=1685686948;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z8XVAqmXI+jhl3BFHPCqjLP+/G26BqqeUS0b4jpObIM=;
        b=PJrayOVp/erjvDEUBj/mLbC/IDYhdLVc8Zt7uQnVP8pt0H2xjSSzJBnsNi0SzFqv8n
         nFKoviM6Grya2Q8cT2Q6//idruXy8mB+2o8JlIQBLMUh1NdocfTDhpYFi7o1z+3C9Rcy
         TZiLeRvHTHTmDrCxC/Tx+wxj2R12qn99GsZ4v+OSpoPUi0EvfSiDlc+p/hMWQyPEoXZM
         OT90n/HDjvW9RFa1SUYlgLeaxlGPNG9C73Md3Nup0xSD2GgD7tMI5CADsUDF8dudcxLt
         Ui6txTDcj60snMHKBUqtQ+YQXaK6iLs8RjiJhwSGnqin33uYsgu587PIzebJ/rXotXWF
         JlKA==
X-Gm-Message-State: AC+VfDxcbjtuPHEgxGs0zx19/LAY64OZVnLDVAmwTAzuxc70q3nUZvy7
        yKtenvaSYbdERCKqf3YDxcHqew==
X-Google-Smtp-Source: ACHHUZ4aYV6FzcThjCWwcuu6vNy+xvXpJlGW+eUMldzJuswo1ddRZSQsgQQ2g5v2y51oCnhQf1mHVg==
X-Received: by 2002:a17:907:1b17:b0:94a:4d06:3de3 with SMTP id mp23-20020a1709071b1700b0094a4d063de3mr2278494ejc.72.1683094948531;
        Tue, 02 May 2023 23:22:28 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a40b:9d8:1fa0:ecc5? ([2a02:810d:15c0:828:a40b:9d8:1fa0:ecc5])
        by smtp.gmail.com with ESMTPSA id t26-20020a1709064f1a00b0094f34fe27c6sm17016156eju.170.2023.05.02.23.22.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 23:22:27 -0700 (PDT)
Message-ID: <664379bf-96c4-b66c-6b0b-7b848ae6000c@linaro.org>
Date:   Wed, 3 May 2023 08:22:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v1 1/2] dt-bindings: tegra: Document compatible for IGX
Content-Language: en-US
To:     Shubhi Garg <shgarg@nvidia.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20230502150249.773425-1-shgarg@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230502150249.773425-1-shgarg@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 02/05/2023 17:02, Shubhi Garg wrote:
> Document the compatible strings used for Nvidia IGX Orin Development
> kit which uses P3701 SKU8 and P3740 carrier board.
> 
> Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
> ---
>  Documentation/devicetree/bindings/arm/tegra.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
> index 0df41f5b7e2a..34523b8b5d1f 100644
> --- a/Documentation/devicetree/bindings/arm/tegra.yaml
> +++ b/Documentation/devicetree/bindings/arm/tegra.yaml
> @@ -176,5 +176,10 @@ properties:
>            - const: nvidia,p3768-0000+p3767-0000
>            - const: nvidia,p3767-0000
>            - const: nvidia,tegra234
> +      - description: NVIDIA IGX Orin Development Kit
> +        items:
> +          - const: nvidia,p3740-0002+p3701-0008
> +          - const: nvidia,p3701-0008
> +          - const: nvidia,tegra234
>  

Don't stuff things to the end, but put in some logical order. For
example 'I' could be before 'N'.

Best regards,
Krzysztof

