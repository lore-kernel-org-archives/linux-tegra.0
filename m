Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB7FFC77B6E
	for <linux-tegra@archiver.kernel.org>; Mon,  3 Apr 2023 15:40:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232929AbjDCPk2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 3 Apr 2023 11:40:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232921AbjDCPk0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 3 Apr 2023 11:40:26 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 680CE26B7
        for <linux-tegra@vger.kernel.org>; Mon,  3 Apr 2023 08:40:25 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMIA-0004iZ-FE; Mon, 03 Apr 2023 17:40:22 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMI9-008ibq-IG; Mon, 03 Apr 2023 17:40:21 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pjMI8-00AHxj-LM; Mon, 03 Apr 2023 17:40:20 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Marc Dietrich <marvin24@gmx.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
        linux-staging@lists.linux.dev, kernel@pengutronix.de
Subject: [PATCH 20/24] staging: nvec_power: Convert to platform remove callback returning void
Date:   Mon,  3 Apr 2023 17:40:10 +0200
Message-Id: <20230403154014.2564054-21-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
References: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1629; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=3eBUNo45vjxvrBmmVKCpUHSK66vNsaxQ36fJe1/a9to=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKvNM6PtFor8y59/Ocn0av359hfYdhT6dBy3R+ e/HNoGRaA6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCrzTAAKCRCPgPtYfRL+ Tga9CACSCr4vj3XnYT2TpK8WO0w9xvHUfCl3hcMcy0GFM+w8f5XWBzG/oipaaEapdXtEklrF0Ld C4RXSYk/zHMYAPNcS+641HKRyAcjoXmUYwfBOJC9HuqSDJ/aO3qB8JOL6B7jxW7/eDr2JDqh5f0 DUaL2qZ31PP35jF8Bm/F9hqguinhqxSIO73luvzOsiPhRaEC8d3FPXxqHoxAxtpR/ZBq4xRQ0lf 4rwBQxQGtbjxBu/JD6uXHh+SoWh/FZxalIexnxCMSnO79cvH6pOSY/rIbJStXM7f+ZtimigKNTN oxa6v+nu5JMLm/rCNqlxKXdpQDtu79IPlY6mUB9MUcJYCECY
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
 drivers/staging/nvec/nvec_power.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/nvec/nvec_power.c b/drivers/staging/nvec/nvec_power.c
index b1ef196e1cfe..9943b1fff190 100644
--- a/drivers/staging/nvec/nvec_power.c
+++ b/drivers/staging/nvec/nvec_power.c
@@ -416,7 +416,7 @@ static int nvec_power_probe(struct platform_device *pdev)
 	return PTR_ERR_OR_ZERO(*psy);
 }
 
-static int nvec_power_remove(struct platform_device *pdev)
+static void nvec_power_remove(struct platform_device *pdev)
 {
 	struct nvec_power *power = platform_get_drvdata(pdev);
 
@@ -429,13 +429,11 @@ static int nvec_power_remove(struct platform_device *pdev)
 	case BAT:
 		power_supply_unregister(nvec_bat_psy);
 	}
-
-	return 0;
 }
 
 static struct platform_driver nvec_power_driver = {
 	.probe = nvec_power_probe,
-	.remove = nvec_power_remove,
+	.remove_new = nvec_power_remove,
 	.driver = {
 		   .name = "nvec-power",
 	}
-- 
2.39.2

