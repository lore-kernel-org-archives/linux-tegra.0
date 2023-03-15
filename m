Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DE6FC61DA4
	for <linux-tegra@archiver.kernel.org>; Wed, 15 Mar 2023 15:08:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232622AbjCOPIv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 15 Mar 2023 11:08:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232427AbjCOPIu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 15 Mar 2023 11:08:50 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B16CD80E15
        for <linux-tegra@vger.kernel.org>; Wed, 15 Mar 2023 08:08:47 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pcSjy-0000RK-Au; Wed, 15 Mar 2023 16:08:34 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pcSju-004Kex-06; Wed, 15 Mar 2023 16:08:30 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pcSjt-0057lB-3V; Wed, 15 Mar 2023 16:08:29 +0100
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
Subject: [PATCH 146/173] ASoC: tegra: tegra186_dspk: Convert to platform remove callback returning void
Date:   Wed, 15 Mar 2023 16:07:18 +0100
Message-Id: <20230315150745.67084-147-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1629; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=Ye5g1gghrV9Sm/9HNFXIbWrlR3eA628GPRnVOdt5+OU=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd7qjEOW9UkHu9CmGlJjL8sn4Z0G6scI5G19t tXtr/r9WP+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHe6gAKCRDB/BR4rcrs CWRwB/49eujdvervl9zc1OUrG/6VTmE8WmytgLVWJVFBxSfj/GZIWg4mysTYWn1DyWVPK64pexi QFduWIKzH2l/sxIoJvO1ZUmiihC2/Qk6mDOm+XPkB0kgHg0hf/itAFN1/8jQqpIjT396/3Ay+94 iuX7fr4AvFw/KtODi9+XZz04/EWLcdnQZwuXkFzDpNZfegsg+O305SAsmbKgM39+5ZEtUZP/ZvO WGDrplFQ5hunqmEEwuveVcgKQkxA1VTOHMi1ytAqkjvoLB59KDrhINwaXxCZXk8qmuO8TNyoko+ OU3pUG3K/HIcBprQKqgP4xZ2/VBMRydVFNPbkgryV8OAKiR3
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
 sound/soc/tegra/tegra186_dspk.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra186_dspk.c b/sound/soc/tegra/tegra186_dspk.c
index a74c980ee775..a0ce7eb11de9 100644
--- a/sound/soc/tegra/tegra186_dspk.c
+++ b/sound/soc/tegra/tegra186_dspk.c
@@ -524,11 +524,9 @@ static int tegra186_dspk_platform_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int tegra186_dspk_platform_remove(struct platform_device *pdev)
+static void tegra186_dspk_platform_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static const struct dev_pm_ops tegra186_dspk_pm_ops = {
@@ -545,7 +543,7 @@ static struct platform_driver tegra186_dspk_driver = {
 		.pm = &tegra186_dspk_pm_ops,
 	},
 	.probe = tegra186_dspk_platform_probe,
-	.remove = tegra186_dspk_platform_remove,
+	.remove_new = tegra186_dspk_platform_remove,
 };
 module_platform_driver(tegra186_dspk_driver);
 
-- 
2.39.2

