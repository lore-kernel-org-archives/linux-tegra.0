Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B30C46CA1
	for <linux-tegra@archiver.kernel.org>; Sat, 16 Sep 2023 08:13:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231998AbjIPIMl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 16 Sep 2023 04:12:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231672AbjIPIMa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 16 Sep 2023 04:12:30 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8270719AE
        for <linux-tegra@vger.kernel.org>; Sat, 16 Sep 2023 01:12:25 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1809C433CD;
        Sat, 16 Sep 2023 08:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694851945;
        bh=pwxVh7O0mYqw2Ljn4tWnXFw2NWOIpp5wpRx6GKnF3MQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=e6vmNeEho7f/29mMl9USm28gLe72oRfimQLLra+JREzOWdEWz0f35mgbt/MgdYtFO
         Zd1v0PDZXM5KOtc/FNL4PS8ei18B8nJwEZmlOJq11PTOBmRx+uzs9VLKIrFtLFKm9v
         FhEKtwgvyPZWlWDe1uBvI4ZHPFqRgZsaEJP+PjAjDHN1ImOSkRhGI9WRq2Drq1atGO
         bAhpkGvPVToy+Eu/yge2gYmKZK8raCy2/9sTkeo7u+NBuiA5vanKaW6BfbsdrMoUdf
         hTKqjioGt1lcO5RT2Vlp1cL/b6Oave+4yEo7zgI+rvo7XSx0bpYaKmfIobqnufuDb+
         fvOfSI3MhcitQ==
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
Subject: [PATCH net-next v2 16/23] net: stmmac: dwmac-sti: use devm_stmmac_probe_config_dt()
Date:   Sat, 16 Sep 2023 15:58:22 +0800
Message-Id: <20230916075829.1560-17-jszhang@kernel.org>
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
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
index 0d653bbb931b..4445cddc4cbe 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
@@ -273,20 +273,18 @@ static int sti_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
 	dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
-	if (!dwmac) {
-		ret = -ENOMEM;
-		goto err_remove_config_dt;
-	}
+	if (!dwmac)
+		return -ENOMEM;
 
 	ret = sti_dwmac_parse_data(dwmac, pdev);
 	if (ret) {
 		dev_err(&pdev->dev, "Unable to parse OF data\n");
-		goto err_remove_config_dt;
+		return ret;
 	}
 
 	dwmac->fix_retime_src = data->fix_retime_src;
@@ -296,7 +294,7 @@ static int sti_dwmac_probe(struct platform_device *pdev)
 
 	ret = clk_prepare_enable(dwmac->clk);
 	if (ret)
-		goto err_remove_config_dt;
+		return ret;
 
 	ret = sti_dwmac_set_mode(dwmac);
 	if (ret)
@@ -310,8 +308,6 @@ static int sti_dwmac_probe(struct platform_device *pdev)
 
 disable_clk:
 	clk_disable_unprepare(dwmac->clk);
-err_remove_config_dt:
-	stmmac_remove_config_dt(pdev, plat_dat);
 
 	return ret;
 }
-- 
2.40.1

