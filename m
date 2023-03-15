Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D68B2C6FD1D
	for <linux-tegra@archiver.kernel.org>; Wed, 15 Mar 2023 15:08:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232769AbjCOPIv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 15 Mar 2023 11:08:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232731AbjCOPIu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 15 Mar 2023 11:08:50 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B16158093B
        for <linux-tegra@vger.kernel.org>; Wed, 15 Mar 2023 08:08:47 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pcSk1-0000ag-MD; Wed, 15 Mar 2023 16:08:37 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pcSjw-004Kg2-PG; Wed, 15 Mar 2023 16:08:32 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pcSjv-0057m5-SY; Wed, 15 Mar 2023 16:08:31 +0100
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
Subject: [PATCH 159/173] ASoC: tegra: tegra30_ahub: Convert to platform remove callback returning void
Date:   Wed, 15 Mar 2023 16:07:31 +0100
Message-Id: <20230315150745.67084-160-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1631; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=mG2xnGK54c3gkW/J424fJ+pvT7zOveXy6saMBndeJ+c=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd8QzEiiU8opy8RYp3fNcee8lJIQ5bdkDGkZY XU1XbYXPCaJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHfEAAKCRDB/BR4rcrs CcfnB/9KJz1M50Tu4usZY4MPTUlYp5yhkvN4jpmmLVx/uANQWiFIOMdPMzoBDo8FkEEQG3mpl6W 5UwOA3vLyS8gg0LIJssUu7GfJPQi5dq1eGPPQaoCy7dnlGIIItcms0GnfcBlSqAuH7mNbJdzoGW ClzbzwehwCBfzpJyh1CfSdnVaOAgqsmCdXyomKaYuxHaRAAu+oHWMuClsYVXavoN/HfrYr2B+/F BF9fKQxoFvpFm0DEj2hlquDhY+nAOfr5ltn1rBQjOcvpjOY/zxzVxaAk2N0DrBnGlGD+ZPst2LA caEvF24AqoEZ7vvB171AbB+AzKffwDO1R4J1zsTTQpPTWbwq
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
 sound/soc/tegra/tegra30_ahub.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index ef011a488ceb..d2e8078e444a 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -592,13 +592,11 @@ static int tegra30_ahub_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int tegra30_ahub_remove(struct platform_device *pdev)
+static void tegra30_ahub_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
 
 	ahub = NULL;
-
-	return 0;
 }
 
 static const struct dev_pm_ops tegra30_ahub_pm_ops = {
@@ -610,7 +608,7 @@ static const struct dev_pm_ops tegra30_ahub_pm_ops = {
 
 static struct platform_driver tegra30_ahub_driver = {
 	.probe = tegra30_ahub_probe,
-	.remove = tegra30_ahub_remove,
+	.remove_new = tegra30_ahub_remove,
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = tegra30_ahub_of_match,
-- 
2.39.2

