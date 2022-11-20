Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2430EC43217
	for <linux-tegra@archiver.kernel.org>; Sun, 20 Nov 2022 17:42:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbiKTRmd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 20 Nov 2022 12:42:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbiKTRmc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 20 Nov 2022 12:42:32 -0500
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABAD09FD8;
        Sun, 20 Nov 2022 09:42:30 -0800 (PST)
Received: by mail-ot1-f51.google.com with SMTP id t19-20020a9d7753000000b0066d77a3d474so6109124otl.10;
        Sun, 20 Nov 2022 09:42:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCCPjZtWshKFQjpKw7QH7Y7y6RWnvQ9C2CBNrgtwxJo=;
        b=xM/oqW6SjPN1j2oKteDb0qRZJBf2Htw9DOF38M3NwohogV2w9rKKGuU5vmTWboV05b
         NipnQYPQyeDvPsvAvAeIAmikneA6SJb8wwNPEovliB3InIdKBHRDgq/zwV41kMuMs3lv
         /lHEEavxW3ZeSKn/7HxVpRfmdgkvDs+F/dUo/Zd9LvhjbpU1wSeyAmDA6jL66OtiMOQc
         MEUxl8EUwi7J7ik8/gomSqNP4AYIy0fkcQc08T1DJuWBPiSAgE7ehFOtpNLTyHdHOzg/
         zITM49LJv/iisEk+XI5KtY4wjBvSVnzLTYFPZWm61vE+PYVQLDhSsu2WJ/wll8HfLHgm
         csbQ==
X-Gm-Message-State: ANoB5pltC3Tx/6tSHwvDfKE80L3EQhU1k9xt5sTZT1qMeukJb5BJxknA
        s9h5tVeVmcDYPaoHHvuy3g==
X-Google-Smtp-Source: AA0mqf5zowME2p9bo4+NhkeXyk5wpXT7RHdmjMXh6h31s4hiPix5+hu/VYEXX8+XckScsbxWvxnObA==
X-Received: by 2002:a9d:7ad0:0:b0:66d:6909:94c1 with SMTP id m16-20020a9d7ad0000000b0066d690994c1mr8134227otn.97.1668966149922;
        Sun, 20 Nov 2022 09:42:29 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:80f8:5cb3:df5a:23c3:86fb:15a6])
        by smtp.gmail.com with ESMTPSA id l64-20020a9d1b46000000b0066de9dc966fsm1267918otl.65.2022.11.20.09.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 09:42:29 -0800 (PST)
Received: (nullmailer pid 3246071 invoked by uid 1000);
        Sun, 20 Nov 2022 17:42:31 -0000
Date:   Sun, 20 Nov 2022 11:42:31 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: tegra: Allow #{address,size}-cells = <2>
Message-ID: <166896615039.3245993.109274699067265058.robh@kernel.org>
References: <20221117175619.2284668-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221117175619.2284668-1-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On Thu, 17 Nov 2022 18:56:19 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Both 1 and 2 are valid values for #address-cells and #size-cells on the
> various busses specified in these bindings, so explicitly allow 2.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/bus/nvidia,tegra210-aconnect.yaml     | 4 ++--
>  .../bindings/display/tegra/nvidia,tegra186-display.yaml       | 4 ++--
>  .../devicetree/bindings/sound/nvidia,tegra210-ahub.yaml       | 4 ++--
>  .../devicetree/bindings/sound/nvidia,tegra210-ope.yaml        | 4 ++--
>  4 files changed, 8 insertions(+), 8 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
