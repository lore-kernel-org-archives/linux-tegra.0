Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9080C43334
	for <linux-tegra@archiver.kernel.org>; Sat, 16 Jul 2022 14:54:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbiGPOyV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 16 Jul 2022 10:54:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbiGPOyT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 16 Jul 2022 10:54:19 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55F591A819
        for <linux-tegra@vger.kernel.org>; Sat, 16 Jul 2022 07:54:18 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1oCjBK-0003OV-14; Sat, 16 Jul 2022 16:54:10 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oCjBI-001Kha-7Y; Sat, 16 Jul 2022 16:54:08 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oCjBH-005ZBr-Kc; Sat, 16 Jul 2022 16:54:07 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     JC Kuo <jckuo@nvidia.com>, Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH] phy: tegra: xusb: Only warn once reset problems in .remove()
Date:   Sat, 16 Jul 2022 16:54:03 +0200
Message-Id: <20220716145403.107703-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1075; h=from:subject; bh=+wlILHjFxool2OFqmTfWn6VwhkGltRaqS5h5LpHwcZI=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBi0tEHRUXoJWlLCxORP3UCsI3c7+s+XgZ7b5wxGoh+ NzT8ot2JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYtLRBwAKCRDB/BR4rcrsCeFgB/ 9AqumZjLU6uRJER3EbkEiH8uzcO+iJ+Xej/90eJPRFJ+cXHYUBXf85Z2+4yjGusY9NO/oJGXArkPW/ Pp8uuQTLKi6ruFl3l0cjmIGDdbPxdEjdcLk3p+BQvCH+GBtHC3Dwk4yJnOsShn7Rg+0CrxpMIdmaOM XeGhSiuHlMKyDhJbnP0TnSx0tzDPOGPH+Ys5Wc2nNpVsqLT4d3blkKa06wk8AwHZMqo34c31B5hoe3 FAD5s3yUszHJEAwuJ8PqBV4ILOEjzhkIYI1jsKlWdIdxoSEfq1aN4wE0a/OahPslxnQwdhlFJr4NTa NJOqpjwo3jCfoc5Z+0dGBLKeyd9TY1
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-tegra@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The single difference between returning 0 and returning an error code in
a platform remove callback is that in the latter case the platform core
emits a warning about the error being ignored.

If reset_control_assert() fails there is already a warning, so suppress
the more generic (and less helpful) by returning 0 in
tegra_xusb_padctl_remove().

This is a preparation for making platform remove callbacks return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/phy/tegra/xusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index aa5237eacd29..d04a80c436c3 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -1270,7 +1270,7 @@ static int tegra_xusb_padctl_remove(struct platform_device *pdev)
 
 	padctl->soc->ops->remove(padctl);
 
-	return err;
+	return 0;
 }
 
 static __maybe_unused int tegra_xusb_padctl_suspend_noirq(struct device *dev)

base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
2.36.1

