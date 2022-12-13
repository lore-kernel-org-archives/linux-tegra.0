Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA0C2C4332F
	for <linux-tegra@archiver.kernel.org>; Tue, 13 Dec 2022 10:00:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230349AbiLMKAo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 13 Dec 2022 05:00:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234607AbiLMKAl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 13 Dec 2022 05:00:41 -0500
Received: from out30-56.freemail.mail.aliyun.com (out30-56.freemail.mail.aliyun.com [115.124.30.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86AB91AF27;
        Tue, 13 Dec 2022 02:00:40 -0800 (PST)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R441e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046056;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0VXDvQc4_1670925632;
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0VXDvQc4_1670925632)
          by smtp.aliyun-inc.com;
          Tue, 13 Dec 2022 18:00:38 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     thierry.reding@gmail.com
Cc:     jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH] soc/tegra: cbb: Remove unused including <linux/version.h>
Date:   Tue, 13 Dec 2022 18:00:29 +0800
Message-Id: <20221213100029.14344-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

./drivers/soc/tegra/cbb/tegra234-cbb.c: 27 linux/version.h not needed.

Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3443
Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/soc/tegra/cbb/tegra234-cbb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/tegra/cbb/tegra234-cbb.c b/drivers/soc/tegra/cbb/tegra234-cbb.c
index f33d094e5ea6..e23e8acfd7c7 100644
--- a/drivers/soc/tegra/cbb/tegra234-cbb.c
+++ b/drivers/soc/tegra/cbb/tegra234-cbb.c
@@ -24,7 +24,6 @@
 #include <linux/of_address.h>
 #include <linux/interrupt.h>
 #include <linux/ioport.h>
-#include <linux/version.h>
 #include <soc/tegra/fuse.h>
 #include <soc/tegra/tegra-cbb.h>
 
-- 
2.20.1.7.g153144c

