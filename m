Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B17CCA481
	for <linux-tegra@archiver.kernel.org>; Sat,  9 Jul 2022 23:21:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbiGIXVl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 9 Jul 2022 19:21:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbiGIXVk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 9 Jul 2022 19:21:40 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F1EE252B7
        for <linux-tegra@vger.kernel.org>; Sat,  9 Jul 2022 16:21:38 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id l11so3266083ybu.13
        for <linux-tegra@vger.kernel.org>; Sat, 09 Jul 2022 16:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L+wOgjBqQ4hrZ4R4pko11p6CsU3jQfxhkCfOujQvvFo=;
        b=XiLJwmKnVBWSF8VJbH5DUv22akdceFEWmU5tf2Wij3i5Nejt72HEo3E0Z8MeQK08Rb
         /jUC31VjGn4GQfcI3zGBlwB4Y9LqXfRWs/zVdjtmry1k8u5TdEuu1XQl9cNxNiFLfs08
         wZNfaE9q/2g678/Gk796BRq8sAR29E89OLKkMrGUB7ecFIaibejKYORsh+ck+Se7+7D3
         wMhaID1NflCmlbt/hkzPrKanCsTf0a7Gx7n4bvegkDET15cxHfR0QtGMX/GXD60PMl5B
         F7Zt6/SrrJcXx6UnxvwGWT5eofKyPzu7kxs7K/31d3FHJEdjMresySKZTQ+WodEJFj7u
         rqpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L+wOgjBqQ4hrZ4R4pko11p6CsU3jQfxhkCfOujQvvFo=;
        b=1fz3dEZ3tpiqtknNKc7QEXJhuJAIJMXVxcUhNCjs0yN7y7PW8WflU6WFmkvX5bUf8C
         4dor49DZMCAquU/ItnqxPUUjj6pOON0uV3BR5a+SGL8Vx5+WjtGPpMmgnPUrBlHVvyV+
         5pGk8CehCtZ87Lavotv5iHkvqg2+rqbT8LEDEF4YoRetOxShyThJU9ALvqGLEd10Xcly
         v+OQ8QWKeKCPY2qt0mxMwec2ECJLZGvcqJ295yGwLJkumOzY0EAFPcEzGnnaYJdTFdjL
         MEHCD1vNz6twBZdyFBgeQyNFEI0/SnIXy8Ref/5KPw2FV/lN4F/hWjLubaWdRd2DBuXA
         B6Ng==
X-Gm-Message-State: AJIora8iUf7JYBDn+iupv4tCe+GKnz3vIsT4YLgdfMgKuxB0NXNMvM5o
        i5S608SUJQ5qdsZrIAQ3cznZ93SwK14IZ3g3aSX0sgzmMb4=
X-Google-Smtp-Source: AGRyM1sWT2McXikvJoPgc+m40gnLYrLmZCt7Bv/q1rbes9rfucTXXl+j1dsTOZ2u1tmX67QeXmCwTahgwhU0F2a3bN0=
X-Received: by 2002:a05:6902:150a:b0:66f:8a6:be47 with SMTP id
 q10-20020a056902150a00b0066f08a6be47mr2704717ybu.291.1657408897468; Sat, 09
 Jul 2022 16:21:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220704165802.129717-1-thierry.reding@gmail.com> <20220704165802.129717-3-thierry.reding@gmail.com>
In-Reply-To: <20220704165802.129717-3-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 10 Jul 2022 01:21:26 +0200
Message-ID: <CACRpkdYGFR82DhX=n9ooVb47TvO4nDj74EDD4LyjejhwOfmoZg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: pinctrl: tegra194: Separate instances
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        Vidya Sagar <vidyas@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Jul 4, 2022 at 6:58 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> Tegra194 has two separate instances of the pin controller, one called
> AON (in the always-on domain) and another called "main".

Maybe this information should be in the bindings themselves
too?

Other than that:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
