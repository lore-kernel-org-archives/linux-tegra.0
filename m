Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50972C7EE24
	for <linux-tegra@archiver.kernel.org>; Mon,  8 May 2023 16:22:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233725AbjEHQWR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 8 May 2023 12:22:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234055AbjEHQWQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 8 May 2023 12:22:16 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9604D6592
        for <linux-tegra@vger.kernel.org>; Mon,  8 May 2023 09:22:14 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-50b9ef67f35so8670561a12.2
        for <linux-tegra@vger.kernel.org>; Mon, 08 May 2023 09:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683562933; x=1686154933;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XpcKYq5WNbrrjAsU7QABCwsl+Vtpgt8ratCRA6azzLU=;
        b=F8fFaT4exJ15WiriCuCDj7OiPh+SryIAo2VIJkZ0aTKpamfXKgR+7Vwl+XjcW3rrRY
         RfByxRr3dWp4i+we8nzuCRi4fbYXfFy9B8c/VhT6OY3H2X8Forvmm1NJcoqHdQG112DD
         o5OnOjXgn+ZsQvQMIy6TNDGOc9of5zwDud2axxHOxARl/VC7bqXwXuoMic/rY4Gn3vdl
         OXo1A76MWpYzLsp2hz3Zd3LDCPtMXsEQemUgWlIWSQ8zWxjfenWEV+q6UYRN9X8FH3lm
         tttA7kFmQioyLLy5nq7deQQZHIvqw1RywTxofXod2A6lKWtaFLWxVSzSA5d/kbSO+QlC
         FpqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683562933; x=1686154933;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XpcKYq5WNbrrjAsU7QABCwsl+Vtpgt8ratCRA6azzLU=;
        b=EiQHIVJbAvInJdFShXYsOZxoomOQ4UcLlOeODS2PZ4P1IzsJMZAAi6MH+2+HvVxF8q
         w0wtSjAcEKkZUWdK1eQISRiEVI94MNkdwtJG056QYsm66DwOWzWU2o2HVpxi0V2smjpS
         JxHKbE7267CSAii/9yq0Qhzr5XeUwNQbGQwU0xyTld9rDd6QmTQLiA3EmsEwUUPvEPlT
         VMZ8DrOHcWeA4b1eKHaGHJkZhta1uKAtNnSKKB9wmWy5z4A81wL2PsGWZ56aw6bT41q5
         YT0PbO+194nIYPL94SWEzoJOZ9vwX8Vbm15uFD0YmUIxpN0eyICeoRZkPz4L1jGOYRPZ
         nBRg==
X-Gm-Message-State: AC+VfDylm8IU54yDqeEwcos1Fi/uXdb7d5NpcD3r47x3VdQTtFWetAw9
        HkhyzZvCZgsFDWfUTpvb0GzTag==
X-Google-Smtp-Source: ACHHUZ6C0tR9B3FrVoNNhKWZTeKkcQfXspZdKGpP/WKSbwK/PFncjib6aLbjJw4xTQeMJ2HBm09mwQ==
X-Received: by 2002:a17:907:934d:b0:959:c6cb:9fc8 with SMTP id bv13-20020a170907934d00b00959c6cb9fc8mr8791011ejc.29.1683562933067;
        Mon, 08 May 2023 09:22:13 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:50e0:ebdf:b755:b300? ([2a02:810d:15c0:828:50e0:ebdf:b755:b300])
        by smtp.gmail.com with ESMTPSA id l21-20020a170906a41500b00965c6c63ea3sm165594ejz.35.2023.05.08.09.22.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 09:22:12 -0700 (PDT)
Message-ID: <dd0deabd-defa-7ead-4720-c93bdf17feed@linaro.org>
Date:   Mon, 8 May 2023 18:22:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/2] dt-bindings: tegra: Document compatible for IGX
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>, Shubhi Garg <shgarg@nvidia.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com
References: <20230508102733.1751527-1-shgarg@nvidia.com>
 <168354524653.789162.6725251128865957840.robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <168354524653.789162.6725251128865957840.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 08/05/2023 13:27, Rob Herring wrote:
> 
> On Mon, 08 May 2023 10:27:32 +0000, Shubhi Garg wrote:
>> Document the compatible strings used for Nvidia IGX Orin Development
>> kit which uses P3701 SKU8 and P3740 carrier board.
>>
>> Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
>> ---
>>
>> v2: sorted IGX Orin position as per part number. Since
>> P3740 is designed prior to P3768, it is placed before Orin NX.
>>
>>  Documentation/devicetree/bindings/arm/tegra.yaml | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,ov2685.example.dtb: camera-sensor@3c: port:endpoint:data-lanes: [[1]] is too short
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,ov2685.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/rockchip-isp1.example.dtb: camera@3c: port:endpoint:data-lanes: [[1]] is too short
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,ov2685.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.example.dtb: pcie-ep@33800000: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.yaml

These can be ignored.

Best regards,
Krzysztof

