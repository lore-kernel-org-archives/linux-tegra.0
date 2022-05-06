Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17508C433EF
	for <linux-tegra@archiver.kernel.org>; Fri,  6 May 2022 03:42:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1388762AbiEFDqI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 5 May 2022 23:46:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1388787AbiEFDqG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 5 May 2022 23:46:06 -0400
Received: from out30-45.freemail.mail.aliyun.com (out30-45.freemail.mail.aliyun.com [115.124.30.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E272B140DA;
        Thu,  5 May 2022 20:42:23 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0VCPvNGc_1651808530;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0VCPvNGc_1651808530)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 06 May 2022 11:42:21 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     dipenp@nvidia.com
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] hte: Remove unused including <linux/version.h>
Date:   Fri,  6 May 2022 11:42:09 +0800
Message-Id: <20220506034209.59848-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Eliminate the follow versioncheck warning:

./drivers/hte/hte-tegra194-test.c: 8 linux/version.h not needed.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/hte/hte-tegra194-test.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/hte/hte-tegra194-test.c b/drivers/hte/hte-tegra194-test.c
index bc3ab18dfdc5..6a3e57b57a34 100644
--- a/drivers/hte/hte-tegra194-test.c
+++ b/drivers/hte/hte-tegra194-test.c
@@ -5,7 +5,6 @@
  * Author: Dipen Patel <dipenp@nvidia.com>
  */
 
-#include <linux/version.h>
 #include <linux/err.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-- 
2.20.1.7.g153144c

