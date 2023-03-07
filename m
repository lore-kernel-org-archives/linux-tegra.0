Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD17FC6FD1B
	for <linux-tegra@archiver.kernel.org>; Tue,  7 Mar 2023 11:59:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230453AbjCGL73 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 7 Mar 2023 06:59:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230197AbjCGL72 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 7 Mar 2023 06:59:28 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8604F311FB
        for <linux-tegra@vger.kernel.org>; Tue,  7 Mar 2023 03:59:27 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZVyL-0006bk-F0; Tue, 07 Mar 2023 12:59:13 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZVyK-002TGM-Cw; Tue, 07 Mar 2023 12:59:12 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pZVyJ-002yk8-11; Tue, 07 Mar 2023 12:59:11 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     JC Kuo <jckuo@nvidia.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 24/31] phy: tegra: xusb: Convert to platform remove callback returning void
Date:   Tue,  7 Mar 2023 12:58:53 +0100
Message-Id: <20230307115900.2293120-25-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230307115900.2293120-1-u.kleine-koenig@pengutronix.de>
References: <20230307115900.2293120-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1837; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=E3uo38jywnktvSNvAGRANsI8kEJhkfQ9Ly00U4vBCFY=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkBybhMO4YTx5uCCpzSiO56pIYF4a85pRbL/tYG WkTAGgRW+CJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAcm4QAKCRDB/BR4rcrs CRSdB/94UtxtudX+pBQ3YkBMzxE5Ip8dBJfer2GWIFb6V8yJcGdVWaKYm43IuF+0Es5Bp6vg0Ig yxI7dfHdogkmACUNUfKWQLZp4it5ry39d8DjtA2nNjO7rDkGQXvymmzNisOayVmB/UpOuage/Am CBiREKl3y1lnrlUcWN+NdSZ2kJTEiIha6HN3fgSOgmG2on75mWlnyG+DXgs/ew551npdRwlUdqA 7GmfSJcy01zov8C2JQZe3aK4+fVT7S++FCUesI+rMGAY/w4GoMf0G9lowbOSD/ztvk5vaNwNeDo GM+Ghpj2OzBHVyP+1q1OfZJJMlLKWfolKyWEeD7plyA56FSB
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
 drivers/phy/tegra/xusb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index 78045bd6c214..ec335668563d 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -1267,7 +1267,7 @@ static int tegra_xusb_padctl_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int tegra_xusb_padctl_remove(struct platform_device *pdev)
+static void tegra_xusb_padctl_remove(struct platform_device *pdev)
 {
 	struct tegra_xusb_padctl *padctl = platform_get_drvdata(pdev);
 	int err;
@@ -1285,8 +1285,6 @@ static int tegra_xusb_padctl_remove(struct platform_device *pdev)
 		dev_err(&pdev->dev, "failed to assert reset: %d\n", err);
 
 	padctl->soc->ops->remove(padctl);
-
-	return 0;
 }
 
 static __maybe_unused int tegra_xusb_padctl_suspend_noirq(struct device *dev)
@@ -1321,7 +1319,7 @@ static struct platform_driver tegra_xusb_padctl_driver = {
 		.pm = &tegra_xusb_padctl_pm_ops,
 	},
 	.probe = tegra_xusb_padctl_probe,
-	.remove = tegra_xusb_padctl_remove,
+	.remove_new = tegra_xusb_padctl_remove,
 };
 module_platform_driver(tegra_xusb_padctl_driver);
 
-- 
2.39.1

