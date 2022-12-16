Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD46BC001B2
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Dec 2022 17:40:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231401AbiLPRkh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 16 Dec 2022 12:40:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231398AbiLPRkg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 16 Dec 2022 12:40:36 -0500
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 273F9220E8;
        Fri, 16 Dec 2022 09:40:36 -0800 (PST)
Received: by mail-oi1-f170.google.com with SMTP id n205so2562067oib.1;
        Fri, 16 Dec 2022 09:40:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k03+120Bwda68nhatb2sZ6u2j7/npw5j4kN/7IWeBe0=;
        b=LiUvj+H09zpU3EDY6olBpBEEl4suO7L2RoSMuQcl6wza9ygrZG3lLdmekKNaYOdape
         hd47przBT9d58Xyz/DpukZ0GuWnqzZ5yweFvZkLsdR4EqJ5BOEl6lXdLtFDSXumn32R2
         Ix7MS/FHHq8feGxMOVJTs6oyUHOW3sIOYD0TwGwlTPmtqcBvQ8qKw6xUYllYqOclSj33
         8HGGI3fqDBeV+NRTH2ylgWSZt/x7ctQglBhLHJwpvdQ1JK4krpLSA0bq+UyRLez/CcFs
         ZLfClhByd2Ab72Ul2waKAKdw/0RN1CN1DX2a/nGx+NFgBVcyMfEMt2WSFoKERHaKLq/i
         EARQ==
X-Gm-Message-State: ANoB5pnuZNqMiTjMvq5N7xHE8uPETgz16gONG+gZqWblQTk8mEQNEdrd
        pY2/LopyF3o/TGyi4nfopFYway1Ujg==
X-Google-Smtp-Source: AA0mqf4j+1gCzTWTqG8Q7r4G19ApLuPHJDtf21G0OZGytL9qSkBoT+MN0VSi2zedGbaRcZkHJU1paQ==
X-Received: by 2002:a05:6808:3023:b0:35c:6b4:9e0d with SMTP id ay35-20020a056808302300b0035c06b49e0dmr17967471oib.26.1671212435395;
        Fri, 16 Dec 2022 09:40:35 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id c20-20020a056808105400b0035c21f1a570sm989784oih.6.2022.12.16.09.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 09:40:34 -0800 (PST)
Received: (nullmailer pid 2988714 invoked by uid 1000);
        Fri, 16 Dec 2022 17:40:34 -0000
Date:   Fri, 16 Dec 2022 11:40:34 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH] dt-bindings: usb: tegra-xusb: Remove path references
Message-ID: <20221216174034.GA2986753-robh@kernel.org>
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

As this is the only binding issue remaining in Linus's tree and it's the 
only thing in the Tegra tree, I've applied it for rc1.

Rob
