Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10D65C4332F
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 15:02:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EFF9F61075
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 15:02:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235262AbhKLPEy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 10:04:54 -0500
Received: from mail-ot1-f49.google.com ([209.85.210.49]:43541 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235215AbhKLPEy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 10:04:54 -0500
Received: by mail-ot1-f49.google.com with SMTP id h16-20020a9d7990000000b0055c7ae44dd2so14165146otm.10;
        Fri, 12 Nov 2021 07:02:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=++bjvuZbIyWN1N1UujRDlYTcweMJ3JGF91QYrfcr2AU=;
        b=aoQruf5lR64RsHdm8D4BFISxWDIWaCcmJKponUlGSUpilgwNjWJj1C/WUp93m8faUn
         GWl5lAcIREX9HWcBBKmEb1k3XkJjBHFf0miC4KKBdoGg7OIarCh26OvJMRRaJ6nJYI71
         HEIfLwZslkTBVNGtgThb/jLKPY8qyD9vqT2MnPTeeW3gXVLE4wL1pJ5yNBMv1SpFbViv
         gFKZOsKDr5S92A4IFhrfJjpZmYRGztiRXqRI1haddKReK+09tj+OuNHhw/fwZWvGXPsy
         08I6QzL7rTVWJqPYuMi7uWZCzkdyClJA7lFeIsVgFzYCNiG5hr5eWOxBMUnSANvISsI+
         WKnA==
X-Gm-Message-State: AOAM533G3R47pbAapzVL2SOT5+ZEIPmeTS+XrZYJF9yapstNyAjl0xG3
        rxYIFP0Ag22wZA/sBWj0Ww==
X-Google-Smtp-Source: ABdhPJygg+5yqv45h2kTDhpR0ZaRJOJcES3IkniBYnOd6NvHkzil+BCj7omLkoiGbI1ACaq9Hsa/cw==
X-Received: by 2002:a9d:7855:: with SMTP id c21mr12890662otm.167.1636729323090;
        Fri, 12 Nov 2021 07:02:03 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id b13sm1077242ooo.20.2021.11.12.07.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 07:02:02 -0800 (PST)
Received: (nullmailer pid 2842415 invoked by uid 1000);
        Fri, 12 Nov 2021 15:01:59 -0000
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
In-Reply-To: <20211112120518.3679793-11-thierry.reding@gmail.com>
References: <20211112120518.3679793-1-thierry.reding@gmail.com> <20211112120518.3679793-11-thierry.reding@gmail.com>
Subject: Re: [PATCH 10/15] dt-bindings: serial: 8250: Document Tegra234 UART
Date:   Fri, 12 Nov 2021 09:01:59 -0600
Message-Id: <1636729319.974316.2842414.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 12 Nov 2021 13:05:13 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add the compatible string for the UART found on the Tegra234 SoC.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  Documentation/devicetree/bindings/serial/8250.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1554312


serial@2f8: 'oneOf' conditional failed, one must be fixed:
	arch/arm64/boot/dts/hisilicon/hip06-d03.dt.yaml

serial@40081000: clocks: [[4, 1280], [2, 1288]] is too long
	arch/arm/boot/dts/lpc4337-ciaa.dt.yaml

serial@40081000: clocks: [[5, 1280], [2, 1288]] is too long
	arch/arm/boot/dts/lpc4350-hitex-eval.dt.yaml
	arch/arm/boot/dts/lpc4357-ea4357-devkit.dt.yaml
	arch/arm/boot/dts/lpc4357-myd-lpc4357.dt.yaml

serial@40082000: clocks: [[4, 1024], [2, 1296]] is too long
	arch/arm/boot/dts/lpc4337-ciaa.dt.yaml

serial@40082000: clocks: [[5, 1024], [2, 1296]] is too long
	arch/arm/boot/dts/lpc4350-hitex-eval.dt.yaml
	arch/arm/boot/dts/lpc4357-ea4357-devkit.dt.yaml
	arch/arm/boot/dts/lpc4357-myd-lpc4357.dt.yaml

serial@400c1000: clocks: [[4, 768], [2, 1544]] is too long
	arch/arm/boot/dts/lpc4337-ciaa.dt.yaml

serial@400c1000: clocks: [[5, 768], [2, 1544]] is too long
	arch/arm/boot/dts/lpc4350-hitex-eval.dt.yaml
	arch/arm/boot/dts/lpc4357-ea4357-devkit.dt.yaml
	arch/arm/boot/dts/lpc4357-myd-lpc4357.dt.yaml

serial@400c2000: clocks: [[4, 512], [2, 1552]] is too long
	arch/arm/boot/dts/lpc4337-ciaa.dt.yaml

serial@400c2000: clocks: [[5, 512], [2, 1552]] is too long
	arch/arm/boot/dts/lpc4350-hitex-eval.dt.yaml
	arch/arm/boot/dts/lpc4357-ea4357-devkit.dt.yaml
	arch/arm/boot/dts/lpc4357-myd-lpc4357.dt.yaml

uart@221000: $nodename:0: 'uart@221000' does not match '^serial(@.*)?$'
	arch/arm/boot/dts/mstar-infinity2m-ssd202d-ssd201htv2.dt.yaml
	arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dt.yaml
	arch/arm/boot/dts/mstar-infinity3-msc313e-breadbee.dt.yaml
	arch/arm/boot/dts/mstar-infinity-msc313-breadbee_crust.dt.yaml
	arch/arm/boot/dts/mstar-mercury5-ssc8336n-midrived08.dt.yaml

uart@3,0: $nodename:0: 'uart@3,0' does not match '^serial(@.*)?$'
	arch/arm/boot/dts/omap3-zoom3.dt.yaml

uart@3,0: Unevaluated properties are not allowed ('bank-width', 'gpmc,mux-add-data', 'gpmc,device-width', 'gpmc,wait-pin', 'gpmc,cycle2cycle-samecsen', 'gpmc,cycle2cycle-diffcsen', 'gpmc,cs-on-ns', 'gpmc,cs-rd-off-ns', 'gpmc,cs-wr-off-ns', 'gpmc,adv-on-ns', 'gpmc,adv-rd-off-ns', 'gpmc,adv-wr-off-ns', 'gpmc,oe-on-ns', 'gpmc,oe-off-ns', 'gpmc,we-on-ns', 'gpmc,we-off-ns', 'gpmc,rd-cycle-ns', 'gpmc,wr-cycle-ns', 'gpmc,access-ns', 'gpmc,page-burst-access-ns', 'gpmc,bus-turnaround-ns', 'gpmc,cycle2cycle-delay-ns', 'gpmc,wait-monitoring-ns', 'gpmc,clk-activation-ns', 'gpmc,wr-data-mux-bus-ns', 'gpmc,wr-access-ns' were unexpected)
	arch/arm/boot/dts/omap3-zoom3.dt.yaml

uart@3,1: $nodename:0: 'uart@3,1' does not match '^serial(@.*)?$'
	arch/arm/boot/dts/omap3-zoom3.dt.yaml

uart@3,1: Unevaluated properties are not allowed ('bank-width' was unexpected)
	arch/arm/boot/dts/omap3-zoom3.dt.yaml

uart@3,2: $nodename:0: 'uart@3,2' does not match '^serial(@.*)?$'
	arch/arm/boot/dts/omap3-zoom3.dt.yaml

uart@3,2: Unevaluated properties are not allowed ('bank-width' was unexpected)
	arch/arm/boot/dts/omap3-zoom3.dt.yaml

uart@3,3: $nodename:0: 'uart@3,3' does not match '^serial(@.*)?$'
	arch/arm/boot/dts/omap3-zoom3.dt.yaml

uart@3,3: Unevaluated properties are not allowed ('bank-width' was unexpected)
	arch/arm/boot/dts/omap3-zoom3.dt.yaml

uart8250@3,1000000: $nodename:0: 'uart8250@3,1000000' does not match '^serial(@.*)?$'
	arch/arm/boot/dts/imx27-eukrea-mbimxsd27-baseboard.dt.yaml

uart8250@3,1000000: Unevaluated properties are not allowed ('fsl,weim-cs-timing' was unexpected)
	arch/arm/boot/dts/imx27-eukrea-mbimxsd27-baseboard.dt.yaml

uart8250@3,200000: $nodename:0: 'uart8250@3,200000' does not match '^serial(@.*)?$'
	arch/arm/boot/dts/imx27-eukrea-mbimxsd27-baseboard.dt.yaml

uart8250@3,200000: Unevaluated properties are not allowed ('fsl,weim-cs-timing' was unexpected)
	arch/arm/boot/dts/imx27-eukrea-mbimxsd27-baseboard.dt.yaml

uart8250@3,400000: $nodename:0: 'uart8250@3,400000' does not match '^serial(@.*)?$'
	arch/arm/boot/dts/imx27-eukrea-mbimxsd27-baseboard.dt.yaml

uart8250@3,400000: Unevaluated properties are not allowed ('fsl,weim-cs-timing' was unexpected)
	arch/arm/boot/dts/imx27-eukrea-mbimxsd27-baseboard.dt.yaml

uart8250@3,800000: $nodename:0: 'uart8250@3,800000' does not match '^serial(@.*)?$'
	arch/arm/boot/dts/imx27-eukrea-mbimxsd27-baseboard.dt.yaml

uart8250@3,800000: Unevaluated properties are not allowed ('fsl,weim-cs-timing' was unexpected)
	arch/arm/boot/dts/imx27-eukrea-mbimxsd27-baseboard.dt.yaml

uart@98200000: $nodename:0: 'uart@98200000' does not match '^serial(@.*)?$'
	arch/arm/boot/dts/moxart-uc7112lx.dt.yaml

uart@fd883000: $nodename:0: 'uart@fd883000' does not match '^serial(@.*)?$'
	arch/arm/boot/dts/alpine-db.dt.yaml

uart@fd884000: $nodename:0: 'uart@fd884000' does not match '^serial(@.*)?$'
	arch/arm/boot/dts/alpine-db.dt.yaml

