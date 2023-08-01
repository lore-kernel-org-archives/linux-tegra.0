Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2965CC001DF
	for <linux-tegra@archiver.kernel.org>; Tue,  1 Aug 2023 13:53:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233741AbjHANxi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 1 Aug 2023 09:53:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233899AbjHANxh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 1 Aug 2023 09:53:37 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B860FC3;
        Tue,  1 Aug 2023 06:53:35 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RFc3P6Xp0zVjf2;
        Tue,  1 Aug 2023 21:51:45 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 1 Aug
 2023 21:53:28 +0800
From:   Ruan Jinjie <ruanjinjie@huawei.com>
To:     <hverkuil-cisco@xs4all.nl>, <mchehab@kernel.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next] media: tegra_cec: fix the return value handle for platform_get_irq()
Date:   Tue, 1 Aug 2023 21:52:53 +0800
Message-ID: <20230801135253.456322-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

There is no possible for platform_get_irq() to return 0,
and the return value of platform_get_irq() is more sensible
to show the error reason.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/media/cec/platform/tegra/tegra_cec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/cec/platform/tegra/tegra_cec.c b/drivers/media/cec/platform/tegra/tegra_cec.c
index 04dc06e3c42a..79811f2c1951 100644
--- a/drivers/media/cec/platform/tegra/tegra_cec.c
+++ b/drivers/media/cec/platform/tegra/tegra_cec.c
@@ -348,8 +348,8 @@ static int tegra_cec_probe(struct platform_device *pdev)
 
 	cec->tegra_cec_irq = platform_get_irq(pdev, 0);
 
-	if (cec->tegra_cec_irq <= 0)
-		return -EBUSY;
+	if (cec->tegra_cec_irq < 0)
+		return cec->tegra_cec_irq;
 
 	cec->cec_base = devm_ioremap(&pdev->dev, res->start,
 					     resource_size(res));
-- 
2.34.1

