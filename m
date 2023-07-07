Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97AA8EB64D9
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Jul 2023 22:31:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbjGGWbI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Jul 2023 18:31:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbjGGWbH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Jul 2023 18:31:07 -0400
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7475F199F;
        Fri,  7 Jul 2023 15:31:06 -0700 (PDT)
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-7837329a00aso85887339f.2;
        Fri, 07 Jul 2023 15:31:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688769065; x=1691361065;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6RfTvgUzawoAp3bm2idQ65182mlITssux6jnfGYM40U=;
        b=YRwEK/hfEJ1vRX4/EM/umzZ5b1sUPnQm54BxNzT/r5Oh4diMiaoZDrz6UQHvhRVHSQ
         hOdbfymWmizXnhdZoYLWtQxmJW4kbCaeDp2orZUk61/S86EyMXWRG2pRp/AboZyt2XFI
         ity7I0hF664d6Wa/7jbFBtmMWwf6TVaPLdGYrIXnINwLEj2szkZff+mVaPZb64ACUSQO
         PTKWasWifX+BLu7fJB1UxZPk+wGa4Q95ZRehNbkJKEBdGpYpyZiXtRj+3T++aFFWzPnf
         3xcQ7o0wiRjFjufxbUvnWpciXbZqjyF77/OgiMZWJCWfAndu2jKNlyOKRH+sLl34trPH
         kt6w==
X-Gm-Message-State: ABy/qLZAGE2acDSDg6ybUqoLi/EIKvG7qHsdtPvGI8XdzZKiWMXH2JTJ
        puEuOHX+2JMVkd1/s8tyXA==
X-Google-Smtp-Source: APBJJlHSn0Y07K0ffARJJSESLTTvEb6rSG3Egmq83u04e5DPlLE6sA6t9VWvNTGLw4tojilmS6XdQQ==
X-Received: by 2002:a05:6602:274e:b0:783:4f8d:4492 with SMTP id b14-20020a056602274e00b007834f8d4492mr6689228ioe.8.1688769065668;
        Fri, 07 Jul 2023 15:31:05 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id r2-20020a6bd902000000b007835a305f61sm1578675ioc.36.2023.07.07.15.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 15:31:04 -0700 (PDT)
Received: (nullmailer pid 1087020 invoked by uid 1000);
        Fri, 07 Jul 2023 22:31:03 -0000
Date:   Fri, 7 Jul 2023 16:31:03 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 4/7] dt-bindings: arm: tegra: pmc: Increase maximum
 number of clocks per powergate
Message-ID: <168876906306.1086965.5227361786507351378.robh@kernel.org>
References: <20230707131711.2997956-1-thierry.reding@gmail.com>
 <20230707131711.2997956-4-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230707131711.2997956-4-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On Fri, 07 Jul 2023 15:17:08 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Some powergate definitions need more than 8 clocks, so bump the number
> up to 10, which is the current maximum in any known device tree file.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

