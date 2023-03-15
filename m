Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CAC9C7618B
	for <linux-tegra@archiver.kernel.org>; Wed, 15 Mar 2023 15:08:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231466AbjCOPI5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 15 Mar 2023 11:08:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232783AbjCOPIx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 15 Mar 2023 11:08:53 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A1AF74A7E
        for <linux-tegra@vger.kernel.org>; Wed, 15 Mar 2023 08:08:49 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pcSjz-0000WK-WA; Wed, 15 Mar 2023 16:08:36 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pcSjv-004Kfc-Jm; Wed, 15 Mar 2023 16:08:31 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pcSju-0057lk-Ob; Wed, 15 Mar 2023 16:08:30 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Sameer Pujar <spujar@nvidia.com>
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 154/173] ASoC: tegra: tegra210_i2s: Convert to platform remove callback returning void
Date:   Wed, 15 Mar 2023 16:07:26 +0100
Message-Id: <20230315150745.67084-155-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1559; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=tH1fqkyGsGjPKdIEAp+LvjTKyjqxxpS1lexqFqgI+Z4=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkEd8CrFXDH2jjw5yiOOFG+8tgO7EeCD77/oe3k eiD9DGU4d2JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZBHfAgAKCRDB/BR4rcrs CXAbCACYH9ByLZqYTGX2IAl3xx9HTrah5SwbRX8IU31Rn3BosIZ3c0wxajoKuhqL+D26EfkCA8i dvI1OfJiXyUajycWo1TZESwkE75Tyu275zlWktGh8ouB9Te0FsNDDnNLtxi4XKoOLcbMuXsaBTX l7eEgeB51p+AveSf8rPnpuX7o/ygAFO/aHu7wHBhVuRvAygt6/xVP0KwuAbA+/mxp+swM5+4WY3 mmHMZXLC1XpkNTDEDpd8RJIxNYpR30sCidGLopDQAA6xq/mBRX1bL1SgyHj3PLVb7FCoRMjSxtg 25cfDrdmWsgO7eOc3/FjXQeZh15VmNgKGcBqNhq6iuW7mdEA
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
 sound/soc/tegra/tegra210_i2s.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra210_i2s.c b/sound/soc/tegra/tegra210_i2s.c
index 39ffa4d76b59..21724cd3525e 100644
--- a/sound/soc/tegra/tegra210_i2s.c
+++ b/sound/soc/tegra/tegra210_i2s.c
@@ -931,11 +931,9 @@ static int tegra210_i2s_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int tegra210_i2s_remove(struct platform_device *pdev)
+static void tegra210_i2s_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
-
-	return 0;
 }
 
 static const struct dev_pm_ops tegra210_i2s_pm_ops = {
@@ -958,7 +956,7 @@ static struct platform_driver tegra210_i2s_driver = {
 		.pm = &tegra210_i2s_pm_ops,
 	},
 	.probe = tegra210_i2s_probe,
-	.remove = tegra210_i2s_remove,
+	.remove_new = tegra210_i2s_remove,
 };
 module_platform_driver(tegra210_i2s_driver)
 
-- 
2.39.2

