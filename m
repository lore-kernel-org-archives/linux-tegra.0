Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76FC2ECAAD5
	for <linux-tegra@archiver.kernel.org>; Tue,  6 Sep 2022 15:21:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232070AbiIFPVn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 6 Sep 2022 11:21:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232795AbiIFPVY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 6 Sep 2022 11:21:24 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AEFF82756;
        Tue,  6 Sep 2022 07:33:05 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id t11-20020a05683014cb00b0063734a2a786so8149104otq.11;
        Tue, 06 Sep 2022 07:33:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=0oc/efpNyK02TA049vRdVuq+a16ZNo/nBU3UNBlbLlA=;
        b=Ond+kA/gLnCbMNvdgqRN8z9f1UGtgr1P5+UPOam+19NuXgbZKJD2X268HcEllLuukc
         biMA7zpfNIOO8QKiof4wib0OLzrUDMZeug4s4jbLdnazxXqvZg1IbDPhAuP6yw0YX5PH
         IfjpMq3fW8uX3y4bxHms+1rSKaN91n/O/jGpIB9gT4u4jkEL6/BmyJr11X2/rAWogrcL
         j8bMCw76/pzsmcXma+fRx3KmeG/d1dFb2rPDLhM2R5vKbBdbAgc5QCofWGQsoKWJKKKp
         Ui1hftWk7FiA/m2s9+6t2BnjxA+mRqGGkCoGfvv04FbuBT8rCBE3BPJ5hrDa1hrw9yRm
         l1Hw==
X-Gm-Message-State: ACgBeo0LDlo8jL22F3w4LRKIseeMrZCMA0hle4UIOrKyfULra2kToFrE
        uTeqSUVnnlgu+ERGxvKaBw2RYnGM/g==
X-Google-Smtp-Source: AA6agR5MNLEe98jQgQIHK50PgdC2yea2wXhfxxelbBN17o+lzcVRNee4Gc6KiaqLgekEcrc451ilLw==
X-Received: by 2002:a05:6830:1281:b0:636:d7e9:1906 with SMTP id z1-20020a056830128100b00636d7e91906mr21706186otp.116.1662474443952;
        Tue, 06 Sep 2022 07:27:23 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k5-20020a056830168500b0063922f00ee2sm5961637otr.39.2022.09.06.07.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 07:27:22 -0700 (PDT)
Received: (nullmailer pid 439485 invoked by uid 1000);
        Tue, 06 Sep 2022 14:27:21 -0000
Date:   Tue, 6 Sep 2022 09:27:21 -0500
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 2/6] dt-bindings: reserved-memory: Support framebuffer
 reserved memory
Message-ID: <20220906142721.GA427176-robh@kernel.org>
References: <20220905163300.391692-1-thierry.reding@gmail.com>
 <20220905163300.391692-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220905163300.391692-3-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Sep 05, 2022 at 06:32:56PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Document the "framebuffer" compatible string for reserved memory nodes
> to annotate reserved memory regions used for framebuffer carveouts.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/reserved-memory/framebuffer.yaml | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml
> 
> diff --git a/Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml b/Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml
> new file mode 100644
> index 000000000000..80574854025d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reserved-memory/framebuffer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: /reserved-memory framebuffer node bindings
> +
> +maintainers:
> +  - devicetree-spec@vger.kernel.org
> +
> +allOf:
> +  - $ref: "reserved-memory.yaml"

Don't need quotes.

> +
> +properties:
> +  compatible:
> +    const: framebuffer
> +    description: >
> +      This indicates a region of memory meant to be used as a framebuffer for
> +      a set of display devices. It can be used by an operating system to keep
> +      the framebuffer from being overwritten and use it as the backing memory
> +      for a display device (such as simple-framebuffer).

I'm on the fence whether we need this. It doesn't really add anything 
because 'simple-framebuffer' will reference this node and you can find 
it that way. I guess a bootloader may not setup 'simple-framebuffer', 
but then it should probably not have this node either.

On the flip side, better to have compatibles than not to identify nodes.

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |

Use '/ {' to skip the boilerplate causing the error.

> +      chosen {
> +        framebuffer {
> +          compatible = "simple-framebuffer";
> +          memory-region = <&fb>;
> +        };
> +      };
> +
> +      reserved-memory {
> +          #address-cells = <1>;
> +          #size-cells = <1>;
> +          ranges;
> +
> +          fb: framebuffer@80000000 {
> +              compatible = "framebuffer";
> +              reg = <0x80000000 0x007e9000>;
> +          };
> +      };
> +
> +...
> -- 
> 2.37.2
> 
> 
