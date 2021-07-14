Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF268C07E9C
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Jul 2021 17:56:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C5C05613C9
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Jul 2021 17:56:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239861AbhGNR7T (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 14 Jul 2021 13:59:19 -0400
Received: from mail-io1-f51.google.com ([209.85.166.51]:36618 "EHLO
        mail-io1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238430AbhGNR7G (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 14 Jul 2021 13:59:06 -0400
Received: by mail-io1-f51.google.com with SMTP id u7so3215635ion.3;
        Wed, 14 Jul 2021 10:56:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gVIppKbtY1UeFXwm4fuwqTPS0ST95tmK6bcLy6aK7tc=;
        b=U4OPMbZIC4wSxROeVrNxe2GZjYhxSbRuvQipF1bM0VNr1rSv/8rm9opcUF/pVouEYR
         eEpUn7DiGlpRgF1AFAQaJLt4DhASB2f8GFZOwXHqNcrT2XDWmluAsMYFaI3olxOr3cgA
         wU2PRtJm/F/Pdhb3b/NaegATPsnkuZoAFa9+cV7trtYujBW1ku375MI8QrPmlglISsLY
         UpMRPr+kIs0pOXGTFWZkTfLOnpSvjaJE3FrViN4L0+9OlkhZCkpIl6SK+h9OjHm9wCDL
         1Ao+t2PA6BvuMd4AbDlMCYNME4PJyJuadDH//Pevt/Hh02mRGuMeJzr51UCg2V2CDz5j
         OC/w==
X-Gm-Message-State: AOAM531gGu+sFiPGxgzUPK6XpX+s6Y6MxRMEHcq9uq9fkBKjfICllgVx
        rkmVR4WgrFLPaaPCBfEGbQ==
X-Google-Smtp-Source: ABdhPJzwXllhi0G5VgAO6nEgXE1sfmgSG7BO/Qi9HaGw9pr62KMjnCs9xsQxRUr4yiKMB1C1kW5JOg==
X-Received: by 2002:a5d:960b:: with SMTP id w11mr8206829iol.138.1626285373949;
        Wed, 14 Jul 2021 10:56:13 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id j24sm1584965ioo.16.2021.07.14.10.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 10:56:12 -0700 (PDT)
Received: (nullmailer pid 2840153 invoked by uid 1000);
        Wed, 14 Jul 2021 17:56:10 -0000
Date:   Wed, 14 Jul 2021 11:56:10 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: tegra: Fix USB controller
 nodes in examples
Message-ID: <20210714175610.GA2834935@robh.at.kernel.org>
References: <20210622142436.4014610-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210622142436.4014610-1-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Jun 22, 2021 at 04:24:35PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> A subsequent patch will convert the USB controller device tree bindings
> to json-schema, which will cause the DT validation to point out various
> issues with the examples in the clock and reset controller bindings.
> 
> Fix these issues so that the subsequent patch will not cause validation
> warnings.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/clock/nvidia,tegra124-car.yaml           | 11 ++++++++---
>  .../devicetree/bindings/clock/nvidia,tegra20-car.yaml |  5 +++++
>  2 files changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.yaml b/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.yaml
> index ec7ab1483652..d5a873097379 100644
> --- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.yaml
> +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.yaml
> @@ -99,6 +99,7 @@ additionalProperties: false
>  examples:
>    - |
>      #include <dt-bindings/clock/tegra124-car.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>  
>      car: clock-controller@60006000 {
>          compatible = "nvidia,tegra124-car";
> @@ -107,9 +108,13 @@ examples:
>          #reset-cells = <1>;
>      };
>  
> -    usb-controller@c5004000 {
> -        compatible = "nvidia,tegra20-ehci";
> -        reg = <0xc5004000 0x4000>;
> +    usb-controller@7d000000 {

Since you are here, 'usb' is the documented and preferred node name.

> +        compatible = "nvidia,tegra124-ehci", "nvidia,tegra30-ehci";
> +        reg = <0x7d000000 0x4000>;
> +        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
> +        phy_type = "utmi";
>          clocks = <&car TEGRA124_CLK_USB2>;
>          resets = <&car TEGRA124_CLK_USB2>;
> +        reset-names = "usb";
> +        nvidia,phy = <&phy1>;
>      };
> diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
> index 459d2a525393..11e6d9513373 100644
> --- a/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
> +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
> @@ -53,6 +53,7 @@ additionalProperties: false
>  examples:
>    - |
>      #include <dt-bindings/clock/tegra20-car.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>  
>      car: clock-controller@60006000 {
>          compatible = "nvidia,tegra20-car";
> @@ -64,6 +65,10 @@ examples:
>      usb-controller@c5004000 {
>          compatible = "nvidia,tegra20-ehci";
>          reg = <0xc5004000 0x4000>;
> +        interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
> +        phy_type = "utmi";
>          clocks = <&car TEGRA20_CLK_USB2>;
>          resets = <&car TEGRA20_CLK_USB2>;
> +        reset-names = "usb";
> +        nvidia,phy = <&phy1>;
>      };
> -- 
> 2.32.0
> 
> 
