Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA7C2EB64DD
	for <linux-tegra@archiver.kernel.org>; Thu, 20 Jul 2023 19:42:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230522AbjGTTm1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 20 Jul 2023 15:42:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjGTTm0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 20 Jul 2023 15:42:26 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1839426A9
        for <linux-tegra@vger.kernel.org>; Thu, 20 Jul 2023 12:42:24 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-cfd4ea89978so1011375276.2
        for <linux-tegra@vger.kernel.org>; Thu, 20 Jul 2023 12:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689882143; x=1690486943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6uboV9zE5viSPMUN9jRcO0cjpaJKLGwKotI/bN04OyY=;
        b=Is+h2NeaSzJfFfsZ98ro8BWc2npdTi8/mAPrWVvtpsxb716Whq2DsR1nkUJ5zX14Xz
         79qaflwC3BG2VYXCeK0ijBZtmZDQ1AwFmwaxjZDd/vn/AKdit/VHpHHNt7ZvyrLIlMK1
         rAvvaKIi1pdCGIE6T6PamxnnJ1xdepfGuegPYvjWZ/2v5uqSbyOmvOqKrH1HZMZxxQ9u
         TipBUYHRAcaq7G2V/lDcSoviQy3dB4LjRa8c+TMTdx5eHkXHMxyv/6aRPA0MgnDthZDb
         /qNXdFoMB9q33L3QYVfMXu7JSq0qiwBR5arRe8VeAjZhX1/RRVS46BZipMLM8QxKUS/8
         /7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689882143; x=1690486943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6uboV9zE5viSPMUN9jRcO0cjpaJKLGwKotI/bN04OyY=;
        b=KegqMfN3JQAjvJHRvAT55UDXuipz+kneDRjsJHvtJ4YfbUfNNxBekWU9mljmnxd21r
         clD8wl6rw0QBQy9TS17Ol1OKVaZMvODuYo8YGZy7HHjEesn7UVkRXd9cRaJfEelhcGe3
         8X/KLtDX4JXOLJJYxNnNtGcIo5tyAf7U8cdAy0hXk1FWX/MAFSCs3XW0K+nHeMtY5PGY
         1gGgfWsPNGbnZaa2TOzDgnuu8T9bYPl+e/ifMBEtTfRfyjZKy4T16sx8cnG+G1llVWSd
         uWhD5hq+tTISjg1dfPIYDJibVNwu3WDHI6Ny8alajtnT1GCGT6mipB4evIjTHkpGagUc
         lBQw==
X-Gm-Message-State: ABy/qLbEBiT0WiaCs/eipkNwVJqP1o4iMvMUeCeBdLw/n4YNLzumIMl9
        dHlizL1I0XN3NqB0HAPrJJvZ3Ag0WvES3nSwotGWoA==
X-Google-Smtp-Source: APBJJlE7cBabIqsDgOVse9OOZ6aTjmPoq/DJCfwfg6nCOEVEXRqRJUSYnSIJLuoYJ0UvKAptp1crbwCoFVPdkqeY7hY=
X-Received: by 2002:a25:c50b:0:b0:cdd:6635:a1f8 with SMTP id
 v11-20020a25c50b000000b00cdd6635a1f8mr5819173ybe.15.1689882143201; Thu, 20
 Jul 2023 12:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230714174901.4062397-1-robh@kernel.org>
In-Reply-To: <20230714174901.4062397-1-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 20 Jul 2023 21:42:12 +0200
Message-ID: <CACRpkdYe9b4ZpvYZqkcMq0Jjni_VD_75Zt5oKv4+v9f3pmJbVA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Explicitly include correct DT includes
To:     Rob Herring <robh@kernel.org>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
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
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jul 14, 2023 at 7:49=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:

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

It still applied cleanly so I just applied it.

Thanks for attention to detail.

Yours,
Linus Walleij
