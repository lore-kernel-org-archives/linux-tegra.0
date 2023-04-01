Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE1FCC76196
	for <linux-tegra@archiver.kernel.org>; Sat,  1 Apr 2023 16:20:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbjDAQUJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 1 Apr 2023 12:20:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjDAQUJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 1 Apr 2023 12:20:09 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 548111C1E2
        for <linux-tegra@vger.kernel.org>; Sat,  1 Apr 2023 09:20:08 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pidxP-0000ME-Hx; Sat, 01 Apr 2023 18:19:59 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pidxN-008GTN-Gb; Sat, 01 Apr 2023 18:19:57 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pidxM-009ki5-4s; Sat, 01 Apr 2023 18:19:56 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
        linux-tegra@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 47/49] mtd: rawnand: tegra: Convert to platform remove callback returning void
Date:   Sat,  1 Apr 2023 18:19:36 +0200
Message-Id: <20230401161938.2503204-48-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1816; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=ZiZFcm2VIBzpJkDbD8DIuKg1PQYv1Ul6eBh2oA6JjdA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKFlTMtlZDjKeoygTPmrf6hZi+i2/pICmViBsi CEyn2O89+WJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZChZUwAKCRCPgPtYfRL+ TkNsB/9QNZahdyLisGkG6jy26g0n4gYeXOUuhi1ekybIlVCO75qsiXWDUGQW4WmM5mx7lcyXmTi zoODOr5CJP8UuKYOqC2T2jSOGFvN2dKtLdh4mhyHaZNdyksoGw0rUCIfI1JlmtSXNo5HaAsp3hx PXoO18Q6yocN0esmIkwUnIOZ0PPelpNRn5cGrZ8zfQtvHPdwjdXGenW4tXgwEedXsr7erMiVqfQ VmPufDSQ4DtguTF2kXXQkReGR3+tjsotqqaYPkZtbkQg6Ak3c6cKKSQeP4x9pKozNhW1VPvTLKL d2fiVOEnWXUb+Fk2HNrSzLjffkCV8HB7RDN7zkf/V9leigQm
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
 drivers/mtd/nand/raw/tegra_nand.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index a9b9031ce616..eb0b9d16e8da 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -1220,7 +1220,7 @@ static int tegra_nand_probe(struct platform_device *pdev)
 	return err;
 }
 
-static int tegra_nand_remove(struct platform_device *pdev)
+static void tegra_nand_remove(struct platform_device *pdev)
 {
 	struct tegra_nand_controller *ctrl = platform_get_drvdata(pdev);
 	struct nand_chip *chip = ctrl->chip;
@@ -1232,8 +1232,6 @@ static int tegra_nand_remove(struct platform_device *pdev)
 
 	pm_runtime_put_sync_suspend(ctrl->dev);
 	pm_runtime_force_suspend(ctrl->dev);
-
-	return 0;
 }
 
 static int __maybe_unused tegra_nand_runtime_resume(struct device *dev)
@@ -1277,7 +1275,7 @@ static struct platform_driver tegra_nand_driver = {
 		.pm = &tegra_nand_pm,
 	},
 	.probe = tegra_nand_probe,
-	.remove = tegra_nand_remove,
+	.remove_new = tegra_nand_remove,
 };
 module_platform_driver(tegra_nand_driver);
 
-- 
2.39.2

