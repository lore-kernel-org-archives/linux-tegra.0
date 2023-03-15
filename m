Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99635C6FD1D
	for <linux-tegra@archiver.kernel.org>; Wed, 15 Mar 2023 15:09:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232798AbjCOPJH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 15 Mar 2023 11:09:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232816AbjCOPIz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 15 Mar 2023 11:08:55 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5173E6A1DF
        for <linux-tegra@vger.kernel.org>; Wed, 15 Mar 2023 08:08:51 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pcSk1-0000ZS-5u; Wed, 15 Mar 2023 16:08:37 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pcSjw-004Kft-Ga; Wed, 15 Mar 2023 16:08:32 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pcSjv-0057lt-7T; Wed, 15 Mar 2023 16:08:31 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 156/173] ASoC: tegra: tegra210_mvc: Convert to platform remove callback returning void
Date:   Wed, 15 Mar 2023 16:07:28 +0100
Message-Id: <20230315150745.67084-157-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1613; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=nl1Dnf+s5Tu8X6WGvy59dc1DShbxLRpkAp/PdK62ceg=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd8I1qyx9/YydUbgbj5XKT/ugSPE2nINsbyOG YbJUPCcsRWJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHfCAAKCRDB/BR4rcrs CU35B/9HIlatHSmtAWe/BhRWWdFld4CvF2kVJZH72r3SAuPMcyuOUjPQ3wz0ZMnRwKNZUmXkhsd 0/UEGhqBFrjsg9MHUcF5dXODtYEC523tKTbwDWDlq623P8LNnjreIF+GQdbi/NPiLh1QBaloV1+ pznaHe7GaxfjZSp3VY4jvNT/iIG3+TFxZa2O34xeIlXlG6z6EhejgFO/lHfq90Ed+df8rVII4oQ oAMf0o9bZXd31UOx2UZcxBiIIpSBd1UvLcypceGtQXeCKlJ8jynw+GVt6EzkQ/rQ1ZL+sWvSpW4 u/igbBj5Xdy9efnHBu6Wm7ornz72SCcatOteeUtPmUcZ44yY
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-tegra@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/tegra/tegra210_mvc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra210_mvc.c b/sound/soc/tegra/tegra210_mvc.c
index 725385e17d84..44f465e11bee 100644
--- a/sound/soc/tegra/tegra210_mvc.c
+++ b/sound/soc/tegra/tegra210_mvc.c
@@ -748,11 +748,9 @@ static int tegra210_mvc_platform_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int tegra210_mvc_platform_remove(struct platform_device *pdev)
+static void tegra210_mvc_platform_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static const struct dev_pm_ops tegra210_mvc_pm_ops = {
@@ -769,7 +767,7 @@ static struct platform_driver tegra210_mvc_driver = {
 		.pm = &tegra210_mvc_pm_ops,
 	},
 	.probe = tegra210_mvc_platform_probe,
-	.remove = tegra210_mvc_platform_remove,
+	.remove_new = tegra210_mvc_platform_remove,
 };
 module_platform_driver(tegra210_mvc_driver)
 
-- 
2.39.2

