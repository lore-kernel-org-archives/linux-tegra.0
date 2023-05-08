Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B780FC7EE22
	for <linux-tegra@archiver.kernel.org>; Mon,  8 May 2023 14:27:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbjEHO1b (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 8 May 2023 10:27:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232541AbjEHO1b (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 8 May 2023 10:27:31 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECA99198E
        for <linux-tegra@vger.kernel.org>; Mon,  8 May 2023 07:27:29 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw1pB-0008Nm-Te; Mon, 08 May 2023 16:26:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw1p2-0021Gd-S8; Mon, 08 May 2023 16:26:40 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pw1p2-002Sk4-6B; Mon, 08 May 2023 16:26:40 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Samin Guo <samin.guo@starfivetech.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        linux-amlogic@lists.infradead.org, linux-oxnas@groups.io,
        linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH net-next v2 00/11] net: stmmac: Convert to platform remove callback returning void
Date:   Mon,  8 May 2023 16:26:26 +0200
Message-Id: <20230508142637.1449363-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2991; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=e18Kj38bK3tEm/hSzc46Mes9xzQDcw64Vnd25cb8omc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkWQaMhtXiVZEIsYdTMyD+fsTSBXFA2k+fVfb7W Z4wnuQlykSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZFkGjAAKCRCPgPtYfRL+ TqeRCACo0+Gsv6LM1FIlu9KxZ+EkcpVDZXwiB+Le4QCe34u4Z/sJjN/PGWVm1DJGX3TZAiXg1R6 lE6OXvG4Kp8Ek78HiENVfQtqBMLAsxWlabhUC1S8i9iHY50JOkyM3AxazQOY8jKgllX+YCjNIsd 1ElRgtMImqflj1afHSmN5c0aXV8XRTvC05pHb0G7JHDup/b6z1YLYx4wChYq+u/GJJg/BzO24lo Am9+8bevKXSdcTpE48zAsNXTXHweMxlnojnuXv49mB6LJDhh+SrwSDLeFW4y4Q7RFgljVJ4JHt5 lYzHPUfU7TFnx4J9dEc6QUhnC8E6LC7crHmAiKw2JMXhPWtQ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-tegra@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hello,

(implicit) v1 of this series is available at
https://lore.kernel.org/netdev/20230402143025.2524443-1-u.kleine-koenig@pengutronix.de
.

Changes since then:

 - Added various Reviewed-by: and Acked-by: tags received for v1
 - Removed a variable in an earlier patch to make all intermediate steps
   compilable, spotted by Simon Horman
 - Rebased to v6.4-rc1 (which needed a slight adaption to cope for
   4bd3bb7b4526 ("net: stmmac: Add glue layer for StarFive JH7110 SoC"))

Best regards
Uwe

Uwe Kleine-König (11):
  net: stmmac: Make stmmac_pltfr_remove() return void
  net: stmmac: dwmac-visconti: Make visconti_eth_clock_remove() return
    void
  net: stmmac: dwmac-qcom-ethqos: Drop an if with an always false
    condition
  net: stmmac: dwmac-visconti: Convert to platform remove callback
    returning void
  net: stmmac: dwmac-dwc-qos-eth: Convert to platform remove callback
    returning void
  net: stmmac: dwmac-qcom-ethqos: Convert to platform remove callback
    returning void
  net: stmmac: dwmac-rk: Convert to platform remove callback returning
    void
  net: stmmac: dwmac-sti: Convert to platform remove callback returning
    void
  net: stmmac: dwmac-stm32: Convert to platform remove callback
    returning void
  net: stmmac: dwmac-sun8i: Convert to platform remove callback
    returning void
  net: stmmac: dwmac-tegra: Convert to platform remove callback
    returning void

 .../ethernet/stmicro/stmmac/dwmac-anarion.c   |  2 +-
 .../stmicro/stmmac/dwmac-dwc-qos-eth.c        |  6 ++----
 .../ethernet/stmicro/stmmac/dwmac-generic.c   |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-imx.c   |  2 +-
 .../ethernet/stmicro/stmmac/dwmac-ingenic.c   |  2 +-
 .../stmicro/stmmac/dwmac-intel-plat.c         |  9 +++------
 .../ethernet/stmicro/stmmac/dwmac-ipq806x.c   |  2 +-
 .../ethernet/stmicro/stmmac/dwmac-lpc18xx.c   |  2 +-
 .../ethernet/stmicro/stmmac/dwmac-mediatek.c  |  9 +++------
 .../net/ethernet/stmicro/stmmac/dwmac-meson.c |  2 +-
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-oxnas.c |  2 +-
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 15 ++++-----------
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    |  6 ++----
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   |  2 +-
 .../ethernet/stmicro/stmmac/dwmac-starfive.c  |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-sti.c   |  6 ++----
 .../net/ethernet/stmicro/stmmac/dwmac-stm32.c |  6 ++----
 .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c |  6 ++----
 .../net/ethernet/stmicro/stmmac/dwmac-sunxi.c |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-tegra.c |  6 ++----
 .../ethernet/stmicro/stmmac/dwmac-visconti.c  | 19 +++++--------------
 .../ethernet/stmicro/stmmac/stmmac_platform.c |  4 +---
 .../ethernet/stmicro/stmmac/stmmac_platform.h |  2 +-
 24 files changed, 41 insertions(+), 77 deletions(-)

base-commit: ac9a78681b921877518763ba0e89202254349d1b
-- 
2.39.2

