Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A11A2C77B6C
	for <linux-tegra@archiver.kernel.org>; Wed, 22 Mar 2023 17:03:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231277AbjCVRDE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 22 Mar 2023 13:03:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230272AbjCVRDA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 22 Mar 2023 13:03:00 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D7F36545F
        for <linux-tegra@vger.kernel.org>; Wed, 22 Mar 2023 10:02:36 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pf1r3-0000Te-Qe; Wed, 22 Mar 2023 18:02:29 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pf1r3-005xkT-3z; Wed, 22 Mar 2023 18:02:29 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pf1r2-0075q1-Bb; Wed, 22 Mar 2023 18:02:28 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 12/12] drm/tegra: vic: Convert to platform remove callback returning void
Date:   Wed, 22 Mar 2023 18:02:23 +0100
Message-Id: <20230322170223.410376-13-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322170223.410376-1-u.kleine-koenig@pengutronix.de>
References: <20230322170223.410376-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1560; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=a36Yb7fgQxxc7MoSO1m7HLtAFFfRxHPxSIL3UqKHMks=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkGzScrW7gvAr/vjDEeHBCJ0tHKloBxUj83T5AX yeC42DLQ92JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBs0nAAKCRCPgPtYfRL+ Tj4kCAC3l8kWBwLVvoGAGPRBAGBro1gSJ+efnzHKWRt6zotWrjonDTPiGZWGtWsD4PQ7efRh9Qp jvmdZ6/yT0eQp2QmdNM9lh102VEP7dWf1nDM5C5Lok7DCrnGujrBfDtQKMK6HbsyYSJASaPeAE7 6lm+q6ri19aJfoZNQf6UoZVfL+O42o3Xg4YLORMBKTSqa4H43yy7Pk/ZOF+d+IMyDd8uAnTaQAf p+gVL6Wko0QWkOUugxGdDD2o/6s2SUn+SSaUkPmkhTQMwtUIKVLxKYwg+9NXBQdYbfkszQRzLtj jgwKXGnyyNw3HqSl4O4oXOCqYHAfgsgkBc5n9P1rY9cIo8ov
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
 drivers/gpu/drm/tegra/vic.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index fd614756ecf8..da7a038dca20 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -537,15 +537,13 @@ static int vic_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int vic_remove(struct platform_device *pdev)
+static void vic_remove(struct platform_device *pdev)
 {
 	struct vic *vic = platform_get_drvdata(pdev);
 
 	host1x_client_unregister(&vic->client.base);
 
 	falcon_exit(&vic->falcon);
-
-	return 0;
 }
 
 static const struct dev_pm_ops vic_pm_ops = {
@@ -560,7 +558,7 @@ struct platform_driver tegra_vic_driver = {
 		.pm = &vic_pm_ops
 	},
 	.probe = vic_probe,
-	.remove = vic_remove,
+	.remove_new = vic_remove,
 };
 
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_124_SOC)
-- 
2.39.2

