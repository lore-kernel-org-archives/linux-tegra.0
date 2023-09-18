Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B93F4CD37B0
	for <linux-tegra@archiver.kernel.org>; Mon, 18 Sep 2023 20:14:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbjIRUO3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 18 Sep 2023 16:14:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbjIRUO2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Sep 2023 16:14:28 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECF998F;
        Mon, 18 Sep 2023 13:14:22 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50098cc8967so7948649e87.1;
        Mon, 18 Sep 2023 13:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695068061; x=1695672861; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M+e7RPlNIEbnCE6SNaWUDYK3xS0AglRAD4OXd3Ulb6s=;
        b=bTh9i89mD05TlvVR6OmjzYHPXUlWHU6M5IYh2Pqrroboh2pGf5+UYoFynx89KSpX1b
         CtUp1ANG6bivxW2EY5rOdKo1VvnNAl8mn8423w0F8aBJIF2ytvMXkOnjZaT1iOR6fLYX
         NioIbTTRhpmWGvEVE4lbfu2aBfQPGI6uoqUjKoyHWFkpEmt/aKBpGs+HpbtRYL/ca/nA
         DfryEtlSEVl8tzVD6FJODusw+aB1OBL8z3nzQXFPMJpdwwMxqun0hIaqX97c7YCCKHop
         pJG5Ay8Dy+ljbWAEymGI08ZZG0hIcYmthLiKXF7yu4NvlEwwb0dD27vLBRijXmxlCUOP
         Tg0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695068061; x=1695672861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+e7RPlNIEbnCE6SNaWUDYK3xS0AglRAD4OXd3Ulb6s=;
        b=wVjeAsFmBS5Bd9uenf8vIzLXCKCagZ3OoLoIFCweI1HVBBPquhXoldg7iJObTio4cd
         dHKq3hjP7y+pqRZov3M6PMs6GohmI74Hv1X/8vu/KK1m6XRvVhLtRWKlgkcVk841v+cK
         c1NPcbmyN2i/T3Fdad0AIiLKThphBvWj5UF0Ip4QH0epPsW4PgXOWu23C+dMRbwNL0hl
         CRiuuVYdWclGBG5QAaGwifSwBBa8LVXqXFX8fhTAw1OoTXAt/1qMxMAR3d27C41HsNQr
         4L2tvH1ZijLtarIWXYx9gtsPu1h7itskHrs78AhvxG84ezxOZ/QE+3zJk9MarBhF94lo
         LSeQ==
X-Gm-Message-State: AOJu0Yz8wzy5JvEawwLedtV9i7Br2GlaNOAukXKlWDCAuWnje/+AaFo5
        WZqcZOATJ3ZqsxF/9s+whH8=
X-Google-Smtp-Source: AGHT+IFn+LYvQSp5rZn6lhfAzGXnJK7HIJKtSCz+mspnLIkIgmBXG+lSxqLriZhpKyj97znopumt4A==
X-Received: by 2002:a05:6512:33c8:b0:4fe:d0f:b4f7 with SMTP id d8-20020a05651233c800b004fe0d0fb4f7mr10927733lfg.65.1695068061007;
        Mon, 18 Sep 2023 13:14:21 -0700 (PDT)
Received: from mobilestation ([178.178.81.241])
        by smtp.gmail.com with ESMTPSA id d33-20020a0565123d2100b0050317d2b0f3sm563142lfv.61.2023.09.18.13.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 13:14:20 -0700 (PDT)
Date:   Mon, 18 Sep 2023 23:14:06 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Jisheng Zhang <jszhang@kernel.org>
Cc:     Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Samin Guo <samin.guo@starfivetech.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Russell King <linux@armlinux.org.uk>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 00/22] convert to devm_stmmac_probe_config_dt
Message-ID: <nqa7g7x3alrcbnbgkyalg5h26na6rzwid3jxdqviisi2pnkdrn@b4qvgamj4urr>
References: <20230916075829.1560-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230916075829.1560-1-jszhang@kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, Sep 16, 2023 at 03:58:06PM +0800, Jisheng Zhang wrote:
> Russell pointed out there's a new devm_stmmac_probe_config_dt()
> helper now when reviewing my starfive gmac error handling patch[1].
> After greping the code, this nice helper was introduced by Bartosz in
> [2], I think it's time to convert all dwmac users to this helper and
> finally complete the TODO in [2] "but once all users of the old
> stmmac_pltfr_remove() are converted to the devres helper, it will be
> renamed back to stmmac_pltfr_remove() and the no_dt function removed."
> 
> Link: https://lore.kernel.org/netdev/ZOtWmedBsa6wQQ6+@shell.armlinux.org.uk/ [1]
> Link: https://lore.kernel.org/all/20230623100417.93592-1-brgl@bgdev.pl/  [2]

I see the series is already merged in. In anyway here is my tag:
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

Thanks for submitting the set.

-Serge(y)

> 
> Since v1:
>  - rebase on new net-next
>  - add make stmmac_{probe|remove}_config_dt static as suggested by Russell.
> 
> Jisheng Zhang (23):
>   net: stmmac: dwmac-anarion: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-dwc-qos-eth: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-generic: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-generic: use devm_stmmac_pltfr_probe()
>   net: stmmac: dwmac-imx: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-ingenic: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-intel-plat: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-ipq806x: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-lpc18xx: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-mediatek: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-meson: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-meson8b: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-rk: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-socfpga: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-starfive: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-sti: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-stm32: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-sun8i: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-sunxi: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-tegra: use devm_stmmac_probe_config_dt()
>   net: stmmac: dwmac-visconti: use devm_stmmac_probe_config_dt()
>   net: stmmac: rename stmmac_pltfr_remove_no_dt to stmmac_pltfr_remove
>   net: stmmac: make stmmac_{probe|remove}_config_dt static
> 
>  .../ethernet/stmicro/stmmac/dwmac-anarion.c   | 10 +--
>  .../stmicro/stmmac/dwmac-dwc-qos-eth.c        | 15 +---
>  .../ethernet/stmicro/stmmac/dwmac-generic.c   | 15 +---
>  .../net/ethernet/stmicro/stmmac/dwmac-imx.c   | 13 ++--
>  .../ethernet/stmicro/stmmac/dwmac-ingenic.c   | 33 +++------
>  .../stmicro/stmmac/dwmac-intel-plat.c         | 25 +++----
>  .../ethernet/stmicro/stmmac/dwmac-ipq806x.c   | 27 +++----
>  .../ethernet/stmicro/stmmac/dwmac-lpc18xx.c   | 19 ++---
>  .../ethernet/stmicro/stmmac/dwmac-mediatek.c  |  6 +-
>  .../net/ethernet/stmicro/stmmac/dwmac-meson.c | 25 ++-----
>  .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 53 +++++---------
>  .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 14 ++--
>  .../ethernet/stmicro/stmmac/dwmac-socfpga.c   | 16 ++---
>  .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 10 +--
>  .../net/ethernet/stmicro/stmmac/dwmac-sti.c   | 14 ++--
>  .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 17 ++---
>  .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c |  6 +-
>  .../net/ethernet/stmicro/stmmac/dwmac-sunxi.c | 23 +++---
>  .../net/ethernet/stmicro/stmmac/dwmac-tegra.c | 10 ++-
>  .../ethernet/stmicro/stmmac/dwmac-visconti.c  | 18 ++---
>  .../ethernet/stmicro/stmmac/stmmac_platform.c | 70 ++++++-------------
>  .../ethernet/stmicro/stmmac/stmmac_platform.h |  5 --
>  22 files changed, 127 insertions(+), 317 deletions(-)
> 
> -- 
> 2.40.1
> 
> 
