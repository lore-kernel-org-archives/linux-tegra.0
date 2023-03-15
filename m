Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5E2EC7618B
	for <linux-tegra@archiver.kernel.org>; Wed, 15 Mar 2023 15:09:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232834AbjCOPJF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 15 Mar 2023 11:09:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232789AbjCOPIy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 15 Mar 2023 11:08:54 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 193F83432D
        for <linux-tegra@vger.kernel.org>; Wed, 15 Mar 2023 08:08:51 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pcSk1-0000ah-Hw; Wed, 15 Mar 2023 16:08:37 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pcSjw-004Kg5-Rv; Wed, 15 Mar 2023 16:08:32 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pcSjw-0057m8-4M; Wed, 15 Mar 2023 16:08:32 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 160/173] ASoC: tegra: tegra30_i2s: Convert to platform remove callback returning void
Date:   Wed, 15 Mar 2023 16:07:32 +0100
Message-Id: <20230315150745.67084-161-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1808; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=npBJMPd3IFeWZFw0WkTbfz9os/Z46EIM0Dsc9zyKoEo=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd8Ti2G4wbakGgEtihBPjmugkWwkKXSQtqDCk gtXHKxegUeJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHfEwAKCRDB/BR4rcrs CRKmB/4zzZYENZeLkiEmNQ/tWNBLGlzJTux70yldsVkvTjOtwfuDuGhmhWvJ1IAx3uanyZTTcJn mmtD4oclm8qlAKKHNi4Pe8igjXQYjWsyZbL6nzBdReUCerq8FNyulQE4Q1K7SqcV4z4migwTtio Az7o68D5zrAbdoLm+soq9+m8EO7IrUzHRO3qwaEymYItoY7eco28JdDpYPiMUvVbcFtcV6jiIqX kQ0He3B9qx0SC1kVTDZ8HSHr+RkQSh8EyBWOPy7ia0+8NRINC1GFlUhCVsUMpClO0EZZWuuXwFa C6ILHMUlwMdx5r20RWOVxDZW1QIFt+9+UI9dU1JuZn3ZJTSm
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
 sound/soc/tegra/tegra30_i2s.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index c26f960c6afd..644280603095 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -531,7 +531,7 @@ static int tegra30_i2s_platform_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int tegra30_i2s_platform_remove(struct platform_device *pdev)
+static void tegra30_i2s_platform_remove(struct platform_device *pdev)
 {
 	struct tegra30_i2s *i2s = dev_get_drvdata(&pdev->dev);
 
@@ -545,8 +545,6 @@ static int tegra30_i2s_platform_remove(struct platform_device *pdev)
 	tegra30_ahub_free_tx_fifo(i2s->playback_fifo_cif);
 
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static const struct dev_pm_ops tegra30_i2s_pm_ops = {
@@ -563,7 +561,7 @@ static struct platform_driver tegra30_i2s_driver = {
 		.pm = &tegra30_i2s_pm_ops,
 	},
 	.probe = tegra30_i2s_platform_probe,
-	.remove = tegra30_i2s_platform_remove,
+	.remove_new = tegra30_i2s_platform_remove,
 };
 module_platform_driver(tegra30_i2s_driver);
 
-- 
2.39.2

