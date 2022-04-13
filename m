Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A61C433F5
	for <linux-tegra@archiver.kernel.org>; Wed, 13 Apr 2022 08:39:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230308AbiDMImP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 13 Apr 2022 04:42:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233875AbiDMIl5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 13 Apr 2022 04:41:57 -0400
Received: from out30-57.freemail.mail.aliyun.com (out30-57.freemail.mail.aliyun.com [115.124.30.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F29A2522CD;
        Wed, 13 Apr 2022 01:38:54 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0V9z3P0l_1649839125;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0V9z3P0l_1649839125)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 13 Apr 2022 16:38:51 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     ldewangan@nvidia.com
Cc:     jonathanh@nvidia.com, vkoul@kernel.org, thierry.reding@gmail.com,
        p.zabel@pengutronix.de, dmaengine@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] dmaengine: tegra: Remove unused including <linux/version.h>
Date:   Wed, 13 Apr 2022 16:38:42 +0800
Message-Id: <20220413083842.69845-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Eliminate the follow versioncheck warning:

./drivers/dma/tegra186-gpc-dma.c: 21 linux/version.h not needed.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/dma/tegra186-gpc-dma.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/dma/tegra186-gpc-dma.c b/drivers/dma/tegra186-gpc-dma.c
index f12327732041..97fe0e9e9b83 100644
--- a/drivers/dma/tegra186-gpc-dma.c
+++ b/drivers/dma/tegra186-gpc-dma.c
@@ -18,7 +18,6 @@
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
-#include <linux/version.h>
 #include <dt-bindings/memory/tegra186-mc.h>
 #include "virt-dma.h"
 
-- 
2.20.1.7.g153144c

