Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BDF4CD13CF
	for <linux-tegra@archiver.kernel.org>; Sun, 17 Sep 2023 22:27:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229827AbjIQW0e (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 17 Sep 2023 18:26:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238532AbjIQW0E (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 17 Sep 2023 18:26:04 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10C6210C
        for <linux-tegra@vger.kernel.org>; Sun, 17 Sep 2023 15:25:59 -0700 (PDT)
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 473283F67B
        for <linux-tegra@vger.kernel.org>; Sun, 17 Sep 2023 22:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1694989557;
        bh=I9MD/frOYatXvnTs5iG7mBs2PH8/IlXgMFq6W02dlmo=;
        h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=ZAn1kFbtMl2b17j8mp8Q/y2H6XYLD/+wL2Z4gmuHgazqE0owvP4VhiRQZmFft+xQX
         zguc7PrgfhcEwWvGV8YezD9gJbhH+zGN4jRuuVSoQomg2Nw5cEu0xilXvZyjrhjeGD
         rC1Fyp9/rhndx6H6uoIaQ1SFbjE2eZ+md9rAX5kI1sPej1d0DBrl3ZV2dzvcUqpe0/
         cSMK8xJxj2nng1/X5zRK4OAmI7orB4HvtkMQ0wNSKrwKVOmAWztZ36LRuzsuJWc0xj
         ZZUR5SOrHzkrw9Wj/+o6TYRbfANy7yOjWC642z1CmvpWvTJ4qpS9ZyTJFi+pynUL6z
         fOr/LxWn+Vb2Q==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-416695bd009so47572231cf.3
        for <linux-tegra@vger.kernel.org>; Sun, 17 Sep 2023 15:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694989555; x=1695594355;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I9MD/frOYatXvnTs5iG7mBs2PH8/IlXgMFq6W02dlmo=;
        b=Sy52c9awf7kw7f1Sa4/HZg53ieUsOFe3MvhZJH75pRG9TfgmzgXBA5xN5QWTJJRCFD
         783c5Mt/K9F9tSiAI8I8Hv6I+DCIL09i3pkadu/FvV617zFZe6jxxU57lWCV61Ok6VsM
         P824BYY3rJ8U6ipsrhcdziVZjtl6bsBG4Y7TCH8yu4y+cJiK99YPlIHF981wbh76870L
         87NhLpQSX/kkmTxkRBOxLgUaXgNUJt7WX83W6/3W5SFpddvk9FijeGjw37wiErlOdYrO
         pdP8ZoaA6YHxoKug2RwXCD4RGuKVhvj0cyhAB4zZIJYxoT3n1WlfeepjmvIDcYFct2wv
         JFhQ==
X-Gm-Message-State: AOJu0YyFE3LDyzL+sJXYHy7EjA7OCT+wT3dhiyUZiNTohdSkSqiNw3st
        HXbMdPRiqj1w43+HiLcizT54x30KEGI5739ra+WOopQbDCFBY+mSDK4PR5OrUlTJainbFD4jvKG
        A4KegHLAiRxr7jeHcFD9fITP0uYX6Z/fR45fOi/eG5tKogIpXB0wYdF5y
X-Received: by 2002:ac8:7f91:0:b0:416:db70:2653 with SMTP id z17-20020ac87f91000000b00416db702653mr8876089qtj.38.1694989555284;
        Sun, 17 Sep 2023 15:25:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFezqxmfqtGhS2FxPCsYpubnTNK6tACbhkhYR/40Y08aycFwHOLWJhOoCYZSF3ud4i1i0EL+r/CXjLeOYzof7Y=
X-Received: by 2002:ac8:7f91:0:b0:416:db70:2653 with SMTP id
 z17-20020ac87f91000000b00416db702653mr8876059qtj.38.1694989554976; Sun, 17
 Sep 2023 15:25:54 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 17 Sep 2023 15:25:54 -0700
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20230916075829.1560-1-jszhang@kernel.org>
References: <20230916075829.1560-1-jszhang@kernel.org>
Mime-Version: 1.0
Date:   Sun, 17 Sep 2023 15:25:54 -0700
Message-ID: <CAJM55Z-_yq3DrOC2KxQf8j5y_iDD7ejEReP4XajUz74iVp02LQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 00/22] convert to devm_stmmac_probe_config_dt
To:     Jisheng Zhang <jszhang@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
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
        <angelogioacchino.delregno@collabora.com>
Cc:     netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Jisheng Zhang wrote:
> Russell pointed out there's a new devm_stmmac_probe_config_dt()
> helper now when reviewing my starfive gmac error handling patch[1].
> After greping the code, this nice helper was introduced by Bartosz in
> [2], I think it's time to convert all dwmac users to this helper and
> finally complete the TODO in [2] "but once all users of the old
> stmmac_pltfr_remove() are converted to the devres helper, it will be
> renamed back to stmmac_pltfr_remove() and the no_dt function removed."

Thanks for doing this.

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

>
> Link: https://lore.kernel.org/netdev/ZOtWmedBsa6wQQ6+@shell.armlinux.org.uk/ [1]
> Link: https://lore.kernel.org/all/20230623100417.93592-1-brgl@bgdev.pl/  [2]
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
