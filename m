Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0A95C433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 20:56:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232386AbhLIU7j (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 15:59:39 -0500
Received: from mail-ot1-f46.google.com ([209.85.210.46]:34506 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231237AbhLIU7h (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 15:59:37 -0500
Received: by mail-ot1-f46.google.com with SMTP id x19-20020a9d7053000000b0055c8b39420bso7570916otj.1;
        Thu, 09 Dec 2021 12:56:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=SO1Q6ppvlPhzwKZ5O0cuaK8L1+15gECj7qO9wA+2xdw=;
        b=gGJZCQiuDpYL15vEfVGY7adFWzYYk8+FcCa/w1wK+tWbzJ7v4dLFWD4cje4fWy8Qn/
         FWnLlxYyco2+PvDRxMOfz35e2cGkKweeE0N4g+cA57F71jW3EsJb4jM5GDUcW6yDX1QS
         rR/ARL2Uzpx/p8/XLpwI4qH2Za4y2Ic8wTXPaf4yi979WTCPGqiOi99TTwLCwBROAldA
         WP6/wVznaYyvXda0E60E5ajg60eIk3j1DLI7mWsNZkAHnFiyEAkbDO0mb/Ym3/6w+/KC
         DzZeMSV3ONjtyjUVhoH22fHY83Q6vQXuTQNXFNkchZUJ7cSVBkKE7tGWu+NQ5VP05mYT
         qeog==
X-Gm-Message-State: AOAM5338asReF9JOizkoL5cD149Hy9OxX8e2WSQmln7REuS+9sg7zdJE
        ROvKP02m41EfaVzThvM0aA==
X-Google-Smtp-Source: ABdhPJy0WPnnQYchzAy8OcFoRaPVCjI5EOVF6XlBQp6WmJSQzVNa48UzVmqSLSWQim4SIgfwup0bcg==
X-Received: by 2002:a9d:7a42:: with SMTP id z2mr7705387otm.362.1639083363061;
        Thu, 09 Dec 2021 12:56:03 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id d6sm159444otb.4.2021.12.09.12.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 12:56:02 -0800 (PST)
Received: (nullmailer pid 3925948 invoked by uid 1000);
        Thu, 09 Dec 2021 20:55:59 -0000
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     devicetree@vger.kernel.org,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        JC Kuo <jckuo@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Chen <peter.chen@freescale.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
In-Reply-To: <20211209165339.614498-2-thierry.reding@gmail.com>
References: <20211209165339.614498-1-thierry.reding@gmail.com> <20211209165339.614498-2-thierry.reding@gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: usb: tegra: Convert to json-schema
Date:   Thu, 09 Dec 2021 14:55:59 -0600
Message-Id: <1639083359.697962.3925947.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 09 Dec 2021 17:53:37 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the old plain-text device tree bindings for the USB EHCI
> controller found on NVIDIA Tegra SoCs to the json-schema format.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> 
> ---
> Changes in v2:
> - include usb-hcd.yaml and usb-drd.yaml
> - drop redundant phy_type property
> 
>  .../bindings/clock/nvidia,tegra124-car.yaml   |   5 +
>  .../bindings/clock/nvidia,tegra20-car.yaml    |   5 +
>  .../bindings/usb/nvidia,tegra20-ehci.txt      |  23 ---
>  .../bindings/usb/nvidia,tegra20-ehci.yaml     | 156 ++++++++++++++++++
>  4 files changed, 166 insertions(+), 23 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1565844


usb@7d004000: asix@1: 'compatible' is a required property
	arch/arm/boot/dts/tegra30-colibri-eval-v3.dt.yaml

usb@c5004000: asix@1: 'compatible' is a required property
	arch/arm/boot/dts/tegra20-colibri-eval-v3.dt.yaml
	arch/arm/boot/dts/tegra20-colibri-iris.dt.yaml

