Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8424DFA3743
	for <linux-tegra@archiver.kernel.org>; Thu, 27 Oct 2022 21:19:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235686AbiJ0VTJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 27 Oct 2022 17:19:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236502AbiJ0VS7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 27 Oct 2022 17:18:59 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8E314F67D
        for <linux-tegra@vger.kernel.org>; Thu, 27 Oct 2022 14:18:57 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id c23so2255420qtw.8
        for <linux-tegra@vger.kernel.org>; Thu, 27 Oct 2022 14:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AyXBa6ykDLTrVOwX6VHEAyki/oYnov9OaiYlYqb8IuQ=;
        b=pLbMqe+4UWVeCU6n0FJ9i9jlJOD+Bls99Si1E7DHDiqf8j6gvU35pTzDYLXp8xZdjh
         3BNJIBTjmye5HlRMm7uIgkTr10aZXEA3bs0huAZsaaz0zEfSAojDNueGwBjEcNS73hqh
         w5z8oSi0fbd6X9qnI2zf7lVucqm/pVOv31sSEDnnCDs7mrqfnpL9aBIscV1mK1DdhAU2
         oWPkP/zMnYDP6gdWqD7zVIx8x10RrKXhv1jpMeVfMJO9Lw5A+97RRbgcqvEDZElleWkC
         QZ15KeBuVnIi67gAneE/CfvS90cXMmZWVISethneoUojTxBQ9h0lipW1xl4B6IJIba50
         0Q1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AyXBa6ykDLTrVOwX6VHEAyki/oYnov9OaiYlYqb8IuQ=;
        b=w3MIF2WA9/nNfYwJRNb/bN9gQ1M2gVtiF+BhIZ31s2fc1webpCjaTROtizym0hwLRd
         PzuIWDOnbZPkRyAPR7h1DHDy/qXBDLvkeAvkLWwZ5x8RFtj5oA/dbCr1yoXOXKtn5UHA
         hcQjzFBAM1bQTIyIO1oT83PeNAB0eUNoe0XYrnYv/cfyf8Im7x+ySY1673e/tCl5zela
         1tcLvDK+WFvyWziuejGGJ4knx47SpZCcQzLTv8wpGlQ66R1Xt+TXRJWpBpQopn9Hvw9Z
         wBpnmzEQFI5LSiqL9v0skxoEBU5eU9K69Oml0JWBnuV1C0T024mRv3ip8R58QOB/QRVr
         9+kg==
X-Gm-Message-State: ACrzQf0ND8MTQEO3uvDjU7HwwO5SsZUsiaR/YaxLYVjT5voZhg4Q3nFQ
        NGweleceS68Ay0v3gosBF6diwg==
X-Google-Smtp-Source: AMsMyM7qg/2i5QkK7AtijeQ9c5/J9SbLD38n65mxcQcdiryVkttLrlIpdZok1V/PQcQekw6KD8lc1g==
X-Received: by 2002:ac8:5981:0:b0:39c:e03e:86ed with SMTP id e1-20020ac85981000000b0039ce03e86edmr43673054qte.503.1666905535643;
        Thu, 27 Oct 2022 14:18:55 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id j8-20020a05620a288800b006fa00941e9dsm995562qkp.136.2022.10.27.14.18.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 14:18:55 -0700 (PDT)
Message-ID: <4579404d-b3f7-8342-6704-2644f5cd489d@linaro.org>
Date:   Thu, 27 Oct 2022 17:18:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH V1 1/2] dt-bindings: PCI: tegra234: Add ECAM support
Content-Language: en-US
To:     Vidya Sagar <vidyas@nvidia.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, mperttunen@nvidia.com
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, kthota@nvidia.com,
        mmaddireddy@nvidia.com, sagar.tv@gmail.com
References: <20221027051214.22003-1-vidyas@nvidia.com>
 <20221027051214.22003-2-vidyas@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221027051214.22003-2-vidyas@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 27/10/2022 01:12, Vidya Sagar wrote:
> Add support for ECAM aperture for Tegra234.
> 
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
>  .../devicetree/bindings/pci/nvidia,tegra194-pcie.yaml  | 10 ++++++++--
>  .../devicetree/bindings/pci/snps,dw-pcie.yaml          |  2 +-
>  2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra194-pcie.yaml b/Documentation/devicetree/bindings/pci/nvidia,tegra194-pcie.yaml
> index 75da3e8eecb9..15cc2d2055bb 100644
> --- a/Documentation/devicetree/bindings/pci/nvidia,tegra194-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/nvidia,tegra194-pcie.yaml
> @@ -27,6 +27,7 @@ properties:
>        - nvidia,tegra234-pcie
>  
>    reg:
> +    minItems: 4
>      items:
>        - description: controller's application logic registers
>        - description: configuration registers
> @@ -35,13 +36,17 @@ properties:
>            available for software access.
>        - description: aperture where the Root Port's own configuration
>            registers are available.
> +      - description: aperture to access the configuration space through ECAM.
> +          This is applicable only for Tegra234.

Then restrict it per compatible in allOf

>  

Best regards,
Krzysztof

