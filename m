Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B60ECAAD5
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Sep 2022 10:39:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231149AbiIHKj4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 8 Sep 2022 06:39:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231187AbiIHKjm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 8 Sep 2022 06:39:42 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED11DB6D;
        Thu,  8 Sep 2022 03:39:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 96E41B82085;
        Thu,  8 Sep 2022 10:39:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBA85C433C1;
        Thu,  8 Sep 2022 10:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662633568;
        bh=GH13TrqmEr3vTznd3WCSEhXe4hhEBAQz+sg6JAdayE0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=e89c3+pKTqDeklmZK0N4PF/vOxkOzLt14Tg1ks02yS0BEvrP5tw9mAaQPjYBj9xvi
         c9KvLhqszrJNsjLC0zzV60vwJPzoWTJVs3rlpmInO6Y9LNws7j96BzqyEoU7kKmfDL
         nuTCTM+5f6UlQcvkFOP/BM3UF4RqmdjVhe1ik4abZ4F8suhlaH3mYKuTgkY+/pbrLL
         cWhXKpnjvXYGmEzIiJt9lM9ZMcgGeghVu47Fm3NHMz1PQQDvPD0VdjucFdzEynxCM5
         LOMcTl9jCkVNsluei77YR/kcVzZepG4MJYzzIF9C9P4+pH6Y3QTslwWZk1q5Hz+iFr
         cPanu1sFXQNAg==
Date:   Thu, 8 Sep 2022 11:39:21 +0100
From:   Lee Jones <lee@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] mfd: stmpe: switch to using gpiod API
Message-ID: <YxnGWRIrabWTKwxk@google.com>
References: <YxeS1BK2OBH1P/kO@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YxeS1BK2OBH1P/kO@google.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 06 Sep 2022, Dmitry Torokhov wrote:

> This patch switches the driver away from legacy gpio/of_gpio API to
> gpiod API, and removes use of of_get_named_gpio_flags() which I want to
> make private to gpiolib.
> 
> We also need to patch relevant DTS files, as the original code relied on
> the fact that of_get_named_gpio_flags() would fetch any data encoded in
> GPIO flags, even if it does not reflect valid flags for a GPIO.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
> 
> v1->v2:
>  - add DTS changes, as noticed by Francesco Dolcini.
> 
> I guess we could do a dance of changing stmpe to check the flags coming
> from DTS and try to distinguish IRQ flags from proper GPIO flags, then
> have a separate patch changing DTSes, and finally a 2nd patch to stmpe
> to use GPIOD API, but I am hoping we could apply this in one go...
> 
>  arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi |  2 +-
>  arch/arm/boot/dts/tegra30-apalis.dtsi      |  2 +-
>  arch/arm/boot/dts/tegra30-colibri.dtsi     |  2 +-
>  drivers/mfd/stmpe.c                        | 36 ++++++++--------------
>  4 files changed, 16 insertions(+), 26 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
