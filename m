Return-Path: <SRS0=Tnts=C2=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E2AC433E2
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 12:51:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8806321D43
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 12:51:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbgIQMvI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 08:51:08 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:13240 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727052AbgIQMut (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 08:50:49 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 41FDA76BA2B16871A86E;
        Thu, 17 Sep 2020 20:50:46 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Thu, 17 Sep 2020 20:50:37 +0800
From:   Qinglang Miao <miaoqinglang@huawei.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        "Qinglang Miao" <miaoqinglang@huawei.com>
Subject: [PATCH -next v2] memory: tegra: Convert to DEFINE_SHOW_ATTRIBUTE
Date:   Thu, 17 Sep 2020 20:51:14 +0800
Message-ID: <20200917125114.103598-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
v2: based on linux-next(20200917), and can be applied to
    mainline cleanly now.

 drivers/memory/tegra/tegra124-emc.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index ba5cb1f4d..76ace42a6 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -1060,19 +1060,7 @@ static int tegra_emc_debug_available_rates_show(struct seq_file *s,
 	return 0;
 }
 
-static int tegra_emc_debug_available_rates_open(struct inode *inode,
-						struct file *file)
-{
-	return single_open(file, tegra_emc_debug_available_rates_show,
-			   inode->i_private);
-}
-
-static const struct file_operations tegra_emc_debug_available_rates_fops = {
-	.open = tegra_emc_debug_available_rates_open,
-	.read = seq_read,
-	.llseek = seq_lseek,
-	.release = single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(tegra_emc_debug_available_rates);
 
 static int tegra_emc_debug_min_rate_get(void *data, u64 *rate)
 {
-- 
2.23.0

