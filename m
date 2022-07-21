Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF9DCCA487
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jul 2022 15:46:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233442AbiGUPq1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Jul 2022 11:46:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233017AbiGUPqL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Jul 2022 11:46:11 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04F6B8E4CF
        for <linux-tegra@vger.kernel.org>; Thu, 21 Jul 2022 08:42:13 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id bp17so3430402lfb.3
        for <linux-tegra@vger.kernel.org>; Thu, 21 Jul 2022 08:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=DbAlny0t1Z1mEp76q3Ok9AdQU6F9gRBoHTbQLXF/2lk=;
        b=hvMY/wKgqNkLwMGAA1veSwXkHAGy+A6V3WOkfUKYAdhYB8ptxzUPD7n35rsO9Jcvr7
         6UDVHo0V37fnqX2S0c15nIq3n4z6ArkAWtF+lGEg9BC5qQf+mEDT2UuywuO/+AFrwg6P
         jFuYVRrXQ21UhwdbV388q5sUMCQU465XKUyiSp0BPn/vBPSJN9lK2KzWUZE7tRuBCkcF
         ewxg0NMWAaa3d+T2QRhzgxExRIc5ACCOcQ3/ppkPQ5wo0swP5SjDLy8L+XwpArxrJ0Q/
         eeAmdqXFlUazj++UKjdRTrln8X4SOrsW3BodSCOU0+mbJsZrrBRXQKEnIdrhHN8un0RW
         grAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DbAlny0t1Z1mEp76q3Ok9AdQU6F9gRBoHTbQLXF/2lk=;
        b=Coc3hwSA3XEhShiw45fF2zU/fPbgLg0KP2IETg+jQUQ8IeY3NJ0sb0Bmyh71qEJlac
         EvhP+ykk1Wdny2wCKMfcICbQHeEIHerlewXUqUr1oxZA98QIn/RZNzM509/m5Ma1zd/4
         vEPby/NMXfOYemBeuomECuW5vdggRPlqQDsA3qRuDm6Eeq++xe7vBu7MM9m+QDtX3WzN
         ykXSjthuQwilNUO6qYrd8V9B9fGbWMWltQmwTPa5Q8pz2gn83FQeu5xQGEamyCAGlrTe
         dREefnzd2rI/KsALvjXEKm+aggWEYjeixF5l1fV3x7DN3h8RRS0wh1bGt6xaYMcga2XN
         IG0w==
X-Gm-Message-State: AJIora/S0PTqhO4S4y7g+WVVcyjo8QOKCwvOSD8DouWHn1MMopBg4fNJ
        kJCRD62P+8UVUF49rcyoVWqt1g==
X-Google-Smtp-Source: AGRyM1uH+KevGsKWyG8Df61xvPgqfo29eVC+LR/aED9QzOXzzbztIiUFTSzFYEZjDIchb6h/N4lCSg==
X-Received: by 2002:a05:6512:3409:b0:489:c549:4693 with SMTP id i9-20020a056512340900b00489c5494693mr21503245lfr.26.1658418131160;
        Thu, 21 Jul 2022 08:42:11 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id s4-20020a056512314400b00488333b6515sm499662lfi.305.2022.07.21.08.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 08:42:10 -0700 (PDT)
Message-ID: <e83c98f9-f32a-6bfd-71b6-9aba22aa7abb@linaro.org>
Date:   Thu, 21 Jul 2022 17:42:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/6] ARM: defconfig: address renamed CONFIG_DEBUG_INFO=y
Content-Language: en-US
To:     Arnd Bergmann <arnd@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
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
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-oxnas@groups.io, linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-sh@vger.kernel.org
References: <20220721141325.2413920-1-arnd@kernel.org>
 <20220721141325.2413920-5-arnd@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220721141325.2413920-5-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 21/07/2022 16:13, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> CONFIG_DEBUG_INFO is now implicitly selected if one picks one of the
> explicit options that could be DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT,
> DEBUG_INFO_DWARF4, DEBUG_INFO_DWARF5.
> 
> This was actually not what I had in mind when I suggested making
> it a 'choice' statement, but it's too late to change again now,
> and the Kconfig logic is more sensible in the new form.
> 
> Change any defconfig file that had CONFIG_DEBUG_INFO enabled
> but did not pick DWARF4 or DWARF5 explicitly to now pick the toolchain
> default.

I think this should be split - into remove DEBUG_INFO (noop) and into
selecting CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT (a fix).

Best regards,
Krzysztof
