Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE5FC433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Nov 2021 01:44:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236860AbhK3Brx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Nov 2021 20:47:53 -0500
Received: from mail-ot1-f44.google.com ([209.85.210.44]:46629 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbhK3Brw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Nov 2021 20:47:52 -0500
Received: by mail-ot1-f44.google.com with SMTP id 98-20020a9d086b000000b0057a403bbd4eso3498739oty.13;
        Mon, 29 Nov 2021 17:44:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8mH60VC/L61fJW/6O4CQT8z8Uuk1hf10l4XLAwoJeIw=;
        b=cwZVsNYDdDDND05Epnn3L3aXxxul4UyM+AzA41enS9DmIWRv0gWIsqDlvyUzRThpjI
         ZMZgNau0QqKfx3Njm4JbAmNgbdqNLdRS6ByiGA3Q7JaIrtgVEcajQq54U90ZhIqVaolK
         K4ke1pCRImBiCKYE7mpwnH/7rGpoZ/ARdPFx/Yi1KZm50OkQ6NMmHwep0Q+ifQ7KVkKN
         7AoCPMNOwNvYy/lZywI9aqMR8HQyYhOF6MmQTbfOH57gZ+H7LuDvigwhl8Fzafbv0GGD
         3HzBgtRlSZTTZO5N2zVycIYRZNy9IcMJgpr9Ezn8JrQNSKGIjOuI72lMACRd/QqqsRkr
         oXLA==
X-Gm-Message-State: AOAM531v5LDCWnPssGVRLxkKy7F9Fy/8YuMn/2QCN26byFppbfZ0bOZL
        XxCNTcjLs/nXcnFG+zATBA==
X-Google-Smtp-Source: ABdhPJxvunLce5NqJl9xSsKD8esDp2AZad+ZbRoRUtIGWCTJQZg1mWqyN3h+375TgOFymPm39Ecabg==
X-Received: by 2002:a9d:750c:: with SMTP id r12mr46921227otk.273.1638236674120;
        Mon, 29 Nov 2021 17:44:34 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id l9sm2510175oom.4.2021.11.29.17.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 17:44:33 -0800 (PST)
Received: (nullmailer pid 997288 invoked by uid 1000);
        Tue, 30 Nov 2021 01:44:32 -0000
Date:   Mon, 29 Nov 2021 19:44:32 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 13/16] dt-bindings: i2c: tegra-bpmp: Convert to
 json-schema
Message-ID: <YaWCAGQU0sjCwz66@robh.at.kernel.org>
References: <20211119143839.1950739-1-thierry.reding@gmail.com>
 <20211119143839.1950739-14-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119143839.1950739-14-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Nov 19, 2021 at 03:38:36PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the NVIDIA Tegra186 (and later) BPMP I2C bindings from the
> free-form text format to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - add missing additionalProperties: false
> 
>  .../bindings/i2c/nvidia,tegra186-bpmp-i2c.txt | 42 -------------------
>  .../i2c/nvidia,tegra186-bpmp-i2c.yaml         | 42 +++++++++++++++++++
>  2 files changed, 42 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt b/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt
> deleted file mode 100644
> index ab240e10debc..000000000000
> --- a/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -NVIDIA Tegra186 BPMP I2C controller
> -
> -In Tegra186, the BPMP (Boot and Power Management Processor) owns certain HW
> -devices, such as the I2C controller for the power management I2C bus. Software
> -running on other CPUs must perform IPC to the BPMP in order to execute
> -transactions on that I2C bus. This binding describes an I2C bus that is
> -accessed in such a fashion.
> -
> -The BPMP I2C node must be located directly inside the main BPMP node. See
> -../firmware/nvidia,tegra186-bpmp.txt for details of the BPMP binding.
> -
> -This node represents an I2C controller. See ../i2c/i2c.txt for details of the
> -core I2C binding.
> -
> -Required properties:
> -- compatible:
> -    Array of strings.
> -    One of:
> -    - "nvidia,tegra186-bpmp-i2c".
> -- #address-cells: Address cells for I2C device address.
> -    Single-cell integer.
> -    Must be <1>.
> -- #size-cells:
> -    Single-cell integer.
> -    Must be <0>.
> -- nvidia,bpmp-bus-id:
> -    Single-cell integer.
> -    Indicates the I2C bus number this DT node represent, as defined by the
> -    BPMP firmware.
> -
> -Example:
> -
> -bpmp {
> -	...
> -
> -	i2c {
> -		compatible = "nvidia,tegra186-bpmp-i2c";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		nvidia,bpmp-bus-id = <5>;
> -	};
> -};
> diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.yaml b/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.yaml
> new file mode 100644
> index 000000000000..351e12124959
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i2c/nvidia,tegra186-bpmp-i2c.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra186 (and later) BPMP I2C controller
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@gmail.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +description: |
> +  In Tegra186 and later, the BPMP (Boot and Power Management Processor)
> +  owns certain HW devices, such as the I2C controller for the power
> +  management I2C bus. Software running on other CPUs must perform IPC to
> +  the BPMP in order to execute transactions on that I2C bus. This
> +  binding describes an I2C bus that is accessed in such a fashion.
> +
> +  The BPMP I2C node must be located directly inside the main BPMP node.
> +  See ../firmware/nvidia,tegra186-bpmp.yaml for details of the BPMP
> +  binding.
> +
> +  This node represents an I2C controller. See ../i2c/i2c.txt for details
> +  of the core I2C binding.
> +
> +properties:
> +  compatible:
> +    const: nvidia,tegra186-bpmp-i2c
> +

> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0

Covered by i2c-controller.yaml. Add a reference and then use 
unevaluatedProperties.

> +
> +  nvidia,bpmp-bus-id:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Indicates the I2C bus number this DT node represents,
> +      as defined by the BPMP firmware.
> +
> +additionalProperties: false
> -- 
> 2.33.1
> 
> 
