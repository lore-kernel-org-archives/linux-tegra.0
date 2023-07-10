Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D778AEB64D9
	for <linux-tegra@archiver.kernel.org>; Mon, 10 Jul 2023 09:00:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231977AbjGJJAP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 10 Jul 2023 05:00:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230169AbjGJJAO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 Jul 2023 05:00:14 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D7A9C3
        for <linux-tegra@vger.kernel.org>; Mon, 10 Jul 2023 02:00:13 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b703c900e3so63612751fa.1
        for <linux-tegra@vger.kernel.org>; Mon, 10 Jul 2023 02:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1688979611; x=1691571611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pi0neW334vEUn9BnnI+UYaAU5ZZLFAfHbjZLAic+fdQ=;
        b=EqBWfD3g9G1f2j+bgRXH5wRADIaccx1W0vEhGOo3hNKnmlyLuJx4VJJ7mTzA/k0i2d
         F+7KfZoiLqYu9xNbaAdf4xyciku5hdX7Fm7MXl/i+Ycd9Zn7qWq+IsBhcwjC+zwJBXpq
         ghM9Bf2gyNLr2cbrh48lSiYil8EFiWr+pFopsMPdriUzrqEuCE4KE1eRE/E7SKosr4MF
         Dd9xTvJ6brdf1TpX+x3ThA/7st5nwDz71MIAWAZTG6Cds93Vh46UdxVVSJCZ9MMbIGaG
         SflTHiNb4yIx1+hAc//E50HZyvTzAQHZFZrKtppJ+7GmP6up/KqbHNltSfszxujOo+BU
         qsSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688979611; x=1691571611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pi0neW334vEUn9BnnI+UYaAU5ZZLFAfHbjZLAic+fdQ=;
        b=NDpRkd13Zz8IjGvINPKElRDDXwRH0LAfTy0h1fs7KdPQGw7Umdh3Tk5cndFxlXU11D
         2miuXc0Z6c56Ht2BMgYLFppDKlrziqZ6GzZFUgt/sDOexl+D9S92d6ABBA4kGMr0b3t+
         P5lBky+pSnUwibECE4p+kRuPcCqXgovjwBDmWeDNUc7Z9mod2oAQ0G+rfjeVCQ1p78jl
         e8vTqBTGlvpcylk7slfh39frhSs0S4EyGV94mDHCsTwW3PdPypkKob80DSYHApA8P0M1
         QxK3h+B1jX7XcBi95OSUII3tX6kqLNSwiY6uD1PYjq28t2bLoy0F9erqzcEW0tE/u2S6
         Hk1A==
X-Gm-Message-State: ABy/qLYDUQRn98zXUScyKarSL98N3vI6bE4/fGwhS1SjCa8y9DZkSkBD
        Bo6eKWXYkMeU3d+sq544frwSqA==
X-Google-Smtp-Source: APBJJlEjnwa6aLt1S4/l0UmZLQcAqJFRGPgprZQ9W+4d6fTrF3qCcNsLykNlD/mAdr8AMz3+iYLvsA==
X-Received: by 2002:a2e:b0c6:0:b0:2b6:a7dd:e22 with SMTP id g6-20020a2eb0c6000000b002b6a7dd0e22mr9274754ljl.48.1688979610963;
        Mon, 10 Jul 2023 02:00:10 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:6002:540:6954:abdd])
        by smtp.gmail.com with ESMTPSA id k6-20020a05600c0b4600b003fc00702f65sm8581045wmr.46.2023.07.10.02.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 02:00:10 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Vinod Koul <vkoul@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH net-next v3 00/12] net: stmmac: replace boolean fields in plat_stmmacenet_data with flags
Date:   Mon, 10 Jul 2023 10:59:49 +0200
Message-Id: <20230710090001.303225-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As suggested by Jose Abreu: let's drop all 12 boolean fields in
plat_stmmacenet_data and replace them with a common bitfield.

v2 -> v3:
- fix build on intel platforms even more
- collect review tags from Andrew

v1 -> v2:
- fix build on intel platforms

Bartosz Golaszewski (12):
  net: stmmac: replace the has_integrated_pcs field with a flag
  net: stmmac: replace the sph_disable field with a flag
  net: stmmac: replace the use_phy_wol field with a flag
  net: stmmac: replace the has_sun8i field with a flag
  net: stmmac: replace the tso_en field with a flag
  net: stmmac: replace the serdes_up_after_phy_linkup field with a flag
  net: stmmac: replace the vlan_fail_q_en field with a flag
  net: stmmac: replace the multi_msi_en field with a flag
  net: stmmac: replace the ext_snapshot_en field with a flag
  net: stmmac: replace the int_snapshot_en field with a flag
  net: stmmac: replace the rx_clk_runs_in_lpi field with a flag
  net: stmmac: replace the en_tx_lpi_clockgating field with a flag

 .../stmicro/stmmac/dwmac-dwc-qos-eth.c        |  4 +-
 .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 23 +++++------
 .../ethernet/stmicro/stmmac/dwmac-mediatek.c  |  5 ++-
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        |  8 ++--
 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-tegra.c |  4 +-
 .../ethernet/stmicro/stmmac/stmmac_hwtstamp.c |  4 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 40 +++++++++++--------
 .../net/ethernet/stmicro/stmmac/stmmac_pci.c  |  2 +-
 .../ethernet/stmicro/stmmac/stmmac_platform.c | 10 +++--
 .../net/ethernet/stmicro/stmmac/stmmac_ptp.c  |  5 ++-
 include/linux/stmmac.h                        | 26 ++++++------
 12 files changed, 76 insertions(+), 57 deletions(-)

-- 
2.39.2

