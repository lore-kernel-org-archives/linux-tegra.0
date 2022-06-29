Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AFA5C43334
	for <linux-tegra@archiver.kernel.org>; Wed, 29 Jun 2022 19:42:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230369AbiF2Tmr (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 29 Jun 2022 15:42:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231237AbiF2Tmp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 29 Jun 2022 15:42:45 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 147DA2E9EF
        for <linux-tegra@vger.kernel.org>; Wed, 29 Jun 2022 12:42:45 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1o6da7-0007RK-HG; Wed, 29 Jun 2022 21:42:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o6da3-003SHb-6R; Wed, 29 Jun 2022 21:42:34 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o6da5-001xRb-Dt; Wed, 29 Jun 2022 21:42:33 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 3/5] ASoC: tegra: tegra20_das: Get rid of global pointer for driver data
Date:   Wed, 29 Jun 2022 21:42:22 +0200
Message-Id: <20220629194224.175607-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629194224.175607-1-u.kleine-koenig@pengutronix.de>
References: <20220629194224.175607-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4333; h=from:subject; bh=NNwqyKjbaWWkMxiIfqGcg6aIfVxVnVnYfxOrcygWPSU=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBivKsXbco0jkOBROa6nTPsgOVFbpoV/KvbMofKeg2r 5xph/U6JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYryrFwAKCRDB/BR4rcrsCT0jB/ 0fTacBAnWTe6pSayT6Wf51rlIxuSq9RmDkNJXcte0OBrxAfyfV8M7y26Sc4mVr7laKjvC7C7VEfzYo G+ld0Yr4mve5PS1Wvbbo2Ak3D/LBEOQ0vv9EOwhV/ZdCnVm2F49l36wA0fIsxKuHSFhxdCiMT0dWVL DQlQbgyxDpwS2DRzj8Hd6GfDpgBK1vWffacVyhShr4CIpgY5QiMq82uWaz9Kr0+mGlWMtODQwOTTIw Dt8vDiY3Db2NCgd59hriuCIt4eimNYojPlAvXVLRW8J2GO7q5gKddjh6ddGPZaw7Vo2TBxpfILM+IJ I9cMjCZ1RHRCj5N+tgcf7y+HMWIgbE
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-tegra@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This enables the driver (at least theoretically) to bind to more than one
device.

The remove function has nothing to do now, so it is dropped.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/tegra/tegra20_das.c | 66 +++++++++++------------------------
 1 file changed, 20 insertions(+), 46 deletions(-)

diff --git a/sound/soc/tegra/tegra20_das.c b/sound/soc/tegra/tegra20_das.c
index 4e23fd96c745..8637a0cc1f5e 100644
--- a/sound/soc/tegra/tegra20_das.c
+++ b/sound/soc/tegra/tegra20_das.c
@@ -97,14 +97,12 @@ struct tegra20_das {
  * configuration is programmed.
  */
 
-static struct tegra20_das *das;
-
-static inline void tegra20_das_write(u32 reg, u32 val)
+static inline void tegra20_das_write(struct tegra20_das *das, u32 reg, u32 val)
 {
 	regmap_write(das->regmap, reg, val);
 }
 
-static int tegra20_das_connect_dap_to_dac(int dap, int dac)
+static int tegra20_das_connect_dap_to_dac(struct tegra20_das *das, int dap, int dac)
 {
 	u32 addr;
 	u32 reg;
@@ -116,12 +114,12 @@ static int tegra20_das_connect_dap_to_dac(int dap, int dac)
 		(dap * TEGRA20_DAS_DAP_CTRL_SEL_STRIDE);
 	reg = dac << TEGRA20_DAS_DAP_CTRL_SEL_DAP_CTRL_SEL_P;
 
-	tegra20_das_write(addr, reg);
+	tegra20_das_write(das, addr, reg);
 
 	return 0;
 }
 
-static int tegra20_das_connect_dac_to_dap(int dac, int dap)
+static int tegra20_das_connect_dac_to_dap(struct tegra20_das *das, int dac, int dap)
 {
 	u32 addr;
 	u32 reg;
@@ -135,7 +133,7 @@ static int tegra20_das_connect_dac_to_dap(int dac, int dap)
 		dap << TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA1_SEL_P |
 		dap << TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA2_SEL_P;
 
-	tegra20_das_write(addr, reg);
+	tegra20_das_write(das, addr, reg);
 
 	return 0;
 }
@@ -168,74 +166,51 @@ static const struct regmap_config tegra20_das_regmap_config = {
 static int tegra20_das_probe(struct platform_device *pdev)
 {
 	void __iomem *regs;
+	struct tegra20_das *das;
 	int ret = 0;
 
-	if (das)
-		return -ENODEV;
-
 	das = devm_kzalloc(&pdev->dev, sizeof(struct tegra20_das), GFP_KERNEL);
-	if (!das) {
-		ret = -ENOMEM;
-		goto err;
-	}
+	if (!das)
+		return -ENOMEM;
+
 	das->dev = &pdev->dev;
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(regs)) {
-		ret = PTR_ERR(regs);
-		goto err;
-	}
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
 
 	das->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
 					    &tegra20_das_regmap_config);
 	if (IS_ERR(das->regmap)) {
 		dev_err(&pdev->dev, "regmap init failed\n");
-		ret = PTR_ERR(das->regmap);
-		goto err;
+		return PTR_ERR(das->regmap);
 	}
 
-	ret = tegra20_das_connect_dap_to_dac(TEGRA20_DAS_DAP_ID_1,
+	ret = tegra20_das_connect_dap_to_dac(das, TEGRA20_DAS_DAP_ID_1,
 					     TEGRA20_DAS_DAP_SEL_DAC1);
 	if (ret) {
 		dev_err(&pdev->dev, "Can't set up DAS DAP connection\n");
-		goto err;
+		return ret;
 	}
-	ret = tegra20_das_connect_dac_to_dap(TEGRA20_DAS_DAC_ID_1,
+	ret = tegra20_das_connect_dac_to_dap(das, TEGRA20_DAS_DAC_ID_1,
 					     TEGRA20_DAS_DAC_SEL_DAP1);
 	if (ret) {
 		dev_err(&pdev->dev, "Can't set up DAS DAC connection\n");
-		goto err;
+		return ret;
 	}
-
-	ret = tegra20_das_connect_dap_to_dac(TEGRA20_DAS_DAP_ID_3,
+	ret = tegra20_das_connect_dap_to_dac(das, TEGRA20_DAS_DAP_ID_3,
 					     TEGRA20_DAS_DAP_SEL_DAC3);
 	if (ret) {
 		dev_err(&pdev->dev, "Can't set up DAS DAP connection\n");
-		goto err;
+		return ret;
 	}
-	ret = tegra20_das_connect_dac_to_dap(TEGRA20_DAS_DAC_ID_3,
+	ret = tegra20_das_connect_dac_to_dap(das, TEGRA20_DAS_DAC_ID_3,
 					     TEGRA20_DAS_DAC_SEL_DAP3);
 	if (ret) {
 		dev_err(&pdev->dev, "Can't set up DAS DAC connection\n");
-		goto err;
+		return ret;
 	}
 
-	platform_set_drvdata(pdev, das);
-
-	return 0;
-
-err:
-	das = NULL;
-	return ret;
-}
-
-static int tegra20_das_remove(struct platform_device *pdev)
-{
-	if (!das)
-		return -ENODEV;
-
-	das = NULL;
-
 	return 0;
 }
 
@@ -246,7 +221,6 @@ static const struct of_device_id tegra20_das_of_match[] = {
 
 static struct platform_driver tegra20_das_driver = {
 	.probe = tegra20_das_probe,
-	.remove = tegra20_das_remove,
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = tegra20_das_of_match,
-- 
2.36.1

