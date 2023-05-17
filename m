Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06892C77B75
	for <linux-tegra@archiver.kernel.org>; Wed, 17 May 2023 23:03:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbjEQXDu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 17 May 2023 19:03:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229933AbjEQXDt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 17 May 2023 19:03:49 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 871524C2C
        for <linux-tegra@vger.kernel.org>; Wed, 17 May 2023 16:03:22 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAY-00087R-5I; Thu, 18 May 2023 01:02:54 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAV-000wqi-D5; Thu, 18 May 2023 01:02:51 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAU-005UXy-H4; Thu, 18 May 2023 01:02:50 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Wayne Chang <waynec@nvidia.com>,
        Haotien Hsu <haotienh@nvidia.com>, Jim Lin <jilin@nvidia.com>,
        Tang Bin <tangbin@cmss.chinamobile.com>,
        Sing-Han Chen <singhanc@nvidia.com>
Cc:     linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 43/97] usb: gadget/tegra-xudc: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:45 +0200
Message-Id: <20230517230239.187727-44-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
References: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1932; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=V8wJ4hIc/RpANBgbyAoFGSUry1QiFqxLkT0nd/ayWvU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVw5N8mol602Bpt30MSTjGwYDtMkB59zk6r4+ k9D7olaw5qJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVcOQAKCRCPgPtYfRL+ TtZyB/9MGE27mEHWJTu5ks9TZR7zldbAhH3dBv3g0e6K9Pjpbtmfx1eAv26TSfrVsqEEgPlI1UY szf+/CNd0rtgc0tk4+wDftTpB6VGFCJ1gda7fBez+KNUVK1nw+XAnqCZqOCMQBjdzZPLh5DXwtT BGUsJN6twWYEWSH+fwJwu48bIqDKOclND5aGhILQxBIG78Xt8q7Ki7fOkLjDG7dSPCVpSLBTh58 gQnCu5hQY62oyRk+BQwi0dOmUGsW1/RGotbPunSApyQ8sGmqHreXtr1KQfjnyMaegKJ3FAXBB+S ECS3MTPT+ztBLSkO70FYGFZH6h+/gPEglsVhD36zXGg/QDb8
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
 drivers/usb/gadget/udc/tegra-xudc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 34e9c1df54c7..83eaa65ddde3 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -3906,7 +3906,7 @@ static int tegra_xudc_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int tegra_xudc_remove(struct platform_device *pdev)
+static void tegra_xudc_remove(struct platform_device *pdev)
 {
 	struct tegra_xudc *xudc = platform_get_drvdata(pdev);
 	unsigned int i;
@@ -3936,8 +3936,6 @@ static int tegra_xudc_remove(struct platform_device *pdev)
 	pm_runtime_put(xudc->dev);
 
 	tegra_xusb_padctl_put(xudc->padctl);
-
-	return 0;
 }
 
 static int __maybe_unused tegra_xudc_powergate(struct tegra_xudc *xudc)
@@ -4063,7 +4061,7 @@ static const struct dev_pm_ops tegra_xudc_pm_ops = {
 
 static struct platform_driver tegra_xudc_driver = {
 	.probe = tegra_xudc_probe,
-	.remove = tegra_xudc_remove,
+	.remove_new = tegra_xudc_remove,
 	.driver = {
 		.name = "tegra-xudc",
 		.pm = &tegra_xudc_pm_ops,
-- 
2.39.2

