Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 003B3C43217
	for <linux-tegra@archiver.kernel.org>; Mon, 17 Oct 2022 08:56:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230353AbiJQI47 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 17 Oct 2022 04:56:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230377AbiJQI44 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 Oct 2022 04:56:56 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF09B29362
        for <linux-tegra@vger.kernel.org>; Mon, 17 Oct 2022 01:56:51 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id g1so16434974lfu.12
        for <linux-tegra@vger.kernel.org>; Mon, 17 Oct 2022 01:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=683v4hUy0SmafI83To+Isl3SKfGOBhxnh8RoSe2BfVE=;
        b=Qv6q8FWLtueHdd8V7+1ydYsFYZEEJpWavnxcBT7D5eWhQItA1/pVYccISbJFICMSkr
         Ey3TbxDRm9PfKYS4JmGflA/lpJIrLC38NdXvtV9vC2uiARu6HbiwOaeUGshIc/MABNa8
         iNRkxG6CAitkZXfK3EBPH0GPp9IUKLoi93vr8Qzhug5C9h9fTgikj/rU7ycMw3UELcZI
         SVpiBRV4ckNiul+QC7IBmCWqxEcaYjPqjNgLxIT732CKswGqjuVZqI94LQYwNync9INI
         KcYAHFuQHjoZ8bwkDPJN/fr3Cs0cqXeq4t5oCj9+Z09FuoB3p3Vj0At/JENf/LIAikzH
         Ubfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=683v4hUy0SmafI83To+Isl3SKfGOBhxnh8RoSe2BfVE=;
        b=mFIjzF+2TBhxBhaX95Zx5fjA0bou1YCoaUvqhYUHSPXzP+5+kR0EC7d5Qm1FzL6j9q
         4Q3VpCuW7emxfXo0+TRHR3FiJ/Bvm20TIhDrrHdTMI9QAN61w+Rc17VlmFOfz+r4t+n/
         C+5Vs1sKauQtF9BMMoY+bneUV3CUtd+XGBGrh5lQtd87rKpE/7Uu9jOH2I420fe+0/SU
         p8BZlX1ccyd0OufZFLa6C6HWlPr1AAwwFnfpQ6bSP/HzuJOK4sjooG0ilCiOphf+I9u3
         JkSeT9NRyAlAY4/wrRjHzZfjk7raW0Aen+dXg3TVTVjstFHr3jQ8fLBgPVZohI6+ResR
         87NA==
X-Gm-Message-State: ACrzQf3y7z7fIDgQgQ9IXnrxUXckPEPVtZ0StNovcbv/ObGQ8+qwERQk
        IF40JA1y2VtS2YpOnO1W6sUrKHSbHn+OZuwdalDu6oLkAjc=
X-Google-Smtp-Source: AMsMyM54Es/rcRwZ3d5m5p40C0eL91BNOKnYNSaIiRiDdnSBs8EPAVZPWnDFbd89WM1r3BkjvyLcetoBa+sYeNXylYg=
X-Received: by 2002:a17:906:5d04:b0:77f:ca9f:33d1 with SMTP id
 g4-20020a1709065d0400b0077fca9f33d1mr7894989ejt.526.1665996999142; Mon, 17
 Oct 2022 01:56:39 -0700 (PDT)
MIME-Version: 1.0
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com> <20221010201453.77401-7-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20221010201453.77401-7-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 17 Oct 2022 10:56:27 +0200
Message-ID: <CACRpkdYsJtLT=D6OsJURG9Kj1c3A5x=LmUO_jNLkY=AsqPK5Ng@mail.gmail.com>
Subject: Re: [PATCH v2 06/36] pinctrl: at91: Add missed header(s)
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Marc Zyngier <maz@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
        Kent Gibson <warthog618@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Billy Tsai <billy_tsai@aspeedtech.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Chen-Yu Tsai <wenst@chromium.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Samuel Holland <samuel@sholland.org>,
        Horatiu Vultur <horatiu.vultur@microchip.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org, linux-actions@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-rpi-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
        patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org,
        linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Joel Stanley <joel@jms.id.au>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Shevchenko <andy@kernel.org>,
        Sean Wang <sean.wang@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Oct 10, 2022 at 10:15 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Do not imply that some of the generic headers may be always included.
> Instead, include explicitly what we are direct user of.
>
> While at it, sort headers alphabetically.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch applied!

Yours,
Linus Walleij
