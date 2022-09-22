Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19113C6FA82
	for <linux-tegra@archiver.kernel.org>; Thu, 22 Sep 2022 14:00:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231853AbiIVOAS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 22 Sep 2022 10:00:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230352AbiIVOAL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 22 Sep 2022 10:00:11 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F412C44552;
        Thu, 22 Sep 2022 07:00:09 -0700 (PDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.57])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MYGy53SJRzMp07;
        Thu, 22 Sep 2022 21:55:25 +0800 (CST)
Received: from dggpemm100009.china.huawei.com (7.185.36.113) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 22:00:08 +0800
Received: from huawei.com (10.175.113.32) by dggpemm100009.china.huawei.com
 (7.185.36.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 22 Sep
 2022 22:00:07 +0800
From:   Liu Shixin <liushixin2@huawei.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Liu Shixin <liushixin2@huawei.com>
Subject: [PATCH 1/4] memory: tegra20-emc: use DEFINE_SHOW_ATTRIBUTE to simplify code
Date:   Thu, 22 Sep 2022 22:33:41 +0800
Message-ID: <20220922143344.3252585-2-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922143344.3252585-1-liushixin2@huawei.com>
References: <20220922143344.3252585-1-liushixin2@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.32]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm100009.china.huawei.com (7.185.36.113)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use DEFINE_SHOW_ATTRIBUTE helper macro to simplify the code.
No functional change.

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 drivers/memory/tegra/tegra20-emc.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index 25ba3c5e4ad6..bd4e37b6552d 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -841,20 +841,7 @@ static int tegra_emc_debug_available_rates_show(struct seq_file *s, void *data)
 
 	return 0;
 }
-
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
2.25.1

