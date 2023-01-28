Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9EFBC27C76
	for <linux-tegra@archiver.kernel.org>; Sat, 28 Jan 2023 10:29:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234039AbjA1K3G (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 28 Jan 2023 05:29:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230474AbjA1K3F (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 28 Jan 2023 05:29:05 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9259416324
        for <linux-tegra@vger.kernel.org>; Sat, 28 Jan 2023 02:29:03 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id l35-20020a05600c1d2300b003dc4634a466so959304wms.4
        for <linux-tegra@vger.kernel.org>; Sat, 28 Jan 2023 02:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h9C/J+Fu3WqzJtiT/Bo9AU5JcV2nkWAcR65XhuY/8zw=;
        b=lNrrz/c/JVMyM4ROuoxS/NwPT8/yTzKYcZHFlzMfbUTBQf2O0wtrQz6PUvvUUkUwL9
         9mrNdIi1zBXoHjxn38l6SNcbeyTRzdYNUWH51oY1kZh/i+Q01JpM1sJdzg59dmmDPHFa
         C1fL0sQubPt8I7oGzgiRq+Ri5jsyaYGnpm3hM4WisBBadYan8mNJaxE0UWnTNAEQjHVq
         vXrWgxNzZZIFm8ph28yS4nqyO99cO9jqyxIWuSTINkrwHE8pkyNzRwgyhrq7luFJfv/Z
         zlStTXUOsWGnOJLFeFQUl6c/ULyYRqhorUHPnBzVQRvmjPeuJR8/cjOVF1taYCKJtSiN
         +NDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h9C/J+Fu3WqzJtiT/Bo9AU5JcV2nkWAcR65XhuY/8zw=;
        b=LoWwDEsx5tp384itqU/d6SY5As0013cN0p4tQizxWtmJQcev2JTtJfH2sRTk0rb7e7
         78rCjaIyTDBALJF82CNqK6+aOf9H12hhjMusfDxC8SbRT/3UVHUENAfAmTmWYJBUmqOm
         HvwxpGo1RMzfc197WRRiKUqJvknnVhDCXnb5FM1o7WX/+XPxE/15M+e8v/fTpQo+oSBn
         c7nSVZqlqNsTPIjr+0hTBB1ksSqci14V+ysiNEo1eSxoDzLD29hXp/XcPGe7a2MY6bO6
         3nBBiUBz5nEMonEoKiGDf3LTknYNIcQCRTFZq/l2qV0fR31bP258WpaXTHLYMqiCTw3x
         4wgA==
X-Gm-Message-State: AO0yUKW1UnmS6gwqzja8oa/lyS+kaSHGcCLaN3TIOxS89gMYKOfFW7Mp
        NL+bb0uoJcumIE1XFftuTRrtWw==
X-Google-Smtp-Source: AK7set8cK8kqpsUJRM/HfLEaaDOiJu5mN5ZMXZ0mrE5DBGvRGp39c1OqOXSVXOX5P4o7MT8uM0YaiA==
X-Received: by 2002:a05:600c:458a:b0:3dc:45a7:2b8a with SMTP id r10-20020a05600c458a00b003dc45a72b8amr2207868wmo.10.1674901742156;
        Sat, 28 Jan 2023 02:29:02 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n23-20020a05600c3b9700b003dab77aa911sm12108357wms.23.2023.01.28.02.29.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jan 2023 02:29:01 -0800 (PST)
Message-ID: <be2a9eaa-d049-c249-0c1b-d0eb50b25c3d@linaro.org>
Date:   Sat, 28 Jan 2023 11:29:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V9 1/6] dt-bindings: usb: Add Cypress cypd4226 Type-C
 controller
Content-Language: en-US
To:     Jon Hunter <jonathanh@nvidia.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Wayne Chang <waynec@nvidia.com>
References: <20230127151041.65751-1-jonathanh@nvidia.com>
 <20230127151041.65751-2-jonathanh@nvidia.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230127151041.65751-2-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 27/01/2023 16:10, Jon Hunter wrote:
> From: Wayne Chang <waynec@nvidia.com>
> 
> Add the device-tree binding documentation for Cypress cypd4226 dual
> Type-C controller.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> V9: added 'unevaluatedProperties' and 'additionalProperties'
> V8: removed 'additionalProperties'
> V7: updated example to use 'typec' for the node name
> V6: no changes
> V5: updated subject and updated binding to use 'firmware-name'.
> V4: no changes
> V3: fix additionalProperties warning on new schema
> V2: based on the review comments. Fix some addressed issues on

Thanks, this is looking good, although few more questions popped up
while comparing it with other bindings.

(...)

> +  firmware-name:
> +    enum:
> +      - nvidia,gpu
> +      - nvidia,jetson-agx-xavier
> +    description: |
> +      The name of the CCGx firmware built for product series.
> +      should be set one of following:
> +      - "nvidia,gpu" for the NVIDIA RTX product series
> +      - "nvidia,jetson-agx-xavier" for the NVIDIA Jetson product series
> +
> +patternProperties:
> +  '^connector@[0-1]+$':

How many connectors do you expect/support? 1111 is valid? I guess you
wanted only [01]?

> +    $ref: /schemas/connector/usb-connector.yaml#
> +    unevaluatedProperties: false
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts

I would assume that at least one connector is required (oneOf: required:).

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/tegra194-gpio.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      #interrupt-cells = <2>;
> +
> +      typec@8 {
> +        compatible = "cypress,cypd4226";
> +        reg = <0x08>;
> +        interrupt-parent = <&gpio_aon>;
> +        interrupts = <TEGRA194_AON_GPIO(BB, 2) IRQ_TYPE_LEVEL_LOW>;
> +        firmware-name = "nvidia,jetson-agx-xavier";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        connector@0 {
> +          compatible = "usb-c-connector";
> +          reg = <0>;
> +          label = "USB-C";
> +          data-role = "dual";
> +          ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            port@0 {
> +              reg = <0>;
> +              endpoint {
> +                remote-endpoint = <&usb_role_switch0>;
> +              };
> +            };
> +          };
> +        };
> +      };
> +    };

Best regards,
Krzysztof

