Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF83CCD37B8
	for <linux-tegra@archiver.kernel.org>; Sat, 16 Sep 2023 08:13:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbjIPINL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 16 Sep 2023 04:13:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231489AbjIPIMo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 16 Sep 2023 04:12:44 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F7AA19AD
        for <linux-tegra@vger.kernel.org>; Sat, 16 Sep 2023 01:12:40 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21B44C433C8;
        Sat, 16 Sep 2023 08:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694851959;
        bh=gDuGzivyyQ8xcbFnZYFp+TOLVAp3wAS56uHvlgLzSs8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BOI8U9K2Jl/RBpbL0O5fLetMAE8GEGGrk+yB2Cq9NziIhXCzwtosHXALsyebat8Nj
         AjspZN72qPnAeSHwcyav0UVtA66Y6d1ipkwR8kjhYnmTs9h3xKM4arM8MQQXPukHhr
         ZwNtnjLe3YjIgjfmfe4EZ1luzsB8A6jURhgjMBCkG3wkfMxHcWg4GdJM33ODCMdi7h
         6vcQbtoOnaGpHbswQfLCNaUfcGyp13ynhK4TprN6uYUuj2V7sYp35kZoNGWKOEUHZl
         S6an22a3PDfpXxA2elkd5T6oKGsKQrPpCXyJGOub6PIz+F05D0LrNkdukrFn/TUuPx
         gWtQY+OA19qPQ==
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
Subject: [PATCH net-next v2 18/23] net: stmmac: dwmac-sun8i: use devm_stmmac_probe_config_dt()
Date:   Sat, 16 Sep 2023 15:58:24 +0800
Message-Id: <20230916075829.1560-19-jszhang@kernel.org>
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

The calling of stmmac_pltfr_remove() now needs to be switched to
stmmac_pltfr_remove_no_dt().

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 01e77368eef1..63a7e5e53d7b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -1224,7 +1224,7 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return -EINVAL;
 
-	plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
@@ -1244,7 +1244,7 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 
 	ret = sun8i_dwmac_set_syscon(&pdev->dev, plat_dat);
 	if (ret)
-		goto dwmac_deconfig;
+		return ret;
 
 	ret = sun8i_dwmac_init(pdev, plat_dat->bsp_priv);
 	if (ret)
@@ -1295,8 +1295,6 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	sun8i_dwmac_exit(pdev, gmac);
 dwmac_syscon:
 	sun8i_dwmac_unset_syscon(gmac);
-dwmac_deconfig:
-	stmmac_remove_config_dt(pdev, plat_dat);
 
 	return ret;
 }
@@ -1314,7 +1312,7 @@ static void sun8i_dwmac_remove(struct platform_device *pdev)
 		clk_put(gmac->ephy_clk);
 	}
 
-	stmmac_pltfr_remove(pdev);
+	stmmac_pltfr_remove_no_dt(pdev);
 	sun8i_dwmac_unset_syscon(gmac);
 }
 
-- 
2.40.1

