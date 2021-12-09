Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 961DCC433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 20:56:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232424AbhLIU7m (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 15:59:42 -0500
Received: from mail-ot1-f52.google.com ([209.85.210.52]:39891 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232405AbhLIU7l (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 15:59:41 -0500
Received: by mail-ot1-f52.google.com with SMTP id r10-20020a056830080a00b0055c8fd2cebdso7538740ots.6;
        Thu, 09 Dec 2021 12:56:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=Q0BmhIUvzFSnmaLrtcmnKH0ppS78NiS4f4B96dy/E8k=;
        b=yKGsgTAl7TYEmBz4sHzKu09MkCNF31aogfCEWbulCVynMAYJMNfUK9NrixXbUlbq3+
         HMcHVATSluA1TACPfmIswFjROBLCqtcsHnFL4OKDBfOICnHaPQbWPcJLqbHsyBLEhy4Q
         Imyqaz6FXISX/8sa3dZ/MZ5dq7bBHXMmDIPefTywVem/iE1qJpSXrayQxta/6ZGD2F+h
         YkedAod/+mqchVNOF/556leki686V9l8T8T0IK4jqGaPQ0EjCIFNwP7cLCAjGuYQZ8th
         JALh1S97NLq5ShpSowJpdmldsypLhWVeHrNjXI3f5aKkTDp25WMamStKeW4thbQROcuT
         jmDA==
X-Gm-Message-State: AOAM533wtYMnsJoKXkU1yJ1O14tkEXeunVmQjTIQbBB4lY37AyVmkeCg
        M4qP8rh2hanlRcypaanN2g==
X-Google-Smtp-Source: ABdhPJyGNZLLEZXj6XR+8XTNnwCvFajOI2rvV4ES0BPIJ0XhE+6ENBWSjUMjNLFDQri7vLEjvv/IFw==
X-Received: by 2002:a05:6830:1e25:: with SMTP id t5mr7764194otr.291.1639083366498;
        Thu, 09 Dec 2021 12:56:06 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id p6sm165291oof.0.2021.12.09.12.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 12:56:05 -0800 (PST)
Received: (nullmailer pid 3925950 invoked by uid 1000);
        Thu, 09 Dec 2021 20:55:59 -0000
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Nagarjuna Kristam <nkristam@nvidia.com>,
        devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Chen <peter.chen@freescale.com>,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        JC Kuo <jckuo@nvidia.com>, Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20211209165339.614498-3-thierry.reding@gmail.com>
References: <20211209165339.614498-1-thierry.reding@gmail.com> <20211209165339.614498-3-thierry.reding@gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: usb: tegra-xusb: Convert to json-schema
Date:   Thu, 09 Dec 2021 14:55:59 -0600
Message-Id: <1639083359.709511.3925949.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 09 Dec 2021 17:53:38 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the Tegra XUSB controller bindings from the free-form text
> format to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/usb/nvidia,tegra124-xusb.txt     | 132 -----------
>  .../bindings/usb/nvidia,tegra124-xusb.yaml    | 201 +++++++++++++++++
>  .../bindings/usb/nvidia,tegra186-xusb.yaml    | 182 +++++++++++++++
>  .../bindings/usb/nvidia,tegra194-xusb.yaml    | 188 ++++++++++++++++
>  .../bindings/usb/nvidia,tegra210-xusb.yaml    | 210 ++++++++++++++++++
>  5 files changed, 781 insertions(+), 132 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.yaml
>  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra186-xusb.yaml
>  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra194-xusb.yaml
>  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra210-xusb.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/1565847


usb@70090000: clock-names:4: 'xusb_ss_div2' was expected
	arch/arm64/boot/dts/nvidia/tegra132-norrin.dt.yaml
	arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dt.yaml
	arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dt.yaml
	arch/arm64/boot/dts/nvidia/tegra210-p2571.dt.yaml
	arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dt.yaml
	arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dt.yaml
	arch/arm64/boot/dts/nvidia/tegra210-smaug.dt.yaml
	arch/arm/boot/dts/tegra124-apalis-eval.dt.yaml
	arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dt.yaml
	arch/arm/boot/dts/tegra124-jetson-tk1.dt.yaml
	arch/arm/boot/dts/tegra124-nyan-big.dt.yaml
	arch/arm/boot/dts/tegra124-nyan-blaze.dt.yaml
	arch/arm/boot/dts/tegra124-venice2.dt.yaml

usb@70090000: clock-names:5: 'xusb_ss_src' was expected
	arch/arm64/boot/dts/nvidia/tegra132-norrin.dt.yaml
	arch/arm64/boot/dts/nvidia/tegra210-p2371-0000.dt.yaml
	arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dt.yaml
	arch/arm64/boot/dts/nvidia/tegra210-p2571.dt.yaml
	arch/arm64/boot/dts/nvidia/tegra210-p2894-0050-a08.dt.yaml
	arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dt.yaml
	arch/arm64/boot/dts/nvidia/tegra210-smaug.dt.yaml
	arch/arm/boot/dts/tegra124-apalis-eval.dt.yaml
	arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dt.yaml
	arch/arm/boot/dts/tegra124-jetson-tk1.dt.yaml
	arch/arm/boot/dts/tegra124-nyan-big.dt.yaml
	arch/arm/boot/dts/tegra124-nyan-blaze.dt.yaml
	arch/arm/boot/dts/tegra124-venice2.dt.yaml

usb@70090000: dvdd-pex-pll-supply: [[35]] is not of type 'object'
	arch/arm64/boot/dts/nvidia/tegra210-smaug.dt.yaml

usb@70090000: hvdd-pex-pll-e-supply: [[36]] is not of type 'object'
	arch/arm64/boot/dts/nvidia/tegra210-smaug.dt.yaml

