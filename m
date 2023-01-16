Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEFCEC46467
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Jan 2023 19:03:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231611AbjAPTDp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Jan 2023 14:03:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233631AbjAPTD2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Jan 2023 14:03:28 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFC0023C6A
        for <linux-tegra@vger.kernel.org>; Mon, 16 Jan 2023 11:03:26 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id az20so51105616ejc.1
        for <linux-tegra@vger.kernel.org>; Mon, 16 Jan 2023 11:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sDyuoBEYwebh/93ogb9M54nLKqVdPDRWQ3iHmFPRQcs=;
        b=GfisdXIe/9EdtQwLuHAxi68cs5gRUrr8vx/VI0VXjwsLoMuA9LREv8NLSELRzWyIcJ
         IcGZ0T92vCYBwW2jvMzNTAKgaxWkUntc/DUHG59d4sNjAkdvWVVRpJYHK2e3rKHtND+D
         pzA+xkqIVGnerLO5uobhcSsH+tVK64SsyxAgz+d6vEy+hnrJ20sd9D3psG7Ka7iLySbv
         sizQ6/cj1ZgToJtd/eVIZnTPFGVxs1igIARVAQ2VWSMcgueDhdm6QHoYC9HMPh1Nz5EI
         bBMrP5oajBB3DEegGGe5RkDXfv46pocR2HUhdQ8mb42bIr0U1laa0fnuzKSDUkzC9s/s
         YB4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sDyuoBEYwebh/93ogb9M54nLKqVdPDRWQ3iHmFPRQcs=;
        b=UgfRay+PC1AdlT9urK/dWm/1LV/AmPW4H1sBSy3U3QTgiZPfBMujA1P35fb1TbiXqF
         0IKWDMV9y0XoKWssr2xsbGb32mPXhe2LSZM28D0qoQdzsHMw7y9J2lptRkZgDZRqcOxa
         K9NPes1x4qSobWXy95C953C1CiAssK7UlI1V+20DSYNZmqMZ7DwCstFNXzRnswBUK7nx
         bzI6lIx+j6vrXE6PtHpuC2qpDfaf+MZoxEuSK3P5hfMuXUnOF5wYlBow221nxWdtePz/
         2eAhCZ6mcdRk/017cemyGk23eEPFrNhlxGgMozo9pmDL9J10/Aq6Tb8AkRYh1wDQmaUq
         lOew==
X-Gm-Message-State: AFqh2kqQ9gB/RkLmjVHWTOyLYjvVGTdyn5JUovBUbcqX02jFTdoBOzI4
        nf1rXjHoSIF0ZgPse9siVypdNA==
X-Google-Smtp-Source: AMrXdXsniDhonk7zjiqFPZ/XpASkSMoqLifQCRs4OKL4T/+WU/nYP91R+wfrOhdmWiGfoesbq3Ap+Q==
X-Received: by 2002:a17:906:dfda:b0:871:e9a0:ebaa with SMTP id jt26-20020a170906dfda00b00871e9a0ebaamr67352ejc.31.1673895805456;
        Mon, 16 Jan 2023 11:03:25 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id 8-20020a170906328800b00871cb1b8f63sm702167ejw.26.2023.01.16.11.03.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 11:03:25 -0800 (PST)
Message-ID: <de5cb562-e45e-aed4-508f-2d23f114a01e@linaro.org>
Date:   Mon, 16 Jan 2023 20:03:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH V4 1/5] dt-bindings: usb: Add binding for Cypress cypd4226
 I2C driver
Content-Language: en-US
To:     Jon Hunter <jonathanh@nvidia.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Wayne Chang <waynec@nvidia.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20230116155045.100780-1-jonathanh@nvidia.com>
 <20230116155045.100780-2-jonathanh@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230116155045.100780-2-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 16/01/2023 16:50, Jon Hunter wrote:
> From: Wayne Chang <waynec@nvidia.com>
> 
> add device-tree binding documentation for Cypress cypd4226 type-C
> controller's I2C interface. It is a standard i2c slave with GPIO
> input as IRQ interface.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> V3 -> V4: no changes
> V2 -> V3: fix additionalProperties warning on new schema
> V1 -> V2: based on the review comments. Fix some addressed issues on
> 
>  .../bindings/usb/cypress,cypd4226.yaml        | 86 +++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> new file mode 100644
> index 000000000000..5ac28ab4e7a1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/cypress,cypd4226.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cypress cypd4226 UCSI I2C Type-C Controller
> +
> +maintainers:
> +  - Wayne Chang <waynec@nvidia.com>
> +
> +description: |
> +  The Cypress cypd4226 UCSI I2C type-C controller is a I2C interface type-C
> +  controller.
> +
> +properties:
> +  compatible:
> +    const: cypress,cypd4226
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 0
> +
> +  reg:
> +    const: 0x08
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  cypress,firmware-build:
> +    enum:
> +      - nv
> +      - gn
> +    description: |
> +      the name of the CCGx firmware built for product series.
> +      should be set one of following:
> +      - "nv" for the RTX product series
> +      - "gn" for the Jetson product series

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

Best regards,
Krzysztof

