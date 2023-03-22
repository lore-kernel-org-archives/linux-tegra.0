Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A828C6FD1F
	for <linux-tegra@archiver.kernel.org>; Wed, 22 Mar 2023 17:03:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbjCVRDE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 22 Mar 2023 13:03:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230249AbjCVRC7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 22 Mar 2023 13:02:59 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AC7A5D27C
        for <linux-tegra@vger.kernel.org>; Wed, 22 Mar 2023 10:02:36 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pf1r2-0000QW-R3; Wed, 22 Mar 2023 18:02:28 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pf1r2-005xkC-4G; Wed, 22 Mar 2023 18:02:28 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pf1r1-0075pj-9s; Wed, 22 Mar 2023 18:02:27 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 07/12] drm/tegra: gr3d: Convert to platform remove callback returning void
Date:   Wed, 22 Mar 2023 18:02:18 +0100
Message-Id: <20230322170223.410376-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322170223.410376-1-u.kleine-koenig@pengutronix.de>
References: <20230322170223.410376-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1518; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=3s7091uswwQh/HJIfWJ5QGHqkE8sp2LfyGJsXRXhH+M=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkGzSWStaawCYKwI/0EiwcUCI+HOXVdsNGa8rjq oI1s/4IglyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBs0lgAKCRCPgPtYfRL+ Thy6CACbKJGkVT9IDeZkpiQppEbjMGRAxJvGQzbZCB+ZSP9hULuW5c/ogpaqvDLg4iqhvOMEHet xyp7GHW6rW3lnw7gCScELJNUHzX5NJTi+mZP6jUqB6+N4pGKFiCUAm1UHKy2gD/sOYEz1OGI3ow S9e3Jl4rCh7i4xMoyVIiRxpzC+faMJhM9eVZbIXyKebxbBkrtTCLLhFb3WKv8K+BDt4z1MtJdcb EVDOeJ0qy7XsDUKYTFMhE9aBftcV59riy2jRzif2tzPTN7LP6DcIX8CfcJ008TrLyiwKqLstPk5 5qgaWL/3dRaO/u8x23iV8ZdHd6CF0aYQbgce7cpEJukhrxiq
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
 drivers/gpu/drm/tegra/gr3d.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/gr3d.c b/drivers/gpu/drm/tegra/gr3d.c
index cd3679d8eef9..c026c2c916c1 100644
--- a/drivers/gpu/drm/tegra/gr3d.c
+++ b/drivers/gpu/drm/tegra/gr3d.c
@@ -550,13 +550,11 @@ static int gr3d_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int gr3d_remove(struct platform_device *pdev)
+static void gr3d_remove(struct platform_device *pdev)
 {
 	struct gr3d *gr3d = platform_get_drvdata(pdev);
 
 	host1x_client_unregister(&gr3d->client.base);
-
-	return 0;
 }
 
 static int __maybe_unused gr3d_runtime_suspend(struct device *dev)
@@ -632,5 +630,5 @@ struct platform_driver tegra_gr3d_driver = {
 		.pm = &tegra_gr3d_pm,
 	},
 	.probe = gr3d_probe,
-	.remove = gr3d_remove,
+	.remove_new = gr3d_remove,
 };
-- 
2.39.2

