Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E04FFC7EE2A
	for <linux-tegra@archiver.kernel.org>; Wed, 17 May 2023 23:02:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbjEQXCz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 17 May 2023 19:02:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbjEQXCy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 17 May 2023 19:02:54 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB6F244A8
        for <linux-tegra@vger.kernel.org>; Wed, 17 May 2023 16:02:53 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAO-0007jP-Uf; Thu, 18 May 2023 01:02:44 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAO-000wo2-6w; Thu, 18 May 2023 01:02:44 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAN-005UVe-FE; Thu, 18 May 2023 01:02:43 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Peter Chen <peter.chen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 07/97] usb: chipidea/ci_hdrc_tegra: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:09 +0200
Message-Id: <20230517230239.187727-8-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1873; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=63EJH4zRsCAjlTv4RDoaAYXCVSSuGmy2m/pYbXft39w=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVvyd0xAS4oiawnNnBIBolnhuu6gA/budC0kj mFUzAqAS+eJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVb8gAKCRCPgPtYfRL+ Tm2mB/9b+GjpuX9eU1nNGpdCu2vaONp+Sn2UlIT9vacUTcES09oPmfhxhYg2JhCK5BdLpKsGY4W UUo5Oo1eQkwRoSl1aYc5+uJi34x6f8R/OsTX9XoCJe6LDHZIZFwKPxWDgkMgAtWSOTG2f0CoWBJ AteK7LtmdqOEIGlSQVcf0utsI44ja4bPbvq3GwtBlIrpBNgjVHWLH5Z80lQQRo9cK6rvA4wbRJO 6AM/S/t9n+EbqLQy2NBwuF+vwbAbR1h2HjmeBMYMu+DwBlB2QVRKp9H7zv9uSuCsFFNtS9XImY5 2F+JElzNLaGCp6+PV3S4cb+BcWHG+7/0b7e/eHFmmHvy9Xlr
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
returning an error code. However the value returned is ignored (apart from
emitting a warning) and this typically results in resource leaks. To improve
here there is a quest to make the remove callback return void. In the first
step of this quest all drivers are converted to .remove_new() which already
returns void. Eventually after all drivers are converted, .remove_new() is
renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/usb/chipidea/ci_hdrc_tegra.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
index a72a9474afea..ca36d11a69ea 100644
--- a/drivers/usb/chipidea/ci_hdrc_tegra.c
+++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
@@ -362,7 +362,7 @@ static int tegra_usb_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int tegra_usb_remove(struct platform_device *pdev)
+static void tegra_usb_remove(struct platform_device *pdev)
 {
 	struct tegra_usb *usb = platform_get_drvdata(pdev);
 
@@ -371,8 +371,6 @@ static int tegra_usb_remove(struct platform_device *pdev)
 
 	pm_runtime_put_sync_suspend(&pdev->dev);
 	pm_runtime_force_suspend(&pdev->dev);
-
-	return 0;
 }
 
 static int __maybe_unused tegra_usb_runtime_resume(struct device *dev)
@@ -410,7 +408,7 @@ static struct platform_driver tegra_usb_driver = {
 		.pm = &tegra_usb_pm,
 	},
 	.probe = tegra_usb_probe,
-	.remove = tegra_usb_remove,
+	.remove_new = tegra_usb_remove,
 };
 module_platform_driver(tegra_usb_driver);
 
-- 
2.39.2

