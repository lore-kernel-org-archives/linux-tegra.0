Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 248FAC43334
	for <linux-tegra@archiver.kernel.org>; Fri,  3 Jun 2022 21:08:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242179AbiFCVIY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 3 Jun 2022 17:08:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231235AbiFCVIV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 3 Jun 2022 17:08:21 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A53727FCB
        for <linux-tegra@vger.kernel.org>; Fri,  3 Jun 2022 14:08:20 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nxEWf-0003rl-JF; Fri, 03 Jun 2022 23:08:09 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nxEWd-006Hqb-Ub; Fri, 03 Jun 2022 23:08:06 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nxEWb-00E1Hd-7g; Fri, 03 Jun 2022 23:08:05 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     kernel@pengutronix.de, linux-mtd@lists.infradead.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 10/14] mtd: rawnand: tegra: Don't skip cleanup after mtd_device_unregister() failed
Date:   Fri,  3 Jun 2022 23:07:54 +0200
Message-Id: <20220603210758.148493-11-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
References: <20220603210758.148493-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139; i=uwe@kleine-koenig.org; h=from:subject; bh=irb1oiaimsbDKo87nqTOgZKRASJYgqZ1ZPCZwfsS6XY=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBimnflbW3ealPvT9b+g3B+cAJsmzQc8G+AdxD7vvKD MCcxz0yJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYpp35QAKCRDB/BR4rcrsCXtNB/ 48c7Jbr99RVPnriaCqngFSv8q/ISnJI5bbk7lzv40z/dlUnOd1vh7n0ep/VZVJyJ/1T9VxPAx1c33r 6sXHxkWURm0mExha/gkghuyl3HWSLRvfucWjnCRr+zGrUqJlAC4l347mg8oVxl9wo3tAiXS4E7Kk4I p9VeaeRccRlOS+9sV5aU968/ba+OoRWW/aTPSqE896XnKMst29bbH8vaosKMrpos+p8mSnYfRn24yP blX5FD8jmCmWkp2iYoNIhaiJ8kSwAS9SQA+ai1VjeCVTP9ns37N2ME6U0wvbtgdsJQcBPasU9qHg7V NQOyhmC7HM9x8iqUH8o5OoB+8Fu3gG
X-Developer-Key: i=uwe@kleine-koenig.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-tegra@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

If mtd_device_unregister() fails (which it doesn't when used correctly),
the resources bound by the nand chip should be freed anyhow as returning
an error value doesn't prevent the device getting unbound.

Instead use WARN_ON on the return value similar to how other drivers do
it.

This is a preparation for making platform remove callbacks return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/mtd/nand/raw/tegra_nand.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index b36e5260ae27..e12f9f580a15 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -1223,11 +1223,8 @@ static int tegra_nand_remove(struct platform_device *pdev)
 	struct tegra_nand_controller *ctrl = platform_get_drvdata(pdev);
 	struct nand_chip *chip = ctrl->chip;
 	struct mtd_info *mtd = nand_to_mtd(chip);
-	int ret;
 
-	ret = mtd_device_unregister(mtd);
-	if (ret)
-		return ret;
+	WARN_ON(mtd_device_unregister(mtd));
 
 	nand_cleanup(chip);
 
-- 
2.36.1

