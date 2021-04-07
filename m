Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F0AC433B4
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Apr 2021 06:34:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 350A3613B3
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Apr 2021 06:34:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243421AbhDGGeL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 7 Apr 2021 02:34:11 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:15621 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345707AbhDGGeL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 7 Apr 2021 02:34:11 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FFZLG3Gnyz17Qtq;
        Wed,  7 Apr 2021 14:31:50 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Wed, 7 Apr 2021 14:33:54 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <marvin24@gmx.de>, <p.zabel@pengutronix.de>
CC:     <ac100@lists.launchpad.net>, <linux-tegra@vger.kernel.org>,
        <linux-staging@lists.linux.dev>, Tian Tao <tiantao6@hisilicon.com>
Subject: [PATCH] staging: nvec: move to use request_irq by IRQF_NO_AUTOEN flag
Date:   Wed, 7 Apr 2021 14:34:19 +0800
Message-ID: <1617777259-27463-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

disable_irq() after request_irq() still has a time gap in which
interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
disable IRQ auto-enable because of requesting.

this patch is made base on "add IRQF_NO_AUTOEN for request_irq" which
is being merged: https://lore.kernel.org/patchwork/patch/1388765/

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/staging/nvec/nvec.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index a80996b..f23e127 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -831,13 +831,12 @@ static int tegra_nvec_probe(struct platform_device *pdev)
 		return PTR_ERR(nvec->gpiod);
 	}
 
-	err = devm_request_irq(dev, nvec->irq, nvec_interrupt, 0,
-			       "nvec", nvec);
+	err = devm_request_irq(dev, nvec->irq, nvec_interrupt,
+			       IRQF_NO_AUTOEN, "nvec", nvec);
 	if (err) {
 		dev_err(dev, "couldn't request irq\n");
 		return -ENODEV;
 	}
-	disable_irq(nvec->irq);
 
 	tegra_init_i2c_slave(nvec);
 
-- 
2.7.4

