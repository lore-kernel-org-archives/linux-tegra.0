Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6966DC4332F
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Nov 2022 18:50:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241673AbiKRSu6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Nov 2022 13:50:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235421AbiKRSu6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Nov 2022 13:50:58 -0500
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD6766A684;
        Fri, 18 Nov 2022 10:50:53 -0800 (PST)
Received: by mail-ot1-f44.google.com with SMTP id t19-20020a9d7753000000b0066d77a3d474so3602119otl.10;
        Fri, 18 Nov 2022 10:50:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JOLYMjkXXvB/weWZsQxyRISw40hXb3p7LqGqtWVTDyk=;
        b=sTF/mHtX5e0RWJM4kWUnBNqThzunWU5J/qo9/hkGcTQFwClaO9VetXNd8tg5XNR+Bm
         d5FxSP9Uq3e3SqnBJPBBVBiJGk9P9YmYmEsZneg1rjBFTl8T3HxswfnkmZrHf0hSifWI
         auhVf/39Nb9clnemKYo46dttBw75Y3yS7xLU0EljSg9EwwS1CdqmlucNVb4sjFcEB263
         JlI4Waj6sFrHtkELi0sYN9VRV+pZwAYapXVRrIDLeHpieQgACbltPobQ4i+FedlMh2pV
         uJm5afTPURkRkc25zszPjvN9GLXk2yQ8a+aUCuzSIgGQnZS+LtUpRPmHJTF8UBHveu46
         0cMQ==
X-Gm-Message-State: ANoB5pkpChfOo+TPhkgojzaK20crAZceZ6NrLlpbBqo5Y1qyEmnTlXyz
        njUpllYXDsCm7EG3HtnnyA==
X-Google-Smtp-Source: AA0mqf7tBcu9Tt0wpRksmHNxtPfG9uapvJ93nee4Ye90gw6t5D9ERUX1LfIp81dsHVG05A5sBN7PqQ==
X-Received: by 2002:a9d:7e9a:0:b0:66c:6096:1878 with SMTP id m26-20020a9d7e9a000000b0066c60961878mr4549610otp.203.1668797452969;
        Fri, 18 Nov 2022 10:50:52 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r25-20020a056830135900b00661c0747545sm1889218otq.44.2022.11.18.10.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 10:50:52 -0800 (PST)
Received: (nullmailer pid 856954 invoked by uid 1000);
        Fri, 18 Nov 2022 18:50:54 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     krzysztof.kozlowski+dt@linaro.org, linux-tegra@vger.kernel.org,
        treding@nvidia.com, linux-usb@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        waynec@nvidia.com, Mathias Nyman <mathias.nyman@intel.com>,
        vkoul@kernel.org, gregkh@linuxfoundation.org
In-Reply-To: <20221118154006.173082-2-jonathanh@nvidia.com>
References: <20221118154006.173082-1-jonathanh@nvidia.com>
 <20221118154006.173082-2-jonathanh@nvidia.com>
Message-Id: <166879727106.849035.12126185559088998329.robh@kernel.org>
Subject: Re: [PATCH V4 1/6] dt-bindings: usb: Add NVIDIA Tegra234 XUSB host
 controller binding
Date:   Fri, 18 Nov 2022 12:50:54 -0600
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On Fri, 18 Nov 2022 15:40:01 +0000, Jon Hunter wrote:
> From: Wayne Chang <waynec@nvidia.com>
> 
> Add device-tree binding documentation for the XUSB host controller present
> on Tegra234 SoC. This controller supports the USB 3.1 specification.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> V3 -> V4: minor update to the power-domain description
> V2 -> V3: nothing has changed
> V1 -> V2: address the issue on phy-names property
> 
>  .../bindings/usb/nvidia,tegra234-xusb.yaml    | 158 ++++++++++++++++++
>  1 file changed, 158 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.example.dts:36.29-30 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:406: Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1492: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221118154006.173082-2-jonathanh@nvidia.com

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command.

