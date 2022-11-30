Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30E98C4321E
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Nov 2022 20:48:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbiK3UsQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Nov 2022 15:48:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbiK3UsO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Nov 2022 15:48:14 -0500
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2221127901;
        Wed, 30 Nov 2022 12:48:14 -0800 (PST)
Received: by mail-ot1-f49.google.com with SMTP id s9-20020a05683004c900b0066e7414466bso164951otd.12;
        Wed, 30 Nov 2022 12:48:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+10mQQnKL+RpcNRHyz4kOrwroAQV9Weo7s9+KyGrg3k=;
        b=7odvETaaIZ7AqIMzmGuafhu1mctt3Ok2bjptRkXMzBbXaGqnzbTrFTgA7ZvDb3vhFQ
         0MNMaPAGCXSNaLuVQ9Iq3xBQrVR6pnDEWGNfkv/zwi2uEgh4/AIUvUdLAf7+U1R8lRB3
         GwgSMqdv7FU/52SqOizv/IXI2Bw8KlhpnDhiL1sdD7PFoClkk7SGzX1NeOeI8nlLhMvM
         7xduO+BEA3+49ufzA9TvBW94ZuOstPCz867+H3PTOWlMlXTuC2Dgr43GdUIQjJpe8/qB
         FWwEHw43r40SG6A4x5iOdjmvwAWMsMNp88+uzst99JpHkqrqEGP4PBYntnIEc8Bk/tUr
         +mPA==
X-Gm-Message-State: ANoB5plRaolTgxfe2rvgHtzCri+I6+Xjr93BxlZTrE50fWd6yGeRd0fk
        Uejjg0zkBLXf0Mfsen2nUDXM9FJYPA==
X-Google-Smtp-Source: AA0mqf79JfTWhTiipndMzsy0NFp6T1qtjxfyE04byDZPhAlC0Jp6nd53snsnlNnQhCY0V5QrUy0EYg==
X-Received: by 2002:a9d:4812:0:b0:66d:1e19:684b with SMTP id c18-20020a9d4812000000b0066d1e19684bmr32141795otf.44.1669841293372;
        Wed, 30 Nov 2022 12:48:13 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id u9-20020a056870f28900b0011bde9f5745sm1734558oap.23.2022.11.30.12.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 12:48:12 -0800 (PST)
Received: (nullmailer pid 2900413 invoked by uid 1000);
        Wed, 30 Nov 2022 20:48:12 -0000
Date:   Wed, 30 Nov 2022 14:48:12 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH] dt-bindings: usb: tegra-xusb: Remove path references
Message-ID: <20221130204812.GA2899835-robh@kernel.org>
References: <20221130154111.1655603-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221130154111.1655603-1-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Nov 30, 2022 at 04:41:11PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Unresolved path references are now flagged as errors when checking the
> device tree binding examples, so convert them into label references.
> 
> Reported-by: Conor Dooley <conor.dooley@microchip.com>
> Suggested-by: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/usb/nvidia,tegra124-xusb.yaml     | 4 +---
>  .../devicetree/bindings/usb/nvidia,tegra186-xusb.yaml     | 4 +---
>  .../devicetree/bindings/usb/nvidia,tegra194-xusb.yaml     | 8 ++------
>  .../devicetree/bindings/usb/nvidia,tegra210-xusb.yaml     | 8 ++------
>  4 files changed, 6 insertions(+), 18 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
