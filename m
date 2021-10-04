Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33AEBC433EF
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Oct 2021 02:22:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1273061278
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Oct 2021 02:22:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232228AbhJDCYW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 3 Oct 2021 22:24:22 -0400
Received: from mail-oi1-f172.google.com ([209.85.167.172]:36767 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232213AbhJDCYV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 3 Oct 2021 22:24:21 -0400
Received: by mail-oi1-f172.google.com with SMTP id y201so19746832oie.3;
        Sun, 03 Oct 2021 19:22:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=ushgit0mjUfKyHoADqKH5l5MXksAnFZZ1AfG5dgrz5o=;
        b=KavC6goRMlIqYawnF0c6rDjtUiZLCGomJELy84TPlotH5ENKP6xbIyLKZxa3Mwp08i
         k7sKpbhsBXUiTNtqOfATzoM9foTt4azfd6tj/wx7GkLgU9ddu2Xf7GPPOO2xhhVEFtWg
         hPdBxorWCbDc5MGGI2qMMro9lCur8lRTUhaslgp31TrndVn/ftachMCWuqb7JLe4cD1p
         WjRearT2vvBhvpUtVhJf4VfxkgAmZpC7pHGYKdB9H/73mJmlrJhGU/pjSSU307wejbQY
         X4lG1KSqqoIx9G0J54W8ZCdRlE0y5RLOqsnzPHpS+qRDdJasXvGpdhwSDmEJ2TPcISY6
         l8ng==
X-Gm-Message-State: AOAM530f4p5Q8D35WsrHkotMfa2/iaxlCJJDDALpo4fPeTjllKKqWd+z
        NPEmABs7Rh8fYSmQKGrVFw==
X-Google-Smtp-Source: ABdhPJy86dvc9vfTKpEFg++eA1EydHmuKP0dyaBvrqugtku1lZKymqE4572adTJMvNNBVNFt4ors8Q==
X-Received: by 2002:aca:5909:: with SMTP id n9mr11877042oib.130.1633314151746;
        Sun, 03 Oct 2021 19:22:31 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id e2sm2612613ooa.20.2021.10.03.19.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 19:22:31 -0700 (PDT)
Received: (nullmailer pid 116315 invoked by uid 1000);
        Mon, 04 Oct 2021 02:22:30 -0000
From:   Rob Herring <robh@kernel.org>
To:     David Heidelberg <david@ixit.cz>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <treding@nvidia.com>, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20211003192529.29615-1-david@ixit.cz>
References: <20211003192529.29615-1-david@ixit.cz>
Subject: Re: [PATCH] [v2] dt-bindings: clock: tegra: Fix USB controller nodes in examples
Date:   Sun, 03 Oct 2021 21:22:30 -0500
Message-Id: <1633314150.313988.116314.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, 03 Oct 2021 21:25:30 +0200, David Heidelberg wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> A subsequent patch will convert the USB controller device tree bindings
> to json-schema, which will cause the DT validation to point out various
> issues with the examples in the clock and reset controller bindings.
> 
> Fix these issues so that the subsequent patch will not cause validation
> warnings.
> 
> v2:
>  - add missing usb-ehci compatible (David)
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../bindings/clock/nvidia,tegra124-car.yaml           | 11 ++++++++---
>  .../devicetree/bindings/clock/nvidia,tegra20-car.yaml |  5 +++++
>  2 files changed, 13 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.example.dt.yaml: usb-controller@7d000000: compatible: 'oneOf' conditional failed, one must be fixed:
	['nvidia,tegra124-ehci', 'nvidia,tegra30-ehci', 'usb-ehci'] is too long
	Additional items are not allowed ('usb-ehci' was unexpected)
	Additional items are not allowed ('nvidia,tegra30-ehci', 'usb-ehci' were unexpected)
	'nvidia,tegra124-ehci' is not one of ['allwinner,sun4i-a10-ehci', 'allwinner,sun50i-a64-ehci', 'allwinner,sun50i-h6-ehci', 'allwinner,sun5i-a13-ehci', 'allwinner,sun6i-a31-ehci', 'allwinner,sun7i-a20-ehci', 'allwinner,sun8i-a23-ehci', 'allwinner,sun8i-a83t-ehci', 'allwinner,sun8i-h3-ehci', 'allwinner,sun8i-r40-ehci', 'allwinner,sun9i-a80-ehci', 'aspeed,ast2400-ehci', 'aspeed,ast2500-ehci', 'aspeed,ast2600-ehci', 'brcm,bcm3384-ehci', 'brcm,bcm63268-ehci', 'brcm,bcm6328-ehci', 'brcm,bcm6358-ehci', 'brcm,bcm6362-ehci', 'brcm,bcm6368-ehci', 'brcm,bcm7125-ehci', 'brcm,bcm7346-ehci', 'brcm,bcm7358-ehci', 'brcm,bcm7360-ehci', 'brcm,bcm7362-ehci', 'brcm,bcm7420-ehci', 'brcm,bcm7425-ehci', 'brcm,bcm7435-ehci', 'ibm,476gtr-ehci', 'nxp,lpc1850-ehci', 'qca,ar7100-ehci', 'snps,hsdk-v1.0-ehci', 'socionext,uniphier-ehci']
	'nvidia,tegra124-ehci' is not one of ['cavium,octeon-6335-ehci', 'ibm,usb-ehci-440epx', 'ibm,usb-ehci-460ex', 'nintendo,hollywood-usb-ehci', 'st,spear600-ehci']
	'nvidia,tegra124-ehci' is not one of ['generic-ehci', 'usb-ehci']
	'generic-ehci' was expected
	'usb-ehci' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/generic-ehci.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.example.dt.yaml: usb-controller@7d000000: 'nvidia,phy', 'phy_type', 'reset-names' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/generic-ehci.yaml
Documentation/devicetree/bindings/clock/nvidia,tegra124-car.example.dt.yaml:0:0: /example-0/usb-controller@7d000000: failed to match any schema with compatible: ['nvidia,tegra124-ehci', 'nvidia,tegra30-ehci', 'usb-ehci']
Documentation/devicetree/bindings/clock/nvidia,tegra124-car.example.dt.yaml:0:0: /example-0/usb-controller@7d000000: failed to match any schema with compatible: ['nvidia,tegra124-ehci', 'nvidia,tegra30-ehci', 'usb-ehci']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1535873

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

