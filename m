Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61717C77B7F
	for <linux-tegra@archiver.kernel.org>; Mon,  8 May 2023 11:28:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235834AbjEHL2I (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 8 May 2023 07:28:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235765AbjEHL1o (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 8 May 2023 07:27:44 -0400
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0903C38F18;
        Mon,  8 May 2023 04:27:31 -0700 (PDT)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-38e12d973bfso2257344b6e.0;
        Mon, 08 May 2023 04:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683545250; x=1686137250;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RLxQz9u+YcsKkSQbgJAL99s7i6wSU+2HHEAtjvqTVhA=;
        b=XX2CuI0Vd9FeD8pXjpRj34F1wX1jzya4fbB0jiLIRLzIO5VyOeqOKxKMkQdCO+cndQ
         GSDQAI9VoXBOxe+I7kstFF/yWJ4fkpCqFReUAJ/JjjaA4pO0xfJsB2L8ENvsjx99Tk6i
         OZA8+2yK35uD+FS3HKw8kkj+c/UJUVmtz2y8tQD96UVCNOTh4IRRCLlv09FrLIW46vj+
         5oqRfuUx/oP0UkS0fKJwifPoSIqUXXmwyFg5Bw4Qsl+bQ5Yv6ocKbAfsss1fOkGmiJr8
         gFN1t2xczckgqtcFS7stbZ5YrCqQr+8Ny1q6kCC19tvRLPtuC+vkqU1KoqTOTfISgQab
         /ytw==
X-Gm-Message-State: AC+VfDwGj439dZzbfP3/KDalfdg5hodimQR03xfi3brT0VzO+LgpF8p0
        d/6/oVl+i+oYDoLQ9mFDdHo7CM7w73yI
X-Google-Smtp-Source: ACHHUZ7Ju49ObLf4ykRvD1k8VLj0HUMhfkD4xURbYUOAbhVb6eK2iJHUr7gBK1NfSK4+Z+P4zuyqzA==
X-Received: by 2002:a05:6808:5c8:b0:383:ca99:c70e with SMTP id d8-20020a05680805c800b00383ca99c70emr4326254oij.59.1683545249993;
        Mon, 08 May 2023 04:27:29 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n23-20020a4ae1d7000000b0054574f35b8esm3918332oot.41.2023.05.08.04.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 04:27:29 -0700 (PDT)
Received: (nullmailer pid 789281 invoked by uid 1000);
        Mon, 08 May 2023 11:27:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Shubhi Garg <shgarg@nvidia.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com
In-Reply-To: <20230508102733.1751527-1-shgarg@nvidia.com>
References: <20230508102733.1751527-1-shgarg@nvidia.com>
Message-Id: <168354524653.789162.6725251128865957840.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: tegra: Document compatible for IGX
Date:   Mon, 08 May 2023 06:27:28 -0500
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On Mon, 08 May 2023 10:27:32 +0000, Shubhi Garg wrote:
> Document the compatible strings used for Nvidia IGX Orin Development
> kit which uses P3701 SKU8 and P3740 carrier board.
> 
> Signed-off-by: Shubhi Garg <shgarg@nvidia.com>
> ---
> 
> v2: sorted IGX Orin position as per part number. Since
> P3740 is designed prior to P3768, it is placed before Orin NX.
> 
>  Documentation/devicetree/bindings/arm/tegra.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,ov2685.example.dtb: camera-sensor@3c: port:endpoint:data-lanes: [[1]] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,ov2685.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/rockchip-isp1.example.dtb: camera@3c: port:endpoint:data-lanes: [[1]] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/ovti,ov2685.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.example.dtb: pcie-ep@33800000: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.yaml

doc reference errors (make refcheckdocs):
Documentation/usb/gadget_uvc.rst: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
MAINTAINERS: Documentation/devicetree/bindings/pwm/pwm-apple.yaml

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230508102733.1751527-1-shgarg@nvidia.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

