Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3929C76196
	for <linux-tegra@archiver.kernel.org>; Wed, 15 Mar 2023 15:08:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232950AbjCOPIz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 15 Mar 2023 11:08:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232798AbjCOPIw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 15 Mar 2023 11:08:52 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33CB183882
        for <linux-tegra@vger.kernel.org>; Wed, 15 Mar 2023 08:08:48 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pcSjz-0000T0-0H; Wed, 15 Mar 2023 16:08:35 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pcSju-004KfF-Gi; Wed, 15 Mar 2023 16:08:30 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pcSjt-0057lN-NA; Wed, 15 Mar 2023 16:08:29 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 149/173] ASoC: tegra: tegra210_admaif: Convert to platform remove callback returning void
Date:   Wed, 15 Mar 2023 16:07:21 +0100
Message-Id: <20230315150745.67084-150-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1633; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ujWcgrFi4KsfS0xBsaORvQfzou45iwq4W+cZLZtf78I=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd7zfKFWA/MI8S/6DYDfM73PmC+sJKgaxQAp1 5SsaCfBxTqJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHe8wAKCRDB/BR4rcrs CSrXB/9omCqig4IrymQlP9lYUouO557lutd98YgbA638LQIkPPUnUxmG0yWK8DmBOpLKfo2UR48 ApCKH4dxYuiLK2NKEwp7kaVNw5SV0+PNoApSAaM8UzR68DB5bwLnZyistaUYxLmv9QGuzFXHpEL Nd1pHbYtPkhHCwrVwFVJJmzdf0fCAh5+HCVKh+zEtDD8sj7hX++4+QSS3fVI09oOw2ADPnVBol9 2vf203kECPuZtENKZH9hYcpNJMCcqWD/1ls95F2s1S5TPzrb6LibsLkeX/FfVAu9fE0Q/3ci08B VO5dXsqh8MPWmeRnMQc3n5TZY5+D+oBALR2PlWskoRzMM7RU
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
 sound/soc/tegra/tegra210_admaif.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra210_admaif.c b/sound/soc/tegra/tegra210_admaif.c
index 100a2b6e6063..6868508585a0 100644
--- a/sound/soc/tegra/tegra210_admaif.c
+++ b/sound/soc/tegra/tegra210_admaif.c
@@ -842,11 +842,9 @@ static int tegra_admaif_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int tegra_admaif_remove(struct platform_device *pdev)
+static void tegra_admaif_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static const struct dev_pm_ops tegra_admaif_pm_ops = {
@@ -858,7 +856,7 @@ static const struct dev_pm_ops tegra_admaif_pm_ops = {
 
 static struct platform_driver tegra_admaif_driver = {
 	.probe = tegra_admaif_probe,
-	.remove = tegra_admaif_remove,
+	.remove_new = tegra_admaif_remove,
 	.driver = {
 		.name = "tegra210-admaif",
 		.of_match_table = tegra_admaif_of_match,
-- 
2.39.2

