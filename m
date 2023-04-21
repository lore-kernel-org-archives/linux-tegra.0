Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E83EFC77B75
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Apr 2023 08:50:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229938AbjDUIun (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 Apr 2023 04:50:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231478AbjDUIuK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Apr 2023 04:50:10 -0400
Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2101693FA;
        Fri, 21 Apr 2023 01:49:57 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R281e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018045176;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0VgcHKjy_1682066993;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0VgcHKjy_1682066993)
          by smtp.aliyun-inc.com;
          Fri, 21 Apr 2023 16:49:54 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     thierry.reding@gmail.com
Cc:     mperttunen@nvidia.com, airlied@gmail.com, daniel@ffwll.ch,
        jonathanh@nvidia.com, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH -next] drm/tegra: dpaux: Use devm_platform_ioremap_resource()
Date:   Fri, 21 Apr 2023 16:49:52 +0800
Message-Id: <20230421084952.45275-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Convert platform_get_resource(),devm_ioremap_resource() to a single
call to devm_platform_ioremap_resource(), as this is exactly what this
function does.

Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/tegra/dpaux.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 4d2677dcd831..4699def04190 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -447,7 +447,6 @@ static const struct pinmux_ops tegra_dpaux_pinmux_ops = {
 static int tegra_dpaux_probe(struct platform_device *pdev)
 {
 	struct tegra_dpaux *dpaux;
-	struct resource *regs;
 	u32 value;
 	int err;
 
@@ -461,8 +460,7 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&dpaux->list);
 	dpaux->dev = &pdev->dev;
 
-	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dpaux->regs = devm_ioremap_resource(&pdev->dev, regs);
+	dpaux->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dpaux->regs))
 		return PTR_ERR(dpaux->regs);
 
-- 
2.20.1.7.g153144c

