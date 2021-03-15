Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1621DC2BB9A
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Mar 2021 14:25:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA091650AA
	for <linux-tegra@archiver.kernel.org>; Mon, 15 Mar 2021 14:25:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234095AbhCOOYj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 15 Mar 2021 10:24:39 -0400
Received: from mail-io1-f51.google.com ([209.85.166.51]:37768 "EHLO
        mail-io1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238272AbhCOOXB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 15 Mar 2021 10:23:01 -0400
Received: by mail-io1-f51.google.com with SMTP id y20so15198574iot.4;
        Mon, 15 Mar 2021 07:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=LxM7hzlAWbd4b9S2ghwuGhozbMVLirqSVwvceryZHMg=;
        b=LOTcjxVFtpalr7NUWwA6nFeFlOob6DwkSG06OJXDsU2nNNmdUYyXdbnwG2JXDu+YRT
         7ZfAhhI0Y3bID6E4bCyohE8KoSBjiWKS7msSplhhf2DEEjvfP9G0u57juvtmR7cgi4i6
         ZP+CnN9VIKx+QspyEEhXNJmtKBY2vmiXQ+lJtBbUO94IO4yyP6n1lJmtVkWZixXL+8Vj
         xCGRlK44vHMOX9PxDkFDGq/XD0UcJLlnRz/T3O5mtN4lmOmA39fvmtZkNnlOhoCqzF8Z
         ozFl8XBuRvTylw58otlq3/JeTq/lceESFB7oCoxDexZa2s+ti1Rm7DEG+04rPwLwSPmY
         QKCw==
X-Gm-Message-State: AOAM531BqLaoXeiJGInO5RDpOV79gO9rn5v6PdbmFKie6PIxwJoa7nKI
        jmWSPPRO82Hw6e75p9Bk8A==
X-Google-Smtp-Source: ABdhPJydLNF3JmlZ5vRUiq3eZlrjxBPtW7HkMazAM247jI2fLn42xzIi4VQEGHdfbq530f3sZHvSlQ==
X-Received: by 2002:a5e:de0d:: with SMTP id e13mr2277351iok.208.1615818180155;
        Mon, 15 Mar 2021 07:23:00 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id l14sm7837111ilc.33.2021.03.15.07.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 07:22:58 -0700 (PDT)
Received: (nullmailer pid 876368 invoked by uid 1000);
        Mon, 15 Mar 2021 14:22:57 -0000
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        linux-clk@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Prashant Gaikwad <pgaikwad@nvidia.com>,
        linux-tegra@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20210312163632.8861-8-digetx@gmail.com>
References: <20210312163632.8861-1-digetx@gmail.com> <20210312163632.8861-8-digetx@gmail.com>
Subject: Re: [PATCH v4 7/7] dt-bindings: clock: tegra: Convert to schema
Date:   Mon, 15 Mar 2021 08:22:57 -0600
Message-Id: <1615818177.169631.876367.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 12 Mar 2021 19:36:32 +0300, Dmitry Osipenko wrote:
> Convert NVIDIA Tegra clock bindings to schema.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/clock/nvidia,tegra-car.yaml      | 118 ++++++++++++++++++
>  .../bindings/clock/nvidia,tegra114-car.txt    |  63 ----------
>  .../bindings/clock/nvidia,tegra124-car.txt    | 107 ----------------
>  .../bindings/clock/nvidia,tegra20-car.txt     |  63 ----------
>  .../bindings/clock/nvidia,tegra210-car.txt    |  56 ---------
>  .../bindings/clock/nvidia,tegra30-car.txt     |  63 ----------
>  6 files changed, 118 insertions(+), 352 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra-car.yaml
>  delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra114-car.txt
>  delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra124-car.txt
>  delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
>  delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra210-car.txt
>  delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra30-car.txt
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/nvidia,tegra-car.example.dt.yaml: usb-controller@c5004000: compatible: 'oneOf' conditional failed, one must be fixed:
	['nvidia,tegra20-ehci', 'usb-ehci'] is too long
	Additional items are not allowed ('usb-ehci' was unexpected)
	'nvidia,tegra20-ehci' is not one of ['allwinner,sun4i-a10-ehci', 'allwinner,sun50i-a64-ehci', 'allwinner,sun50i-h6-ehci', 'allwinner,sun5i-a13-ehci', 'allwinner,sun6i-a31-ehci', 'allwinner,sun7i-a20-ehci', 'allwinner,sun8i-a23-ehci', 'allwinner,sun8i-h3-ehci', 'allwinner,sun8i-r40-ehci', 'allwinner,sun9i-a80-ehci', 'aspeed,ast2400-ehci', 'aspeed,ast2500-ehci', 'aspeed,ast2600-ehci', 'brcm,bcm3384-ehci', 'brcm,bcm63268-ehci', 'brcm,bcm6328-ehci', 'brcm,bcm6358-ehci', 'brcm,bcm6362-ehci', 'brcm,bcm6368-ehci', 'brcm,bcm7125-ehci', 'brcm,bcm7346-ehci', 'brcm,bcm7358-ehci', 'brcm,bcm7360-ehci', 'brcm,bcm7362-ehci', 'brcm,bcm7420-ehci', 'brcm,bcm7425-ehci', 'brcm,bcm7435-ehci', 'ibm,476gtr-ehci', 'nxp,lpc1850-ehci', 'qca,ar7100-ehci', 'snps,hsdk-v1.0-ehci', 'socionext,uniphier-ehci']
	'nvidia,tegra20-ehci' is not one of ['cavium,octeon-6335-ehci', 'ibm,usb-ehci-440epx', 'ibm,usb-ehci-460ex', 'nintendo,hollywood-usb-ehci', 'st,spear600-ehci']
	'nvidia,tegra20-ehci' is not one of ['generic-ehci', 'usb-ehci']
	'generic-ehci' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/generic-ehci.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/nvidia,tegra-car.example.dt.yaml: usb-controller@c5004000: 'oneOf' conditional failed, one must be fixed:
	'interrupts' is a required property
	'interrupts-extended' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/generic-ehci.yaml

See https://patchwork.ozlabs.org/patch/1452220

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

