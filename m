Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3F37C433FE
	for <linux-tegra@archiver.kernel.org>; Mon, 17 Oct 2022 09:01:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230488AbiJQJBY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 17 Oct 2022 05:01:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230442AbiJQJBP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 Oct 2022 05:01:15 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE5BA49B40
        for <linux-tegra@vger.kernel.org>; Mon, 17 Oct 2022 02:00:47 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id r14so15035999edc.7
        for <linux-tegra@vger.kernel.org>; Mon, 17 Oct 2022 02:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=683v4hUy0SmafI83To+Isl3SKfGOBhxnh8RoSe2BfVE=;
        b=baKbTregC3QhRdgmJUkHOf2bAAxxqlLwuEXARcNGa3/WqFVAKHDu91dlmMKFRVfyFw
         s7c1IegnAd/ZA9suBgLZpR0L+BaX22/B3jmG+76M+E+k6juRwzMbuoY1EEK+2DFaFcQj
         vHc0HMarKjxDZ2Rl+jhmlSY2HbAdhg3CinUqff9ZoO5rLuy9lkDCeuNKh6PLosoKElld
         ygJbctlrPwFE96iJ1Qbz98jJJdKZ0fYFAZ3+TaiKi2i0SDYwzjKN2AYo1QYvZ+sWtX2p
         M7eda4stYmZU1Rfm0Wf03Nj1MIR+gICsX2oOuXGWZrEvR9SsMZgZz6UrE8IWMJ3PhbRR
         4DfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=683v4hUy0SmafI83To+Isl3SKfGOBhxnh8RoSe2BfVE=;
        b=jwBD8plmRwqXesTv8X1+ACHe4x9kHzFB0SEZM/tXcTJazEDBlAmVlirVRGw34hteJW
         xY5i7iql1LduQLR/R6tpqjWzaXs0ckuq8scrpvfT8B6m7kaNIJyWV3p7ZDC00Zy+y7n7
         drLDOKEEvvXkT5kpgmKBNGqg9xOa5h3DeeOY63kUbm/BrYFwe5BcqOABOkhmNSZojin6
         4By7x4SMjdniI7bXFiaJIOki2pOviWkJn5F6z74LfOWALfjwTiVspQ+M3Bv10aggFE39
         wuW5MIP3QLUrrf9cvPvX40EvpsLPT6jusvX32pZtE2fHOHXbjOx6eTKp+vguREu/8dxw
         nMGA==
X-Gm-Message-State: ACrzQf0qO9/L3+i3GN9qPIMBLc2QWbGPME6fb6lswsG4Iyq9yQohRv2g
        d+dsKEj4ls9szLTwwYVsAK1yLb9CbpMjyPKii4q88Q==
X-Google-Smtp-Source: AMsMyM7KLX1HAl4ni5IX/0ZUj/Z5Ng5V/LISTngsrYYu60h+W61fPfqDHKqOkVMzkfb8AN6gXeEI3n5jApzCVtxB1uY=
X-Received: by 2002:a05:6402:d0b:b0:458:a244:4e99 with SMTP id
 eb11-20020a0564020d0b00b00458a2444e99mr9354686edb.46.1665997245656; Mon, 17
 Oct 2022 02:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com> <20221010201453.77401-12-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20221010201453.77401-12-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 17 Oct 2022 11:00:34 +0200
Message-ID: <CACRpkdZLfPKwsABYnz0fAhqTGDnE7ZJzFJ4v_M2XF6_DTjW0Mw@mail.gmail.com>
Subject: Re: [PATCH v2 11/36] pinctrl: ingenic: Add missed header(s)
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
