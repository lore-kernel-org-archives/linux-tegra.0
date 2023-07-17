Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF9B1C001DE
	for <linux-tegra@archiver.kernel.org>; Mon, 17 Jul 2023 09:00:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230224AbjGQJA1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 17 Jul 2023 05:00:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbjGQJA0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 Jul 2023 05:00:26 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2B771BE
        for <linux-tegra@vger.kernel.org>; Mon, 17 Jul 2023 02:00:24 -0700 (PDT)
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E48CE3F206
        for <linux-tegra@vger.kernel.org>; Mon, 17 Jul 2023 09:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1689584422;
        bh=JHnHS0B61qcl/Td8/lm9RDjYsfSOyiiTTr5PsC3FWaA=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=WGbxMaX6V+av/Yo7iaE9nHZrQBmURbVvVsuqv31T49pLzQNRHuxJa4kmjLx1USBCa
         bno1gIzdGeVUlHKafapeKN1SPSkFmTY4nVJT9WKTP09QGIs9bvi9hMAfZukvgCO3YZ
         gJ/0d/OQDGM94kO+ZNeobOhQZLmZtvJfdEFPDApbgpPdeeLjK5Vy8o4RNCFt6mrSR0
         y/8JV8T7MK1THNzYwY/xYhIjg8m5C1vrsHGsnZifAan333c1NgA/96yMgHt5gpsjxI
         TDGN/Tu0zGYH6RCe7UImj+gSjwpnSnaL06ADLMkVSgwrKW06N41iRVo/TjYHeAb3/p
         +HOl28YXQiyug==
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-565a33c35b1so41282207b3.0
        for <linux-tegra@vger.kernel.org>; Mon, 17 Jul 2023 02:00:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689584422; x=1692176422;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JHnHS0B61qcl/Td8/lm9RDjYsfSOyiiTTr5PsC3FWaA=;
        b=Zb/Cp3imbnJSEl8DXNuCYOaxt1JlmgrF/vYUpdpMhqxAHvSd+ryN9XoTcUBkVyiqqU
         EpaI9yr1A8BWyqjlQ9iSoiZNgr2dJ/8go1YZgdu0YSqejjWDdP+/ob7n1cZOaLorqkeF
         BnwYTGQeD43w91s2jWHyKDP2hRs6UmFfL//sTEBFr7474wmJK7ovoe8sD2tVTgJkzmPa
         /HgqnnKOdBXUT/jmjtJWay5ER0L4/urUkrdNlcQ8QicZCbFWTt8rpv5poYZYzestD/oV
         UCQR3TWUhJDzMcKpgJGjA+S01pd/LOVK3/bF4NZkEkSON3JpfL7E3Quz8d1tOg0CKKFK
         zIwg==
X-Gm-Message-State: ABy/qLaEZ6dgs7usWQSDEZ17Rb6nRBwl3IT98U6ubAIlkdTUhSFaOWN+
        7j51QPP2MejRdh/9LoQH/jK1nELXc5lte1aZ/XfxuBrKwkbKqg6zVk7GWq92WgqdfOa4MD0JRVI
        1k+0V3gyrbHK0up5g7TKoBAaMP5T5S8T6mBAtZ/FsiHXum+OvkJzJCWIk
X-Received: by 2002:ac8:7c48:0:b0:403:2dfd:1fdf with SMTP id o8-20020ac87c48000000b004032dfd1fdfmr15892575qtv.23.1689584401505;
        Mon, 17 Jul 2023 02:00:01 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEMazgMYki8IR1CHHFS4st+/s+/y1hah0oj0+nBQlO+NhXDM06BTdCzgvWJM4HcjDSd4KVriXj5Pmlo8MNpIrE=
X-Received: by 2002:ac8:7c48:0:b0:403:2dfd:1fdf with SMTP id
 o8-20020ac87c48000000b004032dfd1fdfmr15892526qtv.23.1689584401259; Mon, 17
 Jul 2023 02:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230714174901.4062397-1-robh@kernel.org>
In-Reply-To: <20230714174901.4062397-1-robh@kernel.org>
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date:   Mon, 17 Jul 2023 10:59:45 +0200
Message-ID: <CAJM55Z_Eba-LKxKAH0i0_vDM6JO_HvWgDLCLFQDave2+UFLMzA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Explicitly include correct DT includes
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Chester Lin <clin@suse.com>, NXP S32 Linux Team <s32@nxp.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Damien Le Moal <dlemoal@kernel.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Daniel Mack <daniel@zonque.org>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Jianlong Huang <jianlong.huang@starfivetech.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dvorkin Dmitry <dvorkin@tibbo.com>,
        Wells Lu <wellslutw@gmail.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-oxnas@groups.io, linux-rockchip@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 14 Jul 2023 at 19:52, Rob Herring <robh@kernel.org> wrote:
>
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

>  drivers/pinctrl/starfive/pinctrl-starfive-jh7110-aon.c | 5 +----
>  drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c | 2 --
>  drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c     | 1 -

Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Thanks,
/Emil
