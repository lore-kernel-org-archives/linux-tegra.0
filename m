Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA64C7EE21
	for <linux-tegra@archiver.kernel.org>; Wed, 22 Mar 2023 17:03:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230426AbjCVRDI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 22 Mar 2023 13:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230230AbjCVRDA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 22 Mar 2023 13:03:00 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 092E265469
        for <linux-tegra@vger.kernel.org>; Wed, 22 Mar 2023 10:02:37 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pf1r4-0000Td-17; Wed, 22 Mar 2023 18:02:30 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pf1r3-005xkU-41; Wed, 22 Mar 2023 18:02:29 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pf1r1-0075pu-VA; Wed, 22 Mar 2023 18:02:27 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 10/12] drm/tegra: nvdec: Convert to platform remove callback returning void
Date:   Wed, 22 Mar 2023 18:02:21 +0100
Message-Id: <20230322170223.410376-11-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322170223.410376-1-u.kleine-koenig@pengutronix.de>
References: <20230322170223.410376-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1596; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=4ACzat2M8CERy5SQcPoULHygwNt0pGEyMQHA7iFz0Dw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkGzSZ3sxT/J0ufyGVJ1rNhED20Wd++aWOqZVME ksArdeOJsOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBs0mQAKCRCPgPtYfRL+ ToagB/wLUKb+sErTBJ7WZssfdidNMbeNFxiBvhsg9Ez4hbu/tTqfCgEpFxucj/bbz4dnB04BOSG c+I75MmdDYWERUXRhC0b4gF+hLVLe92R75+12rFlGO2T7s1NOBgSrn4wh5O0/pxWQJ1bYwhnGWH 2wqrUnY9NKb6bqLbgdnSn1GZJwueSeLvrYfAOMzmKn07IMb8z3VQUFOEAn8kjV3i2K9+UZo8QQW BCDQv1IiU/32clnuKQtXLLHEmDJHUM5tl4n9TTUWAFR11JMYMmyxhEp6a7ElW0WJ+4AkcWLiPVe hXo6/mFKW+59tJvFfo71+nOMJ/jk/vrPzL2JyFelw2R+H5ni
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
 drivers/gpu/drm/tegra/nvdec.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/nvdec.c b/drivers/gpu/drm/tegra/nvdec.c
index 077f3af0d0b6..ae78a81e5eef 100644
--- a/drivers/gpu/drm/tegra/nvdec.c
+++ b/drivers/gpu/drm/tegra/nvdec.c
@@ -547,15 +547,13 @@ static int nvdec_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int nvdec_remove(struct platform_device *pdev)
+static void nvdec_remove(struct platform_device *pdev)
 {
 	struct nvdec *nvdec = platform_get_drvdata(pdev);
 
 	host1x_client_unregister(&nvdec->client.base);
 
 	falcon_exit(&nvdec->falcon);
-
-	return 0;
 }
 
 static const struct dev_pm_ops nvdec_pm_ops = {
@@ -571,7 +569,7 @@ struct platform_driver tegra_nvdec_driver = {
 		.pm = &nvdec_pm_ops
 	},
 	.probe = nvdec_probe,
-	.remove = nvdec_remove,
+	.remove_new = nvdec_remove,
 };
 
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
-- 
2.39.2

