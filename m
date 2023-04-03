Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49290C77B71
	for <linux-tegra@archiver.kernel.org>; Mon,  3 Apr 2023 15:40:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbjDCPk2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 3 Apr 2023 11:40:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232946AbjDCPk1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 3 Apr 2023 11:40:27 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62ABE26A5
        for <linux-tegra@vger.kernel.org>; Mon,  3 Apr 2023 08:40:26 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMIB-0004mf-Lo; Mon, 03 Apr 2023 17:40:23 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMIA-008ic4-A8; Mon, 03 Apr 2023 17:40:22 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMI8-00AHxo-QQ; Mon, 03 Apr 2023 17:40:20 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Marc Dietrich <marvin24@gmx.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
        linux-staging@lists.linux.dev, kernel@pengutronix.de
Subject: [PATCH 21/24] staging: nvec_ps2: Convert to platform remove callback returning void
Date:   Mon,  3 Apr 2023 17:40:11 +0200
Message-Id: <20230403154014.2564054-22-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
References: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1813; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=JK9FEMBfl3k51Ko0yHrTYJMW3StOB3wg2Jo6t8OBwUY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKvNNvTUbO2c2qI9jR+mqC9qIh6IDDgpQNg4pW xlnyrSN9P+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCrzTQAKCRCPgPtYfRL+ Tmu0B/0cuwc2hpE0Vsww/JTbugRMQt1xrcCY7TQZ6vtT+xgNTaSQLOsUBmddN0Br3ccYljBIIs7 aEJRvunuD+IKVYk/3p3hD+lyOv/xdx6Vc624zCG8d6trjOmAQ0pdasZuEflGW1MHQismMqE6ri0 FESQLcUO48iGt5+ehLxNuwGBPwgsyCjHw6gaHXr9GWuNvskjb3Zsb15EHJo9xDqeejOwcenyuUT Qo0WMcuGbvTrzgszfQ83m4ElIClB5m8wNN7zKWTRJAOPSH17ixbm5FnK/wrukmZQOBOg0uX3rwJ T1XJKsEKBJrhzaQSm6WOhBXI6jXY2FuzuraO83Ni7pVMgqLV
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
 drivers/staging/nvec/nvec_ps2.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/nvec/nvec_ps2.c b/drivers/staging/nvec/nvec_ps2.c
index 06041c7f7d4f..cb6d71b8dc83 100644
--- a/drivers/staging/nvec/nvec_ps2.c
+++ b/drivers/staging/nvec/nvec_ps2.c
@@ -125,7 +125,7 @@ static int nvec_mouse_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int nvec_mouse_remove(struct platform_device *pdev)
+static void nvec_mouse_remove(struct platform_device *pdev)
 {
 	struct nvec_chip *nvec = dev_get_drvdata(pdev->dev.parent);
 
@@ -133,8 +133,6 @@ static int nvec_mouse_remove(struct platform_device *pdev)
 	ps2_stopstreaming(ps2_dev.ser_dev);
 	nvec_unregister_notifier(nvec, &ps2_dev.notifier);
 	serio_unregister_port(ps2_dev.ser_dev);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -166,7 +164,7 @@ static SIMPLE_DEV_PM_OPS(nvec_mouse_pm_ops, nvec_mouse_suspend,
 
 static struct platform_driver nvec_mouse_driver = {
 	.probe  = nvec_mouse_probe,
-	.remove = nvec_mouse_remove,
+	.remove_new = nvec_mouse_remove,
 	.driver = {
 		.name = "nvec-mouse",
 		.pm = &nvec_mouse_pm_ops,
-- 
2.39.2

