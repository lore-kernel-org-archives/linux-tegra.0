Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17460C678DB
	for <linux-tegra@archiver.kernel.org>; Sat,  4 Mar 2023 13:32:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbjCDNce (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 4 Mar 2023 08:32:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbjCDNcc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 4 Mar 2023 08:32:32 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA36021A13
        for <linux-tegra@vger.kernel.org>; Sat,  4 Mar 2023 05:32:07 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyM-0000xA-J4; Sat, 04 Mar 2023 14:30:50 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyL-001nbi-0C; Sat, 04 Mar 2023 14:30:49 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pYRyJ-0027IP-N6; Sat, 04 Mar 2023 14:30:47 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-rtc@vger.kernel.org, linux-tegra@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 35/41] rtc: tegra: Convert to platform remove callback returning void
Date:   Sat,  4 Mar 2023 14:30:22 +0100
Message-Id: <20230304133028.2135435-36-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1589; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=zPU1DLs9c6OdwEuUwMJFlBKIURiQFumrPLkfOWW9XMw=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkA0fZDF9y6g+rZmlWLWFM9bHrTbsWMXicsAauF CjIPWUf3LWJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZANH2QAKCRDB/BR4rcrs CekTB/9j8tnkqb4OURyo85UVrhoROPYyiI2r2jhvYWwkW56mQSoJ3ZFXde0h281qn/Dmp2GGu72 eDUfyS2QZhl5Up1PpYKr8gS9mOOXzJZn608WH0ZO5jdBSzT9DFYsl3uB9NfPjjwDUDIx84gyTgg NQBsJ6ll0WJs3AyqcZGDXy/3DyE5+5Pa9fkTBwdHSOTUJl/259fRnyE5BtNjwTCvg+qtiYcndck KE/sF0LcIXycvFY/PKi9TPbsa9HYYV824PM4/jBw6eP1K5uL0QoLlLIctKrsRsYUyccoZrGzR4i 7hUYsNkxzdX2S5/lN8gIVjDBXWv5TYuElWIBRh/Xhrj3q34K
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
 drivers/rtc/rtc-tegra.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
index 85f7ad5d5390..441e0a66b215 100644
--- a/drivers/rtc/rtc-tegra.c
+++ b/drivers/rtc/rtc-tegra.c
@@ -342,13 +342,11 @@ static int tegra_rtc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int tegra_rtc_remove(struct platform_device *pdev)
+static void tegra_rtc_remove(struct platform_device *pdev)
 {
 	struct tegra_rtc_info *info = platform_get_drvdata(pdev);
 
 	clk_disable_unprepare(info->clk);
-
-	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
@@ -401,7 +399,7 @@ static void tegra_rtc_shutdown(struct platform_device *pdev)
 
 static struct platform_driver tegra_rtc_driver = {
 	.probe = tegra_rtc_probe,
-	.remove = tegra_rtc_remove,
+	.remove_new = tegra_rtc_remove,
 	.shutdown = tegra_rtc_shutdown,
 	.driver = {
 		.name = "tegra_rtc",
-- 
2.39.1

