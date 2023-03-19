Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C472C7619A
	for <linux-tegra@archiver.kernel.org>; Sun, 19 Mar 2023 09:24:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbjCSJYo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 19 Mar 2023 05:24:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbjCSJYl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 19 Mar 2023 05:24:41 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAED518A81
        for <linux-tegra@vger.kernel.org>; Sun, 19 Mar 2023 02:24:39 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdpHI-0003Rn-95; Sun, 19 Mar 2023 10:24:36 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdpHH-005C8I-Dm; Sun, 19 Mar 2023 10:24:35 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pdpHG-0066PY-Fm; Sun, 19 Mar 2023 10:24:34 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 10/11] usb: phy: tegra: Convert to platform remove callback returning void
Date:   Sun, 19 Mar 2023 10:24:27 +0100
Message-Id: <20230319092428.283054-11-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230319092428.283054-1-u.kleine-koenig@pengutronix.de>
References: <20230319092428.283054-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1599; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=MN1EJiNdXGYOaDxNv5BhfcV4O33BjTjkUCoG2WCtJi0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkFtTGQQR2LHrdNUbLIP4UWo/CFWV+UwX7hOuYl K8wdYsjweyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBbUxgAKCRCPgPtYfRL+ TnVoCACGt6AK/01o99qYtQ5TyfW34SQL/dt737UX5Pq0lI/YnDJN/iKI/5RuyY5TK18YrIJysGv cHOjO3mgBRPbyVlNfwh7m4aKlSBwioWWoiD0FbZwDf5Y7BSkyon+lsIFgwKtHVtPJKEZIvQBLBn Gi1r5QcXMPEODZLLO25p3Ziq1Dte8jycMCo9ap7gfV+Tc3u9LO4cqNNt+/jE0f5HuQAGMEPkilc 9lD68r4TtYTo2Bcxkmr5HLFUrplFQBl4oJSeBr/pNf/mmjmimoDZGsi/A3NJy0kQ4w5J+fK7UVf EFZpOq+bfn9/Vgxzu8FNiMhXL8h0ltzAPfIaDJnGhMJPl6iQ
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
 drivers/usb/phy/phy-tegra-usb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index f0240107edb1..014a96fdbd36 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -1486,18 +1486,16 @@ static int tegra_usb_phy_probe(struct platform_device *pdev)
 	return usb_add_phy_dev(&tegra_phy->u_phy);
 }
 
-static int tegra_usb_phy_remove(struct platform_device *pdev)
+static void tegra_usb_phy_remove(struct platform_device *pdev)
 {
 	struct tegra_usb_phy *tegra_phy = platform_get_drvdata(pdev);
 
 	usb_remove_phy(&tegra_phy->u_phy);
-
-	return 0;
 }
 
 static struct platform_driver tegra_usb_phy_driver = {
 	.probe		= tegra_usb_phy_probe,
-	.remove		= tegra_usb_phy_remove,
+	.remove_new	= tegra_usb_phy_remove,
 	.driver		= {
 		.name	= "tegra-phy",
 		.of_match_table = tegra_usb_phy_id_table,
-- 
2.39.2

