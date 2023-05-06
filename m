Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57153C77B73
	for <linux-tegra@archiver.kernel.org>; Sat,  6 May 2023 09:08:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231208AbjEFJI1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 6 May 2023 05:08:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbjEFJI0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 6 May 2023 05:08:26 -0400
Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3804C5FEC;
        Sat,  6 May 2023 02:08:22 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046056;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0Vhsqnrs_1683364057;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0Vhsqnrs_1683364057)
          by smtp.aliyun-inc.com;
          Sat, 06 May 2023 17:08:18 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     jonathanh@nvidia.com
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] soc/tegra: cbb: Remove unnecessary print function dev_err()
Date:   Sat,  6 May 2023 17:07:35 +0800
Message-Id: <20230506090735.23936-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The print function dev_err() is redundant because platform_get_irq()
already prints an error.

./drivers/soc/tegra/cbb/tegra-cbb.c:130:3-10: line 130 is redundant because platform_get_irq() already prints an error.
./drivers/soc/tegra/cbb/tegra-cbb.c:140:2-9: line 140 is redundant because platform_get_irq() already prints an error.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4879
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/soc/tegra/cbb/tegra-cbb.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/tegra/cbb/tegra-cbb.c b/drivers/soc/tegra/cbb/tegra-cbb.c
index bd96204a68ee..413b441c1604 100644
--- a/drivers/soc/tegra/cbb/tegra-cbb.c
+++ b/drivers/soc/tegra/cbb/tegra-cbb.c
@@ -126,20 +126,16 @@ int tegra_cbb_get_irq(struct platform_device *pdev, unsigned int *nonsec_irq,
 
 	if (num_intr == 2) {
 		irq = platform_get_irq(pdev, index);
-		if (irq <= 0) {
-			dev_err(&pdev->dev, "failed to get non-secure IRQ: %d\n", irq);
+		if (irq <= 0)
 			return -ENOENT;
-		}
 
 		*nonsec_irq = irq;
 		index++;
 	}
 
 	irq = platform_get_irq(pdev, index);
-	if (irq <= 0) {
-		dev_err(&pdev->dev, "failed to get secure IRQ: %d\n", irq);
+	if (irq <= 0)
 		return -ENOENT;
-	}
 
 	*sec_irq = irq;
 
-- 
2.20.1.7.g153144c

