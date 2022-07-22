Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 252A2C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jul 2022 17:17:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236010AbiGVRRX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 22 Jul 2022 13:17:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235982AbiGVRRW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 Jul 2022 13:17:22 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A518913F9C
        for <linux-tegra@vger.kernel.org>; Fri, 22 Jul 2022 10:17:20 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id d17so6539780lfa.12
        for <linux-tegra@vger.kernel.org>; Fri, 22 Jul 2022 10:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=kKlkNDy7IkULxlqR/cm5H8XjRPA1VC1UXnLKGJxFlME=;
        b=kBc+EnEOjMvGg2ZacnNtByBS5zqpdyDA3715FeJnzHEz8i7uQ3YazW37ESeq6Bt/Xs
         xfZxUKs2P9eMWf6y8K6/VFe7VOybuL/G6VLN3AIKAgqfVnwnDcWIaWqMeBD90b1cHJEm
         CrGy0+PfYoICbO7lBsY1q6kAKWV6HYUaZI6Pxj9bQK+3VRbuFAmNR6timpbiAbfNAD1h
         RgrdIYtHkCLgg+QKCKOKx3J8mbJQ8vlMXmwgS5nuRcsGKH/WiePo8hsKWsIvPjTXvgG5
         74rE/woUGUEcCuZI9zWfuFtnmKLvL6vpUJWmdAEsEulykLv048QBWoQr4lEKzl+ShQ0H
         hidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kKlkNDy7IkULxlqR/cm5H8XjRPA1VC1UXnLKGJxFlME=;
        b=198fZnmZ8xWTLEKiVCvdPd59Bva7cVjQSGOKCZrY9ScZhx8cZbjI0UydZK8OsH0/LI
         J8ODxO0cLbHeP//HkAzB35unTRfYyNiVmcV53ie2+d+iows9oddOGewr7s0wHBCfPN30
         OhcJL4/15odsubfH7eaAHy+vqdt0TUQ6+86z6gm2s2GpxB1bOQeK4LfsSzC50Zj5ZCAl
         Mszul+OO2zJfQhS14HQdTjE2ex3Uo4YS2HWmxYI5KKFIq1mxPa//bLTuEnKx+SO3Nr/d
         i1oJLMHZFSPkHGSxhERFafZjEJUBh9wKGuk8Hi1IX3gWJ6m+Wj5KmyKIgfa8Oe4a3m17
         v8Mg==
X-Gm-Message-State: AJIora8NSvVeHWxmta3Dk3cLyKg0tM6rAVKZqEpU3uzWz5cjqGtfJidC
        3Ukua8vJ17ZiAX/Ia/fxt/OdLg==
X-Google-Smtp-Source: AGRyM1tCkKIh7mn6CioEd8be2QKiJ6B5weamVHcEf6LV7UC4qd+9bgwV6JWvuVCeXL6DaArFJ0VqEA==
X-Received: by 2002:a05:6512:b84:b0:48a:7d72:407c with SMTP id b4-20020a0565120b8400b0048a7d72407cmr183405lfv.537.1658510238975;
        Fri, 22 Jul 2022 10:17:18 -0700 (PDT)
Received: from [192.168.10.173] (93.81-167-86.customer.lyse.net. [81.167.86.93])
        by smtp.gmail.com with ESMTPSA id e6-20020a05651236c600b0048a72437127sm962811lfs.42.2022.07.22.10.17.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jul 2022 10:17:18 -0700 (PDT)
Message-ID: <3c3bccc2-786f-45f2-fe30-3e0c9f95da63@linaro.org>
Date:   Fri, 22 Jul 2022 19:17:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/6] ARM: defconfig: address renamed CONFIG_DEBUG_INFO=y
Content-Language: en-US
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Alexander Shiyan <shc_work@mail.ru>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Taichi Sugaya <sugaya.taichi@socionext.com>,
        Takao Orito <orito.takao@socionext.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" 
        <linux-rpi-kernel@lists.infradead.org>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>, linux-oxnas@groups.io,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
References: <20220721141325.2413920-1-arnd@kernel.org>
 <20220721141325.2413920-5-arnd@kernel.org>
 <e83c98f9-f32a-6bfd-71b6-9aba22aa7abb@linaro.org>
 <CAK8P3a0yc_iZ1dqbReckvune6KszCPvysCX9okYoaU-by+YRhQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAK8P3a0yc_iZ1dqbReckvune6KszCPvysCX9okYoaU-by+YRhQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 21/07/2022 22:43, Arnd Bergmann wrote:

> I'd rather keep them together: while removing the DEBUG_INFO is
> now a NOP, keeping the two changes together explains much better
> why this is done and is atomically needed based on the single patch
> that caused the change.
> 
> It's the same with the LEDS patch that replaces the CONFIG_LEDS
> option with CONFIG_NEW_LEDS.

OK,

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
