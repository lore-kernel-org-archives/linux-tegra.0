Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02551C433EF
	for <linux-tegra@archiver.kernel.org>; Wed, 29 Jun 2022 19:42:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbiF2Tmp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 29 Jun 2022 15:42:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230492AbiF2Tmo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 29 Jun 2022 15:42:44 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C582E2E9EF
        for <linux-tegra@vger.kernel.org>; Wed, 29 Jun 2022 12:42:42 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1o6da7-0007RH-8I; Wed, 29 Jun 2022 21:42:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o6da2-003SHV-NC; Wed, 29 Jun 2022 21:42:34 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o6da5-001xRe-Jh; Wed, 29 Jun 2022 21:42:33 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 4/5] ASoC: tegra: tegra20_das: Make helper functions return void
Date:   Wed, 29 Jun 2022 21:42:23 +0200
Message-Id: <20220629194224.175607-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629194224.175607-1-u.kleine-koenig@pengutronix.de>
References: <20220629194224.175607-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3489; h=from:subject; bh=6qOB9QLcux3RkEXYTjgZytt2bAmgWTouMGDcxT7pWfg=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBivKsa9uH8D4sZnolQK8RuyXpF/t92AZxapWZBD15h 37kMhkGJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYryrGgAKCRDB/BR4rcrsCcQcB/ wNui0qAQ3RMOCtL22n7pZOai1TtukuVD6kV2fI+np7nRzNDLpZHnrmw+iDDra+jCC2c7PP/jccAEP0 pbbnGgDXvBZh543m3lm7aiTodzltoZ9CaIWJWSDJgU7REq41mmUUXjExOUKWgM/xquCTJvrhmeLbx0 Z+hBFf4lYzBp6oRSaAO6aCEf6/GJwxiMiRywxbmakhcTTsLJZi5TChlHO4BsnSobPNYU1KrBArKMdk 9YOk42ygNF5UVbOYsM5I1fZk0+qdh7yihDP1nt16YKC0xNZFjyoTddfZgi3GQUHa5biHbutIwA/vOA mF5N6R3eHtaAeeXss+Cbp8oIhn1dX7
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-tegra@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

These only ever return a value != 0 if the parameter das is NULL. In the
only caller however it's already asserted this isn't the case.

So convert the functions to return void and simplify the caller
accordingly.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/tegra/tegra20_das.c | 47 ++++++++---------------------------
 1 file changed, 10 insertions(+), 37 deletions(-)

diff --git a/sound/soc/tegra/tegra20_das.c b/sound/soc/tegra/tegra20_das.c
index 8637a0cc1f5e..39a6135dd0d0 100644
--- a/sound/soc/tegra/tegra20_das.c
+++ b/sound/soc/tegra/tegra20_das.c
@@ -102,31 +102,23 @@ static inline void tegra20_das_write(struct tegra20_das *das, u32 reg, u32 val)
 	regmap_write(das->regmap, reg, val);
 }
 
-static int tegra20_das_connect_dap_to_dac(struct tegra20_das *das, int dap, int dac)
+static void tegra20_das_connect_dap_to_dac(struct tegra20_das *das, int dap, int dac)
 {
 	u32 addr;
 	u32 reg;
 
-	if (!das)
-		return -ENODEV;
-
 	addr = TEGRA20_DAS_DAP_CTRL_SEL +
 		(dap * TEGRA20_DAS_DAP_CTRL_SEL_STRIDE);
 	reg = dac << TEGRA20_DAS_DAP_CTRL_SEL_DAP_CTRL_SEL_P;
 
 	tegra20_das_write(das, addr, reg);
-
-	return 0;
 }
 
-static int tegra20_das_connect_dac_to_dap(struct tegra20_das *das, int dac, int dap)
+static void tegra20_das_connect_dac_to_dap(struct tegra20_das *das, int dac, int dap)
 {
 	u32 addr;
 	u32 reg;
 
-	if (!das)
-		return -ENODEV;
-
 	addr = TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL +
 		(dac * TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_STRIDE);
 	reg = dap << TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_CLK_SEL_P |
@@ -134,8 +126,6 @@ static int tegra20_das_connect_dac_to_dap(struct tegra20_das *das, int dac, int
 		dap << TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA2_SEL_P;
 
 	tegra20_das_write(das, addr, reg);
-
-	return 0;
 }
 
 #define LAST_REG(name) \
@@ -167,7 +157,6 @@ static int tegra20_das_probe(struct platform_device *pdev)
 {
 	void __iomem *regs;
 	struct tegra20_das *das;
-	int ret = 0;
 
 	das = devm_kzalloc(&pdev->dev, sizeof(struct tegra20_das), GFP_KERNEL);
 	if (!das)
@@ -186,30 +175,14 @@ static int tegra20_das_probe(struct platform_device *pdev)
 		return PTR_ERR(das->regmap);
 	}
 
-	ret = tegra20_das_connect_dap_to_dac(das, TEGRA20_DAS_DAP_ID_1,
-					     TEGRA20_DAS_DAP_SEL_DAC1);
-	if (ret) {
-		dev_err(&pdev->dev, "Can't set up DAS DAP connection\n");
-		return ret;
-	}
-	ret = tegra20_das_connect_dac_to_dap(das, TEGRA20_DAS_DAC_ID_1,
-					     TEGRA20_DAS_DAC_SEL_DAP1);
-	if (ret) {
-		dev_err(&pdev->dev, "Can't set up DAS DAC connection\n");
-		return ret;
-	}
-	ret = tegra20_das_connect_dap_to_dac(das, TEGRA20_DAS_DAP_ID_3,
-					     TEGRA20_DAS_DAP_SEL_DAC3);
-	if (ret) {
-		dev_err(&pdev->dev, "Can't set up DAS DAP connection\n");
-		return ret;
-	}
-	ret = tegra20_das_connect_dac_to_dap(das, TEGRA20_DAS_DAC_ID_3,
-					     TEGRA20_DAS_DAC_SEL_DAP3);
-	if (ret) {
-		dev_err(&pdev->dev, "Can't set up DAS DAC connection\n");
-		return ret;
-	}
+	tegra20_das_connect_dap_to_dac(das, TEGRA20_DAS_DAP_ID_1,
+				       TEGRA20_DAS_DAP_SEL_DAC1);
+	tegra20_das_connect_dac_to_dap(das, TEGRA20_DAS_DAC_ID_1,
+				       TEGRA20_DAS_DAC_SEL_DAP1);
+	tegra20_das_connect_dap_to_dac(das, TEGRA20_DAS_DAP_ID_3,
+				       TEGRA20_DAS_DAP_SEL_DAC3);
+	tegra20_das_connect_dac_to_dap(das, TEGRA20_DAS_DAC_ID_3,
+				       TEGRA20_DAS_DAC_SEL_DAP3);
 
 	return 0;
 }
-- 
2.36.1

