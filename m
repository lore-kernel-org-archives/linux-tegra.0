Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 097E7C433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jul 2022 15:47:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233462AbiGUPrK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Jul 2022 11:47:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232996AbiGUPq5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Jul 2022 11:46:57 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 666DD8246D
        for <linux-tegra@vger.kernel.org>; Thu, 21 Jul 2022 08:43:25 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id d17so1257588lfa.12
        for <linux-tegra@vger.kernel.org>; Thu, 21 Jul 2022 08:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=tk1DYU/BipOe/ykhrE+uY+ooU5Pb7mB25/yNG8lTcfE=;
        b=wfl3g/vRkmVmlH69jDqxAlRnmvZUFAn0fafUutbXTYDpLsG8Pb+wt+a7RBPTTkIeAv
         RTA1J3Qz8g58ZqKaZFGcfmZoiK5L3wvZnMlJImcTLgNb+ldG2lCPymk8BkG9ehlB0xoG
         6h/kCT9Muj89aPsxnGQE2taw2N9Id53CXH1TBhOx3DaVlqzhvPDKzR4lMgdoo8EdHX9y
         gDiQ7Ozw9bbiMJhjlNnpYcBKWyzHzzfSEgaRaxT3b+Gqd8C2TJ8X8ryAyEr+SXyHNfaX
         YlDbi4hbRJ2ceGpQOt2JP8zBnTDt95lIKLw81bA5NGb3sE9IcntSJch4r301U++1U29V
         fOpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tk1DYU/BipOe/ykhrE+uY+ooU5Pb7mB25/yNG8lTcfE=;
        b=7M+DUkb9JG4uK2h6/xlj/saZ2Zrbinw5D9oQM4AXDCwEHXYIWHXUeWTVSlo8ocRC6x
         WnPBD9+hvKFL06NUMLbURKgEawcmt28X1Ub0+97XgNTySQMH07F04AirvI5HPXFmrHJ2
         c2mkjtgEe6WZjk07vg/mjQmM73KjtjClnBcv/FXtD2iJ67NLntuaA5XJKiLEBhai/Xfw
         Ql35udxkSYBTokB+L1ns7e4GXy33Kr3modhFnHd/hRje30XeKeu40zjwdgPn+C6rrTwv
         P3drndDvPE7wJPOy1wvxNM6Xetbfnh3sFcERLQKB18vrtxDvUAfW7aH841dROpprPiUF
         PvLA==
X-Gm-Message-State: AJIora9o6qEfnbKBGiAUmLBim0BX/qEbb4/ebT4Kzj9K58x0ejkUgjyw
        pMkej/2fiVtuhy66rdc9GDlKuQ==
X-Google-Smtp-Source: AGRyM1ucvLSRgQ3vWLF4H0bcarGzsvXB0TIajUEBtz3KiyNKgTBVHkKnKs5eHbjxAH0RAjhN7ZfcTw==
X-Received: by 2002:a19:6510:0:b0:47f:baaf:e3be with SMTP id z16-20020a196510000000b0047fbaafe3bemr23855009lfb.139.1658418203026;
        Thu, 21 Jul 2022 08:43:23 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id w9-20020ac254a9000000b0047f8d7c08e4sm506524lfk.166.2022.07.21.08.43.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 08:43:22 -0700 (PDT)
Message-ID: <ba87edff-6e2c-884f-1afb-cf4b721b6893@linaro.org>
Date:   Thu, 21 Jul 2022 17:43:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 5/6] ARM: defconfig: remove broken CONFIG_THUMB disables
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
 <20220721141325.2413920-6-arnd@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220721141325.2413920-6-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 21/07/2022 16:13, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Since commit 1515b186c235 ("ARM: make configuration of userspace
> Thumb support an expert option"), CONFIG_THUMB cannot be disabled
> unless one turns on CONFIG_EXPERT first.
> 
> This is probably for the better, so remove the statements that
> turn it off.
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
