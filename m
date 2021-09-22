Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F0A6C433FE
	for <linux-tegra@archiver.kernel.org>; Wed, 22 Sep 2021 09:29:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E28F861278
	for <linux-tegra@archiver.kernel.org>; Wed, 22 Sep 2021 09:29:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233969AbhIVJbD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 22 Sep 2021 05:31:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231543AbhIVJbC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 22 Sep 2021 05:31:02 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28012C061756
        for <linux-tegra@vger.kernel.org>; Wed, 22 Sep 2021 02:29:33 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id bk29so7381886qkb.8
        for <linux-tegra@vger.kernel.org>; Wed, 22 Sep 2021 02:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JO5Nx0mLej5h3u3fmSwF060reTP+G0Pr7u6cAAoLcmY=;
        b=aX9n0gDud0OhUSYMZP0olqdZy7LhTyP4hF9P0SQVMg8z605pv5t8oZr2Uehh2LTngZ
         oPfaP237VeqAWTLZQZdIuPs3sUm3JQ+kTWmexkJ5GLpk3QvoP9QZkemwM+xNi622Z7LW
         p2SxOJpWBh6a8aoyJLUBixOGKMp0TK9HOksWZ3IMV5QxZYfe+Q9TwlbXiQU8qeXw4O4m
         V8GmpdT8VATBJqRPzzgAODvJVDgyjDs5aSS6IkK0liYiFc1QkFFxqYPT50U3itMFmplB
         QAZo3D/pkzdUIiOncklZzDcbls2dah/2pk3Uj91rLg8tDTqv27HiR0hvOJvA238b3Ub+
         6Yeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JO5Nx0mLej5h3u3fmSwF060reTP+G0Pr7u6cAAoLcmY=;
        b=rAGtwyqC1wt4ze9NBGq1uRB3mYKghfOOprjw4AphzamYSGItFeycDxCk1N0EFuge2F
         Wr62j1SioVe+UQF7VlSKeZ+62s77JlFgNFmeISrHkboPbfhI2Ru/4wGTbq+mc9SHNsXB
         G45YHKryUflBIjOcikxHQHLpgb7/yiA2lPUCkj1uqWRYG6Iwgz62ogmEoN2cBI9DSlY5
         U22eTdYbOxKZMv4/Y3CWstspvdaf3RlTzXNFn1gEJzCx+/TcL2iu3OhDhCUT8HJfhbI5
         p7EaNtExpBddU2ZX2HObAMTMdy6nql69OSvbbxf8n/Cvcy9t282hRTwDbskilINuky07
         SUvw==
X-Gm-Message-State: AOAM5321rZeqDjKRWKtUaePYDMG1iohQtgVGZSQ8xF6heJnJsUxg+imj
        lXMb3SDlCzb5baDobWJkqF4kUoS+o7b9GdzqxGrAFA==
X-Google-Smtp-Source: ABdhPJx7VkTdGs+dUIY3C1YCJiShiuMVXfZPIlj+LfD84rr+QhrShX1BsdYjBrsdYLtEAVhtuL9l+8WoS4czFJiV/Ew=
X-Received: by 2002:a25:7146:: with SMTP id m67mr43593824ybc.353.1632302972198;
 Wed, 22 Sep 2021 02:29:32 -0700 (PDT)
MIME-Version: 1.0
References: <YTWeSJ7jGamxx9Uu@orome.fritz.box> <20210907073224.3070-1-pshete@nvidia.com>
 <20210907073224.3070-3-pshete@nvidia.com>
In-Reply-To: <20210907073224.3070-3-pshete@nvidia.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 22 Sep 2021 11:29:21 +0200
Message-ID: <CAMpxmJWyepTvUQEAVDB2b=uocFTq49=yRiCXrxnwyLMe7LY_1Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: tegra: GPIO Interrupt entries
To:     Prathamesh Shete <pshete@nvidia.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, smangipudi@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Sep 7, 2021 at 9:32 AM Prathamesh Shete <pshete@nvidia.com> wrote:
>
> From: pshete <pshete@nvidia.com>
>
> Tegra19x supports 8 entries for GPIO controller.
> This change adds the required interrupt entires for all GPIO controllers.
>
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 49 +++++++++++++++++++++++-
>  1 file changed, 47 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> index b7d532841390..c681a79c44ec 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> @@ -34,11 +34,53 @@
>                         reg = <0x2200000 0x10000>,
>                               <0x2210000 0x10000>;
>                         interrupts = <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 291 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
>                                      <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
>                                      <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
>                                      <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>,
>                                      <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
> -                                    <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>;
> +                                    <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>;
>                         #interrupt-cells = <2>;
>                         interrupt-controller;
>                         #gpio-cells = <2>;
> @@ -1273,7 +1315,10 @@
>                         reg-names = "security", "gpio";
>                         reg = <0xc2f0000 0x1000>,
>                               <0xc2f1000 0x1000>;
> -                       interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
>                         gpio-controller;
>                         #gpio-cells = <2>;
>                         interrupt-controller;
> --
> 2.17.1
>

Prathamesh: what are the changes between the three versions of this
patch I have in my inbox? Please always include a brief list of
updates when resending.

Thierry: does this make sense to you?

Bart
