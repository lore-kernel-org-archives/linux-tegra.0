Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F23ACD37B8
	for <linux-tegra@archiver.kernel.org>; Sat, 16 Sep 2023 08:13:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbjIPIMj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 16 Sep 2023 04:12:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232190AbjIPIMI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 16 Sep 2023 04:12:08 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 071C819AD
        for <linux-tegra@vger.kernel.org>; Sat, 16 Sep 2023 01:12:04 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3E3AC43391;
        Sat, 16 Sep 2023 08:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694851923;
        bh=QnUj2UcWjwSt/r3IooG168fCs/+hvc8TMJRfrlPuAhc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CzD1kc6YyYKRCxIo6So1taAA0DUd7gek1Y3uNl0Z2NgX/pa3f+ymKB2uPvloicRQb
         lzwKMNpWXNCWSB+f0LUEFEK4ZF4blpGPX9fx558wrMhcL10muodo5lfLnE8jSPYyN3
         XP/MAnsO/Ec5a67YaeQ9ofa1vQRlMs9SLJ5kQbB5IhbFGq2aW4TLqJa7y4D0gIzO7S
         pvHWGsbbh8oWEhZgvG+hhctY8ZZRZqO1umeKhFeD2WA4l4LxwSN/Wmz+z0mCIPp2Xf
         NDzO378fgWsjoU6boFTP5GZcD5js+6NhVVjF7i6diewBSkii96uIwkz5yTBcjfnuGT
         AxywFClOptu6w==
From:   Jisheng Zhang <jszhang@kernel.org>
To:     Giuseppe Cavallaro <peppe.cavallaro@st.com>,
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
Subject: [PATCH net-next v2 13/23] net: stmmac: dwmac-rk: use devm_stmmac_probe_config_dt()
Date:   Sat, 16 Sep 2023 15:58:19 +0800
Message-Id: <20230916075829.1560-14-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230916075829.1560-1-jszhang@kernel.org>
References: <20230916075829.1560-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Simplify the driver's probe() function by using the devres
variant of stmmac_probe_config_dt().

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index d920a50dd16c..382e8de1255d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1824,7 +1824,7 @@ static int rk_gmac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
@@ -1836,18 +1836,16 @@ static int rk_gmac_probe(struct platform_device *pdev)
 	plat_dat->fix_mac_speed = rk_fix_speed;
 
 	plat_dat->bsp_priv = rk_gmac_setup(pdev, plat_dat, data);
-	if (IS_ERR(plat_dat->bsp_priv)) {
-		ret = PTR_ERR(plat_dat->bsp_priv);
-		goto err_remove_config_dt;
-	}
+	if (IS_ERR(plat_dat->bsp_priv))
+		return PTR_ERR(plat_dat->bsp_priv);
 
 	ret = rk_gmac_clk_init(plat_dat);
 	if (ret)
-		goto err_remove_config_dt;
+		return ret;
 
 	ret = rk_gmac_powerup(plat_dat->bsp_priv);
 	if (ret)
-		goto err_remove_config_dt;
+		return ret;
 
 	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 	if (ret)
@@ -1857,8 +1855,6 @@ static int rk_gmac_probe(struct platform_device *pdev)
 
 err_gmac_powerdown:
 	rk_gmac_powerdown(plat_dat->bsp_priv);
-err_remove_config_dt:
-	stmmac_remove_config_dt(pdev, plat_dat);
 
 	return ret;
 }
-- 
2.40.1

