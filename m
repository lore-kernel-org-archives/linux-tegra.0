Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38774CCA47C
	for <linux-tegra@archiver.kernel.org>; Wed, 29 Jun 2022 19:42:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230498AbiF2Tmp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 29 Jun 2022 15:42:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbiF2Tmo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 29 Jun 2022 15:42:44 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5E6835DE0
        for <linux-tegra@vger.kernel.org>; Wed, 29 Jun 2022 12:42:42 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1o6da7-0007RJ-9q; Wed, 29 Jun 2022 21:42:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o6da3-003SHY-1Q; Wed, 29 Jun 2022 21:42:34 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o6da5-001xRh-Pf; Wed, 29 Jun 2022 21:42:33 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 5/5] ASoC: tegra: tegra20_das: Drop write-only driver data member
Date:   Wed, 29 Jun 2022 21:42:24 +0200
Message-Id: <20220629194224.175607-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629194224.175607-1-u.kleine-koenig@pengutronix.de>
References: <20220629194224.175607-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=880; h=from:subject; bh=gHHGNlPctj/0o+iyRRIYzjROycsLc/cYPpW/2IUXE+U=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBivKsd0lM55FQWCkvAlD28+GH123ltTUkfqgyMl7GL +YjqqDWJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYryrHQAKCRDB/BR4rcrsCbIEB/ 9w1OQ+eqX+aUFGY+T2KuxljawC7xFOpRq3x02pnG8GS8pX50hUnx5xq9YRlgeeznvWoiksJDGZniVh AqijAKcqEXplD3I+W/G/OoLhkJpDDivyDWSE53BgcH+kVShtUYm0n1iWCPdLkaapAol/B5FfmfBIm/ KUceDJUYAtrpO3VAGzDqCHcp9saWMfhdMvavASdZ4YYl4yoD1J/N4o36jiV+VLpIyGEjQyyu6qGedq B/c47qtPjoU/U927WD6QJpz7JCCZSqmrOmKvcBQ7AfAgFWY31EI3b+zvHsslPdKRZZZZqXgp6lDyUx G0qxRUT5O9eCAh5PLPhjK2cT90sAca
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-tegra@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The dev member of struct tegra20_das is only written once in .probe().
There is no loss of functionality if the member and the assignment go away.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/tegra/tegra20_das.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/tegra/tegra20_das.c b/sound/soc/tegra/tegra20_das.c
index 39a6135dd0d0..c620ab0c601f 100644
--- a/sound/soc/tegra/tegra20_das.c
+++ b/sound/soc/tegra/tegra20_das.c
@@ -77,7 +77,6 @@
 #define TEGRA20_DAS_DAC_ID_3 2
 
 struct tegra20_das {
-	struct device *dev;
 	struct regmap *regmap;
 };
 
@@ -162,8 +161,6 @@ static int tegra20_das_probe(struct platform_device *pdev)
 	if (!das)
 		return -ENOMEM;
 
-	das->dev = &pdev->dev;
-
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
-- 
2.36.1

